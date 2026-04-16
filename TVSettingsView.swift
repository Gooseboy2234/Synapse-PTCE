//
//  TVSettingsView.swift
//  Synapse PTCE  v13.0
//
//  Apple TV settings — focus-navigable list of all settings sections.
//  No keyboard required: reset uses a numeric PIN instead of text field.
//

#if os(tvOS)
import SwiftUI

// MARK: - TV Settings View

struct TVSettingsView: View {
    let engine: GameEngine
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme)  private var theme

    @State private var showResetConfirm = false
    @State private var resetPIN         = ""
    @State private var showResetDone    = false
    @State private var pickedDate       = Calendar.current.date(byAdding: .day, value: 60, to: Date()) ?? Date()

    private var accent: Color { engine.currentTheme.accentColor }
    private let cyan   = Color(red: 0.6,  green: 0.9,  blue: 1.0)
    private let gold   = Color(red: 1.0,  green: 0.85, blue: 0.2)

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            TVGridBackground()

            VStack(spacing: 0) {
                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left").font(.system(size: 18, weight: .bold))
                            Text("BACK").font(.system(size: 18, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(accent)
                    }
                    .buttonStyle(.plain)
                    .padding(.leading, 100)

                    Spacer()

                    Text("SYSTEM SETTINGS")
                        .font(.system(size: 28, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.55), radius: 8)

                    Spacer()

                    Text("v13.0")
                        .font(.system(size: 18, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .padding(.trailing, 100)
                }
                .padding(.vertical, 26)
                .background(theme.surface.opacity(0.88))
                .overlay(Rectangle().fill(accent.opacity(0.18)).frame(height: 1), alignment: .bottom)

                // Content
                ScrollView(.vertical, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        // Left column
                        VStack(alignment: .leading, spacing: 40) {
                            gameModeSection
                            textSizeSection
                        }
                        .frame(maxWidth: .infinity)

                        // Right column
                        VStack(alignment: .leading, spacing: 40) {
                            appearanceSection
                            examCountdownSection
                            aboutSection
                            if showResetDone {
                                resetDoneView
                            } else {
                                resetSection
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 60)
                }
            }
        }
        .onExitCommand { dismiss() }
    }

    // MARK: - Game Mode

    private var gameModeSection: some View {
        TVSettingsSection(title: "GAME MODE", accent: accent, theme: theme) {
            VStack(spacing: 16) {
                ForEach(GameMode.allCases, id: \.rawValue) { mode in
                    TVSettingsCard(
                        icon: mode.icon,
                        title: mode.displayName.uppercased(),
                        subtitle: mode.description,
                        isSelected: engine.currentGameMode == mode,
                        accent: accent, theme: theme
                    ) { engine.setGameMode(mode) }
                }
            }
        }
    }

    // MARK: - Text Size

    private var textSizeSection: some View {
        TVSettingsSection(title: "STUDY TEXT SIZE", accent: accent, theme: theme) {
            VStack(spacing: 16) {
                ForEach(TextSizeOption.allCases, id: \.rawValue) { size in
                    TVSettingsCard(
                        icon: size.icon,
                        title: size.displayName.uppercased(),
                        subtitle: size.description,
                        isSelected: engine.currentTextSize == size,
                        accent: accent, theme: theme,
                        trailing: {
                            Text("Aa")
                                .font(.system(size: size.fontSize + 4, weight: .medium, design: .rounded))
                                .foregroundColor(engine.currentTextSize == size ? accent : theme.secondaryText)
                        }
                    ) { engine.setTextSize(size) }
                }
            }
        }
    }

    // MARK: - Appearance

    private var appearanceSection: some View {
        TVSettingsSection(title: "APPEARANCE", accent: accent, theme: theme) {
            VStack(spacing: 16) {
                ForEach(AppAppearance.allCases, id: \.rawValue) { ap in
                    TVSettingsCard(
                        icon: ap.icon,
                        title: ap.displayName.uppercased(),
                        subtitle: ap.description,
                        isSelected: engine.currentAppearance == ap,
                        accent: accent, theme: theme
                    ) { engine.setAppearance(ap) }
                }
            }
        }
    }

    // MARK: - Exam Countdown

    private var examCountdownSection: some View {
        TVSettingsSection(title: "EXAM COUNTDOWN", accent: accent, theme: theme) {
            VStack(alignment: .leading, spacing: 16) {
                if let testDate = engine.currentTestDate {
                    // Countdown stats card
                    let days = max(0, Calendar.current.dateComponents(
                        [.day],
                        from: Calendar.current.startOfDay(for: Date()),
                        to: Calendar.current.startOfDay(for: testDate)
                    ).day ?? 0)
                    let remaining = max(0, 151 - engine.currentNodesCompleted)
                    let dailyTarget = days > 0 ? Double(remaining) / Double(days) : Double(remaining)

                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Image(systemName: "calendar").font(.system(size: 20))
                            let f: DateFormatter = {
                                let df = DateFormatter(); df.dateStyle = .long; return df
                            }()
                            Text(f.string(from: testDate))
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(accent)

                        Divider().background(theme.divider)

                        HStack(spacing: 0) {
                            tvStatCol(value: "\(days)", label: "DAYS LEFT")
                            Divider().background(theme.divider).frame(height: 44)
                            tvStatCol(value: String(format: "%.1f", dailyTarget), label: "NODES/DAY")
                            Divider().background(theme.divider).frame(height: 44)
                            tvStatCol(value: "\(remaining)", label: "REMAINING")
                            Divider().background(theme.divider).frame(height: 44)
                            tvStatCol(value: "\(engine.currentNodesCompleted)/151", label: "COMPLETE")
                        }

                        Divider().background(theme.divider)

                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule().fill(accent.opacity(0.10)).frame(height: 8)
                                Capsule()
                                    .fill(accent)
                                    .frame(width: geo.size.width * min(Double(engine.currentNodesCompleted) / 151.0, 1), height: 8)
                                    .shadow(color: accent.opacity(0.6), radius: 5)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding(20)
                    .background(theme.surface)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(theme.divider, lineWidth: 1))
                    .cornerRadius(14)

                    Button {
                        engine.clearTestDate()
                    } label: {
                        Label("CLEAR EXAM DATE", systemImage: "xmark.circle")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(.red.opacity(0.8))
                    }
                    .buttonStyle(.plain)

                } else {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Set your PTCE exam date to track daily progress and stay on target.")
                            .font(.system(size: 16, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("To set your exam date, open Synapse on iPhone or iPad.")
                            .font(.system(size: 16, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(20)
                    .background(theme.surface)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(theme.divider, lineWidth: 1))
                    .cornerRadius(14)
                }
            }
        }
    }

    private func tvStatCol(value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 22, weight: .black, design: .monospaced))
                .foregroundColor(accent)
            Text(label)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .tracking(1)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - About

    private var aboutSection: some View {
        TVSettingsSection(title: "ABOUT", accent: accent, theme: theme) {
            VStack(alignment: .leading, spacing: 8) {
                Text("SYNAPSE // PTCE NETWORK v13.0 // MAIN BRANCH")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.4), radius: 3)

                Divider().background(theme.divider)

                Group {
                    tvInfoRow(label: "DEVELOPER", value: "Ethan Bradley (Gooseboy2234)")
                    tvInfoRow(label: "LOCATION",  value: "Hendersonville, TN")
                    tvInfoRow(label: "EXAM",      value: "2026 PTCB Blueprint")
                    tvInfoRow(label: "NODES",     value: "151 across 4 scored domains")
                }
            }
            .padding(20)
            .background(theme.surface)
            .cornerRadius(14)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(theme.divider, lineWidth: 1))
        }
    }

    private func tvInfoRow(label: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(label)
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .frame(width: 110, alignment: .leading)
                .tracking(1)
            Text(value)
                .font(.system(size: 14, design: .monospaced))
                .foregroundColor(theme.primaryText)
        }
    }

    // MARK: - Reset

    /// PIN-based reset confirmation — avoids requiring a keyboard on tvOS.
    /// User selects digits with the remote focus engine.
    private var resetSection: some View {
        TVSettingsSection(title: "SYSTEM MAINTENANCE", accent: accent, theme: theme) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 10) {
                    Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.red)
                    Text("FULL SYSTEM RESET")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.red)
                }

                Text("Erases all progress, XP, Data Shards, and story events. Theme and mode preferences are kept.")
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)

                if showResetConfirm {
                    TVResetPINConfirm(theme: theme) {
                        engine.resetAllProgress()
                        showResetConfirm = false
                        showResetDone    = true
                    } onCancel: {
                        showResetConfirm = false
                    }
                } else {
                    Button {
                        withAnimation { showResetConfirm = true }
                    } label: {
                        Text("INITIATE FULL RESET")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red.opacity(0.5), lineWidth: 1.5))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(20)
            .background(theme.surface)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.red.opacity(0.22), lineWidth: 1))
            .cornerRadius(14)
        }
    }

    private var resetDoneView: some View {
        TVSettingsSection(title: "SYSTEM MAINTENANCE", accent: accent, theme: theme) {
            HStack(spacing: 12) {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.green).font(.system(size: 24))
                Text("SYSTEM RESET COMPLETE")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.green)
            }
            .padding(20)
            .background(theme.surface)
            .cornerRadius(14)
        }
    }
}

