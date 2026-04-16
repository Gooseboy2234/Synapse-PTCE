//
//  TVHubView.swift
//  Synapse PTCE  v13.0
//
//  Apple TV hub — 2×2 domain card grid, stats top bar, action bar.
//  Designed for the 10-foot viewing experience with remote focus navigation.
//

#if os(tvOS)
import SwiftUI

// MARK: - TV Hub View

struct TVHubView: View {
    let engine: GameEngine
    let onSelectDomain:  (KnowledgeDomain) -> Void
    let onShowSettings:  () -> Void
    let onShowIntel:     () -> Void
    let onShowExam:      () -> Void
    let onShowCampaign:  () -> Void
    let onShowReview:    () -> Void

    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }

    var body: some View {
        VStack(spacing: 0) {
            TVTopBar(engine: engine)

            // ── Domain grid ─────────────────────────────────────────────────
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 50),
                    GridItem(.flexible(), spacing: 50)
                ],
                spacing: 46
            ) {
                ForEach(KnowledgeDomain.allCases) { domain in
                    TVDomainCard(
                        domain: domain,
                        progress: engine.progress(for: domain)
                    ) {
                        onSelectDomain(domain)
                    }
                }
            }
            .padding(.horizontal, 100)
            .padding(.top, 50)
            .padding(.bottom, 40)

            Spacer(minLength: 0)

            TVActionBar(
                engine: engine,
                onShowSettings:  onShowSettings,
                onShowIntel:     onShowIntel,
                onShowExam:      onShowExam,
                onShowCampaign:  onShowCampaign,
                onShowReview:    onShowReview
            )
        }
    }
}

// MARK: - TV Top Bar

struct TVTopBar: View {
    let engine: GameEngine
    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {

            // Left — app branding
            VStack(alignment: .leading, spacing: 6) {
                Text("SYNAPSE")
                    .font(.system(size: 34, weight: .black, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.55), radius: 10)
                Text("PTCE NETWORK  v13.0")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .foregroundColor(accent.opacity(0.40))
                    .tracking(3)
            }

            Spacer()

            // Center — stability score
            VStack(spacing: 8) {
                Text("STABILITY SCORE")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .tracking(2)
                HStack(alignment: .lastTextBaseline, spacing: 8) {
                    Text("\(engine.currentStabilityScore)")
                        .font(.system(size: 42, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.45), radius: 8)
                    Text("/ 1000")
                        .font(.system(size: 18, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(accent.opacity(0.10))
                        .frame(width: 260, height: 6)
                    Capsule()
                        .fill(accent)
                        .frame(width: 260 * min(Double(engine.currentStabilityScore) / 1000.0, 1.0), height: 6)
                        .shadow(color: accent.opacity(0.6), radius: 5)
                }
            }

            Spacer()

            // Right — rank + shards + countdown
            VStack(alignment: .trailing, spacing: 6) {
                Text(engine.currentSystemRank.badge)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .tracking(1)
                Text(engine.currentSystemRank.title)
                    .font(.system(size: 18, weight: .black, design: .monospaced))
                    .foregroundColor(accent)

                HStack(spacing: 8) {
                    Image(systemName: "diamond.fill").font(.system(size: 14))
                    Text("\(engine.currentDataShards)")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                }
                .foregroundColor(Color(red: 0.6, green: 0.9, blue: 1.0))

                // Exam countdown badge (if date is set)
                if let testDate = engine.currentTestDate {
                    let days = max(0, Calendar.current.dateComponents(
                        [.day],
                        from: Calendar.current.startOfDay(for: Date()),
                        to: Calendar.current.startOfDay(for: testDate)
                    ).day ?? 0)
                    HStack(spacing: 5) {
                        Image(systemName: "calendar").font(.system(size: 12))
                        Text("\(days)d")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                    }
                    .foregroundColor(days <= 14 ? Color(red: 0.95, green: 0.22, blue: 0.30) :
                                     days <= 30 ? Color(red: 1.0, green: 0.65, blue: 0.0) :
                                     Color(red: 0.15, green: 0.88, blue: 0.48))
                    .padding(.horizontal, 10).padding(.vertical, 4)
                    .background((days <= 14 ? Color.red : accent).opacity(0.12))
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke((days <= 14 ? Color.red : accent).opacity(0.3), lineWidth: 1))
                }
            }
        }
        .padding(.horizontal, 100)
        .padding(.vertical, 26)
        .background(theme.surface.opacity(0.85))
        .overlay(Rectangle().fill(accent.opacity(0.18)).frame(height: 1), alignment: .bottom)
    }
}

