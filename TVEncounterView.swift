//
//  TVEncounterView.swift
//  Synapse PTCE  v13.0
//
//  Apple TV encounter screen.
//  Left column: domain badge + study notes (scrollable)
//  Right column: question + 2×2 focusable answer grid + submit
//

#if os(tvOS)
import SwiftUI

// MARK: - TV Encounter View

struct TVEncounterView: View {
    let node: DataNode
    let gameMode: GameMode
    let probeAbility: ProbeAbility?
    var contentFontSize: CGFloat = 18
    let onSubmit: (UUID, String) -> GradeResult
    let onDismiss: () -> Void

    @State private var selected: String       = ""
    @State private var result: GradeResult?   = nil
    @State private var showFeedback           = false
    @State private var bootComplete           = false
    @State private var burstScale: CGFloat    = 0.2
    @State private var burstOpacity: Double   = 0.0
    @State private var glitchOpacity: Double  = 0.0
    @State private var probeAbilityUsed       = false
    @State private var eliminatedOption: String? = nil
    @State private var timeRemaining: Int     = 0
    @State private var timerRunning           = false
    @State private var dismissTask: Task<Void, Never>? = nil

    @Environment(\.appTheme) private var theme
    @Environment(\.dismiss) private var dismiss

    private var color: Color { node.domain.accentColor }
    private let gold = Color(red: 1.0, green: 0.85, blue: 0.2)
    private let green = Color(red: 0.15, green: 0.88, blue: 0.48)

    private var visibleOptions: [String] {
        node.options.filter { $0 != eliminatedOption }
    }

    private var effectiveQuestion: String {
        if !node.questionText.isEmpty { return node.questionText }
        switch node.angle {
        case .classification: return "Which best describes the classification of \(node.nodeTitle.lowercased())?"
        case .indication:     return "What is the primary indication for \(node.nodeTitle.lowercased())?"
        case .mechanism:      return "What is the mechanism of action of \(node.nodeTitle.lowercased())?"
        case .safety:         return "Which safety consideration is MOST important for \(node.nodeTitle.lowercased())?"
        case .dosing:         return "Which statement about \(node.nodeTitle.lowercased()) dosing is correct?"
        }
    }

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            TVGridBackground()

            // Glitch flash
            Color.red.opacity(glitchOpacity).ignoresSafeArea().allowsHitTesting(false)

            // Stabilized burst ring
            Circle()
                .stroke(color, lineWidth: 4)
                .scaleEffect(burstScale)
                .opacity(burstOpacity)
                .allowsHitTesting(false)

            if bootComplete {
                HStack(alignment: .top, spacing: 0) {

                    // ── LEFT PANEL: study notes ───────────────────────────────
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) {
                            // Domain + title
                            VStack(alignment: .leading, spacing: 8) {
                                Text(node.domain.terminalSectorLabel)
                                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                                    .foregroundColor(color.opacity(0.55))
                                    .tracking(1)

                                HStack(spacing: 10) {
                                    Text(node.nodeTitle.replacingOccurrences(of: "\n", with: " "))
                                        .font(.system(size: 22, weight: .black, design: .monospaced))
                                        .foregroundColor(color)
                                        .shadow(color: color.opacity(0.5), radius: 6)

                                    if node.angle != .classification || node.baseConceptTitle != nil {
                                        Text(node.angle.badge)
                                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                                            .foregroundColor(color)
                                            .padding(.horizontal, 8).padding(.vertical, 4)
                                            .background(color.opacity(0.15))
                                            .cornerRadius(5)
                                    }
                                }
                            }

                            Divider().background(color.opacity(0.3))

                            // Study notes
                            TVTeachPanel(loreText: node.loreText, color: color, fontSize: contentFontSize + 3)
                        }
                        .padding(50)
                    }
                    .frame(maxWidth: .infinity)
                    .background(theme.surface.opacity(0.4))

                    Rectangle()
                        .fill(color.opacity(0.18))
                        .frame(width: 1)

