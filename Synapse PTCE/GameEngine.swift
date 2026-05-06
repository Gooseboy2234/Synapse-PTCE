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
enum KnowledgeDomain: String, CaseIterable, Identifiable, Codable {
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
    
    // Prodigy Features — Phase 1
    var dailyQuests: [DailyQuest] = []
    var pendingQuestRewards: [(xp: Int, shards: Int)] = []
    var pendingAchievement: Achievement? = nil
    var pendingStreakMilestone: (days: Int, xp: Int, shards: Int)? = nil
    
    // Prodigy Features — Phase 2
    var unopenedChests: [UnopenedChest] = []
    var pendingChestOpen: UnopenedChest? = nil
    var powerUpEffects: PowerUpEffectsManager = PowerUpEffectsManager()
    var pendingWeeklyReport: WeeklyReport? = nil
    var floatingTexts: [FloatingText] = []
    
    // MARK: - Shelf Break Narrative System
    
    /// Story database — chapters, logs, characters, timeline
    let storyDatabase: StoryDatabase
    
    // MARK: - Tutorial System

    /// Tutorial manager for onboarding and help system
    var tutorialManager: TutorialManager!

    // MARK: - Mastery Tracker (Spaced Repetition)

    /// Concept-level mastery tracker spanning the DataNode bank AND Rimrock questions.
    /// A concept is "truly learned" only after correct answers on ≥2 distinct days.
    var masteryTracker: MasteryTracker!

    // MARK: - Shared Budget Timer
    // In timed modes the clock is a session-wide budget (secondsPerQuestion × nodes answered
    // so far, topped up each time a new node is opened). It survives sheet dismissals so
    // fast answers on one node carry over to harder ones.

    /// Remaining seconds in the current timed session. Observable so views update live.
    var timedBudgetRemaining: Int = 0
    /// True while a timed session is active and the clock should be ticking.
    var timedSessionActive: Bool  = false

    private var budgetTimerTask: Task<Void, Never>? = nil

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
    /// Read-only access to the persistent UserStats record from outside the engine.
    var userStats: UserStats { _userStats }
    /// Maps stable persistence key → NodeProgress for O(1) lookup.
    private var progressMap: [String: NodeProgress] = [:]

    // MARK: - Init

    init(nodes: [DataNode] = DataNode.phaseOneDatabase) {
        // ── 1. Build SwiftData stack ────────────────────────────────────────
        let schema = Schema([NodeProgress.self, UserStats.self, TutorialProgress.self, ConceptRecord.self, ExamAttempt.self])
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
        self.storyDatabase         = StoryDatabase() // NEW: Load narrative system
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
        
        // ── 5. Initialize Prodigy Features ───────────────────────────────────
        self.loadDailyQuests()
        self.checkStreakUpdate()
        
        // ── 6. Initialize Phase 2 Features ───────────────────────────────────
        self.unopenedChests = stats.unopenedChests
        self.checkWeeklyReport()
        
        // ── 7. Initialize Tutorial System ────────────────────────────────────
        self.tutorialManager = TutorialManager(modelContext: ctx)

        // ── 8. Initialize Mastery Tracker (spaced repetition) ────────────────
        self.masteryTracker = MasteryTracker(modelContext: ctx)
        self.registerAllConcepts()
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
        self.storyDatabase         = StoryDatabase() // NEW: Load narrative system
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
        
        // Initialize Tutorial System
        self.tutorialManager = TutorialManager(modelContext: ctx)

        // Initialize Mastery Tracker
        self.masteryTracker = MasteryTracker(modelContext: ctx)
        self.registerAllConcepts()
    }

    // MARK: - Mastery (Concept-level spaced repetition)

    /// Walk the DataNode bank and the Rimrock question pool, registering every
    /// concept the tracker should know about. Forms the denominator for the
    /// global "truly learned" progress meter.
    func registerAllConcepts() {
        var descriptors: [ConceptDescriptor] = []

        // DataNode concepts — group by baseConceptTitle when available
        var dnSeen: Set<String> = []
        for node in nodes {
            let desc = ConceptDescriptor.from(dataNode: node)
            if dnSeen.insert(desc.key).inserted {
                descriptors.append(desc)
            }
        }

        // Rimrock concepts — walk every question in every shift
        var rmSeen: Set<String> = []
        for shift in RimrockContent.allShifts {
            for beat in shift.beats {
                if case .question(let q) = beat {
                    let desc = ConceptDescriptor.from(rimrockQuestion: q)
                    if rmSeen.insert(desc.key).inserted {
                        descriptors.append(desc)
                    }
                }
            }
        }

        masteryTracker.registerConcepts(descriptors)
    }

