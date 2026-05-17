//
//  RimrockQuestions_Day11_20.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Question content for shift days 11–20. Split out of RimrockContent.swift
//  to keep individual files reviewable.
//

import Foundation

// MARK: - Day 11 Questions

extension RimrockQuestion {

    static let day11_hipaaPHI = RimrockQuestion(
        id: "D11_HIPAA_PHI",
        domain: .federalRequirements,
        topic: "HIPAA_PHI",
        prompt: "A patient's spouse calls asking about specific medications she's picking up. There is no HIPAA authorization on file. What can you share?",
        options: [
            "Confirm the prescription is ready for pickup; do not discuss specifics",
            "Share everything; spouses are presumed authorized",
            "Refuse to acknowledge the patient exists",
            "Share only if the spouse provides the patient's date of birth"
        ],
        correctAnswer: "Confirm the prescription is ready for pickup; do not discuss specifics",
        onCorrect: "Confirm pickup status only. The pickup itself is permitted disclosure under treatment, payment, operations (TPO) — minimum necessary information. Drug names, diagnoses, dosing details are PHI requiring written authorization. Politely decline to discuss specifics; offer to help him understand how to get authorization on file.",
        onWrong: "Pickup status only. TPO covers logistics — \"yes, prescription is ready, copay is X.\" Specifics — what drug, what for, what dose — are PHI requiring written authorization. Knowing the patient's DOB doesn't unlock disclosure; that's identifying the patient, not authorizing release."
    )

    static let day11_hipaaTPO = RimrockQuestion(
        id: "D11_HIPAA_TPO",
        domain: .federalRequirements,
        topic: "HIPAA_TPO",
        prompt: "Under HIPAA, \"TPO\" — what does it stand for, and what does it permit?",
        options: [
            "Treatment, Payment, Operations — permitted PHI use without authorization",
            "Tracking, Pharmacy, Order — required for billing claims",
            "Therapy, Patient, Outcome — required for clinical documentation",
            "Tier, Processor, Override — relates to insurance claims"
        ],
        correctAnswer: "Treatment, Payment, Operations — permitted PHI use without authorization",
        onCorrect: "Treatment, Payment, Operations. Treatment includes coordinating care, refilling prescriptions, contacting prescribers. Payment includes billing insurance, processing claims. Operations includes quality improvement, training, audits. Disclosure for TPO doesn't require patient authorization — it's the baseline that lets pharmacies function. Anything OUTSIDE TPO needs written authorization.",
        onWrong: "Treatment, Payment, Operations. The baseline of permitted disclosures without authorization. Treatment: coordinating care, refills, prescriber contact. Payment: insurance billing, claims. Operations: quality, training, audits. Disclosures outside TPO — marketing, research, third-party access — require written authorization."
    )

    static let day11_hipaaNPP = RimrockQuestion(
        id: "D11_HIPAA_NPP",
        domain: .federalRequirements,
        topic: "HIPAA_NPP",
        prompt: "What is the Notice of Privacy Practices (NPP) and when must it be provided?",
        options: [
            "A required disclosure given to patients describing how PHI is used",
            "An internal pharmacy document never shared with patients",
            "A signed authorization required from every patient",
            "A federal form filed with HHS quarterly"
        ],
        correctAnswer: "A required disclosure given to patients describing how PHI is used",
        onCorrect: "Notice of Privacy Practices. Pharmacies and other covered entities must provide it at first service, post it visibly, and make it available on request. Describes how the pharmacy uses PHI, the patient's rights, how to file a complaint. The patient signs an acknowledgment of receipt — not authorization, just confirmation they got it.",
        onWrong: "NPP — Notice of Privacy Practices. Required disclosure at first service, posted visibly, available on request. Describes PHI usage, patient rights, complaint process. Acknowledgment of receipt is required; that acknowledgment is not the same as authorization to share."
    )

    static let day11_hipaaBreach = RimrockQuestion(
        id: "D11_HIPAA_BREACH",
        domain: .federalRequirements,
        topic: "HIPAA_BREACH",
        prompt: "A pharmacy accidentally hands a bag of prescriptions to the wrong patient (different family). What is required under HIPAA breach rules?",
        options: [
            "Notify the affected patient(s); document the incident; consider HHS notification depending on scope",
            "Nothing; the medications were returned promptly",
            "Notify the FDA only",
            "Issue a press release"
        ],
        correctAnswer: "Notify the affected patient(s); document the incident; consider HHS notification depending on scope",
        onCorrect: "Notify affected patients, document, evaluate scope. Single-patient breaches go through the standard process — patient letter, internal documentation, mitigation. Breaches affecting 500+ patients trigger HHS notification within 60 days. Smaller breaches roll up into annual HHS reporting. Pharmacy keeps records for six years. Mitigation matters — was the wrong bag retrieved, did anyone read the contents, what's the actual exposure.",
        onWrong: "Patient notification, documentation, possible HHS reporting. Single-patient incident: letter to affected patient, internal incident log. 500+ patients: report to HHS within 60 days. Smaller incidents: roll into annual reporting. Records retained six years. Documentation of mitigation — bag retrieved, exposure assessed — is part of the file."
    )
}

// MARK: - Day 12 Questions

extension RimrockQuestion {

    static let day12_recordRetention = RimrockQuestion(
        id: "D12_RECORD_RETENTION",
        domain: .federalRequirements,
        topic: "DEA_RECORDS",
        prompt: "How long must federal law require pharmacies retain controlled-substance records (Form 222s, invoices, inventories)?",
        options: ["At least 2 years, on-site, accessible to DEA on request", "1 year", "5 years", "Indefinitely"],
        correctAnswer: "At least 2 years, on-site, accessible to DEA on request",
        onCorrect: "Two years federally — on-site, accessible to DEA on request. Many states require longer; some require five. Most pharmacies keep records longer than required because the cost of paper is small and the cost of not having a record when DEA comes asking is large. C-IIs typically kept separately, marked, in their own binder.",
        onWrong: "Two years federally; many states require five. On-site, DEA-accessible. C-IIs usually filed separately. Pharmacies often keep records longer voluntarily because storage is cheap and the consequences of missing a record during an audit aren't."
    )

