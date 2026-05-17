//
//  TutorialSystem.swift
//  Synapse PTCE
//
//  Interactive tutorial system to guide users through app features
//

import Foundation
import SwiftUI
import SwiftData

// MARK: - Tutorial Step Definition

enum TutorialStep: String, CaseIterable, Codable, Identifiable {
    // First launch sequence
    case welcome = "WELCOME"
    case mapOverview = "MAP_OVERVIEW"
    case nodeTypes = "NODE_TYPES"
    case tapping = "TAPPING"
    
    // Core gameplay
    case firstNode = "FIRST_NODE"
    case answeringQuestions = "ANSWERING_QUESTIONS"
    case nodeCompletion = "NODE_COMPLETION"
    case breachNodes = "BREACH_NODES"
    
    // RPG Systems
    case xpSystem = "XP_SYSTEM"
    case rankProgress = "RANK_PROGRESS"
    case dataShards = "DATA_SHARDS"
    
    // Gamification
    case dailyQuests = "DAILY_QUESTS"
    case achievements = "ACHIEVEMENTS"
    case streakSystem = "STREAK_SYSTEM"
    
    // Advanced features
    case bossNodes = "BOSS_NODES"
    case domainMastery = "DOMAIN_MASTERY"
    case examMode = "EXAM_MODE"
    case flashcards = "FLASHCARDS"
    
    // Customization
    case settings = "SETTINGS"
    case soundEffects = "SOUND_EFFECTS"
    
    var id: String { rawValue }
    
    func title(theme: AppThemeMode) -> String {
        if theme == .firewatch {
            switch self {
            case .welcome: return "Welcome to Shoshone"
            case .mapOverview: return "The Forest Map"
            case .nodeTypes: return "Understanding Lookouts"
            case .tapping: return "Begin Your Patrol"
            case .firstNode: return "Your First Lookout"
            case .answeringQuestions: return "Surveying the Area"
            case .nodeCompletion: return "Lookout Complete"
            case .breachNodes: return "Hazard Markers"
            case .xpSystem: return "Trail Miles"
            case .rankProgress: return "Ranger Rank"
            case .dataShards: return "Fire Tokens"
            case .dailyQuests: return "Daily Patrol"
            case .achievements: return "Ranger Badges"
            case .streakSystem: return "Consecutive Patrols"
            case .bossNodes: return "Wildfire Crisis"
            case .domainMastery: return "Sector Mastery"
            case .examMode: return "Final Certification"
            case .flashcards: return "Field Guide Review"
            case .settings: return "Ranger Station"
            case .soundEffects: return "Audio Settings"
            }
        } else {
            switch self {
            case .welcome: return "Welcome to Synapse PTCE"
            case .mapOverview: return "The Network Map"
            case .nodeTypes: return "Understanding Nodes"
            case .tapping: return "Tap to Begin"
            case .firstNode: return "Your First Node"
            case .answeringQuestions: return "Answering Questions"
            case .nodeCompletion: return "Node Completion"
            case .breachNodes: return "Breach Nodes"
            case .xpSystem: return "Experience Points (XP)"
            case .rankProgress: return "Rank System"
            case .dataShards: return "Data Shards"
            case .dailyQuests: return "Daily Quests"
            case .achievements: return "Achievement System"
            case .streakSystem: return "Study Streaks"
            case .bossNodes: return "Boss Encounters"
            case .domainMastery: return "Domain Mastery"
            case .examMode: return "Practice Exams"
            case .flashcards: return "Flashcard Review"
            case .settings: return "App Settings"
            case .soundEffects: return "Sound Effects"
            }
        }
    }
    
