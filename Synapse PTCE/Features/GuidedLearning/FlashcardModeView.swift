//
//  FlashcardModeView.swift
//  Synapse PTCE
//
//  SPACED REPETITION FLASHCARD SYSTEM
//  Front: Drug stem (e.g., "-pril")
//  Back: Drug class + Therapeutic use
//
//  Features:
//  - Confidence-based scheduling (Again, Hard, Good, Easy)
//  - Tracks review counts per card
//  - Shows next review date
//

import SwiftUI
import SwiftData

struct FlashcardModeView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    @Query private var reviews: [FlashcardReview]
    
    let accentColor: Color
    
    @State private var currentIndex = 0
    @State private var isFlipped = false
    @State private var showConfidenceButtons = false
    @State private var cardsReviewed = 0
    @State private var sessionComplete = false
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var dueCards: [DrugStem] {
        // Get cards that are due for review or haven't been seen yet
        DrugStem.allStems.filter { stem in
            let review = reviews.first(where: { $0.stemID == stem.id.uuidString })
            return review == nil || review!.nextReviewDate <= Date()
        }
    }
    
    var currentCard: DrugStem? {
        guard currentIndex < dueCards.count else { return nil }
        return dueCards[currentIndex]
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackgroundView(accentColor: accentColor, theme: theme)
            
            VStack(spacing: 0) {
                
                // Header
                VStack(spacing: 8) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("FLASHCARD MODE")
                                .font(.system(size: 20, weight: .black, design: .monospaced))
                                .foregroundColor(theme.primaryText)
                            
                            Text("Spaced Repetition — Master the Stems")
                                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        
                        Spacer()
                        
                        Text("\(currentIndex + 1)/\(dueCards.count)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(theme.divider)
                                .frame(height: 6)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(accentColor)
                                .frame(width: geo.size.width * (Double(currentIndex) / Double(max(dueCards.count, 1))), height: 6)
                        }
                    }
                    .frame(height: 6)
                    .padding(.horizontal, 20)
                }
                
                Divider()
                    .background(theme.divider)
                    .padding(.top, 12)
                
                if sessionComplete {
                    SessionCompleteView(
                        cardsReviewed: cardsReviewed,
                        accentColor: accentColor,
                        theme: theme,
                        onRestart: {
                            currentIndex = 0
                            cardsReviewed = 0
                            sessionComplete = false
                            isFlipped = false
                            showConfidenceButtons = false
                        }
                    )
                } else if let card = currentCard {
                    // Flashcard
                    FlashcardView(
                        card: card,
                        isFlipped: isFlipped,
                        showConfidenceButtons: showConfidenceButtons,
                        accentColor: accentColor,
                        theme: theme,
                        onFlip: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                isFlipped.toggle()
                                if isFlipped {
                                    showConfidenceButtons = true
                                }
                            }
                        },
                        onConfidence: { confidence in
                            recordReview(for: card, confidence: confidence)
                            advanceToNextCard()
                        }
                    )
                    .padding(20)
                } else {
                    // No cards due
                    VStack(spacing: 16) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 64))
                            .foregroundColor(accentColor)
                        
                        Text("All Caught Up!")
                            .font(.system(size: 24, weight: .black, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                        
                        Text("You've reviewed all due flashcards. Check back later!")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(theme.secondaryText)
                            .multilineTextAlignment(.center)
                    }
                    .padding(40)
                }
            }
        }
        .navigationTitle("Flashcards")
        .inlineNavigationTitle()
    }
    
    func recordReview(for card: DrugStem, confidence: Int) {
        let stemID = card.id.uuidString
        
        // Check if review exists
        if let existingReview = reviews.first(where: { $0.stemID == stemID }) {
            // Update existing review
            existingReview.reviewDate = Date()
            existingReview.confidence = confidence
            existingReview.reviewCount += 1
            
            // Update next review date based on confidence and review count
            let interval: TimeInterval
            switch (confidence, existingReview.reviewCount) {
            case (1, _):
                interval = 60 * 10  // 10 minutes
            case (2, _):
                interval = 3600 * 4  // 4 hours
            case (3, let count):
                interval = 86400 * Double(count)  // 1 day * review count
            case (4, let count):
                interval = 86400 * 3 * Double(count)  // 3 days * review count
            default:
                interval = 86400
            }
            
            existingReview.nextReviewDate = Date().addingTimeInterval(interval)
        } else {
            // Create new review
            let newReview = FlashcardReview(stemID: stemID, confidence: confidence)
            modelContext.insert(newReview)
        }
        
        // Update progress
        userProgress.flashcardsReviewed += 1
        userProgress.updateStudyStreak()
        
        cardsReviewed += 1
    }
    
    func advanceToNextCard() {
        withAnimation(.easeInOut) {
            isFlipped = false
            showConfidenceButtons = false
            
            if currentIndex < dueCards.count - 1 {
                currentIndex += 1
            } else {
                sessionComplete = true
            }
        }
    }
}

