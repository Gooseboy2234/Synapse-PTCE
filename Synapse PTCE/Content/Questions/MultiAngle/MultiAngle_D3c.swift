import Foundation

// Multi-Angle Phase 10 — Patient Safety Gap Fill
// 14 nodes — all with full MCQ content

let multiAngleNodes_D3c: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "MEDICATION RECONCILIATION",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > DEFINITION: Process of comparing a patient's medication orders to all medications the patient has been taking.
        > CRITICAL TRANSITIONS: Admission, transfer, and discharge — highest risk for discrepancies.
        > DISCREPANCY TYPES: Omission, duplication, dose error, interaction, unnecessary drug.
        > BEST POSSIBLE MEDICATION HISTORY (BPMH): Uses multiple sources (patient, caregiver, pharmacy records, medication bottles).
        > GOAL: Prevent unintentional medication changes during care transitions.
        > JOINT COMMISSION: Requires medication reconciliation at all transitions of care.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Medication reconciliation is only required at hospital admission, not at discharge",
            "B. Reconciliation compares current orders to all medications taken; required at admission, transfer, and discharge; discrepancies include omissions, duplications, and dose errors",
            "C. Medication reconciliation is the sole responsibility of the prescribing physician",
            "D. BPMH (Best Possible Medication History) relies solely on the patient's memory for accuracy"
        ],
        correctAnswer: "B. Reconciliation compares current orders to all medications taken; required at admission, transfer, and discharge; discrepancies include omissions, duplications, and dose errors",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.10,
        angle: .safety,
        baseConceptTitle: "MEDICATION RECONCILIATION"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "LASA PAIRS — LOOK-ALIKE/SOUND-ALIKE",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > LASA: Look-Alike Sound-Alike drugs — common source of dispensing errors.
        > EXAMPLES: Hydroxyzine/Hydralazine; Metformin/Metronidazole; Clonidine/Klonopin; Celebrex/Celexa/Cerebyx; Zyrtec/Zyprexa/Zantac.
        > TALL MAN LETTERING: FDA-recommended strategy to differentiate LASA pairs (e.g., hydrOXYzine vs. hydrALAzine).
        > ISMP LIST: Institute for Safe Medication Practices maintains current LASA list.
        > VERIFICATION: Scan barcode at dispensing; double-check by RPh; verbal read-back for verbal orders.
        > STORAGE: Keep LASA pairs physically separated on shelves; alert labels.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. LASA errors are prevented by only dispensing brand-name medications",
            "B. LASA pairs (e.g., hydroxyzine/hydralazine) are mitigated by Tall Man Lettering, barcode scanning, physical separation, and ISMP alerts",
            "C. Tall Man Lettering converts all drug names to lowercase for easier reading",
            "D. LASA medications should be stored together for efficiency in dispensing"
        ],
        correctAnswer: "B. LASA pairs (e.g., hydroxyzine/hydralazine) are mitigated by Tall Man Lettering, barcode scanning, physical separation, and ISMP alerts",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.10,
        angle: .safety,
        baseConceptTitle: "LASA PAIRS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "USP 800 — HAZARDOUS DRUG HANDLING",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > USP <800>: Standards for handling hazardous drugs (HDs) to protect workers, patients, and environment.
        > HAZARDOUS DRUGS: Carcinogenic, teratogenic, genotoxic, or organ-toxic drugs (most antineoplastics, some antivirals, hormones).
        > NIOSH LIST: Determines which drugs are hazardous (List 1 = antineoplastics; List 2 = non-antineoplastics).
        > PPE REQUIRED: Chemotherapy gloves (double-gloving), gown, eye protection, respirator for aerosolized HDs.
        > C-PEC: Containment primary engineering controls (biosafety cabinet, CACI) for HD compounding.
        > CLOSED SYSTEM: CSTD (closed system drug transfer device) for IV antineoplastic preparation.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. USP 800 only applies to antineoplastic drugs dispensed in oncology clinics",
            "B. USP 800 governs all hazardous drugs (NIOSH list); requires PPE (double gloves, gown, eye protection), C-PEC, and CSTD for IV antineoplastics",
            "C. Standard nitrile gloves without double-gloving meet USP 800 requirements for chemotherapy preparation",
            "D. USP 800 eliminates the need for engineering controls if proper PPE is worn"
        ],
        correctAnswer: "B. USP 800 governs all hazardous drugs (NIOSH list); requires PPE (double gloves, gown, eye protection), C-PEC, and CSTD for IV antineoplastics",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.22,
        angle: .safety,
        baseConceptTitle: "USP 800"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "NARANJO SCALE — ADR CAUSALITY",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > NARANJO ALGORITHM: Standardized questionnaire to assess probability that an adverse drug reaction is caused by a specific drug.
        > SCORING: 10 questions; score interpretation:
        >   ≥9: Definite ADR
        >   5–8: Probable ADR
        >   1–4: Possible ADR
        >   ≤0: Doubtful ADR
        > QUESTIONS INCLUDE: Previous conclusive reports? Appeared after drug given? Improved when stopped? Reappeared on rechallenge? Alternative cause? Plasma level toxic? Severity change with dose?
        > USED IN: Pharmacovigilance, clinical research, MedWatch reporting context.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A Naranjo score of 3 indicates a definite adverse drug reaction caused by the drug",
            "B. Naranjo score ≥9 = Definite; 5–8 = Probable; 1–4 = Possible; ≤0 = Doubtful ADR — used to assess causality between drug and adverse reaction",
            "C. The Naranjo scale is used to measure drug efficacy in clinical trials",
            "D. A score of 5 on the Naranjo scale rules out any drug causation of the adverse event"
        ],
        correctAnswer: "B. Naranjo score ≥9 = Definite; 5–8 = Probable; 1–4 = Possible; ≤0 = Doubtful ADR — used to assess causality between drug and adverse reaction",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.22,
        angle: .safety,
        baseConceptTitle: "NARANJO SCALE"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "BLACK BOX vs CONTRAINDICATION",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > BLACK BOX WARNING (BBW): FDA's strongest warning — serious or life-threatening risk; does NOT mean drug is contraindicated.
        > CONTRAINDICATION: Absolute — drug must NOT be used due to risk of serious harm (e.g., metformin + eGFR <30; statins in pregnancy).
        > BOXED WARNING FORMAT: Enclosed in black border in package insert.
        > EXAMPLES OF BBW: Fluoroquinolones (tendon rupture); SSRIs (suicidal ideation <25); TNF inhibitors (serious infection/malignancy).
        > RELATIVE CONTRAINDICATION: May use with caution if benefit outweighs risk.
        > REMS: Risk Evaluation and Mitigation Strategy — additional safeguards for high-risk drugs.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A Black Box Warning is equivalent to a contraindication and the drug cannot be prescribed",
            "B. Black Box Warning = serious risk requiring attention but drug may still be used; Contraindication = must not use; BBW does not automatically prohibit prescribing",
            "C. Contraindications are less serious than Black Box Warnings in terms of patient risk",
            "D. REMS programs replace Black Box Warnings for all high-risk medications"
        ],
        correctAnswer: "B. Black Box Warning = serious risk requiring attention but drug may still be used; Contraindication = must not use; BBW does not automatically prohibit prescribing",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.35,
        angle: .safety,
        baseConceptTitle: "BLACK BOX vs CONTRAINDICATION"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "PLLR — PREGNANCY DRUG LABELING",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > PLLR: Pregnancy and Lactation Labeling Rule — replaced old A/B/C/D/X categories in 2015.
        > NEW FORMAT: Three subsections — Pregnancy, Lactation, Females and Males of Reproductive Potential.
        > PREGNANCY: Describes risks, includes clinical considerations, and lists available data.
        > LACTATION: Risk vs benefit of breastfeeding while taking the drug.
        > REPRODUCTIVE: Contraception needs, fertility effects, pregnancy testing requirements.
        > OLD CATEGORIES STILL SEEN: A (safest), B, C, D, X (contraindicated) — still in use for drugs approved before 2015.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The PLLR maintains the A/B/C/D/X pregnancy category system with updated language",
            "B. PLLR (2015) replaced A/B/C/D/X with narrative subsections: Pregnancy, Lactation, and Reproductive Potential — providing detailed risk information instead of letter grades",
            "C. Under PLLR, all drugs with X category remain labeled as X under the new system",
            "D. PLLR only applies to drugs approved after 2020"
        ],
        correctAnswer: "B. PLLR (2015) replaced A/B/C/D/X with narrative subsections: Pregnancy, Lactation, and Reproductive Potential — providing detailed risk information instead of letter grades",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.35,
        angle: .safety,
        baseConceptTitle: "PLLR"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "NTI DRUGS — NARROW THERAPEUTIC INDEX",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > NTI DRUGS: Small difference between therapeutic and toxic doses — require precise dosing and monitoring.
        > EXAMPLES: Warfarin, digoxin, lithium, phenytoin, carbamazepine, valproic acid, theophylline, cyclosporine, tacrolimus.
        > GENERIC SUBSTITUTION: Some states restrict automatic substitution of NTI drugs (may require prescriber approval).
        > MONITORING: Serum levels, therapeutic drug monitoring (TDM) required.
        > INTERACTIONS: Drug-drug and drug-food interactions disproportionately dangerous with NTI drugs.
        > PATIENT EDUCATION: Never switch brands without provider knowledge; consistent timing matters.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. NTI drugs have wide therapeutic windows and do not require therapeutic drug monitoring",
            "B. NTI drugs (warfarin, digoxin, lithium, phenytoin) have small therapeutic windows; require TDM; generic substitution may be restricted; interactions are particularly dangerous",
            "C. All generic substitutions for NTI drugs are federally prohibited regardless of state law",
            "D. NTI drugs are only found in the cardiovascular drug class"
        ],
        correctAnswer: "B. NTI drugs (warfarin, digoxin, lithium, phenytoin) have small therapeutic windows; require TDM; generic substitution may be restricted; interactions are particularly dangerous",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.48,
        angle: .safety,
        baseConceptTitle: "NTI DRUGS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ORAL CHEMO — SAFE HANDLING",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > ORAL CHEMOTHERAPY: Increasing use of oral agents — same hazardous drug risks as IV.
        > PPE: Gloves required for counting/dispensing (even in retail settings per USP 800).
        > PATIENT EDUCATION: Do not crush/split without guidance; wash hands; store away from children/pets.
        > DISPOSAL: Household disposal varies — many are RCRA (Resource Conservation and Recovery Act) hazardous waste.
        > ADHERENCE: Critical — missing doses can lead to treatment failure; do not double dose.
        > REMS: Many oral chemotherapy agents have REMS (e.g., thalidomide — S.T.E.P.S.® program, lenalidomide — RevAssist®).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Oral chemotherapy agents are safe to crush and mix with food for patient convenience",
            "B. Oral chemotherapy requires PPE for handling (USP 800); patients must not crush without guidance; disposal as hazardous waste; many have REMS programs",
            "C. Oral chemotherapy drugs are exempt from USP 800 requirements because they are dispensed in sealed unit-of-use packages",
            "D. Missing a dose of oral chemotherapy should be corrected by doubling the next dose"
        ],
        correctAnswer: "B. Oral chemotherapy requires PPE for handling (USP 800); patients must not crush without guidance; disposal as hazardous waste; many have REMS programs",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.48,
        angle: .safety,
        baseConceptTitle: "ORAL CHEMO SAFETY"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ADC — AUTOMATED DISPENSING SAFETY",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > ADC: Automated Dispensing Cabinet (Pyxis, Omnicell) — used in hospitals for floor-stock medications.
        > OVERRIDE CAPABILITY: Allows access to medications before pharmacist review in emergencies — HIGH RISK.
        > SAFETY PRACTICES: Override medications should be limited; every override should be reviewed by pharmacist.
        > LOOK-ALIKE ALERT: ADC LASA pair errors are major source of hospital medication errors.
        > CONTROLLED SUBSTANCES: ADC tracks CS dispensing with individual user accountability; reconciliation required at shift end.
        > RESTOCKING: Must be done by technician with pharmacist check or verified electronically.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. ADC overrides are routinely performed without any subsequent pharmacist review",
            "B. ADC override capability allows pre-pharmacist-review access in emergencies — high risk; all overrides should be retrospectively reviewed by pharmacist; ADC tracks CS with user accountability",
            "C. ADCs eliminate all medication errors because they only dispense after pharmacist verification",
            "D. Controlled substances in ADCs do not require reconciliation or individual user tracking"
        ],
        correctAnswer: "B. ADC override capability allows pre-pharmacist-review access in emergencies — high risk; all overrides should be retrospectively reviewed by pharmacist; ADC tracks CS with user accountability",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.58,
        angle: .safety,
        baseConceptTitle: "ADC SAFETY"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "VACCINE COLD CHAIN",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > COLD CHAIN: Uninterrupted temperature-controlled supply chain from manufacturer to patient.
        > REFRIGERATED VACCINES: 2–8°C (36–46°F) — MMR, varicella, hepatitis, flu (most).
        > FROZEN VACCINES: -50°C to -15°C — live attenuated influenza (FluMist), varicella (can also be refrigerated).
        > ULTRA-COLD: -90°C to -60°C — some mRNA COVID-19 vaccines.
        > NEVER FREEZE: Inactivated flu, hepatitis B, DTaP — freezing destroys potency; if frozen accidentally → discard.
        > EXCURSION: Temperature excursion (any deviation) → do not use until pharmacist/public health assesses.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. All vaccines should be stored frozen at -20°C to ensure maximum potency",
            "B. Most vaccines: 2–8°C; some frozen at -15 to -50°C; ultra-cold mRNA vaccines at -60 to -90°C; inactivated vaccines destroyed by freezing — discard if frozen",
            "C. Temperature excursions have no effect on vaccine potency if the vaccine was cold initially",
            "D. Hepatitis B vaccine can be stored frozen to extend shelf life"
        ],
        correctAnswer: "B. Most vaccines: 2–8°C; some frozen at -15 to -50°C; ultra-cold mRNA vaccines at -60 to -90°C; inactivated vaccines destroyed by freezing — discard if frozen",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.58,
        angle: .safety,
        baseConceptTitle: "VACCINE COLD CHAIN"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "NALOXONE — OPIOID REVERSAL",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > MECHANISM: Competitive opioid receptor antagonist — rapidly reverses opioid overdose.
        > FORMULATIONS: Nasal spray (Narcan), auto-injector (Evzio), IV/IM/SQ injectable.
        > DOSE: Intranasal 4 mg per nostril; may repeat every 2–3 min; duration shorter than most opioids.
        > REPEAT DOSING: Required for long-acting opioids (methadone, fentanyl patch) — patient must be monitored.
        > STANDING ORDER/OTC: Available without Rx in most states via standing order or as OTC.
        > COUNSELING: Patient/caregiver education on signs of OD and how to administer; call 911 after use.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A single dose of naloxone nasal spray is always sufficient to reverse any opioid overdose",
            "B. Naloxone is an opioid antagonist (competitive); intranasal 4 mg; repeat every 2–3 min as needed; duration may be shorter than opioid — monitor and call 911; available OTC/standing order",
            "C. Naloxone is only effective for heroin overdose and does not work for prescription opioids",
            "D. Naloxone should only be administered by healthcare professionals in clinical settings"
        ],
        correctAnswer: "B. Naloxone is an opioid antagonist (competitive); intranasal 4 mg; repeat every 2–3 min as needed; duration may be shorter than opioid — monitor and call 911; available OTC/standing order",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.68,
        angle: .mechanism,
        baseConceptTitle: "NALOXONE"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "BEERS CRITERIA — ELDERLY SAFETY",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > BEERS CRITERIA: AGS (American Geriatrics Society) list of potentially inappropriate medications (PIMs) in adults ≥65.
        > PURPOSE: Reduce adverse drug events in elderly — falls, cognitive impairment, over-sedation.
        > EXAMPLES TO AVOID: Diphenhydramine (anticholinergic, confusion); benzodiazepines (falls); meperidine (neurotoxic metabolite); sliding scale insulin (hypoglycemia); certain NSAIDs.
        > ANTICHOLINERGIC BURDEN: Additive anticholinergic effects (dry mouth, urinary retention, constipation, confusion, blurred vision).
        > MONITORING: Not absolute contraindications — clinical judgment required.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Beers Criteria medications are absolutely contraindicated and can never be prescribed to elderly patients",
            "B. Beers Criteria lists PIMs for patients ≥65 to reduce falls, confusion, and over-sedation; examples include diphenhydramine, benzodiazepines, and meperidine; clinical judgment still applies",
            "C. Beers Criteria is published by the FDA and carries the force of federal law",
            "D. Beers Criteria only applies to patients in nursing homes, not community-dwelling elderly"
        ],
        correctAnswer: "B. Beers Criteria lists PIMs for patients ≥65 to reduce falls, confusion, and over-sedation; examples include diphenhydramine, benzodiazepines, and meperidine; clinical judgment still applies",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.68,
        angle: .safety,
        baseConceptTitle: "BEERS CRITERIA"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "DRUG-NUTRIENT INTERACTIONS",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > GRAPEFRUIT JUICE: CYP3A4 inhibitor — increases levels of statins (simvastatin, lovastatin), CCBs, cyclosporine, tacrolimus, sildenafil, many others.
        > WARFARIN + VITAMIN K FOODS: High-K foods (leafy greens) reduce INR; maintain consistent intake.
        > TETRACYCLINES/FLUOROQUINOLONES + DAIRY/DIVALENT CATIONS: Ca²⁺, Mg²⁺, Fe²⁺, Al³⁺ → chelation → reduced absorption.
        > LEVOTHYROXINE + FOOD: Must take 30–60 min before breakfast; calcium, iron, soy reduce absorption.
        > MAOIs + TYRAMINE: Hypertensive crisis — avoid aged cheese, cured meats, fermented foods.
        > ALCOHOL + MEDICATIONS: CNS depressants, metronidazole (disulfiram-like), linezolid, MAOIs.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Grapefruit juice can be safely consumed with all statin medications",
            "B. Grapefruit juice inhibits CYP3A4 (raises simvastatin/lovastatin levels); warfarin requires consistent vitamin K intake; tetracyclines chelate with divalent cations (dairy); MAOIs + tyramine = hypertensive crisis",
            "C. Levothyroxine absorption is improved when taken with calcium-rich foods",
            "D. Tetracyclines are unaffected by dairy products and divalent cations"
        ],
        correctAnswer: "B. Grapefruit juice inhibits CYP3A4 (raises simvastatin/lovastatin levels); warfarin requires consistent vitamin K intake; tetracyclines chelate with divalent cations (dairy); MAOIs + tyramine = hypertensive crisis",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.38,
        yOffset: 0.78,
        angle: .safety,
        baseConceptTitle: "DRUG-NUTRIENT INTERACTIONS"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "CQI — ERROR REPORTING SYSTEMS",
        loreText: """
        > SECTOR-03 // PATIENT SAFETY
        > CQI: Continuous Quality Improvement — systematic process to identify, analyze, and prevent medication errors.
        > NEAR MISS: Error caught before reaching the patient — must still be reported and analyzed.
        > REPORTING SYSTEMS: MedWatch (FDA — ADRs), ISMP MERP (Medication Error Reporting Program), USP MEDMARX.
        > ROOT CAUSE ANALYSIS (RCA): Deep investigation of system-level causes of errors (not blame-focused).
        > JUST CULTURE: Encourages reporting without punitive fear — distinguishes human error from reckless behavior.
        > SENTINEL EVENT: Unexpected occurrence causing death or serious injury — JCAHO requires root cause analysis.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Near-miss events do not need to be reported since no patient harm occurred",
            "B. Near misses must be reported and analyzed; CQI uses RCA to find system-level causes; Just Culture encourages reporting; MedWatch/ISMP MERP are key reporting systems",
            "C. Root cause analysis focuses on identifying and disciplining the individual who made the error",
            "D. MedWatch is used to report medication errors, while ISMP MERP is used for ADR reporting"
        ],
        correctAnswer: "B. Near misses must be reported and analyzed; CQI uses RCA to find system-level causes; Just Culture encourages reporting; MedWatch/ISMP MERP are key reporting systems",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.72,
        yOffset: 0.78,
        angle: .safety,
        baseConceptTitle: "CQI / ERROR REPORTING"
    ),
]