    func description(theme: AppThemeMode) -> String {
        if theme == .firewatch {
            switch self {
            case .welcome:
                return "Welcome to Shoshone National Forest. You're the new fire lookout for the summer. Your job? Master the wilderness of pharmacy knowledge while exploring beautiful trails and preventing wildfires."
            case .mapOverview:
                return "The forest map shows all lookout towers organized by sector. Each lookout contains 5 survey questions. Explore the trails and find your next station."
            case .nodeTypes:
                return "Lookouts come in different types:\n• STANDARD: Regular 5-question surveys\n• HAZARD: Review your mistakes\n• WILDFIRE: 10-question crisis challenges\n• CERTIFICATION: Full 90-question ranger exam"
            case .tapping:
                return "Tap any accessible lookout (glowing) to begin your survey. Locked lookouts require completing nearby stations first. Follow the trail markers."
            case .firstNode:
                return "Each lookout presents 5 survey questions about pharmacy. Answer all 5 to complete the station and unlock new trails."
            case .answeringQuestions:
                return "Read each question carefully. Select your answer, then tap 'Submit'. You'll get immediate feedback with detailed field notes."
            case .nodeCompletion:
                return "After completing all questions, you'll see your survey results. Perfect surveys (5/5) earn bonus trail miles and unlock ranger badges!"
            case .breachNodes:
                return "When you make mistakes, those questions appear as HAZARD markers (red). Review them to fix knowledge gaps and earn trail miles."
            case .xpSystem:
                return "Every correct answer earns Trail Miles. Accumulate miles to increase your Ranger Rank and unlock rewards. Perfect surveys give bonus miles!"
            case .rankProgress:
                return "Your ranger rank reflects total trail miles. Progress from 'Rookie' to 'Chief Ranger'. Higher ranks unlock special features and badges."
            case .dataShards:
                return "Fire Tokens are earned by completing lookouts, patrols, and challenges. They're a prestige currency showing your dedication to the forest."
            case .dailyQuests:
                return "Each day, you receive 3 patrol objectives. Complete them for bonus trail miles and Fire Tokens. Patrols reset at dawn!"
            case .achievements:
                return "Unlock 20+ ranger badges by hitting milestones. Badges award trail miles, tokens, and honor. Check your progress at the ranger station."
            case .streakSystem:
                return "Patrol daily to build your streak! The longer your streak, the bigger the rewards. Miss a day and your streak resets."
            case .bossNodes:
                return "Wildfire crises are 10-question rapid-response challenges. Contain all 4 major wildfires to prove your mastery of each sector!"
            case .domainMastery:
                return "The forest has 4 sectors. Master each by completing all lookouts and containing the wildfire. Track progress in your field journal."
            case .examMode:
                return "Ready for certification? The Ranger Exam simulates the real PTCB with 90 questions. See if you're ready to graduate!"
            case .flashcards:
                return "Review key concepts with your field guide. Perfect for quick study sessions around the campfire."
            case .settings:
                return "Customize your experience at the Ranger Station: toggle audio, switch themes, and manage your profile."
            case .soundEffects:
                return "Enjoy immersive forest sounds and effects for actions like correct answers, unlocking badges, and ranking up. Toggle in settings."
            }
        } else {
            // Synapse (cyber) descriptions
            switch self {
            case .welcome:
                return "Synapse PTCE transforms exam prep into an immersive RPG adventure. Navigate a neural network, complete nodes, defeat bosses, and master the four PTCB exam domains."
            case .mapOverview:
                return "The map displays all study nodes organized by domain. Each node contains 5 questions. Scroll and explore the network to find your next challenge."
            case .nodeTypes:
                return "Nodes come in different types:\n• STANDARD: Regular 5-question nodes\n• BREACH: Review your mistakes\n• BOSS: 10-question domain challenges\n• EXAM: Full 90-question practice tests"
            case .tapping:
                return "Tap any unlocked node (glowing) to begin. Locked nodes require you to complete nearby nodes first. Follow the network pathways."
            case .firstNode:
                return "Each node presents 5 multiple-choice questions. Answer all 5 to complete the node and unlock new paths."
            case .answeringQuestions:
                return "Read each question carefully. Select your answer, then tap 'Submit'. You'll get immediate feedback with detailed explanations."
            case .nodeCompletion:
                return "After answering all questions, you'll see your results. Perfect clears (5/5) earn bonus XP and unlock achievements!"
            case .breachNodes:
                return "When you answer incorrectly, those questions appear in BREACH nodes (red). Review them to fix knowledge gaps and earn XP."
            case .xpSystem:
                return "Every correct answer earns Experience Points (XP). Gain XP to increase your Network Rank and unlock rewards. Perfect nodes give bonus XP!"
            case .rankProgress:
                return "Your rank reflects your total XP. Progress through ranks from 'Novice' to 'Architect'. Higher ranks unlock special features and achievements."
            case .dataShards:
                return "Data Shards are earned by completing nodes, quests, and achievements. They're a prestige currency showing your dedication to mastery."
            case .dailyQuests:
                return "Each day, you receive 3 random quests. Complete them for bonus XP and Data Shards. Quests reset at midnight!"
            case .achievements:
                return "Unlock 20+ achievements by hitting milestones. Achievements award XP, shards, and bragging rights. Check your progress in the menu."
            case .streakSystem:
                return "Study daily to build your streak! The longer your streak, the bigger the rewards. Miss a day and your streak resets."
            case .bossNodes:
                return "Boss nodes are 10-question challenges at the end of each domain. Defeat all 4 bosses to prove domain mastery!"
            case .domainMastery:
                return "The PTCB exam covers 4 domains. Master each by completing all nodes and defeating the boss. Track progress in your stats."
            case .examMode:
                return "Ready to test yourself? Practice Exam mode simulates the real PTCB with 90 questions. See if you're exam-ready!"
            case .flashcards:
                return "Review key concepts with flashcard mode. Perfect for quick study sessions and reinforcing what you've learned."
            case .settings:
                return "Customize your experience in Settings: toggle sound effects, adjust difficulty, and manage your profile."
            case .soundEffects:
                return "Enjoy immersive sound effects for actions like answering correctly, unlocking achievements, and leveling up. Toggle in Settings."
            }
        }
    }
    
