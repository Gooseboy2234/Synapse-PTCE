//
//  Domain4b_OrderEntry.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 4 Expansion: Order Entry & Processing (22.5% of 2026 PTCB Exam)
//  8 additional nodes covering the math and workflow gaps tested on the PTCE:
//  powder volume, mEq calculations, temperature conversions, Roman numerals,
//  business math, insurance billing/DAW codes, TPN basics, and advanced days supply.
//
//  NOTE: All proceduralMath nodes use "> QUERY:" as the last lore line — this is
//  extracted by EncounterView and displayed as the question prompt.
//

import Foundation

extension DataNode {

    // MARK: - Domain 4b Node Set

    static let domain4bNodes: [DataNode] = [

        // ── 17 ── POWDER VOLUME ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "POWDER VOLUME",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Powder Volume — Reconstitution Calculations
            >
            > CONCEPT:
            >   When a dry powder antibiotic (e.g., amoxicillin, cefdinir) is reconstituted,
            >   the powder itself occupies VOLUME. This is the POWDER VOLUME (PV).
            >
            > FORMULA:
            >   Final Volume (FV) = Diluent Added (DA) + Powder Volume (PV)
            >
            >   Therefore: PV = FV − DA
            >              DA = FV − PV
            >
            > WORKED EXAMPLE:
            >   A 250 mg/5 mL amoxicillin suspension is to be made.
            >   The label says: Add 78 mL of water to make 100 mL.
            >   Diluent Added (DA) = 78 mL
            >   Final Volume (FV) = 100 mL
            >   Powder Volume (PV) = 100 − 78 = 22 mL
            >
            > PRACTICAL USE:
            >   If you need a different final concentration and must adjust the diluent,
            >   you need to know the powder volume to calculate how much diluent to add.
            >
            >   NEW DA = Desired FV − PV
            >
            > EXAMPLE PROBLEM:
            >   A vial contains 1 g of cefazolin powder.
            >   Adding 2.5 mL of sterile water yields a final volume of 3.0 mL.
            >   What is the powder volume?
            >   PV = 3.0 − 2.5 = 0.5 mL
            >
            > > QUERY: A vial of vancomycin powder states: add 10 mL to yield 12 mL.
            > > What volume does the powder occupy?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 0.5 mL",
                "B) 2 mL",
                "C) 10 mL",
                "D) 22 mL"
            ],
            correctAnswer: "B) 2 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.08
        ),

        // ── 18 ── mEq CALCULATIONS ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "mEq CALCULATIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Milliequivalents (mEq) — Electrolyte Calculations
            >
            > DEFINITION:
            >   A milliequivalent (mEq) is 1/1000 of an equivalent — the amount of
            >   an ion that reacts with 1 mole of hydrogen ions (H+).
            >   For monovalent ions (Na+, K+, Cl−): 1 mEq = 1 mmol
            >   For divalent ions (Ca²+, Mg²+): 1 mEq = 0.5 mmol
            >
            > FORMULA:
            >   mEq = (mass in mg) × (valence) ÷ (molecular weight in g/mol)
            >
            >   Or equivalently:
            >   mEq = mmol × valence
            >
            > KEY MOLECULAR WEIGHTS (MW) AND VALENCES:
            >   KCl (potassium chloride): MW = 74.5; K+ valence = 1
            >     → 1 mEq KCl = 74.5 mg ÷ 1 = 74.5 mg
            >   NaCl (sodium chloride): MW = 58.5; Na+ valence = 1
            >     → 1 mEq NaCl = 58.5 mg
            >   CaCl₂ (calcium chloride): MW = 147; Ca²+ valence = 2
            >     → 1 mEq CaCl₂ = 147 ÷ 2 = 73.5 mg
            >   MgSO₄ (magnesium sulfate): MW = 120; Mg²+ valence = 2
            >     → 1 mEq MgSO₄ = 60 mg
            >
            > WORKED EXAMPLE:
            >   How many mEq in 1,490 mg of KCl?
            >   mEq = 1,490 mg ÷ 74.5 mg/mEq = 20 mEq
            >
            > > QUERY: A pharmacist receives an order for 40 mEq of KCl.
            > > KCl MW = 74.5; valence = 1. How many milligrams is this?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 74.5 mg",
                "B) 1,862.5 mg",
                "C) 2,980 mg",
                "D) 400 mg"
            ],
            correctAnswer: "C) 2,980 mg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.16
        ),

        // ── 19 ── TEMPERATURE CONVERSIONS ────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "TEMP CONVERSIONS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Temperature Conversions — Pharmacy Storage Standards
            >
            > CONVERSION FORMULAS:
            >   °C → °F:   (°C × 9/5) + 32
            >   °F → °C:   (°F − 32) × 5/9
            >
            > PHARMACY STORAGE TEMPERATURE DEFINITIONS (USP):
            >   Controlled Room Temperature (CRT):  20–25°C  (68–77°F)
            >     Excursions: 15–30°C (59–86°F) permitted
            >   Refrigerator:                        2–8°C   (36–46°F)
            >   Freezer:                           −25 to −10°C  (−13 to 14°F)
            >   Deep Freezer:                       ≤ −40°C (≤ −40°F)
            >   Body temperature:                     37°C   (98.6°F)
            >   Warm:                              30–40°C  (86–104°F)
            >
            > COMMON CONVERSIONS TO MEMORIZE:
            >   Body temp:   37°C = 98.6°F
            >   Freezing:     0°C = 32°F
            >   Boiling:    100°C = 212°F
            >   Refrigerator midpoint: ~5°C = 41°F
            >
            > WORKED EXAMPLE:
            >   Convert 25°C to °F:
            >   (25 × 9/5) + 32 = 45 + 32 = 77°F ✓ (room temperature)
            >
            > > QUERY: A technician checks a medication that must be stored at 2–8°C.
            > > The refrigerator reads 39°F. Is this within range?
            > > [Hint: convert 39°F → °C using (°F − 32) × 5/9]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) No — 39°F = 1.7°C, which is below the 2°C minimum",
                "B) No — 39°F = 8.3°C, which exceeds the 8°C maximum",
                "C) Yes — 39°F = 3.9°C, which is within the 2–8°C range",
                "D) Yes — 39°F = 5.0°C, exactly at the midpoint of the range"
            ],
            correctAnswer: "C) Yes — 39°F = 3.9°C, which is within the 2–8°C range",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.28
        ),

        // ── 20 ── ROMAN NUMERALS ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "ROMAN NUMERALS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Roman Numerals on Prescriptions
            >
            > Roman numerals appear on handwritten prescriptions — mainly for quantities
            > and doses. A pharmacy technician MUST be able to read them accurately.
            >
            > BASE VALUES:
            >   I = 1     V = 5     X = 10
            >   L = 50    C = 100   D = 500    M = 1000
            >
            > RULES:
            >   — Add when larger/equal value comes FIRST:  VI = 6,  XI = 11
            >   — Subtract when smaller value comes BEFORE larger: IV = 4, IX = 9
            >   — Never subtract more than one smaller numeral: IIX is NOT valid (use VIII)
            >
            > COMMON PRESCRIPTION QUANTITIES:
            >   i    = 1         ii   = 2       iii  = 3
            >   iv   = 4         vi   = 6       viii = 8
            >   x    = 10        xii  = 12      xiv  = 14
            >   xv   = 15        xx   = 20      xxiv = 24
            >   xxx  = 30        xl   = 40      xlv  = 45
            >   l    = 50        lx   = 60      xc   = 90
            >   c    = 100
            >
            > EXAMPLES IN CONTEXT:
            >   "Disp: tabs xxxv" → Dispense 35 tablets
            >   "Sig: i tab q6h"  → 1 tablet every 6 hours
            >   "Refills: ii"     → 2 refills authorized
            >
            > > QUERY: A handwritten prescription reads "Disp: caps xlv."
            > > How many capsules should be dispensed?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 15 capsules",
                "B) 54 capsules",
                "C) 40 capsules",
                "D) 45 capsules"
            ],
            correctAnswer: "D) 45 capsules",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.75,
            yOffset: 0.38
        ),

        // ── 21 ── BUSINESS MATH ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "BUSINESS MATH",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Pharmacy Business Math — Pricing and Profitability
            >
            > KEY TERMS AND FORMULAS:
            >
            >   AWP (Average Wholesale Price):
            >     Published benchmark price; used as a reference for drug pricing.
            >     Actual acquisition cost is usually LOWER than AWP.
            >
            >   ACQUISITION COST (actual cost to pharmacy):
            >     The price the pharmacy actually pays to purchase the drug.
            >
            >   SELLING PRICE (dispensing price):
            >     Selling Price = Acquisition Cost + Markup Amount
            >     OR: Selling Price = Acquisition Cost × (1 + Markup %)
            >
            >   MARKUP AMOUNT:  Selling Price − Acquisition Cost
            >   MARKUP %:       (Markup Amount ÷ Acquisition Cost) × 100
            >
            >   GROSS PROFIT:   Selling Price − Acquisition Cost
            >                   (= Markup Amount — same thing)
            >
            >   GROSS PROFIT %: (Gross Profit ÷ Selling Price) × 100
            >     NOTE: Markup % uses cost as denominator; gross profit % uses selling price.
            >
            >   DISPENSING FEE: A flat fee added per prescription to cover pharmacy overhead.
            >     Selling Price = Acquisition Cost + Dispensing Fee
            >     (Common in PBM reimbursement formulas)
            >
            > WORKED EXAMPLE:
            >   A pharmacy purchases amoxicillin for $8.00 and sells it for $12.00.
            >   Markup Amount  = $12 − $8 = $4.00
            >   Markup %       = ($4 ÷ $8) × 100 = 50%
            >   Gross Profit % = ($4 ÷ $12) × 100 = 33.3%
            >
            > > QUERY: A pharmacy buys metformin for $5.00 and applies a 40% markup.
            > > What is the selling price?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) $2.00",
                "B) $5.40",
                "C) $7.00",
                "D) $9.00"
            ],
            correctAnswer: "C) $7.00",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30,
            yOffset: 0.52
        ),

        // ── 22 ── INSURANCE BILLING ──────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "INSURANCE BILLING",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Third-Party Billing — Insurance Claim Fields and Reject Codes
            >
            > REQUIRED FIELDS ON A PHARMACY INSURANCE CLAIM:
            >   BIN (Bank Identification Number): 6-digit routing number that directs
            >     the claim to the correct PBM (Pharmacy Benefit Manager).
            >   PCN (Processor Control Number): Additional routing by the BIN processor.
            >   GROUP NUMBER: Identifies the patient's employer or plan group.
            >   MEMBER ID (Cardholder ID): Unique patient identifier on the insurance card.
            >   PERSON CODE: 01 = cardholder, 02 = spouse, 03+ = dependents.
            >
            > DAW (DISPENSE AS WRITTEN) CODES — entered on every claim:
            >   DAW 0 = No product selection indicated (OK to substitute generic)
            >   DAW 1 = Prescriber writes "brand necessary" / "do not substitute"
            >   DAW 2 = Prescriber allows substitution; patient requests brand
            >   DAW 3 = Pharmacist selects brand (patient neutral)
            >   DAW 7 = Substitution not allowed; brand drug mandated by law
            >   DAW 9 = Other
            >
            > COMMON REJECT CODES (NCPDP):
            >   07 = M/I Cardholder ID (Member ID not found — verify card)
            >   14 = M/I Date of Birth (verify patient DOB)
            >   25 = Non-matched Pharmacy ID (wrong NCPDP # or NPI)
            >   26 = Non-matched Prescriber ID (DEA or NPI not on file)
            >   70 = Product/Service Not Covered (not on formulary)
            >   75 = Prior Authorization Required
            >   76 = Plan Limitations Exceeded (too early to refill / too many refills)
            >   79 = Refill Too Soon (most common — patient trying to fill before due date)
            >
            > COORDINATION OF BENEFITS (COB):
            >   Patient has two insurance plans. Primary pays first; secondary fills gap.
            >   COB claim submitted to secondary only after primary EOB is received.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) DAW 0 — no product selection indicated; generic is acceptable",
                "B) DAW 1 — prescriber indicates the brand is medically necessary",
                "C) DAW 2 — patient requests the brand name product",
                "D) DAW 7 — substitution not allowed by state law"
            ],
            correctAnswer: "B) DAW 1 — prescriber indicates the brand is medically necessary",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.62
        ),

        // ── 23 ── TPN BASICS ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "TPN BASICS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Total Parenteral Nutrition (TPN) — Basics for Pharmacy Technicians
            >
            > DEFINITION:
            >   TPN provides ALL nutritional requirements intravenously when the GI tract
            >   cannot be used (e.g., bowel obstruction, severe Crohn's, short bowel syndrome).
            >
            > MACRONUTRIENT COMPONENTS:
            >   1. DEXTROSE (carbohydrates):
            >      Caloric value: 3.4 kcal/g (compared to 4 kcal/g for dietary carbs)
            >      Concentrations: D10W, D20W, D50W, D70W — percent = g/100mL
            >      Maximum peripheral: D10W (higher concentrations require central line)
            >
            >   2. AMINO ACIDS (protein):
            >      Caloric value: 4 kcal/g
            >      Typical concentrations: 3.5%, 5%, 8.5%, 10%, 15%
            >
            >   3. LIPID EMULSION (fat):
            >      Caloric value: 9 kcal/g (10% emulsion = 1.1 kcal/mL; 20% = 2 kcal/mL)
            >      Provides essential fatty acids; prevents essential fatty acid deficiency.
            >      PROTECT FROM LIGHT — lipids are light-sensitive.
            >
            > TPN FORMULATION TYPES:
            >   2-in-1 (2-in-1 TPN): Dextrose + amino acids in one bag.
            >     Lipids infused separately through Y-site.
            >   3-in-1 (TNA — Total Nutrient Admixture): Dextrose + amino acids + lipids
            >     combined in one bag. CANNOT use 0.2 micron filter (lipids too large);
            >     must use 1.2 micron filter.
            >
            > BEYOND-USE DATING (USP 797):
            >   TPN with lipids (3-in-1): ≤ 24 hours at room temp; ≤ 9 days refrigerated
            >   2-in-1 (no lipids): ≤ 30 hours at room temp; ≤ 9 days refrigerated
            >   (Per updated USP 797 Category 2 with testing — facility-specific BUDs apply)
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 0.2 micron filter — it removes all particulates and bacteria from the bag",
                "B) 1.2 micron filter — lipid particles are too large to pass a 0.2 micron filter",
                "C) No filter required — TPN is sterile and filtering risks nutrient loss",
                "D) 5 micron filter — standard for all large-volume parenterals"
            ],
            correctAnswer: "B) 1.2 micron filter — lipid particles are too large to pass a 0.2 micron filter",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.32,
            yOffset: 0.75
        ),

        // ── 24 ── DAYS SUPPLY — INHALERS & INSULIN ──────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY: INHALERS",
            loreText: """
            > SECTOR-04 // ORDER_PROC
            > TOPIC: Days' Supply Calculations — Inhalers and Insulin Pens
            >
            > METERED-DOSE INHALERS (MDI):
            >   FORMULA:
            >     Total Actuations in Inhaler ÷ Actuations per Day = Days' Supply
            >
            >   EXAMPLE:
            >     Albuterol HFA 90 mcg — 200 actuations/canister
            >     Sig: 2 puffs q4-6h PRN (assume max = q4h = 6 times/day = 12 actuations/day)
            >     Days' supply = 200 ÷ 12 = 16.7 → round DOWN to 16 days
            >
            >   PRN inhalers: Use MAXIMUM possible daily dose (insurance requirement).
            >   Scheduled inhalers (e.g., Symbicort 2 puffs BID): 200 ÷ 4 = 50 days
            >
            > INSULIN PENS:
            >   FORMULA:
            >     Total Units in Package ÷ Units per Day = Days' Supply
            >
            >   Standard pen cartridge: 300 units/pen (3 mL × 100 units/mL)
            >   Example package: 5 pens = 1,500 units total
            >
            >   EXAMPLE:
            >     Lantus SoloSTAR 100 units/mL — 5 pens (1,500 units total)
            >     Sig: Inject 30 units subcutaneously at bedtime daily
            >     Days' supply = 1,500 units ÷ 30 units/day = 50 days
            >
            > INSULIN VIALS (10 mL):
            >   Units in vial = 10 mL × 100 units/mL = 1,000 units
            >   Days' supply = 1,000 ÷ daily units
            >
            > > QUERY: Fluticasone/salmeterol (Advair) 230/21 mcg — 60 doses/inhaler.
            > > Sig: 1 inhalation BID. How many days will one inhaler last?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 15 days",
                "B) 30 days",
                "C) 45 days",
                "D) 60 days"
            ],
            correctAnswer: "B) 30 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68,
            yOffset: 0.88
        )

    ] // end domain4bNodes
}
