//
//  ProdigyViews.swift
//  Synapse PTCE
//
//  UI components for Phase 1 Prodigy features:
//  • Daily Quest Panel
//  • Achievement Display
//  • Streak Tracker Widget
//  • Notification Popups
//

import SwiftUI

// MARK: - Daily Quest Panel

struct DailyQuestPanel: View {
    @Bindable var engine: GameEngine
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: "star.circle.fill")
                    .foregroundColor(engine.currentTheme.accentColor)
                Text("DAILY QUESTS")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                Spacer()
                
                // Time until reset
                if let expiry = engine.dailyQuests.first?.expiresAt {
                    let remaining = Calendar.current.dateComponents([.hour, .minute],
                                                                   from: Date(),
                                                                   to: expiry)
                    Text("RESETS IN \(remaining.hour ?? 0)H \(remaining.minute ?? 0)M")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
            }
            
            // Quest cards
            if engine.dailyQuests.isEmpty {
                Text("No quests available — check back tomorrow!")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .padding(.vertical, 8)
            } else {
                ForEach(engine.dailyQuests) { quest in
                    DailyQuestCard(quest: quest, accentColor: engine.currentTheme.accentColor)
                }
            }
        }
        .padding(16)
        .background(theme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(engine.currentTheme.accentColor.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(8)
    }
}

struct DailyQuestCard: View {
    let quest: DailyQuest
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Image(systemName: quest.type.icon)
                    .foregroundColor(quest.isComplete ? accentColor : theme.secondaryText)
                    .frame(width: 20)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(quest.type.title)
                        .font(.system(size: 12, weight: .semibold, design: .monospaced))
                        .foregroundColor(theme.primaryText)
                    Text(quest.type.description)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
                
                Spacer()
                
                // Rewards
                VStack(alignment: .trailing, spacing: 2) {
                    HStack(spacing: 4) {
                        Text("+\(quest.type.rewards.xp)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                        Text("XP")
                            .font(.system(size: 9, design: .monospaced))
                    }
                    .foregroundColor(accentColor)
                    
                    HStack(spacing: 4) {
                        Text("+\(quest.type.rewards.shards)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 8))
                    }
                    .foregroundColor(Color.cyan)
                }
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(theme.divider)
                        .frame(height: 4)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(quest.isComplete ? accentColor : accentColor.opacity(0.6))
                        .frame(width: geo.size.width * quest.progressPercent, height: 4)
                        .animation(.easeOut(duration: 0.3), value: quest.progressPercent)
                }
            }
            .frame(height: 4)
            
            // Progress text
            HStack {
                Text(quest.progressText)
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                
                if quest.isComplete {
                    Spacer()
                    Text("✓ COMPLETE")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(accentColor)
                }
            }
        }
        .padding(10)
        .background(theme.surfaceSecondary)
        .cornerRadius(6)
    }
}

// MARK: - Achievement Grid

fileprivate struct AchievementGridView: View {
    let achievements: [Achievement]
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    let columns = [
        GridItem(.adaptive(minimum: 140, maximum: 180), spacing: 12)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(achievements) { achievement in
                    AchievementCard(achievement: achievement, accentColor: accentColor)
                }
            }
            .padding(16)
        }
    }
}

