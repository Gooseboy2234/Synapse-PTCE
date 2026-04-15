//
//  Domain1b_Medications.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 1 Expansion: Medications (35% of 2026 PTCB Exam)
//  16 additional nodes filling the critical gaps left by the original 28-drug set.
//  Topics: insulin types, ADHD stimulants, antiepileptics, vancomycin, metronidazole,
//          TMP/SMX, naloxone, buprenorphine, antihistamines, digoxin, nitrates,
//          PDE5 inhibitors, bisphosphonates, major drug interactions, auxiliary labels.
//

import Foundation

extension DataNode {

    // MARK: - Domain 1b Node Set

    static let domain1bNodes: [DataNode] = [

        // ── 29 ── INSULIN TYPES ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN TYPES",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Antidiabetic — Insulin analogs and human insulins
            >
            > RAPID-ACTING (onset 15 min | peak 30–90 min | duration 3–5 h):
            >   lispro (Humalog), aspart (NovoLog), glulisine (Apidra)
            >   — Inject within 15 MINUTES of starting a meal.
            >
            > SHORT-ACTING (onset 30 min | peak 2–4 h | duration 6–8 h):
            >   Regular insulin (Humulin R, Novolin R)
            >   — Inject 30 MINUTES before a meal.
            >
            > INTERMEDIATE-ACTING (onset 1–2 h | peak 4–12 h | duration 16–24 h):
            >   NPH (Humulin N, Novolin N) — CLOUDY suspension.
            >   — Can be mixed with regular insulin; draw regular first.
            >
            > LONG-ACTING (onset 1–2 h | NO peak | duration 20–24+ h):
            >   glargine (Lantus, Basaglar, Toujeo), detemir (Levemir),
            >   degludec (Tresiba) — CLEAR solution.
            >   — CANNOT be mixed with any other insulin.
            >
            > STORAGE: Unopened = refrigerate 2–8°C.
            >   In-use vials/pens = room temp per product labeling (up to 28–30 days).
            >   Never freeze insulin; freezing destroys the protein structure.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Regular insulin (Humulin R) — it has no peak effect",
                "B) NPH insulin (Humulin N) — it is given only at bedtime",
                "C) Insulin glargine (Lantus) — it is peakless and cannot be mixed",
                "D) Insulin lispro (Humalog) — it has the longest duration of action"
            ],
            correctAnswer: "C) Insulin glargine (Lantus) — it is peakless and cannot be mixed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30,
            yOffset: 0.07
        ),

        // ── 30 ── ADHD STIMULANTS ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ADHD STIMULANTS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: CNS Stimulants — DEA Schedule II (CII)
            >
            > METHYLPHENIDATE products:
            >   Ritalin (IR), Ritalin LA, Concerta (XR), Daytrana (patch),
            >   Metadate CD, Quillivant XR (liquid)
            >   MECHANISM: Blocks reuptake of dopamine and norepinephrine.
            >
            > AMPHETAMINE products:
            >   Adderall (mixed amphetamine salts, IR),
            >   Adderall XR, Vyvanse (lisdexamfetamine — prodrug, abuse-deterrent),
            >   Dexedrine (dextroamphetamine)
            >   MECHANISM: Blocks and reverses dopamine/NE transporters (also releases DA).
            >
            > NON-STIMULANT alternatives (NOT CII):
            >   Strattera (atomoxetine) — SNRI mechanism; black box warning: suicidal ideation
            >   Intuniv (guanfacine ER) — alpha-2A agonist
            >   Kapvay (clonidine ER) — alpha-2 agonist
            >
            > SCHEDULE II DISPENSING RULES:
            >   — No refills permitted; new Rx required each fill.
            >   — Max 30-day supply (some states allow 90-day with restrictions).
            >   — Written or EPCS Rx only; verbal/fax prohibited for new CII.
            >
            > ADVERSE EFFECTS: Decreased appetite, insomnia, elevated HR/BP, growth
            >   suppression in children, potential for abuse and dependence.
            > CONTRAINDICATIONS: MAOIs (within 14 days), uncontrolled hypertension,
            >   structural cardiac abnormalities, narrow-angle glaucoma.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Schedule III (CIII) — allows up to 5 refills in 6 months",
                "B) Schedule IV (CIV) — allows up to 5 refills in 6 months",
                "C) Schedule II (CII) — NO refills; new prescription required for each fill",
                "D) Schedule V (CV) — may be dispensed without a prescription in some states"
            ],
            correctAnswer: "C) Schedule II (CII) — NO refills; new prescription required for each fill",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.11
        ),

        // ── 31 ── GABAPENTIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: gabapentin   BRAND: Neurontin (IR), Gralise (ER), Horizant (ER)
            > CLASS: Anticonvulsant / Neuropathic pain agent
            >
            > FDA-APPROVED INDICATIONS:
            >   — Adjunctive therapy for partial-onset seizures (adults and children ≥3 yrs)
            >   — Postherpetic neuralgia (PHN) — nerve pain after shingles
            >
            > COMMON OFF-LABEL uses (widely prescribed):
            >   Diabetic neuropathy, fibromyalgia, anxiety, alcohol withdrawal,
            >   restless legs syndrome, hot flashes
            >
            > MECHANISM: Binds to α2δ subunit of voltage-gated calcium channels.
            >   NOTE: Despite the name, does NOT directly affect GABA receptors.
            >
            > PHARMACOKINETICS:
            >   — Renally eliminated; dose MUST be reduced in renal impairment (eGFR < 60).
            >   — Absorption is non-linear (dose-dependent; higher doses absorbed less efficiently).
            >   — No significant protein binding; not hepatically metabolized.
            >
            > ADVERSE EFFECTS: Somnolence, dizziness, ataxia, peripheral edema,
            >   weight gain, blurred vision. Respiratory depression risk with opioids.
            >
            > SCHEDULING: Federal law — NOT scheduled. However, several states
            >   (KY, TN, MI, MN, etc.) have classified gabapentin as Schedule V.
            >   Always check your state's current classification.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Generalized anxiety disorder and insomnia — first-line FDA approval",
                "B) Postherpetic neuralgia and adjunctive treatment of partial seizures",
                "C) Bipolar disorder and acute manic episodes",
                "D) Neuropathic pain only — it has no anticonvulsant indication"
            ],
            correctAnswer: "B) Postherpetic neuralgia and adjunctive treatment of partial seizures",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.17
        ),

        // ── 32 ── PHENYTOIN ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: phenytoin   BRAND: Dilantin, Phenytek
            > PRODRUG IV form: fosphenytoin (Cerebyx) — safer IV, dosed in PE (phenytoin equiv.)
            > CLASS: Anticonvulsant (hydantoin) — NARROW THERAPEUTIC INDEX (NTI)
            >
            > INDICATIONS: Tonic-clonic (grand mal) seizures, complex partial seizures,
            >   status epilepticus (IV form), neurosurgery prophylaxis.
            >
            > MECHANISM: Blocks voltage-gated sodium channels; stabilizes neuronal membranes.
            >
            > THERAPEUTIC DRUG MONITORING (TDM):
            >   Therapeutic range: 10–20 mcg/mL (total phenytoin)
            >   Free phenytoin (unbound): 1–2 mcg/mL
            >   — Must correct for albumin in hypoalbuminemic patients.
            >   — Zero-order (saturation) kinetics: small dose increases can cause
            >     disproportionately large serum level increases.
            >
            > TOXICITY SIGNS (level-dependent):
            >   > 20 mcg/mL → Nystagmus (first sign)
            >   > 30 mcg/mL → Ataxia, slurred speech
            >   > 40 mcg/mL → Lethargy, cognitive impairment, seizures
            >
            > ADVERSE EFFECTS: Gingival hyperplasia (gum overgrowth), hirsutism,
            >   acne, coarsening of facial features, hypersensitivity (SJS risk),
            >   teratogenic (fetal hydantoin syndrome — Category D).
            >
            > DRUG INTERACTIONS: Strong CYP enzyme INDUCER (3A4, 2C9, 2C19).
            >   Decreases levels of: warfarin, oral contraceptives, statins, many others.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 2–5 mcg/mL",
                "B) 10–20 mcg/mL",
                "C) 50–100 mcg/mL",
                "D) 0.8–2.0 ng/mL"
            ],
            correctAnswer: "B) 10–20 mcg/mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.23
        ),

        // ── 33 ── TMP/SMX (BACTRIM) ──────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP/SMX",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: sulfamethoxazole / trimethoprim
            > BRAND: Bactrim, Bactrim DS, Septra, Septra DS
            > CLASS: Sulfonamide antibiotic combination (folate synthesis inhibitor)
            >
            > COMMON INDICATIONS:
            >   — Uncomplicated urinary tract infections (UTIs) — first-line
            >   — Acute otitis media in children
            >   — Community-acquired MRSA (methicillin-resistant S. aureus) skin infections
            >   — PCP (Pneumocystis jirovecii pneumonia) prophylaxis and treatment
            >   — Traveler's diarrhea (Shigella, E. coli)
            >
            > MECHANISM:
            >   SMX inhibits dihydropteroate synthase (DHPS).
            >   TMP inhibits dihydrofolate reductase (DHFR).
            >   Together: sequential blockade of bacterial folate synthesis.
            >
            > KEY COUNSELING POINTS:
            >   — Drink PLENTY of water (prevents crystalluria / kidney stones).
            >   — AVOID PROLONGED SUN EXPOSURE (photosensitivity reaction).
            >   — Take with or without food (food reduces GI upset).
            >
            > CONTRAINDICATIONS:
            >   — Sulfa allergy (cross-reactivity with sulfonamide diuretics debated)
            >   — Pregnancy (especially near term — kernicterus risk in neonate)
            >   — Severe renal or hepatic impairment
            >   — G6PD deficiency (hemolytic anemia risk)
            >
            > ADVERSE EFFECTS: Rash (including SJS risk), photosensitivity, nausea,
            >   hyperkalemia, elevated SCr (blocks tubular secretion, not true CKD),
            >   thrombocytopenia, leukopenia.
            >
            > DRUG INTERACTION: Inhibits CYP2C9 — increases warfarin levels (bleeding risk).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Take on an empty stomach to enhance absorption and speed onset",
                "B) Avoid prolonged sunlight exposure and drink plenty of water",
                "C) Take with a full glass of milk for best gastrointestinal tolerance",
                "D) This medication is safe to use in patients with sulfa allergies"
            ],
            correctAnswer: "B) Avoid prolonged sunlight exposure and drink plenty of water",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.27
        ),

        // ── 34 ── METRONIDAZOLE ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METRONIDAZOLE",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: metronidazole   BRAND: Flagyl, Flagyl ER, MetroGel (topical)
            > CLASS: Nitroimidazole antibiotic / antiprotozoal
            >
            > INDICATIONS:
            >   — Bacterial vaginosis (BV)
            >   — Clostridioides difficile (C. diff) infections — oral PO preferred
            >   — Anaerobic bacterial infections (intra-abdominal, skin/soft tissue)
            >   — Helicobacter pylori (part of triple/quadruple therapy)
            >   — Trichomoniasis — treat patient AND sexual partner
            >   — Giardiasis, amebiasis
            >
            > MECHANISM: Prodrug; reduced in anaerobic organisms to a toxic free-radical
            >   intermediate that damages bacterial/protozoal DNA.
            >
            > *** CRITICAL DRUG INTERACTION ***
            >   ALCOHOL + METRONIDAZOLE = DISULFIRAM-LIKE REACTION:
            >   Flushing, severe nausea/vomiting, headache, palpitations.
            >   AVOID ALL alcohol (including mouthwash, cough syrups) during therapy
            >   AND for at least 48 hours (72h for tinidazole) AFTER completing course.
            >
            > ADDITIONAL INTERACTIONS:
            >   — Warfarin: inhibits CYP2C9 → increased INR / bleeding risk.
            >   — Lithium: may increase lithium levels (toxicity risk).
            >
            > ADVERSE EFFECTS: Metallic taste (very common), nausea, headache,
            >   peripheral neuropathy (with prolonged use), darkening of urine (harmless).
            >
            > NOTE: IV metronidazole contains significant sodium — monitor in CHF patients.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Dairy products chelate the drug, drastically reducing absorption",
                "B) Grapefruit juice inhibits CYP3A4, significantly increasing drug levels",
                "C) Alcohol produces a disulfiram-like reaction — flushing, nausea, vomiting",
                "D) Antacids bind the drug in the GI tract, reducing bioavailability by 40%"
            ],
            correctAnswer: "C) Alcohol produces a disulfiram-like reaction — flushing, nausea, vomiting",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.42,
            yOffset: 0.33
        ),

        // ── 35 ── VANCOMYCIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "VANCOMYCIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: vancomycin   BRAND: Vancocin (oral capsules — C. diff only)
            > CLASS: Glycopeptide antibiotic — bactericidal
            >
            > KEY FACT: IV vancomycin does NOT absorb orally.
            >   → IV form = systemic infections (MRSA, endocarditis, bacteremia, meningitis)
            >   → Oral form (Vancocin PO) = ONLY for C. difficile colitis (gut-local action)
            >
            > INDICATIONS (IV):
            >   — MRSA infections of any site (go-to anti-MRSA agent)
            >   — Gram-positive infections in beta-lactam allergic patients
            >   — Bacterial endocarditis
            >   — CNS infections (meningitis) — high doses required (limited CNS penetration)
            >
            > THERAPEUTIC DRUG MONITORING (TDM):
            >   AUC/MIC-guided dosing is now preferred (2020 ASHP/IDSA/SIDP consensus).
            >   Trough target (traditional): 15–20 mcg/mL for serious infections.
            >   Always ordered as actual dose in mg, administered over ≥ 60 minutes.
            >
            > *** RED MAN SYNDROME ***
            >   NOT a true allergic reaction — an infusion-related reaction.
            >   Caused by: TOO-RAPID IV INFUSION (mast cell degranulation).
            >   Symptoms: Flushing, erythema (redness) of face/neck/upper torso,
            >             pruritus, hypotension.
            >   Treatment: Slow or stop infusion; pretreat with diphenhydramine.
            >   Minimum infusion time: 60 minutes (longer for large doses).
            >
            > ADVERSE EFFECTS: Nephrotoxicity (especially with aminoglycosides),
            >   ototoxicity (rare at normal levels), thrombophlebitis at IV site.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Stevens-Johnson Syndrome — a severe hypersensitivity immune reaction",
                "B) Red Man Syndrome — caused by too-rapid IV infusion, not a true allergy",
                "C) Type I anaphylaxis — IgE-mediated immediate hypersensitivity",
                "D) Serum sickness — immune complex deposition causing delayed reaction"
            ],
            correctAnswer: "B) Red Man Syndrome — caused by too-rapid IV infusion, not a true allergy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.78,
            yOffset: 0.37
        ),

        // ── 36 ── NALOXONE ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NALOXONE",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: naloxone   BRAND: Narcan (nasal spray), Evzio (auto-injector),
            >   Kloxxado (intranasal), Zimhi (IM injection)
            > CLASS: Opioid antagonist — pure antagonist, no agonist activity
            >
            > PRIMARY USE: Emergency reversal of opioid overdose (respiratory depression).
            >
            > MECHANISM: Competitive antagonist at mu (μ), kappa (κ), and delta (δ) opioid
            >   receptors. Displaces opioids from receptors, reversing CNS and respiratory
            >   depression within 2–5 minutes (nasal spray) or 1–2 minutes (IV).
            >
            > ROUTES: IV/IM/SubQ (hospital), intranasal (Narcan spray — community),
            >   IM auto-injector (Evzio — community). Intranasal is most common community use.
            >
            > IMPORTANT CLINICAL NOTES:
            >   — Half-life is SHORTER than most opioids (30–90 min). Repeat doses often
            >     needed; patient may re-narcotize after naloxone wears off.
            >   — Call 911 even after naloxone administration — monitoring required.
            >   — Precipitates acute opioid withdrawal in opioid-dependent patients
            >     (agitation, nausea, vomiting, pain — not life-threatening).
            >
            > OTC AVAILABILITY:
            >   Narcan 4 mg nasal spray is FDA-approved OTC (since March 2023).
            >   Many states have standing orders allowing pharmacy dispensing without Rx.
            >
            > NALTREXONE (Vivitrol, ReVia): Related antagonist — used for MAINTENANCE
            >   treatment of opioid or alcohol use disorder (NOT for acute reversal).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It stimulates mu-opioid receptors to trigger a paradoxical reversal response",
                "B) It competitively displaces opioids from mu-opioid receptors as a pure antagonist",
                "C) It induces rapid hepatic metabolism of circulating opioids via CYP3A4",
                "D) It binds GABA-A receptors to counteract opioid-induced CNS depression"
            ],
            correctAnswer: "B) It competitively displaces opioids from mu-opioid receptors as a pure antagonist",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.43
        ),

        // ── 37 ── BUPRENORPHINE/NALOXONE ────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPRENORPHINE",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > COMBINATION PRODUCT: buprenorphine / naloxone
            > BRAND: Suboxone (SL film), Zubsolv (SL tablet), Bunavail (buccal film)
            > MONOTHERAPY: Subutex (buprenorphine SL tablet — used in pregnancy)
            > CLASS: Partial opioid agonist (buprenorphine) + antagonist (naloxone)
            > DEA SCHEDULE: CII (Schedule III in some older literature; reclassified to CII)
            >   NOTE: As of October 2023, all buprenorphine products are CII.
            >
            > PRIMARY USE: Medication-Assisted Treatment (MAT) of Opioid Use Disorder (OUD).
            >   Also: buprenorphine alone (Belbuca buccal, Butrans patch) for chronic pain.
            >
            > WHY THE COMBINATION?
            >   Naloxone (NX) is poorly absorbed sublingually — it is present as an
            >   ABUSE-DETERRENT. If the film is dissolved and injected IV, naloxone
            >   absorbs systemically and precipitates withdrawal.
            >
            > MECHANISM (buprenorphine):
            >   Partial agonist at mu (μ) receptor — high binding affinity, low intrinsic
            >   activity. Ceiling effect on respiratory depression (safer than full agonists).
            >   Very long half-life (~24–72 hours) — once-daily dosing.
            >
            > CLINICAL NOTES:
            >   — Prescribers no longer need a waiver (DATA 2000 X-waiver eliminated 2023).
            >   — Any licensed DEA-registered provider may now prescribe.
            >   — Induction: Patient must be in MILD-MODERATE withdrawal before first dose
            >     (to avoid precipitated withdrawal).
            >
            > ADVERSE EFFECTS: Headache, nausea, constipation, sweating, insomnia.
            >   Hepatotoxicity (rare but monitor LFTs).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Rapid detoxification from opioids in an inpatient emergency setting",
                "B) Treatment of severe acute pain refractory to standard opioid therapy",
                "C) Medication-Assisted Treatment (MAT) for opioid use disorder",
                "D) Reversal of acute opioid overdose in the community setting"
            ],
            correctAnswer: "C) Medication-Assisted Treatment (MAT) for opioid use disorder",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.65,
            yOffset: 0.47
        ),

        // ── 38 ── ANTIHISTAMINES ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ANTIHISTAMINES",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: H1-receptor antagonists — block histamine at H1 receptors
            >
            > FIRST-GENERATION (sedating — cross blood-brain barrier):
            >   diphenhydramine (Benadryl) — also used for sleep, motion sickness
            >   hydroxyzine (Vistaril, Atarax) — also for anxiety, pruritus
            >   promethazine (Phenergan) — also for nausea/vomiting (antiemetic)
            >   chlorpheniramine (Chlor-Trimeton) — OTC cold/allergy
            >   meclizine (Antivert) — motion sickness, vertigo
            >
            >   ADVERSE EFFECTS (anticholinergic): Sedation, dry mouth, urinary retention,
            >   constipation, blurred vision, confusion (especially in elderly).
            >   BEERS CRITERIA: Diphenhydramine — AVOID in patients ≥ 65 years old.
            >
            > SECOND-GENERATION (non-sedating — minimal CNS penetration):
            >   cetirizine (Zyrtec) — slightly more sedating than others in class
            >   loratadine (Claritin) — least sedating; best choice for daytime use
            >   fexofenadine (Allegra) — very non-sedating; does not cross BBB well
            >   levocetirizine (Xyzal) — active enantiomer of cetirizine
            >   desloratadine (Clarinex) — active metabolite of loratadine
            >
            >   ADVERSE EFFECTS: Minimal sedation, headache; cetirizine may cause
            >   mild drowsiness at higher doses.
            >
            > KEY DISTINCTION: 1st gen = sedating + anticholinergic side effects.
            >   2nd gen = non-sedating; preferred for daytime allergy management.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Diphenhydramine (Benadryl) — first-generation, non-sedating",
                "B) Hydroxyzine (Vistaril) — second-generation, preferred in elderly",
                "C) Cetirizine (Zyrtec) — second-generation, suitable for daytime use",
                "D) Promethazine (Phenergan) — second-generation, no anticholinergic effects"
            ],
            correctAnswer: "C) Cetirizine (Zyrtec) — second-generation, suitable for daytime use",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.53
        ),

        // ── 39 ── DIGOXIN ────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: digoxin   BRAND: Lanoxin
            > CLASS: Cardiac glycoside — NARROW THERAPEUTIC INDEX (NTI)
            >
            > INDICATIONS:
            >   — Heart failure with reduced ejection fraction (HFrEF) — symptom control
            >   — Atrial fibrillation / atrial flutter — rate control (slows AV node)
            >
            > MECHANISM:
            >   (1) Inhibits Na+/K+-ATPase pump → ↑ intracellular Na+ → ↑ intracellular Ca²+
            >       → Increased myocardial contractility (positive inotropy).
            >   (2) Increases vagal tone → slows SA node and AV conduction (rate control).
            >
            > THERAPEUTIC RANGE: 0.5–2.0 ng/mL (most labs; heart failure goal 0.5–0.9 ng/mL).
            >
            > *** DIGOXIN TOXICITY ***
            >   Early signs: Nausea, vomiting, anorexia, fatigue.
            >   Classic visual sign: YELLOW-GREEN halos / xanthopsia (yellow-tinged vision).
            >   Cardiac: Bradycardia, heart block, PVCs, life-threatening arrhythmias.
            >
            >   PRECIPITATED BY HYPOKALEMIA (low K+):
            >   Hypokalemia (and hypomagnesemia) increases digoxin binding affinity
            >   at Na+/K+-ATPase → toxicity at "normal" levels.
            >   Monitor electrolytes in patients on concurrent diuretics (thiazides, loop).
            >
            > ANTIDOTE: Digibind / DigiFab (digoxin-specific antibody fragments) —
            >   used for life-threatening toxicity.
            >
            > INTERACTIONS: Amiodarone, verapamil, quinidine, macrolides — all increase
            >   digoxin levels (reduce digoxin dose by 50%).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) A normal therapeutic response — yellow vision is an expected side effect",
                "B) Digoxin toxicity — often precipitated by concurrent hypokalemia",
                "C) An allergic hypersensitivity reaction requiring drug discontinuation",
                "D) A drug interaction with a concurrently prescribed statin medication"
            ],
            correctAnswer: "B) Digoxin toxicity — often precipitated by concurrent hypokalemia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.75,
            yOffset: 0.57
        ),

        // ── 40 ── NITROGLYCERIN ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NITROGLYCERIN",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > GENERIC: nitroglycerin (NTG)
            > BRAND: Nitrostat (SL tablet), Nitro-Dur (transdermal patch),
            >   Nitrolingual (SL spray), Nitro-Bid (ointment), NitroMist (spray)
            > CLASS: Organic nitrate — vasodilator
            >
            > INDICATIONS:
            >   — Acute angina (chest pain) relief — sublingual NTG
            >   — Angina prophylaxis — long-acting formulations (patch, ointment)
            >   — Acute heart failure / hypertensive emergency (IV NTG)
            >
            > MECHANISM: Prodrug → releases nitric oxide (NO) in vascular smooth muscle
            >   → activates guanylate cyclase → ↑ cGMP → vasodilation.
            >   Primarily VENODILATION (reduces preload); some arterial dilation.
            >
            > SUBLINGUAL NTG — KEY PATIENT INSTRUCTIONS:
            >   1. Sit or lie down before taking (prevent fainting from hypotension).
            >   2. Place tablet UNDER THE TONGUE; do not swallow.
            >   3. May repeat every 5 minutes × 3 doses.
            >   4. If no relief after 3 doses, call 911 — possible MI.
            >
            > *** CRITICAL STORAGE RULE ***
            >   Keep in the ORIGINAL AMBER GLASS BOTTLE, tightly closed.
            >   Store at room temperature — away from heat, light, and moisture.
            >   Do NOT transfer to plastic (NTG absorbs into plastic and loses potency).
            >   Discard opened bottles after 6 months.
            >
            > ADVERSE EFFECTS: Hypotension, reflex tachycardia, headache (very common —
            >   due to vasodilation), dizziness, flushing.
            >
            > CONTRAINDICATION: PDE5 inhibitors (sildenafil, tadalafil, vardenafil) —
            >   severe, potentially fatal hypotension (additive vasodilation).
            >   WAIT: 24h after sildenafil/vardenafil; 48h after tadalafil before NTG.
            >
            > NITRATE TOLERANCE: Develops with continuous use; requires a 10–12h
            >   nitrate-free interval daily (patch removed at bedtime).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Store in a clear plastic pill organizer at room temperature for easy access",
                "B) Keep in the original amber glass bottle, tightly closed, away from heat and light",
                "C) Refrigerate at 2–8°C to preserve potency between uses",
                "D) Transfer to a metal container — glass may cause nitroglycerin crystallization"
            ],
            correctAnswer: "B) Keep in the original amber glass bottle, tightly closed, away from heat and light",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.63
        ),

        // ── 41 ── PDE5 INHIBITORS ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PDE5 INHIBITORS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Phosphodiesterase type-5 (PDE5) inhibitors
            >
            > DRUGS IN CLASS:
            >   sildenafil (Viagra — erectile dysfunction; Revatio — pulmonary arterial HTN)
            >   tadalafil (Cialis — ED and BPH; Adcirca — pulmonary arterial HTN)
            >   vardenafil (Levitra) — ED only
            >   avanafil (Stendra) — ED only, fastest onset (~15 min)
            >
            > MECHANISM: Inhibit PDE5 → prevent cGMP breakdown → prolonged smooth muscle
            >   relaxation → vasodilation → increased blood flow to corpus cavernosum (ED)
            >   or pulmonary vasculature (PAH).
            >
            > *** ABSOLUTE CONTRAINDICATION: NITRATES ***
            >   NEVER combine with any nitrate (NTG, isosorbide mononitrate/dinitrate).
            >   MECHANISM: Both increase cGMP → additive vasodilation → SEVERE HYPOTENSION,
            >   syncope, myocardial infarction, death.
            >   TIME RESTRICTION before giving nitrates:
            >   — Sildenafil or vardenafil: wait ≥ 24 hours
            >   — Tadalafil: wait ≥ 48 hours (long half-life ~17.5 h)
            >
            > ALSO AVOID WITH: Alpha-blockers (additive hypotension); HIV protease
            >   inhibitors (CYP3A4 inhibitors increase PDE5i levels — reduce dose).
            >
            > ADVERSE EFFECTS: Headache, flushing, nasal congestion, dyspepsia,
            >   visual disturbances (blue tinge — transient), hypotension.
            >   Rare: NAION (non-arteritic anterior ischemic optic neuropathy).
            >
            > TADALAFIL: Unique — daily low-dose (2.5–5 mg) for BPH or daily ED use;
            >   also treats lower urinary tract symptoms (LUTS) with BPH.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) QT prolongation — additive cardiac conduction slowing causes fatal arrhythmia",
                "B) Severe hypotension — both drugs increase cGMP causing additive vasodilation",
                "C) Serotonin syndrome — combined CNS stimulation overwhelms serotonin receptors",
                "D) Acute kidney injury — synergistic nephrotoxicity damages proximal tubules"
            ],
            correctAnswer: "B) Severe hypotension — both drugs increase cGMP causing additive vasodilation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.67
        ),

        // ── 42 ── BISPHOSPHONATES ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BISPHOSPHONATES",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Bisphosphonates — bone resorption inhibitors
            >
            > DRUGS:
            >   alendronate (Fosamax) — weekly oral tablet (70 mg) or daily (10 mg)
            >   risedronate (Actonel) — weekly or monthly oral
            >   ibandronate (Boniva) — monthly oral or quarterly IV
            >   zoledronic acid (Reclast) — annual IV infusion (most potent)
            >   pamidronate (Aredia) — IV, oncology use
            >
            > INDICATIONS: Osteoporosis (prevention and treatment), Paget's disease,
            >   hypercalcemia of malignancy, bone metastases, glucocorticoid-induced
            >   osteoporosis.
            >
            > MECHANISM: Inhibit osteoclast activity → decreased bone resorption →
            >   maintains or increases bone mineral density.
            >
            > *** CRITICAL ORAL ADMINISTRATION RULES (alendronate/risedronate) ***
            >   1. Take FIRST THING IN THE MORNING on an empty stomach.
            >   2. Take with a FULL glass of PLAIN WATER only (no juice, coffee, milk).
            >      — Food/beverages reduce absorption by up to 60%.
            >   3. Remain UPRIGHT (sit or stand) for at LEAST 30 MINUTES after taking.
            >      — Prevents esophageal irritation, esophagitis, ulceration.
            >   4. Do NOT lie down or eat for 30 minutes after taking.
            >
            > ADVERSE EFFECTS:
            >   Oral: Esophagitis, esophageal ulcers, GI upset, heartburn.
            >   Systemic: Osteonecrosis of the jaw (ONJ) — rare, more common with IV
            >     and in cancer patients; atypical femur fractures (long-term use).
            >   IV: Acute-phase reaction (flu-like symptoms — fever, myalgia — first infusion).
            >
            > CONTRAINDICATIONS: Esophageal abnormalities, inability to sit/stand for 30 min,
            >   hypocalcemia, severe renal impairment (CrCl < 30–35 mL/min).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Take with a full glass of milk to optimize calcium co-absorption",
                "B) Take at bedtime to allow maximum overnight bone incorporation",
                "C) Take first thing in the morning with plain water, then stay upright for 30 minutes",
                "D) Take with food to minimize the risk of gastrointestinal side effects"
            ],
            correctAnswer: "C) Take first thing in the morning with plain water, then stay upright for 30 minutes",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.35,
            yOffset: 0.73
        ),

        // ── 43 ── MAJOR DRUG INTERACTIONS ───────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DRUG INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TOPIC: Major clinically significant drug-drug interactions (DDIs)
            >
            > WARFARIN INTERACTIONS (CYP2C9 substrate — many DDIs):
            >   Inhibitors (↑ warfarin → ↑ bleeding risk): fluconazole, amiodarone,
            >   metronidazole, TMP/SMX, many antibiotics (alter gut flora → ↓ vit K).
            >   Inducers (↓ warfarin → ↓ anticoagulant effect): rifampin, phenytoin,
            >   carbamazepine, St. John's Wort, barbiturates.
            >   MONITOR: INR; adjust dose; patient education on consistent vitamin K intake.
            >
            > SEROTONIN SYNDROME — MAOI + SEROTONERGIC DRUGS:
            >   NEVER combine MAOIs (phenelzine, tranylcypromine, selegiline) with:
            >   SSRIs, SNRIs, TCAs, meperidine (Demerol), linezolid, methylene blue.
            >   WASHOUT: 14 days between MAOI and SSRI (or 5 weeks after fluoxetine).
            >   SYMPTOMS: Agitation, hyperreflexia, diaphoresis, hyperthermia, tremor.
            >
            > STATIN + GRAPEFRUIT JUICE (CYP3A4 inhibition):
            >   Grapefruit inhibits intestinal CYP3A4 → ↑ simvastatin, lovastatin,
            >   atorvastatin levels → ↑ myopathy / rhabdomyolysis risk.
            >   Safe statins with grapefruit: pravastatin, rosuvastatin, fluvastatin.
            >
            > FLUOROQUINOLONE + DIVALENT CATIONS:
            >   Ciprofloxacin / levofloxacin absorption DECREASED by 50–90% when taken
            >   with: antacids (Ca²+, Mg²+, Al³+), iron, zinc, sucralfate, dairy.
            >   TIMING: Take fluoroquinolone 2h BEFORE or 6h AFTER these products.
            >
            > TETRACYCLINES + DAIRY / ANTACIDS:
            >   Doxycycline / tetracycline chelated by Ca²+, Mg²+, Al³+, Fe²+.
            >   → Avoid dairy, antacids, iron within 2–3 hours of tetracycline dose.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) No interaction — antifungals do not affect hepatic enzyme metabolism",
                "B) Fluconazole inhibits CYP2C9, slowing warfarin metabolism and raising bleeding risk",
                "C) Fluconazole induces CYP2C9, accelerating warfarin clearance and reducing its effect",
                "D) The interaction is only clinically relevant with IV fluconazole, not oral therapy"
            ],
            correctAnswer: "B) Fluconazole inhibits CYP2C9, slowing warfarin metabolism and raising bleeding risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.77
        ),

        // ── 44 ── AUXILIARY LABELS ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AUXILIARY LABELS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TOPIC: Auxiliary (ancillary) labels — supplemental dispensing instructions
            >
            > PURPOSE: Provide additional counseling beyond the main prescription label.
            >   Required for specific drug classes to ensure safe and effective use.
            >
            > COMMON AUXILIARY LABELS AND WHEN THEY APPLY:
            >
            > "REFRIGERATE — DO NOT FREEZE"
            >   Amoxicillin suspension, insulin (unopened), metronidazole gel,
            >   erythromycin suspension, azithromycin suspension (after reconstitution)
            >
            > "PROTECT FROM LIGHT"
            >   Nitroprusside, furosemide IV, promethazine injection,
            >   nitroglycerin tablets, tetracycline
            >
            > "AVOID PROLONGED EXPOSURE TO SUNLIGHT (PHOTOSENSITIVITY)"
            >   Doxycycline, TMP/SMX (Bactrim), fluoroquinolones (ciprofloxacin),
            >   amiodarone, voriconazole, chlorpromazine, thiazide diuretics
            >
            > "TAKE WITH FOOD OR MILK"
            >   NSAIDs (ibuprofen, naproxen), metronidazole, prednisone,
            >   potassium chloride (KCl), nitrofurantoin (improves absorption)
            >
            > "DO NOT DRINK ALCOHOL"
            >   Metronidazole, tinidazole, disulfiram, sedatives/hypnotics,
            >   methotrexate (hepatotoxicity), benzodiazepines (additive CNS depression)
            >
            > "SHAKE WELL"
            >   Any suspension (amoxicillin, azithromycin, clindamycin, antacids),
            >   topical lotions and suspensions
            >
            > "MAY CAUSE DROWSINESS — USE CAUTION WHEN DRIVING"
            >   Benzodiazepines, opioids, first-generation antihistamines, muscle relaxants,
            >   gabapentin, pregabalin, many antidepressants
            >
            > "SWALLOW WHOLE — DO NOT CRUSH OR CHEW"
            >   Enteric-coated tablets (EC), extended-release (ER/XR/XL/SR) formulations
            """,
            challengeType: .multipleChoice,
            options: [
                "A) \"May cause drowsiness — avoid driving\" — doxycycline is a sedating antibiotic",
                "B) \"Refrigerate — do not freeze\" — tetracyclines require cold chain storage",
                "C) \"Avoid prolonged exposure to sunlight\" — doxycycline causes photosensitivity",
                "D) \"Take with antacids for best absorption\" — antacids protect the GI tract"
            ],
            correctAnswer: "C) \"Avoid prolonged exposure to sunlight\" — doxycycline causes photosensitivity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.83
        )

    ] // end domain1bNodes
}
