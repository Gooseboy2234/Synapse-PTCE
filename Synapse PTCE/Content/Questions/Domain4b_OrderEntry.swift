//
//  Domain4b_OrderEntry.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 4 Expansion: Order Entry & Processing (22.5% of 2026 PTCB Exam)
//  8 additional nodes covering the math and workflow gaps tested on the PTCE:
//  powder volume, mEq calculations, temperature conversions, Roman numerals,
//  business math, insurance billing/DAW codes, TPN basics, and advanced days supply.
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
            > Some liquid medications — like amoxicillin suspension or vancomycin
            > injection — are sold as dry powder that you mix with water (called
            > reconstitution) because the drug breaks down quickly in liquid form.
            >
            > Here is the key insight: the powder itself takes up space in the final
            > solution. Even though it looks like it dissolves and disappears, it
            > actually adds to the final volume. This is called POWDER VOLUME (PV).
            >
            > Think of it like this: if you add a tablespoon of sugar to a glass
            > of water, the water level rises slightly — the sugar displaced some
            > volume. Powder in a vial does the same thing.
            >
            > THE FORMULA:
            >   Final Volume (FV) = Diluent Added (DA) + Powder Volume (PV)
            >   → Rearranged: PV = FV − DA
            >   → Rearranged: DA = FV − PV
            >
            > WORKED EXAMPLE (label says: "Add 78 mL to make 100 mL"):
            >   Diluent Added (DA) = 78 mL
            >   Final Volume (FV)  = 100 mL
            >   Powder Volume (PV) = 100 − 78 = 22 mL
            >   The powder itself contributed 22 mL to the final volume.
            >
            > WHY THIS MATTERS ON THE EXAM:
            >   Questions give you two of the three values (FV, DA, PV) and ask
            >   for the third. Plug into PV = FV − DA.
            >
            > NOW YOU TRY:
            >   A vial of vancomycin states: "Add 10 mL of sterile water."
            >   After adding 10 mL, the total volume in the vial is 12 mL.
            >   DA = 10 mL. FV = 12 mL. What is the powder volume?
            >   PV = FV − DA = 12 − 10 = 2 mL
            >
            > KEY: PV = FV − DA (the powder volume = what the powder contributes)
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
            > Electrolytes like potassium, sodium, and calcium carry an electrical
            > charge. Because of this charge, pharmacists measure them in
            > milliequivalents (mEq) rather than just milligrams. It is a unit
            > that accounts for both the mass AND the charge of the ion.
            >
            > You do not need to understand the chemistry deeply — you need the
            > formula and a few key numbers.
            >
            > THE FORMULA:
            >   mEq = (mg × valence) ÷ molecular weight (MW)
            >   Or flipped: mg = mEq × (MW ÷ valence)
            >
            > VALENCE = the charge on the ion.
            >   Monovalent ions (Na⁺, K⁺, Cl⁻): valence = 1
            >   Divalent ions (Ca²⁺, Mg²⁺): valence = 2
            >
            > THE NUMBERS YOU MUST KNOW:
            >   KCl (potassium chloride): MW = 74.5 g/mol, valence = 1
            >     → 1 mEq KCl = 74.5 mg ÷ 1 = 74.5 mg per mEq
            >   NaCl (sodium chloride): MW = 58.5, valence = 1 → 58.5 mg per mEq
            >   MgSO₄ (mag sulfate): MW = 120, valence = 2 → 60 mg per mEq
            >
            > WORKED EXAMPLE (mEq → mg):
            >   Order: 20 mEq of KCl. How many mg is that?
            >   mg = mEq × (MW ÷ valence) = 20 × (74.5 ÷ 1) = 20 × 74.5 = 1,490 mg
            >
            > NOW YOU TRY:
            >   Order: 40 mEq of KCl. KCl MW = 74.5; valence = 1.
            >   mg = 40 × (74.5 ÷ 1) = 40 × 74.5 = 2,980 mg
            >
            > KEY: mg = mEq × MW (for monovalent ions like KCl and NaCl)
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
            > Most countries and all pharmacy storage standards use Celsius (°C),
            > but US thermometers often show Fahrenheit (°F). You need to convert
            > between the two to verify that drugs are stored correctly.
            >
            > THE TWO FORMULAS:
            >   °C → °F:   multiply by 9/5, then add 32
            >   °F → °C:   subtract 32, then multiply by 5/9
            >
            > MEMORY TIP: "Remove the 32 first, then scale" (for °F → °C)
            >
            > USP STORAGE TEMPERATURE RANGES (memorize these):
            >   Controlled Room Temperature (CRT): 20–25°C (68–77°F)
            >   Refrigerator:                       2–8°C  (36–46°F)
            >   Freezer:                       −25 to −10°C (−13 to 14°F)
            >   Body temperature:                  37°C   (98.6°F)
            >
            > CONVERSIONS WORTH MEMORIZING:
            >   0°C = 32°F (water freezes)
            >   100°C = 212°F (water boils)
            >   37°C = 98.6°F (body temperature)
            >   25°C = 77°F (room temperature)
            >
            > WORKED EXAMPLE (°C → °F):
            >   Convert 25°C: (25 × 9/5) + 32 = 45 + 32 = 77°F ✓
            >
            > NOW YOU TRY:
            >   A medication requires refrigeration (2–8°C).
            >   The refrigerator reads 39°F. Is this within range?
            >   Step 1: °C = (39 − 32) × 5/9 = 7 × 5/9 = 35/9 = 3.9°C
            >   Step 2: Is 3.9°C between 2°C and 8°C? YES — it is within range.
            >
            > KEY: Refrigerator = 2–8°C; CRT = 20–25°C; Body temp = 37°C
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
            > Roman numerals appear on handwritten prescriptions — most often for
            > quantities and occasionally for doses. You need to read them
            > accurately because misreading "xl" as 11 instead of 40 could mean
            > a patient gets 40 extra tablets.
            >
            > THE SEVEN BASE VALUES:
            >   I = 1    V = 5    X = 10
            >   L = 50   C = 100  D = 500   M = 1000
            >
            > THE KEY RULE — SUBTRACTION:
            >   When a smaller value appears BEFORE a larger value, subtract it.
            >   IV = 5 − 1 = 4
            >   IX = 10 − 1 = 9
            >   XL = 50 − 10 = 40
            >   XC = 100 − 10 = 90
            >   CD = 500 − 100 = 400
            >
            >   When a larger or equal value comes first, ADD:
            >   VI = 5 + 1 = 6
            >   XI = 10 + 1 = 11
            >   LX = 50 + 10 = 60
            >
            > COMMON PRESCRIPTION QUANTITIES:
            >   i=1  ii=2  iii=3  iv=4  vi=6  viii=8  x=10  xii=12
            >   xv=15  xx=20  xxx=30  xl=40  xlv=45  l=50  lx=60  xc=90
            >
            > NOW YOU TRY:
            >   A prescription reads "Disp: caps xlv"
            >   Break it down: xl = 40 (X before L = subtract), v = 5
            >   xlv = 40 + 5 = 45 capsules
            >
            > KEY: XL = 40 (not 14). IX = 9 (not 11). Smaller before larger = subtract.
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
            > A pharmacy is a business. It buys drugs at one price (acquisition
            > cost) and sells them at a higher price (selling price). The
            > difference is the markup — this pays for staff, rent, and overhead.
            >
            > THE THREE CORE FORMULAS:
            >
            >   Selling Price = Acquisition Cost + Markup Amount
            >     OR: Selling Price = Cost × (1 + Markup%)
            >
            >   Markup Amount = Selling Price − Acquisition Cost
            >
            >   Markup % = (Markup Amount ÷ Acquisition Cost) × 100
            >
            > IMPORTANT NOTE — Markup% vs Gross Profit%:
            >   Markup% uses COST as the denominator.
            >   Gross Profit% uses SELLING PRICE as the denominator.
            >   These give different numbers — read the question carefully.
            >
            > WORKED EXAMPLE:
            >   Pharmacy buys amoxicillin for $8, sells for $12.
            >   Markup Amount = $12 − $8 = $4
            >   Markup % = ($4 ÷ $8) × 100 = 50%
            >   Gross Profit % = ($4 ÷ $12) × 100 = 33.3%
            >
            > KEY TERMS:
            >   AWP (Average Wholesale Price): Published benchmark; actual cost is usually lower.
            >   Dispensing Fee: A flat per-prescription fee (e.g., $2 per Rx) added on top of cost.
            >
            > NOW YOU TRY:
            >   A pharmacy buys metformin for $5.00 and applies a 40% markup.
            >   Selling Price = $5.00 × (1 + 0.40) = $5.00 × 1.40 = $7.00
            >
            > KEY: Selling Price = Cost × (1 + Markup%). A 40% markup on $5 = $7.
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
            > When a patient has insurance, the pharmacy sends a claim to the
            > insurance company (via a Pharmacy Benefit Manager, or PBM) to get
            > reimbursed. The claim is an electronic form with specific fields.
            >
            > KEY CLAIM FIELDS:
            >   BIN — 6-digit routing number that directs the claim to the right PBM
            >   PCN — further narrows routing within the PBM
            >   Group Number — identifies the patient's employer or benefit plan
            >   Member ID — unique patient identifier (on the insurance card)
            >
            > DAW CODES (Dispense As Written) — entered on EVERY claim:
            >   These tell the insurance company WHY you dispensed brand vs. generic.
            >
            >   DAW 0 = No instruction given — generic substitution is fine
            >   DAW 1 = Prescriber says brand is medically necessary (writes "brand necessary")
            >   DAW 2 = Prescriber allows generic but PATIENT requests brand name
            >   DAW 3 = Pharmacist selected brand (patient had no preference)
            >   DAW 7 = State law requires brand (no generic available by law)
            >   DAW 9 = Other reason
            >
            > COMMON REJECT CODES:
            >   Reject 70 = Drug not covered (not on formulary)
            >   Reject 75 = Prior authorization required
            >   Reject 76 = Plan limit exceeded (too many refills or quantity limit hit)
            >   Reject 79 = Refill too soon (patient filling early)
            >
            > THE EXAM FAVORITE: The difference between DAW 1 and DAW 2.
            >   DAW 1 = THE PRESCRIBER decided brand is necessary.
            >   DAW 2 = THE PATIENT decided they want brand (prescriber is okay with generic).
            >
            > KEY: DAW 1 = prescriber-mandated brand; DAW 2 = patient-requested brand
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
            > Total Parenteral Nutrition (TPN) is a way to feed a patient entirely
            > through a vein when their digestive system cannot be used — such as
            > after major bowel surgery, in severe bowel disease, or in premature
            > infants whose gut is not ready.
            >
            > "Parenteral" means bypassing the GI tract. The formula goes directly
            > into a large central vein (usually the subclavian or jugular vein).
            >
            > WHAT IS IN TPN — THREE MACRONUTRIENTS:
            >   1. Dextrose — provides carbohydrate calories (3.4 kcal/g)
            >      Available as D10W, D20W, D50W, D70W
            >      (The number = grams per 100 mL — D50W has 50 g glucose per 100 mL)
            >
            >   2. Amino acids — provides protein (4 kcal/g)
            >      Available in concentrations like 3.5%, 8.5%, 10%
            >
            >   3. Lipid emulsion — provides fat (9 kcal/g)
            >      Provides essential fatty acids the body cannot make itself
            >      Must be PROTECTED FROM LIGHT
            >
            > TWO TYPES OF TPN BAGS:
            >   2-in-1 TPN: dextrose + amino acids only (lipids hang separately)
            >     → Can use a 0.2 micron inline filter (fine particles only)
            >
            >   3-in-1 TNA (Total Nutrient Admixture): dextrose + amino acids + lipids
            >     → Lipid droplets are too large to pass through a 0.2 micron filter
            >     → MUST use a 1.2 micron filter — using 0.2 micron would clog it
            >
            > The filter question is the #1 TPN topic tested on the PTCE.
            >
            > STORAGE (USP 797):
            >   2-in-1: up to 30 hours at room temperature, 9 days refrigerated
            >   3-in-1 (with lipids): up to 24 hours at room temperature, 9 days refrigerated
            >
            > KEY: 3-in-1 TNA requires a 1.2 micron filter — NOT 0.2 micron
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
            > Pills are easy — count 30 tablets for a 30-day supply. But inhalers
            > and insulin pens need a calculation because you are dealing with
            > total actuations (puffs) or total units, not individual pills.
            >
            > INHALERS (Metered-Dose Inhalers, MDIs):
            >   The canister contains a fixed number of actuations (puffs).
            >   Formula: Days Supply = Total Actuations ÷ Actuations per Day
            >
            >   EXAMPLE — scheduled inhaler:
            >   Symbicort 160/4.5 mcg — 120 actuations/canister
            >   Sig: 2 puffs twice daily (BID) = 4 puffs/day
            >   Days supply = 120 ÷ 4 = 30 days
            >
            >   PRN (as-needed) inhalers — use MAXIMUM daily dose:
            >   Albuterol 200 actuations, Sig: 2 puffs q4-6h PRN
            >   Max = q4h = 6 times/day × 2 puffs = 12 puffs/day
            >   Days supply = 200 ÷ 12 = 16.7 → round DOWN = 16 days
            >
            > INSULIN PENS:
            >   Standard pen: 3 mL × 100 units/mL = 300 units/pen
            >   Formula: Days Supply = Total Units ÷ Units per Day
            >
            >   EXAMPLE — 5 pens of Lantus 100 units/mL, inject 30 units at bedtime:
            >   Total units = 5 pens × 300 units/pen = 1,500 units
            >   Days supply = 1,500 ÷ 30 = 50 days
            >
            > NOW YOU TRY:
            >   Advair Diskus 230/21 mcg — 60 doses/inhaler
            >   Sig: 1 inhalation twice daily (BID) = 2 doses per day
            >   Days supply = 60 ÷ 2 = 30 days
            >
            > KEY: Days Supply = Total Doses ÷ Doses per Day (same formula for all)
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
