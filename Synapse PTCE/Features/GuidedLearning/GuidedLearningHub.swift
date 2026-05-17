//
//  GuidedLearningHub.swift
//  Synapse PTCE
//
//  COMPLETE GUIDED LEARNING SYSTEM FOR D1 MEDICATIONS
//  Philosophy: Teach like the real PTCE test — stems first, then application
//
//  Features:
//  1. Drug Stems (prefixes/suffixes) — Foundation
//  2. Practice Quizzes — Test stem recognition
//  3. Flashcard Mode — Spaced repetition
//  4. Body Systems — Application theory
//  5. High-Risk Medications — Safety concepts
//  6. Drug Interactions — Real-world counseling
//  7. Search — Look up any drug
//  8. Progress Tracking — SwiftData persistence
//

import SwiftUI
import SwiftData

// MARK: - Guided Learning Hub (Main Entry Point)

struct GuidedLearningHub: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    
    @State private var selectedMode: LearningMode? = nil
    @State private var showSearch = false
    
    enum LearningMode: String, CaseIterable, Identifiable {
        case stems       = "STEMS"
        case flashcards  = "FLASHCARDS"
        case quizzes     = "QUIZZES"
        case systems     = "SYSTEMS"
        case highRisk    = "HIGH_RISK"
        case interactions = "INTERACTIONS"
        
        var id: String { rawValue }
        
        var displayName: String {
            switch self {
            case .stems:       return "Drug Stems"
            case .flashcards:  return "Flashcards"
            case .quizzes:     return "Quiz Mode"
            case .systems:     return "Body Systems"
            case .highRisk:    return "High-Risk Meds"
            case .interactions: return "Interactions"
            }
        }
        
        var icon: String {
            switch self {
            case .stems:       return "textformat.abc"
            case .flashcards:  return "rectangle.stack.fill"
            case .quizzes:     return "questionmark.circle.fill"
            case .systems:     return "heart.text.square.fill"
            case .highRisk:    return "exclamationmark.triangle.fill"
            case .interactions: return "arrow.triangle.2.circlepath"
            }
        }
        
        var description: String {
            switch self {
            case .stems:
                return "START HERE — Learn the naming patterns. Master -pril, -statin, -cillin, etc."
            case .flashcards:
                return "Spaced repetition flashcards. Front: stem. Back: drug class + use."
            case .quizzes:
                return "Test your stem recognition. See a drug name → identify its class."
            case .systems:
                return "Apply stems to body systems. Build your mental filing cabinet."
            case .highRisk:
                return "Learn NTI, High-Alert, REMS. The PTCE tests patient safety heavily."
            case .interactions:
                return "OTC + Herbal + Food interactions. What patients don't know CAN hurt them."
            }
        }
        
        var order: Int {
            switch self {
            case .stems:       return 1
            case .flashcards:  return 2
            case .quizzes:     return 3
            case .systems:     return 4
            case .highRisk:    return 5
            case .interactions: return 6
            }
        }
    }
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                theme.background.ignoresSafeArea()
                
                // Subtle grid
                GridBackgroundView(accentColor: accentColor, theme: theme)
                
                VStack(spacing: 0) {
                    
                    // Header
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            Image(systemName: "brain.head.profile")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(accentColor)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("GUIDED LEARNING")
                                    .font(.system(size: 20, weight: .black, design: .monospaced))
                                    .foregroundColor(theme.primaryText)
                                
                                Text("Domain 1: Medications — Step-by-Step Mastery")
                                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                    .foregroundColor(theme.secondaryText)
                            }
                            
                            Spacer()
                            
                            // Search button
                            Button(action: { showSearch = true }) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(accentColor)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                        // Progress Summary
                        ProgressSummaryCard(progress: userProgress, accentColor: accentColor, theme: theme)
                            .padding(.horizontal, 20)
                        
                        // Philosophy Banner
                        VStack(alignment: .leading, spacing: 6) {
                            Text("📚 HOW TO USE THIS SYSTEM:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(accentColor)
                            
                            Text("Just like the real PTCE, start with **Drug Stems** to learn naming patterns. Then use **Flashcards** and **Quizzes** to reinforce. Finally, apply your knowledge through **Body Systems**, **High-Risk Meds**, and **Interactions**. This mirrors how the exam tests you!")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(theme.primaryText.opacity(0.85))
                                .lineSpacing(4)
                        }
                        .padding(14)
                        .background(accentColor.opacity(0.08))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 20)
                    }
                    
                    Divider()
                        .background(theme.divider)
                        .padding(.top, 12)
                    
                    // Learning Mode Grid
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 12) {
                            ForEach(LearningMode.allCases.sorted(by: { $0.order < $1.order })) { mode in
                                LearningModeCard(
                                    mode: mode,
                                    progress: userProgress,
                                    isSelected: selectedMode == mode,
                                    accentColor: accentColor,
                                    theme: theme,
                                    onTap: { selectedMode = mode }
                                )
                            }
                        }
                        .padding(20)
                    }
                }
            }
            .inlineNavigationTitle()
            .sheet(isPresented: $showSearch) {
                DrugSearchView(accentColor: accentColor)
            }
            .fullScreenCoverCompat(item: $selectedMode) { mode in
                NavigationStack {
                    Group {
                        switch mode {
                        case .stems:
                            DrugStemsLearningView(accentColor: accentColor)
                        case .flashcards:
                            FlashcardModeView(accentColor: accentColor)
                        case .quizzes:
                            StemQuizView(accentColor: accentColor)
                        case .systems:
                            BodySystemsLearningView(accentColor: accentColor)
                        case .highRisk:
                            HighRiskLearningView(accentColor: accentColor)
                        case .interactions:
                            InteractionsLearningView(accentColor: accentColor)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Done") {
                                selectedMode = nil
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            // Initialize progress if needed
            if progress.isEmpty {
                let newProgress = LearningProgress()
                modelContext.insert(newProgress)
            }
        }
    }
}

// Make LearningMode identifiable for fullScreenCover
extension GuidedLearningHub.LearningMode {
    static func == (lhs: Self, rhs: Self?) -> Bool {
        guard let rhs else { return false }
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Progress Summary Card

struct ProgressSummaryCard: View {
    let progress: LearningProgress
    let accentColor: Color
    let theme: AppTheme
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(progress.stemsLearned)/\(DrugStem.allStems.count)")
                    .font(.system(size: 22, weight: .black, design: .monospaced))
                    .foregroundColor(accentColor)
                Text("Stems Learned")
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
            
            Divider()
                .frame(height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(progress.quizzesCompleted)")
                    .font(.system(size: 22, weight: .black, design: .monospaced))
                    .foregroundColor(accentColor)
                Text("Quizzes Passed")
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
            
            Divider()
                .frame(height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(Int(progress.overallAccuracy * 100))%")
                    .font(.system(size: 22, weight: .black, design: .monospaced))
                    .foregroundColor(accentColor)
                Text("Accuracy")
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
        }
        .padding(14)
        .background(theme.surface)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
        )
    }
}

// MARK: - Learning Mode Card

struct LearningModeCard: View {
    let mode: GuidedLearningHub.LearningMode
    let progress: LearningProgress
    let isSelected: Bool
    let accentColor: Color
    let theme: AppTheme
    let onTap: () -> Void
    
    var completionPercent: Double {
        switch mode {
        case .stems:
            return Double(progress.stemsLearned) / Double(DrugStem.allStems.count)
        case .flashcards:
            return Double(progress.flashcardsReviewed) / Double(max(DrugStem.allStems.count, 1))
        case .quizzes:
            return Double(progress.quizzesCompleted) / 10.0 // Assume 10 quizzes
        case .systems:
            return Double(progress.systemsStudied.count) / Double(BodySystem.allCases.count)
        case .highRisk:
            return Double(progress.highRiskMedsLearned) / Double(HighRiskMedication.allHighRiskMeds.count)
        case .interactions:
            return Double(progress.interactionsLearned) / Double(DrugInteraction.allInteractions.count)
        }
    }
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Image(systemName: mode.icon)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(accentColor)
                    
                    Spacer()
                    
                    Text("#\(mode.order)")
                        .font(.system(size: 12, weight: .black, design: .monospaced))
                        .foregroundColor(theme.secondaryText.opacity(0.5))
                }
                
                Text(mode.displayName.uppercased())
                    .font(.system(size: 14, weight: .black, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text(mode.description)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(theme.secondaryText)
                    .lineSpacing(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(theme.divider)
                            .frame(height: 6)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(accentColor)
                            .frame(width: geo.size.width * min(completionPercent, 1.0), height: 6)
                    }
                }
                .frame(height: 6)
                
                Text("\(Int(completionPercent * 100))% Complete")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
            }
            .padding(14)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor.opacity(isSelected ? 0.5 : 0.25), lineWidth: isSelected ? 2 : 1)
            )
            .shadow(color: accentColor.opacity(isSelected ? 0.2 : 0), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Grid Background (Reusable)

struct GridBackgroundView: View {
    let accentColor: Color
    let theme: AppTheme
    
    var body: some View {
        Canvas { ctx, size in
            let spacing: CGFloat = 28
            let lineColor = theme.gridLine
            var x: CGFloat = 0
            while x <= size.width {
                var p = Path()
                p.move(to: CGPoint(x: x, y: 0))
                p.addLine(to: CGPoint(x: x, y: size.height))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                x += spacing
            }
            var y: CGFloat = 0
            while y <= size.height {
                var p = Path()
                p.move(to: CGPoint(x: 0, y: y))
                p.addLine(to: CGPoint(x: size.width, y: y))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                y += spacing
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

#Preview {
    GuidedLearningHub(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
        .modelContainer(for: LearningProgress.self)
}
