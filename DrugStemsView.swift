//
//  DrugStemsView.swift
//  Synapse PTCE
//
//  Drug Stems Learning Interface
//  Students browse stems by body system, see examples, and understand the pattern.
//

import SwiftUI

struct DrugStemsView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedSystem: BodySystem = .cardiovascular
    @State private var expandedStemID: UUID? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            
            // System Selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(BodySystem.allCases) { system in
                        SystemChip(
                            system: system,
                            isSelected: selectedSystem == system,
                            action: { selectedSystem = system }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
            }
            .background(theme.surface)
            
            Divider().background(theme.divider)
            
            // Stems List
            ScrollView {
                LazyVStack(spacing: 12) {
                    let stems = DrugStem.stems(for: selectedSystem)
                    
                    if stems.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 48))
                                .foregroundColor(theme.secondaryText)
                            
                            Text("No stems yet for this system")
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)
                    } else {
                        ForEach(stems) { stem in
                            StemCard(
                                stem: stem,
                                isExpanded: expandedStemID == stem.id,
                                accentColor: selectedSystem.accentColor,
                                theme: theme,
                                onTap: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                                        expandedStemID = (expandedStemID == stem.id) ? nil : stem.id
                                    }
                                }
                            )
                        }
                    }
                }
                .padding(20)
            }
        }
    }
}

// MARK: - System Chip

struct SystemChip: View {
    @Environment(\.appTheme) private var theme
    let system: BodySystem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: system.icon)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(system.displayName.uppercased())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .foregroundColor(isSelected ? .white : theme.primaryText)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? system.accentColor : theme.surface)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? system.accentColor : theme.divider, lineWidth: 1.5)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Stem Card

struct StemCard: View {
    let stem: DrugStem
    let isExpanded: Bool
    let accentColor: Color
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                
                // Header: Stem name + drug class
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(stem.stem.uppercased())
                            .font(.system(size: 22, weight: .black, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        Text(stem.drugClass)
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(theme.primaryText)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle")
                        .font(.system(size: 24))
                        .foregroundColor(accentColor.opacity(0.7))
                }
                
                // Therapeutic Use
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 12))
                        .foregroundColor(accentColor.opacity(0.7))
                    
                    Text(stem.therapeuticUse)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(theme.primaryText.opacity(0.85))
                }
                
                // Expanded Content
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    // Examples
                    VStack(alignment: .leading, spacing: 6) {
                        Text("EXAMPLES:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        ForEach(stem.examples, id: \.self) { example in
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(accentColor)
                                    .frame(width: 4, height: 4)
                                
                                Text(example)
                                    .font(.system(size: 13, weight: .semibold, design: .monospaced))
                                    .foregroundColor(theme.primaryText)
                            }
                        }
                    }
                    
                    // Key Point
                    VStack(alignment: .leading, spacing: 6) {
                        Text("💡 KEY POINT:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        Text(stem.keyPoint)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    .padding(10)
                    .background(accentColor.opacity(0.08))
                    .cornerRadius(8)
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
            .shadow(color: accentColor.opacity(isExpanded ? 0.2 : 0), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - PREVIEW

#Preview {
    DrugStemsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}
