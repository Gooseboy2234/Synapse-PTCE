//
//  StemQuizView.swift
//  Synapse PTCE
//
//  STEM RECOGNITION QUIZ
//  Tests your ability to identify drug classes from generic names.
//  Just like the real PTCE — see a drug → know its class immediately.
//
//  Question types:
//  - "Which class does lisinopril belong to?"
//  - "All of the following end in -statin EXCEPT:"
//  - "A patient is prescribed metoprolol. What is its mechanism?"
//

import SwiftUI
import SwiftData

struct StemQuizView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var hasAnswered = false
    @State private var score = 0
    @State private var quizComplete = false
    @State private var startTime = Date()
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    let totalQuestions = 10
    
    @State private var questions: [StemQuizQuestion] = []
    
    var currentQuestion: StemQuizQuestion? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
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
                            Text("STEM QUIZ")
                                .font(.system(size: 20, weight: .black, design: .monospaced))
                                .foregroundColor(theme.primaryText)
                            
                            Text("Test Your Drug Class Recognition")
                                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(accentColor)
                            Text("\(score)/\(currentQuestionIndex)")
                                .font(.system(size: 16, weight: .bold, design: .monospaced))
                                .foregroundColor(accentColor)
                        }
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
                                .frame(width: geo.size.width * (Double(currentQuestionIndex) / Double(totalQuestions)), height: 6)
                        }
                    }
                    .frame(height: 6)
                    .padding(.horizontal, 20)
                }
                
                Divider()
                    .background(theme.divider)
                    .padding(.top, 12)
                
                if quizComplete {
                    QuizCompleteView(
                        score: score,
                        totalQuestions: totalQuestions,
                        timeSpent: Int(Date().timeIntervalSince(startTime)),
                        accentColor: accentColor,
                        theme: theme,
                        onRetake: {
                            questions = StemQuizQuestion.generateQuiz(count: totalQuestions)
                            currentQuestionIndex = 0
                            selectedAnswer = nil
                            hasAnswered = false
                            score = 0
                            quizComplete = false
                            startTime = Date()
                        }
                    )
                } else if let question = currentQuestion {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Question number
                            Text("QUESTION \(currentQuestionIndex + 1) of \(totalQuestions)")
                                .font(.system(size: 11, weight: .bold, design: .monospaced))
                                .foregroundColor(accentColor)
                            
                            // Question text
                            Text(question.questionText)
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(theme.primaryText)
                                .lineSpacing(4)
                            
                            // Options
                            VStack(spacing: 12) {
                                ForEach(question.options, id: \.self) { option in
                                    AnswerButton(
                                        option: option,
                                        isSelected: selectedAnswer == option,
                                        isCorrect: hasAnswered && option == question.correctAnswer,
                                        isWrong: hasAnswered && selectedAnswer == option && option != question.correctAnswer,
                                        accentColor: accentColor,
                                        theme: theme,
                                        onTap: {
                                            if !hasAnswered {
                                                selectedAnswer = option
                                            }
                                        }
                                    )
                                }
                            }
                            
                            // Submit / Next button
                            if !hasAnswered {
                                Button(action: submitAnswer) {
                                    Text("SUBMIT ANSWER")
                                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(selectedAnswer == nil ? theme.secondaryText.opacity(0.3) : accentColor)
                                        .cornerRadius(12)
                                }
                                .disabled(selectedAnswer == nil)
                            } else {
                                // Explanation
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: selectedAnswer == question.correctAnswer ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .foregroundColor(selectedAnswer == question.correctAnswer ? .green : .red)
                                        Text(selectedAnswer == question.correctAnswer ? "CORRECT!" : "INCORRECT")
                                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                                            .foregroundColor(selectedAnswer == question.correctAnswer ? .green : .red)
                                    }
                                    
                                    Text(question.explanation)
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundColor(theme.primaryText.opacity(0.85))
                                        .lineSpacing(3)
                                }
                                .padding(14)
                                .background(theme.surface)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke((selectedAnswer == question.correctAnswer ? Color.green : Color.red).opacity(0.4), lineWidth: 2)
                                )
                                
                                Button(action: nextQuestion) {
                                    HStack {
                                        Text(currentQuestionIndex < totalQuestions - 1 ? "NEXT QUESTION" : "FINISH QUIZ")
                                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                                        Image(systemName: "arrow.right")
                                    }
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(accentColor)
                                    .cornerRadius(12)
                                }
                            }
                        }
                        .padding(20)
                    }
                } else {
                    // Loading
                    ProgressView()
                        .tint(accentColor)
                }
            }
        }
        .navigationTitle("Stem Quiz")
        .inlineNavigationTitle()
        .onAppear {
            if questions.isEmpty {
                questions = StemQuizQuestion.generateQuiz(count: totalQuestions)
            }
        }
    }
    
    func submitAnswer() {
        withAnimation {
            hasAnswered = true
            if selectedAnswer == currentQuestion?.correctAnswer {
                score += 1
                userProgress.quizCorrectAnswers += 1
            }
            userProgress.quizTotalQuestions += 1
        }
    }
    
    func nextQuestion() {
        withAnimation {
            if currentQuestionIndex < totalQuestions - 1 {
                currentQuestionIndex += 1
                selectedAnswer = nil
                hasAnswered = false
            } else {
                // Quiz complete
                quizComplete = true
                userProgress.quizzesCompleted += 1
                userProgress.lastQuizScore = Double(score) / Double(totalQuestions)
                userProgress.updateStudyStreak()
                
                // Save quiz result
                let timeSpent = Int(Date().timeIntervalSince(startTime))
                let result = QuizResult(
                    quizType: "STEM_RECOGNITION",
                    score: Double(score) / Double(totalQuestions),
                    totalQuestions: totalQuestions,
                    correctAnswers: score,
                    timeSpent: timeSpent
                )
                modelContext.insert(result)
            }
        }
    }
}

