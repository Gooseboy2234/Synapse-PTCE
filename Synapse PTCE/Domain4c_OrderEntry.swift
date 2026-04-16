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
            > When you compound a medication, a formula might say "use 40 grams
            > of glycerin." But glycerin is a liquid — how do you measure 40 grams
            > in a graduated cylinder marked in milliliters?
            >
            > The answer is specific gravity (SG): a number that tells you how
            > dense a liquid is compared to water. Water = 1.0 g/mL exactly.
            >
            > A liquid denser than water has SG > 1.0 (like glycerin at 1.25).
            > A liquid lighter than water has SG < 1.0 (like alcohol at 0.816).
            >
            > WHAT SG MEANS PRACTICALLY:
            >   If SG = 1.25, then every 1 mL of that liquid weighs 1.25 grams.
            >   If SG = 0.816, then every 1 mL weighs only 0.816 grams.
            >
            > THE TWO FORMULAS:
            >   Weight (g) = Volume (mL) × SG      ← volume → weight
            >   Volume (mL) = Weight (g) ÷ SG      ← weight → volume
            >
            > WORKED EXAMPLE (volume → weight):
            >   How much does 80 mL of glycerin (SG 1.25) weigh?
            >   Weight = 80 mL × 1.25 g/mL = 100 g
            >
            > WORKED EXAMPLE (weight → volume):
            >   A formula calls for 50 g of glycerin (SG 1.25). How many mL?
            >   Volume = 50 g ÷ 1.25 g/mL = 40 mL
            >
            > COMMON VALUES TO KNOW:
            >   Water: 1.000    Glycerin: 1.250    Ethanol: 0.816
            >   Syrup USP: 1.313    Isopropyl alcohol: 0.785
            >
            > NOW YOU TRY:
            >   Formula calls for 37.5 g of glycerin (SG = 1.25).
            >   Volume = 37.5 g ÷ 1.25 g/mL = 30 mL
            >
            > KEY: Volume = Weight ÷ SG. Weight = Volume × SG.
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
            > For most medications, the dose is based on body weight (mg/kg).
            > But chemotherapy drugs and some pediatric medications are dosed
            > based on Body Surface Area (BSA) — measured in square meters (m²).
            >
            > WHY USE BSA INSTEAD OF WEIGHT?
            >   Drug clearance through the kidneys and liver correlates better
            >   with body surface area than weight alone. A tall, lean person and
            >   a short, stocky person might weigh the same but have very different
            >   surface areas — and very different drug metabolism.
            >
            > THE MOSTELLER FORMULA (most common on the PTCE):
            >   BSA (m²) = √ [ Height (cm) × Weight (kg) ÷ 3600 ]
            >
            >   Both measurements MUST be in metric units:
            >   height in CENTIMETERS and weight in KILOGRAMS.
            >
            > WORKED EXAMPLE:
            >   Patient: 170 cm tall, 70 kg
            >   Step 1: 170 × 70 = 11,900
            >   Step 2: 11,900 ÷ 3600 = 3.306
            >   Step 3: √3.306 = 1.82 m²
            >
            > CALCULATING THE DOSE FROM BSA:
            >   Dose (mg) = Ordered dose (mg/m²) × Patient's BSA (m²)
            >   Example: carboplatin 300 mg/m² for BSA 1.8 m² → 300 × 1.8 = 540 mg
            >
            > AVERAGE ADULT BSA: approximately 1.7–1.8 m²
            >
            > NOW YOU TRY:
            >   Patient: 160 cm, 64 kg. What is their BSA (Mosteller)?
            >   Step 1: 160 × 64 = 10,240
            >   Step 2: 10,240 ÷ 3,600 = 2.844
            >   Step 3: √2.844 ≈ 1.69 m²
            >
            > KEY: BSA = √(height_cm × weight_kg ÷ 3600). Average adult ≈ 1.7–1.8 m²
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
