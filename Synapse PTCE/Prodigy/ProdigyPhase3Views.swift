//
//  ProdigyPhase3Views.swift
//  Synapse PTCE
//
//  UI components for Phase 3 Prodigy features:
//  • Leaderboards
//  • Friend Challenges
//  • Seasonal Events
//  • Profile Customization
//  • Share Sheets
//

import SwiftUI
import GameKit

// MARK: - Leaderboard View

struct LeaderboardView: View {
    @State private var selectedScope: LeaderboardScope = .weekly
    @State private var entries: [GKLeaderboard.Entry] = []
    @State private var isLoading = true
    @Environment(\.appTheme) private var theme
    
    enum LeaderboardScope: String, CaseIterable {
        case weekly = "Weekly XP"
        case allTime = "All-Time XP"
        case perfect = "Perfect Nodes"
        case streak = "Study Streak"
        
        var leaderboardID: String {
            switch self {
            case .weekly: return GameCenterManager.LeaderboardID.weeklyXP
            case .allTime: return GameCenterManager.LeaderboardID.totalXP
            case .perfect: return GameCenterManager.LeaderboardID.perfectNodes
            case .streak: return GameCenterManager.LeaderboardID.studyStreak
            }
        }
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Scope picker
                Picker("Leaderboard", selection: $selectedScope) {
                    ForEach(LeaderboardScope.allCases, id: \.self) { scope in
                        Text(scope.rawValue).tag(scope)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                if isLoading {
                    Spacer()
                    ProgressView()
                        .scaleEffect(1.5)
                    Spacer()
                } else if entries.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "person.3.fill")
                            .font(.system(size: 50))
                            .foregroundColor(theme.secondaryText)
                        Text("No leaderboard data yet")
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        Text("Be the first to compete!")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(theme.secondaryText.opacity(0.7))
                    }
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(Array(entries.enumerated()), id: \.offset) { index, entry in
                                LeaderboardRow(
                                    rank: index + 1,
                                    entry: entry,
                                    isLocalPlayer: entry.player.gamePlayerID == GKLocalPlayer.local.gamePlayerID
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Leaderboards")
        .inlineNavigationTitle()
        .onChange(of: selectedScope) { _, _ in
            loadLeaderboard()
        }
        .onAppear {
            loadLeaderboard()
        }
    }
    
    private func loadLeaderboard() {
        isLoading = true
        GameCenterManager.shared.loadLeaderboard(selectedScope.leaderboardID) { loadedEntries in
            entries = loadedEntries
            isLoading = false
        }
    }
}

struct LeaderboardRow: View {
    let rank: Int
    let entry: GKLeaderboard.Entry
    let isLocalPlayer: Bool
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 12) {
            // Rank badge
            ZStack {
                Circle()
                    .fill(rankColor.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Text("\(rank)")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(rankColor)
            }
            
            // Player info
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.player.displayName)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(isLocalPlayer ? Color.cyan : theme.primaryText)
                
                if isLocalPlayer {
                    Text("YOU")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.cyan)
                }
            }
            
            Spacer()
            
            // Score
            Text("\(entry.score)")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .foregroundColor(rankColor)
        }
        .padding(12)
        .background(isLocalPlayer ? Color.cyan.opacity(0.1) : theme.surface)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isLocalPlayer ? Color.cyan : theme.divider, lineWidth: isLocalPlayer ? 2 : 1)
        )
    }
    
    private var rankColor: Color {
        switch rank {
        case 1: return Color(red: 1.0, green: 0.84, blue: 0.0) // Gold
        case 2: return Color(red: 0.75, green: 0.75, blue: 0.75) // Silver
        case 3: return Color(red: 0.8, green: 0.5, blue: 0.2) // Bronze
        default: return theme.primaryText
        }
    }
}

// MARK: - Friend Challenge View

