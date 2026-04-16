//
//  ContentView.swift
//  Synapse PTCE
//
//  v9.0 — Dual Mode, Warm Light theme, SettingsView, StoryManager, Multi-Angle nodes.
//

import SwiftUI

// MARK: - Root Entry Point

struct ContentView: View {
    @State private var engine: GameEngine? = nil
    @State private var loadProgress: Double = 0.0
    @State private var bootLog: [String] = []

    var body: some View {
        ZStack {
            if let engine {
                MapView(engine: engine)
                    .transition(.opacity)
            } else {
                AppLaunchView(progress: loadProgress, logMessages: bootLog)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: engine != nil)
        .task {
            let newEngine = await GameEngine.makeAsync(
                onProgress: { progress in
                    withAnimation(.easeOut(duration: 0.25)) { loadProgress = progress }
                },
                onLog: { message in
                    bootLog.append(message)
                }
            )
            engine = newEngine
        }
    }
}

// MARK: - App Launch View

struct AppLaunchView: View {
    let progress: Double
    var logMessages: [String] = []

    private let accent = Color(red: 1.0, green: 0.65, blue: 0.0)
    private let bg     = Color(red: 0.059, green: 0.059, blue: 0.059)

    var body: some View {
        ZStack {
            bg.ignoresSafeArea()

            // Subtle grid
            Canvas { ctx, size in
                let spacing: CGFloat = 28
                let lineColor = accent.opacity(0.05)
                var x: CGFloat = 0
                while x <= size.width {
                    var p = Path(); p.move(to: CGPoint(x: x, y: 0)); p.addLine(to: CGPoint(x: x, y: size.height))
                    ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                    x += spacing
                }
                var y: CGFloat = 0
                while y <= size.height {
                    var p = Path(); p.move(to: CGPoint(x: 0, y: y)); p.addLine(to: CGPoint(x: size.width, y: y))
                    ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                    y += spacing
                }
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // App title
                VStack(spacing: 8) {
                    Text("SYNAPSE")
                        .font(.system(size: 46, weight: .black, design: .monospaced))
                        .foregroundColor(accent)
                        .shadow(color: accent.opacity(0.65), radius: 16)
                    Text("PTCE NETWORK  v10.0")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(accent.opacity(0.50))
                }

                Spacer()

                // ── Diagnostic terminal log ──────────────────────────────────
                if !logMessages.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(Array(logMessages.suffix(8).enumerated()), id: \.offset) { idx, msg in
                            let isNewest = idx == min(logMessages.count, 8) - 1
                            let isError  = msg.contains("[ERROR]") || msg.contains("[FATAL]")
                            let isWarn   = msg.contains("[WARN]")  || msg.contains("[RECOVER]")
                            HStack(alignment: .top, spacing: 0) {
                                Text(msg)
                                    .font(.system(size: 9, design: .monospaced))
                                    .foregroundColor(
                                        isError  ? Color.red.opacity(0.95) :
                                        isWarn   ? Color.yellow.opacity(0.85) :
                                        isNewest ? accent.opacity(0.90) :
                                                   accent.opacity(0.35)
                                    )
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 14)
                }

                // ── Progress bar ─────────────────────────────────────────────
                VStack(spacing: 6) {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 2).fill(accent.opacity(0.12)).frame(height: 4)
                            RoundedRectangle(cornerRadius: 2).fill(accent)
                                .frame(width: geo.size.width * max(0, min(1, progress)), height: 4)
                                .shadow(color: accent.opacity(0.8), radius: 6)
                        }
                    }
                    .frame(height: 4)

                    // Numeric % readout so it's obvious if stuck
                    Text(String(format: "%.0f%%", progress * 100))
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(accent.opacity(0.40))
                }
                .padding(.horizontal, 48)
                .padding(.bottom, 52)
            }
        }
    }
}

// MARK: - Map View (navigation root)

struct MapView: View {
    @Bindable var engine: GameEngine
    @State private var selectedDomain: KnowledgeDomain? = nil
    @State private var selectedQuest: DomainQuest? = nil
    @State private var showStore    = false
    @State private var showSettings = false
    @State private var showIntel    = false
    @State private var showReview   = false
    @State private var showExam     = false

