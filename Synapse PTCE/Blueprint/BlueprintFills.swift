//
//  BlueprintFills.swift
//  Synapse PTCE
//
//  Targeted gap-fill DataNodes against the PTCB 2020 content blueprint, authored
//  to plug specific weak spots identified by an audit pass: top-50 drugs missing
//  from the existing pool, USP <800> hazardous drugs, alligation, infusion duration,
//  vaccine workflow (CDC schedules / VIS / observation / NDC scan / VAERS),
//  mifepristone & ketamine REMS, Beers Criteria, CYP interactions, OTC/herbals,
//  drug-nutrient/drug-lab, theophylline + carbamazepine NTI, non-sterile compounding,
//  pharmacist vs tech scope, DAW codes.
//
//  Loaded last in GameEngine.makeAsync() so these are picked up by the practice and
//  blueprint exam pools and by the spaced-repetition mastery tracker.
//

import Foundation

extension DataNode {

    static let blueprintFillNodes: [DataNode] = [

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  TOP-50 DRUGS — MISSING FROM EXISTING POOL                       ║
        // ║  12 drugs × 3 angles (indication, mechanism/safety, dosing/PTCE) ║
        // ╚══════════════════════════════════════════════════════════════════╝

        // ── SIMVASTATIN ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SIMVASTATIN / INDICATION",
            loreText: "Simvastatin (Zocor) is an HMG-CoA reductase inhibitor used to lower LDL cholesterol and reduce cardiovascular events. Brand: Zocor. Generic available. Counsel: take in the evening (cholesterol synthesis peaks overnight).",
            options: [
                "A. Hyperlipidemia and prevention of cardiovascular events",
                "B. Type 2 diabetes mellitus — primary glycemic control",
                "C. Hypertension — first-line for stage 1",
                "D. GERD — long-term acid suppression"
            ], correctAnswer: "A. Hyperlipidemia and prevention of cardiovascular events",
            xOffset: 0.05, yOffset: 0.02, baseConceptTitle: "Simvastatin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SIMVASTATIN / SAFETY",
            loreText: "Major risks: myopathy and rhabdomyolysis, especially with strong CYP3A4 inhibitors (clarithromycin, itraconazole, grapefruit juice). 80 mg dose has FDA limitation due to myopathy risk — only continue 80 mg if patient has tolerated for 12+ months without muscle toxicity.",
            options: [
                "A. Rhabdomyolysis — risk magnified by CYP3A4 inhibitors and grapefruit",
                "B. Hypoglycemia — major class effect of statins",
                "C. Anticholinergic burden — confusion, urinary retention",
                "D. QT prolongation — torsades de pointes risk"
            ], correctAnswer: "A. Rhabdomyolysis — risk magnified by CYP3A4 inhibitors and grapefruit",
            xOffset: 0.10, yOffset: 0.02, baseConceptTitle: "Simvastatin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SIMVASTATIN / COUNSELING",
            loreText: "Take in the evening; avoid grapefruit juice; report unexplained muscle pain/weakness/dark urine immediately (rhabdomyolysis warning). Pregnancy Category X — contraindicated; cholesterol is essential for fetal development.",
            options: [
                "A. Take in the evening; avoid grapefruit; report unexplained muscle pain",
                "B. Take with high-fat breakfast for absorption",
                "C. Take only when fasting blood glucose is below 80",
                "D. Take 30 minutes before any meal"
            ], correctAnswer: "A. Take in the evening; avoid grapefruit; report unexplained muscle pain",
            xOffset: 0.15, yOffset: 0.02, baseConceptTitle: "Simvastatin"),

