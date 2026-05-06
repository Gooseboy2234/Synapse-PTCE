//
//  ProdigyPhase2Features.swift
//  Synapse PTCE
//
//  Phase 2 Prodigy-like gamification:
//  • Power-Ups (consumable items)
//  • Reward Chests (loot boxes)
//  • Weekly Progress Reports
//  • Enhanced Visual Effects
//

import Foundation
import SwiftUI
import SwiftData

// MARK: - Power-Up System

enum PowerUpType: String, CaseIterable, Codable {
    case timeFreeze = "TIME_FREEZE"
    case doubleXP = "DOUBLE_XP"
    case shardBoost = "SHARD_BOOST"
    case skipQuestion = "SKIP_QUESTION"
    case hintRevealer = "HINT_REVEALER"
    
    var displayName: String {
        switch self {
        case .timeFreeze: return "Time Freeze"
        case .doubleXP: return "Double XP"
        case .shardBoost: return "Shard Boost"
        case .skipQuestion: return "Skip Question"
        case .hintRevealer: return "Hint Revealer"
        }
    }
    
    var description: String {
        switch self {
        case .timeFreeze: return "Pause the timer for 30 seconds"
        case .doubleXP: return "Earn 2× XP for the next 5 questions"
        case .shardBoost: return "Guarantee a shard on your next correct answer"
        case .skipQuestion: return "Skip the current question without penalty"
        case .hintRevealer: return "Eliminate 2 incorrect answers"
        }
    }
    
    var cost: Int {
        switch self {
        case .timeFreeze: return 50
        case .doubleXP: return 75
        case .shardBoost: return 40
        case .skipQuestion: return 100
        case .hintRevealer: return 30
        }
    }
    
    var icon: String {
        switch self {
        case .timeFreeze: return "clock.badge.exclamationmark.fill"
        case .doubleXP: return "arrow.up.circle.fill"
        case .shardBoost: return "diamond.fill"
        case .skipQuestion: return "forward.fill"
        case .hintRevealer: return "lightbulb.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .timeFreeze: return Color.cyan
        case .doubleXP: return Color.yellow
        case .shardBoost: return Color.purple
        case .skipQuestion: return Color.orange
        case .hintRevealer: return Color.green
        }
    }
    
    var usageLimit: PowerUpUsageLimit {
        switch self {
        case .timeFreeze: return .timedModesOnly
        case .doubleXP: return .unlimited
        case .shardBoost: return .unlimited
        case .skipQuestion: return .unlimited
        case .hintRevealer: return .multipleChoiceOnly
        }
    }
}

enum PowerUpUsageLimit {
    case unlimited
    case timedModesOnly
    case multipleChoiceOnly
}

struct PowerUpInventory: Codable {
    var timeFreeze: Int = 0
    var doubleXP: Int = 0
    var shardBoost: Int = 0
    var skipQuestion: Int = 0
    var hintRevealer: Int = 0
    
    mutating func add(_ type: PowerUpType, count: Int = 1) {
        switch type {
        case .timeFreeze: timeFreeze += count
        case .doubleXP: doubleXP += count
        case .shardBoost: shardBoost += count
        case .skipQuestion: skipQuestion += count
        case .hintRevealer: hintRevealer += count
        }
    }
    
    mutating func use(_ type: PowerUpType) -> Bool {
        switch type {
        case .timeFreeze:
            guard timeFreeze > 0 else { return false }
            timeFreeze -= 1
            return true
        case .doubleXP:
            guard doubleXP > 0 else { return false }
            doubleXP -= 1
            return true
        case .shardBoost:
            guard shardBoost > 0 else { return false }
            shardBoost -= 1
            return true
        case .skipQuestion:
            guard skipQuestion > 0 else { return false }
            skipQuestion -= 1
            return true
        case .hintRevealer:
            guard hintRevealer > 0 else { return false }
            hintRevealer -= 1
            return true
        }
    }
    