    var body: some View {
        ZStack {
            GridBackground()
            if let domain = selectedDomain, let quest = selectedQuest {
                SectorMapView(engine: engine, domain: domain, quest: quest) {
                    withAnimation(.easeInOut(duration: 0.35)) { selectedQuest = nil }
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal:   .move(edge: .trailing).combined(with: .opacity)
                ))
            } else if let domain = selectedDomain {
                QuestPickerView(
                    engine: engine,
                    domain: domain,
                    onSelectQuest: { quest in
                        withAnimation(.easeInOut(duration: 0.35)) { selectedQuest = quest }
                    },
                    onBack: {
                        withAnimation(.easeInOut(duration: 0.35)) { selectedDomain = nil }
                    }
                )
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal:   .move(edge: .trailing).combined(with: .opacity)
                ))
            } else {
                HubMapView(engine: engine,
                           onSelectDomain: { domain in
                               withAnimation(.easeInOut(duration: 0.35)) { selectedDomain = domain }
                           },
                           onShowStore:    { showStore    = true },
                           onShowSettings: { showSettings = true },
                           onShowIntel:    { showIntel    = true },
                           onShowReview:   { showReview   = true },
                           onShowExam:     { showExam     = true })
                .transition(.asymmetric(
                    insertion: .move(edge: .leading).combined(with: .opacity),
                    removal:   .move(edge: .leading).combined(with: .opacity)
                ))
            }
        }
        // Propagate theme to entire view tree
        .environment(\.appTheme, engine.appTheme)
        // Node encounter sheet
        .sheet(item: $engine.selectedNode) { node in
            EncounterView(
                node: node,
                gameMode: engine.currentGameMode,
                probeAbility: engine.currentLogicProbe.activeAbility
            ) { nodeId, answer in
                engine.gradeAnswer(nodeId: nodeId, submitted: answer)
            } onDismiss: {
                engine.selectedNode = nil
            }
            .environment(\.appTheme, engine.appTheme)
        }
        // Store sheet
        .sheet(isPresented: $showStore) {
            StoreView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        // Settings sheet
        .sheet(isPresented: $showSettings) {
            SettingsView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        // Intel Report
        .sheet(isPresented: $showIntel) {
            IntelReportView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        // Review Queue — dismisses itself then sets selectedNode after a tick
        .sheet(isPresented: $showReview) {
            ReviewQueueView(engine: engine) { node in
                showReview = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                    engine.selectedNode = node
                }
            }
            .environment(\.appTheme, engine.appTheme)
        }
        // Practice Exam (full screen — exam deserves the full canvas)
        #if os(iOS)
        .fullScreenCover(isPresented: $showExam) {
            PracticeExamView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        #else
        .sheet(isPresented: $showExam) {
            PracticeExamView(engine: engine)
                .environment(\.appTheme, engine.appTheme)
        }
        #endif
        // Story beat narrative overlay
        .sheet(item: $engine.pendingStoryBeat) { beat in
            StoryBeatView(beat: beat, accent: engine.currentTheme.accentColor) {
                engine.pendingStoryBeat = nil
            }
            .environment(\.appTheme, engine.appTheme)
        }
    }
}

// MARK: - Hub Map

/// 4 large domain-hub nodes arranged in a 2×2 grid with a command bar pinned to the bottom.
struct HubMapView: View {
    let engine: GameEngine
    let onSelectDomain: (KnowledgeDomain) -> Void
    let onShowStore: () -> Void
    let onShowSettings: () -> Void
    let onShowIntel: () -> Void
    let onShowReview: () -> Void
    let onShowExam: () -> Void

    // Positions shifted slightly lower to center in the space above the bottom bar
    private let hubPositions: [KnowledgeDomain: CGPoint] = [
        .medications:         CGPoint(x: 0.27, y: 0.40),
        .federalRequirements: CGPoint(x: 0.73, y: 0.34),
        .patientSafety:       CGPoint(x: 0.27, y: 0.64),
        .orderEntry:          CGPoint(x: 0.73, y: 0.64)
    ]

    var body: some View {
        GeometryReader { geo in
            ZStack {
                HubConnectionLines(positions: hubPositions, size: geo.size)

                // Watermark
                VStack {
                    Spacer()
                    Text("SYNAPSE // PTCE NETWORK v10.0 // MAIN BRANCH")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(engine.currentTheme.accentColor.opacity(0.28))
                        .padding(.bottom, 8)
                }

                ForEach(KnowledgeDomain.allCases) { domain in
                    if let pos = hubPositions[domain] {
                        Button { onSelectDomain(domain) } label: {
                            DomainHubNode(
                                domain: domain,
                                progress: engine.progress(for: domain)
                            )
                        }
                        .buttonStyle(.plain)
                        .position(x: pos.x * geo.size.width, y: pos.y * geo.size.height)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomCommandBar(
                engine: engine,
                onShowStore: onShowStore,
                onShowSettings: onShowSettings,
                onShowIntel: onShowIntel,
                onShowReview: onShowReview,
                onShowExam: onShowExam
            )
        }
    }
}

// MARK: - Hub Connection Lines

struct HubConnectionLines: View {
    let positions: [KnowledgeDomain: CGPoint]
    let size: CGSize

    var body: some View {
        Canvas { ctx, sz in
            let domains = KnowledgeDomain.allCases
            let pts = domains.compactMap { d -> CGPoint? in
                guard let p = positions[d] else { return nil }
                return CGPoint(x: p.x * sz.width, y: p.y * sz.height)
            }
            // Draw all 6 pairs
            for i in 0 ..< pts.count {
                for j in (i + 1) ..< pts.count {
                    var path = Path()
                    path.move(to: pts[i])
                    path.addLine(to: pts[j])
                    ctx.stroke(
                        path,
                        with: .color(Color(red: 1.0, green: 0.65, blue: 0.0).opacity(0.18)),
                        style: StrokeStyle(lineWidth: 1, dash: [5, 8])
                    )
                }
            }
        }
        .frame(width: size.width, height: size.height)
    }
}

// MARK: - Bottom Command Bar

struct BottomCommandBar: View {
    let engine: GameEngine
    let onShowStore: () -> Void
    let onShowSettings: () -> Void
    let onShowIntel: () -> Void
    let onShowReview: () -> Void
    let onShowExam: () -> Void

    @Environment(\.appTheme) private var theme
    private var accent: Color { engine.currentTheme.accentColor }
    private let cyan = Color(red: 0.6, green: 0.9, blue: 1.0)
    private let gold = Color(red: 1.0, green: 0.85, blue: 0.2)
    private let red  = Color(red: 0.95, green: 0.30, blue: 0.30)

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(accent.opacity(0.20))
                .frame(height: 1)

            VStack(spacing: 8) {
                // Row 1: Rank | Action Trio | Shards | Gear
                HStack(spacing: 10) {
                    // Rank block
                    VStack(alignment: .leading, spacing: 1) {
                        Text(engine.currentSystemRank.badge)
                            .font(.system(size: 7, weight: .bold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                        Text(engine.currentSystemRank.title)
                            .font(.system(size: 9, weight: .semibold, design: .monospaced))
                            .foregroundColor(accent)
                            .shadow(color: theme.isDark ? accent.opacity(0.5) : .clear, radius: 3)
                    }

                    Spacer()

                    // Action trio
                    HStack(spacing: 6) {
                        CommandButton(label: "INTEL", icon: "chart.bar.fill", color: cyan,
                                      action: onShowIntel)
                        CommandButton(label: "BREACH", icon: "exclamationmark.triangle.fill", color: red,
                                      badge: engine.breachNodes.isEmpty ? nil : "\(engine.breachNodes.count)",
                                      action: onShowReview)
                        CommandButton(label: "EXAM", icon: "doc.text.fill", color: gold,
                                      action: onShowExam)
                    }

                    Spacer()

                    // Shards + Settings
                    HStack(spacing: 10) {
                        Button(action: onShowStore) {
                            HStack(spacing: 3) {
                                Image(systemName: "diamond.fill").font(.system(size: 8))
                                Text("\(engine.currentDataShards)")
                                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                            }
                            .foregroundColor(cyan)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(cyan.opacity(0.1))
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(cyan.opacity(0.4), lineWidth: 1))
                            .cornerRadius(5)
                        }

                        Button(action: onShowSettings) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 15))
                                .foregroundColor(theme.secondaryText)
                        }
                    }
                }

                // Row 2: Probe dots + domain progress strips
                HStack(spacing: 8) {
                    let probe = engine.currentLogicProbe
                    HStack(spacing: 4) {
                        Image(systemName: "cpu").font(.system(size: 8))
                        Text("L\(probe.level)")
                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                        HStack(spacing: 2) {
                            ForEach(1 ... LogicProbe.maxLevel, id: \.self) { lvl in
                                Circle()
                                    .fill(lvl <= probe.level ? accent : theme.divider)
                                    .frame(width: 5, height: 5)
                                    .shadow(color: lvl <= probe.level && theme.isDark ? accent.opacity(0.8) : .clear, radius: 3)
                            }
                        }
                    }
                    .foregroundColor(probe.activeAbility != nil ? gold : theme.secondaryText)

                    HStack(spacing: 3) {
                        ForEach(KnowledgeDomain.allCases) { domain in
                            let prog = engine.progress(for: domain)
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule().fill(domain.accentColor.opacity(0.12))
                                    Capsule()
                                        .fill(domain.accentColor.opacity(0.85))
                                        .frame(width: geo.size.width * prog.percentComplete)
                                }
                            }
                            .frame(height: 3)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .background {
            theme.surface
                .opacity(theme.isDark ? 0.92 : 0.96)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

// MARK: - Command Button

struct CommandButton: View {
    let label: String
    let icon: String
    let color: Color
    var badge: String? = nil
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 3) {
                    Image(systemName: icon).font(.system(size: 10))
                    Text(label)
                        .font(.system(size: 7, weight: .bold, design: .monospaced))
                }
                .foregroundColor(color)
                .padding(.horizontal, 9).padding(.vertical, 5)
                .background(color.opacity(0.10))
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(color.opacity(0.38), lineWidth: 1))
                .cornerRadius(6)

                if let badge {
                    Text(badge)
                        .font(.system(size: 7, weight: .black))
                        .foregroundColor(.white)
                        .padding(.horizontal, 3).padding(.vertical, 1)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .offset(x: 5, y: -5)
                }
            }
        }
    }
}

// MARK: - Domain Hub Node

struct DomainHubNode: View {
    let domain: KnowledgeDomain
    let progress: DomainProgress

    @State private var pulse = false

    private let hubDiameter: CGFloat = 92

    var body: some View {
        ZStack {
            // Outer pulse ring (only when in-progress / not 100%)
            if progress.percentComplete > 0 && progress.percentComplete < 1 {
                Circle()
                    .stroke(domain.accentColor.opacity(pulse ? 0.0 : 0.35), lineWidth: 1.5)
                    .frame(width: hubDiameter + 22, height: hubDiameter + 22)
                    .scaleEffect(pulse ? 1.18 : 1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
                            pulse = true
                        }
                    }
            }

            // Base circle
            Circle()
                .fill(Color(red: 0.08, green: 0.08, blue: 0.08))
                .frame(width: hubDiameter, height: hubDiameter)

            // Progress arc with glow
            Circle()
                .trim(from: 0, to: progress.percentComplete)
                .stroke(domain.accentColor, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: hubDiameter - 6, height: hubDiameter - 6)
                .rotationEffect(.degrees(-90))
                .shadow(color: domain.accentColor.opacity(0.8), radius: 6)

            // Border ring
            Circle()
                .stroke(domain.accentColor.opacity(0.55), lineWidth: 1)
                .frame(width: hubDiameter, height: hubDiameter)

            // Content
            VStack(spacing: 2) {
                // Domain badge (D1–D4)
                Text("D\(KnowledgeDomain.allCases.firstIndex(of: domain)! + 1)")
                    .font(.system(size: 13, weight: .black, design: .monospaced))
                    .foregroundColor(domain.accentColor)

                // Short name
                Text(shortName(for: domain))
                    .font(.system(size: 8, weight: .semibold, design: .monospaced))
                    .foregroundColor(domain.accentColor.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 70)

                // Completion count
                Text("\(progress.completed)/\(progress.total)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.7))

                // Exam weight
                Text(domain.examWeightLabel)
                    .font(.system(size: 8, design: .monospaced))
                    .foregroundColor(domain.accentColor.opacity(0.6))
            }
        }
        .contentShape(Circle())
    }

    private func shortName(for domain: KnowledgeDomain) -> String {
        switch domain {
        case .medications:         return "MEDICATIONS"
        case .federalRequirements: return "FED.REQ"
        case .patientSafety:       return "PT.SAFETY"
        case .orderEntry:          return "ORDER\nENTRY"
        }
    }
}

// MARK: - Domain Quest

/// A named, batched subset of a domain's nodes — max 30 nodes per quest so each mesh is readable.
/// Quests are generated dynamically: core nodes first, then each angle type split into 30-node chunks.
struct DomainQuest: Identifiable {

    let id: String
    let name: String
    let subtitle: String
    let icon: String
    /// Stable UUIDs for the nodes in this batch — used to filter engine.nodes live.
    let nodeIDs: Set<UUID>

    /// Returns the quest's nodes from the live engine array so completions are always current.
    func nodes(from all: [DataNode]) -> [DataNode] {
        all.filter { nodeIDs.contains($0.id) }
    }

    // Kept for call-site compatibility with SectorMapView (domain param is unused).
    func nodes(for domain: KnowledgeDomain, from all: [DataNode]) -> [DataNode] {
        nodes(from: all)
    }

    // MARK: - Factory

    static let batchSize = 30

    /// Builds all quests for one domain, each capped at `batchSize` nodes.
    static func make(for domain: KnowledgeDomain, from allNodes: [DataNode]) -> [DomainQuest] {
        let dn = allNodes.filter { $0.domain == domain }
        var result: [DomainQuest] = []

        // Core nodes (original base questions — no baseConceptTitle)
        let core = dn.filter { $0.baseConceptTitle == nil }
        result += batch(core, base: "CORE PROTOCOL", sub: "Foundations & key concepts",
                        icon: "cpu.fill", prefix: "\(domain.rawValue)|CORE")

        // Multi-angle nodes split by pedagogical angle
        let angleDefs: [(NodeAngle, String, String, String)] = [
            (.classification, "CLASSIFICATION", "Drug classes & categories",  "tag.fill"),
            (.indication,     "INDICATIONS",     "Clinical uses & conditions", "heart.fill"),
            (.mechanism,      "MECHANISMS",       "Pharmacology & action",      "gearshape.fill"),
            (.safety,         "SAFETY & ADRs",    "Side effects & warnings",    "exclamationmark.triangle.fill"),
            (.dosing,         "DOSING & ADMIN",   "Calculations & routes",      "number.circle.fill"),
        ]
        for (angle, base, sub, icon) in angleDefs {
            let nodes = dn.filter { $0.angle == angle && $0.baseConceptTitle != nil }
            result += batch(nodes, base: base, sub: sub,
                            icon: icon, prefix: "\(domain.rawValue)|\(angle.rawValue)")
        }

        return result
    }

    // MARK: - Helpers

    private static func batch(_ nodes: [DataNode],
                               base: String, sub: String,
                               icon: String, prefix: String) -> [DomainQuest] {
        guard !nodes.isEmpty else { return [] }
        let chunks = stride(from: 0, to: nodes.count, by: batchSize).map {
            Array(nodes[$0 ..< min($0 + batchSize, nodes.count)])
        }
        return chunks.enumerated().map { i, chunk in
            let suffix = chunks.count > 1 ? " \(roman(i + 1))" : ""
            return DomainQuest(id: "\(prefix)|\(i)", name: base + suffix, subtitle: sub,
                               icon: icon, nodeIDs: Set(chunk.map(\.id)))
        }
    }

    private static func roman(_ n: Int) -> String {
        let vals = [(1000,"M"),(900,"CM"),(500,"D"),(400,"CD"),
                    (100,"C"),(90,"XC"),(50,"L"),(40,"XL"),
                    (10,"X"),(9,"IX"),(5,"V"),(4,"IV"),(1,"I")]
        var r = ""; var n = n
        for (v, s) in vals { while n >= v { r += s; n -= v } }
        return r
    }
}

// MARK: - Quest Picker View

struct QuestPickerView: View {
    let engine: GameEngine
    let domain: KnowledgeDomain
    let onSelectQuest: (DomainQuest) -> Void
    let onBack: () -> Void

    @Environment(\.appTheme) private var theme
    private var accent: Color { domain.accentColor }

    private var quests: [DomainQuest] {
        DomainQuest.make(for: domain, from: engine.nodes)
    }

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: onBack) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left").font(.system(size: 11, weight: .bold))
                            Text("HUB").font(.system(size: 11, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(accent)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text(domain.terminalSectorLabel)
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                            .foregroundColor(accent)
                            .shadow(color: accent.opacity(0.6), radius: 4)
                        Text("SELECT PROTOCOL")
                            .font(.system(size: 8, weight: .semibold, design: .monospaced))
                            .foregroundColor(accent.opacity(0.5))
                            .tracking(2)
                    }
                    Spacer()
                    // Invisible balance element matching the back button width
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left").font(.system(size: 11, weight: .bold))
                        Text("HUB").font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(.clear)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .padding(.top, geo.safeAreaInsets.top)
                .background(theme.surface.opacity(theme.isDark ? 0.85 : 0.95))
                .overlay(Rectangle().fill(accent.opacity(0.25)).frame(height: 1), alignment: .bottom)

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(
                        columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)],
                        spacing: 12
                    ) {
                        ForEach(quests) { quest in
                            let nodes = quest.nodes(from: engine.nodes)
                            Button { onSelectQuest(quest) } label: {
                                QuestCard(quest: quest, nodes: nodes, accent: accent, theme: theme)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        #if !os(tvOS)
        .gesture(
            DragGesture(minimumDistance: 30, coordinateSpace: .global)
                .onEnded { value in
                    if value.translation.width > 100 && abs(value.translation.height) < 80 {
                        withAnimation(.easeInOut(duration: 0.35)) { onBack() }
                    }
                }
        )
        #endif
        #if os(tvOS) || os(macOS)
        .onExitCommand { withAnimation(.easeInOut(duration: 0.35)) { onBack() } }
        #endif
    }
}

// MARK: - Quest Card

struct QuestCard: View {
    let quest: DomainQuest
    let nodes: [DataNode]
    let accent: Color
    let theme: AppTheme

    private var completed: Int { nodes.filter(\.isCompleted).count }
    private var unlocked: Int  { nodes.filter(\.isUnlocked).count }
    private var pct: Double    { nodes.isEmpty ? 0 : Double(completed) / Double(nodes.count) }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Image(systemName: quest.icon)
                    .font(.system(size: 22))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(theme.isDark ? 0.7 : 0.4), radius: 6)
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(completed)/\(nodes.count)")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                    if unlocked > completed {
                        Text("\(unlocked - completed) ACTIVE")
                            .font(.system(size: 7, design: .monospaced))
                            .foregroundColor(accent.opacity(0.6))
                    }
                }
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(quest.name)
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(accent)
                Text(quest.subtitle)
                    .font(.system(size: 9, design: .monospaced))
                    .foregroundColor(theme.secondaryText)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(accent.opacity(0.12)).frame(height: 3)
                    Capsule()
                        .fill(accent.opacity(0.85))
                        .frame(width: geo.size.width * pct, height: 3)
                        .shadow(color: pct > 0 && theme.isDark ? accent.opacity(0.6) : .clear, radius: 3)
                }
            }
            .frame(height: 3)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(theme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(pct > 0 ? accent.opacity(0.5) : accent.opacity(0.22),
                        lineWidth: pct > 0 ? 1.5 : 1)
        )
        .cornerRadius(10)
    }
}

