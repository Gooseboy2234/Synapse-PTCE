//
//  ConceptualLearningView.swift
//  Synapse PTCE
//
//  NEW D1 Medications Learning Hub
//  Philosophy: Learn concepts first → drugs attach themselves naturally
//
//  Structure:
//  1. Drug Stems (learn the naming patterns)
//  2. Body Systems (study by what the drug affects)
//  3. High-Risk Medications (NTI, High-Alert, REMS)
//  4. Drug Interactions (OTC, Herbals, Food, Rx-Rx)
//  5. Practice Questions (concept-based, not rote memorization)
//

import SwiftUI

// MARK: - Conceptual Learning View (Main Hub)

struct ConceptualLearningView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedTab: LearningTab = .stems
    
    enum LearningTab: String, CaseIterable {
        case stems       = "STEMS"
        case systems     = "SYSTEMS"
        case highRisk    = "HIGH-RISK"
        case interactions = "INTERACTIONS"
        
        var displayName: String {
            switch self {
            case .stems:       return "Drug Stems"
            case .systems:     return "Body Systems"
            case .highRisk:    return "High-Risk Meds"
            case .interactions: return "Interactions"
            }
        }
        
        var icon: String {
            switch self {
            case .stems:       return "textformat.abc"
            case .systems:     return "heart.text.square.fill"
            case .highRisk:    return "exclamationmark.triangle.fill"
            case .interactions: return "arrow.triangle.2.circlepath"
            }
        }
        
        var description: String {
            switch self {
            case .stems:
                return "Learn the naming patterns. If you know -pril = ACE inhibitor, you don't need to memorize 5 drugs separately."
            case .systems:
                return "Study by what the drug affects. Cardiovascular, Endocrine, CNS, etc. Build a mental filing cabinet."
            case .highRisk:
                return "The drugs that cause devastating harm. NTI, High-Alert (ISMP), REMS programs."
            case .interactions:
                return "OTCs, herbals, and foods that block or amplify prescription drugs. What patients don't know CAN hurt them."
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                theme.background.ignoresSafeArea()
                
                // Subtle grid
                GridBackground()
                
                VStack(spacing: 0) {
                    
                    // Header
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            Image(systemName: "brain.head.profile")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(accentColor)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("CONCEPTUAL LEARNING")
                                    .font(.system(size: 20, weight: .black, design: .monospaced))
                                    .foregroundColor(theme.primaryText)
                                
                                Text("Domain 1: Medications — The Right Way")
                                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                    .foregroundColor(theme.secondaryText)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        
                        // Philosophy Banner
                        VStack(alignment: .leading, spacing: 6) {
                            Text("💡 THE PHILOSOPHY:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(accentColor)
                            
                            Text("Brute-force memorization isn't how you'll pass the PTCE. Learn the core concepts — drug stems, body systems, high-risk factors — and the specific medications will naturally attach themselves to those concepts.")
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                                .foregroundColor(theme.primaryText.opacity(0.85))
                                .lineSpacing(4)
                        }
                        .padding(14)
                        .background(accentColor.opacity(0.08))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                    }
                    
                    // Tab Selector
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(LearningTab.allCases, id: \.self) { tab in
                                TabButton(
                                    tab: tab,
                                    isSelected: selectedTab == tab,
                                    accentColor: accentColor,
                                    theme: theme,
                                    action: { selectedTab = tab }
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    
                    Divider()
                        .background(theme.divider)
                    
                    // Content Area
                    TabView(selection: $selectedTab) {
                        DrugStemsView(accentColor: accentColor)
                            .tag(LearningTab.stems)
                        
                        BodySystemsView(accentColor: accentColor)
                            .tag(LearningTab.systems)
                        
                        HighRiskMedicationsView(accentColor: accentColor)
                            .tag(LearningTab.highRisk)
                        
                        DrugInteractionsView(accentColor: accentColor)
                            .tag(LearningTab.interactions)
                    }
                    #if os(iOS)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    #endif
                    .animation(.easeInOut, value: selectedTab)
                }
            }
            .inlineNavigationTitle()
        }
    }
}

// MARK: - Tab Button

struct TabButton: View {
    let tab: ConceptualLearningView.LearningTab
    let isSelected: Bool
    let accentColor: Color
    let theme: AppTheme
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: tab.icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(isSelected ? accentColor : theme.secondaryText)
                
                Text(tab.displayName)
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(isSelected ? accentColor : theme.secondaryText)
            }
            .frame(width: 100, height: 70)
            .background(
                isSelected ? accentColor.opacity(0.12) : theme.surface
            )
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? accentColor : theme.divider, lineWidth: isSelected ? 2 : 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Grid Background (Reusable)

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
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

#Preview {
    ConceptualLearningView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}
