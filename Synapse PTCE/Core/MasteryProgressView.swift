//
//  MasteryProgressView.swift
//  Synapse PTCE
//
//  Visual readouts for the spaced-repetition concept-mastery system.
//  Shows the weighted "truly learned" percentage as the primary signal,
//  with per-domain breakdowns and distribution across mastery stages.
//

import SwiftUI

// MARK: - Compact card

/// Compact card for placement on the home hub.
/// Displays the weighted truly-learned percentage and a single-line summary.
struct MasteryProgressCard: View {

    let snapshot: GlobalMasterySnapshot
    var onTap: (() -> Void)? = nil

    private let amber  = Color(red: 0.945, green: 0.730, blue: 0.450)
    private let panel  = Color(red: 0.075, green: 0.072, blue: 0.090)
    private let muted  = Color(red: 0.78, green: 0.74, blue: 0.66)
    private let stroke = Color(red: 0.945, green: 0.730, blue: 0.450).opacity(0.20)

    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 16) {
                // Concentric ring meter
                ZStack {
                    Circle()
                        .stroke(amber.opacity(0.12), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: max(0.001, snapshot.weightedPercent))
                        .stroke(amber, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    VStack(spacing: 0) {
                        Text("\(Int((snapshot.weightedPercent * 100).rounded()))")
                            .font(.system(size: 16, weight: .heavy, design: .monospaced))
                            .foregroundColor(amber)
                        Text("%")
                            .font(.system(size: 8, weight: .bold, design: .monospaced))
                            .foregroundColor(amber.opacity(0.7))
                            .offset(y: -1)
                    }
                }
                .frame(width: 54, height: 54)

                VStack(alignment: .leading, spacing: 4) {
                    Text("TRULY LEARNED")
                        .font(.system(size: 10, weight: .heavy, design: .monospaced))
                        .tracking(1.5)
                        .foregroundColor(amber)

                    Text("\(snapshot.trulyLearned) of \(snapshot.totalConcepts) concepts")
                        .font(.system(size: 12, weight: .medium, design: .monospaced))
                        .foregroundColor(muted.opacity(0.85))

                    if snapshot.dueForReview > 0 {
                        HStack(spacing: 4) {
                            Image(systemName: "bell.badge.fill")
                                .font(.system(size: 9))
                            Text("\(snapshot.dueForReview) due for review")
                                .font(.system(size: 10, weight: .medium, design: .monospaced))
                        }
                        .foregroundColor(Color(red: 0.95, green: 0.78, blue: 0.45))
                    } else {
                        Text("No reviews due")
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                            .foregroundColor(muted.opacity(0.5))
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(amber.opacity(0.5))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                LinearGradient(
                    colors: [panel, panel.opacity(0.7)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(stroke, lineWidth: 1)
            )
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Detail view

/// Full-screen mastery readout. Per-domain bars + stage distribution +
/// due-for-review count + a button to drill due concepts.
struct MasteryDetailView: View {

    let snapshot: GlobalMasterySnapshot
    let onDismiss: () -> Void

    private let bg          = Color(red: 0.055, green: 0.058, blue: 0.070)
    private let panel       = Color(red: 0.085, green: 0.082, blue: 0.100)
    private let amber       = Color(red: 0.945, green: 0.730, blue: 0.450)
    private let sceneText   = Color(red: 0.795, green: 0.745, blue: 0.660)
    private let muted       = Color(red: 0.55, green: 0.52, blue: 0.48)
    private let divider     = Color(white: 0.18)

    var body: some View {
        ZStack {
            // Atmospheric background
            LinearGradient(
                colors: [
                    Color(red: 0.045, green: 0.040, blue: 0.062),
                    Color(red: 0.082, green: 0.062, blue: 0.108)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()
                BighornRidge(seed: 19, peakHeight: 0.45)
                    .fill(Color(red: 0.025, green: 0.022, blue: 0.040))
                    .frame(height: 70)
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                topChrome
                Divider().background(divider)

                ScrollView {
                    VStack(spacing: 18) {
                        bigMeter
                        stagesBlock
                        domainsBlock
                        legendBlock
                        Color.clear.frame(height: 80)
                    }
                    .padding(.horizontal, 22)
                    .padding(.vertical, 22)
                }
            }
        }
    }

    // MARK: Top chrome

    private var topChrome: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 3) {
                Text("MASTERY")
                    .font(.system(size: 11, weight: .heavy, design: .monospaced))
                    .tracking(1.6)
                    .foregroundColor(amber.opacity(0.9))
                Text("Spaced repetition · ≥2 corrects on different days = truly learned")
                    .font(.system(size: 10, weight: .medium, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.55))
                    .tracking(0.5)
            }
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(sceneText.opacity(0.65))
                    .padding(10)
                    .background(Color.black.opacity(0.30))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
        .background(bg.opacity(0.85))
    }

    // MARK: Big meter

    private var bigMeter: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .stroke(amber.opacity(0.10), lineWidth: 12)
                    .frame(width: 180, height: 180)
                Circle()
                    .trim(from: 0, to: max(0.001, snapshot.weightedPercent))
                    .stroke(amber, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .frame(width: 180, height: 180)
                    .rotationEffect(.degrees(-90))
                    .shadow(color: amber.opacity(0.4), radius: 10)

                VStack(spacing: 0) {
                    Text("\(Int((snapshot.weightedPercent * 100).rounded()))")
                        .font(.system(size: 56, weight: .heavy, design: .monospaced))
                        .foregroundColor(amber)
                    Text("%")
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .foregroundColor(amber.opacity(0.7))
                        .offset(y: -8)

                    Text("PTCB BLUEPRINT")
                        .font(.system(size: 8, weight: .heavy, design: .monospaced))
                        .tracking(1.4)
                        .foregroundColor(sceneText.opacity(0.55))
                        .padding(.top, 2)
                }
            }

            Text("\(snapshot.trulyLearned) of \(snapshot.totalConcepts) concepts truly learned")
                .font(.system(size: 13, weight: .semibold, design: .monospaced))
                .foregroundColor(sceneText)

            if snapshot.dueForReview > 0 {
                HStack(spacing: 6) {
                    Image(systemName: "bell.badge.fill")
                        .font(.system(size: 11))
                    Text("\(snapshot.dueForReview) concept\(snapshot.dueForReview == 1 ? "" : "s") due for review today")
                        .font(.system(size: 12, weight: .semibold, design: .monospaced))
                }
                .foregroundColor(Color(red: 0.95, green: 0.78, blue: 0.45))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color(red: 0.95, green: 0.78, blue: 0.45).opacity(0.10))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(red: 0.95, green: 0.78, blue: 0.45).opacity(0.4), lineWidth: 1)
                )
                .cornerRadius(6)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
    }

    // MARK: Stages

    private var stagesBlock: some View {
        let totals = totalsByStage()
        return VStack(alignment: .leading, spacing: 12) {
            sectionHeader("STAGES", "concepts at each mastery level")

            VStack(spacing: 8) {
                ForEach([MasteryStage.unseen, .introduced, .practicing, .learning, .learned, .mastered], id: \.self) { stage in
                    let count = totals[stage] ?? 0
                    let percent = snapshot.totalConcepts > 0
                        ? Double(count) / Double(snapshot.totalConcepts)
                        : 0
                    stageRow(stage: stage, count: count, percent: percent)
                }
            }
        }
        .padding(16)
        .background(panel)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(amber.opacity(0.18), lineWidth: 1)
        )
        .cornerRadius(10)
    }

    private func stageRow(stage: MasteryStage, count: Int, percent: Double) -> some View {
        HStack(spacing: 10) {
            Circle()
                .fill(stage.color)
                .frame(width: 8, height: 8)

            Text(stage.label.uppercased())
                .font(.system(size: 10, weight: .heavy, design: .monospaced))
                .tracking(1.2)
                .foregroundColor(sceneText.opacity(0.85))
                .frame(width: 90, alignment: .leading)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.04))
                        .frame(height: 5)
                    Rectangle()
                        .fill(stage.color.opacity(0.85))
                        .frame(width: geo.size.width * percent, height: 5)
                }
                .cornerRadius(2.5)
            }
            .frame(height: 5)

            Text("\(count)")
                .font(.system(size: 11, weight: .heavy, design: .monospaced))
                .foregroundColor(sceneText.opacity(0.85))
                .frame(width: 36, alignment: .trailing)
        }
    }

    private func totalsByStage() -> [MasteryStage: Int] {
        var totals: [MasteryStage: Int] = [:]
        var totalRecorded = 0
        for snap in snapshot.perDomain.values {
            totals[.introduced, default: 0] += snap.introduced
            totals[.practicing, default: 0] += snap.practicing
            totals[.learning, default: 0]   += snap.learning
            totals[.learned, default: 0]    += snap.learned
            totals[.mastered, default: 0]   += snap.mastered
            totalRecorded += snap.anyProgressCount
        }
        totals[.unseen] = max(0, snapshot.totalConcepts - totalRecorded)
        return totals
    }

    // MARK: Domains

    private var domainsBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("BY DOMAIN", "PTCB blueprint weighting in parentheses")

            VStack(spacing: 10) {
                ForEach(KnowledgeDomain.allCases) { domain in
                    if let snap = snapshot.perDomain[domain] {
                        domainRow(snap)
                    }
                }
            }
        }
        .padding(16)
        .background(panel)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(amber.opacity(0.18), lineWidth: 1)
        )
        .cornerRadius(10)
    }

    private func domainRow(_ snap: DomainMasterySnapshot) -> some View {
        let percent = snap.trulyLearnedPercent
        let weightLabel = String(format: "%.0f%%", snap.domain.examWeight * 100)

        return VStack(alignment: .leading, spacing: 5) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: snap.domain.icon)
                        .font(.system(size: 10))
                        .foregroundColor(snap.domain.accentColor)
                    Text(snap.domain.shortName.uppercased())
                        .font(.system(size: 10, weight: .heavy, design: .monospaced))
                        .tracking(1.2)
                        .foregroundColor(sceneText.opacity(0.95))
                    Text("(\(weightLabel))")
                        .font(.system(size: 9, weight: .medium, design: .monospaced))
                        .foregroundColor(sceneText.opacity(0.5))
                }

                Spacer()

                Text("\(snap.trulyLearned) / \(snap.totalConcepts)")
                    .font(.system(size: 10, weight: .heavy, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.85))
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.white.opacity(0.04))
                        .frame(height: 6)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    snap.domain.accentColor.opacity(0.7),
                                    snap.domain.accentColor
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * percent, height: 6)
                }
                .cornerRadius(3)
            }
            .frame(height: 6)
        }
    }

    // MARK: Legend

    private var legendBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionHeader("HOW IT WORKS", nil)

            VStack(alignment: .leading, spacing: 6) {
                legendRow("First correct answer →", "concept becomes Practicing")
                legendRow("Second correct, same day →", "Learning")
                legendRow("Second correct, ≥1 day later →", "Learned (counts toward %)")
                legendRow("4+ corrects spanning ≥7 days →", "Mastered")
                legendRow("Wrong answer →", "concept returns to review queue tomorrow")
            }
        }
        .padding(16)
        .background(panel)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(amber.opacity(0.18), lineWidth: 1)
        )
        .cornerRadius(10)
    }

    private func legendRow(_ trigger: String, _ result: String) -> some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: "arrow.right")
                .font(.system(size: 8))
                .foregroundColor(amber.opacity(0.6))
                .padding(.top, 4)
            VStack(alignment: .leading, spacing: 1) {
                Text(trigger)
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.85))
                Text(result)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(sceneText.opacity(0.65))
            }
        }
    }

    // MARK: Helpers

    private func sectionHeader(_ title: String, _ subtitle: String?) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 10, weight: .heavy, design: .monospaced))
                .tracking(1.5)
                .foregroundColor(amber.opacity(0.85))
            if let subtitle {
                Text(subtitle)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(sceneText.opacity(0.55))
            }
        }
    }
}
