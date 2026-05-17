//
//  Domain2_FederalRequirements.swift
//  Synapse PTCE
//
//  Phase 3 — Domain 2: Federal Requirements (18.75% of 2026 PTCB Exam)
//  12 nodes — plain-English loreText rewrite for maximum readability.
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
            > The DEA (Drug Enforcement Administration) places controlled substances into 5 schedules (categories) based on two things: abuse potential and accepted medical use.
            > Schedule I is the most restricted category — these are drugs with NO accepted medical use in the US and a HIGH potential for abuse.
            > Examples of Schedule I drugs: Heroin, LSD, psilocybin (magic mushrooms), MDMA (ecstasy), and — importantly — marijuana at the FEDERAL level.
            > Wait, isn't marijuana legal in many states? Yes. But under FEDERAL law, marijuana remains Schedule I. This means pharmacies cannot dispense it. Federal employees (VA, military) cannot use it. This distinction comes up on the PTCB.
            > Schedule I drugs cannot be prescribed or dispensed by pharmacies. Researchers can only study them with a special DEA Schedule I researcher registration.
            > The other schedules:
            > Schedule II (CII): High abuse potential, but HAS accepted medical use (oxycodone, Adderall, fentanyl, morphine). Strictest dispensing rules.
            > Schedule III-IV: Moderate-lower abuse potential, accepted medical use (Tylenol with codeine, benzodiazepines, tramadol)
            > Schedule V: Lowest abuse potential among controlled substances (some cough preparations with small amounts of codeine)
            > KEY: Schedule I = high abuse + NO accepted medical use (heroin, LSD, marijuana federally). Schedule II = high abuse + HAS medical use. CII has the strictest dispensing rules.
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
            > Schedule II (CII) drugs have the strictest dispensing rules of all prescribable medications. These include: oxycodone, hydrocodone, morphine, fentanyl, Adderall, Ritalin, and cocaine (used topically in ENT procedures).
            > The rules exist because CII drugs have the highest abuse and diversion potential.
            > RULE 1 — NO REFILLS EVER: Every time a patient needs their CII medication, they need a brand-new prescription. Unlike Schedule III-IV drugs, refills are never permitted — not even one.
            > RULE 2 — HOW THE PRESCRIPTION MUST BE WRITTEN:
            > Must be written on paper (manually signed by the prescriber) OR
            > Sent electronically via EPCS (Electronic Prescribing of Controlled Substances) — a secure digital system
            > A prescriber CANNOT call in a CII to the pharmacy for a routine fill (verbal order NOT allowed for routine CII)
            > EXCEPTION — True Emergency: If a patient will suffer harm without the medication right now, the prescriber can call it in for a limited emergency supply. But the WRITTEN prescription must arrive at the pharmacy within 7 days.
            > FAXED CII: A faxed prescription can only serve as the original for: hospice/terminally ill patients, long-term care facility (nursing home) residents, and compounded IV controlled substances.
            > PARTIAL FILL: A pharmacist can dispense part of a CII if they don't have the full amount. The rest must be dispensed within 72 hours (or the prescriber must write a new Rx).
            > KEY: CII = ZERO refills. Must be written or EPCS. Emergency verbal orders must be followed by written Rx within 7 days.
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
            > Schedule III (CIII) and Schedule IV (CIV) controlled substances have more flexible dispensing rules than Schedule II because they carry lower — though still real — abuse potential.
            > Examples: CIII = Tylenol with codeine (acetaminophen/codeine), testosterone, anabolic steroids. CIV = alprazolam (Xanax), diazepam (Valium), zolpidem (Ambien), tramadol, lorazepam (Ativan).
            > REFILL RULES — memorize these numbers:
            > Up to 5 refills allowed (plus the original fill = 6 total fills)
            > All refills must be used within 6 months of the DATE THE PRESCRIPTION WAS WRITTEN
            > After 6 months or 5 refills — whichever comes FIRST — the prescription expires. Patient needs a new Rx.
            > SCHEDULE V (CV): Same refill allowance (up to 5 within 6 months). Some CV products (like Robitussin AC — codeine cough syrup) may be sold OTC in certain states — but the pharmacist/tech must check ID, sign the logbook, and enforce quantity limits.
            > CALLS-INS and TRANSFERS: Unlike CII, CIII-IV prescriptions CAN be called in verbally by a prescriber. They can also be transferred between pharmacies (once for handwritten; unlimited times if pharmacies share a real-time database system).
            > KEY: CIII and CIV = up to 5 refills within 6 months of written date. CII = ZERO refills. These two numbers (5 refills, 6 months) must be memorized exactly.
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
            > The Drug Supply Chain Security Act (DSCSA) is a federal law passed in 2013 that protects patients from counterfeit, stolen, or contaminated prescription drugs entering the US drug supply.
            > Think of it as a tracking system — like how FedEx tracks your package at every step, DSCSA requires every prescription drug package to be electronically tracked from the moment it's manufactured to the moment it's dispensed to a patient.
            > WHY IT MATTERS: Before DSCSA, counterfeit or diverted drugs could enter pharmacy shelves with little traceability. Patients received fake medications — some with no active ingredient, some with dangerous contaminants.
            > The system became FULLY operational on November 27, 2023.
            > WHO IS INVOLVED (called "Trading Partners"):
            > Manufacturers (make the drug) → Wholesale Distributors (ship it) → Pharmacies/Dispensers (give it to patients)
            > Each time the drug changes hands, an electronic record must be transferred.
            > The system is "interoperable" — meaning all parties' computer systems can talk to each other to verify a product's legitimacy at any point.
            > WHAT'S TRACKED: Only finished prescription drugs in their final dosage form. Not raw ingredients or OTC drugs.
            > KEY: DSCSA = electronic track-and-trace system for prescription drugs through the supply chain. Protects against counterfeit/contaminated drugs. Fully implemented November 2023.
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
            > Under DSCSA, every individual prescription drug package (each bottle, each blister pack) must carry a unique identification code — think of it like a serial number on a car.
            > This "product identifier" has FOUR required pieces of information:
            > 1. NDC (National Drug Code): Identifies exactly what the product is — the drug name, strength, dosage form, and manufacturer
            > 2. Serial Number: Unique to THAT specific package — no other package in the world has this same number
            > 3. Lot Number: Identifies the manufacturing batch it came from (critical for recalls — "which packages were from the contaminated batch?")
            > 4. Expiration Date: In a standardized format
            > All four pieces are encoded in a 2D barcode (like a QR code) on the package label.
            > TRANSACTION RECORDS: Every time a package changes hands between trading partners, three documents must be transferred: Transaction Information (TI), Transaction History (TH), and Transaction Statement (TS). These records must be kept for 6 years.
            > SUSPECT PRODUCT: If a pharmacy receives a drug they think might be counterfeit or stolen, they must: quarantine it immediately (keep it separate), investigate, notify the FDA and the trading partner who sent it, and not dispense it until cleared.
            > KEY: DSCSA product identifier = 4 elements: NDC + Serial Number + Lot Number + Expiration Date. Encoded in 2D barcode. Records kept 6 years.
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
            > REMS stands for Risk Evaluation and Mitigation Strategy — a special FDA program for drugs whose risks are so serious that a normal prescription label isn't enough to keep patients safe.
            > Think of REMS as extra layers of safety controls that the FDA requires ON TOP of regular prescribing for certain high-risk drugs.
            > A REMS can include any combination of these requirements:
            > Medication Guide: written patient information that must be given with every dispense (most basic/common REMS element)
            > Certified prescribers only: only doctors who have completed special training can prescribe it
            > Certified pharmacies only: only registered pharmacies can dispense it
            > Patient enrollment: patient must register in a monitoring program
            > Mandatory testing: lab tests (like pregnancy tests or blood counts) required before/during therapy
            > EXAMPLES of REMS drugs — these appear on the PTCB:
            > iPLED+ (isotretinoin/Accutane): Must have 2 negative pregnancy tests, 2 forms of contraception, monthly monitoring. Max 30-day supply.
            > Clozapine REMS: Must monitor absolute neutrophil count (ANC) — clozapine can destroy white blood cells.
            > TIRF REMS: For fentanyl lollipops and lozenges (immediate-release — extremely strong, only for opioid-tolerant patients). Certified prescribers/pharmacies only.
            > KEY: REMS = special FDA safety program for high-risk drugs. Most common REMS requirement = Medication Guide. iPLED+ (isotretinoin) and Clozapine REMS are the most commonly tested examples.
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
            > The DEA uses specific numbered forms for different controlled substance activities. On the PTCB, you need to know which form is used for which purpose.
            > DEA FORM 222: Used to ORDER Schedule I and II controlled substances from a supplier (the paper order form). This is how a pharmacy reorders its oxycodone, morphine, Adderall, etc. from the wholesaler. Only the DEA registrant (the pharmacist-in-charge/owner) or an authorized Power of Attorney can sign this form.
            > The modern electronic replacement: CSOS (Controlled Substance Ordering System) — same purpose as DEA 222 but done digitally.
            > OTHER DEA FORMS — know these:
            > DEA Form 224: The registration form a NEW pharmacy or prescriber fills out to get a DEA number (to be allowed to handle controlled substances)
            > DEA Form 106: Report of theft or SIGNIFICANT LOSS of controlled substances — must be filed when a pharmacy discovers drugs were stolen or a significant quantity is unaccounted for
            > DEA Form 41: Used when DESTROYING controlled substances (expired, damaged, or no longer needed drugs)
            > KEY: DEA 222 = ordering Schedule I/II drugs. DEA 106 = theft/loss report. DEA 41 = destruction record. DEA 224 = new DEA registration. These four forms are all tested.
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
            > When a drug is recalled, the FDA classifies the recall into one of three classes based on how dangerous the problem is to patients. Knowing these three classes is tested directly on the PTCB.
            > CLASS I RECALL — Most Dangerous: There is a REASONABLE PROBABILITY that using this product WILL cause SERIOUS adverse health effects or DEATH.
            > Example: Contaminated injectable drug that could cause a life-threatening infection. Or blood pressure medication found to contain a cancer-causing impurity at dangerous levels.
            > Immediate action required — pull all affected product from shelves immediately.
            > CLASS II RECALL — Moderately Serious: Use of this product MAY cause TEMPORARY or MEDICALLY REVERSIBLE adverse health effects, OR the probability of serious harm is remote.
            > Example: An antibiotic that is slightly less potent than labeled — it might not work as well, but it's unlikely to cause serious harm.
            > CLASS III RECALL — Least Serious: Using this product is UNLIKELY to cause any adverse health effects.
            > Example: A labeling error that doesn't affect patient safety, like a minor printing mistake on the package.
            > Market Withdrawal: Not an official recall — the drug is removed voluntarily for a minor violation that is not subject to legal action and poses no real safety risk.
            > KEY: Class I = will likely cause death or serious harm (most urgent). Class II = may cause temporary harm (moderate). Class III = unlikely to cause harm (least urgent). These three must be memorized in order.
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
            > OBRA '90 stands for the Omnibus Budget Reconciliation Act of 1990 — a federal law that created important requirements for pharmacies serving Medicaid patients.
            > You don't need to know the budget part — just the pharmacy practice requirements it created.
            > OBRA '90 created THREE key pharmacy obligations:
            > 1. PROSPECTIVE DRUG UTILIZATION REVIEW (DUR): Before handing over any new prescription, the pharmacist MUST review it for potential problems. This includes checking for: drug-drug interactions, incorrect doses, allergies, duplicate medications, and drugs that shouldn't be used with certain diseases.
            > "Prospective" means BEFORE dispensing — reviewing ahead of time. This is different from retrospective DUR (looking back at past records to find patterns).
            > 2. OFFER TO COUNSEL: The pharmacist (or their designee) MUST offer to counsel the patient on every NEW prescription. The patient can refuse — but the offer must be made and documented. Many states have expanded this requirement to all patients (not just Medicaid).
            > 3. PATIENT MEDICATION RECORDS: The pharmacy must maintain up-to-date records of all medications each patient is taking. This allows the pharmacist to check for interactions every time a new medication is added.
            > KEY: OBRA '90 = three requirements: (1) prospective DUR, (2) offer to counsel on new Rxs, (3) maintain patient medication records. Applies to Medicaid patients (many states extended to all).
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
            > HIPAA is the Health Insurance Portability and Accountability Act (1996) — the federal law that protects patients' private health information. As a pharmacy technician, you handle private health information every single day, so this is critical.
            > PHI stands for Protected Health Information — any information that could identify a specific patient AND relates to their health or healthcare. This includes: their name, address, date of birth, Social Security number, phone number, diagnosis, medication list, payment records, photos — basically anything that connects a person to their health status.
            > The "Minimum Necessary" rule: you can only access or share the minimum amount of patient information needed to do your job. You cannot look up a coworker's medications out of curiosity, even though you have access.
            > When CAN you share PHI without asking the patient first?
            > TPO: Treatment (sharing with other providers caring for the patient), Payment (billing insurance), Operations (running the pharmacy — training, auditing, quality improvement)
            > Outside of TPO: You need written authorization from the patient.
            > PENALTIES: HIPAA violations range from $100 to $50,000 per violation (depending on intent), with criminal penalties for intentional violations.
            > Common pharmacy HIPAA scenarios: Talking about a patient's medications loudly at the counter, giving a refill to an unauthorized person, looking up someone's records without a legitimate reason.
            > KEY: HIPAA protects PHI. You can share without consent for Treatment, Payment, and Operations (TPO). Minimum necessary standard applies. Violations carry steep fines.
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
            > Pseudoephedrine (PSE) is a decongestant found in cold medicines like Sudafed. It works great for stuffy noses — but it's also the main ingredient used to illegally manufacture methamphetamine.
            > To fight meth production, Congress passed the Combat Methamphetamine Epidemic Act (CMEA) in 2005, which placed strict limits on how much pseudoephedrine a person can buy.
            > WHERE IT'S KEPT: Pseudoephedrine products must be stored BEHIND the pharmacy counter or in a locked cabinet — NOT on open shelves where anyone can grab them.
            > WHO SELLS IT: Must be retrieved and sold by a pharmacy employee (not self-service).
            > ID REQUIREMENT: Every buyer must show a valid government-issued photo ID (driver's license, passport).
            > LOGBOOK: The pharmacy keeps an electronic or paper log with: buyer's name and address, date and time of purchase, and amount purchased.
            > PURCHASE LIMITS (memorize these):
            > Daily limit: 3.6 grams of PSE base
            > 30-day limit: 9.0 grams of PSE base
            > (For reference: a 30mg Sudafed tablet contains 30mg PSE, so 3.6g = 120 tablets per day — practically that's a lot, but the limit exists for bulk purchases)
            > Many states use NPLEx — a real-time electronic database that tracks purchases across all pharmacies to prevent buying up the limit at multiple stores.
            > KEY: PSE = behind the counter, ID required, logbook required. Daily limit = 3.6 g. Monthly limit = 9.0 g. These exact numbers are tested.
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
            > Properly disposing of medications is important for two reasons: preventing drug misuse (especially for opioids and controlled substances) and protecting the environment.
            > The BEST method for controlled substances: DRUG TAKE-BACK PROGRAMS at DEA-authorized collection sites. Many pharmacies, hospitals, and police departments have permanent drug drop boxes. The DEA also organizes a "National Prescription Drug Take Back Day" twice a year.
            > OTHER APPROVED METHODS — from best to last resort:
            > Authorized mail-back envelopes: DEA-approved prepaid mailers — drop your medications in and mail to a destruction facility.
            > Drug deactivation pouches: Special pouches that use activated charcoal to destroy the medication at home — then goes in regular trash.
            > Household trash (modified): ONLY if no take-back option exists. Mix medications with something unpleasant like coffee grounds or kitty litter, seal in a container, scratch out personal info from label, then throw away. This discourages people from retrieving it from trash.
            > FDA FLUSH LIST: A short list of specific high-risk medications (like fentanyl patches, oxycodone) that CAN be flushed down the toilet if NO take-back is available. FDA determined the environmental risk of flushing is less dangerous than leaving opioids accessible.
            > PHARMACY DESTRUCTION: When a pharmacy destroys controlled substances, they must use DEA Form 41 and have DEA authorization.
            > KEY: Best disposal = DEA take-back programs. Can flush FDA Flush List drugs if no take-back available. Pharmacy destruction requires DEA Form 41.
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