        // ── FLUOXETINE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FLUOXETINE / INDICATION",
            loreText: "Fluoxetine (Prozac, Sarafem) is a selective serotonin reuptake inhibitor (SSRI) used for major depression, OCD, bulimia, panic disorder, and PMDD. Longest half-life of all SSRIs (~4–16 days for active metabolite) — minimal withdrawal but slow titration.",
            options: [
                "A. Depression, OCD, bulimia, panic, PMDD",
                "B. Hypertension — beta-1 selective antagonist",
                "C. Type 2 diabetes — increases insulin sensitivity",
                "D. Seizure prophylaxis — sodium channel modulator"
            ], correctAnswer: "A. Depression, OCD, bulimia, panic, PMDD",
            xOffset: 0.20, yOffset: 0.02, baseConceptTitle: "Fluoxetine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FLUOXETINE / SAFETY",
            loreText: "Black box warning: increased suicidality in children/adolescents/young adults. Serotonin syndrome risk if combined with MAOIs, linezolid, methylene blue, tramadol, triptans, St. John's Wort. 14-day washout from MAOIs; 5-week washout TO an MAOI due to long half-life.",
            options: [
                "A. Serotonin syndrome with MAOIs/linezolid/tramadol; black box for suicidality in young adults",
                "B. Anticholinergic toxicity is the main class effect",
                "C. Hyperkalemia at standard doses",
                "D. Photosensitivity is the most common ADR"
            ], correctAnswer: "A. Serotonin syndrome with MAOIs/linezolid/tramadol; black box for suicidality in young adults",
            xOffset: 0.25, yOffset: 0.02, baseConceptTitle: "Fluoxetine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FLUOXETINE / DOSING",
            loreText: "Start 20 mg daily in morning (insomnia risk if taken at night). Range 20–80 mg/day. Once-weekly delayed-release formulation (Prozac Weekly) at 90 mg available. PMDD: 20 mg daily continuously OR luteal phase only (14 days before menses).",
            options: [
                "A. Start 20 mg in morning; max ~80 mg/day; PMDD allows luteal-phase dosing",
                "B. Start 500 mg twice daily with meals",
                "C. Start 5 mg subcutaneous weekly",
                "D. Start 100 mg every 4 hours as needed"
            ], correctAnswer: "A. Start 20 mg in morning; max ~80 mg/day; PMDD allows luteal-phase dosing",
            xOffset: 0.30, yOffset: 0.02, baseConceptTitle: "Fluoxetine"),

        // ── PROPRANOLOL ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PROPRANOLOL / INDICATION",
            loreText: "Propranolol (Inderal) is a non-selective beta-blocker (β1 + β2) used for hypertension, migraine prophylaxis, essential tremor, performance anxiety, hyperthyroid symptom control, and post-MI. Lipophilic — crosses blood-brain barrier (CNS effects: nightmares, depression).",
            options: [
                "A. Hypertension, migraine prophylaxis, tremor, performance anxiety, hyperthyroid symptoms",
                "B. Acute heart failure — positive inotrope",
                "C. Type 2 diabetes — improves glycemic control",
                "D. Asthma rescue — bronchodilator"
            ], correctAnswer: "A. Hypertension, migraine prophylaxis, tremor, performance anxiety, hyperthyroid symptoms",
            xOffset: 0.35, yOffset: 0.02, baseConceptTitle: "Propranolol"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PROPRANOLOL / SAFETY",
            loreText: "Contraindicated in asthma/COPD (β2 blockade → bronchospasm), severe bradycardia, heart block. Masks hypoglycemia symptoms in diabetics (tachycardia blunted; sweating preserved). Abrupt discontinuation can cause rebound hypertension/MI — taper.",
            options: [
                "A. Contraindicated in asthma; masks hypoglycemia; never stop abruptly (rebound HTN/MI)",
                "B. Safe in any pulmonary disease; promotes bronchodilation",
                "C. First-line in cardiogenic shock",
                "D. Indicated in severe bradycardia"
            ], correctAnswer: "A. Contraindicated in asthma; masks hypoglycemia; never stop abruptly (rebound HTN/MI)",
            xOffset: 0.40, yOffset: 0.02, baseConceptTitle: "Propranolol"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PROPRANOLOL / DOSING",
            loreText: "Hypertension: 40 mg BID, titrate to 120–240 mg/day. Migraine prophylaxis: 80 mg ER daily. Performance anxiety: 10–40 mg PO 30–60 min before event (off-label, well-established). ER (Inderal LA) once daily.",
            options: [
                "A. HTN 40 mg BID; migraine prophylaxis 80 mg ER daily; performance anxiety 10–40 mg before event",
                "B. Always given as a single 500 mg morning dose",
                "C. Subcutaneous injection only",
                "D. 1 mg sublingual, repeat every 5 minutes"
            ], correctAnswer: "A. HTN 40 mg BID; migraine prophylaxis 80 mg ER daily; performance anxiety 10–40 mg before event",
            xOffset: 0.45, yOffset: 0.02, baseConceptTitle: "Propranolol"),

        // ── METHYLPREDNISOLONE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "METHYLPREDNISOLONE / INDICATION",
            loreText: "Methylprednisolone (Medrol, Solu-Medrol) is a glucocorticoid used for inflammation, immunosuppression, asthma exacerbation, multiple sclerosis flares, organ rejection, and severe allergic reactions. Medrol Dosepak = 6-day taper (21 tablets, 4 mg).",
            options: [
                "A. Acute inflammation/immunosuppression — Medrol Dosepak is a 6-day taper",
                "B. Hypertension — first-line antihypertensive",
                "C. Type 2 diabetes — primary glycemic control",
                "D. Anticoagulation — prevents stroke in AFib"
            ], correctAnswer: "A. Acute inflammation/immunosuppression — Medrol Dosepak is a 6-day taper",
            xOffset: 0.50, yOffset: 0.02, baseConceptTitle: "Methylprednisolone"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "METHYLPREDNISOLONE / SAFETY",
            loreText: "Long-term use: hyperglycemia, osteoporosis, adrenal suppression (taper to discontinue), peptic ulcer, infection risk, cataracts. Avoid abrupt cessation if used >2 weeks. Live vaccines contraindicated in patients on chronic high-dose steroids.",
            options: [
                "A. Hyperglycemia, osteoporosis, adrenal suppression — never stop abruptly after >2 weeks",
                "B. Hypoglycemia at any dose",
                "C. Bradycardia and heart block",
                "D. Hyperkalemia in all patients"
            ], correctAnswer: "A. Hyperglycemia, osteoporosis, adrenal suppression — never stop abruptly after >2 weeks",
            xOffset: 0.55, yOffset: 0.02, baseConceptTitle: "Methylprednisolone"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "METHYLPREDNISOLONE / EQUIVALENCY",
            loreText: "Steroid potency comparison (PTCB high-yield): hydrocortisone 20 mg ≈ prednisone 5 mg ≈ methylprednisolone 4 mg ≈ dexamethasone 0.75 mg. Methylprednisolone has minimal mineralocorticoid activity (less Na/water retention than prednisone).",
            options: [
                "A. Methylprednisolone 4 mg ≈ prednisone 5 mg ≈ dexamethasone 0.75 mg",
                "B. Methylprednisolone 100 mg ≈ prednisone 1 mg",
                "C. Methylprednisolone 4 mg ≈ dexamethasone 100 mg",
                "D. All glucocorticoids are mg-for-mg equivalent"
            ], correctAnswer: "A. Methylprednisolone 4 mg ≈ prednisone 5 mg ≈ dexamethasone 0.75 mg",
            xOffset: 0.60, yOffset: 0.02, baseConceptTitle: "Methylprednisolone"),

        // ── NAPROXEN ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "NAPROXEN / INDICATION",
            loreText: "Naproxen (Aleve OTC, Naprosyn Rx) is an NSAID used for pain, inflammation, fever, dysmenorrhea, and arthritis. Longer half-life than ibuprofen (~12–17 h) — twice-daily dosing. Lowest cardiovascular risk of common NSAIDs (preferred for patients with CV risk needing chronic NSAID).",
            options: [
                "A. Pain, inflammation, fever, arthritis — lowest CV risk among common NSAIDs",
                "B. Hypertension — alpha-blocker",
                "C. Type 2 diabetes — increases insulin sensitivity",
                "D. Anticoagulation — direct factor Xa inhibitor"
            ], correctAnswer: "A. Pain, inflammation, fever, arthritis — lowest CV risk among common NSAIDs",
            xOffset: 0.65, yOffset: 0.02, baseConceptTitle: "Naproxen"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "NAPROXEN / SAFETY",
            loreText: "Class warnings: GI bleed (worse with anticoagulants/SSRIs/age>65/H. pylori), renal impairment (especially with ACEi/ARB/diuretic = 'triple whammy'), increased CV thrombotic events. Avoid in last trimester (premature ductus arteriosus closure). Take with food.",
            options: [
                "A. GI bleed, renal injury (triple whammy with ACEi/diuretic), CV events; avoid 3rd trimester",
                "B. Hypoglycemia is the major risk",
                "C. Photosensitivity is the dominant ADR",
                "D. Anticholinergic burden — confusion in elderly"
            ], correctAnswer: "A. GI bleed, renal injury (triple whammy with ACEi/diuretic), CV events; avoid 3rd trimester",
            xOffset: 0.70, yOffset: 0.02, baseConceptTitle: "Naproxen"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "NAPROXEN / DOSING",
            loreText: "OTC (Aleve): 220 mg q8–12h, max 660 mg/day OTC. Rx: 250–500 mg BID, max 1500 mg/day short-term, 1000 mg/day chronic. Always with food. Counsel ≥65: lower dose, shorter duration, GI prophylaxis (PPI) if chronic.",
            options: [
                "A. OTC 220 mg q8–12h max 660 mg/day; Rx max 1500 mg/day short-term",
                "B. 5 mg subcutaneous once weekly",
                "C. 100 mg sublingual every 5 minutes",
                "D. IV continuous infusion only"
            ], correctAnswer: "A. OTC 220 mg q8–12h max 660 mg/day; Rx max 1500 mg/day short-term",
            xOffset: 0.75, yOffset: 0.02, baseConceptTitle: "Naproxen"),

        // ── PAROXETINE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PAROXETINE / INDICATION",
            loreText: "Paroxetine (Paxil) is an SSRI used for depression, OCD, panic disorder, social anxiety, GAD, PTSD, PMDD, and vasomotor symptoms of menopause (Brisdelle, low-dose 7.5 mg). Most anticholinergic of SSRIs — sedation/weight gain/constipation more common.",
            options: [
                "A. Depression, OCD, panic, anxiety, PTSD, PMDD; Brisdelle for hot flashes",
                "B. Type 2 diabetes — primary glycemic control",
                "C. Hypertension — first-line agent",
                "D. Bacterial infections — DHFR inhibitor"
            ], correctAnswer: "A. Depression, OCD, panic, anxiety, PTSD, PMDD; Brisdelle for hot flashes",
            xOffset: 0.80, yOffset: 0.02, baseConceptTitle: "Paroxetine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PAROXETINE / SAFETY",
            loreText: "Pregnancy Category D (cardiac defects — Ebstein's anomaly with first-trimester exposure). Strong CYP2D6 inhibitor — interacts with tamoxifen (reduces active metabolite endoxifen, blunts breast cancer protection), codeine (blocks activation), atomoxetine.",
            options: [
                "A. Pregnancy D (cardiac); CYP2D6 inhibitor — major interaction with tamoxifen",
                "B. Pregnancy A (safe in any trimester)",
                "C. Has no clinically significant CYP interactions",
                "D. Increases tamoxifen activity — added cancer protection"
            ], correctAnswer: "A. Pregnancy D (cardiac); CYP2D6 inhibitor — major interaction with tamoxifen",
            xOffset: 0.85, yOffset: 0.02, baseConceptTitle: "Paroxetine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "PAROXETINE / DISCONTINUATION",
            loreText: "Highest discontinuation syndrome of all SSRIs due to short half-life (~21 h) and absent active metabolite. Symptoms: dizziness, electric-shock sensations, flu-like, irritability — within 1–3 days of stopping. Always taper. Counsel patients NEVER to stop abruptly.",
            options: [
                "A. Highest SSRI discontinuation syndrome — taper required, never stop abruptly",
                "B. Has no withdrawal symptoms — safe to stop overnight",
                "C. 6-week half-life makes withdrawal impossible",
                "D. Withdrawal only matters in patients on >40 mg"
            ], correctAnswer: "A. Highest SSRI discontinuation syndrome — taper required, never stop abruptly",
            xOffset: 0.90, yOffset: 0.02, baseConceptTitle: "Paroxetine"),

        // ── SITAGLIPTIN ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SITAGLIPTIN / INDICATION",
            loreText: "Sitagliptin (Januvia) is a DPP-4 inhibitor used for type 2 diabetes, often added to metformin when single-agent glycemic control fails. Inhibits DPP-4 enzyme that degrades GLP-1 → endogenous incretin levels rise → glucose-dependent insulin release. Weight neutral; minimal hypoglycemia risk as monotherapy.",
            options: [
                "A. Type 2 diabetes — DPP-4 inhibition raises endogenous GLP-1; weight neutral",
                "B. Type 1 diabetes — replaces absent insulin",
                "C. Hypertension — RAAS blocker",
                "D. Hyperlipidemia — bile acid sequestrant"
            ], correctAnswer: "A. Type 2 diabetes — DPP-4 inhibition raises endogenous GLP-1; weight neutral",
            xOffset: 0.05, yOffset: 0.07, baseConceptTitle: "Sitagliptin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SITAGLIPTIN / SAFETY",
            loreText: "Class adverse effects: pancreatitis (rare but serious — hold and evaluate if abdominal pain), arthralgia (FDA warning), heart failure exacerbation (saxagliptin/alogliptin worse). Renal dose adjustment required (CrCl <50: 50 mg; CrCl <30: 25 mg).",
            options: [
                "A. Pancreatitis, arthralgia, possible HF exacerbation; renal dose adjust",
                "B. Hypoglycemia is the major risk as monotherapy",
                "C. Anticholinergic toxicity is the dominant ADR",
                "D. Causes rhabdomyolysis like statins"
            ], correctAnswer: "A. Pancreatitis, arthralgia, possible HF exacerbation; renal dose adjust",
            xOffset: 0.10, yOffset: 0.07, baseConceptTitle: "Sitagliptin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "SITAGLIPTIN / DOSING",
            loreText: "100 mg once daily, with or without food. CrCl 30–50: 50 mg daily. CrCl <30 or hemodialysis: 25 mg daily. Combination products: Janumet (sitagliptin + metformin), Janumet XR.",
            options: [
                "A. 100 mg once daily; renal dose adjust at CrCl <50",
                "B. 500 mg twice daily with meals",
                "C. Subcutaneous injection once weekly",
                "D. Sublingual every 4 hours as needed"
            ], correctAnswer: "A. 100 mg once daily; renal dose adjust at CrCl <50",
            xOffset: 0.15, yOffset: 0.07, baseConceptTitle: "Sitagliptin"),

        // ── TOPIRAMATE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TOPIRAMATE / INDICATION",
            loreText: "Topiramate (Topamax) is used for partial-onset and primary generalized tonic-clonic seizures (mono or adjunct), migraine prophylaxis, and (combined with phentermine as Qsymia) chronic weight management. Multiple mechanisms: Na+ channel blockade, GABA enhancement, AMPA antagonism.",
            options: [
                "A. Seizures, migraine prophylaxis, chronic weight management (with phentermine)",
                "B. Acute migraine abortive — first-line at headache onset",
                "C. Type 2 diabetes — incretin-based therapy",
                "D. Hypertension — first-line"
            ], correctAnswer: "A. Seizures, migraine prophylaxis, chronic weight management (with phentermine)",
            xOffset: 0.20, yOffset: 0.07, baseConceptTitle: "Topiramate"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TOPIRAMATE / SAFETY",
            loreText: "Cognitive slowing (\"Dopamax\" — word-finding difficulty, paresthesias), kidney stones (carbonic anhydrase inhibition), oligohidrosis (decreased sweating, hyperthermia in children), metabolic acidosis, weight loss (often welcomed). Pregnancy D — cleft lip/palate.",
            options: [
                "A. Cognitive slowing, kidney stones, oligohidrosis, weight loss; pregnancy D",
                "B. Causes weight gain — primary class effect",
                "C. Hyperhidrosis — excessive sweating",
                "D. Has no pregnancy concern"
            ], correctAnswer: "A. Cognitive slowing, kidney stones, oligohidrosis, weight loss; pregnancy D",
            xOffset: 0.25, yOffset: 0.07, baseConceptTitle: "Topiramate"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TOPIRAMATE / DOSING",
            loreText: "Migraine prophylaxis: start 25 mg HS, titrate by 25 mg/week to 100 mg/day (50 BID). Seizures: start 25–50 mg, titrate to 200–400 mg/day. Hydrate well to reduce kidney stone risk.",
            options: [
                "A. Migraine prophylaxis: titrate slowly to 100 mg/day; hydrate to reduce stone risk",
                "B. Single 500 mg loading dose",
                "C. Subcutaneous weekly injection",
                "D. PRN dosing for acute headache"
            ], correctAnswer: "A. Migraine prophylaxis: titrate slowly to 100 mg/day; hydrate to reduce stone risk",
            xOffset: 0.30, yOffset: 0.07, baseConceptTitle: "Topiramate"),

        // ── VALPROIC ACID ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "VALPROIC ACID / INDICATION",
            loreText: "Valproic acid / valproate / divalproex (Depakote, Depakene) is used for seizure disorders (broad-spectrum — partial, generalized, absence), bipolar mania, and migraine prophylaxis. NTI drug — therapeutic range 50–100 mcg/mL.",
            options: [
                "A. Seizures (broad-spectrum), bipolar mania, migraine prophylaxis — NTI drug",
                "B. Type 2 diabetes — primary glycemic control",
                "C. Hyperlipidemia — HMG-CoA reductase inhibitor",
                "D. Anticoagulation — factor Xa inhibitor"
            ], correctAnswer: "A. Seizures (broad-spectrum), bipolar mania, migraine prophylaxis — NTI drug",
            xOffset: 0.35, yOffset: 0.07, baseConceptTitle: "Valproic Acid"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "VALPROIC ACID / SAFETY",
            loreText: "Black box warnings: hepatotoxicity (especially children <2), pancreatitis, teratogenicity (neural tube defects — pregnancy X for migraine prophylaxis, D for other indications). Hyperammonemia. Thrombocytopenia. Weight gain. Hair loss.",
            options: [
                "A. Hepatotoxicity, pancreatitis, neural tube defects (pregnancy X for migraine)",
                "B. Always safe in pregnancy",
                "C. Causes weight loss — class effect",
                "D. Improves platelet counts"
            ], correctAnswer: "A. Hepatotoxicity, pancreatitis, neural tube defects (pregnancy X for migraine)",
            xOffset: 0.40, yOffset: 0.07, baseConceptTitle: "Valproic Acid"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "VALPROIC ACID / MONITORING",
            loreText: "NTI drug — therapeutic 50–100 mcg/mL trough. Monitor LFTs, CBC with platelets, ammonia (if symptomatic), valproate level. Increases lamotrigine levels (must dose-reduce lamotrigine when adding VPA — Stevens-Johnson risk).",
            options: [
                "A. Therapeutic 50–100 mcg/mL; reduces lamotrigine clearance (SJS risk)",
                "B. No monitoring required",
                "C. Therapeutic 200–400 mcg/mL",
                "D. Increases lamotrigine clearance"
            ], correctAnswer: "A. Therapeutic 50–100 mcg/mL; reduces lamotrigine clearance (SJS risk)",
            xOffset: 0.45, yOffset: 0.07, baseConceptTitle: "Valproic Acid"),

        // ── FINASTERIDE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FINASTERIDE / INDICATION",
            loreText: "Finasteride (Proscar 5 mg, Propecia 1 mg) is a 5-alpha-reductase inhibitor that blocks conversion of testosterone to dihydrotestosterone (DHT). Indications: BPH (Proscar 5 mg) and male androgenetic alopecia (Propecia 1 mg).",
            options: [
                "A. BPH (5 mg) and male pattern hair loss (1 mg) — blocks DHT conversion",
                "B. Hypertension — alpha-1 blocker",
                "C. Type 2 diabetes — DPP-4 inhibitor",
                "D. ED — PDE5 inhibitor"
            ], correctAnswer: "A. BPH (5 mg) and male pattern hair loss (1 mg) — blocks DHT conversion",
            xOffset: 0.50, yOffset: 0.07, baseConceptTitle: "Finasteride"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FINASTERIDE / SAFETY",
            loreText: "Pregnancy Category X — broken/crushed tablets must NOT be handled by pregnant women (transdermal absorption can cause fetal genital abnormalities). Lowers PSA by ~50% — adjust PSA interpretation. Sexual side effects: decreased libido, ED, gynecomastia.",
            options: [
                "A. Pregnant women must not handle broken tablets; lowers PSA by ~50%",
                "B. Safe for any patient to handle without PPE",
                "C. Increases PSA dramatically",
                "D. Approved for use in pregnant women"
            ], correctAnswer: "A. Pregnant women must not handle broken tablets; lowers PSA by ~50%",
            xOffset: 0.55, yOffset: 0.07, baseConceptTitle: "Finasteride"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "FINASTERIDE / DOSING",
            loreText: "BPH: 5 mg daily, full effect at 6 months. Hair loss: 1 mg daily, full effect at 3–6 months; effect reverses if discontinued (~12 months). Men only — not used in women due to teratogenicity and limited efficacy.",
            options: [
                "A. BPH 5 mg daily (6-mo onset); hair loss 1 mg daily; reverses if stopped",
                "B. Single 500 mg loading dose",
                "C. Subcutaneous monthly injection",
                "D. Topical only"
            ], correctAnswer: "A. BPH 5 mg daily (6-mo onset); hair loss 1 mg daily; reverses if stopped",
            xOffset: 0.60, yOffset: 0.07, baseConceptTitle: "Finasteride"),

        // ── LAMOTRIGINE ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "LAMOTRIGINE / INDICATION",
            loreText: "Lamotrigine (Lamictal) is an antiepileptic for partial and generalized seizures, Lennox-Gastaut, and bipolar disorder maintenance (preventing depressive episodes). Sodium-channel blocker that stabilizes neuronal membranes.",
            options: [
                "A. Seizures (partial/generalized/Lennox-Gastaut) and bipolar maintenance",
                "B. Acute mania — first-line",
                "C. Type 2 diabetes",
                "D. Hypertension — first-line"
            ], correctAnswer: "A. Seizures (partial/generalized/Lennox-Gastaut) and bipolar maintenance",
            xOffset: 0.65, yOffset: 0.07, baseConceptTitle: "Lamotrigine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "LAMOTRIGINE / SAFETY",
            loreText: "Black box: Stevens-Johnson syndrome / TEN — risk increased by rapid titration, valproate co-administration (which doubles lamotrigine levels), pediatric use. SLOW titration mandatory (25 mg/day for 2 weeks, then 50 mg, etc.). Any rash → STOP and call prescriber.",
            options: [
                "A. SJS/TEN black box — slow titration mandatory; halve dose if on valproate",
                "B. No serious dermatologic risk",
                "C. Fast loading required for efficacy",
                "D. Always doubled when added to valproate"
            ], correctAnswer: "A. SJS/TEN black box — slow titration mandatory; halve dose if on valproate",
            xOffset: 0.70, yOffset: 0.07, baseConceptTitle: "Lamotrigine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "LAMOTRIGINE / TITRATION",
            loreText: "Standard adult titration: 25 mg daily × 2 weeks → 50 mg daily × 2 weeks → 100 mg/day → up to 200–400 mg/day. With valproate: HALVE every dose (12.5 mg start). With enzyme inducers (carbamazepine, phenytoin): may need higher doses.",
            options: [
                "A. Slow stepwise titration; halve dose with valproate; SJS rises with rapid titration",
                "B. Start at maximum dose for fastest effect",
                "C. No interaction with valproate or carbamazepine",
                "D. Same dose for all patients"
            ], correctAnswer: "A. Slow stepwise titration; halve dose with valproate; SJS rises with rapid titration",
            xOffset: 0.75, yOffset: 0.07, baseConceptTitle: "Lamotrigine"),

        // ── TAMSULOSIN ──
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TAMSULOSIN / INDICATION",
            loreText: "Tamsulosin (Flomax) is an alpha-1A selective adrenergic blocker for benign prostatic hyperplasia (BPH). Relaxes smooth muscle in prostate and bladder neck → improved urinary flow. Selective for prostate (α1A) — less hypotension than non-selective alpha blockers.",
            options: [
                "A. BPH — relaxes prostate/bladder neck smooth muscle",
                "B. Hypertension — first-line agent",
                "C. ED — PDE5 inhibitor",
                "D. Type 2 diabetes — DPP-4 inhibitor"
            ], correctAnswer: "A. BPH — relaxes prostate/bladder neck smooth muscle",
            xOffset: 0.80, yOffset: 0.07, baseConceptTitle: "Tamsulosin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TAMSULOSIN / SAFETY",
            loreText: "First-dose orthostatic hypotension — counsel patient to take at bedtime, rise slowly first few days. Intraoperative Floppy Iris Syndrome (IFIS) — must inform ophthalmologist before cataract surgery. Avoid combination with PDE5 inhibitors (additive hypotension).",
            options: [
                "A. First-dose orthostasis; tell ophthalmologist before cataract surgery (IFIS)",
                "B. No interaction with sildenafil/tadalafil",
                "C. No orthostatic risk",
                "D. Improves cataract surgery outcomes"
            ], correctAnswer: "A. First-dose orthostasis; tell ophthalmologist before cataract surgery (IFIS)",
            xOffset: 0.85, yOffset: 0.07, baseConceptTitle: "Tamsulosin"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TAMSULOSIN / DOSING",
            loreText: "0.4 mg PO once daily, taken 30 minutes after the same meal each day (consistent meal timing for steady absorption). Increase to 0.8 mg if no response in 2–4 weeks. Capsule must be swallowed whole — do not crush, chew, or open.",
            options: [
                "A. 0.4 mg daily 30 min after the same meal; do not crush capsule",
                "B. PRN dosing for urinary symptoms",
                "C. Subcutaneous weekly",
                "D. Take on empty stomach for absorption"
            ], correctAnswer: "A. 0.4 mg daily 30 min after the same meal; do not crush capsule",
            xOffset: 0.90, yOffset: 0.07, baseConceptTitle: "Tamsulosin"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  USP <800> HAZARDOUS DRUGS                                       ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / SCOPE",
            loreText: "USP <800> applies to handling of HAZARDOUS DRUGS (HDs) — drugs on the NIOSH list — across receipt, storage, compounding, dispensing, administration, and disposal. Required since Dec 1, 2019. Goal: protect healthcare workers, patients, and the environment from HD exposure.",
            options: [
                "A. Handling of NIOSH-listed hazardous drugs across the entire pharmacy workflow",
                "B. Sterile compounding only — no impact on dispensing",
                "C. Only applies to chemotherapy",
                "D. Voluntary best practice — not enforceable"
            ], correctAnswer: "A. Handling of NIOSH-listed hazardous drugs across the entire pharmacy workflow",
            xOffset: 0.05, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / NIOSH LIST",
            loreText: "NIOSH categorizes HDs into three tables: Table 1 — antineoplastics; Table 2 — non-antineoplastic but meets HD criteria (e.g., warfarin, finasteride, methotrexate, oxytocin); Table 3 — reproductive-only hazard (e.g., conjugated estrogens, oxytocin). Pharmacy assesses risk and applies containment per category.",
            options: [
                "A. Three tables: antineoplastic, non-antineoplastic HD, reproductive-only",
                "B. One single list — all drugs handled identically",
                "C. Hazardous drugs are determined by manufacturer, not NIOSH",
                "D. The list is updated quarterly by FDA"
            ], correctAnswer: "A. Three tables: antineoplastic, non-antineoplastic HD, reproductive-only",
            xOffset: 0.10, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / CONTAINMENT",
            loreText: "Sterile HD compounding requires a Containment Primary Engineering Control (C-PEC): Class II BSC, Class III BSC, or CACI (compounding aseptic containment isolator), placed inside a negative-pressure ISO Class 7 buffer room (C-SEC). Externally vented HEPA exhaust required.",
            options: [
                "A. C-PEC (Class II BSC, Class III BSC, or CACI) in negative-pressure ISO 7 buffer room, externally vented",
                "B. Standard ISO 5 LAFW with positive pressure",
                "C. No engineering controls required for HDs",
                "D. Open-bench compounding acceptable for HDs"
            ], correctAnswer: "A. C-PEC (Class II BSC, Class III BSC, or CACI) in negative-pressure ISO 7 buffer room, externally vented",
            xOffset: 0.15, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / PPE",
            loreText: "PPE for HD handling: chemo-tested gown (closed front, long sleeves, elastic cuffs), TWO pairs of chemo-tested gloves (ASTM D6978), eye/face protection if splash risk, head cover, shoe covers (two pair if entering antineoplastic compounding area), respiratory protection (N95 or higher) if airborne risk.",
            options: [
                "A. Chemo gown + two pairs ASTM D6978 gloves + face/eye protection if splash; respirator if airborne",
                "B. Standard exam gloves and lab coat are sufficient",
                "C. PPE only required for IV chemotherapy reconstitution",
                "D. No PPE required during dispensing of oral HDs"
            ], correctAnswer: "A. Chemo gown + two pairs ASTM D6978 gloves + face/eye protection if splash; respirator if airborne",
            xOffset: 0.20, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / RECEIVING",
            loreText: "HD shipments must be unpacked in a neutral or negative-pressure area, NEVER in positive-pressure or sterile compounding areas. PPE worn during unpacking. Damaged HD containers placed directly in HD spill kit-grade containers and returned to supplier; do not open damaged HDs.",
            options: [
                "A. Unpack in neutral or negative-pressure area; never in sterile compounding area",
                "B. Unpack on the bench in the IV room",
                "C. Open damaged containers to assess salvage",
                "D. PPE not required during receiving"
            ], correctAnswer: "A. Unpack in neutral or negative-pressure area; never in sterile compounding area",
            xOffset: 0.25, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / STORAGE",
            loreText: "Antineoplastic HDs and HD APIs (active pharmaceutical ingredients) must be stored separately from other inventory in a dedicated negative-pressure room, externally vented, with at least 12 air changes/hour. Final dosage forms of non-antineoplastic HDs may be stored on regular shelves with appropriate labeling per facility assessment of risk.",
            options: [
                "A. Antineoplastics and HD APIs require separate negative-pressure room with ≥12 ACH",
                "B. All HDs may be stored on standard shelves with all other drugs",
                "C. Storage in a positive-pressure area is required",
                "D. Storage with bedside emergency cart is acceptable"
            ], correctAnswer: "A. Antineoplastics and HD APIs require separate negative-pressure room with ≥12 ACH",
            xOffset: 0.30, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / SPILL",
            loreText: "HD spills require a designated spill kit (chemo-tested gloves, gowns, absorbent pads, scoop, sealable HD waste bag, signs). Personnel trained at hire and annually. Spills documented; medical surveillance offered to exposed personnel. Decontamination uses appropriate cleaning agents (e.g., sodium hypochlorite for some HDs).",
            options: [
                "A. Designated spill kit, trained personnel, document and offer medical surveillance",
                "B. Wipe with paper towel; no documentation needed",
                "C. Standard housekeeping cleans HD spills",
                "D. HDs do not pose spill risk"
            ], correctAnswer: "A. Designated spill kit, trained personnel, document and offer medical surveillance",
            xOffset: 0.35, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / DECONTAMINATION",
            loreText: "C-PEC and HD work surfaces require a 4-step process: (1) deactivation (chemical neutralization — e.g., sodium hypochlorite + sodium thiosulfate), (2) decontamination (remove residue), (3) cleaning (germicidal detergent), (4) disinfection (sterile alcohol on sterile compounding surfaces).",
            options: [
                "A. Four steps: deactivate → decontaminate → clean → disinfect",
                "B. One wipe with 70% alcohol is sufficient",
                "C. Decontamination is not required for HDs",
                "D. Sterilize first, then deactivate"
            ], correctAnswer: "A. Four steps: deactivate → decontaminate → clean → disinfect",
            xOffset: 0.40, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / NON-ANTINEOPLASTIC",
            loreText: "Non-antineoplastic HDs in final dosage form (e.g., warfarin tablets, finasteride tablets, methotrexate oral) may be exempted from the full containment requirements based on the entity's risk assessment, but must still be labeled and handled with appropriate caution.",
            options: [
                "A. Final-dosage non-antineoplastic HDs may be exempted via documented risk assessment",
                "B. All non-antineoplastic HDs require full negative-pressure containment",
                "C. Risk assessment is prohibited under USP <800>",
                "D. Final dosage form exempts HDs from any handling requirements"
            ], correctAnswer: "A. Final-dosage non-antineoplastic HDs may be exempted via documented risk assessment",
            xOffset: 0.45, yOffset: 0.12, baseConceptTitle: "USP 800"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "USP <800> / DISPOSAL",
            loreText: "HD waste (trace and bulk) must be segregated from regular pharmaceutical waste. Trace HD (empty vials, gloves, syringes — used in HD compounding) goes in YELLOW chemo container. Bulk HD waste (>3% drug, expired HDs) goes to BLACK RCRA hazardous waste container.",
            options: [
                "A. Trace HD = yellow chemo bin; bulk HD waste = black RCRA hazardous waste container",
                "B. All HD waste in standard pharmacy waste",
                "C. HD waste flushed down the drain",
                "D. Trace HD waste does not require segregation"
            ], correctAnswer: "A. Trace HD = yellow chemo bin; bulk HD waste = black RCRA hazardous waste container",
            xOffset: 0.50, yOffset: 0.12, baseConceptTitle: "USP 800"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  ALLIGATION CALCULATIONS                                         ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / CONCEPT",
            loreText: "Alligation is used to find the proportions of two stock concentrations needed to make a desired in-between concentration. Set up a tic-tac-toe: high concentration top-left, low bottom-left, desired in middle. Subtract diagonally — absolute differences give the parts of each.",
            options: [
                "A. A tic-tac-toe diagonal subtraction giving parts of two stocks for a target in-between strength",
                "B. A method to convert between mass and moles",
                "C. A way to add a single stock to itself for higher concentration",
                "D. A formula for IV drip rate"
            ], correctAnswer: "A. A tic-tac-toe diagonal subtraction giving parts of two stocks for a target in-between strength",
            xOffset: 0.05, yOffset: 0.17, baseConceptTitle: "Alligation"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / 70%+20%→40%",
            loreText: "How many parts of 70% alcohol and 20% alcohol are needed to make 40% alcohol? Tic-tac-toe: 70 ↔ 40 ↔ 20. Diagonal: 40 - 20 = 20 parts of 70%. 70 - 40 = 30 parts of 20%. Ratio 20:30 = 2:3.",
            options: [
                "A. 2 parts 70% : 3 parts 20%",
                "B. 3 parts 70% : 2 parts 20%",
                "C. 1 part 70% : 1 part 20%",
                "D. 5 parts 70% : 1 part 20%"
            ], correctAnswer: "A. 2 parts 70% : 3 parts 20%",
            xOffset: 0.10, yOffset: 0.17, baseConceptTitle: "Alligation"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / VOLUMES",
            loreText: "Make 500 mL of 40% alcohol from 70% and 20% stocks. Ratio (from prior) is 2:3 = 5 total parts. Each part = 500/5 = 100 mL. Need 200 mL of 70% + 300 mL of 20%. Always check: 200(0.70) + 300(0.20) = 140 + 60 = 200 g/500 mL = 40%. ✓",
            options: [
                "A. 200 mL of 70% + 300 mL of 20% (total 500 mL)",
                "B. 250 mL of each",
                "C. 100 mL of 70% + 400 mL of 20%",
                "D. 400 mL of 70% + 100 mL of 20%"
            ], correctAnswer: "A. 200 mL of 70% + 300 mL of 20% (total 500 mL)",
            xOffset: 0.15, yOffset: 0.17, baseConceptTitle: "Alligation"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / WATER DILUENT",
            loreText: "Make 240 mL of 5% dextrose from 50% dextrose stock and sterile water. Treat water as 0%. Tic-tac-toe: 50 ↔ 5 ↔ 0. Parts: 5 of 50%, 45 of 0%. Total 50 parts. 240/50 = 4.8 mL/part. Need 24 mL of 50% + 216 mL of water.",
            options: [
                "A. 24 mL of 50% dextrose + 216 mL sterile water",
                "B. 120 mL of 50% + 120 mL water",
                "C. 12 mL of 50% + 228 mL water",
                "D. 50 mL of 50% + 190 mL water"
            ], correctAnswer: "A. 24 mL of 50% dextrose + 216 mL sterile water",
            xOffset: 0.20, yOffset: 0.17, baseConceptTitle: "Alligation"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / HC OINTMENT",
            loreText: "Compound 60 g of 1% hydrocortisone ointment from 2.5% HC ointment and ointment base (0% HC). Tic-tac-toe: 2.5 ↔ 1 ↔ 0. Parts: 1 of 2.5%, 1.5 of base. Total 2.5 parts. 60/2.5 = 24 g/part. Need 24 g of 2.5% HC + 36 g of base.",
            options: [
                "A. 24 g of 2.5% HC + 36 g of base (total 60 g)",
                "B. 30 g of each",
                "C. 6 g of 2.5% HC + 54 g of base",
                "D. 48 g of 2.5% HC + 12 g of base"
            ], correctAnswer: "A. 24 g of 2.5% HC + 36 g of base (total 60 g)",
            xOffset: 0.25, yOffset: 0.17, baseConceptTitle: "Alligation"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ALLIGATION / NS+D5W",
            loreText: "Mix 0.9% NS and 5% dextrose-in-water to make 0.45% NS in 5% dextrose? Trick question — these have DIFFERENT solutes (sodium AND dextrose). Alligation only works for the same solute. To make D5 0.45 NS you must use D5W and either NS or a stock saline plus the dextrose calculated separately.",
            options: [
                "A. Alligation requires the same solute in both stocks — cannot mix saline with dextrose by alligation",
                "B. 1:1 mix of NS and D5W gives D5 0.45 NS",
                "C. Alligation works for any two solutions",
                "D. Salt and dextrose are interchangeable for alligation"
            ], correctAnswer: "A. Alligation requires the same solute in both stocks — cannot mix saline with dextrose by alligation",
            xOffset: 0.30, yOffset: 0.17, baseConceptTitle: "Alligation"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  INFUSION DURATION & VOLUME                                      ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "INFUSION / DURATION",
            loreText: "Time = Volume ÷ Rate. A 1000 mL bag at 125 mL/h runs for 1000/125 = 8 hours. Always include the rate and volume units; convert if needed (e.g., gtt/min → mL/h).",
            options: [
                "A. 8 hours",
                "B. 4 hours",
                "C. 12 hours",
                "D. 16 hours"
            ], correctAnswer: "A. 8 hours",
            xOffset: 0.05, yOffset: 0.22, baseConceptTitle: "Infusion Duration"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "INFUSION / RATE FROM TIME",
            loreText: "Patient needs 500 mL D5W over 4 hours. Rate = 500 mL ÷ 4 h = 125 mL/h. To convert to drops/min using a drop factor of 15 gtt/mL: 125 mL/h × 15 gtt/mL ÷ 60 min/h = 31.25 → ~31 gtt/min.",
            options: [
                "A. 125 mL/h, ≈31 gtt/min with 15 gtt/mL drop factor",
                "B. 250 mL/h, ≈63 gtt/min",
                "C. 500 mL/h, ≈125 gtt/min",
                "D. 100 mL/h, ≈25 gtt/min"
            ], correctAnswer: "A. 125 mL/h, ≈31 gtt/min with 15 gtt/mL drop factor",
            xOffset: 0.10, yOffset: 0.22, baseConceptTitle: "Infusion Duration"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "INFUSION / VOLUME FROM TIME",
            loreText: "An infusion runs at 75 mL/h for 6 hours. Total volume = 75 × 6 = 450 mL. Always sanity-check against bag size — if total exceeds the available bag volume, the order needs review.",
            options: [
                "A. 450 mL",
                "B. 600 mL",
                "C. 250 mL",
                "D. 1000 mL"
            ], correctAnswer: "A. 450 mL",
            xOffset: 0.15, yOffset: 0.22, baseConceptTitle: "Infusion Duration"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "INFUSION / END-TIME",
            loreText: "1000 mL hung at 14:30 at 100 mL/h. Duration = 10 h. End time = 24:30 → 00:30 (the next day). Always express end-time clearly when crossing midnight; nurses chart against this.",
            options: [
                "A. 00:30 the following day",
                "B. 22:30 the same day",
                "C. 04:30 the next day",
                "D. 14:30 the next day"
            ], correctAnswer: "A. 00:30 the following day",
            xOffset: 0.20, yOffset: 0.22, baseConceptTitle: "Infusion Duration"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  VACCINE WORKFLOW (BEYOND COLD-CHAIN)                            ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "VACCINE / VIS",
            loreText: "Federal law (NCVIA 1986) requires the current Vaccine Information Statement (VIS) be provided to the patient (or guardian) BEFORE administration of any vaccine listed in the National Vaccine Injury Compensation Program. Document publication date of the VIS and date provided.",
            options: [
                "A. Federal law requires the current VIS be given before administration; document VIS date and date provided",
                "B. VIS is optional and given only on request",
                "C. VIS is provided after administration as a takeaway",
                "D. VIS is required only for live vaccines"
            ], correctAnswer: "A. Federal law requires the current VIS be given before administration; document VIS date and date provided",
            xOffset: 0.05, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VACCINE / OBSERVATION",
            loreText: "After vaccine administration, observe the patient for 15 minutes for syncope and immediate hypersensitivity reactions. Patients with prior syncope or anaphylaxis history may require longer observation (30 min). Have epinephrine (auto-injector or 1 mg/mL ampule) immediately available.",
            options: [
                "A. Observe 15 minutes (30 if history of syncope/anaphylaxis); epinephrine on hand",
                "B. Send patient out immediately after the injection",
                "C. Observe 4 hours for any vaccine",
                "D. Observation is not necessary for IM vaccines"
            ], correctAnswer: "A. Observe 15 minutes (30 if history of syncope/anaphylaxis); epinephrine on hand",
            xOffset: 0.10, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VACCINE / NDC SCAN",
            loreText: "At administration, scan the vial's NDC and lot number into the patient's record. Documentation must include: vaccine, manufacturer, lot, exp date, NDC, route, site, dose, vaccinator name and credentials, VIS edition date, date VIS given.",
            options: [
                "A. Document vaccine/manufacturer/lot/exp/NDC/route/site/dose/vaccinator/VIS dates at administration",
                "B. Only vaccine name and date are required",
                "C. Lot numbers are stored at the wholesaler — not pharmacy",
                "D. NDC is not relevant once dispensed"
            ], correctAnswer: "A. Document vaccine/manufacturer/lot/exp/NDC/route/site/dose/vaccinator/VIS dates at administration",
            xOffset: 0.15, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "VACCINE / VAERS",
            loreText: "VAERS (Vaccine Adverse Event Reporting System) is the federal passive surveillance system co-managed by FDA and CDC. Report ANY clinically significant adverse event after vaccination, especially events listed on the VAERS Reportable Events Table. Reports are public; HCPs file via vaers.hhs.gov.",
            options: [
                "A. VAERS — federal passive surveillance, file at vaers.hhs.gov for any significant AE",
                "B. VAERS reports are confidential, never published",
                "C. Only manufacturers report to VAERS",
                "D. VAERS only accepts reports of death"
            ], correctAnswer: "A. VAERS — federal passive surveillance, file at vaers.hhs.gov for any significant AE",
            xOffset: 0.20, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VACCINE / BUD POST-PUNCTURE",
            loreText: "Multidose vaccine vials have a beyond-use date AFTER first puncture distinct from the labeled expiration. Examples: most influenza multidose vials = 28 days post-puncture. MMR / varicella reconstituted vials = 8 hours. Always label the puncture date on the vial.",
            options: [
                "A. BUD post-puncture differs from labeled expiry; e.g., MMR/varicella reconstituted = 8 h",
                "B. Multidose vials use only the labeled expiration",
                "C. BUD is always 24 hours regardless of vaccine",
                "D. No labeling required after first puncture"
            ], correctAnswer: "A. BUD post-puncture differs from labeled expiry; e.g., MMR/varicella reconstituted = 8 h",
            xOffset: 0.25, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VACCINE / CDC SCHEDULE",
            loreText: "The CDC publishes age-based vaccine schedules updated annually. Examples (high-yield): HepB at birth, 1–2 mo, 6–18 mo. DTaP at 2/4/6/15-18 mo and 4-6 yr. MMR at 12-15 mo and 4-6 yr. HPV at 11-12 (2 doses if <15, 3 if ≥15). Tdap booster every 10 years; Td or Tdap.",
            options: [
                "A. CDC publishes age-based schedules annually; HPV starts 11-12, 2 doses if <15",
                "B. CDC schedules are quarterly and patient-specific",
                "C. HPV only at age 18 and older",
                "D. Tdap booster only once in adulthood"
            ], correctAnswer: "A. CDC publishes age-based schedules annually; HPV starts 11-12, 2 doses if <15",
            xOffset: 0.30, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "VACCINE / TECH SCOPE",
            loreText: "Pharmacy technician administration scope is STATE-determined. Many states (under the federal PREP Act emergency authority during/after COVID-19) authorize trained, certified techs to administer vaccines under pharmacist supervision. Always verify your state's current rule.",
            options: [
                "A. State-determined; many states allow trained certified techs to administer under pharmacist supervision",
                "B. Federal law allows any tech to administer in any state",
                "C. Federal law prohibits techs from administering any vaccine",
                "D. Tech scope for vaccines is identical in all states"
            ], correctAnswer: "A. State-determined; many states allow trained certified techs to administer under pharmacist supervision",
            xOffset: 0.35, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "VACCINE / VFC PROGRAM",
            loreText: "Vaccines for Children (VFC) is a federally funded program providing vaccines at no cost to eligible children (Medicaid-eligible, uninsured, AI/AN, underinsured at FQHC/RHC). VFC vaccines must be stored separately from private stock; cannot be billed to insurance.",
            options: [
                "A. Federal program providing free vaccines to eligible children; segregate from private stock",
                "B. VFC vaccines billed at full retail to insurance",
                "C. VFC vaccines stored together with private stock",
                "D. VFC eligibility is determined by state board of pharmacy"
            ], correctAnswer: "A. Federal program providing free vaccines to eligible children; segregate from private stock",
            xOffset: 0.40, yOffset: 0.27, baseConceptTitle: "Vaccine Workflow"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  REMS — MIFEPRISTONE & KETAMINE                                  ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / MIFEPRISTONE",
            loreText: "Mifepristone (Mifeprex / Korlym) has a REMS limiting dispensing for medication abortion. As of 2023, certified pharmacies (NOT just certified prescribers) may dispense; prescriber must be certified, sign Patient Agreement Form, and dispenser must be a certified pharmacy. Patients receive a Patient Agreement form. Adverse events reported to FDA and Danco/GenBioPro.",
            options: [
                "A. Limited to certified prescribers and (post-2023) certified pharmacies; Patient Agreement Form required",
                "B. Sold OTC with no documentation",
                "C. Available at any retail pharmacy without certification",
                "D. Dispensed only by intravenous administration in a hospital"
            ], correctAnswer: "A. Limited to certified prescribers and (post-2023) certified pharmacies; Patient Agreement Form required",
            xOffset: 0.05, yOffset: 0.32, baseConceptTitle: "REMS"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / KETAMINE NASAL",
            loreText: "Esketamine (Spravato) — the intranasal antidepressant for treatment-resistant depression — has a REMS requiring administration only at a certified healthcare setting under direct supervision. Patient observed at least 2 hours post-dose for sedation/dissociation/blood pressure changes. Patient cannot drive day of dose.",
            options: [
                "A. Spravato (esketamine) — REMS: certified setting, 2-hour observation, no driving day of dose",
                "B. Ketamine and esketamine have no REMS",
                "C. Spravato dispensed at retail pharmacy with normal counseling",
                "D. Spravato administered subcutaneously at home"
            ], correctAnswer: "A. Spravato (esketamine) — REMS: certified setting, 2-hour observation, no driving day of dose",
            xOffset: 0.10, yOffset: 0.32, baseConceptTitle: "REMS"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / TIRZEPATIDE-CLOZAPINE",
            loreText: "Clozapine REMS (Clozaril) requires monitoring of absolute neutrophil count (ANC). Prescribers, pharmacies, and patients must be certified. ANC checked weekly × 6 months, then every 2 weeks × 6 months, then monthly. Cannot dispense if ANC <1000 (or <500 in benign ethnic neutropenia).",
            options: [
                "A. Clozapine REMS — ANC monitoring weekly/biweekly/monthly; cannot dispense below ANC threshold",
                "B. Clozapine has no monitoring requirements",
                "C. Clozapine REMS requires daily blood pressure",
                "D. Only the prescriber needs to be certified — pharmacy is exempt"
            ], correctAnswer: "A. Clozapine REMS — ANC monitoring weekly/biweekly/monthly; cannot dispense below ANC threshold",
            xOffset: 0.15, yOffset: 0.32, baseConceptTitle: "REMS"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / IPLEDGE",
            loreText: "iPLEDGE (isotretinoin) REMS: prescriber, patient, pharmacy all enrolled. Females of reproductive potential need 2 forms of contraception, monthly negative pregnancy test (in-office and lab), and 7-day window from prescription to pickup. Prescriptions cannot be transferred. No refills.",
            options: [
                "A. iPLEDGE — 2 forms contraception, monthly pregnancy test, 7-day pickup window, no transfers/refills",
                "B. iPLEDGE applies only to males",
                "C. Refills permitted up to 5 within 6 months",
                "D. Pregnancy testing not required"
            ], correctAnswer: "A. iPLEDGE — 2 forms contraception, monthly pregnancy test, 7-day pickup window, no transfers/refills",
            xOffset: 0.20, yOffset: 0.32, baseConceptTitle: "REMS"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / LENALIDOMIDE",
            loreText: "Lenalidomide (Revlimid) REMS — formerly RevAssist, now part of the consolidated thalidomide-class REMS — requires patient registration, monthly pregnancy testing for females of reproductive potential, contraception, prescriber certification, and pharmacy certification. Maximum 28-day supply.",
            options: [
                "A. Lenalidomide REMS — patient/prescriber/pharmacy enrolled, monthly pregnancy test, max 28-day supply",
                "B. Lenalidomide has no REMS",
                "C. 90-day supplies permitted",
                "D. Patient registration not required"
            ], correctAnswer: "A. Lenalidomide REMS — patient/prescriber/pharmacy enrolled, monthly pregnancy test, max 28-day supply",
            xOffset: 0.25, yOffset: 0.32, baseConceptTitle: "REMS"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REMS / TIRF",
            loreText: "Transmucosal Immediate-Release Fentanyl (TIRF) REMS covers Actiq, Fentora, Subsys, Lazanda, Abstral, Onsolis. Restricted to opioid-tolerant patients with breakthrough cancer pain. Prescribers, pharmacies, distributors, patients all enrolled; outpatient use only.",
            options: [
                "A. TIRF REMS — opioid-tolerant cancer breakthrough pain only; all parties enrolled",
                "B. TIRF available OTC for any pain",
                "C. No REMS for transmucosal fentanyl",
                "D. Used in opioid-naive patients"
            ], correctAnswer: "A. TIRF REMS — opioid-tolerant cancer breakthrough pain only; all parties enrolled",
            xOffset: 0.30, yOffset: 0.32, baseConceptTitle: "REMS"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  BEERS CRITERIA (HIGH-YIELD ELDERLY)                             ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / CONCEPT",
            loreText: "AGS Beers Criteria — list of potentially inappropriate medications (PIM) in adults ≥65. Updated every 3 years by the American Geriatrics Society. Categories: avoid, avoid in certain conditions, use with caution, drug-drug interactions, kidney-function dose adjustments.",
            options: [
                "A. List of potentially inappropriate medications in adults ≥65, updated every 3 years",
                "B. List of pediatric-only medications",
                "C. Federal law requiring deprescribing in elderly",
                "D. Manufacturer-specific dosing chart"
            ], correctAnswer: "A. List of potentially inappropriate medications in adults ≥65, updated every 3 years",
            xOffset: 0.05, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / ANTICHOLINERGICS",
            loreText: "Avoid in elderly: first-generation antihistamines (diphenhydramine/Benadryl, hydroxyzine, chlorpheniramine), tricyclic antidepressants (amitriptyline, doxepin >6 mg), oxybutynin, scopolamine — all cause anticholinergic burden (confusion, dry mouth, urinary retention, falls).",
            options: [
                "A. Avoid first-gen antihistamines, TCAs, oxybutynin — anticholinergic burden in elderly",
                "B. First-gen antihistamines preferred in elderly",
                "C. TCAs are first-line in elderly depression",
                "D. Oxybutynin recommended for all elderly with urgency"
            ], correctAnswer: "A. Avoid first-gen antihistamines, TCAs, oxybutynin — anticholinergic burden in elderly",
            xOffset: 0.10, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / BENZODIAZEPINES",
            loreText: "Benzodiazepines in elderly: increased risk of cognitive impairment, delirium, falls, fractures, MVCs. Avoid for treatment of insomnia, agitation, delirium. Long-acting (diazepam, clonazepam, flurazepam) accumulate. Short-acting still risky. Use only for specific indications (seizures, severe GAD short-term).",
            options: [
                "A. Avoid for insomnia/agitation/delirium in elderly — fall, fracture, cognitive risk",
                "B. First-line for elderly insomnia",
                "C. No fall risk in elderly",
                "D. Long-acting benzos preferred to short-acting in elderly"
            ], correctAnswer: "A. Avoid for insomnia/agitation/delirium in elderly — fall, fracture, cognitive risk",
            xOffset: 0.15, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / NSAIDS",
            loreText: "Chronic NSAID use in elderly increases GI bleed (30%+ have GI complications), kidney injury (especially with ACEi/ARB + diuretic — 'triple whammy'), heart failure exacerbation. Avoid chronic; if needed, add PPI prophylaxis.",
            options: [
                "A. Chronic NSAIDs in elderly increase GI bleed, AKI, HF exacerbation; PPI prophylaxis if needed",
                "B. NSAIDs are first-line for elderly chronic pain",
                "C. NSAIDs reduce kidney injury risk",
                "D. PPI prophylaxis is contraindicated"
            ], correctAnswer: "A. Chronic NSAIDs in elderly increase GI bleed, AKI, HF exacerbation; PPI prophylaxis if needed",
            xOffset: 0.20, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / PPI",
            loreText: "PPIs (omeprazole, pantoprazole, lansoprazole) — avoid scheduled use >8 weeks in elderly without clear indication. Risks: C. difficile, fractures, B12 deficiency, kidney injury, pneumonia. Reassess all chronic PPI orders at every visit.",
            options: [
                "A. Avoid scheduled PPI >8 weeks without clear indication; risks include C. diff, fractures, B12 deficit",
                "B. Lifelong daily PPI is the standard of care",
                "C. PPIs reduce C. difficile risk",
                "D. PPIs improve B12 absorption"
            ], correctAnswer: "A. Avoid scheduled PPI >8 weeks without clear indication; risks include C. diff, fractures, B12 deficit",
            xOffset: 0.25, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "BEERS / SULFONYLUREAS",
            loreText: "Glyburide (longer-acting) carries the highest hypoglycemia risk in elderly — avoid. Glipizide and glimepiride are preferred sulfonylureas if needed (shorter half-life, less prolonged hypoglycemia). Avoid sliding-scale insulin alone in long-term care.",
            options: [
                "A. Avoid glyburide in elderly (prolonged hypoglycemia); glipizide/glimepiride preferred",
                "B. Glyburide is the safest sulfonylurea in elderly",
                "C. All sulfonylureas equally safe in elderly",
                "D. Sliding-scale insulin alone is the LTC standard"
            ], correctAnswer: "A. Avoid glyburide in elderly (prolonged hypoglycemia); glipizide/glimepiride preferred",
            xOffset: 0.30, yOffset: 0.37, baseConceptTitle: "Beers Criteria"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  CYP450 SYSTEMATIC INTERACTIONS                                  ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 3A4 INHIBITORS",
            loreText: "Strong CYP3A4 inhibitors increase substrate levels: clarithromycin, erythromycin, ketoconazole, itraconazole, ritonavir/cobicistat (HIV/HCV boosters), grapefruit juice, nefazodone. Substrates affected: simvastatin, lovastatin, calcium channel blockers, tacrolimus, cyclosporine, many BZDs (alprazolam, midazolam).",
            options: [
                "A. Clarithromycin/azoles/ritonavir/grapefruit raise CYP3A4 substrate levels (statins, CCBs, tacrolimus)",
                "B. CYP3A4 inhibitors decrease substrate levels",
                "C. Grapefruit only affects PPIs",
                "D. Clarithromycin induces CYP3A4"
            ], correctAnswer: "A. Clarithromycin/azoles/ritonavir/grapefruit raise CYP3A4 substrate levels (statins, CCBs, tacrolimus)",
            xOffset: 0.05, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 3A4 INDUCERS",
            loreText: "Strong CYP3A4 inducers reduce substrate levels: rifampin, rifabutin, phenytoin, carbamazepine, phenobarbital, St. John's Wort, efavirenz. Clinical impact: reduced contraceptive efficacy, reduced HIV antiretroviral, reduced warfarin (variable), reduced corticosteroid effect.",
            options: [
                "A. Rifampin/anti-epileptics/St. John's Wort lower CYP3A4 substrate levels (contraceptives, ARVs)",
                "B. Inducers increase substrate concentrations",
                "C. St. John's Wort is a CYP3A4 inhibitor",
                "D. Rifampin has no CYP effects"
            ], correctAnswer: "A. Rifampin/anti-epileptics/St. John's Wort lower CYP3A4 substrate levels (contraceptives, ARVs)",
            xOffset: 0.10, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 2D6",
            loreText: "CYP2D6 inhibitors: paroxetine, fluoxetine, bupropion, quinidine, terbinafine. Affects activation of prodrugs (codeine → morphine BLOCKED; tamoxifen → endoxifen REDUCED) and metabolism of many psychotropics (atomoxetine, metoprolol). Genetic polymorphism: poor / intermediate / extensive / ultrarapid metabolizers.",
            options: [
                "A. Paroxetine/fluoxetine/bupropion inhibit CYP2D6 — block codeine activation, reduce tamoxifen efficacy",
                "B. CYP2D6 polymorphism does not affect drug response",
                "C. CYP2D6 inhibitors increase codeine activation",
                "D. CYP2D6 has no role in metabolism of beta-blockers"
            ], correctAnswer: "A. Paroxetine/fluoxetine/bupropion inhibit CYP2D6 — block codeine activation, reduce tamoxifen efficacy",
            xOffset: 0.15, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 2C9 WARFARIN",
            loreText: "Warfarin is metabolized by CYP2C9 (S-isomer) and CYP3A4 (R-isomer). 2C9 inhibitors raise INR: amiodarone, fluconazole, metronidazole, TMP-SMX (Bactrim), fluvastatin. 2C9 inducers lower INR: rifampin, carbamazepine. ALWAYS check INR within 3-5 days of starting/stopping these.",
            options: [
                "A. Amiodarone/fluconazole/metronidazole/Bactrim raise warfarin INR (CYP2C9 inhibition)",
                "B. Bactrim has no warfarin interaction",
                "C. Amiodarone lowers INR",
                "D. INR check unnecessary after antibiotic start"
            ], correctAnswer: "A. Amiodarone/fluconazole/metronidazole/Bactrim raise warfarin INR (CYP2C9 inhibition)",
            xOffset: 0.20, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 2C19 CLOPIDOGREL",
            loreText: "Clopidogrel is a prodrug activated by CYP2C19. Strong inhibitors REDUCE active metabolite: omeprazole, esomeprazole (FDA boxed warning for clopidogrel + omeprazole). Pantoprazole has minimal effect — preferred PPI in clopidogrel patients.",
            options: [
                "A. Omeprazole/esomeprazole reduce clopidogrel activation; pantoprazole preferred",
                "B. All PPIs equally safe with clopidogrel",
                "C. Clopidogrel is not a prodrug",
                "D. Pantoprazole is contraindicated with clopidogrel"
            ], correctAnswer: "A. Omeprazole/esomeprazole reduce clopidogrel activation; pantoprazole preferred",
            xOffset: 0.25, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CYP / 1A2 SMOKING",
            loreText: "CYP1A2 is induced by tobacco smoke (polycyclic aromatic hydrocarbons, NOT nicotine). Smoking increases clearance of CYP1A2 substrates: theophylline, clozapine, olanzapine, caffeine. When patient quits smoking, levels rise — clozapine/theophylline doses often need reduction.",
            options: [
                "A. Tobacco smoke induces CYP1A2 — clozapine/theophylline levels RISE on smoking cessation",
                "B. Nicotine causes the induction",
                "C. Smoking decreases theophylline metabolism",
                "D. CYP1A2 has no effect on caffeine"
            ], correctAnswer: "A. Tobacco smoke induces CYP1A2 — clozapine/theophylline levels RISE on smoking cessation",
            xOffset: 0.30, yOffset: 0.42, baseConceptTitle: "CYP Interactions"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  OTC / HERBAL INTERACTIONS                                       ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .medications, nodeTitle: "HERBAL / ST JOHNS WORT",
            loreText: "St. John's Wort is a strong CYP3A4 and P-gp inducer. Reduces effectiveness of: oral contraceptives (breakthrough bleeding, pregnancy), warfarin (INR drops), digoxin, cyclosporine/tacrolimus (rejection), HIV antiretrovirals. Combined with SSRIs → serotonin syndrome.",
            options: [
                "A. Strong CYP3A4 / P-gp inducer; reduces contraceptive, warfarin, immunosuppressant levels",
                "B. Has no clinically significant interactions",
                "C. Increases warfarin levels and INR",
                "D. Safe in combination with SSRIs"
            ], correctAnswer: "A. Strong CYP3A4 / P-gp inducer; reduces contraceptive, warfarin, immunosuppressant levels",
            xOffset: 0.05, yOffset: 0.47, baseConceptTitle: "Herbal Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "HERBAL / GINKGO",
            loreText: "Ginkgo biloba inhibits platelet aggregation. Combined with anticoagulants (warfarin, apixaban) or antiplatelets (aspirin, clopidogrel) increases bleeding risk. Hold 36 hours before surgery. May lower seizure threshold (caution in epilepsy).",
            options: [
                "A. Antiplatelet effect — bleeding risk with warfarin/apixaban/aspirin; hold 36h pre-surgery",
                "B. No bleeding risk",
                "C. Ginkgo is a CYP3A4 inducer",
                "D. Improves seizure control"
            ], correctAnswer: "A. Antiplatelet effect — bleeding risk with warfarin/apixaban/aspirin; hold 36h pre-surgery",
            xOffset: 0.10, yOffset: 0.47, baseConceptTitle: "Herbal Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "OTC / NSAID-LITHIUM",
            loreText: "OTC NSAIDs (ibuprofen, naproxen, aspirin >325 mg/day) reduce renal clearance of lithium → lithium levels rise (toxicity: tremor, confusion, ataxia, seizures). NSAIDs also raise levels of: digoxin, methotrexate, ACE inhibitors (renal effect).",
            options: [
                "A. NSAIDs reduce lithium clearance — toxicity risk; same with digoxin, MTX, ACEi",
                "B. NSAIDs lower lithium levels",
                "C. No interaction between NSAIDs and lithium",
                "D. Aspirin 81 mg increases lithium toxicity equally"
            ], correctAnswer: "A. NSAIDs reduce lithium clearance — toxicity risk; same with digoxin, MTX, ACEi",
            xOffset: 0.15, yOffset: 0.47, baseConceptTitle: "OTC Interactions"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "OTC / PSEUDOEPHEDRINE-MAOI",
            loreText: "Pseudoephedrine + MAOI = hypertensive crisis. MAOIs include phenelzine, tranylcypromine, selegiline, isocarboxazid, and linezolid (an antibiotic with weak MAOI activity). Patients on MAOIs MUST be counseled against OTC decongestants.",
            options: [
                "A. Pseudoephedrine + MAOI (incl. linezolid) → hypertensive crisis",
                "B. Safe combination at any dose",
                "C. Linezolid is not an MAOI",
                "D. MAOIs lower blood pressure regardless of decongestant"
            ], correctAnswer: "A. Pseudoephedrine + MAOI (incl. linezolid) → hypertensive crisis",
            xOffset: 0.20, yOffset: 0.47, baseConceptTitle: "OTC Interactions"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  DRUG-NUTRIENT / DRUG-LAB                                        ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .medications, nodeTitle: "WARFARIN / VITAMIN K",
            loreText: "Vitamin K antagonizes warfarin. High-vitamin-K foods (kale, spinach, broccoli, brussels sprouts, green leafy vegetables) lower INR. Counsel patients to maintain a CONSISTENT intake — NOT to avoid these foods. Sudden change in diet → INR change.",
            options: [
                "A. Maintain consistent vitamin K intake — don't avoid leafy greens, just keep intake steady",
                "B. Eliminate all leafy greens permanently",
                "C. Maximize leafy green intake to boost warfarin",
                "D. Vitamin K and warfarin do not interact"
            ], correctAnswer: "A. Maintain consistent vitamin K intake — don't avoid leafy greens, just keep intake steady",
            xOffset: 0.05, yOffset: 0.52, baseConceptTitle: "Drug-Nutrient"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "LEVOTHYROXINE / TIMING",
            loreText: "Levothyroxine absorption is reduced by: calcium, iron, magnesium, antacids (Mg/Al hydroxide), PPIs, soy products, fiber-rich foods, coffee. Counsel: take 30-60 min before breakfast on empty stomach with water. Separate from calcium/iron by 4 hours.",
            options: [
                "A. Take 30-60 min before breakfast empty stomach; separate from calcium/iron by 4 hours",
                "B. Take with breakfast for best absorption",
                "C. Take with calcium supplement to enhance absorption",
                "D. Time of administration does not matter"
            ], correctAnswer: "A. Take 30-60 min before breakfast empty stomach; separate from calcium/iron by 4 hours",
            xOffset: 0.10, yOffset: 0.52, baseConceptTitle: "Drug-Nutrient"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "TETRACYCLINE / DAIRY",
            loreText: "Tetracyclines (doxycycline, tetracycline, minocycline) chelate divalent cations: calcium (dairy, antacids), iron, magnesium, aluminum, zinc. Reduces absorption dramatically. Take 1 hour before or 2 hours after dairy/supplements/antacids.",
            options: [
                "A. Avoid dairy, iron, antacids within 1-2 hours of tetracycline dose",
                "B. Always take with milk for absorption",
                "C. Antacids enhance absorption",
                "D. Iron supplements neutralize side effects"
            ], correctAnswer: "A. Avoid dairy, iron, antacids within 1-2 hours of tetracycline dose",
            xOffset: 0.15, yOffset: 0.52, baseConceptTitle: "Drug-Nutrient"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "ACE / POTASSIUM",
            loreText: "ACE inhibitors and ARBs raise serum potassium by reducing aldosterone. Combined with: K-sparing diuretics (spironolactone, eplerenone, amiloride), K supplements, salt substitutes (KCl), or NSAIDs → hyperkalemia (cardiac arrhythmia risk). Monitor K and renal function.",
            options: [
                "A. ACEi/ARB + K-sparing diuretic / K supplement / salt substitute → hyperkalemia",
                "B. ACEi lowers potassium — needs supplementation",
                "C. Salt substitutes are safe with ACE inhibitors",
                "D. No interaction between ACEi and spironolactone"
            ], correctAnswer: "A. ACEi/ARB + K-sparing diuretic / K supplement / salt substitute → hyperkalemia",
            xOffset: 0.20, yOffset: 0.52, baseConceptTitle: "Drug-Nutrient"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  NTI DRUGS — THEOPHYLLINE & CARBAMAZEPINE                        ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .medications, nodeTitle: "THEOPHYLLINE / NTI",
            loreText: "Theophylline (Theo-Dur, Uniphyl) is a methylxanthine bronchodilator with NTI. Therapeutic 5-15 mcg/mL. Toxicity (tachycardia, seizures, arrhythmias) above 20 mcg/mL. Many CYP1A2 interactions: smoking induces, ciprofloxacin/erythromycin/cimetidine inhibit.",
            options: [
                "A. NTI bronchodilator, therapeutic 5-15 mcg/mL; CYP1A2 — smoking induces, cipro/erythro/cimetidine inhibit",
                "B. Therapeutic range is 50-100 mcg/mL",
                "C. No drug interactions",
                "D. Smoking has no effect on theophylline"
            ], correctAnswer: "A. NTI bronchodilator, therapeutic 5-15 mcg/mL; CYP1A2 — smoking induces, cipro/erythro/cimetidine inhibit",
            xOffset: 0.05, yOffset: 0.57, baseConceptTitle: "Theophylline"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "THEOPHYLLINE / TOXICITY",
            loreText: "Theophylline toxicity (>20 mcg/mL): nausea, tachycardia, agitation, arrhythmia, seizures (often without warning at very high levels). Treatment: activated charcoal, supportive care, hemodialysis if severe. Smoking cessation can raise levels rapidly — monitor.",
            options: [
                "A. Toxicity >20 mcg/mL: GI/CV/CNS — seizures may be the first sign; smoking cessation raises level",
                "B. Toxicity manifests as hypoglycemia",
                "C. No risk of seizures even at high levels",
                "D. Hemodialysis is contraindicated"
            ], correctAnswer: "A. Toxicity >20 mcg/mL: GI/CV/CNS — seizures may be the first sign; smoking cessation raises level",
            xOffset: 0.10, yOffset: 0.57, baseConceptTitle: "Theophylline"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CARBAMAZEPINE / NTI",
            loreText: "Carbamazepine (Tegretol) is an anticonvulsant for partial seizures and trigeminal neuralgia. NTI drug — therapeutic 4-12 mcg/mL. Auto-induces its own metabolism (levels drop after 2-4 weeks — re-titrate). HLA-B*1502 testing in Asian patients (SJS risk).",
            options: [
                "A. NTI, therapeutic 4-12 mcg/mL; auto-induction (levels drop in weeks); HLA-B*1502 in Asians for SJS",
                "B. Therapeutic 50-100 mcg/mL",
                "C. No genetic testing recommended",
                "D. Carbamazepine has no auto-induction"
            ], correctAnswer: "A. NTI, therapeutic 4-12 mcg/mL; auto-induction (levels drop in weeks); HLA-B*1502 in Asians for SJS",
            xOffset: 0.15, yOffset: 0.57, baseConceptTitle: "Carbamazepine"),
        DataNode(id: UUID(), domain: .medications, nodeTitle: "CARBAMAZEPINE / SAFETY",
            loreText: "Black box: aplastic anemia, agranulocytosis, SJS/TEN. Strong CYP3A4 inducer — reduces oral contraceptive, warfarin, many other drugs. Hyponatremia (SIADH-like) common. Pregnancy D — neural tube defects. Monitor CBC, sodium, LFT, level.",
            options: [
                "A. Black box for aplastic anemia/agranulocytosis/SJS; strong CYP3A4 inducer; hyponatremia; pregnancy D",
                "B. No hematologic monitoring needed",
                "C. CYP3A4 inhibitor — raises substrate levels",
                "D. Safe in pregnancy without restrictions"
            ], correctAnswer: "A. Black box for aplastic anemia/agranulocytosis/SJS; strong CYP3A4 inducer; hyponatremia; pregnancy D",
            xOffset: 0.20, yOffset: 0.57, baseConceptTitle: "Carbamazepine"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  NON-STERILE COMPOUNDING USP <795>                               ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "USP <795> / MFR",
            loreText: "Master Formulation Record (MFR) is required for compounded preparations made for >1 patient. Contains: ingredient list with quantities and lot numbers, equipment, step-by-step procedure, BUD assignment, packaging, labeling, storage. Updated when ingredients/process changes.",
            options: [
                "A. Required for batches; contains ingredients, procedure, BUD, packaging — updated when changed",
                "B. Optional documentation for any compounding",
                "C. Required only for sterile compounding",
                "D. Master formula is the patient's prescription"
            ], correctAnswer: "A. Required for batches; contains ingredients, procedure, BUD, packaging — updated when changed",
            xOffset: 0.05, yOffset: 0.62, baseConceptTitle: "USP 795"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "USP <795> / BUD",
            loreText: "Default non-sterile BUDs (USP <795> 2023): nonaqueous = 90 days; aqueous oral = 35 days; aqueous topical/dermal = 30 days; preserved aqueous (with antimicrobial) longer. Stability data (USP, manufacturer, peer-reviewed) may extend BUD if conditions match.",
            options: [
                "A. Default: nonaqueous 90d, aqueous oral 35d, aqueous topical 30d (USP <795> 2023)",
                "B. All non-sterile preparations: 24 hours",
                "C. All non-sterile: 1 year",
                "D. BUD does not apply to non-sterile compounds"
            ], correctAnswer: "A. Default: nonaqueous 90d, aqueous oral 35d, aqueous topical 30d (USP <795> 2023)",
            xOffset: 0.10, yOffset: 0.62, baseConceptTitle: "USP 795"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "USP <795> / EQUIPMENT",
            loreText: "Non-sterile compounding equipment: graduates (volumetric measurement), torsion or electronic balance (Class A — 6 mg sensitivity, do not weigh <120 mg below sensitivity), spatulas, ointment slab/parchment, mortar and pestle (glass — for ointments; porcelain/ceramic — for crystals/powders).",
            options: [
                "A. Class A balance: don't weigh <120 mg; glass mortar for ointments; porcelain mortar for crystals",
                "B. Any balance for any quantity",
                "C. Mortar type does not matter",
                "D. Class A balance can weigh 1 mg accurately"
            ], correctAnswer: "A. Class A balance: don't weigh <120 mg; glass mortar for ointments; porcelain mortar for crystals",
            xOffset: 0.15, yOffset: 0.62, baseConceptTitle: "USP 795"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "USP <795> / GEOMETRIC",
            loreText: "Geometric dilution: when blending small quantities of one ingredient with large quantities of base, start with the SMALL portion and add the base in roughly equal increments to it (doubling the mass each time) until full incorporation. Ensures uniform mixing.",
            options: [
                "A. Start small ingredient + add base in roughly equal-volume increments to ensure uniformity",
                "B. Pour all base in first, then add small ingredient",
                "C. Mix all ingredients together at once",
                "D. Geometric dilution applies only to liquids"
            ], correctAnswer: "A. Start small ingredient + add base in roughly equal-volume increments to ensure uniformity",
            xOffset: 0.20, yOffset: 0.62, baseConceptTitle: "USP 795"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  PHARMACIST VS TECHNICIAN SCOPE                                  ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "SCOPE / DUR",
            loreText: "DUR (Drug Utilization Review) clinical decisions are PHARMACIST-only under federal regulation (OBRA-90, state scope-of-practice). Technician role: identify the alert, hold the prescription, escalate. Tech may NOT override allergy alerts, drug-drug interaction alerts, or dose-range alerts.",
            options: [
                "A. Pharmacist-only: DUR override decisions; tech holds and escalates",
                "B. Tech may override any alert with the pharmacist's logged credentials",
                "C. DUR is not regulated by federal law",
                "D. Tech and pharmacist scope are identical for DUR"
            ], correctAnswer: "A. Pharmacist-only: DUR override decisions; tech holds and escalates",
            xOffset: 0.05, yOffset: 0.67, baseConceptTitle: "Tech Scope"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "SCOPE / COUNSELING",
            loreText: "Patient counseling on a NEW prescription is pharmacist-only under OBRA-90 (federal Medicaid law) and most state laws. Tech may offer the OPPORTUNITY for counseling and document the patient's accept/decline. Tech may NOT counsel on drug, dose, side effects, or therapy.",
            options: [
                "A. Pharmacist-only: clinical counseling. Tech offers the opportunity and documents",
                "B. Tech may counsel on side effects",
                "C. Counseling is not federally regulated",
                "D. Counseling is optional and may be skipped"
            ], correctAnswer: "A. Pharmacist-only: clinical counseling. Tech offers the opportunity and documents",
            xOffset: 0.10, yOffset: 0.67, baseConceptTitle: "Tech Scope"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "SCOPE / FINAL VERIFICATION",
            loreText: "Final product verification — confirming the right drug/strength/quantity matches the prescription before patient receives it — is pharmacist-only in nearly every state. A few states permit tech-check-tech (TCT) for refills of identical drug/dose for the same patient under defined supervision and certification.",
            options: [
                "A. Pharmacist-only in most states; limited TCT permitted in a few states for refills",
                "B. Tech always performs final verification",
                "C. Final verification is automated and unsupervised",
                "D. No final verification required"
            ], correctAnswer: "A. Pharmacist-only in most states; limited TCT permitted in a few states for refills",
            xOffset: 0.15, yOffset: 0.67, baseConceptTitle: "Tech Scope"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "SCOPE / TECH ALLOWED",
            loreText: "Tech-allowed activities (most states): data entry, label generation, calling for refill authorization, billing/insurance, inventory, counting/measuring, reconstitution per pharmacist verification, packaging, immunization administration (in states allowing), POS retail. Tech NOT allowed: clinical decisions, counseling, DUR, transfer of CII, accept new CII verbally except emergency.",
            options: [
                "A. Tech: data entry, billing, counting, refill calls, inventory; NOT clinical decisions or counseling",
                "B. Tech may make any clinical decision with pharmacist log-in",
                "C. Tech can transfer C-IIs",
                "D. Tech can accept verbal C-II in non-emergencies"
            ], correctAnswer: "A. Tech: data entry, billing, counting, refill calls, inventory; NOT clinical decisions or counseling",
            xOffset: 0.20, yOffset: 0.67, baseConceptTitle: "Tech Scope"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  DAW CODES — INSURANCE BILLING                                   ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAW / 0",
            loreText: "DAW (Dispense As Written) codes communicate to the payer the substitution circumstances. DAW 0 = generic OK / no substitution indicated. Default if prescription has no DAW restriction. Used most frequently — pharmacy dispenses generic per state law.",
            options: [
                "A. DAW 0 = no substitution indicated; pharmacy dispenses generic per state law",
                "B. DAW 0 = brand mandatory",
                "C. DAW 0 = pharmacist refused substitution",
                "D. DAW 0 = patient refused substitution"
            ], correctAnswer: "A. DAW 0 = no substitution indicated; pharmacy dispenses generic per state law",
            xOffset: 0.05, yOffset: 0.72, baseConceptTitle: "DAW Codes"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAW / 1",
            loreText: "DAW 1 = prescriber requested brand. Prescriber writes 'Dispense as Written' or 'Brand medically necessary' on the Rx. Pharmacy dispenses brand; patient pays whatever copay applies (often higher). Often required by state law to be in prescriber's handwriting (not stamp).",
            options: [
                "A. DAW 1 = prescriber-mandated brand; often must be handwritten not stamped",
                "B. DAW 1 = patient-requested brand",
                "C. DAW 1 = generic mandatory",
                "D. DAW 1 = pharmacy chose brand"
            ], correctAnswer: "A. DAW 1 = prescriber-mandated brand; often must be handwritten not stamped",
            xOffset: 0.10, yOffset: 0.72, baseConceptTitle: "DAW Codes"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAW / 2",
            loreText: "DAW 2 = patient requested brand. Prescriber wrote generic OK, but patient asks for brand. Patient typically pays the brand-vs-generic price difference. Document the patient request.",
            options: [
                "A. DAW 2 = patient-requested brand; patient pays the price difference",
                "B. DAW 2 = prescriber-requested brand",
                "C. DAW 2 = pharmacy out of generic",
                "D. DAW 2 = patient refused medication"
            ], correctAnswer: "A. DAW 2 = patient-requested brand; patient pays the price difference",
            xOffset: 0.15, yOffset: 0.72, baseConceptTitle: "DAW Codes"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAW / OTHER",
            loreText: "DAW 3 = pharmacist selected brand (rare). DAW 4 = generic not in stock. DAW 5 = brand dispensed but priced as generic. DAW 6 = override. DAW 7 = brand mandated by law. DAW 8 = generic not available in marketplace. DAW 9 = plan rule applies.",
            options: [
                "A. DAW 4 = generic not in stock; DAW 8 = generic not available in marketplace",
                "B. DAW 4 = patient-requested brand",
                "C. DAW 8 = pharmacist refused to dispense",
                "D. DAW 9 = patient is uninsured"
            ], correctAnswer: "A. DAW 4 = generic not in stock; DAW 8 = generic not available in marketplace",
            xOffset: 0.20, yOffset: 0.72, baseConceptTitle: "DAW Codes"),

    ]   // end blueprintFillNodes
}