    static let day12_deaRegistrationTypes = RimrockQuestion(
        id: "D12_DEA_REG_TYPES",
        domain: .federalRequirements,
        topic: "DEA_REGISTRATION",
        prompt: "How often must a pharmacy renew its DEA registration?",
        options: ["Every 3 years", "Annually", "Every 5 years", "One-time, no renewal"],
        correctAnswer: "Every 3 years",
        onCorrect: "Every three years. Each registered location is its own registration — a chain with multiple sites has multiple DEA numbers. Practitioners renew on a different cycle (also 3 years). Don't let it lapse — operating with an expired registration is a federal violation, and the wholesaler will refuse to ship controls without a current registration on file.",
        onWrong: "Every three years per location. Multi-site chains have multiple registrations, one per site. Practitioner registrations also renew every three years. Lapsed registration is a violation; wholesalers won't ship controls without a current one on file."
    )

    static let day12_drugRecallClass = RimrockQuestion(
        id: "D12_RECALL_CLASS",
        domain: .federalRequirements,
        topic: "FDA_RECALL_CLASSES",
        prompt: "An FDA Class II recall indicates which level of risk?",
        options: [
            "Temporary or medically reversible adverse health consequences",
            "Reasonable probability of serious adverse health consequences or death",
            "Unlikely to cause adverse health consequences",
            "Voluntary withdrawal with no FDA classification"
        ],
        correctAnswer: "Temporary or medically reversible adverse health consequences",
        onCorrect: "Class II — temporary or medically reversible. Class I is the most serious — reasonable probability of serious harm or death. Class III is unlikely to cause adverse effects but doesn't meet labeling or quality requirements. Most pharmacy-relevant recalls are Class II — affects health but reversible.",
        onWrong: "Class II — temporary or reversible adverse effects. Class I: serious harm or death possible. Class III: unlikely to cause harm, usually labeling or minor quality issues. The recall notice tells you the lot, the action required, and how to handle returns."
    )

    static let day12_recallProcedure = RimrockQuestion(
        id: "D12_RECALL_PROCEDURE",
        domain: .patientSafety,
        topic: "RECALL_RESPONSE",
        prompt: "When a recall affects medication you've already dispensed to patients, what should the pharmacy do?",
        options: [
            "Run a dispensing report by lot number; contact affected patients",
            "Wait for patients to inquire about the recall",
            "Only contact patients who have a refill due",
            "Notify the prescriber and let them handle it"
        ],
        correctAnswer: "Run a dispensing report by lot number; contact affected patients",
        onCorrect: "Dispensing report by lot number, contact affected patients. We're the last point of patient contact — we have the records of who got which lot. The notice usually specifies a window (six months back, twelve months back). Pharmacy notifies patients, arranges replacement or return depending on the recall instructions. Many pharmacies do this through automated systems for large recalls; small ones get handled by hand.",
        onWrong: "Dispensing report by lot, contact affected patients. Pharmacy has the dispensing records, prescriber doesn't. Time window per the recall notice. Replacement or return per recall instructions. Patient education at point of contact — what to do with the affected stock at home."
    )
}

// MARK: - Day 13 Questions

extension RimrockQuestion {

    static let day13_forgeryRedFlags = RimrockQuestion(
        id: "D13_FORGERY_RED_FLAGS",
        domain: .patientSafety,
        topic: "RX_FORGERY_INDICATORS",
        prompt: "Which of the following can be a red flag for prescription forgery?",
        options: [
            "All of these (different ink between body and signature, altered quantities, photocopied appearance)",
            "Different ink only",
            "Photocopied appearance only",
            "Altered quantities only"
        ],
        correctAnswer: "All of these (different ink between body and signature, altered quantities, photocopied appearance)",
        onCorrect: "All of them. Other forgery indicators: prescription pad numbers that don't match the prescriber's office, signatures inconsistent with prescriber's known handwriting, drug name written in different style than the rest, dates altered or unclear, atypical drug combinations or quantities, refills altered or added. Pattern recognition matters — one indicator is suggestive, multiple together is actionable.",
        onWrong: "All of those, plus pad numbers that don't match the office, inconsistent signatures, altered dates, drug names written in different style, atypical combinations or quantities. Pattern matters — one flag is suggestive, multiple together is reason to investigate before filling."
    )

    static let day13_signatureVerification = RimrockQuestion(
        id: "D13_SIGNATURE_VERIFY",
        domain: .patientSafety,
        topic: "RX_SIGNATURE",
        prompt: "On a paper Schedule II prescription, the signature must be...?",
        options: [
            "Wet ink (handwritten signature in ink)",
            "Stamped signature acceptable",
            "Photocopied signature acceptable if clear",
            "Initials acceptable in lieu of full signature"
        ],
        correctAnswer: "Wet ink (handwritten signature in ink)",
        onCorrect: "Wet ink. C-II paper prescriptions require a handwritten signature in ink — actual pen on actual paper. Stamps, photocopies, and initials are not acceptable. Only EPCS — Electronic Prescriptions for Controlled Substances — permits a digital signature, and that requires DEA-compliant identity proofing and two-factor authentication on the prescriber's side.",
        onWrong: "Wet ink. Pen, ink, paper. No stamps, no photocopies, no initials. EPCS allows digital signature but only with DEA-compliant identity proofing and 2FA. Faxing a C-II Rx is not permitted as the original; the original wet-ink paper must follow."
    )

