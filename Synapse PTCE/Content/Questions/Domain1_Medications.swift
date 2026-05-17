//
//  Domain1_Medications.swift
//  Synapse PTCE
//
//  Phase 2 — Domain 1: Medications (35% of 2026 PTCB Exam)
//  28 drug nodes covering top pharmacology concepts tested on the PTCE.
//  Topics: generic/brand names, drug classes, mechanisms, indications,
//          adverse effects, contraindications, key monitoring parameters.
//

import Foundation

extension DataNode {

    // MARK: - Domain 1 Node Set

    static let domain1Nodes: [DataNode] = [

        // ── 01 ── METFORMIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN",
            loreText: """
            > A pill used to treat Type 2 diabetes — usually the first medication a doctor prescribes
            > Brand names: Glucophage, Glucophage XR — Drug class: Biguanide
            > How it works: tells your liver to release less sugar into your blood, and helps your body use insulin more effectively
            > KEY FACT: Used by itself, it will NOT cause low blood sugar — this is a major exam point
            > Common side effects: nausea, diarrhea, upset stomach — always take WITH food to reduce these
            > CAUTION: Must be stopped before X-ray tests that use contrast dye, and if kidneys are severely damaged (measured by a lab value called eGFR < 30)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stimulates pancreatic beta cells to release insulin",
                "B. Decreases hepatic glucose production",
                "C. Inhibits intestinal alpha-glucosidase",
                "D. Increases renal glucose excretion (glycosuria)"
            ],
            correctAnswer: "B. Decreases hepatic glucose production",
            isUnlocked: true,
            isCompleted: false,
            xOffset: 0.15, yOffset: 0.15
        ),

        // ── 02 ── GLIPIZIDE ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GLIPIZIDE",
            loreText: """
            > A diabetes pill that makes your pancreas release more insulin into your blood
            > Brand names: Glucotrol, Glucotrol XL — Drug class: Sulfonylurea (2nd generation)
            > Take it 30 minutes BEFORE a meal so the insulin surge matches when food is digested
            > BIG RISK: Low blood sugar (hypoglycemia) — this is the #1 danger of the entire sulfonylurea class
            > Low blood sugar risk is highest in elderly patients, those who skip meals, and those with kidney or liver problems
            > KEY: Sulfonylurea = makes more insulin = the drug class most likely to cause low blood sugar
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Sulfonylurea",
                "B. Biguanide",
                "C. DPP-4 Inhibitor",
                "D. SGLT-2 Inhibitor"
            ],
            correctAnswer: "A. Sulfonylurea",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.42, yOffset: 0.13
        ),

        // ── 03 ── LISINOPRIL ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL",
            loreText: """
            > A blood pressure pill from the ACE inhibitor family — one of the most prescribed drugs in the US
            > Brand names: Zestril, Prinivil — Drug class: ACE Inhibitor (ACEI)
            > How it works: blocks a chain of reactions in the body that cause blood vessels to tighten, so they relax and blood pressure drops
            > Most famous side effect: a dry, nagging cough that won't go away — affects about 1 in 10 patients
            > NEVER give to a pregnant patient — it causes serious kidney damage to the developing baby
            > Also watch for: potassium levels rising too high, and swelling of the face or throat (called angioedema — a medical emergency requiring immediate care)
            > Best use: high blood pressure in patients who also have diabetes — it protects their kidneys
            > KEY: ACE inhibitor = dry cough is the #1 side effect, NEVER use in pregnancy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Peripheral edema",
                "B. Dry, persistent cough",
                "C. Bradycardia",
                "D. Hypokalemia"
            ],
            correctAnswer: "B. Dry, persistent cough",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70, yOffset: 0.18
        ),

        // ── 04 ── LOSARTAN ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LOSARTAN",
            loreText: """
            > A blood pressure pill similar to ACE inhibitors — but without the cough
            > Brand name: Cozaar — Drug class: ARB (Angiotensin Receptor Blocker)
            > How it works: blocks the same tightening reaction as ACE inhibitors, but one step later — so no cough side effect
            > Key difference from ACE inhibitors: ARBs do NOT cause the dry cough
            > But just like ACE inhibitors: NEVER use during pregnancy (same risk of fetal harm), and potassium can rise too high
            > Used for: high blood pressure, protecting kidneys in diabetics, heart failure
            > KEY: ARB = same benefits as ACE inhibitors, but NO cough — still NOT safe in pregnancy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. ARBs cause more hyperkalemia than ACE inhibitors",
                "B. ARBs do not cause the persistent dry cough seen with ACE inhibitors",
                "C. ARBs are safe to use during pregnancy",
                "D. ARBs block ACE to prevent angiotensin II formation"
            ],
            correctAnswer: "B. ARBs do not cause the persistent dry cough seen with ACE inhibitors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88, yOffset: 0.28
        ),

        // ── 05 ── METOPROLOL ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL",
            loreText: """
            > A "beta blocker" — slows your heart rate and lowers blood pressure
            > Drug class: Beta-1 selective adrenergic blocker
            > Two very different versions with two different brand names — NOT interchangeable:
            >   Lopressor (metoprolol tartrate) = immediate release
            >   Toprol-XL (metoprolol succinate) = extended release — lasts all day
            > How it works: blocks the nerve signals that make the heart beat faster and harder
            > NEVER stop suddenly — must be slowly reduced over time or blood pressure can dangerously spike back (rebound effect)
            > Caution in diabetics: masks the warning signs of low blood sugar (like rapid heartbeat and shakiness)
            > Used for: high blood pressure, chest pain (angina), heart failure, irregular heartbeat, post-heart attack recovery
            > KEY: Two formulations are NOT interchangeable; NEVER stop metoprolol abruptly
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Alpha-1 adrenergic receptors",
                "B. Beta-1 adrenergic receptors",
                "C. Beta-2 adrenergic receptors",
                "D. Both beta-1 and beta-2 adrenergic receptors"
            ],
            correctAnswer: "B. Beta-1 adrenergic receptors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22, yOffset: 0.30
        ),

        // ── 06 ── AMLODIPINE ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE",
            loreText: """
            > A blood pressure pill called a calcium channel blocker (CCB)
            > Brand name: Norvasc — Drug class: Dihydropyridine Calcium Channel Blocker
            > How it works: calcium makes blood vessel walls contract and tighten. This drug blocks calcium from entering the vessel walls, so they relax and widen — blood pressure drops
            > Most common side effect: swollen ankles and feet (peripheral edema) — the #1 tested side effect for this drug
            > Taken once daily — stays in the body a long time (long half-life)
            > Works well in elderly patients with high blood pressure
            > Does NOT significantly slow the heart rate (unlike some other blood pressure drugs)
            > KEY: Amlodipine (CCB) = ankle/leg swelling is the most common side effect
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Bradycardia",
                "B. Peripheral edema",
                "C. Dry cough",
                "D. Hyperkalemia"
            ],
            correctAnswer: "B. Peripheral edema",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.52, yOffset: 0.26
        ),

        // ── 07 ── HYDROCHLOROTHIAZIDE ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HCTZ",
            loreText: """
            > A "water pill" (diuretic) used to lower blood pressure by removing extra fluid from the body
            > Full name: Hydrochlorothiazide — Brand: Microzide — Drug class: Thiazide Diuretic
            > How it works: tells the kidneys to release more salt and water into the urine, which lowers blood volume and blood pressure
            > Critical electrolyte side effects — these are heavily tested on the PTCB exam:
            >   LOW potassium (hypokalemia) — the most common electrolyte problem
            >   HIGH uric acid — can trigger a painful gout attack
            >   HIGH blood sugar — worsens diabetes control
            >   LOW sodium (hyponatremia)
            > KEY: HCTZ causes LOW potassium (hypokalemia) — memorize this for the exam
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperkalemia",
                "B. Hypokalemia",
                "C. Hypocalcemia",
                "D. Hypernatremia"
            ],
            correctAnswer: "B. Hypokalemia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.80, yOffset: 0.40
        ),

        // ── 08 ── ATORVASTATIN ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN",
            loreText: """
            > A "statin" — the most common type of cholesterol-lowering medication
            > Brand name: Lipitor — Drug class: HMG-CoA Reductase Inhibitor (Statin)
            > How it works: blocks an enzyme your liver uses to make cholesterol, so less "bad" LDL cholesterol gets into your blood
            > MOST SERIOUS RISK: Rhabdomyolysis — the muscles start breaking down (feels like severe muscle pain or weakness)
            >   Patients must report muscle pain immediately; a blood test checks for muscle damage (CK level)
            > Also monitor liver function periodically
            > NEVER give to a pregnant patient — harms the developing baby
            > FOOD INTERACTION: Grapefruit juice raises atorvastatin levels dangerously high — avoid it completely
            > Can be taken at any time of day (long half-life, works 24 hours)
            > KEY: Statin = muscle breakdown risk (rhabdomyolysis), no grapefruit, never in pregnancy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hepatotoxicity requiring liver transplant",
                "B. Nephrotoxicity (kidney failure)",
                "C. Rhabdomyolysis (muscle breakdown)",
                "D. Stevens-Johnson Syndrome (severe skin reaction)"
            ],
            correctAnswer: "C. Rhabdomyolysis (muscle breakdown)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.12, yOffset: 0.43
        ),

        // ── 09 ── AMOXICILLIN ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN",
            loreText: """
            > One of the most commonly prescribed antibiotics in the world — in the penicillin family
            > Brand name: Amoxil — Drug class: Aminopenicillin (Beta-Lactam Antibiotic)
            > How it works: bacteria need a tough outer wall to survive. Amoxicillin destroys that wall — the bacteria falls apart and dies (kills bacteria directly = bactericidal)
            > ABSOLUTE RULE: DO NOT give to anyone with a penicillin allergy — serious allergic reaction risk
            > Slight cross-reactivity with cephalosporin antibiotics (another antibiotic family)
            > Exam fact: patients who have mono (EBV virus) and take amoxicillin often develop a widespread rash — this is not an allergy, just a viral reaction
            > Used for: ear infections, strep throat, H. pylori stomach ulcers, urinary tract infections
            > KEY: Penicillin allergy = absolute contraindication; kills bacteria by destroying the cell wall
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits bacterial DNA gyrase",
                "B. Disrupts bacterial cell membrane integrity",
                "C. Inhibits bacterial cell wall synthesis",
                "D. Blocks the 50S ribosomal subunit"
            ],
            correctAnswer: "C. Inhibits bacterial cell wall synthesis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.36, yOffset: 0.42
        ),

        // ── 10 ── AZITHROMYCIN ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AZITHROMYCIN",
            loreText: """
            > A popular antibiotic most patients know as the "Z-Pak" (5-day course)
            > Brand name: Zithromax — Drug class: Macrolide Antibiotic
            > How it works: bacteria use tiny protein-building machines (ribosomes) to grow and multiply. Azithromycin jams the 50S part of this machine — bacteria stop reproducing and die off (bacteriostatic = slows them, doesn't always kill directly)
            > Stays active in body tissues for a long time after the last dose — drug is still working even after the 5 days are done
            > HEART RISK: Can cause a dangerous heart rhythm problem called QT prolongation — avoid in patients already on heart rhythm medications
            > Inhibits liver enzymes (CYP3A4) so it can interact with many other drugs
            > Used for: respiratory infections, STIs (like chlamydia), ear and sinus infections
            > KEY: Z-Pak = macrolide, QT prolongation risk, works by blocking the 50S ribosomal subunit
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 23S rRNA of the 30S ribosomal subunit",
                "B. 50S ribosomal subunit",
                "C. DNA gyrase (topoisomerase II)",
                "D. Bacterial cell wall transpeptidase"
            ],
            correctAnswer: "B. 50S ribosomal subunit",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.62, yOffset: 0.44
        ),

        // ── 11 ── CIPROFLOXACIN ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN",
            loreText: """
            > A powerful antibiotic from the fluoroquinolone family
            > Brand name: Cipro — Drug class: Fluoroquinolone Antibiotic
            > How it works: bacteria need to copy their DNA to multiply. Ciprofloxacin damages the machine bacteria use to copy DNA (called DNA gyrase and topoisomerase IV) — bacteria can't replicate and die
            > BLACK BOX WARNINGS — the most serious safety warnings the FDA can issue (4 of them):
            >   Tendon rupture — the Achilles tendon (back of ankle) can actually tear, especially in older patients or steroid users
            >   Nerve damage in hands/feet (peripheral neuropathy)
            >   Seizures and serious mental effects
            >   Damage to the aorta (the body's main blood vessel)
            > AVOID in: children (damages growing cartilage), pregnancy
            > IMPORTANT: Don't take with antacids, milk, or iron — they bind the drug in your gut and block it from being absorbed; separate by 2 hours
            > KEY: Cipro = fluoroquinolone, tendon rupture is the #1 exam black box warning, separate from antacids
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits bacterial cell wall synthesis",
                "B. Inhibits bacterial DNA gyrase and topoisomerase IV",
                "C. Binds the 30S ribosomal subunit",
                "D. Disrupts bacterial cell membrane"
            ],
            correctAnswer: "B. Inhibits bacterial DNA gyrase and topoisomerase IV",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.87, yOffset: 0.53
        ),

        // ── 12 ── DOXYCYCLINE ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DOXYCYCLINE",
            loreText: """
            > An antibiotic in the tetracycline family — treats a wide range of infections including acne, Lyme disease, and malaria prevention
            > Brand names: Vibramycin, Doryx, Oracea — Drug class: Tetracycline Antibiotic
            > How it works: blocks the same ribosome (protein-building machine) that bacteria need to grow — slows them down (bacteriostatic)
            > CRITICAL AGE RESTRICTION: Never give to children under 8 years old — permanently stains teeth yellow-gray and interferes with bone growth
            > Also never use during pregnancy
            > Patient counseling points (important for dispensing):
            >   Sun sensitivity — patient MUST use sunscreen; their skin burns much more easily
            >   Take with a FULL glass of water and stay sitting/standing upright for 30 minutes — lying down can cause a painful throat ulcer
            >   Separate from dairy, antacids, and iron supplements by 2 hours — they block absorption
            > KEY: Doxycycline = NO children under 8 (stains teeth), sun sensitivity, stay upright after taking
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Patients with renal impairment (CrCl < 30)",
                "B. Children under 8 years of age",
                "C. Patients with hepatic impairment",
                "D. Elderly patients over 65"
            ],
            correctAnswer: "B. Children under 8 years of age",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.20, yOffset: 0.55
        ),

        // ── 13 ── HYDROCODONE/APAP ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HYDROCODONE\n/APAP",
            loreText: """
            > A combination pain pill: hydrocodone (an opioid) + acetaminophen (regular Tylenol)
            > Brand names: Norco, Vicodin — Drug class: Opioid Combination Analgesic
            > DEA Schedule II = the most restricted controlled substance category
            >   This means: absolutely NO refills, ever — a brand new prescription is required every single time
            >   Prescriptions cannot be called in by phone (must be written)
            > Hydrocodone works by activating opioid receptors in the brain and spinal cord to reduce pain
            > CRITICAL ACETAMINOPHEN (APAP) LIMIT — this is heavily tested:
            >   Maximum: 4,000 mg of acetaminophen per day total from ALL sources
            >   Reduced to 3,000 mg/day for elderly patients and heavy alcohol users
            >   Too much acetaminophen causes liver failure — always check patient's other medications
            > Never combine with alcohol — increases sedation and liver damage
            > KEY: Schedule II = no refills ever, watch the total daily acetaminophen dose limit
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Schedule III",
                "B. Schedule IV",
                "C. Schedule II",
                "D. Schedule V"
            ],
            correctAnswer: "C. Schedule II",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.46, yOffset: 0.54
        ),

        // ── 14 ── OXYCODONE ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OXYCODONE",
            loreText: """
            > A strong opioid pain medication — DEA Schedule II (no refills allowed)
            > Brand names: OxyContin (extended release, all day), Roxicodone (immediate release, fast acting)
            > How it works: activates opioid receptors in the brain and spinal cord — reduces how intensely pain is felt and creates sedation
            > MOST DANGEROUS side effect: respiratory depression — the drug slows breathing to a dangerous level or stops it completely — this is the primary cause of opioid overdose deaths
            > Constipation is a guaranteed side effect — and unlike most other opioid side effects, patients never build tolerance to it (it stays constant)
            > OxyContin is specially designed to resist crushing or dissolving to prevent people from misusing it
            > ANTIDOTE/REVERSAL: Naloxone (brand name: Narcan) — blocks opioid receptors and reverses an overdose within minutes
            > KEY: Opioid = breathing slows (respiratory depression), naloxone reverses it, constipation never goes away
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks NMDA glutamate receptors",
                "B. Agonist at mu-opioid receptors in the CNS",
                "C. Inhibits COX-1 and COX-2 enzymes",
                "D. Enhances GABA-A receptor activity"
            ],
            correctAnswer: "B. Agonist at mu-opioid receptors in the CNS",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73, yOffset: 0.58
        ),

        // ── 15 ── SERTRALINE ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE",
            loreText: """
            > An antidepressant from the SSRI family — one of the most commonly prescribed antidepressants in the US
            > Brand name: Zoloft — Drug class: SSRI (Selective Serotonin Reuptake Inhibitor)
            > Background: serotonin is a brain chemical linked to mood and wellbeing. After your brain uses it, it normally gets pulled back in. SSRIs block that "pull back" process — so more serotonin stays active and improves mood
            > BLACK BOX WARNING: Increased risk of suicidal thoughts and behavior in patients 24 years old and YOUNGER
            >   These patients must be closely monitored — especially in the first few weeks of treatment
            > Common side effects: difficulty sleeping, nausea, sexual dysfunction (very common with all SSRIs), weight changes
            > DANGER: Serotonin syndrome — combining SSRIs with other serotonin-boosting drugs causes dangerously high serotonin levels (medical emergency)
            > Used for: depression, anxiety, OCD, PTSD, panic disorder
            > KEY: SSRI = suicide risk warning in patients 24 and under, serotonin syndrome risk with other drugs
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks dopamine and norepinephrine reuptake",
                "B. Enhances GABA inhibitory transmission",
                "C. Selectively inhibits serotonin reuptake at the presynaptic membrane",
                "D. Antagonizes serotonin and dopamine receptors"
            ],
            correctAnswer: "C. Selectively inhibits serotonin reuptake at the presynaptic membrane",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.12, yOffset: 0.66
        ),

        // ── 16 ── ESCITALOPRAM ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ESCITALOPRAM",
            loreText: """
            > Another SSRI antidepressant — works the same way as sertraline (keeps serotonin active in the brain)
            > Brand name: Lexapro — Drug class: SSRI — considered the most targeted/selective of all SSRIs
            > Closely related to citalopram (Celexa) — think of it as a more refined version
            > BLACK BOX WARNING: Increased suicidal thoughts and behavior in patients 24 years and younger — same black box warning as ALL SSRIs
            > ADDITIONAL RISK unique to escitalopram: high doses (over 20 mg/day) cause a dangerous heart rhythm problem (QT prolongation — the heart takes too long to reset between beats)
            > FDA has approved it specifically for: depression and generalized anxiety disorder (a state of chronic, excessive worry)
            > KEY: Lexapro = SSRI, suicide black box warning ≤24 years, QT prolongation risk at high doses
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Patients 65 years of age and older",
                "B. Patients 24 years of age and younger",
                "C. Patients 18 years of age and younger",
                "D. All patients regardless of age"
            ],
            correctAnswer: "B. Patients 24 years of age and younger",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.36, yOffset: 0.66
        ),

        // ── 17 ── BUPROPION ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPROPION",
            loreText: """
            > An antidepressant that works differently from SSRIs — also used to help people quit smoking
            > Brand names: Wellbutrin (for depression), Zyban (for smoking cessation)
            > How it works: boosts two brain chemicals — norepinephrine and dopamine — instead of serotonin like SSRIs do
            > BIG ADVANTAGE over SSRIs: does NOT cause sexual problems or weight gain — two major reasons patients prefer it
            > CONTRAINDICATIONS — do NOT give bupropion to patients who have:
            >   A seizure disorder — this drug lowers the body's seizure threshold (most critical exam point)
            >   An eating disorder (anorexia or bulimia) — also raises seizure risk significantly
            >   Recently taken an MAOI antidepressant (within 14 days) — dangerous interaction
            >   Just abruptly stopped alcohol, benzodiazepines, or sedatives
            > KEY: Bupropion = seizure risk, absolutely contraindicated in seizure disorders and eating disorders
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Renal impairment (CrCl < 30 mL/min)",
                "B. Seizure disorder (lowers seizure threshold)",
                "C. Hypertension (raises blood pressure)",
                "D. Liver disease (hepatotoxic)"
            ],
            correctAnswer: "B. Seizure disorder (lowers seizure threshold)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.62, yOffset: 0.68
        ),

        // ── 18 ── ALPRAZOLAM ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM",
            loreText: """
            > An anti-anxiety drug from the benzodiazepine (benzo) family
            > Brand name: Xanax — Drug class: Benzodiazepine — DEA Schedule IV controlled substance
            > How it works: your brain has a "calm down" chemical called GABA. Benzos boost GABA's effects — creating sedation and reducing anxiety quickly
            > CRITICAL DANGER: The body becomes physically dependent on benzos quickly
            >   Stopping suddenly can trigger life-threatening seizures — this is a medical emergency
            >   MUST taper the dose down slowly under medical supervision
            > BLACK BOX WARNING: Combining benzodiazepines with opioid pain medications can cause coma or death from combined respiratory depression
            > Short-acting drug — works fast but doesn't last long. NOT meant for long-term use due to high dependence risk
            > ANTIDOTE: Flumazenil — a drug that blocks benzodiazepine receptors and reverses overdose
            > KEY: Xanax = Schedule IV, NEVER stop suddenly (withdrawal seizures), flumazenil is the reversal agent
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Schedule II",
                "B. Schedule III",
                "C. Schedule V",
                "D. Schedule IV"
            ],
            correctAnswer: "D. Schedule IV",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.87, yOffset: 0.65
        ),

        // ── 19 ── ALBUTEROL ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL",
            loreText: """
            > The classic "rescue inhaler" — used during asthma attacks or sudden breathing difficulty
            > Brand names: ProAir HFA, Ventolin HFA, Proventil HFA
            > Drug class: Short-Acting Beta-2 Agonist (SABA) — think "S = Sudden/Speedy relief"
            > How it works: the airways in your lungs are surrounded by muscle. Albuterol relaxes those muscles so the airways open wide and air flows freely — works within 5 minutes
            > Lasts 4-6 hours — use it as needed when symptoms occur, not on a regular schedule
            > IMPORTANT: If you need it more than 2 days per week, the asthma is NOT well controlled and the treatment plan needs to be stepped up
            > This is NOT a daily controller medication — it only treats symptoms in the moment, doesn't fix the underlying inflammation
            > Side effects: fast heartbeat (tachycardia), shakiness/tremors, feeling jittery or nervous
            > KEY: Albuterol = rescue inhaler (SABA), fast onset, not a daily controller — more than 2x/week = step up therapy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Long-acting beta-2 agonist (LABA)",
                "B. Inhaled corticosteroid (ICS)",
                "C. Short-acting beta-2 agonist (SABA)",
                "D. Leukotriene receptor antagonist (LTRA)"
            ],
            correctAnswer: "C. Short-acting beta-2 agonist (SABA)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22, yOffset: 0.78
        ),

        // ── 20 ── FLUTICASONE ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FLUTICASONE",
            loreText: """
            > A steroid inhaler used to PREVENT asthma symptoms — NOT for emergency or sudden attacks
            > Brand names: Flovent (asthma inhaler), Flonase (nasal spray for allergies)
            > Drug class: Inhaled Corticosteroid (ICS) — think "controller medication" — used every day
            > How it works: steroids reduce inflammation. When inhaled daily, they slowly calm down the inflammation in the airways so attacks happen less often. Takes days to weeks for full effect
            > THIS IS NOT A RESCUE INHALER — it won't help during an acute attack
            > MOST IMPORTANT COUNSELING POINT (guaranteed to be on the exam):
            >   After EVERY single use, rinse your mouth with water and gargle
            >   The steroid powder that lands in your mouth causes a fungal infection called oral thrush (white patches in the mouth and throat)
            >   Simply rinsing prevents this completely
            > KEY: Fluticasone = inhaled steroid (controller, daily use), MUST rinse mouth after every use
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Use a spacer to reduce drug delivery to the lungs",
                "B. Rinse mouth and gargle with water after each use to prevent oral candidiasis",
                "C. Take only during acute asthma attacks as a rescue inhaler",
                "D. Avoid use if currently taking oral corticosteroids"
            ],
            correctAnswer: "B. Rinse mouth and gargle with water after each use to prevent oral candidiasis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.46, yOffset: 0.76
        ),

        // ── 21 ── MONTELUKAST ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "MONTELUKAST",
            loreText: """
            > A daily pill for asthma and allergy prevention — works through a completely different pathway than inhalers
            > Brand name: Singulair — Drug class: Leukotriene Receptor Antagonist (LTRA)
            > How it works: when you have asthma or allergies, your immune system releases chemicals called leukotrienes that tighten airways and cause inflammation. Montelukast blocks the receptor these chemicals attach to — so they can't cause symptoms
            > FDA BLACK BOX WARNING added in 2020 — the most serious safety concern:
            >   Can cause serious mental health side effects: mood swings, depression, anxiety, nightmares, aggressive behavior, and suicidal thoughts
            >   Patients and their families must watch for any personality or behavior changes
            >   Prescribers should consider switching drugs if this occurs
            > Used for: daily asthma control, exercise-induced asthma, seasonal and year-round allergies
            > KEY: Montelukast = blocks leukotrienes, 2020 black box warning for serious psychiatric side effects
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Beta-2 adrenergic receptors",
                "B. Histamine H1 receptors",
                "C. CysLT1 leukotriene receptors",
                "D. Muscarinic M3 receptors"
            ],
            correctAnswer: "C. CysLT1 leukotriene receptors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70, yOffset: 0.78
        ),

        // ── 22 ── OMEPRAZOLE ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE",
            loreText: """
            > An acid-reducer used for heartburn, acid reflux, and stomach ulcers
            > Brand name: Prilosec — Drug class: Proton Pump Inhibitor (PPI)
            > How it works: your stomach has acid pumps that produce stomach acid. Omeprazole permanently shuts those pumps down — so the stomach produces much less acid. Takes 1-4 days for full effect because the body has to make brand new pumps to replace them
            > TIMING IS CRITICAL: Take 30-60 minutes BEFORE a meal (usually breakfast) — it only works when the pumps are active and preparing to secrete acid
            > DRUG INTERACTION to know: reduces the effectiveness of clopidogrel (Plavix), a blood thinner used by heart patients — this can be dangerous
            > Long-term use risks: low magnesium levels, increased bone fracture risk, C. difficile infection, low vitamin B12
            > KEY: PPI = take before a meal, major interaction with clopidogrel (Plavix)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks histamine H2 receptors on parietal cells",
                "B. Irreversibly inhibits the H⁺/K⁺-ATPase proton pump in gastric parietal cells",
                "C. Neutralizes gastric acid by reacting with hydrochloric acid",
                "D. Inhibits acetylcholine-stimulated acid secretion"
            ],
            correctAnswer: "B. Irreversibly inhibits the H⁺/K⁺-ATPase proton pump in gastric parietal cells",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.90, yOffset: 0.76
        ),

        // ── 23 ── ONDANSETRON ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ONDANSETRON",
            loreText: """
            > The #1 anti-nausea medication used in hospitals, clinics, and outpatient care
            > Brand name: Zofran — also available as a dissolving tablet (ODT) that melts on your tongue without water
            > Drug class: 5-HT3 Serotonin Receptor Antagonist (Antiemetic)
            > How it works: nausea is triggered when serotonin signals in your gut and brain activate the vomiting reflex. Ondansetron blocks the serotonin receptor (called 5-HT3) that starts this signal — nausea and vomiting stop
            > Used for: nausea from chemotherapy (cancer treatment), surgery recovery, radiation therapy, and sometimes pregnancy nausea
            > WARNING: Can cause a heart rhythm problem (QT prolongation) — caution in patients with existing heart conditions or on other QT-prolonging drugs
            > KEY: Zofran = anti-nausea drug (blocks 5-HT3 serotonin receptors), QT prolongation risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Dopamine D2 receptors",
                "B. 5-HT3 (serotonin type 3) receptors",
                "C. Histamine H1 receptors",
                "D. Muscarinic M1 receptors"
            ],
            correctAnswer: "B. 5-HT3 (serotonin type 3) receptors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.15, yOffset: 0.87
        ),

        // ── 24 ── WARFARIN ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN",
            loreText: """
            > An oral blood thinner — one of the most complex and high-risk drugs to manage
            > Brand names: Coumadin, Jantoven — Drug class: Vitamin K Antagonist (Anticoagulant)
            > How it works: your body needs vitamin K to make blood clotting proteins. Warfarin blocks the vitamin K cycle — so fewer clotting proteins are made, and blood clots form much more slowly
            > VERY NARROW THERAPEUTIC RANGE — too little = dangerous blood clot; too much = dangerous bleeding
            >   Must be monitored with a routine blood test called INR (International Normalized Ratio)
            >   Target INR: 2.0-3.0 for most uses; 2.5-3.5 for mechanical heart valves
            > Has more drug and food interactions than almost any other medication:
            >   Vitamin K foods (spinach, kale, broccoli) DECREASE the drug's effect — patients must eat consistent amounts
            >   Many antibiotics, aspirin, and NSAIDs INCREASE bleeding risk
            > KEY: Warfarin = monitor with INR, vitamin K foods weaken it, MANY interactions — high alert drug
            """,
            challengeType: .multipleChoice,
            options: [
                "A. aPTT (activated partial thromboplastin time)",
                "B. Anti-Xa level",
                "C. INR (International Normalized Ratio)",
                "D. Platelet count"
            ],
            correctAnswer: "C. INR (International Normalized Ratio)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.40, yOffset: 0.86
        ),

        // ── 25 ── APIXABAN ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "APIXABAN",
            loreText: """
            > A newer, easier-to-manage blood thinner — no routine blood tests needed
            > Brand name: Eliquis — Drug class: DOAC (Direct Oral Anticoagulant), Factor Xa Inhibitor
            > How it works: blood clotting is a chain reaction. Apixaban directly blocks one specific step in that chain (a clotting protein called Factor Xa) — clots can't form as easily
            > MAJOR ADVANTAGE over warfarin: no routine INR monitoring needed, predictable dosing, fewer food interactions, faster onset
            > Reversal agent (if patient bleeds badly or needs emergency surgery): Andexanet alfa (brand: Andexxa) — a specific antidote developed just for this drug
            > Used for: preventing and treating blood clots (DVT/PE), preventing strokes in patients with atrial fibrillation (irregular heartbeat)
            > Dose reduction required in certain elderly, low-weight, or reduced kidney function patients
            > KEY: Eliquis = DOAC (no INR monitoring), reversal agent = andexanet alfa
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Direct thrombin (Factor IIa) inhibitor",
                "B. Vitamin K antagonist",
                "C. Direct Factor Xa inhibitor (DOAC)",
                "D. Indirect Factor Xa inhibitor (via antithrombin)"
            ],
            correctAnswer: "C. Direct Factor Xa inhibitor (DOAC)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.64, yOffset: 0.87
        ),

        // ── 26 ── LEVOTHYROXINE ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE",
            loreText: """
            > A thyroid hormone replacement pill — used when the thyroid gland doesn't produce enough hormone on its own (hypothyroidism)
            > Brand names: Synthroid, Levoxyl, Unithroid, Tirosint — Drug class: Synthetic Thyroid Hormone (T4)
            > CRITICAL DISPENSING RULE: Different brands of levothyroxine are NOT automatically interchangeable — even tiny differences in absorption can over- or under-treat the patient
            >   Always keep patients on the same brand unless their doctor specifically approves a switch
            > HOW TO TAKE — this counseling is frequently tested:
            >   Take on an EMPTY STOMACH, 30-60 minutes BEFORE breakfast
            >   Keep CALCIUM supplements, iron supplements, antacids, and dairy products at least 4 hours away — they bind to the drug in the gut and block it from being absorbed
            > Monitored with a TSH blood test — TSH is a signal the brain sends to the thyroid; low TSH = thyroid is working well
            > KEY: Levothyroxine = empty stomach before breakfast, separate calcium and iron by 4 hours, brands NOT interchangeable
            """,
            challengeType: .multipleChoice,
            options: [
                "A. With food to improve GI tolerability",
                "B. On an empty stomach, 30-60 minutes before breakfast",
                "C. At bedtime, after a full meal",
                "D. With a glass of milk to slow absorption"
            ],
            correctAnswer: "B. On an empty stomach, 30-60 minutes before breakfast",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.87, yOffset: 0.85
        ),

        // ── 27 ── PREDNISONE ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREDNISONE",
            loreText: """
            > A powerful steroid pill that reduces inflammation and suppresses the immune system
            > Brand name: Deltasone — Drug class: Systemic Corticosteroid
            > Used for: severe allergic reactions, autoimmune diseases, asthma flare-ups, inflammation, organ transplant rejection prevention
            > THE #1 MOST IMPORTANT RULE — heavily tested: NEVER stop prednisone suddenly after more than a few days of use
            >   When you take steroid pills, your adrenal glands (which normally make your own steroids) get "lazy" and slow down production
            >   If you stop suddenly, the glands can't recover fast enough — this causes adrenal crisis: a life-threatening drop in essential body hormones
            >   The dose MUST be slowly tapered (reduced gradually) over days to weeks
            > Long-term side effects (also heavily tested): high blood sugar, high blood pressure, weight gain, bone loss (osteoporosis), weakened immune system (infection risk), eye problems (cataracts), mood changes, round face and belly
            > KEY: Prednisone = NEVER stop suddenly (taper it down), suppresses immune system, raises blood sugar
            """,
            challengeType: .multipleChoice,
            options: [
                "A. QT prolongation requiring ECG monitoring",
                "B. HPA axis suppression — abrupt discontinuation can cause adrenal crisis",
                "C. Hypokalemia requiring potassium supplementation",
                "D. Nephrotoxicity requiring renal function monitoring"
            ],
            correctAnswer: "B. HPA axis suppression — abrupt discontinuation can cause adrenal crisis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28, yOffset: 0.91
        ),

        // ── 28 ── CYCLOBENZAPRINE ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CYCLOBENZAPRINE",
            loreText: """
            > A muscle relaxer pill — used for short-term relief of painful muscle spasms
            > Brand names: Flexeril, Amrix — Drug class: Centrally-Acting Skeletal Muscle Relaxant
            > How it works: acts in the brainstem to reduce the nerve signals that cause muscles to stay tight and spasm
            > STRUCTURALLY VERY SIMILAR to TCA antidepressants (tricyclic antidepressants) — chemically related, causes similar side effects
            > Side effects are classic anticholinergic effects (your body's "cholinergic" system handles digestion and secretions — blocking it causes these predictable effects):
            >   Drowsiness, dry mouth, blurry vision, difficulty urinating, constipation
            >   Same side effect pattern as antihistamines (Benadryl) and certain antidepressants
            > CONTRAINDICATION: Do NOT use within 14 days of an MAOI antidepressant — can cause a dangerous serotonin reaction
            > Only meant for short-term use (2-3 weeks maximum) — not for chronic pain
            > KEY: Cyclobenzaprine = muscle relaxer structurally related to TCAs, causes anticholinergic side effects
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Selective serotonin reuptake inhibitors (SSRIs)",
                "B. Benzodiazepines (BZDs)",
                "C. Tricyclic antidepressants (TCAs)",
                "D. Monoamine oxidase inhibitors (MAOIs)"
            ],
            correctAnswer: "C. Tricyclic antidepressants (TCAs)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72, yOffset: 0.91
        )
    ]
}
