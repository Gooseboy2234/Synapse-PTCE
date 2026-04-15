//
//  ExamViews.swift
//  Synapse PTCE
//
//  Intel Report, Review Queue (breach nodes), and Practice Exam Simulator.
//

import SwiftUI

// MARK: - Intel Report View

struct IntelReportView: View {
    let engine: GameEngine
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }
    private let green  = Color(red: 0.25, green: 0.95, blue: 0.55)
    private let red    = Color(red: 0.95, green: 0.30, blue: 0.30)
    private let cyan   = Color(red: 0.60, green: 0.90, blue: 1.00)

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackground().opacity(0.15).ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("// INTEL REPORT")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                            .foregroundColor(accent)
                            .shadow(color: theme.isDark ? accent.opacity(0.6) : .clear, radius: 5)
                        Text("SYSTEM DIAGNOSTIC — ALL SECTORS")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    Spacer()
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                .padding(.horizontal, 20).padding(.vertical, 16)
                .background(theme.surface.opacity(0.9))
                .overlay(Rectangle().fill(accent.opacity(0.25)).frame(height: 1), alignment: .bottom)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {

                        // ── Overall Stats ────────────────────────────
                        SectionHeader(title: "OVERALL", accent: accent)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            StatCard(label: "STABILITY", value: "\(engine.currentStabilityScore)/1000",
                                     color: accent, theme: theme)
                            StatCard(label: "ACCURACY",
                                     value: engine.currentAccuracyPercent,
                                     color: green, theme: theme)
                            StatCard(label: "NODES DONE",
                                     value: "\(engine.currentNodesCompleted)",
                                     color: cyan, theme: theme)
                            StatCard(label: "PERFECT",
                                     value: "\(engine.currentPerfectNodes)",
                                     color: Color(red: 1.0, green: 0.85, blue: 0.2), theme: theme)
                            StatCard(label: "BREACH NODES",
                                     value: "\(engine.breachNodes.count)",
                                     color: engine.breachNodes.isEmpty ? green : red, theme: theme)
                            StatCard(label: "SYSTEM RANK",
                                     value: engine.currentSystemRank.badge,
                                     color: accent, theme: theme)
                        }

                        // ── Domain Breakdown ──────────────────────────
                        SectionHeader(title: "SECTOR BREAKDOWN", accent: accent)

                        ForEach(KnowledgeDomain.allCases) { domain in
                            DomainStatRow(domain: domain, engine: engine, theme: theme)
                        }

                        // ── Breach Node List ──────────────────────────
                        let breaches = engine.breachNodes
                        if !breaches.isEmpty {
                            SectionHeader(title: "BREACH NODES (\(breaches.count))", accent: red)

                            ForEach(breaches.prefix(30)) { node in
                                HStack(spacing: 10) {
                                    // Domain color bar
                                    Rectangle()
                                        .fill(node.domain.accentColor)
                                        .frame(width: 3)
                                        .cornerRadius(2)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(node.nodeTitle)
                                            .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                            .foregroundColor(theme.primaryText)
                                        Text(node.domain.displayName)
                                            .font(.system(size: 9, design: .monospaced))
                                            .foregroundColor(theme.secondaryText)
                                    }

                                    Spacer()

                                    let wrongs = engine.wrongAttempts(for: node)
                                    Text("\(wrongs)✗")
                                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                                        .foregroundColor(red)
                                        .padding(.horizontal, 6).padding(.vertical, 3)
                                        .background(red.opacity(0.12))
                                        .cornerRadius(4)
                                }
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(theme.surface)
                                .cornerRadius(8)
                            }
                            if breaches.count > 30 {
                                Text("+ \(breaches.count - 30) more breach nodes…")
                                    .font(.system(size: 10, design: .monospaced))
                                    .foregroundColor(theme.secondaryText)
                                    .padding(.horizontal, 10)
                            }
                        } else {
                            HStack(spacing: 8) {
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(green)
                                Text("NO BREACH NODES — ALL CLEAR")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(green)
                            }
                            .padding(14)
                            .frame(maxWidth: .infinity)
                            .background(green.opacity(0.08))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(green.opacity(0.3), lineWidth: 1))
                            .cornerRadius(8)
                        }

                        Spacer(minLength: 30)
                    }
                    .padding(20)
                }
            }
        }
    }
}

