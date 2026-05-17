//
//  HighRiskMedicationsView.swift
//  Synapse PTCE
//
//  High-Risk Medications Learning Interface
//  Browse NTI, High-Alert, REMS, and LASA medications.
//  The PTCE heavily tests your ability to recognize danger.
//

import SwiftUI

struct HighRiskMedicationsView: View {
    @Environment(\.appTheme) private var theme
    let accentColor: Color
    @State private var selectedCategory: HighRiskCategory = .narrowTherapeuticIndex
    @State private var expandedMedID: UUID? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Category Selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(HighRiskCategory.allCases) { category in
                        CategoryChip(
                            category: category,
                            isSelected: selectedCategory == category,
                            action: { selectedCategory = category }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
            }
            .background(theme.surface)
            
            Divider().background(theme.divider)
            
            // Medications List
            ScrollView {
                LazyVStack(spacing: 12) {
                    
                    // Category Description
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: selectedCategory.icon)
                                .foregroundColor(selectedCategory.accentColor)
                            Text(selectedCategory.displayName.uppercased())
                                .font(.system(size: 11, weight: .bold, design: .monospaced))
                                .foregroundColor(selectedCategory.accentColor)
                        }
                        
                        Text(selectedCategory.description)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    .padding(12)
                    .background(selectedCategory.accentColor.opacity(0.08))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedCategory.accentColor.opacity(0.25), lineWidth: 1.5)
                    )
                    
                    let meds = HighRiskMedication.medications(for: selectedCategory)
                    
                    if meds.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 48))
                                .foregroundColor(theme.secondaryText)
                            
                            Text("No medications yet in this category")
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .foregroundColor(theme.secondaryText)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 40)
                    } else {
                        ForEach(meds) { med in
                            HighRiskMedCard(
                                medication: med,
                                isExpanded: expandedMedID == med.id,
                                theme: theme,
                                onTap: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                                        expandedMedID = (expandedMedID == med.id) ? nil : med.id
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

// MARK: - Category Chip

struct CategoryChip: View {
    @Environment(\.appTheme) private var theme
    let category: HighRiskCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: category.icon)
                    .font(.system(size: 12, weight: .semibold))
                
                Text(category.displayName.uppercased())
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
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

// MARK: - High-Risk Medication Card

struct HighRiskMedCard: View {
    let medication: HighRiskMedication
    let isExpanded: Bool
    let theme: AppTheme
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                
                // Header
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
                
                // Drug Class + Use
                VStack(alignment: .leading, spacing: 4) {
                    Text(medication.drugClass)
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(theme.primaryText)
                    
                    Text(medication.therapeuticUse)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(theme.secondaryText)
                }
                
                // Expanded Content
                if isExpanded {
                    Divider().background(theme.divider)
                    
                    // Risk Description
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(medication.category.accentColor)
                            Text("RISK:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(medication.category.accentColor)
                        }
                        
                        Text(medication.riskDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    
                    // Monitoring Required
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(medication.category.accentColor)
                            Text("MONITORING:")
                                .font(.system(size: 10, weight: .bold, design: .monospaced))
                                .foregroundColor(medication.category.accentColor)
                        }
                        
                        Text(medication.monitoringRequired)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    
                    // Key Point
                    VStack(alignment: .leading, spacing: 6) {
                        Text("💡 KEY POINT:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(medication.category.accentColor)
                        
                        Text(medication.keyPoint)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(theme.primaryText.opacity(0.85))
                            .lineSpacing(3)
                    }
                    .padding(10)
                    .background(medication.category.accentColor.opacity(0.08))
                    .cornerRadius(8)
                }
            }
            .padding(16)
            .background(theme.surface)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(medication.category.accentColor.opacity(isExpanded ? 0.5 : 0.25), lineWidth: isExpanded ? 2 : 1)
            )
            .shadow(color: medication.category.accentColor.opacity(isExpanded ? 0.2 : 0), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - PREVIEW

#Preview {
    HighRiskMedicationsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}