    static let day13_epcsRequirements = RimrockQuestion(
        id: "D13_EPCS",
        domain: .federalRequirements,
        topic: "EPCS",
        prompt: "Electronic Prescriptions for Controlled Substances (EPCS) require which of the following on the prescriber side?",
        options: [
            "Identity proofing and two-factor authentication",
            "A signed paper backup",
            "FDA registration only",
            "No special requirements"
        ],
        correctAnswer: "Identity proofing and two-factor authentication",
        onCorrect: "Identity proofing plus two-factor authentication. The prescriber's identity is verified through a DEA-approved process; their credentials are protected by 2FA. Each EPCS prescription is digitally signed and tamper-evident. Audit trail follows the prescription from prescriber to pharmacy. Medicare mandated EPCS for most controlled prescriptions in 2021.",
        onWrong: "Identity proofing + 2FA on the prescriber side. DEA-approved identity proofing process, two-factor for transmission. Tamper-evident audit trail. Medicare mandate for most controlled prescriptions, 2021. Pharmacy receives via certified secure pathway; prescription is uneditable at our end."
    )

    static let day13_dscsa = RimrockQuestion(
        id: "D13_DSCSA",
        domain: .federalRequirements,
        topic: "DSCSA",
        prompt: "Under the Drug Supply Chain Security Act (DSCSA), how long must a pharmacy retain transaction history records?",
        options: ["6 years", "2 years", "10 years", "Indefinitely"],
        correctAnswer: "6 years",
        onCorrect: "Six years. DSCSA — track-and-trace from manufacturer to dispensing pharmacy. Each transaction documented: who shipped, who received, when, what lot, what quantity. Pharmacy retains six years; counterfeit detection, recall response, supply chain integrity all rely on that recordkeeping. Full track-and-trace requirements went into effect 2023.",
        onWrong: "Six years. DSCSA tracks every transaction in the prescription drug supply chain — manufacturer to wholesaler to pharmacy. Pharmacy keeps six years of records. Catches counterfeits, supports recalls, blocks diversion. Full requirements effective 2023."
    )
}

// MARK: - Day 14 Questions

extension RimrockQuestion {

    static let day14_inspectorHIPAA = RimrockQuestion(
        id: "D14_INSPECTOR_HIPAA",
        domain: .federalRequirements,
        topic: "HIPAA_FRIEND_DISCLOSURE",
        prompt: "Inspector's question: A friend (not authorized) calls asking what medications a patient is on. Correct response?",
        options: [
            "Decline to confirm or share PHI; offer to take a message for the patient",
            "Confirm whether the patient is on a specific medication if asked",
            "Share medications if the friend says it's an emergency",
            "Share only over-the-counter medications"
        ],
        correctAnswer: "Decline to confirm or share PHI; offer to take a message for the patient",
        onCorrect: "Decline. Without authorization, friends are not permitted recipients of PHI — even if the friend says emergency, even if the friend is well-known to the pharmacy. Offer to take a message for the patient or to have the patient call back. Emergencies handled by emergency services, not by us bypassing HIPAA. The right answer to inspectors is the careful one.",
        onWrong: "Decline to confirm or disclose. Friends without authorization don't get PHI, no matter the urgency they claim. Offer to take a message. Real emergencies go through 911 and clinical providers, not through us bypassing HIPAA. Inspectors want to hear the careful answer because the careful answer is the one that holds up."
    )

    static let day14_inspectorRecords = RimrockQuestion(
        id: "D14_INSPECTOR_RECORDS",
        domain: .federalRequirements,
        topic: "DEA_RECORD_LOCATION",
        prompt: "Inspector's question: DEA Form 222 records — retention and storage?",
        options: [
            "At least 2 years on-site, accessible to DEA on request, separated from other records",
            "1 year off-site, retrievable within 48 hours",
            "Stored only at the wholesaler",
            "5 years anywhere on the premises"
        ],
        correctAnswer: "At least 2 years on-site, accessible to DEA on request, separated from other records",
        onCorrect: "Two years on-site, DEA-accessible, separated. C-II records (Form 222s, perpetual inventory, biennial inventory) usually maintained in their own binder. Many states require longer than two years; many pharmacies keep records longer voluntarily. The phrasing inspectors listen for: 'on-site, accessible to DEA on request.'",
        onWrong: "Two years on-site, DEA-accessible, separated from non-controlled records. C-II in its own binder. Many states extend to five years; many pharmacies keep more. \"On-site, accessible to DEA on request\" is the inspector's preferred phrasing."
    )

    static let day14_inspectorOBRA = RimrockQuestion(
        id: "D14_INSPECTOR_OBRA",
        domain: .federalRequirements,
        topic: "OBRA_90_COUNSELING",
        prompt: "Inspector's question: OBRA-90 patient counseling — federal requirement?",
        options: [
            "Counseling must be offered on every new prescription; states often require an actual attempt",
            "Counseling is required only on controlled substances",
            "Counseling is required only on patient request",
            "Counseling is required only for first-time patients"
        ],
        correctAnswer: "Counseling must be offered on every new prescription; states often require an actual attempt",
        onCorrect: "Offered on every new prescription. Federal floor under OBRA-90 (Omnibus Budget Reconciliation Act, 1990) — pharmacy must offer counseling to every Medicaid patient on every new prescription, and most states extended this to all patients. Some states require an actual attempt, not just an offer. Decline must be documented. The phrasing matters — 'offered, not required to be accepted.'",
        onWrong: "Offered on every new Rx — federal floor. Most states extended to all patients. Some states require actual counseling, not just an offer. Decline must be documented. Inspectors hear the difference between 'must offer' and 'must counsel' and like that you know the difference."
    )