private struct SectionHeader: View {
    let title: String
    let accent: Color
    var body: some View {
        HStack {
            Rectangle().fill(accent).frame(width: 3, height: 14).cornerRadius(2)
            Text(title)
                .font(.system(size: 10, weight: .black, design: .monospaced))
                .foregroundColor(accent)
        }
    }
}

private struct StatCard: View {
    let label: String
    let value: String
    let color: Color
    let theme: AppTheme
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 8, weight: .semibold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
            Text(value)
                .font(.system(size: 18, weight: .black, design: .monospaced))
                .foregroundColor(color)
                .shadow(color: theme.isDark ? color.opacity(0.5) : .clear, radius: 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(theme.surface)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(color.opacity(0.25), lineWidth: 1))
        .cornerRadius(8)
    }
}

private struct DomainStatRow: View {
    let domain: KnowledgeDomain
    let engine: GameEngine
    let theme: AppTheme

    private var progress: DomainProgress { engine.progress(for: domain) }
    private var perfectCount: Int {
        engine.nodes.filter { $0.domain == domain && engine.mastery(for: $0) == .perfect }.count
    }
    private var breachCount: Int { engine.breachNodes.filter { $0.domain == domain }.count }

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(domain.terminalSectorLabel)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(domain.accentColor)
                Spacer()
                Text("\(progress.completed)/\(progress.total)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                Text(String(format: "%.0f%%", progress.percentComplete * 100))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(domain.accentColor)
                    .frame(width: 38, alignment: .trailing)
            }

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(domain.accentColor.opacity(0.12))
                    Capsule().fill(domain.accentColor.opacity(0.85))
                        .frame(width: geo.size.width * progress.percentComplete)
                }
            }
            .frame(height: 4)

            HStack(spacing: 16) {
                Label("\(perfectCount) perfect", systemImage: "star.fill")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.2))
                if breachCount > 0 {
                    Label("\(breachCount) breach", systemImage: "exclamationmark.triangle.fill")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(Color(red: 0.95, green: 0.30, blue: 0.30))
                }
                Spacer()
                Text(domain.examWeightLabel)
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
        }
        .padding(12)
        .background(theme.surface)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(domain.accentColor.opacity(0.22), lineWidth: 1))
        .cornerRadius(8)
    }
}

// MARK: - Review Queue View

struct ReviewQueueView: View {
    let engine: GameEngine
    /// Called when user selects a node — parent dismisses this sheet then presents EncounterView.
    let onSelectNode: (DataNode) -> Void

    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }
    private let red = Color(red: 0.95, green: 0.30, blue: 0.30)

    private var breaches: [DataNode] { engine.breachNodes }

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackground().opacity(0.15).ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("// BREACH QUEUE")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                            .foregroundColor(red)
                            .shadow(color: theme.isDark ? red.opacity(0.5) : .clear, radius: 5)
                        Text("\(breaches.count) NODE\(breaches.count == 1 ? "" : "S") REQUIRING REMEDIATION")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    Spacer()
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(theme.secondaryText)
                    }
                }
                .padding(.horizontal, 20).padding(.vertical, 16)
                .background(theme.surface.opacity(0.9))
                .overlay(Rectangle().fill(red.opacity(0.3)).frame(height: 1), alignment: .bottom)

                if breaches.isEmpty {
                    Spacer()
                    VStack(spacing: 14) {
                        Image(systemName: "checkmark.shield.fill")
                            .font(.system(size: 44))
                            .foregroundColor(Color(red: 0.25, green: 0.95, blue: 0.55))
                            .shadow(color: Color(red: 0.25, green: 0.95, blue: 0.55).opacity(0.6), radius: 10)
                        Text("NO BREACH NODES")
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(Color(red: 0.25, green: 0.95, blue: 0.55))
                        Text("All answered nodes have achieved perfect mastery.")
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                            .multilineTextAlignment(.center)
                    }
                    .padding(30)
                    Spacer()
                } else {
                    // Instructions
                    HStack(spacing: 6) {
                        Image(systemName: "info.circle").font(.system(size: 10))
                        Text("Tap a node to re-encounter it. Answering correctly reduces its breach count.")
                    }
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .padding(.horizontal, 20).padding(.vertical, 10)
                    .background(theme.surface.opacity(0.5))

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 8) {
                            ForEach(KnowledgeDomain.allCases) { domain in
                                let domainBreaches = breaches.filter { $0.domain == domain }
                                if !domainBreaches.isEmpty {
                                    // Domain section header
                                    HStack {
                                        Rectangle().fill(domain.accentColor).frame(width: 3, height: 14).cornerRadius(2)
                                        Text(domain.terminalSectorLabel)
                                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                                            .foregroundColor(domain.accentColor)
                                        Spacer()
                                        Text("\(domainBreaches.count)")
                                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                                            .foregroundColor(red)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.top, 8)

                                    ForEach(domainBreaches) { node in
                                        BreachNodeRow(node: node,
                                                      wrongCount: engine.wrongAttempts(for: node),
                                                      domain: domain,
                                                      theme: theme) {
                                            onSelectNode(node)
                                            dismiss()
                                        }
                                        .padding(.horizontal, 16)
                                    }
                                }
                            }
                            Spacer(minLength: 30)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
        }
    }
}