// MARK: - TV Reset PIN Confirm

/// 4-digit PIN (1-2-3-4) confirmed via remote selection — no keyboard needed.
struct TVResetPINConfirm: View {
    let theme: AppTheme
    let onConfirm: () -> Void
    let onCancel:  () -> Void

    // The secret code is 1-2-3-4
    private let targetCode = [1, 2, 3, 4]
    @State private var entered: [Int] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Enter PIN 1-2-3-4 using the remote to confirm reset:")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.red.opacity(0.85))

            // PIN display
            HStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(i < entered.count ? Color.red : theme.divider, lineWidth: 2)
                            .frame(width: 50, height: 50)
                        if i < entered.count {
                            Text("\(entered[i])")
                                .font(.system(size: 22, weight: .black, design: .monospaced))
                                .foregroundColor(.red)
                        }
                    }
                }
            }

            // Digit buttons
            HStack(spacing: 12) {
                ForEach(1...5, id: \.self) { digit in
                    Button {
                        guard entered.count < 4 else { return }
                        entered.append(digit)
                        if entered.count == 4 {
                            if entered == targetCode {
                                onConfirm()
                            } else {
                                withAnimation(.easeInOut(duration: 0.15).repeatCount(3, autoreverses: true)) {
                                    entered = []
                                }
                            }
                        }
                    } label: {
                        Text("\(digit)")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(.red)
                            .frame(width: 56, height: 56)
                            .background(Color.red.opacity(0.10))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red.opacity(0.4), lineWidth: 1))
                            .cornerRadius(8)
                    }
                }
                Button {
                    if !entered.isEmpty { entered.removeLast() }
                } label: {
                    Image(systemName: "delete.left")
                        .font(.system(size: 20))
                        .foregroundColor(theme.secondaryText)
                        .frame(width: 56, height: 56)
                        .background(theme.surface)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(theme.divider, lineWidth: 1))
                        .cornerRadius(8)
                }
            }

            Button(action: onCancel) {
                Text("CANCEL")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - TV Settings Section

struct TVSettingsSection<Content: View>: View {
    let title: String
    let accent: Color
    let theme: AppTheme
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
                .tracking(2.5)
            content()
        }
    }
}