                    // ── RIGHT PANEL: question + options ───────────────────────
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 28) {

                            // Timer (timed mode)
                            if gameMode == .timed {
                                HStack(spacing: 8) {
                                    Image(systemName: "timer").font(.system(size: 18))
                                    Text(String(format: "%02d", timeRemaining))
                                        .font(.system(size: 26, weight: .black, design: .monospaced))
                                }
                                .foregroundColor(timeRemaining <= 10 ? .red : color)
                                .shadow(color: timeRemaining <= 10 ? Color.red.opacity(0.7) : .clear, radius: 5)
                                .padding(.horizontal, 14).padding(.vertical, 7)
                                .background((timeRemaining <= 10 ? Color.red : color).opacity(0.10))
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke((timeRemaining <= 10 ? Color.red : color).opacity(0.4), lineWidth: 1))
                                .cornerRadius(8)
                            }

                            // Question
                            Text(effectiveQuestion)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(theme.primaryText)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineSpacing(8)

                            // Logic Probe button
                            if let ability = probeAbility, !probeAbilityUsed, !showFeedback {
                                Button {
                                    if let wrong = node.options.first(where: { $0 != node.correctAnswer && $0 != eliminatedOption }) {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            eliminatedOption = wrong
                                            probeAbilityUsed = true
                                            if selected == wrong { selected = "" }
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 8) {
                                        Image(systemName: ability.iconName).font(.system(size: 16))
                                        Text("ACTIVATE: \(ability.displayName.uppercased())")
                                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    }
                                    .foregroundColor(gold)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(gold.opacity(0.08))
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(gold.opacity(0.5), lineWidth: 1))
                                    .cornerRadius(8)
                                    .shadow(color: gold.opacity(0.4), radius: 6)
                                }
                            }

                            // ── 2×2 answer grid ──────────────────────────────
                            let opts = visibleOptions
                            VStack(spacing: 16) {
                                ForEach(stride(from: 0, to: opts.count, by: 2).map { $0 }, id: \.self) { rowStart in
                                    HStack(spacing: 16) {
                                        ForEach(rowStart..<min(rowStart + 2, opts.count), id: \.self) { i in
                                            TVOptionButton(
                                                option: opts[i],
                                                index: i,
                                                isSelected: selected == opts[i],
                                                isCorrect: result != nil ? opts[i] == node.correctAnswer : nil,
                                                color: color,
                                                isLocked: showFeedback
                                            ) {
                                                guard !showFeedback else { return }
                                                withAnimation(.easeInOut(duration: 0.15)) { selected = opts[i] }
                                            }
                                        }
                                        // Pad to 2 columns if odd number
                                        if rowStart + 1 >= opts.count {
                                            Spacer().frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                            }

                            // ── Submit / Dismiss ─────────────────────────────
                            if showFeedback, let r = result {
                                TVFeedbackBlock(result: r, node: node, color: color) {
                                    dismissTask?.cancel()
                                    onDismiss()
                                    dismiss()
                                }
                            } else {
                                Button {
                                    guard !selected.isEmpty else { return }
                                    let r = onSubmit(node.id, selected)
                                    result = r
                                    showFeedback = true
                                    if r.wasCorrect {
                                        triggerStabilizedBurst()
                                        dismissTask = Task {
                                            try? await Task.sleep(for: .seconds(3.0))
                                            onDismiss()
                                            dismiss()
                                        }
                                    } else {
                                        triggerGlitch()
                                    }
                                } label: {
                                    Text(selected.isEmpty ? "SELECT AN ANSWER" : "CONFIRM ANSWER")
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .foregroundColor(selected.isEmpty ? color.opacity(0.4) : .black)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 18)
                                        .background(selected.isEmpty ? Color.clear : color)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(color.opacity(selected.isEmpty ? 0.3 : 0), lineWidth: 1.5)
                                        )
                                        .cornerRadius(10)
                                        .shadow(color: selected.isEmpty ? .clear : color.opacity(0.5), radius: 10)
                                }
                                .disabled(selected.isEmpty)
                            }
                        }
                        .padding(50)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5).delay(0.15)) { bootComplete = true }
            if gameMode == .timed {
                timeRemaining = gameMode.timerSeconds
                timerRunning = true
            }
        }
        .onDisappear { dismissTask?.cancel() }
        .task(id: timerRunning) {
            guard timerRunning else { return }
            while timerRunning && timeRemaining > 0 {
                try? await Task.sleep(for: .seconds(1))
                if timerRunning { timeRemaining -= 1 }
            }
            if timeRemaining == 0 && !showFeedback {
                let r = onSubmit(node.id, selected.isEmpty ? "__TIMEOUT__" : selected)
                result = r
                showFeedback = true
                triggerGlitch()
            }
        }
        .onExitCommand {
            dismissTask?.cancel()
            onDismiss()
            dismiss()
        }
    }

    // MARK: - Effects

    private func triggerStabilizedBurst() {
        burstScale = 0.2; burstOpacity = 0.9
        withAnimation(.easeOut(duration: 1.4)) {
            burstScale = 2.2; burstOpacity = 0.0
        }
        timerRunning = false
    }

    private func triggerGlitch() {
        timerRunning = false
        withAnimation(.easeIn(duration: 0.06)) { glitchOpacity = 0.18 }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
            withAnimation(.easeOut(duration: 0.18)) { glitchOpacity = 0 }
        }
    }
}

