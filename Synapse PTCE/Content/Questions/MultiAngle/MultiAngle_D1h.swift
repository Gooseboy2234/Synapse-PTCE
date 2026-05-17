import Foundation

// Multi-Angle Phase 12 — 4 Critical Missing Drugs × 4 Angles = 16 nodes
// Risperidone, Semaglutide, Allopurinol, Clindamycin

let multiAngleNodes_D1h: [DataNode] = [

    // ============================================================
    // RISPERIDONE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Atypical (second-generation) antipsychotic; brand: Risperdal.
        > INDICATIONS:
        >   1. Schizophrenia (adults, adolescents ≥13)
        >   2. Bipolar I disorder — acute manic/mixed episodes
        >   3. Irritability associated with autism spectrum disorder (children ≥5)
        > FORMULATIONS: Oral tablets, oral solution, Risperdal Consta (IM LAT q2wk), Perseris (SQ monthly).
        > NOTE: Unlike quetiapine, risperidone is NOT commonly used for MDD adjunct.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Risperidone is FDA-approved as adjunct therapy for major depressive disorder",
            "B. Risperidone is FDA-approved for schizophrenia, bipolar I acute mania, and autism-related irritability; available as oral and long-acting injectable (LAI) formulations",
            "C. Risperidone is only approved for adult patients and is contraindicated in adolescents",
            "D. Risperdal Consta is administered as an oral weekly formulation for schizophrenia maintenance"
        ],
        correctAnswer: "B. Risperidone is FDA-approved for schizophrenia, bipolar I acute mania, and autism-related irritability; available as oral and long-acting injectable (LAI) formulations",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.25,
        yOffset: 0.15,
        angle: .indication,
        baseConceptTitle: "RISPERIDONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Antagonist at D2 (high affinity) and 5-HT2A receptors.
        > HIGHER D2 AFFINITY than quetiapine → HIGHER EPS risk (akathisia, dystonia, pseudoparkinsonism).
        > Also blocks: α1 (orthostatic hypotension), H1 (sedation), α2 receptors.
        > PROLACTIN ELEVATION: D2 blockade in tuberoinfundibular pathway → hyperprolactinemia → gynecomastia, galactorrhea, sexual dysfunction.
        > METABOLITE: 9-hydroxyrisperidone (paliperidone) — active, also sold as Invega.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Risperidone has low D2 receptor affinity, explaining its minimal EPS risk",
            "B. Risperidone potently blocks D2 and 5-HT2A receptors; high D2 affinity causes higher EPS risk than quetiapine and tuberoinfundibular D2 blockade causes hyperprolactinemia",
            "C. Risperidone's active metabolite is olanzapine (Zyprexa)",
            "D. H1 blockade from risperidone causes hypertension and tachycardia"
        ],
        correctAnswer: "B. Risperidone potently blocks D2 and 5-HT2A receptors; high D2 affinity causes higher EPS risk than quetiapine and tuberoinfundibular D2 blockade causes hyperprolactinemia",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.30,
        yOffset: 0.15,
        angle: .mechanism,
        baseConceptTitle: "RISPERIDONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLACK BOX: Elderly dementia patients — increased mortality risk (not approved for dementia-related psychosis).
        > EPS: Higher than quetiapine — akathisia, acute dystonia, drug-induced parkinsonism.
        > TARDIVE DYSKINESIA: Long-term risk with any dopamine antagonist.
        > HYPERPROLACTINEMIA: Galactorrhea, gynecomastia, amenorrhea, sexual dysfunction.
        > METABOLIC: Weight gain, hyperglycemia, dyslipidemia (less than olanzapine/quetiapine).
        > QT PROLONGATION: Mild risk — use caution with other QT-prolonging agents.
        > NMS: Neuroleptic malignant syndrome (rare, life-threatening).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Risperidone causes less EPS than quetiapine due to its lower D2 receptor affinity",
            "B. Risperidone has Black Box for elderly dementia patients; causes EPS, tardive dyskinesia, and hyperprolactinemia (gynecomastia, galactorrhea, amenorrhea) due to high D2 affinity",
            "C. Hyperprolactinemia from risperidone is caused by serotonin receptor blockade",
            "D. Risperidone is preferred over haloperidol in elderly patients because it has no EPS risk"
        ],
        correctAnswer: "B. Risperidone has Black Box for elderly dementia patients; causes EPS, tardive dyskinesia, and hyperprolactinemia (gynecomastia, galactorrhea, amenorrhea) due to high D2 affinity",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.35,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "RISPERIDONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SCHIZOPHRENIA (adults): Start 2 mg/day; target 4–8 mg/day; max 16 mg/day.
        > BIPOLAR MANIA: 2–3 mg QD; max 6 mg/day.
        > AUTISM IRRITABILITY (5–17 y/o): 0.25–0.5 mg/day; target 0.5–3 mg/day (weight-based).
        > LAI (Risperdal Consta): 25 mg IM q2wk; overlap oral for 3 weeks after first injection.
        > RENAL/HEPATIC: Start at 0.5 mg BID (half usual dose) in impairment.
        > CYP2D6: Risperidone metabolized by CYP2D6; poor metabolizers and CYP2D6 inhibitors (fluoxetine, paroxetine) raise levels.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Risperidone for schizophrenia is started at the target dose of 6 mg/day",
            "B. Schizophrenia: start 2 mg/day, target 4–8 mg/day; LAI requires oral overlap for 3 weeks; renal/hepatic impairment: start 0.5 mg BID; CYP2D6 inhibitors raise levels",
            "C. Risperdal Consta (LAI) replaces oral risperidone immediately with no oral overlap needed",
            "D. Risperidone for autism irritability is dosed the same as schizophrenia in adults"
        ],
        correctAnswer: "B. Schizophrenia: start 2 mg/day, target 4–8 mg/day; LAI requires oral overlap for 3 weeks; renal/hepatic impairment: start 0.5 mg BID; CYP2D6 inhibitors raise levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.40,
        yOffset: 0.15,
        angle: .dosing,
        baseConceptTitle: "RISPERIDONE"
    ),

    // ============================================================
    // SEMAGLUTIDE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: GLP-1 receptor agonist (glucagon-like peptide-1); brand: Ozempic (SQ, T2DM), Wegovy (SQ, obesity), Rybelsus (PO, T2DM).
        > INDICATIONS:
        >   1. Type 2 diabetes glycemic control (Ozempic, Rybelsus)
        >   2. CV death reduction in T2DM + established CVD (SUSTAIN-6 trial, Ozempic)
        >   3. Chronic weight management (Wegovy — BMI ≥30, or ≥27 + comorbidity)
        > RELATED: Liraglutide (Victoza/Saxenda), dulaglutide (Trulicity), tirzepatide (Mounjaro — GLP-1 + GIP dual).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Semaglutide (Ozempic) is FDA-approved for type 1 diabetes management",
            "B. Semaglutide is approved for T2DM glycemic control, CV death reduction in T2DM+CVD, and chronic weight management (Wegovy); Rybelsus is the oral formulation",
            "C. Wegovy is the brand name for semaglutide approved for type 2 diabetes",
            "D. Semaglutide has no cardiovascular benefits beyond glucose lowering in T2DM patients"
        ],
        correctAnswer: "B. Semaglutide is approved for T2DM glycemic control, CV death reduction in T2DM+CVD, and chronic weight management (Wegovy); Rybelsus is the oral formulation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.25,
        yOffset: 0.25,
        angle: .indication,
        baseConceptTitle: "SEMAGLUTIDE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: GLP-1 receptor agonist → stimulates glucose-dependent insulin secretion → suppresses glucagon → slows gastric emptying → reduces appetite (central effect on hypothalamus).
        > GLUCOSE-DEPENDENT: Insulin release only occurs when glucose is elevated — LOW HYPOGLYCEMIA RISK as monotherapy.
        > WEIGHT: Central appetite suppression + gastric slowing → significant weight loss (avg 15% body weight with Wegovy).
        > CARDIAC: Reduces MACE (major adverse cardiovascular events) — mechanism involves anti-inflammatory and plaque-stabilizing effects.
        > HALF-LIFE: ~1 week → once-weekly dosing for Ozempic/Wegovy.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Semaglutide stimulates insulin release regardless of blood glucose level, causing frequent hypoglycemia",
            "B. GLP-1 agonist: insulin secretion is glucose-dependent (low hypoglycemia risk); slows gastric emptying; suppresses appetite via hypothalamus; ~1 week half-life allows weekly dosing",
            "C. Semaglutide primarily lowers blood glucose by inhibiting hepatic glucose production like metformin",
            "D. The once-weekly dosing of semaglutide is due to its high renal clearance"
        ],
        correctAnswer: "B. GLP-1 agonist: insulin secretion is glucose-dependent (low hypoglycemia risk); slows gastric emptying; suppresses appetite via hypothalamus; ~1 week half-life allows weekly dosing",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.30,
        yOffset: 0.25,
        angle: .mechanism,
        baseConceptTitle: "SEMAGLUTIDE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLACK BOX: Thyroid C-cell tumors in rodents — contraindicated with personal/family history of MTC (medullary thyroid carcinoma) or MEN 2.
        > GI: Nausea, vomiting, diarrhea, constipation — most common, dose-dependent, usually improves.
        > PANCREATITIS: Rare but serious — stop if pancreatitis occurs; caution with history.
        > DIABETIC RETINOPATHY: Worsening with rapid glucose lowering (monitor existing retinopathy).
        > HEART RATE: May increase resting HR by 2–4 bpm.
        > NOT FOR T1DM or DKA.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Semaglutide is safe in patients with a family history of medullary thyroid carcinoma",
            "B. Black Box: contraindicated with personal/family history of MTC or MEN 2 (thyroid C-cell tumors); GI effects common (nausea/vomiting); pancreatitis risk; not for T1DM or DKA",
            "C. Semaglutide is the preferred agent for type 1 diabetes due to its glucose-dependent insulin mechanism",
            "D. GI side effects from semaglutide are permanent and do not improve with continued use"
        ],
        correctAnswer: "B. Black Box: contraindicated with personal/family history of MTC or MEN 2 (thyroid C-cell tumors); GI effects common (nausea/vomiting); pancreatitis risk; not for T1DM or DKA",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.35,
        yOffset: 0.25,
        angle: .safety,
        baseConceptTitle: "SEMAGLUTIDE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > OZEMPIC (T2DM SQ): Start 0.25 mg SQ QWeek × 4 weeks → 0.5 mg QWeek → may increase to 1 mg or 2 mg QWeek.
        > WEGOVY (Obesity SQ): Start 0.25 mg QWeek; titrate over 16–20 weeks to target 2.4 mg QWeek.
        > RYBELSUS (PO): Start 3 mg QD × 30 days → 7 mg QD → 14 mg QD; take on empty stomach with ≤4 oz plain water; wait 30 min before eating.
        > INJECTION SITES: Abdomen, thigh, or upper arm; rotate sites.
        > MISSED DOSE: Take within 5 days of scheduled dose; if >5 days, skip and resume next scheduled dose.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ozempic for T2DM starts at 0.5 mg weekly without a lower starting dose",
            "B. Ozempic: start 0.25 mg QWeek × 4 weeks then titrate; Wegovy targets 2.4 mg QWeek (titrate over 16–20 weeks); Rybelsus taken on empty stomach with ≤4 oz water, wait 30 min before eating",
            "C. Rybelsus (oral semaglutide) should be taken with a full meal for maximum absorption",
            "D. Semaglutide injection sites are limited to the abdomen only"
        ],
        correctAnswer: "B. Ozempic: start 0.25 mg QWeek × 4 weeks then titrate; Wegovy targets 2.4 mg QWeek (titrate over 16–20 weeks); Rybelsus taken on empty stomach with ≤4 oz water, wait 30 min before eating",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.40,
        yOffset: 0.25,
        angle: .dosing,
        baseConceptTitle: "SEMAGLUTIDE"
    ),

    // ============================================================
    // ALLOPURINOL — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Xanthine oxidase inhibitor; urate-lowering therapy (ULT); brand: Zyloprim.
        > INDICATIONS:
        >   1. Gout — chronic hyperuricemia prevention (NOT for acute attacks)
        >   2. Tumor lysis syndrome (TLS) prevention in chemotherapy
        >   3. Recurrent uric acid nephrolithiasis (kidney stones)
        > GOAL: Serum uric acid <6 mg/dL (or <5 mg/dL with tophi).
        > RELATED: Febuxostat (Uloric) — newer xanthine oxidase inhibitor; avoid with 6-MP/azathioprine.
        > KEY POINT: Do NOT start during an acute gout flare.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Allopurinol is the first-line agent for treating acute gout attacks",
            "B. Allopurinol prevents gout by lowering uric acid (ULT); also prevents tumor lysis syndrome and uric acid stones; do NOT start during an acute flare; goal uric acid <6 mg/dL",
            "C. Allopurinol is indicated for acute gout and should be started at the onset of a flare",
            "D. Allopurinol treats hyperuricemia by increasing renal uric acid excretion"
        ],
        correctAnswer: "B. Allopurinol prevents gout by lowering uric acid (ULT); also prevents tumor lysis syndrome and uric acid stones; do NOT start during an acute flare; goal uric acid <6 mg/dL",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.25,
        yOffset: 0.35,
        angle: .indication,
        baseConceptTitle: "ALLOPURINOL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Inhibits xanthine oxidase (XO) — the enzyme that converts hypoxanthine → xanthine → uric acid.
        > RESULT: Less uric acid produced → serum urate falls → less crystal deposition in joints.
        > OXYPURINOL: Active metabolite of allopurinol (also XO inhibitor); long half-life.
        > PURINE ANALOGS: Allopurinol inhibits metabolism of 6-mercaptopurine (6-MP) and azathioprine (via XO) → toxicity — must reduce 6-MP/AZA dose by 75% or avoid combination.
        > COLCHICINE OVERLAP: Give prophylactic colchicine for first 3–6 months of ULT to prevent mobilization flares.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Allopurinol works by increasing renal excretion of uric acid (uricosuric mechanism)",
            "B. Allopurinol inhibits xanthine oxidase → blocks uric acid synthesis; active metabolite is oxypurinol; blocks 6-MP/azathioprine metabolism (reduce dose 75% or avoid); colchicine prophylaxis for first 3–6 months",
            "C. Allopurinol dissolves existing urate crystals in joints, providing direct anti-inflammatory benefit",
            "D. Allopurinol can be safely combined with azathioprine without dose adjustment"
        ],
        correctAnswer: "B. Allopurinol inhibits xanthine oxidase → blocks uric acid synthesis; active metabolite is oxypurinol; blocks 6-MP/azathioprine metabolism (reduce dose 75% or avoid); colchicine prophylaxis for first 3–6 months",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.30,
        yOffset: 0.35,
        angle: .mechanism,
        baseConceptTitle: "ALLOPURINOL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ALLOPURINOL HYPERSENSITIVITY SYNDROME (AHS): Rare but life-threatening — fever, skin rash, eosinophilia, hepatitis, renal failure. Risk higher with HLA-B*58:01 allele (Asian populations) — test before starting in high-risk patients.
        > INITIAL FLARE: Starting ULT can mobilize urate crystals → acute flare; use prophylactic colchicine.
        > RENAL DOSING: Reduce dose in CKD — oxypurinol accumulates.
        > AMPICILLIN/AMOXICILLIN: Increased rash risk with concurrent use.
        > WARFARIN: Allopurinol inhibits warfarin metabolism (CYP) → monitor INR.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Allopurinol hypersensitivity syndrome is mild and self-limited; treatment continuation is safe",
            "B. Allopurinol hypersensitivity syndrome is life-threatening; HLA-B*58:01 increases risk (test in Asian patients); starting ULT can trigger flares (use colchicine prophylaxis); reduce dose in CKD",
            "C. Allopurinol is safer in Asian populations due to their lower rate of hypersensitivity reactions",
            "D. Allopurinol has no effect on warfarin metabolism"
        ],
        correctAnswer: "B. Allopurinol hypersensitivity syndrome is life-threatening; HLA-B*58:01 increases risk (test in Asian patients); starting ULT can trigger flares (use colchicine prophylaxis); reduce dose in CKD",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.35,
        yOffset: 0.35,
        angle: .safety,
        baseConceptTitle: "ALLOPURINOL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > GOUT PREVENTION: Start 100 mg QD (low dose to minimize flare risk); titrate by 100 mg every 2–5 weeks; usual 300 mg QD; max 800 mg/day.
        > RENAL IMPAIRMENT: CrCl 10–50 mL/min → 100–200 mg QD; CrCl <10 → 100 mg QOD.
        > TLS PREVENTION: 300–900 mg/day starting 1–2 days before chemo.
        > MONITOR: Serum uric acid every 2–4 weeks until target; CMP baseline.
        > COLCHICINE PROPHYLAXIS: 0.6 mg QD during first 3–6 months of therapy.
        > 6-MP/AZATHIOPRINE: Reduce dose by 75% if allopurinol must be co-prescribed.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Allopurinol for gout prevention is started at the full target dose of 300 mg immediately",
            "B. Start allopurinol at 100 mg QD and titrate slowly (prevent flares); usual target 300 mg QD; reduce dose in CKD; co-prescribe colchicine prophylaxis for 3–6 months; reduce 6-MP/AZA by 75%",
            "C. Allopurinol for TLS prevention should be started 4 weeks after chemotherapy is completed",
            "D. Maximum allopurinol dose for gout is 300 mg regardless of response"
        ],
        correctAnswer: "B. Start allopurinol at 100 mg QD and titrate slowly (prevent flares); usual target 300 mg QD; reduce dose in CKD; co-prescribe colchicine prophylaxis for 3–6 months; reduce 6-MP/AZA by 75%",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.40,
        yOffset: 0.35,
        angle: .dosing,
        baseConceptTitle: "ALLOPURINOL"
    ),

    // ============================================================
    // CLINDAMYCIN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Lincosamide antibiotic; brand: Cleocin.
        > INDICATIONS:
        >   1. Skin/soft tissue infections (SSTIs) — including MRSA (community-acquired)
        >   2. Anaerobic infections (intra-abdominal, pelvic, lung abscess)
        >   3. Bone/joint infections (osteomyelitis)
        >   4. Bacterial vaginosis (topical or oral)
        >   5. Dental infections (penicillin allergy alternative)
        >   6. Toxoplasmosis (with pyrimethamine)
        >   7. Acne vulgaris (topical)
        > COVERAGE: Gram-positive cocci (strep, staph including CA-MRSA) + anaerobes; NO gram-negative coverage.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clindamycin provides excellent coverage against gram-negative organisms including E. coli",
            "B. Clindamycin covers gram-positive cocci (MRSA) and anaerobes; used for SSTIs, anaerobic infections, dental infections (PCN allergy), BV, and acne; no gram-negative coverage",
            "C. Clindamycin is first-line for hospital-acquired MRSA (HA-MRSA) bloodstream infections",
            "D. Clindamycin is not effective against community-acquired MRSA (CA-MRSA)"
        ],
        correctAnswer: "B. Clindamycin covers gram-positive cocci (MRSA) and anaerobes; used for SSTIs, anaerobic infections, dental infections (PCN allergy), BV, and acne; no gram-negative coverage",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.25,
        yOffset: 0.45,
        angle: .indication,
        baseConceptTitle: "CLINDAMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Binds to 50S ribosomal subunit → inhibits peptide translocation → inhibits protein synthesis → bacteriostatic (bactericidal at high concentrations).
        > SAME BINDING SITE: Competes with chloramphenicol and macrolides (erythromycin, azithromycin) — do NOT combine (antagonism).
        > D-ZONE TEST: Inducible MLSB resistance — lab D-zone disk diffusion test identifies isolates that appear susceptible but may develop resistance during therapy.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clindamycin inhibits cell wall synthesis by blocking transpeptidase (penicillin binding protein)",
            "B. Clindamycin binds the 50S ribosome and blocks protein synthesis; shares binding site with macrolides/chloramphenicol (antagonism if combined); D-zone test identifies inducible resistance",
            "C. Clindamycin and azithromycin have synergistic activity when combined for MRSA infections",
            "D. Clindamycin is bactericidal at all therapeutic concentrations"
        ],
        correctAnswer: "B. Clindamycin binds the 50S ribosome and blocks protein synthesis; shares binding site with macrolides/chloramphenicol (antagonism if combined); D-zone test identifies inducible resistance",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.30,
        yOffset: 0.45,
        angle: .mechanism,
        baseConceptTitle: "CLINDAMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > C. DIFFICILE: Black Box Warning — Clostridium difficile-associated diarrhea (CDAD). Among highest risk antibiotics for C. diff (with fluoroquinolones, cephalosporins, ampicillin).
        > ANTIBIOTIC-ASSOCIATED COLITIS: Stop immediately if severe diarrhea, bloody stools, or fever develops.
        > GI: Nausea, vomiting, diarrhea, esophageal irritation (take with food/water).
        > NEUROMUSCULAR BLOCKADE: May potentiate neuromuscular blockers.
        > HEPATIC: Use with caution in severe hepatic disease (hepatic metabolism).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clindamycin has minimal risk of C. difficile compared to other antibiotics",
            "B. Clindamycin has a Black Box Warning for C. diff colitis — one of the highest-risk antibiotics; stop immediately if severe diarrhea or bloody stools develop; take with food to reduce GI irritation",
            "C. Clindamycin is the preferred treatment for C. difficile infections",
            "D. C. difficile colitis from clindamycin can be safely managed by reducing the dose"
        ],
        correctAnswer: "B. Clindamycin has a Black Box Warning for C. diff colitis — one of the highest-risk antibiotics; stop immediately if severe diarrhea or bloody stools develop; take with food to reduce GI irritation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.35,
        yOffset: 0.45,
        angle: .safety,
        baseConceptTitle: "CLINDAMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MILD-MODERATE SSTI: 300–450 mg PO q6h × 7–10 days.
        > SEVERE INFECTIONS (IV): 600–900 mg IV q8h.
        > DENTAL: 300 mg PO 30–60 min before procedure (endocarditis prophylaxis in PCN allergy).
        > BV (ORAL): 300 mg PO BID × 7 days.
        > BV (TOPICAL): 2% vaginal cream × 7 nights (or 100 mg suppository × 3 days).
        > ACNE: 1% topical solution/gel/lotion (with benzoyl peroxide to prevent resistance).
        > COMPLETE COURSE: Finish all doses; do not stop if diarrhea is mild (reassess if severe).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clindamycin for mild SSTI is dosed at 150 mg PO QD for 5 days",
            "B. Mild-moderate SSTI: 300–450 mg PO q6h; IV severe infections: 600–900 mg q8h; dental prophylaxis: 300 mg (PCN allergy); topical clindamycin for acne should be combined with benzoyl peroxide to prevent resistance",
            "C. Clindamycin for dental prophylaxis is given after the procedure to prevent bacteremia",
            "D. Topical clindamycin for acne is effective as monotherapy without benzoyl peroxide"
        ],
        correctAnswer: "B. Mild-moderate SSTI: 300–450 mg PO q6h; IV severe infections: 600–900 mg q8h; dental prophylaxis: 300 mg (PCN allergy); topical clindamycin for acne should be combined with benzoyl peroxide to prevent resistance",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.40,
        yOffset: 0.45,
        angle: .dosing,
        baseConceptTitle: "CLINDAMYCIN"
    ),
]