struct AchievementCard: View {
    let achievement: Achievement
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(spacing: 8) {
            // Icon
            ZStack {
                Circle()
                    .fill(achievement.isUnlocked
                          ? achievement.type.rarity.color.opacity(0.2)
                          : theme.divider)
                    .frame(width: 60, height: 60)
                
                Image(systemName: achievement.type.icon)
                    .font(.system(size: 28))
                    .foregroundColor(achievement.isUnlocked
                                    ? achievement.type.rarity.color
                                    : theme.secondaryText)
            }
            
            // Title
            Text(achievement.type.title)
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(achievement.isUnlocked ? theme.primaryText : theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            // Description
            Text(achievement.type.description)
                .font(.system(size: 9, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            // Rarity badge
            Text(achievement.type.rarity.label)
                .font(.system(size: 8, weight: .bold, design: .monospaced))
                .foregroundColor(achievement.type.rarity.color)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(achievement.type.rarity.color.opacity(0.15))
                .cornerRadius(3)
            
            // Rewards
            if achievement.isUnlocked {
                HStack(spacing: 6) {
                    HStack(spacing: 2) {
                        Text("+\(achievement.type.rewards.xp)")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                        Text("XP")
                            .font(.system(size: 8, design: .monospaced))
                    }
                    .foregroundColor(accentColor)
                    
                    HStack(spacing: 2) {
                        Text("+\(achievement.type.rewards.shards)")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 7))
                    }
                    .foregroundColor(Color.cyan)
                }
            } else {
                Text("LOCKED")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(theme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(achievement.isUnlocked
                       ? achievement.type.rarity.color.opacity(0.5)
                       : theme.divider,
                       lineWidth: 1)
        )
        .cornerRadius(8)
        .opacity(achievement.isUnlocked ? 1.0 : 0.5)
    }
}

// MARK: - Streak Widget (Hub Display)

struct StreakWidget: View {
    let streakData: StreakData
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 12) {
            // Flame icon
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Text(streakData.streakEmoji)
                    .font(.system(size: 20))
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(streakData.currentStreak)-DAY STREAK")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                if let next = streakData.nextMilestone() {
                    Text("\(next - streakData.currentStreak) days to next milestone")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                } else {
                    Text("MAX STREAK ACHIEVED!")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(accentColor)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("BEST: \(streakData.longestStreak)")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
                Text("\(streakData.totalStudyDays) TOTAL DAYS")
                    .font(.system(size: 8, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
        }
        .padding(12)
        .background(theme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(8)
    }
}

// MARK: - Achievement Unlock Popup

struct AchievementUnlockPopup: View {
    let achievement: Achievement
    let onDismiss: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        ZStack {
            // Backdrop
            Color.black.opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture { onDismiss() }
            
            // Card
            VStack(spacing: 16) {
                // Trophy icon
                ZStack {
                    Circle()
                        .fill(achievement.type.rarity.color.opacity(0.2))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: achievement.type.icon)
                        .font(.system(size: 50))
                        .foregroundColor(achievement.type.rarity.color)
                }
                .shadow(color: achievement.type.rarity.color.opacity(0.5), radius: 20)
                
                Text("ACHIEVEMENT UNLOCKED!")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(achievement.type.rarity.color)
                
                VStack(spacing: 4) {
                    Text(achievement.type.title)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.primaryText)
                        .multilineTextAlignment(.center)
                    
                    Text(achievement.type.description)
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .multilineTextAlignment(.center)
                }
                
                // Rarity badge
                Text(achievement.type.rarity.label)
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(achievement.type.rarity.color)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(achievement.type.rarity.color.opacity(0.2))
                    .cornerRadius(4)
                
                // Rewards
                HStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Text("+\(achievement.type.rewards.xp)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.yellow)
                        Text("XP EARNED")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 4) {
                            Text("+\(achievement.type.rewards.shards)")
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                            Image(systemName: "diamond.fill")
                                .font(.system(size: 14))
                        }
                        .foregroundColor(Color.cyan)
                        
                        Text("SHARDS EARNED")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                
                Button(action: onDismiss) {
                    Text("CONTINUE")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.background)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(achievement.type.rarity.color)
                        .cornerRadius(8)
                }
            }
            .padding(24)
            .background(theme.surface)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(achievement.type.rarity.color, lineWidth: 2)
            )
            .shadow(color: .black.opacity(0.5), radius: 30)
            .padding(32)
        }
        .transition(.opacity.combined(with: .scale(scale: 0.8)))
    }
}

// MARK: - Streak Milestone Popup

struct StreakMilestonePopup: View {
    let days: Int
    let xp: Int
    let shards: Int
    let onClaim: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture { onClaim() }
            
            VStack(spacing: 16) {
                // Fire icon
                Text("🔥🔥🔥")
                    .font(.system(size: 60))
                
                Text("STREAK MILESTONE!")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.orange)
                
                Text("\(days) DAYS IN A ROW")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text("Your dedication is paying off!")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                
                // Rewards
                HStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Text("+\(xp)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.yellow)
                        Text("XP")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 4) {
                            Text("+\(shards)")
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                            Image(systemName: "diamond.fill")
                                .font(.system(size: 14))
                        }
                        .foregroundColor(Color.cyan)
                        
                        Text("SHARDS")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                
                Button(action: onClaim) {
                    Text("CLAIM REWARD")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
            .padding(24)
            .background(theme.surface)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.orange, lineWidth: 2)
            )
            .shadow(color: .black.opacity(0.5), radius: 30)
            .padding(32)
        }
        .transition(.opacity.combined(with: .scale(scale: 0.8)))
    }
}

// MARK: - Quest Completion Banner

struct QuestCompletionBanner: View {
    let quest: DailyQuest
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(Color.green)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("QUEST COMPLETE!")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.green)
                
                Text(quest.type.title)
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Text("+\(quest.type.rewards.xp) XP")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
                
                HStack(spacing: 2) {
                    Text("+\(quest.type.rewards.shards)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                    Image(systemName: "diamond.fill")
                        .font(.system(size: 9))
                }
                .foregroundColor(Color.cyan)
            }
        }
        .padding(12)
        .background(theme.surface)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.3), radius: 10)
    }
}