private struct BreachNodeRow: View {
    let node: DataNode
    let wrongCount: Int
    let domain: KnowledgeDomain
    let theme: AppTheme
    let onTap: () -> Void

    private let red = Color(red: 0.95, green: 0.30, blue: 0.30)

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                // Wrong count badge
                VStack {
                    Text("\(wrongCount)")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .foregroundColor(red)
                    Text("ERR")
                        .font(.system(size: 7, weight: .bold, design: .monospaced))
                        .foregroundColor(red.opacity(0.7))
                }
                .frame(width: 36)
                .padding(.vertical, 4)
                .background(red.opacity(0.1))
                .cornerRadius(6)

                VStack(alignment: .leading, spacing: 3) {
                    Text(node.nodeTitle)
                        .font(.system(size: 11, weight: .semibold, design: .monospaced))
                        .foregroundColor(theme.primaryText)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    if node.angle != .classification {
                        Text(node.angle.badge)
                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                            .foregroundColor(domain.accentColor)
                            .padding(.horizontal, 5).padding(.vertical, 2)
                            .background(domain.accentColor.opacity(0.15))
                            .cornerRadius(3)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(domain.accentColor.opacity(0.6))
            }
            .padding(12)
            .background(theme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(red.opacity(0.28), lineWidth: 1)
            )
            .cornerRadius(8)
        }
    }
}

// MARK: - Practice Exam View

struct PracticeExamView: View {
    let engine: GameEngine
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme

    private var accent: Color { engine.currentTheme.accentColor }

    @State private var phase: ExamPhase = .briefing
    @State private var questions: [DataNode] = []
    @State private var currentIndex = 0
    @State private var answers: [UUID: Bool] = [:]   // nodeId → wasCorrect
    @State private var selected = ""
    @State private var showFeedback = false
    @State private var timeRemaining = 7200            // 120 minutes in seconds
    @State private var timerTask: Task<Void, Never>? = nil
    @State private var advanceTask: Task<Void, Never>? = nil

    enum ExamPhase { case briefing, active, complete }

    private var totalQuestions: Int { questions.count }
    private var answered: Int { answers.count }
    private var correctCount: Int { answers.values.filter { $0 }.count }
    private var scorePercent: Double { totalQuestions > 0 ? Double(correctCount) / Double(totalQuestions) : 0 }
    private var isPassing: Bool { scorePercent >= 0.78 }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GridBackground().opacity(0.2).ignoresSafeArea()

