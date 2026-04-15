//
//  Domain2c_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 2 Gap Fill: Federal Requirements (18.75% of 2026 PTCB Exam)
//  1 node covering the foundational principle that the PTCB tests on nearly every exam:
//  the relationship between state and federal pharmacy law (stricter law applies).
//

import Foundation

extension DataNode {

    // MARK: - Domain 2c Node Set

    static let domain2cNodes: [DataNode] = [

        // ── 21 ── STATE vs. FEDERAL LAW ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "STATE vs FEDERAL LAW",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > TOPIC: Relationship Between State and Federal Pharmacy Law
            >
            > THE FOUNDATIONAL PRINCIPLE:
            >   Federal law establishes the MINIMUM national standard.
            >   States may enact MORE RESTRICTIVE laws — and when they do,
            >   the STRICTER (more restrictive) law ALWAYS applies.
            >
            >   Federal law = the floor (minimum requirement)
            >   State law = may build higher than the floor, but not lower
            >
            > EXAMPLES WHERE STATE IS STRICTER (follow state law):
            >   Record Retention:
            >     Federal minimum: 2 years for CS records
            >     Some states: 5–7 years → follow state's longer requirement
            >
            >   Refill Limitations:
            >     Federal: CIII/CIV up to 5 refills within 6 months
            >     Some states: limit CIV to 4 refills → follow state
            >
            >   Schedule V OTC Sales:
            >     Federal: certain CV cough preparations may be sold OTC
            >     Some states: require Rx for ALL controlled substances → follow state
            >
            >   Pharmacist-to-Technician Ratios:
            >     Federal: no specific ratio mandated
            >     States specify ratios (e.g., 1:2 or 1:3) → follow state
            >
            >   Marijuana (Cannabis):
            >     Federal: Schedule I — no accepted medical use (federal law)
            >     Many states: legal medically and/or recreationally
            >     Pharmacists in federally regulated settings (VA, federal hospitals)
            >     MUST follow federal law regardless of state legalization.
            >
            > KEY EXAM RULE:
            >   When a question presents a conflict between state and federal law,
            >   the answer is ALWAYS: follow the MORE RESTRICTIVE (stricter) standard.
            >
            > EXCEPTION CONCEPT: A state CANNOT have a law LESS restrictive than federal
            >   law in controlled substance regulation. (Supremacy Clause limits this.)
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Federal law — federal law always supersedes state pharmacy regulations",
                "B) The state law — because it is more restrictive, the stricter standard applies",
                "C) The less restrictive rule — to avoid burdening pharmacies unnecessarily",
                "D) Neither — state and federal CS rules are parallel independent systems"
            ],
            correctAnswer: "B) The state law — because it is more restrictive, the stricter standard applies",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.92
        )

    ] // end domain2cNodes
}
