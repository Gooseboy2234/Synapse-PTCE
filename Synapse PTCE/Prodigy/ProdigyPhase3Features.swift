//
//  ProdigyPhase3Features.swift
//  Synapse PTCE
//
//  Phase 3 Prodigy-like gamification:
//  • Game Center Integration (leaderboards, achievements)
//  • Social Features (friend challenges, sharing)
//  • Seasonal Events (limited-time content)
//  • Advanced Customization (badges, themes, effects)
//

import Foundation
import SwiftUI
import GameKit

// MARK: - Game Center Manager

@Observable
class GameCenterManager {
    static let shared = GameCenterManager()
    
    var isAuthenticated = false
    var localPlayer: GKLocalPlayer?
    var friends: [GKPlayer] = []
    
    // Leaderboard IDs (configure these in App Store Connect)
    struct LeaderboardID {
        static let weeklyXP = "weekly_xp_leaderboard"
        static let totalXP = "total_xp_leaderboard"
        static let perfectNodes = "perfect_nodes_leaderboard"
        static let studyStreak = "study_streak_leaderboard"
    }
    
    // Achievement IDs (configure these in App Store Connect)
    struct AchievementID {
        static let firstSteps = "achievement_first_steps"
        static let tenNodes = "achievement_ten_nodes"
        static let firstPerfect = "achievement_first_perfect"
        static let firstBoss = "achievement_first_boss"
        static let streak7Days = "achievement_streak_7_days"
        static let streak30Days = "achievement_streak_30_days"
        static let domainMasterD1 = "achievement_domain_master_d1"
        static let allBosses = "achievement_all_bosses"
        // Add all 25 achievements from Phase 1
    }
    
    init() {
        authenticatePlayer()
    }
    