struct FriendChallengeView: View {
    @Bindable var engine: GameEngine
    @State private var friends: [GKPlayer] = []
    @State private var selectedFriend: GKPlayer?
    @State private var selectedChallengeType: FriendChallengeType = .weeklyXP
    @State private var showChallengePicker = false
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CHALLENGE FRIENDS")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                        Text("Compete with Game Center friends")
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    Spacer()
                }
                .padding(16)
                .background(theme.surface)
                
                if friends.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "person.2.slash")
                            .font(.system(size: 50))
                            .foregroundColor(theme.secondaryText)
                        Text("No Game Center friends")
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        Text("Add friends in Game Center to challenge them!")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(theme.secondaryText.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(friends, id: \.gamePlayerID) { friend in
                                FriendCard(friend: friend) {
                                    selectedFriend = friend
                                    showChallengePicker = true
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Challenges")
        .inlineNavigationTitle()
        .sheet(isPresented: $showChallengePicker) {
            if let friend = selectedFriend {
                ChallengePicker(friend: friend, onSend: { type, target in
                    sendChallenge(to: friend, type: type, target: target)
                    showChallengePicker = false
                })
            }
        }
        .onAppear {
            friends = GameCenterManager.shared.friends
        }
    }
    
    private func sendChallenge(to friend: GKPlayer, type: FriendChallengeType, target: Int) {
        let message = "I challenge you to \(type.displayName)!"
        GameCenterManager.shared.sendChallenge(to: friend.gamePlayerID, message: message)
    }
}

struct FriendCard: View {
    let friend: GKPlayer
    let onChallenge: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 12) {
            // Avatar placeholder
            ZStack {
                Circle()
                    .fill(Color.cyan.opacity(0.2))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "person.fill")
                    .foregroundColor(Color.cyan)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(friend.displayName)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text("Game Center Friend")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
            
            Spacer()
            
            Button(action: onChallenge) {
                Text("CHALLENGE")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
        .padding(12)
        .background(theme.surface)
        .cornerRadius(10)
    }
}

struct ChallengePicker: View {
    let friend: GKPlayer
    let onSend: (FriendChallengeType, Int) -> Void
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme
    @State private var selectedType: FriendChallengeType = .weeklyXP
    @State private var targetValue: Int = 1000
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.background.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Friend info
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(Color.cyan.opacity(0.2))
                                .frame(width: 80, height: 80)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.cyan)
                        }
                        
                        Text(friend.displayName)
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                    }
                    .padding(.top, 24)
                    
                    // Challenge type picker
                    VStack(alignment: .leading, spacing: 12) {
                        Text("CHALLENGE TYPE")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        
                        ForEach(FriendChallengeType.allCases, id: \.self) { type in
                            ChallengeTypeCard(
                                type: type,
                                isSelected: selectedType == type
                            ) {
                                selectedType = type
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Send button
                    Button(action: {
                        onSend(selectedType, targetValue)
                    }) {
                        Text("SEND CHALLENGE")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("New Challenge")
            .inlineNavigationTitle()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ChallengeTypeCard: View {
    let type: FriendChallengeType
    let isSelected: Bool
    let onSelect: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        Button(action: onSelect) {
            HStack(spacing: 12) {
                Image(systemName: type.icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? Color.orange : theme.secondaryText)
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(type.displayName)
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .foregroundColor(theme.primaryText)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.orange)
                }
            }
            .padding(12)
            .background(isSelected ? Color.orange.opacity(0.1) : theme.surface)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.orange : theme.divider, lineWidth: isSelected ? 2 : 1)
            )
        }
    }
}

// MARK: - Profile Customization View

struct ProfileCustomizationView: View {
    @Bindable var engine: GameEngine
    @Environment(\.appTheme) private var theme
    @State private var selectedTab: CustomizationTab = .badges
    
