//
//  Domain1c_Medications.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 1 Gap Fill: Medications (35% of 2026 PTCB Exam)
//  7 nodes covering the final high-yield medication gaps:
//  tramadol, pregabalin, zolpidem (Z-drugs), lithium, furosemide,
//  methotrexate (weekly dosing error), and isotretinoin (iPLED+ REMS).
//

import Foundation

extension DataNode {

    // MARK: - Domain 1c Node Set

    static let domain1cNodes: [DataNode] = [

        // ── 45 ── TRAMADOL ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: tramadol   BRAND: Ultram, Ultram ER, ConZip
            > COMBINATION: tramadol / acetaminophen (Ultracet)
            > DEA SCHEDULE: Schedule IV (CIV) — federally scheduled since 2014
            >
            > CLASS: Atypical opioid analgesic — DUAL MECHANISM:
            >   (1) Weak mu (μ) opioid receptor agonist — much weaker than morphine
            >   (2) Inhibits serotonin AND norepinephrine reuptake (SNRI-like activity)
            >   This dual mechanism differentiates it from standard opioids.
            >
            > INDICATIONS: Moderate to moderately severe acute and chronic pain.
            >
            > *** SEROTONIN SYNDROME RISK ***
            >   Tramadol's SNRI activity means it can trigger serotonin syndrome when
            >   combined with other serotonergic agents:
            >   — SSRIs (sertraline, escitalopram, fluoxetine) — HIGH RISK
            >   — SNRIs (venlafaxine, duloxetine)
            >   — MAOIs — ABSOLUTE CONTRAINDICATION (can be fatal)
            >   — TCAs, linezolid, meperidine (Demerol), methylene blue
            >   SYMPTOMS: Agitation, diaphoresis, hyperthermia, tremor, hyperreflexia.
            >
            > LOWERS SEIZURE THRESHOLD:
            >   Tramadol increases seizure risk — avoid in patients with epilepsy or those
            >   on medications that also lower seizure threshold (bupropion, antipsychotics).
            >
            > CYP2D6 METABOLISM:
            >   Metabolized to active metabolite (M1 / O-desmethyltramadol) by CYP2D6.
            >   Ultra-rapid metabolizers: Higher M1 levels → increased opioid toxicity.
            >   Poor metabolizers: Less M1 → reduced analgesic effect.
            >
            > ADVERSE EFFECTS: Nausea (very common), dizziness, constipation, headache,
            >   somnolence, pruritus, dry mouth, seizures (dose-dependent).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It has no opioid activity — it works entirely as an SNRI antidepressant",
                "B) It is a Schedule II drug with a high potential for abuse equal to oxycodone",
                "C) It is a weak mu-opioid agonist that also inhibits serotonin and norepinephrine reuptake",
                "D) It cannot interact with SSRIs because it acts only on opioid receptors"
            ],
            correctAnswer: "C) It is a weak mu-opioid agonist that also inhibits serotonin and norepinephrine reuptake",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.35,
            yOffset: 0.09
        ),

        // ── 46 ── PREGABALIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREGABALIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: pregabalin   BRAND: Lyrica, Lyrica CR
            > DEA SCHEDULE: Schedule V (CV) — has abuse potential (euphoria at high doses)
            >
            > CLASS: Anticonvulsant / neuropathic pain agent (related to gabapentin)
            >
            > FDA-APPROVED INDICATIONS:
            >   — Diabetic peripheral neuropathy (DPN)
            >   — Postherpetic neuralgia (PHN)
            >   — Fibromyalgia — one of the few FDA-approved treatments
            >   — Neuropathic pain associated with spinal cord injury
            >   — Adjunctive therapy for partial-onset seizures (adults and pediatrics ≥1 month)
            >   — Generalized anxiety disorder (GAD) — approved in Europe; off-label in US
            >
            > MECHANISM: Binds to α2δ subunit of voltage-gated calcium channels — same as
            >   gabapentin, but with higher potency and more predictable absorption.
            >
            > KEY PHARMACOKINETIC DIFFERENCE FROM GABAPENTIN:
            >   Gabapentin: Non-linear absorption (saturable transporter; higher doses = less
            >     absorbed proportionally).
            >   Pregabalin: LINEAR pharmacokinetics — dose and plasma level are proportional;
            >     more predictable dose-response relationship.
            >
            > RENAL DOSING: Elimination is almost entirely renal; must dose-reduce when
            >   CrCl < 60 mL/min.
            >
            > ADVERSE EFFECTS: Dizziness, somnolence, peripheral edema, weight gain,
            >   blurred vision, dry mouth, difficulty concentrating.
            >   Rare but serious: Angioedema (hypersensitivity — discontinue immediately).
            >   Respiratory depression risk increases when combined with CNS depressants/opioids.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It is Schedule II due to significantly higher abuse potential than gabapentin",
                "B) It is approved only for pain indications; it has no anticonvulsant properties",
                "C) It exhibits linear pharmacokinetics — dose and plasma levels are proportional",
                "D) It requires hepatic dose adjustment and should be avoided in liver impairment"
            ],
            correctAnswer: "C) It exhibits linear pharmacokinetics — dose and plasma levels are proportional",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68,
            yOffset: 0.15
        ),

        // ── 47 ── ZOLPIDEM / Z-DRUGS ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / Z-DRUGS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Non-benzodiazepine hypnotics ("Z-drugs") — DEA Schedule IV (CIV)
            >
            > DRUGS IN CLASS:
            >   zolpidem (Ambien IR, Ambien CR, Edluar SL, Zolpimist spray)
            >   eszopiclone (Lunesta) — longer duration; no federal night limit on duration
            >   zaleplon (Sonata) — ultra-short acting; useful for middle-of-night awakening
            >
            > MECHANISM: Selective GABA-A agonist at omega-1 receptor subtype.
            >   More selective than benzodiazepines (less anxiolytic, less muscle relaxant),
            >   but same CNS depressant and abuse potential over time.
            >
            > INDICATIONS: Short-term management of insomnia.
            >   Ambien IR — sleep onset; Ambien CR — sleep onset AND maintenance.
            >
            > *** BLACK BOX WARNING (FDA 2019): COMPLEX SLEEP BEHAVIORS ***
            >   All Z-drugs carry a black box warning for complex sleep behaviors including:
            >   sleep-walking, sleep-driving, sleep-eating — while NOT fully awake.
            >   These behaviors can result in serious injury or death.
            >   Patients must be counseled to STOP the medication and contact prescriber if any occur.
            >
            > GENDER DOSING DIFFERENCE (ZOLPIDEM):
            >   Women metabolize zolpidem MORE SLOWLY than men.
            >   Recommended starting dose: Women = 5 mg (IR) / Men = 5–10 mg (IR).
            >   FDA issued guidance in 2013 to reduce women's dose to avoid morning impairment.
            >
            > BEERS CRITERIA: AVOID in adults ≥ 65 years.
            >   Despite differing from benzodiazepines mechanistically, Z-drugs carry
            >   the SAME risks in elderly: falls, fractures, confusion, dependence.
            >
            > ADVERSE EFFECTS: Drowsiness, dizziness, amnesia, headache, rebound insomnia
            >   upon discontinuation, tolerance with prolonged use.
            >   Next-day impairment: Especially at higher doses — do not drive morning after.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Zolpidem is Schedule II because it is structurally similar to barbiturates",
                "B) The FDA requires a black box warning for complex sleep behaviors such as sleep-driving",
                "C) Women require a higher dose than men due to faster first-pass hepatic metabolism",
                "D) Z-drugs are exempt from the Beers Criteria because they are not benzodiazepines"
            ],
            correctAnswer: "B) The FDA requires a black box warning for complex sleep behaviors such as sleep-driving",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.24
        ),

        // ── 48 ── LITHIUM ────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LITHIUM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: lithium carbonate   BRAND: Eskalith, Lithobid (ER)
            > Also: lithium citrate (oral solution)
            > CLASS: Mood stabilizer — NARROW THERAPEUTIC INDEX (NTI)
            >
            > INDICATION: Bipolar disorder — acute manic episodes and long-term maintenance.
            >   Also used for: augmentation of antidepressants, cluster headache prophylaxis.
            >
            > MECHANISM: Not fully established. Likely modulates second messenger systems
            >   (inositol phosphate pathway) and affects sodium transport in neurons.
            >
            > THERAPEUTIC DRUG MONITORING (TDM):
            >   Draw blood 12 HOURS after the LAST dose (trough level).
            >   Therapeutic range: 0.6–1.2 mEq/L (maintenance)
            >                      0.8–1.2 mEq/L (acute mania)
            >   TOXIC threshold: ≥ 1.5 mEq/L
            >
            > TOXICITY — SIGNS BY LEVEL:
            >   1.5–2.0 mEq/L (mild): Tremor (coarse), polyuria, nausea, diarrhea, fatigue
            >   2.0–2.5 mEq/L (moderate): Ataxia, confusion, slurred speech, blurred vision
            >   > 2.5 mEq/L (severe): Seizures, renal failure, cardiovascular collapse, coma
            >
            > *** SODIUM DEPLETION → LITHIUM TOXICITY ***
            >   Lithium competes with sodium in the proximal renal tubule.
            >   When Na is low → kidneys reabsorb more Li → elevated levels → toxicity.
            >   CAUSES of Na depletion to watch: NSAIDs (reduce renal Li excretion),
            >   thiazide diuretics (not loop — loop actually increases Li excretion),
            >   ACE inhibitors/ARBs, low-sodium diet, excessive sweating, vomiting, diarrhea.
            >
            > ADVERSE EFFECTS: Fine hand tremor (most common), polyuria/polydipsia
            >   (nephrogenic diabetes insipidus), hypothyroidism (long-term — monitor TSH),
            >   weight gain, acne, edema, cognitive dulling.
            >
            > MONITORING: Serum lithium levels, SCr/eGFR (renal), TSH (thyroid),
            >   CBC, urinalysis (long-term nephrotoxicity risk).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 0.8 mEq/L drawn 12 hours after the last dose — within the therapeutic range",
                "B) 1.8 mEq/L drawn 12 hours after the last dose — above the upper therapeutic limit",
                "C) TSH of 3.5 mIU/L — indicating normal thyroid function on long-term therapy",
                "D) SCr of 1.0 mg/dL — indicating normal renal clearance of lithium"
            ],
            correctAnswer: "B) 1.8 mEq/L drawn 12 hours after the last dose — above the upper therapeutic limit",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.30
        ),

        // ── 49 ── FUROSEMIDE / LOOP DIURETICS ───────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: furosemide   BRAND: Lasix
            > CLASS: Loop diuretic — most potent diuretic class
            >
            > ALSO IN CLASS:
            >   bumetanide (Bumex) — 40 mg furosemide ≈ 1 mg bumetanide (40:1 ratio)
            >   torsemide (Demadex) — better oral bioavailability than furosemide
            >   ethacrynic acid (Edecrin) — only non-sulfonamide loop diuretic (sulfa allergy)
            >
            > MECHANISM: Inhibits the Na+/K+/2Cl− cotransporter (NKCC2) in the thick
            >   ascending loop of Henle → prevents Na, K, Cl reabsorption → profound diuresis.
            >
            > INDICATIONS: Edema (CHF, hepatic cirrhosis, nephrotic syndrome), hypertension,
            >   acute pulmonary edema (rapid IV), hypercalcemia (promotes Ca excretion).
            >
            > *** ELECTROLYTE LOSSES — MUST MONITOR ***
            >   PRIMARY CONCERN: HYPOKALEMIA (potassium wasting)
            >   Also causes: hyponatremia, hypomagnesemia, hypocalcemia,
            >   hypochloremia, metabolic alkalosis.
            >
            > *** CRITICAL INTERACTION: FUROSEMIDE + DIGOXIN ***
            >   Furosemide-induced HYPOKALEMIA potentiates digoxin toxicity.
            >   Low K+ increases digoxin binding at Na+/K+-ATPase → toxicity at "normal" levels.
            >   ALWAYS monitor potassium in patients on both drugs.
            >
            > OTOTOXICITY:
            >   IV furosemide given too rapidly → hearing loss (temporary or permanent).
            >   Max IV rate: 4 mg/min. Risk ↑ with concurrent aminoglycosides.
            >   PROTECT FROM LIGHT: IV furosemide formulation is photosensitive.
            >
            > OTHER ADVERSE EFFECTS: Dehydration/volume depletion, hypotension,
            >   hyperuricemia (may precipitate gout), hyperglycemia (mild).
            >
            > SULFONAMIDE NOTE: Furosemide contains a sulfonamide moiety.
            >   Theoretical cross-reactivity with sulfa allergy (ethacrynic acid is
            >   the alternative for confirmed sulfa-allergic patients).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Sodium — furosemide raises serum sodium, which activates digoxin receptors",
                "B) Calcium — furosemide-induced hypercalcemia directly increases digoxin binding",
                "C) Potassium — furosemide-induced hypokalemia potentiates digoxin toxicity",
                "D) Magnesium — furosemide raises magnesium, competing with digoxin at receptor sites"
            ],
            correctAnswer: "C) Potassium — furosemide-induced hypokalemia potentiates digoxin toxicity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.48,
            yOffset: 0.38
        ),

        // ── 50 ── METHOTREXATE ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METHOTREXATE",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: methotrexate (MTX)   BRAND: Trexall, Rheumatrex (oral),
            >   Otrexup, Rasuvo (SQ auto-injectors), Xatmep (oral solution)
            > CLASS: Antimetabolite / DMARD / antineoplastic
            > HAZARDOUS DRUG: NIOSH Group 1 (antineoplastic) and Group 2 (non-antineoplastic)
            >
            > MECHANISM: Inhibits dihydrofolate reductase (DHFR) → blocks folate synthesis
            >   → impairs DNA, RNA, and protein synthesis (especially in rapidly dividing cells).
            >
            > INDICATIONS BY DOSE:
            >   HIGH DOSE (oncology): Leukemia, lymphoma, osteosarcoma, bladder cancer
            >   LOW DOSE (rheumatology): Rheumatoid arthritis, psoriasis, psoriatic arthritis
            >
            > *** CRITICAL DOSING WARNING — WEEKLY NOT DAILY ***
            >   For RA and psoriasis: ONCE WEEKLY dosing (7.5–25 mg/week PO or SQ).
            >   Daily methotrexate in RA has caused DEATHS from myelosuppression/mucositis.
            >   Technicians must counsel patients: "THIS IS A ONCE-A-WEEK MEDICATION."
            >   The prescribed day of the week is critical (e.g., "every Wednesday").
            >
            > FOLIC ACID SUPPLEMENTATION:
            >   Folic acid 1 mg/day is prescribed concurrently with low-dose MTX.
            >   Reduces side effects (mucositis, nausea, hepatotoxicity) WITHOUT
            >   significantly reducing MTX efficacy in rheumatologic conditions.
            >
            > TERATOGEN — PREGNANCY CATEGORY X:
            >   Absolute contraindication in pregnancy. Causes spontaneous abortion and
            >   major fetal malformations (neural tube, craniofacial, limb defects).
            >   Women: must use reliable contraception during AND for ≥ 1 cycle after stopping.
            >   Men: must use contraception during AND for ≥ 3 months after stopping.
            >
            > ADVERSE EFFECTS: Hepatotoxicity (monitor LFTs), myelosuppression (CBC),
            >   mucositis/stomatitis (folic acid reduces this), nausea, photosensitivity,
            >   pulmonary toxicity (MTX pneumonitis), nephrotoxicity at high doses.
            >
            > DRUG INTERACTIONS: NSAIDs reduce renal MTX excretion → toxicity.
            >   TMP/SMX: additive folate antagonism → severe myelosuppression.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) \"Yes, take one tablet every morning with breakfast\"",
                "B) \"Take it every other day — daily dosing would be too strong\"",
                "C) \"No — methotrexate for RA is taken ONCE WEEKLY; daily dosing can be fatal\"",
                "D) \"Take it twice a day — split the dose to reduce stomach upset\""
            ],
            correctAnswer: "C) \"No — methotrexate for RA is taken ONCE WEEKLY; daily dosing can be fatal\"",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.46
        ),

        // ── 51 ── ISOTRETINOIN / iPLED+ REMS ─────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ISOTRETINOIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: isotretinoin   BRAND: Claravis, Amnesteem, Absorica, Zenatane
            >   (Original brand Accutane discontinued)
            > CLASS: Systemic retinoid (vitamin A derivative)
            > INDICATION: Severe, recalcitrant, nodular acne unresponsive to other treatments.
            >
            > *** iPLED+ REMS PROGRAM — MOST RESTRICTIVE REMS IN THE US ***
            >   iPLED+ = internet-based Pregnancy Prevention Program
            >   Required because isotretinoin is an absolute TERATOGEN (Category X).
            >   Causes: cardiac defects, craniofacial abnormalities, CNS malformations,
            >   thymus and parathyroid abnormalities — even from a SINGLE dose.
            >
            > iPLED+ REQUIREMENTS — PHARMACY:
            >   — Pharmacy MUST be registered in iPLED+.
            >   — Verify a valid Risk Management Authorization (RMA) number before each dispense.
            >   — Maximum dispense: 30-DAY SUPPLY at a time (no exceptions).
            >   — Prescription must be filled within 7 DAYS of the RMA date.
            >   — NO internet/mail-order dispensing permitted.
            >
            > iPLED+ REQUIREMENTS — FEMALE PATIENTS OF CHILDBEARING POTENTIAL:
            >   — TWO negative pregnancy tests before starting:
            >     #1: At prescriber's office at initial visit.
            >     #2: Confirmed lab test ≥ 19 days after test #1, within 5 days before Rx.
            >   — TWO forms of contraception simultaneously (or certified abstinence + backup).
            >   — Monthly negative pregnancy test THROUGHOUT therapy.
            >   — Pregnancy test 1 month AFTER last dose.
            >
            > iPLED+ REQUIREMENTS — ALL PATIENTS:
            >   — Must register in iPLED+ and sign informed consent.
            >   — Monthly office visits required during therapy.
            >
            > OTHER ADVERSE EFFECTS: Dry skin/lips/eyes/nose (very common, expected),
            >   elevated triglycerides and cholesterol (monitor lipid panel),
            >   hepatotoxicity (monitor LFTs), photosensitivity, night vision impairment,
            >   musculoskeletal pain, depression (black box warning — monitor mood).
            >   Do NOT donate blood during therapy or for 1 month after stopping.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 7-day supply — to allow weekly monitoring of serum triglycerides and LFTs",
                "B) 30-day supply — and the prescription must be filled within 7 days of the RMA date",
                "C) 60-day supply — for patients who have demonstrated 2 months of compliance",
                "D) 90-day supply — standard for chronic dermatological therapy under REMS programs"
            ],
            correctAnswer: "B) 30-day supply — and the prescription must be filled within 7 days of the RMA date",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.52
        )

    ] // end domain1cNodes
}
