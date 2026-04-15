
//
//  MultiAngle_D2.swift
//  Synapse PTCE
//
//  Multi-angle nodes for Domain 2: Federal Requirements
//  24 nodes covering DEA schedules, CII rules, HIPAA, refill law, and recall classes
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D2: [DataNode] {[

        // MARK: — DEA SCHEDULE II

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CII SCHEDULE / DEFINITION",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — What defines a Schedule II controlled substance?
            > DEA CRITERIA: High potential for abuse; accepted medical use in US; abuse may lead to severe psychological or physical dependence.
            > EXAMPLES: Oxycodone (OxyContin), hydrocodone combo products (Vicodin), fentanyl, morphine, amphetamine (Adderall), methylphenidate (Ritalin), cocaine (medical)
            > REFILLS: NO refills permitted on CII prescriptions
            > QUANTITY: Prescriber may write up to a 90-day supply on separate prescriptions
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Low abuse potential with accepted medical use and limited dependence",
                "B. High abuse potential, accepted medical use, severe dependence potential",
                "C. No accepted medical use and highest abuse potential (like heroin)",
                "D. Moderate abuse potential with accepted medical use and low dependence"
            ],
            correctAnswer: "B. High abuse potential, accepted medical use, severe dependence potential",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.10,
            angle: .classification,
            baseConceptTitle: "DEA SCHEDULE II"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CII SCHEDULE / DISPENSING RULES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Federal rules for dispensing CII prescriptions
            > NO REFILLS: CII prescriptions may NOT be refilled under any circumstances
            > WRITTEN RX: Must have a written, signed prescription (or electronic under EPCS)
            > ORAL EMERGENCY: CII may be dispensed on oral authorization for a BONA FIDE emergency; must get written Rx within 7 days
            > PARTIAL FILL: Pharmacists may partially fill CII if full quantity unavailable; remainder must be dispensed within 72 hours
            > LTCF EXCEPTION: Partial fills in long-term care facilities — valid up to 60 days
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Up to 5 refills within 6 months of the original prescription date",
                "B. One refill permitted if authorized by prescriber in writing",
                "C. No refills permitted — a new prescription is required each time",
                "D. Unlimited refills if the pharmacist uses professional judgment"
            ],
            correctAnswer: "C. No refills permitted — a new prescription is required each time",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.10,
            angle: .safety,
            baseConceptTitle: "DEA SCHEDULE II"
        ),

        // MARK: — DEA SCHEDULE III–IV

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CIII–CIV / REFILL LIMITS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Refill rules for Schedule III and IV substances
            > CIII/CIV REFILLS: Up to 5 refills within 6 months of the date written
            > AFTER 6 MONTHS: Prescription expires — new prescription required
            > ORAL AUTHORIZATION: Prescriber may orally authorize CII–CIV prescriptions to pharmacist
            > EXAMPLES CII: Codeine combo (Tylenol #3), buprenorphine/naloxone (Suboxone)
            > EXAMPLES CIV: Alprazolam (Xanax), diazepam (Valium), zolpidem (Ambien)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. No refills — new written prescription required each time",
                "B. Up to 5 refills within 6 months of the original prescription date",
                "C. Unlimited refills within 12 months of the original prescription date",
                "D. Up to 12 refills within 1 year of the original prescription date"
            ],
            correctAnswer: "B. Up to 5 refills within 6 months of the original prescription date",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.18,
            angle: .safety,
            baseConceptTitle: "DEA SCHEDULE III-IV"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CIII–CIV / TRANSFER RULES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Transferring controlled substance prescriptions between pharmacies
            > CII TRANSFER: NEVER permitted — CII cannot be transferred between pharmacies
            > CIII–CV TRANSFER: May be transferred ONCE between pharmacies
            > CHAIN EXCEPTION: Within same chain with shared database = unlimited electronic transfers (treated as same pharmacy)
            > INFORMATION REQUIRED: Pharmacist transferring must record date, receiving pharmacist name, receiving pharmacy DEA number
            > ORAL TRANSFER: May be done orally for CIII–CV between pharmacists
            """,
            challengeType: .multipleChoice,
            options: [
                "A. CII may be transferred once; CIII–CV may be transferred up to 3 times",
                "B. CII may never be transferred; CIII–CV may be transferred once (or unlimited within chain)",
                "C. All controlled substances may be transferred an unlimited number of times",
                "D. Controlled substance transfers are prohibited in all states under federal law"
            ],
            correctAnswer: "B. CII may never be transferred; CIII–CV may be transferred once (or unlimited within chain)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.18,
            angle: .classification,
            baseConceptTitle: "DEA SCHEDULE III-IV"
        ),

        // MARK: — DEA SCHEDULE V

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CV SCHEDULE / OTC RULES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Schedule V OTC dispensing requirements
            > DEFINITION: CV substances have lowest abuse potential among scheduled drugs; accepted medical use
            > EXAMPLES: Cough syrups with <200 mg codeine/100 mL (Robitussin AC), pregabalin (Lyrica), lacosamide (Vimpat)
            > OTC SALE REQUIREMENTS (federal minimum): Purchaser must be ≥18 years old; must sign purchaser's log; no more than 240 mL or 48 solid doses in 48 hours; only pharmacist or pharmacist designee may sell
            > NOTE: Many states require prescription for all CV items
            """,
            challengeType: .multipleChoice,
            options: [
                "A. No special requirements — sold like any OTC product",
                "B. Purchaser ≥18, must sign log, limited to 240 mL or 48 doses per 48 hours",
                "C. Requires written prescription from a DEA-registered prescriber",
                "D. Available only to patients with a valid controlled substance registry card"
            ],
            correctAnswer: "B. Purchaser ≥18, must sign log, limited to 240 mL or 48 doses per 48 hours",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.26,
            angle: .classification,
            baseConceptTitle: "DEA SCHEDULE V"
        ),

        // MARK: — EMERGENCY CII DISPENSING

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "CII EMERGENCY / ORAL AUTH",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Emergency oral authorization for Schedule II dispensing
            > CONDITIONS: Must be a bona fide emergency; no alternative therapy available; prescriber cannot provide written Rx immediately
            > QUANTITY: Only the quantity needed for the emergency period may be dispensed
            > ORAL RX: Pharmacist must note "Authorization for Emergency Dispensing" on Rx
            > FOLLOW-UP: Written Rx must arrive within 7 DAYS (with "Authorization for Emergency Dispensing" notation)
            > FAILURE: If written Rx not received in 7 days, pharmacist must notify DEA
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 24 hours — the written prescription must follow the same business day",
                "B. 72 hours — standard follow-up window for all oral prescriptions",
                "C. 7 days — written CII prescription must be received within 7 days",
                "D. 30 days — one month is allowed for administrative follow-up"
            ],
            correctAnswer: "C. 7 days — written CII prescription must be received within 7 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.26,
            angle: .safety,
            baseConceptTitle: "EMERGENCY CII"
        ),

        // MARK: — PRESCRIPTION REQUIREMENTS

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "VALID RX / REQUIRED ELEMENTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Required elements of a valid prescription
            > PATIENT INFO: Full name and address
            > PRESCRIBER INFO: Name, address, DEA number (for controlled substances), and signature
            > DATE: Date written (not dispense date)
            > DRUG INFO: Drug name, strength, dosage form, quantity, and directions (sig)
            > REFILLS: Number of refills authorized (or "0" / "NR" for no refills)
            > CONTROLLED: CII requires WRITTEN prescription; CIII–V may be oral or fax (state laws may vary)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Drug name and patient name only",
                "B. Patient name/address, prescriber info/DEA#/signature, date, drug name/strength/quantity/sig/refills",
                "C. Patient name, drug, and prescriber phone number",
                "D. Prescriber name, drug, and dispensing date"
            ],
            correctAnswer: "B. Patient name/address, prescriber info/DEA#/signature, date, drug name/strength/quantity/sig/refills",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.34,
            angle: .classification,
            baseConceptTitle: "PRESCRIPTION ELEMENTS"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "VALID RX / EXPIRATION",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Prescription validity periods
            > NON-CONTROLLED: Valid for 12 months from date written (most states)
            > CII: Valid for 6 months from date written (DEA allows prescribers to postdate — not to antedate)
            > CIII–CV: Valid for 6 months from date written (plus up to 5 refills within that period)
            > STATE LAWS: Some states impose shorter validity periods — follow most restrictive rule
            > STALE RX: Pharmacist may use professional judgment on prescriptions near expiration
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 30 days for all controlled substances, 90 days for non-controlled",
                "B. Non-controlled: 12 months; CII and CIII-CV: 6 months from date written",
                "C. All prescriptions are valid for exactly 12 months with no exceptions",
                "D. CII: 30 days; CIII-CIV: 3 months; non-controlled: unlimited"
            ],
            correctAnswer: "B. Non-controlled: 12 months; CII and CIII-CV: 6 months from date written",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.34,
            angle: .safety,
            baseConceptTitle: "PRESCRIPTION ELEMENTS"
        ),

        // MARK: — HIPAA

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA / MINIMUM NECESSARY",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — The HIPAA minimum necessary standard
            > RULE: Covered entities must make reasonable efforts to use, disclose, or request only the minimum PHI necessary to accomplish the intended purpose.
            > APPLIES TO: Disclosures to other healthcare providers NOT directly involved in treatment
            > DOES NOT APPLY TO: Disclosures to treating providers for treatment purposes
            > PHARMACY EXAMPLE: Do not share a patient's full medication history when only a refill verification is needed
            > PHI: Protected Health Information includes name, DOB, address, diagnoses, prescriptions
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Only the prescribing physician may receive any protected health information",
                "B. Share only the minimum PHI necessary to accomplish the intended purpose",
                "C. All PHI may be shared freely among all healthcare providers",
                "D. PHI can only be shared after obtaining a notarized patient consent form"
            ],
            correctAnswer: "B. Share only the minimum PHI necessary to accomplish the intended purpose",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.42,
            angle: .safety,
            baseConceptTitle: "HIPAA"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA / PERMITTED DISCLOSURES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — When can PHI be shared without patient authorization?
            > PERMITTED WITHOUT AUTHORIZATION: Treatment, Payment, and Healthcare Operations (TPO)
            > PUBLIC HEALTH: Reporting communicable diseases to public health authorities
            > LAW ENFORCEMENT: Pursuant to court orders, subpoenas, or lawful process
            > REQUIRED BY LAW: Mandatory reporting (child abuse, gunshot wounds)
            > WORKFORCE SAFETY: To prevent imminent threat of harm to person or public
            > BREACH: Any impermissible disclosure of PHI that compromises security or privacy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. PHI may never be shared without explicit written patient authorization",
                "B. PHI may be shared for treatment, payment, operations, and certain public interests without authorization",
                "C. PHI may be freely shared with any government agency upon request",
                "D. Only de-identified data (no PHI) can ever be shared without authorization"
            ],
            correctAnswer: "B. PHI may be shared for treatment, payment, operations, and certain public interests without authorization",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.42,
            angle: .classification,
            baseConceptTitle: "HIPAA"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA / BREACH NOTIFICATION",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — HIPAA breach notification requirements
            > BREACH: Unsecured PHI impermissibly used/disclosed, assumed to compromise privacy/security
            > NOTIFY PATIENTS: Within 60 days of discovering a breach affecting them
            > NOTIFY HHS: Within 60 days of year-end for breaches affecting <500 individuals; within 60 days of discovery for ≥500
            > NOTIFY MEDIA: If breach affects ≥500 individuals in a state/jurisdiction
            > EXCEPTIONS: Unintentional access by workforce; inadvertent disclosure between same organization employees; recipient could not reasonably retain the information
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Within 24 hours of discovering the breach",
                "B. Within 60 days of discovering the breach for affected individuals",
                "C. Within 1 year — annual reporting to HHS is sufficient",
                "D. Immediately (same day) to both patients and HHS simultaneously"
            ],
            correctAnswer: "B. Within 60 days of discovering the breach for affected individuals",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.50,
            angle: .safety,
            baseConceptTitle: "HIPAA BREACH"
        ),

        // MARK: — DRUG RECALL CLASSES

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "RECALL / CLASS I",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — FDA Recall Class I severity
            > DEFINITION: There is a reasonable probability that the use of or exposure to a violative product will cause serious adverse health consequences or death.
            > EXAMPLES: Contaminated sterile products, wrong drug/strength dispensed at manufacturer level, microbial contamination of IV solutions
            > ACTION: Immediate removal from market; most urgent class
            > PATIENT NOTICE: FDA typically issues public health advisory; patients should stop use immediately
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Unlikely to cause harm — only violates FDA labeling regulations",
                "B. May cause temporary adverse effects with remote probability of serious harm",
                "C. Reasonable probability of serious adverse health consequences or death",
                "D. Cosmetic defect only — no health risk associated with product"
            ],
            correctAnswer: "C. Reasonable probability of serious adverse health consequences or death",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.58,
            angle: .classification,
            baseConceptTitle: "DRUG RECALL"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "RECALL / CLASS II",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — FDA Recall Class II severity
            > DEFINITION: Use of or exposure to a violative product may cause temporary adverse health consequences or where the probability of serious adverse health consequences is remote.
            > EXAMPLES: Subpotent product that may fail to treat a serious condition; product with minor contamination; incorrect labeling for a non-critical parameter
            > ACTION: Recall initiated; less urgent than Class I
            > CONTRAST: Class I = serious risk; Class II = temporary/remote risk; Class III = no health risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Reasonable probability of death or serious adverse health consequences",
                "B. May cause temporary adverse effects or remote probability of serious harm",
                "C. Unlikely to cause any health consequences — regulatory violation only",
                "D. Limited to cosmetic or labeling defects with no clinical impact"
            ],
            correctAnswer: "B. May cause temporary adverse effects or remote probability of serious harm",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.58,
            angle: .classification,
            baseConceptTitle: "DRUG RECALL"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "RECALL / CLASS III",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — FDA Recall Class III severity
            > DEFINITION: Use of or exposure to a violative product is NOT likely to cause adverse health consequences.
            > EXAMPLES: Minor labeling error that doesn't affect dosing; packaging defect; product that doesn't meet color or taste specifications
            > ACTION: Least urgent; FDA may still require removal from market
            > MEMORY AID: I = Immediate danger; II = Intermediate risk; III = Innocuous (no health risk)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Serious health risk requiring immediate patient notification",
                "B. Temporary adverse health effects expected with use",
                "C. Not likely to cause any adverse health consequences",
                "D. Unknown risk — product under investigation by FDA"
            ],
            correctAnswer: "C. Not likely to cause any adverse health consequences",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "DRUG RECALL"
        ),

        // MARK: — DEA REGISTRATION

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DEA REGISTRATION / REQUIREMENTS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Who requires DEA registration?
            > REQUIRED: Any person or entity that manufactures, distributes, dispenses, imports, or exports controlled substances
            > PHARMACIES: Each pharmacy location requires its own DEA registration
            > PRESCRIBERS: Each prescriber needs own DEA number to prescribe controlled substances
            > RENEWAL: DEA registration renewed every 3 YEARS
            > FORMAT: DEA number = 2 letters + 7 digits; first letter indicates registrant type (A/B = practitioners, M = mid-level, F = DEA registrant); second letter = first letter of registrant's last name
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Annually — DEA registrations must be renewed every year",
                "B. Every 3 years — DEA registrations are renewed on a 3-year cycle",
                "C. Every 5 years — same cycle as federal pharmacy license",
                "D. Every 2 years — aligned with DEA audit schedule"
            ],
            correctAnswer: "B. Every 3 years — DEA registrations are renewed on a 3-year cycle",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.66,
            angle: .classification,
            baseConceptTitle: "DEA REGISTRATION"
        ),

        // MARK: — PSEUDOEPHEDRINE COMBAT METH ACT

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "PSEUDOEPHEDRINE / CMEA RULES",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Combat Methamphetamine Epidemic Act (CMEA) requirements
            > SALES LIMIT: No more than 3.6 g per day and 9 g per 30-day period per purchaser
            > STORAGE: Must be kept behind the counter or in a locked cabinet
            > LOG BOOK: Purchaser must show photo ID, sign logbook (name/address/date/quantity)
            > AGE: Purchaser must be ≥18 years old
            > PRODUCTS: Applies to pseudoephedrine, ephedrine, and phenylpropanolamine products
            > EXAMPLES: Sudafed (PSE), Claritin-D
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1.8 g per day and 4.5 g per 30-day period",
                "B. 3.6 g per day and 9 g per 30-day period — requires ID and logbook signature",
                "C. 7.2 g per day and 18 g per 30-day period with no log required",
                "D. Unlimited purchase amount if valid OTC purchase with pharmacist oversight"
            ],
            correctAnswer: "B. 3.6 g per day and 9 g per 30-day period — requires ID and logbook signature",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "PSEUDOEPHEDRINE"
        ),

        // MARK: — DRUG SUBSTITUTION / DAW CODES

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DAW CODES / GENERIC SUBSTITUTION",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — Dispense as Written (DAW) code meanings
            > DAW-0: No product selection indicated — generic substitution allowed
            > DAW-1: Substitution not allowed by prescriber — brand medically necessary
            > DAW-2: Substitution allowed — patient requests brand (patient pays difference)
            > DAW-3: Substitution allowed — pharmacist selects brand
            > DAW-4: Substitution not allowed — generic not available in marketplace
            > STATE LAW: All 50 states have some form of generic substitution law; most require pharmacist notification or patient consent
            """,
            challengeType: .multipleChoice,
            options: [
                "A. DAW-0 — No product selection indicated; generic substitution allowed",
                "B. DAW-1 — Substitution not allowed; brand medically necessary per prescriber",
                "C. DAW-2 — Substitution not allowed; patient specifically requests brand",
                "D. DAW-3 — Substitution required by insurance plan formulary"
            ],
            correctAnswer: "B. DAW-1 — Substitution not allowed; brand medically necessary per prescriber",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.74,
            angle: .classification,
            baseConceptTitle: "DAW CODES"
        ),

        // MARK: — DRUG SCHEDULES — SCHEDULING CRITERIA

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "SCHEDULE I / DEFINITION",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — What is a Schedule I controlled substance?
            > CRITERIA: High abuse potential; NO currently accepted medical use in US; lack of accepted safety for use under medical supervision
            > EXAMPLES: Heroin, LSD, marijuana (federal), peyote, MDMA (ecstasy), psilocybin
            > NOTE: Marijuana remains Schedule I federally despite state legalization
            > RESEARCH: May be used in FDA-approved research protocols only
            > CONTRAST: CI has NO medical use; CII has accepted medical use but high abuse potential
            """,
            challengeType: .multipleChoice,
            options: [
                "A. High abuse potential, accepted medical use, severe dependence potential",
                "B. Moderate abuse potential, accepted medical use, limited dependence",
                "C. High abuse potential, NO accepted medical use, no accepted safety under supervision",
                "D. Low abuse potential, accepted medical use, limited physical dependence"
            ],
            correctAnswer: "C. High abuse potential, NO accepted medical use, no accepted safety under supervision",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.82,
            angle: .classification,
            baseConceptTitle: "DEA SCHEDULE I"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "RECORD KEEPING / CS LOGS",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Controlled substance record-keeping requirements
            > INVENTORY: Biennial (every 2 years) physical inventory of all controlled substances
            > RECORDS: Must maintain dispensing records for CII separately from CIII–V (CII in own system or separate bound logbook)
            > RETENTION: Records must be kept for at least 2 YEARS (some states require longer)
            > ACCESS: Must be available for DEA inspection within 2 business days
            > DEA FORM 222: Required for ordering CII from distributor; 3-part form (copy 1 to supplier, copy 2 to DEA, copy 3 retained by pharmacy)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 1 year — same as general pharmacy records",
                "B. 2 years — federal minimum for controlled substance record retention",
                "C. 5 years — DEA requires all CS records for at least 5 years",
                "D. 7 years — IRS audit standard applies to all pharmacy records"
            ],
            correctAnswer: "B. 2 years — federal minimum for controlled substance record retention",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.82,
            angle: .safety,
            baseConceptTitle: "CS RECORD KEEPING"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "ORANGE BOOK / THERAPEUTIC EQUIVALENCE",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Classification — FDA Orange Book and therapeutic equivalence codes
            > ORANGE BOOK: FDA publication listing drug products with therapeutic equivalence evaluations
            > AA/AB CODES: Therapeutically equivalent to reference listed drug (RLD) — can be substituted
            > AB CODE: Most commonly used; products that met bioequivalence requirements
            > BX CODE: Insufficient data to confirm therapeutic equivalence
            > NARROW THERAPEUTIC INDEX: Levothyroxine, warfarin, digoxin — some states restrict generic substitution despite AB rating
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The FDA Blue Book — lists all approved controlled substances and schedules",
                "B. The FDA Orange Book — lists drug products with therapeutic equivalence evaluations (AB = substitutable)",
                "C. The USP-NF — sets standards for drug identity, strength, and purity",
                "D. The Red Book — lists drug prices and AWP for billing purposes"
            ],
            correctAnswer: "B. The FDA Orange Book — lists drug products with therapeutic equivalence evaluations (AB = substitutable)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.90,
            angle: .classification,
            baseConceptTitle: "ORANGE BOOK"
        ),

        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "REMS / RISK MANAGEMENT",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW
            > ANGLE: Safety — Risk Evaluation and Mitigation Strategies (REMS)
            > DEFINITION: FDA-required programs for drugs with serious safety risks that outweigh benefits without risk management
            > EXAMPLES: Clozapine (ANC monitoring), isotretinoin (iPLEDGE — pregnancy prevention), opioids (OPIOID REMS), thalidomide (STEPS)
            > ELEMENTS: May include medication guide, communication plan, restricted distribution
            > ETASU: Elements to Assure Safe Use — most restrictive REMS component (e.g., certified prescribers only, certified pharmacies only)
            > ROLE: Pharmacy must be enrolled and comply with REMS requirements to dispense
            """,
            challengeType: .multipleChoice,
            options: [
                "A. An optional pharmacy quality program to reduce medication errors",
                "B. FDA-required risk management programs for high-risk drugs (e.g., iPLEDGE for isotretinoin)",
                "C. State board requirements for pharmacist continuing education",
                "D. Insurance-mandated prior authorization programs for expensive medications"
            ],
            correctAnswer: "B. FDA-required risk management programs for high-risk drugs (e.g., iPLEDGE for isotretinoin)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.55,
            yOffset: 0.90,
            angle: .safety,
            baseConceptTitle: "REMS"
        ),

    ]}
}
