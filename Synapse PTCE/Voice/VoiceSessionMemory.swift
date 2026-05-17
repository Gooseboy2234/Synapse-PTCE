//
//  VoiceSessionMemory.swift
//  Synapse PTCE — Voice Mode
//
//  Persists "you were in the middle of Day X" so the home screen can offer
//  a one-tap resume. Only curated shifts (with a stable dayNumber) are
//  persisted; procedurally generated practice shifts don't get a resume.
//

import Foundation

struct SavedVoiceSession: Codable, Equatable {
    let dayNumber: Int
    let savedAt: Date
    let elapsedSeconds: Int
    /// How far through the original (un-mutated) beats list we got. Used as a
    /// hint for the resume label; the resume itself replays from the start of
    /// the shift since branch-inserted beats can't be reconstructed cheaply.
    let beatCursor: Int
}

@Observable
@MainActor
final class VoiceSessionMemory {

    static let shared = VoiceSessionMemory()

    private static let key = "voice_session_last_saved"

    private(set) var last: SavedVoiceSession?

    private init() {
        load()
    }

    func record(dayNumber: Int, elapsedSeconds: Int, beatCursor: Int) {
        let s = SavedVoiceSession(
            dayNumber: dayNumber,
            savedAt: Date(),
            elapsedSeconds: elapsedSeconds,
            beatCursor: beatCursor
        )
        last = s
        save(s)
    }

    func clear() {
        last = nil
        UserDefaults.standard.removeObject(forKey: Self.key)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: Self.key) else { return }
        last = try? JSONDecoder().decode(SavedVoiceSession.self, from: data)
    }

    private func save(_ s: SavedVoiceSession) {
        guard let data = try? JSONEncoder().encode(s) else { return }
        UserDefaults.standard.set(data, forKey: Self.key)
    }

    // MARK: - Display helpers

    /// Human-readable "5 minutes ago" / "yesterday" label.
    var lastSavedRelative: String? {
        guard let last else { return nil }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: last.savedAt, relativeTo: Date())
    }
}
