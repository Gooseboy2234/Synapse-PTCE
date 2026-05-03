//
//  BodySystemsView.swift
//  Synapse PTCE
//
//  Body Systems Learning Interface
//  Browse medications grouped by the body system they affect.
//  Build a mental filing cabinet: Monday = Cardiovascular, Tuesday = Endocrine, etc.
//

import SwiftUI

struct BodySystemsView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedSystem: BodySystem? = nil
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                
                // Study Strategy Banner
                VStack(alignment: .leading, spacing: 8) {
                    Text("📚 STUDY STRATEGY:")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(accentColor)
                    
                    Text("Dedicate each study day to a specific body system. Spend Monday on Cardiovascular drugs (ACE inhibitors, beta-blockers, statins). Tuesday: Endocrine (diabetes meds, thyroid). This creates a mental filing cabinet where drugs make logical sense.")
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
                
                // System Cards
                ForEach(BodySystem.allCases) { system in
                    SystemOverviewCard(
                        system: system,
                        theme: theme,
                        isExpanded: selectedSystem == system,
                        onTap: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                                selectedSystem = (selectedSystem == system) ? nil : system
                            }
                        }
                    )
                }
            }
            .padding(20)
        }
    }
}

// MARK: - System Overview Card

struct SystemOverviewCard: View {
    let system: BodySystem
    let theme: AppTheme
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                
                // Header
                HStack {
                    Image(systemName: system.icon)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(system.accentColor)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(system.displayName.uppercased())
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundColor(theme.primaryText)
                        
                        let stemCount = DrugStem.stems(for: system).count
                        Text("\(stemCount) drug classes")
                            .font(.system(size: 11, weight: .semibold, design: .monospaced))
                            .foregroundColor(theme.secondaryText)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle")
                        .font(.system(size: 24))
                        .foregroundColor(system.accentColor.opacity(0.7))
                }
                
                // Expanded: Show stems in this system
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    let stems = DrugStem.stems(for: system)
                    
                    if stems.isEmpty {
                        Text("No drug classes defined yet for this system.")
                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                            .foregroundColor(theme.secondaryText.opacity(0.7))
                            .italic()
                    } else {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(stems) { stem in
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(stem.stem.uppercased())
                                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                                            .foregroundColor(system.accentColor)
                                        
                                        Text("→")
                                            .foregroundColor(theme.secondaryText)
                                        
                                        Text(stem.drugClass)
                                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                                            .foregroundColor(theme.primaryText)
                                    }
                                    
                                    Text(stem.therapeuticUse)
                                        .font(.system(size: 11, weight: .medium, design: .rounded))
                                        .foregroundColor(theme.secondaryText)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(system.accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
            .shadow(color: system.accentColor.opacity(isExpanded ? 0.2 : 0), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - PREVIEW

#Preview {
    BodySystemsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}
