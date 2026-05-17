//
//  BlueprintExamView.swift
//  Synapse PTCE
//
//  Full-length PTCB-format diagnostic exam: 90 questions, 1h 50min timer,
//  blueprint-weighted sampling (Med 40%, Federal 12.5%, Patient Safety 26.25%,
//  Order Entry 21.25%), approximate scaled score on the 1400–1900 PTCB scale,
//  per-domain breakdown, and post-exam wrong-answer review. Persists each
//  attempt via SwiftData (ExamAttempt) so the readiness signal can use exam
//  history.
//
//  This view runs alongside the existing PracticeExamView. PracticeExamView
//  is the lightweight casual mode (random sample, raw %); BlueprintExamView
//  is the full diagnostic.
//

import SwiftUI

// MARK: - Blueprint Exam View

struct BlueprintExamView: View {
    let engine: GameEngine

    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme

    private var accent: Color { engine.currentTheme.accentColor }

    // MARK: State

    @State private var phase: ExamPhase = .briefing
    @State private var questions: [DataNode] = []
    @State private var currentIndex = 0
    @State private var answers: [UUID: Bool] = [:]
    @State private var selected = ""
    @State private var showFeedback = false
    @State private var timeRemaining = 6600              // 1h 50min in seconds
    @State private var timerTask: Task<Void, Never>? = nil
    @State private var advanceTask: Task<Void, Never>? = nil

    @State private var savedAttempt: ExamAttempt? = nil
    @State private var showingReview = false

    enum ExamPhase { case briefing, active, complete }