// MARK: - Answer Button

struct AnswerButton: View {
    let option: String
    let isSelected: Bool
    let isCorrect: Bool
    let isWrong: Bool
    let accentColor: Color
    let theme: AppTheme
    let onTap: () -> Void
    
    var borderColor: Color {
        if isCorrect { return .green }
        if isWrong { return .red }
        if isSelected { return accentColor }
        return theme.divider
    }
    
    var backgroundColor: Color {
        if isCorrect { return Color.green.opacity(0.15) }
        if isWrong { return Color.red.opacity(0.15) }
        if isSelected { return accentColor.opacity(0.1) }
        return theme.surface
    }
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(option)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(theme.primaryText)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                if isCorrect {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                } else if isWrong {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                }
            }
            .padding(14)
            .background(backgroundColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Quiz Complete View

struct QuizCompleteView: View {
    let score: Int
    let totalQuestions: Int
    let timeSpent: Int
    let accentColor: Color
    let theme: AppTheme
    let onRetake: () -> Void
    
    var percentage: Double {
        Double(score) / Double(totalQuestions) * 100
    }
    
    var performanceLevel: String {
        switch percentage {
        case 90...: return "EXCELLENT!"
        case 80..<90: return "GREAT JOB!"
        case 70..<80: return "GOOD WORK!"
        case 60..<70: return "KEEP PRACTICING"
        default: return "REVIEW NEEDED"
        }
    }
    
    var performanceColor: Color {
        switch percentage {
        case 90...: return .green
        case 80..<90: return accentColor
        case 70..<80: return .orange
        default: return .red
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Score circle
                ZStack {
                    Circle()
                        .stroke(theme.divider, lineWidth: 12)
                        .frame(width: 160, height: 160)
                    
                    Circle()
                        .trim(from: 0, to: percentage / 100)
                        .stroke(performanceColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 160, height: 160)
                        .rotationEffect(.degrees(-90))
                    
                    VStack(spacing: 4) {
                        Text("\(Int(percentage))%")
                            .font(.system(size: 42, weight: .black, design: .monospaced))
                            .foregroundColor(performanceColor)
                        
                        Text("\(score)/\(totalQuestions)")
                            .font(.system(size: 14, weight: .semibold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                .padding(.top, 40)
                
                Text(performanceLevel)
                    .font(.system(size: 24, weight: .black, design: .monospaced))
                    .foregroundColor(performanceColor)
                
                // Stats
                HStack(spacing: 16) {
                    StatCard(label: "Time", value: formatTime(timeSpent), icon: "clock.fill", accentColor: accentColor, theme: theme)
                    StatCard(label: "Accuracy", value: "\(Int(percentage))%", icon: "target", accentColor: accentColor, theme: theme)
                }
                
                // Feedback
                VStack(alignment: .leading, spacing: 12) {
                    if percentage >= 80 {
                        FeedbackCard(
                            icon: "star.fill",
                            title: "You're mastering the stems!",
                            message: "Keep up the great work. This pattern recognition is exactly what the PTCE tests.",
                            color: .green,
                            theme: theme
                        )
                    } else {
                        FeedbackCard(
                            icon: "book.fill",
                            title: "Review recommended",
                            message: "Revisit the Drug Stems section and use flashcards to reinforce the patterns. Focus on the stems you missed.",
                            color: .orange,
                            theme: theme
                        )
                    }
                }
                
                // Buttons
                VStack(spacing: 12) {
                    Button(action: onRetake) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("RETAKE QUIZ")
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(accentColor)
                        .cornerRadius(12)
                    }
                }
            }
            .padding(20)
        }
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%d:%02d", minutes, secs)
    }
}

// MARK: - Stat Card

fileprivate struct StatCard: View {
    let label: String
    let value: String
    let icon: String
    let accentColor: Color
    let theme: AppTheme
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(accentColor)
            
            Text(value)
                .font(.system(size: 20, weight: .black, design: .monospaced))
                .foregroundColor(theme.primaryText)
            
            Text(label)
                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(theme.surface)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
        )
    }
}

// MARK: - Feedback Card

struct FeedbackCard: View {
    let icon: String
    let title: String
    let message: String
    let color: Color
    let theme: AppTheme
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(theme.primaryText)
                
                Text(message)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(theme.secondaryText)
                    .lineSpacing(3)
            }
        }
        .padding(14)
        .background(color.opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color.opacity(0.3), lineWidth: 1.5)
        )
    }
}

