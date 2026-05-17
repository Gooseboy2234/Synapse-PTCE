//
//  ExamAttempt.swift
//  Synapse PTCE
//
//  SwiftData record of a single completed Blueprint Exam attempt — the timed
//  90-question PTCE-format simulator. Persists raw and per-domain scores so
//  the player can chart progress and the readiness score can use exam history.
//

import Foundation
import SwiftData

@Model
final class ExamAttempt {

    @Attribute(.unique) var id: UUID
    var attemptDate: Date

    /// Total questions in the attempt — typically 90 for a blueprint exam.
    var totalQuestions: Int
    /// Raw correct count.
    var rawCorrect: Int
    /// Seconds elapsed during the active exam (excludes briefing/review).
    var timeUsedSeconds: Int

    /// Approximate scaled score on the PTCB 1400–1900 scale.
    /// Linear mapping from raw % within the historical pass cutoff (~62.2%);
    /// 0% → 1400 floor truncated, 100% → 1900 cap. Indicative, not official.
    var scaledScore: Int

    /// Whether the attempt met the PTCB scaled-score threshold (≥1400).
    var didPass: Bool

    /// JSON-encoded `[domainRaw: DomainResult]` so the per-domain breakdown
    /// survives migration without needing an additional @Model.
    var domainResultsJSON: String

    init(
        id: UUID = UUID(),
        attemptDate: Date = .now,
        totalQuestions: Int,
        rawCorrect: Int,
        timeUsedSeconds: Int,
        scaledScore: Int,
        didPass: Bool,
        domainResultsJSON: String
    ) {
        self.id = id
        self.attemptDate = attemptDate
        self.totalQuestions = totalQuestions
        self.rawCorrect = rawCorrect
        self.timeUsedSeconds = timeUsedSeconds
        self.scaledScore = scaledScore
        self.didPass = didPass
        self.domainResultsJSON = domainResultsJSON
    }

    var rawPercent: Double {
        totalQuestions > 0 ? Double(rawCorrect) / Double(totalQuestions) : 0
    }

    var domainResults: [String: DomainResult] {
        guard let data = domainResultsJSON.data(using: .utf8),
              let decoded = try? JSONDecoder().decode([String: DomainResult].self, from: data) else {
            return [:]
        }
        return decoded
    }
}

/// Per-domain result snapshot — encoded inside `ExamAttempt.domainResultsJSON`.
struct DomainResult: Codable, Equatable {
    var correct: Int
    var total: Int

    var percent: Double {
        total > 0 ? Double(correct) / Double(total) : 0
    }
}

// MARK: - Scaled-score conversion

enum BlueprintExamScoring {

    /// PTCB official passing scaled score is 1400 on a 1400–1900 scale.
    static let passingScaledScore: Int = 1400
    static let scaledScoreFloor: Int = 1400
    static let scaledScoreCeiling: Int = 1900

    /// Approximate raw-percent threshold corresponding to the 1400 scaled cut.
    /// PTCB doesn't publish the conversion table — this matches commonly cited
    /// study-guide estimates (~62–66% raw correct). We use 62.2%.
    static let passingRawPercent: Double = 0.622

    /// Maps a raw percent correct (0.0–1.0) to an approximate scaled score
    /// in [1400, 1900]. Sub-passing scores are also surfaced (mapped down to
    /// 1400 floor for "did not pass" — matching how PTCB reports failures
    /// without revealing the underlying scale).
    static func scaledScore(for rawPercent: Double) -> Int {
        let clamped = max(0.0, min(1.0, rawPercent))
        if clamped < passingRawPercent {
            // Below the cut: linearly interpolate from "0% → 1000" to "passing% → 1400"
            // and clamp to floor for display purposes.
            let belowFraction = clamped / passingRawPercent
            let approx = Int(Double(scaledScoreFloor - 400) + Double(400) * belowFraction)
            return max(1000, min(scaledScoreFloor - 1, approx))
        }
        // At or above the cut: linearly interpolate to 1900 ceiling.
        let aboveFraction = (clamped - passingRawPercent) / (1.0 - passingRawPercent)
        let span = Double(scaledScoreCeiling - scaledScoreFloor)
        return scaledScoreFloor + Int((span * aboveFraction).rounded())
    }
}
