//
//  ProdigyPhase2Views.swift
//  Synapse PTCE
//
//  UI components for Phase 2 Prodigy features:
//  • Power-Up Shop
//  • Chest Opening Animation
//  • Active Power-Up Display
//  • Weekly Report View
//  • Particle Effects
//

import SwiftUI

// MARK: - Power-Up Shop

struct PowerUpShopView: View {
    @Bindable var engine: GameEngine
    @Environment(\.appTheme) private var theme
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("POWER-UP SHOP")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                        Text("Spend Data Shards on consumable boosts")
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Text("\(engine.currentDataShards)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.cyan)
                        Image(systemName: "diamond.fill")
                            .foregroundColor(Color.cyan)
                    }
                }
                .padding(16)
                .background(theme.surface)
                
                // Power-up grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 12)
                    ], spacing: 12) {
                        ForEach(PowerUpType.allCases, id: \.self) { powerUp in
                            PowerUpCard(
                                powerUp: powerUp,
                                inventory: engine.userStats.powerUpInventory,
                                currentShards: engine.currentDataShards,
                                onPurchase: {
                                    engine.purchasePowerUp(powerUp)
                                }
                            )
                        }
                    }
                    .padding(16)
                }
            }
        }
        .navigationTitle("Power-Ups")
        .inlineNavigationTitle()
    }
}

struct PowerUpCard: View {
    let powerUp: PowerUpType
    let inventory: PowerUpInventory
    let currentShards: Int
    let onPurchase: () -> Void
    @Environment(\.appTheme) private var theme
    
    var canAfford: Bool {
        currentShards >= powerUp.cost
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Icon
            ZStack {
                Circle()
                    .fill(powerUp.color.opacity(0.2))
                    .frame(width: 70, height: 70)
                
                Image(systemName: powerUp.icon)
                    .font(.system(size: 32))
                    .foregroundColor(powerUp.color)
            }
            
            VStack(spacing: 4) {
                Text(powerUp.displayName)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                    .multilineTextAlignment(.center)
                
                Text(powerUp.description)
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // Owned count
            if inventory.count(for: powerUp) > 0 {
                Text("OWNED: \(inventory.count(for: powerUp))")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(powerUp.color)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(powerUp.color.opacity(0.15))
                    .cornerRadius(4)
            }
            
            Spacer()
            
            // Purchase button
            Button(action: onPurchase) {
                HStack(spacing: 4) {
                    Text("\(powerUp.cost)")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                    Image(systemName: "diamond.fill")
                        .font(.system(size: 10))
                }
                .foregroundColor(canAfford ? .white : theme.secondaryText)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(canAfford ? powerUp.color : theme.divider)
                .cornerRadius(8)
            }
            .disabled(!canAfford)
        }
        .padding(12)
        .frame(height: 240)
        .background(theme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(powerUp.color.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(12)
    }
}

// MARK: - Chest Opening View

struct ChestOpeningView: View {
    let chest: UnopenedChest
    let onOpen: (ChestReward) -> Void
    let onDismiss: () -> Void
    
    @State private var isOpening = false
    @State private var isOpened = false
    @State private var reward: ChestReward?
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .ignoresSafeArea()
                .onTapGesture {
                    if isOpened {
                        onDismiss()
                    }
                }
            
            if !isOpened {
                // Unopened chest
                VStack(spacing: 24) {
                    ZStack {
                        Circle()
                            .fill(chest.type.color.opacity(0.2))
                            .frame(width: 150, height: 150)
                            .scaleEffect(isOpening ? 1.2 : 1.0)
                            .opacity(isOpening ? 0 : 1)
                        
                        Image(systemName: chest.type.icon)
                            .font(.system(size: 80))
                            .foregroundColor(chest.type.color)
                            .rotationEffect(.degrees(isOpening ? 360 : 0))
                            .scaleEffect(isOpening ? 0.5 : 1.0)
                    }
                    .shadow(color: chest.type.color.opacity(0.5), radius: 30)
                    
                    VStack(spacing: 8) {
                        Text(chest.type.displayName)
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                            .foregroundColor(chest.type.color)
                        
                        Text("Tap to open")
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                .onTapGesture {
                    openChest()
                }
            } else if let reward = reward {
                // Opened chest - show rewards
                VStack(spacing: 24) {
                    Text("REWARDS!")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(chest.type.color)
                    
                    VStack(spacing: 16) {
                        // XP reward
                        HStack(spacing: 12) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 28))
                                .foregroundColor(Color.yellow)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("+\(reward.xp) XP")
                                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                                    .foregroundColor(Color.yellow)
                                Text("Experience Gained")
                                    .font(.system(size: 11, design: .monospaced))
                                    .foregroundColor(theme.secondaryText)
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(theme.surface)
                        .cornerRadius(12)
                        
                        // Shard reward
                        HStack(spacing: 12) {
                            Image(systemName: "diamond.fill")
                                .font(.system(size: 28))
                                .foregroundColor(Color.cyan)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("+\(reward.shards) Shards")
                                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                                    .foregroundColor(Color.cyan)
                                Text("Data Shards Earned")
                                    .font(.system(size: 11, design: .monospaced))
                                    .foregroundColor(theme.secondaryText)
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(theme.surface)
                        .cornerRadius(12)
                        
                        // Power-ups (if any)
                        if !reward.powerUps.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("BONUS ITEMS!")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(Color.purple)
                                
                                ForEach(reward.powerUps, id: \.rawValue) { powerUp in
                                    HStack(spacing: 8) {
                                        Image(systemName: powerUp.icon)
                                            .foregroundColor(powerUp.color)
                                        Text(powerUp.displayName)
                                            .font(.system(size: 13, weight: .semibold, design: .monospaced))
                                            .foregroundColor(theme.primaryText)
                                    }
                                }
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.purple.opacity(0.15))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Button(action: onDismiss) {
                        Text("COLLECT")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.horizontal, 48)
                            .padding(.vertical, 14)
                            .background(chest.type.color)
                            .cornerRadius(10)
                    }
                }
                .padding(24)
                .background(theme.background)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.5), radius: 30)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.7), value: isOpening)
        .animation(.spring(response: 0.6, dampingFraction: 0.7), value: isOpened)
    }
    
    private func openChest() {
        SoundEffectManager.shared.play(.nodeUnlock) // Reuse unlock sound
        
        withAnimation {
            isOpening = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let generatedReward = ChestDropCalculator.generateReward(for: chest.type)
            reward = generatedReward
            
            withAnimation {
                isOpened = true
                isOpening = false
            }
            
            onOpen(generatedReward)
            SoundEffectManager.shared.play(.achievementUnlocked)
        }
    }
}

