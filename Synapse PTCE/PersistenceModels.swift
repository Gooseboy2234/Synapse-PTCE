//
//  PersistenceModels.swift
//  Synapse PTCE
//
//  v9.0 — Adds GameMode, AppAppearance, AppTheme, NodeAngle, StoryProgress.
//

import Foundation
import SwiftUI
import SwiftData

// MARK: - System Rank

enum SystemRank: Int, CaseIterable, Codable {
    case externalObserver  = 0
    case signalApprentice  = 1
    case dataCourier       = 2
    case protocolAnalyst   = 3
    case networkOperative  = 4
    case systemsEngineer   = 5
    case domainController  = 6
    case coreArchitect     = 7
    case neuralCommander   = 8
    case masterArchitect   = 9

    var title: String {
        switch self {
        case .externalObserver: return "EXTERNAL OBSERVER"
        case .signalApprentice: return "SIGNAL APPRENTICE"
        case .dataCourier:      return "DATA COURIER"
        case .protocolAnalyst:  return "PROTOCOL ANALYST"
        case .networkOperative: return "NETWORK OPERATIVE"
        case .systemsEngineer:  return "SYSTEMS ENGINEER"
        case .domainController: return "DOMAIN CONTROLLER"
        case .coreArchitect:    return "CORE ARCHITECT"
        case .neuralCommander:  return "NEURAL COMMANDER"
        case .masterArchitect:  return "MASTER ARCHITECT"
        }
    }

    var badge: String { "RANK-0\(rawValue)" }

    var xpThreshold: Int {
        switch self {
        case .externalObserver: return 0
        case .signalApprentice: return 300
        case .dataCourier:      return 900
        case .protocolAnalyst:  return 2_000
        case .networkOperative: return 3_500
        case .systemsEngineer:  return 5_500
        case .domainController: return 8_000
        case .coreArchitect:    return 11_500
        case .neuralCommander:  return 16_000
        case .masterArchitect:  return 22_000
        }
    }

    var next: SystemRank? { SystemRank(rawValue: rawValue + 1) }

    static func rank(for xp: Int) -> SystemRank {
        SystemRank.allCases.last(where: { $0.xpThreshold <= xp }) ?? .externalObserver
    }
}

// MARK: - Mastery Level

enum MasteryLevel: Int, Codable {
    case locked     = 0
    case available  = 1
    case attempted  = 2
    case stabilized = 3
    case perfect    = 4
}

// MARK: - Theme

enum Theme: String, CaseIterable, Codable {
    case amber   = "AMBER"
    case cobalt  = "COBALT"
    case emerald = "EMERALD"
    case crimson = "CRIMSON"

    var displayName: String {
        switch self {
        case .amber:   return "AMBER PROTOCOL"
        case .cobalt:  return "COBALT SIGNAL"
        case .emerald: return "EMERALD CORE"
        case .crimson: return "CRIMSON ARRAY"
        }
    }

    var accentColor: Color {
        switch self {
        case .amber:   return Color(red: 1.00, green: 0.65, blue: 0.00)
        case .cobalt:  return Color(red: 0.25, green: 0.60, blue: 1.00)
        case .emerald: return Color(red: 0.15, green: 0.88, blue: 0.48)
        case .crimson: return Color(red: 0.95, green: 0.22, blue: 0.30)
        }
    }

    var isDefault: Bool { self == .amber }
    var cost: Int { isDefault ? 0 : 500 }
}

// MARK: - Game Mode

enum GameMode: String, CaseIterable, Codable {
    case prodigy = "PRODIGY"
    case timed   = "TIMED"

    var displayName: String {
        switch self {
        case .prodigy: return "Prodigy Mode"
        case .timed:   return "Emergency Override"
        }
    }

    var description: String {
        switch self {
        case .prodigy: return "Narrative journey. Untimed. Logic Probe active."
        case .timed:   return "High-pressure encounters with a 45-second countdown."
        }
    }

    var icon: String {
        switch self {
        case .prodigy: return "brain.head.profile"
        case .timed:   return "exclamationmark.triangle.fill"
        }
    }

    /// Seconds given per question in timed mode.
    var timerSeconds: Int { 45 }
}

// MARK: - App Appearance

enum AppAppearance: String, CaseIterable, Codable {
    case dark      = "DARK"
    case warmLight = "WARM_LIGHT"

    var displayName: String {
        switch self {
        case .dark:      return "Terminal Dark"
        case .warmLight: return "Warm Light"
        }
    }

    var description: String {
        switch self {
        case .dark:      return "High-contrast terminal aesthetic."
        case .warmLight: return "Mini Motorways warm cream palette."
        }
    }

    var icon: String {
        switch self {
        case .dark:      return "moon.fill"
        case .warmLight: return "sun.max.fill"
        }
    }
}

// MARK: - App Theme

