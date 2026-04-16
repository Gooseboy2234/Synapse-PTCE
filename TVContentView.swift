//
//  TVContentView.swift
//  Synapse PTCE  v13.0
//
//  Apple TV root entry point. Replaces ContentView on tvOS.
//  Handles async boot sequence and hands off to TVRootView.
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
                TVRootView(engine: engine)
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

struct TVBootView: View {
    let progress: Double

    private let accent = Color(red: 1.0, green: 0.65, blue: 0.0)
    private let bg     = Color(red: 0.059, green: 0.059, blue: 0.059)

    var body: some View {
        ZStack {
            bg.ignoresSafeArea()

            // Grid background
            Canvas { ctx, size in
                let spacing: CGFloat = 60
                let lineColor = accent.opacity(0.04)
                var x: CGFloat = 0
                while x <= size.width {
                    var p = Path()
                    p.move(to: .init(x: x, y: 0))
                    p.addLine(to: .init(x: x, y: size.height))
                    ctx.stroke(p, with: .color(lineColor), lineWidth: 0.8)
                    x += spacing
                }
                var y: CGFloat = 0
                while y <= size.height {
                    var p = Path()
                    p.move(to: .init(x: 0, y: y))
                    p.addLine(to: .init(x: size.width, y: y))
                    ctx.stroke(p, with: .color(lineColor), lineWidth: 0.8)
                    y += spacing
                }
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                VStack(spacing: 16) {
                    Text("SYNAPSE")
                        .font(.system(size: 108, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.70), radius: 30)
                    Text("PTCE NETWORK  v13.0")
                        .font(.system(size: 26, weight: .bold, design: .monospaced))
                        .foregroundColor(accent.opacity(0.48))
                        .tracking(4)
                }

                Spacer()

                VStack(spacing: 16) {
                    Text("INITIALIZING NETWORK...")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(accent.opacity(0.45))
                        .tracking(3)

                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(accent.opacity(0.10))
                            .frame(width: 560, height: 6)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(accent)
                            .frame(width: 560 * progress, height: 6)
                            .shadow(color: accent.opacity(0.8), radius: 8)
                    }
                    .frame(width: 560, height: 6)
                }
                .padding(.bottom, 100)
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
                    onShowReview:    { showReview    = true }
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
                gameMode: engine.currentGameMode,
                probeAbility: engine.currentLogicProbe.activeAbility,
                contentFontSize: engine.currentTextSize.fontSize
            ) { nodeId, answer in
                engine.gradeAnswer(nodeId: nodeId, submitted: answer)
            } onDismiss: {
                engine.selectedNode = nil
            }
            .environment(\.appTheme, engine.appTheme)
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