// MARK: - Sector Map View

struct SectorMapView: View {
    @Bindable var engine: GameEngine
    let domain: KnowledgeDomain
    let quest: DomainQuest
    let onBack: () -> Void

    @State private var showBoss = false

    /// Nodes filtered to this quest — recomputed live so completions immediately reflect.
    private var displayNodes: [DataNode] {
        quest.nodes(from: engine.nodes)
    }

    /// All domain nodes kept for the boss encounter (boss draws from full domain pool).
    private var allDomainNodes: [DataNode] {
        engine.nodes.filter { $0.domain == domain }
    }

    private var questProgress: DomainProgress {
        let dn = displayNodes
        let completed = dn.filter(\.isCompleted).count
        let ppn = engine.pointsPerNode(domain: domain)
        return DomainProgress(
            domain: domain,
            completed: completed,
            total: dn.count,
            pointsEarned: completed * ppn,
            pointsAvailable: dn.count * ppn
        )
    }

    var body: some View {
        GeometryReader { outerGeo in
            VStack(spacing: 0) {
                SectorHeader(
                    domain: domain,
                    questTitle: quest.name,
                    progress: questProgress,
                    bossDefeated: engine.isBossDefeated(for: domain),
                    onBack: onBack,
                    onBossChallenge: { showBoss = true }
                )
                .padding(.top, outerGeo.safeAreaInsets.top)

                ScrollView(.vertical, showsIndicators: false) {
                    let mapWidth  = outerGeo.size.width
                    let nodeCount = displayNodes.count
                    let canvasH   = max(900, CGFloat(nodeCount) * 36)

                    ZStack {
                        SectorConnectionLines(nodes: displayNodes,
                                              mapWidth: mapWidth,
                                              canvasHeight: canvasH,
                                              color: domain.accentColor)

                        ForEach(displayNodes) { node in
                            let prereqOK = engine.isPrerequisiteSatisfied(for: node)
                            Button {
                                engine.selectedNode = node
                            } label: {
                                DataNodeView(node: node,
                                             color: domain.accentColor,
                                             prereqSatisfied: prereqOK)
                            }
                            .buttonStyle(.plain)
                            .disabled(!node.isUnlocked || !prereqOK)
                            .position(x: node.xOffset * mapWidth,
                                      y: node.yOffset * canvasH)
                        }
                    }
                    .frame(width: mapWidth, height: canvasH)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        #if !os(tvOS)
        .gesture(
            DragGesture(minimumDistance: 30, coordinateSpace: .global)
                .onEnded { value in
                    if value.translation.width > 100 && abs(value.translation.height) < 80 {
                        withAnimation(.easeInOut(duration: 0.35)) { onBack() }
                    }
                }
        )
        #endif
        #if os(tvOS) || os(macOS)
        .onExitCommand { withAnimation(.easeInOut(duration: 0.35)) { onBack() } }
        #endif
        .sheet(isPresented: $showBoss) {
            BossEncounterView(
                domain: domain,
                nodes: allDomainNodes,
                currentStreak: engine.bossStreak(for: domain),
                isDefeated: engine.isBossDefeated(for: domain)
            ) { wasCorrect in
                engine.gradeBossQuestion(domain: domain, wasCorrect: wasCorrect)
            }
        }
    }
}

// MARK: - Sector Header

struct SectorHeader: View {
    let domain: KnowledgeDomain
    let questTitle: String
    let progress: DomainProgress
    let bossDefeated: Bool
    let onBack: () -> Void
    let onBossChallenge: () -> Void
    @Environment(\.appTheme) private var theme

    /// Boss button appears once ≥ 60% of nodes are completed.
    private var bossUnlocked: Bool { progress.percentComplete >= 0.6 }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Button(action: onBack) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left").font(.system(size: 11, weight: .bold))
                        Text("BACK").font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(domain.accentColor)
                }

                Spacer()

                VStack(spacing: 1) {
                    Text(domain.terminalSectorLabel)
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(domain.accentColor)
                        .shadow(color: domain.accentColor.opacity(0.6), radius: 4)
                    Text(questTitle)
                        .font(.system(size: 8, weight: .semibold, design: .monospaced))
                        .foregroundColor(domain.accentColor.opacity(0.65))
                        .tracking(1)
                }

                Spacer()

                if bossUnlocked {
                    Button(action: onBossChallenge) {
                        HStack(spacing: 4) {
                            Image(systemName: bossDefeated ? "checkmark.shield.fill" : "shield.fill")
                                .font(.system(size: 10))
                            Text(bossDefeated ? "BOSS: DEFEATED" : "BOSS CHALLENGE")
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(bossDefeated ? .green : domain.accentColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background((bossDefeated ? Color.green : domain.accentColor).opacity(0.12))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke((bossDefeated ? Color.green : domain.accentColor).opacity(0.5), lineWidth: 1))
                        .cornerRadius(5)
                        .shadow(color: (bossDefeated ? Color.green : domain.accentColor).opacity(0.4), radius: 4)
                    }
                } else {
                    Text("\(progress.completed)/\(progress.total) NODES")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(domain.accentColor.opacity(0.7))
                }
            }
            .padding(.horizontal, 16)

            // Thin progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(domain.accentColor.opacity(0.12))
                        .frame(height: 2)
                    Rectangle()
                        .fill(domain.accentColor)
                        .frame(width: geo.size.width * progress.percentComplete, height: 2)
                }
            }
            .frame(height: 2)
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 10)
        .background(theme.surface.opacity(theme.isDark ? 0.85 : 0.95))
        .overlay(
            Rectangle()
                .fill(domain.accentColor.opacity(0.25))
                .frame(height: 1),
            alignment: .bottom
        )
    }
}

