//
//  Domain4_OrderEntry.swift
//  Synapse PTCE
//
//  Phase 4 — Domain 4: Order Entry & Processing (22.5% of 2026 PTCB Exam)
//  16 nodes covering SIG codes, route abbreviations, days' supply calculations,
//  NDC structure, metric/household conversions, percent strength, dilutions,
//  alligation, IV flow/drip rates, and weight-based dosing.
//
//  NOTE: Nodes with challengeType .proceduralMath show a formula + worked example
//  in the lore text, then ask a parallel problem via the answer options.
//  The "> QUERY:" line at the end of each lore text is extracted by EncounterView
//  and displayed as the question prompt above the answer choices.
//

import Foundation

extension DataNode {

    // MARK: - Domain 4 Node Set

    static let domain4Nodes: [DataNode] = [

        // ── 01 ── SIG CODES ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "SIG CODES",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > SIG ABBREVIATIONS — Latin signatura (directions for patient)
            > FREQUENCY:
            >   QD / QDay = once daily     BID = twice daily
            >   TID = three times daily    QID = four times daily
            >   QHS = every bedtime        PRN = as needed
            >   Q4H = every 4 hours        STAT = immediately
            > TIMING MODIFIERS:
            >   AC = before meals          PC = after meals
            >   HS = at bedtime            CC = with food
            > DOSE QUANTITIES:
            >   i, ii, iii = 1, 2, 3      ss = one-half
            >   cap = capsule              tab = tablet
            > ROUTES:
            >   PO = by mouth              SL = sublingual (under tongue)
            >   TOP = topical              PR = per rectum
            > QUERY: What does the SIG "ii caps PO QID PC" instruct the patient to do?
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take 2 capsules by mouth four times daily after meals",
                "B. Take 2 capsules by mouth four times daily before meals",
                "C. Take 2 tablets by mouth twice daily with food",
                "D. Take 2 capsules under the tongue four times daily after meals"
            ],
            correctAnswer: "A. Take 2 capsules by mouth four times daily after meals",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.06
        ),

        // ── 02 ── ROUTE ABBREVIATIONS ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "ROUTE CODES",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > OPHTHALMIC ROUTE ABBREVIATIONS (exam-critical):
            >   OD  = Oculus Dexter  = RIGHT eye
            >   OS  = Oculus Sinister = LEFT eye
            >   OU  = Oculus Uterque = BOTH eyes
            > OTIC (EAR) ROUTE ABBREVIATIONS:
            >   AD  = Auris Dextra   = RIGHT ear
            >   AS  = Auris Sinistra = LEFT ear
            >   AU  = Auris Utraque  = BOTH ears
            > MEMORY TIP:
            >   D = Dexter = RIGHT (think "dexterous" right hand)
            >   S = Sinister = LEFT
            >   U = Utraque / Uterque = BOTH (bilateral)
            > OTHER ROUTES:
            >   IM = intramuscular   IV = intravenous
            >   SC / SQ = subcutaneous    ID = intradermal
            >   NAS = nasal          VAG = vaginal
            > QUERY: The SIG "ii gtt OS BID" directs the patient to:
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Instill 2 drops in both eyes twice daily",
                "B. Instill 2 drops in the right eye twice daily",
                "C. Instill 2 drops in the left ear twice daily",
                "D. Instill 2 drops in the left eye twice daily"
            ],
            correctAnswer: "D. Instill 2 drops in the left eye twice daily",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28, yOffset: 0.08
        ),

        // ── 03 ── DAYS' SUPPLY — TABLETS ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > DAYS' SUPPLY FORMULA:
            >   Days Supply = Total Quantity Dispensed ÷ Daily Dose
            >   Daily Dose  = Dose per Administration × Frequency
            > WORKED EXAMPLE:
            >   Rx: Qty 60 tablets | Sig: 1 tab PO BID
            >   Daily Dose  = 1 tab × 2 (BID) = 2 tabs/day
            >   Days Supply = 60 ÷ 2 = 30 days ✓
            > FREQUENCY CONVERSIONS:
            >   QD=1  BID=2  TID=3  QID=4  Q6H=4  Q8H=3  Q12H=2
            > CRITICAL: Inaccurate days' supply causes insurance rejections,
            >   early refill flags, and compliance tracking errors.
            > QUERY: Qty 120 tablets, Sig: 2 tabs PO BID. Calculate the days' supply.
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 20 days",
                "B. 30 days",
                "C. 45 days",
                "D. 60 days"
            ],
            correctAnswer: "B. 30 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72, yOffset: 0.04
        ),

        // ── 04 ── DAYS' SUPPLY — LIQUIDS ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY: LIQ",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > DAYS' SUPPLY — ORAL LIQUID FORMULA:
            >   Days Supply = Total Volume (mL) ÷ Daily Volume (mL)
            >   Daily Volume = Volume per dose × Number of doses/day
            > WORKED EXAMPLE:
            >   Rx: 100 mL amoxicillin suspension | Sig: 5 mL PO BID
            >   Daily Volume = 5 mL × 2 = 10 mL/day
            >   Days Supply = 100 ÷ 10 = 10 days ✓
            > HOUSEHOLD CONVERSION REMINDER:
            >   1 teaspoon (tsp) = 5 mL
            >   1 tablespoon (tbsp) = 15 mL
            >   If SIG says "1 tsp TID": daily volume = 5 mL × 3 = 15 mL/day
            > QUERY: A 150 mL amoxicillin suspension, Sig: 10 mL PO TID. Days' supply?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 3 days",
                "B. 5 days",
                "C. 7 days",
                "D. 10 days"
            ],
            correctAnswer: "B. 5 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.06
        ),

        // ── 05 ── DAYS' SUPPLY — OPHTHALMIC ──────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY: EYE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > DAYS' SUPPLY — OPHTHALMIC DROPS:
            >   Standard drop size: 1 gtt = 0.05 mL (50 microliters)
            >   Total drops in bottle = Total volume (mL) ÷ 0.05 mL/gtt
            >   Daily drops = Drops/dose × Doses/day × Number of eyes
            >   Days Supply = Total drops ÷ Daily drops
            > WORKED EXAMPLE:
            >   Rx: 10 mL bottle | Sig: 1 gtt OU BID
            >   Total drops = 10 ÷ 0.05 = 200 drops
            >   Daily drops = 1 × 2 (BID) × 2 (OU = both eyes) = 4 drops/day
            >   Days Supply = 200 ÷ 4 = 50 days ✓
            > ROUTE REMINDER: OD=right, OS=left, OU=both eyes
            > QUERY: 5 mL ophthalmic solution, Sig: 1 gtt OD BID (0.05 mL/drop). Days' supply?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 25 days",
                "B. 50 days",
                "C. 75 days",
                "D. 100 days"
            ],
            correctAnswer: "B. 50 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.14
        ),

        // ── 06 ── NDC — STRUCTURE ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "NDC STRUCTURE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > NATIONAL DRUG CODE (NDC) — FDA drug identifier system
            > THREE SEGMENTS (10-digit total on label):
            >   SEGMENT 1 — LABELER CODE: Identifies the manufacturer,
            >     repackager, or distributor. Assigned by FDA.
            >   SEGMENT 2 — PRODUCT CODE: Identifies the specific drug,
            >     strength, and dosage form.
            >   SEGMENT 3 — PACKAGE CODE: Identifies the package type
            >     and size (e.g., 30-count bottle vs 100-count bottle).
            > THREE FORMAT CONFIGURATIONS:
            >   4-4-2 format (labeler-product-package)
            >   5-3-2 format
            >   5-4-1 format
            > EXAMPLE NDC: 0069-0150-41
            >   Labeler: 0069 (Pfizer)
            >   Product: 0150 (Zoloft 50 mg tablets)
            >   Package: 41 (30-count bottle)
            > QUERY: In an NDC number, the FIRST segment identifies the:
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Labeler — the manufacturer, repackager, or distributor",
                "B. Product — the specific drug name, strength, and dosage form",
                "C. Package — the container type and quantity",
                "D. DEA schedule of the drug"
            ],
            correctAnswer: "A. Labeler — the manufacturer, repackager, or distributor",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.10, yOffset: 0.96
        ),

        // ── 07 ── NDC — 11-DIGIT BILLING ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "NDC BILLING",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > NDC BILLING — 11-DIGIT FORMAT REQUIREMENT
            > Drug labels display NDC in 10 digits (with dashes).
            > Insurance claims require NDC submitted as 11 DIGITS (no dashes).
            > CONVERSION RULE — add a leading zero to the SHORT segment:
            >   4-4-2 label format → add 0 to labeler → 05-4-2 = 11 digits
            >   5-3-2 label format → add 0 to product → 5-04-2 = 11 digits
            >   5-4-1 label format → add 0 to package → 5-4-02 = 11 digits
            > EXAMPLE:
            >   Label NDC: "12345-678-90" (5-3-2 format = 10 digits)
            >   Billing NDC: "12345-0678-90" or "123450678​90" (11 digits)
            >   Leading zero added to the 3-digit product segment to make 4 digits.
            > ERROR RISK: Submitting 10-digit NDC to insurance causes claim rejection.
            > QUERY: For insurance claim submission, the NDC must always contain how many digits?
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 9 digits",
                "B. 10 digits",
                "C. 11 digits",
                "D. 12 digits"
            ],
            correctAnswer: "C. 11 digits",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30, yOffset: 0.97
        ),

        // ── 08 ── METRIC CONVERSIONS ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "METRIC CONVERT",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > METRIC SYSTEM CONVERSIONS — MASS:
            >   1 kilogram (kg) = 1,000 grams (g)
            >   1 gram (g)      = 1,000 milligrams (mg)
            >   1 milligram (mg) = 1,000 micrograms (mcg / μg)
            >   CHAIN: kg → g → mg → mcg (multiply by 1,000 going down)
            > METRIC SYSTEM — VOLUME:
            >   1 liter (L) = 1,000 milliliters (mL)
            > WEIGHT CONVERSION:
            >   1 kilogram = 2.2 pounds (lbs)
            >   Patient weight in kg = lbs ÷ 2.2
            > EXAMPLE CONVERSION:
            >   Convert 1.5 g to mg: 1.5 × 1,000 = 1,500 mg
            >   Convert 500 mcg to mg: 500 ÷ 1,000 = 0.5 mg
            > QUERY: Convert 0.25 grams to milligrams.
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 2.5 mg",
                "B. 25 mg",
                "C. 250 mg",
                "D. 2,500 mg"
            ],
            correctAnswer: "C. 250 mg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45, yOffset: 0.97
        ),

        // ── 09 ── HOUSEHOLD CONVERSIONS ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "HOUSEHOLD CONV",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > HOUSEHOLD TO METRIC CONVERSIONS (memorize these):
            >   1 teaspoon (tsp)     =   5 mL
            >   1 tablespoon (tbsp)  =  15 mL   (3 tsp)
            >   1 fluid ounce (fl oz) = 30 mL   (2 tbsp)
            >   1 cup               = 240 mL   (8 fl oz)
            >   1 pint              = 480 mL   (2 cups)
            >   1 quart             = 960 mL   (2 pints)
            >   1 gallon            = 3,840 mL (4 quarts)
            > WEIGHT CONVERSIONS:
            >   1 pound (lb)  = 454 grams (g)
            >   1 ounce (oz)  = 28.4 grams (g)
            >   1 kg          = 2.2 lbs
            > CLINICAL USE: Patients describe doses in household units.
            >   Pharmacists must convert for accurate dosing instructions.
            > QUERY: A prescription reads "1 tablespoon PO TID." How many mL does the patient take per day?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 15 mL/day",
                "B. 30 mL/day",
                "C. 45 mL/day",
                "D. 60 mL/day"
            ],
            correctAnswer: "C. 45 mL/day",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.65, yOffset: 0.97
        ),

        // ── 10 ── PERCENT STRENGTH (w/v) ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "% STRENGTH",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > PERCENT WEIGHT-IN-VOLUME (% w/v):
            >   Definition: grams of solute per 100 mL of solution
            >   1% w/v = 1 g / 100 mL = 1,000 mg / 100 mL = 10 mg/mL
            > CONVERSION SHORTCUT:
            >   % × 10 = mg/mL
            >   Example: 5% = 50 mg/mL
            > WORKED EXAMPLE — mg in a given volume:
            >   How many mg in 50 mL of a 1% solution?
            >   1% = 10 mg/mL × 50 mL = 500 mg ✓
            > OTHER PERCENT EXPRESSIONS:
            >   % w/w = grams solute / 100 grams preparation (ointments, creams)
            >   % v/v = mL solute / 100 mL preparation (alcohol solutions)
            > QUERY: How many milligrams of drug are in 100 mL of a 2% solution?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 20 mg",
                "B. 200 mg",
                "C. 2,000 mg",
                "D. 20,000 mg"
            ],
            correctAnswer: "C. 2,000 mg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.10, yOffset: 0.16
        ),

        // ── 11 ── PERCENT CALCULATION ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "% CALCULATION",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > CALCULATING PERCENT STRENGTH FROM GIVEN DATA:
            >   % w/v = (grams of solute ÷ total mL of solution) × 100
            > WORKED EXAMPLE:
            >   A solution contains 4 g of drug in 200 mL.
            >   % = (4 ÷ 200) × 100 = 0.02 × 100 = 2% ✓
            > INVERSE — finding grams from %:
            >   g = (% ÷ 100) × total mL
            >   Example: 0.9% NaCl in 1,000 mL:
            >   g = (0.9 ÷ 100) × 1,000 = 9 grams of NaCl ✓
            > COMMON % SOLUTIONS ON THE PTCE:
            >   0.9% NaCl = Normal Saline (NS) = 9 mg/mL
            >   0.45% NaCl = Half Normal Saline
            >   5% Dextrose in Water (D5W)
            > QUERY: A solution contains 5 g of drug in 250 mL. What is the % strength (% w/v)?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 0.5%",
                "B. 2%",
                "C. 5%",
                "D. 20%"
            ],
            correctAnswer: "B. 2%",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.35, yOffset: 0.16
        ),

        // ── 12 ── DILUTION: C₁V₁ = C₂V₂ ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DILUTION C1V1",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > DILUTION FORMULA — C₁V₁ = C₂V₂
            >   C₁ = starting concentration (stock solution)
            >   V₁ = volume of stock solution needed
            >   C₂ = desired final concentration
            >   V₂ = total final volume needed
            > SOLVE FOR V₁:  V₁ = (C₂ × V₂) ÷ C₁
            > WORKED EXAMPLE:
            >   Prepare 500 mL of 10% solution from a 70% stock:
            >   V₁ = (10% × 500 mL) ÷ 70% = 5,000 ÷ 70 = 71.4 mL of 70%
            >   Add 71.4 mL of 70% stock + 428.6 mL diluent = 500 mL total ✓
            > DILUENT VOLUME = Final Volume − V₁
            > QUERY: How many mL of 50% dextrose are needed to prepare 200 mL of 25% dextrose?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 50 mL",
                "B. 100 mL",
                "C. 150 mL",
                "D. 200 mL"
            ],
            correctAnswer: "B. 100 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55, yOffset: 0.16
        ),

        // ── 13 ── ALLIGATION ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "ALLIGATION",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > ALLIGATION — Mixing Two Different Concentrations
            > USE: When C1V1=C2V2 isn't enough (mixing two non-zero concentrations)
            > ALLIGATION ALTERNATE METHOD (tic-tac-toe grid):
            >   Step 1: Write higher % in top-left, desired % in center, lower % in bottom-left
            >   Step 2: Subtract diagonally (ignore negatives):
            >     Parts of HIGH = Desired − Lower %
            >     Parts of LOW  = Higher % − Desired
            >   Step 3: Total parts = Parts High + Parts Low
            >   Step 4: Volume of each = (Parts ÷ Total) × Final Volume
            > WORKED EXAMPLE: Prepare 400 mL of 5% from 10% and 1%:
            >   Parts of 10% = 5 − 1 = 4 parts
            >   Parts of  1% = 10 − 5 = 5 parts   |   Total = 9 parts
            >   Vol of 10% = (4/9) × 400 = 177.8 mL
            >   Vol of  1% = (5/9) × 400 = 222.2 mL ✓
            > QUERY: Prepare 300 mL of a 6% solution from 10% and 2% solutions. How many mL of 10%?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 75 mL",
                "B. 100 mL",
                "C. 150 mL",
                "D. 200 mL"
            ],
            correctAnswer: "C. 150 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.30
        ),

        // ── 14 ── IV FLOW RATE (mL/hr) ───────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV FLOW RATE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > IV FLOW RATE — mL per hour (mL/hr)
            > FORMULA:
            >   Flow Rate (mL/hr) = Total Volume (mL) ÷ Time (hours)
            > WORKED EXAMPLE:
            >   Order: 500 mL NS over 4 hours
            >   Flow Rate = 500 mL ÷ 4 hr = 125 mL/hr ✓
            > PUMP PROGRAMMING: Most IV pumps require mL/hr input.
            > INFUSION TIME from rate: Time = Volume ÷ Rate
            >   Example: 1,000 mL at 83 mL/hr → 1,000 ÷ 83 ≈ 12 hours
            > TOTAL VOLUME from rate + time: Volume = Rate × Time
            >   Example: 50 mL/hr × 8 hr = 400 mL total infused
            > QUERY: A physician orders 1,000 mL of NS to infuse over 8 hours. Flow rate in mL/hr?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 75 mL/hr",
                "B. 100 mL/hr",
                "C. 125 mL/hr",
                "D. 150 mL/hr"
            ],
            correctAnswer: "C. 125 mL/hr",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.52, yOffset: 0.04
        ),

        // ── 15 ── IV DRIP RATE (gtt/min) ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV DRIP RATE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > IV DRIP RATE — drops per minute (gtt/min)
            > FORMULA:
            >   Drip Rate (gtt/min) = (mL/hr × Drop Factor) ÷ 60
            >   OR: (Volume in mL × Drop Factor) ÷ Time in minutes
            > COMMON DROP FACTORS (gtt/mL) by tubing type:
            >   Macrodrip:  10 gtt/mL,  15 gtt/mL,  20 gtt/mL
            >   Microdrip:  60 gtt/mL  (standard for pediatrics/critical care)
            > WORKED EXAMPLE:
            >   Order: 500 mL at 100 mL/hr | Drop factor: 10 gtt/mL
            >   Drip Rate = (100 × 10) ÷ 60 = 1,000 ÷ 60 = 16.7 → 17 gtt/min ✓
            > NOTE: Round to nearest whole number for manual IV delivery.
            > QUERY: 500 mL infusing at 125 mL/hr using 15 gtt/mL drop factor. Drip rate in gtt/min?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 16 gtt/min",
                "B. 21 gtt/min",
                "C. 31 gtt/min",
                "D. 38 gtt/min"
            ],
            correctAnswer: "C. 31 gtt/min",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.80, yOffset: 0.97
        ),

        // ── 16 ── WEIGHT-BASED DOSING ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "WEIGHT-BASED DOSE",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > WEIGHT-BASED DOSING — mg/kg
            > STEP 1: Convert patient weight to kilograms (if given in lbs)
            >   kg = lbs ÷ 2.2
            > STEP 2: Calculate the dose
            >   Dose (mg) = Weight (kg) × Ordered dose (mg/kg)
            > STEP 3 (if divided doses): Per-dose amount = Total daily dose ÷ Frequency
            > WORKED EXAMPLE:
            >   Patient: 110 lbs | Order: 20 mg/kg/day in 2 divided doses
            >   Weight = 110 ÷ 2.2 = 50 kg
            >   Total daily dose = 50 × 20 = 1,000 mg/day
            >   Per dose = 1,000 ÷ 2 = 500 mg per dose ✓
            > CRITICAL: Double-check units (mg/kg vs mcg/kg — 1,000x difference!)
            >           Always document weight used for calculation.
            > QUERY: A child weighs 44 lbs. The ordered dose is 10 mg/kg. What is the correct dose?
            """,
            challengeType: .proceduralMath,
            options: [
                "A. 100 mg",
                "B. 150 mg",
                "C. 200 mg",
                "D. 440 mg"
            ],
            correctAnswer: "C. 200 mg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.97
        )
    ]
}
