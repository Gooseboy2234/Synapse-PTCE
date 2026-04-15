//
//  Domain2_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 3 — Domain 2: Federal Requirements (18.75% of 2026 PTCB Exam)
//  12 nodes covering DEA schedules, DSCSA (2026 emphasis), REMS, controlled
//  substance rules, OBRA '90, HIPAA, drug recalls, and disposal regulations.
//

import Foundation

extension DataNode {

    // MARK: - Domain 2 Node Set

    static let domain2Nodes: [DataNode] = [

        // ── 01 ── DEA SCHEDULE I ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "SCHEDULE I",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > AUTHORITY: Drug Enforcement Administration (DEA) — 21 CFR Part 1308
            > SCHEDULE I DEFINITION:
            >   High abuse potential
            >   NO currently accepted medical use in the US
            >   Lack of accepted safety for use under medical supervision
            > EXAMPLES: Heroin, LSD, psilocybin, MDMA (ecstasy), marijuana (federal)
            > NOTE: Despite state laws, marijuana remains Schedule I federally.
            >       Research requires special DEA Schedule I researcher registration.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Schedule II — high abuse, accepted medical use",
                "B. Schedule IV — lower abuse potential, accepted medical use",
                "C. Schedule I — high abuse, NO accepted medical use",
                "D. Schedule V — lowest abuse potential"
            ],
            correctAnswer: "C. Schedule I — high abuse, NO accepted medical use",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38, yOffset: 0.07
        ),

        // ── 02 ── SCHEDULE II PRESCRIPTION RULES ────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "SCHEDULE II Rx",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > SCHEDULE II DISPENSING RULES (21 CFR 1306.12):
            >   NO REFILLS — a new Rx is required each fill.
            >   Written Rx required; prescriber must manually sign.
            >   ELECTRONIC: Permitted via EPCS (Electronic Prescribing for Controlled Substances).
            >   ORAL: Emergency dispensing by phone — quantity limited to emergency period;
            >         written Rx must follow within 7 days (or 72h per DEA).
            >   PARTIAL FILL: Permitted for LTCF patients and terminally ill patients.
            >   FAXED: Accepted as "original" Rx for hospice/LTCF patients only.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. May be refilled up to 5 times within 6 months",
                "B. May not be refilled; a new prescription is required each time",
                "C. May be verbally authorized by the prescriber for routine fills",
                "D. May be transferred to another pharmacy once per year"
            ],
            correctAnswer: "B. May not be refilled; a new prescription is required each time",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.22
        ),

        // ── 03 ── SCHEDULE III–IV RULES ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CIII-IV RULES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > SCHEDULE III & IV DISPENSING RULES:
            >   Refills: Up to 5 refills within 6 months of the date written.
            >   After 6 months or 5 refills (whichever comes first): new Rx required.
            >   May be called in verbally by the prescriber or authorized agent.
            >   May be transferred between pharmacies (once for handwritten; CIII-IV
            >     multiple times if pharmacies share a real-time database).
            > SCHEDULE V RULES:
            >   Up to 5 refills within 6 months.
            >   Some CⅤ products sold OTC (varies by state) with logbook requirement.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 3 refills within 3 months of the date written",
                "B. 5 refills within 6 months of the date written",
                "C. 12 refills within 1 year of the date written",
                "D. Unlimited refills within 6 months of the date written"
            ],
            correctAnswer: "B. 5 refills within 6 months of the date written",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60, yOffset: 0.07
        ),

        // ── 04 ── DSCSA OVERVIEW ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DSCSA",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — 2026 EXAM EMPHASIS
            > DRUG SUPPLY CHAIN SECURITY ACT (DSCSA) — Enacted Nov. 27, 2013
            > Title II of the Drug Quality and Security Act (DQSA)
            > PRIMARY GOAL: Build a national, electronic, interoperable track-and-trace
            >   system to identify and trace prescription drug packages through the
            >   US drug supply chain.
            > FULLY PHASED IN: Nov. 27, 2023 (Enhanced Drug Distribution Security)
            > PROTECTS AGAINST: Counterfeit, stolen, contaminated, or otherwise
            >   illegitimate prescription drugs from entering the supply chain.
            > APPLIES TO: Prescription drugs in finished dosage form only.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standardize drug pricing and reimbursement rates across all states",
                "B. Build an electronic, interoperable system to track and trace Rx drugs through the supply chain",
                "C. Require all pharmacies to use electronic prescribing systems",
                "D. Mandate that all generic drugs be substituted for brand-name equivalents"
            ],
            correctAnswer: "B. Build an electronic, interoperable system to track and trace Rx drugs through the supply chain",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.85, yOffset: 0.10
        ),

        // ── 05 ── DSCSA — PRODUCT IDENTIFIER & SERIALIZATION ────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DSCSA SERIALS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — 2026 EXAM EMPHASIS
            > DSCSA PRODUCT IDENTIFIER — 4 required elements on every saleable unit:
            >   1. NDC (National Drug Code) — identifies the specific product
            >   2. SERIAL NUMBER — unique to each individual package
            >   3. LOT NUMBER — identifies the manufacturing batch
            >   4. EXPIRATION DATE — in standardized format
            > Encoded as a 2D data matrix barcode on each package.
            > TRADING PARTNERS (authorized entities in the supply chain):
            >   Manufacturers, Repackagers, Wholesale Distributors, Dispensers (pharmacies)
            > TRANSACTION RECORDS (TI, TH, TS) must be maintained for 6 years.
            > SUSPECT PRODUCT: Must quarantine, investigate, and notify FDA and trading partners.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Drug name, manufacturer, price, and quantity shipped",
                "B. NDC, serial number, lot number, and expiration date",
                "C. NPI, DEA number, lot number, and dispensing date",
                "D. Brand name, generic name, strength, and dosage form"
            ],
            correctAnswer: "B. NDC, serial number, lot number, and expiration date",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.50
        ),

        // ── 06 ── REMS ───────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "REMS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > RISK EVALUATION AND MITIGATION STRATEGY (REMS)
            > AUTHORITY: FDA — required under the FDAAA (2007)
            > PURPOSE: Ensure benefits of a drug outweigh its risks by imposing
            >          specific requirements beyond standard labeling.
            > REMS COMPONENTS may include:
            >   Medication Guide (MedGuide) — most common REMS element
            >   Communication Plan (letters to HCPs)
            >   Elements to Assure Safe Use (ETASU):
            >     — Certified prescribers/pharmacies only
            >     — Patient enrollment/registry
            >     — Mandatory monitoring (labs, imaging)
            > EXAMPLES:
            >   iPLEDGE — Isotretinoin (severe teratogen; monthly pregnancy tests)
            >   TIRF REMS — Transmucosal immediate-release fentanyl
            >   Clozapine REMS — Absolute neutrophil count (ANC) monitoring
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metformin (Glucophage) — risk of lactic acidosis",
                "B. Lisinopril (Zestril) — risk of dry cough",
                "C. Isotretinoin (Accutane) — iPLEDGE REMS for severe teratogenicity",
                "D. Amoxicillin (Amoxil) — risk of penicillin allergy"
            ],
            correctAnswer: "C. Isotretinoin (Accutane) — iPLEDGE REMS for severe teratogenicity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55, yOffset: 0.38
        ),

        // ── 07 ── DEA FORM 222 ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DEA FORM 222",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > DEA CONTROLLED SUBSTANCE ORDERING FORMS:
            > DEA FORM 222: Official order form for purchasing Schedule I & II substances.
            >   Triplicate paper form (Copy 1 = supplier, Copy 2 = DEA, Copy 3 = pharmacy).
            >   OR replaced by CSOS (Controlled Substance Ordering System) — electronic.
            > DEA FORM 224: Registration for dispensers (pharmacies, practitioners).
            > DEA FORM 106: Report of theft or significant loss of controlled substances.
            > DEA FORM 41:  Record of destruction of controlled substances.
            > KEY RULE: Only the DEA registrant (or authorized Power of Attorney)
            >           may sign DEA Form 222 / submit CSOS orders.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. DEA Form 106 — report of controlled substance theft or loss",
                "B. DEA Form 41 — record of controlled substance destruction",
                "C. DEA Form 224 — DEA registration for dispensers",
                "D. DEA Form 222 (or CSOS electronic equivalent)"
            ],
            correctAnswer: "D. DEA Form 222 (or CSOS electronic equivalent)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.68
        ),

        // ── 08 ── DRUG RECALL CLASSES ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG RECALLS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > FDA DRUG RECALL CLASSIFICATIONS:
            > CLASS I:   Reasonable probability that use will cause SERIOUS adverse
            >            health consequences or DEATH.
            >            (Most urgent — e.g., contaminated injectable drug)
            > CLASS II:  Use may cause TEMPORARY or MEDICALLY REVERSIBLE adverse
            >            health consequences; or probability of serious harm is remote.
            >            (Moderate urgency — e.g., sub-potent antibiotic)
            > CLASS III: Use is UNLIKELY to cause any adverse health consequences.
            >            (Least urgent — e.g., labeling error with no safety impact)
            > MARKET WITHDRAWAL: Minor violation not subject to legal action.
            > MEDICAL DEVICE SAFETY ALERT: Not a recall but equivalent notification.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Class I — reasonable probability of serious adverse health consequences or death",
                "B. Class II — may cause temporary or reversible adverse health consequences",
                "C. Class III — unlikely to cause any adverse health consequences",
                "D. Market Withdrawal — minor violation without safety implications"
            ],
            correctAnswer: "B. Class II — may cause temporary or reversible adverse health consequences",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58, yOffset: 0.50
        ),

        // ── 09 ── OBRA '90 ────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "OBRA '90",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > OMNIBUS BUDGET RECONCILIATION ACT OF 1990 (OBRA '90)
            > Applies to: Medicaid patients (states expanded to all patients)
            > PHARMACIST REQUIREMENTS:
            >   1. PROSPECTIVE DUR: Review each Rx for drug interactions, duplications,
            >      incorrect dosing, contraindications, and misuse.
            >   2. OFFER TO COUNSEL: Pharmacist must offer to counsel the patient
            >      on each new Rx. Patient may refuse — must document.
            >   3. PATIENT MEDICATION PROFILE: Maintain current medication records.
            > COUNSELING ELEMENTS (what to cover): drug name/description, dosage/route,
            >   duration, what to do if dose missed, special storage, refill info,
            >   and action for adverse effects.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Provide free home delivery for all Medicaid prescriptions",
                "B. Offer patient counseling on each new prescription",
                "C. Enroll all Medicaid patients in automatic refill programs",
                "D. Conduct mandatory medication therapy management (MTM) sessions monthly"
            ],
            correctAnswer: "B. Offer patient counseling on each new prescription",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.85, yOffset: 0.38
        ),

        // ── 10 ── HIPAA & PHI ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA PHI",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > HEALTH INSURANCE PORTABILITY AND ACCOUNTABILITY ACT (HIPAA) — 1996
            > PROTECTED HEALTH INFORMATION (PHI): Any individually identifiable health
            >   information transmitted or maintained in ANY medium.
            > 18 PHI IDENTIFIERS: Name, address, DOB, SSN, phone, email, MRN,
            >   diagnoses, prescriptions, photos, IP addresses, and more.
            > MINIMUM NECESSARY STANDARD: Disclose only the minimum PHI needed.
            > PERMITTED DISCLOSURES WITHOUT AUTHORIZATION: TPO
            >   Treatment — sharing with other providers for care
            >   Payment — billing and insurance processing
            >   Operations — quality assurance, training, auditing
            > PATIENT RIGHTS: Access their records, request amendments, receive
            >   accounting of disclosures, request restrictions.
            > VIOLATION PENALTIES: $100–$50,000 per violation; criminal penalties for willful neglect.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. General public health statistics with no individual identifiers",
                "B. A patient's pharmacy dispensing record — it is PHI requiring authorization for most disclosures",
                "C. Aggregated anonymous data used for research purposes",
                "D. Drug prescribing statistics reported to the state health department"
            ],
            correctAnswer: "B. A patient's pharmacy dispensing record — it is PHI requiring authorization for most disclosures",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.82
        ),

        // ── 11 ── PSEUDOEPHEDRINE / CMEA ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "PSE / CMEA",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > COMBAT METHAMPHETAMINE EPIDEMIC ACT (CMEA) — 2005
            > Applies to: pseudoephedrine (PSE), ephedrine, phenylpropanolamine
            > PHARMACY REQUIREMENTS:
            >   PLACEMENT: Behind the counter or in a locked cabinet (NOT on open shelves)
            >   ID: Government-issued photo ID required for purchase
            >   LOGBOOK: Electronic or paper log — name, address, date/time, amount
            >   QUANTITY LIMITS (per purchaser):
            >     Daily limit:   3.6 grams of PSE base
            >     30-day limit:  9.0 grams of PSE base
            >     (Equivalent to ~120 tablets of 30 mg PSE)
            >   SELLER: Must be retrieved and sold by pharmacy employee
            > NOTE: National Precursor Log Exchange (NPLEx) — real-time electronic
            >       system used in many states for instant limit verification.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1.8 grams per day / 7.5 grams per 30 days",
                "B. 3.6 grams per day / 9.0 grams per 30 days",
                "C. 5.0 grams per day / 15.0 grams per 30 days",
                "D. 9.0 grams per day / 36.0 grams per 30 days"
            ],
            correctAnswer: "B. 3.6 grams per day / 9.0 grams per 30 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55, yOffset: 0.93
        ),

        // ── 12 ── DRUG DISPOSAL ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG DISPOSAL",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > DEA-APPROVED DRUG DISPOSAL METHODS:
            > 1. TAKE-BACK PROGRAMS: DEA-authorized collection sites
            >    (pharmacies, hospitals, clinics); "National Prescription Drug Take Back Day"
            > 2. AUTHORIZED MAIL-BACK ENVELOPES: DEA-approved prepaid mailers
            > 3. DRUG DEACTIVATION POUCHES: Rendered non-retrievable at home
            > 4. HOUSEHOLD TRASH (modified): Mix with undesirable substance (coffee grounds,
            >    dirt), place in sealed container, remove personal info from label.
            > 5. FDA FLUSH LIST: Certain high-risk drugs (fentanyl patches, oxycodone, APAP
            >    with codeine) MAY be flushed if no take-back available.
            >    (Flushing is preferred over leaving available for misuse — environmental
            >     risk is low per FDA analysis)
            > CONTROLLED SUBSTANCE DESTRUCTION IN PHARMACY: DEA Form 41.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Flushing all medications down the toilet without restriction",
                "B. Returning controlled substances to the prescribing physician",
                "C. Drug take-back programs at DEA-authorized collection sites",
                "D. Placing all medications directly in household trash without modification"
            ],
            correctAnswer: "C. Drug take-back programs at DEA-authorized collection sites",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.85, yOffset: 0.93
        )
    ]
}
