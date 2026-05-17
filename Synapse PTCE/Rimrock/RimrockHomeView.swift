//
//  RimrockHomeView.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  The home hub. Painterly Firewatch atmosphere; mastery as the centerpiece;
//  a "Today's Path" progression that names exactly what to do next; the four
//  PTCB domains as drillable tiles; practice exam + review + settings access.
//

import SwiftUI

struct RimrockHomeView: View {

    let engine: GameEngine
    let onSelectDomain: (KnowledgeDomain) -> Void
    let onShowStore: () -> Void
    let onShowSettings: () -> Void
    let onShowIntel: () -> Void
    let onShowReview: () -> Void
    let onShowExam: () -> Void
    let onShowBlueprintExam: () -> Void
    let onShowExamHistory: () -> Void
    let onShowReadiness: () -> Void
    let onShowRimrockShifts: () -> Void
    let onShowMasteryDetail: () -> Void

    @State private var heroRingPhase: Double = 0
    @State private var resumeShift: RimrockShift? = nil
    @AppStorage("rimrock_last_shift_played") private var lastShiftPlayed: Int = 0

    /// Reactive read of the persisted voice-mode session, if any.
    private var savedVoice: SavedVoiceSession? {
        VoiceSessionMemory.shared.last
    }
    private var resumeCandidate: RimrockShift? {
        guard let saved = savedVoice else { return nil }
        return RimrockContent.allShifts.first { $0.dayNumber == saved.dayNumber }
    }

    private var palette: RimrockAtmosphere.Palette {
        // Use the morning palette as the home base (warm, hopeful, ready-to-start)
        RimrockAtmosphere.palette(for: 1)
    }

    private var mastery: GlobalMasterySnapshot {
        engine.masteryTracker?.globalMastery() ?? Self.emptySnapshot
    }

    /// Bank-coverage snapshot — the *actual* pass-prep gauge. Surfaces alongside
    /// mastery so the player sees both signals.
    private var coverage: PracticeCoverage { engine.practiceCoverage() }

    /// Whether the player has finished the curated 35-day arc.
    private var arcComplete: Bool {
        lastShiftPlayed >= RimrockContent.allShifts.count
    }

    /// The next curated Rimrock shift in the arc, or `nil` once the player has
    /// played past Day 35 (procedural shifts take over via the hub).
    private var nextCuratedShift: RimrockShift? {
        if arcComplete { return nil }
        let all = RimrockContent.allShifts
        let nextDay = max(1, lastShiftPlayed + 1)
        return all.first(where: { $0.dayNumber >= nextDay })
    }

    /// Legacy alias retained for call sites that just want "what's next" without
    /// caring whether it's curated or procedural; returns Day 1 as a safe fallback
    /// for the very-first-launch case.
    private var nextShift: RimrockShift {
        nextCuratedShift ?? RimrockContent.allShifts.first!
    }

    var body: some View {
        ZStack {
            atmosphere

            ScrollView {
                VStack(spacing: 28) {
                    hero
                    todaysPathSection
                    domainsSection
                    examSection
                    bottomNav
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 40)
            }
        }
        .fullScreenCoverCompat(item: $resumeShift) { shift in
            VoiceModeView(shift: shift) { resumeShift = nil }
        }
    }

    // MARK: - Atmosphere

