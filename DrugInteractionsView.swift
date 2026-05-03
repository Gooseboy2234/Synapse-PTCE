//
//  DrugInteractionsView.swift
//  Synapse PTCE
//
//  Drug Interactions Learning Interface
//  Browse OTC-Rx, Herbal-Rx, Food-Rx, and Rx-Rx interactions.
//  Patients think OTCs and herbals are "safe" — teach them otherwise.
//

import SwiftUI

struct DrugInteractionsView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedType: InteractionType = .otcRx
    @State private var expandedInteractionID: UUID? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Type Selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(InteractionType.allCases) { type in
                        InteractionTypeChip(
                            type: type,
                            isSelected: selectedType == type,
                            accentColor: accentColor,
                            action: { selectedType = type }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
            }
            .background(theme.surface)
            
            Divider().background(theme.divider)
            
            // Interactions List
            ScrollView {
                LazyVStack(spacing: 12) {
                    
                    // Strategy Banner
                    VStack(alignment: .leading, spacing: 6) {
                        Text("⚠️ WHY THIS MATTERS:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        Text("Whenever you study a prescription drug class, learn its 'enemies.' Blood thinners + NSAIDs = bleeding. Oral contraceptives + St. John's Wort = accidental pregnancy. The PTCE tests your ability to counsel patients on these combinations.")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    .padding(12)
                    .background(accentColor.opacity(0.08))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
                    )
                    
                    let interactions = DrugInteraction.interactions(for: selectedType)
                    
                    if interactions.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 48))
                                .foregroundColor(theme.secondaryText)
                            
                            Text("No interactions yet in this category")
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 40)
                    } else {
                        ForEach(interactions) { interaction in
                            InteractionCard(
                                interaction: interaction,
                                isExpanded: expandedInteractionID == interaction.id,
                                theme: theme,
                                onTap: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                                        expandedInteractionID = (expandedInteractionID == interaction.id) ? nil : interaction.id
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

// MARK: - Interaction Type Chip

struct InteractionTypeChip: View {
    @Environment(\.appTheme) private var theme
    let type: InteractionType
    let isSelected: Bool
    let accentColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(type.displayName.uppercased())
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(isSelected ? .white : theme.primaryText)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? accentColor : theme.surface)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? accentColor : theme.divider, lineWidth: 1.5)
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Interaction Card

struct InteractionCard: View {
    let interaction: DrugInteraction
    let isExpanded: Bool
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                
                // Header: Agent 1 + Agent 2
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 6) {
                            Text(interaction.agent1)
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                                .foregroundColor(interaction.severity.accentColor)
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 12))
                                .foregroundColor(theme.secondaryText)
                            
                            Text(interaction.agent2)
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                                .foregroundColor(interaction.severity.accentColor)
                        }
                        
                        // Severity Badge
                        HStack(spacing: 6) {
                            Image(systemName: interaction.severity.icon)
                                .font(.system(size: 10))
                            Text(interaction.severity.displayName.uppercased())
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(interaction.severity.accentColor)
                        .cornerRadius(12)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle")
                        .font(.system(size: 24))
                        .foregroundColor(interaction.severity.accentColor.opacity(0.7))
                }
                
                // Expanded Content
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    // Mechanism
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: "gearshape.2.fill")
                                .foregroundColor(interaction.severity.accentColor)
                            Text("MECHANISM:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(interaction.severity.accentColor)
                        }
                        
                        Text(interaction.mechanismDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    
                    // Clinical Consequence
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: "cross.case.fill")
                                .foregroundColor(interaction.severity.accentColor)
                            Text("CLINICAL CONSEQUENCE:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(interaction.severity.accentColor)
                        }
                        
                        Text(interaction.clinicalConsequence)
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(theme.primaryText)
                            .lineSpacing(3)
                    }
                    .padding(10)
                    .background(interaction.severity.accentColor.opacity(0.12))
                    .cornerRadius(8)
                    
                    // Patient Counseling
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                .foregroundColor(interaction.severity.accentColor)
                            Text("PATIENT COUNSELING:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(interaction.severity.accentColor)
                        }
                        
                        Text(interaction.patientCounseling)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(interaction.severity.accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
            .shadow(color: interaction.severity.accentColor.opacity(isExpanded ? 0.2 : 0), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - PREVIEW

#Preview {
    DrugInteractionsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}
