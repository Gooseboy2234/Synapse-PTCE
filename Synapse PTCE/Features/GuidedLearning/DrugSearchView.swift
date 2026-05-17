//
//  DrugSearchView.swift
//  Synapse PTCE
//
//  UNIVERSAL DRUG SEARCH
//  Look up any drug name and see:
//  - Its stem and drug class
//  - Body system affected
//  - High-risk status (NTI, High-Alert, REMS, LASA)
//  - Known interactions
//  - Therapeutic use
//  - Key counseling points
//

import SwiftUI
import SwiftData

struct DrugSearchView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var progress: [LearningProgress]
    
    let accentColor: Color
    
    @State private var searchText = ""
    @State private var selectedResult: SearchResult? = nil
    
    var userProgress: LearningProgress {
        progress.first ?? LearningProgress()
    }
    
    var searchResults: [SearchResult] {
        guard !searchText.isEmpty else { return [] }
        
        var results: [SearchResult] = []
        let query = searchText.lowercased()
        
        // Search in drug stems examples
        for stem in DrugStem.allStems {
            for example in stem.examples {
                if example.lowercased().contains(query) {
                    results.append(SearchResult(
                        drugName: example,
                        stem: stem,
                        highRiskMed: HighRiskMedication.allHighRiskMeds.first(where: { $0.genericName.lowercased() == example.lowercased() }),
                        relatedInteractions: DrugInteraction.allInteractions.filter { 
                            $0.agent1.lowercased().contains(example.lowercased()) || 
                            $0.agent2.lowercased().contains(example.lowercased())
                        }
                    ))
                }
            }
        }
        
        // Search in high-risk meds
        for med in HighRiskMedication.allHighRiskMeds {
            if med.genericName.lowercased().contains(query) || med.brandName.lowercased().contains(query) {
                if !results.contains(where: { $0.drugName.lowercased() == med.genericName.lowercased() }) {
                    results.append(SearchResult(
                        drugName: med.genericName,
                        stem: DrugStem.allStems.first(where: { $0.examples.contains(where: { $0.lowercased() == med.genericName.lowercased() }) }),
                        highRiskMed: med,
                        relatedInteractions: DrugInteraction.allInteractions.filter {
                            $0.agent1.lowercased().contains(med.genericName.lowercased()) ||
                            $0.agent2.lowercased().contains(med.genericName.lowercased())
                        }
                    ))
                }
            }
        }
        
        return results
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.background.ignoresSafeArea()
                GridBackgroundView(accentColor: accentColor, theme: theme)
                
                VStack(spacing: 0) {
                    
                    // Search bar
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(theme.secondaryText)
                        
                        TextField("Search for any drug...", text: $searchText)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText)
                            .autocorrectionDisabled()
                            .autocapitalization(.never)
                        
                        if !searchText.isEmpty {
                            Button(action: { searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(theme.secondaryText)
                            }
                        }
                    }
                    .padding(14)
                    .background(theme.surface)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(accentColor.opacity(0.3), lineWidth: 1.5)
                    )
                    .padding(20)
                    
                    Divider().background(theme.divider)
                    
                    // Results or recent searches
                    if searchText.isEmpty {
                        RecentSearchesView(
                            recentSearches: userProgress.recentSearches,
                            accentColor: accentColor,
                            theme: theme,
                            onTap: { query in
                                searchText = query
                            }
                        )
                    } else if searchResults.isEmpty {
                        NoResultsView(query: searchText, theme: theme)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(searchResults, id: \.drugName) { result in
                                    SearchResultCard(
                                        result: result,
                                        accentColor: accentColor,
                                        theme: theme,
                                        onTap: {
                                            selectedResult = result
                                            userProgress.addSearch(result.drugName)
                                        }
                                    )
                                }
                            }
                            .padding(20)
                        }
                    }
                }
            }
            .navigationTitle("Drug Search")
            .inlineNavigationTitle()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .sheet(item: $selectedResult) { result in
                DrugDetailView(result: result, accentColor: accentColor)
            }
        }
    }
}

// MARK: - Search Result Model

struct SearchResult: Identifiable {
    let id = UUID()
    let drugName: String
    let stem: DrugStem?
    let highRiskMed: HighRiskMedication?
    let relatedInteractions: [DrugInteraction]
}

// MARK: - Recent Searches View

struct RecentSearchesView: View {
    let recentSearches: [String]
    let accentColor: Color
    let theme: AppTheme
    let onTap: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if recentSearches.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "magnifyingglass.circle")
                        .font(.system(size: 48))
                        .foregroundColor(theme.secondaryText.opacity(0.5))
                    
                    Text("Search for any drug")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(theme.secondaryText)
                    
                    Text("Find its stem, drug class, high-risk status, and interactions all in one place.")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(theme.secondaryText.opacity(0.7))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("RECENT SEARCHES")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(theme.secondaryText)
                        .padding(.horizontal, 20)
                    
                    ForEach(recentSearches.prefix(10), id: \.self) { search in
                        Button(action: { onTap(search) }) {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                    .foregroundColor(accentColor)
                                
                                Text(search)
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .foregroundColor(theme.primaryText)
                                
                                Spacer()
                                
                                Image(systemName: "arrow.up.left")
                                    .font(.system(size: 12))
                                    .foregroundColor(theme.secondaryText)
                            }
                            .padding(14)
                            .background(theme.surface)
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 12)
            }
        }
    }
}

