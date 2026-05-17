//
//  TVContentView.swift
//  Synapse PTCE  v13.0
//
//  Apple TV root entry point. Replaces ContentView on tvOS.
//  Handles async boot sequence and hands off to TVRimrockHomeView (the
//  Rimrock-first landing). The legacy `TVRootView` further down in this
//  file is retained as a fallback shell but is no longer the default entry.
//

#if os(tvOS)
import SwiftUI

// MARK: - TV Root Entry

struct TVContentView: View {
    @State private var engine: GameEngine? = nil
    @State private var loadProgress: Double = 0.0

    var body: some View {
        ZStack {
            if let engine {
                TVRimrockHomeView(engine: engine)
                    .transition(.opacity)
            } else {
                TVBootView(progress: loadProgress)
            }
        }
        .animation(.easeInOut(duration: 0.8), value: engine != nil)
        .task {
            let newEngine = await GameEngine.makeAsync(
                onProgress: { p in
                    withAnimation(.easeOut(duration: 0.2)) { loadProgress = p }
                },
                onLog: { _ in }
            )
            engine = newEngine
        }
    }
}

// MARK: - TV Boot View
//
// Rimrock-themed sunrise: amber sky gradient over the Bighorn silhouette with
// a soft animated radio-signal pulse on the SYNAPSE wordmark while the
// content layer loads.

struct TVBootView: View {
    let progress: Double

    @State private var pulse = false

    private var palette: RimrockAtmosphere.Palette { RimrockAtmosphere.palette(for: 1) }

    var body: some View {
        ZStack {
            // Rimrock dawn atmosphere — same sky/sun/ridge stack the home uses
            RimrockAtmosphere.skyBackground(for: 1).ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // Wordmark — soft amber pulse while loading
                VStack(spacing: 18) {
                    HStack(spacing: 16) {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .font(.system(size: 36, weight: .heavy))
                            .foregroundColor(palette.accent)
                            .opacity(pulse ? 0.55 : 1.0)
                        Text("SYNAPSE")
                            .font(.system(size: 96, weight: .black, design: .monospaced))
                            .foregroundColor(palette.accent)
                            .shadow(color: palette.accent.opacity(0.65), radius: 28)
                            .tracking(4)
                    }

                    Text("RIMROCK PHARMACY · JOHNSON COUNTY")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.65))
                        .tracking(3.2)
                }

                Spacer()

                // Progress strip — Mara's frequency tuning in
                VStack(spacing: 14) {
                    HStack(spacing: 10) {
                        Image(systemName: "dot.radiowaves.left.and.right")
                            .font(.system(size: 14))
                        Text("TUNING TO MARA'S FREQUENCY…")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .tracking(2.4)
                    }
                    .foregroundColor(palette.accent.opacity(0.55))

                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(palette.accent.opacity(0.10))
                            .frame(width: 600, height: 6)
                        Capsule()
                            .fill(palette.accent)
                            .frame(width: 600 * progress, height: 6)
                            .shadow(color: palette.accent.opacity(0.85), radius: 8)
                    }
                    .frame(width: 600, height: 6)

                    Text("\(Int((progress * 100).rounded()))%")
                        .font(.system(size: 11, weight: .heavy, design: .monospaced))
                        .foregroundColor(palette.sceneText.opacity(0.45))
                        .tracking(1.6)
                }
                .padding(.bottom, 140)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.3).repeatForever(autoreverses: true)) {
                pulse = true
            }
        }
    }
}

// MARK: - TV Root View (Navigation Controller)

/// Manages the full navigation stack for tvOS:
/// Hub → QuestPicker → SectorMap → Encounter (sheet)
struct TVRootView: View {
    @Bindable var engine: GameEngine

    @State private var selectedDomain: KnowledgeDomain? = nil
    @State private var selectedQuest: DomainQuest?      = nil
    @State private var showSettings  = false
    @State private var showIntel     = false
    @State private var showExam      = false
    @State private var showCampaign  = false
    @State private var showReview    = false
    @State private var showRimrock   = false

    var body: some View {
        ZStack {
            engine.appTheme.background.ignoresSafeArea()
            TVGridBackground()

            // ── Navigation stack via @State ─────────────────────────────────
            if let domain = selectedDomain, let quest = selectedQuest {
                TVSectorView(
                    engine: engine,
                    domain: domain,
                    quest: quest,
                    onBack: {
                        withAnimation(.easeInOut(duration: 0.4)) { selectedQuest = nil }
                    }
                )
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal:   .move(edge: .trailing).combined(with: .opacity)
                ))

            } else if let domain = selectedDomain {
                TVQuestPickerView(
                    engine: engine,
                    domain: domain,
                    onSelectQuest: { quest in
                        withAnimation(.easeInOut(duration: 0.4)) { selectedQuest = quest }
                    },
                    onBack: {
                        withAnimation(.easeInOut(duration: 0.4)) { selectedDomain = nil }
                    }
                )
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal:   .move(edge: .trailing).combined(with: .opacity)
                ))

            } else {
                TVHubView(
                    engine: engine,
                    onSelectDomain:  { domain in
                        withAnimation(.easeInOut(duration: 0.4)) { selectedDomain = domain }
                    },
                    onShowSettings:  { showSettings  = true },
                    onShowIntel:     { showIntel     = true },
                    onShowExam:      { showExam      = true },
                    onShowCampaign:  { showCampaign  = true },
                    onShowReview:    { showReview    = true },
                    onShowRimrock:   { showRimrock   = true }
                )
                .transition(.asymmetric(
                    insertion: .move(edge: .leading).combined(with: .opacity),
                    removal:   .move(edge: .leading).combined(with: .opacity)
                ))
            }
        }
        .environment(\.appTheme, engine.appTheme)

        // ── Sheets ─────────────────────────────────────────────────────────
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
        .sheet(isPresented: $showSettings) {
            TVSettingsView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showIntel) {
            IntelReportView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showExam) {
            PracticeExamView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showCampaign) {
            CampaignView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
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
        .sheet(item: $engine.pendingStoryBeat) { beat in
            StoryBeatView(beat: beat, accent: engine.currentTheme.accentColor) {
                engine.pendingStoryBeat = nil
            }
            .environment(\.appTheme, engine.appTheme)
        }
        .sheet(isPresented: $showRimrock) {
            RimrockHubView(gameEngine: engine) {
                showRimrock = false
            }
        }
    }
}

// MARK: - TV Grid Background

struct TVGridBackground: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        Canvas { ctx, size in
            let spacing: CGFloat = 60
            let lineColor = theme.gridLine
            var x: CGFloat = 0
            while x <= size.width {
                var p = Path()
                p.move(to: .init(x: x, y: 0))
                p.addLine(to: .init(x: x, y: size.height))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.6)
                x += spacing
            }
            var y: CGFloat = 0
            while y <= size.height {
                var p = Path()
                p.move(to: .init(x: 0, y: y))
                p.addLine(to: .init(x: size.width, y: y))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.6)
                y += spacing
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
}
#endif