// MARK: - Sector Connection Lines

struct SectorConnectionLines: View {
    let nodes: [DataNode]
    let mapWidth: CGFloat
    let canvasHeight: CGFloat
    let color: Color

    var body: some View {
        Canvas { ctx, _ in
            for i in 0 ..< nodes.count {
                for j in (i + 1) ..< nodes.count {
                    let a = nodes[i]
                    let b = nodes[j]
                    let dx = a.xOffset - b.xOffset
                    let dy = a.yOffset - b.yOffset
                    let dist = sqrt(dx * dx + dy * dy)
                    guard dist < 0.26 else { continue }

                    let pA = CGPoint(x: a.xOffset * mapWidth, y: a.yOffset * canvasHeight)
                    let pB = CGPoint(x: b.xOffset * mapWidth, y: b.yOffset * canvasHeight)

                    var path = Path()
                    path.move(to: pA)
                    path.addLine(to: pB)
                    ctx.stroke(
                        path,
                        with: .color(color.opacity(0.28)),
                        style: StrokeStyle(lineWidth: 1, dash: [4, 7])
                    )
                }
            }
        }
        .frame(width: mapWidth, height: canvasHeight)
    }
}

// MARK: - Data Node View

struct DataNodeView: View {
    let node: DataNode
    let color: Color
    /// False when a requiredNodeID prerequisite is not yet completed — node renders greyed-out.
    var prereqSatisfied: Bool = true

    private let nodeSize: CGFloat = 46

    /// Effective "active" state: unlocked AND prerequisite met.
    private var isActive: Bool { node.isUnlocked && prereqSatisfied }

    var body: some View {
        ZStack {
            // Outer ring — glows when active/completed
            Circle()
                .stroke(ringColor, lineWidth: isActive ? 1.5 : 1)
                .frame(width: nodeSize, height: nodeSize)
                .shadow(color: isActive && node.isCompleted ? color.opacity(0.75) : .clear, radius: 8)

            // Fill
            Circle()
                .fill(node.isCompleted && isActive
                      ? color.opacity(0.22)
                      : Color(red: 0.07, green: 0.07, blue: 0.07))
                .frame(width: nodeSize - 4, height: nodeSize - 4)

            // Icon / content
            if !node.isUnlocked {
                Image(systemName: "lock.fill")
                    .font(.system(size: 10))
                    .foregroundColor(color.opacity(0.28))
            } else if !prereqSatisfied {
                // Unlocked but blocked by prerequisite
                Image(systemName: "arrow.triangle.branch")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.25))
            } else if node.isCompleted {
                Image(systemName: "checkmark")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(color)
                    .shadow(color: color.opacity(0.8), radius: 5)
            } else {
                Text(abbreviation(for: node.nodeTitle))
                    .font(.system(size: 7, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                    .multilineTextAlignment(.center)
                    .frame(width: nodeSize - 10)
            }
        }
        .overlay(
            Text(node.nodeTitle)
                .font(.system(size: 7, design: .monospaced))
                .foregroundColor(isActive ? color.opacity(0.85) : color.opacity(0.25))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(width: 70)
                .offset(y: nodeSize / 2 + 8),
            alignment: .center
        )
    }

    private var ringColor: Color {
        if !node.isUnlocked     { return color.opacity(0.16) }
        if !prereqSatisfied     { return color.opacity(0.20) }
        if node.isCompleted     { return color.opacity(0.55) }
        return color.opacity(0.65)
    }

    private func abbreviation(for title: String) -> String {
        let words = title.components(separatedBy: " ")
        let short = words.prefix(2).joined(separator: "\n")
        return short.count > 12 ? String(short.prefix(12)) : short
    }
}

// MARK: - Encounter View (Terminal Sheet)

struct EncounterView: View {
    let node: DataNode
    let gameMode: GameMode
    /// Active Logic Probe ability, if any (passed from MapView).
    let probeAbility: ProbeAbility?
    let onSubmit: (UUID, String) -> GradeResult
    let onDismiss: () -> Void

    @State private var selected: String = ""
    @State private var result: GradeResult? = nil
    @State private var showFeedback = false
    @State private var dismissTask: Task<Void, Never>? = nil

    // Prodigy animations
    @State private var bootComplete = false
    @State private var shakeOffset: CGFloat = 0
    @State private var glitchOpacity: Double = 0
    @State private var loreCorrupted = false
    @State private var burstScale: CGFloat = 0.2
    @State private var burstOpacity: Double = 0.0

