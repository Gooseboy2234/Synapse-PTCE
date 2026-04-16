//
//  Domain2b_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 2 Expansion: Federal Requirements (18.75% of 2026 PTCB Exam)
//  8 nodes — plain-English loreText rewrite for maximum readability.
//

import Foundation

extension DataNode {

    // MARK: - Domain 2b Node Set

    static let domain2bNodes: [DataNode] = [

        // ── 13 ── VALID PRESCRIPTION ELEMENTS ───────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "VALID RX ELEMENTS",
            loreText: """
            > A prescription is a legal document — and for it to be valid, it must contain specific required elements. As a pharmacy technician, you are the first line of defense: if a prescription is missing key information, you must flag it before it's filled.
            > REQUIRED ELEMENTS ON A VALID PRESCRIPTION — think of it as 8 essential pieces:
            > 1. Patient name and address (address required for controlled substances)
            > 2. Date the prescription was written (not the fill date — the date issued by the doctor)
            > 3. Drug name (generic or brand), strength, and dosage form (e.g., "metformin 500 mg tablets")
            > 4. Quantity to dispense (how many tablets, mL, etc.). For Schedule II, quantity is written in BOTH numbers AND words — e.g., "30 (thirty) tablets" — to prevent alterations.
            > 5. Directions (SIG): how the patient takes it — "1 tablet by mouth twice daily with meals"
            > 6. Number of refills: must be written out. If left blank on a non-controlled drug = 0 refills. Schedule II always = 0.
            > 7. Prescriber name, address, phone number, and DEA number (DEA number ONLY required for controlled substances — NOT required on non-controlled prescriptions)
            > 8. Prescriber's signature (manual for CII; electronic for EPCS)
            > KEY DISTINCTION: The prescriber's DEA number is ONLY required for controlled substance prescriptions (Schedule II–V). It is not needed for regular prescriptions like blood pressure medications or antibiotics.
            > KEY: DEA number required only for controlled substance Rxs (not regular non-controlled prescriptions). If refills are blank = 0 refills.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) The patient's insurance group number and BIN code",
                "B) The prescriber's DEA number, which is required on all prescriptions",
                "C) The prescriber's DEA number, which is required only for controlled substance prescriptions",
                "D) The pharmacist's NPI number and state license number"
            ],
            correctAnswer: "C) The prescriber's DEA number, which is required only for controlled substance prescriptions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.08
        ),

        // ── 14 ── DEA NUMBER VALIDATION ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DEA # VALIDATION",
            loreText: """
            > Every prescriber who can write controlled substance prescriptions has a DEA registration number. This number has a specific format AND a built-in mathematical check — meaning you can verify if a DEA number is mathematically valid.
            > FORMAT: Two letters followed by 7 digits. Example: AB1234563
            > FIRST LETTER = registrant type: A or B = older practitioners, C = current physician/prescriber, M = mid-level (nurse practitioner, physician assistant), F = distributor, etc.
            > SECOND LETTER = first letter of the prescriber's LAST NAME. So "Dr. Smith" should have DEA starting with "CS" if they're a physician.
            > VALIDATION FORMULA — memorize these 5 steps:
            > Using the 7-digit portion (1234563):
            > Step 1: Add the 1st + 3rd + 5th digits: 1 + 3 + 5 = 9
            > Step 2: Add the 2nd + 4th + 6th digits: 2 + 4 + 6 = 12
            > Step 3: Multiply Step 2 by 2: 12 × 2 = 24
            > Step 4: Add Steps 1 and 3: 9 + 24 = 33
            > Step 5: The LAST DIGIT of Step 4 should equal the 7th digit of the DEA number. Last digit of 33 = 3 ✓ (matches the "3" at the end of AB1234563)
            > If the check fails — the DEA number is INVALID. This is grounds to question whether the prescription is legitimate and to contact the prescriber before dispensing.
            > KEY: DEA validation formula — add odd positions (1+3+5), then double the sum of even positions (2+4+6), add them together. Last digit must equal 7th digit of DEA number.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) The last digit of (1st+3rd+5th) + 2×(2nd+4th+6th) must equal the 7th digit",
                "B) The sum of all 7 digits must be divisible by 7 with no remainder",
                "C) The first three digits must match the prescriber's NPI prefix code",
                "D) The 4th digit must equal the last digit of the prescriber's zip code"
            ],
            correctAnswer: "A) The last digit of (1st+3rd+5th) + 2×(2nd+4th+6th) must equal the 7th digit",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.14
        ),

        // ── 15 ── REFILL RULES BY SCHEDULE ──────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "REFILL RULES",
            loreText: """
            > Refill rules for controlled substances depend entirely on which DEA schedule the drug belongs to. This comparison is directly tested on the PTCB — you need the exact numbers.
            > SCHEDULE II (CII) — strictest:
            > ZERO refills — ever. Every single fill requires a brand-new prescription from the prescriber.
            > Examples: oxycodone, morphine, Adderall, Ritalin, fentanyl.
            > A prescriber CAN write multiple CII prescriptions on the same day for future use — but each one is still a "new" prescription, not a refill.
            > SCHEDULE III and IV (CIII / CIV):
            > Up to 5 refills allowed (plus the original = 6 total fills possible)
            > Must be used within 6 months of the DATE THE RX WAS WRITTEN
            > After 6 months or 5 refills (whichever comes first) — expired. Need a new prescription.
            > Examples: Tylenol with codeine (CIII), Xanax/Valium/Ambien/tramadol (CIV)
            > SCHEDULE V (CV):
            > Federal law doesn't set a specific refill limit — follow state law
            > Some CV cough preparations may be purchased OTC in certain states
            > NON-CONTROLLED PRESCRIPTIONS:
            > Valid for 1 YEAR from the date written (in most states)
            > Number of refills = whatever the prescriber writes. If blank = 0 refills.
            > KEY: CII = 0 refills. CIII/CIV = 5 refills in 6 months. These are the two numbers tested most often — memorize them cold.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Schedule II — 0 refills; Schedule III/IV — up to 5 refills within 6 months",
                "B) Schedule II — up to 3 refills within 90 days with DEA authorization",
                "C) All controlled substances — up to 5 refills within 6 months of the written date",
                "D) Schedule III/IV — up to 12 refills within 1 year of the written date"
            ],
            correctAnswer: "A) Schedule II — 0 refills; Schedule III/IV — up to 5 refills within 6 months",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.24
        ),

        // ── 16 ── CII PARTIAL FILLS & EMERGENCY DISPENSING ──────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CII PARTIAL FILLS",
            loreText: """
            > There are special situations where a Schedule II prescription can be filled in pieces or in an emergency without the usual written prescription rules.
            > PARTIAL FILLS — when the pharmacy can't fill the full quantity:
            > Normal rule: If the pharmacy has 60 tablets but the prescription is for 90, they can give 60 now. The remaining 30 must be picked up within 72 HOURS. If the pharmacy still can't supply the rest after 72 hours, they must contact the prescriber — a new prescription is required for the remainder.
            > For NURSING HOME (Long-Term Care Facility) patients: Partial fills can be done over a longer period — up to 60 DAYS from when the prescription was written. Total amount dispensed can never exceed what was originally prescribed.
            > For TERMINALLY ILL patients: Same 60-day rule. The prescriber must write "terminally ill" on the prescription.
            > EMERGENCY ORAL AUTHORIZATION (phone-in):
            > In a genuine emergency (patient will suffer if they don't get the medication right now and there's no time for a written Rx), a prescriber CAN call in a CII prescription verbally.
            > The pharmacist dispenses ONLY enough for the emergency period.
            > The prescriber MUST send a written prescription (or EPCS) within 7 DAYS with "Authorization for Emergency Dispensing" written on it.
            > If the written Rx doesn't arrive within 7 days, the pharmacist must notify the DEA.
            > KEY: Normal partial fill = rest must be dispensed within 72 hours. LTCF/terminally ill partial fill = 60 days. Emergency phone-in CII = written Rx must follow within 7 days.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 24 hours — the written Rx must arrive within 1 business day",
                "B) 7 days — the written Rx must be received within 7 days of oral authorization",
                "C) 30 days — standard monthly prescription cycle applies",
                "D) 72 hours — same as the standard partial-fill remainder window"
            ],
            correctAnswer: "B) 7 days — the written Rx must be received within 7 days of oral authorization",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.38
        ),

        // ── 17 ── ORANGE BOOK & GENERIC SUBSTITUTION ────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "ORANGE BOOK",
            loreText: """
            > The Orange Book is an FDA publication — its official name is "Approved Drug Products with Therapeutic Equivalence Evaluations." Pharmacists use it to determine whether a generic drug can safely replace a brand-name drug for a patient.
            > A generic drug is approved as "therapeutically equivalent" when it's proven to deliver the same amount of drug into the bloodstream at the same rate as the brand (called "bioequivalence").
            > THERAPEUTIC EQUIVALENCE CODES — the letters on the Orange Book rating:
            > "A" codes = therapeutically equivalent — it's SAFE TO SUBSTITUTE with the generic:
            > AB = most common rating; proven equivalent through bioequivalence studies
            > AA, AN, AO, AP, AT = equivalent for specific dosage forms (solutions, topicals, etc.)
            > "B" codes = NOT therapeutically equivalent — do NOT substitute without extra care
            > DAW CODES (Dispense As Written) — printed on the pharmacy claim for every fill:
            > DAW 0: No instructions from prescriber — generic substitution is OK (most common)
            > DAW 1: Prescriber writes "brand medically necessary" — NO substitution allowed
            > DAW 2: Prescriber allows substitution, but the PATIENT requests the brand
            > DAW 3: Pharmacist selects brand (patient is neutral)
            > NARROW THERAPEUTIC INDEX (NTI) drugs: Some states restrict generic substitution for NTI drugs (warfarin, levothyroxine, digoxin, phenytoin) — changing brands can cause dangerous level swings.
            > KEY: "AB" rated generic = therapeutically equivalent = can substitute. DAW 1 = prescriber says brand only. DAW 2 = patient wants brand.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) DAW 0 — no product selection indicated; generic substitution is permitted",
                "B) DAW 1 — prescriber indicates brand name is medically necessary; no substitution",
                "C) DAW 2 — patient requests brand; substitution allowed but patient-driven",
                "D) DAW 9 — other (plan-mandated brand)"
            ],
            correctAnswer: "B) DAW 1 — prescriber indicates brand name is medically necessary; no substitution",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.46
        ),

        // ── 18 ── MEDGUIDES & MEDICATION GUIDES ─────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "MEDGUIDES",
            loreText: """
            > A Medication Guide (MedGuide) is an FDA-required written information sheet that pharmacies must give to patients for certain medications. These are drugs where the FDA determined that written patient information is critical for safe use.
            > Unlike regular patient package inserts that come in the drug packaging, MedGuides are specifically required by the FDA and must be dispensed BY THE PHARMACY with every fill.
            > WHEN IS A MEDGUIDE REQUIRED? The FDA requires one when:
            > The drug has serious risks that patients need to know about to use it safely
            > Patient knowledge of the risk could prevent or reduce a serious adverse event
            > EXAMPLES of drugs that require MedGuides — these come up on the PTCB:
            > All antidepressants (SSRIs, SNRIs): Suicidality warning in young adults and teenagers
            > All NSAIDs (ibuprofen, naproxen): Heart attack, stroke, and GI bleeding risk
            > Isotretinoin (Accutane): Birth defect risk via iPLED+ REMS
            > Fluoroquinolone antibiotics (ciprofloxacin, levofloxacin): Tendon rupture, nerve damage
            > Antipsychotics: Increased mortality in elderly patients with dementia
            > Warfarin: Serious bleeding risk
            > HOW OFTEN: The MedGuide must be given EVERY time the medication is dispensed — including every refill, not just the first fill.
            > If the patient declines — you can still dispense, but document that the patient refused.
            > KEY: MedGuides are required by FDA for high-risk medications. Must be given at EVERY dispensing (including refills). Antidepressants, NSAIDs, warfarin, fluoroquinolones are classic examples.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Only once, at the time of the initial prescription dispensing",
                "B) Only when the patient specifically requests additional written information",
                "C) With every dispensing of the medication, including refills",
                "D) Only for new patients who have not previously received the drug"
            ],
            correctAnswer: "C) With every dispensing of the medication, including refills",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.58
        ),

        // ── 19 ── BIENNIAL INVENTORY & RECORD RETENTION ──────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "BIENNIAL INVENTORY",
            loreText: """
            > Every pharmacy that has a DEA registration (which is any pharmacy that dispenses controlled substances) is required by federal law to physically COUNT all of its controlled substances every 2 YEARS. This is called the biennial inventory.
            > "Biennial" = every two years (bi = two, ennial = years).
            > The count must be taken at either the OPENING or CLOSING of business on the chosen inventory day.
            > An INITIAL inventory must be taken on the first day a new pharmacy opens or first starts handling controlled substances.
            > HOW EXACT DOES THE COUNT NEED TO BE?
            > Schedule II: EXACT count required — count every single tablet, capsule, or mL.
            > Schedule III-V: An estimated count is acceptable IF the container holds 1,000 units or fewer. If a container holds MORE than 1,000 units → you must do an exact count too.
            > RECORD RETENTION RULES:
            > All controlled substance records must be kept for a MINIMUM of 2 YEARS.
            > Schedule II records must be stored SEPARATELY from Schedule III-V records.
            > Records must be available for DEA inspection within 2 BUSINESS DAYS if requested.
            > Note: Some states require longer retention (5-7 years) → always follow the MORE restrictive standard.
            > KEY: Biennial inventory = every 2 years. CII requires exact count. CIII-CV allows estimated count for containers ≤1,000 units. Records kept minimum 2 years.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) An exact count is required for all schedules during biennial inventory",
                "B) CII requires an exact count; CIII–CV allows an estimated count if container ≤ 1,000 units",
                "C) An estimated count is acceptable for all schedules to reduce pharmacy burden",
                "D) Exact count is only required for Schedule II opioids, not other CII medications"
            ],
            correctAnswer: "B) CII requires an exact count; CIII–CV allows an estimated count if container ≤ 1,000 units",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.72
        ),

        // ── 20 ── PRIOR AUTHORIZATION ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "PRIOR AUTH",
            loreText: """
            > Prior Authorization (PA) is when an insurance company requires ADVANCE APPROVAL before it will pay for a specific medication. Without this approval, the claim gets rejected and the patient either pays full price or goes without the medication.
            > Why does insurance require PA? To control costs by making sure expensive or high-risk medications are truly necessary before they pay for them.
            > WHEN IS PA TYPICALLY REQUIRED?
            > Brand-name drugs when a generic exists (unless the prescriber writes "DAW 1")
            > Expensive specialty medications (biologics, brand-name ADHD drugs)
            > Drugs on higher formulary tiers (Tier 3 or higher)
            > Medications that require step therapy — see below
            > STEP THERAPY (also called "fail first"): Insurance requires the patient to TRY a cheaper drug first, and prove it didn't work, before they'll pay for the more expensive drug.
            > Example: Insurance says try a generic SSRI for depression first. If it fails → then they'll approve the brand-name SNRI.
            > WHAT HAPPENS AT THE PHARMACY WHEN A PA IS NEEDED:
            > 1. The prescription is submitted to insurance → claim is REJECTED (reject code 75 = "Prior Authorization Required")
            > 2. The pharmacy tech notifies the pharmacist and the prescriber's office
            > 3. The prescriber's office submits clinical documentation to the insurance company
            > 4. Insurance approves or denies → if approved, the pharmacy gets an authorization number and reprocesses the claim
            > IMPORTANT: It is NOT the tech's or pharmacist's job to approve a PA — that's between the prescriber and insurance. The pharmacy's role is to notify and facilitate.
            > KEY: PA required = insurance rejects claim with code 75. Tech notifies pharmacist and prescriber's office. Prescriber submits PA request. Tech cannot approve PA.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) The pharmacist dispenses the medication and bills the claim retroactively",
                "B) The technician substitutes a formulary-approved generic without contacting the prescriber",
                "C) The technician notifies the pharmacist and prescriber's office so the prescriber can submit a PA request",
                "D) The prescription is automatically transferred to another pharmacy that accepts the plan"
            ],
            correctAnswer: "C) The technician notifies the pharmacist and prescriber's office so the prescriber can submit a PA request",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.32,
            yOffset: 0.85
        )

    ] // end domain2bNodes
}
