//
//  TVMapView.swift
//  Synapse PTCE  v13.0
//
//  tvOS Quest Picker and Sector Node views.
//  Uses a split-pane layout: quest list on left, node grid on right.
//

#if os(tvOS)
import SwiftUI

// MARK: - TV Quest Picker View

/// Left-pane quest list + right-pane node grid.
/// Focuses left pane first; selecting a quest navigates deeper.
struct TVQuestPickerView: View {
    let engine: GameEngine
    let domain: KnowledgeDomain
    let onSelectQuest: (DomainQuest) -> Void
    let onBack: () -> Void

    @Environment(\.appTheme) private var theme
    private var accent: Color { domain.accentColor }

    private var quests: [DomainQuest] { DomainQuest.make(for: domain, from: engine.nodes) }

    var body: some View {
        VStack(spacing: 0) {

            // ── Header ────────────────────────────────────────────────────
            TVDomainHeader(domain: domain, subtitle: "SELECT PROTOCOL", onBack: onBack)

            // ── Quest grid ────────────────────────────────────────────────
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 40),
                        GridItem(.flexible(), spacing: 40),
                        GridItem(.flexible(), spacing: 40)
                    ],
                    spacing: 36
                ) {
                    ForEach(quests) { quest in
                        let nodes = quest.nodes(from: engine.nodes)
                        TVQuestCard(quest: quest, nodes: nodes, accent: accent, theme: theme) {
                            onSelectQuest(quest)
                        }
                    }
                }
                .padding(.horizontal, 100)
                .padding(.vertical, 50)
            }
        }
        .onExitCommand { withAnimation(.easeInOut(duration: 0.35)) { onBack() } }
    }
}

// MARK: - TV Sector View

/// Full node grid within a quest.  Nodes are shown in a scrollable LazyVGrid.
struct TVSectorView: View {
    @Bindable var engine: GameEngine
    let domain: KnowledgeDomain
    let quest: DomainQuest
    let onBack: () -> Void

    @State private var showBoss = false

    @Environment(\.appTheme) private var theme
    private var accent: Color { domain.accentColor }

    private var displayNodes: [DataNode] { quest.nodes(from: engine.nodes) }
    private var allDomainNodes: [DataNode] { engine.nodes.filter { $0.domain == domain } }

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
        VStack(spacing: 0) {

            // ── Header ────────────────────────────────────────────────────
            TVDomainHeader(
                domain: domain,
                subtitle: quest.name.uppercased(),
                progress: questProgress,
                onBack: onBack,
                trailingContent: bossButton
            )

            // ── Node grid ─────────────────────────────────────────────────
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 30), count: 4),
                    spacing: 30
                ) {
                    ForEach(displayNodes) { node in
                        let prereqOK = engine.isPrerequisiteSatisfied(for: node)
                        TVNodeCard(
                            node: node,
                            color: accent,
                            prereqSatisfied: prereqOK
                        ) {
                            engine.selectedNode = node
                        }
                        .disabled(!node.isUnlocked || !prereqOK)
                    }
                }
                .padding(.horizontal, 100)
                .padding(.vertical, 50)
            }
        }
        .onExitCommand { withAnimation(.easeInOut(duration: 0.35)) { onBack() } }
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

    @ViewBuilder
    private var bossButton: some View {
        TVActionButton(
            label: engine.isBossDefeated(for: domain) ? "DEFEATED" : "BOSS",
            icon: engine.isBossDefeated(for: domain) ? "checkmark.seal.fill" : "bolt.fill",
            color: engine.isBossDefeated(for: domain)
                ? Color(red: 0.15, green: 0.88, blue: 0.48)
                : Color(red: 0.95, green: 0.22, blue: 0.30),
            action: { showBoss = true }
        )
    }
}

// MARK: - TV Domain Header

struct TVDomainHeader<Trailing: View>: View {
    let domain: KnowledgeDomain
    let subtitle: String
    var progress: DomainProgress? = nil
    let onBack: () -> Void
    @ViewBuilder var trailingContent: () -> Trailing

    @Environment(\.appTheme) private var theme
    private var accent: Color { domain.accentColor }

    init(domain: KnowledgeDomain,
         subtitle: String,
         progress: DomainProgress? = nil,
         onBack: @escaping () -> Void,
         @ViewBuilder trailingContent: @escaping () -> Trailing) {
        self.domain = domain
        self.subtitle = subtitle
        self.progress = progress
        self.onBack = onBack
        self.trailingContent = trailingContent
    }

    var body: some View {
        HStack(spacing: 0) {
            // Back button
            Button(action: onBack) {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .bold))
                    Text("HUB")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                .foregroundColor(accent)
            }
            .buttonStyle(.plain)
            .padding(.leading, 100)

            Spacer()

            // Domain title + subtitle
            VStack(spacing: 6) {
                Text(domain.terminalSectorLabel)
                    .font(.system(size: 22, weight: .black, design: .monospaced))
                    .foregroundColor(accent)
                    .shadow(color: accent.opacity(0.55), radius: 6)
                Text(subtitle)
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundColor(accent.opacity(0.50))
                    .tracking(2)

                if let progress {
                    ZStack(alignment: .leading) {
                        Capsule().fill(accent.opacity(0.10)).frame(width: 200, height: 5)
                        Capsule()
                            .fill(accent)
                            .frame(width: 200 * progress.percentComplete, height: 5)
                            .shadow(color: accent.opacity(0.6), radius: 4)
                    }
                }
            }