    private var totalQuestions: Int { questions.count }
    private var answered: Int { answers.count }
    private var correctCount: Int { answers.values.filter { $0 }.count }
    private var rawPercent: Double {
        totalQuestions > 0 ? Double(correctCount) / Double(totalQuestions) : 0
    }
    private var scaledScore: Int {
        BlueprintExamScoring.scaledScore(for: rawPercent)
    }
    private var didPass: Bool {
        scaledScore >= BlueprintExamScoring.passingScaledScore
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GridBackground().opacity(0.18).ignoresSafeArea()
            switch phase {
            case .briefing: briefingView
            case .active:   activeView
            case .complete: resultsView
            }
        }
        .onDisappear {
            timerTask?.cancel()
            advanceTask?.cancel()
        }
        .sheet(isPresented: $showingReview) {
            wrongAnswerReviewSheet
        }
    }

    // MARK: Briefing

    private var briefingView: some View {
        VStack(spacing: 0) {
            examHeader(title: "BLUEPRINT EXAM")
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("// PTCB FULL-LENGTH DIAGNOSTIC")
                    .font(.system(size: 16, weight: .black, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.6), radius: 6)

                VStack(alignment: .leading, spacing: 10) {
                    rule(icon: "doc.text.fill", text: "90 questions sampled by official PTCB blueprint")
                    rule(icon: "chart.bar.fill", text: "Medications 36 · Federal 11 · Patient Safety 24 · Order Entry 19")
                    rule(icon: "timer", text: "1 hour 50 minute timer — real PTCB pacing")
                    rule(icon: "rosette", text: "Approximate scaled score on the PTCB 1400–1900 scale (1400 = pass)")
                    rule(icon: "magnifyingglass", text: "Wrong-answer review available after the exam")
                    rule(icon: "tray.full.fill", text: "Result is saved — used by the readiness score and history")
                }

                if let last = engine.latestExamAttempt {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("// LAST ATTEMPT")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundColor(accent.opacity(0.6))
                        Text("\(last.scaledScore) (scaled) · \(last.rawCorrect)/\(last.totalQuestions) raw · \(last.didPass ? "PASS" : "DID NOT PASS")")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(.white.opacity(0.85))
                        Text(last.attemptDate.formatted(date: .abbreviated, time: .shortened))
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(.white.opacity(0.45))
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.03))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(accent.opacity(0.18), lineWidth: 1))
                    .cornerRadius(6)
                }

                Button {
                    startExam()
                } label: {
                    Text("BEGIN EXAM")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(accent)
                        .cornerRadius(8)
                        .shadow(color: accent.opacity(0.6), radius: 10)
                }
                .padding(.top, 8)
            }
            .padding(20)
            Spacer()
        }
    }

    private func rule(icon: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 12))
                .foregroundColor(accent)
                .frame(width: 22)
            Text(text)
                .font(.system(size: 12, design: .monospaced))
                .foregroundColor(.white.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    // MARK: Active

    private var activeView: some View {
        VStack(spacing: 0) {
            VStack(spacing: 6) {
                HStack {
                    Text("\(answered + 1)/\(totalQuestions)")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(accent)
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "timer").font(.system(size: 10))
                        Text(timeString(timeRemaining))
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(timeRemaining < 300 ? .red : accent)
                    .shadow(color: timeRemaining < 300 ? Color.red.opacity(0.8) : .clear, radius: 5)
                    Spacer()
                    Text("\(correctCount)✓")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(red: 0.25, green: 0.95, blue: 0.55))
                }
                .padding(.horizontal, 20)

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
                        HStack {
                            Text(node.domain.terminalSectorLabel)
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundColor(node.domain.accentColor.opacity(0.7))
                            Spacer()
                            Text("Q\(currentIndex + 1)")
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                                .foregroundColor(accent.opacity(0.5))
                        }

                        Text(node.nodeTitle)
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(node.domain.accentColor)

                        Divider().background(node.domain.accentColor.opacity(0.25))

                        Text(node.loreText)
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(.white.opacity(0.82))
                            .lineSpacing(4)

                        Divider().background(node.domain.accentColor.opacity(0.25))

                        Text("> SELECT THE CORRECT ANSWER:")
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .foregroundColor(node.domain.accentColor)

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

                        if !showFeedback {
                            Button {
                                guard !selected.isEmpty else { return }
                                let isCorrect = selected == node.correctAnswer
                                answers[node.id] = isCorrect
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
                            let isCorrect = answers[node.id] == true
                            HStack(spacing: 8) {
                                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(isCorrect ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                                Text(isCorrect ? "CORRECT" : "INCORRECT — \(node.correctAnswer)")
                                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                                    .foregroundColor(isCorrect ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background((isCorrect ? Color.green : Color.red).opacity(0.08))
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke((isCorrect ? Color.green : Color.red).opacity(0.3), lineWidth: 1))
                            .cornerRadius(6)

                            Text("// AUTO-ADVANCING…")
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

                // Scaled-score banner
                HStack(spacing: 14) {
                    Image(systemName: didPass ? "checkmark.shield.fill" : "xmark.shield.fill")
                        .font(.system(size: 36))
                        .foregroundColor(didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                        .shadow(color: (didPass ? Color.green : Color.red).opacity(0.7), radius: 10)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(scaledScore)")
                            .font(.system(size: 32, weight: .black, design: .monospaced))
                            .foregroundColor(didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                        Text("SCALED SCORE  ·  \(BlueprintExamScoring.passingScaledScore) TO PASS")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundColor(.white.opacity(0.55))
                            .tracking(1.2)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background((didPass ? Color.green : Color.red).opacity(0.08))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke((didPass ? Color.green : Color.red).opacity(0.3), lineWidth: 1))
                .cornerRadius(10)

                // Raw score line
                HStack {
                    label("RAW", "\(correctCount)/\(totalQuestions)")
                    Spacer()
                    label("PERCENT", String(format: "%.1f%%", rawPercent * 100))
                    Spacer()
                    label("TIME", timeString(6600 - timeRemaining))
                }

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

                // Caveat
                Text("Scaled score is an approximation. Actual PTCB scoring uses an unpublished item-response model and may differ.")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(.white.opacity(0.42))
                    .lineSpacing(3)
                    .padding(.top, 6)

                // Buttons
                VStack(spacing: 8) {
                    Button { showingReview = true } label: {
                        Text("REVIEW WRONG ANSWERS  (\(answers.values.filter { !$0 }.count))")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.white.opacity(0.9))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 13)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(accent.opacity(0.4), lineWidth: 1))
                    }
                    .disabled(answers.values.filter { !$0 }.isEmpty)

                    Button { dismiss() } label: {
                        Text("RETURN TO HUB")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(accent)
                            .cornerRadius(8)
                            .shadow(color: accent.opacity(0.5), radius: 8)
                    }
                }
                .padding(.top, 6)

                Spacer(minLength: 40)
            }
            .padding(20)
        }
    }

    // MARK: Wrong-answer review sheet

    private var wrongAnswerReviewSheet: some View {
        let wrongs = questions.filter { answers[$0.id] == false }
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("// WRONG ANSWERS  (\(wrongs.count))")
                        .font(.system(size: 11, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .padding(.bottom, 4)

                    ForEach(wrongs) { node in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(node.domain.terminalSectorLabel)
                                    .font(.system(size: 9, design: .monospaced))
                                    .foregroundColor(node.domain.accentColor.opacity(0.75))
                                Spacer()
                            }
                            Text(node.nodeTitle)
                                .font(.system(size: 13, weight: .bold, design: .monospaced))
                                .foregroundColor(node.domain.accentColor)
                            Text(node.loreText)
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundColor(.white.opacity(0.78))
                                .lineSpacing(3)
                            HStack(alignment: .top, spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color(red: 0.25, green: 0.95, blue: 0.55))
                                Text("CORRECT — \(node.correctAnswer)")
                                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.92))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(.top, 4)
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.03))
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(node.domain.accentColor.opacity(0.18), lineWidth: 1))
                        .cornerRadius(8)
                    }
                }
                .padding(20)
            }
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close") { showingReview = false }
                        .foregroundColor(accent)
                }
            }
            .navigationTitle("Review")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }

    // MARK: Helpers

    private func startExam() {
        questions = engine.blueprintExamSample()
        answers.removeAll()
        currentIndex = 0
        selected = ""
        showFeedback = false
        timeRemaining = 6600
        phase = .active
        startTimer()
    }

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

    private func label(_ k: String, _ v: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(k)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(accent.opacity(0.6))
                .tracking(1.2)
            Text(v)
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.white.opacity(0.92))
        }
    }

    private func timeString(_ seconds: Int) -> String {
        let h = max(0, seconds) / 3600
        let m = (max(0, seconds) % 3600) / 60
        let s = max(0, seconds) % 60
        if h > 0 { return String(format: "%d:%02d:%02d", h, m, s) }
        return String(format: "%d:%02d", m, s)
    }

    private func startTimer() {
        timerTask = Task {
            while timeRemaining > 0 {
                try? await Task.sleep(for: .seconds(1))
                guard !Task.isCancelled else { return }
                timeRemaining -= 1
            }
            guard !Task.isCancelled else { return }
            await MainActor.run { completeExam() }
        }
    }

    private func scheduleAdvance() {
        advanceTask?.cancel()
        advanceTask = Task {
            try? await Task.sleep(for: .milliseconds(1600))
            guard !Task.isCancelled else { return }
            await MainActor.run { advanceToNext() }
        }
    }

    private func advanceToNext() {
        let next = currentIndex + 1
        if next >= totalQuestions {
            timerTask?.cancel()
            completeExam()
        } else {
            currentIndex = next
            selected = ""
            showFeedback = false
        }
    }

    private func completeExam() {
        let timeUsed = 6600 - timeRemaining
        savedAttempt = engine.recordExamAttempt(
            questions: questions,
            answers: answers,
            timeUsedSeconds: timeUsed
        )
        phase = .complete
    }
}

