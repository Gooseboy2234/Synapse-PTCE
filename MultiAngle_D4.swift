
//
//  MultiAngle_D4.swift
//  Synapse PTCE
//
//  Multi-angle nodes for Domain 4: Order Entry & Processing
//  20 nodes covering dose calculations, days supply, IV flow rates, reconstitution, and sig codes
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D4: [DataNode] {[

        // MARK: — DOSE CALCULATIONS

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DOSE CALC / WEIGHT-BASED mg/kg",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Weight-based dose calculation (mg/kg)
            > FORMULA: Dose = Weight (kg) × Dose per kg (mg/kg)
            > EXAMPLE: Amoxicillin 40 mg/kg/day for a 22 lb child
            > STEP 1: Convert lb → kg: 22 ÷ 2.2 = 10 kg
            > STEP 2: Dose = 10 kg × 40 mg/kg = 400 mg/day
            > MAX DOSE: Always compare calculated dose to adult max — use whichever is LOWER
            > TIP: 1 kg = 2.2 lb; 1 lb = 0.454 kg
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 200 mg/day",
                "B. 400 mg/day",
                "C. 440 mg/day",
                "D. 880 mg/day"
            ],
            correctAnswer: "B. 400 mg/day",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.10,
            angle: .dosing,
            baseConceptTitle: "WEIGHT-BASED DOSING"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DOSE CALC / CRCL COCKCROFT-GAULT",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Creatinine clearance estimation
            > FORMULA: CrCl = [(140 – age) × IBW (kg)] / (72 × SCr) × 0.85 (if female)
            > PURPOSE: Estimate kidney function for dose adjustment of renally-cleared drugs
            > EXAMPLE: 65-year-old male, IBW 70 kg, SCr 1.4 mg/dL
            > CrCl = [(140–65) × 70] / (72 × 1.4) = [75 × 70] / 100.8 = 5250/100.8 ≈ 52 mL/min
            > CLINICAL USE: Adjust doses of vancomycin, aminoglycosides, metformin, digoxin, DOACs
            > IBW (male): 50 kg + 2.3 kg per inch over 5 feet
            """,
            challengeType: .multipleChoice,
            options: [
                "A. [(140 – age) × SCr] / (72 × IBW)",
                "B. [(140 – age) × IBW] / (72 × SCr) × 0.85 if female",
                "C. [SCr × age] / (IBW × 0.85)",
                "D. [(age – 140) × IBW] / SCr"
            ],
            correctAnswer: "B. [(140 – age) × IBW] / (72 × SCr) × 0.85 if female",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.10,
            angle: .dosing,
            baseConceptTitle: "CREATININE CLEARANCE"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DOSE CALC / BSA MOSTELLER",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Body surface area calculation for chemotherapy dosing
            > FORMULA (Mosteller): BSA (m²) = √[(Height cm × Weight kg) / 3600]
            > ALTERNATIVE: BSA = √[(Height inches × Weight lbs) / 3131]
            > USE: Chemotherapy agents, methotrexate, carboplatin dosing (AUC-based)
            > EXAMPLE: Patient 170 cm, 70 kg → BSA = √[(170 × 70) / 3600] = √[11900/3600] = √3.306 ≈ 1.82 m²
            > DOSE: If carboplatin = AUC × (CrCl + 25) → BSA used for many other chemotherapy agents
            > NORMAL BSA: Approximately 1.7–1.8 m² for average adult
            """,
            challengeType: .multipleChoice,
            options: [
                "A. BSA = (Height × Weight) / 1800",
                "B. BSA = √[(Height cm × Weight kg) / 3600]  — Mosteller formula",
                "C. BSA = Weight (kg) / Height (m)²",
                "D. BSA = (Weight kg × 0.425) × (Height cm × 0.725) × 0.007184"
            ],
            correctAnswer: "B. BSA = √[(Height cm × Weight kg) / 3600]  — Mosteller formula",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.18,
            angle: .dosing,
            baseConceptTitle: "BSA CALCULATION"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DOSE CALC / IDEAL BODY WEIGHT",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Ideal body weight formulas
            > IBW MALE: 50 kg + 2.3 kg for each inch over 5 feet
            > IBW FEMALE: 45.5 kg + 2.3 kg for each inch over 5 feet
            > USE: Cockcroft-Gault CrCl, aminoglycoside dosing, tidal volume in mechanical ventilation
            > OBESE PATIENTS: Use Adjusted Body Weight (ABW) = IBW + 0.4(ABW – IBW) for aminoglycosides
            > EXAMPLE (male, 5'10"): IBW = 50 + (2.3 × 10) = 50 + 23 = 73 kg
            """,
            challengeType: .multipleChoice,
            options: [
                "A. IBW (male) = 50 kg + 2.3 kg per inch over 5 feet",
                "B. IBW (male) = 45.5 kg + 2.3 kg per inch over 5 feet",
                "C. IBW (male) = 60 kg + 1.5 kg per inch over 5 feet",
                "D. IBW (male) = 70 kg × (height in meters)²"
            ],
            correctAnswer: "A. IBW (male) = 50 kg + 2.3 kg per inch over 5 feet",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.18,
            angle: .dosing,
            baseConceptTitle: "IDEAL BODY WEIGHT"
        ),

        // MARK: — DAYS SUPPLY

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / LIQUID MEDICATION",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for oral liquids
            > FORMULA: Days Supply = Total Volume Dispensed ÷ Daily Volume Used
            > DAILY VOLUME: Dose (mL) × Frequency per day
            > EXAMPLE: Amoxicillin 250 mg/5 mL — sig: 10 mL BID — dispense 150 mL
            > DAILY USE: 10 mL × 2 = 20 mL/day
            > DAYS SUPPLY: 150 mL ÷ 20 mL/day = 7.5 → round DOWN = 7 days
            > RULE: Always round DOWN for days supply (partial days don't count as full days)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 6 days",
                "B. 7 days (round down — 7.5 days rounded to nearest whole day)",
                "C. 8 days",
                "D. 10 days"
            ],
            correctAnswer: "B. 7 days (round down — 7.5 days rounded to nearest whole day)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.26,
            angle: .dosing,
            baseConceptTitle: "LIQUID DAYS SUPPLY"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / MDI INHALER",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for metered dose inhalers
            > FORMULA: Days Supply = Total Actuations ÷ Daily Actuations Used
            > EXAMPLE: Albuterol 90 mcg/actuation — sig: 2 puffs QID PRN — 200 actuations/canister
            > MAX DAILY USE (if PRN): Assumes maximum use: 2 puffs × 4 = 8 actuations/day
            > DAYS SUPPLY: 200 ÷ 8 = 25 days
            > NOTE: For scheduled inhalers, use as-written frequency (not PRN max)
            > ALWAYS USE LABELED ACTUATIONS: Do not subtract priming doses for days supply calculation unless specified
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 12 days",
                "B. 25 days",
                "C. 50 days",
                "D. 100 days"
            ],
            correctAnswer: "B. 25 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.26,
            angle: .dosing,
            baseConceptTitle: "INHALER DAYS SUPPLY"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / INSULIN VIAL",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating days supply for insulin vials
            > INSULIN VIAL: Standard vial = 10 mL = 1000 units (at 100 units/mL concentration)
            > FORMULA: Days Supply = Total Units Dispensed ÷ Daily Units Used
            > EXAMPLE: Insulin glargine 30 units once daily — dispense 1 vial (1000 units)
            > DAYS SUPPLY: 1000 ÷ 30 = 33.3 → round DOWN = 33 days
            > PENS: Insulin pen = 300 units (3 mL); 5-pen box = 1500 units
            > EXAMPLE PEN: 30 units/day from 5-pen box = 1500 ÷ 30 = 50 days
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 30 days",
                "B. 33 days (1000 units ÷ 30 units/day = 33.3, rounded down)",
                "C. 34 days",
                "D. 100 days — 1 vial always equals a 100-day supply"
            ],
            correctAnswer: "B. 33 days (1000 units ÷ 30 units/day = 33.3, rounded down)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.34,
            angle: .dosing,
            baseConceptTitle: "INSULIN DAYS SUPPLY"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY / SOLID DOSAGE FORMS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Days supply for tablets and capsules
            > FORMULA: Days Supply = Quantity Dispensed ÷ Daily Quantity Used
            > EXAMPLE: Metformin 500 mg — sig: 1 tablet BID — dispense #60 tablets
            > DAILY USE: 1 × 2 = 2 tablets/day
            > DAYS SUPPLY: 60 ÷ 2 = 30 days
            > EXAMPLE 2: Lisinopril 10 mg — sig: 1 tablet daily — dispense #90 = 90 days supply
            > EXAMPLE 3: Tramadol 50 mg — sig: 1–2 tabs q6h PRN — use MAX dose = 8 tabs/day → 30 tabs = 3.75 → 3 days
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 15 days",
                "B. 20 days",
                "C. 30 days",
                "D. 60 days"
            ],
            correctAnswer: "C. 30 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.34,
            angle: .dosing,
            baseConceptTitle: "TABLET DAYS SUPPLY"
        ),

        // MARK: — IV FLOW RATES

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV FLOW RATE / mL per HOUR",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating IV infusion rate in mL/hr
            > FORMULA: Rate (mL/hr) = Total Volume (mL) ÷ Infusion Time (hr)
            > EXAMPLE: 1000 mL NS ordered to infuse over 8 hours
            > RATE = 1000 ÷ 8 = 125 mL/hr
            > PUMP PROGRAMMING: Enter rate in mL/hr into IV infusion pump
            > TIP: If time given in minutes, convert to hours first (divide by 60)
            > EXAMPLE 2: 500 mL D5W over 4 hours = 500 ÷ 4 = 125 mL/hr
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 83 mL/hr",
                "B. 100 mL/hr",
                "C. 125 mL/hr",
                "D. 150 mL/hr"
            ],
            correctAnswer: "C. 125 mL/hr",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.42,
            angle: .dosing,
            baseConceptTitle: "IV FLOW RATE mL/HR"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV FLOW RATE / DROPS PER MINUTE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Manual IV drip rate calculation in drops per minute
            > FORMULA: gtt/min = (Volume mL × Drop Factor gtt/mL) ÷ Time (minutes)
            > COMMON DROP FACTORS: Macrodrip = 10, 15, or 20 gtt/mL; Microdrip = 60 gtt/mL
            > EXAMPLE: 500 mL over 4 hours (240 min) using 15 gtt/mL tubing
            > gtt/min = (500 × 15) ÷ 240 = 7500 ÷ 240 = 31.25 → 31 gtt/min
            > MEMORY AID: "mL/hr = gtt/min" when using 60 gtt/mL microdrip tubing
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 20 gtt/min",
                "B. 25 gtt/min",
                "C. 31 gtt/min",
                "D. 42 gtt/min"
            ],
            correctAnswer: "C. 31 gtt/min",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.42,
            angle: .dosing,
            baseConceptTitle: "IV DRIP RATE gtt/min"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV FLOW RATE / INFUSION TIME",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating total infusion time
            > FORMULA: Time (hr) = Total Volume (mL) ÷ Rate (mL/hr)
            > EXAMPLE: 250 mL IV antibiotic ordered at 83 mL/hr
            > TIME = 250 ÷ 83 = 3.01 hours ≈ 3 hours (or ~180 minutes)
            > CLINICAL: Know infusion time to schedule next bag, document in MAR, determine compatibility window
            > EXAMPLE 2: 1000 mL at 125 mL/hr = 1000 ÷ 125 = 8 hours total infusion time
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 2 hours",
                "B. 2.5 hours",
                "C. 3 hours",
                "D. 4 hours"
            ],
            correctAnswer: "C. 3 hours",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.50,
            angle: .dosing,
            baseConceptTitle: "INFUSION TIME CALCULATION"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV CONCENTRATION / MCMG PER HR",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Weight-based IV infusion rate (mcg/kg/min)
            > FORMULA: Rate (mL/hr) = [Dose (mcg/kg/min) × Weight (kg) × 60 min/hr] ÷ Concentration (mcg/mL)
            > EXAMPLE: Dopamine 5 mcg/kg/min for 80 kg patient — bag concentration 400 mg/250 mL = 1600 mcg/mL
            > RATE = (5 × 80 × 60) ÷ 1600 = 24000 ÷ 1600 = 15 mL/hr
            > USED FOR: Vasopressors, inotropes, heparin drips, insulin drips in ICU
            > CONCENTRATION: Always confirm mg/mL concentration before calculating rate
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 10 mL/hr",
                "B. 12 mL/hr",
                "C. 15 mL/hr",
                "D. 20 mL/hr"
            ],
            correctAnswer: "C. 15 mL/hr",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.50,
            angle: .dosing,
            baseConceptTitle: "WEIGHT-BASED IV RATE"
        ),

        // MARK: — RECONSTITUTION

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "RECONSTITUTION / POWDER VOLUME",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Understanding powder volume in reconstitution
            > POWDER VOLUME (PV): The volume contributed by the powder itself when dissolved
            > FORMULA: PV = Final Volume (FV) – Diluent Volume (DV)
            > EXAMPLE: Add 6.8 mL to amoxicillin 125 mg/5 mL (75 mL final volume)
            > PV = 75 – 6.8 = wait — label says "add 6.8 mL water for 75 mL"
            > INTERPRETATION: Final volume = 75 mL; Diluent added = 6.8 mL; Powder volume = 75 – 6.8 = 68.2 mL? No — PV = FV – DV = 75 – 68.2 = 6.8 mL
            > KEY POINT: Always add the exact diluent volume specified on the label
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Final Volume minus the Drug Amount in milligrams",
                "B. Final Volume minus the Diluent Volume added",
                "C. Diluent Volume plus the Drug Concentration",
                "D. Drug Amount divided by the Desired Concentration"
            ],
            correctAnswer: "B. Final Volume minus the Diluent Volume added",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.58,
            angle: .dosing,
            baseConceptTitle: "POWDER VOLUME"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "RECONSTITUTION / DOSE VOLUME",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Calculating volume to draw for a dose after reconstitution
            > FORMULA: Volume to draw = Desired Dose ÷ Available Concentration (after reconstitution)
            > EXAMPLE: Cefazolin 500 mg vial reconstituted with 2 mL sterile water → concentration = 500 mg/2.2 mL (powder volume adds 0.2 mL) ≈ 225 mg/mL
            > SIMPLER EXAMPLE: Amoxicillin 250 mg/5 mL suspension — prescriber orders 375 mg
            > VOLUME = 375 ÷ (250/5) = 375 ÷ 50 = 7.5 mL
            > C1V1 = C2V2: Alternative formula — (C1)(V1) = (C2)(V2) for dilution problems
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 5 mL",
                "B. 6 mL",
                "C. 7.5 mL",
                "D. 10 mL"
            ],
            correctAnswer: "C. 7.5 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.58,
            angle: .dosing,
            baseConceptTitle: "RECONSTITUTION DOSE"
        ),

        // MARK: — SIG CODES & METRIC CONVERSIONS

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "SIG CODES / FREQUENCY ABBREVIATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Common sig code frequency abbreviations
            > qd / QD: Every day (daily) — DANGEROUS ABBREVIATION; write 'daily' instead
            > bid / BID: Twice daily (bis in die)
            > tid / TID: Three times daily (ter in die)
            > qid / QID: Four times daily (quater in die)
            > prn / PRN: As needed (pro re nata)
            > qhs: Every bedtime (quaque hora somni)
            > q4h: Every 4 hours
            > qod: Every other day — DANGEROUS; write 'every other day' instead
            > ac: Before meals (ante cibum); pc: After meals (post cibum)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Every 6 hours (q6h)",
                "B. Every 4 hours (q4h)",
                "C. Three times daily (TID)",
                "D. Four times daily (QID)"
            ],
            correctAnswer: "D. Four times daily (QID)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "SIG FREQUENCY CODES"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "SIG CODES / ROUTE ABBREVIATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Classification — Common sig route abbreviations
            > po / PO: By mouth (per os) — oral route
            > SL: Sublingual (under the tongue) — nitroglycerin SL tablet
            > IV: Intravenous
            > IM: Intramuscular
            > SQ / SC / subQ: Subcutaneous (SubQ preferred — 'SC' can be confused with SL)
            > TOP: Topical
            > OD: Right eye (oculus dexter); OS: Left eye (oculus sinister); OU: Both eyes
            > AD: Right ear; AS: Left ear; AU: Both ears
            > PR: Per rectum (suppository)
            > NAS: Nasal; INH: Inhalation; BUCC: Buccal
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Per os — orally, by mouth",
                "B. Pro re nata — as needed",
                "C. Post cibum — after meals",
                "D. Primos — primary dose or loading dose"
            ],
            correctAnswer: "A. Per os — orally, by mouth",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "SIG ROUTE CODES"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "METRIC CONVERSIONS / KEY EQUIVALENTS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Essential metric and household measure conversions
            > WEIGHT: 1 kg = 2.2 lb; 1 g = 1000 mg; 1 mg = 1000 mcg; 1 mcg = 1000 ng
            > VOLUME: 1 L = 1000 mL; 1 tbsp = 15 mL; 1 tsp = 5 mL; 1 fl oz = 30 mL
            > 1 cup = 240 mL; 1 pint = 480 mL; 1 quart = 960 mL; 1 gallon = 3840 mL
            > LENGTH: 1 inch = 2.54 cm; 1 m = 100 cm = 39.37 inches
            > GRAIN: 1 grain = 64.8 mg (≈ 65 mg) — used in older Rx (aspirin "5 grains")
            > CRITICAL: 1 tablespoon = 15 mL (3 teaspoons); most common conversion on PTCE
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 5 mL",
                "B. 10 mL",
                "C. 15 mL",
                "D. 30 mL"
            ],
            correctAnswer: "C. 15 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.74,
            angle: .dosing,
            baseConceptTitle: "METRIC CONVERSIONS"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "PERCENT CONCENTRATION / w/v SOLUTIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Understanding percent concentration in solutions
            > DEFINITION: % w/v = grams of drug per 100 mL of solution
            > FORMULA: % = (g solute / mL solution) × 100
            > EXAMPLE: 1% lidocaine = 1 g lidocaine per 100 mL = 10 mg/mL
            > EXAMPLE: 0.9% NaCl = 0.9 g NaCl per 100 mL = 9 mg/mL
            > EXAMPLE: 50% dextrose = 50 g dextrose per 100 mL = 500 mg/mL
            > DEXTROSE: D5W = 5% = 5 g/100 mL = 50 mg/mL; D10W = 10% = 100 mg/mL
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1 mg/mL",
                "B. 5 mg/mL",
                "C. 10 mg/mL",
                "D. 100 mg/mL"
            ],
            correctAnswer: "C. 10 mg/mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.74,
            angle: .dosing,
            baseConceptTitle: "PERCENT CONCENTRATION"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DILUTION / C1V1 = C2V2",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — The dilution equation for pharmacy calculations
            > FORMULA: C1 × V1 = C2 × V2
            > WHERE: C1 = initial concentration; V1 = initial volume; C2 = final concentration; V2 = final volume
            > EXAMPLE: How many mL of a 20% KCl solution are needed to make 500 mL of 2% KCl?
            > SOLVE: 20% × V1 = 2% × 500 mL → V1 = (2 × 500) / 20 = 1000/20 = 50 mL
            > ADD: 50 mL of 20% KCl + 450 mL diluent = 500 mL of 2% KCl
            > USE CASE: Diluting concentrated drug stock solutions for IV admixtures
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 25 mL of 20% KCl solution",
                "B. 50 mL of 20% KCl solution",
                "C. 100 mL of 20% KCl solution",
                "D. 200 mL of 20% KCl solution"
            ],
            correctAnswer: "B. 50 mL of 20% KCl solution",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.82,
            angle: .dosing,
            baseConceptTitle: "DILUTION EQUATION"
        ),

        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "ALLIGATION / MIXING CONCENTRATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ANGLE: Dosing — Alligation method for mixing two concentrations
            > WHEN USED: When target concentration falls between two available concentrations
            > ALLIGATION MEDIAL: Finding the resulting concentration when mixing known volumes
            > ALLIGATION ALTERNATE: Finding the ratio of two concentrations needed to reach a target
            > EXAMPLE: Mix 10% and 2% solution to get 5%
            > STEP 1: Higher % – Desired = 10 – 5 = 5 (parts of lower%)
            > STEP 2: Desired – Lower % = 5 – 2 = 3 (parts of higher%)
            > RATIO: 3 parts of 10% : 5 parts of 2% to get 5% solution
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1 part of 10% and 1 part of 2%",
                "B. 3 parts of 10% and 5 parts of 2% — alligation alternate method",
                "C. 5 parts of 10% and 3 parts of 2%",
                "D. 2 parts of 10% and 5 parts of 2%"
            ],
            correctAnswer: "B. 3 parts of 10% and 5 parts of 2% — alligation alternate method",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.82,
            angle: .dosing,
            baseConceptTitle: "ALLIGATION METHOD"
        ),

    ]}
}
