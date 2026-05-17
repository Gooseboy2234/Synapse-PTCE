//
//  MasteryTracker.swift
//  Synapse PTCE
//
//  Concept-level mastery + spaced repetition over the unified question pool.
//  Both DataNode (existing 780-question bank) and RimrockQuestion (new 179-question
//  narrative pool) write into this. A concept is "truly learned" only after correct
//  answers in 2+ sessions ≥1 day apart, and graduates to "mastered" with sustained
//  performance over a week.
//

import Foundation
import SwiftData
import SwiftUI

// MARK: - Mastery stages

enum MasteryStage: String, Codable, CaseIterable {
    case unseen        // never seen this concept
    case introduced    // seen at least once, never correct
    case practicing    // 1 correct answer
    case learning      // 2+ corrects within < 1 day apart
    case learned       // 2+ corrects ≥1 day apart  ← THE BAR for "truly learned"
    case mastered      // 4+ corrects spanning ≥7 days

    /// Display label.
    var label: String {
        switch self {
        case .unseen:      return "Unseen"
        case .introduced:  return "Introduced"
        case .practicing:  return "Practicing"
        case .learning:    return "Learning"
        case .learned:     return "Learned"
        case .mastered:    return "Mastered"
        }
    }

    /// Concepts at "learned" or "mastered" count toward the global progress bar.
    var countsAsTrulyLearned: Bool {
        self == .learned || self == .mastered
    }

    /// Color for UI tinting.
    var color: Color {
        switch self {
        case .unseen:      return Color(white: 0.25)
        case .introduced:  return Color(red: 0.85, green: 0.55, blue: 0.40)   // amber-rust
        case .practicing:  return Color(red: 0.92, green: 0.74, blue: 0.40)   // amber
        case .learning:    return Color(red: 0.78, green: 0.82, blue: 0.45)   // green-gold
        case .learned:     return Color(red: 0.55, green: 0.82, blue: 0.55)   // sage
        case .mastered:    return Color(red: 0.45, green: 0.85, blue: 0.85)   // teal
        }
    }
}

// MARK: - Concept source

enum ConceptSource: String, Codable {
    case dataNode    // existing question bank (MultiAngle_*, Domain_*, ChallengeNodes)
    case rimrock     // narrative-driven Rimrock questions

    var label: String {
        switch self {
        case .dataNode: return "Question Bank"
        case .rimrock:  return "Rimrock"
        }
    }
}

// MARK: - SwiftData record

@Model
final class ConceptRecord {

    /// Unique key. For DataNodes: "DN:<baseConceptTitle or nodeTitle>".
    /// For Rimrock: "RM:<topic>".
    @Attribute(.unique) var conceptKey: String

    var displayName: String        // e.g., "LISINOPRIL", "Brand/Generic", "Schedule II Refill Rules"
    var domainRaw: String          // KnowledgeDomain.rawValue
    var sourceRaw: String          // ConceptSource.rawValue
    var stageRaw: String           // MasteryStage.rawValue

    var totalCorrect: Int
    var totalAttempts: Int

    var firstCorrectAt: Date?
    var lastCorrectAt: Date?
    var lastSeenAt: Date?

    /// Spaced repetition: when this concept becomes "due" again for review.
    var dueAt: Date?

    /// Current spacing interval in days (used to compute next dueAt on correct answer).
    var intervalDays: Double

    /// Number of distinct days the user has answered this correctly.
    /// We bin by day-of-year so multiple corrects on the same day count once.
    var distinctCorrectDays: Int

    /// Last day-of-correct-answer (rounded to date), to dedupe same-day corrects.
    var lastCorrectDayKey: String?

    init(
        conceptKey: String,
        displayName: String,
        domain: KnowledgeDomain,
        source: ConceptSource
    ) {
        self.conceptKey = conceptKey
        self.displayName = displayName
        self.domainRaw = domain.rawValue
        self.sourceRaw = source.rawValue
        self.stageRaw = MasteryStage.unseen.rawValue
        self.totalCorrect = 0
        self.totalAttempts = 0
        self.firstCorrectAt = nil
        self.lastCorrectAt = nil
        self.lastSeenAt = nil
        self.dueAt = nil
        self.intervalDays = 1.0
        self.distinctCorrectDays = 0
        self.lastCorrectDayKey = nil
    }

    var stage: MasteryStage {
        get { MasteryStage(rawValue: stageRaw) ?? .unseen }
        set { stageRaw = newValue.rawValue }
    }

    var domain: KnowledgeDomain {
        KnowledgeDomain(rawValue: domainRaw) ?? .medications
    }

    var source: ConceptSource {
        ConceptSource(rawValue: sourceRaw) ?? .dataNode
    }

    /// True if this concept is currently due for review.
    var isDueForReview: Bool {
        guard let due = dueAt else { return false }
        return Date() >= due
    }
}

// MARK: - Tracker

@Observable
final class MasteryTracker {

    private let modelContext: ModelContext