    static let day14_inspectorUSP795 = RimrockQuestion(
        id: "D14_INSPECTOR_USP795",
        domain: .orderEntry,
        topic: "USP_795_BUD",
        prompt: "Inspector's question: Non-sterile compounding — water-containing oral preparation, beyond-use date per USP <795>?",
        options: [
            "No more than 14 days when refrigerated (current USP <795>)",
            "30 days at room temperature",
            "90 days when refrigerated",
            "Same as the manufacturer's expiration date"
        ],
        correctAnswer: "No more than 14 days when refrigerated (current USP <795>)",
        onCorrect: "Fourteen days refrigerated, water-containing oral. USP <795> revised default beyond-use dating in 2023. Non-aqueous: 90 days. Water-containing topical/dermal: 30 days. Water-containing oral: 14 days refrigerated. Always defer to a stability study if one exists for the formulation. Compounding records kept three years.",
        onWrong: "Fourteen days refrigerated for water-containing oral, current USP <795>. Non-aqueous: 90 days. Water-containing topical: 30 days. Defer to a published stability study when one exists. Compounding records kept three years. The 2023 revision tightened a lot of older defaults."
    )
}

// MARK: - Day 15 Questions

extension RimrockQuestion {

    static let day15_anticholinergicBurden = RimrockQuestion(
        id: "D15_ANTICHOLINERGIC",
        domain: .medications,
        topic: "ANTICHOLINERGIC_BURDEN",
        prompt: "Which combination represents an anticholinergic burden risk in an elderly patient?",
        options: [
            "Diphenhydramine + hydroxyzine + oxybutynin",
            "Lisinopril + atorvastatin + metformin",
            "Acetaminophen + ibuprofen + aspirin",
            "Levothyroxine + omeprazole + multivitamin"
        ],
        correctAnswer: "Diphenhydramine + hydroxyzine + oxybutynin",
        onCorrect: "All three are strong anticholinergics. Diphenhydramine — first-generation antihistamine. Hydroxyzine — also first-gen antihistamine, often misclassified as 'just' anxiety/itch. Oxybutynin — antimuscarinic for OAB. Stacked: confusion, dry mouth, constipation, urinary retention, blurred vision, falls. Beers Criteria flags all three for adults 65+. Cumulative anticholinergic burden is correlated with cognitive decline and fall risk independent of dose.",
        onWrong: "Diphenhydramine + hydroxyzine + oxybutynin. Three drugs, all strong anticholinergics, stacked. Beers Criteria flags every one for adults 65+. Cumulative burden — confusion, dry mouth, constipation, urinary retention, blurred vision, FALLS. Even subclinical from each alone, additive effects are real."
    )

    static let day15_orthostaticCombo = RimrockQuestion(
        id: "D15_ORTHOSTATIC",
        domain: .medications,
        topic: "ORTHOSTATIC_HYPOTENSION",
        prompt: "Which combination most increases the risk of orthostatic hypotension in an elderly patient?",
        options: [
            "Beta-blocker + calcium channel blocker + anticholinergic",
            "PPI + statin + aspirin",
            "Levothyroxine + multivitamin",
            "Acetaminophen + omeprazole"
        ],
        correctAnswer: "Beta-blocker + calcium channel blocker + anticholinergic",
        onCorrect: "Beta-blocker plus CCB plus anticholinergic. Beta-blocker blunts the heart-rate compensation when blood pressure drops. CCB causes vasodilation directly. Anticholinergic blunts the autonomic reflex and can also cause confusion that masks symptoms. Stand up, blood pressure crashes, you don't compensate fast enough, you fall. The anticholinergic confusion piece means the patient may not realize they're light-headed before they go down.",
        onWrong: "Beta-blocker + CCB + anticholinergic. The first two drop blood pressure and blunt heart rate response; the third blocks autonomic reflex AND clouds awareness. You can't feel the warning, can't compensate, can't catch yourself. Falls in the elderly are usually multifactorial — drug stacking is a top contributor."
    )

    static let day15_beersCriteria = RimrockQuestion(
        id: "D15_BEERS",
        domain: .patientSafety,
        topic: "BEERS_CRITERIA",
        prompt: "The Beers Criteria identify medications that are...?",
        options: [
            "Potentially inappropriate for adults 65 and older",
            "Always contraindicated in pregnancy",
            "Not covered by Medicare",
            "Available only by prescription"
        ],
        correctAnswer: "Potentially inappropriate for adults 65 and older",
        onCorrect: "Potentially inappropriate in adults 65+. Updated regularly by the American Geriatrics Society. Categories: avoid in older adults regardless, avoid in specific conditions, use with caution, drug-drug combinations to avoid. The list isn't a ban — it's a flag. 'Beers' just means 'pause and reconsider.' First-generation antihistamines (diphenhydramine, hydroxyzine), benzodiazepines, anticholinergics, NSAIDs in CKD, and many more.",
        onWrong: "Potentially inappropriate for older adults. AGS updates regularly. Not a ban — a 'pause and reconsider' list. First-gen antihistamines, benzodiazepines, anticholinergics, NSAIDs in CKD, sliding-scale insulin, long-acting sulfonylureas, several muscle relaxants. The dispensing pharmacy is a meaningful checkpoint for catching it."
    )

    static let day15_deprescribing = RimrockQuestion(
        id: "D15_DEPRESCRIBING",
        domain: .medications,
        topic: "DEPRESCRIBING",
        prompt: "What is \"deprescribing\"?",
        options: [
            "The systematic process of identifying and discontinuing medications that may no longer be beneficial",
            "Never restarting a medication after discontinuation",
            "Refusing to fill any prescription deemed unnecessary",
            "Substituting cheaper generics without prescriber approval"
        ],
        correctAnswer: "The systematic process of identifying and discontinuing medications that may no longer be beneficial",
        onCorrect: "Systematic discontinuation when the harm/benefit ratio has shifted. Common targets: PPIs after the indication resolves, statins in advanced age with limited life expectancy, anticholinergics in patients showing cognitive decline, opioids when chronic pain has improved. Done collaboratively — pharmacist flags candidates, prescriber decides, patient is part of the conversation. Tapering matters; abrupt stops cause rebound.",
        onWrong: "Systematic discontinuation when benefit no longer outweighs risk. Common targets: PPIs past their indication, anticholinergics in cognitive decline, statins in limited life expectancy, opioids when pain improves. Collaborative — pharmacist flags, prescriber decides, patient consents. Taper to avoid rebound or withdrawal."
    )
}

