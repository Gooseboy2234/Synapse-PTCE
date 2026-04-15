//
//  Domain3c_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 3 Gap Fill: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  1 node covering the FMEA vs. RCA distinction — a specific PTCB favorite that tests
//  whether students know the difference between proactive and reactive quality tools.
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
            > SECTOR-03 // SAFETY_OPS
            > TOPIC: Quality Improvement Tools — FMEA vs. Root Cause Analysis
            >
            > *** THE KEY DISTINCTION: PROACTIVE vs. REACTIVE ***
            >
            > FMEA — FAILURE MODE AND EFFECTS ANALYSIS:
            >   WHEN USED: PROACTIVELY — BEFORE a problem occurs.
            >   PURPOSE: Identify all the ways a process COULD fail and assess the
            >     potential impact of each failure — then implement safeguards.
            >   TRIGGER: New process implementation, system redesign, new technology,
            >     identified high-risk workflow (e.g., going live with a new IV pump).
            >   PROCESS:
            >     1. Map out every step of the process.
            >     2. For each step: identify potential failure modes ("what could go wrong?")
            >     3. Assess: Severity × Probability × Detectability = Risk Priority Number (RPN)
            >     4. Address failures with the highest RPN scores first.
            >   THINK: "Let's find the holes BEFORE something goes wrong."
            >
            > ROOT CAUSE ANALYSIS (RCA):
            >   WHEN USED: REACTIVELY — AFTER an error or adverse event has occurred.
            >   PURPOSE: Identify the UNDERLYING system causes of an error (NOT to
            >     blame individuals) and implement changes to prevent recurrence.
            >   TRIGGER: Sentinel event, serious medication error, near-miss, patient harm.
            >   TOOLS:
            >     "5 Whys" — ask "why?" repeatedly until the root cause is found
            >     Fishbone diagram (Ishikawa/cause-and-effect) — categories: people,
            >     process, equipment, environment, policies
            >     Timeline analysis
            >   THINK: "What went wrong and why did the system allow it to happen?"
            >
            > MEMORY AID:
            >   FMEA = Future / Forward-looking = Proactive
            >   RCA  = Retrospective / Rear-looking = Reactive
            >
            > Both are mandated by The Joint Commission (TJC) as quality improvement tools.
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