    func count(for type: PowerUpType) -> Int {
        switch type {
        case .timeFreeze: return timeFreeze
        case .doubleXP: return doubleXP
        case .shardBoost: return shardBoost
        case .skipQuestion: return skipQuestion
        case .hintRevealer: return hintRevealer
        }
    }
}

struct ActivePowerUp: Codable {
    let type: PowerUpType
    let activatedAt: Date
    var remainingUses: Int
    
    var isExpired: Bool {
        switch type {
        case .doubleXP:
            return remainingUses <= 0
        case .shardBoost:
            return remainingUses <= 0
        case .timeFreeze:
            return Date().timeIntervalSince(activatedAt) > 30
        default:
            return true // Single-use items expire immediately
        }
    }
}

// MARK: - Reward Chest System

enum ChestType: String, CaseIterable, Codable {
    case bronze = "BRONZE"
    case silver = "SILVER"
    case gold = "GOLD"
    case epic = "EPIC"
    
    var displayName: String {
        switch self {
        case .bronze: return "Bronze Chest"
        case .silver: return "Silver Chest"
        case .gold: return "Gold Chest"
        case .epic: return "Epic Chest"
        }
    }
    
    var description: String {
        switch self {
        case .bronze: return "Common rewards"
        case .silver: return "Uncommon rewards"
        case .gold: return "Rare rewards"
        case .epic: return "Legendary rewards"
        }
    }
    
    var icon: String {
        switch self {
        case .bronze: return "shippingbox.fill"
        case .silver: return "shippingbox.fill"
        case .gold: return "shippingbox.fill"
        case .epic: return "gift.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .bronze: return Color(red: 0.8, green: 0.5, blue: 0.2)
        case .silver: return Color(red: 0.75, green: 0.75, blue: 0.75)
        case .gold: return Color(red: 1.0, green: 0.84, blue: 0.0)
        case .epic: return Color(red: 0.58, green: 0.0, blue: 0.83)
        }
    }
    
    var dropRate: Double {
        switch self {
        case .bronze: return 0.60
        case .silver: return 0.30
        case .gold: return 0.09
        case .epic: return 0.01
        }
    }
    
    var guaranteedXP: ClosedRange<Int> {
        switch self {
        case .bronze: return 50...100
        case .silver: return 100...200
        case .gold: return 200...400
        case .epic: return 500...1000
        }
    }
    
    var guaranteedShards: ClosedRange<Int> {
        switch self {
        case .bronze: return 5...10
        case .silver: return 10...20
        case .gold: return 20...40
        case .epic: return 50...100
        }
    }
    
    var powerUpChance: Double {
        switch self {
        case .bronze: return 0.0
        case .silver: return 0.30
        case .gold: return 1.0
        case .epic: return 1.0
        }
    }
    
    var powerUpCount: ClosedRange<Int> {
        switch self {
        case .bronze: return 0...0
        case .silver: return 0...1
        case .gold: return 1...2
        case .epic: return 2...4
        }
    }
}

struct ChestReward: Codable, Identifiable {
    let id = UUID()
    let xp: Int
    let shards: Int
    let powerUps: [PowerUpType]
    
    var totalValue: Int {
        xp + (shards * 10) + (powerUps.count * 50)
    }
}

struct UnopenedChest: Codable, Identifiable {
    let id: UUID
    let type: ChestType
    let earnedAt: Date
    let sourceNode: String?
    
    init(type: ChestType, sourceNode: String? = nil) {
        self.id = UUID()
        self.type = type
        self.earnedAt = Date()
        self.sourceNode = sourceNode
    }
}

// MARK: - Weekly Progress Report

struct WeeklyReport: Codable {
    let weekStart: Date
    let weekEnd: Date
    
    let questionsAnswered: Int
    let xpEarned: Int
    let shardsEarned: Int
    let nodesCompleted: Int
    let perfectNodes: Int
    let longestStreak: Int
    let mostStudiedDomain: KnowledgeDomain?
    let totalMinutes: Int
    let achievementsUnlocked: Int
    let chestsOpened: Int
    
    var studyHours: Double {
        Double(totalMinutes) / 60.0
    }
    