            Spacer()

            // Trailing content (e.g. boss button)
            trailingContent()
                .padding(.trailing, 100)
        }
        .padding(.vertical, 22)
        .background(theme.surface.opacity(0.88))
        .overlay(Rectangle().fill(accent.opacity(0.20)).frame(height: 1), alignment: .bottom)
    }
}

extension TVDomainHeader where Trailing == EmptyView {
    init(domain: KnowledgeDomain,
         subtitle: String,
         progress: DomainProgress? = nil,
         onBack: @escaping () -> Void) {
        self.init(domain: domain, subtitle: subtitle, progress: progress, onBack: onBack) {
            EmptyView()
        }
    }
}

// MARK: - TV Quest Card

struct TVQuestCard: View {
    let quest: DomainQuest
    let nodes: [DataNode]
    let accent: Color
    let theme: AppTheme
    let onTap: () -> Void

    @Environment(\.isFocused) private var isFocused

    private var completed: Int { nodes.filter(\.isCompleted).count }
    private var unlocked:  Int { nodes.filter(\.isUnlocked).count }
    private var pct: Double    { nodes.isEmpty ? 0 : Double(completed) / Double(nodes.count) }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    Image(systemName: quest.icon)
                        .font(.system(size: 32))
                        .foregroundColor(accent)
                        .shadow(color: isFocused ? accent.opacity(0.8) : .clear, radius: 10)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("\(completed)/\(nodes.count)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(isFocused ? accent : theme.secondaryText)
                        if unlocked > completed {
                            Text("\(unlocked - completed) ACTIVE")
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundColor(accent.opacity(0.7))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(quest.name)
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(isFocused ? accent : theme.primaryText)
                    Text(quest.subtitle)
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 0)

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(accent.opacity(0.10)).frame(height: 5)
                        Capsule()
                            .fill(accent.opacity(0.85))
                            .frame(width: geo.size.width * pct, height: 5)
                            .shadow(color: pct > 0 ? accent.opacity(0.5) : .clear, radius: 4)
                    }
                }
                .frame(height: 5)
            }
            .padding(28)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 200)
            .background(isFocused ? accent.opacity(0.10) : theme.surface)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? accent : theme.divider, lineWidth: isFocused ? 2 : 1)
            )
            .cornerRadius(16)
            .scaleEffect(isFocused ? 1.04 : 1.0)
            .shadow(color: isFocused ? accent.opacity(0.30) : .clear, radius: 16)
            .animation(.spring(response: 0.22, dampingFraction: 0.68), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - TV Node Card

struct TVNodeCard: View {
    let node: DataNode
    let color: Color
    let prereqSatisfied: Bool
    let onTap: () -> Void

    @Environment(\.appTheme) private var theme
    @Environment(\.isFocused) private var isFocused

    private var isLocked: Bool { !node.isUnlocked || !prereqSatisfied }

    private var statusIcon: String {
        if node.isCompleted                            { return "checkmark.circle.fill" }
        if !node.isUnlocked                            { return "lock.fill" }
        if !prereqSatisfied                            { return "exclamationmark.circle" }
        return "circle.dotted"
    }

    private var statusColor: Color {
        if node.isCompleted { return Color(red: 0.15, green: 0.88, blue: 0.48) }
        if isLocked         { return theme.secondaryText }
        return color
    }

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: statusIcon)
                        .font(.system(size: 18))
                        .foregroundColor(statusColor)
                        .shadow(color: isFocused && !isLocked ? statusColor.opacity(0.8) : .clear, radius: 6)
                    Spacer()
                    Text(node.angle.badge)
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(isLocked ? theme.secondaryText : color)
                        .padding(.horizontal, 6).padding(.vertical, 3)
                        .background((isLocked ? theme.divider : color).opacity(0.12))
                        .cornerRadius(4)
                }

                Spacer(minLength: 0)

                Text(node.nodeTitle)
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(isLocked ? theme.secondaryText : (isFocused ? color : theme.primaryText))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 130)
            .background(
                isLocked      ? theme.surface.opacity(0.5) :
                isFocused     ? color.opacity(0.10) :
                node.isCompleted ? Color(red: 0.15, green: 0.88, blue: 0.48).opacity(0.05) :
                theme.surface
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isLocked      ? theme.divider :
                        isFocused     ? color :
                        node.isCompleted ? Color(red: 0.15, green: 0.88, blue: 0.48).opacity(0.5) :
                        color.opacity(0.3),
                        lineWidth: isFocused ? 2 : 1
                    )
            )
            .cornerRadius(12)
            .opacity(isLocked ? 0.45 : 1.0)
            .scaleEffect(isFocused ? 1.04 : 1.0)
            .shadow(color: isFocused && !isLocked ? color.opacity(0.30) : .clear, radius: 12)
            .animation(.spring(response: 0.22, dampingFraction: 0.68), value: isFocused)
        }
        .buttonStyle(.plain)
    }
}
#endif
