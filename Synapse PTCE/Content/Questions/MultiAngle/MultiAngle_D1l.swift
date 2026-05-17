import Foundation

// Phase 13 — D1j Interactions + Counseling
// Fluticasone, Pregabalin, Lithium, Nitroglycerin, Vancomycin, Amiodarone, Buprenorphine (14 nodes)

let multiAngleNodes_D1l: [DataNode] = [

    // FLUTICASONE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / INTERACTIONS",
        loreText: "Inhaled fluticasone is metabolized by CYP3A4. Strong CYP3A4 inhibitors (ritonavir, ketoconazole) dramatically increase systemic fluticasone levels, raising Cushing's syndrome and adrenal suppression risk. Avoid prolonged combination.",
        challengeType: .multipleChoice,
        options: [
            "A. Ritonavir inhibits CYP3A4, increasing fluticasone systemic exposure and adrenal suppression risk",
            "B. Fluticasone has no clinically significant drug interactions",
            "C. Fluticasone is metabolized by CYP2D6, not CYP3A4",
            "D. Antacids reduce fluticasone bioavailability"
        ],
        correctAnswer: "A. Ritonavir inhibits CYP3A4, increasing fluticasone systemic exposure and adrenal suppression risk",
        xOffset: 0.92,
        yOffset: 0.100,
        baseConceptTitle: "Fluticasone"
    ),

    // FLUTICASONE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / COUNSELING",
        loreText: "Rinse mouth and gargle with water after each use to prevent oral candidiasis. Fluticasone is a controller medication — not for acute attacks. Prime inhaler before first use. Effect builds over days to weeks. Do not stop abruptly with high-dose formulations.",
        challengeType: .multipleChoice,
        options: [
            "A. Rinse the mouth after each use to prevent oral thrush",
            "B. Use fluticasone during acute bronchospasm for immediate relief",
            "C. No need to rinse the mouth after inhaled fluticasone",
            "D. Fluticasone works immediately and priming is unnecessary"
        ],
        correctAnswer: "A. Rinse the mouth after each use to prevent oral thrush",
        xOffset: 0.97,
        yOffset: 0.100,
        baseConceptTitle: "Fluticasone"
    ),

    // PREGABALIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / INTERACTIONS",
        loreText: "Pregabalin is not hepatically metabolized (renally excreted unchanged), so CYP interactions are minimal. However, additive CNS depression occurs with opioids, benzodiazepines, and alcohol — a serious respiratory depression risk especially in opioid-tolerant patients.",
        challengeType: .multipleChoice,
        options: [
            "A. Pregabalin combined with opioids causes additive CNS/respiratory depression",
            "B. Pregabalin is a strong CYP3A4 inhibitor",
            "C. Pregabalin has no interactions with benzodiazepines",
            "D. Pregabalin is extensively metabolized by CYP2C19"
        ],
        correctAnswer: "A. Pregabalin combined with opioids causes additive CNS/respiratory depression",
        xOffset: 0.92,
        yOffset: 0.130,
        baseConceptTitle: "Pregabalin"
    ),

    // PREGABALIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / COUNSELING",
        loreText: "Counsel patients: dizziness and somnolence are common — avoid driving until effects are known. Do not abruptly discontinue (seizure or withdrawal risk). Swelling and weight gain may occur. Avoid alcohol. Dose adjustment required in renal impairment.",
        challengeType: .multipleChoice,
        options: [
            "A. Avoid abrupt discontinuation due to seizure and withdrawal risk",
            "B. Pregabalin can be stopped abruptly without any risk",
            "C. Driving is not affected by pregabalin use",
            "D. Pregabalin does not require renal dose adjustments"
        ],
        correctAnswer: "A. Avoid abrupt discontinuation due to seizure and withdrawal risk",
        xOffset: 0.97,
        yOffset: 0.130,
        baseConceptTitle: "Pregabalin"
    ),

    // LITHIUM — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / INTERACTIONS",
        loreText: "NSAIDs, ACE inhibitors, and thiazide diuretics reduce renal lithium clearance, raising toxic levels. High sodium intake increases lithium excretion; low sodium raises levels. Haloperidol combination may increase neurotoxicity risk. Monitor levels closely with any interacting agent.",
        challengeType: .multipleChoice,
        options: [
            "A. NSAIDs and ACE inhibitors reduce renal lithium clearance, raising toxic levels",
            "B. NSAIDs lower lithium levels by increasing renal clearance",
            "C. Lithium has no significant drug interactions",
            "D. High sodium intake increases lithium toxicity risk"
        ],
        correctAnswer: "A. NSAIDs and ACE inhibitors reduce renal lithium clearance, raising toxic levels",
        xOffset: 0.92,
        yOffset: 0.160,
        baseConceptTitle: "Lithium"
    ),

    // LITHIUM — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / COUNSELING",
        loreText: "Maintain consistent sodium and fluid intake — dehydration raises lithium levels. Signs of toxicity: coarse tremor, ataxia, confusion, nausea, diarrhea. Take with food. Regular blood level monitoring essential. Avoid NSAIDs without prescriber approval.",
        challengeType: .multipleChoice,
        options: [
            "A. Maintain consistent sodium intake and watch for toxicity signs like coarse tremor and confusion",
            "B. Low-sodium diets are recommended to improve lithium effectiveness",
            "C. Lithium does not require regular blood level monitoring",
            "D. Fine tremor indicates lithium toxicity requiring immediate discontinuation"
        ],
        correctAnswer: "A. Maintain consistent sodium intake and watch for toxicity signs like coarse tremor and confusion",
        xOffset: 0.97,
        yOffset: 0.160,
        baseConceptTitle: "Lithium"
    ),

    // NITROGLYCERIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / INTERACTIONS",
        loreText: "Absolute contraindication: PDE5 inhibitors (sildenafil, tadalafil, vardenafil) — profound, life-threatening hypotension. Additive hypotension with other antihypertensives, alcohol, and antipsychotics. Heparin resistance may occur with IV NTG (IV formulation absorbs to PVC tubing).",
        challengeType: .multipleChoice,
        options: [
            "A. PDE5 inhibitors (sildenafil) are absolutely contraindicated with nitroglycerin due to fatal hypotension",
            "B. Sildenafil can be taken 4 hours after nitroglycerin safely",
            "C. Nitroglycerin has no interactions with antihypertensives",
            "D. Alcohol potentiates nitroglycerin's antianginal but not hypotensive effect"
        ],
        correctAnswer: "A. PDE5 inhibitors (sildenafil) are absolutely contraindicated with nitroglycerin due to fatal hypotension",
        xOffset: 0.92,
        yOffset: 0.190,
        baseConceptTitle: "Nitroglycerin"
    ),

    // NITROGLYCERIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / COUNSELING",
        loreText: "Sit or lie down before using SL NTG (causes dizziness/hypotension). Use 1 tablet, wait 5 minutes; if pain persists, repeat up to 3 times total. Call 911 if pain unrelieved after 3 doses. Store in original dark glass bottle — degrades in light/heat/plastic. Headache is common.",
        challengeType: .multipleChoice,
        options: [
            "A. Use up to 3 SL tablets 5 minutes apart; call 911 if pain persists after 3 doses",
            "B. Use 5 tablets at once for fastest angina relief",
            "C. NTG can be stored in a plastic container at room temperature",
            "D. Headache after NTG use indicates a serious adverse reaction"
        ],
        correctAnswer: "A. Use up to 3 SL tablets 5 minutes apart; call 911 if pain persists after 3 doses",
        xOffset: 0.97,
        yOffset: 0.190,
        baseConceptTitle: "Nitroglycerin"
    ),

    // VANCOMYCIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / INTERACTIONS",
        loreText: "Additive nephrotoxicity with aminoglycosides, loop diuretics, NSAIDs, and amphotericin B — increase frequency of renal function monitoring. Additive ototoxicity with aminoglycosides. IV vancomycin requires slow infusion (60–120 min) to prevent Red Man Syndrome — not a true allergy.",
        challengeType: .multipleChoice,
        options: [
            "A. Vancomycin combined with aminoglycosides has additive nephrotoxicity and ototoxicity",
            "B. Vancomycin has no interactions with nephrotoxic drugs",
            "C. Red Man Syndrome is a true IgE-mediated allergy to vancomycin",
            "D. Loop diuretics protect kidneys from vancomycin nephrotoxicity"
        ],
        correctAnswer: "A. Vancomycin combined with aminoglycosides has additive nephrotoxicity and ototoxicity",
        xOffset: 0.92,
        yOffset: 0.220,
        baseConceptTitle: "Vancomycin"
    ),

    // VANCOMYCIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / COUNSELING",
        loreText: "IV vancomycin: infuse slowly over at least 60 minutes to prevent Red Man Syndrome (flushing, rash, hypotension). Report hearing changes or decreased urine output. Oral vancomycin is NOT effective for systemic infections — only for C. diff colitis (not absorbed systemically).",
        challengeType: .multipleChoice,
        options: [
            "A. Oral vancomycin treats C. difficile colitis only — it is not absorbed for systemic infections",
            "B. Oral vancomycin treats systemic MRSA infections effectively",
            "C. IV vancomycin should be infused rapidly to maintain efficacy",
            "D. Red Man Syndrome means the patient is allergic and must not receive vancomycin again"
        ],
        correctAnswer: "A. Oral vancomycin treats C. difficile colitis only — it is not absorbed for systemic infections",
        xOffset: 0.97,
        yOffset: 0.220,
        baseConceptTitle: "Vancomycin"
    ),

    // AMIODARONE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / INTERACTIONS",
        loreText: "Amiodarone is a potent inhibitor of CYP2C9 (doubles warfarin levels), CYP2D6, CYP3A4, and P-glycoprotein. Increases digoxin levels. QTc prolongation with any other QT-prolonging drug. Half-life is 40–55 days — interactions persist long after discontinuation.",
        challengeType: .multipleChoice,
        options: [
            "A. Amiodarone inhibits CYP2C9, raising warfarin levels — reduce warfarin dose by ~30-50%",
            "B. Amiodarone induces CYP3A4, requiring warfarin dose increases",
            "C. Amiodarone interactions resolve within 24 hours of stopping",
            "D. Amiodarone has no significant interaction with digoxin"
        ],
        correctAnswer: "A. Amiodarone inhibits CYP2C9, raising warfarin levels — reduce warfarin dose by ~30-50%",
        xOffset: 0.92,
        yOffset: 0.250,
        baseConceptTitle: "Amiodarone"
    ),

    // AMIODARONE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / COUNSELING",
        loreText: "Counsel patients: use sunscreen — severe photosensitivity and slate-blue skin discoloration possible. Report visual changes, dyspnea, or unexplained weight gain (pulmonary/thyroid toxicity). Regular thyroid, liver, lung, and eye monitoring required. Do not skip doses.",
        challengeType: .multipleChoice,
        options: [
            "A. Use sunscreen daily and report visual changes or dyspnea due to toxicity monitoring",
            "B. No sun protection is needed with amiodarone",
            "C. Amiodarone does not affect thyroid or lung function",
            "D. Amiodarone eye exams are only needed if vision changes occur"
        ],
        correctAnswer: "A. Use sunscreen daily and report visual changes or dyspnea due to toxicity monitoring",
        xOffset: 0.97,
        yOffset: 0.250,
        baseConceptTitle: "Amiodarone"
    ),

    // BUPRENORPHINE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / INTERACTIONS",
        loreText: "CYP3A4 inhibitors (azole antifungals, ritonavir) increase buprenorphine levels. CYP3A4 inducers (rifampin, carbamazepine) decrease levels, risking withdrawal. Additive CNS/respiratory depression with benzodiazepines and alcohol — significant mortality risk in combination.",
        challengeType: .multipleChoice,
        options: [
            "A. Benzodiazepines combined with buprenorphine pose significant respiratory depression and mortality risk",
            "B. Buprenorphine has no interactions with CYP3A4 inhibitors",
            "C. Rifampin increases buprenorphine levels by inhibiting CYP3A4",
            "D. Buprenorphine and benzodiazepines are safe to combine at any dose"
        ],
        correctAnswer: "A. Benzodiazepines combined with buprenorphine pose significant respiratory depression and mortality risk",
        xOffset: 0.92,
        yOffset: 0.280,
        baseConceptTitle: "Buprenorphine"
    ),

    // BUPRENORPHINE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / COUNSELING",
        loreText: "Sublingual/buccal: allow to dissolve fully — do not swallow. Do not use other opioids, alcohol, or benzodiazepines concurrently. Store securely away from children (fatal in opioid-naive individuals). Precipitated withdrawal can occur if taken too soon after full-agonist opioids (wait until mild withdrawal).",
        challengeType: .multipleChoice,
        options: [
            "A. Wait until in mild withdrawal before first dose to avoid precipitated withdrawal",
            "B. Take buprenorphine as soon as opioids wear off to prevent any discomfort",
            "C. Swallow buprenorphine tablets for faster absorption",
            "D. Combining with benzodiazepines is acceptable for anxiety management"
        ],
        correctAnswer: "A. Wait until in mild withdrawal before first dose to avoid precipitated withdrawal",
        xOffset: 0.97,
        yOffset: 0.280,
        baseConceptTitle: "Buprenorphine"
    ),
]
