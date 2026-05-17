//
//  FirewatchAchievements.swift
//  Synapse PTCE
//
//  Firewatch-themed achievement names and descriptions
//  Works alongside existing AchievementType system
//

import Foundation
import SwiftUI

extension AchievementType {
    
    /// Firewatch-themed title (nature/ranger focus)
    var firewatchTitle: String {
        switch self {
        // Beginner achievements
        case .firstSteps: return "First Patrol"
        case .tenNodes: return "Trail Blazer"
        case .firstPerfect: return "Eagle Eye"
        case .firstBoss: return "Smoke Jumper"
        
        // Skill achievements
        case .perfectStreak5: return "Hot Streak"
        case .perfectStreak10: return "Unstoppable Force"
        case .speedDemon: return "Wilderness Sprint"
        case .noMistakes: return "Flawless Ranger"
        
        // Persistence achievements
        case .streak3Days: return "Weekend Warrior"
        case .streak7Days: return "Week in the Woods"
        case .streak14Days: return "Two-Week Veteran"
        case .streak30Days: return "Seasonal Ranger"
        
        // Domain mastery
        case .domainMasterD1: return "Pharmacology Expert"
        case .domainMasterD2: return "Legal Guardian"
        case .domainMasterD3: return "Safety Specialist"
        case .domainMasterD4: return "Processing Pro"
        
        // Collection achievements
        case .shardCollector100: return "Token Collector"
        case .shardCollector500: return "Ember Keeper"
        case .shardCollector1000: return "Fire Warden"
        
        // Exam readiness
        case .examReady: return "Ranger Certified"
        case .allBossesDefeated: return "Fire Chief"
        
        // Special achievements
        case .nightOwl: return "Night Watch"
        case .earlyBird: return "Dawn Patrol"
        }
    }
    
    /// Firewatch-themed description
    var firewatchDescription: String {
        switch self {
        case .firstSteps: return "Complete your first lookout survey"
        case .tenNodes: return "Complete 10 lookout towers"
        case .firstPerfect: return "Achieve a perfect survey at any lookout"
        case .firstBoss: return "Contain your first wildfire crisis"
        case .perfectStreak5: return "Complete 5 lookouts perfectly in a row"
        case .perfectStreak10: return "Complete 10 lookouts perfectly in a row"
        case .speedDemon: return "Answer 10 questions in under 30 seconds each"
        case .noMistakes: return "Complete 20 lookouts without a single error"
        case .streak3Days: return "Patrol for 3 consecutive days"
        case .streak7Days: return "Patrol for 7 consecutive days"
        case .streak14Days: return "Patrol for 14 consecutive days"
        case .streak30Days: return "Patrol for 30 consecutive days"
        case .domainMasterD1: return "Master all Sector 1 lookouts"
        case .domainMasterD2: return "Master all Sector 2 lookouts"
        case .domainMasterD3: return "Master all Sector 3 lookouts"
        case .domainMasterD4: return "Master all Sector 4 lookouts"
        case .shardCollector100: return "Collect 100 Fire Tokens"
        case .shardCollector500: return "Collect 500 Fire Tokens"
        case .shardCollector1000: return "Collect 1000 Fire Tokens"
        case .examReady: return "Complete a full 90-question certification exam"
        case .allBossesDefeated: return "Contain all four sector wildfires"
        case .nightOwl: return "Patrol between 10 PM and 2 AM"
        case .earlyBird: return "Patrol before 7 AM"
        }
    }
    