// MARK: - Day 16 Questions

extension RimrockQuestion {

    static let day16_theftResponseSequence = RimrockQuestion(
        id: "D16_THEFT_RESPONSE",
        domain: .federalRequirements,
        topic: "CII_THEFT_RESPONSE",
        prompt: "You discover a discrepancy in the C-II perpetual count. What's the correct immediate sequence?",
        options: [
            "Secure the safe; document the discrepancy with times and initials; notify the pharmacist-in-charge",
            "Recount until the numbers match",
            "Wait until end of shift to investigate",
            "Notify the patient who filled the most recent C-II prescription"
        ],
        correctAnswer: "Secure the safe; document the discrepancy with times and initials; notify the pharmacist-in-charge",
        onCorrect: "Secure, document, notify. Don't keep recounting — the discrepancy is real once you've confirmed it. The perpetual log entry stands as it was. Pharmacist-in-charge has the legal obligation to investigate and report. State board notification typically same day; DEA Form 106 within one business day. Photographs and dated documentation matter — investigators will reconstruct the chain of custody.",
        onWrong: "Secure, document, notify pharmacist-in-charge. Don't keep recounting; the perpetual stands. PIC investigates and reports — state board same day, DEA Form 106 within one business day. Documentation with times, initials, photographs. The chain of custody is critical for the investigation."
    )

    static let day16_form106 = RimrockQuestion(
        id: "D16_FORM_106",
        domain: .federalRequirements,
        topic: "DEA_FORM_106",
        prompt: "DEA Form 106 is used to report which event?",
        options: [
            "Theft or significant loss of controlled substances",
            "Routine inventory of controlled substances",
            "Ordering Schedule II drugs from a wholesaler",
            "Destruction of expired controlled substances"
        ],
        correctAnswer: "Theft or significant loss of controlled substances",
        onCorrect: "Form 106 reports theft or significant loss. Filed with the DEA within one business day of discovery. Required even if the loss is later reconciled — the report is about the event, not the final accounting. Form 41 is for destruction (with witness signature, often a reverse distributor). Form 222 is for ordering C-IIs. Each form has its purpose.",
        onWrong: "Form 106 — theft or significant loss. Within one business day of discovery. Even if later reconciled, the report stands. Form 41 — destruction. Form 222 — ordering C-IIs. Form 224 — pharmacy registration application. Each has its job."
    )

    static let day16_pharmacistInCharge = RimrockQuestion(
        id: "D16_PIC",
        domain: .federalRequirements,
        topic: "PIC_RESPONSIBILITIES",
        prompt: "Which is a responsibility of the Pharmacist-in-Charge (PIC)?",
        options: [
            "All of these (compliance with state and federal law, reporting to the board, supervising staff)",
            "Compliance with state and federal law only",
            "Reporting to the board only",
            "Filling prescriptions only"
        ],
        correctAnswer: "All of these (compliance with state and federal law, reporting to the board, supervising staff)",
        onCorrect: "All of them. PIC is the legally responsible pharmacist for the location — compliance with state and federal law, reporting controlled-substance losses, supervising staff (techs and other pharmacists), maintaining policy and procedure manuals, ensuring regulatory inspections are handled. PIC's name is on the registration; PIC's license is on the line if compliance fails. State law defines specifics — Wyoming requires the PIC to be on-site a minimum number of hours per week; varies by state.",
        onWrong: "All of those. The PIC is the licensed pharmacist legally responsible for the location's controlled-substance compliance, staff supervision, policy and procedure, regulatory response. Their name is on the DEA registration; their license carries the consequences. State law specifies on-site time requirements."
    )

    static let day16_mme = RimrockQuestion(
        id: "D16_MME",
        domain: .medications,
        topic: "OPIOID_MME",
        prompt: "What is morphine milligram equivalent (MME) used for?",
        options: [
            "Standardizing opioid dose comparisons across different drugs",
            "Calculating insurance copayments",
            "Determining DEA schedule",
            "Setting pharmacy markup"
        ],
        correctAnswer: "Standardizing opioid dose comparisons across different drugs",
        onCorrect: "Dose standardization across opioids. Lets you compare 10 mg of oxycodone to 30 mg of morphine to 75 mcg/h of fentanyl. CDC guidelines suggest caution above 50 MME/day, very careful conversation above 90. State PDMPs flag patients above thresholds. The conversion factors are imperfect but useful — some drugs (methadone, fentanyl, buprenorphine) have non-linear or specialty conversions and should be done by clinical decision tools, not back-of-envelope.",
        onWrong: "MME — morphine milligram equivalents. Standardizes opioid dose across drugs. CDC: caution >50 MME/day, very careful conversation >90. State PDMPs flag thresholds. Conversion factors for oxycodone, hydrocodone, fentanyl, etc. Methadone and fentanyl conversions are non-linear — use validated clinical tools."
    )
}

// MARK: - Day 17 Questions

extension RimrockQuestion {

    static let day17_techScope = RimrockQuestion(
        id: "D17_TECH_SCOPE",
        domain: .federalRequirements,
        topic: "TECH_SCOPE_OF_PRACTICE",
        prompt: "Which task is typically pharmacist-only and not delegated to a pharmacy technician?",
        options: [
            "Final verification and DUR override decisions",
            "Counting tablets",
            "Generating prescription labels",
            "Submitting insurance claims"
        ],
        correctAnswer: "Final verification and DUR override decisions",
        onCorrect: "Final verification, DUR overrides, clinical judgment, patient counseling — pharmacist-only by federal regulation, with state law adding more in some places. Tech-allowed: data entry, label generation, counting, packaging, billing, inventory. The line moves between states; Wyoming gives techs more than some, less than others. PTCE asks because the line gets crossed in retail.",
        onWrong: "Final verification, DUR override decisions, clinical judgment, counseling — pharmacist-only by federal regulation. State law adds more in some places. Counting, billing, label printing, data entry, inventory — tech-allowed. Always check state-specific scope; the line moves."
    )

