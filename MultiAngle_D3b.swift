
//
//  MultiAngle_D3b.swift
//  Synapse PTCE
//
//  Multi-angle nodes — Domain 3: Patient Safety & QA (Expansion)
//  14 nodes covering Joint Commission NPSGs, sentinel events, FMEA, BCMA,
//  Five Rights, ADR/ADE definitions, and compounding safety
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D3b: [DataNode] {[

        // MARK: — JOINT COMMISSION NPSGs

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "JOINT COMMISSION / NPSG OVERVIEW",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — National Patient Safety Goals (NPSGs)
            > NPSG: Annual safety goals set by The Joint Commission (TJC) for accredited healthcare organizations
            > NPSG 01: Improve accuracy of patient identification — use two identifiers (name + DOB or MRN)
            > NPSG 02: Improve effectiveness of communication (read back verbal orders)
            > NPSG 03: Improve safety of using medications (anticoagulants, high-alert medications, concentrated electrolytes)
            > NPSG 07: Reduce HAI (healthcare-associated infections) — hand hygiene compliance
            > NPSG 15: Identify patients at risk for suicide — screen and assess
            > TJC ACCREDITATION: Voluntary survey; accreditation required for CMS reimbursement
            """,
            challengeType: .multipleChoice,
            options: [
                "A. NPSGs are set by the FDA and apply only to drug manufacturers",
                "B. NPSGs are annual TJC safety goals — NPSG 01 requires two patient identifiers; NPSG 03 addresses medication safety",
                "C. NPSGs are mandatory federal regulations enforced by CMS inspectors",
                "D. Only NPSG 03 applies to pharmacy — the other goals apply only to nursing staff"
            ],
            correctAnswer: "B. NPSGs are annual TJC safety goals — NPSG 01 requires two patient identifiers; NPSG 03 addresses medication safety",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "JOINT COMMISSION NPSGs"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "NPSG 03 / ANTICOAGULANT SAFETY GOAL",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Joint Commission NPSG 03.05.01 Anticoagulant Safety
            > GOAL: Reduce patient harm associated with anticoagulant therapy
            > REQUIRED ELEMENTS: Use approved protocols for prescribing and administering anticoagulants; baseline and ongoing lab tests; patient education about anticoagulants
            > HEPARIN SAFETY: Standardized concentrations; remove concentrated heparin from patient care areas; independent double-check for heparin infusions
            > WARFARIN: INR monitoring protocol; use of anticoagulation management service
            > REVERSAL AGENTS: Warfarin → Vitamin K or 4-factor PCC; heparin → protamine sulfate; DOACs → idarucizumab (dabigatran), andexanet alfa (rivaroxaban/apixaban)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Heparin reversal agent is phytonadione (Vitamin K)",
                "B. Protamine sulfate reverses heparin; Vitamin K and/or 4-factor PCC reverses warfarin",
                "C. Idarucizumab reverses warfarin; andexanet alfa reverses heparin",
                "D. No reversal agents exist — all anticoagulants require time to wear off"
            ],
            correctAnswer: "B. Protamine sulfate reverses heparin; Vitamin K and/or 4-factor PCC reverses warfarin",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.10,
            angle: .safety,
            baseConceptTitle: "ANTICOAGULANT SAFETY"
        ),

        // MARK: — SENTINEL EVENTS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "SENTINEL EVENTS / DEFINITION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — What is a sentinel event?
            > DEFINITION: An unexpected occurrence involving death or serious physical or psychological injury, or the risk thereof — requiring immediate investigation and response
            > "SENTINEL": Signals the need for immediate investigation and response (sentinel = warning)
            > EXAMPLES: Wrong-patient surgery, wrong-site surgery, medication error causing death, suicide of inpatient, transfusion reaction causing death, infant abduction, unanticipated death
            > ROOT CAUSE ANALYSIS (RCA): TJC requires RCA for sentinel events — must identify underlying system failures (not blame individuals)
            > REPORTING: TJC-accredited organizations must report certain sentinel events to TJC
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A sentinel event is any error that reaches the patient regardless of harm",
                "B. A sentinel event is an unexpected occurrence causing death or serious injury — requires RCA and immediate response",
                "C. Sentinel events only include medication errors — surgical events are separate",
                "D. Sentinel events are minor errors that signal the need for routine process improvement"
            ],
            correctAnswer: "B. A sentinel event is an unexpected occurrence causing death or serious injury — requires RCA and immediate response",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.22,
            angle: .classification,
            baseConceptTitle: "SENTINEL EVENTS"
        ),

        // MARK: — FAILURE MODE EFFECTS ANALYSIS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "FMEA / PROACTIVE RISK ANALYSIS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — FMEA vs Root Cause Analysis
            > FMEA: Failure Mode and Effects Analysis — a PROACTIVE risk analysis tool
            > PURPOSE: Identify potential points of failure in a process BEFORE they cause harm
            > PROCESS: Map each step of a process → identify all possible failure modes → assess risk (severity × likelihood × detectability) → prioritize and implement risk reduction
            > HAZARD SCORE = Severity × Probability × Detectability (Risk Priority Number)
            > CONTRAST WITH RCA: RCA is REACTIVE (analyzes after an error occurred); FMEA is PROACTIVE (prevents errors)
            > TJC: Requires FMEA on one high-risk process per year for accredited organizations
            """,
            challengeType: .multipleChoice,
            options: [
                "A. FMEA is a reactive tool used after a sentinel event to find its root cause",
                "B. FMEA is a proactive tool that identifies potential failures BEFORE harm occurs — contrast with RCA which is reactive",
                "C. FMEA and RCA are identical tools with different names in different institutions",
                "D. FMEA is used only in manufacturing settings — not applicable to pharmacy practice"
            ],
            correctAnswer: "B. FMEA is a proactive tool that identifies potential failures BEFORE harm occurs — contrast with RCA which is reactive",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.22,
            angle: .classification,
            baseConceptTitle: "FMEA"
        ),

        // MARK: — BARCODE MEDICATION ADMINISTRATION

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BCMA / BARCODE MEDICATION ADMINISTRATION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Barcode Medication Administration technology
            > BCMA: Barcode Medication Administration — electronic system that uses barcodes to verify the Five Rights at the bedside
            > HOW IT WORKS: Nurse scans patient wristband AND medication barcode before administration → system verifies correct patient, drug, dose, route, and time
            > BENEFITS: Reduces medication errors (especially wrong-patient and wrong-drug errors) by 50–85% in studies
            > ALERT TYPES: Wrong drug, wrong dose, wrong time, allergy alert, duplicate therapy alert
            > PHARMACY ROLE: Must ensure medications are properly barcoded; unit-dose packaging critical for BCMA compatibility
            > SMART PUMPS: IV infusion pumps with drug libraries (dose error reduction software/DERS) — complement BCMA for IV medications
            """,
            challengeType: .multipleChoice,
            options: [
                "A. BCMA eliminates the need for pharmacist verification of medication orders",
                "B. BCMA verifies the Five Rights at the bedside by scanning patient wristband and medication barcode",
                "C. BCMA is only effective for oral medications — IV medications require separate systems",
                "D. Barcode scanning replaces the double-check process for high-alert medications"
            ],
            correctAnswer: "B. BCMA verifies the Five Rights at the bedside by scanning patient wristband and medication barcode",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.34,
            angle: .safety,
            baseConceptTitle: "BCMA"
        ),

        // MARK: — FIVE RIGHTS OF MEDICATION ADMINISTRATION

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "FIVE RIGHTS / MEDICATION ADMINISTRATION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — The Five Rights of Medication Administration
            > RIGHT 1: RIGHT PATIENT — verify using two identifiers (name + DOB or MRN); never rely on room number
            > RIGHT 2: RIGHT DRUG — verify drug name (generic AND brand), alert for LASA pairs
            > RIGHT 3: RIGHT DOSE — verify dose against order; calculate if weight-based or renal adjustment needed
            > RIGHT 4: RIGHT ROUTE — oral vs IV vs IM vs SQ vs topical; never assume route from drug form alone
            > RIGHT 5: RIGHT TIME — scheduled vs PRN; check frequency, timing, and patient fasting status if relevant
            > EXTENDED: Some add Right Documentation, Right Reason, Right Response (seven or nine rights)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Right Patient, Right Drug, Right Dose, Right Route, Right Time",
                "B. Right Patient, Right Drug, Right Dose, Right Doctor, Right Time",
                "C. Right Chart, Right Drug, Right Dose, Right Route, Right Frequency",
                "D. Right Patient, Right Drug, Right Dose, Right Room, Right Time"
            ],
            correctAnswer: "A. Right Patient, Right Drug, Right Dose, Right Route, Right Time",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.34,
            angle: .classification,
            baseConceptTitle: "FIVE RIGHTS"
        ),

        // MARK: — ADVERSE DRUG EVENT DEFINITIONS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ADR vs ADE vs MEDICATION ERROR",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Distinguishing adverse event terminology
            > ADVERSE DRUG REACTION (ADR): An undesirable response to a drug taken at a NORMAL therapeutic dose; not due to an error
            > ADVERSE DRUG EVENT (ADE): ANY injury resulting from drug therapy — includes ADRs AND medication errors; broader term
            > MEDICATION ERROR: Any preventable event that may cause or lead to inappropriate medication use or patient harm; may or may not result in harm
            > SIDE EFFECT: Predictable, often dose-dependent response (subset of ADR)
            > ALLERGIC REACTION: Immune-mediated response — Type I (IgE/anaphylaxis), Type II (cytotoxic), Type III (immune complex), Type IV (delayed/contact)
            > KEY: All ADRs are ADEs, but not all ADEs are ADRs (some are errors); all ADRs are not medication errors
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A medication error and an adverse drug reaction are the same thing",
                "B. ADR = harm at normal therapeutic dose (not an error); ADE = any drug-related injury including errors",
                "C. Adverse drug events only occur with medications dispensed in error",
                "D. Side effects are unpredictable — they cannot be anticipated from drug pharmacology"
            ],
            correctAnswer: "B. ADR = harm at normal therapeutic dose (not an error); ADE = any drug-related injury including errors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.46,
            angle: .classification,
            baseConceptTitle: "ADR vs ADE"
        ),

        // MARK: — DRUG STABILITY AND COMPATIBILITY

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "STABILITY vs COMPATIBILITY / IV ADMIXTURE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Stability vs compatibility in IV pharmacy
            > STABILITY: A drug's ability to maintain its chemical and physical integrity (potency, purity, safety) over time
            > COMPATIBILITY: Whether two or more drugs or solutions can be mixed WITHOUT physical, chemical, or therapeutic incompatibility
            > PHYSICAL INCOMPATIBILITY: Visible precipitation, color change, gas formation, or cloudiness — DO NOT USE
            > CHEMICAL INCOMPATIBILITY: Drug degradation; may not be visible — use reference (Trissel's, King Guide)
            > THERAPEUTIC INCOMPATIBILITY: Two drugs antagonize or negate each other's therapeutic effects
            > Y-SITE COMPATIBILITY: Two IV solutions co-infused through same IV line port
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stability and compatibility mean the same thing in pharmacy practice",
                "B. Stability = drug maintaining integrity over time; compatibility = two substances can be mixed safely",
                "C. A clear IV admixture is always compatible — visible precipitation is the only concern",
                "D. Therapeutic incompatibility is the most common cause of IV admixture errors"
            ],
            correctAnswer: "B. Stability = drug maintaining integrity over time; compatibility = two substances can be mixed safely",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.46,
            angle: .classification,
            baseConceptTitle: "STABILITY vs COMPATIBILITY"
        ),

        // MARK: — MEDICATION ERROR PREVENTION STRATEGIES

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR PREVENTION / HIERARCHY OF STRATEGIES",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Most to least effective error prevention strategies
            > TIER 1 (STRONGEST): Forcing functions and constraints — make the wrong action impossible (e.g., remove concentrated KCl from floors; physically prevent wrong route connection)
            > TIER 2: Automation and computerization — CPOE, BCMA, smart pumps; reduces reliance on human memory
            > TIER 3: Standardization — standard concentrations, standard order sets, weight-based dosing protocols
            > TIER 4: Redundancy and double-checks — two-pharmacist verification, independent double-check
            > TIER 5 (WEAKEST): Education and training — increasing knowledge does NOT reliably prevent errors alone
            > ISMP PRINCIPLE: Rely on systems, not people — human error is inevitable; design systems to catch errors
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Education and training is the most effective error prevention strategy",
                "B. Forcing functions (making wrong actions impossible) are the strongest error prevention tier",
                "C. Double-checks by two nurses are more effective than removing medications from floor stock",
                "D. Warning labels and stickers are the most proven intervention to prevent medication errors"
            ],
            correctAnswer: "B. Forcing functions (making wrong actions impossible) are the strongest error prevention tier",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.58,
            angle: .safety,
            baseConceptTitle: "ERROR PREVENTION HIERARCHY"
        ),

        // MARK: — COMPOUNDING SAFETY

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "COMPOUNDING SAFETY / CONTAMINATION PREVENTION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Preventing contamination in sterile compounding
            > CRITICAL SITE: Any surface of the container, needle, or product that must remain sterile (LSC = legally sterile container)
            > TOUCH CONTAMINATION: Most common source — direct contact with critical site by hands or non-sterile objects
            > ASEPTIC TECHNIQUE: All manipulations of sterile products performed in ISO Class 5 PEC (laminar airflow workbench or BSC)
            > GARBING ORDER: Perform hand hygiene → shoe covers → hair cover → face mask → gown → sterile gloves
            > BEYOND-USE DATE: Sterile preparations have strict BUDs (Cat 1: no sterility testing; Cat 2: extended BUD requires sterility + endotoxin testing)
            > MENINGITIS OUTBREAK 2012: NECC compounding tragedy — 751 infections, 64 deaths from contaminated methylprednisolone — catalyst for DSCSA and stricter compounding oversight
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Touch contamination is less common than airborne contamination in sterile compounding",
                "B. Touch contamination of the critical site is the most common cause of sterile product contamination",
                "C. Sterile gloves alone are sufficient personal protective equipment for IV compounding",
                "D. Products compounded in a Class 5 hood are always sterile — no further testing is needed"
            ],
            correctAnswer: "B. Touch contamination of the critical site is the most common cause of sterile product contamination",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.58,
            angle: .safety,
            baseConceptTitle: "STERILE COMPOUNDING SAFETY"
        ),

        // MARK: — PHARMACIST VERIFICATION STEPS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "PHARMACIST VERIFICATION / DUR PROCESS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Drug Utilization Review (DUR) in pharmacy
            > DUR: Systematic process to verify the appropriateness of every prescription before dispensing
            > PROSPECTIVE DUR: Review BEFORE dispensing — detect potential drug interactions, allergies, duplications, dose errors, contraindications
            > CONCURRENT DUR: Review while patient is being treated (hospital pharmacy during admission)
            > RETROSPECTIVE DUR: Review AFTER dispensing — identify patterns across a population (quality improvement)
            > COMPUTER SYSTEM: DUR software alerts for: drug-drug interactions, drug-allergy, drug-disease contraindication, duplicate therapy, dosing errors, pregnancy risk
            > FEDERAL MANDATE: OBRA-90 requires DUR for Medicaid patients; expanded to most pharmacy settings
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Prospective DUR occurs after dispensing to identify patterns in prescribing",
                "B. Prospective DUR occurs BEFORE dispensing — detects drug interactions, allergies, and dosing errors",
                "C. DUR is only required for controlled substances under DEA regulation",
                "D. Retrospective DUR is the most important type for preventing individual patient harm"
            ],
            correctAnswer: "B. Prospective DUR occurs BEFORE dispensing — detects drug interactions, allergies, and dosing errors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.70,
            angle: .classification,
            baseConceptTitle: "DUR PROCESS"
        ),

        // MARK: — SMART PUMP / DERS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "SMART PUMPS / DOSE ERROR REDUCTION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Smart infusion pump technology
            > SMART PUMP: IV infusion pump with embedded drug library and dose error reduction software (DERS)
            > DRUG LIBRARY: Contains preset drug parameters (concentration, dose limits, soft and hard limits) for each care unit
            > SOFT LIMIT: Alert is generated but can be overridden with clinical justification
            > HARD LIMIT: Alert cannot be overridden — infusion is blocked (reserved for most dangerous parameters)
            > BENEFIT: Intercepts programming errors at the pump before drug reaches patient
            > PHARMACY ROLE: Pharmacy team typically manages and updates the drug library; ensures concentrations in pump match dispensed product
            > LIMITATION: Does not prevent wrong-drug loading; must be combined with BCMA for full protection
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hard limits on smart pumps can be overridden with pharmacist authorization",
                "B. Hard limits cannot be overridden; soft limits generate an alert but can be bypassed with justification",
                "C. Smart pumps replace the need for pharmacist review of IV orders entirely",
                "D. Drug libraries are optional — smart pumps are effective without programmed limits"
            ],
            correctAnswer: "B. Hard limits cannot be overridden; soft limits generate an alert but can be bypassed with justification",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.70,
            angle: .safety,
            baseConceptTitle: "SMART PUMPS"
        ),

        // MARK: — INFECTION CONTROL IN PHARMACY

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "INFECTION CONTROL / PHARMACY ROLE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Pharmacy's role in healthcare-associated infection prevention
            > HAND HYGIENE: Most effective intervention — WHO recommends 5 moments: before patient contact, before aseptic task, after body fluid exposure, after patient contact, after touching patient environment
            > ANTIMICROBIAL STEWARDSHIP: Pharmacist-led programs to optimize antibiotic use — reduce resistance, C. diff, adverse events
            > IV ACCESS INFECTIONS: CLABSI (central line-associated bloodstream infections) — prevent through sterile compounding practices, disinfecting IV access sites
            > MULTI-DOSE VIALS: Single-dose preferred; multi-dose vials must be labeled with opened date; discard if contamination suspected
            > STERILE COMPOUNDING: USP 797 compliance protects against CLABSI and other IV-related infections
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hand hygiene is effective only immediately before surgical procedures",
                "B. Antimicrobial stewardship programs optimize antibiotic use to reduce resistance and C. diff",
                "C. Multi-dose vials are preferred over single-dose — more cost-effective with no infection risk",
                "D. Pharmacy has no role in CLABSI prevention — this is exclusively a nursing responsibility"
            ],
            correctAnswer: "B. Antimicrobial stewardship programs optimize antibiotic use to reduce resistance and C. diff",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.82,
            angle: .safety,
            baseConceptTitle: "INFECTION CONTROL"
        ),

        // MARK: — PHARMACOVIGILANCE

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "PHARMACOVIGILANCE / POST-MARKET SAFETY",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Post-marketing drug safety monitoring
            > PHARMACOVIGILANCE: Science of detecting, assessing, understanding, and preventing adverse effects of medicines
            > WHO REPORTS: Healthcare professionals, patients, and manufacturers; voluntary (except manufacturers for certain events)
            > MEDWATCH: FDA's voluntary reporting portal — report serious adverse events, product quality problems
            > VAERS: Vaccine Adverse Event Reporting System — for vaccine reactions (CDC/FDA)
            > YELLOW CARD: UK equivalent of MedWatch
            > PHASE IV STUDIES: Post-marketing surveillance studies — detect rare/long-term adverse effects not seen in clinical trials (sample size too small for rare events)
            > DRUG WITHDRAWAL: Examples — rofecoxib (Vioxx) for CV risk; terfenadine (Seldane) for QT prolongation
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Pharmacovigilance only applies to new drugs in their first year post-approval",
                "B. Post-marketing surveillance (Phase IV) detects rare or long-term adverse effects not seen in pre-approval trials",
                "C. Only drug manufacturers are required to report adverse events — healthcare providers are excluded",
                "D. MedWatch reports are reviewed exclusively for controlled substances"
            ],
            correctAnswer: "B. Post-marketing surveillance (Phase IV) detects rare or long-term adverse effects not seen in pre-approval trials",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.82,
            angle: .classification,
            baseConceptTitle: "PHARMACOVIGILANCE"
        ),

    ]}
}
