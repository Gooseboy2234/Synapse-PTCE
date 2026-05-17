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
    /// Sentence-level chunking gives the narration natural breath pauses.
    /// Disable to send the whole string as a single utterance.
    var chunkBySentence: Bool = true

    private let synth = AVSpeechSynthesizer()
    private var onFinished: (() -> Void)?
    private var pendingChunks: [String] = []

    override init() {
        super.init()
        synth.delegate = self
    }

    func speak(_ text: String, onFinished: (() -> Void)? = nil) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            onFinished?()
            return
        }
        self.onFinished = onFinished
        pendingChunks = chunkBySentence ? Self.splitIntoSentences(trimmed) : [trimmed]
        state = .speaking
        speakNextChunk()
    }

    private func speakNextChunk() {
        guard !pendingChunks.isEmpty else {
            let cb = onFinished
            onFinished = nil
            state = .idle
            cb?()
            return
        }
        let chunk = pendingChunks.removeFirst()
        let prefs = VoicePreferences.shared
        let utterance = AVSpeechUtterance(string: chunk)
        utterance.rate = prefs.rate
        utterance.pitchMultiplier = prefs.pitch
        utterance.volume = volume
        utterance.voice = prefs.resolvedVoice()
        utterance.preUtteranceDelay = 0.05
        // More breath between sentences than at the end of a longer beat.
        utterance.postUtteranceDelay = pendingChunks.isEmpty ? 0.18 : 0.28
        synth.speak(utterance)
    }

    /// Split a paragraph into sentence-sized chunks using NSString's
    /// linguistic-aware sentence enumeration. Falls back to a single chunk if
    /// enumeration yields nothing.
    static func splitIntoSentences(_ text: String) -> [String] {
        var sentences: [String] = []
        let range = text.startIndex..<text.endIndex
        text.enumerateSubstrings(in: range, options: .bySentences) { sub, _, _, _ in
            if let s = sub?.trimmingCharacters(in: .whitespacesAndNewlines), !s.isEmpty {
                sentences.append(s)
            }
        }
        return sentences.isEmpty ? [text] : sentences
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
        pendingChunks.removeAll()
        onFinished = nil
        state = .idle
    }
}

extension VoiceNarrator: AVSpeechSynthesizerDelegate {

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                                       didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in
            // Drive the queue forward; speakNextChunk handles the final callback.
            self.speakNextChunk()
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                                       didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.state = .idle
            self.pendingChunks.removeAll()
            self.onFinished = nil
        }
    }
}