// MARK: - No Results View

struct NoResultsView: View {
    let query: String
    let theme: AppTheme
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 48))
                .foregroundColor(theme.secondaryText.opacity(0.5))
            
            Text("No results for \"\(query)\"")
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(theme.secondaryText)
            
            Text("Try searching by generic name")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(theme.secondaryText.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
}

// MARK: - Search Result Card

struct SearchResultCard: View {
    let result: SearchResult
    let accentColor: Color
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Text(result.drugName.uppercased())
                        .font(.system(size: 18, weight: .black, design: .monospaced))
                        .foregroundColor(accentColor)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(theme.secondaryText)
                }
                
                if let stem = result.stem {
                    HStack(spacing: 6) {
                        Image(systemName: "textformat.abc")
                            .foregroundColor(stem.systemAffected.accentColor)
                        Text("\(stem.stem) → \(stem.drugClass)")
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(theme.primaryText)
                    }
                }
                
                if let highRisk = result.highRiskMed {
                    HStack(spacing: 6) {
                        Image(systemName: highRisk.category.icon)
                            .foregroundColor(highRisk.category.accentColor)
                        Text(highRisk.category.displayName)
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(highRisk.category.accentColor)
                    }
                }
                
                if !result.relatedInteractions.isEmpty {
                    HStack(spacing: 6) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                        Text("\(result.relatedInteractions.count) known interaction\(result.relatedInteractions.count == 1 ? "" : "s")")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundColor(.orange)
                    }
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Drug Detail View

struct DrugDetailView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.dismiss) private var dismiss
    let result: SearchResult
    let accentColor: Color
    
    var body: some View {
        NavigationStack {
            ZStack {
                theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Drug name
                        Text(result.drugName.uppercased())
                            .font(.system(size: 28, weight: .black, design: .monospaced))
                            .foregroundColor(accentColor)
                        
                        // Stem info
                        if let stem = result.stem {
                            DetailSection(title: "DRUG CLASS", icon: "textformat.abc", accentColor: stem.systemAffected.accentColor, theme: theme) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\(stem.stem) → \(stem.drugClass)")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(theme.primaryText)
                                    
                                    Text("Used for: \(stem.therapeuticUse)")
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(theme.secondaryText)
                                    
                                    Text("💡 \(stem.keyPoint)")
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundColor(theme.primaryText.opacity(0.85))
                                        .padding(.top, 4)
                                }
                            }
                        }
                        
                        // High-risk info
                        if let highRisk = result.highRiskMed {
                            DetailSection(title: highRisk.category.displayName.uppercased(), icon: highRisk.category.icon, accentColor: highRisk.category.accentColor, theme: theme) {
                                VStack(alignment: .leading, spacing: 12) {
                                    DetailRow(label: "Risk", value: highRisk.riskDescription, theme: theme)
                                    DetailRow(label: "Monitoring", value: highRisk.monitoringRequired, theme: theme)
                                    
                                    Text("💡 \(highRisk.keyPoint)")
                                        .font(.system(size: 13, weight: .medium, design: .rounded))
                                        .foregroundColor(theme.primaryText.opacity(0.85))
                                        .padding(.top, 4)
                                }
                            }
                        }
                        
                        // Interactions
                        if !result.relatedInteractions.isEmpty {
                            DetailSection(title: "KNOWN INTERACTIONS", icon: "exclamationmark.triangle.fill", accentColor: .orange, theme: theme) {
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(result.relatedInteractions.prefix(5)) { interaction in
                                        VStack(alignment: .leading, spacing: 4) {
                                            HStack {
                                                Image(systemName: interaction.severity.icon)
                                                    .foregroundColor(interaction.severity.accentColor)
                                                Text(interaction.severity.displayName.uppercased())
                                                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                                                    .foregroundColor(interaction.severity.accentColor)
                                            }
                                            
                                            Text("\(interaction.agent1) ↔ \(interaction.agent2)")
                                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                                .foregroundColor(theme.primaryText)
                                            
                                            Text(interaction.clinicalConsequence)
                                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                                .foregroundColor(theme.secondaryText)
                                                .lineSpacing(2)
                                        }
                                        .padding(.vertical, 8)
                                        
                                        if interaction.id != result.relatedInteractions.prefix(5).last?.id {
                                            Divider().background(theme.divider)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Drug Details")
            .inlineNavigationTitle()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Detail Section

struct DetailSection<Content: View>: View {
    let title: String
    let icon: String
    let accentColor: Color
    let theme: AppTheme
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .foregroundColor(accentColor)
                Text(title)
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(accentColor)
            }
            
            content
        }
        .padding(16)
        .background(theme.surface)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentColor.opacity(0.25), lineWidth: 1.5)
        )
    }
}

// MARK: - Detail Row

struct DetailRow: View {
    let label: String
    let value: String
    let theme: AppTheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label.uppercased())
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(theme.secondaryText)
            
            Text(value)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(theme.primaryText)
                .lineSpacing(3)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    DrugSearchView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
        .modelContainer(for: LearningProgress.self)
}
