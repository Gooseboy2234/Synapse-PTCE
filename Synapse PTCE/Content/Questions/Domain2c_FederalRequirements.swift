//
//  Domain2c_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 2 Gap Fill: Federal Requirements (18.75% of 2026 PTCB Exam)
//  1 node — plain-English loreText rewrite for maximum readability.
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
            > Federal pharmacy law sets the MINIMUM national standard — the rules every state must follow at a bare minimum. But states can go further and be MORE restrictive than federal law. When they do, the stricter rule wins.
            > Think of it like a building code: the federal code sets the minimum safety standards. A state can say "we require even stronger standards here." But a state CANNOT lower the bar below the federal minimum.
            > THE KEY EXAM RULE: When state law is MORE restrictive than federal law → FOLLOW THE STATE LAW.
            > REAL EXAMPLES where state law is stricter:
            > Record Retention: Federal minimum = 2 years for controlled substance records. Some states require 5–7 years → follow state's longer requirement.
            > Refill Limits: Federal: CIII/CIV up to 5 refills within 6 months. Some states allow only 4 refills for CIV medications → follow state's lower limit.
            > Schedule V OTC: Federal law allows some CV cough preparations without a prescription. Some states require a Rx for ALL controlled substances → follow state.
            > Pharmacist-to-Tech Ratios: Federal law sets no specific ratio. States set their own (e.g., 1 pharmacist per 2 technicians) → follow state.
            > MARIJUANA: Federal = Schedule I. Many states have legalized it. But pharmacies operating in federally regulated settings (VA hospitals, military facilities, federal prisons) MUST follow federal law — marijuana is still Schedule I there.
            > WHAT IF STATE IS LESS RESTRICTIVE THAN FEDERAL? Federal law wins. A state cannot legalize something that federal law prohibits at the federal level of enforcement.
            > KEY: Stricter law always applies. State can be MORE restrictive than federal, never less. On any PTCB question presenting a conflict → choose the more restrictive standard.
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
