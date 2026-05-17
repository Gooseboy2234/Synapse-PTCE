//
//  TVRimrockHomeView.swift
//  Synapse PTCE — Rimrock Pharmacy on Apple TV
//
//  tvOS-native landing for the Rimrock storytelling layer.
//  Painterly Firewatch atmosphere; mastery ring centerpiece; "TODAY'S PATH"
//  next-shift hero; focusable grid of all 35 shifts; PTCB-domain strip;
//  practice section once the curated arc is complete; bottom action bar for
//  exam / review / intel / history / settings.
//
//  Selecting a shift opens RimrockShiftView full-screen. Selecting a domain
//  drops into the existing tvOS quest picker → sector → encounter stack.
//

#if os(tvOS)
import SwiftUI

// MARK: - tvOS font comfort

/// Comfort-scales author-chosen sizes for 10-foot viewing. The home view was
/// authored at tvOS scale already, so this applies a gentle 1.25× bump and a
/// 14pt floor for the smallest captions. Anything ≥ 24pt was already a
/// hero/heading-size value and is left alone so the tightly-packed action
/// bar and shift cards don't overflow their containers.
private func tvFont(_ base: CGFloat) -> CGFloat {
    if base >= 24 { return base }
    return max(base * 1.25, 14)
}

// MARK: - Focus targets

/// Hashable identifier for any focusable region on the home screen — used with
/// `@FocusState` so we can land focus on `.nextShift` on entry and keep cards
/// inside their own logical sections.
private enum TVRimrockHomeFocus: Hashable {
    case nextShift
    case mastery
    case practice
    case shift(Int)
}

// MARK: - Act grouping

/// The 5 narrative acts of the Rimrock arc. Used to break the 35-shift grid
/// into orientation-friendly chunks with their own headers and progress bars.
private enum TVRimrockAct: Int, CaseIterable, Identifiable {
    case one = 1, two, three, four, review
    var id: Int { rawValue }

    var range: ClosedRange<Int> {
        switch self {
        case .one:    return 1...3
        case .two:    return 4...10
        case .three:  return 11...18
        case .four:   return 19...25
        case .review: return 26...35
        }
    }

    var label: String {
        switch self {
        case .one:    return "ACT 1 · FIRST SHIFTS"
        case .two:    return "ACT 2 · SETTLING IN"
        case .three:  return "ACT 3 · SOMETHING'S WRONG"
        case .four:   return "ACT 4 · CLIMAX"
        case .review: return "REVIEW DAYS"
        }
    }

    var subtitle: String {
        switch self {
        case .one:    return "Days 1–3 · Learning the ropes"
        case .two:    return "Days 4–10 · The rhythm of the bench"
        case .three:  return "Days 11–18 · Something doesn't add up"
        case .four:   return "Days 19–25 · The reckoning"
        case .review: return "Days 26–35 · Spaced reinforcement"
        }
    }

    var accent: Color {
        switch self {
        case .one:    return Color(red: 0.85, green: 0.74, blue: 0.50)
        case .two:    return Color(red: 0.62, green: 0.78, blue: 0.85)
        case .three:  return Color(red: 0.92, green: 0.65, blue: 0.50)
        case .four:   return Color(red: 0.78, green: 0.62, blue: 0.92)
        case .review: return Color(red: 0.55, green: 0.78, blue: 0.55)
        }
    }
}

// MARK: - TV Rimrock Home View

struct TVRimrockHomeView: View {

    @Bindable var engine: GameEngine

    // Active shift presentation (curated + procedural practice both use this)
    @State private var activeShift: RimrockShift? = nil

    // Domain drill-down stack
    @State private var domainPicker: KnowledgeDomain? = nil
    @State private var sectorQuest: DomainQuest? = nil

    // Sheets
    @State private var showSettings       = false
    @State private var showBlueprintExam  = false
    @State private var showPracticeExam   = false
    @State private var showExamHistory    = false
    @State private var showReadiness      = false
    @State private var showReview         = false
    @State private var showIntel          = false

    // Focus management — `nextShift` is the default first-focus target.
    @FocusState private var focusedSection: TVRimrockHomeFocus?

    // Animated trim for the mastery ring, eased in on first appear.
    @State private var ringFillProgress: Double = 0

    @AppStorage("rimrock_last_shift_played") private var lastShiftPlayed: Int = 0
    @AppStorage("rimrock_streak_count") private var streakCount: Int = 0
    @AppStorage("rimrock_streak_last_date") private var streakLastDateRaw: Double = 0

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    /// Whether the player has actually played a shift today (drives the
    /// streak-readout colour — bright when current, faded when at risk).
    private var streakIsCurrent: Bool {
        guard streakLastDateRaw > 0 else { return false }
        let cal = Calendar.current
        let last = cal.startOfDay(for: Date(timeIntervalSince1970: streakLastDateRaw))
        return cal.isDate(last, inSameDayAs: cal.startOfDay(for: Date()))
    }

    private var palette: RimrockAtmosphere.Palette { RimrockAtmosphere.palette(for: 1) }
    private var allShifts: [RimrockShift] { RimrockContent.allShifts }
    private var mastery: GlobalMasterySnapshot { engine.masteryTracker.globalMastery() }
    private var coverage: PracticeCoverage { engine.practiceCoverage() }

    /// The next curated shift in the arc, or `nil` once the player has played
    /// past Day 35 — at which point `nextProceduralDay` takes over.
    private var nextCuratedShift: RimrockShift? {
        if lastShiftPlayed >= allShifts.count { return nil }
        let nextDay = max(1, lastShiftPlayed + 1)
        return allShifts.first(where: { $0.dayNumber >= nextDay })
    }