    // Logic Probe — Redundant Check
    @State private var probeAbilityUsed = false
    @State private var eliminatedOption: String? = nil

    // Timed Mode
    @State private var timeRemaining: Int = 0
    @State private var timerRunning = false

    @Environment(\.appTheme) private var theme
    private var color: Color { node.domain.accentColor }
    private let gold = Color(red: 1.0, green: 0.85, blue: 0.2)

    /// Options with the eliminated one removed (if Redundant Check was used).
    private var visibleOptions: [String] {
        node.options.filter { $0 != eliminatedOption }
    }

    /// Glossary terms found in this node's text — computed once since node is a constant.
    private var glossaryTerms: [(term: String, definition: String)] {
        let text = ([node.nodeTitle, node.loreText] + node.options).joined(separator: " ")
        return Glossary.matches(in: text)
    }

    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackground().opacity(0.4).ignoresSafeArea()

            // Glitch flash overlay
            Color.red
                .opacity(glitchOpacity)
                .ignoresSafeArea()
                .allowsHitTesting(false)

            // Sector Stabilized burst ring
            Circle()
                .stroke(color, lineWidth: 3)
                .scaleEffect(burstScale)
                .opacity(burstOpacity)
                .allowsHitTesting(false)

            if bootComplete {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {

                        // ── Compact header ───────────────────────────────────────
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 3) {
                                Text(node.domain.terminalSectorLabel)
                                    .font(.system(size: 9, weight: .semibold, design: .monospaced))
                                    .foregroundColor(color.opacity(0.55))
                                HStack(spacing: 6) {
                                    Text(node.nodeTitle.replacingOccurrences(of: "\n", with: " "))
                                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                                        .foregroundColor(color)
                                    if node.angle != .classification || node.baseConceptTitle != nil {
                                        Text(node.angle.badge)
                                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                                            .foregroundColor(color)
                                            .padding(.horizontal, 5).padding(.vertical, 2)
                                            .background(color.opacity(0.15))
                                            .cornerRadius(3)
                                    }
                                }
                            }
                            Spacer()
                            if gameMode == .timed {
                                HStack(spacing: 4) {
                                    Image(systemName: "timer").font(.system(size: 10))
                                    Text(String(format: "%02d", timeRemaining))
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                }
                                .foregroundColor(timeRemaining <= 10 ? .red : color)
                                .shadow(color: timeRemaining <= 10 ? Color.red.opacity(0.7) : .clear, radius: 4)
                                .padding(.horizontal, 8).padding(.vertical, 3)
                                .background((timeRemaining <= 10 ? Color.red : color).opacity(0.1))
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke((timeRemaining <= 10 ? Color.red : color).opacity(0.4), lineWidth: 1))
                                .cornerRadius(5)
                            }
                        }
                        .padding(.bottom, 14)

                        Divider().background(color.opacity(0.3)).padding(.bottom, 18)

                        // ── Study notes — teach before testing ───────────────────
                        TeachPanel(loreText: node.loreText, color: color)
                            .padding(.bottom, 22)

                        // ── PTCB question ─────────────────────────────────────────
                        Text(effectiveQuestion)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(theme.primaryText)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(5)
                            .padding(.bottom, 20)

                        // ── Logic Probe: Redundant Check ─────────────────────────
                        if let ability = probeAbility, !probeAbilityUsed, !showFeedback {
                            Button {
                                if let wrong = node.options.first(where: { $0 != node.correctAnswer && $0 != eliminatedOption }) {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        eliminatedOption = wrong
                                        probeAbilityUsed = true
                                        if selected == wrong { selected = "" }
                                    }
                                }
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: ability.iconName).font(.system(size: 10))
                                    Text("ACTIVATE: \(ability.displayName.uppercased())")
                                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                                }
                                .foregroundColor(gold)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 9)
                                .background(gold.opacity(0.08))
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(gold.opacity(0.5), lineWidth: 1))
                                .cornerRadius(6)
                                .shadow(color: gold.opacity(0.4), radius: 5)
                            }
                            .padding(.bottom, 14)
                        }

                        // ── Answer options ───────────────────────────────────────
                        VStack(spacing: 10) {
                            ForEach(visibleOptions, id: \.self) { opt in
                                OptionButton(
                                    option: opt,
                                    isSelected: selected == opt,
                                    isCorrect: result != nil ? opt == node.correctAnswer : nil,
                                    color: color,
                                    isLocked: showFeedback
                                ) {
                                    guard !showFeedback else { return }
                                    selected = opt
                                }
                            }
                        }
                        .padding(.bottom, 18)

                        // ── Submit button ────────────────────────────────────────
                        if !showFeedback {
                            Button {
                                guard !selected.isEmpty else { return }
                                let r = onSubmit(node.id, selected)
                                result = r
                                showFeedback = true
                                if r.wasCorrect {
                                    triggerStabilizedBurst()
                                    dismissTask = Task {
                                        try? await Task.sleep(for: .seconds(2.5))
                                        onDismiss()
                                    }
                                } else {
                                    triggerGlitch()
                                }
                            } label: {
                                Text(selected.isEmpty ? "SELECT AN ANSWER" : "CONFIRM ANSWER")
                                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                                    .foregroundColor(selected.isEmpty ? color.opacity(0.4) : .black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(selected.isEmpty ? Color.clear : color)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(color.opacity(selected.isEmpty ? 0.3 : 0), lineWidth: 1)
                                    )
                                    .cornerRadius(6)
                            }
                            .disabled(selected.isEmpty)
                        }

                        // ── Post-answer: result + key terms ──────────────────────
                        if showFeedback, let r = result {
                            VStack(alignment: .leading, spacing: 14) {
                                Divider().background(color.opacity(0.3))

                                FeedbackBlock(result: r, correctAnswer: node.correctAnswer, color: color)

                                if !r.wasCorrect {
                                    Button { onDismiss() } label: {
                                        Text("REVIEW & CONTINUE →")
                                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                                            .foregroundColor(color)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 12)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .stroke(color.opacity(0.5), lineWidth: 1)
                                            )
                                    }
                                }

                                if !glossaryTerms.isEmpty {
                                    GlossaryPanel(terms: glossaryTerms, color: color)
                                }
                            }
                        }
                    }
                    .padding(20)
                }
                .offset(x: shakeOffset)
                .transition(.opacity)

            } else {
                // Boot sequence — shown briefly before content fades in
                VStack(spacing: 14) {
                    Text("// ACCESSING NODE...")
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(color)
                    Text(node.nodeTitle)
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundColor(color.opacity(0.5))
                    ProgressView()
                        .tint(color)
                        .scaleEffect(0.85)
                }
                .transition(.opacity)
            }
        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .milliseconds(550))
                withAnimation(.easeIn(duration: 0.35)) { bootComplete = true }
            }
            if gameMode == .timed {
                timeRemaining = GameMode.timed.timerSeconds
                startCountdown()
            }
        }
        .onDisappear { dismissTask?.cancel() }
    }

    // MARK: - Helpers

    private var effectiveQuestion: String {
        if !node.questionText.isEmpty { return node.questionText }
        let rawTitle = node.nodeTitle.replacingOccurrences(of: "\n", with: " ")
        let displayName = node.baseConceptTitle ?? rawTitle
        // For multi-angle nodes use angle-specific template
        if node.baseConceptTitle != nil {
            switch node.angle {
            case .classification: return "Which drug class does \(displayName) belong to?"
            case .mechanism:      return "Which of the following best describes the mechanism of action of \(displayName)?"
            case .indication:     return "\(displayName) is MOST commonly indicated for which of the following conditions?"
            case .safety:         return "Which adverse effect is MOST commonly associated with \(displayName)?"
            case .dosing:         return "Which of the following is correct regarding the dosing or administration of \(displayName)?"
            }
        }
        // Auto-detect from option content
        let optsLower = node.options.map { opt -> String in
            let s = opt
            guard s.count > 3, s[s.index(s.startIndex, offsetBy: 1)] == "." else { return s.lowercased() }
            return String(s[s.index(s.startIndex, offsetBy: 3)...]).lowercased()
        }.joined(separator: " | ")
        if optsLower.contains("inhibit") || optsLower.contains("ribosom") || optsLower.contains("cell wall") || optsLower.contains("reuptake") || optsLower.contains("receptor") || optsLower.contains("enzyme") {
            return "Which of the following correctly describes the mechanism of action of \(displayName)?"
        }
        if optsLower.contains("class") || optsLower.contains("generation") || optsLower.contains("category") || optsLower.contains("type of") || optsLower.contains("belong") {
            return "Which drug class does \(displayName) belong to?"
        }
        if optsLower.contains("adverse") || optsLower.contains("side effect") || optsLower.contains("toxicit") || optsLower.contains("nephrotox") || optsLower.contains("hepatotox") || optsLower.contains("ototox") {
            return "Which adverse effect is MOST commonly associated with \(displayName)?"
        }
        if optsLower.contains("contraindic") || optsLower.contains("avoid") || optsLower.contains("allerg") {
            return "Which of the following is a contraindication for \(displayName)?"
        }
        if optsLower.contains("monitor") || optsLower.contains("lab") || optsLower.contains("therapeutic range") {
            return "Which parameter requires monitoring in a patient taking \(displayName)?"
        }
        if optsLower.contains("indicat") || optsLower.contains("treat") || optsLower.contains("used for") || optsLower.contains("therapy") {
            return "\(displayName) is MOST commonly indicated for which of the following conditions?"
        }
        if optsLower.contains("schedul") || optsLower.contains("dea") || optsLower.contains("controlled") {
            return "Which DEA schedule is assigned to \(displayName)?"
        }
        if optsLower.contains("days supply") || optsLower.contains("sig") || optsLower.contains("dose") || optsLower.contains("mg") || optsLower.contains("frequency") {
            return "Which of the following is correct regarding the dosing of \(displayName)?"
        }
        if optsLower.contains("law") || optsLower.contains("regulation") || optsLower.contains("requirement") || optsLower.contains("must") {
            return "Which of the following correctly states the federal requirement regarding \(displayName)?"
        }
        return "Which of the following is correct regarding \(displayName)?"
    }

    private func startCountdown() {
        dismissTask = Task {
            while timeRemaining > 0 {
                try? await Task.sleep(for: .seconds(1))
                guard !Task.isCancelled else { return }
                if showFeedback { return }  // already answered
                timeRemaining -= 1
            }
            // Time expired
            guard !Task.isCancelled, !showFeedback else { return }
            let r = onSubmit(node.id, "<<<TIMEOUT>>>")
            result = r
            showFeedback = true
            triggerGlitch()
            try? await Task.sleep(for: .seconds(1.8))
            guard !Task.isCancelled else { return }
            onDismiss()
        }
    }

    private func triggerGlitch() {
        loreCorrupted = true
        // Red flash
        withAnimation(.easeIn(duration: 0.04))  { glitchOpacity = 0.38 }
        withAnimation(.easeOut(duration: 0.28).delay(0.06)) { glitchOpacity = 0 }
        // Shake sequence
        let offsets: [CGFloat] = [10, -10, 9, -9, 6, -6, 3, -3, 0]
        for (i, val) in offsets.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.04) {
                withAnimation(.linear(duration: 0.04)) { shakeOffset = val }
            }
        }
    }

    private func triggerStabilizedBurst() {
        burstScale  = 0.2
        burstOpacity = 0.9
        withAnimation(.easeOut(duration: 0.75)) {
            burstScale  = 3.0
            burstOpacity = 0.0
        }
    }

}

