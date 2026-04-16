//
//  GameEngine.swift
//  Synapse PTCE
//
//  Core data architecture and game state management.
//  Phase 8 — Adds SwiftData persistence, XP/rank system, and Data Shards.
//
//  Architecture:
//  • GameEngine owns its ModelContainer — no injection from App or View layer required.
//  • DataNode structs remain pure content (no SwiftData annotations).
//  • NodeProgress (SwiftData) holds per-node state; keyed by stable composite string.
//  • UserStats (SwiftData) holds all RPG progression counters.
//  • GameEngine exposes @Observable vars that views bind to; these are synced from
//    SwiftData after every gradeAnswer() call.
//

import Foundation
import SwiftUI
import Observation
import SwiftData

// MARK: - Knowledge Domain

/// The four scored domains of the 2026 PTCB Exam Blueprint.
enum KnowledgeDomain: String, CaseIterable, Identifiable {
    case medications         = "MEDICATIONS"
    case federalRequirements = "FEDERAL_REQ"
    case patientSafety       = "PATIENT_SAFETY"
    case orderEntry          = "ORDER_ENTRY"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .medications:         return "Domain 1: Medications"
        case .federalRequirements: return "Domain 2: Federal Requirements"
        case .patientSafety:       return "Domain 3: Patient Safety & QA"
        case .orderEntry:          return "Domain 4: Order Entry & Processing"
        }
    }

    /// Official 2026 PTCB exam weight for this domain.
    var examWeight: Double {
        switch self {
        case .medications:         return 0.3500
        case .federalRequirements: return 0.1875
        case .patientSafety:       return 0.2375
        case .orderEntry:          return 0.2250
        }
    }

    /// Share of the 1000-point stability score allocated to this domain.
    var maxStabilityPoints: Int { Int(examWeight * 1000) }

    /// In-universe sector label for the terminal UI.
    var terminalSectorLabel: String {
        switch self {
        case .medications:         return "SECTOR-01 // PHARMACOLOGY"
        case .federalRequirements: return "SECTOR-02 // FEDERAL_LAW"
        case .patientSafety:       return "SECTOR-03 // SAFETY_OPS"
        case .orderEntry:          return "SECTOR-04 // ORDER_PROC"
        }
    }

    /// Short percentage string for hub UI display.
    var examWeightLabel: String {
        switch self {
        case .medications:         return "35%"
        case .federalRequirements: return "18.75%"
        case .patientSafety:       return "23.75%"
        case .orderEntry:          return "22.5%"
        }
    }

    /// Accent color for each domain's nodes on the map.
    var accentColor: Color {
        switch self {
        case .medications:         return Color(red: 1.0, green: 0.65, blue: 0.0)
        case .federalRequirements: return Color(red: 0.3, green: 0.85, blue: 0.55)
        case .patientSafety:       return Color(red: 0.4, green: 0.72, blue: 1.0)
        case .orderEntry:          return Color(red: 0.78, green: 0.42, blue: 1.0)
        }
    }

    /// Dimmed version of accentColor for locked / inactive states.
    var dimColor: Color { accentColor.opacity(0.30) }

    /// SF Symbol icon for this domain — used in tvOS and future iOS contexts.
    var icon: String {
        switch self {
        case .medications:         return "pills.fill"
        case .federalRequirements: return "building.columns.fill"
        case .patientSafety:       return "heart.text.square.fill"
        case .orderEntry:          return "doc.text.magnifyingglass"
        }
    }

    /// Short readable label (≤ 14 chars) for compact display.
    var shortName: String {
        switch self {
        case .medications:         return "MEDICATIONS"
        case .federalRequirements: return "FEDERAL REQ"
        case .patientSafety:       return "PATIENT SAFETY"
        case .orderEntry:          return "ORDER ENTRY"
        }
    }

    /// 2-char domain code for micro-labels.
    var shortCode: String {
        switch self {
        case .medications:         return "D1"
        case .federalRequirements: return "D2"
        case .patientSafety:       return "D3"
        case .orderEntry:          return "D4"
        }
    }
}

// MARK: - Challenge Type

/// Determines how the EncounterView renders and grades the question.
enum ChallengeType: String {
    case multipleChoice  = "MULTIPLE_CHOICE"
    case proceduralMath  = "PROCEDURAL_MATH"
}

// MARK: - Data Node

/// The atomic game object. Each node represents one testable concept.
/// Content is static (defined in domain files). Dynamic state (unlocked/completed)
/// is mirrored from SwiftData NodeProgress records by GameEngine.
struct DataNode: Identifiable, Sendable {
    let id: UUID
    let domain: KnowledgeDomain
    let nodeTitle: String
    let loreText: String
    /// PTCB-style question stem shown before the answer choices.
    /// Leave empty ("") to auto-generate from angle/options at display time.
    var questionText: String = ""
    var challengeType: ChallengeType = .multipleChoice
    var options: [String] = []
    var correctAnswer: String = ""
    var isUnlocked: Bool = false
    var isCompleted: Bool = false
    let xOffset: CGFloat
    let yOffset: CGFloat
    /// Optional prerequisite: this node is greyed-out until the referenced node is completed.
    var requiredNodeID: UUID? = nil
    /// Pedagogical angle — Classification, Indication, Safety, etc.
    var angle: NodeAngle = .classification
    /// Groups angle-variants of the same concept (e.g. "LISINOPRIL").
    var baseConceptTitle: String? = nil
}

