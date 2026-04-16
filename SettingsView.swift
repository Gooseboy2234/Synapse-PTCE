//
//  SettingsView.swift
//  Synapse PTCE  v13.0
//
//  System settings: Game Mode, Text Size, Appearance, About/Credits, Full Reset.
//

import SwiftUI

// MARK: - Settings View

struct SettingsView: View {
    let engine: GameEngine
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme)  private var theme

    @State private var resetText        = ""
    @State private var showResetConfirm = false
    @State private var showResetDone    = false
    @State private var showDatePicker   = false
    @State private var pickedDate       = Date()

    private var accent: Color { engine.currentTheme.accentColor }

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackground()

            VStack(spacing: 0) {

                // ── Header ───────────────────────────────────────────────────
                HStack {
                    NavBackButton(label: "BACK", color: accent) { dismiss() }
                    Spacer()
                    Text("SYSTEM SETTINGS")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.55), radius: 5)
                    Spacer()
                    Text("v13.0")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(theme.surface.opacity(0.9))
                .overlay(Rectangle().fill(accent.opacity(0.2)).frame(height: 1), alignment: .bottom)

                // ── Content ──────────────────────────────────────────────────
                ScrollView {
                    VStack(alignment: .leading, spacing: 28) {
                        gameModeSection
                        textSizeSection
                        appearanceSection
                        examCountdownSection
                        aboutSection
                        resetSection
                    }
                    .padding(20)
                }
            }
        }
        .environment(\.appTheme, engine.appTheme)
    }

    // MARK: - Game Mode

    private var gameModeSection: some View {
        SettingsSection(title: "GAME MODE", theme: theme, accent: accent) {
            VStack(spacing: 10) {
                ForEach(GameMode.allCases, id: \.rawValue) { mode in
                    GameModeCard(
                        mode: mode,
                        isSelected: engine.currentGameMode == mode,
                        theme: theme, accent: accent
                    ) { engine.setGameMode(mode) }
                }
            }
        }
    }

    // MARK: - Text Size

    private var textSizeSection: some View {
        SettingsSection(title: "STUDY TEXT SIZE", theme: theme, accent: accent) {
            VStack(spacing: 10) {
                ForEach(TextSizeOption.allCases, id: \.rawValue) { size in
                    TextSizeCard(
                        option: size,
                        isSelected: engine.currentTextSize == size,
                        theme: theme, accent: accent
                    ) { engine.setTextSize(size) }
                }
            }
        }
    }

    // MARK: - Appearance

    private var appearanceSection: some View {
        SettingsSection(title: "APPEARANCE", theme: theme, accent: accent) {
            VStack(spacing: 10) {
                ForEach(AppAppearance.allCases, id: \.rawValue) { ap in
                    AppearanceCard(
                        appearance: ap,
                        isSelected: engine.currentAppearance == ap,
                        theme: theme, accent: accent
                    ) { engine.setAppearance(ap) }
                }
            }
        }
    }

    // MARK: - About

    private var aboutSection: some View {
        SettingsSection(title: "ABOUT", theme: theme, accent: accent) {
            VStack(alignment: .leading, spacing: 8) {
                Text("SYNAPSE // PTCE NETWORK v13.0 // MAIN BRANCH")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.4), radius: 3)

                Divider().background(theme.divider)

                Group {
                    infoRow(label: "DEVELOPER", value: "Ethan Bradley (Gooseboy2234)")
                    infoRow(label: "LOCATION",  value: "Hendersonville, TN")
                    infoRow(label: "EXAM",      value: "2026 PTCB Blueprint")
                    infoRow(label: "NODES",     value: "151 across 4 scored domains")
                }
            }
            .padding(14)
            .background(theme.surface)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(theme.divider, lineWidth: 1))
        }
    }

    private func infoRow(label: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text(label)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .frame(width: 80, alignment: .leading)
                .tracking(1)
            Text(value)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(theme.primaryText)
        }
    }

    // MARK: - Exam Countdown

    private var examCountdownSection: some View {
        SettingsSection(title: "EXAM COUNTDOWN", theme: theme, accent: accent) {
            VStack(alignment: .leading, spacing: 10) {

                if let testDate = engine.currentTestDate {
                    ExamCountdownCard(
                        testDate: testDate,
                        planStartDate: engine.currentPlanStartDate,
                        nodesCompleted: engine.currentNodesCompleted,
                        totalNodes: 151,
                        accent: accent,
                        theme: theme
                    )

                    Button {
                        pickedDate = testDate
                        withAnimation { showDatePicker.toggle() }
                    } label: {
                        Label(showDatePicker ? "CANCEL" : "CHANGE DATE",
                              systemImage: showDatePicker ? "xmark" : "calendar")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundColor(accent)
                    }

                    if showDatePicker {
                        DatePicker("Exam Date", selection: $pickedDate, in: Date()..., displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .tint(accent)
                            .onChange(of: pickedDate) { _, newVal in
                                engine.setTestDate(newVal)
                            }
                    }

                    Button {
                        engine.clearTestDate()
                        showDatePicker = false
                    } label: {
                        Text("CLEAR EXAM DATE")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(.red.opacity(0.7))
                    }

                } else {
                    // No date set yet
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Set your PTCE exam date to track daily progress, see if you're on track, and get a nodes-per-day target.")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                            .fixedSize(horizontal: false, vertical: true)

                        if showDatePicker {
                            DatePicker("Exam Date", selection: $pickedDate, in: Date()..., displayedComponents: .date)
                                .datePickerStyle(.graphical)
                                .tint(accent)

                            Button {
                                engine.setTestDate(pickedDate)
                                showDatePicker = false
                            } label: {
                                Text("CONFIRM DATE")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(accent)
                                    .cornerRadius(8)
                            }
                        } else {
                            Button {
                                pickedDate = Calendar.current.date(byAdding: .day, value: 60, to: Date()) ?? Date()
                                withAnimation { showDatePicker = true }
                            } label: {
                                Label("SET EXAM DATE", systemImage: "calendar.badge.plus")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(accent)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(14)
                    .background(theme.surface)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(theme.divider, lineWidth: 1))
                }
            }
        }
    }

    // MARK: - Reset

    private var resetSection: some View {
        SettingsSection(title: "SYSTEM MAINTENANCE", theme: theme, accent: accent) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Text("FULL SYSTEM RESET")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                }

                Text("Erases all progress, XP, Data Shards, and story events. Theme and mode preferences are kept. This cannot be undone.")
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)

                if showResetDone {
                    HStack(spacing: 6) {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                        Text("SYSTEM RESET COMPLETE")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundColor(.green)
                    }
                } else if showResetConfirm {
                    resetConfirmBlock
                } else {
                    Button {
                        withAnimation { showResetConfirm = true }
                    } label: {
                        Text("INITIATE FULL RESET")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 11)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.red.opacity(0.5), lineWidth: 1))
                    }
                }
            }
            .padding(14)
            .background(theme.surface)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red.opacity(0.22), lineWidth: 1))
            .cornerRadius(10)
        }
    }

    private var resetConfirmBlock: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Type  RESET  to confirm:")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(.red.opacity(0.85))

            TextField("", text: $resetText)
                .font(.system(size: 13, design: .monospaced))
                .foregroundColor(theme.primaryText)
                .padding(10)
                .background(theme.surfaceSecondary)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(resetText == "RESET" ? Color.red : theme.divider, lineWidth: 1))
                .cornerRadius(6)
                #if os(iOS)
                .textInputAutocapitalization(.characters)
                #endif
                .autocorrectionDisabled()

            HStack(spacing: 10) {
                Button("CANCEL") {
                    withAnimation { showResetConfirm = false }
                    resetText = ""
                }
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)

                Spacer()

                let canReset = resetText == "RESET"
                Button("EXECUTE RESET") {
                    guard canReset else { return }
                    engine.resetAllProgress()
                    showResetConfirm = false
                    showResetDone   = true
                    resetText = ""
                }
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(canReset ? .white : .red.opacity(0.35))
                .padding(.horizontal, 14).padding(.vertical, 7)
                .background(canReset ? Color.red : Color.clear)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.red.opacity(canReset ? 0 : 0.35), lineWidth: 1))
                .cornerRadius(6)
                .disabled(!canReset)
            }
        }
    }
}