    static let day17_techCheckTech = RimrockQuestion(
        id: "D17_TECH_CHECK_TECH",
        domain: .patientSafety,
        topic: "TECH_CHECK_TECH",
        prompt: "Tech-check-tech (TCT) is most commonly permitted in which situation?",
        options: [
            "Refills of the same drug at the same dose for the same patient, in specific settings",
            "All retail prescriptions",
            "All controlled substance prescriptions",
            "Never permitted in any state"
        ],
        correctAnswer: "Refills of the same drug at the same dose for the same patient, in specific settings",
        onCorrect: "Refills, same drug, same dose, same patient — and even then, only in specific settings (institutional, LTC, sometimes hospital floor stock). Generally not for new prescriptions. Generally not for controlled substances. Generally not in retail. State law varies widely — some states don't permit TCT at all; some permit it for unit-dose repackaging. Always check state-specific rules.",
        onWrong: "Limited TCT — refills, same drug, same dose, same patient, in specific settings (institutional, LTC, floor stock). Not new Rx, not controls, generally not retail. State law varies widely. Always check the specific permitted activities; tech-check-tech is one of the most state-variable rules in pharmacy."
    )

    static let day17_dur = RimrockQuestion(
        id: "D17_DUR",
        domain: .patientSafety,
        topic: "DUR_RESPONSIBILITY",
        prompt: "When a Drug Utilization Review (DUR) alert fires, who is responsible for reviewing and deciding whether to dispense?",
        options: [
            "The pharmacist",
            "The pharmacy technician",
            "The prescriber",
            "The insurance company"
        ],
        correctAnswer: "The pharmacist",
        onCorrect: "The pharmacist. DUR alerts are clinical — drug-drug interactions, allergies, duplicate therapy, dose-out-of-range, duration warnings. Tech can flag the alert but only the pharmacist can override. Override decisions must be documented with rationale. The PTCE loves this question because techs do override DUR alerts in real life — and they shouldn't.",
        onWrong: "The pharmacist. DUR is clinical decision-making — drug-drug interactions, allergies, duplicate therapy, dose range, duration. Tech flags, pharmacist decides. Override must be documented. Letting techs override DUR alerts is a common — and indefensible — corner-cutting in busy retail pharmacies."
    )

    static let day17_credentialing = RimrockQuestion(
        id: "D17_CREDENTIALING",
        domain: .federalRequirements,
        topic: "PTCB_NHA",
        prompt: "PTCB and NHA both administer which type of pharmacy technician credential?",
        options: [
            "National certification exams (CPhT and similar)",
            "State licensing exams",
            "DEA registration",
            "Pharmacy technician training programs"
        ],
        correctAnswer: "National certification exams (CPhT and similar)",
        onCorrect: "National certification. PTCB (Pharmacy Technician Certification Board) — older, larger, awards CPhT credential. NHA (National Healthcareer Association) — newer, awards ExCPT. Both are national exams; both require continuing education for renewal; states recognize one or both depending on state law. State registration is separate — handled by the state board of pharmacy. Credentialing and licensing are different processes.",
        onWrong: "National certification: PTCB (CPhT) and NHA (ExCPT). Both national exams, both require CE for renewal. State recognition varies. State registration is separate — through the state board of pharmacy. Credentialing (national) and licensing (state) are different, and PTCE asks which is which."
    )
}

// MARK: - Day 18 Questions

extension RimrockQuestion {

    static let day18_errorReporting = RimrockQuestion(
        id: "D18_ERROR_REPORTING",
        domain: .patientSafety,
        topic: "ERROR_REPORTING",
        prompt: "Which is true about medication error reporting in pharmacy?",
        options: [
            "Reporting near-misses is as important as reporting actual errors that reached the patient",
            "Only errors that harm patients should be reported",
            "Internal reporting is sufficient; no external reporting is needed",
            "Errors caught before reaching the patient don't need to be documented"
        ],
        correctAnswer: "Reporting near-misses is as important as reporting actual errors that reached the patient",
        onCorrect: "Near-misses matter as much as harm events. Most catastrophic errors had near-miss precursors that weren't reported. ISMP and Joint Commission both emphasize: count and analyze near-misses to fix systems before harm happens. Internal reporting (incident logs) feeds external voluntary reporting (ISMP MERP) and mandatory reporting (state board, FDA MedWatch for drug-related events). The reporting culture is what catches systemic issues.",
        onWrong: "Near-misses matter. Catastrophic errors usually have near-miss precursors that nobody reported. Internal reporting (incident logs) → external (ISMP MERP voluntary, MedWatch for FDA, state board for licensure events). Reporting culture is what makes systems safer. Punishing error reports kills safety culture; that's why Just Culture exists."
    )

    static let day18_justCulture = RimrockQuestion(
        id: "D18_JUST_CULTURE",
        domain: .patientSafety,
        topic: "JUST_CULTURE",
        prompt: "In Just Culture, how should an organization respond to a human error (slip, lapse) by an employee?",
        options: [
            "Console the employee; investigate the system that allowed the error",
            "Discipline the employee to deter future errors",
            "Take no action; errors are inevitable",
            "Suspend pharmacy operations until error rate is zero"
        ],
        correctAnswer: "Console the employee; investigate the system that allowed the error",
        onCorrect: "Console the human, investigate the system. Just Culture distinguishes: human error (slip/lapse — console), at-risk behavior (rule cut from convenience — coach), reckless behavior (knowing disregard — discipline). Punishing human error kills reporting and makes systems less safe. Punishing reckless behavior is appropriate. The middle category — at-risk — is where most errors actually live, and coaching reshapes the system more than discipline does.",
        onWrong: "Console the employee, investigate the system. Just Culture's three categories: human error (console), at-risk behavior (coach), reckless behavior (discipline). Most errors are categories one and two. Discipline category three — knowing disregard of rules — but spare categories one and two, because punishing them kills error reporting and makes the next error worse."
    )

