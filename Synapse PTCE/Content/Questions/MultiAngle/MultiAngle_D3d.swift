import Foundation

// Multi-Angle Phase 12 — Patient Safety Gap Fill II
// 10 nodes — all with full MCQ content

let multiAngleNodes_D3d: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "FIVE RIGHTS OF MEDICATION ADMINISTRATION",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > CLASSIC FIVE RIGHTS:
        >   1. Right PATIENT — verify with two identifiers (name + DOB or MRN)
        >   2. Right DRUG — verify drug name (LASA check)
        >   3. Right DOSE — verify dose and units (mg vs mcg)
        >   4. Right ROUTE — PO, IV, IM, SQ, SL, topical, etc.
        >   5. Right TIME — frequency and schedule
        > EXPANDED RIGHTS (commonly added):
        >   Right Documentation, Right Reason, Right Response, Right Technique, Right Education
        > ERROR PREVENTION: Verbal order read-back; barcode scanning; independent double-checks for high-alert drugs.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The Five Rights include: Right Patient, Right Drug, Right Dose, Right Route, Right Prescriber",
            "B. The Five Rights are: Right Patient (2 identifiers), Right Drug, Right Dose, Right Route, Right Time — foundational framework for preventing medication administration errors",
            "C. The Five Rights of medication administration only apply to nurses in hospital settings",
            "D. Using a single patient identifier (name only) satisfies the 'Right Patient' requirement"
        ],
        correctAnswer: "B. The Five Rights are: Right Patient (2 identifiers), Right Drug, Right Dose, Right Route, Right Time — foundational framework for preventing medication administration errors",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.10,
        angle: .safety,
        baseConceptTitle: "FIVE RIGHTS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "BCMA — BARCODE MEDICATION ADMINISTRATION",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > BCMA: Barcode Medication Administration — technology that scans patient wristband and medication barcode at the bedside before administration.
        > PURPOSE: Verifies the Five Rights electronically — dramatically reduces wrong-patient, wrong-drug, wrong-dose errors.
        > ALERT: System alerts if barcode mismatch (wrong drug, wrong patient, wrong time, wrong dose) — nurse must override with documentation.
        > WORKAROUNDS: Dangerous practice — scanning outside the room, bypassing alerts → major safety risk.
        > INTEGRATION: Linked to electronic medication administration record (eMAR).
        > EVIDENCE: Studies show 41–86% reduction in medication errors with BCMA.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Scanning a medication outside the patient's room before entering is an acceptable BCMA practice",
            "B. BCMA scans patient wristband and medication at bedside to verify the Five Rights; reduces medication errors 41–86%; workarounds (scanning outside room, bypassing alerts) are dangerous and unacceptable",
            "C. BCMA only verifies the right patient and does not check drug, dose, or route",
            "D. BCMA system alerts are informational only and can be routinely bypassed without documentation"
        ],
        correctAnswer: "B. BCMA scans patient wristband and medication at bedside to verify the Five Rights; reduces medication errors 41–86%; workarounds (scanning outside room, bypassing alerts) are dangerous and unacceptable",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.10,
        angle: .safety,
        baseConceptTitle: "BCMA"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ANTIMICROBIAL STEWARDSHIP",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > DEFINITION: Coordinated program to improve appropriate antibiotic use, reduce resistance, and minimize C. diff and other harms.
        > CORE ELEMENTS (CDC): Leadership commitment, accountability (physician/pharmacist champions), drug expertise (ID pharmacist), action (dose optimization, de-escalation), tracking (outcomes), reporting, and education.
        > PHARMACIST ROLE: Review appropriateness of antimicrobial therapy; de-escalation when cultures narrow coverage; IV-to-oral conversion (IVOST); therapeutic drug monitoring.
        > IV-TO-ORAL SWITCH (IVOST): Criteria — patient tolerating PO, afebrile, improving, no indication for IV.
        > ANTIBIOGRAM: Hospital's annual antibiotic resistance data — guides empiric therapy selection.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Antimicrobial stewardship programs aim to maximize antibiotic use to prevent all possible infections",
            "B. Stewardship programs improve appropriate antibiotic use, reduce resistance and C. diff; pharmacists lead de-escalation and IV-to-oral conversions; antibiogram guides empiric therapy",
            "C. Antimicrobial stewardship requires using the broadest-spectrum antibiotic available for all infections",
            "D. IV-to-oral antibiotic conversion (IVOST) is only appropriate after 14 days of IV therapy"
        ],
        correctAnswer: "B. Stewardship programs improve appropriate antibiotic use, reduce resistance and C. diff; pharmacists lead de-escalation and IV-to-oral conversions; antibiogram guides empiric therapy",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.28,
        angle: .safety,
        baseConceptTitle: "ANTIMICROBIAL STEWARDSHIP"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "SMART PUMP DRUG LIBRARIES",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > SMART PUMPS: IV infusion pumps with built-in dose error reduction software (DERS).
        > DRUG LIBRARY: Pre-programmed database of approved drug concentrations, dose limits (soft and hard), and infusion rates for specific care areas (ICU, oncology, general ward).
        > SOFT LIMIT: Alert that can be overridden with documentation (may be appropriate to exceed).
        > HARD LIMIT: Alert that CANNOT be overridden — absolute maximum safe dose.
        > IMPORTANCE: Pharmacist updates and maintains drug library — critical safety role.
        > ALERT FATIGUE: Excessive alerts can lead to unsafe overrides — library must be well-calibrated.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Hard limits on smart pumps can be overridden with a nurse's override documentation",
            "B. Smart pumps use pre-programmed drug libraries with dose limits; hard limits cannot be overridden; soft limits can be overridden with documentation; pharmacists maintain drug libraries; alert fatigue is a risk",
            "C. Smart pump drug libraries are standardized nationally and do not require hospital-specific customization",
            "D. Pharmacists have no role in smart pump programming or drug library maintenance"
        ],
        correctAnswer: "B. Smart pumps use pre-programmed drug libraries with dose limits; hard limits cannot be overridden; soft limits can be overridden with documentation; pharmacists maintain drug libraries; alert fatigue is a risk",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.28,
        angle: .safety,
        baseConceptTitle: "SMART PUMP"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ISMP HIGH-ALERT MEDICATIONS",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > HIGH-ALERT MEDICATIONS: Drugs with heightened risk of causing significant patient harm when used in error.
        > ISMP LIST (common community examples): Anticoagulants (warfarin, heparin, DOACs), insulin, opioids, concentrated electrolytes (KCl IV), methotrexate (oral, non-oncologic use), chemotherapy.
        > ISMP LIST (common hospital): Above + neuromuscular blocking agents (NMBAs), concentrated dextrose solutions, hypotonic saline, epidural medications, antithrombotics.
        > SAFETY STRATEGIES: Independent double-check, specialized labeling, removal of concentrated forms from floor stock, standardized order sets.
        > NOT THE SAME AS: Drugs on the Beers Criteria (elderly inappropriate) or Black Box Warning drugs.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. High-alert medications are those most commonly prescribed — high frequency equals high alert status",
            "B. ISMP high-alert medications have heightened risk of significant harm when errors occur (not necessarily common drugs); includes anticoagulants, insulin, opioids, concentrated electrolytes, NMBAs; require independent double-checks",
            "C. High-alert medications are synonymous with Beers Criteria medications",
            "D. Concentrated potassium chloride (KCl) IV is a low-alert medication appropriate for floor stock"
        ],
        correctAnswer: "B. ISMP high-alert medications have heightened risk of significant harm when errors occur (not necessarily common drugs); includes anticoagulants, insulin, opioids, concentrated electrolytes, NMBAs; require independent double-checks",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.46,
        angle: .safety,
        baseConceptTitle: "HIGH-ALERT MEDICATIONS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "PHARMACOKINETIC MONITORING",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > TDM: Therapeutic Drug Monitoring — measuring drug serum levels to optimize dosing.
        > DRUGS REQUIRING TDM: NTI drugs — vancomycin, aminoglycosides (gentamicin, tobramycin), phenytoin, carbamazepine, valproic acid, lithium, digoxin, cyclosporine, tacrolimus, theophylline.
        > TIMING: Trough (lowest, before next dose); peak (highest, after infusion); steady-state (~4–5 half-lives).
        > PEAK vs TROUGH for AMINOGLYCOSIDES: Peak = efficacy (concentration-dependent); trough = toxicity (nephro/ototoxicity).
        > VANCOMYCIN: AUC/MIC monitoring now preferred over trough-only.
        > FACTORS AFFECTING LEVELS: Renal/hepatic function, age, weight, drug interactions, compliance.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Drug levels are at steady-state after 1–2 half-lives of consistent dosing",
            "B. Steady-state requires ~4–5 half-lives; TDM drugs include NTI agents (phenytoin, lithium, vancomycin, aminoglycosides); aminoglycoside peak = efficacy, trough = toxicity; vancomycin AUC/MIC preferred over trough",
            "C. Drug levels should always be drawn at peak (after administration) for all monitored medications",
            "D. Aminoglycoside trough levels predict efficacy while peak levels predict nephrotoxicity"
        ],
        correctAnswer: "B. Steady-state requires ~4–5 half-lives; TDM drugs include NTI agents (phenytoin, lithium, vancomycin, aminoglycosides); aminoglycoside peak = efficacy, trough = toxicity; vancomycin AUC/MIC preferred over trough",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.46,
        angle: .safety,
        baseConceptTitle: "PK MONITORING"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ALLERGY DOCUMENTATION — STANDARDS",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > ALLERGY TYPES:
        >   True allergy: Immune-mediated (IgE, T-cell) — rash, urticaria, anaphylaxis.
        >   Intolerance: Non-immune GI/CNS side effects (nausea, headache) — not a contraindication.
        > DOCUMENTATION: Record drug, reaction, severity, date; distinguish allergy vs intolerance.
        > CROSS-REACTIVITY:
        >   PCN ↔ Cephalosporins: ~1–2% cross-reactivity (much lower than historical 10%); share R1 side chain.
        >   PCN ↔ Carbapenems: <1% cross-reactivity.
        >   Sulfonamide antibiotics ↔ Non-antibiotic sulfonamides: Clinical cross-reactivity not well-established.
        > ALLERGY ALERT: Displayed prominently in pharmacy system; pharmacist must review at every fill.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients who report nausea from penicillin should always be given a 'true allergy' label",
            "B. True allergy (immune-mediated) differs from intolerance (GI/CNS side effects); PCN-cephalosporin cross-reactivity ~1–2% (much lower than feared); allergy and reaction type must be clearly documented",
            "C. All patients with penicillin allergy must avoid all cephalosporins absolutely due to 10% cross-reactivity",
            "D. Intolerance and allergy are clinically equivalent and both require absolute drug avoidance"
        ],
        correctAnswer: "B. True allergy (immune-mediated) differs from intolerance (GI/CNS side effects); PCN-cephalosporin cross-reactivity ~1–2% (much lower than feared); allergy and reaction type must be clearly documented",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.64,
        angle: .safety,
        baseConceptTitle: "ALLERGY DOCUMENTATION"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ROOT CAUSE ANALYSIS — PROCESS",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > RCA: Root Cause Analysis — systematic investigation into a sentinel event or serious medication error.
        > PURPOSE: Identify underlying system failures (not blame individuals) → implement system-level fixes.
        > PROCESS: Gather facts → construct timeline → identify contributing factors → determine root causes → implement corrective actions → monitor effectiveness.
        > FISHBONE DIAGRAM (Ishikawa): Visual tool to categorize causes (people, process, equipment, environment, materials, management).
        > FMEA: Failure Mode and Effects Analysis — proactive risk assessment before errors occur.
        > JUST CULTURE: Distinguishes between human error (system fix), at-risk behavior (coaching), and reckless behavior (discipline).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Root cause analysis primarily identifies the individual responsible for the error so they can be disciplined",
            "B. RCA identifies system-level failures (not individual blame); uses fishbone diagram to categorize causes; FMEA proactively identifies risks; Just Culture distinguishes error types for appropriate response",
            "C. FMEA is performed after a sentinel event to identify what went wrong",
            "D. Just Culture mandates the same disciplinary response for all medication errors regardless of intent"
        ],
        correctAnswer: "B. RCA identifies system-level failures (not individual blame); uses fishbone diagram to categorize causes; FMEA proactively identifies risks; Just Culture distinguishes error types for appropriate response",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.64,
        angle: .safety,
        baseConceptTitle: "ROOT CAUSE ANALYSIS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "BEYOND USE DATE — USP 797 CATEGORIES",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > BUD: Beyond Use Date — date/time after which a compounded preparation must not be used.
        > USP <797> STERILE COMPOUNDING BUD (revised 2023):
        >   Category 1 (ISO 5, ≤12 hrs exposure): BUD ≤12 hrs room temp or ≤24 hrs refrigerated.
        >   Category 2 (ISO 5, controlled): BUD varies by sterility testing (up to 45 days frozen).
        > NON-STERILE (USP <795>): Based on ingredients, container, storage — typically days to months.
        > BUD ≠ EXPIRATION DATE: Expiration = manufacturer's; BUD = pharmacy-assigned after preparation.
        > MULTI-DOSE VIALS: 28 days after first puncture (unless otherwise labeled) once opened.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Beyond use date and expiration date are the same thing and are set by the manufacturer",
            "B. BUD is assigned by the pharmacy (differs from manufacturer's expiration date); USP 797 Category 1 sterile CSPs: ≤12 hrs room temp or ≤24 hrs refrigerated; multi-dose vials: 28 days after first puncture",
            "C. All compounded sterile preparations may be stored for 45 days at room temperature",
            "D. Multi-dose vials can be used for up to 90 days after first opening if stored in the refrigerator"
        ],
        correctAnswer: "B. BUD is assigned by the pharmacy (differs from manufacturer's expiration date); USP 797 Category 1 sterile CSPs: ≤12 hrs room temp or ≤24 hrs refrigerated; multi-dose vials: 28 days after first puncture",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.82,
        angle: .safety,
        baseConceptTitle: "BEYOND USE DATE USP 797"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "PATIENT SAFETY CULTURE",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > SAFETY CULTURE: Organizational values, beliefs, and behaviors around safety — foundational to error prevention.
        > HIGH RELIABILITY ORGANIZATIONS (HRO): Preoccupation with failure, reluctance to simplify, sensitivity to operations, commitment to resilience, deference to expertise.
        > PSYCHOLOGICAL SAFETY: Staff feel safe reporting errors without fear of punishment.
        > SENTINEL EVENT: Unexpected occurrence causing death or serious physical/psychological harm — TJC requires RCA.
        > NEAR MISS: Error caught before reaching patient — same reporting priority as actual errors.
        > TRANSPARENCY: Required — institutions must disclose errors to patients (apology laws protect disclosure).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Near-miss events do not need to be reported since no patient was harmed",
            "B. Strong safety culture includes psychological safety for reporting; near misses have same reporting priority as actual errors; sentinel events require TJC root cause analysis; transparency/apology laws support disclosure",
            "C. Sentinel events only need to be reported if the patient files a formal complaint",
            "D. High reliability organizations assume operations are running safely unless proven otherwise"
        ],
        correctAnswer: "B. Strong safety culture includes psychological safety for reporting; near misses have same reporting priority as actual errors; sentinel events require TJC root cause analysis; transparency/apology laws support disclosure",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.82,
        angle: .safety,
        baseConceptTitle: "PATIENT SAFETY CULTURE"
    ),
]