            switch phase {
            case .briefing: briefingView
            case .active:   activeView
            case .complete: resultsView
            }
        }
        .onDisappear { timerTask?.cancel(); advanceTask?.cancel() }
    }

    // MARK: Briefing

    private var briefingView: some View {
        VStack(spacing: 0) {
            examHeader(title: "PRACTICE EXAM")
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("// PTCB SIMULATION PROTOCOL")
                    .font(.system(size: 16, weight: .black, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.6), radius: 6)

                VStack(alignment: .leading, spacing: 10) {
                    ExamRule(icon: "questionmark.circle.fill", text: "Up to 90 questions sampled across all 4 domains", accent: accent)
                    ExamRule(icon: "timer", text: "120-minute time limit — real PTCB exam pacing", accent: accent)
                    ExamRule(icon: "chart.bar.fill", text: "Domain weights: D1 31 · D2 17 · D3 21 · D4 21", accent: accent)
                    ExamRule(icon: "lock.fill", text: "Results are not saved to your stability score", accent: accent)
                    ExamRule(icon: "checkmark.seal.fill", text: "Passing threshold: 78% correct (PTCB estimate)", accent: accent)
                }

                let pool = engine.practiceExamSample()
                if pool.isEmpty {
                    Text("// INSUFFICIENT DATA — complete more nodes to unlock the exam simulator.")
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundColor(Color(red: 0.95, green: 0.30, blue: 0.30))
                        .padding(12)
                        .background(Color.red.opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.red.opacity(0.3), lineWidth: 1))
                        .cornerRadius(6)
                } else {
                    Text("// \(pool.count) QUESTIONS LOADED FROM YOUR COMPLETED NODES")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(accent.opacity(0.7))
                }

                HStack(spacing: 12) {
                    Button {
                        let pool = engine.practiceExamSample()
                        guard !pool.isEmpty else { return }
                        questions = pool
                        currentIndex = 0
                        answers = [:]
                        selected = ""
                        showFeedback = false
                        timeRemaining = 7200
                        phase = .active
                        startTimer()
                    } label: {
                        Text("BEGIN SIMULATION")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(accent)
                            .cornerRadius(8)
                            .shadow(color: accent.opacity(0.5), radius: 8)
                    }
                    .disabled(engine.practiceExamSample().isEmpty)

                    Button {
                        dismiss()
                    } label: {
                        Text("CANCEL")
                            .font(.system(size: 13, weight: .semibold, design: .monospaced))
                            .foregroundColor(accent.opacity(0.7))
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(accent.opacity(0.3), lineWidth: 1))
                    }
                }
            }
            .padding(24)
            Spacer()
        }
    }

    // MARK: Active Exam

    private var activeView: some View {
        VStack(spacing: 0) {
            // Exam top bar
            VStack(spacing: 6) {
                HStack {
                    // Progress
                    Text("\(answered + 1)/\(totalQuestions)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(accent)
                    Spacer()
                    // Timer
                    HStack(spacing: 4) {
                        Image(systemName: "timer").font(.system(size: 10))
                        Text(timeString(timeRemaining))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(timeRemaining < 300 ? .red : accent)
                    .shadow(color: timeRemaining < 300 ? Color.red.opacity(0.8) : .clear, radius: 5)
                    Spacer()
                    // Score so far
                    Text("\(correctCount)✓")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.25, green: 0.95, blue: 0.55))
                }
                .padding(.horizontal, 20)

                // Question progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle().fill(accent.opacity(0.12))
                        Rectangle()
                            .fill(accent)
                            .frame(width: totalQuestions > 0
                                   ? geo.size.width * Double(answered) / Double(totalQuestions)
                                   : 0)
                    }
                }
                .frame(height: 2)
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.04))
            .overlay(Rectangle().fill(accent.opacity(0.2)).frame(height: 1), alignment: .bottom)

            if currentIndex < questions.count {
                let node = questions[currentIndex]
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        // Domain + question number
                        HStack {
                            Text(node.domain.terminalSectorLabel)
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundColor(node.domain.accentColor.opacity(0.7))
                            Spacer()
                            Text("Q\(currentIndex + 1)")
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                                .foregroundColor(accent.opacity(0.5))
                        }

                        // Node title
                        Text(node.nodeTitle)
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(node.domain.accentColor)

                        Divider().background(node.domain.accentColor.opacity(0.25))

                        // Lore / stem
                        Text(node.loreText)
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(.white.opacity(0.82))
                            .lineSpacing(4)

                        Divider().background(node.domain.accentColor.opacity(0.25))

                        Text("> SELECT THE CORRECT ANSWER:")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(node.domain.accentColor)

                        // Options
                        VStack(spacing: 8) {
                            ForEach(node.options, id: \.self) { opt in
                                ExamOptionButton(
                                    option: opt,
                                    isSelected: selected == opt,
                                    feedbackState: showFeedback
                                        ? (opt == node.correctAnswer ? .correct
                                           : (opt == selected ? .wrong : .neutral))
                                        : .neutral,
                                    color: node.domain.accentColor
                                ) {
                                    guard !showFeedback else { return }
                                    selected = opt
                                }
                            }
                        }

                        // Submit / feedback
                        if !showFeedback {
                            Button {
                                guard !selected.isEmpty else { return }
                                let correct = selected == node.correctAnswer
                                answers[node.id] = correct
                                showFeedback = true
                                scheduleAdvance()
                            } label: {
                                Text(selected.isEmpty ? "SELECT AN ANSWER" : "SUBMIT ANSWER")
                                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                                    .foregroundColor(selected.isEmpty ? node.domain.accentColor.opacity(0.4) : .black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 13)
                                    .background(selected.isEmpty ? Color.clear : node.domain.accentColor)
                                    .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(node.domain.accentColor.opacity(selected.isEmpty ? 0.3 : 0), lineWidth: 1))
                                    .cornerRadius(6)
                            }
                            .disabled(selected.isEmpty)
                        } else {
                            let correct = answers[node.id] == true
                            HStack(spacing: 8) {
                                Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(correct ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                                Text(correct ? "CORRECT" : "INCORRECT — \(node.correctAnswer)")
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                                    .foregroundColor(correct ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background((correct ? Color.green : Color.red).opacity(0.08))
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke((correct ? Color.green : Color.red).opacity(0.3), lineWidth: 1))
                            .cornerRadius(6)

                            Text("// AUTO-ADVANCING TO NEXT QUESTION…")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundColor(accent.opacity(0.45))
                        }
                    }
                    .padding(20)
                }
            }
        }
    }

    // MARK: Results

    private var resultsView: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                examHeader(title: "EXAM RESULTS")

                // Pass/Fail banner
                HStack(spacing: 12) {
                    Image(systemName: isPassing ? "checkmark.shield.fill" : "xmark.shield.fill")
                        .font(.system(size: 36))
                        .foregroundColor(isPassing ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                        .shadow(color: (isPassing ? Color.green : Color.red).opacity(0.7), radius: 10)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(isPassing ? "PREDICTED PASS" : "NEEDS IMPROVEMENT")
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(isPassing ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                        Text(String(format: "%.0f%% correct  (%d/%d)", scorePercent * 100, correctCount, totalQuestions))
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background((isPassing ? Color.green : Color.red).opacity(0.07))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke((isPassing ? Color.green : Color.red).opacity(0.3), lineWidth: 1))
                .cornerRadius(10)

                // Domain breakdown
                Text("// DOMAIN BREAKDOWN")
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .foregroundColor(accent)

                ForEach(KnowledgeDomain.allCases) { domain in
                    let domainQs = questions.filter { $0.domain == domain }
                    let domainCorrect = domainQs.filter { answers[$0.id] == true }.count
                    let pct = domainQs.isEmpty ? 0.0 : Double(domainCorrect) / Double(domainQs.count)
                    ExamDomainResult(domain: domain, correct: domainCorrect,
                                     total: domainQs.count, pct: pct)
                }

                // Dismiss
                Button { dismiss() } label: {
                    Text("RETURN TO NETWORK")
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(accent)
                        .cornerRadius(8)
                        .shadow(color: accent.opacity(0.5), radius: 8)
                }
                .padding(.top, 8)
                Spacer(minLength: 40)
            }
            .padding(20)
        }
    }

    // MARK: Helpers

    @ViewBuilder
    private func examHeader(title: String) -> some View {
        HStack {
            Text("// \(title)")
                .font(.system(size: 13, weight: .black, design: .monospaced))
                .foregroundColor(accent)
                .shadow(color: theme.isDark ? accent.opacity(0.6) : .clear, radius: 5)
            Spacer()
            if phase == .briefing || phase == .complete {
                Button { dismiss() } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white.opacity(0.4))
                }
            }
        }
        .padding(.horizontal, 20).padding(.vertical, 14)
        .background(Color.white.opacity(0.04))
        .overlay(Rectangle().fill(accent.opacity(0.2)).frame(height: 1), alignment: .bottom)
    }

    private func timeString(_ seconds: Int) -> String {
        let m = seconds / 60, s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }

    private func startTimer() {
        timerTask = Task {
            while timeRemaining > 0 {
                try? await Task.sleep(for: .seconds(1))
                guard !Task.isCancelled else { return }
                timeRemaining -= 1
            }
            // Time expired — complete the exam
            guard !Task.isCancelled else { return }
            phase = .complete
        }
    }

    private func scheduleAdvance() {
        advanceTask?.cancel()
        advanceTask = Task {
            try? await Task.sleep(for: .milliseconds(1600))
            guard !Task.isCancelled else { return }
            advanceToNext()
        }
    }

    private func advanceToNext() {
        let next = currentIndex + 1
        if next >= totalQuestions {
            timerTask?.cancel()
            phase = .complete
        } else {
            currentIndex = next
            selected = ""
            showFeedback = false
        }
    }
}