    var averageSessionLength: Double {
        guard questionsAnswered > 0 else { return 0 }
        return Double(totalMinutes) / Double(questionsAnswered)
    }
}

// MARK: - Visual Effect System

enum ParticleEffect {
    case confetti
    case sparkles
    case fireworks
    case starburst
    case coins
    case gems
    
    var duration: TimeInterval {
        switch self {
        case .confetti: return 3.0
        case .sparkles: return 2.0
        case .fireworks: return 2.5
        case .starburst: return 1.5
        case .coins: return 2.0
        case .gems: return 2.0
        }
    }
}

// MARK: - Floating Text Animation

struct FloatingText: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
    let startPosition: CGPoint
    let createdAt: Date
    
    var isExpired: Bool {
        Date().timeIntervalSince(createdAt) > 2.0
    }
}

// MARK: - Chest Drop Logic

struct ChestDropCalculator {
    static func shouldDropChest(wasPerfect: Bool) -> Bool {
        if wasPerfect {
            // Perfect nodes have 80% drop rate
            return Double.random(in: 0...1) < 0.80
        } else {
            // Regular completion has 60% drop rate
            return Double.random(in: 0...1) < 0.60
        }
    }
    
    static func determineChestType(wasPerfect: Bool, isBoss: Bool) -> ChestType {
        if isBoss {
            // Boss always drops Epic
            return .epic
        }
        
        let roll = Double.random(in: 0...1)
        
        if wasPerfect {
            // Perfect nodes have better drop rates
            if roll < 0.02 { return .epic }
            if roll < 0.15 { return .gold }
            if roll < 0.50 { return .silver }
            return .bronze
        } else {
            // Regular completion
            if roll < 0.01 { return .epic }
            if roll < 0.10 { return .gold }
            if roll < 0.40 { return .silver }
            return .bronze
        }
    }
    
    static func generateReward(for chest: ChestType) -> ChestReward {
        let xp = Int.random(in: chest.guaranteedXP)
        let shards = Int.random(in: chest.guaranteedShards)
        
        var powerUps: [PowerUpType] = []
        if Double.random(in: 0...1) < chest.powerUpChance {
            let count = Int.random(in: chest.powerUpCount)
            for _ in 0..<count {
                if let randomPowerUp = PowerUpType.allCases.randomElement() {
                    powerUps.append(randomPowerUp)
                }
            }
        }
        
        return ChestReward(xp: xp, shards: shards, powerUps: powerUps)
    }
}

// MARK: - Power-Up Effects Manager

@Observable
class PowerUpEffectsManager {
    var activePowerUps: [ActivePowerUp] = []
    
    var isDoubleXPActive: Bool {
        activePowerUps.contains { $0.type == .doubleXP && !$0.isExpired }
    }
    
    var isShardBoostActive: Bool {
        activePowerUps.contains { $0.type == .shardBoost && !$0.isExpired }
    }
    
    var isTimeFreezeActive: Bool {
        activePowerUps.contains { $0.type == .timeFreeze && !$0.isExpired }
    }
    
    func activate(_ type: PowerUpType) {
        let uses: Int
        switch type {
        case .doubleXP: uses = 5
        case .shardBoost: uses = 1
        case .timeFreeze: uses = 1
        case .skipQuestion: uses = 1
        case .hintRevealer: uses = 1
        }
        
        activePowerUps.append(ActivePowerUp(type: type, activatedAt: Date(), remainingUses: uses))
        cleanupExpired()
    }
    
    func consumeUse(of type: PowerUpType) {
        if let index = activePowerUps.firstIndex(where: { $0.type == type && !$0.isExpired }) {
            activePowerUps[index].remainingUses -= 1
        }
        cleanupExpired()
    }
    
    func cleanupExpired() {
        activePowerUps.removeAll { $0.isExpired }
    }
    
    func remainingUses(for type: PowerUpType) -> Int {
        activePowerUps.first { $0.type == type && !$0.isExpired }?.remainingUses ?? 0
    }
}