    /// Synthetic day number for the next procedural ("open") shift. Used both
    /// for the hero card's label and to anchor `engine.generateNextPracticeShift()`.
    private var nextProceduralDay: Int { coverage.nextShiftNumber }

    /// Whether the player has finished the curated arc and is now in procedural-
    /// shift territory.
    private var arcComplete: Bool { lastShiftPlayed >= allShifts.count }

    /// One-line label describing the next shift the player should take —
    /// curated day title, or "OPEN SHIFT" once the arc is done.
    private var nextShiftLabel: String {
        if let curated = nextCuratedShift { return curated.title.uppercased() }
        return "OPEN SHIFT"
    }

    /// Action to play the next shift — curated day if the arc isn't done,
    /// otherwise procedurally generated.
    private func startNextShift() {
        if let curated = nextCuratedShift {
            activeShift = curated
        } else {
            activeShift = engine.generateNextPracticeShift()
        }
    }

    var body: some View {
        ZStack {
            // Rimrock dawn backdrop — visible behind every state of the home
            // view (landing, quest picker, sector grid) so the entire tvOS
            // experience reads as part of the same world.
            RimrockAtmosphere.skyBackground(for: 1).ignoresSafeArea()

            // ── Domain drill-down stack takes over when a domain is selected.
            if let domain = domainPicker, let quest = sectorQuest {
                TVSectorView(engine: engine, domain: domain, quest: quest) {
                    withAnimation(.easeInOut(duration: 0.30)) { sectorQuest = nil }
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))

            } else if let domain = domainPicker {
                TVQuestPickerView(
                    engine: engine,
                    domain: domain,
                    onSelectQuest: { quest in
                        withAnimation(.easeInOut(duration: 0.30)) { sectorQuest = quest }
                    },
                    onBack: {
                        withAnimation(.easeInOut(duration: 0.30)) { domainPicker = nil }
                    }
                )
                .transition(.move(edge: .trailing).combined(with: .opacity))

            } else {
                rimrockLanding
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }
        }
        .environment(\.appTheme, engine.appTheme)

        // ── Curated shift / procedural practice playback.
        // RimrockShiftView bumps `lastShiftPlayed` itself when the player
        // reaches the shift-complete card, so we just clear the cover state
        // here — exiting mid-shift no longer marks the day as played.
        .fullScreenCover(item: $activeShift) { shift in
            RimrockShiftView(shift: shift, gameEngine: engine) {
                activeShift = nil
            }
        }

        // ── Domain-encounter answer sheet (existing tvOS flow)
        .sheet(item: $engine.selectedNode) { node in
            TVEncounterView(
                node: node,
                engine: engine,
                gameMode: engine.currentGameMode,
                probeAbility: engine.currentLogicProbe.activeAbility,
                contentFontSize: engine.currentTextSize.fontSize
            ) { nodeId, answer in
                engine.gradeAnswer(nodeId: nodeId, submitted: answer)
            } onDismiss: {
                engine.selectedNode = nil
            }
            .environment(\.appTheme, engine.appTheme)
            .onAppear  { engine.beginTimedQuestion() }
            .onDisappear { engine.pauseTimedSession() }
        }

        // ── Story beat sheet (Rimrock CYOA / award screens)
        .sheet(item: $engine.pendingStoryBeat) { beat in
            StoryBeatView(beat: beat, accent: engine.currentTheme.accentColor) {
                engine.pendingStoryBeat = nil
            }
            .environment(\.appTheme, engine.appTheme)
        }