    var icon: String {
        switch self {
        case .welcome: return "hand.wave.fill"
        case .mapOverview: return "map.fill"
        case .nodeTypes: return "circle.hexagongrid.fill"
        case .tapping: return "hand.tap.fill"
        case .firstNode: return "play.circle.fill"
        case .answeringQuestions: return "questionmark.circle.fill"
        case .nodeCompletion: return "checkmark.circle.fill"
        case .breachNodes: return "exclamationmark.triangle.fill"
        case .xpSystem: return "sparkles"
        case .rankProgress: return "chart.line.uptrend.xyaxis"
        case .dataShards: return "diamond.fill"
        case .dailyQuests: return "list.bullet.clipboard.fill"
        case .achievements: return "trophy.fill"
        case .streakSystem: return "flame.fill"
        case .bossNodes: return "shield.fill"
        case .domainMastery: return "crown.fill"
        case .examMode: return "graduationcap.fill"
        case .flashcards: return "rectangle.stack.fill"
        case .settings: return "gearshape.fill"
        case .soundEffects: return "speaker.wave.3.fill"
        }
    }
    
    var category: TutorialCategory {
        switch self {
        case .welcome, .mapOverview, .nodeTypes, .tapping:
            return .basics
        case .firstNode, .answeringQuestions, .nodeCompletion, .breachNodes:
            return .gameplay
        case .xpSystem, .rankProgress, .dataShards:
            return .progression
        case .dailyQuests, .achievements, .streakSystem:
            return .gamification
        case .bossNodes, .domainMastery, .examMode, .flashcards:
            return .advanced
        case .settings, .soundEffects:
            return .customization
        }
    }
    
    /// Visual highlight area (optional - for pointing at UI elements)
    var highlightArea: TutorialHighlight? {
        switch self {
        case .mapOverview: return .mapArea
        case .nodeTypes: return .firstNode
        case .tapping: return .firstNode
        case .xpSystem: return .statsBar
        case .rankProgress: return .statsBar
        case .dataShards: return .statsBar
        case .dailyQuests: return .menuButton
        case .achievements: return .menuButton
        case .settings: return .menuButton
        default: return nil
        }
    }
}

enum TutorialCategory: String, Codable {
    case basics = "BASICS"
    case gameplay = "GAMEPLAY"
    case progression = "PROGRESSION"
    case gamification = "GAMIFICATION"
    case advanced = "ADVANCED"
    case customization = "CUSTOMIZATION"
    
    var displayName: String {
        switch self {
        case .basics: return "Getting Started"
        case .gameplay: return "Core Gameplay"
        case .progression: return "RPG Systems"
        case .gamification: return "Quests & Achievements"
        case .advanced: return "Advanced Features"
        case .customization: return "Customization"
        }
    }
    
    var icon: String {
        switch self {
        case .basics: return "star.fill"
        case .gameplay: return "gamecontroller.fill"
        case .progression: return "arrow.up.right.circle.fill"
        case .gamification: return "trophy.fill"
        case .advanced: return "flame.fill"
        case .customization: return "paintbrush.fill"
        }
    }
}

enum TutorialHighlight {
    case mapArea
    case firstNode
    case statsBar
    case menuButton
    case none
}

// MARK: - Tutorial Progress Storage

@Model
final class TutorialProgress {
    @Attribute(.unique) var id: String = "tutorial_progress"
    
    var completedSteps: Set<String> = []
    var currentStepIndex: Int = 0
    var hasCompletedOnboarding: Bool = false
    var tutorialEnabled: Bool = true
    var lastShownStep: String?
    var dismissedCount: Int = 0
    
    init() {}
    
    func markCompleted(_ step: TutorialStep) {
        completedSteps.insert(step.rawValue)
    }
    
    func isCompleted(_ step: TutorialStep) -> Bool {
        completedSteps.contains(step.rawValue)
    }
    
