//
//  RimrockHubView.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  The hub flow when the user taps RADIO. Atmospheric Day picker showing all
//  30 shifts; tapping a shift opens that day. Cards are tinted by act, with
//  a Bighorn ridge silhouette in the hero zone.
//

import SwiftUI

struct RimrockHubView: View {

    let gameEngine: GameEngine?
    let onDismiss: () -> Void

    @State private var activeShift: RimrockShift? = nil
    @State private var voiceShift: RimrockShift? = nil

    init(gameEngine: GameEngine? = nil, onDismiss: @escaping () -> Void) {
        self.gameEngine = gameEngine
        self.onDismiss = onDismiss
    }

    var body: some View {
        ZStack {
            if let shift = activeShift {
                RimrockShiftView(shift: shift, gameEngine: gameEngine) {
                    withAnimation(.easeInOut(duration: 0.30)) {
                        activeShift = nil
                    }
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))
            } else {
                RimrockDayPickerView(
                    shifts: RimrockContent.allShifts,
                    masterySnapshot: gameEngine?.masteryTracker.globalMastery(),
                    practiceCoverage: gameEngine?.practiceCoverage(),
                    onSelect: { shift in
                        withAnimation(.easeInOut(duration: 0.35)) {
                            activeShift = shift
                        }
                    },
                    onSelectVoice: { shift in
                        voiceShift = shift
                    },
                    onSelectPracticeNext: {
                        guard let engine = gameEngine else { return }
                        let shift = engine.generateNextPracticeShift()
                        withAnimation(.easeInOut(duration: 0.35)) {
                            activeShift = shift
                        }
                    },
                    onDismiss: onDismiss
                )
                .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
        .fullScreenCoverCompat(isPresented: Binding(
            get: { voiceShift != nil },
            set: { if !$0 { voiceShift = nil } }
        )) {
            if let shift = voiceShift {
                VoiceModeView(shift: shift) { voiceShift = nil }
            }
        }
    }
}

// MARK: - Picker

struct RimrockDayPickerView: View {

    let shifts: [RimrockShift]
    let masterySnapshot: GlobalMasterySnapshot?
    let practiceCoverage: PracticeCoverage?
    let onSelect: (RimrockShift) -> Void
    let onSelectVoice: (RimrockShift) -> Void
    let onSelectPracticeNext: () -> Void
    let onDismiss: () -> Void

    @AppStorage("rimrock_last_shift_played") private var lastShiftPlayed: Int = 0

    // Picker uses the morning palette as a baseline
    private var basePalette: RimrockAtmosphere.Palette {
        RimrockAtmosphere.palette(for: 1)
    }