// MARK: - Exam History View

struct ExamHistoryView: View {
    let engine: GameEngine

    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme

    private var accent: Color { engine.currentTheme.accentColor }

    var body: some View {
        NavigationStack {
            let attempts = engine.allExamAttempts()
            ZStack {
                Color.black.ignoresSafeArea()
                GridBackground().opacity(0.16).ignoresSafeArea()
                if attempts.isEmpty {
                    VStack(spacing: 14) {
                        Image(systemName: "tray")
                            .font(.system(size: 36))
                            .foregroundColor(accent.opacity(0.5))
                        Text("NO BLUEPRINT EXAMS YET")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundColor(accent.opacity(0.7))
                            .tracking(1.2)
                        Text("Take a full-length 90-question exam from the hub. Results land here for trend tracking.")
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(.white.opacity(0.55))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 36)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            // Trend strip — last up-to-10
                            trendStrip(attempts: Array(attempts.prefix(10).reversed()))
                                .padding(.horizontal, 20)
                                .padding(.top, 16)

                            ForEach(attempts) { attempt in
                                ExamHistoryRow(attempt: attempt, accent: accent)
                                    .padding(.horizontal, 20)
                            }
                            Spacer(minLength: 40)
                        }
                    }
                }
            }
            .navigationTitle("Exam History")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close") { dismiss() }
                        .foregroundColor(accent)
                }
            }
        }
    }

    private func trendStrip(attempts: [ExamAttempt]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("// TREND  (oldest → newest)")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(accent.opacity(0.6))
                .tracking(1.2)

            GeometryReader { geo in
                let w = geo.size.width
                let h: CGFloat = 80
                let scoreRange: CGFloat = 500          // 1400–1900
                let minScore: CGFloat = CGFloat(BlueprintExamScoring.scaledScoreFloor)

                ZStack(alignment: .topLeading) {
                    // Pass line at 1400
                    Rectangle().fill(Color.white.opacity(0.10)).frame(height: 1).offset(y: h)
                    // Bars
                    HStack(alignment: .bottom, spacing: 6) {
                        ForEach(Array(attempts.enumerated()), id: \.element.id) { _, a in
                            let scaled = CGFloat(max(BlueprintExamScoring.scaledScoreFloor, a.scaledScore))
                            let pct = (scaled - minScore) / scoreRange
                            let bar = max(4, h * pct)
                            VStack(spacing: 2) {
                                Spacer(minLength: 0)
                                Rectangle()
                                    .fill(a.didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : Color.red.opacity(0.85))
                                    .frame(width: max(8, (w - 6 * CGFloat(attempts.count - 1)) / CGFloat(max(1, attempts.count))),
                                           height: bar)
                                    .cornerRadius(2)
                            }
                            .frame(height: h)
                        }
                    }
                }
            }
            .frame(height: 80)
        }
    }
}