// MARK: - Option Button

struct OptionButton: View {
    let option: String
    let isSelected: Bool
    let isCorrect: Bool?
    let color: Color
    let isLocked: Bool
    let onTap: () -> Void

    @Environment(\.appTheme) private var theme

    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(option)
                    .font(.system(size: 13, design: .monospaced))
                    .foregroundColor(isLocked
                                     ? color.opacity(0.55)
                                     : (isSelected ? color : theme.primaryText.opacity(0.82)))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 11)
            .background(isSelected ? color.opacity(0.12) : theme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? color.opacity(0.7) : color.opacity(0.22), lineWidth: 1)
            )
            .cornerRadius(8)
        }
        .disabled(isLocked)
    }
}

// MARK: - Feedback Block

struct FeedbackBlock: View {
    let result: GradeResult
    let correctAnswer: String
    let color: Color

    @Environment(\.appTheme) private var theme
    private let cyan = Color(red: 0.6, green: 0.9, blue: 1.0)
    private let gold = Color(red: 1.0, green: 0.85, blue: 0.2)

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Status line
            HStack {
                Image(systemName: result.wasCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(result.wasCorrect ? .green : .red)
                Text(result.wasCorrect ? "CORRECT — SECTOR STABILIZED" : "INCORRECT — BREACH DETECTED")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(result.wasCorrect ? .green : .red)
            }

            if result.wasCorrect {
                Text("+ \(result.pointsAwarded) STABILITY POINTS")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(.green.opacity(0.8))

                Text("+ \(result.xpAwarded) XP")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(color.opacity(0.95))

                if result.shardAwarded {
                    HStack(spacing: 5) {
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 9))
                        Text("DATA SHARD EARNED — PERFECT STABILIZATION")
                            .font(.system(size: 11, design: .monospaced))
                    }
                    .foregroundColor(cyan)
                }

                if result.rankUp {
                    HStack(spacing: 5) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 9))
                        Text("RANK UP → \(result.newSystemRank.title)")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(gold)
                }

                if let unlocked = result.nodeUnlocked {
                    Text(">> NODE UNLOCKED: \(unlocked.nodeTitle)")
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundColor(color.opacity(0.8))
                }
            } else {
                Text("CORRECT ANSWER: \(correctAnswer)")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundColor(.red.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(result.wasCorrect ? Color.green.opacity(0.08) : Color.red.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(result.wasCorrect ? Color.green.opacity(0.35) : Color.red.opacity(0.35), lineWidth: 1)
        )
    }
}

// MARK: - Teach Panel (shown before the question — learn then test)

struct TeachPanel: View {
    let loreText: String
    let color: Color

    @Environment(\.appTheme) private var theme

    /// Parse loreText into clean, exam-relevant bullet points.
    private var bullets: [String] {
        loreText.components(separatedBy: "\n")
            .compactMap { line -> String? in
                var l = line.trimmingCharacters(in: .whitespaces)
                if l.hasPrefix("> ") { l = String(l.dropFirst(2)) }
                else if l.hasPrefix(">") { l = String(l.dropFirst(1)).trimmingCharacters(in: .whitespaces) }
                // Strip terminal artifacts not meant for the learner
                guard !l.isEmpty,
                      !l.contains("QUERY"),
                      !l.contains("SELECT THE CORRECT"),
                      !l.uppercased().hasPrefix("FORMULA:"),
                      !l.uppercased().hasPrefix("EXAMPLE:") else { return nil }
                return l
            }
    }

    /// Lines that look like exam tips or warnings — bolded visually.
    private func isHighlight(_ text: String) -> Bool {
        let u = text.uppercased()
        return u.hasPrefix("NOTE:") || u.hasPrefix("CAUTION:") || u.hasPrefix("EXAM TIP:")
            || u.hasPrefix("WARNING:") || u.hasPrefix("REMEMBER:") || u.hasPrefix("KEY:")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack(spacing: 6) {
                Image(systemName: "book.closed.fill").font(.system(size: 10))
                Text("WHAT YOU NEED TO KNOW")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(0.3)
            }
            .foregroundColor(color.opacity(0.72))

            // Bullet list
            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(bullets.enumerated()), id: \.offset) { _, bullet in
                    HStack(alignment: .top, spacing: 10) {
                        Text("▸")
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(isHighlight(bullet) ? color : color.opacity(0.5))
                            .padding(.top, 1)
                        Text(bullet)
                            .font(.system(size: 15,
                                          weight: isHighlight(bullet) ? .semibold : .regular,
                                          design: .rounded))
                            .foregroundColor(isHighlight(bullet)
                                             ? color.opacity(0.95)
                                             : theme.primaryText.opacity(0.90))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(5)
                    }
                }
            }
        }
        .padding(16)
        .background(color.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(color.opacity(0.18), lineWidth: 1))
        .cornerRadius(10)
    }
}

// MARK: - Explanation Panel

struct ExplanationPanel: View {
    let loreText: String
    let color: Color

    @Environment(\.appTheme) private var theme

    private var cleanLines: [String] {
        loreText.components(separatedBy: "\n")
            .map { line in
                var l = line.trimmingCharacters(in: .whitespaces)
                if l.hasPrefix("> ") { l = String(l.dropFirst(2)) }
                else if l.hasPrefix(">") { l = String(l.dropFirst(1)).trimmingCharacters(in: .whitespaces) }
                return l
            }
            .filter { !$0.isEmpty }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: "doc.text.fill").font(.system(size: 10))
                Text("EXPLANATION")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(color.opacity(0.75))

