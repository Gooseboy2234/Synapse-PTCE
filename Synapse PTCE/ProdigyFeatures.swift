//
//  ProdigyFeatures.swift
//  Synapse PTCE
//
//  Phase 1 Prodigy-like gamification:
//  • Daily Quests (3 random missions per day)
//  • Achievement System (20+ unlockable trophies)
//  • Streak Tracker (consecutive days studying)
//  • Sound Effects Manager
//

import Foundation
import SwiftUI
import SwiftData
import AVFoundation

// MARK: - Daily Quest System

enum QuestType: Equatable {
    case answerCorrectly(count: Int)
    case perfectNodes(count: Int)
    case studyDomain(domain: KnowledgeDomain, count: Int)
    case earnXP(amount: Int)
    case defeatBoss
    case reviewMistakes(count: Int)
    case studyStreak(days: Int)
    
    // MARK: - Codable Conformance
    
    enum CodingKeys: String, CodingKey {
        case type, count, domain, amount, days
    }
    
    enum TypeIdentifier: String, Codable {
        case answerCorrectly, perfectNodes, studyDomain, earnXP, defeatBoss, reviewMistakes, studyStreak
    }
}

extension QuestType: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(TypeIdentifier.self, forKey: .type)
        
        switch type {
        case .answerCorrectly:
            let count = try container.decode(Int.self, forKey: .count)
            self = .answerCorrectly(count: count)
        case .perfectNodes:
            let count = try container.decode(Int.self, forKey: .count)
            self = .perfectNodes(count: count)
        case .studyDomain:
            let domain = try container.decode(KnowledgeDomain.self, forKey: .domain)
            let count = try container.decode(Int.self, forKey: .count)
            self = .studyDomain(domain: domain, count: count)
        case .earnXP:
            let amount = try container.decode(Int.self, forKey: .amount)
            self = .earnXP(amount: amount)
        case .defeatBoss:
            self = .defeatBoss
        case .reviewMistakes:
            let count = try container.decode(Int.self, forKey: .count)
            self = .reviewMistakes(count: count)
        case .studyStreak:
            let days = try container.decode(Int.self, forKey: .days)
            self = .studyStreak(days: days)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .answerCorrectly(let count):
            try container.encode(TypeIdentifier.answerCorrectly, forKey: .type)
            try container.encode(count, forKey: .count)
        case .perfectNodes(let count):
            try container.encode(TypeIdentifier.perfectNodes, forKey: .type)
            try container.encode(count, forKey: .count)
        case .studyDomain(let domain, let count):
            try container.encode(TypeIdentifier.studyDomain, forKey: .type)
            try container.encode(domain, forKey: .domain)
            try container.encode(count, forKey: .count)
        case .earnXP(let amount):
            try container.encode(TypeIdentifier.earnXP, forKey: .type)
            try container.encode(amount, forKey: .amount)
        case .defeatBoss:
            try container.encode(TypeIdentifier.defeatBoss, forKey: .type)
        case .reviewMistakes(let count):
            try container.encode(TypeIdentifier.reviewMistakes, forKey: .type)
            try container.encode(count, forKey: .count)
        case .studyStreak(let days):
            try container.encode(TypeIdentifier.studyStreak, forKey: .type)
            try container.encode(days, forKey: .days)
        }
    }
}

// Continue with computed properties
extension QuestType {
    
    var title: String {
        switch self {
        case .answerCorrectly(let count):
            return "Answer \(count) Questions Correctly"
        case .perfectNodes(let count):
            return "Achieve \(count) Perfect Clears"
        case .studyDomain(let domain, let count):
            let domainName = domain.shortName
            return "Complete \(count) \(domainName) Nodes"
        case .earnXP(let amount):
            return "Earn \(amount) XP Today"
        case .defeatBoss:
            return "Defeat a Domain Boss"
        case .reviewMistakes(let count):
            return "Review \(count) Breach Nodes"
        case .studyStreak(let days):
            return "Maintain \(days)-Day Streak"
        }
    }
    
    var description: String {
        switch self {
        case .answerCorrectly:
            return "Test your knowledge across all domains"
        case .perfectNodes:
            return "No mistakes allowed — show mastery"
        case .studyDomain(let domain, _):
            return "Focus on \(domain.displayName)"
        case .earnXP:
            return "Accumulate experience through study"
        case .defeatBoss:
            return "Complete a 10-question boss encounter"
        case .reviewMistakes:
            return "Fix gaps in your knowledge"
        case .studyStreak:
            return "Study every day without missing"
        }
    }
    