private struct ExamHistoryRow: View {
    let attempt: ExamAttempt
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline) {
                Text("\(attempt.scaledScore)")
                    .font(.system(size: 22, weight: .black, design: .monospaced))
                    .foregroundColor(attempt.didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                Text(attempt.didPass ? "PASS" : "DID NOT PASS")
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .foregroundColor(attempt.didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red)
                    .tracking(1.2)
                Spacer()
                Text(attempt.attemptDate.formatted(date: .abbreviated, time: .shortened))
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(.white.opacity(0.45))
            }

            HStack(spacing: 16) {
                pair("RAW", "\(attempt.rawCorrect)/\(attempt.totalQuestions)")
                pair("RAW %", String(format: "%.0f%%", attempt.rawPercent * 100))
                pair("TIME", timeStr(attempt.timeUsedSeconds))
            }

            // Per-domain bars
            VStack(spacing: 5) {
                ForEach(KnowledgeDomain.allCases) { domain in
                    let r = attempt.domainResults[domain.rawValue] ?? DomainResult(correct: 0, total: 0)
                    if r.total > 0 {
                        domainBar(domain: domain, result: r)
                    }
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.opacity(0.03))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(accent.opacity(0.18), lineWidth: 1))
        .cornerRadius(8)
    }

    private func pair(_ k: String, _ v: String) -> some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(k)
                .font(.system(size: 8, weight: .bold, design: .monospaced))
                .foregroundColor(accent.opacity(0.55))
                .tracking(1.0)
            Text(v)
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(.white.opacity(0.92))
        }
    }

    private func domainBar(domain: KnowledgeDomain, result: DomainResult) -> some View {
        HStack(spacing: 8) {
            Text(domain.shortName)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(domain.accentColor)
                .tracking(0.8)
                .frame(width: 70, alignment: .leading)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(domain.accentColor.opacity(0.10)).frame(height: 6).cornerRadius(3)
                    Rectangle().fill(domain.accentColor.opacity(0.85))
                        .frame(width: geo.size.width * result.percent, height: 6)
                        .cornerRadius(3)
                }
            }
            .frame(height: 6)

            Text("\(result.correct)/\(result.total)")
                .font(.system(size: 9, design: .monospaced))
                .foregroundColor(.white.opacity(0.55))
                .frame(width: 40, alignment: .trailing)
        }
    }

    private func timeStr(_ s: Int) -> String {
        let m = s / 60
        let sec = s % 60
        if s >= 3600 {
            let h = s / 3600
            return String(format: "%d:%02d:%02d", h, m % 60, sec)
        }
        return String(format: "%d:%02d", m, sec)
    }
}