    /// Firewatch-themed icon
    var firewatchIcon: String {
        switch self {
        case .firstSteps: return "figure.hiking"
        case .tenNodes: return "signpost.right.fill"
        case .firstPerfect: return "binoculars.fill"
        case .firstBoss: return "flame.circle.fill"
        case .perfectStreak5: return "flame"
        case .perfectStreak10: return "flame.fill"
        case .speedDemon: return "hare.fill"
        case .noMistakes: return "checkmark.seal.fill"
        case .streak3Days: return "calendar.badge.plus"
        case .streak7Days: return "calendar.circle.fill"
        case .streak14Days: return "calendar.badge.checkmark"
        case .streak30Days: return "laurel.leading"
        case .domainMasterD1: return "cross.vial.fill"
        case .domainMasterD2: return "scroll.fill"
        case .domainMasterD3: return "cross.case.fill"
        case .domainMasterD4: return "clipboard.fill"
        case .shardCollector100: return "fireplace.fill"
        case .shardCollector500: return "fireplace.fill"
        case .shardCollector1000: return "fireplace.fill"
        case .examReady: return "medal.fill"
        case .allBossesDefeated: return "shield.lefthalf.filled.badge.checkmark"
        case .nightOwl: return "moon.stars.fill"
        case .earlyBird: return "sunrise.fill"
        }
    }
    
    /// Get title based on current theme
    func title(for theme: AppThemeMode) -> String {
        theme == .firewatch ? firewatchTitle : title
    }

    /// Get description based on current theme
    func achievementDescription(for theme: AppThemeMode) -> String {
        theme == .firewatch ? firewatchDescription : description
    }

    /// Get icon based on current theme
    func achievementIcon(for theme: AppThemeMode) -> String {
        theme == .firewatch ? firewatchIcon : icon
    }
}

// MARK: - Firewatch Achievement Card View

struct FirewatchAchievementCard: View {
    let achievement: Achievement
    var themeManager: ThemeManager
    
    private var accent: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.sunset : SynapseColors.neonOrange
    }
    
    private var bg: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.forestDark : SynapseColors.gridGray
    }
    
    private var textColor: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Icon
            ZStack {
                Circle()
                    .fill(achievement.isUnlocked ? accent.opacity(0.2) : bg.opacity(0.5))
                    .frame(width: 70, height: 70)
                
                Image(systemName: achievement.type.achievementIcon(for: themeManager.currentTheme))
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(achievement.isUnlocked ? accent : textColor.opacity(0.3))
            }
            
            // Rarity badge
            Text(achievement.type.rarity.label)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundStyle(achievement.type.rarity.color)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(
                    Capsule()
                        .fill(achievement.type.rarity.color.opacity(0.2))
                )
            
            // Title
            Text(achievement.type.title(for: themeManager.currentTheme))
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(achievement.isUnlocked ? textColor : textColor.opacity(0.5))
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            // Description
            Text(achievement.type.achievementDescription(for: themeManager.currentTheme))
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .foregroundStyle(achievement.isUnlocked ? textColor.opacity(0.7) : textColor.opacity(0.4))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            Spacer()
            
            // Rewards
            if achievement.isUnlocked {
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 11))
                        Text("\(achievement.type.rewards.xp)")
                            .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    }
                    .foregroundStyle(FirewatchColors.goldenHour)
                    
                    HStack(spacing: 4) {
                        Image(systemName: themeManager.currentTheme == .firewatch ? "fireplace.fill" : "diamond.fill")
                            .font(.system(size: 11))
                        Text("\(achievement.type.rewards.shards)")
                            .font(.system(size: 13, weight: .semibold, design: .monospaced))
                    }
                    .foregroundStyle(accent)
                }
                .padding(.top, 4)
            } else {
                Image(systemName: "lock.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(textColor.opacity(0.3))
                    .padding(.top, 4)
            }
        }
        .padding(16)
        .frame(width: 160, height: 220)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(bg)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            achievement.isUnlocked ? accent.opacity(0.4) : textColor.opacity(0.1),
                            lineWidth: achievement.isUnlocked ? 2 : 1
                        )
                )
        )
        .shadow(
            color: achievement.isUnlocked ? accent.opacity(0.2) : .clear,
            radius: 12,
            y: 4
        )
        .opacity(achievement.isUnlocked ? 1.0 : 0.7)
        .scaleEffect(achievement.isUnlocked ? 1.0 : 0.95)
    }
}

// MARK: - Achievement Grid View