    /// Hook called from `gradeAnswer` after a DataNode answer is graded.
    /// Updates the concept-level mastery state.
    private func recordDataNodeMastery(node: DataNode, wasCorrect: Bool) {
        let descriptor = ConceptDescriptor.from(dataNode: node)
        masteryTracker.record(
            conceptKey: descriptor.key,
            displayName: descriptor.displayName,
            domain: descriptor.domain,
            source: descriptor.source,
            wasCorrect: wasCorrect
        )
    }

    /// Public hook for the Rimrock flow to record mastery when a Rimrock question
    /// is answered. Called from `RimrockShiftView.submitQuestion`.
    func recordRimrockMastery(question: RimrockQuestion, wasCorrect: Bool) {
        let descriptor = ConceptDescriptor.from(rimrockQuestion: question)
        masteryTracker.record(
            conceptKey: descriptor.key,
            displayName: descriptor.displayName,
            domain: descriptor.domain,
            source: descriptor.source,
            wasCorrect: wasCorrect
        )
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
    
    // MARK: - Story System Integration
    
    /// Current chapter based on overall stability score
    var currentChapter: Int {
        _userStats.currentChapter
    }
    
    /// Get chapter definition for a specific domain
    func chapter(for domain: KnowledgeDomain) -> Chapter? {
        storyDatabase.chapter(for: domain)
    }
    
    /// Check if a specific chapter is unlocked
    func isChapterUnlocked(_ chapterID: Int) -> Bool {
        _userStats.unlockedChapters().contains(chapterID)
    }
    
    /// Get all logs unlocked for current progress
    func unlockedLogs() -> [StoryLog] {
        storyDatabase.logs.filter { log in
            isChapterUnlocked(log.unlockChapter) &&
            progress(for: log.domain ?? .medications).percentComplete >= log.unlockProgress
        }
    }
    
    /// Station day (narrative timestamp) — tied to current chapter
    var stationDay: Int {
        currentChapter
    }
    
    /// Surface contact status (story element — lost after Chapter 6)
    var hasSurfaceContact: Bool {
        currentStabilityScore < 700
    }

    // MARK: - Mastery Query

    /// Returns the persisted MasteryLevel for a given node.
    func mastery(for node: DataNode) -> MasteryLevel {
        progressMap[persistenceKey(for: node)]?.mastery ?? .locked
    }

    // MARK: - Grading

    /// Evaluate a submitted answer, award XP + stability points, persist everything.
    @discardableResult
    func gradeAnswer(nodeId: UUID, submitted: String, timeSpent: TimeInterval = 0) -> GradeResult {
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
                _userStats.lifetimeDataShards += 1
                _userStats.currentPerfectStreak += 1
                _userStats.longestPerfectStreak = max(_userStats.longestPerfectStreak,
                                                      _userStats.currentPerfectStreak)
            } else {
                _userStats.currentPerfectStreak = 0
            }

            // Update NodeProgress record
            progress?.isCompleted  = true
            progress?.masteryLevel = wasPerfect
                ? MasteryLevel.perfect.rawValue
                : MasteryLevel.stabilized.rawValue

            unlocked = unlockNextSector(after: nodes[idx])
            
            // ── Prodigy Feature Tracking ──────────────────────────────────
            
            // Quest tracking
            trackQuestEvent(.answeredCorrectly)
            trackQuestEvent(.completedNode(domain: nodes[idx].domain))
            trackQuestEvent(.earnedXP(amount: xpAwarded))
            if wasPerfect {
                trackQuestEvent(.achievedPerfect)
            }
            
            // Achievement tracking
            trackAchievement(.nodeCompleted(count: _userStats.nodesCompleted, perfect: wasPerfect))
            trackAchievement(.perfectStreak(count: _userStats.currentPerfectStreak))
            trackAchievement(.shardsCollected(total: _userStats.lifetimeDataShards))
            if timeSpent > 0 {
                trackAchievement(.speedQuestion(seconds: timeSpent))
            }
            
            // Check domain completion
            let domainProgress = self.progress(for: nodes[idx].domain)
            if domainProgress.completed == domainProgress.total {
                trackAchievement(.domainCompleted(domain: nodes[idx].domain))
            }
            
            // No mistakes achievement tracking
            let nodesWithMistakes = nodes.filter { node in
                let k = persistenceKey(for: node)
                return (progressMap[k]?.wrongAttemptCount ?? 0) > 0
            }.count
            if nodesWithMistakes == 0 && _userStats.nodesCompleted >= 20 {
                trackAchievement(.noMistakesRun(count: _userStats.nodesCompleted))
            }
            
            // Play sound effects
            SoundEffectManager.shared.play(.correctAnswer)
            if shardAwarded {
                SoundEffectManager.shared.play(.shardEarned)
            }
            SoundEffectManager.shared.play(.xpGained)
            
            // ── Phase 2: Chest Drop System ────────────────────────────
            checkChestDrop(wasPerfect: wasPerfect)
            
            // ── Phase 2: Weekly Stats Tracking ────────────────────────
            _userStats.trackWeeklyQuestion(
                xp: xpAwarded,
                shards: shardAwarded ? 1 : 0,
                domain: nodes[idx].domain,
                wasPerfect: wasPerfect
            )
            
            // ── Phase 2: Apply Active Power-Up Effects ────────────────
            var finalXP = xpAwarded
            var finalShards = shardAwarded ? 1 : 0
            
            // Double XP power-up
            if powerUpEffects.isDoubleXPActive {
                finalXP *= 2
                powerUpEffects.consumeUse(of: .doubleXP)
                addFloatingText("2× XP!", color: .yellow, at: CGPoint(x: 200, y: 200))
            }
            
            // Shard Boost power-up
            if powerUpEffects.isShardBoostActive && !shardAwarded {
                finalShards = 1
                _userStats.dataShards += 1
                _userStats.lifetimeDataShards += 1
                powerUpEffects.consumeUse(of: .shardBoost)
                addFloatingText("Shard Boost!", color: .cyan, at: CGPoint(x: 200, y: 250))
                shardAwarded = true
            }

        } else if !correct {
            _userStats.totalAttempts  += 1
            _userStats.currentPerfectStreak = 0  // Break perfect streak
            progress?.wrongAttemptCount += 1
            // Advance from "available" to "attempted" on first wrong answer
            if let p = progress, p.masteryLevel == MasteryLevel.available.rawValue {
                p.masteryLevel = MasteryLevel.attempted.rawValue
            }
            
            // Play wrong answer sound
            SoundEffectManager.shared.play(.wrongAnswer)
            
        } else {
            // Correct but node was already completed — still a valid attempt
            _userStats.totalAttempts += 1
            trackQuestEvent(.answeredCorrectly)
            SoundEffectManager.shared.play(.correctAnswer)
        }

