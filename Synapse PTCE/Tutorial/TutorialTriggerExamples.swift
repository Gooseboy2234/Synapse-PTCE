//
//  TutorialTriggerExamples.swift
//  Synapse PTCE
//
//  Examples of how to trigger contextual tutorials throughout the app
//

import SwiftUI

// MARK: - Example 1: Trigger Tutorial When User Opens Boss Node

struct ExampleBossNodeTrigger: View {
    @Bindable var engine: GameEngine
    
    var body: some View {
        Button("Open Boss Node") {
            // Check if user has seen the boss tutorial
            if let progress = engine.tutorialManager.tutorialProgress,
               !progress.isCompleted(.bossNodes) {
                // Show boss tutorial before opening node
                engine.tutorialManager.showStep(.bossNodes)
            } else {
                // Normal boss node flow
                // engine.selectedNode = bossNode
            }
        }
    }
}

// MARK: - Example 2: Show Tutorial on First Quest View

struct ExampleQuestViewTrigger: View {
    @Bindable var engine: GameEngine
    @State private var hasShownQuestTutorial = false
    
    var body: some View {
        VStack {
            // Quest UI here
        }
        .onAppear {
            if !hasShownQuestTutorial,
               let progress = engine.tutorialManager.tutorialProgress,
               !progress.isCompleted(.dailyQuests) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    engine.tutorialManager.showStep(.dailyQuests)
                    hasShownQuestTutorial = true
                }
            }
        }
    }
}

// MARK: - Example 3: Manual Tutorial Button

struct ExampleHelpButton: View {
    @Bindable var engine: GameEngine
    let tutorialTopic: TutorialStep
    
    var body: some View {
        Button(action: {
            engine.tutorialManager.showStep(tutorialTopic)
        }) {
            HStack(spacing: 4) {
                Image(systemName: "questionmark.circle")
                Text("Help")
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(.blue)
        }
    }
}

// MARK: - Example 4: Contextual Help in Exam Mode

struct ExampleExamModeTutorial: View {
    @Bindable var engine: GameEngine
    @State private var showingExam = false
    
    var body: some View {
        Button("Start Practice Exam") {
            // Check if first time taking exam
            if engine.currentNodesCompleted == 0 {
                // Recommend studying first
                engine.tutorialManager.showStep(.examMode)
            } else {
                showingExam = true
            }
        }
        .sheet(isPresented: $showingExam) {
            // PracticeExamView(engine: engine)
        }
    }
}

// MARK: - Example 5: Achievement Unlock Tutorial

extension GameEngine {
    func checkAchievementTutorial() {
        // After unlocking first achievement
        if let progress = tutorialManager.tutorialProgress,
           !progress.isCompleted(.achievements) {
            tutorialManager.showStep(.achievements)
        }
    }
}

// MARK: - Example 6: Streak Milestone Tutorial

extension GameEngine {
    func checkStreakTutorial(currentStreak: Int) {
        // Show tutorial when reaching first 3-day streak
        if currentStreak == 3,
           let progress = tutorialManager.tutorialProgress,
           !progress.isCompleted(.streakSystem) {
            tutorialManager.showStep(.streakSystem)
        }
    }
}

// MARK: - Example 7: Settings Tutorial on First Settings Open

struct ExampleSettingsTrigger: View {
    @Bindable var engine: GameEngine
    @AppStorage("has_opened_settings") private var hasOpenedSettings = false
    
    var body: some View {
        VStack {
            // Settings UI
        }
        .onAppear {
            if !hasOpenedSettings,
               let progress = engine.tutorialManager.tutorialProgress,
               !progress.isCompleted(.settings) {
                engine.tutorialManager.showStep(.settings)
                hasOpenedSettings = true
            }
        }
    }
}

// MARK: - Example 8: Custom Trigger Based on User Behavior

extension GameEngine {
    /// Call this after user gets 5 questions wrong in a row
    func suggestBreachNodeTutorial() {
        if let progress = tutorialManager.tutorialProgress,
           !progress.isCompleted(.breachNodes) {
            tutorialManager.showStep(.breachNodes)
        }
    }
    
    /// Call this when user earns their first rank-up
    func showRankUpTutorial() {
        if let progress = tutorialManager.tutorialProgress,
           !progress.isCompleted(.rankProgress) {
            tutorialManager.showStep(.rankProgress)
        }
    }
}

// MARK: - Example 9: Checking Completion Status

struct ExampleCheckCompletion: View {
    @Bindable var engine: GameEngine
    
    var isNodeTutorialComplete: Bool {
        guard let progress = engine.tutorialManager.tutorialProgress else {
            return false
        }
        return progress.isCompleted(.firstNode)
    }
    
    var body: some View {
        VStack {
            if isNodeTutorialComplete {
                Text("You've mastered node basics!")
            } else {
                Button("Learn About Nodes") {
                    engine.tutorialManager.showStep(.firstNode)
                }
            }
        }
    }
}

// MARK: - Example 10: Multiple Sequential Tutorials

struct ExampleSequentialTutorials: View {
    @Bindable var engine: GameEngine
    
    func showNodeSequence() {
        // Show a custom sequence of tutorials
        let sequence: [TutorialStep] = [
            .firstNode,
            .answeringQuestions,
            .nodeCompletion
        ]
        
        // Show first tutorial
        if let first = sequence.first {
            engine.tutorialManager.showStep(first)
        }
        
        // Note: To show subsequent tutorials, you'd need to extend
        // TutorialManager with a sequence-aware system
    }
    
    var body: some View {
        Button("Learn Complete Node Flow") {
            showNodeSequence()
        }
    }
}

// MARK: - Usage Patterns

/*
 
 PATTERN 1: ONE-TIME CONTEXTUAL HELP
 ===================================
 Show tutorial the first time a user encounters a feature:
 
 .onAppear {
     if !tutorialProgress.isCompleted(.specificTopic) {
         tutorialManager.showStep(.specificTopic)
     }
 }
 
 
 PATTERN 2: HELP BUTTONS
 =======================
 Provide always-available help buttons:
 
 Button("?") {
     tutorialManager.showStep(.relevantTopic)
 }
 
 
 PATTERN 3: SMART SUGGESTIONS
 ============================
 Detect user struggles and offer help:
 
 if userMadeMultipleMistakes {
     tutorialManager.showStep(.breachNodes)
 }
 
 
 PATTERN 4: PROGRESSIVE DISCLOSURE
 =================================
 Show tutorials as features unlock:
 
 if justUnlockedBossNode {
     tutorialManager.showStep(.bossNodes)
 }
 
 
 PATTERN 5: MILESTONE CELEBRATIONS
 =================================
 Combine tutorials with achievements:
 
 if reached100XP {
     tutorialManager.showStep(.xpSystem)
 }
 
 */