            VStack(alignment: .leading, spacing: 4) {
                ForEach(Array(cleanLines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(theme.primaryText.opacity(0.82))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(2)
                }
            }
        }
        .padding(14)
        .background(color.opacity(0.05))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(color.opacity(0.2), lineWidth: 1))
        .cornerRadius(8)
    }
}

// MARK: - Grid Background

struct GridBackground: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        Canvas { ctx, size in
            let spacing: CGFloat = 28
            let lineColor = theme.gridLine
            var x: CGFloat = 0
            while x <= size.width {
                var p = Path()
                p.move(to: CGPoint(x: x, y: 0))
                p.addLine(to: CGPoint(x: x, y: size.height))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                x += spacing
            }
            var y: CGFloat = 0
            while y <= size.height {
                var p = Path()
                p.move(to: CGPoint(x: 0, y: y))
                p.addLine(to: CGPoint(x: size.width, y: y))
                ctx.stroke(p, with: .color(lineColor), lineWidth: 0.5)
                y += spacing
            }
        }
        .background(theme.background)
        .ignoresSafeArea()
    }
}

// MARK: - Story Beat View

struct StoryBeatView: View {
    let beat: StoryBeat
    let accent: Color
    let onDismiss: () -> Void

    @Environment(\.appTheme) private var theme
    @State private var visibleLines: [String] = []
    @State private var lineTask: Task<Void, Never>? = nil
    @State private var cursorOn      = true
    @State private var showContinue  = false
    @State private var scanY: CGFloat = -60
    @State private var glowPulse     = false

    private var allLinesShown: Bool { visibleLines.count >= beat.lines.count }

    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()

            // Subtle grid
            GridBackground().opacity(0.18).ignoresSafeArea()

            // Scan-line sweep
            GeometryReader { geo in
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.clear, accent.opacity(0.08), accent.opacity(0.14), accent.opacity(0.08), .clear],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .frame(height: 60)
                    .offset(y: scanY)
                    .onAppear {
                        withAnimation(.linear(duration: 2.6).repeatForever(autoreverses: false)) {
                            scanY = geo.size.height + 60
                        }
                    }
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)

            VStack(alignment: .leading, spacing: 0) {

                // ── Header bar ────────────────────────────────────────
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("// \(beat.title)")
                                .font(.system(size: 14, weight: .black, design: .monospaced))
                                .foregroundColor(accent)
                                .shadow(color: accent.opacity(0.7), radius: 6)
                            Text("STABILITY \(beat.triggerPercent)% REACHED")
                                .font(.system(size: 9, weight: .semibold, design: .monospaced))
                                .foregroundColor(accent.opacity(0.55))
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("NARRATIVE LOG")
                                .font(.system(size: 9, design: .monospaced))
                                .foregroundColor(.white.opacity(0.3))
                            // Story arc progress dots
                            HStack(spacing: 3) {
                                ForEach(0 ..< 20, id: \.self) { i in
                                    let milestone = (i + 1) * 5
                                    Circle()
                                        .fill(milestone <= beat.triggerPercent
                                              ? accent
                                              : accent.opacity(0.18))
                                        .frame(width: 4, height: 4)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(Color.white.opacity(0.04))

                    Rectangle()
                        .fill(accent.opacity(0.35))
                        .frame(height: 1)
                }

                Spacer()

                // ── Terminal output ───────────────────────────────────
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(visibleLines.enumerated()), id: \.offset) { _, line in
                        TerminalLine(line: line, accent: accent)
                            .transition(.asymmetric(
                                insertion: .opacity.combined(with: .offset(x: 0, y: 6)),
                                removal:   .opacity
                            ))
                    }

                    // Blinking cursor
                    if !allLinesShown {
                        Text(cursorOn ? "█" : " ")
                            .font(.system(size: 13, design: .monospaced))
                            .foregroundColor(accent)
                            .animation(.none, value: cursorOn)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)

                Spacer()

                // ── Continue button ───────────────────────────────────
                if showContinue {
                    Button(action: onDismiss) {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 14))
                            Text("[ CONTINUE RECOVERY ]")
                                .font(.system(size: 13, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(accent)
                        .cornerRadius(8)
                        .shadow(color: accent.opacity(glowPulse ? 0.85 : 0.35), radius: glowPulse ? 14 : 6)
                        .scaleEffect(glowPulse ? 1.01 : 1.0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 36)
                    .transition(.opacity.combined(with: .offset(x: 0, y: 10)))
                }
            }
        }
        .onAppear {
            startTypewriter()
            startCursorBlink()
        }
        .onDisappear { lineTask?.cancel() }
    }

    // MARK: - Helpers

    private func startTypewriter() {
        lineTask = Task {
            // Brief pause before first line — cinematic beat
            try? await Task.sleep(for: .milliseconds(350))
            for line in beat.lines {
                guard !Task.isCancelled else { return }
                withAnimation(.easeOut(duration: 0.18)) {
                    visibleLines.append(line)
                }
                // Shorter lines print faster; longer ones take a beat
                let delay: UInt64 = line.count > 50 ? 480 : 320
                try? await Task.sleep(for: .milliseconds(delay))
            }
            guard !Task.isCancelled else { return }
            // Brief pause, then show continue with glow
            try? await Task.sleep(for: .milliseconds(500))
            withAnimation(.easeOut(duration: 0.4)) { showContinue = true }
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                glowPulse = true
            }
        }
    }

    private func startCursorBlink() {
        Task {
            while !allLinesShown {
                try? await Task.sleep(for: .milliseconds(480))
                cursorOn.toggle()
            }
        }
    }
}

// MARK: - Terminal Line (colored [SYN] prefix)

private struct TerminalLine: View {
    let line: String
    let accent: Color

    private var prefix: String? {
        // Extract [TAG] prefix e.g. "[SYN]"
        guard line.hasPrefix("["), let end = line.firstIndex(of: "]") else { return nil }
        return String(line[line.startIndex ... end])
    }

    private var content: String {
        guard let pfx = prefix else { return line }
        let after = line.dropFirst(pfx.count)
        return String(after.drop(while: { $0 == " " }))
    }