// MARK: - Settings Section

struct SettingsSection<Content: View>: View {
    let title: String
    let theme: AppTheme
    let accent: Color
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .tracking(2)
            content()
        }
    }
}

// MARK: - Game Mode Card

struct GameModeCard: View {
    let mode: GameMode
    let isSelected: Bool
    let theme: AppTheme
    let accent: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                Image(systemName: mode.icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? accent : theme.secondaryText)
                    .frame(width: 34)
                    .shadow(color: isSelected ? accent.opacity(0.7) : .clear, radius: 5)

                VStack(alignment: .leading, spacing: 4) {
                    Text(mode.displayName.uppercased())
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(isSelected ? accent : theme.primaryText)
                    Text(mode.description)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.6), radius: 4)
                }
            }
            .padding(14)
            .background(isSelected ? accent.opacity(0.08) : theme.surface)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? accent.opacity(0.55) : theme.divider,
                        lineWidth: isSelected ? 1.5 : 1))
            .cornerRadius(10)
        }
    }
}

// MARK: - Text Size Card

struct TextSizeCard: View {
    let option: TextSizeOption
    let isSelected: Bool
    let theme: AppTheme
    let accent: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                Image(systemName: option.icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? accent : theme.secondaryText)
                    .frame(width: 34)
                    .shadow(color: isSelected ? accent.opacity(0.7) : .clear, radius: 5)