/// Semantic colour tokens for the active appearance mode.
/// Injected via @Environment(\.appTheme) throughout the view tree.
struct AppTheme {
    let background: Color
    let surface: Color
    let surfaceSecondary: Color
    let primaryText: Color
    let secondaryText: Color
    let divider: Color
    let gridLine: Color
    let isDark: Bool

    // MARK: Dark — existing terminal aesthetic
    static let dark = AppTheme(
        background:       Color(red: 0.059, green: 0.059, blue: 0.059),
        surface:          Color(red: 0.098, green: 0.098, blue: 0.098),
        surfaceSecondary: Color(red: 0.137, green: 0.137, blue: 0.137),
        primaryText:      Color.white,
        secondaryText:    Color.white.opacity(0.50),
        divider:          Color.white.opacity(0.09),
        gridLine:         Color(red: 1.0, green: 0.65, blue: 0.0).opacity(0.05),
        isDark:           true
    )

    // MARK: Warm Light — Mini Motorways-inspired cream palette
    static let warmLight = AppTheme(
        background:       Color(red: 0.937, green: 0.922, blue: 0.878),  // #EFEBE0 cream
        surface:          Color(red: 0.961, green: 0.949, blue: 0.925),  // warm white
        surfaceSecondary: Color(red: 0.914, green: 0.898, blue: 0.871),  // slightly deeper cream
        primaryText:      Color(red: 0.173, green: 0.173, blue: 0.173),  // #2C2C2C charcoal
        secondaryText:    Color(red: 0.173, green: 0.173, blue: 0.173).opacity(0.48),
        divider:          Color(red: 0.173, green: 0.173, blue: 0.173).opacity(0.10),
        gridLine:         Color(red: 0.173, green: 0.173, blue: 0.173).opacity(0.035),
        isDark:           false
    )
}

// MARK: - AppTheme Environment Key

private struct AppThemeKey: EnvironmentKey {
    static let defaultValue = AppTheme.dark
}

extension EnvironmentValues {
    var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}

// MARK: - Node Angle

/// The pedagogical angle from which a DataNode's question approaches its topic.
/// Multiple angles on the same drug (Classification, Indication, Safety…) rotate
/// to build multi-dimensional recall.
enum NodeAngle: String, CaseIterable, Codable {
    case classification = "CLASS"
    case indication     = "INDICATION"
    case mechanism      = "MECHANISM"
    case safety         = "SAFETY"
    case dosing         = "DOSING"

    var label: String {
        switch self {
        case .classification: return "Classification"
        case .indication:     return "Indication"
        case .mechanism:      return "Mechanism"
        case .safety:         return "Safety/ADR"
        case .dosing:         return "Dosing/Admin"
        }
    }

    var badge: String {
        switch self {
        case .classification: return "CLASS"
        case .indication:     return "USE"
        case .mechanism:      return "MOA"
        case .safety:         return "SAFETY"
        case .dosing:         return "DOSE"
        }
    }
}

// MARK: - Probe Ability

enum ProbeAbility: String, Codable {
    case redundantCheck = "REDUNDANT_CHECK"

    var displayName: String { "Redundant Check" }
    var description: String  { "Eliminates one incorrect answer from the current encounter." }
    var iconName: String     { "cpu" }
}

// MARK: - Logic Probe

struct LogicProbe {
    let level: Int
    let xp: Int

    static let maxLevel = 5
    static let xpThresholds: [Int] = [0, 10, 25, 45, 70]

    var activeAbility: ProbeAbility? { level >= Self.maxLevel ? .redundantCheck : nil }
    var isMaxLevel: Bool { level >= Self.maxLevel }

    var progressToNextLevel: Double {
        guard level < Self.maxLevel else { return 1.0 }
        let bandStart = Double(Self.xpThresholds[level - 1])
        let bandEnd   = Double(Self.xpThresholds[level])
        guard bandEnd > bandStart else { return 1.0 }
        return (Double(xp) - bandStart) / (bandEnd - bandStart)
    }

    var xpToNextLevel: Int {
        guard level < Self.maxLevel else { return 0 }
        return Self.xpThresholds[level] - xp
    }

    static func from(xp: Int) -> LogicProbe {
        var lvl = 1
        for (i, threshold) in xpThresholds.enumerated() where xp >= threshold {
            lvl = i + 1
        }
        return LogicProbe(level: min(lvl, maxLevel), xp: xp)
    }
}

// MARK: - NodeProgress  (SwiftData Model)

@Model
final class NodeProgress {

    var persistenceKey: String   // uniqueness enforced by progressMap in GameEngine (CloudKit-compatible)
    var isUnlocked: Bool
    var isCompleted: Bool
    var masteryLevel: Int
    var wrongAttemptCount: Int

    init(persistenceKey: String, isUnlocked: Bool = false) {
        self.persistenceKey    = persistenceKey
        self.isUnlocked        = isUnlocked
        self.isCompleted       = false
        self.masteryLevel      = isUnlocked
            ? MasteryLevel.available.rawValue
            : MasteryLevel.locked.rawValue
        self.wrongAttemptCount = 0
    }

