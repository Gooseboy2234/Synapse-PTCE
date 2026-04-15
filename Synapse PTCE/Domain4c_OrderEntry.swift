//
//  Domain4c_OrderEntry.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 4 Gap Fill: Order Entry & Processing (22.5% of 2026 PTCB Exam)
//  2 nodes covering the remaining math gaps:
//  specific gravity (weight/volume conversions in compounding) and
//  body surface area (BSA) calculations for chemotherapy dosing.
//

import Foundation

extension DataNode {

    // MARK: - Domain 4c Node Set

    static let domain4cNodes: [DataNode] = [

        // ── 25 ── SPECIFIC GRAVITY ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "SPECIFIC GRAVITY",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Specific Gravity — Weight/Volume Conversions in Compounding
            >
            > DEFINITION:
            >   Specific gravity (SG) is the ratio of a substance's density to the density
            >   of water at the same temperature.
            >   Water at 4°C = 1.0 g/mL (the reference standard).
            >
            >   SG = mass (g) ÷ volume (mL)
            >
            >   For pharmaceutical liquids, SG ≈ density in g/mL
            >   (since water = 1.0 g/mL exactly at reference conditions).
            >
            > COMMON SPECIFIC GRAVITIES:
            >   Water:              SG = 1.000 g/mL
            >   Glycerin:           SG = 1.250 g/mL  (denser than water)
            >   Ethanol (alcohol):  SG = 0.816 g/mL  (less dense than water)
            >   Syrup USP:          SG = 1.313 g/mL
            >   Castor oil:         SG = 0.960 g/mL
            >   Isopropyl alcohol:  SG = 0.785 g/mL
            >
            > CONVERSION FORMULAS:
            >   Weight (g) = Volume (mL) × SG
            >   Volume (mL) = Weight (g) ÷ SG
            >
            > WORKED EXAMPLE 1 (volume → weight):
            >   How many grams does 80 mL of glycerin (SG 1.25) weigh?
            >   Weight = 80 mL × 1.25 g/mL = 100 g
            >
            > WORKED EXAMPLE 2 (weight → volume):
            >   A formula requires 50 g of glycerin (SG 1.25). What volume should be measured?
            >   Volume = 50 g ÷ 1.25 g/mL = 40 mL
            >
            > WHY IT MATTERS:
            >   Compounding formulas often call for ingredients BY WEIGHT (grams),
            >   but measuring equipment is often VOLUMETRIC (mL graduates).
            >   SG bridges the two measurement systems.
            >
            > > QUERY: A compounding formula calls for 37.5 g of glycerin (SG = 1.25).
            > > How many mL should the technician measure?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 25 mL",
                "B) 30 mL",
                "C) 46.9 mL",
                "D) 50 mL"
            ],
            correctAnswer: "B) 30 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.93
        ),

        // ── 26 ── BODY SURFACE AREA (BSA) ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "BSA CALCULATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Body Surface Area (BSA) — Chemotherapy and Pediatric Dosing
            >
            > WHY BSA?
            >   BSA-based dosing is used for chemotherapy and some pediatric medications
            >   because it better accounts for patient size and correlates with
            >   cardiac output, renal/hepatic clearance, and drug distribution volume.
            >
            > MOSTELLER FORMULA (most commonly used in pharmacy):
            >   BSA (m²) = √ [ Height (cm) × Weight (kg) ÷ 3600 ]
            >
            >   Or equivalently using square root:
            >   BSA = SQRT( (ht_cm × wt_kg) / 3600 )
            >
            > WORKED EXAMPLE:
            >   Patient: 170 cm tall, 70 kg
            >   BSA = √ (170 × 70 ÷ 3600)
            >       = √ (11,900 ÷ 3600)
            >       = √ 3.306
            >       = 1.82 m²
            >
            > CALCULATING THE DOSE:
            >   Dose = (mg/m²) × BSA (m²)
            >
            >   Example: Carboplatin ordered at 300 mg/m² for a patient with BSA 1.8 m²
            >   Dose = 300 mg/m² × 1.8 m² = 540 mg
            >
            > AVERAGE ADULT BSA: approximately 1.7–1.8 m²
            >
            > TECHNICIAN ROLE IN BSA DOSING:
            >   — Verify patient height and weight are recorded in the correct units
            >     (cm and kg — not inches and pounds)
            >   — Calculate BSA using the formula; confirm pharmacist verification
            >   — Flag any significant changes in weight that would change the BSA
            >     and potentially the dose
            >
            > > QUERY: A patient is 160 cm tall and weighs 64 kg.
            > > Using the Mosteller formula, what is their approximate BSA?
            > > [Hint: √(160 × 64 ÷ 3600)]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 1.19 m²",
                "B) 1.40 m²",
                "C) 1.69 m²",
                "D) 2.05 m²"
            ],
            correctAnswer: "C) 1.69 m²",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.93
        )

    ] // end domain4cNodes
}