                VStack(alignment: .leading, spacing: 4) {
                    Text(option.displayName.uppercased())
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(isSelected ? accent : theme.primaryText)
                    Text(option.description)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }

                Spacer()

                // Live preview of the font size
                Text("Aa")
                    .font(.system(size: option.fontSize, weight: .medium, design: .rounded))
                    .foregroundColor(isSelected ? accent : theme.secondaryText)
                    .frame(width: 34, alignment: .trailing)

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.6), radius: 4)
                }
            }
            .padding(14)
            .background(isSelected ? accent.opacity(0.08) : theme.surface)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? accent.opacity(0.55) : theme.divider,
                        lineWidth: isSelected ? 1.5 : 1))
            .cornerRadius(10)
        }
    }
}

// MARK: - Exam Countdown Card

struct ExamCountdownCard: View {
    let testDate: Date
    let planStartDate: Date?
    let nodesCompleted: Int
    let totalNodes: Int
    let accent: Color
    let theme: AppTheme

    private var calendar: Calendar { Calendar.current }

    private var daysRemaining: Int {
        max(0, calendar.dateComponents([.day], from: calendar.startOfDay(for: Date()),
                                        to: calendar.startOfDay(for: testDate)).day ?? 0)
    }

    private var nodesRemaining: Int { max(0, totalNodes - nodesCompleted) }

    /// Nodes per day needed from today to reach 100%
    private var dailyTarget: Double {
        guard daysRemaining > 0 else { return Double(nodesRemaining) }
        return Double(nodesRemaining) / Double(daysRemaining)
    }

    /// On-track % — actual progress vs expected progress since plan start
    private var onTrackPct: Double {
        guard let start = planStartDate else {
            // No plan start: just show completion %
            return Double(nodesCompleted) / Double(totalNodes)
        }
        let totalPlanDays = max(1, calendar.dateComponents([.day],
            from: calendar.startOfDay(for: start),
            to: calendar.startOfDay(for: testDate)).day ?? 1)
        let elapsed = max(0, calendar.dateComponents([.day],
            from: calendar.startOfDay(for: start),
            to: calendar.startOfDay(for: Date())).day ?? 0)
        let expected = Double(elapsed) / Double(totalPlanDays)
        let actual   = Double(nodesCompleted) / Double(totalNodes)
        guard expected > 0 else { return actual > 0 ? 1.0 : 0 }
        return min(actual / expected, 2.0) // cap at 200%
    }

    private var onTrackLabel: String {
        let pct = onTrackPct
        if pct >= 1.20 { return "AHEAD" }
        if pct >= 0.85 { return "ON TRACK" }
        if pct >= 0.60 { return "BEHIND" }
        return "AT RISK"
    }

    private var onTrackColor: Color {
        let pct = onTrackPct
        if pct >= 1.20 { return Color(red: 0.15, green: 0.88, blue: 0.48) }
        if pct >= 0.85 { return Color(red: 0.15, green: 0.88, blue: 0.48) }
        if pct >= 0.60 { return Color(red: 1.00, green: 0.65, blue: 0.00) }
        return Color(red: 0.95, green: 0.22, blue: 0.30)
    }

