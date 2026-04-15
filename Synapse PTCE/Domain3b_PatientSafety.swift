//
//  Domain3b_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 3 Expansion: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  8 additional nodes covering the most-tested safety gaps:
//  USP 795 (non-sterile compounding), USP 797 (sterile compounding),
//  USP 800 (hazardous drugs), Beers Criteria, vaccine storage, medication
//  reconciliation, anticoagulation monitoring, and pediatric safety.
//

import Foundation

extension DataNode {

    // MARK: - Domain 3b Node Set

    static let domain3bNodes: [DataNode] = [

        // ── 15 ── USP 795 — NON-STERILE COMPOUNDING ─────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 795",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > AUTHORITY: USP General Chapter <795> — Pharmaceutical Compounding:
            >   Nonsterile Preparations
            >
            > APPLIES TO: Any preparation made in a pharmacy that:
            >   — Is NOT sterile (not injectable, ophthalmic, inhalation)
            >   — Is compounded for a specific patient/prescription
            >   Examples: Oral suspensions, topical creams, ointments, suppositories,
            >   capsules, troches, oral solutions
            >
            > BEYOND-USE DATE (BUD) — USP 795 (effective November 2023):
            >   BUDs are now assigned by CATEGORY based on conditions of use:
            >
            >   Category 1 (NO stability data; BUD based on conservative defaults):
            >     Non-aqueous formulations:    ≤ 180 days (room temp or refrigerator)
            >     Aqueous formulations:         ≤ 14 days (refrigerator, 2–8°C)
            >     Water-containing oral:        ≤ 14 days refrigerated
            >     Water-containing topical/mucosal:  ≤ 30 days
            >
            >   Category 2 (WITH stability data supporting longer BUDs):
            >     BUD may be extended based on documented stability studies.
            >
            > COMPOUNDING REQUIREMENTS:
            >   — Master formulation record (MFR): The master recipe for a compound.
            >   — Compounding record (CR): Batch record for each preparation made.
            >   — Must label with: patient name, BUD, storage conditions, lot #, RPh initials.
            >   — Appearance inspection: proper color, consistency, smell.
            >
            > ENVIRONMENT: Routine non-sterile compounding does NOT require a clean room.
            >   However, designated compounding area with controlled cleanliness is required.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 7 days at room temperature — all non-sterile compounds have a 1-week BUD",
                "B) 180 days at room temperature for all compounded preparations without exception",
                "C) 14 days refrigerated for water-containing (aqueous) formulations without stability data",
                "D) 30 days at room temperature for any oral non-sterile preparation"
            ],
            correctAnswer: "C) 14 days refrigerated for water-containing (aqueous) formulations without stability data",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.08
        ),

        // ── 16 ── USP 797 — STERILE COMPOUNDING ─────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 797",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > AUTHORITY: USP General Chapter <797> — Pharmaceutical Compounding: Sterile
            >   Preparations (major revision effective November 2023)
            >
            > APPLIES TO: All sterile preparations compounded in pharmacies:
            >   IV admixtures, epidural injections, ophthalmic drops (compounded),
            >   irrigation solutions, intrathecal preparations, inhalation solutions.
            >
            > CLEANROOM ENVIRONMENT — ISO CLASSIFICATIONS:
            >   ISO 5 (Class 100): Primary engineering control (PEC) — where sterile work
            >     happens. Examples: Laminar airflow workbench (LAFW) for non-hazardous;
            >     biosafety cabinet (BSC) for hazardous drugs.
            >   ISO 7 (Class 10,000): Buffer room — where the ISO 5 unit is located.
            >   ISO 8 (Class 100,000): Ante-room — gowning area before entering buffer room.
            >
            > GARBING ORDER (inner to outer, performed in ante-room):
            >   Shoe covers → hair cover → face mask → hand washing →
            >   sterile gown → sterile gloves
            >   (Gloves LAST; hands must be washed before gloving.)
            >
            > CATEGORY 1 CSPs (BEYOND-USE DATING — 2023 revision):
            >   No sterility testing; conservative defaults:
            >   ≤ 12 hours at controlled room temperature (CRT, 20–25°C)
            >   ≤ 24 hours refrigerated (2–8°C)
            >
            > CATEGORY 2 CSPs:
            >   Extended BUDs with sterility/endotoxin testing per USP 797 tables.
            >   Example: Up to 45 days refrigerated (with adequate testing).
            >
            > KEY CONCEPTS:
            >   — Aseptic technique is CRITICAL — no shortcuts.
            >   — Garbing, cleaning, and environmental monitoring are all required.
            >   — All CSPs must pass visual inspection before dispensing.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) ISO 8 — the highest-grade area where sterile manipulations occur",
                "B) ISO 5 — the primary engineering control (PEC) where sterile compounding is performed",
                "C) ISO 7 — the ante-room where personnel don gowns before entering",
                "D) ISO 3 — the ultra-clean room required for all injectable preparations"
            ],
            correctAnswer: "B) ISO 5 — the primary engineering control (PEC) where sterile compounding is performed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.16
        ),

        // ── 17 ── USP 800 — HAZARDOUS DRUG HANDLING ─────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "USP 800",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > AUTHORITY: USP General Chapter <800> — Hazardous Drugs: Handling in
            >   Healthcare Settings (effective December 2019)
            >
            > PURPOSE: Protect healthcare workers, patients, and the environment from
            >   exposure to hazardous drugs (HDs) — including antineoplastics, cytotoxics,
            >   reproductive hazards, and genotoxic drugs.
            >
            > NIOSH HAZARDOUS DRUG LIST:
            >   Published by NIOSH (CDC); updated regularly.
            >   Group 1: Antineoplastic agents (methotrexate, cyclophosphamide, paclitaxel)
            >   Group 2: Non-antineoplastic HDs (warfarin, finasteride, testosterone)
            >   Group 3: Reproductive risks only (estrogens, progestins, some antifungals)
            >
            > REQUIRED PERSONAL PROTECTIVE EQUIPMENT (PPE):
            >   — Chemotherapy-rated GLOVES (at minimum — double glove for antineoplastics)
            >   — Gown (chemo-resistant, not cloth lab coat)
            >   — Respiratory protection (N95 or powered air-purifying respirator — PAPR)
            >     when risk of aerosol/powder exposure
            >   — Eye/face protection (splash risk)
            >
            > ENGINEERING CONTROLS:
            >   COMPOUNDING antineoplastic HDs:
            >     — Class II Type B2 Biological Safety Cabinet (BSC) — negative pressure,
            >       external exhaust, ISO 5 environment.
            >     — Closed-System Drug-Transfer Devices (CSTDs) required for antineoplastics.
            >   RECEIVING/STORAGE of HDs:
            >     — Designated, labeled HD area.
            >     — NEGATIVE PRESSURE room (to contain any HD vapors/spills).
            >
            > SPILLAGE / EXPOSURE:
            >   Spill kit required. Deactivate, decontaminate, clean, dispose per protocol.
            >   Document all exposures. Report per facility policy.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Standard nitrile gloves and a cloth lab coat are sufficient PPE",
                "B) Chemotherapy-rated gloves and a chemo-resistant gown at minimum; CSTD required for antineoplastics",
                "C) A face shield and surgical mask are the only required PPE for hazardous drug compounding",
                "D) PPE is only required when compounding Group 1 antineoplastics; Group 2 needs no special handling"
            ],
            correctAnswer: "B) Chemotherapy-rated gloves and a chemo-resistant gown at minimum; CSTD required for antineoplastics",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.42,
            yOffset: 0.28
        ),

        // ── 18 ── BEERS CRITERIA ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BEERS CRITERIA",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > SOURCE: American Geriatrics Society (AGS) Beers Criteria®
            >   — Updated periodically (most recent: 2023)
            >   — Identifies potentially inappropriate medications (PIMs) in adults ≥ 65 years
            >
            > PURPOSE: Reduce adverse drug events, falls, hospitalizations, and
            >   polypharmacy harm in older adults. NOT a rigid prohibition — clinical
            >   judgment applies — but these drugs carry increased risk in elderly.
            >
            > DRUGS TO AVOID IN ADULTS ≥ 65 (high-yield PTCB examples):
            >
            >   ANTICHOLINERGICS (all high-risk in elderly):
            >     diphenhydramine (Benadryl) — delirium, confusion, falls, urinary retention
            >     hydroxyzine (Vistaril) — same anticholinergic burden
            >     oxybutynin (Ditropan) — avoid oral form; patch has less CNS penetration
            >     tricyclic antidepressants (amitriptyline, imipramine)
            >
            >   CNS DEPRESSANTS:
            >     Benzodiazepines (all) — confusion, falls, fractures, paradoxical agitation
            >     Non-benzodiazepine sleep aids (zolpidem/Ambien, eszopiclone/Lunesta,
            >     zaleplon/Sonata) — "Z-drugs" — same risks as benzos in elderly
            >     Opioids — fall risk; use with caution
            >
            >   NSAIDs (oral):
            >     GI bleeding, peptic ulcer disease, acute kidney injury, fluid retention.
            >     Use acetaminophen instead for pain in most elderly patients.
            >
            >   MUSCLE RELAXANTS:
            >     Cyclobenzaprine (Flexeril), carisoprodol (Soma), methocarbamol —
            >     poorly tolerated; sedation, confusion, fall risk.
            >
            >   SULFONYLUREAS (long-acting):
            >     Glibenclamide (glyburide) — high risk of prolonged hypoglycemia in elderly.
            >     Prefer glipizide or glimepiride (shorter-acting) if needed.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Cetirizine (Zyrtec) — all antihistamines are equally unsafe in the elderly",
                "B) Acetaminophen (Tylenol) — analgesics are always potentially inappropriate",
                "C) Diphenhydramine (Benadryl) — high anticholinergic burden; causes confusion and falls",
                "D) Lisinopril (Prinivil) — ACE inhibitors are on the Beers list for all elderly patients"
            ],
            correctAnswer: "C) Diphenhydramine (Benadryl) — high anticholinergic burden; causes confusion and falls",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.40
        ),

        // ── 19 ── VACCINE STORAGE & COLD CHAIN ──────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "VACCINE STORAGE",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > SOURCE: CDC Vaccine Storage & Handling Toolkit (VFC Program guidelines)
            >
            > TEMPERATURE RANGES:
            >   Refrigerated vaccines (2°C–8°C / 35°F–46°F):
            >   Frozen vaccines (−50°C to −15°C / −58°F to 5°F):
            >   Ultra-cold (Pfizer COVID-19 mRNA): −90°C to −60°C (storage before thaw)
            >
            > REFRIGERATED VACCINES (store at 2–8°C — NEVER freeze):
            >   Influenza (flu shot — inactivated), Hepatitis A, Hepatitis B,
            >   HPV (Gardasil 9), Tdap/Td, DTaP, Pneumococcal (PCV13, PCV15, PPSV23),
            >   Meningococcal (MenACWY, MenB), Hib, IPV (inactivated polio)
            >   FREEZE-SENSITIVE: These vaccines are DESTROYED by freezing.
            >
            > FROZEN VACCINES (store at −50 to −15°C):
            >   MMR (measles, mumps, rubella), Varicella (chickenpox),
            >   MMRV (ProQuad), Zoster (Zostavax — live; Shingrix is refrigerated)
            >
            > COLD CHAIN: Unbroken temperature-controlled supply chain from manufacturer
            >   to patient administration. Any temperature excursion must be documented
            >   and reported; affected vaccines quarantined pending evaluation.
            >
            > NEVER FREEZE REFRIGERATED VACCINES.
            >   Freeze-thaw damage (flocculation, aggregation) is not always visible.
            >   Frozen inactivated vaccines must be quarantined and NOT used.
            >
            > VFC PROGRAM: Vaccines for Children — federal entitlement; vaccines provided
            >   free to eligible children (uninsured, Medicaid, underinsured, Native American).
            >   Strict storage/handling compliance required to participate.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) MMR (measles-mumps-rubella) — it requires freezing at −15°C or below",
                "B) Inactivated influenza vaccine — it must be stored frozen until 24 hours before use",
                "C) Varicella (chickenpox) — it is a live vaccine requiring frozen storage",
                "D) Hepatitis B vaccine — it is most stable when stored in the freezer"
            ],
            correctAnswer: "C) Varicella (chickenpox) — it is a live vaccine requiring frozen storage",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.54
        ),

        // ── 20 ── MEDICATION RECONCILIATION ─────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "MED RECONCILIATION",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > SOURCE: The Joint Commission (TJC) National Patient Safety Goal NPSG.03.06.01
            >
            > MEDICATION RECONCILIATION:
            >   The formal process of creating the MOST ACCURATE LIST of all medications
            >   a patient is taking (including dose, frequency, route) and comparing it to
            >   the admission, transfer, or discharge medication orders.
            >
            > PURPOSE: Identify and RESOLVE DISCREPANCIES at care transitions:
            >   — Omission (a medication was left off the new order set)
            >   — Duplication (same drug ordered twice)
            >   — Dosing errors (wrong dose during transition)
            >   — Drug interactions from newly added medications
            >   — Contraindicated drugs (e.g., NSAID added to a patient on warfarin)
            >
            > CARE TRANSITIONS WHERE MED REC IS REQUIRED:
            >   Admission → hospital (from home or another facility)
            >   Transfer → different level of care (ICU to floor, floor to SNF)
            >   Discharge → home, assisted living, or another facility
            >
            > BEST POSSIBLE MEDICATION HISTORY (BPMH):
            >   Comprehensive medication history gathered by reviewing:
            >   — Patient/caregiver interview
            >   — Pharmacy dispensing records
            >   — Previous medical records
            >   — Pill bottles / blister packs the patient brings in
            >
            > PHARMACY TECHNICIAN ROLE:
            >   — Gather BPMH during admission (in many health-system models)
            >   — Input medication lists into the electronic health record (EHR)
            >   — Flag discrepancies to the pharmacist for resolution
            >   — NOT the tech's role to RESOLVE discrepancies — that is clinical (RPh/MD)
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It is the process of automatically substituting generic drugs for brand-name medications",
                "B) It involves comparing a patient's medication list across care transitions to identify and resolve discrepancies",
                "C) It is the clinical review of a patient's lab values to adjust drug doses",
                "D) It is the process of verifying a patient's insurance coverage before dispensing"
            ],
            correctAnswer: "B) It involves comparing a patient's medication list across care transitions to identify and resolve discrepancies",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.65,
            yOffset: 0.66
        ),

        // ── 21 ── ANTICOAGULATION MONITORING ────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ANTICOAG MONITORING",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > TOPIC: Laboratory Monitoring for Anticoagulant Medications
            >
            > WARFARIN (Coumadin) — Vitamin K Antagonist:
            >   MONITOR: PT/INR (prothrombin time / international normalized ratio)
            >   THERAPEUTIC RANGE (standard):  INR 2.0–3.0
            >   HIGHER TARGET (mechanical heart valves, high-risk AFib):  INR 2.5–3.5
            >   SUPRATHERAPEUTIC INR (> 4–5): Increased bleeding risk; may need vitamin K.
            >   REVERSAL: Vitamin K (phytonadione), FFP (fresh frozen plasma), 4-factor
            >   PCC (Kcentra) for life-threatening bleeding.
            >
            > HEPARIN — Unfractionated Heparin (UFH):
            >   MONITOR: aPTT (activated partial thromboplastin time)
            >   GOAL aPTT: 60–100 seconds (1.5–2.5× normal; facility-specific)
            >   Also monitor: CBC (platelet count — heparin-induced thrombocytopenia/HIT)
            >   REVERSAL: Protamine sulfate
            >
            > LOW MOLECULAR WEIGHT HEPARIN (LMWH):
            >   enoxaparin (Lovenox), dalteparin (Fragmin)
            >   MONITOR: Anti-Xa level (NOT aPTT — aPTT is unreliable for LMWH)
            >   Anti-Xa goal: 0.5–1.0 IU/mL (therapeutic; drawn 4h post-dose)
            >   Monitoring required in: renal impairment, obesity, pregnancy.
            >   REVERSAL: Protamine sulfate (partial reversal ~60%)
            >
            > DIRECT ORAL ANTICOAGULANTS (DOACs):
            >   apixaban (Eliquis), rivaroxaban (Xarelto) — anti-Xa
            >   dabigatran (Pradaxa) — direct thrombin inhibitor
            >   No routine monitoring required; renal function assessed at baseline.
            >   REVERSAL: andexanet alfa (for anti-Xa), idarucizumab (for dabigatran)
            """,
            challengeType: .multipleChoice,
            options: [
                "A) aPTT (activated partial thromboplastin time) — same test used for heparin",
                "B) PT/INR (prothrombin time / international normalized ratio)",
                "C) Anti-Xa level — the only reliable test for vitamin K antagonists",
                "D) Platelet count (CBC) — warfarin affects platelet production"
            ],
            correctAnswer: "B) PT/INR (prothrombin time / international normalized ratio)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.32,
            yOffset: 0.78
        ),

        // ── 22 ── PEDIATRIC MEDICATION SAFETY ───────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "PEDIATRIC SAFETY",
            loreText: """
            > SECTOR-03 // SAFETY_OPS
            > TOPIC: Pediatric Medication Safety — High-risk areas for errors in children
            >
            > WHY PEDIATRIC DOSING IS HIGH-RISK:
            >   — Doses are weight-based (mg/kg) — calculation errors are common
            >   — Drug concentrations differ (pediatric liquids vs adult forms)
            >   — mg vs. mL confusion — extremely dangerous in high-alert meds
            >   — 10-fold dosing errors are frequently reported
            >
            > WEIGHT-BASED DOSING — KEY RULE:
            >   ALWAYS verify: dose (mg/kg/day) × weight (kg) = total daily dose (mg)
            >   Then divide by frequency to get per-dose amount.
            >   VERIFY body weight in KILOGRAMS (not pounds — 1 kg = 2.2 lbs).
            >
            > HIGH-ALERT AREAS FOR PEDIATRIC ERRORS:
            >   — Opioids: 10-fold overdoses reported (e.g., morphine 0.1 mg/kg vs 1 mg/kg)
            >   — Anticoagulants: heparin neonatal vs standard concentration mix-ups
            >   — Chemotherapy: weight-based dose miscalculation
            >   — Electrolytes: KCl — must be diluted; NEVER give concentrated KCl IV push
            >   — Insulin: U-100 vs U-500 confusion (use dedicated insulin syringes)
            >
            > BROSELOW TAPE:
            >   Color-coded tape used in pediatric emergencies.
            >   Patient's LENGTH corresponds to an approximate WEIGHT range and
            >   PRE-CALCULATED DRUG DOSES for resuscitation.
            >   Reduces calculation time in emergencies.
            >
            > CONCENTRATION STANDARDIZATION:
            >   Many hospitals use STANDARDIZED CONCENTRATION protocols for pediatric
            >   high-alert drugs (one concentration per weight range) to reduce errors.
            >
            > SAFETY CHECKS:
            >   — Pharmacist verification of ALL pediatric weight-based doses
            >   — Smart pump dose-error reduction software (DERS)
            >   — Independent double-check for high-alert peds medications
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Pediatric doses are generally the same as adult doses; only the route differs",
                "B) Weight should always be recorded in pounds to match U.S. standard practice",
                "C) The dose in mg/kg multiplied by the patient's weight in kilograms gives the total dose",
                "D) Pediatric liquid doses are always 50% of the adult tablet dose"
            ],
            correctAnswer: "C) The dose in mg/kg multiplied by the patient's weight in kilograms gives the total dose",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68,
            yOffset: 0.88
        )

    ] // end domain3bNodes
}
