//
//  SimplifiedLearningViews.swift
//  Synapse PTCE
//
//  Simplified versions of the learning views for the Guided Learning Hub
//  These are the "study" modes (not quiz/flashcard modes)
//

import SwiftUI
import SwiftData

// MARK: - Cross-Platform View Helpers

/// Mirrors `TextInputAutocapitalization` so callers can spell the intent on macOS too.
enum AutocapStyle {
    case never, sentences, words, characters
}

extension View {
    /// Applies `.navigationBarTitleDisplayMode(.inline)` on iOS, no-op elsewhere.
    @ViewBuilder
    func inlineNavigationTitle() -> some View {
        #if os(iOS)
        self.navigationBarTitleDisplayMode(.inline)
        #else
        self
        #endif
    }

    /// Cross-platform `textInputAutocapitalization`. No-op on macOS where it's unavailable.
    @ViewBuilder
    func autocapitalization(_ style: AutocapStyle) -> some View {
        #if os(iOS) || os(tvOS) || os(visionOS) || os(watchOS)
        switch style {
        case .never:      self.textInputAutocapitalization(.never)
        case .sentences:  self.textInputAutocapitalization(.sentences)
        case .words:      self.textInputAutocapitalization(.words)
        case .characters: self.textInputAutocapitalization(.characters)
        }
        #else
        self
        #endif
    }

    /// Cross-platform full-screen presentation. Falls back to `.sheet` on macOS where `fullScreenCover` is unavailable.
    @ViewBuilder
    func fullScreenCoverCompat<C: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> C
    ) -> some View {
        #if os(macOS)
        self.sheet(isPresented: isPresented, content: content)
        #else
        self.fullScreenCover(isPresented: isPresented, content: content)
        #endif
    }

    @ViewBuilder
    func fullScreenCoverCompat<I: Identifiable, C: View>(
        item: Binding<I?>,
        @ViewBuilder content: @escaping (I) -> C
    ) -> some View {
        #if os(macOS)
        self.sheet(item: item, content: content)
        #else
        self.fullScreenCover(item: item, content: content)
        #endif
    }
}

// MARK: - Drug Stems Learning View

struct DrugStemsLearningView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    @State private var selectedSystem: BodySystem = .cardiovascular
    @State private var expandedStemID: UUID? = nil
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackgroundView(accentColor: accentColor, theme: theme)
            
            VStack(spacing: 0) {
                // System Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(BodySystem.allCases) { system in
                            SystemChipButton(
                                system: system,
                                isSelected: selectedSystem == system,
                                theme: theme,
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
                        ForEach(stems) { stem in
                            StemCardView(
                                stem: stem,
                                isExpanded: expandedStemID == stem.id,
                                accentColor: selectedSystem.accentColor,
                                theme: theme,
                                onTap: {
                                    withAnimation {
                                        expandedStemID = (expandedStemID == stem.id) ? nil : stem.id
                                        if expandedStemID == stem.id {
                                            userProgress.markStemViewed(stem.id)
                                        }
                                    }
                                }
                            )
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Drug Stems")
        .inlineNavigationTitle()
    }
}

struct SystemChipButton: View {
    let system: BodySystem
    let isSelected: Bool
    let theme: AppTheme
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: system.icon)
                    .font(.system(size: 12, weight: .semibold))
                Text(system.displayName.uppercased())
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .lineLimit(1)
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

struct StemCardView: View {
    let stem: DrugStem
    let isExpanded: Bool
    let accentColor: Color
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
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
                
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("THERAPEUTIC USE:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        Text(stem.therapeuticUse)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(theme.secondaryText)
                        
                        Text("EXAMPLES:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(accentColor)
                        ForEach(stem.examples, id: \.self) { example in
                            Text("• \(example)")
                                .font(.system(size: 13, weight: .semibold, design: .monospaced))
                                .foregroundColor(theme.primaryText)
                        }
                        
                        Text("💡 \(stem.keyPoint)")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .padding(10)
                            .background(accentColor.opacity(0.08))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Body Systems Learning View

struct BodySystemsLearningView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedSystem: BodySystem? = nil
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackgroundView(accentColor: accentColor, theme: theme)
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(BodySystem.allCases) { system in
                        SystemCardView(
                            system: system,
                            theme: theme,
                            isExpanded: selectedSystem == system,
                            onTap: {
                                withAnimation {
                                    selectedSystem = (selectedSystem == system) ? nil : system
                                }
                            }
                        )
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Body Systems")
        .inlineNavigationTitle()
    }
}

struct SystemCardView: View {
    let system: BodySystem
    let theme: AppTheme
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
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
                
                if isExpanded {
                    Divider().background(theme.divider)
                    let stems = DrugStem.stems(for: system)
                    ForEach(stems) { stem in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(stem.stem.uppercased())
                                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                                    .foregroundColor(system.accentColor)
                                Text("→ \(stem.drugClass)")
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundColor(theme.primaryText)
                            }
                        }
                        .padding(.vertical, 4)
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
        }
        .buttonStyle(.plain)
    }
}

// MARK: - High-Risk Learning View

struct HighRiskLearningView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    @State private var selectedCategory: HighRiskCategory = .narrowTherapeuticIndex
    @State private var expandedMedID: UUID? = nil
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackgroundView(accentColor: accentColor, theme: theme)
            
            VStack(spacing: 0) {
                // Category Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(HighRiskCategory.allCases) { category in
                            CategoryChipButton(
                                category: category,
                                isSelected: selectedCategory == category,
                                theme: theme,
                                action: { selectedCategory = category }
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                }
                .background(theme.surface)
                
                Divider().background(theme.divider)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        let meds = HighRiskMedication.medications(for: selectedCategory)
                        ForEach(meds) { med in
                            HighRiskMedCardView(
                                medication: med,
                                isExpanded: expandedMedID == med.id,
                                theme: theme,
                                onTap: {
                                    withAnimation {
                                        expandedMedID = (expandedMedID == med.id) ? nil : med.id
                                        if expandedMedID == med.id {
                                            userProgress.markHighRiskMedViewed(med.id)
                                        }
                                    }
                                }
                            )
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("High-Risk Medications")
        .inlineNavigationTitle()
    }
}

struct CategoryChipButton: View {
    let category: HighRiskCategory
    let isSelected: Bool
    let theme: AppTheme
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: category.icon)
                    .font(.system(size: 12))
                Text(category.displayName.uppercased())
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .lineLimit(1)
            }
            .foregroundColor(isSelected ? .white : theme.primaryText)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? category.accentColor : theme.surface)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? category.accentColor : theme.divider, lineWidth: 1.5)
            )
        }
        .buttonStyle(.plain)
    }
}