// MARK: - Flashcard View

struct FlashcardView: View {
    let card: DrugStem
    let isFlipped: Bool
    let showConfidenceButtons: Bool
    let accentColor: Color
    let theme: AppTheme
    let onFlip: () -> Void
    let onConfidence: (Int) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Card
            Button(action: onFlip) {
                VStack(spacing: 24) {
                    if isFlipped {
                        // Back of card
                        VStack(spacing: 16) {
                            Text(card.stem.uppercased())
                                .font(.system(size: 36, weight: .black, design: .monospaced))
                                .foregroundColor(accentColor)
                            
                            Divider()
                                .background(theme.divider)
                            
                            VStack(spacing: 8) {
                                Text(card.drugClass)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(theme.primaryText)
                                
                                Text(card.therapeuticUse)
                                    .font(.system(size: 15, weight: .medium, design: .rounded))
                                    .foregroundColor(theme.secondaryText)
                                    .multilineTextAlignment(.center)
                            }
                            
                            Divider()
                                .background(theme.divider)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("EXAMPLES:")
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                                    .foregroundColor(accentColor)
                                
                                ForEach(card.examples.prefix(3), id: \.self) { example in
                                    Text("• \(example)")
                                        .font(.system(size: 14, weight: .medium, design: .monospaced))
                                        .foregroundColor(theme.primaryText)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("💡 KEY POINT:")
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                                    .foregroundColor(accentColor)
                                
                                Text(card.keyPoint)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                    .foregroundColor(theme.primaryText.opacity(0.85))
                                    .lineSpacing(3)
                            }
                            .padding(12)
                            .background(accentColor.opacity(0.08))
                            .cornerRadius(8)
                        }
                    } else {
                        // Front of card
                        VStack(spacing: 16) {
                            Image(systemName: "brain.head.profile")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(accentColor.opacity(0.3))
                            
                            Text(card.stem.uppercased())
                                .font(.system(size: 56, weight: .black, design: .monospaced))
                                .foregroundColor(accentColor)
                            
                            Text("Tap to reveal")
                                .font(.system(size: 13, weight: .semibold, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .padding(32)
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .background(theme.surface)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(accentColor.opacity(0.4), lineWidth: 2)
                )
                .shadow(color: accentColor.opacity(0.3), radius: 16, y: 8)
            }
            .buttonStyle(.plain)
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            
            Spacer()
            
            // Confidence buttons (only show after flip)
            if showConfidenceButtons {
                VStack(spacing: 12) {
                    Text("How well did you know this?")
                        .font(.system(size: 13, weight: .semibold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                    
                    HStack(spacing: 12) {
                        ConfidenceButton(label: "Again", sublabel: "10m", confidence: 1, accentColor: .red, theme: theme, action: onConfidence)
                        ConfidenceButton(label: "Hard", sublabel: "4h", confidence: 2, accentColor: .orange, theme: theme, action: onConfidence)
                        ConfidenceButton(label: "Good", sublabel: "1d", confidence: 3, accentColor: accentColor, theme: theme, action: onConfidence)
                        ConfidenceButton(label: "Easy", sublabel: "3d", confidence: 4, accentColor: .green, theme: theme, action: onConfidence)
                    }
                }
                .padding(.bottom, 20)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

// MARK: - Confidence Button

struct ConfidenceButton: View {
    let label: String
    let sublabel: String
    let confidence: Int
    let accentColor: Color
    let theme: AppTheme
    let action: (Int) -> Void
    
    var body: some View {
        Button(action: { action(confidence) }) {
            VStack(spacing: 4) {
                Text(label)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                Text(sublabel)
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(accentColor)
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Session Complete View

struct SessionCompleteView: View {
    let cardsReviewed: Int
    let accentColor: Color
    let theme: AppTheme
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(accentColor)
            
            VStack(spacing: 8) {
                Text("Session Complete!")
                    .font(.system(size: 28, weight: .black, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text("You reviewed \(cardsReviewed) flashcard\(cardsReviewed == 1 ? "" : "s")")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(theme.secondaryText)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("💡 Spaced repetition works because:")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
                
                Text("• Reviewing right before you forget strengthens memory\n• Multiple exposures = long-term retention\n• Confidence-based scheduling optimizes your time")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(theme.primaryText.opacity(0.85))
                    .lineSpacing(4)
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
            )
            
            Button(action: onRestart) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("REVIEW MORE")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(accentColor)
                .cornerRadius(12)
            }
            
            Spacer()
        }
        .padding(20)
    }
}

// MARK: - PREVIEW

#Preview {
    NavigationStack {
        FlashcardModeView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
            .environment(\.appTheme, .dark)
            .modelContainer(for: [LearningProgress.self, FlashcardReview.self])
    }
}