    var body: some View {
        ZStack {
            // Atmospheric morning sky as the picker base
            RimrockAtmosphere.skyBackground(for: 2)

            VStack(spacing: 0) {
                hero

                Divider().background(basePalette.divider)

                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(0..<shifts.count, id: \.self) { idx in
                            shiftCard(shifts[idx],
                                      isCompleted: shifts[idx].dayNumber <= lastShiftPlayed,
                                      isNext: shifts[idx].dayNumber == lastShiftPlayed + 1,
                                      onVoice: { onSelectVoice(shifts[idx]) })
                                .onTapGesture { onSelect(shifts[idx]) }
                                .contextMenu {
                                    Button {
                                        onSelect(shifts[idx])
                                    } label: {
                                        Label("Read shift", systemImage: "book.fill")
                                    }
                                    Button {
                                        onSelectVoice(shifts[idx])
                                    } label: {
                                        Label("Listen — Voice Mode", systemImage: "mic.fill")
                                    }
                                }
                        }

                        // After the curated arc, surface ongoing practice shifts —
                        // procedurally drawn from the full DataNode bank, every
                        // question hit at least twice with ≥4-shift spacing.
                        if let coverage = practiceCoverage {
                            practiceSection(coverage: coverage)
                                .padding(.top, 18)
                        }

                        Color.clear.frame(height: 80)  // breathing room above ridges
                    }
                    .padding(.horizontal, 22)
                    .padding(.vertical, 18)
                }
            }
        }
    }

    // MARK: - Hero

    private var hero: some View {
        ZStack(alignment: .bottomLeading) {
            // Compact gradient strip — sunrise-ish
            LinearGradient(
                colors: [
                    Color(red: 0.075, green: 0.070, blue: 0.065),
                    Color(red: 0.118, green: 0.090, blue: 0.072),
                    Color(red: 0.155, green: 0.115, blue: 0.078)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            // Far ridge
            BighornRidge(seed: 23, peakHeight: 0.32)
                .fill(Color(red: 0.092, green: 0.082, blue: 0.082))
                .frame(height: 30)
                .opacity(0.55)
                .padding(.bottom, 4)

            // Hero ridge
            BighornRidge(seed: 11, peakHeight: 0.42)
                .fill(Color(red: 0.058, green: 0.052, blue: 0.062))
                .frame(height: 38)

            // Title block (bottom-left, above the ridge)
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 8) {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.system(size: 11, weight: .bold))
                    Text("RIMROCK PHARMACY")
                        .font(.system(size: 12, weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                }
                .foregroundColor(basePalette.accent.opacity(0.95))

                Text("JOHNSON COUNTY · WYOMING")
                    .font(.system(size: 9, weight: .medium, design: .monospaced))
                    .foregroundColor(basePalette.sceneText.opacity(0.55))
                    .tracking(1.2)

                if let snap = masterySnapshot {
                    masteryStrip(snap)
                        .padding(.top, 4)
                } else {
                    Text("\(shifts.count) shifts · pick where to start")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .foregroundColor(basePalette.sceneText.opacity(0.40))
                }
            }
            .padding(.horizontal, 22)
            .padding(.bottom, 50)

            // Close button (top-right)
            VStack {
                HStack {
                    Spacer()
                    Button(action: onDismiss) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(basePalette.sceneText.opacity(0.65))
                            .padding(10)
                            .background(Color.black.opacity(0.30))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 18)
                    .padding(.top, 14)
                }
                Spacer()
            }
        }
        .frame(height: 200)
    }

    /// Compact "X% truly learned · Y due" strip shown on the hero when mastery
    /// data is available.
    private func masteryStrip(_ snap: GlobalMasterySnapshot) -> some View {
        let percent = Int((snap.weightedPercent * 100).rounded())
        let due = snap.dueForReview
        return HStack(spacing: 12) {
            HStack(spacing: 5) {
                Text("\(percent)%")
                    .font(.system(size: 13, weight: .heavy, design: .monospaced))
                    .foregroundColor(basePalette.accent)
                Text("TRULY LEARNED")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                    .foregroundColor(basePalette.sceneText.opacity(0.65))
            }

            Rectangle()
                .fill(basePalette.sceneText.opacity(0.25))
                .frame(width: 0.5, height: 14)

            HStack(spacing: 5) {
                Text("\(due)")
                    .font(.system(size: 13, weight: .heavy, design: .monospaced))
                    .foregroundColor(due > 0 ? Color(red: 0.95, green: 0.78, blue: 0.45) : basePalette.sceneText.opacity(0.6))
                Text(due == 1 ? "DUE TODAY" : "DUE TODAY")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                    .foregroundColor(basePalette.sceneText.opacity(0.65))
            }
        }
    }

    // MARK: - Practice section (post-Day-35 procedural shifts)

    @ViewBuilder
    private func practiceSection(coverage: PracticeCoverage) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section header — clearly demarcated from the curated arc
            HStack(spacing: 8) {
                Image(systemName: "infinity")
                    .font(.system(size: 11, weight: .heavy))
                Text("ONGOING PRACTICE")
                    .font(.system(size: 11, weight: .heavy, design: .monospaced))
                    .tracking(1.6)
                Rectangle()
                    .fill(basePalette.accent.opacity(0.35))
                    .frame(height: 0.5)
            }
            .foregroundColor(basePalette.accent.opacity(0.85))
            .padding(.top, 4)

            // Subhead explaining the rule
            Text("Every question in the bank — \(coverage.bankSize) of them — wrapped in shift narrative and drilled at least twice, spaced apart enough to verify retention.")
                .font(.system(size: 11, weight: .regular, design: .monospaced))
                .foregroundColor(basePalette.sceneText.opacity(0.62))
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)

            // Coverage strip — two stacked progress lines
            VStack(spacing: 8) {
                coverageRow(
                    label: "SEEN",
                    count: coverage.seenOnce,
                    total: coverage.bankSize,
                    color: basePalette.accent.opacity(0.65)
                )
                coverageRow(
                    label: "VERIFIED",
                    count: coverage.verified,
                    total: coverage.bankSize,
                    color: Color(red: 0.25, green: 0.85, blue: 0.55)
                )
            }
            .padding(14)
            .background(basePalette.panel.opacity(0.55))
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(basePalette.accent.opacity(0.20), lineWidth: 1))
            .cornerRadius(8)

            // Next shift card — the play button
            Button(action: onSelectPracticeNext) {
                HStack(alignment: .top, spacing: 14) {
                    VStack(spacing: 0) {
                        Text("DAY")
                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                            .tracking(1.2)
                            .foregroundColor(basePalette.label.opacity(0.85))
                        Text("\(coverage.nextShiftNumber)")
                            .font(.system(size: 28, weight: .heavy, design: .monospaced))
                            .foregroundColor(basePalette.accent)
                            .padding(.top, 1)
                    }
                    .frame(width: 56)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(coverage.isFullyVerified ? "FULL COVERAGE — REINFORCEMENT" : "NEXT PRACTICE SHIFT")
                            .font(.system(size: 11, weight: .heavy, design: .monospaced))
                            .tracking(1.4)
                            .foregroundColor(coverage.isFullyVerified
                                             ? Color(red: 0.25, green: 0.85, blue: 0.55)
                                             : basePalette.accent)
                        Text(practiceSubtitle(for: coverage))
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(basePalette.sceneText.opacity(0.65))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer()

                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(basePalette.accent.opacity(0.7))
                }
                .padding(14)
                .background(
                    LinearGradient(
                        colors: [basePalette.panel, basePalette.panel.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(RoundedRectangle(cornerRadius: 11)
                    .stroke(basePalette.accent.opacity(0.45), lineWidth: 1.2))
                .cornerRadius(11)
            }
            .buttonStyle(.plain)
        }
    }

    private func coverageRow(label: String, count: Int, total: Int, color: Color) -> some View {
        let pct = total > 0 ? Double(count) / Double(total) : 0
        return VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .font(.system(size: 9, weight: .heavy, design: .monospaced))
                    .tracking(1.2)
                    .foregroundColor(basePalette.sceneText.opacity(0.6))
                Spacer()
                Text("\(count) / \(total)  ·  \(Int((pct * 100).rounded()))%")
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.85))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(color.opacity(0.18)).frame(height: 5).cornerRadius(2.5)
                    Rectangle().fill(color)
                        .frame(width: geo.size.width * pct, height: 5)
                        .cornerRadius(2.5)
                }
            }
            .frame(height: 5)
        }
    }

    private func practiceSubtitle(for coverage: PracticeCoverage) -> String {
        if coverage.isFullyVerified {
            return "All \(coverage.bankSize) questions verified. Keep playing for SR reinforcement."
        }
        let remaining = coverage.bankSize - coverage.verified
        return "10 questions · ≥4-shift spacing · \(remaining) still to verify"
    }

    // MARK: - Card

    private func shiftCard(_ shift: RimrockShift,
                            isCompleted: Bool,
                            isNext: Bool,
                            onVoice: @escaping () -> Void) -> some View {
        let palette = RimrockAtmosphere.palette(for: shift.dayNumber)
        let badge = badgeFor(shift)

        return HStack(alignment: .top, spacing: 14) {
            // Day number block — uses the day's atmospheric accent
            VStack(spacing: 0) {
                Text("DAY")
                    .font(.system(size: 8, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                    .foregroundColor(palette.label.opacity(0.85))
                Text("\(shift.dayNumber)")
                    .font(.system(size: 28, weight: .heavy, design: .monospaced))
                    .foregroundColor(palette.accent)
                    .padding(.top, 1)
            }
            .frame(width: 56)
            .opacity(isCompleted ? 0.6 : 1.0)

            // Title + dates
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 8) {
                    Text(shift.title.uppercased())
                        .font(.system(size: 14, weight: .heavy, design: .monospaced))
                        .foregroundColor(.white.opacity(isCompleted ? 0.55 : 0.95))
                        .tracking(1.3)
                        .lineLimit(1)
                        .strikethrough(isCompleted, color: .white.opacity(0.4))

                    badgeView(badge)

                    if isNext {
                        Text("NEXT")
                            .font(.system(size: 9, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                            .tracking(1.2)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(palette.accent)
                            .cornerRadius(4)
                    }
                }

                Text(shift.dateLine)
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.78))

                Text("opens \(shift.timeLine)")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.45))
            }

            Spacer()

            if isCompleted {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 0.30, green: 0.85, blue: 0.55))
                    .symbolEffect(.bounce, value: isCompleted)
            } else {
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(palette.accent.opacity(0.55))
            }
        }
        .padding(14)
        .background(
            LinearGradient(
                colors: [palette.panel, palette.panel.opacity(0.65)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(palette.accent.opacity(0.22), lineWidth: 1)
        )
        .overlay(alignment: .topTrailing) {
            Button(action: onVoice) {
                Image(systemName: "mic.fill")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(palette.accent)
                    .padding(7)
                    .background(Color.black.opacity(0.45))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(palette.accent.opacity(0.4), lineWidth: 1))
            }
            .buttonStyle(.plain)
            .padding(8)
            .accessibilityLabel("Listen to Day \(shift.dayNumber) in Voice Mode")
        }
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 6, y: 3)
        .contentShape(Rectangle())
    }

    private struct Badge {
        let label: String
        let color: Color
    }

    private func badgeView(_ b: Badge) -> some View {
        Text(b.label)
            .font(.system(size: 8, weight: .heavy, design: .monospaced))
            .tracking(1)
            .foregroundColor(b.color)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(b.color.opacity(0.15))
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(b.color.opacity(0.45), lineWidth: 0.5)
            )
            .cornerRadius(3)
    }

    private func badgeFor(_ shift: RimrockShift) -> Badge {
        let act1 = Color(red: 0.85, green: 0.74, blue: 0.50)   // morning gold
        let act2 = Color(red: 0.62, green: 0.78, blue: 0.85)   // midday sky
        let act3 = Color(red: 0.92, green: 0.65, blue: 0.50)   // dusk orange
        let act4 = Color(red: 0.78, green: 0.62, blue: 0.92)   // night violet
        let review = Color(red: 0.55, green: 0.78, blue: 0.55) // dawn green

        switch shift.dayNumber {
        case 1...3:   return Badge(label: "ACT 1", color: act1)
        case 4...10:  return Badge(label: "ACT 2", color: act2)
        case 11...18: return Badge(label: "ACT 3", color: act3)
        case 19...25: return Badge(label: "ACT 4", color: act4)
        default:      return Badge(label: "REVIEW", color: review)
        }
    }
}
