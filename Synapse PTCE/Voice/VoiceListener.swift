//
//  VoiceListener.swift
//  Synapse PTCE — Voice Mode
//
//  Speech recognition wrapper. iOS uses SFSpeechRecognizer + AVAudioEngine for
//  continuous on-device recognition. tvOS uses the system's Siri Remote
//  dictation pattern: the view focuses a TextField, the user holds the mic
//  button on the remote, and the dictated text is forwarded into the session
//  via submitText(_:). The two platforms share the same Listener API so
//  VoiceSession doesn't have to branch.
//

import Foundation
import AVFoundation

#if os(iOS)
import Speech
#endif

/// State exposed by every Listener implementation. Equatable for SwiftUI diffing.
enum ListenerState: Equatable {
    case idle
    case requestingAuthorization
    case waitingForRemote     // tvOS: prompt the user to press mic on the Siri Remote
    case listening
    case stopped
    case denied
    case unavailable
    case error(String)
}

@Observable
@MainActor
final class VoiceListener {

    private(set) var state: ListenerState = .idle
    private(set) var transcript: String = ""

    /// True when this listener captures audio itself (iOS). When false, the
    /// view layer is responsible for collecting input (tvOS dictation).
    var capturesAudio: Bool {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }

    private var onPartial: ((String) -> Void)?
    private var onFinal:   ((String) -> Void)?

    #if os(iOS)
    private let recognizer: SFSpeechRecognizer?
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    /// Auto-finalize after this much silence following the most recent partial.
    private var silenceTimer: Timer?
    private var silenceThreshold: TimeInterval = 1.6
    #endif

    init(locale: Locale = .current) {
        #if os(iOS)
        self.recognizer = SFSpeechRecognizer(locale: locale) ?? SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
        #endif
    }

    // MARK: - Permissions

    func requestPermissions(_ completion: @escaping (Bool) -> Void) {
        #if os(iOS)
        state = .requestingAuthorization
        SFSpeechRecognizer.requestAuthorization { speechStatus in
            AVAudioApplication.requestRecordPermission { micGranted in
                Task { @MainActor in
                    let speechOK = (speechStatus == .authorized)
                    if !speechOK || !micGranted {
                        self.state = .denied
                        completion(false)
                    } else {
                        self.state = .idle
                        completion(true)
                    }
                }
            }
        }
        #else
        // tvOS / macOS: no programmatic permissions to request. The view layer
        // surfaces a focused TextField that activates Siri Remote dictation.
        state = .waitingForRemote
        completion(true)
        #endif
    }

    // MARK: - Listening

    func start(onPartial: @escaping (String) -> Void,
               onFinal:   @escaping (String) -> Void) {
        self.onPartial = onPartial
        self.onFinal   = onFinal
        transcript = ""

        #if os(iOS)
        guard let recognizer, recognizer.isAvailable else {
            state = .unavailable
            return
        }

        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .spokenAudio,
                                    options: [.duckOthers, .defaultToSpeaker, .allowBluetooth])
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            state = .error("audio session: \(error.localizedDescription)")
            return
        }

        let req = SFSpeechAudioBufferRecognitionRequest()
        req.shouldReportPartialResults = true
        if recognizer.supportsOnDeviceRecognition {
            req.requiresOnDeviceRecognition = true
        }
        request = req

        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.removeTap(onBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            req.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            state = .error("audio engine: \(error.localizedDescription)")
            return
        }

        state = .listening
        task = recognizer.recognitionTask(with: req) { [weak self] result, error in
            Task { @MainActor in
                guard let self else { return }
                if let result {
                    let text = result.bestTranscription.formattedString
                    self.transcript = text
                    self.onPartial?(text)
                    self.armSilenceTimer()
                    if result.isFinal {
                        self.finalize(with: text)
                    }
                }
                if let error {
                    self.state = .error(error.localizedDescription)
                    self.finalize(with: self.transcript)
                }
            }
        }
        #else
        // tvOS: nothing to do here. The view layer must call submitText(_:).
        state = .waitingForRemote
        #endif
    }

    /// Inject a transcript from outside — used by the tvOS dictation flow.
    func submitText(_ text: String) {
        transcript = text
        onPartial?(text)
        finalize(with: text)
    }

    func stop() {
        #if os(iOS)
        request?.endAudio()
        teardown()
        #endif
        state = .stopped
    }

    private func finalize(with text: String) {
        #if os(iOS)
        teardown()
        #endif
        let cb = onFinal
        onPartial = nil
        onFinal   = nil
        state = .stopped
        cb?(text)
    }

    // MARK: - iOS-only internals

    #if os(iOS)
    private func armSilenceTimer() {
        silenceTimer?.invalidate()
        silenceTimer = Timer.scheduledTimer(withTimeInterval: silenceThreshold, repeats: false) { [weak self] _ in
            Task { @MainActor in
                guard let self, self.state == .listening else { return }
                self.finalize(with: self.transcript)
            }
        }
    }

    private func teardown() {
        silenceTimer?.invalidate()
        silenceTimer = nil
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        task?.cancel()
        task = nil
        request = nil
    }
    #endif
}
