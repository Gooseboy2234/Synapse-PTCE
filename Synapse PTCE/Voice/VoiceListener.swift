//
//  VoiceListener.swift
//  Synapse PTCE — Voice Mode
//
//  Speech recognition wrapper using SFSpeechRecognizer + AVAudioEngine.
//  iOS only — tvOS uses a different dictation pattern (focused TextField with
//  Siri Remote dictation), handled by the view layer.
//

import Foundation
import AVFoundation

#if os(iOS)
import Speech

@Observable
@MainActor
final class VoiceListener {

    enum ListenerState: Equatable {
        case idle
        case requestingAuthorization
        case listening
        case stopped
        case denied
        case unavailable
        case error(String)
    }

    private(set) var state: ListenerState = .idle
    private(set) var transcript: String = ""

    private let recognizer: SFSpeechRecognizer?
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?

    init(locale: Locale = .current) {
        self.recognizer = SFSpeechRecognizer(locale: locale) ?? SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    }

    /// Request mic + speech permissions. Calls back on the main actor.
    func requestPermissions(_ completion: @escaping (Bool) -> Void) {
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
    }

    /// Begin streaming microphone audio to the recognizer. The `onPartial`
    /// callback fires on every transcript update; `onFinal` fires once when
    /// the recognizer settles or `stop()` is called.
    func start(onPartial: @escaping (String) -> Void,
               onFinal:   @escaping (String) -> Void) {
        guard let recognizer, recognizer.isAvailable else {
            state = .unavailable
            return
        }

        // Configure audio session for record + duck other audio
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
        transcript = ""

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
                    onPartial(text)
                    if result.isFinal {
                        self.teardown()
                        onFinal(text)
                    }
                }
                if let error {
                    self.state = .error(error.localizedDescription)
                    self.teardown()
                    onFinal(self.transcript)
                }
            }
        }
    }

    func stop() {
        request?.endAudio()
        teardown()
        state = .stopped
    }

    private func teardown() {
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        task?.cancel()
        task = nil
        request = nil
    }
}

#else

// tvOS / macOS stub: no free-form ASR. The view layer falls back to focused
// dictation or remote-tap selection.
@Observable
@MainActor
final class VoiceListener {
    enum ListenerState: Equatable {
        case idle, unavailable
    }
    private(set) var state: ListenerState = .unavailable
    private(set) var transcript: String = ""

    init(locale: Locale = .current) {}

    func requestPermissions(_ completion: @escaping (Bool) -> Void) {
        completion(false)
    }

    func start(onPartial: @escaping (String) -> Void,
               onFinal:   @escaping (String) -> Void) {
        onFinal("")
    }

    func stop() {}
}

#endif