// MARK: - Domain Progress

/// Snapshot of progress within a single domain — used for the HUD.
struct DomainProgress {
    let domain: KnowledgeDomain
    let completed: Int
    let total: Int
    let pointsEarned: Int
    let pointsAvailable: Int

    var percentComplete: Double {
        total > 0 ? Double(completed) / Double(total) : 0.0
    }
}

// MARK: - Grade Result

/// Returned by GameEngine.gradeAnswer() so the UI can react.
struct GradeResult {
    let wasCorrect: Bool
    let pointsAwarded: Int       // Stability score points (domain-weighted)
    let newStabilityScore: Int
    // RPG additions
    let xpAwarded: Int           // 150 (perfect) / 100 (1 mistake) / 50 (2+ mistakes)
    let shardAwarded: Bool       // True when completing a node with zero wrong attempts
    let rankUp: Bool             // True if this answer caused a rank increase
    let newSystemRank: SystemRank
    let nodeUnlocked: DataNode?
}

// MARK: - Game Engine

@Observable
class GameEngine {

    // MARK: - Content

    /// Full node registry. Mutations to isUnlocked/isCompleted are mirrored to SwiftData.
    var nodes: [DataNode]

    /// The node currently displayed in the EncounterView sheet.
    var selectedNode: DataNode? = nil

    // MARK: - Observed Stats (bound by views)

    var currentStabilityScore: Int = 0
    var currentXP: Int = 0
    var currentDataShards: Int = 0
    var currentSystemRank: SystemRank = .externalObserver
    var currentNodesCompleted: Int = 0
    var currentPerfectNodes: Int = 0
    var currentTotalAttempts: Int = 0

    // RPG companion + theme
    var currentProbeXP: Int = 0
    var currentTheme: Theme = .amber

    // Game mode, appearance & text size
    var currentGameMode: GameMode = .prodigy
    var currentAppearance: AppAppearance = .dark
    var currentTextSize: TextSizeOption = .normal
    var currentTestDate: Date? = nil
    var currentPlanStartDate: Date? = nil

    // Story narrative
    var pendingStoryBeat: StoryBeat? = nil

    var currentLogicProbe: LogicProbe { LogicProbe.from(xp: currentProbeXP) }

    /// Semantic colour tokens for the active appearance + theme.
    var appTheme: AppTheme {
        switch currentAppearance {
        case .dark:      return .dark
        case .warmLight: return .warmLight
        case .ultraDark: return .ultraDark
        case .midnight:  return .midnight
        }
    }

    // MARK: - Private Persistence

    private let modelContext: ModelContext
    private var _userStats: UserStats
    /// Maps stable persistence key → NodeProgress for O(1) lookup.
    private var progressMap: [String: NodeProgress] = [:]

    // MARK: - Init

