import Foundation

// Phase 13 — Federal Requirements Final Gap Fill
// 10 nodes covering REMS, recalls, Rx label, CII fax, DEA analogue act,
// DSCSA, IND, Schedule V OTC, compounding violations, pharmacist supervision

let multiAngleNodes_D2e: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "REMS PROGRAMS / REQUIREMENTS",
        loreText: "REMS (Risk Evaluation and Mitigation Strategy): FDA-mandated programs for high-risk drugs to ensure benefits outweigh risks. Elements may include Medication Guide, communication plan, ETASU (Elements to Assure Safe Use) such as registry enrollment, pharmacy certification, or lab monitoring. Examples: iPLEDGE (isotretinoin), TIRF REMS (transmucosal fentanyl), clozapine REMS.",
        challengeType: .multipleChoice,
        options: [
            "A. REMS programs are FDA-mandated for high-risk drugs and may require pharmacy certification and ETASU",
            "B. REMS programs are optional and pharmacies may opt out without consequence",
            "C. REMS only applies to Schedule II controlled substances",
            "D. REMS programs replace state pharmacy board requirements"
        ],
        correctAnswer: "A. REMS programs are FDA-mandated for high-risk drugs and may require pharmacy certification and ETASU",
        xOffset: 0.08,
        yOffset: 0.850,
        baseConceptTitle: "REMS Programs"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DRUG RECALL CLASSES / PROCESS",
        loreText: "FDA drug recalls: Class I — reasonable probability of serious health consequences or death (most serious). Class II — may cause temporary adverse health effects; remote probability of serious harm. Class III — unlikely to cause adverse effects. Market withdrawal: not a safety issue. Mock recalls test pharmacy recall systems.",
        challengeType: .multipleChoice,
        options: [
            "A. Class I recall: reasonable probability of serious health consequences or death — most critical",
            "B. Class I recall is the least serious — only affects packaging defects",
            "C. All drug recalls require a Class I designation by the FDA",
            "D. Class III recalls always require immediate product removal from all dispensing"
        ],
        correctAnswer: "A. Class I recall: reasonable probability of serious health consequences or death — most critical",
        xOffset: 0.12,
        yOffset: 0.850,
        baseConceptTitle: "Drug Recall Classes"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PRESCRIPTION LABEL / REQUIRED ELEMENTS",
        loreText: "Federal law requires Rx labels to contain: pharmacy name and address, Rx serial number, date filled, patient name, prescriber name, drug name and strength, quantity, directions for use, refills remaining, pharmacist's initials, and expiration date. State law may add additional requirements.",
        challengeType: .multipleChoice,
        options: [
            "A. Pharmacy name/address, Rx number, fill date, patient and prescriber name, drug, quantity, directions, refills",
            "B. Only the patient name, drug name, and directions are federally required on prescription labels",
            "C. The prescriber's DEA number must appear on every Rx label",
            "D. The drug NDC number is the only federally required identifier on the label"
        ],
        correctAnswer: "A. Pharmacy name/address, Rx number, fill date, patient and prescriber name, drug, quantity, directions, refills",
        xOffset: 0.16,
        yOffset: 0.850,
        baseConceptTitle: "Prescription Label Requirements"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "CII FAX PRESCRIPTIONS / EXCEPTIONS",
        loreText: "Under federal law, CII prescriptions generally cannot be faxed as the sole authorization for dispensing. Exceptions where fax IS the original: (1) home infusion/IV therapy, (2) long-term care facilities (LTCF), (3) hospice patients. The original written Rx must still be presented before dispensing in all other cases.",
        challengeType: .multipleChoice,
        options: [
            "A. Fax is valid as original CII Rx for home infusion, LTCF, and hospice patients",
            "B. Faxed CII prescriptions are always valid as originals in any setting",
            "C. Faxed CII prescriptions are never permitted under any circumstances",
            "D. Fax is valid for CII only in hospital emergency settings"
        ],
        correctAnswer: "A. Fax is valid as original CII Rx for home infusion, LTCF, and hospice patients",
        xOffset: 0.20,
        yOffset: 0.850,
        baseConceptTitle: "CII Fax Prescriptions"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "FEDERAL ANALOGUE ACT / DESIGNER DRUGS",
        loreText: "The Federal Analogue Act (FAA, part of CSA) treats substances substantially similar in chemical structure or pharmacological effect to a Schedule I or II drug as Schedule I for human consumption purposes. Targets 'designer drugs' and novel psychoactive substances (NPS). Examples: bath salts, synthetic cannabinoids.",
        challengeType: .multipleChoice,
        options: [
            "A. The Federal Analogue Act treats designer drugs substantially similar to Schedule I/II as Schedule I for human use",
            "B. Designer drugs are not regulated under federal law until explicitly scheduled",
            "C. The Federal Analogue Act only applies to Schedule III substances",
            "D. Synthetic cannabinoids are exempt from the Federal Analogue Act"
        ],
        correctAnswer: "A. The Federal Analogue Act treats designer drugs substantially similar to Schedule I/II as Schedule I for human use",
        xOffset: 0.24,
        yOffset: 0.850,
        baseConceptTitle: "Federal Analogue Act"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DSCSA / DRUG SUPPLY CHAIN SECURITY",
        loreText: "Drug Supply Chain Security Act (DSCSA, 2013): requires track-and-trace of prescription drugs through the supply chain. All manufacturers, repackagers, wholesale distributors, and dispensers must maintain transaction information (TI), transaction history (TH), and transaction statements (TS) — the 'T3.' Electronic tracking (interoperable) required by 2023-2026 phase-in.",
        challengeType: .multipleChoice,
        options: [
            "A. DSCSA requires track-and-trace of Rx drugs with transaction information, history, and statements (T3)",
            "B. DSCSA only applies to manufacturers, not pharmacy dispensers",
            "C. DSCSA requires tracking of all OTC products in addition to prescription drugs",
            "D. DSCSA replaced all state drug pedigree laws with a voluntary program"
        ],
        correctAnswer: "A. DSCSA requires track-and-trace of Rx drugs with transaction information, history, and statements (T3)",
        xOffset: 0.28,
        yOffset: 0.850,
        baseConceptTitle: "DSCSA Drug Supply Chain"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "IND APPLICATION / INVESTIGATIONAL DRUGS",
        loreText: "Investigational New Drug (IND) application submitted to FDA before human clinical trials begin. Types: Sponsor IND (pharmaceutical company), Investigator IND (clinician-researcher), Emergency IND (compassionate use). Allows shipping of unapproved drugs across state lines. Pharmacy may compound and dispense under IND protocol.",
        challengeType: .multipleChoice,
        options: [
            "A. IND application must be submitted to FDA before human clinical trials and allows interstate shipment of unapproved drugs",
            "B. IND application is submitted after Phase III trials are completed",
            "C. An IND is only required for Phase III clinical trials",
            "D. IND approval allows immediate market distribution of the investigational drug"
        ],
        correctAnswer: "A. IND application must be submitted to FDA before human clinical trials and allows interstate shipment of unapproved drugs",
        xOffset: 0.32,
        yOffset: 0.850,
        baseConceptTitle: "IND Application"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "SCHEDULE V OTC SALES / REGULATIONS",
        loreText: "Some Schedule V products (e.g., cough preparations with <200 mg codeine per 100 mL) may be sold OTC without a prescription in states that allow it. Requirements: purchaser must be 18+, show ID, sign a log book, max 240 mL (or 48 solid dosage units) per 48 hours. Pharmacist must be on duty.",
        challengeType: .multipleChoice,
        options: [
            "A. Schedule V OTC sales require ID, purchaser 18+, logbook signature, and pharmacist on duty",
            "B. Schedule V products can be sold to anyone without documentation",
            "C. Schedule V drugs require a valid prescription in all states",
            "D. There is no purchase quantity limit for Schedule V OTC products"
        ],
        correctAnswer: "A. Schedule V OTC sales require ID, purchaser 18+, logbook signature, and pharmacist on duty",
        xOffset: 0.36,
        yOffset: 0.850,
        baseConceptTitle: "Schedule V OTC Sales"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PHARMACIST SUPERVISION / TECH RATIOS",
        loreText: "Federal law does not mandate a specific pharmacist-to-technician ratio. Ratios are set by individual state pharmacy practice acts. However, federal regulations require pharmacist supervision of all dispensing activities. In most states, ratios range from 1:1 to 1:4 (pharmacist:technicians) depending on whether technicians are certified.",
        challengeType: .multipleChoice,
        options: [
            "A. Pharmacist-to-technician ratios are set by state law; federal law requires pharmacist supervision of dispensing",
            "B. Federal law mandates a maximum 1:2 pharmacist-to-technician ratio nationwide",
            "C. No pharmacist supervision is required for certified pharmacy technicians",
            "D. Federal law sets the ratio at 1:4 for all pharmacy settings"
        ],
        correctAnswer: "A. Pharmacist-to-technician ratios are set by state law; federal law requires pharmacist supervision of dispensing",
        xOffset: 0.40,
        yOffset: 0.850,
        baseConceptTitle: "Pharmacist Supervision Ratios"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "COMPOUNDING / ENFORCEMENT AND VIOLATIONS",
        loreText: "FDA vs state jurisdiction: traditional compounding (503A) is primarily state-regulated but FDA can act if: interstate distribution, manufacturing without patient-specific Rx, or using bulk chemicals not on FDA-approved list. Outsourcing facilities (503B) are FDA-regulated. Compounding violations can result in warning letters, consent decrees, or criminal prosecution.",
        challengeType: .multipleChoice,
        options: [
            "A. FDA can regulate 503A compounders who sell across state lines or compound without patient-specific Rx",
            "B. 503A compounding pharmacies are exclusively regulated by FDA, not state boards",
            "C. Compounding violations never result in criminal prosecution",
            "D. 503B outsourcing facilities are regulated by state pharmacy boards only"
        ],
        correctAnswer: "A. FDA can regulate 503A compounders who sell across state lines or compound without patient-specific Rx",
        xOffset: 0.44,
        yOffset: 0.850,
        baseConceptTitle: "Compounding Enforcement"
    ),
]