// MARK: - Active Power-Ups Display

struct ActivePowerUpsBar: View {
    let manager: PowerUpEffectsManager
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(manager.activePowerUps.filter { !$0.isExpired }, id: \.type.rawValue) { powerUp in
                HStack(spacing: 4) {
                    Image(systemName: powerUp.type.icon)
                        .font(.system(size: 12))
                        .foregroundColor(powerUp.type.color)
                    
                    if powerUp.remainingUses > 1 {
                        Text("×\(powerUp.remainingUses)")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(powerUp.type.color.opacity(0.2))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(powerUp.type.color, lineWidth: 1)
                )
            }
        }
    }
}

// MARK: - Power-Up Use Button (In Encounter)

struct PowerUpUseButton: View {
    let type: PowerUpType
    let count: Int
    let isEnabled: Bool
    let onUse: () -> Void
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        Button(action: onUse) {
            VStack(spacing: 4) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: type.icon)
                        .font(.system(size: 20))
                        .foregroundColor(isEnabled ? type.color : theme.secondaryText)
                    
                    if count > 0 {
                        Text("\(count)")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(3)
                            .background(Circle().fill(type.color))
                    }
                }
                .frame(width: 40, height: 40)
                
                Text(type.displayName)
                    .font(.system(size: 8, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .lineLimit(1)
            }
            .padding(8)
            .background(isEnabled ? type.color.opacity(0.15) : theme.divider.opacity(0.5))
            .cornerRadius(8)
        }
        .disabled(!isEnabled || count == 0)
    }
}

// MARK: - Weekly Report View

