import Foundation

// Multi-Angle Phase 12 — Federal Requirements Gap Fill II
// 10 nodes — all with full MCQ content

let multiAngleNodes_D2d: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "MEDICARE PARTS A/B/C/D",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > PART A: Hospital insurance — inpatient, skilled nursing, hospice, home health. Premium-free for most.
        > PART B: Medical insurance — outpatient, physician visits, preventive services, DME, some drugs (administered in office). Monthly premium required.
        > PART C (Medicare Advantage): Private insurance alternative that covers A+B (often includes D). Run by approved private plans.
        > PART D: Outpatient prescription drug benefit — through private PDPs or Medicare Advantage PDPs. Optional premium; low-income subsidy (LIS/Extra Help) available.
        > DONUT HOLE (Coverage Gap): Eliminated for catastrophic coverage under IRA 2022 reforms.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Medicare Part B covers outpatient prescription drug benefits dispensed at pharmacies",
            "B. Medicare Part A = hospital; Part B = outpatient/physician/some IV drugs administered in office; Part C = Medicare Advantage (combines A+B+often D); Part D = outpatient prescription drug benefit at pharmacy",
            "C. Medicare Part D is mandatory for all Medicare beneficiaries and enrollment is automatic",
            "D. Medicare Part C (Medicare Advantage) only covers hospital services without outpatient coverage"
        ],
        correctAnswer: "B. Medicare Part A = hospital; Part B = outpatient/physician/some IV drugs administered in office; Part C = Medicare Advantage (combines A+B+often D); Part D = outpatient prescription drug benefit at pharmacy",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.10,
        angle: .classification,
        baseConceptTitle: "MEDICARE PARTS"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "BIOSIMILARS — PURPLE BOOK",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > BIOSIMILAR: Biological product highly similar to FDA-approved reference biologic (no clinically meaningful differences in safety/efficacy).
        > INTERCHANGEABLE: FDA designation — biosimilar can be substituted for reference product without prescriber intervention (like generic for small-molecule drugs).
        > PURPLE BOOK: FDA's list of licensed biological products (biosimilars + interchangeables) — analogous to Orange Book for generics.
        > NAMING: Biosimilars have same core name + 4-letter suffix (e.g., filgrastim-aafi) to distinguish products.
        > STATE LAW: Governs actual substitution at pharmacy level — notification to prescriber usually required.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. All biosimilars are automatically interchangeable with their reference biologic product",
            "B. Biosimilars require FDA approval showing high similarity to reference biologic; only FDA-designated 'interchangeable' biosimilars may be substituted without prescriber approval; listed in Purple Book with 4-letter suffix",
            "C. The Purple Book lists generic small-molecule drugs that can be substituted for brand-name products",
            "D. Biosimilars have identical names to their reference biologics to ensure seamless substitution"
        ],
        correctAnswer: "B. Biosimilars require FDA approval showing high similarity to reference biologic; only FDA-designated 'interchangeable' biosimilars may be substituted without prescriber approval; listed in Purple Book with 4-letter suffix",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.10,
        angle: .classification,
        baseConceptTitle: "BIOSIMILARS"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DRUG SHORTAGE MANAGEMENT",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > DRUG SHORTAGE: Insufficient supply of an FDA-regulated drug to meet US demand.
        > FDA AUTHORITY: FDASIA (2012) requires manufacturers to notify FDA of potential shortages ≥6 months in advance; FDA maintains public shortage database.
        > PHARMACIST ROLE: Identify alternatives (therapeutic substitution with prescriber); document rationing protocols; prioritize critical patients.
        > 503B OUTSOURCING: During shortages, FDA may allow 503B outsourcing facilities to compound shortage drugs.
        > DOCUMENTATION: All shortage-related substitutions must be documented with prescriber notification.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pharmacists can make therapeutic substitutions during drug shortages without prescriber notification",
            "B. FDA maintains drug shortage database; pharmacists must identify alternatives and document substitutions with prescriber notification; 503B facilities may compound shortage drugs with FDA permission",
            "C. Drug shortage notifications to FDA are only required after a shortage has occurred",
            "D. During drug shortages, pharmacists may independently change a patient's medication without any documentation"
        ],
        correctAnswer: "B. FDA maintains drug shortage database; pharmacists must identify alternatives and document substitutions with prescriber notification; 503B facilities may compound shortage drugs with FDA permission",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.28,
        angle: .mechanism,
        baseConceptTitle: "DRUG SHORTAGE"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "VAERS — VACCINE ADVERSE EVENT REPORTING",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > VAERS: Vaccine Adverse Event Reporting System — national vaccine safety surveillance system.
        > MANAGED BY: CDC and FDA jointly.
        > WHO REPORTS: Anyone — healthcare providers, patients, manufacturers, caregivers.
        > WHAT TO REPORT: Any adverse event occurring after vaccination (not necessarily caused by vaccine — passive surveillance).
        > MANDATORY REPORTING: Vaccines under the National Childhood Vaccine Injury Act (NCVIA) — healthcare providers must report specified adverse events.
        > VIS: Vaccine Information Statements — CDC-required handout given before each federally-recommended vaccine.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. VAERS reports only vaccine adverse events that are confirmed to be caused by the vaccine",
            "B. VAERS accepts reports from anyone (patients, providers, manufacturers) for any adverse event after vaccination (not necessarily causal); providers must report specified events for NCVIA vaccines; VIS required before each vaccine",
            "C. Only FDA staff can submit adverse event reports to VAERS",
            "D. Vaccine Information Statements (VIS) are optional documents given at physician request only"
        ],
        correctAnswer: "B. VAERS accepts reports from anyone (patients, providers, manufacturers) for any adverse event after vaccination (not necessarily causal); providers must report specified events for NCVIA vaccines; VIS required before each vaccine",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.28,
        angle: .indication,
        baseConceptTitle: "VAERS"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DSHEA — DIETARY SUPPLEMENT REGULATION",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > DSHEA: Dietary Supplement Health and Education Act (1994) — regulates dietary supplements.
        > KEY POINT: Supplements are NOT regulated like drugs — manufacturers do NOT need to prove safety or efficacy before marketing.
        > FDA ROLE: Post-market surveillance only — FDA must prove a supplement is unsafe to remove it.
        > CLAIMS: Structure/function claims allowed without FDA approval (e.g., 'supports immune health'); disease claims (e.g., 'cures cancer') require FDA review.
        > DISCLAIMER: 'This statement has not been evaluated by the FDA. This product is not intended to diagnose, treat, cure, or prevent any disease.'
        > GMP: Dietary supplement GMPs finalized 2007 — ensure identity/purity.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Under DSHEA, dietary supplement manufacturers must prove safety and efficacy before marketing",
            "B. DSHEA allows supplements to be marketed without pre-approval; FDA must prove harm to remove them; structure/function claims allowed without FDA review; disease claims require FDA approval",
            "C. The FDA regulates dietary supplements with the same rigor as prescription drugs",
            "D. All health claims for dietary supplements require FDA approval and clinical trial data"
        ],
        correctAnswer: "B. DSHEA allows supplements to be marketed without pre-approval; FDA must prove harm to remove them; structure/function claims allowed without FDA review; disease claims require FDA approval",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.46,
        angle: .mechanism,
        baseConceptTitle: "DSHEA"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PBM — PHARMACY BENEFIT MANAGER",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > PBM: Third-party administrator that manages prescription drug benefits for insurers/employers.
        > FUNCTIONS: Formulary development, pharmacy network contracting, claims processing, mail-order pharmacy, drug utilization management, rebate negotiation with manufacturers.
        > FORMULARY: Tiered drug list — Tier 1 (lowest copay, preferred generics) to Tier 3+ (non-preferred brands, specialty).
        > PRIOR AUTHORIZATION (PA): Insurer requires clinical justification before covering certain drugs.
        > STEP THERAPY: Must try preferred (cheaper) drug first before coverage of non-preferred drug.
        > SPREAD PRICING: PBM charges plan more than it reimburses pharmacy — controversial practice.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. PBMs are federal agencies that regulate drug pricing on behalf of the FDA",
            "B. PBMs manage drug benefits for insurers (formulary, network, claims, mail-order); formulary tiers determine copay; prior authorization and step therapy are utilization management tools; spread pricing is a controversial PBM practice",
            "C. Tier 1 formulary drugs are the most expensive brand-name medications",
            "D. Step therapy requires patients to try the most expensive drug first before cheaper alternatives"
        ],
        correctAnswer: "B. PBMs manage drug benefits for insurers (formulary, network, claims, mail-order); formulary tiers determine copay; prior authorization and step therapy are utilization management tools; spread pricing is a controversial PBM practice",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.46,
        angle: .indication,
        baseConceptTitle: "PBM"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "EMERGENCY DISPENSING — WITHOUT RX",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > FEDERAL ALLOWANCES FOR EMERGENCY DISPENSING:
        >   CII emergency oral authorization: Prescriber may authorize verbal CII Rx; written Rx required within 7 days.
        >   Non-controlled: State laws vary — many allow limited emergency supply if Rx cannot be obtained.
        > NATURAL DISASTERS: FDA may grant emergency use authorization (EUA) to expand supply.
        > NALOXONE: Most states allow dispensing without patient-specific Rx via standing order.
        > HORMONAL CONTRACEPTIVES: Many states allow pharmacist to prescribe under standing order or CDTA.
        > STATE LAWS: Emergency dispensing of non-controlled substances is primarily governed by state law.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pharmacists may dispense any controlled substance in any emergency without any prescriber authorization",
            "B. CII emergency oral authorization allows verbal Rx with written follow-up within 7 days; naloxone and hormonal contraceptives available via standing orders in many states; emergency dispensing of non-CS is state-governed",
            "C. Written prescriptions for Schedule II drugs must always be obtained before any dispensing",
            "D. Natural disaster emergency dispensing is governed exclusively by DEA with no FDA involvement"
        ],
        correctAnswer: "B. CII emergency oral authorization allows verbal Rx with written follow-up within 7 days; naloxone and hormonal contraceptives available via standing orders in many states; emergency dispensing of non-CS is state-governed",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.64,
        angle: .mechanism,
        baseConceptTitle: "EMERGENCY DISPENSING"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "PHARMACY RECORD RETENTION",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > DEA RECORDS: Controlled substance records must be kept ≥2 years (federal minimum).
        > PRESCRIPTION RECORDS: Federal DEA requires CS Rx retention ≥2 years; many states require longer (common: 5–10 years).
        > CII RECORDS: Must be maintained separately or readily retrievable from CIII–CV records.
        > BIENNIAL INVENTORY: Required every 2 years for CS inventory; must document date, time, who conducted.
        > HIPAA: PHI (Protected Health Information) records — covered entities must retain 6 years from creation or last effective date.
        > ELECTRONIC RECORDS: EPCS records must be readily retrievable and backed up.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Federal DEA regulations require controlled substance records to be retained for only 1 year",
            "B. DEA requires CS records retained ≥2 years (federal minimum; states may require longer); CII records must be separate or readily retrievable; biennial CS inventory required every 2 years; HIPAA PHI: 6 years",
            "C. HIPAA requires patient health records to be retained for only 2 years",
            "D. Schedule III–V records must be stored in exactly the same location as Schedule II records"
        ],
        correctAnswer: "B. DEA requires CS records retained ≥2 years (federal minimum; states may require longer); CII records must be separate or readily retrievable; biennial CS inventory required every 2 years; HIPAA PHI: 6 years",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.64,
        angle: .classification,
        baseConceptTitle: "RECORD RETENTION"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "DRUG SCHEDULING CRITERIA — CSA",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > CSA: Controlled Substances Act — federal law establishing scheduling.
        > SCHEDULING CRITERIA:
        >   Schedule I: High abuse potential; no accepted medical use; not safe even under medical supervision (heroin, LSD, marijuana federally).
        >   Schedule II: High abuse potential; severe dependence; accepted medical use (opioids, stimulants, cocaine for anesthesia).
        >   Schedule III: Less abuse potential than I/II; moderate dependence (anabolic steroids, buprenorphine, ketamine).
        >   Schedule IV: Lower abuse potential (benzos, zolpidem, tramadol, pregabalin).
        >   Schedule V: Lowest CS abuse potential (cough preps with <200 mg codeine/100 mL, lacosamide).
        > SCHEDULING CHANGES: DEA proposes; HHS/FDA evaluates; DEA finalizes.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Schedule I drugs have accepted medical uses but require extra monitoring due to high abuse potential",
            "B. Schedule I = high abuse/no medical use (heroin, LSD); Schedule II = high abuse/medical use (opioids, stimulants); Schedule III-V decreasing abuse potential; buprenorphine, ketamine, and steroids are Schedule III",
            "C. Tramadol and pregabalin are Schedule II controlled substances",
            "D. DEA schedules drugs without any involvement from FDA or HHS"
        ],
        correctAnswer: "B. Schedule I = high abuse/no medical use (heroin, LSD); Schedule II = high abuse/medical use (opioids, stimulants); Schedule III-V decreasing abuse potential; buprenorphine, ketamine, and steroids are Schedule III",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.20,
        yOffset: 0.82,
        angle: .classification,
        baseConceptTitle: "DRUG SCHEDULING"
    ),

    DataNode(
        id: UUID(),
        domain: .federalRequirements,
        nodeTitle: "FORMULARY MANAGEMENT — HOSPITAL/PBM",
        loreText: """
        > SECTOR-02 // FEDERAL REQUIREMENTS
        > FORMULARY: List of medications covered or preferred by a health plan or institution.
        > HOSPITAL FORMULARY: Managed by Pharmacy & Therapeutics (P&T) Committee — includes pharmacists, physicians, nurses, administrators.
        > P&T COMMITTEE: Reviews new drugs, updates formulary, develops drug use policies, manages drug shortages.
        > THERAPEUTIC SUBSTITUTION: Switching to therapeutically equivalent drug on formulary (requires prescriber approval or CDTA).
        > GENERIC SUBSTITUTION: Replacing brand with AB-rated generic (allowed by law without prescriber approval in most states unless DAW-1).
        > CLOSED vs OPEN: Closed = strict formulary; Open = covers all drugs with tiered copays.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Hospital P&T committees are run exclusively by physicians without pharmacist input",
            "B. P&T Committee (including pharmacists) manages hospital formulary, reviews new drugs, develops policies; therapeutic substitution requires prescriber approval; generic substitution (AB-rated) allowed without prescriber approval unless DAW-1",
            "C. Therapeutic substitution and generic substitution are legally identical processes",
            "D. An open formulary means no drugs are covered — patients pay all costs out-of-pocket"
        ],
        correctAnswer: "B. P&T Committee (including pharmacists) manages hospital formulary, reviews new drugs, develops policies; therapeutic substitution requires prescriber approval; generic substitution (AB-rated) allowed without prescriber approval unless DAW-1",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.82,
        angle: .indication,
        baseConceptTitle: "FORMULARY MANAGEMENT"
    ),
]
