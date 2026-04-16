//
//  Domain3c_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 3 Gap Fill: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  1 node — plain-English loreText rewrite for maximum readability.
//

import Foundation

extension DataNode {

    // MARK: - Domain 3c Node Set

    static let domain3cNodes: [DataNode] = [

        // ── 23 ── FMEA vs. ROOT CAUSE ANALYSIS ──────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "FMEA vs RCA",
            loreText: """
            > FMEA and RCA are both quality improvement tools used in healthcare — but they answer completely different questions at completely different times.
            > THE KEY DISTINCTION: one looks FORWARD (before problems happen), the other looks BACKWARD (after something went wrong).
            > FMEA — FAILURE MODE AND EFFECTS ANALYSIS:
            > Used PROACTIVELY — BEFORE an error has occurred
            > Ask yourself: "What COULD go wrong with this process?"
            > When do you use it? When implementing a new system, redesigning a workflow, bringing in a new piece of equipment, or when you identify a high-risk process that hasn't caused harm yet but looks dangerous.
            > HOW FMEA WORKS: You map out every step of a process. For each step, you ask: What are all the ways this could fail? For each failure mode, you score three things: How BAD would it be (severity)? How LIKELY is it to happen (probability)? How EASY would it be to catch before it hurts someone (detectability)? Multiply these three scores together → Risk Priority Number (RPN). Address the highest RPN failure modes first.
            > Memory hook: FMEA = Future-looking = Forward-thinking = Proactive. "Find problems BEFORE they find patients."
            > RCA — ROOT CAUSE ANALYSIS:
            > Used REACTIVELY — AFTER a serious error or adverse event has already occurred
            > Ask yourself: "What actually went wrong and WHY did the system allow it?"
            > Triggered by: a sentinel event, a serious medication error, a patient injury, or a significant near-miss.
            > TOOLS used in RCA: The "5 Whys" (keep asking "why?" until you reach the root cause), Fishbone/Ishikawa diagrams (organize causes into categories: people, process, equipment, environment, policies).
            > RCA focuses on SYSTEMS, not individuals — the goal is fixing the system so the same error can't happen again.
            > Memory hook: RCA = Rear-looking = Reactive = Retrospective. "Figure out what went wrong AFTER it happened."
            > Both tools are required by The Joint Commission (TJC) as part of a hospital or pharmacy's quality improvement program.
            > KEY: FMEA = proactive (before errors happen). RCA = reactive (after errors happen). FMEA prevents, RCA investigates.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Root Cause Analysis (RCA) — investigating the underlying cause of a known error",
                "B) Failure Mode and Effects Analysis (FMEA) — proactively identifying failure points before harm occurs",
                "C) A retrospective audit — reviewing past dispensing records for inaccuracies",
                "D) A concurrent drug utilization review (DUR) — checking appropriateness at time of dispensing"
            ],
            correctAnswer: "B) Failure Mode and Effects Analysis (FMEA) — proactively identifying failure points before harm occurs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.93
        )

    ] // end domain3cNodes
}
