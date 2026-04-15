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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Biguanide — First-line antidiabetic (Type 2 DM)
            > BRAND: Glucophage, Glucophage XR
            > MECHANISM: Decreases hepatic glucose output; improves peripheral insulin sensitivity.
            > WARNINGS: Hold if eGFR < 30 mL/min (lactic acidosis risk).
            >           Hold 48h before iodinated contrast procedures.
            > CLINICAL: Does NOT cause hypoglycemia as monotherapy.
            >           GI side effects (nausea, diarrhea) — take with food.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Sulfonylurea (2nd generation) — Antidiabetic
            > BRAND: Glucotrol, Glucotrol XL
            > MECHANISM: Stimulates pancreatic beta cells to secrete insulin.
            > WARNINGS: HYPOGLYCEMIA is the primary risk — especially in elderly,
            >           renal/hepatic impairment, or missed meals.
            > CLINICAL: Take 30 min before meals. Monitor blood glucose closely.
            >           Sulfa allergy cross-sensitivity is controversial but noted.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: ACE Inhibitor (ACEI) — Antihypertensive
            > BRAND: Zestril, Prinivil
            > MECHANISM: Inhibits angiotensin-converting enzyme (ACE)
            >            → prevents conversion of Ang I → Ang II → vasodilation.
            > WARNINGS: CONTRAINDICATED in pregnancy (teratogen — fetal renal toxicity).
            >           Monitor potassium (hyperkalemia risk).
            >           Angioedema — life-threatening swelling of face/airway.
            > CLINICAL: First-line for hypertension + diabetes (renoprotective).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Angiotensin Receptor Blocker (ARB) — Antihypertensive
            > BRAND: Cozaar
            > MECHANISM: Directly blocks AT1 angiotensin II receptors.
            > KEY DIFFERENCE vs ACE Inhibitors:
            >   ARBs do NOT inhibit bradykinin breakdown → NO dry cough.
            >   Both classes are CONTRAINDICATED in pregnancy.
            > USES: Hypertension, diabetic nephropathy, heart failure.
            > MONITORING: Serum potassium (hyperkalemia), renal function.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Selective Beta-1 Adrenergic Blocker — Antihypertensive/Anti-anginal
            > BRANDS: Lopressor (tartrate — IR), Toprol-XL (succinate — ER)
            > MECHANISM: Selectively blocks beta-1 receptors → ↓ HR, ↓ contractility, ↓ BP.
            > FORMULATION NOTE: Tartrate vs. Succinate are NOT interchangeable.
            > WARNINGS: Do NOT abruptly discontinue (rebound hypertension/angina).
            >           Masks hypoglycemia symptoms in diabetics.
            >           Use with caution in asthma/COPD (though beta-1 selective).
            > USES: HTN, angina, heart failure (HFrEF), post-MI, rate control.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Dihydropyridine Calcium Channel Blocker (CCB) — Antihypertensive
            > BRAND: Norvasc
            > MECHANISM: Blocks L-type Ca²⁺ channels in vascular smooth muscle
            >            → vasodilation → reduced peripheral resistance → ↓ BP.
            > WARNINGS: Peripheral edema (ankle/leg swelling) — most common SE.
            >           Reflex tachycardia possible.
            > CLINICAL: Long half-life → once daily dosing. Preferred in elderly HTN.
            >           Does NOT negatively affect heart rate (unlike non-DHP CCBs).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Thiazide Diuretic — Antihypertensive
            > BRAND: Microzide (also combined: Zestoretic, Hyzaar, etc.)
            > MECHANISM: Inhibits Na⁺/Cl⁻ cotransporter in distal convoluted tubule
            >            → ↑ Na⁺ and water excretion → ↓ blood volume → ↓ BP.
            > METABOLIC EFFECTS (exam-critical):
            >   ↓ K⁺ (HYPOKALEMIA — most common)
            >   ↑ Uric acid (HYPERURICEMIA → gout exacerbation)
            >   ↑ Glucose (HYPERGLYCEMIA)
            >   ↓ Na⁺ (HYPONATREMIA)
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: HMG-CoA Reductase Inhibitor (Statin) — Lipid-Lowering Agent
            > BRAND: Lipitor
            > MECHANISM: Inhibits HMG-CoA reductase → ↓ hepatic cholesterol synthesis
            >            → upregulates LDL receptors → ↓ serum LDL.
            > WARNINGS: RHABDOMYOLYSIS (muscle breakdown) — monitor CK if muscle pain.
            >           Hepatotoxicity — monitor liver function tests (LFTs).
            >           CONTRAINDICATED in pregnancy (teratogen).
            > CLINICAL: High-intensity statin. Take at any time (long half-life).
            >           Drug interaction: avoid grapefruit juice (CYP3A4).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Aminopenicillin (Beta-Lactam Antibiotic) — Bactericidal
            > BRAND: Amoxil
            > MECHANISM: Binds penicillin-binding proteins (PBPs)
            >            → inhibits bacterial cell wall (peptidoglycan) synthesis → cell lysis.
            > WARNINGS: CONTRAINDICATED in penicillin allergy.
            >           ~1-2% cross-reactivity with cephalosporins.
            >           Maculopapular rash common in patients with infectious mononucleosis (EBV).
            > USES: Otitis media, strep throat, H. pylori (triple therapy), UTIs.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Macrolide Antibiotic — Bacteriostatic
            > BRAND: Zithromax; commonly dispensed as "Z-Pak" (5-day course)
            > MECHANISM: Binds 50S ribosomal subunit → inhibits bacterial protein synthesis.
            > PHARMACOKINETICS: Long tissue half-life (~68h) — drug persists after last dose.
            > WARNINGS: QT prolongation — avoid in patients with QT-prolonging drugs.
            >           CYP3A4 inhibitor — multiple drug interactions.
            > USES: Community-acquired pneumonia, sinusitis, STIs (chlamydia), MAC prophylaxis.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Fluoroquinolone Antibiotic — Bactericidal
            > BRAND: Cipro
            > MECHANISM: Inhibits bacterial DNA gyrase (topoisomerase II) and topoisomerase IV
            >            → disrupts DNA replication and repair → cell death.
            > BLACK BOX WARNINGS:
            >   1. Tendinitis / Tendon rupture (especially with corticosteroids, elderly)
            >   2. Peripheral neuropathy
            >   3. CNS effects (seizures)
            >   4. Aortic aneurysm/dissection
            > AVOID: Pregnancy, pediatric patients (cartilage toxicity).
            > INTERACTION: Antacids/dairy/iron chelate → ↓ absorption (take 2h apart).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Tetracycline Antibiotic — Bacteriostatic
            > BRAND: Vibramycin, Doryx, Oracea
            > MECHANISM: Binds 30S ribosomal subunit → inhibits aminoacyl-tRNA binding
            >            → blocks bacterial protein synthesis.
            > CONTRAINDICATIONS:
            >   Children < 8 years: causes permanent yellow-gray TOOTH DISCOLORATION
            >                       and impairs bone growth.
            >   Pregnancy (Category D).
            > COUNSELING: PHOTOSENSITIVITY — use sunscreen; avoid prolonged sun exposure.
            >             Take with FULL glass of water; remain upright 30 min (esophageal ulcer).
            >             Avoid dairy, antacids, iron within 2h (chelation → ↓ absorption).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Opioid Combination Analgesic — DEA Schedule II
            > BRAND: Norco, Vicodin (Vicodin discontinued; Norco most common)
            > COMPONENTS: Hydrocodone (opioid) + Acetaminophen (APAP)
            > MECHANISM: Hydrocodone → mu-opioid receptor agonist → analgesia, sedation.
            >             APAP → inhibits prostaglandin synthesis (COX) → analgesia.
            > CRITICAL WARNINGS:
            >   DEA SCHEDULE II — no refills; new Rx required each time.
            >   MAX APAP: 4,000 mg/day (3,000 mg/day in high-risk patients).
            >   Respiratory depression; addiction potential; avoid with alcohol.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Opioid Analgesic — DEA Schedule II
            > BRAND: OxyContin (ER), Roxicodone (IR), Oxaydo
            > MECHANISM: Full agonist at mu-opioid (and kappa) receptors in the CNS
            >            → analgesia, euphoria, sedation, respiratory depression.
            > ABUSE-DETERRENT FORMULATIONS: OxyContin reformulated with physical barriers
            >                               to resist crushing/extraction.
            > ADVERSE EFFECTS: Respiratory depression (most dangerous), constipation
            >                  (does NOT develop tolerance), nausea, sedation, miosis.
            > REVERSAL AGENT: Naloxone (Narcan) — opioid antagonist.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Selective Serotonin Reuptake Inhibitor (SSRI) — Antidepressant
            > BRAND: Zoloft
            > MECHANISM: Selectively inhibits serotonin (5-HT) reuptake at presynaptic
            >            transporter → ↑ synaptic serotonin concentration.
            > BLACK BOX WARNING: Increased risk of suicidal thinking and behavior
            >                    in patients ≤ 24 years of age.
            > ADVERSE EFFECTS: Insomnia, GI upset, sexual dysfunction (most common SSRI AE),
            >                  weight gain, serotonin syndrome (with other serotonergic drugs).
            > USES: MDD, anxiety, OCD, PTSD, panic disorder, PMDD.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: SSRI (most selective) — Antidepressant/Anxiolytic
            > BRAND: Lexapro
            > NOTE: S-enantiomer of citalopram (Celexa) — improved selectivity and tolerability.
            > MECHANISM: Same as all SSRIs — inhibits presynaptic serotonin reuptake transporter.
            > SPECIAL WARNING: QT prolongation (dose-dependent) — FDA warning for doses > 20 mg/day.
            >                  Avoid in congenital long QT syndrome.
            > BLACK BOX WARNING: Suicidal ideation in patients ≤ 24 years of age.
            > USES: Major depressive disorder (MDD), generalized anxiety disorder (GAD).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Norepinephrine-Dopamine Reuptake Inhibitor (NDRI) — Antidepressant
            > BRAND: Wellbutrin (depression), Zyban (smoking cessation), Aplenzin
            > MECHANISM: Inhibits neuronal reuptake of norepinephrine and dopamine.
            > KEY CONTRAINDICATIONS (exam-critical):
            >   1. Seizure disorder — lowers seizure threshold (dose-dependent)
            >   2. Eating disorders (anorexia nervosa, bulimia) — seizure risk
            >   3. Concurrent MAOI use (hypertensive crisis)
            >   4. Abrupt alcohol/benzo/sedative discontinuation
            > ADVANTAGES vs SSRIs: No sexual dysfunction, no weight gain.
            > USES: MDD, seasonal affective disorder, smoking cessation (Zyban).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Benzodiazepine (BZD) — Anxiolytic — DEA Schedule IV
            > BRAND: Xanax, Xanax XR
            > MECHANISM: Positive allosteric modulator of GABA-A receptors
            >            → ↑ frequency of Cl⁻ channel opening → CNS depression.
            > BLACK BOX WARNING: Concomitant use with opioids → profound sedation,
            >                    respiratory depression, coma, and death.
            > WARNINGS: Physical dependence; withdrawal can be LIFE-THREATENING
            >           (seizures) — MUST taper slowly.
            > CLINICAL: Short-acting BZD. NOT for long-term use. High abuse potential.
            > REVERSAL AGENT: Flumazenil (competitive BZD antagonist).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Short-Acting Beta-2 Agonist (SABA) — Bronchodilator
            > BRAND: ProAir HFA, Ventolin HFA, Proventil HFA, AccuNeb (neb solution)
            > MECHANISM: Stimulates beta-2 adrenergic receptors in bronchial smooth muscle
            >            → relaxation → bronchodilation → ↑ airflow.
            > ROLE: RESCUE inhaler — rapid onset (5 min), short duration (4-6 hours).
            >       NOT for long-term control. If using > 2 days/week → step up therapy.
            > ADVERSE EFFECTS: Tachycardia, tremor, hypokalemia (high doses), nervousness.
            > FORMS: MDI (metered dose inhaler), nebulizer solution.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Inhaled Corticosteroid (ICS) — Anti-inflammatory
            > BRAND: Flovent HFA/Diskus (asthma), Flonase (allergic rhinitis)
            > MECHANISM: Binds glucocorticoid receptors → reduces airway inflammation,
            >            mucus secretion, and bronchial hyperresponsiveness.
            > ROLE: CONTROLLER medication — NOT for acute bronchospasm.
            > CRITICAL COUNSELING:
            >   RINSE MOUTH with water and GARGLE after each inhalation.
            >   Prevents ORAL CANDIDIASIS (thrush) caused by local steroid deposition.
            > ADVERSE EFFECTS: Oral candidiasis, dysphonia (hoarse voice), adrenal
            >                  suppression (high doses).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Leukotriene Receptor Antagonist (LTRA) — Anti-inflammatory
            > BRAND: Singulair
            > MECHANISM: Selectively blocks CysLT1 leukotriene receptors
            >            → inhibits leukotriene-mediated inflammation, bronchoconstriction,
            >              mucus secretion, and vascular permeability.
            > FDA BLACK BOX WARNING (2020): Serious neuropsychiatric events including
            >   agitation, depression, suicidal ideation — advise patients to watch for
            >   behavior/mood changes.
            > USES: Asthma maintenance (≥ 12 months), exercise-induced bronchoconstriction,
            >        seasonal and perennial allergic rhinitis.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Proton Pump Inhibitor (PPI) — Gastric Acid Suppressor
            > BRAND: Prilosec, Prilosec OTC
            > MECHANISM: Irreversibly inhibits H⁺/K⁺-ATPase (proton pump) in gastric
            >            parietal cells → profound and prolonged acid suppression.
            > CLINICAL: Take 30-60 min BEFORE a meal for best efficacy.
            >           Full effect may take 1-4 days (irreversible — needs new pump synthesis).
            > RISKS (long-term use): C. difficile infection, hypomagnesemia, bone fractures,
            >                        vitamin B12 deficiency, iron malabsorption.
            > INTERACTION: Reduces clopidogrel (Plavix) activation (both use CYP2C19).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: 5-HT3 (Serotonin Type 3) Receptor Antagonist — Antiemetic
            > BRAND: Zofran, Zuplenz (ODT/oral film)
            > MECHANISM: Blocks 5-HT3 receptors in the GI tract and in the
            >            chemoreceptor trigger zone (CTZ) of the CNS
            >            → prevents serotonin-mediated nausea and vomiting signals.
            > USES: Chemotherapy-induced N/V (CINV), post-operative N/V,
            >       radiation-induced N/V, pregnancy-related N/V (off-label).
            > WARNINGS: QT prolongation — avoid in patients with long QT.
            >           Serotonin syndrome with other serotonergic drugs (rare).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Vitamin K Antagonist (VKA) — Oral Anticoagulant
            > BRAND: Coumadin, Jantoven
            > MECHANISM: Inhibits vitamin K epoxide reductase → depletes active Vitamin K
            >            → reduces synthesis of clotting factors II, VII, IX, X (and proteins C/S).
            > NARROW THERAPEUTIC INDEX — requires routine INR monitoring.
            >   Target INR 2.0-3.0 for most indications (2.5-3.5 for mechanical heart valves).
            > INTERACTIONS: MANY drug-drug and drug-food interactions.
            >   ↑ Effect (↑ bleed risk): NSAIDs, antibiotics, antifungals, vitamin E.
            >   ↓ Effect: Vitamin K (leafy greens), rifampin, St. John's Wort.
            > REVERSAL: Vitamin K (phytonadione), FFP, 4-factor PCC (Kcentra).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Direct Oral Anticoagulant (DOAC) — Factor Xa Inhibitor
            > BRAND: Eliquis
            > MECHANISM: Directly and selectively inhibits Factor Xa → ↓ thrombin generation
            >            → ↓ fibrin clot formation.
            > ADVANTAGES over warfarin: No routine INR monitoring, fewer food interactions,
            >                          predictable pharmacokinetics, rapid onset.
            > REVERSAL AGENT: Andexanet alfa (Andexxa) — recombinant Factor Xa decoy.
            > USES: DVT/PE treatment and prevention, stroke prevention in non-valvular A-fib,
            >       post-surgical VTE prophylaxis.
            > NOTE: Renal dosing required — reduce dose if ≥2 of: age≥80, weight≤60kg, SCr≥1.5
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Thyroid Hormone Replacement (synthetic T4)
            > BRAND: Synthroid, Levoxyl, Unithroid, Tirosint
            > MECHANISM: Synthetic T4 → peripherally converted to active T3 (triiodothyronine)
            >            → binds thyroid hormone nuclear receptors → regulates metabolism.
            > NARROW THERAPEUTIC INDEX: Do NOT interchange brands without physician guidance
            >                           (bioequivalence varies).
            > CRITICAL ADMINISTRATION:
            >   Take on EMPTY STOMACH, 30-60 min before breakfast.
            >   Separate by ≥ 4h from: calcium, antacids, iron supplements, dairy (↓ absorption).
            > MONITORING: TSH (primary marker), Free T4.
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Systemic Glucocorticoid (Corticosteroid) — Anti-inflammatory
            > BRAND: Deltasone, Rayos (delayed-release)
            > MECHANISM: Binds intracellular glucocorticoid receptors → translocates to nucleus
            >            → regulates gene transcription → ↓ inflammation and immune response.
            > LONG-TERM ADVERSE EFFECTS (exam-critical):
            >   HPA axis suppression → adrenal insufficiency
            >   Osteoporosis, hyperglycemia, hypertension
            >   Cushing's syndrome, increased infection risk
            >   Cataracts, myopathy, mood changes
            > CRITICAL: NEVER abruptly stop long-term therapy — must TAPER.
            >           Abrupt discontinuation → ADRENAL CRISIS (life-threatening).
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
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Skeletal Muscle Relaxant (centrally-acting)
            > BRAND: Flexeril (5 mg IR), Amrix (ER capsule)
            > MECHANISM: Acts on brainstem (locus coeruleus) to reduce tonic motor neuron activity.
            >            STRUCTURALLY RELATED TO TRICYCLIC ANTIDEPRESSANTS (TCAs).
            > ADVERSE EFFECTS: Sedation (CNS depression), dry mouth, blurred vision,
            >                  urinary retention, constipation — classic ANTICHOLINERGIC effects.
            > CONTRAINDICATIONS: Concurrent or within 14 days of MAOI use (serotonin syndrome).
            >                    Hyperthyroidism, acute MI, arrhythmias, heart block.
            > USES: Short-term (≤ 2-3 weeks) adjunct for acute musculoskeletal pain/spasm.
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
