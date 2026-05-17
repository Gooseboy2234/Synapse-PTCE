import Foundation

// Multi-Angle Phase 10 — Order Entry / Math Gap Fill
// 14 nodes — all with full MCQ content

let multiAngleNodes_D4c: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "HEPARIN WEIGHT-BASED DOSING",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > HEPARIN PROTOCOL: Weight-based bolus + infusion; typical protocol: 80 units/kg bolus, then 18 units/kg/hr.
        > EXAMPLE: 70 kg patient.
        >   Bolus: 80 × 70 = 5,600 units IV push
        >   Infusion: 18 × 70 = 1,260 units/hr
        > MONITORING: aPTT (goal 60–100 sec); anti-Xa levels for some protocols.
        > HIGH-ALERT: Heparin is a leading cause of medication errors — weight must be verified.
        > NEVER: Abbreviate "U" for units (may be read as "0") — always write "units."
        """,
        challengeType: .multipleChoice,
        options: [
            "A. For an 85 kg patient, the heparin bolus at 80 units/kg is 6,400 units and infusion at 18 units/kg/hr is 1,400 units/hr",
            "B. For an 85 kg patient, the heparin bolus at 80 units/kg is 6,800 units and infusion at 18 units/kg/hr is 1,530 units/hr",
            "C. For an 85 kg patient, the heparin bolus at 80 units/kg is 5,600 units and infusion at 18 units/kg/hr is 1,260 units/hr",
            "D. Heparin dosing is fixed (not weight-based) at 5,000 units bolus and 1,000 units/hr for all adults"
        ],
        correctAnswer: "B. For an 85 kg patient, the heparin bolus at 80 units/kg is 6,800 units and infusion at 18 units/kg/hr is 1,530 units/hr",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.10,
        angle: .dosing,
        baseConceptTitle: "HEPARIN WEIGHT-BASED"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "mEq TO mg — ELECTROLYTE CONVERSION",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: mEq = (mg × valence) / molecular weight
        > POTASSIUM (KCl): MW = 74.5 g/mol; valence = 1
        >   1 mEq K⁺ = 74.5/1 = 74.5 mg of KCl
        >   20 mEq KCl = 20 × 74.5 = 1,490 mg
        > SODIUM (NaCl): MW = 58.4 g/mol; valence = 1
        >   1 mEq Na⁺ = 58.4 mg NaCl
        > CALCIUM GLUCONATE: MW = 430; valence = 2
        >   1 mEq Ca²⁺ = 430/2 = 215 mg calcium gluconate
        > MAGNESIUM SULFATE: 1 g MgSO₄ = 8.1 mEq
        """,
        challengeType: .multipleChoice,
        options: [
            "A. 40 mEq of KCl equals 1,000 mg because potassium's equivalent weight is 25 mg/mEq",
            "B. 40 mEq of KCl equals 2,980 mg (40 × 74.5 mg/mEq); 1 g MgSO₄ = 8.1 mEq magnesium",
            "C. 40 mEq of KCl equals 400 mg because 1 mEq = 10 mg for all electrolytes",
            "D. 20 mEq of sodium chloride equals 1,168 mg (20 × 58.4 mg/mEq)"
        ],
        correctAnswer: "B. 40 mEq of KCl equals 2,980 mg (40 × 74.5 mg/mEq); 1 g MgSO₄ = 8.1 mEq magnesium",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.10,
        angle: .dosing,
        baseConceptTitle: "mEq TO mg CONVERSION"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "TPN — CALORIC CALCULATION",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > TPN MACRONUTRIENTS:
        >   Dextrose: 3.4 kcal/g
        >   Lipids (20%): 2 kcal/mL (10%: 1.1 kcal/mL)
        >   Amino acids: 4 kcal/g
        > EXAMPLE: TPN with 250 g dextrose + 60 g amino acids + 250 mL 20% lipids:
        >   Dextrose: 250 × 3.4 = 850 kcal
        >   AA: 60 × 4 = 240 kcal
        >   Lipids: 250 × 2 = 500 kcal
        >   Total = 1,590 kcal/day
        > PROTEIN: Calculate separately in g/kg/day (typical: 1.2–2 g/kg/day for stressed patients).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A TPN bag with 200 g dextrose, 50 g amino acids, and 300 mL 20% lipids provides 1,480 kcal",
            "B. A TPN bag with 200 g dextrose, 50 g amino acids, and 300 mL 20% lipids provides 1,480 kcal: dextrose 680 + AA 200 + lipids 600",
            "C. A TPN bag with 200 g dextrose provides 800 kcal because dextrose yields 4 kcal/g",
            "D. Lipid emulsion (20%) provides 1.1 kcal/mL, so 300 mL provides 330 kcal"
        ],
        correctAnswer: "B. A TPN bag with 200 g dextrose, 50 g amino acids, and 300 mL 20% lipids provides 1,480 kcal: dextrose 680 + AA 200 + lipids 600",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.22,
        angle: .dosing,
        baseConceptTitle: "TPN CALORIES"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "IV FLOW RATE — DROP FACTOR",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: gtt/min = (Volume mL × Drop Factor gtt/mL) / Time in minutes
        > MACRODRIP: 10, 15, or 20 gtt/mL
        > MICRODRIP: 60 gtt/mL (1 mL = 60 drops; gtt/min = mL/hr)
        > EXAMPLE: Infuse 1,000 mL NS over 8 hours using 15 gtt/mL set:
        >   Time = 8 × 60 = 480 min
        >   Rate = (1000 × 15) / 480 = 15,000/480 ≈ 31 gtt/min
        > PUMP RATE: mL/hr = Total volume ÷ Hours
        >   1,000 mL ÷ 8 hr = 125 mL/hr
        """,
        challengeType: .multipleChoice,
        options: [
            "A. To infuse 500 mL over 4 hours using a 20 gtt/mL set: (500 × 20) / 240 = 42 gtt/min",
            "B. To infuse 500 mL over 4 hours using a 20 gtt/mL set: (500 × 20) / 480 = 21 gtt/min",
            "C. To infuse 500 mL over 4 hours using a 20 gtt/mL set: (500 × 20) / 120 = 83 gtt/min",
            "D. With a microdrip set (60 gtt/mL), a rate of 30 mL/hr equals 60 gtt/min"
        ],
        correctAnswer: "A. To infuse 500 mL over 4 hours using a 20 gtt/mL set: (500 × 20) / 240 = 42 gtt/min",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.22,
        angle: .dosing,
        baseConceptTitle: "IV DROP FACTOR"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "INSULIN SYRINGE — UNIT MEASUREMENT",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > INSULIN SYRINGES: Calibrated in units, not mL — designed for U-100 insulin.
        > U-100 INSULIN: 100 units per mL.
        > SYRINGE SIZES: 30-unit, 50-unit, 100-unit syringes (30G needle standard).
        > CRITICAL: If non-insulin syringe used with U-100 insulin: 1 mL = 100 units (NOT 1 unit).
        > U-500 INSULIN: 500 units/mL — requires special U-500 syringe or insulin pen.
        > DOCUMENTATION: Always document in units, not mL; error source: using mL syringe for units.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A patient prescribed 35 units of U-100 insulin should draw up 3.5 mL in a standard syringe",
            "B. A patient prescribed 35 units of U-100 insulin draws to the 35-unit mark on an insulin syringe; U-100 means 100 units/mL, so 35 units = 0.35 mL",
            "C. U-500 insulin contains 100 units/mL and uses the same syringe as U-100 insulin",
            "D. Insulin should always be measured in mL to avoid unit-based confusion"
        ],
        correctAnswer: "B. A patient prescribed 35 units of U-100 insulin draws to the 35-unit mark on an insulin syringe; U-100 means 100 units/mL, so 35 units = 0.35 mL",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.35,
        angle: .dosing,
        baseConceptTitle: "INSULIN SYRINGE"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "MARKUP MATH — PHARMACY PRICING",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > SELLING PRICE = Cost + Markup (or Cost × (1 + markup%))
        > DISPENSING FEE: Added per prescription regardless of drug cost.
        > EXAMPLE: Drug costs $48.00; 20% markup; $4.50 dispensing fee:
        >   Markup amount = 48 × 0.20 = $9.60
        >   Price = 48 + 9.60 + 4.50 = $62.10
        > % MARKUP vs % MARGIN:
        >   % Markup = (profit/cost) × 100
        >   % Margin = (profit/selling price) × 100
        > DAW CODES: Affect reimbursement — DAW-0 = no DAW; DAW-1 = prescriber requests brand; DAW-2 = patient requests brand.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A drug costing $60 with 25% markup and $3 dispensing fee sells for $75.00",
            "B. A drug costing $60 with 25% markup and $3 dispensing fee sells for $78.00 ($60 + $15 markup + $3 fee)",
            "C. A drug costing $60 with 25% markup and $3 dispensing fee sells for $63.00",
            "D. Markup percentage and margin percentage are mathematically equivalent"
        ],
        correctAnswer: "B. A drug costing $60 with 25% markup and $3 dispensing fee sells for $78.00 ($60 + $15 markup + $3 fee)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.35,
        angle: .dosing,
        baseConceptTitle: "MARKUP MATH"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "INVENTORY TURNOVER RATE",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: Turnover Rate = Annual Purchases ÷ Average Inventory Value
        > EXAMPLE: Annual purchases = $1,200,000; Average inventory = $100,000
        >   Turnover = 1,200,000 ÷ 100,000 = 12 times/year
        > HIGH TURNOVER: Efficient inventory management (less capital tied up).
        > LOW TURNOVER: Overstock, expiring drugs, capital waste.
        > DAYS ON HAND: 365 ÷ Turnover Rate = days of supply on hand
        >   365 ÷ 12 = ~30 days on hand
        > PHARMACY GOAL: Typical turnover 12–15× per year.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. If annual drug purchases total $900,000 and average inventory is $90,000, turnover rate is 100",
            "B. If annual drug purchases total $900,000 and average inventory is $90,000, turnover rate is 10 times/year (365 ÷ 10 = 36.5 days on hand)",
            "C. Turnover rate = average inventory ÷ annual purchases × 100",
            "D. A pharmacy with a turnover rate of 6 is operating optimally with minimal waste"
        ],
        correctAnswer: "B. If annual drug purchases total $900,000 and average inventory is $90,000, turnover rate is 10 times/year (365 ÷ 10 = 36.5 days on hand)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.48,
        angle: .dosing,
        baseConceptTitle: "INVENTORY TURNOVER"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "PERCENTAGE OF ERROR — MEASUREMENT",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: % Error = (Error / Desired) × 100
        > MAXIMUM ALLOWABLE ERROR: Typically ±5% in pharmacy compounding.
        > EXAMPLE: Desired weight = 100 mg; actual weight = 103 mg.
        >   Error = 103 - 100 = 3 mg
        >   % Error = (3/100) × 100 = 3% — within 5% → acceptable
        > EXAMPLE 2: Desired = 200 mg; actual = 194 mg
        >   Error = 6 mg; % Error = (6/200) × 100 = 3% — acceptable
        > SENSITIVITY OF BALANCE: Minimum weighable quantity = (sensitivity ÷ maximum allowable error) × 100
        """,
        challengeType: .multipleChoice,
        options: [
            "A. If desired quantity is 50 mg and measured quantity is 53 mg, the % error is 5.66% (exceeds ±5% limit)",
            "B. If desired quantity is 50 mg and measured quantity is 53 mg, the % error is 6% (3/50 × 100) — exceeds ±5% and is unacceptable",
            "C. If desired quantity is 50 mg and measured quantity is 53 mg, the % error is 3% — within acceptable limits",
            "D. Percentage of error formula uses the actual quantity (not desired) as the denominator"
        ],
        correctAnswer: "B. If desired quantity is 50 mg and measured quantity is 53 mg, the % error is 6% (3/50 × 100) — exceeds ±5% and is unacceptable",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.48,
        angle: .dosing,
        baseConceptTitle: "PERCENTAGE OF ERROR"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "CrCl — COCKCROFT-GAULT (FEMALE)",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > COCKCROFT-GAULT: CrCl (mL/min) = [(140 - age) × weight(kg)] / [72 × SCr] × 0.85 (for females)
        > EXAMPLE: Female, 68 y/o, 60 kg, SCr = 1.2 mg/dL
        >   CrCl = [(140 - 68) × 60] / [72 × 1.2] × 0.85
        >   = [72 × 60] / 86.4 × 0.85
        >   = 4320 / 86.4 × 0.85
        >   = 50 × 0.85 = 42.5 mL/min
        > USE: Dose adjust renally cleared drugs (metformin, digoxin, gabapentin, antibiotics).
        > IBM WEIGHT: Use ideal body weight if patient is obese (unless drug distributes to fat).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 72-year-old female (65 kg, SCr 1.4) has a CrCl of approximately 35 mL/min",
            "B. A 72-year-old female (65 kg, SCr 1.4) has a CrCl of approximately 33 mL/min: [(140-72)×65]/(72×1.4)×0.85 = 4420/100.8×0.85 ≈ 37 mL/min",
            "C. A 72-year-old female (65 kg, SCr 1.4) has a CrCl of approximately 50 mL/min",
            "D. The female correction factor of 0.85 is added, not multiplied, in the Cockcroft-Gault formula"
        ],
        correctAnswer: "A. A 72-year-old female (65 kg, SCr 1.4) has a CrCl of approximately 35 mL/min",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.68,
        angle: .dosing,
        baseConceptTitle: "CrCl FEMALE"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "VANCOMYCIN AUC DOSING",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > MODERN APPROACH: AUC/MIC-guided dosing (target AUC₂₄ 400–600 mg·h/L for MRSA bacteremia).
        > REPLACED: Traditional trough-based monitoring (target trough 15–20 mg/L).
        > TWO-LEVEL AUC: Draw peak (1 hr post-infusion end) and trough — calculate AUC using Bayesian software.
        > WHY: AUC/MIC correlates better with efficacy and limits nephrotoxicity.
        > TYPICAL DOSE: 15–20 mg/kg IV q8–12h (based on renal function).
        > NEPHROTOXICITY: Increased risk with prolonged high troughs; monitor SCr, urine output.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Vancomycin monitoring still uses trough-only targeting with a goal of 10–15 mg/L",
            "B. Modern vancomycin monitoring targets AUC/MIC of 400–600 mg·h/L using two-level Bayesian estimation; this approach better predicts efficacy and reduces nephrotoxicity compared to trough-only monitoring",
            "C. Vancomycin AUC dosing eliminates the need for any serum level monitoring",
            "D. The target AUC/MIC for vancomycin in MRSA bacteremia is 200–300 mg·h/L"
        ],
        correctAnswer: "B. Modern vancomycin monitoring targets AUC/MIC of 400–600 mg·h/L using two-level Bayesian estimation; this approach better predicts efficacy and reduces nephrotoxicity compared to trough-only monitoring",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.68,
        angle: .dosing,
        baseConceptTitle: "VANCOMYCIN AUC"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "POWDER VOLUME — RECONSTITUTION",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > POWDER VOLUME (PV): Volume occupied by dry powder before reconstitution.
        > FORMULA: PV = Final Volume - Volume of Diluent Added
        > EXAMPLE: Amoxicillin 250 mg/5 mL; add 82 mL water to make 100 mL final volume.
        >   PV = 100 - 82 = 18 mL (powder itself occupies 18 mL)
        > CONCENTRATION VERIFICATION: 2,500 mg drug in 100 mL = 25 mg/mL.
        > CLINICAL IMPORTANCE: Must know PV to accurately prepare pediatric IV antibiotics.
        > STORAGE: Refrigerate reconstituted antibiotics; discard after 14 days typically.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. If 90 mL of sterile water is added to an antibiotic powder and the final volume is 100 mL, the powder volume is 10 mL",
            "B. If 90 mL of sterile water is added to an antibiotic powder and the final volume is 100 mL, the powder volume is 90 mL",
            "C. Powder volume is calculated as: diluent added minus final volume",
            "D. Adding 100 mL of water to any antibiotic powder always results in a 100 mL final volume"
        ],
        correctAnswer: "A. If 90 mL of sterile water is added to an antibiotic powder and the final volume is 100 mL, the powder volume is 10 mL",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.78,
        angle: .dosing,
        baseConceptTitle: "POWDER VOLUME"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "mEq ADVANCED — CALCIUM & PHOSPHATE",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > CALCIUM GLUCONATE: MW = 430 g/mol; valence = 2; 1 mEq = 215 mg; 1 g = 4.65 mEq
        > CALCIUM CHLORIDE: MW = 147 g/mol; valence = 2; 1 mEq = 73.5 mg; 1 g = 13.6 mEq
        > PHOSPHATE (K₂HPO₄): 1 mmol = 31 mg phosphorus; mEq ≠ mmol for multivalent ions.
        > COMPATIBILITY: Calcium + phosphate → precipitation (Ca × PO₄ rule in TPN).
        > MAGNESIUM: 1 g MgSO₄·7H₂O = 8.1 mEq = 4.05 mmol Mg²⁺
        > CLINICAL: IV calcium chloride has 3× more elemental calcium per mL than calcium gluconate.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Calcium gluconate and calcium chloride are therapeutically equivalent per gram and interchangeable",
            "B. 1 g calcium chloride provides ~13.6 mEq elemental calcium vs 1 g calcium gluconate providing ~4.65 mEq; calcium chloride has ~3× more elemental calcium per gram",
            "C. 1 g of magnesium sulfate provides 4.1 mEq of magnesium",
            "D. Phosphate and calcium can be freely combined in TPN without risk of precipitation"
        ],
        correctAnswer: "B. 1 g calcium chloride provides ~13.6 mEq elemental calcium vs 1 g calcium gluconate providing ~4.65 mEq; calcium chloride has ~3× more elemental calcium per gram",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.78,
        angle: .dosing,
        baseConceptTitle: "mEq ADVANCED"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "SPECIFIC GRAVITY — SOLUTIONS",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > DEFINITION: Specific gravity (SG) = density of substance / density of water (water = 1 g/mL).
        > FORMULA: SG = weight (g) / volume (mL)
        > EXAMPLE: If 250 mL of solution weighs 265 g: SG = 265/250 = 1.06
        > REVERSE: Volume (mL) = Weight (g) / SG
        >   Weight (g) = Volume (mL) × SG
        > USES: Convert between weight and volume for syrups, oils, suspensions.
        > EXAMPLE: How many mL of glycerin (SG 1.25) = 50 g?
        >   mL = 50 / 1.25 = 40 mL
        """,
        challengeType: .multipleChoice,
        options: [
            "A. If glycerin has a specific gravity of 1.25, how many mL are needed to get 75 g? Answer: 93.75 mL",
            "B. If glycerin has a specific gravity of 1.25, how many mL are needed to get 75 g? Answer: 60 mL (75 ÷ 1.25 = 60 mL)",
            "C. If glycerin has a specific gravity of 1.25, how many mL are needed to get 75 g? Answer: 75 mL (SG has no effect on volume calculation)",
            "D. Specific gravity of water is 0 and used as the reference standard for pharmaceutical solutions"
        ],
        correctAnswer: "B. If glycerin has a specific gravity of 1.25, how many mL are needed to get 75 g? Answer: 60 mL (75 ÷ 1.25 = 60 mL)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.88,
        angle: .dosing,
        baseConceptTitle: "SPECIFIC GRAVITY"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "STORAGE TEMPERATURES — REFERENCE",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > USP DEFINITIONS:
        >   Freezer: -25°C to -10°C (-13°F to 14°F)
        >   Refrigerator: 2°C to 8°C (36°F to 46°F)
        >   Cool: 8°C to 15°C (46°F to 59°F)
        >   Room Temperature (CRT): 20°C to 25°C (68°F to 77°F); excursions to 15–30°C allowed
        >   Warm: 30°C to 40°C
        > EXAMPLES: Vaccines → 2–8°C; Insulin (open) → room temp up to 28 days; Suppositories → refrigerator.
        > NEVER FREEZE: Many injectables, suspensions, emulsions (check label).
        > LIGHT-SENSITIVE: Store in amber/opaque containers (nitroglycerin, sodium nitroprusside).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. USP 'controlled room temperature' allows storage from 15°C to 40°C at all times",
            "B. USP controlled room temperature (CRT) = 20–25°C with excursions to 15–30°C permitted; refrigerator = 2–8°C; freezer = -25 to -10°C; opened insulin vials stable at room temp up to 28 days",
            "C. Refrigerator temperature in pharmacy is defined as 0°C to 4°C",
            "D. USP freezer temperature range is -40°C to -20°C for pharmaceutical products"
        ],
        correctAnswer: "B. USP controlled room temperature (CRT) = 20–25°C with excursions to 15–30°C permitted; refrigerator = 2–8°C; freezer = -25 to -10°C; opened insulin vials stable at room temp up to 28 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.88,
        angle: .dosing,
        baseConceptTitle: "STORAGE TEMPERATURES"
    ),
]
