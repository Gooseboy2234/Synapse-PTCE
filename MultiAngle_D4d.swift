import Foundation

// Multi-Angle Phase 12 — Order Entry / Math Gap Fill II
// 10 nodes — all with full MCQ content

let multiAngleNodes_D4d: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "DAYS SUPPLY — EYE DROPS",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: Days Supply = Total drops in bottle ÷ Drops per day
        > DROPS PER mL: Approximately 20 drops/mL (standard ophthalmic drop size = 0.05 mL).
        > EXAMPLE: Timolol 0.5% 5 mL; 1 drop each eye BID:
        >   Total drops in bottle = 5 mL × 20 drops/mL = 100 drops
        >   Drops used per day = 1 drop × 2 eyes × 2 times = 4 drops/day
        >   Days supply = 100 ÷ 4 = 25 days
        > PRACTICAL: For 1 eye BID = 2 drops/day; both eyes BID = 4 drops/day.
        > ROUND DOWN: Always round down to avoid over-dispensing claims.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 10 mL bottle of latanoprost (1 drop each eye QD) provides a 50-day supply",
            "B. A 10 mL bottle of latanoprost (1 drop each eye QD) provides a 100-day supply: 10 mL × 20 drops/mL = 200 drops ÷ (1 drop × 2 eyes × 1 time/day = 2 drops/day) = 100 days",
            "C. A 10 mL bottle of latanoprost (1 drop each eye QD) provides a 200-day supply",
            "D. Eye drop calculations use 15 drops/mL as the standard conversion factor"
        ],
        correctAnswer: "B. A 10 mL bottle of latanoprost (1 drop each eye QD) provides a 100-day supply: 10 mL × 20 drops/mL = 200 drops ÷ (1 drop × 2 eyes × 1 time/day = 2 drops/day) = 100 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.10,
        angle: .dosing,
        baseConceptTitle: "DAYS SUPPLY EYE DROPS"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "DAYS SUPPLY — TOPICAL CREAMS",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: Days Supply = Total grams dispensed ÷ Grams used per day
        > FINGERTIP UNIT (FTU): 1 FTU ≈ 0.5 g applied from tip of index finger to first crease.
        > BODY AREA GUIDE:
        >   Face: 2.5 g per application
        >   One arm: 3 g per application
        >   Trunk front or back: 7 g per application
        >   One leg: 6 g per application
        > EXAMPLE: Triamcinolone 0.1% cream 60 g; apply to both legs BID:
        >   Per application = 2 × 6 g = 12 g; BID = 24 g/day
        >   Days supply = 60 ÷ 24 = 2.5 days → 2 days (round down)
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 30 g tube of hydrocortisone applied to the face TID provides a 4-day supply (30 ÷ 7.5 g/day)",
            "B. A 30 g tube of hydrocortisone applied to the face TID provides a 4-day supply: 2.5 g/application × 3 = 7.5 g/day; 30 ÷ 7.5 = 4 days",
            "C. A 30 g tube is always a 30-day supply regardless of application area or frequency",
            "D. Topical creams are always dispensed as a 1-month supply without days supply calculation"
        ],
        correctAnswer: "B. A 30 g tube of hydrocortisone applied to the face TID provides a 4-day supply: 2.5 g/application × 3 = 7.5 g/day; 30 ÷ 7.5 = 4 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.10,
        angle: .dosing,
        baseConceptTitle: "DAYS SUPPLY TOPICAL"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "ROMAN NUMERALS — PHARMACY",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > KEY ROMAN NUMERALS IN PHARMACY:
        >   I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000
        > SUBTRACTIVE PRINCIPLE: Smaller value before larger = subtract (IV = 4, IX = 9, XL = 40).
        > PHARMACY USE: Prescription quantities (dispense XV tablets = 15), sig instructions (i tab = 1 tab, ii tabs = 2 tabs, iss = 1½).
        > APOTHECARY: gr = grains; ss = ½; iss = 1½; iiss = 2½.
        > CONVERSIONS: 1 grain (gr) = 65 mg; 1 dram (ʒ) = 4 mL; 1 ounce (ℨ) = 30 mL.
        > EXAMPLES: XIV = 14; XXX = 30; XCII = 92; gr v = 5 grains = 325 mg (aspirin).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The Roman numeral XLII equals 52",
            "B. XLII = 42 (XL = 40, II = 2); gr v = 5 grains = 325 mg; ss = one-half; iss = one and one-half in apothecary notation",
            "C. The Roman numeral XLII equals 38",
            "D. In pharmacy, 'ss' means two units (double strength)"
        ],
        correctAnswer: "B. XLII = 42 (XL = 40, II = 2); gr v = 5 grains = 325 mg; ss = one-half; iss = one and one-half in apothecary notation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.28,
        angle: .dosing,
        baseConceptTitle: "ROMAN NUMERALS"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "COMPOUNDING QUANTITY CALCULATION",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > SCENARIO: Calculate ingredients needed to make a compounded formulation.
        > EXAMPLE: Compound 120 mL of 2% lidocaine oral rinse from 4% lidocaine solution:
        >   C1V1 = C2V2: 4% × V1 = 2% × 120 mL
        >   V1 = (2 × 120) / 4 = 60 mL of 4% lidocaine + 60 mL diluent = 120 mL
        > POWDER INCLUSION: If adding drug powder, account for powder volume (PV = final volume - diluent added).
        > CREAM/OINTMENT: Weigh each ingredient; total weight = sum of all component weights.
        > VERIFICATION: Final concentration = total drug (mg) ÷ final volume (mL) × 100%.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. To make 200 mL of 0.5% hydrocortisone from 2.5% hydrocortisone cream, you need 20 g of the 2.5% cream",
            "B. To make 200 mL of 0.5% hydrocortisone from 2.5% hydrocortisone cream: C1V1=C2V2; 2.5×V1=0.5×200; V1=40 g of 2.5% cream + 160 g base = 200 g total",
            "C. To make 200 mL of 0.5% hydrocortisone from 2.5% cream, you need 100 g of the 2.5% cream",
            "D. Compounding calculations always use weight/volume ratios regardless of formulation type"
        ],
        correctAnswer: "B. To make 200 mL of 0.5% hydrocortisone from 2.5% hydrocortisone cream: C1V1=C2V2; 2.5×V1=0.5×200; V1=40 g of 2.5% cream + 160 g base = 200 g total",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.28,
        angle: .dosing,
        baseConceptTitle: "COMPOUNDING QUANTITY"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "OSMOLARITY CALCULATION",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > OSMOLARITY: mOsm/L — measure of solute concentration in IV solutions.
        > FORMULA: mOsm/L = (grams/L ÷ molecular weight) × number of particles × 1000
        > ISOTONIC: ~285–295 mOsm/L (normal body fluid); 0.9% NaCl = 308 mOsm/L.
        > HYPOTONIC: <285 mOsm/L (0.45% NaCl = 154 mOsm/L).
        > HYPERTONIC: >295 mOsm/L (3% NaCl ≈ 1026 mOsm/L); requires central line.
        > EXAMPLE: 0.9% NaCl = 9 g/L NaCl; MW = 58.5; particles = 2 (Na⁺ + Cl⁻)
        >   (9/58.5) × 2 × 1000 = 0.154 × 2 × 1000 = 308 mOsm/L
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 5% dextrose solution (D5W) has an osmolarity of approximately 500 mOsm/L",
            "B. D5W osmolarity: (50 g/L ÷ 180 g/mol) × 1 particle × 1000 = 278 mOsm/L (isotonic); 0.9% NaCl = 308 mOsm/L; hypertonic solutions (>295 mOsm) require central venous access",
            "C. Normal body fluid osmolarity is approximately 600 mOsm/L",
            "D. Hypertonic saline (3% NaCl) is safe for peripheral IV administration"
        ],
        correctAnswer: "B. D5W osmolarity: (50 g/L ÷ 180 g/mol) × 1 particle × 1000 = 278 mOsm/L (isotonic); 0.9% NaCl = 308 mOsm/L; hypertonic solutions (>295 mOsm) require central venous access",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.46,
        angle: .dosing,
        baseConceptTitle: "OSMOLARITY"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "DAYS SUPPLY — ORAL CONTRACEPTIVES",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > 28-DAY PACKS: 21 active + 7 placebo pills — dispense as 28 days supply.
        > 21-DAY PACKS: 21 active pills only — patient takes 7 days off; dispense as 28 days supply (1 pack per month).
        > 91-DAY (Extended cycle): 84 active + 7 placebo (Seasonique) — dispense as 91-day supply.
        > 365-DAY (Continuous): Amethyst (norethindrone 0.35 mg) continuous — 28-day packs = 28-day supply per pack.
        > PATCH: Ortho Evra/Xulane — 1 patch/week × 3 weeks, then 1 week off = 3 patches = 28 days supply.
        > VAGINAL RING: NuvaRing — 1 ring/month inserted 3 weeks, out 1 week = 1 ring = 28 days supply.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 21-day oral contraceptive pack should be dispensed with a 21-day days supply",
            "B. Both 21-day and 28-day OC packs are dispensed with a 28-day supply (1 pack per cycle); 91-day packs (Seasonique): 91-day supply; 1 OC patch = 1 week; 3 patches dispensed = 28-day supply",
            "C. Extended-cycle oral contraceptives (91-day packs) are dispensed as a 28-day supply",
            "D. A vaginal ring (NuvaRing) dispensed as 3 rings = a 28-day supply"
        ],
        correctAnswer: "B. Both 21-day and 28-day OC packs are dispensed with a 28-day supply (1 pack per cycle); 91-day packs (Seasonique): 91-day supply; 1 OC patch = 1 week; 3 patches dispensed = 28-day supply",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.46,
        angle: .dosing,
        baseConceptTitle: "OC DAYS SUPPLY"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "TEMPERATURE CONVERSION — °C TO °F",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULAS:
        >   °F = (°C × 9/5) + 32
        >   °C = (°F - 32) × 5/9
        > KEY PHARMACY TEMPERATURES:
        >   Refrigerator: 2–8°C = 35.6–46.4°F
        >   Room Temperature: 20–25°C = 68–77°F
        >   Freezer: -25 to -10°C = -13 to 14°F
        > BODY TEMPERATURE: 37°C = 98.6°F
        > EXAMPLES:
        >   -20°C = (-20 × 9/5) + 32 = -36 + 32 = -4°F
        >   4°C = (4 × 9/5) + 32 = 7.2 + 32 = 39.2°F
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Convert 25°C to °F: (25 × 9/5) + 32 = 45 + 32 = 77°F",
            "B. Convert 25°C to °F: (25 × 5/9) + 32 = 77°F",
            "C. Convert 25°C to °F: 25 + 32 = 57°F",
            "D. Body temperature of 37°C is equivalent to 100.4°F"
        ],
        correctAnswer: "A. Convert 25°C to °F: (25 × 9/5) + 32 = 45 + 32 = 77°F",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.64,
        angle: .dosing,
        baseConceptTitle: "TEMPERATURE CONVERSION"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "ELECTROLYTE REPLACEMENT CALCULATIONS",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > POTASSIUM REPLACEMENT: 40 mEq KCl IV over ≥4 hours for hypokalemia.
        >   Peripheral IV: Max 10 mEq/hr; concentration max 40 mEq/100 mL.
        >   Central line: Up to 20 mEq/hr.
        > MAGNESIUM REPLACEMENT: 2–4 g MgSO₄ IV over 1–4 hours (seizures/TdP: 2 g over 10–15 min).
        > PHOSPHATE REPLACEMENT: Sodium or potassium phosphate; rate based on severity.
        > CALCIUM: 1 g calcium gluconate IV over 10 min for hypocalcemia.
        > RULE: NEVER give undiluted concentrated KCl IV — FATAL cardiac arrest risk.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Concentrated KCl can be safely given as an IV push for rapid correction of severe hypokalemia",
            "B. KCl peripheral max 10 mEq/hr (40 mEq/100 mL concentration); concentrated KCl IV push is FATAL; MgSO₄ 2–4 g IV for replacement; 2 g MgSO₄ IV push for TdP/seizures",
            "C. The maximum peripheral IV potassium rate is 40 mEq/hr",
            "D. Magnesium sulfate for hypomagnesemia should be given as an IV push over 1–2 minutes"
        ],
        correctAnswer: "B. KCl peripheral max 10 mEq/hr (40 mEq/100 mL concentration); concentrated KCl IV push is FATAL; MgSO₄ 2–4 g IV for replacement; 2 g MgSO₄ IV push for TdP/seizures",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.64,
        angle: .dosing,
        baseConceptTitle: "ELECTROLYTE REPLACEMENT"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "ALLIGATION ALTERNATE — ADVANCED",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > ALLIGATION ALTERNATE: Method to determine parts of two concentrations needed to make a desired concentration.
        > STEPS:
        >   1. Write higher % and lower % on left.
        >   2. Write desired % in center.
        >   3. Subtract diagonally: higher - desired = parts of lower; desired - lower = parts of higher.
        >   4. Total parts = parts of higher + parts of lower.
        >   5. Calculate actual volumes from total.
        > EXAMPLE: Mix 70% alcohol and 30% alcohol to make 500 mL of 50% alcohol:
        >   70 - 50 = 20 parts of 30%; 50 - 30 = 20 parts of 70%; Total = 40 parts.
        >   Of 70%: (20/40) × 500 = 250 mL; Of 30%: (20/40) × 500 = 250 mL.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. To make 200 mL of 40% alcohol from 95% alcohol and purified water (0%): need 84.2 mL of 95% and 115.8 mL water",
            "B. To make 200 mL of 40% from 95% and 0%: 95-40=55 parts water; 40-0=40 parts of 95%; total 95 parts. 95%: (40/95)×200=84.2 mL; water: (55/95)×200=115.8 mL",
            "C. To make 200 mL of 40% from 95% and 0% alcohol, use 80 mL of 95% and 120 mL of water",
            "D. Alligation is only used for mixing two solutions of equal volume"
        ],
        correctAnswer: "B. To make 200 mL of 40% from 95% and 0%: 95-40=55 parts water; 40-0=40 parts of 95%; total 95 parts. 95%: (40/95)×200=84.2 mL; water: (55/95)×200=115.8 mL",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.82,
        angle: .dosing,
        baseConceptTitle: "ALLIGATION ADVANCED"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "PEDIATRIC WEIGHT-BASED CALCULATIONS",
        loreText: """
        > SECTOR-04 // ORDER ENTRY & PROCESSING
        > FORMULA: Dose (mg) = Weight (kg) × Dose (mg/kg)
        > EXAMPLE: Amoxicillin 40 mg/kg/day divided TID for a 22 lb child:
        >   Weight: 22 lb ÷ 2.2 = 10 kg
        >   Daily dose: 40 × 10 = 400 mg/day
        >   TID dose: 400 ÷ 3 = 133.3 mg per dose
        > CONCENTRATION: Amoxicillin 250 mg/5 mL:
        >   Volume per dose: 133.3 ÷ 50 mg/mL = 2.67 mL ≈ 2.7 mL per dose
        > WEIGHT CONVERSION: lbs ÷ 2.2 = kg; kg × 2.2 = lbs.
        > MAX DOSE: Always verify against adult maximum — do not exceed regardless of weight.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A 33 lb child prescribed acetaminophen 15 mg/kg q4h PRN: correct single dose is 150 mg",
            "B. A 33 lb child prescribed acetaminophen 15 mg/kg: weight = 33÷2.2 = 15 kg; dose = 15×15 = 225 mg per dose",
            "C. A 33 lb child prescribed acetaminophen 15 mg/kg: correct dose is 330 mg because 33 lbs × 10 mg/lb",
            "D. Pediatric weight-based dosing uses pounds directly (no conversion to kg) when calculating doses"
        ],
        correctAnswer: "B. A 33 lb child prescribed acetaminophen 15 mg/kg: weight = 33÷2.2 = 15 kg; dose = 15×15 = 225 mg per dose",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.82,
        angle: .dosing,
        baseConceptTitle: "PEDIATRIC CALCULATIONS"
    ),
]
