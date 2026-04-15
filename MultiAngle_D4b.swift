
//
//  MultiAngle_D4b.swift
//  Synapse PTCE
//
//  Multi-angle nodes — Domain 4: Order Entry & Processing (Expansion)
//  14 nodes covering insurance billing, NDC, transdermal/ophthalmic/cream days supply,
//  TPN, osmolarity, and compounding documentation
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D4b: [DataNode] {[

        // MARK: — INSURANCE BILLING

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "INSURANCE BILLING / CLAIM COMPONENTS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Key components of a pharmacy insurance claim
            > BIN: Bank Identification Number — 6-digit number identifying the pharmacy benefit manager (PBM) processor; found on insurance card
            > PCN: Processor Control Number — secondary routing number used with BIN for some payers
            > GROUP NUMBER: Identifies the patient's employer group or insurance plan
            > MEMBER ID: Unique patient identifier within the insurance plan
            > NPI: National Provider Identifier — 10-digit number identifying the dispensing pharmacy
            > DEA NUMBER: Required on claim for controlled substance prescriptions
            > NDC: 11-digit NDC number (with leading zeros) is required for billing
            """,
            challengeType: .multipleChoice,
            options: [
                "A. BIN identifies the patient; PCN identifies the drug being dispensed",
                "B. BIN (6-digit) identifies the PBM processor; PCN is a secondary routing number; Group # and Member ID identify the patient's plan",
                "C. NPI is the prescriber's identification number used for claim routing",
                "D. The DEA number replaces the NPI on pharmacy claims for controlled substances"
            ],
            correctAnswer: "B. BIN (6-digit) identifies the PBM processor; PCN is a secondary routing number; Group # and Member ID identify the patient's plan",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "INSURANCE CLAIM"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "CLAIM REJECTION / REJECT CODES",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Common pharmacy claim rejection codes and resolution
            > REJECT 07: M/I Person Code — wrong patient ID; verify Member ID on insurance card
            > REJECT 14: M/I Date of Birth — DOB does not match insurance records
            > REJECT 22: M/I Dispense As Written Code — DAW code conflict; verify prescriber intent
            > REJECT 25: M/I Prescriber ID — invalid DEA or NPI number
            > REJECT 40: Refill Too Soon — days supply not elapsed; override with emergency supply if needed
            > REJECT 75: Prior Authorization Required — must obtain PA before dispensing; contact prescriber
            > REJECT 76: Plan Limitations Exceeded — quantity/days supply limit reached for period
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Reject Code 40 means the prescriber's DEA number is expired",
                "B. Reject Code 40 means Refill Too Soon — days supply has not elapsed since last fill",
                "C. Reject Code 75 means the medication is not on the formulary at any tier",
                "D. Reject Code 22 means the Member ID doesn't match the BIN number"
            ],
            correctAnswer: "B. Reject Code 40 means Refill Too Soon — days supply has not elapsed since last fill",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "CLAIM REJECTION CODES"
        ),

        // MARK: — PRIOR AUTHORIZATION

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "PRIOR AUTHORIZATION / PA PROCESS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Prior authorization workflow
            > PRIOR AUTHORIZATION (PA): Insurance requirement that prescriber obtain approval before a drug will be covered
            > REASONS: Non-formulary drug, quantity limit exceeded, step therapy not completed, high-cost specialty medication
            > STEP THERAPY: Insurance may require trying a first-line (usually generic) drug before approving a second-line option
            > PA PROCESS: Prescriber contacts plan → submits clinical documentation → plan approves/denies → pharmacy can bill if approved
            > PHARMACIST ROLE: Notify patient of rejection, inform prescriber, may assist in preparing PA documentation
            > URGENT/EMERGENCY: Many plans have expedited PA (72 hours) for urgent situations; pharmacist may dispense emergency supply
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The pharmacist initiates and completes the prior authorization process independently",
                "B. The prescriber obtains PA from the insurance plan; pharmacist notifies prescriber and patient when PA is required",
                "C. Prior authorization is only required for Schedule II controlled substances",
                "D. Once a PA is approved, it is valid forever — no renewal is ever needed"
            ],
            correctAnswer: "B. The prescriber obtains PA from the insurance plan; pharmacist notifies prescriber and patient when PA is required",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.20,
            angle: .classification,
            baseConceptTitle: "PRIOR AUTHORIZATION"
        ),

        // MARK: — TRANSDERMAL PATCH DAYS SUPPLY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / TRANSDERMAL PATCH",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for transdermal patches
            > FORMULA: Days Supply = Number of Patches Dispensed × Days Per Patch
            > EXAMPLE: Fentanyl 25 mcg/hr patch — change every 72 hours (3 days); dispense #10 patches
            > DAYS SUPPLY = 10 patches × 3 days/patch = 30 days
            > EXAMPLE 2: Nitroglycerin patch — apply once daily × 12 hours on, 12 hours off; dispense 30 patches
            > DAYS SUPPLY = 30 patches × 1 day/patch = 30 days
            > EXAMPLE 3: Estradiol patch twice weekly (change q3-4 days); dispense 8 patches
            > DAYS SUPPLY: 8 patches × 3.5 days avg = 28 days
            > KEY: Each patch worn for a specified number of DAYS — divide total patches by patches-per-day or multiply patches × days-per-patch
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 20 days",
                "B. 25 days",
                "C. 30 days",
                "D. 72 days"
            ],
            correctAnswer: "C. 30 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.20,
            angle: .dosing,
            baseConceptTitle: "PATCH DAYS SUPPLY"
        ),

        // MARK: — OPHTHALMIC DROP DAYS SUPPLY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / OPHTHALMIC DROPS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for eye drops
            > ASSUMPTION: 1 drop = approximately 0.05 mL (20 drops per mL)
            > FORMULA: Total Drops = Bottle Volume (mL) × 20 drops/mL; Days Supply = Total Drops ÷ Drops Per Day
            > EXAMPLE: Latanoprost 2.5 mL — sig: 1 drop in each eye (OU) at bedtime (QHS)
            > DROPS PER DAY: 1 drop × 2 eyes = 2 drops/day
            > TOTAL DROPS: 2.5 mL × 20 = 50 drops
            > DAYS SUPPLY: 50 ÷ 2 = 25 days
            > EXAMPLE 2: Timolol 5 mL — 1 drop OU BID = 4 drops/day; 5 × 20 = 100 drops; 100 ÷ 4 = 25 days
            > TIP: If drop goes in only 1 eye (OD or OS), use 1 drop/dose; OU = both eyes = 2 drops/dose
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 15 days",
                "B. 20 days",
                "C. 25 days",
                "D. 50 days"
            ],
            correctAnswer: "C. 25 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.30,
            angle: .dosing,
            baseConceptTitle: "OPHTHALMIC DAYS SUPPLY"
        ),

        // MARK: — CREAM/OINTMENT DAYS SUPPLY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / CREAM AND OINTMENT",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for topical preparations (by weight)
            > FINGERTIP UNIT (FTU): 1 FTU = approximately 0.5 g of cream/ointment — amount from tip of index finger to first crease
            > BODY SURFACE AREA GUIDE: Amount needed per application varies by body region:
            >   Face/neck: 2.5 g | Arm: 3 g | Leg: 6 g | Trunk (front or back): 7 g
            > FORMULA: Days Supply = Total Weight Dispensed (g) ÷ Daily Grams Used
            > EXAMPLE: Hydrocortisone 1% cream 30g — sig: apply thin layer to hands BID
            > DAILY USE: ~0.5 g per hand × 2 hands × 2 applications = 2 g/day
            > DAYS SUPPLY: 30 g ÷ 2 g/day = 15 days
            > INSURANCE: Days supply must reflect realistic use — do not inflate days supply to extend refills
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 10 days",
                "B. 15 days",
                "C. 30 days",
                "D. 60 days"
            ],
            correctAnswer: "B. 15 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.30,
            angle: .dosing,
            baseConceptTitle: "CREAM DAYS SUPPLY"
        ),

        // MARK: — OSMOLARITY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "OSMOLARITY / IV SOLUTION CALCULATION",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating osmolarity of IV solutions
            > OSMOLARITY: Concentration of osmotically active particles per liter of solution (mOsmol/L)
            > FORMULA: mOsmol/L = (grams/L × number of ions) / molecular weight × 1000
            > NORMAL PLASMA: ~285–295 mOsmol/L
            > ISOTONIC SOLUTIONS: 0.9% NaCl = ~308 mOsmol/L; D5W = ~252 mOsmol/L; LR = ~273 mOsmol/L
            > HYPERTONIC SOLUTIONS: 3% NaCl (~1026 mOsmol/L) — peripheral vein limit is ~900 mOsmol/L
            > PERIPHERAL LIMIT: IV solutions > 900 mOsmol/L must be given via CENTRAL line
            > NaCl osmolarity: 2 ions (Na+ and Cl-); D5W: 1 osmol (glucose, non-ionic)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. IV solutions of any osmolarity can be safely administered through a peripheral vein",
                "B. Solutions > 900 mOsmol/L must be given through a central line to prevent vein damage",
                "C. Isotonic normal saline (0.9% NaCl) has an osmolarity of 154 mOsmol/L",
                "D. Osmolarity refers only to the sugar content of a solution — not electrolytes"
            ],
            correctAnswer: "B. Solutions > 900 mOsmol/L must be given through a central line to prevent vein damage",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.42,
            angle: .dosing,
            baseConceptTitle: "OSMOLARITY"
        ),

        // MARK: — PEDIATRIC WEIGHT-BASED DOSING

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "PEDIATRIC DOSING / YOUNG'S AND CLARK'S RULES",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Historical pediatric dose estimation rules
            > CLARK'S RULE: Child dose = (Child weight in lbs ÷ 150) × Adult dose
            > EXAMPLE: Adult dose acetaminophen 650 mg; child weighs 44 lbs
            > DOSE = (44 ÷ 150) × 650 = 0.293 × 650 = 190.7 mg ≈ 191 mg
            > YOUNG'S RULE: Child dose = [Age (years) ÷ (Age + 12)] × Adult dose
            > EXAMPLE: 4-year-old; adult dose 500 mg: [4 ÷ 16] × 500 = 125 mg
            > CURRENT PRACTICE: Weight-based mg/kg dosing preferred over these rules; Clark's/Young's rarely used clinically
            > BSA RULE: (Child BSA m² ÷ 1.73 m²) × Adult dose — more accurate for chemotherapy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Young's Rule uses child's weight in pounds; Clark's Rule uses child's age",
                "B. Clark's Rule: (weight in lbs ÷ 150) × adult dose; Young's Rule: age ÷ (age + 12) × adult dose",
                "C. Clark's Rule calculates based on BSA; Young's Rule uses body weight in kilograms",
                "D. Both rules are preferred over mg/kg dosing for all pediatric calculations"
            ],
            correctAnswer: "B. Clark's Rule: (weight in lbs ÷ 150) × adult dose; Young's Rule: age ÷ (age + 12) × adult dose",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.42,
            angle: .dosing,
            baseConceptTitle: "PEDIATRIC DOSING RULES"
        ),

        // MARK: — TPN BASICS

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "TPN / TOTAL PARENTERAL NUTRITION",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Components and basics of TPN
            > TPN: Total Parenteral Nutrition — IV nutrition for patients who cannot receive enteral (GI) nutrition
            > COMPONENTS: Dextrose (carbohydrates/calories), amino acids (protein), lipid emulsion (fat), electrolytes, vitamins, trace elements, water
            > CALORIES: Dextrose provides 3.4 kcal/g; Lipids provide 9 kcal/g; Amino acids provide 4 kcal/g
            > CENTRAL LINE REQUIRED: TPN is hypertonic (> 900 mOsmol/L) — must be given through central venous catheter
            > PPN: Peripheral Parenteral Nutrition — lower concentration, may be given peripherally (≤ 900 mOsmol/L)
            > PHARMACY ROLE: Pharmacist calculates and compounds TPN; verifies compatibility; labels with macronutrients, electrolytes, and BUD
            """,
            challengeType: .multipleChoice,
            options: [
                "A. TPN can be administered via peripheral IV access — central line is optional",
                "B. TPN requires a central line due to hyperosmolarity; contains dextrose, amino acids, lipids, and electrolytes",
                "C. The primary caloric source in TPN is protein from amino acid solutions",
                "D. Lipid emulsions cannot be added to TPN — must always be administered separately"
            ],
            correctAnswer: "B. TPN requires a central line due to hyperosmolarity; contains dextrose, amino acids, lipids, and electrolytes",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.54,
            angle: .classification,
            baseConceptTitle: "TPN"
        ),

        // MARK: — COMPOUNDING DOCUMENTATION

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "COMPOUNDING DOCUMENTATION / MASTER FORMULA",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Required documentation for compounded preparations
            > MASTER FORMULA RECORD (MFR): Written instructions for compounding a specific preparation — includes formula, equipment, instructions, BUD, and storage conditions
            > COMPOUNDING RECORD (CR): Documents EACH batch made — lot numbers, quantities, compounding personnel, final check initials, BUD assigned
            > LOT NUMBER: Unique identifier for each compounding batch; enables recall traceability
            > BEYOND USE DATE: Assigned based on USP guidelines (795 for non-sterile, 797 for sterile)
            > QC CHECKS: Weight variation, pH, appearance checks documented for each batch
            > RETENTION: USP and most states require compounding records retained for minimum 2–3 years
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The Master Formula Record documents individual batch compounding details including lot numbers",
                "B. The Compounding Record documents each individual batch; Master Formula Record is the standing recipe/instructions",
                "C. Compounding documentation is only required for sterile (USP 797) preparations",
                "D. Lot numbers are optional for non-sterile compounded preparations"
            ],
            correctAnswer: "B. The Compounding Record documents each individual batch; Master Formula Record is the standing recipe/instructions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.54,
            angle: .classification,
            baseConceptTitle: "COMPOUNDING DOCUMENTATION"
        ),

        // MARK: — RATIO AND PROPORTION

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "RATIO STRENGTH / CALCULATING DOSE FROM RATIO",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Converting ratio strength to mg/mL for dose calculations
            > RATIO STRENGTH: Expressed as 1:X — means 1 gram of drug per X mL of solution
            > EXAMPLE: Epinephrine 1:1000 = 1 g per 1000 mL = 1 mg/mL
            > EXAMPLE: Epinephrine 1:10,000 = 1 g per 10,000 mL = 0.1 mg/mL
            > CLINICAL USE: Anaphylaxis dose = 0.3–0.5 mg IM; using 1:1000 (1 mg/mL): give 0.3–0.5 mL
            > EXAMPLE CALCULATION: How many mL of 1:10,000 epinephrine provides 0.1 mg?
            > 0.1 mg ÷ 0.1 mg/mL = 1 mL
            > REMEMBER: 1:1000 = 10× more concentrated than 1:10,000
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1:1000 epinephrine = 0.1 mg/mL; 1:10,000 = 1 mg/mL",
                "B. 1:1000 epinephrine = 1 mg/mL; 1:10,000 = 0.1 mg/mL",
                "C. Both 1:1000 and 1:10,000 contain the same concentration — only volume differs",
                "D. Ratio strength only applies to topical preparations — not injectable drugs"
            ],
            correctAnswer: "B. 1:1000 epinephrine = 1 mg/mL; 1:10,000 = 0.1 mg/mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.66,
            angle: .dosing,
            baseConceptTitle: "RATIO STRENGTH"
        ),

        // MARK: — TEMPERATURE CONVERSIONS

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "TEMPERATURE CONVERSION / F TO C",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Converting between Celsius and Fahrenheit for medication storage
            > FORMULA C to F: °F = (°C × 9/5) + 32
            > FORMULA F to C: °C = (°F – 32) × 5/9
            > KEY CONVERSIONS:
            > Controlled Room Temp: 20–25°C = 68–77°F
            > Refrigerator: 2–8°C = 36–46°F
            > Freezer: -25 to -10°C = -13 to 14°F
            > BODY TEMPERATURE: 37°C = 98.6°F
            > EXAMPLE: Patient says medication stored at 86°F — is this within CRT?
            > Convert: (86–32) × 5/9 = 54 × 5/9 = 30°C — EXCEEDS controlled room temp (max 25°C) → DISCARD
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 25°C = 68°F",
                "B. 25°C = 77°F",
                "C. 25°C = 82°F",
                "D. 25°C = 86°F"
            ],
            correctAnswer: "B. 25°C = 77°F",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.66,
            angle: .dosing,
            baseConceptTitle: "TEMPERATURE CONVERSION"
        ),

        // MARK: — PHARMACY CALCULATIONS / MILLIEQUIVALENTS

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "MILLIEQUIVALENTS / mEq CALCULATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Understanding and converting milliequivalents (mEq)
            > mEq DEFINITION: A milliequivalent is 1/1000 of an equivalent; used for electrolytes
            > FORMULA: mEq = (mg × valence) / molecular weight
            > POTASSIUM CHLORIDE (KCl): MW = 74.5 g/mol; valence = 1
            > EXAMPLE: 40 mEq KCl in mg: mg = (40 × 74.5) ÷ 1 = 2980 mg = 2.98 g
            > CALCIUM GLUCONATE: MW = 430 g/mol; valence = 2; 1 g = (1000 × 2) ÷ 430 = 4.65 mEq
            > SODIUM (Na+): MW = 23; valence = 1; 1 g NaCl provides (1000 × 1) ÷ 23 = 43.5 mEq Na+
            > CLINICAL: IV fluid orders often in mEq — understand electrolyte content of fluids
            """,
            challengeType: .multipleChoice,
            options: [
                "A. mEq = molecular weight ÷ (mg × valence)",
                "B. mEq = (mg × valence) ÷ molecular weight",
                "C. mEq = mg ÷ valence × molecular weight",
                "D. mEq = molecular weight × valence × 1000"
            ],
            correctAnswer: "B. mEq = (mg × valence) ÷ molecular weight",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.78,
            angle: .dosing,
            baseConceptTitle: "MILLIEQUIVALENTS"
        ),

        // MARK: — SUPPOSITORY DAYS SUPPLY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / SUPPOSITORIES AND SPECIALTY FORMS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Days supply for suppositories and other specialty forms
            > SUPPOSITORIES: Calculated same as tablets — quantity dispensed ÷ daily quantity used
            > EXAMPLE: Promethazine suppository 25 mg — sig: insert 1 suppository PR q6h PRN nausea; dispense #12
            > MAX DAILY USE: 1 × 4 times (q6h) = 4 suppositories/day (PRN = use maximum)
            > DAYS SUPPLY: 12 ÷ 4 = 3 days
            > NASAL SPRAYS: (Total sprays in bottle ÷ sprays per day); e.g., 120-spray bottle, 2 sprays each nostril BID = 8 sprays/day = 15 days
            > VAGINAL CREAMS: Calculate by weight (g) — same as topical cream calculation
            > KEY: PRN = assume maximum daily usage for days supply calculation
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 6 days",
                "B. 4 days",
                "C. 3 days",
                "D. 12 days"
            ],
            correctAnswer: "C. 3 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.78,
            angle: .dosing,
            baseConceptTitle: "SPECIALTY FORM DAYS SUPPLY"
        ),

    ]}
}
