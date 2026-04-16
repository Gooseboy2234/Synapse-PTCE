//
//  Domain3_PatientSafety.swift
//  Synapse PTCE
//
//  Phase 3 — Domain 3: Patient Safety & Quality Assurance (23.75% of 2026 PTCB Exam)
//  14 nodes — plain-English loreText rewrite for maximum readability.
//

import Foundation

extension DataNode {

    // MARK: - Domain 3 Node Set

    static let domain3Nodes: [DataNode] = [

        // ── 01 ── HIGH-ALERT MEDICATIONS — DEFINITION ────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS",
            loreText: """
            > High-alert medications are drugs that cause significantly more HARM when given incorrectly compared to most other medications. The "high-alert" label comes from the Institute for Safe Medication Practices (ISMP).
            > Here's the key distinction to understand — it's counterintuitive and directly tested:
            > High-alert does NOT mean these drugs are involved in errors more often than others.
            > High-alert means that when an error DOES happen with these drugs, the consequences are much more serious — death, severe injury, or permanent harm.
            > Think of it like this: A typo in an email vs. a typo in a legal contract. Typos happen with similar frequency in both, but the damage from a contract typo is far worse.
            > SAFETY STRATEGIES used for high-alert medications:
            > Independent double-check: A second licensed person (pharmacist, nurse) independently verifies the drug, dose, and patient before it's given
            > Special warning labels and stickers: "HIGH ALERT MEDICATION" on the bag/bottle
            > Restricted access: High-alert drugs are stored separately with extra security
            > Standardized concentrations: Using the same concentration every time reduces calculation errors
            > Computer alerts: The pharmacy and hospital systems flag these drugs for extra verification
            > KEY: High-alert meds = NOT more common in errors, but errors with them cause MORE SERIOUS HARM. Double-check, special storage, and system alerts are the safety strategies.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Medications used only in high-acuity emergency situations",
                "B. Medications that bear a heightened risk of causing significant patient harm when used in error",
                "C. Medications that are most commonly involved in dispensing errors",
                "D. Medications that require high-level pharmacy training to prepare"
            ],
            correctAnswer: "B. Medications that bear a heightened risk of causing significant patient harm when used in error",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18, yOffset: 0.07
        ),

        // ── 02 ── ISMP HIGH-ALERT MEDICATION EXAMPLES ────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ISMP HIGH-ALERT",
            loreText: """
            > The ISMP (Institute for Safe Medication Practices) publishes a specific list of high-alert medications — drugs that have caused the most serious patient harm when errors occurred. Knowing the categories on this list is heavily tested.
            > THE ISMP HIGH-ALERT CATEGORIES — use the mnemonic AOISCC:
            > ANTICOAGULANTS: Heparin (blood thinner given by IV or injection), warfarin (Coumadin — blood thinner pill), DOACs (apixaban/Eliquis, rivaroxaban/Xarelto, dabigatran/Pradaxa). Risk: Too much → severe bleeding; too little → blood clots (stroke, PE).
            > OPIOIDS: All opioids — morphine, hydromorphone, oxycodone, fentanyl — especially IV forms. Risk: Too much → stopped breathing (respiratory depression) and death.
            > INSULIN: ALL insulin types and ALL formulations. Risk: Wrong insulin type or wrong dose → dangerously low blood sugar (hypoglycemia → coma or death). Note: U-500 insulin is 5x more concentrated than standard U-100 — a mix-up is deadly.
            > SEDATIVES: Propofol (the "milk of amnesia" IV sedation), midazolam, ketamine. Risk: Respiratory depression, cardiovascular collapse.
            > CONCENTRATED ELECTROLYTES: IV potassium chloride (KCl) — if given undiluted as an IV push, it stops the heart immediately. Hypertonic saline (>0.9% NaCl), magnesium sulfate IV. Always must be diluted.
            > CHEMOTHERAPY: All cancer drugs (antineoplastics). Risk: Narrow therapeutic window — too much destroys bone marrow and causes death.
            > KEY: AOISCC = Anticoagulants, Opioids, Insulin, Sedatives, Concentrated electrolytes, Chemotherapy. IV concentrated KCl given as IV push = cardiac arrest.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Atorvastatin (Lipitor) — risk of rhabdomyolysis",
                "B. Amoxicillin-clavulanate (Augmentin) — risk of diarrhea",
                "C. IV insulin infusions — ISMP high-alert medication",
                "D. Metformin (Glucophage) — risk of lactic acidosis"
            ],
            correctAnswer: "C. IV insulin infusions — ISMP high-alert medication",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.22
        ),

        // ── 03 ── LASA DRUGS ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA DRUGS",
            loreText: """
            > LASA stands for Look-Alike / Sound-Alike medications — drugs with names that are so similar they can easily be confused for each other, causing dangerous medication errors.
            > This is one of the most common causes of dispensing errors in pharmacy.
            > Classic LASA pairs tested on the PTCB:
            > Prednisone / predniSONE vs. predniSOLONE — both are steroids, both start with "predni-"
            > hydrALAzine vs. hydrOXYzine — one is a blood pressure drug, the other is an antihistamine/anti-anxiety drug — completely different purposes!
            > DOPamine vs. DOBUTamine — both IV cardiac drugs, but different effects on the heart
            > vinCRIStine vs. vinBLAStine — both chemotherapy drugs. Fatal mix-ups have occurred.
            > CeleBREX (celecoxib — pain reliever) vs. CeleXA (citalopram — antidepressant)
            > ZyPREXA (olanzapine — antipsychotic) vs. ZyRTEC (cetirizine — allergy medication)
            > HOW PHARMACIES PREVENT LASA ERRORS:
            > Tall Man lettering: Writing the DIFFERENT parts of the name in CAPITAL LETTERS to make them visually distinct (e.g., hydrALAzine, hydrOXYzine)
            > Physical separation: Storing LASA pairs in different physical locations on the shelf — never side by side
            > Warning stickers and computer alerts: System flags when a LASA drug is selected
            > Barcode scanning at dispensing: The scanner verifies it's the correct drug
            > KEY: LASA pairs are the same-sounding or same-looking drug names. Hydralazine/hydroxyzine and prednisone/prednisolone are the most commonly tested pairs.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metformin and metoprolol — both start with 'met'",
                "B. Amoxicillin and ciprofloxacin — both are antibiotics",
                "C. Prednisone and prednisolone — LASA pair",
                "D. Warfarin and apixaban — both are anticoagulants"
            ],
            correctAnswer: "C. Prednisone and prednisolone — LASA pair",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.48, yOffset: 0.10
        ),

        // ── 04 ── TALL MAN LETTERING ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "TALL MAN LTRS",
            loreText: """
            > Tall Man lettering is a specific technique used to make LASA (Look-Alike/Sound-Alike) drug names visually distinct by capitalizing the DIFFERENT parts of the name.
            > The idea is simple: when you scan a drug name quickly, the capital letters jump out at you — forcing your brain to actually process the name and notice the differences.
            > Example: hydrALAzine (blood pressure) vs. hydrOXYzine (antihistamine) — the capitalized middle letters (ALA vs OXY) instantly show you they're different drugs.
            > THE FDA HAS AN OFFICIAL TALL MAN LETTERING LIST — memorize these pairs:
            > hydrALAzine / hydrOXYzine
            > predniSONE / predniSOLONE
            > DOPamine / DOBUTamine
            > vinCRIStine / vinBLAStine
            > buPROPion / busPIRone (both "bu-" but one is an antidepressant/smoking cessation, the other is for anxiety)
            > ISMP has its own extended list that goes beyond the FDA list:
            > cycloSPORINE / cycloSERINE
            > ZyPREXA / ZyRTEC
            > CeleBREX / CeleXA
            > THE KEY to understanding Tall Man lettering: The CAPITALIZED letters are the DIFFERENT parts — the parts that distinguish the two drugs from each other. The lowercase letters are the shared parts.
            > KEY: Tall Man lettering capitalizes the DIFFERENT portions of LASA drug names. FDA endorsed. hydrALAzine/hydrOXYzine and DOPamine/DOBUTamine are the most tested examples.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. METFORMIN / metformin — same drug, different casing",
                "B. HydrALAzine / HydrOXYzine — correct Tall Man lettering pair",
                "C. LISINOPRIL / lisinopril — brand vs generic formatting",
                "D. Amoxicillin / AMOXICILLIN — all-caps labeling format"
            ],
            correctAnswer: "B. HydrALAzine / HydrOXYzine — correct Tall Man lettering pair",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.34
        ),

        // ── 05 ── FDA MEDWATCH ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "FDA MEDWATCH",
            loreText: """
            > MedWatch is the FDA's safety reporting system — it's how the FDA collects information about problems with medications and medical devices that weren't discovered during clinical trials.
            > Think of it as the FDA's "tip line" for drug problems. When healthcare workers or patients experience unexpected serious problems with a medication, they report it to MedWatch. The FDA uses these reports to spot safety patterns and take action (like issuing new warnings, requiring new labeling, or pulling a drug from the market).
            > WHAT DO YOU REPORT to MedWatch?
            > Serious adverse events (reactions that caused): death, hospitalization, life-threatening situation, permanent disability or damage, birth defect, required emergency intervention to prevent permanent harm
            > Product quality problems: contamination, wrong product or labeling, broken device, suspected counterfeit
            > TWO TYPES OF REPORTING:
            > Form 3500 (Voluntary): For healthcare professionals and consumers — you CAN report but are not required to
            > Form 3500A (Mandatory): For MANUFACTURERS, importers, and distributors — they MUST report serious adverse events they become aware of
            > Note: Pharmacies are NOT required to report — but they are strongly encouraged to.
            > MedWatch is different from ISMP MERP (Medication Error Reporting Program) — MERP focuses specifically on medication errors, while MedWatch covers all serious adverse events including product problems.
            > KEY: MedWatch = FDA's voluntary reporting system for serious adverse events and product problems. Form 3500 (voluntary for HCPs). Form 3500A (mandatory for manufacturers). Reports lead to safety actions like recalls and new warnings.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Insurance billing disputes and prior authorization denials",
                "B. State pharmacy board licensing violations",
                "C. Serious adverse events and product problems with drugs, biologics, and devices",
                "D. Patient non-compliance with prescribed medication regimens"
            ],
            correctAnswer: "C. Serious adverse events and product problems with drugs, biologics, and devices",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68, yOffset: 0.34
        ),

        // ── 06 ── MEDICATION ERROR TYPES ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ERROR TYPES",
            loreText: """
            > Medication errors can happen at any step between writing a prescription and a patient actually taking the drug. Knowing the types and WHERE in the process they happen is tested on the PTCB.
            > PRESCRIBING ERRORS: The DOCTOR (or prescriber) makes the error when writing the order.
            > Examples: Wrong drug ordered (wrote "cephalexin" when they meant "ciprofloxacin"), wrong dose (wrote "morphine 100mg" instead of "10mg"), wrong route.
            > TRANSCRIPTION ERRORS: Errors made when reading or copying an order into the system.
            > Examples: Pharmacist reads "quinidine" but it was "quinine." Technician enters the wrong strength when entering the prescription data. Handwriting misread.
            > DISPENSING ERRORS: PHARMACY makes the error — wrong drug, wrong strength, wrong quantity put in the bag, or wrong label.
            > Examples: Gave hydromorphone (strong opioid) instead of morphine (the intended drug). Labeled bottle with wrong patient name. Filled 100 tablets instead of 30.
            > ADMINISTRATION ERRORS: The NURSE or CAREGIVER gives the drug incorrectly at the bedside.
            > Examples: Gave the drug to the wrong patient, injected IV potassium undiluted.
            > MONITORING ERRORS: No one checked whether the drug was working or causing harm.
            > Examples: Didn't check INR for a patient on warfarin. Didn't check blood sugar for a patient on insulin.
            > NEAR-MISS: An error that was CAUGHT before it reached the patient. Near-misses must STILL be reported — they reveal system weaknesses before someone gets hurt.
            > KEY: Know which professional is responsible at each stage. A wrong drug pulled from the shelf and placed in the bag = dispensing error (pharmacy). Wrong drug written on the order = prescribing error (doctor).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Prescribing error — wrong drug ordered by prescriber",
                "B. Transcription error — misread when entering into the system",
                "C. Wrong drug dispensing error — pharmacy dispensed wrong drug",
                "D. Administration error — nurse gave wrong drug to patient"
            ],
            correctAnswer: "C. Wrong drug dispensing error — pharmacy dispensed wrong drug",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30, yOffset: 0.38
        ),

        // ── 07 ── DRUG UTILIZATION REVIEW (DUR) ──────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "PROSPECTIVE DUR",
            loreText: """
            > Drug Utilization Review (DUR) is the pharmacist's structured process of reviewing a prescription to make sure it's safe and appropriate for that patient before it's dispensed.
            > Think of it as the pharmacist's safety checklist — a final review to catch problems that a doctor might not have noticed.
            > There are THREE types of DUR — knowing the difference is tested:
            > PROSPECTIVE DUR (before dispensing):
            > This happens BEFORE the medication is given to the patient. The pharmacist reviews the new prescription against the patient's complete medication history.
            > Checks for: drug-drug interactions, wrong dose, allergies, duplicate medications (two drugs doing the same thing), contraindications (drug that's dangerous with the patient's condition).
            > This is the MOST COMMONLY TESTED type on the PTCB. It's also required by OBRA '90.
            > Example: Patient brings in a new Zoloft prescription. The prospective DUR catches that they're already on tramadol → serotonin syndrome risk flagged.
            > CONCURRENT DUR (during treatment):
            > Real-time monitoring while the patient is actively on the drug.
            > Example: Monitoring kidney function and drug levels while a patient is on IV vancomycin.
            > RETROSPECTIVE DUR (after the fact):
            > Looking BACK at patterns in dispensing records to identify problems.
            > Example: An insurance company analyzes 6 months of claims data and notices a prescriber is prescribing opioids at unusually high rates → triggers an investigation.
            > KEY: Prospective DUR = BEFORE dispensing (most tested). Concurrent = DURING treatment. Retrospective = AFTER the fact, looking at patterns. Prospective DUR is required by OBRA '90.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Retrospective DUR — reviewing past dispensing claims after the fact",
                "B. Concurrent DUR — monitoring the patient during active therapy",
                "C. Prospective DUR — reviewing the prescription before dispensing",
                "D. Formulary DUR — checking if a drug is on the insurance formulary"
            ],
            correctAnswer: "C. Prospective DUR — reviewing the prescription before dispensing",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45, yOffset: 0.35
        ),

        // ── 08 ── THE FIVE RIGHTS ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "5 RIGHTS",
            loreText: """
            > The "Five Rights" of medication administration is a foundational safety checklist used across pharmacy and nursing. Before giving any medication, you verify all five.
            > Think of them as five locks — every lock must be opened correctly or you don't give the drug.
            > RIGHT PATIENT: Are you giving this to the correct person? Verify with at LEAST two identifiers — typically name + date of birth, or name + medical record number. Never rely on just a name.
            > RIGHT DRUG: Is this the correct medication? Compare the drug name on the label to the prescription. Watch for LASA pairs!
            > RIGHT DOSE: Is this the correct amount? Confirm the dose AND the units — mg vs mcg is a 1,000-fold difference. Weight-based doses: verify the calculation.
            > RIGHT ROUTE: Is this being given the right way? Oral (PO), injection (IV, IM, SubQ), topical, ophthalmic (eye), otic (ear), nasal, rectal — wrong route can be deadly (oral liquid given IV, etc.)
            > RIGHT TIME: Is this being given at the correct time and correct frequency? TID = three times a day. QID = four times a day. AC = before meals. HS = at bedtime.
            > EXPANDED FRAMEWORKS add more "rights": Right reason, Right documentation, Right patient education, Right to refuse.
            > HOW THIS APPLIES IN PHARMACY: The Five Rights aren't just for nurses giving medications. They're also used as a dispensing verification checklist — when the pharmacist checks the final product against the prescription before it goes out the door.
            > KEY: The 5 Rights = Right Patient, Right Drug, Right Dose, Right Route, Right Time. All five must be verified before dispensing or administering any medication.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Right pharmacist",
                "B. Right insurance coverage",
                "C. Right time",
                "D. Right prescriber"
            ],
            correctAnswer: "C. Right time",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.54
        ),

        // ── 09 ── HAND HYGIENE ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HAND HYGIENE",
            loreText: """
            > Hand hygiene is the single most effective measure to prevent the spread of infections in healthcare settings — according to both the CDC and the World Health Organization.
            > The key point: most healthcare-associated infections (HAIs) are spread by contaminated hands — not through the air.
            > TWO METHODS — knowing WHEN to use each is the exam-tested detail:
            > ALCOHOL-BASED HAND SANITIZER (ABHR):
            > The PREFERRED method for most situations — faster, less damaging to skin with frequent use
            > Effective against: most bacteria, viruses (including COVID-19), fungi
            > Rub all surfaces of both hands together until completely dry (~20 seconds)
            > NOT EFFECTIVE against two major exceptions: C. difficile spores and norovirus
            > SOAP AND WATER (required in these specific situations):
            > When hands are VISIBLY DIRTY or soiled with blood/body fluids
            > After contact with a patient who has C. difficile (C. diff): This bacterium forms heat-resistant spores that alcohol doesn't kill. Only physical scrubbing with soap and water removes them.
            > After contact with norovirus (stomach bug)
            > Scrub for at least 20 seconds — the time it takes to sing "Happy Birthday" twice
            > THE WHO "5 MOMENTS" for hand hygiene: Before patient contact, before an aseptic task, after body fluid exposure, after patient contact, after touching patient's surroundings.
            > KEY: Alcohol hand sanitizer is preferred EXCEPT for C. diff and norovirus — those require soap and water. Also use soap and water when hands are visibly dirty.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. After every patient contact regardless of circumstances",
                "B. When hands are visibly soiled or after contact with C. difficile",
                "C. Only when preparing sterile compounded products",
                "D. Only when wearing gloves is not an option"
            ],
            correctAnswer: "B. When hands are visibly soiled or after contact with C. difficile",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.58
        ),

        // ── 10 ── STANDARD PRECAUTIONS ───────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "STD PRECAUTIONS",
            loreText: """
            > Standard Precautions (formerly called "Universal Precautions") are the minimum infection control practices used with EVERY patient — regardless of their diagnosis.
            > The core idea: you cannot always know who has an infectious disease. Someone may be carrying HIV, hepatitis B, C. diff, or another pathogen without knowing it themselves. So you treat every patient's blood, body fluids, and non-intact skin as potentially infectious.
            > Standard Precautions include: gloves (when touching blood or body fluids), gown (when splatter is possible), mask and eye protection (when spray or splashing risk), and proper hand hygiene before and after.
            > WHO DO STANDARD PRECAUTIONS APPLY TO? ALL patients. Every single patient. No exceptions. Not just patients with known infections.
            > TRANSMISSION-BASED PRECAUTIONS (extra layers ON TOP of Standard):
            > CONTACT PRECAUTIONS: Added for MRSA, C. diff, VRE, scabies. Wear gown + gloves for every patient contact.
            > DROPLET PRECAUTIONS: Added for influenza, COVID-19, meningitis. Surgical mask + eye protection required within 3 feet of patient.
            > AIRBORNE PRECAUTIONS: Added for tuberculosis (TB), measles, varicella (chickenpox). Requires N95 respirator mask (not just surgical mask) and a negative-pressure room (air flows INTO the room and is filtered before leaving — prevents the pathogen from spreading through the building's air system).
            > KEY: Standard Precautions = apply to ALL patients always. Contact = gown + gloves (MRSA, C. diff). Droplet = mask + eye shield (flu). Airborne = N95 + negative pressure room (TB, measles).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Only patients known to have bloodborne infections (HIV, Hep B/C)",
                "B. Only patients placed in formal isolation rooms",
                "C. All patients regardless of diagnosis or infection status",
                "D. Only patients in intensive care or high-acuity settings"
            ],
            correctAnswer: "C. All patients regardless of diagnosis or infection status",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.68
        ),

        // ── 11 ── BEYOND-USE DATE (BUD) ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BEYOND-USE DATE",
            loreText: """
            > Two different dates matter in pharmacy — and the difference between them is tested directly on the PTCB:
            > EXPIRATION DATE: Set by the manufacturer. This is the date on every commercially manufactured drug bottle. It's based on stability testing done by the manufacturer on the UNOPENED product. It tells you how long the drug is guaranteed to be safe and effective in its original, sealed packaging.
            > BEYOND-USE DATE (BUD): Set by the PHARMACIST or pharmacy staff for a COMPOUNDED preparation — one that the pharmacy makes from scratch. The BUD is calculated from the DATE AND TIME of compounding (the moment it was made), not from any expiration date on the label.
            > Why does this matter? When a pharmacy makes a custom cream, liquid, or IV bag, there's no manufacturer's expiration date on the raw ingredients that applies to the finished preparation. The pharmacist must determine how long the finished product will remain safe and effective — and that BUD must be based on USP guidelines.
            > The BUD can never exceed the expiration date of any ingredient used to make it.
            > USP Chapter 795 (non-sterile compounding) BUD defaults:
            > Water-containing preparations stored refrigerated: 14 days
            > Non-aqueous preparations: up to 180 days
            > USP Chapter 797 (sterile/IV compounding) has different, shorter BUDs depending on the clean room environment used.
            > KEY: Expiration Date = manufacturer, unopened product. Beyond-Use Date = set by pharmacist, starts at TIME OF COMPOUNDING. BUD ≤ expiration of ingredients.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The manufacturer's original expiration date for the raw ingredient",
                "B. The date the prescription was written by the prescriber",
                "C. The date and time the compounding was completed",
                "D. The date the patient picks up the compounded medication"
            ],
            correctAnswer: "C. The date and time the compounding was completed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.74
        ),

        // ── 12 ── NARROW THERAPEUTIC INDEX (NTI) DRUGS ───────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "NTI DRUGS",
            loreText: """
            > Narrow Therapeutic Index (NTI) drugs are medications where a small change in dose — or even switching from one brand to another — can tip a patient from "therapeutic benefit" into dangerous toxicity or complete treatment failure.
            > Picture a very narrow safe zone: if you're a tiny bit below it, the drug doesn't work. A tiny bit above it, the drug poisons you. Most drugs have a wide margin of safety; NTI drugs have a tiny margin.
            > This is why NTI drugs require REGULAR BLOOD LEVEL MONITORING and why switching between generic and brand versions requires careful management.
            > HIGH-YIELD NTI DRUGS — all tested on the PTCB:
            > Digoxin (Lanoxin): Heart drug. Therapeutic range 0.5–2.0 ng/mL. Toxicity: yellow-green halos, nausea, arrhythmia.
            > Warfarin (Coumadin): Blood thinner. Therapeutic INR 2.0–3.0. Toxicity: serious bleeding.
            > Lithium: Mood stabilizer. Therapeutic range 0.6–1.2 mEq/L. Toxicity: tremors, confusion, seizures.
            > Phenytoin (Dilantin): Anti-seizure. Therapeutic range 10–20 mcg/mL. Toxicity: nystagmus, ataxia.
            > Levothyroxine (Synthroid): Thyroid hormone. Even small dose changes cause significant effects.
            > Cyclosporine: Immunosuppressant after organ transplant. Too little = organ rejection; too much = kidney damage.
            > Theophylline: Old bronchodilator for asthma/COPD. Therapeutic range 5–15 mcg/mL.
            > KEY: NTI drugs have small safety margin — small dose changes cause big problems. Never switch brands without physician awareness. All NTI drugs require monitoring of blood levels.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metformin — first-line antidiabetic",
                "B. Amoxicillin — aminopenicillin antibiotic",
                "C. Digoxin — narrow therapeutic index drug",
                "D. Amlodipine — calcium channel blocker"
            ],
            correctAnswer: "C. Digoxin — narrow therapeutic index drug",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93, yOffset: 0.82
        ),

        // ── 13 ── ROOT CAUSE ANALYSIS (RCA) ──────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "ROOT CAUSE",
            loreText: """
            > Root Cause Analysis (RCA) is the investigation process used AFTER a medication error or adverse event has already occurred. Its goal is to understand WHY the error happened so it can be prevented in the future.
            > The most important principle of RCA: it focuses on SYSTEMS and PROCESSES — not on blaming individual people.
            > Why this distinction matters: Most errors happen not because someone was negligent, but because a system, process, or workflow had a flaw that allowed the error to occur. If you just blame the tech or nurse who made the error, you haven't fixed anything — the same flaw is still in the system, waiting to catch the next person.
            > What RCA looks for: The "root cause" is the deepest underlying reason the error occurred. It might be a policy gap, a confusing label, poor communication, inadequate training, or a workflow design that made errors easy to make.
            > THE RCA PROCESS:
            > 1. Define and describe exactly what happened (facts, not blame)
            > 2. Collect data: interviews, records, timelines, photographs
            > 3. Identify ALL contributing factors using a fishbone (Ishikawa) diagram — organizing causes into categories (people, process, equipment, environment)
            > 4. Identify the true root cause(s) — the deepest "why"
            > 5. Develop and implement a corrective action plan to fix the system
            > 6. Monitor to make sure the fix worked
            > KEY: RCA = REACTIVE (after an error). Focuses on systems, not blame. Uses fishbone diagrams and the "5 Whys" technique. The goal is preventing recurrence, not punishing individuals.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Assign individual blame and initiate disciplinary action",
                "B. Identify the fundamental system failure that led to the error, to prevent recurrence",
                "C. Document the event to prepare for potential legal proceedings",
                "D. Calculate the financial cost of the medication error"
            ],
            correctAnswer: "B. Identify the fundamental system failure that led to the error, to prevent recurrence",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.08, yOffset: 0.88
        ),

        // ── 14 ── QUALITY ASSURANCE vs QUALITY CONTROL ───────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "QA vs QC",
            loreText: """
            > Quality Assurance (QA) and Quality Control (QC) are two parts of a pharmacy's overall quality management program. Both aim to ensure patients receive safe, high-quality medications — but they approach this goal from opposite directions.
            > QUALITY ASSURANCE (QA) = PROACTIVE — preventing problems BEFORE they happen:
            > QA is the big-picture, systems-level approach. It means designing workflows, training staff, writing procedures, and auditing processes so that errors are unlikely to occur in the first place.
            > Examples: Writing Standard Operating Procedures (SOPs) for how medications are prepared. Training staff on proper technique. Conducting internal audits of the dispensing process. Redesigning a workflow to reduce the chance of a LASA mix-up.
            > Think of QA as building a safe road — you design out hazards before anyone drives on it.
            > QUALITY CONTROL (QC) = REACTIVE — testing FINISHED products to detect defects:
            > QC is the hands-on testing and inspection of completed preparations or processes.
            > Examples: Visual inspection of a compounded cream (is it the right color and consistency?). Sterility testing of a compounded IV bag. A pharmacist doing a final check of a dispensed prescription before it leaves the pharmacy.
            > Think of QC as the quality inspector at the end of the assembly line — checking finished products.
            > In a compounding pharmacy, both are required: USP 795 and 797 mandate QC testing for all compounded preparations.
            > KEY: QA = proactive (prevent errors through systems and training). QC = reactive (test finished products to catch defects). Both are required in compounding.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Testing finished drug products to detect defects before dispensing (reactive)",
                "B. A systematic, proactive process to prevent errors through process design and improvement",
                "C. Annual audits performed by state pharmacy boards and accreditation bodies",
                "D. Verifying drug expiration dates during routine inventory management"
            ],
            correctAnswer: "B. A systematic, proactive process to prevent errors through process design and improvement",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50, yOffset: 0.90
        )
    ]
}
