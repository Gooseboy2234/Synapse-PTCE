
//
//  MultiAngle_D3.swift
//  Synapse PTCE
//
//  Multi-angle nodes for Domain 3: Patient Safety & Quality Assurance
//  24 nodes covering high-alert meds, LASA, error reporting, USP chapters, and storage
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D3: [DataNode] {[

        // MARK: — HIGH-ALERT MEDICATIONS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS / DEFINITION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — What are high-alert medications?
            > DEFINITION: Drugs that bear a heightened risk of causing significant patient harm when used in error, even if the error itself is common.
            > SOURCE: ISMP (Institute for Safe Medication Practices) maintains the High-Alert Medication list
            > EXAMPLES: Anticoagulants, insulin, concentrated electrolytes, opioids, chemotherapy agents, hypertonic saline
            > HARM LEVEL: Errors may not be more frequent, but CONSEQUENCES of errors are more severe
            > SAFEGUARDS: Independent double-checks, special labeling, separate storage, pharmacist verification
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Medications that are the most commonly dispensed in a retail setting",
                "B. Drugs that are frequently involved in dispensing errors regardless of severity",
                "C. Drugs that bear heightened risk of significant patient harm when used in error",
                "D. Medications requiring refrigeration due to temperature sensitivity"
            ],
            correctAnswer: "C. Drugs that bear heightened risk of significant patient harm when used in error",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "HIGH-ALERT MEDICATIONS"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS / ANTICOAGULANTS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Anticoagulant error prevention
            > HIGH-ALERT: All anticoagulants (warfarin, heparin, enoxaparin, DOACs) are ISMP High-Alert
            > ERROR TYPES: Wrong drug (e.g., heparin flush vs therapeutic heparin), wrong dose, wrong route
            > HEPARIN: Use prefilled syringes; pharmacy must prepare all heparin infusions; 10 units/mL vs 1000 units/mL look alike — REMOVE concentrated heparin from floor stock
            > WARFARIN: Verify INR before dispensing; assess drug interactions; counsel on diet
            > PROTOCOL: Many institutions require independent double-check for IV heparin infusions
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Separate storage from floor stock and require independent double-check",
                "B. No special precautions needed for anticoagulants in retail pharmacy",
                "C. Anticoagulants may be self-administered without professional guidance",
                "D. Only warfarin is considered high-alert — heparin is not on the ISMP list"
            ],
            correctAnswer: "A. Separate storage from floor stock and require independent double-check",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.10,
            angle: .safety,
            baseConceptTitle: "HIGH-ALERT ANTICOAGULANTS"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS / INSULIN SAFETY",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Insulin error prevention strategies
            > HIGH-ALERT: Insulin is on all major high-alert medication lists (ISMP, TJC)
            > ERROR RISK: 'U' abbreviation for units (e.g., 'U-500') misread as '0' → 10× overdose
            > ISMP: Never abbreviate 'units' as 'U' — write 'units' in full
            > LOOK-ALIKE: Insulin types have similar packaging (Humalog vs Humulin, Novolog vs Novolin)
            > PROTOCOL: Insulin orders must include type, dose in units, route, and timing relative to meals
            > CONCENTRATED: U-500 insulin requires special dispensing protocols and dedicated syringes
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Write 'U' as an abbreviation to save time and prevent confusion",
                "B. Spell out 'units' in full — 'U' can be misread as '0', causing 10× overdose",
                "C. Use 'IU' (International Units) as the safe abbreviation for insulin units",
                "D. Abbreviations are acceptable as long as the order is computerized"
            ],
            correctAnswer: "B. Spell out 'units' in full — 'U' can be misread as '0', causing 10× overdose",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.18,
            angle: .safety,
            baseConceptTitle: "HIGH-ALERT INSULIN"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS / CONCENTRATED ELECTROLYTES",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Concentrated electrolyte storage and safety
            > HIGH-ALERT: Concentrated KCl (potassium chloride) and hypertonic NaCl ≥3%
            > KCL DANGER: IV bolus of concentrated KCl is fatal — cardiac arrest
            > ISMP RECOMMENDATION: Remove concentrated KCl (>2 mEq/mL) from patient care areas; pharmacy prepares all electrolyte solutions
            > HYPERTONIC SALINE: 3%, 23.4% — must be restricted to certain care settings (ICU)
            > LABELING: Must be labeled "WARNING: CONCENTRATED SOLUTION — MUST BE DILUTED"
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Concentrated KCl can be stored in patient rooms for rapid access",
                "B. Remove concentrated KCl vials from patient areas — pharmacy prepares all IV electrolyte solutions",
                "C. Nurses may administer concentrated electrolytes via IV push as needed",
                "D. Only premixed electrolyte solutions are available — no concentrated forms exist"
            ],
            correctAnswer: "B. Remove concentrated KCl vials from patient areas — pharmacy prepares all IV electrolyte solutions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.18,
            angle: .safety,
            baseConceptTitle: "CONCENTRATED ELECTROLYTES"
        ),

        // MARK: — LASA MEDICATIONS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA / DEFINITION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — What are LASA medications?
            > LASA: Look-Alike, Sound-Alike medications — drugs with similar names or appearance
            > RISK: Name confusion is one of the most common causes of medication errors
            > SOURCES: ISMP LASA list, FDA LASA list
            > EXAMPLES: Hydroxyzine/hydralazine; Zantac/Zyrtec/Xanax; Celebrex/Cerebyx/Celexa
            > TALL MAN LETTERING: FDA-approved strategy using uppercase letters to distinguish similar names
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Medications with similar mechanisms of action and therapeutic uses",
                "B. Drugs with similar names or packaging that can be confused for each other",
                "C. Medications that are approved biosimilars of reference listed drugs",
                "D. Drugs that share the same DEA controlled substance schedule"
            ],
            correctAnswer: "B. Drugs with similar names or packaging that can be confused for each other",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.26,
            angle: .classification,
            baseConceptTitle: "LASA MEDICATIONS"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA / TALL MAN LETTERING",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Tall man lettering as an error-prevention strategy
            > DEFINITION: Using mixed case with uppercase letters to highlight differences between look-alike drug names
            > FDA LIST EXAMPLES: chlorproPAMIDE vs chlorproMAZINE; hydrALAZINE vs hydrOXYzine; DOPamine vs DOBUTamine
            > ISMP LIST: Broader list including: vinCRIStine vs vinBLAStine; EPINEPHrine vs ePHEDrine; ALPRAZolam vs LORazepam
            > STRATEGY: Focus attention on the differentiating portion of the drug name
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Writing drug names in all-lowercase to avoid dosing confusion",
                "B. Using uppercase letters to highlight the differentiating portion of similar drug names",
                "C. Using acronyms for long drug names to improve readability",
                "D. Printing drug names in red ink to alert staff to high-alert status"
            ],
            correctAnswer: "B. Using uppercase letters to highlight the differentiating portion of similar drug names",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.26,
            angle: .safety,
            baseConceptTitle: "TALL MAN LETTERING"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA / COMMON PAIRS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Frequently tested LASA drug pairs on PTCE
            > PAIR 1: Hydroxyzine (antihistamine) vs Hydralazine (antihypertensive)
            > PAIR 2: Clonidine (antihypertensive) vs Clonazepam (benzodiazepine)
            > PAIR 3: Oxycodone vs OxyContin vs Oxybutynin (very different uses!)
            > PAIR 4: Metoprolol (beta-blocker) vs Metformin (antidiabetic)
            > PAIR 5: Celecoxib (COX-2 inhibitor) vs Citalopram (SSRI) vs Cefixime (cephalosporin)
            > PREVENTION: Read back verbal orders; separate storage on pharmacy shelf; barcode scanning
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hydroxyzine (antihistamine) and Hydralazine (antihypertensive)",
                "B. Metformin (antidiabetic) and Metoprolol (beta-blocker) — same first 5 letters",
                "C. Clonidine (antihypertensive) and Clonazepam (benzodiazepam)",
                "D. All of the above pairs represent clinically significant LASA risks"
            ],
            correctAnswer: "D. All of the above pairs represent clinically significant LASA risks",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.34,
            angle: .classification,
            baseConceptTitle: "LASA PAIRS"
        ),

        // MARK: — ERROR REPORTING

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR REPORTING / ISMP",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Role of ISMP in medication safety
            > ISMP: Institute for Safe Medication Practices — independent, nonprofit focused on medication error prevention
            > MERP: Medication Errors Reporting Program — voluntary confidential reporting to ISMP
            > DATA USE: ISMP analyzes reports, identifies systemic causes, issues safety alerts
            > ISMP PUBLISHES: High-Alert Medication list, LASA list, Confused Drug Name list, Do Not Use abbreviation list
            > REPORTING: Voluntary by healthcare providers; ISMP shares data with FDA
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A federal government agency that mandates reporting of all medication errors",
                "B. An independent nonprofit that operates MERP for voluntary confidential medication error reporting",
                "C. The pharmacy board responsible for licensing pharmacists and pharmacies",
                "D. An insurance-based organization that monitors medication spending trends"
            ],
            correctAnswer: "B. An independent nonprofit that operates MERP for voluntary confidential medication error reporting",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.34,
            angle: .classification,
            baseConceptTitle: "ISMP"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR REPORTING / MEDWATCH",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — MedWatch FDA adverse event reporting
            > MEDWATCH: FDA's Safety Reporting Portal (www.fda.gov/safety/medwatch)
            > PURPOSE: Report serious adverse drug reactions, product quality problems, medication errors, and device problems
            > WHO REPORTS: Healthcare professionals and consumers may report voluntarily
            > MANUFACTURERS: Required to report certain adverse events to FDA
            > SERIOUS = Adverse events that result in: death, life-threatening condition, hospitalization, disability, congenital anomaly, or required intervention to prevent permanent impairment
            """,
            challengeType: .multipleChoice,
            options: [
                "A. MedWatch is used to report controlled substance diversion to the DEA",
                "B. MedWatch is the FDA portal for reporting serious adverse drug reactions and product problems",
                "C. MedWatch is ISMP's voluntary medication error reporting system",
                "D. MedWatch is the state pharmacy board's disciplinary reporting system"
            ],
            correctAnswer: "B. MedWatch is the FDA portal for reporting serious adverse drug reactions and product problems",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.42,
            angle: .safety,
            baseConceptTitle: "MEDWATCH"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR CATEGORIES / NCC MERP",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — NCC MERP error taxonomy
            > NCC MERP: National Coordinating Council for Medication Error Reporting and Prevention
            > CATEGORY A: Circumstances that have the capacity to cause error (near-miss)
            > CATEGORY B: Error occurred but did not reach the patient
            > CATEGORY C: Error reached patient, no harm
            > CATEGORY D: Error reached patient, required monitoring to confirm no harm
            > CATEGORIES E–I: Error reached patient, caused harm (temporary to fatal)
            > PURPOSE: Standardize error classification across institutions for data analysis
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Category A — error reached patient and caused temporary harm",
                "B. Category B — error occurred but did NOT reach the patient",
                "C. Category E — no harm occurred and no intervention was needed",
                "D. Category I — minor error requiring only monitoring to confirm safety"
            ],
            correctAnswer: "B. Category B — error occurred but did NOT reach the patient",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.42,
            angle: .classification,
            baseConceptTitle: "NCC MERP"
        ),

        // MARK: — USP CHAPTERS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 795 / NON-STERILE COMPOUNDING",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Scope of USP Chapter <795>
            > CHAPTER: USP <795> — Pharmaceutical Compounding — Nonsterile Preparations
            > SCOPE: Standards for preparation, quality control, packaging, and storage of non-sterile compounded preparations
            > EXAMPLES: Topical creams, ointments, oral solutions, suppositories
            > KEY ELEMENTS: Appropriate facilities, equipment, training, and documentation
            > BEYOND USE DATE (BUD): Limits on how long a compounded product can be used after preparation
            > NOT FOR: Sterile products (see USP <797>) or hazardous drugs (see USP <800>)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standards for sterile IV admixture preparation and clean rooms",
                "B. Standards for non-sterile compounding (topical creams, oral solutions, suppositories)",
                "C. Standards for handling hazardous drugs in all healthcare settings",
                "D. Standards for drug product testing by pharmaceutical manufacturers"
            ],
            correctAnswer: "B. Standards for non-sterile compounding (topical creams, oral solutions, suppositories)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.50,
            angle: .classification,
            baseConceptTitle: "USP 795"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 797 / STERILE COMPOUNDING",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Scope of USP Chapter <797>
            > CHAPTER: USP <797> — Pharmaceutical Compounding — Sterile Preparations
            > SCOPE: Standards for sterile compounding to prevent patient harm from microbial contamination, pyrogens, and incorrect drug content
            > APPLIES TO: IV admixtures, injections, ophthalmic preparations, irrigation solutions
            > CLEAN ROOMS: ISO Class 5 (primary engineering control), Class 7 (buffer area), Class 8 (ante-area)
            > BEYOND USE DATES: Category 1 (no sterility testing), Category 2 (extended BUD with sterility/endotoxin testing)
            > TRAINING: Garbing, aseptic technique, competency assessments required for all personnel
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Non-sterile compounding standards (topical creams, oral solutions)",
                "B. Sterile compounding standards for IV admixtures and injectable preparations",
                "C. Hazardous drug handling standards applicable to chemotherapy agents",
                "D. Manufacturing standards for FDA-approved pharmaceutical companies"
            ],
            correctAnswer: "B. Sterile compounding standards for IV admixtures and injectable preparations",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.50,
            angle: .classification,
            baseConceptTitle: "USP 797"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 800 / HAZARDOUS DRUGS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — USP Chapter <800> hazardous drug handling
            > CHAPTER: USP <800> — Hazardous Drugs — Handling in Healthcare Settings
            > SCOPE: Standards to protect healthcare workers from occupational exposure to hazardous drugs
            > HAZARDOUS DRUGS: Chemotherapy agents, certain antivirals, hormones (estrogen, testosterone), some immunosuppressants
            > NIOSH LIST: National Institute for Occupational Safety and Health list of hazardous drugs
            > PPE: Chemotherapy gloves (double-gloving), gown, face shield, respirator for some drugs
            > CLOSED SYSTEM: CSTD (closed system drug-transfer device) required for HD preparation and administration
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standards for non-sterile compounding quality control",
                "B. Standards for sterile IV admixture preparation and clean room classification",
                "C. Standards for protecting healthcare workers handling hazardous drugs (chemo, hormones)",
                "D. Standards for FDA drug approval and bioequivalence testing"
            ],
            correctAnswer: "C. Standards for protecting healthcare workers handling hazardous drugs (chemo, hormones)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.58,
            angle: .safety,
            baseConceptTitle: "USP 800"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BEYOND USE DATE / vs EXPIRATION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — BUD vs expiration date
            > EXPIRATION DATE: Set by manufacturer based on stability testing of unopened product
            > BEYOND USE DATE (BUD): Date/time after which a compounded or opened product should not be used, set by pharmacist
            > BUD ALWAYS ≤ EXPIRATION DATE: BUD cannot exceed manufacturer's expiration
            > OPENED PRODUCTS: Multi-dose vials have BUD of 28 days after opening (unless stated otherwise)
            > RECONSTITUTED: Amoxicillin suspension BUD = 14 days refrigerated; varies by drug
            > USP SETS BUD GUIDELINES: Based on compounding category, sterilization method, storage conditions
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Expiration date is set by the pharmacist; BUD is set by the manufacturer",
                "B. Expiration date is for unopened product (manufacturer); BUD is set by pharmacist for opened/compounded products",
                "C. BUD and expiration date are identical and interchangeable terms",
                "D. BUD applies only to controlled substances; expiration date applies to all other drugs"
            ],
            correctAnswer: "B. Expiration date is for unopened product (manufacturer); BUD is set by pharmacist for opened/compounded products",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.58,
            angle: .classification,
            baseConceptTitle: "BEYOND USE DATE"
        ),

        // MARK: — STORAGE REQUIREMENTS

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "STORAGE / TEMPERATURE RANGES",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — USP temperature storage definitions
            > CONTROLLED ROOM TEMP (CRT): 20–25°C (68–77°F) — "Store at room temperature"
            > REFRIGERATED: 2–8°C (36–46°F) — "Keep refrigerated"
            > FROZEN: -25°C to -10°C (-13°F to 14°F) — "Keep frozen"
            > COOL: 8–15°C (46–59°F)
            > WARM: 30–40°C (86–104°F)
            > EXCURSIONS: Short-term deviations from CRT permitted: 15–30°C acceptable for <24 hours
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Refrigerated: 0–4°C (32–39°F)",
                "B. Refrigerated: 2–8°C (36–46°F) — also called 'cool' temperature",
                "C. Refrigerated: 8–15°C (46–59°F)",
                "D. Refrigerated: 10–20°C (50–68°F)"
            ],
            correctAnswer: "B. Refrigerated: 2–8°C (36–46°F) — also called 'cool' temperature",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "STORAGE TEMPERATURES"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "STORAGE / LIGHT-SENSITIVE DRUGS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Light-sensitive medication storage
            > DEFINITION: Some drugs degrade when exposed to ultraviolet or visible light
            > PACKAGING: Amber/brown bottles and light-resistant containers used for protection
            > EXAMPLES: Nitroglycerin (glass bottles only), sodium nitroprusside, furosemide IV, vitamins (riboflavin, folic acid), morphine injection
            > NITROGLYCERIN: Absorbs into plastic — must be dispensed in glass container; also absorbs into IV tubing
            > WRAP: Some IV bags must be wrapped in foil during infusion (amphotericin B, cisplatin)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. All medications must be stored in light-resistant containers by federal law",
                "B. Light-sensitive drugs like nitroglycerin must be stored in amber/brown glass containers",
                "C. Only injectable drugs are light-sensitive; oral tablets are not affected",
                "D. Refrigeration substitutes for light protection — cold prevents light degradation"
            ],
            correctAnswer: "B. Light-sensitive drugs like nitroglycerin must be stored in amber/brown glass containers",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.66,
            angle: .safety,
            baseConceptTitle: "LIGHT-SENSITIVE STORAGE"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "MEDICATION RECONCILIATION / PURPOSE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Medication reconciliation at care transitions
            > DEFINITION: The process of comparing a patient's medication orders to all of the medications the patient has been taking
            > PURPOSE: Prevent medication errors (omissions, duplications, dosing errors, interactions) during transitions of care
            > TRANSITIONS: Admission, transfer between units, discharge
            > PHARMACY ROLE: Pharmacist-led reconciliation significantly reduces discrepancies
            > JOINT COMMISSION: NPSG 03.06.01 — organizations must maintain and communicate accurate medication lists
            > BEST MEDICATION HISTORY (BMH): Includes name, dose, frequency, route, and indication
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Comparing a patient's medication list to prevent errors during care transitions",
                "B. Verifying that medications are stored correctly in all patient care areas",
                "C. The process of documenting adverse drug reactions in the medical record",
                "D. Checking that insurance has approved all medications before dispensing"
            ],
            correctAnswer: "A. Comparing a patient's medication list to prevent errors during care transitions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "MEDICATION RECONCILIATION"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "DO NOT USE ABBREVIATIONS / ISMP LIST",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Dangerous abbreviations on the ISMP Do Not Use list
            > 'U' or 'u' for units — misread as '0', '4', or 'cc'
            > 'IU' for international units — misread as 'IV' or '10'
            > 'QD', 'QOD' — misread as 'QID' (4 times a day vs once daily)
            > 'MS', 'MSO4', 'MgSO4' — confused between morphine sulfate and magnesium sulfate
            > 'Trailing zero' (1.0 mg) — decimal point missed → 10× overdose risk
            > 'Naked decimal' (.5 mg) — always write 0.5 mg
            > JOINT COMMISSION: Also has official 'Do Not Use' list aligning with ISMP
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 'U' for units and trailing zeros like '1.0 mg' should always be used for clarity",
                "B. Write 'units' in full; avoid trailing zeros (write '1 mg' not '1.0 mg') and always use leading zeros ('0.5 mg' not '.5 mg')",
                "C. Abbreviations approved by JCAHO are universally safe across all healthcare settings",
                "D. Use 'IU' for international units and 'MS' for morphine — these are standardized"
            ],
            correctAnswer: "B. Write 'units' in full; avoid trailing zeros (write '1 mg' not '1.0 mg') and always use leading zeros ('0.5 mg' not '.5 mg')",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "DANGEROUS ABBREVIATIONS"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "QUALITY ASSURANCE / PHARMACY QA PROGRAM",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Elements of a pharmacy quality assurance program
            > PURPOSE: Systematic monitoring and evaluation to ensure safe, accurate medication dispensing
            > ELEMENTS: Error detection and reporting, root cause analysis, PDCA cycle (Plan-Do-Check-Act)
            > INDICATORS: Dispensing error rate, near-miss events, patient complaints, prescription turnaround time
            > ROOT CAUSE ANALYSIS (RCA): Systematic retrospective review of serious errors to identify underlying system failures
            > LEAN/SIX SIGMA: Process improvement methodologies used in pharmacy to reduce waste and variation
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A program solely focused on catching and disciplining pharmacists who make errors",
                "B. A systematic approach to monitoring, detecting, and preventing medication errors through process improvement",
                "C. Annual accreditation surveys conducted by the Joint Commission",
                "D. An insurance audit program reviewing prescription claims for fraud"
            ],
            correctAnswer: "B. A systematic approach to monitoring, detecting, and preventing medication errors through process improvement",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.82,
            angle: .classification,
            baseConceptTitle: "QA PROGRAM"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "VERBAL ORDERS / SAFETY REQUIREMENTS",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Handling verbal and telephone orders
            > READ BACK: Pharmacist or nurse must repeat (read back) verbal orders to prescriber for verification
            > TALL MAN: Use tall man lettering or clarification techniques for sound-alike drug names over phone
            > SPELL IT OUT: For LASA pairs, prescriber should spell the drug name during verbal orders
            > DOCUMENTATION: Verbal orders must be documented immediately and verified/co-signed by prescriber within a defined timeframe
            > LIMIT USE: Joint Commission recommends limiting verbal orders to urgent/emergent situations only
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Verbal orders should be accepted freely — prescriber authority is sufficient",
                "B. Read back the entire verbal order to the prescriber to confirm accuracy before acting",
                "C. Verbal orders are prohibited by the Joint Commission in all settings",
                "D. Only pharmacists may receive verbal orders — nurses cannot transcribe them"
            ],
            correctAnswer: "B. Read back the entire verbal order to the prescriber to confirm accuracy before acting",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.82,
            angle: .safety,
            baseConceptTitle: "VERBAL ORDERS"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LOOK-ALIKE PACKAGING / PREVENTION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Safety — Preventing look-alike packaging errors
            > PROBLEM: Similar drug packaging (same manufacturer, different products) causes wrong-drug errors
            > EXAMPLE: Insulin vial labeling confusion (Humalog vs Humulin vials look similar)
            > STRATEGIES: Auxiliary labels; separate storage by spacing similar products apart; barcode point-of-care scanning; patient-specific dispensing
            > PHARMACY DESIGN: Store similar products in non-adjacent locations; never alphabetize products that look alike
            > TECHNOLOGY: Barcode medication administration (BCMA) is most effective prevention tool
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Store similar-looking products alphabetically for easy retrieval",
                "B. Separate look-alike products to non-adjacent locations and use barcode scanning at administration",
                "C. Place warning stickers on one product in each LASA pair",
                "D. Only allow senior pharmacists to dispense look-alike medications"
            ],
            correctAnswer: "B. Separate look-alike products to non-adjacent locations and use barcode scanning at administration",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.90,
            angle: .safety,
            baseConceptTitle: "LOOK-ALIKE PACKAGING"
        ),

        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "TECH CHECK TECH / SCOPE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > ANGLE: Classification — Tech-check-tech programs and technician scope
            > DEFINITION: Program allowing experienced pharmacy technicians to check the work of other technicians, with pharmacist oversight
            > PURPOSE: Improves workflow efficiency while maintaining safety checks
            > STUDIES: Research shows tech-check-tech accuracy is comparable to pharmacist checks for routine fills
            > STATE SPECIFIC: Not all states allow tech-check-tech — varies by state board regulations
            > PHARMACIST ROLE: Pharmacist must still perform final verification of drug therapy appropriateness and patient counseling
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A program that allows pharmacists to delegate all final verification to technicians",
                "B. A program allowing experienced technicians to check other technicians' work for routine fills, under pharmacist oversight",
                "C. A federal program requiring two pharmacists to verify each controlled substance dispensing",
                "D. An automated robotic dispensing check that replaces human verification"
            ],
            correctAnswer: "B. A program allowing experienced technicians to check other technicians' work for routine fills, under pharmacist oversight",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.90,
            angle: .classification,
            baseConceptTitle: "TECH CHECK TECH"
        ),

    ]}
}