// MARK: - Exam Sub-views

private struct ExamRule: View {
    let icon: String
    let text: String
    let accent: Color
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 11))
                .foregroundColor(accent)
                .frame(width: 16)
            Text(text)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(.white.opacity(0.75))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private enum FeedbackState { case neutral, correct, wrong }

private struct ExamOptionButton: View {
    let option: String
    let isSelected: Bool
    let feedbackState: FeedbackState
    let color: Color
    let onTap: () -> Void

    private var borderColor: Color {
        switch feedbackState {
        case .correct: return .green
        case .wrong:   return .red
        case .neutral: return isSelected ? color.opacity(0.7) : color.opacity(0.2)
        }
    }

    private var bgColor: Color {
        switch feedbackState {
        case .correct: return Color.green.opacity(0.12)
        case .wrong:   return Color.red.opacity(0.12)
        case .neutral: return isSelected ? color.opacity(0.1) : Color.white.opacity(0.03)
        }
    }

    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(option)
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundColor(.white.opacity(feedbackState == .neutral ? 0.85 : 0.6))
                    .multilineTextAlignment(.leading)
                Spacer()
                if feedbackState == .correct {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                } else if feedbackState == .wrong {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                }
            }
            .padding(.horizontal, 14).padding(.vertical, 11)
            .background(bgColor)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(borderColor, lineWidth: 1))
            .cornerRadius(8)
        }
        .disabled(feedbackState != .neutral)
    }
}

