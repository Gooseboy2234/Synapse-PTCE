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
                    onSelect: { shift in
                        withAnimation(.easeInOut(duration: 0.35)) {
                            activeShift = shift
                        }
                    },
                    onDismiss: onDismiss
                )
                .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
    }
}

// MARK: - Picker

struct RimrockDayPickerView: View {

    let shifts: [RimrockShift]
    let masterySnapshot: GlobalMasterySnapshot?
    let onSelect: (RimrockShift) -> Void
    let onDismiss: () -> Void

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
                            shiftCard(shifts[idx])
                                .onTapGesture { onSelect(shifts[idx]) }
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

    // MARK: - Card

    private func shiftCard(_ shift: RimrockShift) -> some View {
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

            // Title + dates
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 8) {
                    Text(shift.title.uppercased())
                        .font(.system(size: 14, weight: .heavy, design: .monospaced))
                        .foregroundColor(.white.opacity(0.95))
                        .tracking(1.3)
                        .lineLimit(1)

                    badgeView(badge)
                }

                Text(shift.dateLine)
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.78))

                Text("opens \(shift.timeLine)")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.45))
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(palette.accent.opacity(0.55))
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