    /// Cached records by concept key for O(1) lookup. Synced with SwiftData on writes.
    private var cache: [String: ConceptRecord] = [:]

    /// Total concept counts known to the tracker (for percentages).
    /// These are populated at startup from the DataNode pool + Rimrock pool.
    private(set) var registeredConcepts: [String: ConceptDescriptor] = [:]

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadCache()
    }

    // MARK: Cache

    private func loadCache() {
        let descriptor = FetchDescriptor<ConceptRecord>()
        let records = (try? modelContext.fetch(descriptor)) ?? []
        for record in records {
            cache[record.conceptKey] = record
        }
    }

    // MARK: Concept registration

    /// Register the concepts that exist in the question pool. Called once at startup
    /// after question bank is loaded. Establishes the denominator for global progress.
    func registerConcepts(_ descriptors: [ConceptDescriptor]) {
        for desc in descriptors {
            registeredConcepts[desc.key] = desc
        }
    }

    // MARK: Recording answers

    /// Record an answer for a concept. Both DataNode and Rimrock paths call this.
    /// The mastery stage is recomputed and the next-due date is updated.
    @discardableResult
    func record(
        conceptKey: String,
        displayName: String,
        domain: KnowledgeDomain,
        source: ConceptSource,
        wasCorrect: Bool,
        now: Date = Date()
    ) -> ConceptRecord {

        let record: ConceptRecord
        if let cached = cache[conceptKey] {
            record = cached
        } else {
            let new = ConceptRecord(
                conceptKey: conceptKey,
                displayName: displayName,
                domain: domain,
                source: source
            )
            modelContext.insert(new)
            cache[conceptKey] = new
            record = new
        }

        record.totalAttempts += 1
        record.lastSeenAt = now

        if wasCorrect {
            record.totalCorrect += 1

            // Day-bucket dedupe: a correct on the same calendar day doesn't count
            // as a separate "session" for spaced repetition purposes.
            let dayKey = Self.dayKey(for: now)
            if record.lastCorrectDayKey != dayKey {
                record.distinctCorrectDays += 1
                record.lastCorrectDayKey = dayKey
            }

            if record.firstCorrectAt == nil {
                record.firstCorrectAt = now
            }
            record.lastCorrectAt = now

            // Advance interval (SM-2 lite — no per-question ease factor)
            record.intervalDays = nextInterval(after: record.intervalDays, correct: true)
            record.dueAt = now.addingTimeInterval(record.intervalDays * 86_400)
        } else {
            // Wrong answer drops back to short interval. Doesn't reset progress entirely,
            // but the concept reappears in the "due" queue tomorrow.
            record.intervalDays = 1.0
            record.dueAt = now.addingTimeInterval(86_400)
        }

        // Recompute stage from the record's history
        record.stage = computeStage(for: record, now: now)

        try? modelContext.save()
        return record
    }

    // MARK: Stage computation

    private func computeStage(for record: ConceptRecord, now: Date) -> MasteryStage {
        if record.totalAttempts == 0 { return .unseen }
        if record.totalCorrect == 0 { return .introduced }
        if record.totalCorrect == 1 { return .practicing }

        guard let firstCorrect = record.firstCorrectAt,
              let lastCorrect = record.lastCorrectAt else {
            return .practicing
        }

        let span = lastCorrect.timeIntervalSince(firstCorrect)
        let oneDay: TimeInterval = 86_400
        let oneWeek: TimeInterval = 86_400 * 7

        // Mastered: 4+ correct, spanning ≥7 days
        if record.totalCorrect >= 4 && span >= oneWeek {
            return .mastered
        }

        // Learned: 2+ correct on distinct days ≥1 day apart
        if record.distinctCorrectDays >= 2 && span >= oneDay {
            return .learned
        }

        // Learning: 2+ correct but within < 1 day
        if record.totalCorrect >= 2 {
            return .learning
        }

        return .practicing
    }

    private func nextInterval(after current: Double, correct: Bool) -> Double {
        guard correct else { return 1.0 }

        // Roughly Anki/SM-2 lite progression
        switch current {
        case ..<1.5:   return 1.0   // first correct → due tomorrow
        case ..<3.5:   return 4.0   // second correct → 4 days
        case ..<8.0:   return 10.0  // third → 10 days
        case ..<20.0:  return 30.0  // fourth → 30 days
        default:       return min(current * 1.7, 180.0)  // cap at ~6 months
        }
    }

    // MARK: Day key

    private static let dayKeyFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        f.locale = Locale(identifier: "en_US_POSIX")
        return f
    }()

    static func dayKey(for date: Date) -> String {
        dayKeyFormatter.string(from: date)
    }

    // MARK: Queries

    /// Snapshot of mastery progress across every concept the tracker knows about.
    func globalMastery() -> GlobalMasterySnapshot {
        let allRecords = Array(cache.values)
        let allKeys = Set(registeredConcepts.keys)

        var perDomain: [KnowledgeDomain: DomainMasterySnapshot] = [:]

        for domain in KnowledgeDomain.allCases {
            let registeredInDomain = registeredConcepts.values.filter { $0.domain == domain }
            let totalConcepts = registeredInDomain.count

            let recordsInDomain = allRecords.filter { $0.domain == domain }
            let counts = recordsInDomain.reduce(into: [MasteryStage: Int]()) { acc, r in
                acc[r.stage, default: 0] += 1
            }

            let trulyLearned = recordsInDomain.filter { $0.stage.countsAsTrulyLearned }.count

            perDomain[domain] = DomainMasterySnapshot(
                domain: domain,
                totalConcepts: totalConcepts,
                trulyLearned: trulyLearned,
                introduced: counts[.introduced] ?? 0,
                practicing: counts[.practicing] ?? 0,
                learning: counts[.learning] ?? 0,
                learned: counts[.learned] ?? 0,
                mastered: counts[.mastered] ?? 0
            )
        }

        let totalConcepts = registeredConcepts.values.count
        let totalTrulyLearned = perDomain.values.reduce(0) { $0 + $1.trulyLearned }
        let dueCount = allRecords.filter { $0.isDueForReview }.count

        // Weighted progress = sum(domain truly_learned * domain weight) / sum(domain total * domain weight)
        var weightedNumerator = 0.0
        var weightedDenominator = 0.0
        for (domain, snap) in perDomain {
            let weight = domain.examWeight
            weightedNumerator += Double(snap.trulyLearned) * weight
            weightedDenominator += Double(snap.totalConcepts) * weight
        }
        let weightedPercent = weightedDenominator > 0 ? weightedNumerator / weightedDenominator : 0

        // Unseen = registered concepts with no record yet
        let seenKeys = Set(allRecords.map { $0.conceptKey })
        let unseenCount = allKeys.subtracting(seenKeys).count

        return GlobalMasterySnapshot(
            totalConcepts: totalConcepts,
            trulyLearned: totalTrulyLearned,
            unseen: unseenCount,
            dueForReview: dueCount,
            weightedPercent: weightedPercent,
            perDomain: perDomain
        )
    }

    /// Concepts currently due for review, ordered by most-overdue first.
    func dueConcepts() -> [ConceptRecord] {
        let now = Date()
        return cache.values
            .filter { record in
                guard let due = record.dueAt else { return false }
                return due <= now && record.stage != .mastered
            }
            .sorted { ($0.dueAt ?? Date.distantFuture) < ($1.dueAt ?? Date.distantFuture) }
    }

    /// Lookup a single record (without creating one).
    func record(for conceptKey: String) -> ConceptRecord? {
        cache[conceptKey]
    }
}

