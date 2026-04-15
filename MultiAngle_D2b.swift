
//
//  MultiAngle_D2b.swift
//  Synapse PTCE
//
//  Multi-angle nodes — Domain 2: Federal Requirements (Expansion)
//  14 nodes covering FDA approval, drug labeling, PPPA, state/federal law,
//  corresponding responsibility, diversion, DEA Form 222/CSOS, and patient rights
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D2b: [DataNode] {[

        // MARK: — FDA DRUG APPROVAL

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "FDA APPROVAL / NDA vs ANDA",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — New Drug Application vs Abbreviated New Drug Application
            > NDA: New Drug Application — filed by innovator/brand manufacturer; must prove safety AND efficacy through clinical trials (Phase I, II, III)
            > ANDA: Abbreviated New Drug Application — filed for generic drugs; does NOT require new clinical trials; must prove BIOEQUIVALENCE to reference listed drug (RLD)
            > BIOEQUIVALENCE: AUC and Cmax within 80–125% of reference brand (90% CI)
            > BLA: Biologics License Application — for large-molecule biologic drugs (antibodies, vaccines); more complex than NDA
            > BIOSIMILAR: No clinically meaningful differences from reference biologic; proven by totality of evidence
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Both NDA and ANDA require identical Phase I-III clinical trial programs",
                "B. ANDA does not require new clinical trials — only proof of bioequivalence to the reference listed drug",
                "C. ANDA is filed for brand-name products; NDA is for generics",
                "D. Bioequivalence requires AUC and Cmax within 50–150% of the reference drug"
            ],
            correctAnswer: "B. ANDA does not require new clinical trials — only proof of bioequivalence to the reference listed drug",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "FDA DRUG APPROVAL"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "FDA APPROVAL / DRUG DEVELOPMENT PHASES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Clinical trial phases for NDA approval
            > PHASE I: First-in-human; small group (20–100 healthy volunteers); primary goal: SAFETY and pharmacokinetics; establish dose range
            > PHASE II: Larger group (100–300 patients with disease); primary goal: EFFICACY and dose finding; identify side effects
            > PHASE III: Large, randomized controlled trial (1,000–3,000+ patients); confirm efficacy and safety vs placebo or current standard of care
            > PHASE IV: Post-marketing surveillance — conducted AFTER FDA approval; identify rare long-term ADRs (pharmacovigilance)
            > IND: Investigational New Drug application — required before Phase I can begin
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Phase I focuses on efficacy; Phase III establishes safe dosing ranges",
                "B. Phase I (safety/PK in healthy subjects) → Phase II (efficacy) → Phase III (large RCT) → Phase IV (post-market)",
                "C. Phase IV trials are conducted before FDA approval to ensure safety",
                "D. Only two phases are required before FDA approval of a new drug"
            ],
            correctAnswer: "B. Phase I (safety/PK in healthy subjects) → Phase II (efficacy) → Phase III (large RCT) → Phase IV (post-market)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "CLINICAL TRIALS"
        ),

        // MARK: — DRUG LABELING

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG LABELING / PACKAGE INSERT",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — FDA-required prescription drug labeling
            > PACKAGE INSERT (PI): Official FDA-approved labeling for Rx drugs; also called "prescribing information"
            > REQUIRED SECTIONS: Indications and usage, dosage and administration, dosage forms/strengths, contraindications, warnings/precautions, adverse reactions, drug interactions, use in specific populations, overdosage, clinical pharmacology, storage and handling
            > HIGHLIGHTS: Section at top summarizes most critical information (1-page max)
            > BOXED WARNING (Black Box): Most prominent warning — placed above all other sections; reserved for serious/life-threatening risks
            > MEDICATION GUIDE (MedGuide): Required for certain drugs with serious risks; given to patient each fill
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Package inserts are written by pharmacists and vary by retail chain",
                "B. FDA-approved package inserts contain all required prescribing information; boxed warnings indicate most serious risks",
                "C. Medication Guides are required for all prescription drugs regardless of risk",
                "D. Package inserts are only required for controlled substances under DEA regulations"
            ],
            correctAnswer: "B. FDA-approved package inserts contain all required prescribing information; boxed warnings indicate most serious risks",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.20,
            angle: .classification,
            baseConceptTitle: "PACKAGE INSERT"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG LABELING / OTC DRUG FACTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — OTC Drug Facts label requirements
            > DRUG FACTS: Required format for all OTC product labels (FDA mandated since 2002)
            > REQUIRED SECTIONS: Active ingredients, uses, warnings, directions, other information (storage), inactive ingredients
            > PURPOSE: Standardized format allows consumers to compare products and understand drug use
            > ACTIVE INGREDIENT: Must list drug name and purpose (e.g., "Acetaminophen 500 mg — Pain reliever")
            > WARNINGS: Must include "When using this product," "Ask a doctor before use if," "Stop use and ask doctor if," and pregnancy/nursing warning
            > NDC NUMBER: National Drug Code appears on all drug labels — identifies manufacturer, product, package size
            """,
            challengeType: .multipleChoice,
            options: [
                "A. OTC drug labels may use any format as long as the active ingredient is listed",
                "B. All OTC products must use the standardized Drug Facts format required by FDA",
                "C. Drug Facts labels are voluntary — only required for combination OTC products",
                "D. OTC labels only need to list the active ingredient and dosing instructions"
            ],
            correctAnswer: "B. All OTC products must use the standardized Drug Facts format required by FDA",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.20,
            angle: .classification,
            baseConceptTitle: "OTC DRUG FACTS"
        ),

        // MARK: — POISON PREVENTION PACKAGING ACT

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "PPPA / CHILD-RESISTANT PACKAGING",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Poison Prevention Packaging Act requirements
            > PPPA: Poison Prevention Packaging Act (1970) — requires child-resistant (CR) packaging for most Rx and OTC drugs
            > CHILD-RESISTANT: Packaging that ≥80% of children under 5 cannot open within 5 minutes but ≥90% of adults can open within 5 minutes
            > EXCEPTIONS (do not require CR): Nitroglycerin SL tablets (patient accessibility), oral contraceptives in 28-day packs, emergency contraception, unit-dose packaging in hospitals, if patient/prescriber requests non-CR (signed waiver)
            > PATIENT WAIVER: Patient (or prescriber) may request non-child-resistant caps in writing — pharmacy must accommodate
            """,
            challengeType: .multipleChoice,
            options: [
                "A. All medications including nitroglycerin must be dispensed in child-resistant containers",
                "B. Nitroglycerin SL tablets are exempt from CR packaging requirements for accessibility reasons",
                "C. Child-resistant packaging must be impossible to open — no adult should be able to open it",
                "D. PPPA only applies to controlled substances — non-controlled drugs may use any container"
            ],
            correctAnswer: "B. Nitroglycerin SL tablets are exempt from CR packaging requirements for accessibility reasons",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.30,
            angle: .safety,
            baseConceptTitle: "PPPA"
        ),

        // MARK: — STATE vs FEDERAL LAW

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "STATE vs FEDERAL LAW / CONFLICT PRINCIPLE",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Which law controls when state and federal laws conflict?
            > PRINCIPLE: When state and federal pharmacy laws conflict, follow the MORE RESTRICTIVE law
            > EXAMPLE 1: Federal allows CIII–V transfer once; state allows unlimited within chain → follow federal (once transfer) when stricter; follow state (unlimited) when stricter
            > EXAMPLE 2: Federal requires 2-year CS record retention; state requires 5 years → follow state (5 years — more restrictive)
            > EXAMPLE 3: Federal allows marijuana as Schedule I (no use); some states allow recreational → federal law still applies to federally regulated entities (pharmacies)
            > PTCE RULE: "Follow the more stringent regulation" — always pick the one that imposes greater restriction or longer requirement
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Federal law always supersedes state law in all pharmacy-related matters",
                "B. State law always supersedes federal law when they conflict",
                "C. When state and federal laws conflict, follow the more restrictive (stricter) law",
                "D. The pharmacist chooses which law to follow based on clinical judgment"
            ],
            correctAnswer: "C. When state and federal laws conflict, follow the more restrictive (stricter) law",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.30,
            angle: .classification,
            baseConceptTitle: "STATE vs FEDERAL LAW"
        ),

        // MARK: — CORRESPONDING RESPONSIBILITY

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CORRESPONDING RESPONSIBILITY",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Pharmacist's legal duty to verify controlled substance prescriptions
            > DEFINITION: The pharmacist shares equal responsibility with the prescriber for the legitimate purpose of a controlled substance prescription
            > DUTY: Pharmacist must determine that a controlled substance Rx was issued for a legitimate medical purpose by a registered prescriber acting in usual course of professional practice
            > RED FLAGS: Must investigate — multiple CS prescriptions from same prescriber same day, prescriptions for large quantities, prescriptions from unusually distant prescribers, cash payment for controlled substances, multiple prescribers for same CS
            > REFUSAL: Pharmacist has RIGHT to refuse to dispense a CS if in their professional judgment the prescription is not legitimate
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The prescriber bears all legal responsibility — pharmacists must fill any valid-looking CS prescription",
                "B. Pharmacist shares responsibility with prescriber; must verify legitimate medical purpose before dispensing CS",
                "C. Corresponding responsibility only applies to CII prescriptions — CIII-V have no pharmacist liability",
                "D. Pharmacists who refuse to fill a CS prescription can be disciplined for denying patient care"
            ],
            correctAnswer: "B. Pharmacist shares responsibility with prescriber; must verify legitimate medical purpose before dispensing CS",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.42,
            angle: .safety,
            baseConceptTitle: "CORRESPONDING RESPONSIBILITY"
        ),

        // MARK: — DEA FORM 222 AND CSOS

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DEA FORM 222 / CSOS ORDERING",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Ordering Schedule II controlled substances
            > DEA FORM 222: Required paper form for ordering CII substances from distributor; 3-part form
            >   • Copy 1: Kept by supplier (distributor)
            >   • Copy 2: Sent to DEA
            >   • Copy 3: Retained by pharmacy (must keep 2 years)
            > CSOS: Controlled Substance Ordering System — DEA's electronic alternative to Form 222 for CII ordering
            > WHO SIGNS: Only DEA registrant or authorized power of attorney may order CII
            > ERRORS: DEA 222 cannot be altered — if error made, spoil that form and use a new one
            > NOT FOR: CIII–CV ordering (can use regular purchase orders for non-CII)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. DEA Form 222 may be used to order any scheduled controlled substance",
                "B. DEA Form 222 is required for CII ordering only; CSOS is the electronic equivalent; 3-part form retained 2 years",
                "C. Any pharmacy employee may sign and submit a DEA Form 222",
                "D. DEA Form 222 errors may be corrected with white-out and initials of the pharmacist"
            ],
            correctAnswer: "B. DEA Form 222 is required for CII ordering only; CSOS is the electronic equivalent; 3-part form retained 2 years",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.42,
            angle: .classification,
            baseConceptTitle: "DEA FORM 222"
        ),

        // MARK: — DRUG DIVERSION

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG DIVERSION / REPORTING OBLIGATIONS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Controlled substance diversion detection and reporting
            > DIVERSION: Any removal of a controlled substance from legitimate medical use for illicit use or personal use
            > BIENNIAL INVENTORY: Every 2 years — must account for ALL controlled substances in stock; helps detect diversion
            > THEFT/SIGNIFICANT LOSS: Must report to DEA within 1 business day of discovery; DEA Form 106
            > IN-TRANSIT LOSS: If CS lost during shipping — DEA Form 107
            > EPCS CONTROLS: Electronic Prescribing for Controlled Substances — audit log of all CS e-Rx activity
            > PHARMACY POLICY: Pharmacies required to have written policies to identify, report, and prevent diversion
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Controlled substance theft must be reported to DEA within 1 business day using DEA Form 106",
                "B. Controlled substance loss must only be reported annually in the biennial inventory",
                "C. DEA Form 107 is used for in-pharmacy theft; Form 106 is for in-transit loss",
                "D. Pharmacies have 30 days to report CS theft or significant loss to the DEA"
            ],
            correctAnswer: "A. Controlled substance theft must be reported to DEA within 1 business day using DEA Form 106",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.54,
            angle: .safety,
            baseConceptTitle: "DRUG DIVERSION"
        ),

        // MARK: — BIENNIAL INVENTORY

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "BIENNIAL INVENTORY / CS REQUIREMENTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — DEA biennial controlled substance inventory
            > REQUIRED: Every 2 years (biennial) — physical count of all controlled substances on hand
            > TIMING: Must be taken on the same date (or within 2 years of) the last inventory; may choose a day close to the biennial date
            > CII REQUIREMENT: Must be an EXACT count or measure
            > CIII-CV: Estimated count acceptable (unless bottle contains more than 1000 units — then exact count required)
            > DOCUMENT: Date, time (opening or closing of business), signature of person taking inventory
            > RECORDS: Inventory records must be maintained for 2 years
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Annual — controlled substances must be inventoried every year",
                "B. Every 2 years (biennial) — CII requires exact count; CIII-V allows estimated count",
                "C. Every 6 months — DEA requires semi-annual physical inventory of all CS",
                "D. Only upon a DEA audit request — inventory is otherwise not routinely required"
            ],
            correctAnswer: "B. Every 2 years (biennial) — CII requires exact count; CIII-V allows estimated count",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.54,
            angle: .classification,
            baseConceptTitle: "BIENNIAL INVENTORY"
        ),

        // MARK: — PATIENT RIGHTS UNDER HIPAA

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA / PATIENT RIGHTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — What rights do patients have under HIPAA?
            > RIGHT TO ACCESS: Patients can request copies of their medical records (must be provided within 30 days)
            > RIGHT TO AMEND: Patients may request corrections to inaccurate or incomplete PHI
            > RIGHT TO RESTRICT: Patients may request restrictions on certain PHI disclosures (covered entity may or may not agree — but must agree if patient pays out-of-pocket and requests restriction to insurer)
            > RIGHT TO ACCOUNTING: Patients may request a list of certain disclosures of their PHI
            > RIGHT TO NPP: Patients have right to receive Notice of Privacy Practices at first visit
            > ENFORCEMENT: OCR (Office for Civil Rights) enforces HIPAA — can impose civil and criminal penalties
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Patients have no legal right to view their own medical records under HIPAA",
                "B. Patients can access their records within 30 days, request corrections, and receive Notice of Privacy Practices",
                "C. Patients may review their medical records only in the presence of their physician",
                "D. HIPAA patient rights only apply to electronic records — paper records are excluded"
            ],
            correctAnswer: "B. Patients can access their records within 30 days, request corrections, and receive Notice of Privacy Practices",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "HIPAA PATIENT RIGHTS"
        ),

        // MARK: — NDC NUMBER

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "NDC NUMBER / FORMAT AND USE",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Understanding the National Drug Code (NDC)
            > NDC FORMAT: 10-digit number divided into 3 segments (may be displayed as 11 digits with leading zeros)
            > SEGMENT 1 (Labeler Code): 4–5 digits — identifies manufacturer or distributor
            > SEGMENT 2 (Product Code): 3–4 digits — identifies specific product (drug, strength, form)
            > SEGMENT 3 (Package Code): 1–2 digits — identifies package size and type
            > BILLING FORMAT: Insurance claims require 11-digit NDC (add leading zero to shortest segment)
            > USAGE: Appears on all drug labels; used for insurance billing, drug identification, recall tracking
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The second segment of the NDC identifies the drug's DEA schedule",
                "B. Labeler code (manufacturer) — Product code (drug/strength/form) — Package code (size/type)",
                "C. NDC numbers are only assigned to controlled substances by the DEA",
                "D. The NDC third segment identifies whether the drug requires a prescription"
            ],
            correctAnswer: "B. Labeler code (manufacturer) — Product code (drug/strength/form) — Package code (size/type)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "NDC NUMBER"
        ),

        // MARK: — MEDICATION GUIDE vs PACKAGE INSERT

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "MEDICATION GUIDE / REQUIREMENTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — When is a Medication Guide (MedGuide) required?
            > MEDICATION GUIDE: FDA-required patient handout distributed by pharmacy with each prescription dispensed
            > REQUIRED WHEN: Drug poses serious and significant public health concern; patient labeling can help prevent serious ADRs; patient compliance is essential
            > EXAMPLES: SSRIs (suicidality warning), isotretinoin (pregnancy warning), NSAIDs (CV/GI risk), antiepileptics (suicidality), fluoroquinolones (tendon/neuropsychiatric), warfarin, stimulants (ADHD drugs)
            > DISTRIBUTION: Must be provided at dispensing; may be provided via internet or by mail for mail-order
            > PATIENT INFORMATION SHEET: Simpler version; not same as MedGuide; not required by law for all drugs
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Medication Guides are required for all Schedule II controlled substances",
                "B. Medication Guides are required for drugs where the labeling can prevent serious adverse reactions (e.g., SSRIs, NSAIDs, antiepileptics)",
                "C. Medication Guides are optional documents prepared voluntarily by manufacturers",
                "D. Medication Guides are only required for new molecular entities — not for generics"
            ],
            correctAnswer: "B. Medication Guides are required for drugs where the labeling can prevent serious adverse reactions (e.g., SSRIs, NSAIDs, antiepileptics)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.78,
            angle: .classification,
            baseConceptTitle: "MEDICATION GUIDE"
        ),

        // MARK: — ELECTRONIC PRESCRIBING

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "EPCS / ELECTRONIC CS PRESCRIBING",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Electronic Prescribing for Controlled Substances (EPCS)
            > EPCS: DEA-compliant system allowing prescribers to electronically prescribe controlled substances (including CII)
            > REQUIREMENTS FOR PRESCRIBER: Must use two-factor authentication (two of: knowledge, hard token, biometric)
            > REQUIREMENTS FOR PHARMACY: Must use DEA-compliant software; maintain audit logs of all CS prescriptions
            > BENEFITS: Reduces prescription fraud/forgery, improves documentation, enables monitoring
            > PDMP INTEGRATION: Prescription Drug Monitoring Programs — state databases tracking CS prescriptions; most states require prescribers/pharmacists to check PDMP before prescribing/dispensing CS
            > MANDATE: Some states mandate EPCS for all CS prescriptions; federal mandate pending
            """,
            challengeType: .multipleChoice,
            options: [
                "A. CII prescriptions may never be transmitted electronically — paper is always required",
                "B. EPCS allows electronic CII prescribing with two-factor prescriber authentication and pharmacy audit logs",
                "C. EPCS eliminates all requirements for controlled substance record keeping",
                "D. Any computer software may be used for electronic CS prescribing — no DEA certification required"
            ],
            correctAnswer: "B. EPCS allows electronic CII prescribing with two-factor prescriber authentication and pharmacy audit logs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.78,
            angle: .classification,
            baseConceptTitle: "EPCS"
        ),

    ]}
}