    enum CustomizationTab: String, CaseIterable {
        case badges = "Badges"
        case frames = "Frames"
        case effects = "Effects"
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Tab picker
                Picker("Customize", selection: $selectedTab) {
                    ForEach(CustomizationTab.allCases, id: \.self) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                // Content
                ScrollView {
                    LazyVStack(spacing: 12) {
                        switch selectedTab {
                        case .badges:
                            BadgesGrid(engine: engine)
                        case .frames:
                            FramesGrid(engine: engine)
                        case .effects:
                            EffectsGrid(engine: engine)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Customize Profile")
        .inlineNavigationTitle()
    }
}

struct BadgesGrid: View {
    @Bindable var engine: GameEngine
    @Environment(\.appTheme) private var theme
    
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 12)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(ProfileBadge.allCases, id: \.self) { badge in
                BadgeCard(badge: badge, isUnlocked: engine.isBadgeUnlocked(badge))
            }
        }
    }
}

struct BadgeCard: View {
    let badge: ProfileBadge
    let isUnlocked: Bool
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(isUnlocked ? badge.color.opacity(0.2) : theme.divider)
                    .frame(width: 60, height: 60)
                
                Image(systemName: badge.icon)
                    .font(.system(size: 28))
                    .foregroundColor(isUnlocked ? badge.color : theme.secondaryText)
            }
            
            Text(badge.displayName)
                .font(.system(size: 10, weight: .semibold, design: .monospaced))
                .foregroundColor(isUnlocked ? theme.primaryText : theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            if !isUnlocked {
                Text(badge.description)
                    .font(.system(size: 8, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .frame(height: 120)
        .padding(8)
        .background(theme.surface)
        .cornerRadius(10)
        .opacity(isUnlocked ? 1.0 : 0.5)
    }
}

struct FramesGrid: View {
    @Bindable var engine: GameEngine
    
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 12)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(AvatarFrame.allCases, id: \.self) { frame in
                FrameCard(frame: frame, isUnlocked: engine.isFrameUnlocked(frame))
            }
        }
    }
}

struct FrameCard: View {
    let frame: AvatarFrame
    let isUnlocked: Bool
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(spacing: 8) {
            // Frame preview
            ZStack {
                Circle()
                    .stroke(isUnlocked ? frame.color : theme.divider, lineWidth: 4)
                    .frame(width: 60, height: 60)
                
                Image(systemName: "person.fill")
                    .foregroundColor(isUnlocked ? theme.primaryText : theme.secondaryText)
            }
            
            Text(frame.displayName)
                .font(.system(size: 10, weight: .semibold, design: .monospaced))
                .foregroundColor(isUnlocked ? theme.primaryText : theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(frame.unlockRequirement)
                .font(.system(size: 8, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(height: 120)
        .padding(8)
        .background(theme.surface)
        .cornerRadius(10)
        .opacity(isUnlocked ? 1.0 : 0.5)
    }
}

struct EffectsGrid: View {
    @Bindable var engine: GameEngine
    @Environment(\.appTheme) private var theme
    
    let columns = [
        GridItem(.adaptive(minimum: 140, maximum: 180), spacing: 12)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(BackgroundEffect.allCases, id: \.self) { effect in
                EffectCard(
                    effect: effect,
                    isUnlocked: engine.isEffectUnlocked(effect),
                    onPurchase: {
                        engine.purchaseBackgroundEffect(effect)
                    }
                )
            }
        }
    }
}

struct EffectCard: View {
    let effect: BackgroundEffect
    let isUnlocked: Bool
    let onPurchase: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(spacing: 8) {
            // Effect preview (placeholder)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(theme.divider)
                    .frame(height: 60)
                
                Text(effect.displayName)
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
            }
            
            if isUnlocked {
                Text("UNLOCKED")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(Color.green)
            } else {
                Button(action: onPurchase) {
                    HStack(spacing: 4) {
                        Text("\(effect.cost)")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 10))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.purple)
                    .cornerRadius(6)
                }
            }
        }
        .padding(8)
        .background(theme.surface)
        .cornerRadius(10)
    }
}

// MARK: - Seasonal Event Banner

struct SeasonalEventBanner: View {
    let event: SeasonalEvent
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "gift.fill")
                .font(.system(size: 24))
                .foregroundColor(accentColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(event.name)
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text("\(event.daysRemaining) DAYS LEFT")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
            }
            
            Spacer()
            
            Text("\(Int(event.bonusXPMultiplier * 100))% XP")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(Color.yellow)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(6)
        }
        .padding(12)
        .background(accentColor.opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(accentColor, lineWidth: 2)
        )
    }
}