fileprivate struct AchievementGridView: View {
    let achievements: [Achievement]
    var themeManager: ThemeManager
    
    private var bg: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.nightSky : SynapseColors.darkBg
    }
    
    private var textColor: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]
    
    var body: some View {
        ZStack {
            bg.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(themeManager.currentTheme == .firewatch ? "Ranger Badges" : "Achievements")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(textColor)
                        
                        Text("\(achievements.filter(\.isUnlocked).count) of \(achievements.count) unlocked")
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                            .foregroundStyle(textColor.opacity(0.7))
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    
                    // Achievement grid
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(achievements) { achievement in
                            FirewatchAchievementCard(
                                achievement: achievement,
                                themeManager: themeManager
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

// MARK: - Achievement Unlock Animation

struct AchievementUnlockView: View {
    let achievement: Achievement
    var themeManager: ThemeManager
    let onDismiss: () -> Void
    
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    @State private var shimmer: Bool = false
    
    private var accent: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.sunset : SynapseColors.neonOrange
    }
    
    private var bg: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.forestDark : SynapseColors.darkBg
    }
    
    private var textColor: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.85)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Badge icon with glow
                ZStack {
                    // Outer glow
                    Circle()
                        .fill(accent.opacity(shimmer ? 0.3 : 0.1))
                        .frame(width: 140, height: 140)
                        .scaleEffect(shimmer ? 1.2 : 1.0)
                    
                    // Middle ring
                    Circle()
                        .fill(accent.opacity(0.2))
                        .frame(width: 110, height: 110)
                    
                    // Icon background
                    Circle()
                        .fill(bg)
                        .frame(width: 90, height: 90)
                    
                    // Icon
                    Image(systemName: achievement.type.achievementIcon(for: themeManager.currentTheme))
                        .font(.system(size: 44, weight: .bold))
                        .foregroundStyle(accent)
                }
                .shadow(color: accent.opacity(0.6), radius: 30)
                
                // Rarity badge
                Text(achievement.type.rarity.label)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundStyle(achievement.type.rarity.color)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(achievement.type.rarity.color.opacity(0.2))
                            .overlay(
                                Capsule()
                                    .stroke(achievement.type.rarity.color, lineWidth: 1)
                            )
                    )
                
                // Title
                Text(themeManager.currentTheme == .firewatch ? "Badge Unlocked!" : "Achievement Unlocked!")
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundStyle(textColor.opacity(0.7))
                    .textCase(.uppercase)
                
                Text(achievement.type.title(for: themeManager.currentTheme))
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(textColor)
                    .multilineTextAlignment(.center)
                
                // Description
                Text(achievement.type.achievementDescription(for: themeManager.currentTheme))
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundStyle(textColor.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 30)
                
                // Rewards
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 20))
                            .foregroundStyle(FirewatchColors.goldenHour)
                        Text("+\(achievement.type.rewards.xp)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundStyle(FirewatchColors.goldenHour)
                        Text(themeManager.xpLabel)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(textColor.opacity(0.6))
                    }
                    
                    VStack(spacing: 6) {
                        Image(systemName: themeManager.currentTheme == .firewatch ? "fireplace.fill" : "diamond.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(accent)
                        Text("+\(achievement.type.rewards.shards)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundStyle(accent)
                        Text(themeManager.shardsLabel)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(textColor.opacity(0.6))
                    }
                }
                .padding(.top, 12)
                
                // Continue button
                Button(action: onDismiss) {
                    Text("Continue")
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(accent)
                        )
                }
                .shadow(color: accent.opacity(0.4), radius: 12, y: 4)
                .padding(.top, 8)
            }
            .padding(32)
            .frame(maxWidth: 440)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(bg)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(accent.opacity(0.4), lineWidth: 2)
                    )
            )
            .shadow(color: .black.opacity(0.6), radius: 40, y: 20)
            .scaleEffect(scale)
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                scale = 1.0
                opacity = 1.0
            }
            
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                shimmer = true
            }
        }
    }
}