    static let day18_rootCause = RimrockQuestion(
        id: "D18_ROOT_CAUSE",
        domain: .patientSafety,
        topic: "ROOT_CAUSE_ANALYSIS",
        prompt: "Root cause analysis (RCA) seeks to identify...?",
        options: [
            "Underlying system factors that allowed the error to occur",
            "Which employee to blame for the error",
            "Whether the patient was harmed",
            "Whether to file an insurance claim"
        ],
        correctAnswer: "Underlying system factors that allowed the error to occur",
        onCorrect: "System factors. Why did the look-alike sound-alike pair sit next to each other on the shelf? Why did the prescriber's handwriting confuse the entry tech? Why didn't the DUR alert fire? Why did the verifying pharmacist miss it? RCA traces backward through process failures, environmental factors, and policy gaps — not toward an individual to blame. Joint Commission requires RCA for sentinel events.",
        onWrong: "System factors, not individuals. Why was the LASA pair shelved together? Why did handwriting confuse the entry tech? Why didn't the DUR fire? Why did verification miss it? RCA traces process, environment, policy — finds the system holes that aligned for harm. Joint Commission requires RCA for sentinel events."
    )

    static let day18_jointCommission = RimrockQuestion(
        id: "D18_JOINT_COMMISSION",
        domain: .patientSafety,
        topic: "JOINT_COMMISSION_NPSG",
        prompt: "Which of the following is a Joint Commission National Patient Safety Goal (NPSG) directly relevant to medication safety?",
        options: [
            "Use at least two patient identifiers when administering medications",
            "Limit pharmacy inventory to 100 unique drugs",
            "Restrict prescribing to physicians only",
            "Eliminate all generic substitutions"
        ],
        correctAnswer: "Use at least two patient identifiers when administering medications",
        onCorrect: "Two patient identifiers — name and date of birth, typically. Joint Commission NPSGs are updated annually; medication-specific ones include: label all medications and containers, reduce harm from anticoagulant therapy, reconcile medications across the continuum of care, use look-alike sound-alike protections. The NPSGs are the floor — accreditation depends on demonstrated compliance.",
        onWrong: "Two patient identifiers. Joint Commission NPSGs include: label all medications, reduce anticoagulant harm, reconcile across care transitions, address LASA, identify patient safety risks. Accreditation depends on compliance. Updated annually — current versions on the Joint Commission website."
    )
}

// MARK: - Day 19 Questions

extension RimrockQuestion {

    static let day19_correspondingResponsibility = RimrockQuestion(
        id: "D19_CORRESP_RESPONSIBILITY",
        domain: .federalRequirements,
        topic: "CORRESPONDING_RESPONSIBILITY",
        prompt: "Under 21 CFR 1306.04, the dispensing pharmacist's \"corresponding responsibility\" requires verifying which of the following before dispensing a controlled substance?",
        options: [
            "That the prescription was issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice",
            "Only that the prescription is properly signed",
            "Only that the patient has insurance coverage",
            "Only that the prescriber has a valid DEA number"
        ],
        correctAnswer: "That the prescription was issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice",
        onCorrect: "Legitimate medical purpose, usual course of practice. The phrase \"knew or should have known\" is the legal standard. A clean DEA number alone isn't enough; the prescription as a whole has to be defensible. Pharmacist who dispenses a script that should have been recognized as illegitimate shares felony liability with the prescriber.",
        onWrong: "Legitimate medical purpose by a practitioner in usual course of practice. Just a valid DEA isn't enough — pharmacist must evaluate the whole script. \"Knew or should have known\" — felony exposure. Corresponding responsibility is the regulation behind every PMP check, every red-flag review, every refusal."
    )

    static let day19_redFlagsRefusal = RimrockQuestion(
        id: "D19_RED_FLAGS_REFUSAL",
        domain: .patientSafety,
        topic: "RED_FLAGS_DOCUMENTATION",
        prompt: "When refusing to dispense a controlled-substance prescription due to red flags, what should be documented?",
        options: [
            "All red flags identified, time of refusal, prescriber contact attempts, pharmacist's reasoning, initials",
            "Only the patient name and the refusal",
            "Only the date of refusal",
            "Nothing — refusals don't require documentation"
        ],
        correctAnswer: "All red flags identified, time of refusal, prescriber contact attempts, pharmacist's reasoning, initials",
        onCorrect: "All of it. Red flags identified, prescriber contact attempts (with date/time/result), pharmacist's reasoning, your initials. Documentation protects the pharmacist legally if challenged and feeds investigations. Keep originals on-site, copies off-site if your policy allows. The refusal documentation is the difference between a regulatory body believing you and a regulatory body asking why you didn't fill.",
        onWrong: "Comprehensive documentation — every red flag, contact attempts, reasoning, initials, time. Documentation protects you legally and feeds the investigation. Refusal without paperwork is hard to defend; refusal with paperwork is bulletproof."
    )

    static let day19_refusalDocumentation = RimrockQuestion(
        id: "D19_REFUSAL_DOC",
        domain: .orderEntry,
        topic: "REFUSAL_RECORDS",
        prompt: "A controlled-substance prescription is refused. What happens to the original prescription document?",
        options: [
            "Retain the original on file with refusal documentation; do not return it to the patient",
            "Return it to the patient",
            "Forward it to the prescriber",
            "Destroy it immediately"
        ],
        correctAnswer: "Retain the original on file with refusal documentation; do not return it to the patient",
        onCorrect: "Retain on file with documentation. Returning a fraudulent or suspicious script to the patient lets them try elsewhere; it's also evidence in any investigation. Original stays. Refusal note (date, time, reasoning, initials) attached. If the prescriber requests it later for their records, copy goes to them; original remains with pharmacy.",
        onWrong: "Retain on file. Don't return it — the patient will try another pharmacy. Don't destroy it — it's evidence. Original stays with refusal documentation; copy can go to prescriber on request."
    )