    var mastery: MasteryLevel { MasteryLevel(rawValue: masteryLevel) ?? .locked }
}

// MARK: - UserStats  (SwiftData Model)

@Model
final class UserStats {

    // MARK: Core RPG
    var totalXP: Int
    var dataShards: Int
    var stabilityScore: Int
    var nodesCompleted: Int
    var perfectNodes: Int
    var totalAttempts: Int

    // MARK: Logic Probe
    var probeXP: Int

    // MARK: Theme
    var activeThemeRaw: String
    var unlockedThemesRaw: String

    // MARK: Game Mode & Appearance
    var gameModeRaw: String
    var appearanceRaw: String

    // MARK: Story Progress
    /// Number of 5%-milestone story beats already shown to the user.
    var storyBeatsShown: Int

    // MARK: Boss State
    var bossStreakD1: Int;    var bossDefeatedD1: Bool
    var bossStreakD2: Int;    var bossDefeatedD2: Bool
    var bossStreakD3: Int;    var bossDefeatedD3: Bool
    var bossStreakD4: Int;    var bossDefeatedD4: Bool

    init() {
        totalXP           = 0
        dataShards        = 0
        stabilityScore    = 0
        nodesCompleted    = 0
        perfectNodes      = 0
        totalAttempts     = 0
        probeXP           = 0
        activeThemeRaw    = Theme.amber.rawValue
        unlockedThemesRaw = Theme.amber.rawValue
        gameModeRaw       = GameMode.prodigy.rawValue
        appearanceRaw     = AppAppearance.dark.rawValue
        storyBeatsShown   = 0
        bossStreakD1 = 0;  bossDefeatedD1 = false
        bossStreakD2 = 0;  bossDefeatedD2 = false
        bossStreakD3 = 0;  bossDefeatedD3 = false
        bossStreakD4 = 0;  bossDefeatedD4 = false
    }

    // MARK: Derived — Rank

    var systemRank: SystemRank { SystemRank.rank(for: totalXP) }

    var rankProgress: Double {
        let current = systemRank
        guard let next = current.next else { return 1.0 }
        let bandStart = Double(current.xpThreshold)
        let bandEnd   = Double(next.xpThreshold)
        guard bandEnd > bandStart else { return 1.0 }
        return (Double(totalXP) - bandStart) / (bandEnd - bandStart)
    }

    var xpToNextRank: Int {
        guard let next = systemRank.next else { return 0 }
        return max(0, next.xpThreshold - totalXP)
    }

    var accuracyRate: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(nodesCompleted) / Double(totalAttempts)
    }

    // MARK: Derived — Logic Probe
    var logicProbe: LogicProbe { LogicProbe.from(xp: probeXP) }

    // MARK: Derived — Theme
    var activeTheme: Theme { Theme(rawValue: activeThemeRaw) ?? .amber }

    var unlockedThemes: [Theme] {
        unlockedThemesRaw
            .components(separatedBy: ",")
            .compactMap { Theme(rawValue: $0.trimmingCharacters(in: .whitespaces)) }
    }

    func isThemeUnlocked(_ theme: Theme) -> Bool { unlockedThemes.contains(theme) }

    func unlockTheme(_ theme: Theme) {
        guard !isThemeUnlocked(theme) else { return }
        unlockedThemesRaw += ",\(theme.rawValue)"
    }

    // MARK: Derived — Game Mode & Appearance
    var gameMode: GameMode          { GameMode(rawValue: gameModeRaw) ?? .prodigy }
    var appAppearance: AppAppearance { AppAppearance(rawValue: appearanceRaw) ?? .dark }

    // MARK: Derived — Boss

    func bossStreak(for domain: KnowledgeDomain) -> Int {
        switch domain {
        case .medications:         return bossStreakD1
        case .federalRequirements: return bossStreakD2
        case .patientSafety:       return bossStreakD3
        case .orderEntry:          return bossStreakD4
        }
    }

    func setBossStreak(_ streak: Int, for domain: KnowledgeDomain) {
        switch domain {
        case .medications:         bossStreakD1 = streak
        case .federalRequirements: bossStreakD2 = streak
        case .patientSafety:       bossStreakD3 = streak
        case .orderEntry:          bossStreakD4 = streak
        }
    }

    func isBossDefeated(for domain: KnowledgeDomain) -> Bool {
        switch domain {
        case .medications:         return bossDefeatedD1
        case .federalRequirements: return bossDefeatedD2
        case .patientSafety:       return bossDefeatedD3
        case .orderEntry:          return bossDefeatedD4
        }
    }

    func defeatBoss(for domain: KnowledgeDomain) {
        switch domain {
        case .medications:         bossDefeatedD1 = true
        case .federalRequirements: bossDefeatedD2 = true
        case .patientSafety:       bossDefeatedD3 = true
        case .orderEntry:          bossDefeatedD4 = true
        }
    }
}