    private var atmosphere: some View {
        ZStack {
            // Sky gradient
            LinearGradient(
                colors: [palette.skyTop, palette.skyMid, palette.skyBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Sun glow positioned for morning
            RimrockAtmosphere.sunGlow(for: 1)
                .ignoresSafeArea()

            // Subtle haze layer
            VStack {
                Spacer()
                LinearGradient(
                    colors: [
                        palette.accent.opacity(0.0),
                        palette.accent.opacity(0.05),
                        palette.accent.opacity(0.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 240)
                .blur(radius: 32)
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - Hero

    private var hero: some View {
        ZStack {
            // Atmospheric ridges behind the title block
            VStack(spacing: 0) {
                Spacer()
                BighornRidge(seed: 31, peakHeight: 0.30)
                    .fill(palette.ridgeFar)
                    .frame(height: 36)
                    .opacity(0.55)
                BighornRidge(seed: 17, peakHeight: 0.42)
                    .fill(palette.ridge)
                    .frame(height: 44)
            }

            VStack(spacing: 18) {
                // Title block
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            Image(systemName: "antenna.radiowaves.left.and.right")
                                .font(.system(size: 11, weight: .bold))
                            Text("RIMROCK PHARMACY")
                                .font(.system(size: 13, weight: .heavy, design: .monospaced))
                                .tracking(1.6)
                        }
                        .foregroundColor(palette.accent.opacity(0.95))

                        Text("JOHNSON COUNTY · WYOMING")
                            .font(.system(size: 9, weight: .medium, design: .monospaced))
                            .foregroundColor(palette.sceneText.opacity(0.55))
                            .tracking(1.3)
                    }

                    Spacer()

                    // Settings cog top-right
                    Button(action: onShowSettings) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(palette.sceneText.opacity(0.70))
                            .padding(10)
                            .background(Color.black.opacity(0.30))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                }

                // Big mastery ring centerpiece
                masteryRing
                    .padding(.top, 8)
            }
            .padding(.horizontal, 4)
            .padding(.top, 24)
        }
        .frame(height: 360)
    }

    private var masteryRing: some View {
        Button(action: onShowMasteryDetail) {
            VStack(spacing: 14) {
                ZStack {
                    Circle()
                        .stroke(palette.accent.opacity(0.10), lineWidth: 8)
                        .frame(width: 162, height: 162)

                    Circle()
                        .trim(from: 0, to: max(0.001, mastery.weightedPercent))
                        .stroke(palette.accent,
                                style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: 162, height: 162)
                        .rotationEffect(.degrees(-90))
                        .shadow(color: palette.accent.opacity(0.45), radius: 12)

                    // Animated leading dot
                    Circle()
                        .fill(palette.accent)
                        .frame(width: 10, height: 10)
                        .shadow(color: palette.accent.opacity(0.9), radius: 6)
                        .offset(y: -81)
                        .rotationEffect(.degrees(360 * mastery.weightedPercent - 90))
                        .opacity(mastery.weightedPercent > 0.001 ? 1 : 0)

                    VStack(spacing: 0) {
                        Text("\(Int((mastery.weightedPercent * 100).rounded()))")
                            .font(.system(size: 52, weight: .heavy, design: .monospaced))
                            .foregroundColor(palette.accent)
                        Text("%")
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .foregroundColor(palette.accent.opacity(0.7))
                            .offset(y: -8)

                        Text("PTCB BLUEPRINT")
                            .font(.system(size: 8, weight: .heavy, design: .monospaced))
                            .tracking(1.3)
                            .foregroundColor(palette.sceneText.opacity(0.55))
                            .padding(.top, 2)
                    }
                }

                VStack(spacing: 6) {
                    HStack(spacing: 12) {
                        Text("\(mastery.trulyLearned) / \(mastery.totalConcepts) truly learned")
                            .font(.system(size: 11, weight: .semibold, design: .monospaced))
                            .foregroundColor(palette.sceneText.opacity(0.85))

                        Rectangle()
                            .fill(palette.sceneText.opacity(0.25))
                            .frame(width: 0.5, height: 12)

                        HStack(spacing: 5) {
                            Image(systemName: mastery.dueForReview > 0 ? "bell.badge.fill" : "checkmark.circle")
                                .font(.system(size: 10))
                            Text(mastery.dueForReview > 0
                                 ? "\(mastery.dueForReview) due today"
                                 : "no reviews due")
                                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                        }
                        .foregroundColor(mastery.dueForReview > 0
                                         ? Color(red: 0.95, green: 0.78, blue: 0.45)
                                         : palette.sceneText.opacity(0.6))
                    }

                    // PASS PATH — bank verification gauge. The real "are you
                    // ready for the PTCB" signal.
                    passPathStrip
                }
            }
        }
        .buttonStyle(.plain)
    }

    // MARK: - Pass Path strip (bank coverage gauge)

    /// Inline coverage gauge — "X% PASS PATH · Y / Z verified · READY pill at ≥80%".
    /// Sits under the mastery sub-row in the hero so the player sees both
    /// signals at a glance.
    private var passPathStrip: some View {
        let cov = coverage
        let pct = Int((cov.verifiedPercent * 100).rounded())
        let color: Color = {
            if cov.verifiedPercent >= 0.8 { return Color(red: 0.25, green: 0.85, blue: 0.55) }
            if cov.verifiedPercent >= 0.5 { return Color(red: 0.95, green: 0.78, blue: 0.45) }
            return palette.accent
        }()
        return HStack(spacing: 8) {
            Image(systemName: "checkmark.shield.fill")
                .font(.system(size: 10))
                .foregroundColor(color)
            Text("\(pct)% PASS PATH")
                .font(.system(size: 11, weight: .heavy, design: .monospaced))
                .tracking(1.2)
                .foregroundColor(color)
            Text("·")
                .font(.system(size: 11, weight: .heavy, design: .monospaced))
                .foregroundColor(palette.sceneText.opacity(0.35))
            Text("\(cov.verified) / \(cov.bankSize) verified")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundColor(palette.sceneText.opacity(0.65))

            if cov.verifiedPercent >= 0.8 {
                Text("READY")
                    .font(.system(size: 9, weight: .heavy, design: .monospaced))
                    .tracking(1.3)
                    .foregroundColor(Color(red: 0.25, green: 0.85, blue: 0.55))
                    .padding(.horizontal, 6).padding(.vertical, 2)
                    .background(Color(red: 0.25, green: 0.85, blue: 0.55).opacity(0.15))
                    .overlay(Capsule()
                        .stroke(Color(red: 0.25, green: 0.85, blue: 0.55).opacity(0.55), lineWidth: 0.8))
                    .clipShape(Capsule())
            }
        }
    }

    // MARK: - Today's Path

    private var todaysPathSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("TODAY'S PATH", subtitle: pathSubtitle)

            if let resume = resumeCandidate {
                resumeVoiceCard(shift: resume)
            }

            primaryActionCard

            HStack(spacing: 12) {
                secondarySmallButton(
                    label: "ALL SHIFTS",
                    detail: "\(RimrockContent.allShifts.count) days",
                    icon: "list.bullet.rectangle",
                    action: onShowRimrockShifts
                )
                secondarySmallButton(
                    label: "LISTEN",
                    detail: "hands-free",
                    icon: "mic.fill",
                    action: { resumeShift = nextShiftForVoice() }
                )
                secondarySmallButton(
                    label: "REVIEW",
                    detail: mastery.dueForReview > 0 ? "\(mastery.dueForReview) due" : "no reviews",
                    icon: "bell",
                    action: onShowReview
                )
            }
        }
    }

    /// The shift voice mode should target when the user taps the LISTEN tile.
    /// Prefers the saved mid-session, falls back to the next curated shift,
    /// then to Day 1 if the bank is empty.
    private func nextShiftForVoice() -> RimrockShift {
        if let resume = resumeCandidate { return resume }
        if let next = nextCuratedShift   { return next }
        return RimrockContent.allShifts.first ?? RimrockContent.allShifts[0]
    }

    @ViewBuilder
    private func resumeVoiceCard(shift: RimrockShift) -> some View {
        let listenColor = Color(red: 0.20, green: 0.95, blue: 0.55)
        let minutes = (savedVoice?.elapsedSeconds ?? 0) / 60
        let minutesLabel = minutes <= 0 ? "Less than a minute in"
                                        : minutes == 1 ? "1 minute in"
                                                       : "\(minutes) minutes in"
        let when = VoiceSessionMemory.shared.lastSavedRelative ?? ""

        Button(action: { resumeShift = shift }) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(listenColor.opacity(0.18))
                        .frame(width: 44, height: 44)
                    Image(systemName: "mic.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(listenColor)
                        .symbolEffect(.pulse, options: .repeating)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text("CONTINUE YOUR SHIFT")
                        .font(.system(size: 9, weight: .heavy, design: .monospaced))
                        .tracking(1.5)
                        .foregroundColor(listenColor)
                    Text("Day \(shift.dayNumber) — \(shift.title)")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text("\(minutesLabel) · \(when)")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.6))
                        .lineLimit(1)
                }
                Spacer(minLength: 0)
                Image(systemName: "play.fill")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(listenColor)
                    .padding(10)
                    .background(listenColor.opacity(0.18))
                    .clipShape(Circle())
            }
            .padding(14)
            .background(
                LinearGradient(
                    colors: [listenColor.opacity(0.08), Color.black.opacity(0.35)],
                    startPoint: .leading, endPoint: .trailing
                )
            )
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(listenColor.opacity(0.4), lineWidth: 1))
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.25), radius: 6, y: 3)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Continue Day \(shift.dayNumber), \(minutesLabel)")
        .contextMenu {
            Button(role: .destructive) {
                VoiceSessionMemory.shared.clear()
            } label: {
                Label("Discard saved session", systemImage: "trash")
            }
        }
    }

    private var pathSubtitle: String {
        if mastery.dueForReview > 0 {
            return "Spaced repetition first — these are at risk of slipping"
        } else if lastShiftPlayed == 0 {
            return "Start the arc — Day 1 walks you through your first shift"
        } else if lastShiftPlayed >= RimrockContent.allShifts.count {
            return "Arc complete — consider a practice exam"
        } else {
            return "Continue where you left off — one shift per study session"
        }
    }

    private var primaryActionCard: some View {
        let isReview = mastery.dueForReview > 0

        return Button(action: {
            if isReview { onShowReview() } else { onShowRimrockShifts() }
        }) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(isReview ? "REVIEW"
                             : (arcComplete ? "OPEN SHIFT" : "NEXT SHIFT"))
                            .font(.system(size: 9, weight: .heavy, design: .monospaced))
                            .tracking(1.5)
                            .foregroundColor(palette.accent.opacity(0.75))

                        if isReview {
                            Text("\(mastery.dueForReview) concepts due")
                                .font(.system(size: 22, weight: .heavy, design: .monospaced))
                                .foregroundColor(.white.opacity(0.95))
                                .tracking(0.8)
                        } else if let curated = nextCuratedShift {
                            HStack(spacing: 10) {
                                Text("DAY \(curated.dayNumber)")
                                    .font(.system(size: 22, weight: .heavy, design: .monospaced))
                                    .foregroundColor(palette.accent)
                                    .tracking(0.5)
                                Text(curated.title.uppercased())
                                    .font(.system(size: 18, weight: .heavy, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.95))
                                    .tracking(1.0)
                            }
                            Text("\(curated.dateLine) · \(curated.timeLine)")
                                .font(.system(size: 11, weight: .medium, design: .monospaced))
                                .foregroundColor(palette.sceneText.opacity(0.7))
                                .padding(.top, 1)
                        } else {
                            // Post-arc: procedural shifts. The hub view handles
                            // generation; this card just teases the day number.
                            HStack(spacing: 10) {
                                Text("DAY \(coverage.nextShiftNumber)")
                                    .font(.system(size: 22, weight: .heavy, design: .monospaced))
                                    .foregroundColor(palette.accent)
                                    .tracking(0.5)
                                Text("OPEN SHIFT")
                                    .font(.system(size: 18, weight: .heavy, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.95))
                                    .tracking(1.0)
                            }
                            Text(coverage.isFullyVerified
                                 ? "Full bank verified — reinforcement only"
                                 : "Procedural · \(max(0, coverage.bankSize - coverage.verified)) Qs left to verify")
                                .font(.system(size: 11, weight: .medium, design: .monospaced))
                                .foregroundColor(palette.sceneText.opacity(0.7))
                                .padding(.top, 1)
                        }
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(palette.accent.opacity(0.8))
                }

                if !isReview {
                    if let curated = nextCuratedShift, let teaser = teaserFor(shift: curated) {
                        Text(teaser)
                            .font(.system(size: 14, design: .serif))
                            .italic()
                            .foregroundColor(palette.sceneText.opacity(0.85))
                            .lineSpacing(4)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else if arcComplete {
                        Text(coverage.isFullyVerified
                             ? "Every question in the bank is verified. Keep showing up for reinforcement, or schedule the PTCB."
                             : "Shifts drill the full PTCB bank now — Mara keeps the radio on, you keep working through.")
                            .font(.system(size: 14, design: .serif))
                            .italic()
                            .foregroundColor(palette.sceneText.opacity(0.85))
                            .lineSpacing(4)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(18)
            .background(
                LinearGradient(
                    colors: [palette.panel, palette.panel.opacity(0.65)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(palette.accent.opacity(0.30), lineWidth: 1)
            )
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.30), radius: 10, y: 5)
        }
        .buttonStyle(.plain)
    }

    private func teaserFor(shift: RimrockShift) -> String? {
        for beat in shift.beats {
            if case .scene(let text) = beat {
                return text
            }
        }
        return nil
    }

    private func secondarySmallButton(
        label: String,
        detail: String,
        icon: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 13))
                    .foregroundColor(palette.accent.opacity(0.7))
                    .frame(width: 22)

                VStack(alignment: .leading, spacing: 1) {
                    Text(label)
                        .font(.system(size: 10, weight: .heavy, design: .monospaced))
                        .tracking(1.3)
                        .foregroundColor(.white.opacity(0.85))
                    Text(detail)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.55))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(palette.accent.opacity(0.45))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(palette.panel.opacity(0.65))
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(palette.accent.opacity(0.18), lineWidth: 1)
            )
            .cornerRadius(9)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Domains

    private var domainsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("PTCB DOMAINS",
                          subtitle: "drill the bank by domain — no story, no waiting")

            LazyVGrid(
                columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)],
                spacing: 12
            ) {
                ForEach(KnowledgeDomain.allCases) { domain in
                    domainTile(domain)
                }
            }

            // Quick reminder that this is the "skip the reading" path
            HStack(spacing: 8) {
                Image(systemName: "books.vertical")
                    .font(.system(size: 11))
                    .foregroundColor(palette.sceneText.opacity(0.55))
                Text("Prefer to skip the story? Tap a domain — same bank, no narrative.")
                    .font(.system(size: 11, design: .serif))
                    .italic()
                    .foregroundColor(palette.sceneText.opacity(0.60))
                Spacer(minLength: 0)
            }
            .padding(.top, 4)
        }
    }

    private func domainTile(_ domain: KnowledgeDomain) -> some View {
        let snap = mastery.perDomain[domain]
        let total = snap?.totalConcepts ?? 0
        let learned = snap?.trulyLearned ?? 0
        let percent = snap?.trulyLearnedPercent ?? 0

        return Button(action: { onSelectDomain(domain) }) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: domain.icon)
                        .font(.system(size: 13))
                        .foregroundColor(domain.accentColor)
                    Text(domain.shortName.uppercased())
                        .font(.system(size: 11, weight: .heavy, design: .monospaced))
                        .tracking(1.2)
                        .foregroundColor(.white.opacity(0.92))
                        .lineLimit(1)
                    Spacer()
                    Text(domain.examWeightLabel)
                        .font(.system(size: 9, weight: .heavy, design: .monospaced))
                        .foregroundColor(domain.accentColor.opacity(0.85))
                }

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("\(learned)")
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                        .foregroundColor(domain.accentColor)
                    Text("/ \(total)")
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.55))
                    Spacer()
                }

                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.white.opacity(0.05))
                            .frame(height: 4)
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [domain.accentColor.opacity(0.7), domain.accentColor],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * percent, height: 4)
                    }
                    .cornerRadius(2)
                }
                .frame(height: 4)

                Text(percent > 0
                     ? "\(Int((percent * 100).rounded()))% truly learned"
                     : "Tap to begin")
                    .font(.system(size: 9, weight: .medium, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.55))
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [palette.panel.opacity(0.85), palette.panel.opacity(0.55)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(domain.accentColor.opacity(0.25), lineWidth: 1)
            )
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.20), radius: 5, y: 2)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Exam

    private var examSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("READINESS CHECK", subtitle: "exam practice + readiness signal")

            // Headline button — Blueprint Exam (the official-style full diagnostic)
            Button(action: onShowBlueprintExam) {
                HStack(spacing: 14) {
                    Image(systemName: "doc.badge.clock")
                        .font(.system(size: 22))
                        .foregroundColor(palette.accent)
                        .frame(width: 36)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("BLUEPRINT EXAM")
                            .font(.system(size: 13, weight: .heavy, design: .monospaced))
                            .tracking(1.4)
                            .foregroundColor(.white.opacity(0.95))
                        Text("90 Q · 1h 50min · blueprint-weighted · scaled score 1400–1900")
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                            .foregroundColor(palette.sceneText.opacity(0.6))
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(palette.accent.opacity(0.7))
                }
                .padding(16)
                .background(
                    LinearGradient(
                        colors: [palette.panel, palette.panel.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(palette.accent.opacity(0.45), lineWidth: 1.2)
                )
                .cornerRadius(11)
            }
            .buttonStyle(.plain)

            // Three small tiles — Readiness, Practice (legacy), History
            HStack(spacing: 10) {
                examTile(label: "READINESS", icon: "gauge.with.needle", action: onShowReadiness)
                examTile(label: "PRACTICE",  icon: "doc.text.magnifyingglass", action: onShowExam)
                examTile(label: "HISTORY",   icon: "clock.arrow.circlepath", action: onShowExamHistory)
            }
        }
    }

    private func examTile(label: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(palette.accent.opacity(0.85))
                Text(label)
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .foregroundColor(.white.opacity(0.85))
                    .tracking(1.2)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(palette.panel.opacity(0.65))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(palette.accent.opacity(0.22), lineWidth: 1)
            )
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Bottom nav

    private var bottomNav: some View {
        HStack(spacing: 12) {
            bottomTile(label: "INTEL",
                       icon: "chart.bar.doc.horizontal",
                       action: onShowIntel)
            bottomTile(label: "STORE",
                       icon: "bag",
                       action: onShowStore)
        }
    }

    private func bottomTile(
        label: String,
        icon: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(palette.accent.opacity(0.65))
                Text(label)
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .tracking(1.3)
                    .foregroundColor(.white.opacity(0.75))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 11)
            .background(palette.panel.opacity(0.55))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(palette.accent.opacity(0.15), lineWidth: 1)
            )
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Section header

    private func sectionHeader(_ title: String, subtitle: String?) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 10, weight: .heavy, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(palette.accent.opacity(0.85))
            if let subtitle {
                Text(subtitle)
                    .font(.system(size: 11, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(palette.sceneText.opacity(0.55))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Empty fallback

    private static let emptySnapshot = GlobalMasterySnapshot(
        totalConcepts: 0,
        trulyLearned: 0,
        unseen: 0,
        dueForReview: 0,
        weightedPercent: 0,
        perDomain: [:]
    )
}