// MARK: - Quiz Question Model

struct StemQuizQuestion {
    let questionText: String
    let options: [String]
    let correctAnswer: String
    let explanation: String
    
    static func generateQuiz(count: Int) -> [StemQuizQuestion] {
        var questions: [StemQuizQuestion] = []
        let stems = DrugStem.allStems.shuffled()
        
        for i in 0..<min(count, stems.count) {
            let stem = stems[i]
            
            // Generate question: "Which class does [example drug] belong to?"
            let exampleDrug = stem.examples.randomElement() ?? stem.examples[0]
            let questionText = "Which drug class does \(exampleDrug) belong to?"
            
            // Generate options: correct answer + 3 random wrong answers
            var options = [stem.drugClass]
            let otherStems = stems.filter { $0.id != stem.id }.shuffled()
            for otherStem in otherStems.prefix(3) {
                options.append(otherStem.drugClass)
            }
            options.shuffle()
            
            let explanation = "\(exampleDrug) ends in \(stem.stem), which indicates it's a \(stem.drugClass). These drugs are used for: \(stem.therapeuticUse). Key point: \(stem.keyPoint)"
            
            questions.append(StemQuizQuestion(
                questionText: questionText,
                options: options,
                correctAnswer: stem.drugClass,
                explanation: explanation
            ))
        }
        
        return questions
    }
}

// MARK: - PREVIEW

#Preview {
    NavigationStack {
        StemQuizView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
            .environment(\.appTheme, .dark)
            .modelContainer(for: [LearningProgress.self, QuizResult.self])
    }
}
