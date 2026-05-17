//
//  VoicePreferences.swift
//  Synapse PTCE — Voice Mode
//
//  Persistent, app-wide voice-mode settings: which TTS voice to use, how fast
//  to speak, how high to pitch, and how long to wait in silence before
//  auto-finalizing a spoken answer. Backed by UserDefaults so changes survive
//  relaunch and are picked up by VoiceNarrator on the next utterance.
//

import Foundation
import AVFoundation
import Observation

@Observable
@MainActor
final class VoicePreferences {

    static let shared = VoicePreferences()

    // Keys ------------------------------------------------------------------
    private enum Key {
        static let voiceID  = "voice_pref_voice_id"
        static let rate     = "voice_pref_rate"
        static let pitch    = "voice_pref_pitch"
        static let silence  = "voice_pref_silence"
        static let confirm  = "voice_pref_confirm_low_confidence"
    }

    // Defaults --------------------------------------------------------------
    static let defaultRate: Float    = AVSpeechUtteranceDefaultSpeechRate
    static let defaultPitch: Float   = 1.0
    static let defaultSilence: Double = 1.6
    static let defaultConfirm: Bool  = true

    /// Identifier of a `AVSpeechSynthesisVoice`. nil = system default.
    var voiceID: String? {
        didSet {
            UserDefaults.standard.set(voiceID, forKey: Key.voiceID)
        }
    }

    /// 0.0 = very slow, 1.0 = max. AVSpeechUtteranceDefaultSpeechRate ≈ 0.5.
    var rate: Float {
        didSet {
            UserDefaults.standard.set(rate, forKey: Key.rate)
        }
    }

    /// 0.5 to 2.0.
    var pitch: Float {
        didSet {
            UserDefaults.standard.set(pitch, forKey: Key.pitch)
        }
    }

    /// Seconds of silence after the most recent partial before the listener
    /// auto-finalizes. Lower = snappier; higher = more forgiving of pauses.
    var silenceThreshold: Double {
        didSet {
            UserDefaults.standard.set(silenceThreshold, forKey: Key.silence)
        }
    }

    /// Ask the user to confirm a low-confidence ASR match before submitting.
    var confirmLowConfidenceMatches: Bool {
        didSet {
            UserDefaults.standard.set(confirmLowConfidenceMatches, forKey: Key.confirm)
        }
    }

    private init() {
        let d = UserDefaults.standard
        self.voiceID = d.string(forKey: Key.voiceID)
        self.rate = (d.object(forKey: Key.rate) as? Float) ?? Self.defaultRate
        self.pitch = (d.object(forKey: Key.pitch) as? Float) ?? Self.defaultPitch
        self.silenceThreshold = (d.object(forKey: Key.silence) as? Double) ?? Self.defaultSilence
        self.confirmLowConfidenceMatches = (d.object(forKey: Key.confirm) as? Bool) ?? Self.defaultConfirm
    }

    // MARK: - Utilities

    /// Available installed voices, sorted by quality desc, then language asc,
    /// then name asc. The first item is the best default for a "premium" feel.
    static var availableVoices: [AVSpeechSynthesisVoice] {
        AVSpeechSynthesisVoice.speechVoices().sorted { a, b in
            if a.quality.rawValue != b.quality.rawValue {
                return a.quality.rawValue > b.quality.rawValue
            }
            if a.language != b.language { return a.language < b.language }
            return a.name < b.name
        }
    }

    /// English-only voices, for the default picker presented to PTCE users.
    static var englishVoices: [AVSpeechSynthesisVoice] {
        availableVoices.filter { $0.language.hasPrefix("en") }
    }

    func resolvedVoice() -> AVSpeechSynthesisVoice? {
        if let id = voiceID, let v = AVSpeechSynthesisVoice(identifier: id) {
            return v
        }
        // Prefer an English Enhanced voice if available, otherwise system default.
        if let premium = Self.englishVoices.first(where: { $0.quality == .premium }) {
            return premium
        }
        if let enhanced = Self.englishVoices.first(where: { $0.quality == .enhanced }) {
            return enhanced
        }
        return AVSpeechSynthesisVoice(language: Locale.current.identifier)
            ?? AVSpeechSynthesisVoice(language: "en-US")
    }
}

// MARK: - Speech rate human-readable labels

extension Float {
    /// Tuck the human-readable label for a TTS rate next to the float itself.
    var speechRateLabel: String {
        switch self {
        case ..<0.35:                       return "Slow"
        case 0.35..<0.45:                   return "Relaxed"
        case 0.45..<0.55:                   return "Default"
        case 0.55..<0.65:                   return "Quick"
        default:                            return "Fast"
        }
    }
}
