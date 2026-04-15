//
//  Domain2b_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 2 Expansion: Federal Requirements (18.75% of 2026 PTCB Exam)
//  8 additional nodes covering the federal law gaps most likely to appear on the PTCE:
//  valid Rx elements, DEA number validation, refill rules by schedule, CII partial fills,
//  Orange Book / generic substitution, MedGuides, biennial inventory, and prior authorization.
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: 21 CFR § 1306 (controlled substances); state pharmacy practice acts
            >
            > REQUIRED ELEMENTS ON A VALID PRESCRIPTION:
            >
            >   [1] PATIENT information:
            >       Full name, address (required for controlled substances)
            >
            >   [2] DATE written (not the fill date — the date the Rx was issued)
            >
            >   [3] DRUG information:
            >       Drug name (generic or brand), strength, dosage form
            >
            >   [4] QUANTITY to dispense (#, mL, units)
            >       CII: quantity written out in BOTH numbers AND words recommended
            >       e.g., "30 (thirty)" — to prevent alterations
            >
            >   [5] DIRECTIONS (SIG): Complete instructions for the patient
            >
            >   [6] REFILLS:
            >       Must be stated (CII = 0 refills; if blank on non-controlled = 0)
            >
            >   [7] PRESCRIBER information:
            >       Full name, address, phone number, DEA number (for CS),
            >       NPI number (for billing)
            >
            >   [8] PRESCRIBER SIGNATURE:
            >       Manual signature (CII); electronic signature (EPCS compliant)
            >
            > CONTROLLED SUBSTANCE REQUIREMENT:
            >   Prescriber's DEA registration number is MANDATORY on all C-II through C-V Rx.
            >   DEA # is NOT required on non-controlled prescriptions.
            >
            > PHARMACIST DUTY: Verify prescription legitimacy before dispensing.
            >   A pharmacist may REFUSE to fill a suspicious or altered prescription.
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
            > SECTOR-02 // FEDERAL_LAW
            > TOPIC: DEA Registration Number — Validation Formula
            >
            > FORMAT: Two letters + Seven digits  (e.g., AB1234563)
            >
            > FIRST LETTER (registrant type):
            >   A or B = older practitioner registration
            >   C = practitioner (most common for physicians)
            >   D = teaching institution
            >   E = manufacturer
            >   F = distributor
            >   G = researcher
            >   M = mid-level practitioner (NP, PA, CRNA)
            >
            > SECOND LETTER: First letter of prescriber's LAST NAME
            >   e.g., Dr. Smith → second letter = S
            >
            > *** VALIDATION FORMULA (7-digit portion) ***
            >   Example DEA number: AB1234563  → digits: 1 2 3 4 5 6 3
            >
            >   STEP 1: ADD the 1st + 3rd + 5th digits:   1 + 3 + 5 = 9
            >   STEP 2: ADD the 2nd + 4th + 6th digits:   2 + 4 + 6 = 12
            >   STEP 3: MULTIPLY Step 2 result by 2:       12 × 2 = 24
            >   STEP 4: ADD Steps 1 and 3:                 9 + 24 = 33
            >   STEP 5: The LAST DIGIT of Step 4 = the 7th digit of the DEA number.
            >           Last digit of 33 = 3 ✓ (matches the 7th digit above)
            >
            > USE: Pharmacists use this to verify a DEA number is mathematically valid
            >   before dispensing a controlled substance prescription.
            >   A failed check is grounds to question legitimacy.
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: 21 CFR § 1306 (federal minimum; states may be MORE restrictive)
            >
            > REFILLS BY DEA SCHEDULE:
            >
            >   SCHEDULE II (CII):
            >     — ZERO refills permitted (federal law, no exceptions).
            >     — A new written Rx required for each fill.
            >     — Prescriber may issue multiple post-dated CII Rxs for legitimate
            >       medical purpose (allowed federally; some states restrict).
            >
            >   SCHEDULE III & IV (CIII / CIV):
            >     — Up to 5 refills allowed.
            >     — Prescription expires 6 months from DATE WRITTEN.
            >     — No refills may be dispensed after 6 months; new Rx required.
            >
            >   SCHEDULE V (CV):
            >     — No federal refill restriction (follow state law).
            >     — Some CVs (e.g., cough preparations) may be OTC in some states.
            >
            >   NON-CONTROLLED prescriptions:
            >     — Valid for up to 1 YEAR from date written (state law may vary).
            >     — Refills as written by prescriber; if none stated = 0 refills.
            >
            > VALIDITY (when Rx must be filled):
            >   CII: No federal time limit on filling (some states: 6 months).
            >   CIII–CV: Must be filled within 6 months of issue date.
            >
            > PARTIAL FILLS (CIII–CV): Allowed; remainder filled within 6 months / 5-refill limit.
            >
            > EARLY REFILLS: No federal rule defining "too early" for non-CS.
            >   However, third-party payers (insurance) typically enforce fill intervals.
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: 21 CFR § 1306.13 — Partial filling of prescriptions
            >
            > CII PARTIAL DISPENSING — WHEN ALLOWED:
            >
            >   STANDARD RULE: Pharmacist may partially fill a CII if unable to supply
            >     full quantity. Remainder must be dispensed within 72 HOURS.
            >     If unavailable after 72h, pharmacist notifies prescriber; new Rx required.
            >
            >   LONG-TERM CARE FACILITY (LTCF) PATIENTS:
            >     CII prescriptions may be filled in partial quantities.
            >     Total quantity dispensed may not exceed the quantity prescribed.
            >     All partial fills must be dispensed within 60 DAYS of the issue date.
            >
            >   TERMINALLY ILL PATIENTS:
            >     Same 60-day rule as LTCF.
            >     Prescriber must note "terminally ill" on the prescription.
            >
            > EMERGENCY ORAL CII AUTHORIZATION (21 CFR § 1306.11(d)):
            >   In a bona fide emergency, a prescriber may ORALLY authorize a CII.
            >   Pharmacist may dispense a LIMITED quantity (sufficient for emergency period).
            >   Prescriber must provide a WRITTEN Rx (with "Authorization for Emergency
            >   Dispensing" notation) within 7 DAYS of the oral authorization.
            >   If Rx not received within 7 days, pharmacist must notify the DEA.
            >
            > FACSIMILE (FAX) CII:
            >   Fax serves as the original written Rx ONLY for:
            >   — LTCF patients
            >   — Hospice / terminally ill patients
            >   — Compounded parenteral CS
            >   Otherwise, original Rx required at time of dispensing.
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: FDA — Approved Drug Products with Therapeutic Equivalence Evaluations
            >
            > THE ORANGE BOOK:
            >   Published by the FDA; lists all approved drug products and their
            >   THERAPEUTIC EQUIVALENCE (TE) ratings relative to reference-listed drugs (RLDs).
            >   Available online at accessdata.fda.gov/scripts/cder/ob
            >
            > THERAPEUTIC EQUIVALENCE CODES:
            >
            >   "A" CODES = Therapeutically equivalent (can be substituted):
            >     AB — Most common; bioequivalent in vivo (actual bioequivalence study).
            >     AA — Conventional dosage forms with no known bioequivalence concerns.
            >     AN — Solutions, powders for reconstitution.
            >     AO — Injectable oil solutions.
            >     AP — Injectable aqueous solutions.
            >     AT — Topical products meeting standards.
            >
            >   "B" CODES = NOT therapeutically equivalent (do NOT substitute):
            >     Bioequivalence data insufficient or not established.
            >
            > DAW (Dispense As Written) CODES — used in pharmacy billing:
            >   DAW 0 = No product selection indicated (generic substitution OK)
            >   DAW 1 = Substitution not allowed by PRESCRIBER (brand necessary)
            >   DAW 2 = Substitution allowed, but PATIENT requests brand
            >   DAW 3 = Substitution allowed, but pharmacist selects brand
            >   DAW 4–9 = Less common (plan-mandated, generic unavailable, etc.)
            >
            > GENERIC SUBSTITUTION LAWS:
            >   States may require OR permit substitution with AB-rated generics.
            >   Pharmacist must substitute unless DAW 1 or state law prohibits.
            >   Narrow Therapeutic Index (NTI) drugs: some states RESTRICT substitution
            >   (e.g., levothyroxine, warfarin, digoxin, phenytoin, cyclosporine).
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: 21 CFR § 208 — FDA Medication Guide regulations
            >
            > MEDICATION GUIDE (MedGuide):
            >   FDA-required written patient information for certain drugs.
            >   Must be DISTRIBUTED to patient with EVERY dispensing of the medication.
            >   If patient declines, pharmacist may dispense — document the refusal.
            >
            > WHEN IS A MEDGUIDE REQUIRED?
            >   The FDA mandates a MedGuide when:
            >   1. The drug has SERIOUS risks that could affect patient compliance or safety.
            >   2. Patient labeling could PREVENT serious adverse effects.
            >   3. The product has known SERIOUS RISKS that the FDA determines require
            >      a specific written communication.
            >
            > EXAMPLES of drugs requiring MedGuides:
            >   All antidepressants (SSRIs, SNRIs) — suicidality black box warning
            >   All NSAIDs — cardiovascular and GI bleeding risk
            >   Isotretinoin (Accutane) — via iPLED+ REMS program
            >   Fluoroquinolone antibiotics — tendon rupture, peripheral neuropathy
            >   Antipsychotics — increased mortality in elderly dementia patients
            >   Warfarin (Coumadin) — bleeding risk
            >   Blood thinners (DOACs) — bleeding risk
            >
            > PATIENT PACKAGE INSERT (PPI) vs. MEDGUIDE:
            >   PPI = older format; required for estrogen-containing products and
            >         oral contraceptives; content is less specific.
            >   MedGuide = FDA-mandated; contains standardized risk information.
            >
            > REMS vs. MEDGUIDE:
            >   A MedGuide may be part of a REMS program, but REMS is broader (may include
            >   prescriber enrollment, patient enrollment, controlled distribution, etc.).
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
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: 21 CFR § 1304.11 — Inventories of registrants
            >
            > BIENNIAL INVENTORY REQUIREMENT:
            >   Every DEA registrant (pharmacy, prescriber, etc.) must take a COMPLETE
            >   physical inventory of ALL controlled substances every 2 YEARS (biennially).
            >   — Must be taken within 2 years of the previous inventory date.
            >   — May be taken on ANY date (not necessarily exact 2-year anniversary).
            >   — Must be performed at the OPENING or CLOSING of business on inventory day.
            >
            > INITIAL INVENTORY: Required upon first day of business (new DEA registration).
            >
            > COUNTING REQUIREMENTS BY SCHEDULE:
            >   CII: EXACT COUNT required (count every tablet, capsule, mL).
            >   CIII–CV: ESTIMATED count acceptable if container holds ≤ 1,000 units.
            >           Exact count required if container holds > 1,000 units.
            >
            > RECORD RETENTION:
            >   CII records: Must be maintained SEPARATELY from CIII–CV records.
            >   All controlled substance records: Kept for MINIMUM 2 YEARS.
            >   (Some states require longer — follow the stricter standard.)
            >   Records must be readily retrievable for DEA inspection within 2 business days.
            >
            > WHAT RECORDS MUST BE KEPT:
            >   — Biennial inventory records
            >   — CII order forms (DEA Form 222 or CSOS electronic)
            >   — Dispensing records (CII separate)
            >   — DEA 106 (theft/significant loss report) — within 1 business day
            >   — DEA 41 (destruction record)
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
            > SECTOR-02 // FEDERAL_LAW
            > TOPIC: Prior Authorization (PA) — Insurance/Formulary Process
            >
            > PRIOR AUTHORIZATION (PA):
            >   A requirement by an insurance plan that the prescriber obtain APPROVAL
            >   BEFORE a specific medication will be covered (reimbursed) by the plan.
            >
            > WHEN IS PA REQUIRED?
            >   — Non-formulary (Tier 3–4) or specialty drugs
            >   — Brand drugs when a generic is available (unless DAW 1)
            >   — High-cost or high-risk medications (biologics, antipsychotics, stimulants)
            >   — After step therapy requirements are not met
            >
            > STEP THERAPY ("Fail First"):
            >   Insurance requires patient to TRY (and fail) lower-cost alternatives
            >   BEFORE approving the preferred drug.
            >   Example: Must try generic SSRI before authorizing brand-name SNRI.
            >
            > THE PA PROCESS (pharmacy technician's role):
            >   1. Rx submitted → REJECTED by insurance (e.g., PA required reject code 75).
            >   2. Tech notifies pharmacist and/or prescriber's office.
            >   3. Prescriber's office submits PA request to insurance with clinical data.
            >   4. Insurance reviews → APPROVES or DENIES.
            >   5. If approved: PA authorization number entered; claim reprocessed.
            >   6. If denied: Prescriber may appeal or change drug to covered alternative.
            >
            > FORMULARY TIERS (typical):
            >   Tier 1 = Generic (lowest copay)
            >   Tier 2 = Preferred brand
            >   Tier 3 = Non-preferred brand (higher copay)
            >   Tier 4/Specialty = Specialty/biologic (highest copay; may require PA)
            >
            > NOTE: PA is primarily a pharmacy billing/workflow issue — not DEA/federal law.
            >   However, it appears frequently on the PTCE in Domain 2 (regulatory/workflow).
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
