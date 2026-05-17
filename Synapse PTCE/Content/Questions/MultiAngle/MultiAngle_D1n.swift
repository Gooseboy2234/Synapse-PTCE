import Foundation

// Phase 13 — D1m Interactions + Counseling
// Glipizide, Methotrexate, Isotretinoin, Sildenafil/PDE5,
// Cephalexin, Aripiprazole, Naltrexone, Venlafaxine (16 nodes)

let multiAngleNodes_D1n: [DataNode] = [

    // GLIPIZIDE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / INTERACTIONS",
        loreText: "Fluconazole (CYP2C9 inhibitor) dramatically increases glipizide levels — hypoglycemia risk. NSAIDs, salicylates, and beta-blockers (mask hypoglycemia signs) increase risk. Rifampin (CYP2C9 inducer) reduces effectiveness. Alcohol causes disulfiram-like reaction and unpredictable glucose changes.",
        challengeType: .multipleChoice,
        options: [
            "A. Fluconazole inhibits CYP2C9, raising glipizide levels and increasing hypoglycemia risk",
            "B. Fluconazole induces CYP2C9, reducing glipizide effectiveness",
            "C. Glipizide has no significant drug interactions",
            "D. Rifampin increases glipizide levels by inhibiting its metabolism"
        ],
        correctAnswer: "A. Fluconazole inhibits CYP2C9, raising glipizide levels and increasing hypoglycemia risk",
        xOffset: 0.24,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),

    // GLIPIZIDE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / COUNSELING",
        loreText: "Take 30 minutes before the first meal of the day. Never skip a meal after taking glipizide. Recognize hypoglycemia (shakiness, sweating, confusion) and treat with 15 g fast-acting carbohydrates. Carry glucose tablets. Avoid alcohol. Monitor blood glucose regularly.",
        challengeType: .multipleChoice,
        options: [
            "A. Take 30 min before breakfast and never skip meals — treats hypoglycemia with 15 g fast-acting carbs",
            "B. Take glipizide after meals to reduce the risk of hypoglycemia",
            "C. Hypoglycemia is not a concern with glipizide because it is glucose-dependent",
            "D. Alcohol enhances glipizide effectiveness and is encouraged"
        ],
        correctAnswer: "A. Take 30 min before breakfast and never skip meals — treats hypoglycemia with 15 g fast-acting carbs",
        xOffset: 0.29,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),

    // METHOTREXATE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / INTERACTIONS",
        loreText: "NSAIDs reduce renal methotrexate clearance — potentially fatal toxicity (avoid combination). Penicillins and probenecid also reduce renal clearance. Trimethoprim additive antifolate toxicity. Leucovorin (folinic acid) used as rescue and to counteract toxicity. Folic acid supplementation reduces GI/mucosal side effects.",
        challengeType: .multipleChoice,
        options: [
            "A. NSAIDs reduce renal methotrexate clearance — potentially fatal toxicity; always avoid this combination",
            "B. NSAIDs reduce methotrexate toxicity by improving renal clearance",
            "C. Folic acid supplementation is contraindicated with methotrexate",
            "D. Methotrexate can safely be combined with trimethoprim without dose adjustment"
        ],
        correctAnswer: "A. NSAIDs reduce renal methotrexate clearance — potentially fatal toxicity; always avoid this combination",
        xOffset: 0.24,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),

    // METHOTREXATE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / COUNSELING",
        loreText: "Take folic acid 1 mg daily (on non-methotrexate days or daily per provider) to reduce mouth sores and GI side effects. Avoid alcohol — additive hepatotoxicity. Use reliable contraception (both sexes). Report mouth sores, unusual fatigue, shortness of breath, or jaundice immediately. Do NOT take daily — weekly dosing only for RA.",
        challengeType: .multipleChoice,
        options: [
            "A. Take folic acid daily, avoid alcohol, use contraception, and take WEEKLY not daily for RA",
            "B. Folic acid supplementation cancels the therapeutic effects of methotrexate",
            "C. Alcohol is safe with low-dose methotrexate for RA",
            "D. Contraception is only needed for female patients taking methotrexate"
        ],
        correctAnswer: "A. Take folic acid daily, avoid alcohol, use contraception, and take WEEKLY not daily for RA",
        xOffset: 0.29,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),

    // ISOTRETINOIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / INTERACTIONS",
        loreText: "Tetracyclines combined with isotretinoin increase risk of pseudotumor cerebri (benign intracranial hypertension) — contraindicated combination. Vitamin A supplements additive toxicity (hypervitaminosis A). Progestin-only contraceptives (mini-pill) may have reduced efficacy — not recommended as sole contraceptive in iPLEDGE.",
        challengeType: .multipleChoice,
        options: [
            "A. Tetracyclines combined with isotretinoin increase pseudotumor cerebri risk — contraindicated",
            "B. Tetracyclines enhance isotretinoin efficacy against acne",
            "C. Vitamin A supplements are recommended alongside isotretinoin",
            "D. All forms of hormonal contraception are equally effective with isotretinoin"
        ],
        correctAnswer: "A. Tetracyclines combined with isotretinoin increase pseudotumor cerebri risk — contraindicated",
        xOffset: 0.24,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),

    // ISOTRETINOIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / COUNSELING",
        loreText: "Report: severe headache with visual changes (pseudotumor cerebri), worsening depression or suicidal thoughts, severe abdominal pain (pancreatitis), severe joint pain. Use SPF 30+ sunscreen (photosensitivity). Do not donate blood during therapy or 1 month after. Chapped lips and dry skin are expected — use moisturizer.",
        challengeType: .multipleChoice,
        options: [
            "A. Report severe headache with visual changes or worsening depression; use sunscreen; no blood donation during therapy",
            "B. Dry skin and chapped lips require stopping isotretinoin immediately",
            "C. Blood donation is safe 1 week after completing isotretinoin",
            "D. Sunscreen is not needed since isotretinoin treats acne including sun-related"
        ],
        correctAnswer: "A. Report severe headache with visual changes or worsening depression; use sunscreen; no blood donation during therapy",
        xOffset: 0.29,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),

    // SILDENAFIL — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / INTERACTIONS",
        loreText: "ABSOLUTE CI: any nitrate (nitroglycerin, isosorbide mono/dinitrate — any route) and riociguat — profound hypotension. Alpha-blockers (doxazosin): additive hypotension — use lowest sildenafil dose and separate timing. CYP3A4 inhibitors (ritonavir, ketoconazole): increase sildenafil levels — reduce sildenafil dose.",
        challengeType: .multipleChoice,
        options: [
            "A. Nitrates are absolutely contraindicated with sildenafil; CYP3A4 inhibitors require dose reduction",
            "B. Nitrates can be combined with sildenafil if doses are separated by 4 hours",
            "C. Alpha-blockers have no interaction with PDE5 inhibitors",
            "D. Sildenafil should be increased when combined with CYP3A4 inhibitors"
        ],
        correctAnswer: "A. Nitrates are absolutely contraindicated with sildenafil; CYP3A4 inhibitors require dose reduction",
        xOffset: 0.24,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),

    // SILDENAFIL — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / COUNSELING",
        loreText: "Do NOT use if taking nitrates for any reason — life-threatening interaction. Seek emergency care for erection lasting >4 hours (priapism). Report sudden vision loss or hearing loss immediately (NAION risk). Avoid fatty meals before use (delays onset for sildenafil, not tadalafil). Does not protect against STIs.",
        challengeType: .multipleChoice,
        options: [
            "A. Seek emergency care for erection >4 hours (priapism); never use with nitrates",
            "B. Sildenafil can be taken with nitrates if angina is well-controlled",
            "C. Priapism resolving within 6 hours requires no medical attention",
            "D. Sildenafil protects against sexually transmitted infections"
        ],
        correctAnswer: "A. Seek emergency care for erection >4 hours (priapism); never use with nitrates",
        xOffset: 0.29,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),

    // CEPHALEXIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / INTERACTIONS",
        loreText: "Probenecid reduces renal tubular secretion of cephalexin, increasing levels. Warfarin INR may increase with cephalexin due to gut flora alteration. May reduce efficacy of oral live vaccines (typhoid oral). Generally low interaction profile. Avoid concurrent use with other nephrotoxic agents in renally impaired patients.",
        challengeType: .multipleChoice,
        options: [
            "A. Probenecid reduces cephalexin renal clearance, increasing its plasma levels",
            "B. Cephalexin is a potent CYP3A4 inhibitor affecting many drugs",
            "C. Cephalexin significantly reduces warfarin levels",
            "D. Cephalexin has no drug interactions of clinical significance"
        ],
        correctAnswer: "A. Probenecid reduces cephalexin renal clearance, increasing its plasma levels",
        xOffset: 0.24,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),

    // CEPHALEXIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / COUNSELING",
        loreText: "Complete the full course even if feeling better — stopping early promotes resistance. Take with food if stomach upset occurs. Report rash, hives, or difficulty breathing (allergic reaction). Diarrhea is common — report watery/bloody diarrhea (C. difficile risk, though lower than clindamycin).",
        challengeType: .multipleChoice,
        options: [
            "A. Complete the full course; report rash or watery diarrhea immediately",
            "B. Stop cephalexin when symptoms improve to minimize side effects",
            "C. Cephalexin cannot be taken with food",
            "D. Cross-allergy with penicillin makes cephalexin absolutely contraindicated in penicillin-allergic patients"
        ],
        correctAnswer: "A. Complete the full course; report rash or watery diarrhea immediately",
        xOffset: 0.29,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),

    // ARIPIPRAZOLE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / INTERACTIONS",
        loreText: "Aripiprazole is a CYP2D6 and CYP3A4 substrate. CYP2D6 inhibitors (fluoxetine, paroxetine) increase levels — reduce aripiprazole dose by 50%. CYP3A4 inducers (carbamazepine) decrease levels — double aripiprazole dose. Additive CNS depression with sedatives. Additive hypotension with antihypertensives.",
        challengeType: .multipleChoice,
        options: [
            "A. CYP2D6 inhibitors (fluoxetine) increase aripiprazole levels — reduce dose 50%; inducers (carbamazepine) require dose doubling",
            "B. Aripiprazole is not metabolized by CYP enzymes and has no drug interactions",
            "C. Carbamazepine increases aripiprazole levels requiring dose reduction",
            "D. Fluoxetine decreases aripiprazole levels by inducing CYP2D6"
        ],
        correctAnswer: "A. CYP2D6 inhibitors (fluoxetine) increase aripiprazole levels — reduce dose 50%; inducers (carbamazepine) require dose doubling",
        xOffset: 0.24,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),

    // ARIPIPRAZOLE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / COUNSELING",
        loreText: "Report unusual urges (gambling, hypersexuality, binge eating) — may be drug-related compulsive behaviors. Rise slowly (orthostatic hypotension). May cause akathisia (inner restlessness, urge to move) — report if bothersome. Full effect takes weeks. Do not stop abruptly. Avoid alcohol.",
        challengeType: .multipleChoice,
        options: [
            "A. Report unusual compulsive urges (gambling, hypersexuality) and akathisia — both can be drug-related",
            "B. Compulsive behaviors are personality traits unrelated to aripiprazole",
            "C. Aripiprazole can be stopped abruptly when feeling better",
            "D. Akathisia from aripiprazole requires immediate discontinuation without medical input"
        ],
        correctAnswer: "A. Report unusual compulsive urges (gambling, hypersexuality) and akathisia — both can be drug-related",
        xOffset: 0.29,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),

    // NALTREXONE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / INTERACTIONS",
        loreText: "Using opioids while on naltrexone will be INEFFECTIVE (receptors blocked) — patients may take dangerous doses trying to overcome the blockade (fatal overdose risk). Thioridazine combination: increased lethargy and somnolence. Naltrexone reduces effectiveness of opioid cough suppressants and antidiarrheal agents (loperamide at high doses).",
        challengeType: .multipleChoice,
        options: [
            "A. Opioids are ineffective while on naltrexone; patients attempting to overcome blockade risk fatal overdose",
            "B. Opioids can still provide pain relief while on naltrexone at higher doses",
            "C. Naltrexone enhances opioid effectiveness for pain management",
            "D. Loperamide is safe and effective for diarrhea in patients on naltrexone"
        ],
        correctAnswer: "A. Opioids are ineffective while on naltrexone; patients attempting to overcome blockade risk fatal overdose",
        xOffset: 0.24,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),

    // NALTREXONE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / COUNSELING",
        loreText: "Inform all healthcare providers (including dentists) that you take naltrexone — opioid pain medications will not work. Carry a medical alert card. Do not take opioids — risk of fatal overdose by attempting to overcome blockade. After stopping naltrexone, opioid tolerance is reduced — previously tolerable doses can now be fatal.",
        challengeType: .multipleChoice,
        options: [
            "A. Carry a medical alert card; opioid tolerance decreases while on naltrexone — relapse risk of fatal overdose after stopping",
            "B. Opioids can be used safely for dental procedures while on naltrexone",
            "C. Stopping naltrexone restores previous opioid tolerance immediately",
            "D. Naltrexone increases opioid tolerance over time"
        ],
        correctAnswer: "A. Carry a medical alert card; opioid tolerance decreases while on naltrexone — relapse risk of fatal overdose after stopping",
        xOffset: 0.29,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),

    // VENLAFAXINE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / INTERACTIONS",
        loreText: "MAOIs: absolutely contraindicated — serotonin syndrome (wait 14 days after stopping MAOI; wait 7 days after stopping venlafaxine). Serotonin syndrome with triptans, tramadol, linezolid, methylene blue. Increases bleeding risk with NSAIDs, warfarin (inhibits platelet serotonin). CYP2D6 inhibitors (fluoxetine) increase levels.",
        challengeType: .multipleChoice,
        options: [
            "A. MAOIs are absolutely contraindicated with venlafaxine — serotonin syndrome; increases bleeding with NSAIDs/warfarin",
            "B. Venlafaxine can be started 24 hours after stopping an MAOI",
            "C. NSAIDs reduce venlafaxine levels by inducing its metabolism",
            "D. Venlafaxine has no significant serotonin syndrome risk with other serotonergic agents"
        ],
        correctAnswer: "A. MAOIs are absolutely contraindicated with venlafaxine — serotonin syndrome; increases bleeding with NSAIDs/warfarin",
        xOffset: 0.24,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),

    // VENLAFAXINE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / COUNSELING",
        loreText: "Take with food to reduce nausea (most common early side effect). Do NOT stop abruptly — discontinuation syndrome (\"brain zaps,\" dizziness, flu-like symptoms) is severe. Taper over weeks. Monitor blood pressure. Report any suicidal thoughts (black box warning in youth). Takes 4–6 weeks for full antidepressant effect.",
        challengeType: .multipleChoice,
        options: [
            "A. Never stop abruptly — taper to avoid severe discontinuation syndrome (brain zaps, dizziness)",
            "B. Venlafaxine can be stopped abruptly once depression has resolved",
            "C. Discontinuation syndrome from venlafaxine is mild and resolves in 24 hours",
            "D. Venlafaxine takes 1–2 days to show full antidepressant effect"
        ],
        correctAnswer: "A. Never stop abruptly — taper to avoid severe discontinuation syndrome (brain zaps, dizziness)",
        xOffset: 0.29,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),
]