    func resetTutorial() {
        completedSteps.removeAll()
        currentStepIndex = 0
        hasCompletedOnboarding = false
        lastShownStep = nil
        dismissedCount = 0
    }
}

// MARK: - Tutorial Manager

@Observable
class TutorialManager {
    var isShowingTutorial: Bool = false
    var currentStep: TutorialStep?
    var tutorialProgress: TutorialProgress?
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadProgress()
    }
    
    private func loadProgress() {
        let descriptor = FetchDescriptor<TutorialProgress>()
        if let existing = try? modelContext.fetch(descriptor).first {
            tutorialProgress = existing
        } else {
            let newProgress = TutorialProgress()
            modelContext.insert(newProgress)
            tutorialProgress = newProgress
        }
    }
    
    func shouldShowOnboarding() -> Bool {
        guard let progress = tutorialProgress else { return true }
        return !progress.hasCompletedOnboarding && progress.tutorialEnabled
    }
    
    func startOnboarding() {
        let onboardingSteps: [TutorialStep] = [
            .welcome, .mapOverview, .nodeTypes, .tapping
        ]
        currentStep = onboardingSteps.first
        isShowingTutorial = true
    }
    
    func nextStep() {
        guard let current = currentStep,
              let progress = tutorialProgress else { return }
        
        progress.markCompleted(current)
        
        let onboardingSteps: [TutorialStep] = [
            .welcome, .mapOverview, .nodeTypes, .tapping
        ]
        
        if let currentIndex = onboardingSteps.firstIndex(of: current),
           currentIndex + 1 < onboardingSteps.count {
            currentStep = onboardingSteps[currentIndex + 1]
        } else {
            completeOnboarding()
        }
        
        try? modelContext.save()
    }
    
    func skipTutorial() {
        guard let progress = tutorialProgress else { return }
        progress.dismissedCount += 1
        isShowingTutorial = false
        currentStep = nil
        try? modelContext.save()
    }
    
    func completeOnboarding() {
        guard let progress = tutorialProgress else { return }
        progress.hasCompletedOnboarding = true
        isShowingTutorial = false
        currentStep = nil
        try? modelContext.save()
    }
    
    func showStep(_ step: TutorialStep) {
        currentStep = step
        isShowingTutorial = true
    }
    
    func dismissCurrentStep() {
        if let current = currentStep {
            tutorialProgress?.markCompleted(current)
        }
        isShowingTutorial = false
        currentStep = nil
        try? modelContext.save()
    }
    
    func resetTutorial() {
        tutorialProgress?.resetTutorial()
        try? modelContext.save()
    }
}

// MARK: - Tutorial Card View

struct TutorialCardView: View {
    let step: TutorialStep
    let onNext: () -> Void
    let onSkip: () -> Void
    let showSkip: Bool
    var themeManager: ThemeManager
    
    @State private var scale: CGFloat = 0.9
    @State private var opacity: Double = 0.0
    
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
        VStack(spacing: 0) {
            // Icon header
            ZStack {
                Circle()
                    .fill(accent.opacity(0.15))
                    .frame(width: 90, height: 90)
                
                Circle()
                    .stroke(accent.opacity(0.3), lineWidth: 2)
                    .frame(width: 90, height: 90)
                
                Image(systemName: step.icon)
                    .font(.system(size: 38, weight: .semibold))
                    .foregroundStyle(accent)
            }
            .padding(.top, 30)
            .padding(.bottom, 24)
            
            // Category badge
            HStack(spacing: 6) {
                Image(systemName: step.category.icon)
                    .font(.system(size: 11, weight: .semibold))
                Text(step.category.displayName.uppercased())
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
            }
            .foregroundStyle(accent.opacity(0.7))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(accent.opacity(0.12))
            )
            .padding(.bottom, 16)
            
            // Title
            Text(step.title(theme: themeManager.currentTheme))
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(textColor)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            
            // Description
            ScrollView {
                Text(step.description(theme: themeManager.currentTheme))
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundStyle(textColor.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
                    .padding(.horizontal, 28)
            }
            .frame(maxHeight: 220)
            
            Spacer()
            
            // Action buttons
            VStack(spacing: 12) {
                Button(action: onNext) {
                    HStack(spacing: 8) {
                        Text("Continue")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 15, weight: .bold))
                    }
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(accent)
                    )
                }
                .shadow(color: accent.opacity(0.4), radius: 12, y: 4)
                
                if showSkip {
                    Button(action: onSkip) {
                        Text("Skip Tutorial")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundStyle(textColor.opacity(0.6))
                    }
                    .padding(.top, 4)
                }
            }
            .padding(.horizontal, 28)
            .padding(.bottom, 32)
        }
        .frame(maxWidth: 440, maxHeight: 640)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(bg)
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(accent.opacity(0.3), lineWidth: 1.5)
                )
        )
        .shadow(color: .black.opacity(0.5), radius: 30, y: 15)
        .scaleEffect(scale)
        .opacity(opacity)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