        // ── Standard sheets
        .sheet(isPresented: $showSettings) {
            TVSettingsView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showBlueprintExam) {
            BlueprintExamView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showPracticeExam) {
            PracticeExamView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showExamHistory) {
            ExamHistoryView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showReadiness) {
            ReadinessScoreView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showReview) {
            ReviewQueueView(engine: engine) { node in
                showReview = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                    engine.selectedNode = node
                }
            }
            .environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showIntel) {
            IntelReportView(engine: engine).environment(\.appTheme, engine.appTheme)
        }
    }

    // MARK: - Landing layout

    private var rimrockLanding: some View {
        // Atmosphere lives at the body level so it stays put across drill-down
        // states; this view just lays out the chrome over it.
        VStack(spacing: 0) {
                topBar

                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 38) {
                            heroRow.id("HERO")
                            shiftsSection
                            if arcComplete {
                                // Post-arc: surface a compact "next procedural
                                // shift" strip in the timeline position where
                                // the curated arc used to end. The hero is now
                                // the primary CTA, so this is informational.
                                openShiftsContinuation
                            }
                            domainsStrip
                            alternatePathHint
                        }
                        .padding(.horizontal, 90)
                        .padding(.top, 30)
                        .padding(.bottom, 50)
                    }
                    .onAppear {
                        // Animate the mastery ring fill once the snapshot is
                        // available — feels alive rather than static. Skipped
                        // when Reduce Motion is on.
                        if reduceMotion {
                            ringFillProgress = mastery.weightedPercent
                        } else {
                            withAnimation(.easeOut(duration: 1.1).delay(0.20)) {
                                ringFillProgress = mastery.weightedPercent
                            }
                        }
                        // Land focus on the natural starting point — Practice
                        // card once the curated arc is complete, otherwise the
                        // Next Shift hero. First remote press goes somewhere
                        // meaningful instead of arbitrary.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            focusedSection = arcComplete ? .practice : .nextShift
                        }
                        // Scroll to bring the recommended day into view — but
                        // only once the player has progressed past Act 1.
                        // On a fresh install we leave the hero front-and-center
                        // so the first-shift CTA isn't pushed off-screen.
                        if !arcComplete && lastShiftPlayed >= 3,
                           let curated = nextCuratedShift {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                                withAnimation(.easeInOut(duration: 0.35)) {
                                    proxy.scrollTo("DAY-\(curated.dayNumber)",
                                                   anchor: .center)
                                }
                            }
                        }
                    }
                    .onChange(of: mastery.weightedPercent) { _, newValue in
                        // Update ring fill when mastery changes after a shift.
                        if reduceMotion {
                            ringFillProgress = newValue
                        } else {
                            withAnimation(.easeOut(duration: 0.6)) {
                                ringFillProgress = newValue
                            }
                        }
                    }
                }

                bottomActionBar
            }
    }

    // MARK: - Top branding bar

    private var topBar: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 10) {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.system(size: tvFont(18), weight: .bold))
                    Text("RIMROCK PHARMACY")
                        .font(.system(size: tvFont(22), weight: .heavy, design: .monospaced))
                        .tracking(2.2)
                }
                .foregroundColor(palette.accent)
                .shadow(color: palette.accent.opacity(0.55), radius: 10)

                Text("JOHNSON COUNTY · WYOMING")
                    .font(.system(size: tvFont(12), weight: .medium, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.60))
                    .tracking(1.8)
            }

            Spacer()

            // Compact stat readouts. `passPathReadout` is the headline
            // pass-prep gauge once the curated arc is done; `shiftCountReadout`
            // shows shifts completed (uncapped); `dueReadout` flags spaced-
            // repetition work that's slipping; streak is opt-in.
            HStack(spacing: 18) {
                if streakCount > 0 {
                    streakReadout
                    divider
                }
                shiftCountReadout
                divider
                passPathReadout
                divider
                dueReadout
                if coverage.verifiedPercent >= 0.8 {
                    divider
                    readyBadge
                }
            }
        }
        .padding(.horizontal, 90)
        .padding(.vertical, 22)
        .background(Color.black.opacity(0.35))
        .overlay(
            Rectangle().fill(palette.accent.opacity(0.20)).frame(height: 1),
            alignment: .bottom
        )
    }

    private var divider: some View {
        Rectangle().fill(palette.sceneText.opacity(0.25)).frame(width: 0.5, height: 28)
    }

    /// Total shifts the player has completed — including procedural ones past
    /// Day 35. Uncapped, because the player can keep grinding shifts as long
    /// as they like (each one continues to verify bank questions).
    private var totalShiftsCompleted: Int {
        max(lastShiftPlayed, coverage.completedShifts)
    }

    private var shiftCountReadout: some View {
        HStack(spacing: 8) {
            Text("\(totalShiftsCompleted)")
                .font(.system(size: tvFont(24), weight: .heavy, design: .monospaced))
                .foregroundColor(palette.accent)
                .contentTransition(.numericText(value: Double(totalShiftsCompleted)))
            Text("SHIFTS")
                .font(.system(size: tvFont(10), weight: .bold, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(palette.sceneText.opacity(0.65))
        }
    }

    /// "PASS PATH · X%" — the real prep gauge. Percent of bank questions
    /// verified (seen ≥ 2× with proper spacing). Green ≥ 80%, amber ≥ 50%,
    /// muted accent otherwise. This is what tells the player they're on
    /// track to actually pass the PTCB.
    private var passPathReadout: some View {
        let pct = Int((coverage.verifiedPercent * 100).rounded())
        let color: Color = {
            if coverage.verifiedPercent >= 0.8 { return Color(red: 0.25, green: 0.85, blue: 0.55) }
            if coverage.verifiedPercent >= 0.5 { return Color(red: 0.95, green: 0.78, blue: 0.45) }
            return palette.accent
        }()
        return HStack(spacing: 8) {
            Text("\(pct)%")
                .font(.system(size: tvFont(24), weight: .heavy, design: .monospaced))
                .foregroundColor(color)
                .contentTransition(.numericText(value: Double(pct)))
            Text("PASS PATH")
                .font(.system(size: tvFont(10), weight: .bold, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(palette.sceneText.opacity(0.65))
        }
    }

    /// Green pill that appears once the player has verified ≥ 80% of the bank.
    /// Signals "you're statistically ready to take the PTCB."
    private var readyBadge: some View {
        let green = Color(red: 0.25, green: 0.85, blue: 0.55)
        return HStack(spacing: 6) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: tvFont(14)))
            Text("READY FOR PTCB")
                .font(.system(size: tvFont(11), weight: .heavy, design: .monospaced))
                .tracking(1.4)
        }
        .foregroundColor(green)
        .padding(.horizontal, 10).padding(.vertical, 5)
        .background(green.opacity(0.12))
        .overlay(Capsule().stroke(green.opacity(0.5), lineWidth: 1))
        .clipShape(Capsule())
        .shadow(color: green.opacity(0.5), radius: 8)
    }

    /// Streak readout — flame icon + consecutive-day count. Bright when the
    /// player has played today; muted (at risk) when they haven't yet.
    private var streakReadout: some View {
        let color = streakIsCurrent
            ? Color(red: 1.00, green: 0.62, blue: 0.32)   // live flame
            : palette.sceneText.opacity(0.55)             // at-risk grey
        return HStack(spacing: 6) {
            Image(systemName: "flame.fill")
                .font(.system(size: tvFont(16)))
                .foregroundColor(color)
                .shadow(color: streakIsCurrent ? color.opacity(0.6) : .clear, radius: 5)
            Text("\(streakCount)")
                .font(.system(size: tvFont(22), weight: .heavy, design: .monospaced))
                .foregroundColor(color)
                .contentTransition(.numericText(value: Double(streakCount)))
            Text(streakCount == 1 ? "DAY" : "DAYS")
                .font(.system(size: tvFont(10), weight: .bold, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(color.opacity(0.75))
        }
    }

    private var masteryReadout: some View {
        let pct = Int((mastery.weightedPercent * 100).rounded())
        return HStack(spacing: 8) {
            Text("\(pct)%")
                .font(.system(size: tvFont(24), weight: .heavy, design: .monospaced))
                .foregroundColor(palette.accent)
            Text("TRULY LEARNED")
                .font(.system(size: tvFont(10), weight: .bold, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(palette.sceneText.opacity(0.65))
        }
    }

    private var dueReadout: some View {
        let due = mastery.dueForReview
        let color = due > 0 ? Color(red: 0.95, green: 0.78, blue: 0.45) : palette.sceneText.opacity(0.6)
        return HStack(spacing: 8) {
            Image(systemName: due > 0 ? "bell.badge.fill" : "checkmark.circle")
                .font(.system(size: tvFont(14)))
                .foregroundColor(color)
            Text(due > 0 ? "\(due) DUE TODAY" : "NO REVIEWS DUE")
                .font(.system(size: tvFont(11), weight: .heavy, design: .monospaced))
                .tracking(1.3)
                .foregroundColor(color)
        }
    }

    // MARK: - Hero row (mastery ring + next shift)

    private var heroRow: some View {
        HStack(alignment: .top, spacing: 36) {
            masteryRingCard
                .frame(maxWidth: .infinity)

            nextShiftCard
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }

    private var masteryRingCard: some View {
        Button(action: { showReadiness = true }) {
            HStack(spacing: 26) {
                ZStack {
                    // Track
                    Circle()
                        .stroke(palette.accent.opacity(0.10), lineWidth: 10)
                        .frame(width: 200, height: 200)

                    // Animated fill (eased in on appear, reacts to mastery
                    // updates after each shift)
                    Circle()
                        .trim(from: 0, to: max(0.001, ringFillProgress))
                        .stroke(palette.accent,
                                style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-90))
                        .shadow(color: palette.accent.opacity(0.55), radius: 14)

                    // Leading dot — rides the head of the trim so the ring
                    // feels live rather than a static gauge.
                    Circle()
                        .fill(palette.accent)
                        .frame(width: 14, height: 14)
                        .shadow(color: palette.accent.opacity(0.95), radius: 8)
                        .offset(y: -100)
                        .rotationEffect(.degrees(360 * ringFillProgress - 90))
                        .opacity(ringFillProgress > 0.001 ? 1 : 0)

                    VStack(spacing: -4) {
                        Text("\(Int((ringFillProgress * 100).rounded()))")
                            .font(.system(size: tvFont(64), weight: .heavy, design: .monospaced))
                            .foregroundColor(palette.accent)
                            .contentTransition(.numericText(value: ringFillProgress * 100))
                        Text("%")
                            .font(.system(size: tvFont(18), weight: .bold, design: .monospaced))
                            .foregroundColor(palette.accent.opacity(0.7))
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("PTCB BLUEPRINT")
                        .font(.system(size: tvFont(12), weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                        .foregroundColor(palette.accent.opacity(0.85))

                    Text("\(mastery.trulyLearned) / \(mastery.totalConcepts)")
                        .font(.system(size: tvFont(26), weight: .heavy, design: .monospaced))
                        .foregroundColor(.white.opacity(0.95))

                    Text("concepts truly learned")
                        .font(.system(size: tvFont(12), weight: .medium, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.65))

                    Text("VIEW READINESS  →")
                        .font(.system(size: tvFont(11), weight: .heavy, design: .monospaced))
                        .tracking(1.4)
                        .foregroundColor(palette.accent)
                        .padding(.top, 10)
                }
            }
            .padding(26)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 280)
            .modifier(TVRimrockCardModifier(accent: palette.accent, panel: palette.panel))
        }
        .buttonStyle(.plain)
    }

    private var nextShiftCard: some View {
        let isReview = mastery.dueForReview > 0
        let actionLabel: String = {
            if isReview { return "REVIEW DUE" }
            return arcComplete ? "OPEN SHIFT" : "NEXT SHIFT"
        }()
        let dayNumber: Int = arcComplete ? nextProceduralDay : (nextCuratedShift?.dayNumber ?? 1)

        return Button(action: {
            if isReview {
                showReview = true
            } else {
                startNextShift()
            }
        }) {
            VStack(alignment: .leading, spacing: 14) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(actionLabel)
                            .font(.system(size: tvFont(11), weight: .heavy, design: .monospaced))
                            .tracking(1.6)
                            .foregroundColor(palette.accent.opacity(0.85))

                        if isReview {
                            Text("\(mastery.dueForReview) concepts")
                                .font(.system(size: tvFont(34), weight: .heavy, design: .monospaced))
                                .foregroundColor(.white.opacity(0.95))
                        } else {
                            HStack(spacing: 16) {
                                Text("DAY \(dayNumber)")
                                    .font(.system(size: tvFont(34), weight: .heavy, design: .monospaced))
                                    .foregroundColor(palette.accent)
                                Text(nextShiftLabel)
                                    .font(.system(size: tvFont(26), weight: .heavy, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.95))
                                    .tracking(1.2)
                                    .lineLimit(1)
                            }

                            if let curated = nextCuratedShift {
                                Text("\(curated.dateLine) · \(curated.timeLine)")
                                    .font(.system(size: tvFont(13), weight: .medium, design: .monospaced))
                                    .foregroundColor(palette.sceneText.opacity(0.70))
                                    .padding(.top, 2)
                            } else {
                                Text("Procedural shift · drilled from the full bank")
                                    .font(.system(size: tvFont(13), weight: .medium, design: .monospaced))
                                    .foregroundColor(palette.sceneText.opacity(0.70))
                                    .padding(.top, 2)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: tvFont(30)))
                        .foregroundColor(palette.accent.opacity(0.85))
                }

                if !isReview {
                    if let curated = nextCuratedShift, let teaser = teaserFor(shift: curated) {
                        Text(teaser)
                            .font(.system(size: tvFont(14), design: .serif))
                            .italic()
                            .foregroundColor(palette.sceneText.opacity(0.80))
                            .lineSpacing(4)
                            .lineLimit(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else if arcComplete {
                        // Post-arc — explain what happens when they tap, in
                        // Mara's voice. Keeps the path feeling continuous.
                        Text(arcCompletedTeaser)
                            .font(.system(size: tvFont(14), design: .serif))
                            .italic()
                            .foregroundColor(palette.sceneText.opacity(0.80))
                            .lineSpacing(4)
                            .lineLimit(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(26)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 280)
            .modifier(TVRimrockCardModifier(accent: palette.accent, panel: palette.panel, strong: true))
        }
        .buttonStyle(.plain)
        .focused($focusedSection, equals: .nextShift)
        .defaultFocus($focusedSection, .nextShift)
    }

    /// Teaser line for the hero card once the curated arc is done — frames
    /// procedural shifts as "the work continues" rather than a separate mode.
    private var arcCompletedTeaser: String {
        if coverage.isFullyVerified {
            return "Every question in the bank is verified. Keep showing up for reinforcement, or schedule the PTCB."
        }
        let remaining = max(0, coverage.bankSize - coverage.verified)
        return "Shifts now drill the full PTCB bank — \(remaining) of \(coverage.bankSize) questions still to verify. Mara still works the radio."
    }

    private func teaserFor(shift: RimrockShift) -> String? {
        for beat in shift.beats {
            if case .scene(let text) = beat { return text }
        }
        return nil
    }

    // MARK: - Open shifts continuation (post-Day-35 timeline section)

    /// Compact post-arc strip that frames Days 36+ as "the work continues"
    /// rather than a separate practice mode. The hero card is the primary
    /// CTA — this section is informational, showing coverage progress and a
    /// secondary "GENERATE NEXT" button if the player wants to play another
    /// shift right from the timeline position.
    private var openShiftsContinuation: some View {
        let cov = coverage
        return VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline, spacing: 14) {
                Rectangle().fill(palette.accent).frame(width: 3, height: 22)
                VStack(alignment: .leading, spacing: 1) {
                    Text("DAYS 36+ · OPEN SHIFTS")
                        .font(.system(size: tvFont(13), weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                        .foregroundColor(palette.accent)
                    Text("The story continues — Mara keeps the radio on, you keep working the bank")
                        .font(.system(size: tvFont(11), design: .serif))
                        .italic()
                        .foregroundColor(palette.sceneText.opacity(0.55))
                }
                Spacer()
                Text("\(cov.verified) / \(cov.bankSize) VERIFIED")
                    .font(.system(size: tvFont(12), weight: .heavy, design: .monospaced))
                    .tracking(1.3)
                    .foregroundColor(.white.opacity(0.75))
            }

            // Single combined coverage bar — verified atop seen-once atop bank
            ZStack(alignment: .leading) {
                Capsule().fill(palette.accent.opacity(0.12)).frame(height: 8)
                Capsule()
                    .fill(palette.accent.opacity(0.55))
                    .frame(width: 100, height: 8)  // updated below via reader
                    .overlay(
                        GeometryReader { geo in
                            Capsule()
                                .fill(palette.accent.opacity(0.55))
                                .frame(width: geo.size.width * cov.seenPercent, height: 8)
                        }
                    )
                    .opacity(0)  // hidden — using GeometryReader version below
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(palette.accent.opacity(0.45))
                            .frame(width: geo.size.width * cov.seenPercent, height: 8)
                        Capsule()
                            .fill(Color(red: 0.25, green: 0.85, blue: 0.55))
                            .frame(width: geo.size.width * cov.verifiedPercent, height: 8)
                            .shadow(color: Color(red: 0.25, green: 0.85, blue: 0.55).opacity(0.5),
                                    radius: 5)
                    }
                }
                .frame(height: 8)
            }
            .frame(height: 8)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(palette.panel.opacity(0.50))
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(palette.accent.opacity(0.22), lineWidth: 1))
        .cornerRadius(12)
    }

    // MARK: - Alternate-path hint

    /// Small footer pill that tells reading-averse players the bank is right
    /// there, no story required. Surfaces the second path clearly without
    /// pulling focus from the primary narrative-driven Next Shift CTA.
    private var alternatePathHint: some View {
        HStack(spacing: 10) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: tvFont(14)))
                .foregroundColor(palette.sceneText.opacity(0.55))
            Text("Prefer to skip the reading?  PTCB DOMAINS below drills the full bank directly, without narrative.")
                .font(.system(size: tvFont(12), design: .serif))
                .italic()
                .foregroundColor(palette.sceneText.opacity(0.60))
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 6)
    }

    // MARK: - Practice card (post-Day-35) — legacy, kept as compile-only reference

    @available(*, deprecated, message: "Folded into openShiftsContinuation + Next Shift hero")
    private var practiceCard: some View {
        let cov = coverage
        return Button(action: {
            activeShift = engine.generateNextPracticeShift()
        }) {
            HStack(alignment: .top, spacing: 22) {
                VStack(spacing: 0) {
                    Text("DAY")
                        .font(.system(size: tvFont(12), weight: .bold, design: .monospaced))
                        .tracking(1.6)
                        .foregroundColor(palette.label.opacity(0.85))
                    Text("\(cov.nextShiftNumber)")
                        .font(.system(size: tvFont(56), weight: .heavy, design: .monospaced))
                        .foregroundColor(palette.accent)
                }
                .frame(width: 100)

                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) {
                        Image(systemName: "infinity")
                            .font(.system(size: tvFont(13), weight: .heavy))
                        Text(cov.isFullyVerified ? "FULL COVERAGE · REINFORCEMENT"
                                                  : "ONGOING PRACTICE — NEXT SHIFT")
                            .font(.system(size: tvFont(14), weight: .heavy, design: .monospaced))
                            .tracking(1.6)
                    }
                    .foregroundColor(cov.isFullyVerified
                                     ? Color(red: 0.25, green: 0.85, blue: 0.55)
                                     : palette.accent)

                    Text(cov.isFullyVerified
                         ? "All \(cov.bankSize) questions verified. Keep playing for spaced-repetition reinforcement."
                         : "10 questions · ≥4-shift spacing · \(max(0, cov.bankSize - cov.verified)) still to verify.")
                        .font(.system(size: tvFont(14), weight: .medium, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.75))
                        .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 24) {
                        coverageBar(label: "SEEN",     count: cov.seenOnce,
                                    total: cov.bankSize, color: palette.accent.opacity(0.85))
                        coverageBar(label: "VERIFIED", count: cov.verified,
                                    total: cov.bankSize, color: Color(red: 0.25, green: 0.85, blue: 0.55))
                    }
                    .padding(.top, 4)
                }

                Spacer()

                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: tvFont(30)))
                    .foregroundColor(palette.accent.opacity(0.85))
            }
            .padding(28)
            .frame(maxWidth: .infinity, alignment: .leading)
            .modifier(TVRimrockCardModifier(accent: palette.accent, panel: palette.panel))
        }
        .buttonStyle(.plain)
        .focused($focusedSection, equals: .practice)
        .defaultFocus($focusedSection, .practice, priority: .userInitiated)
    }

    private func coverageBar(label: String, count: Int, total: Int, color: Color) -> some View {
        let pct = total > 0 ? Double(count) / Double(total) : 0
        return VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Text(label)
                    .font(.system(size: tvFont(10), weight: .heavy, design: .monospaced))
                    .tracking(1.3)
                    .foregroundColor(palette.sceneText.opacity(0.6))
                Text("\(count) / \(total)")
                    .font(.system(size: tvFont(11), weight: .semibold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.85))
            }
            ZStack(alignment: .leading) {
                Rectangle().fill(color.opacity(0.18)).frame(width: 200, height: 5).cornerRadius(2.5)
                Rectangle().fill(color).frame(width: 200 * pct, height: 5).cornerRadius(2.5)
            }
        }
    }

    // MARK: - Shifts section (35-day grid, act-grouped)

    private var shiftsSection: some View {
        VStack(alignment: .leading, spacing: 26) {
            HStack {
                Text("ALL SHIFTS")
                    .font(.system(size: tvFont(14), weight: .heavy, design: .monospaced))
                    .tracking(1.8)
                    .foregroundColor(palette.accent.opacity(0.85))
                Spacer()
                Text("\(lastShiftPlayed) / \(allShifts.count) COMPLETE")
                    .font(.system(size: tvFont(11), weight: .semibold, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.55))
                    .tracking(1.3)
            }

            ForEach(TVRimrockAct.allCases) { act in
                actSection(act)
            }
        }
    }

    /// One act's header strip + its 7-column grid of shift cards. Each shift
    /// card carries a `.id("DAY-\(dayNumber)")` so we can auto-scroll the
    /// recommended next shift into view on appear.
    @ViewBuilder
    private func actSection(_ act: TVRimrockAct) -> some View {
        let shifts = allShifts.filter { act.range.contains($0.dayNumber) }
        let completed = shifts.filter { $0.dayNumber <= lastShiftPlayed }.count
        let pct = shifts.isEmpty ? 0 : Double(completed) / Double(shifts.count)

        VStack(alignment: .leading, spacing: 12) {
            // Act header with title, subtitle, count, and progress bar
            HStack(alignment: .firstTextBaseline, spacing: 14) {
                Rectangle().fill(act.accent).frame(width: 3, height: 22)

                VStack(alignment: .leading, spacing: 1) {
                    Text(act.label)
                        .font(.system(size: tvFont(13), weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                        .foregroundColor(act.accent)
                    Text(act.subtitle)
                        .font(.system(size: tvFont(11), design: .serif))
                        .italic()
                        .foregroundColor(palette.sceneText.opacity(0.55))
                }

                Spacer()

                Text("\(completed) / \(shifts.count)")
                    .font(.system(size: tvFont(12), weight: .heavy, design: .monospaced))
                    .foregroundColor(.white.opacity(0.75))

                ZStack(alignment: .leading) {
                    Capsule().fill(act.accent.opacity(0.15)).frame(width: 120, height: 4)
                    Capsule().fill(act.accent).frame(width: 120 * pct, height: 4)
                        .shadow(color: act.accent.opacity(0.55), radius: 4)
                }
            }

            // 7-column grid of cards within this act
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 7),
                spacing: 16
            ) {
                ForEach(shifts) { shift in
                    TVRimrockShiftCard(
                        shift: shift,
                        isPlayed: shift.dayNumber <= lastShiftPlayed,
                        isNext: shift.dayNumber == (nextCuratedShift?.dayNumber ?? -1)
                    ) {
                        activeShift = shift
                    }
                    .id("DAY-\(shift.dayNumber)")
                }
            }
            .focusSection()
        }
    }

    // MARK: - Domains strip (PTCB drill access)

    private var domainsStrip: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("PTCB DOMAINS")
                    .font(.system(size: tvFont(14), weight: .heavy, design: .monospaced))
                    .tracking(1.8)
                    .foregroundColor(palette.accent.opacity(0.85))
                Spacer()
                Text("DRILL THE BANK BY DOMAIN")
                    .font(.system(size: tvFont(11), weight: .semibold, design: .monospaced))
                    .foregroundColor(palette.sceneText.opacity(0.55))
                    .tracking(1.3)
            }

            HStack(spacing: 16) {
                ForEach(KnowledgeDomain.allCases) { domain in
                    TVRimrockDomainTile(
                        domain: domain,
                        progress: engine.progress(for: domain),
                        mastery: mastery.perDomain[domain]
                    ) {
                        withAnimation(.easeInOut(duration: 0.30)) { domainPicker = domain }
                    }
                }
            }
            .focusSection()
        }
    }

    // MARK: - Bottom action bar

    private var bottomActionBar: some View {
        VStack(spacing: 0) {
            Rectangle().fill(palette.accent.opacity(0.20)).frame(height: 1)

            HStack(spacing: 28) {
                TVRimrockActionTile(label: "BLUEPRINT", icon: "doc.badge.clock",
                                    color: palette.accent) { showBlueprintExam = true }
                TVRimrockActionTile(label: "READINESS", icon: "gauge.with.needle",
                                    color: Color(red: 1.0, green: 0.85, blue: 0.2)) { showReadiness = true }
                TVRimrockActionTile(label: "REVIEW", icon: "bell.badge",
                                    color: Color(red: 0.95, green: 0.30, blue: 0.30),
                                    badge: mastery.dueForReview > 0 ? "\(mastery.dueForReview)" : nil) {
                    showReview = true
                }
                TVRimrockActionTile(label: "INTEL", icon: "chart.bar.fill",
                                    color: Color(red: 0.6, green: 0.9, blue: 1.0)) { showIntel = true }
                TVRimrockActionTile(label: "HISTORY", icon: "clock.arrow.circlepath",
                                    color: Color(red: 0.72, green: 0.52, blue: 1.0)) { showExamHistory = true }
                TVRimrockActionTile(label: "PRACTICE", icon: "doc.text.magnifyingglass",
                                    color: palette.sceneText) { showPracticeExam = true }
                TVRimrockActionTile(label: "SETTINGS", icon: "gearshape.fill",
                                    color: palette.sceneText) { showSettings = true }
            }
            .padding(.horizontal, 90)
            .padding(.vertical, 18)
            .background(Color.black.opacity(0.45))
            .focusSection()
        }
    }
}

