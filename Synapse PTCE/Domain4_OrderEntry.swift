//
//  Domain4_OrderEntry.swift
//  Synapse PTCE
//
//  Phase 4 — Domain 4: Order Entry & Processing (22.5% of 2026 PTCB Exam)
//  16 nodes — plain-English loreText rewrite for maximum readability.
//
//  NOTE: Math nodes include step-by-step examples. The QUERY line is filtered
//  by TeachPanel and serves as the question prompt in the learn-first flow.
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
            > SIG codes are abbreviations written on prescriptions to tell the pharmacy and patient how to take the medication. They come from Latin — the original language of pharmacy and medicine.
            > You will see these on every prescription you handle. Decoding them correctly is essential.
            > FREQUENCY (how often):
            > QD or QDay = once daily. BID = twice daily (twice a day). TID = three times daily. QID = four times daily. Q4H = every 4 hours. Q6H = every 6 hours. QHS = every bedtime (hora somni). PRN = as needed. STAT = immediately.
            > TIMING (when relative to food):
            > AC = ante cibum = before meals. PC = post cibum = after meals. HS = at bedtime (hora somni). CC = cum cibo = with food.
            > QUANTITY/DOSE FORM:
            > i, ii, iii = 1, 2, 3 (Roman numerals). ss = one-half. tab = tablet. cap = capsule. gtt = drops.
            > ROUTE (how the drug enters the body):
            > PO = per os = by mouth. SL = sublingual = under the tongue. TOP = topical (on the skin). PR = per rectum. IM = intramuscular. IV = intravenous.
            > HOW TO READ A SIG: Work left to right — dose → route → frequency → timing.
            > Example: "i tab PO BID AC" = 1 tablet by mouth twice daily before meals.
            > KEY: SIG codes are the language of prescriptions. QD=daily, BID=2x/day, TID=3x/day, QID=4x/day. PO=by mouth, SL=under tongue. AC=before meals, PC=after meals.
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
            > Eye and ear route abbreviations are among the most commonly confused SIG codes — and mixing them up means putting ear drops in someone's eye (or vice versa), which can be dangerous.
            > OPHTHALMIC (EYE) ABBREVIATIONS:
            > OD = Oculus Dexter = RIGHT eye. OS = Oculus Sinister = LEFT eye. OU = Oculus Uterque = BOTH eyes.
            > OTIC (EAR) ABBREVIATIONS:
            > AD = Auris Dextra = RIGHT ear. AS = Auris Sinistra = LEFT ear. AU = Auris Utraque = BOTH ears.
            > MEMORY TRICK — the letters D, S, U appear in all of them:
            > D = Dexter/Dextra = RIGHT (think of a "right-handed" / "dexterous" person). S = Sinister = LEFT (Latin for left, also where the word "sinister" comes from). U = Uterque/Utraque = BOTH (bilateral — both sides).
            > So: OD = right eye. OS = left eye. OU = both eyes. AD = right ear. AS = left ear. AU = both ears.
            > OTHER ROUTES — also tested:
            > IM = intramuscular (injection into muscle). IV = intravenous (into a vein). SC or SQ = subcutaneous (under the skin). ID = intradermal (into the skin layers). NAS = nasal. VAG = vaginal.
            > Example: "ii gtt OS BID" = 2 drops in the LEFT EYE twice daily. Remember: O = ophthalmic (eye), S = sinister (left), ii = 2, gtt = drops.
            > KEY: OD/OS/OU = right/left/both EYES. AD/AS/AU = right/left/both EARS. D=right, S=left, U=both.
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
            > Days' supply tells the insurance company (and the pharmacy) how long a prescription will last. Getting this wrong causes insurance rejections or lets patients refill early.
            > THE FORMULA:
            > Days Supply = Total Quantity Dispensed ÷ Daily Dose
            > Daily Dose = Dose per Administration × Times per Day (frequency)
            > FREQUENCY NUMBERS to memorize:
            > QD = 1. BID = 2. TID = 3. QID = 4. Q6H = 4. Q8H = 3. Q12H = 2.
            > STEP-BY-STEP EXAMPLE:
            > Rx: Qty 60 tablets. Sig: 1 tab PO BID.
            > Step 1 — Daily dose: 1 tab × 2 (BID) = 2 tablets per day
            > Step 2 — Days supply: 60 ÷ 2 = 30 days
            > ANOTHER EXAMPLE:
            > Rx: Qty 90 tablets. Sig: 1 tab PO TID.
            > Daily dose: 1 × 3 (TID) = 3 tablets per day. Days supply: 90 ÷ 3 = 30 days.
            > NOW YOU TRY: Qty 120 tablets. Sig: 2 tabs PO BID.
            > Daily dose: 2 × 2 = 4 tablets per day. Days supply: 120 ÷ 4 = 30 days.
            > KEY: Days supply = Total quantity ÷ Daily dose. Daily dose = tablets per dose × frequency number. Always match the frequency abbreviation to its number: BID=2, TID=3, QID=4.
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
            > For liquid medications, the days' supply calculation works the same way as tablets — but you're working with mL instead of tablets.
            > THE FORMULA (same structure):
            > Days Supply = Total Volume (mL) ÷ Daily Volume (mL/day)
            > Daily Volume = Volume per dose × Number of doses per day
            > HOUSEHOLD CONVERSIONS (you must know these):
            > 1 teaspoon (tsp) = 5 mL. 1 tablespoon (tbsp) = 15 mL. 1 fluid ounce (fl oz) = 30 mL.
            > If the SIG uses teaspoons or tablespoons, convert to mL first.
            > STEP-BY-STEP EXAMPLE:
            > Rx: 100 mL amoxicillin suspension. Sig: 5 mL PO BID.
            > Step 1 — Daily volume: 5 mL × 2 (BID) = 10 mL per day
            > Step 2 — Days supply: 100 ÷ 10 = 10 days
            > ANOTHER EXAMPLE (household units):
            > Rx: 150 mL suspension. Sig: 1 tsp PO TID.
            > Convert: 1 tsp = 5 mL. Daily volume: 5 mL × 3 (TID) = 15 mL per day. Days supply: 150 ÷ 15 = 10 days.
            > NOW YOU TRY: 150 mL suspension, Sig: 10 mL PO TID.
            > Daily volume: 10 × 3 = 30 mL per day. Days supply: 150 ÷ 30 = 5 days.
            > KEY: Same formula as tablets but using mL. Convert household units first (1 tsp = 5 mL, 1 tbsp = 15 mL). Days supply = Total mL ÷ (mL per dose × doses per day).
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
            > Eye drop days' supply calculations have an extra step — you need to know how many drops are in a bottle, then figure out how many drops are used per day.
            > STANDARD DROP SIZE: 1 drop (gtt) = 0.05 mL (50 microliters). This is the standard used on the PTCB.
            > STEP 1 — Total drops in the bottle:
            > Total drops = Total volume (mL) ÷ 0.05 mL per drop
            > Example: 10 mL bottle ÷ 0.05 = 200 drops total
            > STEP 2 — Daily drops used:
            > Daily drops = Drops per dose × Doses per day × Number of eyes being treated
            > OD = 1 eye. OS = 1 eye. OU = 2 eyes (both).
            > STEP 3 — Days supply:
            > Days supply = Total drops ÷ Daily drops
            > WORKED EXAMPLE:
            > Rx: 10 mL bottle. Sig: 1 gtt OU BID.
            > Total drops: 10 ÷ 0.05 = 200 drops. Daily drops: 1 × 2 (BID) × 2 (OU = both eyes) = 4 drops/day. Days supply: 200 ÷ 4 = 50 days.
            > NOW YOU TRY: 5 mL bottle. Sig: 1 gtt OD BID.
            > Total drops: 5 ÷ 0.05 = 100 drops. Daily drops: 1 × 2 (BID) × 1 (OD = one eye) = 2 drops/day. Days supply: 100 ÷ 2 = 50 days.
            > KEY: 1 drop = 0.05 mL. Total drops = volume ÷ 0.05. Daily drops = dose × frequency × number of eyes. OU = both eyes (multiply by 2).
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
            > The National Drug Code (NDC) is a unique identification number that the FDA assigns to every drug product sold in the United States. Think of it as a drug's "fingerprint" — no two different drug products share the same NDC.
            > Every NDC has THREE segments — each segment tells you something different:
            > SEGMENT 1 — LABELER CODE: Who manufactured, packaged, or distributed the drug? This number identifies the company. The FDA assigns labeler codes. Example: "0069" = Pfizer.
            > SEGMENT 2 — PRODUCT CODE: What is the specific drug? This identifies the drug name, strength (how strong — like 50mg vs 100mg), and dosage form (tablet vs. capsule vs. liquid). Different strengths of the same drug have different product codes.
            > SEGMENT 3 — PACKAGE CODE: What size/type of package is it? A 30-count bottle of the same drug has a different package code than the 90-count bottle or the hospital unit-dose blister pack.
            > THREE POSSIBLE FORMATS for how the 10 digits are arranged:
            > 4-4-2: 4 digits + 4 digits + 2 digits (labeler-product-package)
            > 5-3-2: 5 digits + 3 digits + 2 digits
            > 5-4-1: 5 digits + 4 digits + 1 digit
            > EXAMPLE NDC: 0069-0150-41 → Labeler: 0069 (Pfizer), Product: 0150 (Zoloft 50mg tablets), Package: 41 (30-count bottle)
            > KEY: NDC = 3 segments: (1) Labeler = who made it, (2) Product = what drug/strength/form, (3) Package = what size/type. The FIRST segment identifies the manufacturer/labeler.
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
            > Here's an important detail about NDC numbers that trips up pharmacy staff: the number on the drug LABEL uses 10 digits (with dashes), but insurance claims require 11 digits (no dashes).
            > WHY THE DIFFERENCE? Drug labels print the NDC in one of three 10-digit formats (4-4-2, 5-3-2, or 5-4-1). Insurance billing systems are standardized to a fixed 11-5-4-2 format (always 5-4-2, which means 5+4+2 = 11 digits without dashes).
            > HOW TO CONVERT: Add a LEADING ZERO to whichever segment is too short to make it the required length:
            > 4-4-2 format on label → labeler only has 4 digits, needs 5 → add "0" at the front of the labeler segment → becomes 5-4-2 (11 digits)
            > 5-3-2 format on label → product segment only has 3 digits, needs 4 → add "0" at the front of the product segment → becomes 5-4-2 (11 digits)
            > 5-4-1 format on label → package segment only has 1 digit, needs 2 → add "0" at the front of the package segment → becomes 5-4-2 (11 digits)
            > EXAMPLE:
            > Label shows: 12345-678-90 (5-3-2 format = 10 digits total)
            > For billing: Add zero to the 3-digit product segment → 12345-0678-90 (5-4-2 = 11 digits)
            > WHAT HAPPENS IF YOU SUBMIT 10 DIGITS? The insurance claim will be REJECTED automatically — the billing system won't match the NDC format it expects.
            > KEY: Drug label NDC = 10 digits. Insurance billing NDC = 11 digits. Add a leading zero to the short segment to convert. Always 5-4-2 format for billing (11 digits total, no dashes).
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
            > Pharmacy uses the metric system exclusively. You must be able to convert between units instantly — both for calculations and for catching dosing errors.
            > METRIC MASS UNITS (weight of drug) — going from large to small, multiply by 1,000 each step:
            > 1 kilogram (kg) = 1,000 grams (g)
            > 1 gram (g) = 1,000 milligrams (mg)
            > 1 milligram (mg) = 1,000 micrograms (mcg or μg)
            > Memory chain: kg → g → mg → mcg (each step = × 1,000 going down, ÷ 1,000 going up)
            > METRIC VOLUME UNITS:
            > 1 liter (L) = 1,000 milliliters (mL)
            > WEIGHT (patients): 1 kg = 2.2 pounds. Patient weight in kg = lbs ÷ 2.2
            > GOING FROM LARGER TO SMALLER UNIT: MULTIPLY by 1,000.
            > Example: 1.5 g → mg: 1.5 × 1,000 = 1,500 mg
            > GOING FROM SMALLER TO LARGER UNIT: DIVIDE by 1,000.
            > Example: 500 mcg → mg: 500 ÷ 1,000 = 0.5 mg
            > NOW YOU TRY: Convert 0.25 grams to milligrams.
            > Going from grams to milligrams = multiply by 1,000. 0.25 × 1,000 = 250 mg.
            > WHY THIS MATTERS: mg vs. mcg is a 1,000-fold difference. Writing "1 mg" when you mean "1 mcg" = 1,000× overdose. This is why unit verification is critical.
            > KEY: kg→g→mg→mcg, each step × 1,000 going down. 1 kg = 2.2 lbs. 1 g = 1,000 mg = 1,000,000 mcg. Always verify your units!
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
            > Patients measure medications with household items — teaspoons, tablespoons, ounces — but pharmacy works in metric. You must be able to convert between the two systems to calculate days' supply and give accurate dosing instructions.
            > VOLUME CONVERSIONS (household → metric) — memorize these exactly:
            > 1 teaspoon (tsp) = 5 mL (the most important one)
            > 1 tablespoon (tbsp) = 15 mL (= 3 teaspoons)
            > 1 fluid ounce (fl oz) = 30 mL (= 2 tablespoons)
            > 1 cup = 240 mL (= 8 fl oz)
            > 1 pint = 480 mL (= 2 cups)
            > 1 quart = 960 mL (= 2 pints)
            > 1 gallon = 3,840 mL (= 4 quarts)
            > WEIGHT CONVERSIONS:
            > 1 pound (lb) = 454 grams. 1 ounce (oz) = 28.4 grams. 1 kilogram = 2.2 lbs.
            > HOW TO USE IN CALCULATIONS:
            > If SIG says "1 tbsp TID," convert to mL first, then calculate:
            > 1 tbsp = 15 mL. Daily volume = 15 mL × 3 = 45 mL per day.
            > NOW YOU TRY: "1 tablespoon PO TID" — how many mL per day?
            > 1 tbsp = 15 mL. Times per day: 3 (TID). Total: 15 × 3 = 45 mL/day.
            > KEY: 1 tsp = 5 mL. 1 tbsp = 15 mL. 1 fl oz = 30 mL. These three are tested the most. When a SIG uses household units, convert to mL before calculating.
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
            > Percent strength tells you how much drug is dissolved in a liquid solution. The most common type in pharmacy is % weight-in-volume (% w/v).
            > DEFINITION of % w/v: grams of drug per 100 mL of solution.
            > So 1% w/v = 1 gram of drug in every 100 mL of solution.
            > SHORTCUT TO CONVERT % TO mg/mL:
            > % × 10 = mg/mL (because 1 g in 100 mL = 1,000 mg in 100 mL = 10 mg per mL)
            > Examples: 1% = 10 mg/mL. 2% = 20 mg/mL. 0.5% = 5 mg/mL.
            > FINDING mg IN A GIVEN VOLUME:
            > mg = (mg/mL concentration) × volume in mL
            > OR: mg = (% ÷ 100) × volume in mL × 1,000
            > WORKED EXAMPLE: How many mg in 50 mL of a 1% solution?
            > Method 1: 1% = 10 mg/mL. 10 mg/mL × 50 mL = 500 mg.
            > Method 2: (1 ÷ 100) × 50 × 1,000 = 500 mg. Both give the same answer.
            > COMMON SOLUTIONS to memorize: 0.9% NaCl (Normal Saline) = 9 mg/mL. 0.45% NaCl (Half Normal Saline) = 4.5 mg/mL. 5% Dextrose (D5W) = 50 mg/mL.
            > NOW YOU TRY: How many mg in 100 mL of a 2% solution?
            > 2% = 20 mg/mL. 20 × 100 = 2,000 mg.
            > KEY: % w/v = g per 100 mL. Shortcut: % × 10 = mg/mL. 0.9% NaCl = Normal Saline = 9 mg/mL. These appear on almost every pharmacy math section.
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
            > This is the reverse of the previous calculation — instead of using the percent to find how much drug is in a solution, you're CALCULATING the percent from the amounts given.
            > THE FORMULA:
            > % w/v = (grams of drug ÷ total mL of solution) × 100
            > STEP-BY-STEP EXAMPLE:
            > A solution contains 4 g of drug in 200 mL.
            > % = (4 ÷ 200) × 100 = 0.02 × 100 = 2%
            > FINDING GRAMS FROM PERCENT (reverse):
            > g = (% ÷ 100) × total mL
            > Example: How many grams of NaCl in 1,000 mL of 0.9% Normal Saline?
            > g = (0.9 ÷ 100) × 1,000 = 0.009 × 1,000 = 9 grams of NaCl
            > COMMON SOLUTIONS — match percent to grams:
            > 0.9% NaCl in 1 L = 9 g NaCl. 5% dextrose in 1 L = 50 g dextrose. 50% dextrose in 1 mL = 0.5 g dextrose.
            > NOW YOU TRY: A solution contains 5 g of drug in 250 mL. What is the % strength?
            > % = (5 ÷ 250) × 100 = 0.02 × 100 = 2%.
            > KEY: % w/v = (grams ÷ mL) × 100. To find grams from %: g = (% ÷ 100) × mL. Practice both directions — one gives you percent, the other gives you grams.
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
            > Dilution is when you take a concentrated drug solution (stock solution) and add water or diluent to make it weaker. You need to know how much of the concentrated solution to use.
            > THE FORMULA: C₁V₁ = C₂V₂
            > C₁ = starting concentration (the stronger stock solution you have)
            > V₁ = volume of the stock solution you need to use (what you're solving for)
            > C₂ = desired final concentration (what you want to end up with)
            > V₂ = total final volume you need to make
            > SOLVE FOR V₁: V₁ = (C₂ × V₂) ÷ C₁
            > DILUENT VOLUME (how much water to add): Diluent = V₂ − V₁
            > STEP-BY-STEP EXAMPLE:
            > Prepare 500 mL of 10% solution from a 70% stock.
            > V₁ = (10% × 500 mL) ÷ 70% = 5,000 ÷ 70 = 71.4 mL of 70% stock needed.
            > Diluent to add: 500 − 71.4 = 428.6 mL of water. Total = 500 mL at 10%.
            > NOW YOU TRY: How many mL of 50% dextrose are needed to prepare 200 mL of 25%?
            > V₁ = (25% × 200 mL) ÷ 50% = 5,000 ÷ 50 = 100 mL of 50% dextrose.
            > Diluent: 200 − 100 = 100 mL of water added to 100 mL of 50% = 200 mL of 25%.
            > KEY: C₁V₁ = C₂V₂. Rearrange to V₁ = (C₂ × V₂) ÷ C₁ to find how much stock solution you need. Diluent volume = final volume minus stock volume.
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
            > Alligation is used when you need to MIX two different concentrations of the SAME drug to get a desired intermediate concentration. You can't use C₁V₁=C₂V₂ for this because both solutions contain drug (one is not pure water).
            > Think of it like mixing two orange juices — one very concentrated, one very dilute — to get the right strength.
            > THE ALLIGATION ALTERNATE METHOD (tic-tac-toe grid):
            > Step 1: Write the HIGHER % in the top-left. The DESIRED % in the center. The LOWER % in the bottom-left.
            > Step 2: Subtract diagonally (take the absolute value — ignore negative signs):
            > Parts of HIGH concentration = Center % − Lower % (subtract across the diagonal)
            > Parts of LOW concentration = Higher % − Center % (subtract the other diagonal)
            > Step 3: Total parts = Parts of HIGH + Parts of LOW
            > Step 4: Volume of each = (Parts ÷ Total Parts) × Final Volume
            > WORKED EXAMPLE: Prepare 400 mL of 5% from 10% and 1% solutions.
            > Parts of 10%: 5 − 1 = 4 parts. Parts of 1%: 10 − 5 = 5 parts. Total = 9 parts.
            > Volume of 10%: (4/9) × 400 = 177.8 mL. Volume of 1%: (5/9) × 400 = 222.2 mL. Total = 400 mL ✓
            > NOW YOU TRY: Prepare 300 mL of 6% from 10% and 2%.
            > Parts of 10%: 6 − 2 = 4 parts. Parts of 2%: 10 − 6 = 4 parts. Total = 8 parts.
            > Volume of 10%: (4/8) × 300 = 150 mL.
            > KEY: Alligation = mixing two concentrations. Parts of HIGH = desired minus lower %. Parts of LOW = higher % minus desired. Then volume = (parts/total) × final volume.
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
            > When a patient receives an intravenous (IV) infusion, the drug is slowly delivered into their bloodstream through a drip. The flow rate controls how fast it goes in — critical for both safety and effectiveness.
            > FLOW RATE (mL/hr) = Total Volume (mL) ÷ Time (hours)
            > This tells you how many milliliters per hour to program into the IV pump.
            > STEP-BY-STEP EXAMPLE:
            > Order: Infuse 500 mL of Normal Saline over 4 hours.
            > Flow rate = 500 mL ÷ 4 hr = 125 mL/hr
            > Set the IV pump to 125 mL/hr.
            > YOU CAN ALSO REARRANGE THE FORMULA:
            > Find TOTAL TIME: Time (hr) = Volume (mL) ÷ Flow Rate (mL/hr)
            > Example: 1,000 mL at 83 mL/hr → 1,000 ÷ 83 ≈ 12 hours until the bag is empty.
            > Find TOTAL VOLUME infused: Volume (mL) = Flow Rate × Time
            > Example: Running at 50 mL/hr for 8 hours → 50 × 8 = 400 mL infused.
            > NOW YOU TRY: Order: 1,000 mL NS over 8 hours. Flow rate?
            > 1,000 ÷ 8 = 125 mL/hr.
            > KEY: Flow rate (mL/hr) = volume ÷ time. Simple division. IV pumps are programmed in mL/hr. Always double-check your answer by multiplying back: rate × time = volume.
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
            > When an IV is set up manually (without an electronic pump) — called gravity drip — you count drops per minute to control the flow rate. The number of drops per mL depends on the IV tubing used (called the "drop factor").
            > DRIP RATE FORMULA:
            > Drip Rate (gtt/min) = (Flow Rate in mL/hr × Drop Factor in gtt/mL) ÷ 60
            > OR equivalently: (Total Volume × Drop Factor) ÷ Total Time in minutes
            > DROP FACTOR by tubing type (printed on the IV tubing package):
            > Macrodrip tubing: 10 gtt/mL, 15 gtt/mL, or 20 gtt/mL (for standard adult infusions)
            > Microdrip tubing: 60 gtt/mL (for pediatric patients and critical care where precision matters — with 60 gtt/mL, drip rate in gtt/min equals mL/hr, which makes it easy to set)
            > WORKED EXAMPLE:
            > Flow rate: 100 mL/hr. Drop factor: 10 gtt/mL.
            > Drip rate = (100 × 10) ÷ 60 = 1,000 ÷ 60 = 16.7 → round to 17 gtt/min.
            > Round to nearest WHOLE NUMBER for manual counting — you can't count a fraction of a drop.
            > NOW YOU TRY: 500 mL infusing at 125 mL/hr, drop factor 15 gtt/mL.
            > Drip rate = (125 × 15) ÷ 60 = 1,875 ÷ 60 = 31.25 → round to 31 gtt/min.
            > KEY: Drip rate = (mL/hr × drop factor) ÷ 60. Always round to nearest whole number. Microdrip = 60 gtt/mL. Macrodrip = 10, 15, or 20 gtt/mL.
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
            > Weight-based dosing means the drug dose is calculated based on how much the patient weighs — not a one-size-fits-all amount. This is used especially for children, oncology drugs, and antibiotics where body size significantly affects the right dose.
            > Doses are expressed as mg/kg (milligrams per kilogram of body weight) or mg/kg/day.
            > THE 3-STEP PROCESS:
            > STEP 1: Convert weight to kilograms.
            > Pounds ÷ 2.2 = kilograms. Example: 110 lbs ÷ 2.2 = 50 kg.
            > STEP 2: Calculate total dose.
            > Total dose (mg) = Weight (kg) × Ordered dose (mg/kg).
            > Example: 50 kg × 20 mg/kg = 1,000 mg.
            > STEP 3: If the order is for divided doses, divide by frequency.
            > Per dose = Total daily dose ÷ doses per day.
            > Example: 1,000 mg/day ÷ 2 (BID) = 500 mg per dose.
            > WORKED EXAMPLE:
            > Patient: 110 lbs. Order: 20 mg/kg/day in 2 divided doses.
            > Weight: 110 ÷ 2.2 = 50 kg. Total daily dose: 50 × 20 = 1,000 mg/day. Per dose: 1,000 ÷ 2 = 500 mg every 12 hours.
            > NOW YOU TRY: Child weighs 44 lbs. Ordered dose: 10 mg/kg.
            > Weight: 44 ÷ 2.2 = 20 kg. Dose: 20 × 10 = 200 mg.
            > CRITICAL: Always double-check the units — mg/kg vs. mcg/kg is a 1,000-fold difference. A 10-fold or 1,000-fold dosing error in a child can be fatal.
            > KEY: Weight (kg) = lbs ÷ 2.2. Dose (mg) = kg × mg/kg. Always verify units and whether the dose is daily total or per dose.
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
