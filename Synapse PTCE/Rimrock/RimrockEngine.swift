//
//  RimrockEngine.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Per-shift observable state. Holds the working beat queue, player name,
//  rapport with Mara, accumulated log entries, and question results.
//

import Foundation
import Observation

@Observable
final class RimrockEngine {

    // MARK: - Shift state

    let shift: RimrockShift

    /// Mutable working copy of beats. Player choices insert response beats
    /// inline so the view's loop is just "play current, advance, repeat."
    private(set) var beats: [RimrockBeat]
    private(set) var currentBeatIndex: Int = 0

    // MARK: - Player state

    var playerName: String = ""
    private(set) var rapport: Int = 0
    private(set) var log: [RimrockLogEntry] = []

    // MARK: - Question scoring

    private(set) var questionsAnswered: Int = 0
    private(set) var questionsCorrect: Int = 0

    // MARK: - CYOA endings

    /// Tally of recoverable endings the player triggered this shift. Drives
    /// the shift-complete summary so "you got Mara to bail you out twice" is
    /// visible to the player.
    private(set) var recoverableHitsThisShift: Int = 0

    init(shift: RimrockShift) {
        self.shift = shift
        self.beats = shift.beats
    }

    // MARK: - Playback

    var currentBeat: RimrockBeat? {
        guard currentBeatIndex < beats.count else { return nil }
        return beats[currentBeatIndex]
    }

    var isFinished: Bool {
        currentBeatIndex >= beats.count
    }

    /// True when the current beat is a terminal ending — playback is locked
    /// until the player restarts the shift.
    var isAtTerminalEnding: Bool {
        if case .ending(let e) = currentBeat, e.kind.isTerminal {
            return true
        }
        return false
    }

    func advance() {
        guard currentBeatIndex < beats.count else { return }
        // Crossing a recoverable ending costs rapport and is tallied.
        if case .ending(let e) = beats[currentBeatIndex], !e.kind.isTerminal {
            rapport -= 1
            recoverableHitsThisShift += 1
        }
        currentBeatIndex += 1
    }

    /// Reset the shift to its first beat. Used after a terminal bad ending so
    /// the player can re-attempt the day with the lesson learned.
    func restartShift() {
        beats = shift.beats
        currentBeatIndex = 0
        rapport = 0
        log.removeAll()
        questionsAnswered = 0
        questionsCorrect = 0
        recoverableHitsThisShift = 0
    }

    // MARK: - Player input

    func setPlayerName(_ name: String) {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        playerName = trimmed.isEmpty ? "Tech" : trimmed
    }

    func selectChoice(_ choice: RimrockChoice) {
        rapport += choice.rapportDelta
        // Insert response beats after the current choice beat, then advance past the choice.
        let insertAt = currentBeatIndex + 1
        beats.insert(contentsOf: choice.response, at: insertAt)
        advance()
    }

    /// Returns whether the answer was correct.
    func submitAnswer(_ answer: String, for question: RimrockQuestion) -> Bool {
        questionsAnswered += 1
        let isCorrect = (answer == question.correctAnswer)
        if isCorrect { questionsCorrect += 1 }
        return isCorrect
    }

    func record(_ entry: RimrockLogEntry) {
        log.append(entry)
    }
}