    var body: some View {
        // Detect special lines: all-caps milestone banners (■ … ■)
        if line.contains("■") {
            Text(line)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundColor(accent)
                .shadow(color: accent.opacity(0.6), radius: 5)
        } else if prefix != nil {
            HStack(alignment: .top, spacing: 6) {
                Text(prefix!)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(accent.opacity(0.85))
                    .shadow(color: accent.opacity(0.5), radius: 3)
                Text(content)
                    .font(.system(size: 13, design: .monospaced))
                    .foregroundColor(.white.opacity(0.82))
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 0)
            }
        } else {
            Text(line)
                .font(.system(size: 13, design: .monospaced))
                .foregroundColor(.white.opacity(0.82))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

// MARK: - Boss Encounter View

struct BossEncounterView: View {
    let domain: KnowledgeDomain
    let nodes: [DataNode]
    let currentStreak: Int
    let isDefeated: Bool
    /// Returns (newStreak, wasDefeated) after grading.
    let onGrade: (Bool) -> (streak: Int, defeated: Bool)

    @State private var streak: Int = 0
    @State private var defeated = false
    @State private var currentNode: DataNode? = nil
    @State private var selected: String = ""
    @State private var showResult = false
    @State private var lastCorrect = false
    @State private var breachFlash: Double = 0
    @State private var burstScale: CGFloat = 0.2
    @State private var burstOpacity: Double = 0.0
    @Environment(\.dismiss) private var dismiss

    private var color: Color { domain.accentColor }
    private var questionPool: [DataNode] { nodes.filter { $0.isCompleted || $0.isUnlocked } }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GridBackground().opacity(0.35).ignoresSafeArea()

            // Breach flash
            Color.red.opacity(breachFlash).ignoresSafeArea().allowsHitTesting(false)
            // Victory burst
            Circle().stroke(color, lineWidth: 3)
                .scaleEffect(burstScale).opacity(burstOpacity).allowsHitTesting(false)

            if defeated {
                VStack(spacing: 20) {
                    Image(systemName: "checkmark.shield.fill")
                        .font(.system(size: 52))
                        .foregroundColor(.green)
                        .shadow(color: .green.opacity(0.8), radius: 12)
                    Text("SECTOR BOSS DEFEATED")
                        .font(.system(size: 18, weight: .black, design: .monospaced))
                        .foregroundColor(.green)
                    Text("+ 500 XP  +2 DATA SHARDS")
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(.green.opacity(0.7))
                    Button("RETURN TO SECTOR") { dismiss() }
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(color)
                        .padding(.top, 10)
                }
            } else if let node = currentNode {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Boss header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("⚡ SECTOR BOSS — \(domain.terminalSectorLabel)")
                                .font(.system(size: 10, design: .monospaced))
                                .foregroundColor(color.opacity(0.6))
                            Text("CORE BREACH PROTOCOL")
                                .font(.system(size: 17, weight: .black, design: .monospaced))
                                .foregroundColor(color)
                                .shadow(color: color.opacity(0.7), radius: 6)

                            // Streak bar
                            HStack(spacing: 5) {
                                ForEach(0 ..< 10, id: \.self) { i in
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(i < streak ? color : color.opacity(0.15))
                                        .frame(width: 22, height: 6)
                                        .shadow(color: i < streak ? color.opacity(0.8) : .clear, radius: 3)
                                }
                                Text("\(streak)/10")
                                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }

                        Divider().background(color.opacity(0.3))

                        Text(node.nodeTitle)
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(color)

                        Text(questionPrompt(for: node))
                            .font(.system(size: 13, weight: .semibold, design: .monospaced))
                            .foregroundColor(color.opacity(0.9))

                        VStack(spacing: 10) {
                            ForEach(node.options, id: \.self) { opt in
                                OptionButton(
                                    option: opt,
                                    isSelected: selected == opt,
                                    isCorrect: showResult ? opt == node.correctAnswer : nil,
                                    color: color,
                                    isLocked: showResult
                                ) { if !showResult { selected = opt } }
                            }
                        }

                        if showResult {
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Image(systemName: lastCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                        .foregroundColor(lastCorrect ? .green : .red)
                                    Text(lastCorrect ? "CORRECT — STREAK: \(streak)/10" : "BREACH — STREAK RESET")
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                        .foregroundColor(lastCorrect ? .green : .red)
                                }
                                if !lastCorrect {
                                    Text("CORRECT: \(node.correctAnswer)")
                                        .font(.system(size: 11, design: .monospaced))
                                        .foregroundColor(.red.opacity(0.8))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill((lastCorrect ? Color.green : Color.red).opacity(0.08)))
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke((lastCorrect ? Color.green : Color.red).opacity(0.35), lineWidth: 1))

                            Button("NEXT QUESTION") { loadNextQuestion() }
                                .font(.system(size: 13, weight: .bold, design: .monospaced))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 13)
                                .background(color)
                                .cornerRadius(6)
                                .shadow(color: color.opacity(0.5), radius: 6)
                        } else {
                            Button {
                                guard !selected.isEmpty else { return }
                                let correct = selected == node.correctAnswer
                                let result = onGrade(correct)
                                streak = result.streak
                                defeated = result.defeated
                                lastCorrect = correct
                                showResult = true
                                if correct { triggerBurst() } else { triggerBreach() }
                            } label: {
                                Text(selected.isEmpty ? "SELECT AN ANSWER" : "TRANSMIT")
                                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                                    .foregroundColor(selected.isEmpty ? color.opacity(0.4) : .black)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 13)
                                    .background(selected.isEmpty ? Color.clear : color)
                                    .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(color.opacity(selected.isEmpty ? 0.3 : 0), lineWidth: 1))
                                    .cornerRadius(6)
                                    .shadow(color: selected.isEmpty ? .clear : color.opacity(0.5), radius: 5)
                            }
                            .disabled(selected.isEmpty)
                        }
                    }
                    .padding(20)
                }
            }
        }
        .onAppear {
            streak = currentStreak
            defeated = isDefeated
            loadNextQuestion()
        }
    }

    private func loadNextQuestion() {
        guard !defeated, !questionPool.isEmpty else { return }
        selected = ""
        showResult = false
        currentNode = questionPool.randomElement()
    }

    private func questionPrompt(for node: DataNode) -> String {
        if !node.questionText.isEmpty { return node.questionText }
        let rawTitle = node.nodeTitle.replacingOccurrences(of: "\n", with: " ")
        let displayName = node.baseConceptTitle ?? rawTitle
        if node.baseConceptTitle != nil {
            switch node.angle {
            case .classification: return "Which drug class does \(displayName) belong to?"
            case .mechanism:      return "Which of the following best describes the mechanism of action of \(displayName)?"
            case .indication:     return "\(displayName) is MOST commonly indicated for which of the following conditions?"
            case .safety:         return "Which adverse effect is MOST commonly associated with \(displayName)?"
            case .dosing:         return "Which of the following is correct regarding the dosing or administration of \(displayName)?"
            }
        }
        return "Which of the following is correct regarding \(displayName)?"
    }

    private func triggerBreach() {
        withAnimation(.easeIn(duration: 0.04))  { breachFlash = 0.35 }
        withAnimation(.easeOut(duration: 0.28).delay(0.06)) { breachFlash = 0 }
    }

    private func triggerBurst() {
        burstScale = 0.2; burstOpacity = 0.85
        withAnimation(.easeOut(duration: 0.7)) { burstScale = 2.8; burstOpacity = 0 }
    }
}

// MARK: - Store View

struct StoreView: View {
    let engine: GameEngine
    @Environment(\.dismiss) private var dismiss

    private let cyan = Color(red: 0.6, green: 0.9, blue: 1.0)

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GridBackground().opacity(0.35).ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("DATA EXCHANGE")
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(engine.currentTheme.accentColor)
                            .shadow(color: engine.currentTheme.accentColor.opacity(0.7), radius: 6)
                        Text("SPEND SHARDS TO UNLOCK THEMES")
                            .font(.system(size: 10, design: .monospaced))
                            .foregroundColor(.white.opacity(0.4))
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "diamond.fill").font(.system(size: 11))
                        Text("\(engine.currentDataShards)")
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(cyan)
                    .shadow(color: cyan.opacity(0.5), radius: 5)
                }
                .padding(20)

                Divider().background(engine.currentTheme.accentColor.opacity(0.25))

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(Theme.allCases, id: \.rawValue) { theme in
                            ThemeStoreRow(
                                theme: theme,
                                isOwned: engine.isThemeUnlocked(theme),
                                isActive: engine.currentTheme == theme,
                                canAfford: engine.currentDataShards >= theme.cost
                            ) {
                                if engine.isThemeUnlocked(theme) {
                                    engine.setActiveTheme(theme)
                                } else {
                                    engine.purchaseTheme(theme)
                                }
                            }
                        }
                    }
                    .padding(20)
                }

                Button("CLOSE") { dismiss() }
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(engine.currentTheme.accentColor)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(engine.currentTheme.accentColor.opacity(0.1))
                    .overlay(Rectangle().fill(engine.currentTheme.accentColor.opacity(0.3)).frame(height: 1),
                             alignment: .top)
            }
        }
    }
}

struct ThemeStoreRow: View {
    let theme: Theme
    let isOwned: Bool
    let isActive: Bool
    let canAfford: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // Colour swatch
                Circle()
                    .fill(theme.accentColor)
                    .frame(width: 32, height: 32)
                    .shadow(color: theme.accentColor.opacity(0.8), radius: 8)
                    .overlay(
                        Circle().stroke(isActive ? Color.white : Color.clear, lineWidth: 2)
                    )

                VStack(alignment: .leading, spacing: 3) {
                    Text(theme.displayName)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundColor(isOwned ? theme.accentColor : .white.opacity(0.7))
                    Text(theme.isDefault ? "DEFAULT" : isOwned ? "OWNED" : "\(theme.cost) SHARDS")
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundColor(.white.opacity(0.4))
                }

                Spacer()

                if isActive {
                    Text("ACTIVE")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.accentColor)
                        .shadow(color: theme.accentColor.opacity(0.6), radius: 4)
                } else if isOwned {
                    Text("EQUIP")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.accentColor.opacity(0.8))
                } else {
                    HStack(spacing: 4) {
                        Image(systemName: "diamond.fill").font(.system(size: 9))
                        Text("\(theme.cost)")
                            .font(.system(size: 11, weight: .bold, design: .monospaced))
                    }
                    .foregroundColor(canAfford
                                     ? Color(red: 0.6, green: 0.9, blue: 1.0)
                                     : .white.opacity(0.3))
                }
            }
            .padding(14)
            .background(Color(red: 0.09, green: 0.09, blue: 0.09))
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(isActive ? theme.accentColor.opacity(0.7) : Color.white.opacity(0.08), lineWidth: 1))
            .cornerRadius(10)
        }
        .disabled(!canAfford && !isOwned)
    }
}
