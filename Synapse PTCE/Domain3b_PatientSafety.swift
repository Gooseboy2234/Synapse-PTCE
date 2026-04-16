//
//  Domain3b_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 3 Expansion: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  8 nodes — plain-English loreText rewrite for maximum readability.
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
            > USP Chapter 795 is the national standard for NON-STERILE COMPOUNDING — when a pharmacy makes a custom medication that doesn't need to be sterile (meaning it's not going to be injected).
            > What is "compounding"? When a pharmacist makes a medication from scratch — combining ingredients to create a product that a patient needs but that doesn't exist commercially. Think of it like custom cooking vs. ordering from a restaurant.
            > Examples of non-sterile compounded preparations: oral liquids (a child's liquid version of a drug only made in adult tablets), topical creams and ointments (custom pain cream with multiple ingredients), suppositories, troches (lozenges that dissolve in the mouth), capsules.
            > USP 795 establishes BEYOND-USE DATES (BUDs) — how long these custom preparations are stable and safe after being made. The 2023 revision updated the categories:
            > CATEGORY 1 (no stability testing data available — use conservative defaults):
            > Aqueous (water-containing) preparations: ≤ 14 DAYS refrigerated (2–8°C)
            > Non-aqueous preparations (no water — like an ointment): ≤ 180 DAYS at room temperature or refrigerated
            > Water-containing topical/mucosal preparations: ≤ 30 DAYS
            > CATEGORY 2: The pharmacy has stability data showing the preparation is stable for longer → extended BUD is permitted.
            > RECORD REQUIREMENTS: Every compounded preparation needs a Master Formulation Record (the "recipe") and a Compounding Record (a batch log each time it's made).
            > KEY: USP 795 = non-sterile compounding standard. Aqueous preparations without stability data = 14 days refrigerated. Non-aqueous = up to 180 days.
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
            > USP Chapter 797 is the national standard for STERILE COMPOUNDING — making medications that will be injected, placed in the eye, or inhaled. These preparations MUST be completely free of bacteria and other contaminants, because injecting a contaminated drug directly into the bloodstream can be fatal.
            > Examples of sterile compounded preparations: IV bags with custom medications, epidural injections, compounded eye drops, intrathecal (spinal) preparations.
            > CLEAN ROOM CLASSIFICATIONS — the purity of the air is measured in ISO (International Organization for Standardization) levels:
            > ISO 5: Where the actual sterile work happens — inside the Laminar Airflow Workbench (LAFW) or Biological Safety Cabinet (BSC). Cleanest zone. Also called "Class 100" (fewer than 100 particles per cubic foot).
            > ISO 7: The "buffer room" — the clean room where the ISO 5 equipment sits. Also called "Class 10,000."
            > ISO 8: The "ante-room" — the outer room where you put on your protective gown before entering the buffer room. Also called "Class 100,000."
            > GARBING ORDER — what you put on and in what order (this is tested!):
            > Shoe covers → hair cover → face mask → wash hands → sterile gown → sterile gloves. Gloves go on LAST, right before you start working.
            > BEYOND-USE DATES (2023 updated USP 797):
            > Category 1 CSPs (no sterility testing): ≤ 12 hours at room temperature, ≤ 24 hours refrigerated
            > Category 2 CSPs (with sterility testing): Extended BUDs based on testing — up to 45 days refrigerated.
            > KEY: Sterile compounding happens in ISO 5 (primary work area). Garbing order ends with gloves LAST. Category 1 BUD = 12h room temp / 24h refrigerated.
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
            > USP Chapter 800 is the standard for handling hazardous drugs (HDs) — medications that can cause cancer, birth defects, organ damage, or genetic mutations when a healthcare worker is exposed to them.
            > The irony: the very drugs that save patients' lives (chemotherapy, for example) are dangerous to the nurses and pharmacists who handle them. USP 800 exists to protect healthcare workers from this occupational exposure.
            > The NIOSH (National Institute for Occupational Safety and Health, part of CDC) publishes the official Hazardous Drug List — updated every 2 years:
            > Group 1: Antineoplastics (chemo drugs) — methotrexate, cyclophosphamide, paclitaxel
            > Group 2: Non-chemo hazardous drugs — warfarin (anticoagulant), finasteride (prostate/hair loss), testosterone (reproductive risk)
            > Group 3: Drugs that are hazardous only for reproductive risk — estrogens, some antifungals
            > REQUIRED PPE WHEN HANDLING HAZARDOUS DRUGS:
            > Chemotherapy-rated GLOVES (double-glove for chemo drugs)
            > Chemotherapy-resistant GOWN (not a regular cloth lab coat)
            > N95 respirator or PAPR (powered air-purifying respirator) when there's risk of inhaling powder or aerosol
            > Eye/face protection when there's a splash risk
            > ENGINEERING CONTROLS: Antineoplastic drugs must be compounded inside a Class II Type B2 Biological Safety Cabinet (BSC) — a special vented cabinet with negative pressure and external exhaust. Closed-System Drug-Transfer Devices (CSTDs) are required to prevent aerosol escape.
            > KEY: USP 800 protects healthcare workers from hazardous drug exposure. PPE = chemo gloves + gown minimum. Antineoplastics need BSC + CSTDs. Finasteride and testosterone are also on the hazardous drug list.
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
            > The Beers Criteria is a list of medications that are POTENTIALLY INAPPROPRIATE for adults aged 65 and older. Published by the American Geriatrics Society (AGS), it's updated every few years (most recent: 2023).
            > Why do older adults need a special list? As people age, their livers and kidneys slow down (drugs accumulate longer), their brains become more sensitive to sedating drugs (fall risk, confusion), and they often take many medications at once (polypharmacy). Drugs that are safe for a 35-year-old can be dangerous for a 75-year-old.
            > HIGH-YIELD BEERS LIST EXAMPLES — these appear directly on the PTCB:
            > ANTICHOLINERGIC DRUGS (avoid in elderly due to confusion, falls, urinary retention):
            > diphenhydramine (Benadryl) — even as a sleep aid. HIGH RISK in elderly.
            > hydroxyzine (Vistaril/Atarax)
            > oxybutynin oral (Ditropan) — bladder medication
            > Tricyclic antidepressants (amitriptyline, imipramine)
            > CNS DEPRESSANTS (avoid due to fall and fracture risk):
            > ALL benzodiazepines (Xanax, Valium, Ativan, Klonopin) — even short-acting ones
            > Z-drugs (zolpidem/Ambien, eszopiclone/Lunesta) — same risks as benzos in elderly
            > NSAIDs (ibuprofen, naproxen) — GI bleeding, kidney damage, fluid retention. Use acetaminophen for pain instead.
            > MUSCLE RELAXANTS: cyclobenzaprine (Flexeril), carisoprodol (Soma) — poorly tolerated, high sedation.
            > LONG-ACTING SULFONYLUREAS: glyburide — causes prolonged hypoglycemia. Prefer shorter-acting glipizide.
            > KEY: Beers List = potentially inappropriate meds for 65+. Diphenhydramine (Benadryl) and benzodiazepines are the most-tested examples. Main risks = falls, confusion, GI bleeding.
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
            > Vaccines are biological products — they contain living or weakened organisms, proteins, or genetic material. They must be stored within very specific temperature ranges or they become ineffective (damaged vaccines look normal but won't work).
            > The "cold chain" is the unbroken temperature-controlled supply from the manufacturer to the patient's arm — if the cold chain is broken at any point, the vaccine may be compromised.
            > TWO main storage categories — the most tested distinction:
            > REFRIGERATED vaccines (store at 2°C–8°C / 36–46°F) — NEVER FREEZE:
            > Inactivated flu vaccine (flu shot), Hepatitis A, Hepatitis B, HPV (Gardasil 9), Tdap/Td, DTaP, Pneumococcal (PCV15, PPSV23), Meningococcal, Hib, IPV (inactivated polio)
            > CRITICAL: These vaccines are DESTROYED by freezing — freezing causes the proteins to clump (flocculate). A frozen-then-thawed refrigerated vaccine usually looks normal but is ineffective. Always quarantine suspected freeze-damaged vaccines.
            > FROZEN vaccines (store at −50°C to −15°C / −58°F to 5°F):
            > MMR (measles, mumps, rubella), Varicella (chickenpox/shingles live), MMRV (ProQuad)
            > Note: Shingrix (shingles non-live recombinant vaccine) = REFRIGERATED, not frozen. Zostavax (old live shingles vaccine) = frozen.
            > VFC PROGRAM (Vaccines for Children): Federal program providing free vaccines to eligible children (uninsured, Medicaid). Pharmacies must follow strict storage/handling to participate.
            > KEY: Refrigerated vaccines (flu, Hep A, Hep B, HPV) = never freeze. Frozen vaccines (MMR, varicella) = store below −15°C. Shingrix = refrigerator. Zostavax = freezer.
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
            > Medication reconciliation is a formal process of comparing what medications a patient was taking before a care transition (like being admitted to a hospital or discharged home) to what they're being prescribed now — and finding and fixing any discrepancies.
            > Why does this matter? Transitions of care are dangerous moments. When a patient is admitted to the hospital, a nurse or doctor may write new medication orders from memory — and forget to include blood pressure pills, or accidentally add a drug the patient is already on, or continue a dose that was changed in another setting.
            > Without reconciliation, patients can end up with duplicate drugs, dangerous gaps in therapy, or harmful interactions from newly added medications they already take.
            > WHAT DISCREPANCIES ARE FOUND:
            > Omissions: A medication the patient was taking wasn't ordered in the new setting
            > Duplications: The same drug ordered twice under different names (brand vs generic)
            > Wrong dose: Dose changed inappropriately during the transition
            > Drug interactions: New medications creating a dangerous combination
            > WHEN IS MED RECONCILIATION REQUIRED? The Joint Commission (TJC) requires it at:
            > Admission (entering hospital from home or another facility)
            > Transfers (moving from ICU to a general floor, or from hospital to nursing home)
            > Discharge (going back home — discharge instructions should include a complete med list)
            > PHARMACY TECHNICIAN'S ROLE: Gather the Best Possible Medication History (BPMH) — interview the patient, review pharmacy records, check pill bottles. Enter the list into the EHR. FLAG discrepancies to the pharmacist. You do NOT resolve the discrepancies — that's the pharmacist's or physician's job.
            > KEY: Med reconciliation = comparing medication lists at care transitions to find and fix discrepancies. Required at admission, transfer, and discharge. Tech gathers the history; pharmacist/MD resolves discrepancies.
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
            > Anticoagulants are blood thinners — drugs that prevent dangerous blood clots (like strokes, heart attacks, pulmonary embolisms). But every blood thinner requires careful monitoring: too little = clots form, too much = bleeding.
            > Each anticoagulant type uses a DIFFERENT lab test for monitoring. Matching the drug to its lab test is a high-frequency PTCB topic.
            > WARFARIN (Coumadin) — Vitamin K Antagonist (pill):
            > Monitor with: PT/INR (Prothrombin Time / International Normalized Ratio)
            > INR stands for how long it takes blood to clot, standardized against a reference. Higher INR = blood is thinner = more bleeding risk.
            > Therapeutic INR: 2.0–3.0 for most indications (A-fib, DVT/PE treatment, mechanical valves may need 2.5–3.5)
            > If INR > 4–5: Give vitamin K (phytonadione) to reverse. Serious bleeding → use 4-factor PCC (Kcentra) or FFP.
            > HEPARIN (IV or injection — unfractionated):
            > Monitor with: aPTT (activated Partial Thromboplastin Time)
            > Therapeutic aPTT: 60–100 seconds (1.5–2.5× normal)
            > Also monitor platelet count — heparin can cause HIT (Heparin-Induced Thrombocytopenia): body makes antibodies against heparin-platelet complex → dangerous clotting paradox.
            > Reversal: Protamine sulfate.
            > LOW MOLECULAR WEIGHT HEPARIN — enoxaparin (Lovenox):
            > Monitor with: Anti-Xa level (NOT aPTT — aPTT is unreliable for LMWH)
            > DOACS (apixaban/Eliquis, rivaroxaban/Xarelto, dabigatran/Pradaxa):
            > NO routine monitoring required. Reversal: andexanet alfa (for anti-Xa DOACs), idarucizumab (for dabigatran).
            > KEY: Warfarin → monitor INR. Heparin → monitor aPTT. Enoxaparin/LMWH → monitor Anti-Xa. DOACs → no routine monitoring.
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
            > Dosing medications for children is very different from adults — and mistakes are MUCH more likely to be fatal. This is because children's doses are calculated based on body weight (how heavy the child is in kilograms), not given in standard one-size amounts.
            > The most common pediatric medication error is a CALCULATION ERROR that results in a 10-fold overdose (for example, giving 10mg instead of 1mg because someone forgot to move a decimal point).
            > THE WEIGHT-BASED DOSING FORMULA:
            > 1. Always get the child's weight in KILOGRAMS (not pounds — divide pounds by 2.2 to convert)
            > 2. Dose (mg) = Weight (kg) × Ordered dose (mg/kg)
            > 3. For divided doses: Total daily dose ÷ Number of doses per day = dose per administration
            > Example: Child weighs 22 lbs = 10 kg. Ordered: amoxicillin 40 mg/kg/day divided every 8 hours.
            > Total daily dose = 10 × 40 = 400 mg/day. Per dose = 400 ÷ 3 = 133 mg every 8 hours.
            > HIGH-RISK DRUGS IN PEDIATRICS — where the worst errors happen:
            > Opioids: 0.1 mg/kg morphine vs. 1 mg/kg morphine — 10x difference, could be fatal
            > IV heparin: Neonatal concentrations (lower) vs. standard — concentration mix-ups reported
            > KCl (potassium): NEVER give concentrated KCl as IV push — stops the heart
            > Insulin: U-100 vs. U-500 (5x concentration) — always use dedicated insulin syringe
            > BROSELOW TAPE: A color-coded length-based tape used in pediatric emergencies. A child's HEIGHT correlates to estimated WEIGHT, and pre-calculated emergency drug doses are color-coded on the tape — saving critical calculation time.
            > KEY: Pediatric dosing = weight-based in kg (divide lbs ÷ 2.2). Verify mg/kg calculation. 10-fold errors are the most dangerous. Broselow tape is used in pediatric emergencies.
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