    var target: Int {
        switch self {
        case .answerCorrectly(let count): return count
        case .perfectNodes(let count): return count
        case .studyDomain(_, let count): return count
        case .earnXP(let amount): return amount
        case .defeatBoss: return 1
        case .reviewMistakes(let count): return count
        case .studyStreak(let days): return days
        }
    }
    
    var rewards: (xp: Int, shards: Int) {
        switch self {
        case .answerCorrectly(let count):
            return (count * 10, count / 2)
        case .perfectNodes(let count):
            return (count * 20, count * 2)
        case .studyDomain(_, let count):
            return (count * 15, count)
        case .earnXP(let amount):
            return (amount / 2, amount / 50)
        case .defeatBoss:
            return (200, 15)
        case .reviewMistakes(let count):
            return (count * 12, count)
        case .studyStreak:
            return (100, 10)
        }
    }
    
    var icon: String {
        switch self {
        case .answerCorrectly: return "checkmark.circle.fill"
        case .perfectNodes: return "star.fill"
        case .studyDomain: return "books.vertical.fill"
        case .earnXP: return "sparkles"
        case .defeatBoss: return "flame.fill"
        case .reviewMistakes: return "arrow.triangle.2.circlepath"
        case .studyStreak: return "calendar.badge.clock"
        }
    }
}

struct DailyQuest: Codable, Identifiable {
    let id: String
    let type: QuestType
    var currentProgress: Int
    let expiresAt: Date
    
    var isComplete: Bool {
        currentProgress >= type.target
    }
    
    var progressPercent: Double {
        min(1.0, Double(currentProgress) / Double(type.target))
    }
    
    var progressText: String {
        "\(currentProgress) / \(type.target)"
    }
    
    init(type: QuestType, expiresAt: Date) {
        self.id = UUID().uuidString
        self.type = type
        self.currentProgress = 0
        self.expiresAt = expiresAt
    }
}

// MARK: - Achievement System

enum AchievementType: String, CaseIterable, Codable {
    // Beginner achievements
    case firstSteps         = "FIRST_STEPS"
    case tenNodes           = "TEN_NODES"
    case firstPerfect       = "FIRST_PERFECT"
    case firstBoss          = "FIRST_BOSS"
    
    // Skill achievements
    case perfectStreak5     = "PERFECT_STREAK_5"
    case perfectStreak10    = "PERFECT_STREAK_10"
    case speedDemon         = "SPEED_DEMON"
    case noMistakes         = "NO_MISTAKES"
    
    // Persistence achievements
    case streak3Days        = "STREAK_3_DAYS"
    case streak7Days        = "STREAK_7_DAYS"
    case streak14Days       = "STREAK_14_DAYS"
    case streak30Days       = "STREAK_30_DAYS"
    
    // Domain mastery
    case domainMasterD1     = "DOMAIN_MASTER_D1"
    case domainMasterD2     = "DOMAIN_MASTER_D2"
    case domainMasterD3     = "DOMAIN_MASTER_D3"
    case domainMasterD4     = "DOMAIN_MASTER_D4"
    
    // Collection achievements
    case shardCollector100  = "SHARD_COLLECTOR_100"
    case shardCollector500  = "SHARD_COLLECTOR_500"
    case shardCollector1000 = "SHARD_COLLECTOR_1000"
    
    // Exam readiness
    case examReady          = "EXAM_READY"
    case allBossesDefeated  = "ALL_BOSSES_DEFEATED"
    
    // Special achievements
    case nightOwl           = "NIGHT_OWL"
    case earlyBird          = "EARLY_BIRD"
    
    var title: String {
        switch self {
        case .firstSteps: return "First Steps"
        case .tenNodes: return "Getting Started"
        case .firstPerfect: return "Perfectionist"
        case .firstBoss: return "Boss Hunter"
        case .perfectStreak5: return "Hot Streak"
        case .perfectStreak10: return "Unstoppable"
        case .speedDemon: return "Speed Demon"
        case .noMistakes: return "Flawless Victory"
        case .streak3Days: return "Committed"
        case .streak7Days: return "Dedicated"
        case .streak14Days: return "Relentless"
        case .streak30Days: return "Legend"
        case .domainMasterD1: return "Medication Master"
        case .domainMasterD2: return "Legal Eagle"
        case .domainMasterD3: return "Safety Expert"
        case .domainMasterD4: return "Order Specialist"
        case .shardCollector100: return "Shard Collector"
        case .shardCollector500: return "Shard Hoarder"
        case .shardCollector1000: return "Shard Tycoon"
        case .examReady: return "Exam Ready"
        case .allBossesDefeated: return "Ultimate Champion"
        case .nightOwl: return "Night Owl"
        case .earlyBird: return "Early Bird"
        }
    }
    