        // Record concept-level mastery (spaced repetition tracker).
        // Fires on every attempt, correct or not.
        recordDataNodeMastery(node: nodes[idx], wasCorrect: correct)

        syncDisplayStats()
        checkStoryBeat()
        try? modelContext.save()

        let didRankUp = currentSystemRank.rawValue > previousRank.rawValue
        if didRankUp {
            SoundEffectManager.shared.play(.rankUp)
        }

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
                _userStats.lifetimeDataShards += 2
                
                // Track quest and achievement
                trackQuestEvent(.defeatedBoss)
                let totalBosses = KnowledgeDomain.allCases.filter { isBossDefeated(for: $0) }.count
                trackAchievement(.bossDefeated(count: totalBosses))
                
                SoundEffectManager.shared.play(.bossDefeated)
                
                // ── Phase 2: Boss always drops Epic Chest ──────────────────
                checkChestDrop(wasPerfect: true, isBoss: true)
                
                syncDisplayStats()
                try? modelContext.save()
                return (0, true)
            } else {
                _userStats.setBossStreak(newStreak, for: domain)
                SoundEffectManager.shared.play(.correctAnswer)
                try? modelContext.save()
                return (newStreak, false)
            }
        } else {
            _userStats.setBossStreak(0, for: domain)
            SoundEffectManager.shared.play(.wrongAnswer)
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
    
    /// Track completion of a practice exam (for achievement)
    func completePracticeExam() {
        trackAchievement(.practiceExamCompleted)
    }

    // MARK: - Blueprint Exam (PTCB-format full-length)

    /// Returns up to 90 nodes sampled by the OFFICIAL PTCB 2020 content blueprint:
    /// Medications 40% (36), Federal 12.5% (11), Patient Safety 26.25% (24),
    /// Order Entry 21.25% (19). Pulls from the full available pool — no preference
    /// for completed nodes — so the exam reflects breadth, not what the player
    /// already mastered. Falls back to whatever the pool can provide if a domain
    /// has fewer than its target count of available questions.
    func blueprintExamSample() -> [DataNode] {
        let targets: [(KnowledgeDomain, Int)] = [
            (.medications, 36),
            (.federalRequirements, 11),
            (.patientSafety, 24),
            (.orderEntry, 19)
        ]
        var result: [DataNode] = []
        for (domain, target) in targets {
            let pool = nodes.filter {
                $0.domain == domain && !$0.options.isEmpty && !$0.correctAnswer.isEmpty
            }
            result += Array(pool.shuffled().prefix(target))
        }
        return result.shuffled()
    }

    /// Persist a completed Blueprint Exam attempt and trigger any related
    /// achievements/quests. Called by BlueprintExamView at the moment the
    /// player finishes (or the timer expires with answers in hand).
    @discardableResult
    func recordExamAttempt(
        questions: [DataNode],
        answers: [UUID: Bool],
        timeUsedSeconds: Int
    ) -> ExamAttempt {
        let total = questions.count
        let correct = answers.values.filter { $0 }.count
        let rawPct = total > 0 ? Double(correct) / Double(total) : 0
        let scaled = BlueprintExamScoring.scaledScore(for: rawPct)
        let didPass = scaled >= BlueprintExamScoring.passingScaledScore

        // Build per-domain breakdown.
        var byDomain: [String: DomainResult] = [:]
        for q in questions {
            let key = q.domain.rawValue
            var current = byDomain[key] ?? DomainResult(correct: 0, total: 0)
            current.total += 1
            if answers[q.id] == true { current.correct += 1 }
            byDomain[key] = current
        }
        let json = (try? JSONEncoder().encode(byDomain))
            .flatMap { String(data: $0, encoding: .utf8) } ?? "{}"

        let attempt = ExamAttempt(
            totalQuestions: total,
            rawCorrect: correct,
            timeUsedSeconds: timeUsedSeconds,
            scaledScore: scaled,
            didPass: didPass,
            domainResultsJSON: json
        )
        modelContext.insert(attempt)
        try? modelContext.save()
        trackAchievement(.practiceExamCompleted)
        return attempt
    }

    /// All persisted exam attempts, newest first.
    func allExamAttempts() -> [ExamAttempt] {
        let descriptor = FetchDescriptor<ExamAttempt>(
            sortBy: [SortDescriptor(\.attemptDate, order: .reverse)]
        )
        return (try? modelContext.fetch(descriptor)) ?? []
    }

    /// The most recent exam attempt, if any.
    var latestExamAttempt: ExamAttempt? {
        allExamAttempts().first
    }
    
    /// Track opening a breach node for review (for daily quest)
    func openBreachNode() {
        trackQuestEvent(.reviewedBreachNode)
    }
    
    /// Track study session start (for time-based achievements)
    func trackStudySessionStart() {
        let hour = Calendar.current.component(.hour, from: Date())
        trackAchievement(.studySessionStarted(hour: hour))
    }

    // MARK: - Game Mode & Appearance

    func setGameMode(_ mode: GameMode) {
        _userStats.gameModeRaw = mode.rawValue
        syncDisplayStats()
        try? modelContext.save()
        // End any active timed session when the mode changes
        endTimedSession()
    }

    func setAppearance(_ appearance: AppAppearance) {
        _userStats.appearanceRaw = appearance.rawValue
        syncDisplayStats()
        try? modelContext.save()
    }

    // MARK: - Shared Budget Timer

    /// Call when a timed-mode node is about to be presented.
    /// Tops up the budget by one question's worth of seconds and starts the clock
    /// if it isn't already running.
    func beginTimedQuestion() {
        guard currentGameMode.isTimed else { return }
        timedBudgetRemaining += currentGameMode.secondsPerQuestion
        if !timedSessionActive {
            timedSessionActive = true
            startBudgetClock()
        }
    }

    /// Pauses the budget clock (e.g. while the encounter sheet is being dismissed).
    func pauseTimedSession() {
        timedSessionActive = false
        budgetTimerTask?.cancel()
        budgetTimerTask = nil
    }

    /// Resumes the budget clock after a pause (e.g. when a new node sheet opens).
    func resumeTimedSession() {
        guard currentGameMode.isTimed, timedBudgetRemaining > 0 else { return }
        timedSessionActive = true
        startBudgetClock()
    }

    /// Ends the session entirely and resets the budget to zero.
    func endTimedSession() {
        timedSessionActive = false
        timedBudgetRemaining = 0
        budgetTimerTask?.cancel()
        budgetTimerTask = nil
    }

    private func startBudgetClock() {
        budgetTimerTask?.cancel()
        budgetTimerTask = Task { [weak self] in
            while true {
                try? await Task.sleep(for: .seconds(1))
                guard let self, !Task.isCancelled else { return }
                guard self.timedSessionActive else { return }
                if self.timedBudgetRemaining > 0 {
                    self.timedBudgetRemaining -= 1
                }
                if self.timedBudgetRemaining == 0 {
                    // Budget exhausted — force-submit the open node as a timeout
                    if let openNode = self.selectedNode {
                        self.gradeAnswer(nodeId: openNode.id, submitted: "<<<TIMEOUT>>>")
                        self.selectedNode = nil
                    }
                    self.timedSessionActive = false
                    return
                }
            }
        }
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
    
    // MARK: - Prodigy Features — Phase 1
    
    // MARK: Daily Quest System
    
    /// Load daily quests from UserStats, generating new ones if needed
    private func loadDailyQuests() {
        if _userStats.shouldResetQuests() {
            generateNewDailyQuests()
        } else {
            dailyQuests = _userStats.dailyQuests
        }
    }
    
    /// Generate 3 new random daily quests
    private func generateNewDailyQuests() {
        let questPool: [QuestType] = [
            .answerCorrectly(count: Int.random(in: 10...20)),
            .perfectNodes(count: Int.random(in: 3...6)),
            .studyDomain(domain: KnowledgeDomain.allCases.randomElement()!, count: Int.random(in: 4...8)),
            .earnXP(amount: Int.random(in: 200...500)),
            .defeatBoss,
            .reviewMistakes(count: Int.random(in: 5...10)),
            .studyStreak(days: _userStats.streakData.currentStreak + 1)
        ]
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let midnightTomorrow = Calendar.current.startOfDay(for: tomorrow)
        
        let selectedTypes = questPool.shuffled().prefix(3)
        dailyQuests = selectedTypes.map { DailyQuest(type: $0, expiresAt: midnightTomorrow) }
        
        _userStats.dailyQuests = dailyQuests
        _userStats.setLastQuestReset(Date())
        try? modelContext.save()
    }
    
    /// Update quest progress based on an event
    func trackQuestEvent(_ event: QuestEvent) {
        var updated = false
        
        for i in dailyQuests.indices {
            guard !dailyQuests[i].isComplete else { continue }
            
            switch (dailyQuests[i].type, event) {
            case (.answerCorrectly, .answeredCorrectly):
                dailyQuests[i].currentProgress += 1
                updated = true
                
            case (.perfectNodes, .achievedPerfect):
                dailyQuests[i].currentProgress += 1
                updated = true
                
            case (.studyDomain(let domain, _), .completedNode(let nodeDomain)) where domain == nodeDomain:
                dailyQuests[i].currentProgress += 1
                updated = true
                
            case (.earnXP(let target), .earnedXP(let amount)):
                dailyQuests[i].currentProgress = min(target, dailyQuests[i].currentProgress + amount)
                updated = true
                
            case (.defeatBoss, .defeatedBoss):
                dailyQuests[i].currentProgress = 1
                updated = true
                
            case (.reviewMistakes, .reviewedBreachNode):
                dailyQuests[i].currentProgress += 1
                updated = true
                
            case (.studyStreak(let days), _):
                // Updated separately via checkStreakUpdate
                if _userStats.streakData.currentStreak >= days {
                    dailyQuests[i].currentProgress = days
                    updated = true
                }
                
            default:
                break
            }
            
            // Check if quest just completed
            if dailyQuests[i].isComplete && dailyQuests[i].currentProgress == dailyQuests[i].type.target {
                let rewards = dailyQuests[i].type.rewards
                pendingQuestRewards.append(rewards)
                SoundEffectManager.shared.play(.questComplete)
            }
        }
        
        if updated {
            _userStats.dailyQuests = dailyQuests
            try? modelContext.save()
        }
    }
    
    /// Claim all pending quest rewards
    func claimQuestRewards() {
        for reward in pendingQuestRewards {
            _userStats.totalXP += reward.xp
            _userStats.dataShards += reward.shards
            _userStats.lifetimeDataShards += reward.shards
        }
        pendingQuestRewards.removeAll()
        syncDisplayStats()
        try? modelContext.save()
    }
    
    // MARK: Achievement System
    
    /// Track achievement events and unlock when criteria met
    func trackAchievement(_ event: AchievementEvent) {
        var newlyUnlocked: [AchievementType] = []
        
        switch event {
        case .nodeCompleted(let count, let perfect):
            if count == 1 && !_userStats.isAchievementUnlocked(.firstSteps) {
                newlyUnlocked.append(.firstSteps)
            }
            if count == 10 && !_userStats.isAchievementUnlocked(.tenNodes) {
                newlyUnlocked.append(.tenNodes)
            }
            if perfect && !_userStats.isAchievementUnlocked(.firstPerfect) {
                newlyUnlocked.append(.firstPerfect)
            }
            
        case .bossDefeated(let count):
            if count == 1 && !_userStats.isAchievementUnlocked(.firstBoss) {
                newlyUnlocked.append(.firstBoss)
            }
            if isBossDefeated(for: .medications) &&
               isBossDefeated(for: .federalRequirements) &&
               isBossDefeated(for: .patientSafety) &&
               isBossDefeated(for: .orderEntry) &&
               !_userStats.isAchievementUnlocked(.allBossesDefeated) {
                newlyUnlocked.append(.allBossesDefeated)
            }
            
        case .perfectStreak(let count):
            if count >= 5 && !_userStats.isAchievementUnlocked(.perfectStreak5) {
                newlyUnlocked.append(.perfectStreak5)
            }
            if count >= 10 && !_userStats.isAchievementUnlocked(.perfectStreak10) {
                newlyUnlocked.append(.perfectStreak10)
            }
            
        case .shardsCollected(let total):
            if total >= 100 && !_userStats.isAchievementUnlocked(.shardCollector100) {
                newlyUnlocked.append(.shardCollector100)
            }
            if total >= 500 && !_userStats.isAchievementUnlocked(.shardCollector500) {
                newlyUnlocked.append(.shardCollector500)
            }
            if total >= 1000 && !_userStats.isAchievementUnlocked(.shardCollector1000) {
                newlyUnlocked.append(.shardCollector1000)
            }
            
        case .streakAchieved(let days):
            if days >= 3 && !_userStats.isAchievementUnlocked(.streak3Days) {
                newlyUnlocked.append(.streak3Days)
            }
            if days >= 7 && !_userStats.isAchievementUnlocked(.streak7Days) {
                newlyUnlocked.append(.streak7Days)
            }
            if days >= 14 && !_userStats.isAchievementUnlocked(.streak14Days) {
                newlyUnlocked.append(.streak14Days)
            }
            if days >= 30 && !_userStats.isAchievementUnlocked(.streak30Days) {
                newlyUnlocked.append(.streak30Days)
            }
            
        case .domainCompleted(let domain):
            let type: AchievementType
            switch domain {
            case .medications: type = .domainMasterD1
            case .federalRequirements: type = .domainMasterD2
            case .patientSafety: type = .domainMasterD3
            case .orderEntry: type = .domainMasterD4
            }
            if !_userStats.isAchievementUnlocked(type) {
                newlyUnlocked.append(type)
            }
            
        case .practiceExamCompleted:
            if !_userStats.isAchievementUnlocked(.examReady) {
                newlyUnlocked.append(.examReady)
            }
            
        case .studySessionStarted(let hour):
            if hour >= 22 || hour <= 2 {
                if !_userStats.isAchievementUnlocked(.nightOwl) {
                    newlyUnlocked.append(.nightOwl)
                }
            }
            if hour < 7 && !_userStats.isAchievementUnlocked(.earlyBird) {
                newlyUnlocked.append(.earlyBird)
            }
            
        case .speedQuestion(let seconds):
            if seconds < 30 {
                _userStats.fastQuestionCount += 1
                if _userStats.fastQuestionCount >= 10 &&
                   !_userStats.isAchievementUnlocked(.speedDemon) {
                    newlyUnlocked.append(.speedDemon)
                }
            }
            
        case .noMistakesRun(let count):
            if count >= 20 && !_userStats.isAchievementUnlocked(.noMistakes) {
                newlyUnlocked.append(.noMistakes)
            }
        }
        
        // Unlock achievements and award rewards
        for type in newlyUnlocked {
            _userStats.unlockAchievement(type)
            let rewards = type.rewards
            _userStats.totalXP += rewards.xp
            _userStats.dataShards += rewards.shards
            _userStats.lifetimeDataShards += rewards.shards
            
            // Set pending achievement for UI display
            if let achievement = _userStats.achievements.first(where: { $0.type == type }) {
                pendingAchievement = achievement
            }
            
            SoundEffectManager.shared.play(.achievementUnlocked)
        }
        
        if !newlyUnlocked.isEmpty {
            syncDisplayStats()
            try? modelContext.save()
        }
    }
    
    // MARK: Streak System
    
    /// Check if streak should update (call once per session start)
    private func checkStreakUpdate() {
        let oldStreak = _userStats.streakData.currentStreak
        _userStats.updateStreak()
        let newStreak = _userStats.streakData.currentStreak
        
        // Track achievement for streak
        trackAchievement(.streakAchieved(days: newStreak))
        
        // Check for milestone rewards
        if let milestone = _userStats.streakData.nextMilestone(),
           newStreak >= milestone,
           !_userStats.streakData.streakRewardsClaimed.contains(milestone) {
            var data = _userStats.streakData
            data.streakRewardsClaimed.insert(milestone)
            _userStats.streakData = data
            
            let rewards = data.milestoneReward(for: milestone)
            pendingStreakMilestone = (milestone, rewards.xp, rewards.shards)
            SoundEffectManager.shared.play(.streakMilestone)
        }
        
        try? modelContext.save()
    }
    
    /// Claim pending streak milestone reward
    func claimStreakReward() {
        guard let milestone = pendingStreakMilestone else { return }
        _userStats.totalXP += milestone.xp
        _userStats.dataShards += milestone.shards
        _userStats.lifetimeDataShards += milestone.shards
        pendingStreakMilestone = nil
        syncDisplayStats()
        try? modelContext.save()
    }
    
    // MARK: - Prodigy Features — Phase 2
    
    // MARK: Power-Up System
    
    /// Purchase a power-up with Data Shards
    @discardableResult
    func purchasePowerUp(_ type: PowerUpType) -> Bool {
        guard _userStats.dataShards >= type.cost else { return false }
        
        _userStats.dataShards -= type.cost
        var inventory = _userStats.powerUpInventory
        inventory.add(type)
        _userStats.powerUpInventory = inventory
        
        SoundEffectManager.shared.play(.shardEarned)
        syncDisplayStats()
        try? modelContext.save()
        return true
    }
    
    /// Use a power-up during a question
    @discardableResult
    func usePowerUp(_ type: PowerUpType) -> Bool {
        var inventory = _userStats.powerUpInventory
        guard inventory.use(type) else { return false }
        
        _userStats.powerUpInventory = inventory
        powerUpEffects.activate(type)
        
        SoundEffectManager.shared.play(.correctAnswer)
        try? modelContext.save()
        return true
    }
    
    /// Check if a power-up can be used in current context
    func canUsePowerUp(_ type: PowerUpType) -> Bool {
        switch type.usageLimit {
        case .unlimited:
            return true
        case .timedModesOnly:
            return currentGameMode.isTimed
        case .multipleChoiceOnly:
            return selectedNode?.challengeType == .multipleChoice
        }
    }
    
    // MARK: Chest System
    
    /// Check if a chest should drop after completing a node
    func checkChestDrop(wasPerfect: Bool, isBoss: Bool = false) {
        if isBoss || ChestDropCalculator.shouldDropChest(wasPerfect: wasPerfect) {
            let chestType = ChestDropCalculator.determineChestType(wasPerfect: wasPerfect, isBoss: isBoss)
            let chest = UnopenedChest(type: chestType, sourceNode: selectedNode?.nodeTitle)
            
            _userStats.addChest(chest)
            unopenedChests = _userStats.unopenedChests
            
            // Trigger chest opening UI
            pendingChestOpen = chest
            
            SoundEffectManager.shared.play(.nodeUnlock)
            try? modelContext.save()
        }
    }
    
    /// Open a chest and award rewards
    func openChest(_ chest: UnopenedChest) -> ChestReward {
        let reward = ChestDropCalculator.generateReward(for: chest.type)
        
        // Award rewards
        _userStats.totalXP += reward.xp
        _userStats.dataShards += reward.shards
        _userStats.lifetimeDataShards += reward.shards
        
        // Award power-ups
        var inventory = _userStats.powerUpInventory
        for powerUp in reward.powerUps {
            inventory.add(powerUp)
        }
        _userStats.powerUpInventory = inventory
        
        // Track stats
        _userStats.totalChestsOpened += 1
        _userStats.trackWeeklyChestOpened()
        
        // Remove from unopened
        _userStats.removeChest(chest.id)
        unopenedChests = _userStats.unopenedChests
        
        // Add floating text
        addFloatingText("+\(reward.xp) XP", color: .yellow, at: CGPoint(x: 200, y: 300))
        addFloatingText("+\(reward.shards) 💎", color: .cyan, at: CGPoint(x: 200, y: 350))
        
        SoundEffectManager.shared.play(.achievementUnlocked)
        syncDisplayStats()
        try? modelContext.save()
        
        return reward
    }
    
    // MARK: Weekly Report System
    
    /// Check if a weekly report should be generated
    func checkWeeklyReport() {
        if _userStats.shouldGenerateWeeklyReport() {
            if let report = _userStats.generateWeeklyReport() {
                pendingWeeklyReport = report
                _userStats.resetWeeklyStats()
                try? modelContext.save()
            }
        }
    }
    
    /// Dismiss weekly report
    func dismissWeeklyReport() {
        pendingWeeklyReport = nil
    }
    
    // MARK: Visual Effects
    
    /// Add floating text animation
    func addFloatingText(_ text: String, color: Color, at position: CGPoint) {
        let floatingText = FloatingText(text: text, color: color, startPosition: position, createdAt: Date())
        floatingTexts.append(floatingText)
        
        // Auto-remove after expiration
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.floatingTexts.removeAll { $0.id == floatingText.id }
        }
    }
    
    /// Trigger particle effect (for future animation implementation)
    func triggerParticleEffect(_ effect: ParticleEffect) {
        // Placeholder for particle system integration
        // Can be implemented with custom SwiftUI views or SpriteKit
    }
    
    // MARK: - Prodigy Features — Phase 3
    
    // MARK: Game Center Integration
    
    /// Submit current XP to weekly leaderboard
    func submitWeeklyXP() {
        GameCenterManager.shared.submitScore(_userStats.weeklyXPEarned, to: GameCenterManager.LeaderboardID.weeklyXP)
    }
    
    /// Submit total XP to all-time leaderboard
    func submitTotalXP() {
        GameCenterManager.shared.submitScore(_userStats.totalXP, to: GameCenterManager.LeaderboardID.totalXP)
    }
    
    /// Submit perfect nodes count
    func submitPerfectNodes() {
        GameCenterManager.shared.submitScore(_userStats.perfectNodes, to: GameCenterManager.LeaderboardID.perfectNodes)
    }
    
    /// Submit study streak
    func submitStreak() {
        GameCenterManager.shared.submitScore(_userStats.streakData.currentStreak, to: GameCenterManager.LeaderboardID.studyStreak)
    }
    
    /// Report achievement to Game Center
    func reportGameCenterAchievement(for type: AchievementType) {
        // Map internal achievements to Game Center IDs
        let achievementID = mapToGameCenterAchievement(type)
        GameCenterManager.shared.reportAchievement(achievementID)
    }
    
    private func mapToGameCenterAchievement(_ type: AchievementType) -> String {
        switch type {
        case .firstSteps: return GameCenterManager.AchievementID.firstSteps
        case .tenNodes: return GameCenterManager.AchievementID.tenNodes
        case .firstPerfect: return GameCenterManager.AchievementID.firstPerfect
        case .firstBoss: return GameCenterManager.AchievementID.firstBoss
        case .streak7Days: return GameCenterManager.AchievementID.streak7Days
        case .streak30Days: return GameCenterManager.AchievementID.streak30Days
        case .domainMasterD1: return GameCenterManager.AchievementID.domainMasterD1
        case .allBossesDefeated: return GameCenterManager.AchievementID.allBosses
        default: return "" // Add mappings for other achievements
        }
    }
    
    // MARK: Badge System
    
    func isBadgeUnlocked(_ badge: ProfileBadge) -> Bool {
        switch badge {
        case .pharmacyTech:
            return _userStats.nodesCompleted >= 100
        case .certifiedRx:
            return completionPercent >= 1.0
        case .shardMaster:
            return _userStats.lifetimeDataShards >= 1000
        case .speedRunner:
            return _userStats.fastQuestionCount >= 50
        case .perfectionist:
            return _userStats.perfectNodes >= 50
        case .nightOwl:
            // Would need to track night study sessions
            return false
        case .earlyBird:
            // Would need to track early morning sessions
            return false
        case .streakLegend:
            return _userStats.streakData.longestStreak >= 30
        case .domainMaster:
            return KnowledgeDomain.allCases.allSatisfy { domain in
                progress(for: domain).completed == progress(for: domain).total
            }
        case .bossSlayer:
            return KnowledgeDomain.allCases.allSatisfy { isBossDefeated(for: $0) }
        }
    }
    
    // MARK: Frame System
    
    func isFrameUnlocked(_ frame: AvatarFrame) -> Bool {
        switch frame {
        case .classic:
            return true
        case .neon:
            return _userStats.systemRank.rawValue >= 3
        case .holographic:
            return _userStats.nodesCompleted >= 50
        case .corrupted:
            return KnowledgeDomain.allCases.allSatisfy { isBossDefeated(for: $0) }
        case .gold:
            return _userStats.totalXP >= 5000
        case .platinum:
            return completionPercent >= 1.0
        }
    }
    
    // MARK: Background Effect System
    
    func isEffectUnlocked(_ effect: BackgroundEffect) -> Bool {
        guard effect != .none else { return true }
        // Check if effect is in unlocked list (stored in UserStats)
        return _userStats.unlockedEffects.contains(effect.rawValue)
    }
    
    @discardableResult
    func purchaseBackgroundEffect(_ effect: BackgroundEffect) -> Bool {
        guard !isEffectUnlocked(effect), _userStats.dataShards >= effect.cost else { return false }
        
        _userStats.dataShards -= effect.cost
        _userStats.unlockEffect(effect)
        
        SoundEffectManager.shared.play(.shardEarned)
        syncDisplayStats()
        try? modelContext.save()
        return true
    }
    
    // MARK: Sharing System
    
    func generateShareContent(for type: ShareableContent.ContentType) -> ShareableContent {
        ShareableContent(type: type)
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
        all += DataNode.blueprintFillNodes  // Phase 15 — PTCB blueprint gap-fill (~106 nodes): top-50 drug fills, USP <800>, alligation, infusion duration, vaccine workflow, mifepristone/ketamine REMS, Beers, CYP, herbals, drug-nutrient, theophylline/carbamazepine NTI, USP <795> details, tech scope, DAW codes
        all += DataNode.blueprintFillNodes2 // Phase 16 — depth fills: math drill volume (BSA/weight/IBW/%/ratio/dilution/mEq/SG/temp/Roman/AWP/apothecary/days supply/drip), federal record-keeping timelines (Form 222/41/106/224, biennial, CII validity, refills, POA, HIPAA/DSCSA retention, OBRA-90), CDC vaccine schedule depth (birth/2-mo/MMR/varicella/HPV/Tdap/pneumo/Shingrix/flu/RSV/spacing/contraindications/sites/VFC)
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
            let schema      = Schema([NodeProgress.self, UserStats.self, TutorialProgress.self, ConceptRecord.self, ExamAttempt.self])
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