    func authenticatePlayer() {
        GKLocalPlayer.local.authenticateHandler = { [weak self] viewController, error in
            if let viewController = viewController {
                // Present authentication view controller
                // In SwiftUI, you'll need to present this via a UIViewControllerRepresentable
                print("Game Center authentication required")
            } else if GKLocalPlayer.local.isAuthenticated {
                self?.isAuthenticated = true
                self?.localPlayer = GKLocalPlayer.local
                self?.loadFriends()
                print("✅ Game Center authenticated: \(GKLocalPlayer.local.displayName)")
            } else {
                self?.isAuthenticated = false
                if let error = error {
                    print("❌ Game Center authentication failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func loadFriends() {
        GKLocalPlayer.local.loadFriends { [weak self] friendIDs, error in
            guard let friendIDs = friendIDs as? [String], error == nil else { return }
            
            GKPlayer.loadPlayers(forIdentifiers: friendIDs) { players, error in
                if let players = players {
                    self?.friends = players
                    print("✅ Loaded \(players.count) Game Center friends")
                }
            }
        }
    }
    
    // MARK: Leaderboards
    
    func submitScore(_ score: Int, to leaderboardID: String) {
        guard isAuthenticated else { return }
        
        Task {
            do {
                try await GKLeaderboard.submitScore(
                    score,
                    context: 0,
                    player: GKLocalPlayer.local,
                    leaderboardIDs: [leaderboardID]
                )
                print("✅ Submitted score \(score) to \(leaderboardID)")
            } catch {
                print("❌ Failed to submit score: \(error.localizedDescription)")
            }
        }
    }
    
    func loadLeaderboard(_ leaderboardID: String, completion: @escaping ([GKLeaderboard.Entry]) -> Void) {
        guard isAuthenticated else {
            completion([])
            return
        }
        
        Task {
            do {
                let leaderboards = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardID])
                guard let leaderboard = leaderboards.first else {
                    completion([])
                    return
                }
                
                let entries = try await leaderboard.loadEntries(
                    for: .global,
                    timeScope: .allTime,
                    range: NSRange(location: 1, length: 25)
                )
                
                completion(entries.1)
            } catch {
                print("❌ Failed to load leaderboard: \(error.localizedDescription)")
                completion([])
            }
        }
    }
    
    // MARK: Achievements
    
    func reportAchievement(_ achievementID: String, percentComplete: Double = 100.0) {
        guard isAuthenticated else { return }
        
        let achievement = GKAchievement(identifier: achievementID)
        achievement.percentComplete = percentComplete
        achievement.showsCompletionBanner = true
        
        Task {
            do {
                try await GKAchievement.report([achievement])
                print("✅ Reported achievement: \(achievementID)")
            } catch {
                print("❌ Failed to report achievement: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: Challenges
    
    func sendChallenge(to friendID: String, message: String) {
        guard isAuthenticated else { return }
        
        // Implementation for sending challenges
        // This would typically involve custom server backend
        print("📤 Challenge sent to \(friendID): \(message)")
    }
}

// MARK: - Friend Challenge System

struct FriendChallenge: Identifiable, Codable {
    let id: UUID
    let fromPlayerID: String
    let fromDisplayName: String
    let toPlayerID: String
    let challengeType: FriendChallengeType
    let targetValue: Int
    let message: String
    let createdAt: Date
    let expiresAt: Date
    var status: ChallengeStatus
    
    var isExpired: Bool {
        Date() > expiresAt
    }
    
    init(from: String, fromName: String, to: String, type: FriendChallengeType, target: Int, message: String) {
        self.id = UUID()
        self.fromPlayerID = from
        self.fromDisplayName = fromName
        self.toPlayerID = to
        self.challengeType = type
        self.targetValue = target
        self.message = message
        self.createdAt = Date()
        self.expiresAt = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
        self.status = .pending
    }
}

enum FriendChallengeType: String, Codable, CaseIterable {
    case weeklyXP = "WEEKLY_XP"
    case perfectNodes = "PERFECT_NODES"
    case studyStreak = "STUDY_STREAK"
    case domainMastery = "DOMAIN_MASTERY"
    case speedRun = "SPEED_RUN"
    
    var displayName: String {
        switch self {
        case .weeklyXP: return "Weekly XP Race"
        case .perfectNodes: return "Perfect Node Challenge"
        case .studyStreak: return "Streak Competition"
        case .domainMastery: return "Domain Mastery Duel"
        case .speedRun: return "Speed Challenge"
        }
    }
    
    var icon: String {
        switch self {
        case .weeklyXP: return "bolt.fill"
        case .perfectNodes: return "star.fill"
        case .studyStreak: return "flame.fill"
        case .domainMastery: return "crown.fill"
        case .speedRun: return "hare.fill"
        }
    }
}

enum ChallengeStatus: String, Codable {
    case pending = "PENDING"
    case accepted = "ACCEPTED"
    case completed = "COMPLETED"
    case declined = "DECLINED"
    case expired = "EXPIRED"
}

// MARK: - Seasonal Event System

struct SeasonalEvent: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let startDate: Date
    let endDate: Date
    let bonusXPMultiplier: Double
    let specialRewards: [EventReward]
    let limitedQuests: [EventQuest]
    
    var isActive: Bool {
        let now = Date()
        return now >= startDate && now <= endDate
    }
    
    var daysRemaining: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: endDate).day ?? 0
    }
}

struct EventReward: Codable {
    let type: EventRewardType
    let value: Int
    let requiredProgress: Int
}

enum EventRewardType: String, Codable {
    case exclusiveTheme = "THEME"
    case exclusiveBadge = "BADGE"
    case powerUpBundle = "POWERUP_BUNDLE"
    case bonusXP = "BONUS_XP"
    case bonusShards = "BONUS_SHARDS"
}

struct EventQuest: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let targetCount: Int
    let rewardXP: Int
    let rewardShards: Int
    var currentProgress: Int
    
    var isComplete: Bool {
        currentProgress >= targetCount
    }
}

// MARK: - Customization System

enum ProfileBadge: String, CaseIterable, Codable {
    // Earned badges
    case pharmacyTech = "PHARMACY_TECH"
    case certifiedRx = "CERTIFIED_RX"
    case shardMaster = "SHARD_MASTER"
    case speedRunner = "SPEED_RUNNER"
    case perfectionist = "PERFECTIONIST"
    case nightOwl = "NIGHT_OWL"
    case earlyBird = "EARLY_BIRD"
    case streakLegend = "STREAK_LEGEND"
    case domainMaster = "DOMAIN_MASTER"
    case bossSlayer = "BOSS_SLAYER"
    
    var displayName: String {
        switch self {
        case .pharmacyTech: return "Pharmacy Technician"
        case .certifiedRx: return "PTCB Certified"
        case .shardMaster: return "Shard Master"
        case .speedRunner: return "Speed Runner"
        case .perfectionist: return "Perfectionist"
        case .nightOwl: return "Night Owl"
        case .earlyBird: return "Early Bird"
        case .streakLegend: return "Streak Legend"
        case .domainMaster: return "Domain Master"
        case .bossSlayer: return "Boss Slayer"
        }
    }
    
    var description: String {
        switch self {
        case .pharmacyTech: return "Complete 100 nodes"
        case .certifiedRx: return "Complete all domains"
        case .shardMaster: return "Collect 1000 shards"
        case .speedRunner: return "Answer 50 questions in under 20s"
        case .perfectionist: return "Achieve 50 perfect nodes"
        case .nightOwl: return "Study 10 times between 10 PM - 2 AM"
        case .earlyBird: return "Study 10 times before 7 AM"
        case .streakLegend: return "Maintain 30-day streak"
        case .domainMaster: return "Master all 4 domains"
        case .bossSlayer: return "Defeat all bosses"
        }
    }
    
    var icon: String {
        switch self {
        case .pharmacyTech: return "cross.case.fill"
        case .certifiedRx: return "checkmark.seal.fill"
        case .shardMaster: return "diamond.fill"
        case .speedRunner: return "hare.fill"
        case .perfectionist: return "star.fill"
        case .nightOwl: return "moon.stars.fill"
        case .earlyBird: return "sunrise.fill"
        case .streakLegend: return "flame.fill"
        case .domainMaster: return "crown.fill"
        case .bossSlayer: return "shield.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .pharmacyTech: return Color.blue
        case .certifiedRx: return Color.green
        case .shardMaster: return Color.cyan
        case .speedRunner: return Color.yellow
        case .perfectionist: return Color.orange
        case .nightOwl: return Color.purple
        case .earlyBird: return Color.pink
        case .streakLegend: return Color.red
        case .domainMaster: return Color(red: 1.0, green: 0.84, blue: 0.0)
        case .bossSlayer: return Color(red: 0.5, green: 0.0, blue: 0.5)
        }
    }
}

enum BackgroundEffect: String, CaseIterable, Codable {
    case none = "NONE"
    case particles = "PARTICLES"
    case glitch = "GLITCH"
    case rain = "RAIN"
    case pulseWave = "PULSE_WAVE"
    case stars = "STARS"
    
    var displayName: String {
        switch self {
        case .none: return "None"
        case .particles: return "Floating Particles"
        case .glitch: return "Terminal Glitch"
        case .rain: return "Code Rain"
        case .pulseWave: return "Pulse Wave"
        case .stars: return "Star Field"
        }
    }
    
    var cost: Int {
        switch self {
        case .none: return 0
        case .particles: return 200
        case .glitch: return 300
        case .rain: return 250
        case .pulseWave: return 350
        case .stars: return 300
        }
    }
}

enum AvatarFrame: String, CaseIterable, Codable {
    case classic = "CLASSIC"
    case neon = "NEON"
    case holographic = "HOLOGRAPHIC"
    case corrupted = "CORRUPTED"
    case gold = "GOLD"
    case platinum = "PLATINUM"
    
    var displayName: String {
        switch self {
        case .classic: return "Classic"
        case .neon: return "Neon Glow"
        case .holographic: return "Holographic"
        case .corrupted: return "Data Corrupted"
        case .gold: return "Gold Elite"
        case .platinum: return "Platinum Master"
        }
    }
    
    var unlockRequirement: String {
        switch self {
        case .classic: return "Default"
        case .neon: return "Reach Rank 3"
        case .holographic: return "Complete 50 nodes"
        case .corrupted: return "Defeat all bosses"
        case .gold: return "Earn 5000 XP"
        case .platinum: return "Complete all domains"
        }
    }
    
    var color: Color {
        switch self {
        case .classic: return Color.gray
        case .neon: return Color.cyan
        case .holographic: return Color.purple
        case .corrupted: return Color.red
        case .gold: return Color(red: 1.0, green: 0.84, blue: 0.0)
        case .platinum: return Color(red: 0.9, green: 0.9, blue: 0.9)
        }
    }
}

// MARK: - Share System

struct ShareableContent {
    enum ContentType {
        case achievement(AchievementType)
        case weeklyReport(WeeklyReport)
        case streak(days: Int)
        case rankUp(SystemRank)
        case bossDefeated(KnowledgeDomain)
        case perfectRun(count: Int)
    }
    
    let type: ContentType
    
    func generateShareText() -> String {
        switch type {
        case .achievement(let achievement):
            return "🏆 Just unlocked \"\(achievement.title)\" in Synapse PTCE! #PTCEPrep"
        case .weeklyReport(let report):
            return "📊 This week: \(report.questionsAnswered) questions, \(report.xpEarned) XP earned! Keep grinding! #PTCEPrep"
        case .streak(let days):
            return "🔥 \(days)-day study streak! Consistency is key! #PTCEPrep #StudyStreak"
        case .rankUp(let rank):
            return "⬆️ Ranked up to \(rank.title)! #PTCEPrep"
        case .bossDefeated(let domain):
            return "⚡ Defeated the \(domain.shortName) boss! #PTCEPrep"
        case .perfectRun(let count):
            return "⭐ \(count) perfect nodes in a row! Feeling confident! #PTCEPrep"
        }
    }
    
    func generateImage() -> Image? {
        // Generate shareable image
        // This would create a custom SwiftUI Image with stats/graphics
        // For now, return nil (can be implemented with custom rendering)
        return nil
    }
}

// MARK: - Prestige System (Optional)

struct PrestigeLevel: Codable {
    var level: Int
    var totalPrestigeXP: Int
    
    var title: String {
        switch level {
        case 0: return "Apprentice"
        case 1: return "Bronze Prestige"
        case 2: return "Silver Prestige"
        case 3: return "Gold Prestige"
        case 4: return "Platinum Prestige"
        case 5: return "Diamond Prestige"
        default: return "Legendary Prestige \(level)"
        }
    }
    
    var bonusXPMultiplier: Double {
        1.0 + (Double(level) * 0.1) // +10% per prestige level
    }
    
    func canPrestige(with stats: UserStats) -> Bool {
        // Require completing all content
        return stats.stabilityScore >= 1000 && level < 10
    }
}
