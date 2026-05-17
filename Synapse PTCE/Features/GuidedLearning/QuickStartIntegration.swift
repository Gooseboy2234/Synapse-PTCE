//
//  QuickStartIntegration.swift
//  Synapse PTCE
//
//  COPY-PASTE CODE SNIPPETS FOR FAST INTEGRATION
//

import SwiftUI

// ─────────────────────────────────────────────────────────────────────────────
// OPTION 1: Add to MapView.swift or Main Navigation
// ─────────────────────────────────────────────────────────────────────────────

/*

// Add this button somewhere in your MapView or main hub:

Button(action: {
    // Present ConceptualLearningView
    showConceptualLearning = true
}) {
    HStack(spacing: 12) {
        Image(systemName: "brain.head.profile")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.orange)
        
        VStack(alignment: .leading, spacing: 4) {
            Text("CONCEPTUAL LEARNING")
                .font(.system(size: 16, weight: .black, design: .monospaced))
                .foregroundColor(theme.primaryText)
            
            Text("Learn concepts, not memorization")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(theme.secondaryText)
        }
        
        Spacer()
        
        Image(systemName: "chevron.right")
            .foregroundColor(theme.secondaryText)
    }
    .padding(16)
    .background(Color.orange.opacity(0.1))
    .cornerRadius(12)
    .overlay(
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1.5)
    )
}
.sheet(isPresented: $showConceptualLearning) {
    ConceptualLearningView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
}

*/

// ─────────────────────────────────────────────────────────────────────────────
// OPTION 2: Add to SettingsView.swift
// ─────────────────────────────────────────────────────────────────────────────

/*

// Add a new section to SettingsView:

Section("STUDY RESOURCES") {
    NavigationLink(destination: ConceptualLearningView(accentColor: Color.orange)) {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text("Conceptual Learning Hub")
                    .font(.system(size: 15, weight: .semibold))
                
                Text("Drug stems, body systems, high-risk meds, interactions")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        } icon: {
            Image(systemName: "brain.head.profile")
                .foregroundColor(.orange)
        }
    }
}

*/

// ─────────────────────────────────────────────────────────────────────────────
// OPTION 3: Add as Full-Screen Modal (iPhone / iPad)
// ─────────────────────────────────────────────────────────────────────────────

/*

// In your main view, add a @State variable:
@State private var showConceptualLearning = false

// Add a button:
Button(action: {
    showConceptualLearning = true
}) {
    HStack {
        Image(systemName: "brain.head.profile")
        Text("OPEN CONCEPTUAL LEARNING")
            .font(.system(size: 14, weight: .bold, design: .monospaced))
    }
    .padding()
    .background(Color.orange)
    .foregroundColor(.white)
    .cornerRadius(12)
}

// Add the fullScreenCover:
.fullScreenCover(isPresented: $showConceptualLearning) {
    NavigationStack {
        ConceptualLearningView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        showConceptualLearning = false
                    }
                }
            }
    }
}

*/

// ─────────────────────────────────────────────────────────────────────────────
// OPTION 4: Add to Domain 1 Hub (Recommended)
// ─────────────────────────────────────────────────────────────────────────────

/*

// If you have a Domain 1-specific hub/landing page, add this prominent card:

NavigationLink(destination: ConceptualLearningView(accentColor: KnowledgeDomain.medications.accentColor)) {
    VStack(alignment: .leading, spacing: 12) {
        
        HStack {
            Image(systemName: "brain.head.profile")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("CONCEPTUAL LEARNING")
                    .font(.system(size: 18, weight: .black, design: .monospaced))
                    .foregroundColor(theme.primaryText)
                
                Text("THE RIGHT WAY TO STUDY")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(.orange)
            }
            
            Spacer()
        }
        
        Divider()
            .background(theme.divider)
        
        VStack(alignment: .leading, spacing: 8) {
            FeatureRow(icon: "textformat.abc", text: "Drug Stems — Learn naming patterns")
            FeatureRow(icon: "heart.text.square.fill", text: "Body Systems — Study by what drugs affect")
            FeatureRow(icon: "exclamationmark.triangle.fill", text: "High-Risk Meds — NTI, REMS, ISMP")
            FeatureRow(icon: "arrow.triangle.2.circlepath", text: "Drug Interactions — OTC, Herbals, Rx")
        }
        
        Divider()
            .background(theme.divider)
        
        Text("💡 Concepts first, drugs second. This is how you pass the PTCE.")
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(theme.secondaryText)
            .lineSpacing(3)
    }
    .padding(20)
    .background(theme.surface)
    .cornerRadius(16)
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.4), lineWidth: 2)
    )
    .shadow(color: Color.orange.opacity(0.2), radius: 12, y: 6)
}

*/

// ─────────────────────────────────────────────────────────────────────────────
// Helper View for Feature Rows
// ─────────────────────────────────────────────────────────────────────────────

struct FeatureRow: View {
    @Environment(\.appTheme) private var theme
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.orange.opacity(0.8))
                .frame(width: 24)
            
            Text(text)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(theme.primaryText.opacity(0.85))
        }
    }
}

// ─────────────────────────────────────────────────────────────────────────────
// TESTING IN PREVIEW
// ─────────────────────────────────────────────────────────────────────────────

#Preview("Conceptual Learning Hub") {
    ConceptualLearningView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}

#Preview("Drug Stems") {
    DrugStemsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}

#Preview("Body Systems") {
    BodySystemsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}

#Preview("High-Risk Meds") {
    HighRiskMedicationsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}

#Preview("Drug Interactions") {
    DrugInteractionsView(accentColor: Color(red: 1.0, green: 0.65, blue: 0.0))
        .environment(\.appTheme, .dark)
}

// ─────────────────────────────────────────────────────────────────────────────
// END OF QUICK-START INTEGRATION
// ─────────────────────────────────────────────────────────────────────────────

/*

NOTES:

1. All views are fully self-contained and don't require GameEngine or SwiftData.
2. They use the existing AppTheme environment for light/dark mode support.
3. The accentColor is passed as a parameter (use Domain 1's orange/amber color).
4. All data is in static databases — no network calls, no persistence (yet).
5. Views are optimized for iPhone and iPad — responsive layouts.

NEXT STEPS:

- Copy one of the integration snippets above into your project
- Test in Xcode Preview or Simulator
- Customize colors, fonts, or spacing to match your brand
- Add progress tracking if desired (SwiftData models)
- Expand databases with more stems, meds, or interactions

ENJOY! 🚀

*/