    var description: String {
        switch self {
        case .firstSteps: return "Complete your first node"
        case .tenNodes: return "Complete 10 nodes"
        case .firstPerfect: return "Achieve perfect mastery on a node"
        case .firstBoss: return "Defeat your first domain boss"
        case .perfectStreak5: return "Complete 5 nodes perfectly in a row"
        case .perfectStreak10: return "Complete 10 nodes perfectly in a row"
        case .speedDemon: return "Answer 10 questions in under 30 seconds each"
        case .noMistakes: return "Complete 20 nodes without a single wrong answer"
        case .streak3Days: return "Study for 3 consecutive days"
        case .streak7Days: return "Study for 7 consecutive days"
        case .streak14Days: return "Study for 14 consecutive days"
        case .streak30Days: return "Study for 30 consecutive days"
        case .domainMasterD1: return "Complete all Medications nodes"
        case .domainMasterD2: return "Complete all Federal Requirements nodes"
        case .domainMasterD3: return "Complete all Patient Safety nodes"
        case .domainMasterD4: return "Complete all Order Entry nodes"
        case .shardCollector100: return "Collect 100 total Data Shards"
        case .shardCollector500: return "Collect 500 total Data Shards"
        case .shardCollector1000: return "Collect 1000 total Data Shards"
        case .examReady: return "Complete a full 90-question practice exam"
        case .allBossesDefeated: return "Defeat all four domain bosses"
        case .nightOwl: return "Study between 10 PM and 2 AM"
        case .earlyBird: return "Study before 7 AM"
        }
    }
    
    var icon: String {
        switch self {
        case .firstSteps: return "figure.walk"
        case .tenNodes: return "10.circle.fill"
        case .firstPerfect: return "star.circle.fill"
        case .firstBoss: return "shield.fill"
        case .perfectStreak5: return "flame"
        case .perfectStreak10: return "flame.fill"
        case .speedDemon: return "hare.fill"
        case .noMistakes: return "checkmark.seal.fill"
        case .streak3Days: return "calendar.badge.plus"
        case .streak7Days: return "calendar.circle.fill"
        case .streak14Days: return "calendar.badge.checkmark"
        case .streak30Days: return "trophy.fill"
        case .domainMasterD1: return "pills.fill"
        case .domainMasterD2: return "building.columns.fill"
        case .domainMasterD3: return "heart.text.square.fill"
        case .domainMasterD4: return "doc.text.magnifyingglass"
        case .shardCollector100: return "diamond.fill"
        case .shardCollector500: return "diamond.fill"
        case .shardCollector1000: return "diamond.fill"
        case .examReady: return "graduationcap.fill"
        case .allBossesDefeated: return "crown.fill"
        case .nightOwl: return "moon.stars.fill"
        case .earlyBird: return "sunrise.fill"
        }
    }
    
    var rewards: (xp: Int, shards: Int) {
        switch self {
        case .firstSteps: return (50, 5)
        case .tenNodes: return (100, 10)
        case .firstPerfect: return (75, 8)
        case .firstBoss: return (200, 20)
        case .perfectStreak5: return (150, 15)
        case .perfectStreak10: return (300, 30)
        case .speedDemon: return (200, 20)
        case .noMistakes: return (500, 50)
        case .streak3Days: return (100, 10)
        case .streak7Days: return (250, 25)
        case .streak14Days: return (500, 50)
        case .streak30Days: return (1000, 100)
        case .domainMasterD1: return (400, 40)
        case .domainMasterD2: return (400, 40)
        case .domainMasterD3: return (400, 40)
        case .domainMasterD4: return (400, 40)
        case .shardCollector100: return (100, 0)
        case .shardCollector500: return (250, 0)
        case .shardCollector1000: return (500, 0)
        case .examReady: return (750, 75)
        case .allBossesDefeated: return (1000, 100)
        case .nightOwl: return (100, 10)
        case .earlyBird: return (100, 10)
        }
    }
    
    var rarity: AchievementRarity {
        switch self {
        case .firstSteps, .tenNodes, .firstPerfect, .firstBoss:
            return .common
        case .perfectStreak5, .speedDemon, .streak3Days, .streak7Days,
             .shardCollector100, .nightOwl, .earlyBird:
            return .uncommon
        case .perfectStreak10, .noMistakes, .streak14Days,
             .domainMasterD1, .domainMasterD2, .domainMasterD3, .domainMasterD4,
             .shardCollector500, .examReady:
            return .rare
        case .streak30Days, .shardCollector1000, .allBossesDefeated:
            return .epic
        }
    }
}