    static let day19_suspiciousOrderMonitoring = RimrockQuestion(
        id: "D19_SOM",
        domain: .federalRequirements,
        topic: "SUSPICIOUS_ORDER_MONITORING",
        prompt: "Under DEA's Suspicious Order Monitoring (SOM) requirements, when must a pharmacy report a suspicious order?",
        options: [
            "When the order or pattern of orders deviates from established norms in size, frequency, or pattern",
            "Only when a controlled substance is stolen",
            "Only at the biennial inventory",
            "Suspicious order monitoring is voluntary"
        ],
        correctAnswer: "When the order or pattern of orders deviates from established norms in size, frequency, or pattern",
        onCorrect: "Deviation from established norms — size, frequency, pattern. SUPPORT Act of 2018 codified what DEA had been saying for years. Pharmacies and wholesalers must identify and report suspicious orders. Failure to do so has cost wholesalers nine-figure penalties. The criteria are deliberately flexible — no single threshold — but the obligation is concrete.",
        onWrong: "Deviation from established norms — size, frequency, pattern. SUPPORT Act 2018 codified the requirement. Pharmacy obligation, not voluntary. The criteria are flexible but the requirement is firm. Failure to monitor and report has cost wholesalers and pharmacies nine-figure settlements."
    )
}

// MARK: - Day 20 Questions

extension RimrockQuestion {

    static let day20_dilutionMath = RimrockQuestion(
        id: "D20_DILUTION_MATH",
        domain: .orderEntry,
        topic: "DILUTION_C1V1_C2V2",
        prompt: "You need 240 mL of a 25 mg/mL oral suspension. You have 50 mg/mL stock. How much stock and how much diluent?",
        options: [
            "120 mL stock + 120 mL diluent",
            "60 mL stock + 180 mL diluent",
            "240 mL stock + 0 mL diluent",
            "30 mL stock + 210 mL diluent"
        ],
        correctAnswer: "120 mL stock + 120 mL diluent",
        onCorrect: "C₁V₁ = C₂V₂. 50 × V₁ = 25 × 240. V₁ = 120 mL of stock. Diluent = 240 − 120 = 120 mL. Always plausibility-check: half-strength final, so half stock makes sense.",
        onWrong: "C₁V₁ = C₂V₂. 50 × V₁ = 25 × 240 → V₁ = 120 mL stock. Diluent = 240 − 120 = 120 mL. Half-strength target means half the volume comes from stock. Plausibility-check every dilution problem."
    )

    static let day20_ivRate = RimrockQuestion(
        id: "D20_IV_RATE",
        domain: .orderEntry,
        topic: "IV_RATE_CALC",
        prompt: "Heparin 25,000 units in 250 mL D5W. Order: 18 units/kg/hour for an 80 kg patient. Rate in mL/hour?",
        options: ["14.4 mL/hr", "1.44 mL/hr", "144 mL/hr", "7.2 mL/hr"],
        correctAnswer: "14.4 mL/hr",
        onCorrect: "Dose: 18 × 80 = 1440 units/hr. Concentration: 25000 ÷ 250 = 100 units/mL. Rate: 1440 ÷ 100 = 14.4 mL/hr. Plausibility: 14.4 mL/hr × 24 = ~346 mL/day; bag is 250 mL so it lasts about 17 hours, which is reasonable for ongoing heparin.",
        onWrong: "Dose 18 × 80 = 1440 units/hr. Concentration 25,000/250 = 100 units/mL. Rate 1440/100 = 14.4 mL/hr. Always do plausibility — if you said \"infuse 250 mL bag in 7 minutes,\" you did it wrong."
    )

    static let day20_serotoninSyndrome = RimrockQuestion(
        id: "D20_SEROTONIN_SYNDROME",
        domain: .patientSafety,
        topic: "SEROTONIN_SYNDROME",
        prompt: "A patient on sertraline (SSRI) is started on linezolid. The pharmacist's concern is...?",
        options: [
            "Serotonin syndrome",
            "QT prolongation",
            "Hyperkalemia",
            "Hypoglycemia"
        ],
        correctAnswer: "Serotonin syndrome",
        onCorrect: "Serotonin syndrome. Linezolid is a weak MAOI — combining with serotonergic drugs (SSRIs, SNRIs, triptans, MAOIs, tramadol, methylene blue, St. John's wort) causes excess serotonin: agitation, hyperthermia, tachycardia, clonus, rigidity. Severe cases fatal. Common offenders to memorize: linezolid, tramadol, MAOIs, methylene blue, triptans, St. John's wort, MDMA.",
        onWrong: "Serotonin syndrome. Linezolid + SSRI = MAOI-like combo + serotonin reuptake inhibition. Symptoms: agitation, hyperthermia, tachycardia, clonus, rigidity. Severe = fatal. The combinations to know: linezolid, tramadol, MAOIs, methylene blue, triptans, St. John's wort with any serotonergic agent."
    )

    static let day20_pediConversion = RimrockQuestion(
        id: "D20_PEDI_CONVERSION",
        domain: .orderEntry,
        topic: "PEDIATRIC_DOSING",
        prompt: "A child weighs 35 lb. Acetaminophen suspension 160 mg/5 mL. Order: 15 mg/kg/dose. Dispense per dose?",
        options: ["7.5 mL", "5 mL", "10 mL", "2.5 mL"],
        correctAnswer: "7.5 mL",
        onCorrect: "35 lb ÷ 2.2 = ~15.9 kg → 16 kg. 16 × 15 mg = 240 mg/dose. 240 mg ÷ 160 mg × 5 mL = 7.5 mL. Always do pediatric math twice; pediatric dose calculations and insulin units are the most common math errors in retail.",
        onWrong: "7.5 mL. 35 lb / 2.2 = ~16 kg. 16 × 15 = 240 mg per dose. 240/160 × 5 = 7.5 mL. Pediatric math = double-check. Many drug errors involving children trace back to a fast lb→kg conversion or a slipped decimal. Slow down."
    )
}