// MARK: - Readiness Score View

/// Combines mastery % with the latest exam attempt to produce a single
/// "ready to sit?" signal. Three states with concrete recommendations.
struct ReadinessScoreView: View {
    let engine: GameEngine

    @Environment(\.dismiss) private var dismiss

    private var accent: Color { engine.currentTheme.accentColor }

    private var mastery: Double {
        engine.masteryTracker?.globalMastery().weightedPercent ?? 0
    }

    private var dueToday: Int {
        engine.masteryTracker?.globalMastery().dueForReview ?? 0
    }

    private var latestExam: ExamAttempt? { engine.latestExamAttempt }

    /// Composite readiness in [0, 1].
    /// 60% mastery + 40% latest scaled-score normalized [1400→0.0, 1900→1.0].
    /// If no exam taken yet, mastery alone scaled by 0.7 (penalty for not having
    /// timed a full-length attempt).
    private var readiness: Double {
        let masteryComponent = mastery
        guard let latest = latestExam else {
            return masteryComponent * 0.7
        }
        let scaled = Double(latest.scaledScore)
        let floor = Double(BlueprintExamScoring.passingScaledScore)
        let ceiling = Double(BlueprintExamScoring.scaledScoreCeiling)
        let examComponent = max(0, min(1, (scaled - floor) / (ceiling - floor)))
        return masteryComponent * 0.6 + examComponent * 0.4
    }

    private enum ReadinessLevel { case keepStudying, nearlyReady, ready }
    private var level: ReadinessLevel {
        if readiness >= 0.80 { return .ready }
        if readiness >= 0.55 { return .nearlyReady }
        return .keepStudying
    }

    private var headline: String {
        switch level {
        case .ready:         return "READY TO SIT"
        case .nearlyReady:   return "NEARLY READY"
        case .keepStudying:  return "KEEP STUDYING"
        }
    }