// MARK: - TV Teach Panel

/// Renders lore text bullet points at TV-friendly size.
struct TVTeachPanel: View {
    let loreText: String
    let color: Color
    let fontSize: CGFloat

    @Environment(\.appTheme) private var theme

    private var lines: [String] {
        loreText.components(separatedBy: "\n").filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                let trimmed = line.trimmingCharacters(in: .whitespaces)

                if trimmed.hasPrefix("##") {
                    Text(trimmed.dropFirst(2).trimmingCharacters(in: .whitespaces))
                        .font(.system(size: fontSize + 2, weight: .black, design: .monospaced))
                        .foregroundColor(color)
                        .padding(.top, 8)
                        .shadow(color: color.opacity(0.4), radius: 4)
                } else if trimmed.hasPrefix("KEY:") {
                    HStack(alignment: .top, spacing: 10) {
                        Text("KEY")
                            .font(.system(size: fontSize - 2, weight: .black, design: .monospaced))
                            .foregroundColor(color)
                            .padding(.horizontal, 7).padding(.vertical, 3)
                            .background(color.opacity(0.15))
                            .cornerRadius(4)
                        Text(trimmed.dropFirst(4).trimmingCharacters(in: .whitespaces))
                            .font(.system(size: fontSize, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(5)
                    }
                } else if trimmed.hasPrefix("•") || trimmed.hasPrefix("-") {
                    HStack(alignment: .top, spacing: 10) {
                        Text("•")
                            .font(.system(size: fontSize, weight: .bold, design: .monospaced))
                            .foregroundColor(color.opacity(0.7))
                        Text(trimmed.dropFirst(1).trimmingCharacters(in: .whitespaces))
                            .font(.system(size: fontSize, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(5)
                    }
                } else {
                    Text(trimmed)
                        .font(.system(size: fontSize, design: .monospaced))
                        .foregroundColor(theme.primaryText.opacity(0.85))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(5)
                }
            }
        }
    }
}

// MARK: - TV Option Button

struct TVOptionButton: View {
    let option: String
    let index: Int
    let isSelected: Bool
    let isCorrect: Bool?
    let color: Color
    let isLocked: Bool
    let onTap: () -> Void

    @Environment(\.appTheme) private var theme
    @Environment(\.isFocused) private var isFocused

    private let letters = ["A", "B", "C", "D"]
    private var letter: String { index < letters.count ? letters[index] : "\(index + 1)" }

    private var borderColor: Color {
        if let correct = isCorrect {
            return correct ? Color(red: 0.15, green: 0.88, blue: 0.48) : Color.red.opacity(0.7)
        }
        if isFocused || isSelected { return color }
        return theme.divider
    }

    private var bgColor: Color {
        if let correct = isCorrect {
            return correct ? Color(red: 0.15, green: 0.88, blue: 0.48).opacity(0.12) : Color.red.opacity(0.08)
        }
        if isFocused  { return color.opacity(0.12) }
        if isSelected { return color.opacity(0.08) }
        return theme.surface
    }

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: 14) {
                // Letter badge
                Text(letter)
                    .font(.system(size: 16, weight: .black, design: .monospaced))
                    .foregroundColor(isFocused || isSelected ? .black : color)
                    .frame(width: 32, height: 32)
                    .background(isFocused || isSelected ? color : color.opacity(0.15))
                    .cornerRadius(8)

                Text(option)
                    .font(.system(size: 18, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(4)

                Spacer(minLength: 0)

                if let correct = isCorrect {
                    Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(correct ? Color(red: 0.15, green: 0.88, blue: 0.48) : .red)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(minHeight: 80)
            .background(bgColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: (isFocused || isSelected) ? 2 : 1)
            )
            .cornerRadius(12)
            .scaleEffect(isFocused ? 1.03 : 1.0)
            .shadow(color: isFocused ? color.opacity(0.3) : .clear, radius: 10)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: isFocused)
        }
        .buttonStyle(.plain)
        .disabled(isLocked)
    }
}

// MARK: - TV Feedback Block

struct TVFeedbackBlock: View {
    let result: GradeResult
    let node: DataNode
    let color: Color
    let onDismiss: () -> Void

