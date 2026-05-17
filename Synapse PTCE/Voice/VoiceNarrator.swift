//
//  VoiceNarrator.swift
//  Synapse PTCE — Voice Mode
//
//  Text-to-speech wrapper around AVSpeechSynthesizer. Speaks queued utterances
//  one at a time and fires `onFinished` when each completes, so the
//  VoiceSession can advance to the next beat.
//

import Foundation
import AVFoundation

@Observable
@MainActor
final class VoiceNarrator: NSObject {

    enum NarratorState: Equatable {
        case idle
        case speaking
        case paused
    }

    private(set) var state: NarratorState = .idle

    var volume: Float = 1.0

    private let synth = AVSpeechSynthesizer()
    private var onFinished: (() -> Void)?

    override init() {
        super.init()
        synth.delegate = self
    }

    func speak(_ text: String, onFinished: (() -> Void)? = nil) {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            onFinished?()
            return
        }
        self.onFinished = onFinished
        let prefs = VoicePreferences.shared
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = prefs.rate
        utterance.pitchMultiplier = prefs.pitch
        utterance.volume = volume
        utterance.voice = prefs.resolvedVoice()
        utterance.preUtteranceDelay = 0.05
        utterance.postUtteranceDelay = 0.15
        state = .speaking
        synth.speak(utterance)
    }

    func pause() {
        guard state == .speaking else { return }
        synth.pauseSpeaking(at: .word)
        state = .paused
    }

    func resume() {
        guard state == .paused else { return }
        synth.continueSpeaking()
        state = .speaking
    }

    func stop() {
        synth.stopSpeaking(at: .immediate)
        onFinished = nil
        state = .idle
    }
}

extension VoiceNarrator: AVSpeechSynthesizerDelegate {

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                                       didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.state = .idle
            let cb = self.onFinished
            self.onFinished = nil
            cb?()
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                                       didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.state = .idle
            self.onFinished = nil
        }
    }
}