enum AchievementRarity: String, Codable {
    case common = "COMMON"
    case uncommon = "UNCOMMON"
    case rare = "RARE"
    case epic = "EPIC"
    
    var color: Color {
        switch self {
        case .common: return Color.gray
        case .uncommon: return Color.green
        case .rare: return Color.blue
        case .epic: return Color.purple
        }
    }
    
    var label: String { rawValue }
}

struct Achievement: Codable, Identifiable {
    let type: AchievementType
    var isUnlocked: Bool
    var unlockedDate: Date?
    var progress: Int  // For multi-step achievements
    
    var id: String { type.rawValue }
    
    init(type: AchievementType) {
        self.type = type
        self.isUnlocked = false
        self.unlockedDate = nil
        self.progress = 0
    }
}

// MARK: - Streak System

struct StreakData: Codable {
    var currentStreak: Int
    var longestStreak: Int
    var lastStudyDate: Date?
    var totalStudyDays: Int
    var streakRewardsClaimed: Set<Int>  // Which milestone rewards have been claimed
    
    init() {
        self.currentStreak = 0
        self.longestStreak = 0
        self.lastStudyDate = nil
        self.totalStudyDays = 0
        self.streakRewardsClaimed = []
    }
    
    var isStreakActive: Bool {
        guard let lastDate = lastStudyDate else { return false }
        return Calendar.current.isDateInToday(lastDate) ||
               Calendar.current.isDateInYesterday(lastDate)
    }
    
    var streakEmoji: String {
        if currentStreak >= 30 { return "🔥🔥🔥" }
        if currentStreak >= 7 { return "🔥🔥" }
        if currentStreak >= 3 { return "🔥" }
        return "💪"
    }
    
    func nextMilestone() -> Int? {
        let milestones = [3, 7, 14, 30, 60, 90]
        return milestones.first { $0 > currentStreak }
    }
    
    func milestoneReward(for milestone: Int) -> (xp: Int, shards: Int) {
        switch milestone {
        case 3: return (50, 5)
        case 7: return (200, 20)
        case 14: return (500, 50)
        case 30: return (1000, 100)
        case 60: return (2000, 200)
        case 90: return (5000, 500)
        default: return (0, 0)
        }
    }
}

// MARK: - Sound Effect Manager

enum SoundEffect: String, CaseIterable {
    case questionAppear = "question_appear"
    case correctAnswer = "correct_answer"
    case wrongAnswer = "wrong_answer"
    case xpGained = "xp_gained"
    case shardEarned = "shard_earned"
    case rankUp = "rank_up"
    case bossDefeated = "boss_defeated"
    case achievementUnlocked = "achievement_unlocked"
    case questComplete = "quest_complete"
    case streakMilestone = "streak_milestone"
    case buttonTap = "button_tap"
    case nodeUnlock = "node_unlock"
    
    var filename: String {
        "\(rawValue).mp3"
    }
}

@Observable
class SoundEffectManager {
    static let shared = SoundEffectManager()
    
    private var soundEnabled: Bool
    private var audioPlayers: [SoundEffect: AVAudioPlayer] = [:]
    
    init() {
        // Load from UserDefaults
        self.soundEnabled = UserDefaults.standard.bool(forKey: "sound_effects_enabled")
        
        // Pre-load all sound effects
        for effect in SoundEffect.allCases {
            if let url = Bundle.main.url(forResource: effect.rawValue, withExtension: "mp3") {
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    audioPlayers[effect] = player
                } catch {
                    print("⚠️ Failed to load sound: \(effect.rawValue)")
                }
            }
        }
    }
    
    func play(_ effect: SoundEffect) {
        guard soundEnabled else { return }
        audioPlayers[effect]?.play()
    }
    
    func toggle() {
        soundEnabled.toggle()
        UserDefaults.standard.set(soundEnabled, forKey: "sound_effects_enabled")
    }
    
    var isEnabled: Bool { soundEnabled }
}

// MARK: - Quest Event Tracking

enum QuestEvent {
    case answeredCorrectly
    case achievedPerfect
    case completedNode(domain: KnowledgeDomain)
    case earnedXP(amount: Int)
    case defeatedBoss
    case reviewedBreachNode
}

// MARK: - Achievement Event Tracking

enum AchievementEvent {
    case nodeCompleted(count: Int, perfect: Bool)
    case bossDefeated(count: Int)
    case studySessionStarted(hour: Int)
    case practiceExamCompleted
    case perfectStreak(count: Int)
    case shardsCollected(total: Int)
    case domainCompleted(domain: KnowledgeDomain)
    case streakAchieved(days: Int)
    case speedQuestion(seconds: Double)
    case noMistakesRun(count: Int)
}