    private var headlineColor: Color {
        switch level {
        case .ready:         return Color(red: 0.25, green: 0.95, blue: 0.55)
        case .nearlyReady:   return Color(red: 0.95, green: 0.78, blue: 0.35)
        case .keepStudying:  return Color(red: 0.86, green: 0.45, blue: 0.40)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                GridBackground().opacity(0.16).ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        // Big readiness ring + headline
                        HStack(alignment: .center, spacing: 18) {
                            ZStack {
                                Circle()
                                    .stroke(headlineColor.opacity(0.20), lineWidth: 9)
                                    .frame(width: 100, height: 100)
                                Circle()
                                    .trim(from: 0, to: max(0.001, readiness))
                                    .stroke(headlineColor, style: StrokeStyle(lineWidth: 9, lineCap: .round))
                                    .frame(width: 100, height: 100)
                                    .rotationEffect(.degrees(-90))
                                Text("\(Int(readiness * 100))%")
                                    .font(.system(size: 22, weight: .black, design: .monospaced))
                                    .foregroundColor(headlineColor)
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(headline)
                                    .font(.system(size: 16, weight: .black, design: .monospaced))
                                    .foregroundColor(headlineColor)
                                    .tracking(1.2)
                                Text("Composite signal: 60% concept mastery + 40% latest blueprint exam.")
                                    .font(.system(size: 10, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.55))
                                    .lineSpacing(2)
                            }
                            Spacer()
                        }

                        // Components
                        VStack(spacing: 10) {
                            componentRow(
                                label: "MASTERY",
                                value: "\(Int(mastery * 100))%",
                                detail: "\(dueToday) due for review today",
                                color: accent
                            )
                            if let last = latestExam {
                                componentRow(
                                    label: "LATEST EXAM",
                                    value: "\(last.scaledScore)",
                                    detail: "\(last.didPass ? "PASS" : "DID NOT PASS") · " +
                                            "\(last.rawCorrect)/\(last.totalQuestions) raw · " +
                                            last.attemptDate.formatted(date: .abbreviated, time: .shortened),
                                    color: last.didPass ? Color(red: 0.25, green: 0.95, blue: 0.55) : .red
                                )
                            } else {
                                componentRow(
                                    label: "LATEST EXAM",
                                    value: "NONE",
                                    detail: "Take a full-length blueprint exam to remove the no-attempt penalty.",
                                    color: .white.opacity(0.4)
                                )
                            }
                        }

                        // Recommendation
                        VStack(alignment: .leading, spacing: 8) {
                            Text("// RECOMMENDATION")
                                .font(.system(size: 10, weight: .black, design: .monospaced))
                                .foregroundColor(accent)
                                .tracking(1.2)
                            Text(recommendationText)
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(.white.opacity(0.85))
                                .lineSpacing(4)
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.03))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(headlineColor.opacity(0.30), lineWidth: 1))
                        .cornerRadius(8)

                        Text("This is a self-graded estimate. Official PTCB readiness can only be confirmed by sitting the actual exam.")
                            .font(.system(size: 9, design: .monospaced))
                            .foregroundColor(.white.opacity(0.40))
                            .lineSpacing(2)

                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Readiness")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close") { dismiss() }
                        .foregroundColor(accent)
                }
            }
        }
    }

    private func componentRow(label: String, value: String, detail: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(accent.opacity(0.55))
                    .tracking(1.2)
                Text(value)
                    .font(.system(size: 16, weight: .black, design: .monospaced))
                    .foregroundColor(color)
            }
            .frame(width: 110, alignment: .leading)

            Text(detail)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(.white.opacity(0.72))
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
        .padding(12)
        .background(Color.white.opacity(0.025))
        .overlay(RoundedRectangle(cornerRadius: 6).stroke(accent.opacity(0.18), lineWidth: 1))
        .cornerRadius(6)
    }

    private var recommendationText: String {
        switch level {
        case .ready:
            return """
            Both your concept mastery and your most recent blueprint exam are strong. Schedule the real PTCE within the next 1–2 weeks while content is fresh; do one more full-length exam ~3 days before to lock in pacing. Focus reviews on any domain still under 80%.
            """
        case .nearlyReady:
            return """
            You're on the cusp. Drill the weakest domain on your latest exam (lowest %) and clear the spaced-repetition queue daily. Take one more full-length blueprint exam in 5–7 days; if scaled score holds at 1400+, sit the PTCE within 2 weeks.
            """
        case .keepStudying:
            return """
            Focus the next stretch on building concept breadth. Aim to clear ALL spaced-repetition due-today reviews each morning, then drill the lowest-percentage domain. Take a blueprint exam after every ~10 hours of study to track movement, not before.
            """
        }
    }
}