    init(nodes: [DataNode] = DataNode.phaseOneDatabase) {
        // ── 1. Build SwiftData stack ────────────────────────────────────────
        let schema = Schema([NodeProgress.self, UserStats.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        // Fatal failure here means SwiftData is unavailable — app cannot function.
        let container = try! ModelContainer(for: schema, configurations: [config])
        let ctx = ModelContext(container)

        // ── 2. Fetch or create the singleton UserStats record ───────────────
        let statsDescriptor = FetchDescriptor<UserStats>()
        let fetchedStats = (try? ctx.fetch(statsDescriptor)) ?? []
        let stats: UserStats
        if let existing = fetchedStats.first {
            stats = existing
        } else {
            stats = UserStats()
            ctx.insert(stats)
            try? ctx.save()
        }

        // ── 3. Initialise all @Observable stored properties ─────────────────
        self.nodes                 = nodes
        self.modelContext          = ctx
        self._userStats            = stats
        self.currentStabilityScore = stats.stabilityScore
        self.currentXP             = stats.totalXP
        self.currentDataShards     = stats.dataShards
        self.currentSystemRank     = stats.systemRank
        self.currentProbeXP        = stats.probeXP
        self.currentTheme          = stats.activeTheme
        self.currentGameMode       = stats.gameMode
        self.currentAppearance     = stats.appAppearance
        self.currentTextSize       = stats.textSizeOption
        self.currentTestDate       = stats.testDate
        self.currentPlanStartDate  = stats.planStartDate
        // selectedNode = nil, progressMap = [:] (defaults)

        // ── 4. Load saved node state (safe to call now — all props set) ──────
        self.loadNodeProgress()
    }

    /// Designated initialiser used by `makeAsync` — accepts fully pre-loaded state
    /// so no blocking database work is needed on the main thread at construction time.
    fileprivate init(prebuilt nodes: [DataNode],
                     ctx: ModelContext,
                     progressMap: [String: NodeProgress],
                     stats: UserStats) {
        self.nodes                 = nodes
        self.modelContext          = ctx
        self._userStats            = stats
        self.progressMap           = progressMap
        self.currentStabilityScore = stats.stabilityScore
        self.currentXP             = stats.totalXP
        self.currentDataShards     = stats.dataShards
        self.currentSystemRank     = stats.systemRank
        self.currentProbeXP        = stats.probeXP
        self.currentTheme          = stats.activeTheme
        self.currentGameMode       = stats.gameMode
        self.currentAppearance     = stats.appAppearance
        self.currentTextSize       = stats.textSizeOption
        self.currentTestDate       = stats.testDate
        self.currentPlanStartDate  = stats.planStartDate
    }

    // MARK: - Computed

    var unlockedNodes: [DataNode]  { nodes.filter(\.isUnlocked) }
    var completedNodes: [DataNode] { nodes.filter(\.isCompleted) }

    var completionPercent: Double {
        nodes.isEmpty ? 0 : Double(completedNodes.count) / Double(nodes.count)
    }

    // MARK: - Per-Domain Progress

    func progress(for domain: KnowledgeDomain) -> DomainProgress {
        let domainNodes = nodes.filter { $0.domain == domain }
        let completed   = domainNodes.filter(\.isCompleted).count
        let total       = domainNodes.count
        let ppn         = pointsPerNode(domain: domain)
        return DomainProgress(
            domain: domain,
            completed: completed,
            total: total,
            pointsEarned: completed * ppn,
            pointsAvailable: total * ppn
        )
    }

    // MARK: - Mastery Query

    /// Returns the persisted MasteryLevel for a given node.
    func mastery(for node: DataNode) -> MasteryLevel {
        progressMap[persistenceKey(for: node)]?.mastery ?? .locked
    }

    // MARK: - Grading

    /// Evaluate a submitted answer, award XP + stability points, persist everything.
    @discardableResult
    func gradeAnswer(nodeId: UUID, submitted: String) -> GradeResult {
        guard let idx = nodes.firstIndex(where: { $0.id == nodeId }) else {
            return GradeResult(
                wasCorrect: false, pointsAwarded: 0,
                newStabilityScore: currentStabilityScore,
                xpAwarded: 0, shardAwarded: false,
                rankUp: false, newSystemRank: currentSystemRank,
                nodeUnlocked: nil
            )
        }

        let correct = submitted.trimmingCharacters(in: .whitespaces) == nodes[idx].correctAnswer
        let key = persistenceKey(for: nodes[idx])
        let progress = progressMap[key]
        let previousRank = currentSystemRank

        var pointsAwarded = 0
        var xpAwarded     = 0
        var shardAwarded  = false
        var unlocked: DataNode? = nil

        if correct && !nodes[idx].isCompleted {
            // Perfect = no wrong answers submitted before this correct one
            let wasPerfect = (progress?.wrongAttemptCount ?? 0) == 0
            let wrongs     = progress?.wrongAttemptCount ?? 0

            nodes[idx].isCompleted = true
            pointsAwarded          = pointsPerNode(domain: nodes[idx].domain)

            // XP reward tiers
            xpAwarded    = wasPerfect ? 150 : (wrongs == 1 ? 100 : 50)
            shardAwarded = wasPerfect

            // Update persisted stats
            _userStats.stabilityScore  = min(1000, _userStats.stabilityScore + pointsAwarded)
            _userStats.totalXP        += xpAwarded
            _userStats.nodesCompleted += 1
            _userStats.totalAttempts  += 1
            _userStats.probeXP        += 1   // one probe XP per correct answer
            if wasPerfect {
                _userStats.dataShards  += 1
                _userStats.perfectNodes += 1
            }

            // Update NodeProgress record
            progress?.isCompleted  = true
            progress?.masteryLevel = wasPerfect
                ? MasteryLevel.perfect.rawValue
                : MasteryLevel.stabilized.rawValue

            unlocked = unlockNextSector(after: nodes[idx])

        } else if !correct {
            _userStats.totalAttempts  += 1
            progress?.wrongAttemptCount += 1
            // Advance from "available" to "attempted" on first wrong answer
            if let p = progress, p.masteryLevel == MasteryLevel.available.rawValue {
                p.masteryLevel = MasteryLevel.attempted.rawValue
            }
        } else {
            // Correct but node was already completed — still a valid attempt
            _userStats.totalAttempts += 1
        }

        syncDisplayStats()
        checkStoryBeat()
        try? modelContext.save()

        let didRankUp = currentSystemRank.rawValue > previousRank.rawValue

        return GradeResult(
            wasCorrect: correct,
            pointsAwarded: pointsAwarded,
            newStabilityScore: currentStabilityScore,
            xpAwarded: xpAwarded,
            shardAwarded: shardAwarded,
            rankUp: didRankUp,
            newSystemRank: currentSystemRank,
            nodeUnlocked: unlocked
        )
    }

    // MARK: - Unlock Logic

    /// Unlocks the next node: same domain first, then cross-domain.
    /// Also updates the corresponding NodeProgress record.
    @discardableResult
    func unlockNextSector(after completedNode: DataNode) -> DataNode? {
        if let nextIdx = nodes.firstIndex(where: {
            $0.domain == completedNode.domain && !$0.isUnlocked
        }) {
            nodes[nextIdx].isUnlocked = true
            applyUnlock(to: nodes[nextIdx])
            return nodes[nextIdx]
        }
        if let nextIdx = nodes.firstIndex(where: { !$0.isUnlocked }) {
            nodes[nextIdx].isUnlocked = true
            applyUnlock(to: nodes[nextIdx])
            return nodes[nextIdx]
        }
        return nil
    }

    // MARK: - Helpers

    /// Points a single node is worth within its domain's weighted stability budget.
    func pointsPerNode(domain: KnowledgeDomain) -> Int {
        let count = nodes.filter { $0.domain == domain }.count
        guard count > 0 else { return 0 }
        return max(1, domain.maxStabilityPoints / count)
    }

    // MARK: - Prerequisite Check

    /// Returns true when the node has no prerequisite, or its required node is already completed.
    func isPrerequisiteSatisfied(for node: DataNode) -> Bool {
        guard let reqID = node.requiredNodeID else { return true }
        return nodes.first(where: { $0.id == reqID })?.isCompleted ?? false
    }

    // MARK: - Theme Store

    /// Spend 500 Data Shards to unlock a theme. Returns true on success.
    @discardableResult
    func purchaseTheme(_ theme: Theme) -> Bool {
        guard !_userStats.isThemeUnlocked(theme),
              _userStats.dataShards >= theme.cost else { return false }
        _userStats.dataShards -= theme.cost
        _userStats.unlockTheme(theme)
        syncDisplayStats()
        try? modelContext.save()
        return true
    }

    /// Switch to an already-owned theme.
    func setActiveTheme(_ theme: Theme) {
        guard _userStats.isThemeUnlocked(theme) else { return }
        _userStats.activeThemeRaw = theme.rawValue
        syncDisplayStats()
        try? modelContext.save()
    }

    // MARK: - Boss Grading

    /// Record a boss-question result. Returns the new streak and whether the boss was just defeated.
    @discardableResult
    func gradeBossQuestion(domain: KnowledgeDomain, wasCorrect: Bool) -> (streak: Int, defeated: Bool) {
        if wasCorrect {
            let newStreak = _userStats.bossStreak(for: domain) + 1
            if newStreak >= 10 {
                _userStats.defeatBoss(for: domain)
                _userStats.setBossStreak(0, for: domain)
                // Bonus: 500 XP + 2 shards for defeating a boss
                _userStats.totalXP    += 500
                _userStats.dataShards += 2
                syncDisplayStats()
                try? modelContext.save()
                return (0, true)
            } else {
                _userStats.setBossStreak(newStreak, for: domain)
                try? modelContext.save()
                return (newStreak, false)
            }
        } else {
            _userStats.setBossStreak(0, for: domain)
            try? modelContext.save()
            return (0, false)
        }
    }

    func bossStreak(for domain: KnowledgeDomain) -> Int {
        _userStats.bossStreak(for: domain)
    }

    func isBossDefeated(for domain: KnowledgeDomain) -> Bool {
        _userStats.isBossDefeated(for: domain)
    }

    func isThemeUnlocked(_ theme: Theme) -> Bool {
        _userStats.isThemeUnlocked(theme)
    }

    var unlockedThemes: [Theme] { _userStats.unlockedThemes }

    // MARK: - Breach Nodes (spaced repetition)

    /// Nodes the user answered incorrectly at least once that haven't reached perfect mastery.
    var breachNodes: [DataNode] {
        nodes.filter { node in
            guard node.isUnlocked else { return false }
            let key = persistenceKey(for: node)
            guard let p = progressMap[key] else { return false }
            return p.wrongAttemptCount > 0 && p.masteryLevel < MasteryLevel.perfect.rawValue
        }
    }

    /// Wrong attempt count for a specific node (for display in review queue).
    func wrongAttempts(for node: DataNode) -> Int {
        progressMap[persistenceKey(for: node)]?.wrongAttemptCount ?? 0
    }

    // MARK: - Practice Exam Sampling

    /// Returns up to 90 nodes sampled proportionally to PTCB exam domain weights.
    /// Prefers completed nodes; falls back to unlocked nodes to fill the quota.
    func practiceExamSample() -> [DataNode] {
        let targets: [(KnowledgeDomain, Int)] = [
            (.medications, 31), (.federalRequirements, 17),
            (.patientSafety, 21), (.orderEntry, 21)
        ]
        var result: [DataNode] = []
        for (domain, target) in targets {
            var pool = nodes.filter { $0.domain == domain && $0.isCompleted && !$0.options.isEmpty }
            if pool.count < target {
                let extras = nodes.filter { $0.domain == domain && $0.isUnlocked && !$0.isCompleted && !$0.options.isEmpty }
                pool += extras.shuffled()
            }
            result += Array(pool.shuffled().prefix(target))
        }
        return result.shuffled()
    }

    // MARK: - Game Mode & Appearance

    func setGameMode(_ mode: GameMode) {
        _userStats.gameModeRaw = mode.rawValue
        syncDisplayStats()
        try? modelContext.save()
    }

    func setAppearance(_ appearance: AppAppearance) {
        _userStats.appearanceRaw = appearance.rawValue
        syncDisplayStats()
        try? modelContext.save()
    }

    // MARK: - Full Reset

    /// Wipes all progress and story state, preserving theme/mode preferences.
    func resetAllProgress() {
        // Reload nodes from source data to restore initial unlock states
        nodes = DataNode.phaseOneDatabase

        // Delete all NodeProgress records
        let descriptor = FetchDescriptor<NodeProgress>()
        let allProgress = (try? modelContext.fetch(descriptor)) ?? []
        for p in allProgress { modelContext.delete(p) }
        progressMap = [:]

        // Reset counters — keep theme, gameMode, appearance preferences
        _userStats.totalXP           = 0
        _userStats.dataShards        = 0
        _userStats.stabilityScore    = 0
        _userStats.nodesCompleted    = 0
        _userStats.perfectNodes      = 0
        _userStats.totalAttempts     = 0
        _userStats.probeXP           = 0
        _userStats.storyBeatsShown   = 0
        _userStats.unlockedThemesRaw = Theme.amber.rawValue
        _userStats.activeThemeRaw    = Theme.amber.rawValue
        _userStats.bossStreakD1 = 0;  _userStats.bossDefeatedD1 = false
        _userStats.bossStreakD2 = 0;  _userStats.bossDefeatedD2 = false
        _userStats.bossStreakD3 = 0;  _userStats.bossDefeatedD3 = false
        _userStats.bossStreakD4 = 0;  _userStats.bossDefeatedD4 = false

        try? modelContext.save()
        loadNodeProgress()
        syncDisplayStats()
    }

    // MARK: - Private Helpers

    /// Composite key that is stable across app launches (unlike UUID()).
    private func persistenceKey(for node: DataNode) -> String {
        "\(node.domain.rawValue)|\(node.nodeTitle)"
    }

    /// Mark a NodeProgress record as unlocked (called by unlockNextSector).
    private func applyUnlock(to node: DataNode) {
        let key = persistenceKey(for: node)
        if let p = progressMap[key] {
            p.isUnlocked   = true
            p.masteryLevel = MasteryLevel.available.rawValue
        }
    }

    /// Mirror SwiftData values into the @Observable display vars so views update.
    private func syncDisplayStats() {
        currentStabilityScore  = _userStats.stabilityScore
        currentXP              = _userStats.totalXP
        currentDataShards      = _userStats.dataShards
        currentSystemRank      = _userStats.systemRank
        currentNodesCompleted  = _userStats.nodesCompleted
        currentPerfectNodes    = _userStats.perfectNodes
        currentTotalAttempts   = _userStats.totalAttempts
        currentProbeXP         = _userStats.probeXP
        currentTheme           = _userStats.activeTheme
        currentGameMode        = _userStats.gameMode
        currentAppearance      = _userStats.appAppearance
        currentTextSize        = _userStats.textSizeOption
        currentTestDate        = _userStats.testDate
        currentPlanStartDate   = _userStats.planStartDate
    }

    // MARK: - Text Size

    func setTextSize(_ size: TextSizeOption) {
        _userStats.textSizeRaw = size.rawValue
        syncDisplayStats()
        try? modelContext.save()
    }

    // MARK: - Exam Date

    func setTestDate(_ date: Date?) {
        _userStats.setTestDate(date)
        syncDisplayStats()
        try? modelContext.save()
    }

    func clearTestDate() {
        _userStats.setTestDate(nil)
        syncDisplayStats()
        try? modelContext.save()
    }

    /// Fire the next story beat if the stability score has crossed a new 5% milestone.
    private func checkStoryBeat() {
        if let beat = StoryManager.nextBeat(
            stabilityScore: _userStats.stabilityScore,
            shownCount: _userStats.storyBeatsShown
        ) {
            _userStats.storyBeatsShown += 1
            pendingStoryBeat = beat
        }
    }

    /// On first launch: create NodeProgress records for every node.
    /// On subsequent launches: apply saved isUnlocked/isCompleted back onto nodes array.
    private func loadNodeProgress() {
        let descriptor = FetchDescriptor<NodeProgress>()
        let savedRecords = (try? modelContext.fetch(descriptor)) ?? []

        // Index saved records by key for fast lookup
        for record in savedRecords {
            progressMap[record.persistenceKey] = record
        }

        var newRecordsCreated = false
        for i in nodes.indices {
            let key = persistenceKey(for: nodes[i])
            if let saved = progressMap[key] {
                // Apply persisted state to in-memory node
                nodes[i].isUnlocked  = saved.isUnlocked
                nodes[i].isCompleted = saved.isCompleted
            } else {
                // First time this node has been seen — create a new record
                // using the node's hard-coded initial state (first node is isUnlocked: true)
                let record = NodeProgress(
                    persistenceKey: key,
                    isUnlocked: nodes[i].isUnlocked
                )
                if nodes[i].isCompleted {
                    record.isCompleted  = true
                    record.masteryLevel = MasteryLevel.stabilized.rawValue
                }
                modelContext.insert(record)
                progressMap[key]     = record
                newRecordsCreated    = true
            }
        }

        if newRecordsCreated {
            try? modelContext.save()
        }
    }
}

// MARK: - Active Database Registry

extension DataNode {

    /// The active node set loaded into GameEngine on launch.
    static var phaseOneDatabase: [DataNode] {
        var all = domain1Nodes          // Phase 2 ✓ — Medications (35%)
        all += domain1bNodes            // Phase 6 ✓ — Medications expansion (+16 nodes)
        all += domain1cNodes            // Phase 7a ✓ — Medications gap fill (+7 nodes)
        all += challengeNodes_D1        // Phase 7b ✓ — Medications challenge mode (+12 nodes)
        all += multiAngleNodes_D1       // Phase 9 ✓ — Medications multi-angle pedagogy (+56 nodes)
        all += domain2Nodes             // Phase 3 ✓ — Federal Requirements (18.75%)
        all += domain2bNodes            // Phase 6 ✓ — Federal Requirements expansion (+8 nodes)
        all += domain2cNodes            // Phase 7a ✓ — Federal Requirements gap fill (+1 node)
        all += challengeNodes_D2        // Phase 7b ✓ — Federal Requirements challenge mode (+6 nodes)
        all += multiAngleNodes_D2       // Phase 9 ✓ — Federal Requirements multi-angle (+24 nodes)
        all += domain3Nodes             // Phase 3 ✓ — Patient Safety & QA (23.75%)
        all += domain3bNodes            // Phase 6 ✓ — Patient Safety expansion (+8 nodes)
        all += domain3cNodes            // Phase 7a ✓ — Patient Safety gap fill (+1 node)
        all += challengeNodes_D3        // Phase 7b ✓ — Patient Safety challenge mode (+6 nodes)
        all += multiAngleNodes_D3       // Phase 9 ✓ — Patient Safety multi-angle (+24 nodes)
        all += domain4Nodes             // Phase 4 ✓ — Order Entry & Math (22.5%)
        all += domain4bNodes            // Phase 6 ✓ — Order Entry expansion (+8 nodes)
        all += domain4cNodes            // Phase 7a ✓ — Order Entry gap fill (+2 nodes)
        all += challengeNodes_D4        // Phase 7b ✓ — Order Entry challenge mode (+6 nodes)
        all += multiAngleNodes_D4       // Phase 9 ✓ — Order Entry multi-angle (+20 nodes)
        all += multiAngleNodes_D1b      // Phase 9.5 ✓ — Medications interactions & counseling (+28 nodes)
        all += multiAngleNodes_D1c      // Phase 9.5 ✓ — Medications 12 new drugs (+48 nodes)
        all += multiAngleNodes_D2b      // Phase 9.5 ✓ — Federal Requirements expansion (+14 nodes)
        all += multiAngleNodes_D3b      // Phase 9.5 ✓ — Patient Safety expansion (+14 nodes)
        all += multiAngleNodes_D4b      // Phase 9.5 ✓ — Order Entry expansion (+14 nodes)
        all += multiAngleNodes_D1d      // Phase 10 ✓ — Medications 14 new drugs (+56 nodes)
        all += multiAngleNodes_D1e      // Phase 10 ✓ — Medications D1c interactions+counseling (+24 nodes)
        all += multiAngleNodes_D2c      // Phase 10 ✓ — Federal Requirements gap fill (+14 nodes)
        all += multiAngleNodes_D3c      // Phase 10 ✓ — Patient Safety gap fill (+14 nodes)
        all += multiAngleNodes_D4c      // Phase 10 ✓ — Order Entry math gap fill (+14 nodes)
        all += multiAngleNodes_D1f      // Phase 11 ✓ — D1d interactions+counseling (+28 nodes)
        all += multiAngleNodes_D1g      // Phase 11 ✓ — 10 critical PTCE drugs × 4 angles (+40 nodes)
        all += multiAngleNodes_D1h      // Phase 12 ✓ — Risperidone, Semaglutide, Allopurinol, Clindamycin × 4 (+16 nodes)
        all += multiAngleNodes_D1i      // Phase 12 ✓ — D1g interactions+counseling (+20 nodes)
        all += multiAngleNodes_D1j      // Phase 12 ✓ — Fluticasone, Pregabalin, Lithium, NTG, Vancomycin, Amiodarone, Buprenorphine × 4 (+32 nodes)
        all += multiAngleNodes_D2d      // Phase 12 ✓ — Federal Requirements gap fill II (+10 nodes)
        all += multiAngleNodes_D3d      // Phase 12 ✓ — Patient Safety gap fill II (+10 nodes)
        all += multiAngleNodes_D4d      // Phase 12 ✓ — Order Entry math gap fill II (+10 nodes)
        all += multiAngleNodes_D1k      // Phase 13 ✓ — D1h interactions+counseling: Risperidone, Semaglutide, Allopurinol, Clindamycin (+8 nodes)
        all += multiAngleNodes_D1l      // Phase 13 ✓ — D1j interactions+counseling: Fluticasone, Pregabalin, Lithium, NTG, Vancomycin, Amiodarone, Buprenorphine (+14 nodes)
        all += multiAngleNodes_D1m      // Phase 13 ✓ — 8 key drugs × 4 angles: Glipizide, Methotrexate, Isotretinoin, Sildenafil, Cephalexin, Aripiprazole, Naltrexone, Venlafaxine (+32 nodes)
        all += multiAngleNodes_D2e      // Phase 13 ✓ — Federal Requirements final gap fill: REMS, recalls, Rx label, CII fax, analogue act, DSCSA, IND, Sched V OTC, ratios, compounding (+10 nodes)
        all += multiAngleNodes_D3e      // Phase 13 ✓ — Patient Safety final gap fill: opioid PDMP, renal/hepatic dosing, serotonin syndrome, anaphylaxis, QT, adherence, MOH, transitions (+10 nodes)
        all += multiAngleNodes_D4e      // Phase 13 ✓ — Order Entry final gap fill: sig interpretation, volume conversions, reconstitution, partial dose, concentration, IV admixture, expiration, compounding yield, apothecary, days supply (+10 nodes)
        all += multiAngleNodes_D1n      // Phase 13 ✓ — D1m interactions+counseling: Glipizide, Methotrexate, Isotretinoin, Sildenafil, Cephalexin, Aripiprazole, Naltrexone, Venlafaxine (+16 nodes)
        all += multiAngleNodes_D1o      // Phase 14 ✓ — Full 6-angle coverage complete: Cyclobenzaprine + Naloxone (+12 nodes)
        return all
    }
}

// MARK: - Async Factory

extension GameEngine {

    /// Builds a fully-initialised GameEngine without blocking the main thread.
    ///
    /// The two most expensive operations — building the node array and creating the
    /// SwiftData ModelContainer — run together on a background thread via `Task.detached`.
    /// The lighter seeding / fetching work then runs on the main actor in small chunks,
    /// yielding between each so SwiftUI can re-render the loading bar.
    ///
    /// `onProgress` is called with values in [0, 1] from the main actor throughout.
    @MainActor
    static func makeAsync(
        onProgress: @escaping (Double) -> Void,
        onLog:      @escaping (String) -> Void
    ) async -> GameEngine {

        // ── 1. Heavy CPU + I/O off the main thread ────────────────────────────
        //    Node array build + ModelContainer init (SQLite store open/create).
        //    Both are safe on background threads; ModelContainer is @unchecked Sendable.
        onProgress(0.04)
        onLog("// SYNAPSE BOOT SEQUENCE INITIATED")
        onLog("// Building node database on background thread...")

        struct LoadResult: @unchecked Sendable {
            let nodes: [DataNode]
            let container: ModelContainer
            let usingCloudKit: Bool
            let storeRecreated: Bool
            let errorMessage: String?
        }

        let loadedNodes = DataNode.phaseOneDatabase

        let result: LoadResult = await Task.detached(priority: .userInitiated) {
            let schema      = Schema([NodeProgress.self, UserStats.self])
            // CloudKit config — enables automatic sync across all signed-in Apple devices.
            // Requires iCloud + CloudKit capability to be enabled in Xcode project settings.
            let cloudConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false,
                                                 cloudKitDatabase: .automatic)
            let localConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            var usingCloudKit = false
            var storeRecreated = false
            var errorMessage: String? = nil

            let container: ModelContainer

            // ── 1. Try CloudKit (iCloud sync) ────────────────────────────────
            if let ck = try? ModelContainer(for: schema, configurations: [cloudConfig]) {
                container = ck
                usingCloudKit = true
            } else {
                // ── 2. CloudKit unavailable — try local store ────────────────
                do {
                    container = try ModelContainer(for: schema, configurations: [localConfig])
                } catch {
                    // ── 3. Schema mismatch — wipe store and recreate ─────────
                    errorMessage = "[ERROR] Store open failed: \(error.localizedDescription)"
                    storeRecreated = true
                    let path = localConfig.url.path
                    try? FileManager.default.removeItem(atPath: path)
                    try? FileManager.default.removeItem(atPath: path + "-wal")
                    try? FileManager.default.removeItem(atPath: path + "-shm")
                    do {
                        container = try ModelContainer(for: schema, configurations: [localConfig])
                    } catch let retryError {
                        // ── 4. Last resort — in-memory (app runs, data doesn't persist) ──
                        let memConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
                        container = try! ModelContainer(for: schema, configurations: [memConfig])
                        errorMessage = "[FATAL] Store unrecoverable (\(retryError.localizedDescription)) — running in-memory"
                    }
                }
            }

            return LoadResult(nodes: loadedNodes, container: container,
                              usingCloudKit: usingCloudKit,
                              storeRecreated: storeRecreated, errorMessage: errorMessage)
        }.value

        // Report background results to the log
        onLog("// Node database built: \(result.nodes.count) nodes loaded")
        if result.usingCloudKit {
            onLog("// iCloud sync active — progress syncs across all your Apple devices")
        } else {
            onLog("[WARN] iCloud unavailable — local storage only (enable iCloud in Settings to sync)")
        }
        if result.storeRecreated {
            if let err = result.errorMessage { onLog(err) }
            onLog("[RECOVER] Incompatible store deleted — fresh database created")
        }
        if let err = result.errorMessage, !result.storeRecreated {
            onLog(err)
        }

        onProgress(0.30)
        await Task.yield()

        // ── 2. Main-thread ModelContext ───────────────────────────────────────
        onLog("// Creating model context...")
        let ctx = ModelContext(result.container)
        ctx.undoManager = nil   // skip undo tracking for bulk inserts (Apple-recommended)

        // ── 3. Fetch or create the singleton UserStats record ─────────────────
        onLog("// Fetching user stats...")
        let fetchedStats = (try? ctx.fetch(FetchDescriptor<UserStats>())) ?? []
        let stats: UserStats
        if let existing = fetchedStats.first {
            stats = existing
            onLog("// User stats loaded (XP: \(existing.totalXP), shards: \(existing.dataShards))")
        } else {
            stats = UserStats()
            ctx.insert(stats)
            try? ctx.save()
            onLog("// New user stats record created")
        }

        onProgress(0.38)
        await Task.yield()

        // ── 4. Fetch all existing NodeProgress records ────────────────────────
        onLog("// Fetching node progress records...")
        let savedRecords = (try? ctx.fetch(FetchDescriptor<NodeProgress>())) ?? []
        var progressMap: [String: NodeProgress] = [:]
        progressMap.reserveCapacity(result.nodes.count)
        for record in savedRecords { progressMap[record.persistenceKey] = record }
        onLog("// Found \(savedRecords.count) existing progress records")

        onProgress(0.44)
        await Task.yield()

        // ── 5. Seed / apply progress in chunks ────────────────────────────────
        //    Working on a LOCAL copy of nodes avoids triggering @Observable's
        //    observation machinery ~1000 times. Single assignment at the end.
        let nodes = result.nodes
        var workingNodes = nodes
        var pendingSave  = false
        var newCount     = 0
        let chunkSize    = 50
        var chunkStart   = 0

        if savedRecords.isEmpty {
            onLog("// First launch — seeding \(nodes.count) node records (may take a moment)...")
        } else {
            onLog("// Applying saved progress to \(nodes.count) nodes...")
        }

        while chunkStart < nodes.count {
            let chunkEnd = min(chunkStart + chunkSize, nodes.count)

            for i in chunkStart ..< chunkEnd {
                let key = "\(nodes[i].domain.rawValue)|\(nodes[i].nodeTitle)"
                if let saved = progressMap[key] {
                    workingNodes[i].isUnlocked  = saved.isUnlocked
                    workingNodes[i].isCompleted = saved.isCompleted
                } else {
                    let record = NodeProgress(persistenceKey: key,
                                             isUnlocked: nodes[i].isUnlocked)
                    if nodes[i].isCompleted {
                        record.isCompleted  = true
                        record.masteryLevel = MasteryLevel.stabilized.rawValue
                    }
                    ctx.insert(record)
                    progressMap[key] = record
                    pendingSave = true
                    newCount   += 1
                }
            }

            if pendingSave { try? ctx.save(); pendingSave = false }

            chunkStart = chunkEnd
            let p = 0.44 + 0.52 * (Double(chunkEnd) / Double(nodes.count))
            onProgress(p)
            await Task.yield()
        }

        if newCount > 0 { onLog("// Created \(newCount) new node records") }
        onLog("// Progress sync complete")
        onProgress(0.98)
        await Task.yield()

        // ── 6. Construct engine with pre-loaded state ─────────────────────────
        let engine = GameEngine(prebuilt: workingNodes,
                                ctx: ctx,
                                progressMap: progressMap,
                                stats: stats)
        onLog("// NETWORK ONLINE — launching...")
        onProgress(1.0)
        return engine
    }
}