// MARK: - Shift card

private struct TVRimrockShiftCard: View {
    let shift: RimrockShift
    let isPlayed: Bool
    let isNext: Bool
    let onTap: () -> Void

    @Environment(\.isFocused) private var isFocused

    private var palette: RimrockAtmosphere.Palette {
        RimrockAtmosphere.palette(for: shift.dayNumber)
    }

    /// Number of `.question` beats in this shift — a quick "how many questions
    /// does this shift drill?" hint on each card.
    private var questionCount: Int {
        shift.beats.reduce(into: 0) { count, beat in
            if case .question = beat { count += 1 }
        }
    }

    private var badge: (String, Color) {
        let act1   = Color(red: 0.85, green: 0.74, blue: 0.50)
        let act2   = Color(red: 0.62, green: 0.78, blue: 0.85)
        let act3   = Color(red: 0.92, green: 0.65, blue: 0.50)
        let act4   = Color(red: 0.78, green: 0.62, blue: 0.92)
        let review = Color(red: 0.55, green: 0.78, blue: 0.55)
        switch shift.dayNumber {
        case 1...3:   return ("ACT 1",  act1)
        case 4...10:  return ("ACT 2",  act2)
        case 11...18: return ("ACT 3",  act3)
        case 19...25: return ("ACT 4",  act4)
        default:      return ("REVIEW", review)
        }
    }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .firstTextBaseline) {
                    Text("DAY")
                        .font(.system(size: tvFont(9), weight: .bold, design: .monospaced))
                        .tracking(1.3)
                        .foregroundColor(palette.label.opacity(0.85))
                    Text("\(shift.dayNumber)")
                        .font(.system(size: tvFont(26), weight: .heavy, design: .monospaced))
                        .foregroundColor(palette.accent)
                    Spacer()
                    if isPlayed {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: tvFont(14)))
                            .foregroundColor(Color(red: 0.25, green: 0.85, blue: 0.55))
                    }
                }

                Text(shift.title.uppercased())
                    .font(.system(size: tvFont(12), weight: .heavy, design: .monospaced))
                    .foregroundColor(.white.opacity(0.95))
                    .tracking(1.0)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer(minLength: 0)

                HStack(spacing: 6) {
                    Text(badge.0)
                        .font(.system(size: tvFont(9), weight: .heavy, design: .monospaced))
                        .tracking(1.0)
                        .foregroundColor(badge.1)
                        .padding(.horizontal, 6).padding(.vertical, 2)
                        .background(badge.1.opacity(0.18))
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(badge.1.opacity(0.45), lineWidth: 0.6))
                        .cornerRadius(3)
                    Spacer()
                    if questionCount > 0 {
                        HStack(spacing: 3) {
                            Image(systemName: "questionmark.diamond.fill")
                                .font(.system(size: tvFont(8)))
                            Text("\(questionCount)")
                                .font(.system(size: tvFont(10), weight: .heavy, design: .monospaced))
                        }
                        .foregroundColor(palette.label.opacity(0.85))
                    }
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 130)
            .background(
                LinearGradient(
                    colors: [palette.panel, palette.panel.opacity(0.65)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isFocused ? palette.accent :
                            (isNext ? palette.accent.opacity(0.55) : palette.accent.opacity(0.22)),
                        lineWidth: isFocused ? 3 : (isNext ? 2 : 1)
                    )
            )
            .cornerRadius(12)
            .scaleEffect(isFocused ? 1.06 : 1.0)
            .shadow(color: isFocused ? palette.accent.opacity(0.45) : .black.opacity(0.30),
                    radius: isFocused ? 18 : 6, y: isFocused ? 0 : 3)
            .animation(.spring(response: 0.22, dampingFraction: 0.7), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Domain tile

private struct TVRimrockDomainTile: View {
    let domain: KnowledgeDomain
    let progress: DomainProgress
    let mastery: DomainMasterySnapshot?
    let onTap: () -> Void

    @Environment(\.isFocused) private var isFocused

    private var pct: Double { mastery?.trulyLearnedPercent ?? 0 }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: domain.icon)
                        .font(.system(size: tvFont(16)))
                        .foregroundColor(domain.accentColor)
                    Text(domain.shortName.uppercased())
                        .font(.system(size: tvFont(12), weight: .heavy, design: .monospaced))
                        .tracking(1.2)
                        .foregroundColor(.white.opacity(0.92))
                        .lineLimit(1)
                    Spacer()
                    Text(domain.examWeightLabel)
                        .font(.system(size: tvFont(11), weight: .heavy, design: .monospaced))
                        .foregroundColor(domain.accentColor.opacity(0.85))
                }

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("\(mastery?.trulyLearned ?? 0)")
                        .font(.system(size: tvFont(26), weight: .heavy, design: .monospaced))
                        .foregroundColor(domain.accentColor)
                    Text("/ \(mastery?.totalConcepts ?? 0)")
                        .font(.system(size: tvFont(12), weight: .medium, design: .monospaced))
                        .foregroundColor(.white.opacity(0.55))
                    Spacer()
                }

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle().fill(Color.white.opacity(0.06)).frame(height: 5).cornerRadius(2.5)
                        Rectangle()
                            .fill(LinearGradient(colors: [domain.accentColor.opacity(0.6), domain.accentColor],
                                                 startPoint: .leading, endPoint: .trailing))
                            .frame(width: geo.size.width * pct, height: 5)
                            .cornerRadius(2.5)
                    }
                }
                .frame(height: 5)

                Text(pct > 0
                     ? "\(Int((pct * 100).rounded()))% truly learned"
                     : "Tap to drill")
                    .font(.system(size: tvFont(10), weight: .medium, design: .monospaced))
                    .foregroundColor(.white.opacity(0.55))
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 150)
            .background(
                LinearGradient(
                    colors: [Color.black.opacity(0.45), Color.black.opacity(0.25)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? domain.accentColor : domain.accentColor.opacity(0.25),
                            lineWidth: isFocused ? 2.5 : 1)
            )
            .cornerRadius(12)
            .scaleEffect(isFocused ? 1.05 : 1.0)
            .shadow(color: isFocused ? domain.accentColor.opacity(0.45) : .clear, radius: 16)
            .animation(.spring(response: 0.22, dampingFraction: 0.7), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Action tile

private struct TVRimrockActionTile: View {
    let label: String
    let icon: String
    let color: Color
    var badge: String? = nil
    let action: () -> Void

    @Environment(\.isFocused) private var isFocused

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icon)
                        .font(.system(size: tvFont(22)))
                        .foregroundColor(isFocused ? .black : color)
                        .frame(width: 52, height: 52)
                        .background(isFocused ? color : color.opacity(0.15))
                        .cornerRadius(12)
                        .shadow(color: isFocused ? color.opacity(0.6) : .clear, radius: 10)

                    if let badge {
                        Text(badge)
                            .font(.system(size: tvFont(12), weight: .black, design: .monospaced))
                            .foregroundColor(.white)
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .offset(x: 10, y: -8)
                    }
                }

                Text(label)
                    .font(.system(size: tvFont(15), weight: .heavy, design: .monospaced))
                    .tracking(1.5)
                    .foregroundColor(isFocused ? color : color.opacity(0.85))
                    .lineLimit(1)
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .scaleEffect(isFocused ? 1.08 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Shared card backing

private struct TVRimrockCardModifier: ViewModifier {
    let accent: Color
    let panel: Color
    var strong: Bool = false

    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [panel, panel.opacity(strong ? 0.55 : 0.70)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(accent.opacity(strong ? 0.45 : 0.25), lineWidth: strong ? 1.4 : 1)
            )
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.30), radius: 12, y: 5)
    }
}

#endif