struct WeeklyReportView: View {
    let report: WeeklyReport
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Text("📊")
                            .font(.system(size: 50))
                        
                        Text("WEEKLY PROGRESS REPORT")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        Text(dateRangeString)
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    .padding(.top, 24)
                    
                    // Stats grid
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 12) {
                        StatCard(title: "Questions", value: "\(report.questionsAnswered)", icon: "questionmark.circle.fill", color: accentColor)
                        StatCard(title: "XP Earned", value: "\(report.xpEarned)", icon: "sparkles", color: Color.yellow)
                        StatCard(title: "Shards", value: "\(report.shardsEarned)", icon: "diamond.fill", color: Color.cyan)
                        StatCard(title: "Nodes Done", value: "\(report.nodesCompleted)", icon: "checkmark.circle.fill", color: Color.green)
                        StatCard(title: "Perfect Nodes", value: "\(report.perfectNodes)", icon: "star.fill", color: Color.orange)
                        StatCard(title: "Best Streak", value: "\(report.longestStreak)", icon: "flame.fill", color: Color.red)
                        StatCard(title: "Study Hours", value: String(format: "%.1f", report.studyHours), icon: "clock.fill", color: Color.blue)
                        StatCard(title: "Achievements", value: "\(report.achievementsUnlocked)", icon: "trophy.fill", color: Color.purple)
                    }
                    .padding(.horizontal, 16)
                    
                    // Most studied domain
                    if let domain = report.mostStudiedDomain {
                        VStack(spacing: 8) {
                            Text("MOST STUDIED DOMAIN")
                                .font(.system(size: 11, weight: .bold, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                            
                            HStack(spacing: 12) {
                                Image(systemName: domain.icon)
                                    .font(.system(size: 24))
                                    .foregroundColor(domain.accentColor)
                                
                                Text(domain.shortName)
                                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    .foregroundColor(theme.primaryText)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(theme.surface)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    // Motivational message
                    VStack(spacing: 8) {
                        Text(motivationalMessage)
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                            .multilineTextAlignment(.center)
                            .padding(16)
                            .background(accentColor.opacity(0.1))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 16)
                    
                    Button(action: { dismiss() }) {
                        Text("CONTINUE STUDYING")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 14)
                            .background(accentColor)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 32)
                }
            }
        }
        .navigationTitle("Weekly Report")
        .inlineNavigationTitle()
    }
    
    private var dateRangeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return "\(formatter.string(from: report.weekStart)) - \(formatter.string(from: report.weekEnd))"
    }
    
    private var motivationalMessage: String {
        if report.questionsAnswered > 100 {
            return "Outstanding dedication! You're crushing your PTCE prep. 💪"
        } else if report.questionsAnswered > 50 {
            return "Great progress this week! Keep up the momentum! 🔥"
        } else if report.questionsAnswered > 20 {
            return "Solid effort! Every question brings you closer to success. 📚"
        } else {
            return "Remember: consistency is key. Try to study a little each day! 🎯"
        }
    }
}

fileprivate struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .foregroundColor(theme.primaryText)
            
            Text(title)
                .font(.system(size: 10, design: .monospaced))
                .foregroundColor(theme.secondaryText)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(theme.surface)
        .cornerRadius(12)
    }
}

// MARK: - Floating Text Overlay

struct FloatingTextOverlay: View {
    let texts: [FloatingText]
    
    var body: some View {
        ZStack {
            ForEach(texts) { text in
                Text(text.text)
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(text.color)
                    .shadow(color: .black.opacity(0.5), radius: 4)
                    .position(text.startPosition)
                    .offset(y: -80)
                    .opacity(text.isExpired ? 0 : 1)
                    .animation(.easeOut(duration: 2.0), value: text.isExpired)
            }
        }
    }
}

// MARK: - Chest Inventory Badge

struct ChestInventoryBadge: View {
    let count: Int
    let accentColor: Color
    @Environment(\.appTheme) private var theme
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "shippingbox.fill")
                .foregroundColor(accentColor)
            
            Text("\(count)")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(theme.primaryText)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(accentColor.opacity(0.15))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(accentColor.opacity(0.3), lineWidth: 1)
        )
    }
}