// MARK: - Helpers

/// What the tracker needs to know about every concept up front: key, name, domain, source.
struct ConceptDescriptor: Hashable {
    let key: String
    let displayName: String
    let domain: KnowledgeDomain
    let source: ConceptSource
}

struct GlobalMasterySnapshot {
    let totalConcepts: Int
    let trulyLearned: Int
    let unseen: Int
    let dueForReview: Int
    /// 0...1 — domain-weighted PTCE blueprint progress.
    let weightedPercent: Double
    let perDomain: [KnowledgeDomain: DomainMasterySnapshot]
}

struct DomainMasterySnapshot {
    let domain: KnowledgeDomain
    let totalConcepts: Int
    let trulyLearned: Int
    let introduced: Int
    let practicing: Int
    let learning: Int
    let learned: Int
    let mastered: Int

    var trulyLearnedPercent: Double {
        totalConcepts > 0 ? Double(trulyLearned) / Double(totalConcepts) : 0
    }

    var anyProgressCount: Int {
        introduced + practicing + learning + learned + mastered
    }
}

// MARK: - Concept descriptor factory

extension ConceptDescriptor {

    /// For a DataNode question, the concept key uses baseConceptTitle when available
    /// (groups all 5 angles of e.g. LISINOPRIL into one concept). Falls back to
    /// nodeTitle for nodes without a base concept.
    static func from(dataNode: DataNode) -> ConceptDescriptor {
        let baseName = dataNode.baseConceptTitle ?? Self.cleanTitle(dataNode.nodeTitle)
        return ConceptDescriptor(
            key: "DN:\(baseName)",
            displayName: baseName,
            domain: dataNode.domain,
            source: .dataNode
        )
    }

    /// For a Rimrock question, the concept key uses the topic field (so the same
    /// topic across multiple shifts maps to one concept and supports natural spaced
    /// repetition across days).
    static func from(rimrockQuestion q: RimrockQuestion) -> ConceptDescriptor {
        ConceptDescriptor(
            key: "RM:\(q.topic)",
            displayName: Self.humanize(q.topic),
            domain: q.domain.knowledgeDomain,
            source: .rimrock
        )
    }

    private static func cleanTitle(_ title: String) -> String {
        title
            .replacingOccurrences(of: "\n", with: " ")
            .components(separatedBy: " / ")
            .first ?? title
    }

    private static func humanize(_ topic: String) -> String {
        topic
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
    }
}