// MARK: - Tutorial Overlay

struct TutorialOverlay: View {
    let step: TutorialStep
    let onNext: () -> Void
    let onSkip: () -> Void
    let showSkip: Bool
    var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.75)
                .ignoresSafeArea()
                .onTapGesture {
                    // Prevent dismissing by tapping background
                }
            
            // Tutorial card
            TutorialCardView(
                step: step,
                onNext: onNext,
                onSkip: onSkip,
                showSkip: showSkip,
                themeManager: themeManager
            )
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Tutorial Library View (Settings)

struct TutorialLibraryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var tutorialManager: TutorialManager
    var themeManager: ThemeManager
    
    private var accent: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.sunset : SynapseColors.neonOrange
    }
    
    private var bg: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.nightSky : SynapseColors.darkBg
    }
    
    private var textColor: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    var groupedSteps: [(TutorialCategory, [TutorialStep])] {
        Dictionary(grouping: TutorialStep.allCases, by: { $0.category })
            .sorted { $0.key.rawValue < $1.key.rawValue }
            .map { ($0.key, $0.value) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tutorial Library")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundStyle(textColor)
                            
                            Text("Review any tutorial topic anytime")
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                                .foregroundStyle(textColor.opacity(0.7))
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                        
                        // Reset button
                        Button(action: {
                            tutorialManager.resetTutorial()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "arrow.counterclockwise")
                                Text("Reset & Restart Tutorial")
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                            }
                            .foregroundStyle(accent)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(accent.opacity(0.4), lineWidth: 1.5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(accent.opacity(0.08))
                                    )
                            )
                        }
                        .padding(.horizontal, 20)
                        
                        // Grouped tutorials
                        ForEach(groupedSteps, id: \.0.rawValue) { category, steps in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 8) {
                                    Image(systemName: category.icon)
                                        .font(.system(size: 13, weight: .semibold))
                                    Text(category.displayName.uppercased())
                                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                                }
                                .foregroundStyle(accent)
                                .padding(.horizontal, 20)
                                
                                ForEach(steps) { step in
                                    TutorialLibraryRow(
                                        step: step,
                                        isCompleted: tutorialManager.tutorialProgress?.isCompleted(step) ?? false,
                                        themeManager: themeManager
                                    ) {
                                        tutorialManager.showStep(step)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(accent)
                }
            }
        }
    }
}

struct TutorialLibraryRow: View {
    let step: TutorialStep
    let isCompleted: Bool
    var themeManager: ThemeManager
    let action: () -> Void
    
    private var accent: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.sunset : SynapseColors.neonOrange
    }
    
    private var textColor: Color {
        themeManager.currentTheme == .firewatch ? FirewatchColors.paperLight : .white
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                // Icon
                ZStack {
                    Circle()
                        .fill(accent.opacity(0.12))
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: step.icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(accent)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(step.title(theme: themeManager.currentTheme))
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundStyle(textColor)
                    
                    Text(step.description(theme: themeManager.currentTheme).prefix(60) + "...")
                        .font(.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundStyle(textColor.opacity(0.6))
                        .lineLimit(1)
                }
                
                Spacer()
                
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.green)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(textColor.opacity(0.4))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(textColor.opacity(0.05))
            )
            .padding(.horizontal, 20)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - View Modifier for Tutorial Integration

struct TutorialModifier: ViewModifier {
    @Bindable var tutorialManager: TutorialManager
    var themeManager: ThemeManager
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if tutorialManager.isShowingTutorial,
                   let step = tutorialManager.currentStep {
                    let hasCompletedOnboarding = tutorialManager.tutorialProgress?.hasCompletedOnboarding ?? false
                    TutorialOverlay(
                        step: step,
                        onNext: { tutorialManager.nextStep() },
                        onSkip: { tutorialManager.skipTutorial() },
                        showSkip: !hasCompletedOnboarding,
                        themeManager: themeManager
                    )
                    .transition(.opacity)
                }
            }
    }
}

extension View {
    func tutorialOverlay(manager: TutorialManager, theme: ThemeManager) -> some View {
        modifier(TutorialModifier(tutorialManager: manager, themeManager: theme))
    }
}