private struct ExamDomainResult: View {
    let domain: KnowledgeDomain
    let correct: Int
    let total: Int
    let pct: Double

    private var color: Color {
        pct >= 0.78 ? Color(red: 0.25, green: 0.95, blue: 0.55) :
        pct >= 0.60 ? Color(red: 1.0, green: 0.85, blue: 0.2) : .red
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text(domain.terminalSectorLabel)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(domain.accentColor)
                Spacer()
                Text("\(correct)/\(total)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                Text(String(format: "%.0f%%", pct * 100))
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(color.opacity(0.8))
                    .frame(width: 40, alignment: .trailing)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(color.opacity(0.12))
                    Capsule().fill(color.opacity(0.85))
                        .frame(width: geo.size.width * pct)
                }
            }
            .frame(height: 4)
        }
        .padding(12)
        .background(Color.white.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(domain.accentColor.opacity(0.2), lineWidth: 1))
        .cornerRadius(8)
    }
}

// MARK: - GameEngine display helpers (used by IntelReportView)

extension GameEngine {
    var currentAccuracyPercent: String {
        guard currentTotalAttempts > 0 else { return "N/A" }
        let rate = Double(currentNodesCompleted) / Double(currentTotalAttempts)
        return String(format: "%.0f%%", rate * 100)
    }
}