// MARK: - TV Domain Card

struct TVDomainCard: View {
    let domain: KnowledgeDomain
    let progress: DomainProgress
    let onTap: () -> Void

    @Environment(\.appTheme) private var theme
    @Environment(\.isFocused) private var isFocused

    private var accent: Color { domain.accentColor }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {

                // ── Icon + exam weight ──────────────────────────────────────
                HStack(alignment: .top) {
                    ZStack {
                        Circle()
                            .fill(accent.opacity(isFocused ? 0.25 : 0.10))
                            .frame(width: 70, height: 70)
                        Image(systemName: domain.icon)
                            .font(.system(size: 32))
                            .foregroundColor(accent)
                            .shadow(color: isFocused ? accent.opacity(0.9) : .clear, radius: 14)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text(domain.examWeightLabel)
                            .font(.system(size: 22, weight: .black, design: .monospaced))
                            .foregroundColor(accent)
                        Text("EXAM WEIGHT")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                            .tracking(1)
                    }
                }
                .padding(.bottom, 20)

                // ── Domain name ─────────────────────────────────────────────
                VStack(alignment: .leading, spacing: 5) {
                    Text(domain.shortName)
                        .font(.system(size: 24, weight: .black, design: .monospaced))
                        .foregroundColor(isFocused ? accent : theme.primaryText)
                        .shadow(color: isFocused ? accent.opacity(0.5) : .clear, radius: 6)
                    Text(domain.terminalSectorLabel)
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
                .padding(.bottom, 22)

                Spacer(minLength: 0)

                // ── Progress ────────────────────────────────────────────────
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("\(progress.completed) / \(progress.total) NODES")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        Spacer()
                        Text("\(Int(progress.percentComplete * 100))%")
                            .font(.system(size: 20, weight: .black, design: .monospaced))
                            .foregroundColor(accent)
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(accent.opacity(0.12))
                                .frame(height: 8)
                            RoundedRectangle(cornerRadius: 4)
                                .fill(accent)
                                .frame(width: geo.size.width * progress.percentComplete, height: 8)
                                .shadow(color: accent.opacity(0.7), radius: 5)
                        }
                    }
                    .frame(height: 8)
                }
            }
            .padding(32)
            .frame(maxWidth: .infinity)
            .frame(height: 260)
            .background(isFocused ? accent.opacity(0.10) : theme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        isFocused ? accent : theme.divider,
                        lineWidth: isFocused ? 2.5 : 1
                    )
            )
            .cornerRadius(20)
            .scaleEffect(isFocused ? 1.05 : 1.0)
            .shadow(
                color: isFocused ? accent.opacity(0.35) : .clear,
                radius: 20
            )
            .animation(.spring(response: 0.22, dampingFraction: 0.68), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - TV Action Bar

struct TVActionBar: View {
    let engine: GameEngine
    let onShowSettings: () -> Void
    let onShowIntel:    () -> Void
    let onShowExam:     () -> Void
    let onShowCampaign: () -> Void
    let onShowReview:   () -> Void

    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }

    private let cyan   = Color(red: 0.6,  green: 0.9,  blue: 1.0)
    private let gold   = Color(red: 1.0,  green: 0.85, blue: 0.2)
    private let red    = Color(red: 0.95, green: 0.30, blue: 0.30)
    private let violet = Color(red: 0.72, green: 0.52, blue: 1.0)

    // Domain progress mini vertical bars
    private var domainBars: some View {
        HStack(spacing: 10) {
            ForEach(KnowledgeDomain.allCases) { domain in
                let prog = engine.progress(for: domain)
                VStack(spacing: 5) {
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(domain.accentColor.opacity(0.12))
                            .frame(width: 14, height: 48)
                        RoundedRectangle(cornerRadius: 3)
                            .fill(domain.accentColor.opacity(0.85))
                            .frame(width: 14, height: 48 * prog.percentComplete)
                    }
                    Text(domain.shortCode)
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                }
            }
        }
    }

    // Logic probe indicator
    private var probeIndicator: some View {
        let probe = engine.currentLogicProbe
        let probeGold = Color(red: 1.0, green: 0.85, blue: 0.2)
        return HStack(spacing: 6) {
            Image(systemName: "cpu")
                .font(.system(size: 14))
                .foregroundColor(probe.activeAbility != nil ? probeGold : theme.secondaryText)
            VStack(alignment: .leading, spacing: 4) {
                Text("PROBE L\(probe.level)")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(probe.activeAbility != nil ? probeGold : theme.secondaryText)
                HStack(spacing: 3) {
                    ForEach(1...LogicProbe.maxLevel, id: \.self) { lvl in
                        Capsule()
                            .fill(lvl <= probe.level ? probeGold : theme.divider)
                            .frame(width: 14, height: 5)
                    }
                }
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(accent.opacity(0.18))
                .frame(height: 1)

            HStack(spacing: 0) {
                // Left: probe + domain bars
                HStack(spacing: 28) {
                    probeIndicator
                    domainBars
                }
                .padding(.leading, 100)

                Spacer()

                // Center: action buttons
                HStack(spacing: 30) {
                    TVActionButton(label: "CAMPAIGN", icon: "arrow.2.squarepath", color: violet, action: onShowCampaign)
                    TVActionButton(label: "EXAM",     icon: "doc.text.fill",              color: gold,   action: onShowExam)
                    TVActionButton(
                        label: "BREACH",
                        icon: "exclamationmark.triangle.fill",
                        color: red,
                        badge: engine.breachNodes.isEmpty ? nil : "\(engine.breachNodes.count)",
                        action: onShowReview
                    )
                    TVActionButton(label: "INTEL",    icon: "chart.bar.fill",              color: cyan,   action: onShowIntel)
                }

                Spacer()

                // Right: shards + settings
                HStack(spacing: 24) {
                    HStack(spacing: 6) {
                        Image(systemName: "diamond.fill").font(.system(size: 16))
                        Text("\(engine.currentDataShards)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(cyan)

                    TVActionButton(label: "SETTINGS", icon: "gearshape.fill", color: theme.secondaryText, action: onShowSettings)
                }
                .padding(.trailing, 100)
            }
            .padding(.vertical, 22)
            .background(theme.surface.opacity(0.90))
        }
    }
}

// MARK: - TV Action Button

struct TVActionButton: View {
    let label: String
    let icon: String
    let color: Color
    var badge: String? = nil
    let action: () -> Void

    @Environment(\.isFocused) private var isFocused

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icon)
                        .font(.system(size: 26))
                        .foregroundColor(isFocused ? .black : color)
                        .frame(width: 56, height: 56)
                        .background(isFocused ? color : color.opacity(0.12))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(color.opacity(isFocused ? 0 : 0.4), lineWidth: 1)
                        )
                        .shadow(color: isFocused ? color.opacity(0.7) : .clear, radius: 12)

                    if let badge {
                        Text(badge)
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, 5).padding(.vertical, 2)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .offset(x: 8, y: -8)
                    }
                }

                Text(label)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(isFocused ? color : color.opacity(0.65))
            }
            .scaleEffect(isFocused ? 1.12 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.65), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}
#endif
