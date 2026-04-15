//
//  SettingsView.swift
//  Synapse PTCE  v9.0
//
//  System settings: Game Mode, Appearance, About/Credits, Full Reset.
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

    private var accent: Color { engine.currentTheme.accentColor }

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackground()

            VStack(spacing: 0) {

                // ── Header ───────────────────────────────────────────────────
                HStack {
                    Button { dismiss() } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left").font(.system(size: 11, weight: .bold))
                            Text("BACK").font(.system(size: 11, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(accent)
                    }
                    Spacer()
                    Text("SYSTEM SETTINGS")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.55), radius: 5)
                    Spacer()
                    Text("v9.0")
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
                        appearanceSection
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
                Text("SYNAPSE // PTCE NETWORK v10.0 // MAIN BRANCH")
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

// MARK: - Appearance Card

struct AppearanceCard: View {
    let appearance: AppAppearance
    let isSelected: Bool
    let theme: AppTheme
    let accent: Color
    let onTap: () -> Void

    private var preview: AppTheme { appearance == .dark ? .dark : .warmLight }

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
                                .fill(preview.primaryText.opacity(0.25))
                                .frame(width: 20, height: 2)
                            RoundedRectangle(cornerRadius: 2)
                                .fill(preview.primaryText.opacity(0.15))
                                .frame(width: 22, height: 2)
                        }
                    )
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(theme.divider, lineWidth: 1))

                VStack(alignment: .leading, spacing: 4) {
                    Text(appearance.displayName.uppercased())
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(isSelected ? accent : theme.primaryText)
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