    private var completionPct: Double { Double(nodesCompleted) / Double(totalNodes) }

    private var examDateString: String {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f.string(from: testDate)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Header row — exam date + status badge
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("EXAM DATE")
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .tracking(1.5)
                    Text(examDateString)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(accent)
                }
                Spacer()
                Text(onTrackLabel)
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .foregroundColor(onTrackColor)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(onTrackColor.opacity(0.12))
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(onTrackColor.opacity(0.35), lineWidth: 1))
                    .cornerRadius(5)
            }

            Divider().background(theme.divider)

            // Stats grid
            HStack(spacing: 0) {
                statColumn(value: "\(daysRemaining)", label: "DAYS LEFT")
                Divider().background(theme.divider).frame(height: 36)
                statColumn(value: String(format: "%.1f", dailyTarget), label: "NODES/DAY")
                Divider().background(theme.divider).frame(height: 36)
                statColumn(value: "\(nodesRemaining)", label: "REMAINING")
                Divider().background(theme.divider).frame(height: 36)
                statColumn(value: String(format: "%.0f%%", onTrackPct * 100), label: "ON TRACK")
            }

            Divider().background(theme.divider)

            // Overall completion bar
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("OVERALL COMPLETION")
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .tracking(1.5)
                    Spacer()
                    Text("\(nodesCompleted) / \(totalNodes)  (\(Int(completionPct * 100))%)")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(accent)
                }
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(theme.surfaceSecondary)
                            .frame(height: 7)
                        RoundedRectangle(cornerRadius: 3)
                            .fill(accent)
                            .frame(width: geo.size.width * completionPct, height: 7)
                            .shadow(color: accent.opacity(0.5), radius: 3)
                    }
                }
                .frame(height: 7)
            }

            // Tip text
            if daysRemaining == 0 {
                Text("⚠ Your exam is today! Good luck!")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(.red)
            } else {
                Text("Complete \(String(format: "%.1f", dailyTarget)) node\(dailyTarget == 1 ? "" : "s") per day to finish all \(totalNodes) topics before exam day.")
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(14)
        .background(theme.surface)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(theme.divider, lineWidth: 1))
    }

    private func statColumn(value: String, label: String) -> some View {
        VStack(spacing: 3) {
            Text(value)
                .font(.system(size: 16, weight: .black, design: .monospaced))
                .foregroundColor(accent)
            Text(label)
                .font(.system(size: 7, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .tracking(1)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Appearance Card

struct AppearanceCard: View {
    let appearance: AppAppearance
    let isSelected: Bool
    let theme: AppTheme
    let accent: Color
    let onTap: () -> Void

    private var preview: AppTheme {
        switch appearance {
        case .dark:      return .dark
        case .warmLight: return .warmLight
        case .ultraDark: return .ultraDark
        case .midnight:  return .midnight
        }
    }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {

                // Mini preview swatch
                RoundedRectangle(cornerRadius: 6)
                    .fill(preview.background)
                    .frame(width: 44, height: 34)
                    .overlay(
                        VStack(spacing: 3) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(accent.opacity(0.75))
                                .frame(width: 26, height: 4)
                            RoundedRectangle(cornerRadius: 2)
                                .fill(preview.primaryText.opacity(0.35))
                                .frame(width: 20, height: 2)
                            RoundedRectangle(cornerRadius: 2)
                                .fill(preview.primaryText.opacity(0.20))
                                .frame(width: 22, height: 2)
                        }
                    )
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(theme.divider, lineWidth: 1))

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Image(systemName: appearance.icon)
                            .font(.system(size: 11))
                            .foregroundColor(isSelected ? accent : theme.secondaryText)
                        Text(appearance.displayName.uppercased())
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(isSelected ? accent : theme.primaryText)
                    }
                    Text(appearance.description)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.6), radius: 4)
                }
            }
            .padding(14)
            .background(isSelected ? accent.opacity(0.08) : theme.surface)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? accent.opacity(0.55) : theme.divider,
                        lineWidth: isSelected ? 1.5 : 1))
            .cornerRadius(10)
        }
    }
}
