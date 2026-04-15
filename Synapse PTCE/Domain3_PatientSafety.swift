//
//  Domain3_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 3 — Domain 3: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  14 nodes covering ISMP high-alert meds, LASA, Tall Man lettering, error reporting,
//  error types, DUR, infection control, BUD, NTI drugs, RCA, and QA/QC.
//

import Foundation

extension DataNode {

    // MARK: - Domain 3 Node Set

    static let domain3Nodes: [DataNode] = [

        // ── 01 ── HIGH-ALERT MEDICATIONS — DEFINITION ────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > SOURCE: Institute for Safe Medication Practices (ISMP)
            > HIGH-ALERT MEDICATION DEFINITION:
            >   Drugs that bear a HEIGHTENED RISK of causing SIGNIFICANT PATIENT HARM
            >   when used in error — even if errors with these drugs are not more common.
            > IMPORTANT DISTINCTION:
            >   High-alert ≠ frequently involved in errors
            >   High-alert = errors with these drugs are MORE DEVASTATING
            > SAFETY STRATEGIES:
            >   Independent double-check by a second licensed individual
            >   Auxiliary warning labels (e.g., "HIGH ALERT MEDICATION")
            >   Restricted access and standardized concentrations
            >   Automatic alerts in pharmacy information systems
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Medications used only in high-acuity emergency situations",
                "B. Medications that bear a heightened risk of causing significant patient harm when used in error",
                "C. Medications that are most commonly involved in dispensing errors",
                "D. Medications that require high-level pharmacy training to prepare"
            ],
            correctAnswer: "B. Medications that bear a heightened risk of causing significant patient harm when used in error",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18, yOffset: 0.07
        ),

        // ── 02 ── ISMP HIGH-ALERT MEDICATION EXAMPLES ────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ISMP HIGH-ALERT",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ISMP HIGH-ALERT MEDICATIONS — ACUTE CARE PRIORITY LIST:
            >   ANTICOAGULANTS: Heparin, warfarin (Coumadin), DOACs (apixaban, rivaroxaban)
            >   OPIOIDS: All IV and oral opioids (morphine, hydromorphone, fentanyl)
            >   INSULIN: ALL insulin formulations (U-100, U-200, U-300, U-500)
            >   CONCENTRATED ELECTROLYTES:
            >     KCl injection (concentrated) — cardiac arrest if given undiluted IV push
            >     Hypertonic saline (NaCl > 0.9%)
            >     Magnesium sulfate IV
            >   CHEMOTHERAPY: All antineoplastic agents
            >   SEDATIVES: Propofol, ketamine, midazolam IV
            >   NEUROMUSCULAR BLOCKING AGENTS: Succinylcholine, vecuronium
            > MNEMONIC: "AOISCC" — Anticoagulants, Opioids, Insulin, Sedatives,
            >            Concentrated electrolytes, Chemotherapy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Atorvastatin (Lipitor) — risk of rhabdomyolysis",
                "B. Amoxicillin-clavulanate (Augmentin) — risk of diarrhea",
                "C. IV insulin infusions — ISMP high-alert medication",
                "D. Metformin (Glucophage) — risk of lactic acidosis"
            ],
            correctAnswer: "C. IV insulin infusions — ISMP high-alert medication",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.22
        ),

        // ── 03 ── LASA DRUGS ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA DRUGS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > LOOK-ALIKE / SOUND-ALIKE (LASA) MEDICATIONS
            > DEFINITION: Drugs with names that look or sound similar, creating
            >             confusion and risk of medication errors.
            > CLASSIC LASA PAIRS:
            >   Prednisone / PredniSOLONE
            >   HydrALAzine / HydrOXYzine
            >   DOPamine / DOBUTamine
            >   VinCRIStine / VinBLAStine (oncology — fatal mix-ups have occurred)
            >   CeleBREX / CeleXA (celecoxib vs citalopram)
            >   ZyPREXA / ZyRTEC (olanzapine vs cetirizine)
            > ERROR REDUCTION STRATEGIES:
            >   Tall Man lettering (differentiate visually)
            >   Physical separation in storage
            >   Sticker/flag alerts in dispensing system
            >   Barcode verification at point of dispense
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metformin and metoprolol — both start with 'met'",
                "B. Amoxicillin and ciprofloxacin — both are antibiotics",
                "C. Prednisone and prednisolone — LASA pair",
                "D. Warfarin and apixaban — both are anticoagulants"
            ],
            correctAnswer: "C. Prednisone and prednisolone — LASA pair",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.48, yOffset: 0.10
        ),

        // ── 04 ── TALL MAN LETTERING ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "TALL MAN LTRS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > TALL MAN LETTERING — FDA & ISMP Endorsed Strategy
            > PURPOSE: Visually differentiate the dissimilar portions of LASA drug
            >          names using mixed case (upper + lower letters).
            > FDA-APPROVED TALL MAN LETTER LIST (examples):
            >   hydrALAzine / hydrOXYzine
            >   predniSONE / predniSOLONE
            >   DOPamine / DOBUTamine
            >   vinCRIStine / vinBLAStine
            >   buPROPion / busPIRone
            >   medroxyPROGESTERone / methylPREDNISolone / methylTESTOSTERone
            > ISMP ADDITIONAL LIST (beyond FDA):
            >   cycloSPORINE / cycloSERINE
            >   ZyPREXA / ZyRTEC
            >   CeleBREX / CeleXA
            > KEY: The CAPITALIZED letters are the DIFFERENT parts of the name.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. METFORMIN / metformin — same drug, different casing",
                "B. HydrALAzine / HydrOXYzine — correct Tall Man lettering pair",
                "C. LISINOPRIL / lisinopril — brand vs generic formatting",
                "D. Amoxicillin / AMOXICILLIN — all-caps labeling format"
            ],
            correctAnswer: "B. HydrALAzine / HydrOXYzine — correct Tall Man lettering pair",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.34
        ),

        // ── 05 ── FDA MEDWATCH ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "FDA MEDWATCH",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > FDA MEDWATCH — Safety Reporting Program
            > PURPOSE: Collect reports of serious adverse events and product problems
            >          involving drugs, biologics, medical devices, and dietary supplements.
            > FORM 3500 (voluntary): Healthcare professionals and consumers
            > FORM 3500A (mandatory): Manufacturers, importers, and distributors
            > WHAT TO REPORT:
            >   Death, life-threatening events, hospitalization
            >   Disability or permanent damage
            >   Congenital anomaly or birth defect
            >   Required medical/surgical intervention to prevent harm
            >   Product quality problems (contamination, mislabeling, broken device)
            > NOTE: MedWatch reports contribute to FDA's signal detection and may
            >       trigger safety communications, REMS, or drug recalls.
            > ISMP MERP: Separate reporting program for medication errors.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Insurance billing disputes and prior authorization denials",
                "B. State pharmacy board licensing violations",
                "C. Serious adverse events and product problems with drugs, biologics, and devices",
                "D. Patient non-compliance with prescribed medication regimens"
            ],
            correctAnswer: "C. Serious adverse events and product problems with drugs, biologics, and devices",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68, yOffset: 0.34
        ),

        // ── 06 ── MEDICATION ERROR TYPES ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR TYPES",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > MEDICATION ERROR CLASSIFICATION (NCC MERP):
            > PRESCRIBING ERRORS: Wrong drug, dose, route, frequency by prescriber.
            >   Example: Prescriber writes morphine 100mg instead of 10mg.
            > TRANSCRIPTION ERRORS: Misinterpretation when entering/copying an order.
            >   Example: Reading "quinidine" as "quinine" when entering into system.
            > DISPENSING ERRORS: Wrong drug, strength, quantity, or labeling by pharmacy.
            >   Example: Dispensing hydromorphone instead of morphine.
            > ADMINISTRATION ERRORS: Wrong drug, dose, route, or patient at bedside.
            >   Example: Nurse administers IV potassium undiluted as IV push.
            > MONITORING ERRORS: Failure to review therapy for appropriateness or toxicity.
            >   Example: Not checking INR for a patient on warfarin.
            > NEAR-MISS: Error caught before reaching patient — must still be reported.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Prescribing error — wrong drug ordered by prescriber",
                "B. Transcription error — misread when entering into the system",
                "C. Wrong drug dispensing error — pharmacy dispensed wrong drug",
                "D. Administration error — nurse gave wrong drug to patient"
            ],
            correctAnswer: "C. Wrong drug dispensing error — pharmacy dispensed wrong drug",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30, yOffset: 0.38
        ),

        // ── 07 ── DRUG UTILIZATION REVIEW (DUR) ──────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "PROSPECTIVE DUR",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > DRUG UTILIZATION REVIEW (DUR) — Required by OBRA '90
            > THREE TYPES:
            > PROSPECTIVE DUR (Before dispensing):
            >   Pharmacist reviews new Rx BEFORE dispensing.
            >   Checks for: drug-drug interactions, drug-disease contraindications,
            >     incorrect dosage, therapeutic duplication, drug-allergy conflicts,
            >     clinical misuse or overuse.
            >   MOST COMMON TYPE asked on PTCE.
            > CONCURRENT DUR (During therapy):
            >   Real-time monitoring during active treatment.
            >   Example: Monitoring labs while patient on antibiotic therapy.
            > RETROSPECTIVE DUR (After dispensing):
            >   Review of past dispensing patterns and outcomes.
            >   Used for quality improvement and detecting trends.
            >   Example: Reviewing 6-month claims data for opioid over-prescribing.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Retrospective DUR — reviewing past dispensing claims after the fact",
                "B. Concurrent DUR — monitoring the patient during active therapy",
                "C. Prospective DUR — reviewing the prescription before dispensing",
                "D. Formulary DUR — checking if a drug is on the insurance formulary"
            ],
            correctAnswer: "C. Prospective DUR — reviewing the prescription before dispensing",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45, yOffset: 0.35
        ),

        // ── 08 ── THE FIVE RIGHTS ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "5 RIGHTS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > THE "5 RIGHTS" OF MEDICATION ADMINISTRATION
            > A foundational patient safety framework for verifying medications:
            >   1. Right PATIENT — verify with 2 identifiers (name + DOB, or MRN)
            >   2. Right DRUG — confirm generic/brand name matches order
            >   3. Right DOSE — check strength and unit (mg vs mcg vs mEq)
            >   4. Right ROUTE — oral, IV, IM, SubQ, topical, ophthalmic
            >   5. Right TIME — correct frequency and timing (TID, QID, AC, HS)
            > EXPANDED FRAMEWORKS include additional "rights":
            >   Right documentation, Right reason, Right response, Right education
            > PHARMACY APPLICATION: The 5 Rights serve as a dispensing verification
            >   checklist at both data entry and final verification steps.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Right pharmacist",
                "B. Right insurance coverage",
                "C. Right time",
                "D. Right prescriber"
            ],
            correctAnswer: "C. Right time",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.54
        ),

        // ── 09 ── HAND HYGIENE ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HAND HYGIENE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > HAND HYGIENE — #1 Infection Control Measure (CDC/WHO)
            > TWO METHODS:
            > ALCOHOL-BASED HAND SANITIZER (ABHR):
            >   Preferred for most clinical situations.
            >   Rub all surfaces until dry (~20 seconds).
            >   EFFECTIVE against: most bacteria, viruses, fungi.
            >   NOT EFFECTIVE against: C. difficile spores, norovirus (use soap/water).
            > SOAP AND WATER:
            >   Required when hands are VISIBLY SOILED.
            >   Required after contact with C. difficile (spores resist alcohol).
            >   Scrub ≥ 20 seconds; rinse; dry with clean paper towel.
            > WHEN TO PERFORM HAND HYGIENE (WHO "5 Moments"):
            >   Before patient contact, before aseptic task, after body fluid exposure,
            >   after patient contact, after contact with patient surroundings.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. After every patient contact regardless of circumstances",
                "B. When hands are visibly soiled or after contact with C. difficile",
                "C. Only when preparing sterile compounded products",
                "D. Only when wearing gloves is not an option"
            ],
            correctAnswer: "B. When hands are visibly soiled or after contact with C. difficile",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.58
        ),

        // ── 10 ── STANDARD PRECAUTIONS ───────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "STD PRECAUTIONS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > STANDARD PRECAUTIONS (CDC) — formerly "Universal Precautions"
            > APPLY TO: ALL patients, regardless of diagnosis or infection status.
            > ASSUME all blood, body fluids, secretions, excretions (except sweat),
            >   non-intact skin, and mucous membranes may be infectious.
            > PPE ELEMENTS:
            >   GLOVES: Contact with blood, body fluids, non-intact skin
            >   GOWN: Protect skin/clothing from contamination
            >   MASK/EYE PROTECTION: Splashing or spraying risk
            >   N95 RESPIRATOR: For airborne precautions (TB, measles, varicella)
            > TRANSMISSION-BASED PRECAUTIONS (additional layers):
            >   Contact (C. diff, MRSA, VRE) — gown + gloves
            >   Droplet (influenza, COVID) — surgical mask + eye protection
            >   Airborne (TB, measles) — N95 + negative pressure room
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Only patients known to have bloodborne infections (HIV, Hep B/C)",
                "B. Only patients placed in formal isolation rooms",
                "C. All patients regardless of diagnosis or infection status",
                "D. Only patients in intensive care or high-acuity settings"
            ],
            correctAnswer: "C. All patients regardless of diagnosis or infection status",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.68
        ),

        // ── 11 ── BEYOND-USE DATE (BUD) ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BEYOND-USE DATE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > BEYOND-USE DATE (BUD) vs EXPIRATION DATE
            > EXPIRATION DATE: Set by manufacturer based on stability testing
            >   of the unopened product under recommended storage conditions.
            > BEYOND-USE DATE (BUD): Set by the pharmacist for a COMPOUNDED or
            >   REPACKAGED preparation; based on the DATE AND TIME of compounding.
            >   BUD ≤ Expiration date of ingredients used.
            > USP CHAPTER <795> — Non-sterile compounding BUD guidelines:
            >   Aqueous oral/topical solutions: 14 days (refrigerated)
            >   Non-aqueous preparations: 6 months or remaining shelf life (whichever first)
            >   Water-containing topicals: 30 days
            > USP CHAPTER <797> — Sterile compounding BUD guidelines:
            >   Depends on ISO environment, compounding conditions, and drug stability.
            >   Category 1 (CSPs prepared in ISO 5 without extended testing): 12h at RT / 24h refrigerated
            >   Category 2: longer BUDs based on sterility testing.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The manufacturer's original expiration date for the raw ingredient",
                "B. The date the prescription was written by the prescriber",
                "C. The date and time the compounding was completed",
                "D. The date the patient picks up the compounded medication"
            ],
            correctAnswer: "C. The date and time the compounding was completed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.74
        ),

        // ── 12 ── NARROW THERAPEUTIC INDEX (NTI) DRUGS ───────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "NTI DRUGS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > NARROW THERAPEUTIC INDEX (NTI) DRUGS
            > DEFINITION: Drugs where small differences in dose or blood concentration
            >   can lead to serious THERAPEUTIC FAILURE or TOXICITY.
            >   The difference between effective and toxic doses is SMALL.
            > KEY NTI EXAMPLES (exam-critical):
            >   Digoxin (Lanoxin) — cardiac glycoside
            >   Warfarin (Coumadin) — anticoagulant
            >   Lithium — mood stabilizer
            >   Phenytoin (Dilantin) — anticonvulsant
            >   Levothyroxine (Synthroid) — thyroid hormone (NTI by FDA designation)
            >   Cyclosporine (Neoral, Sandimmune) — immunosuppressant
            >   Theophylline — bronchodilator
            > CLINICAL IMPACT: Generic substitution for NTI drugs requires caution.
            >   FDA requires enhanced bioequivalence testing for NTI drugs.
            >   Do NOT switch brands without physician awareness.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metformin — first-line antidiabetic",
                "B. Amoxicillin — aminopenicillin antibiotic",
                "C. Digoxin — narrow therapeutic index drug",
                "D. Amlodipine — calcium channel blocker"
            ],
            correctAnswer: "C. Digoxin — narrow therapeutic index drug",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.82
        ),

        // ── 13 ── ROOT CAUSE ANALYSIS (RCA) ──────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ROOT CAUSE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ROOT CAUSE ANALYSIS (RCA)
            > DEFINITION: A systematic, structured process for identifying the
            >   UNDERLYING CAUSE(S) of an adverse event or near-miss.
            > KEY PRINCIPLE: RCA focuses on SYSTEMS and PROCESSES — not individuals.
            >   The goal is to identify WHERE the system failed, not WHO failed.
            > RCA PROCESS:
            >   1. Define and describe the event
            >   2. Collect data (interviews, records, timelines)
            >   3. Identify contributing factors (fishbone/Ishikawa diagram)
            >   4. Identify root cause(s)
            >   5. Develop corrective action plan
            >   6. Implement and monitor changes
            > FAILURE MODE AND EFFECTS ANALYSIS (FMEA):
            >   Proactive tool — identifies potential failure modes BEFORE they occur.
            >   Used to redesign processes to prevent future errors.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Assign individual blame and initiate disciplinary action",
                "B. Identify the fundamental system failure that led to the error, to prevent recurrence",
                "C. Document the event to prepare for potential legal proceedings",
                "D. Calculate the financial cost of the medication error"
            ],
            correctAnswer: "B. Identify the fundamental system failure that led to the error, to prevent recurrence",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.88
        ),

        // ── 14 ── QUALITY ASSURANCE vs QUALITY CONTROL ───────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "QA vs QC",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > QUALITY ASSURANCE (QA) vs QUALITY CONTROL (QC)
            > QUALITY ASSURANCE (QA):
            >   PROACTIVE — focuses on preventing defects and errors.
            >   Encompasses all systematic activities to ensure products/services
            >   meet quality requirements BEFORE they are produced.
            >   Examples: SOPs, staff training, process audits, workflow design.
            > QUALITY CONTROL (QC):
            >   REACTIVE — detects defects in FINISHED products through testing.
            >   Evaluates output against predetermined standards.
            >   Examples: Visual inspection of compounded preps, sterility testing,
            >     end-product checks, final verification of dispensed Rx.
            > IN PHARMACY: Both QA and QC are required components of a comprehensive
            >   quality management program. USP <797> and <795> mandate QC testing
            >   for sterile and non-sterile compounding respectively.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Testing finished drug products to detect defects before dispensing (reactive)",
                "B. A systematic, proactive process to prevent errors through process design and improvement",
                "C. Annual audits performed by state pharmacy boards and accreditation bodies",
                "D. Verifying drug expiration dates during routine inventory management"
            ],
            correctAnswer: "B. A systematic, proactive process to prevent errors through process design and improvement",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50, yOffset: 0.90
        )
    ]
}