struct HighRiskMedCardView: View {
    let medication: HighRiskMedication
    let isExpanded: Bool
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(medication.genericName.uppercased())
                            .font(.system(size: 18, weight: .black, design: .monospaced))
                            .foregroundColor(medication.category.accentColor)
                        Text(medication.brandName)
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundColor(theme.secondaryText)
                    }
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up.circle.fill" : "chevron.down.circle")
                        .font(.system(size: 24))
                        .foregroundColor(medication.category.accentColor.opacity(0.7))
                }
                
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("RISK:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(medication.category.accentColor)
                        Text(medication.riskDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                        
                        Text("MONITORING:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(medication.category.accentColor)
                        Text(medication.monitoringRequired)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                        
                        Text("💡 \(medication.keyPoint)")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .padding(10)
                            .background(medication.category.accentColor.opacity(0.08))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(medication.category.accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Interactions Learning View

struct InteractionsLearningView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    @State private var selectedType: InteractionType = .otcRx
    @State private var expandedInteractionID: UUID? = nil
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var body: some View {
        ZStack {
            theme.background.ignoresSafeArea()
            GridBackgroundView(accentColor: accentColor, theme: theme)
            
            VStack(spacing: 0) {
                // Type Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(InteractionType.allCases) { type in
                            TypeChipButton(
                                type: type,
                                isSelected: selectedType == type,
                                accentColor: accentColor,
                                theme: theme,
                                action: { selectedType = type }
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                }
                .background(theme.surface)
                
                Divider().background(theme.divider)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        let interactions = DrugInteraction.interactions(for: selectedType)
                        ForEach(interactions) { interaction in
                            InteractionCardView(
                                interaction: interaction,
                                isExpanded: expandedInteractionID == interaction.id,
                                theme: theme,
                                onTap: {
                                    withAnimation {
                                        expandedInteractionID = (expandedInteractionID == interaction.id) ? nil : interaction.id
                                        if expandedInteractionID == interaction.id {
                                            userProgress.markInteractionViewed(interaction.id)
                                        }
                                    }
                                }
                            )
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Drug Interactions")
        .inlineNavigationTitle()
    }
}

struct TypeChipButton: View {
    let type: InteractionType
    let isSelected: Bool
    let accentColor: Color
    let theme: AppTheme
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(type.displayName.uppercased())
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .lineLimit(1)
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

struct InteractionCardView: View {
    let interaction: DrugInteraction
    let isExpanded: Bool
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(interaction.agent1) ↔ \(interaction.agent2)")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundColor(interaction.severity.accentColor)
                        HStack(spacing: 6) {
                            Image(systemName: interaction.severity.icon)
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
                
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("MECHANISM:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(interaction.severity.accentColor)
                        Text(interaction.mechanismDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                        
                        Text("CONSEQUENCE:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(interaction.severity.accentColor)
                        Text(interaction.clinicalConsequence)
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(theme.primaryText)
                        
                        Text("COUNSELING:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(interaction.severity.accentColor)
                        Text(interaction.patientCounseling)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
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
        }
        .buttonStyle(.plain)
    }
}