// MARK: - TV Settings Card

struct TVSettingsCard<Trailing: View>: View {
    let icon: String
    let title: String
    let subtitle: String
    let isSelected: Bool
    let accent: Color
    let theme: AppTheme
    let trailing: () -> Trailing
    let onTap: () -> Void

    @Environment(\.isFocused) private var isFocused

    init(icon: String, title: String, subtitle: String,
         isSelected: Bool, accent: Color, theme: AppTheme,
         @ViewBuilder trailing: @escaping () -> Trailing = { EmptyView() },
         onTap: @escaping () -> Void) {
        self.icon = icon; self.title = title; self.subtitle = subtitle
        self.isSelected = isSelected; self.accent = accent; self.theme = theme
        self.trailing = trailing; self.onTap = onTap
    }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 18) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected || isFocused ? accent : theme.secondaryText)
                    .frame(width: 40)
                    .shadow(color: (isSelected || isFocused) ? accent.opacity(0.7) : .clear, radius: 6)

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .foregroundColor(isSelected || isFocused ? accent : theme.primaryText)
                    Text(subtitle)
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                trailing()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.6), radius: 5)
                }
            }
            .padding(18)
            .background(isSelected || isFocused ? accent.opacity(0.08) : theme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected || isFocused ? accent.opacity(0.6) : theme.divider,
                            lineWidth: isSelected || isFocused ? 2 : 1)
            )
            .cornerRadius(12)
            .scaleEffect(isFocused ? 1.02 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}
#endif
