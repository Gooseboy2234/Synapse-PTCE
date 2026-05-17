import Foundation

// Multi-Angle Phase 10 — Federal Requirements Gap Fill
// 14 nodes — all with full MCQ content

let multiAngleNodes_D2c: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PDMP — PRESCRIPTION DRUG MONITORING",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > PDMP: State-run databases tracking controlled substance prescriptions dispensed.
        > PURPOSE: Detect drug-seeking, doctor shopping, and diversion.
        > WHO ACCESSES: Prescribers, pharmacists, law enforcement (with authorization).
        > TIMING: Most states require checking PDMP before dispensing Schedule II–IV substances.
        > TECHNICIAN ROLE: In most states, technicians cannot access PDMP — pharmacist only.
        > FEDERAL vs STATE: PDMPs are state-mandated; federal law does not require them.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. PDMPs are federal databases managed by DEA to track Schedule I substances only",
            "B. PDMPs are state-run databases tracking CS prescriptions; pharmacists check before dispensing CII-CIV; technicians typically cannot access PDMP",
            "C. PDMP access is restricted to law enforcement; pharmacists are not authorized to view it",
            "D. PDMPs track all prescriptions regardless of controlled substance status"
        ],
        correctAnswer: "B. PDMPs are state-run databases tracking CS prescriptions; pharmacists check before dispensing CII-CIV; technicians typically cannot access PDMP",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.10,
        angle: .classification,
        baseConceptTitle: "PDMP"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "OBRA-90 — COUNSELING MANDATE",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > OBRA-90: Omnibus Budget Reconciliation Act — requires pharmacist counseling offer for Medicaid patients (states adopted broadly for all patients).
        > ELEMENTS OF COUNSELING: Drug name/purpose, dose/route/duration, side effects, interactions, storage, missed dose, refill info.
        > PATIENT MAY DECLINE: Patient or caregiver can refuse counseling.
        > PROSPECTIVE DUR: Required review of all prescriptions before dispensing for clinical appropriateness.
        > DOCUMENTATION: Some states require documenting refusals.
        > TECHNICIAN ROLE: Technicians may offer counseling but the actual counseling must be by RPh.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. OBRA-90 requires pharmacists to counsel all patients and patients cannot decline",
            "B. OBRA-90 mandates offering counseling to Medicaid patients (adopted widely for all); counseling includes drug purpose, side effects, and interactions; patients may decline",
            "C. OBRA-90 applies only to new prescriptions, not refills",
            "D. OBRA-90 requires technicians to perform prospective DUR before dispensing"
        ],
        correctAnswer: "B. OBRA-90 mandates offering counseling to Medicaid patients (adopted widely for all); counseling includes drug purpose, side effects, and interactions; patients may decline",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.10,
        angle: .indication,
        baseConceptTitle: "OBRA-90"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PRESCRIPTION TRANSFERS — RULES",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > SCHEDULE III–V: May be transferred ONE time between pharmacies not in same chain system.
        > SAME CHAIN SYSTEMS: May transfer multiple times if systems are shared.
        > SCHEDULE II: Cannot be transferred — must have new prescription.
        > TRANSFER PROCESS: Receiving pharmacist must record all required information; transferring RPh must void original.
        > RECORDS: Transferred and receiving pharmacy must document the transfer.
        > REFILLS TRANSFERRED: Only remaining refills may be transferred (not unlimited refills).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Schedule II prescriptions may be transferred once between pharmacies in different states",
            "B. CIII–CV may be transferred once between unrelated pharmacies; CII cannot be transferred (requires new Rx); remaining refills transfer, not extra",
            "C. All controlled substance schedules may be transferred an unlimited number of times",
            "D. Prescription transfers can only be performed by pharmacy technicians, not pharmacists"
        ],
        correctAnswer: "B. CIII–CV may be transferred once between unrelated pharmacies; CII cannot be transferred (requires new Rx); remaining refills transfer, not extra",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.22,
        angle: .mechanism,
        baseConceptTitle: "PRESCRIPTION TRANSFERS"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "503A vs 503B — COMPOUNDING",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > 503A: Traditional compounding pharmacy — fills for specific patient with valid Rx; not subject to cGMP; state board oversight.
        > 503B: Outsourcing facility — may compound without patient-specific Rx; must follow cGMP; FDA registered; for hospitals/clinics.
        > 503A RESTRICTIONS: Cannot compound commercially available products (without medical necessity); cannot compound copies of FDA-approved drugs.
        > LABELING: Both require proper labeling; 503B products not for dispensing to individual patients.
        > KEY DISTINCTION: 503A = patient-specific; 503B = large-scale/batch without Rx.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. 503B outsourcing facilities dispense to individual patients with a valid prescription",
            "B. 503A = patient-specific compounding (Rx required, state board oversight); 503B = outsourcing facility (batch production, FDA registered, cGMP required, no patient-specific Rx needed)",
            "C. 503A pharmacies must follow cGMP standards identical to FDA-approved manufacturers",
            "D. Both 503A and 503B can compound commercially available drugs without restriction"
        ],
        correctAnswer: "B. 503A = patient-specific compounding (Rx required, state board oversight); 503B = outsourcing facility (batch production, FDA registered, cGMP required, no patient-specific Rx needed)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.22,
        angle: .mechanism,
        baseConceptTitle: "503A vs 503B"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "MTM — MEDICATION THERAPY MANAGEMENT",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > MTM: CMS-mandated service under Medicare Part D for eligible beneficiaries.
        > ELIGIBILITY: Multiple chronic conditions (≥2–3), multiple Part D drugs, likely to incur high drug costs.
        > COMPONENTS: Comprehensive Medication Review (CMR) — annual; Targeted Medication Review (TMR) — quarterly.
        > CMR OUTPUT: Personal medication list (PML) and medication action plan (MAP) provided to patient.
        > GOAL: Optimize therapeutic outcomes, reduce adverse events, improve adherence.
        > PROVIDER: RPh or other qualified provider; often billed separately.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. MTM is a voluntary program funded by Medicaid for patients with a single chronic condition",
            "B. MTM is a Medicare Part D service for patients with multiple chronic conditions; includes annual CMR (produces PML and MAP) and quarterly TMR",
            "C. MTM is performed exclusively by physicians and cannot be billed by pharmacists",
            "D. MTM eligibility requires only one chronic condition and one Part D drug"
        ],
        correctAnswer: "B. MTM is a Medicare Part D service for patients with multiple chronic conditions; includes annual CMR (produces PML and MAP) and quarterly TMR",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.35,
        angle: .indication,
        baseConceptTitle: "MTM"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "CDTA — COLLABORATIVE PRACTICE",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > CDTA: Collaborative Drug Therapy Agreement — legal agreement between RPh and prescriber.
        > ALLOWS: Pharmacist to initiate, modify, or discontinue drug therapy under protocol.
        > EXAMPLES: Pharmacist adjusts warfarin dose based on INR; initiates vaccines; adjusts insulin.
        > STATE-SPECIFIC: Scope varies by state law — not federally mandated.
        > DOCUMENTATION: Agreement must be in writing; specifies diseases, drugs, monitoring parameters.
        > PURPOSE: Expands pharmacist scope while maintaining physician oversight.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. CDTA is a federal program that allows pharmacists to prescribe any medication independently",
            "B. CDTA is a written agreement between RPh and prescriber allowing pharmacists to initiate/modify therapy within defined protocols; scope is state-specific",
            "C. CDTAs apply only to hospital pharmacists and cannot be used in community settings",
            "D. Under CDTA, pharmacists can override physician orders without any written documentation"
        ],
        correctAnswer: "B. CDTA is a written agreement between RPh and prescriber allowing pharmacists to initiate/modify therapy within defined protocols; scope is state-specific",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.35,
        angle: .indication,
        baseConceptTitle: "CDTA"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "CII PARTIAL FILLS — RULES",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > STANDARD PARTIAL FILL: Allowed if pharmacy lacks full quantity — must note quantity supplied/remaining; remaining supply dispensed within 72 hours or prescription void.
        > LTCF/TERMINALLY ILL: Schedule II partial fills allowed in multiple portions over 60 days.
        > CIII–CV: Partial fills allowed; each partial fill counts against total authorized quantity.
        > NO EXTENSIONS: Remaining fills after 72-hour limit are voided — patient needs new Rx.
        > DOCUMENTATION: Record partial fill separately; track remaining quantity.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Schedule II partial fills are prohibited; the full quantity must always be dispensed at once",
            "B. CII partial fill: remaining quantity must be dispensed within 72 hours or Rx is void; LTCF/terminally ill patients may receive partial fills over 60 days",
            "C. CII prescriptions may be partially filled over 30 days regardless of patient status",
            "D. Partial fills of Schedule II medications never require any special documentation"
        ],
        correctAnswer: "B. CII partial fill: remaining quantity must be dispensed within 72 hours or Rx is void; LTCF/terminally ill patients may receive partial fills over 60 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.48,
        angle: .mechanism,
        baseConceptTitle: "CII PARTIAL FILLS"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PRESCRIPTION VALIDITY — SCHEDULES",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > SCHEDULE II: Valid for 6 months from date written (federal — some states shorter).
        > SCHEDULE III–V: Valid for 6 months from date issued; up to 5 refills in 6 months.
        > NON-CONTROLLED: Federal: no specific expiration; most states 1–2 years.
        > POSTDATING: Illegal — Rx must be for present use (Schedule II cannot be postdated).
        > EMERGENCY ORAL CII: Valid 7 days for written follow-up.
        > AUTHENTICATION: Pharmacist must verify Rx is not altered or forged.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Schedule II prescriptions are valid for 1 year and may be refilled up to 5 times",
            "B. Schedule II: valid 6 months (no refills); CIII–CV: valid 6 months (up to 5 refills); emergency oral CII requires written Rx within 7 days",
            "C. All controlled substance prescriptions expire after 30 days from the date written",
            "D. Schedule III–V prescriptions may be refilled an unlimited number of times within 6 months"
        ],
        correctAnswer: "B. Schedule II: valid 6 months (no refills); CIII–CV: valid 6 months (up to 5 refills); emergency oral CII requires written Rx within 7 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.48,
        angle: .classification,
        baseConceptTitle: "PRESCRIPTION VALIDITY"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DEA FORM 41 — DRUG DESTRUCTION",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > DEA FORM 41: Used to document destruction of controlled substances.
        > WHO USES: Registrants (pharmacies, hospitals, practitioners) destroying CS inventory.
        > PROCESS: Two witnesses required for destruction; submit Form 41 to DEA.
        > DISPOSAL OPTIONS: DEA-authorized collector (take-back events), reverse distributor, in-pharmacy destruction (with DEA approval).
        > DEA FORM 222: Used for ordering Schedule I–II substances (purchase/transfer).
        > DEA FORM 106: Report theft or significant loss of controlled substances.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. DEA Form 41 is used to order Schedule II controlled substances from a distributor",
            "B. DEA Form 41 documents destruction of controlled substances (two witnesses required); Form 222 orders Schedule I–II; Form 106 reports theft/significant loss",
            "C. DEA Form 41 is used by patients to return unused medications to the pharmacy",
            "D. DEA Form 106 is used for routine destruction of expired controlled substances"
        ],
        correctAnswer: "B. DEA Form 41 documents destruction of controlled substances (two witnesses required); Form 222 orders Schedule I–II; Form 106 reports theft/significant loss",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.58,
        angle: .mechanism,
        baseConceptTitle: "DEA FORM 41"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DRUG PRICING — AWP/WAC/MAC/340B",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > AWP: Average Wholesale Price — published benchmark; NOT actual cost; used in PBM contracts.
        > WAC: Wholesale Acquisition Cost — manufacturer's list price to wholesaler; lower than AWP.
        > MAC: Maximum Allowable Cost — insurer's maximum reimbursement for generic drugs.
        > 340B: Federal program — qualifying hospitals/clinics buy drugs at deeply discounted prices (disproportionate share hospitals, FQHCs).
        > USUAL & CUSTOMARY (U&C): Pharmacy's cash price to a private-pay customer.
        > SPREAD PRICING: PBM charges plan more than it pays pharmacy (the "spread").
        """,
        challengeType: .multipleChoice,
        options: [
            "A. AWP represents the actual price pharmacies pay wholesalers for drug procurement",
            "B. AWP is a benchmark price (not actual cost); WAC is manufacturer's list to wholesaler; MAC is insurer's max generic reimbursement; 340B allows qualifying facilities to buy drugs at steep discounts",
            "C. The 340B program is available to all community pharmacies regardless of patient population served",
            "D. MAC pricing applies to brand-name drugs to ensure premium brand access"
        ],
        correctAnswer: "B. AWP is a benchmark price (not actual cost); WAC is manufacturer's list to wholesaler; MAC is insurer's max generic reimbursement; 340B allows qualifying facilities to buy drugs at steep discounts",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.58,
        angle: .classification,
        baseConceptTitle: "DRUG PRICING"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "TECHNICIAN SCOPE — FEDERAL LIMITS",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > TECHNICIANS MAY: Enter data, count/pour, compound, label, process refills (under RPh supervision).
        > TECHNICIANS MAY NOT: Perform final verification, provide clinical counsel, make clinical judgments.
        > FINAL VERIFICATION: Must always be done by licensed RPh.
        > TECH-CHECK-TECH: Some states allow technicians to verify other technicians' work in specific settings (e.g., unit-dose hospital).
        > RATIO: State-specific RPh:tech ratio (e.g., 1:3 or 1:4 depending on state).
        > PTCB/ASCP: National certification — not a license; state law governs scope.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. PTCB-certified technicians may provide patient counseling and perform final product verification",
            "B. Technicians may enter data, prepare products, and process refills under RPh supervision; final verification and patient counseling must be performed by the pharmacist",
            "C. Technicians with CPhT certification can independently dispense controlled substances",
            "D. The federal government sets specific pharmacist-to-technician ratios for all practice settings"
        ],
        correctAnswer: "B. Technicians may enter data, prepare products, and process refills under RPh supervision; final verification and patient counseling must be performed by the pharmacist",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.68,
        angle: .classification,
        baseConceptTitle: "TECHNICIAN SCOPE"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "OUT-OF-STATE RX — DISPENSING RULES",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > GENERAL RULE: Pharmacists may dispense out-of-state Rx if it meets the laws of the dispensing state.
        > SCHEDULE II: Generally requires in-state prescriber OR follow dispensing state's law (many states accept out-of-state CII Rx for emergencies).
        > CONTROLLED SUBSTANCES: Dispensing state law governs — some states prohibit out-of-state CII Rx.
        > VERIFICATION: RPh must verify prescriber's DEA registration (national database).
        > ELECTRONIC PRESCRIBING: EPCS transmits electronically but must still comply with each state's CS laws.
        > TELEMEDICINE: Ryan Haight Act governs online CS prescribing.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Out-of-state prescriptions for Schedule II drugs are always accepted at any US pharmacy",
            "B. Out-of-state Rx dispensing is governed by the dispensing state's laws; CII out-of-state Rx acceptance varies by state; RPh must verify DEA registration; Ryan Haight Act governs online CS prescribing",
            "C. The Ryan Haight Act applies only to non-controlled substances prescribed via telemedicine",
            "D. DEA registration is only required for prescribers within the pharmacy's state"
        ],
        correctAnswer: "B. Out-of-state Rx dispensing is governed by the dispensing state's laws; CII out-of-state Rx acceptance varies by state; RPh must verify DEA registration; Ryan Haight Act governs online CS prescribing",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.68,
        angle: .indication,
        baseConceptTitle: "OUT-OF-STATE RX"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DUR — DRUG UTILIZATION REVIEW",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > PROSPECTIVE DUR: Review BEFORE dispensing — checks for interactions, duplications, inappropriate dose.
        > RETROSPECTIVE DUR: Review AFTER dispensing — analyzes patterns for quality improvement.
        > CONCURRENT DUR: Real-time alerts during order entry (common in hospitals/EHR systems).
        > OBRA-90 MANDATE: Requires prospective DUR for Medicaid patients.
        > EXAMPLES: Drug-drug interaction alerts, drug-allergy alerts, therapeutic duplication warnings.
        > PHARMACIST ROLE: Must review and resolve DUR alerts before dispensing.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Retrospective DUR is performed before dispensing to prevent patient harm in real time",
            "B. Prospective DUR is performed before dispensing (OBRA-90 required); retrospective DUR analyzes patterns after dispensing for quality improvement; pharmacist must resolve alerts",
            "C. DUR applies only to controlled substances and not to regular prescription medications",
            "D. Concurrent DUR is performed once monthly to review dispensing patterns"
        ],
        correctAnswer: "B. Prospective DUR is performed before dispensing (OBRA-90 required); retrospective DUR analyzes patterns after dispensing for quality improvement; pharmacist must resolve alerts",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.78,
        angle: .mechanism,
        baseConceptTitle: "DUR"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PHARMACIST IMMUNIZATION AUTHORITY",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > FEDERAL AUTHORITY: PREP Act (2020) gave pharmacists (and interns/techs under RPh supervision) authority to vaccinate during public health emergencies.
        > STATE AUTHORITY: Most states grant pharmacists broad vaccination authority (flu, COVID, shingles, etc.).
        > AGE RESTRICTIONS: Minimum age varies by state and vaccine type.
        > STANDING ORDERS: Many states allow pharmacist-initiated vaccines under physician standing orders.
        > TRAINING: ACIP guidelines followed; must be trained in anaphylaxis recognition and treatment.
        > EPINEPHRINE: Must be available wherever vaccines are administered.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pharmacists may only administer vaccines if a physician is physically present at all times",
            "B. PREP Act grants federal immunization authority during public health emergencies; most states allow broad vaccination authority; epinephrine must be available; follow ACIP guidelines",
            "C. Pharmacist immunization authority is limited to influenza vaccines only in most states",
            "D. Pharmacy technicians may independently administer vaccines without pharmacist supervision under federal law"
        ],
        correctAnswer: "B. PREP Act grants federal immunization authority during public health emergencies; most states allow broad vaccination authority; epinephrine must be available; follow ACIP guidelines",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.78,
        angle: .indication,
        baseConceptTitle: "PHARMACIST IMMUNIZATION"
    ),
]