    @Environment(\.appTheme) private var theme

    private let green = Color(red: 0.15, green: 0.88, blue: 0.48)
    private let gold  = Color(red: 1.0,  green: 0.85, blue: 0.2)

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Divider().background(color.opacity(0.3))

            // Result banner
            HStack(spacing: 12) {
                Image(systemName: result.wasCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(result.wasCorrect ? green : .red)

                VStack(alignment: .leading, spacing: 4) {
                    Text(result.wasCorrect ? "SIGNAL STABILIZED" : "SIGNAL CORRUPTED")
                        .font(.system(size: 22, weight: .black, design: .monospaced))
                        .foregroundColor(result.wasCorrect ? green : .red)
                    if result.xpAwarded > 0 {
                        HStack(spacing: 12) {
                            Text("+\(result.xpAwarded) XP")
                                .font(.system(size: 16, weight: .bold, design: .monospaced))
                                .foregroundColor(gold)
                            if result.shardAwarded {
                                HStack(spacing: 4) {
                                    Image(systemName: "diamond.fill").font(.system(size: 12))
                                    Text("+1 SHARD")
                                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                                }
                                .foregroundColor(Color(red: 0.6, green: 0.9, blue: 1.0))
                            }
                            if result.rankUp {
                                Text("RANK UP: \(result.newSystemRank.title)")
                                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                                    .foregroundColor(gold)
                            }
                        }
                    }
                }

                Spacer()

                // Stability delta
                let delta = result.pointsAwarded
                if delta != 0 {
                    HStack(spacing: 4) {
                        Image(systemName: delta > 0 ? "arrow.up" : "arrow.down")
                        Text("\(abs(delta))")
                            .font(.system(size: 20, weight: .black, design: .monospaced))
                        Text("pts")
                            .font(.system(size: 14, design: .monospaced))
                    }
                    .foregroundColor(delta > 0 ? green : .red)
                }
            }
            .padding(20)
            .background((result.wasCorrect ? green : Color.red).opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke((result.wasCorrect ? green : Color.red).opacity(0.3), lineWidth: 1.5))
            .cornerRadius(12)

            // Correct answer (if wrong)
            if !result.wasCorrect {
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "lightbulb.fill")
                        .font(.system(size: 16))
                        .foregroundColor(gold)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CORRECT ANSWER")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        Text(node.correctAnswer)
                            .font(.system(size: 16, weight: .semibold, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(16)
                .background(gold.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(gold.opacity(0.25), lineWidth: 1))
                .cornerRadius(10)
            }

            // Dismiss button
            Button(action: onDismiss) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.right.circle.fill")
                    Text(result.wasCorrect ? "CONTINUE" : "UNDERSTOOD")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(result.wasCorrect ? green : color)
                .cornerRadius(10)
                .shadow(color: (result.wasCorrect ? green : color).opacity(0.5), radius: 10)
            }
        }
    }
}
#endif
