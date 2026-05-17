import Foundation

// Phase 14 — Final Gap Close
// Cyclobenzaprine × 6 angles, Naloxone × 6 angles (12 nodes)
// Completes full 6-angle coverage for every drug in the original domain files.

let multiAngleNodes_D1o: [DataNode] = [

    // ─── CYCLOBENZAPRINE ─────────────────────────────────────────

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / INDICATION",
        loreText: "Cyclobenzaprine is indicated as a short-term adjunct to rest and physical therapy for relief of acute, painful musculoskeletal conditions (muscle spasms). It is NOT indicated for spasticity from CNS disorders (e.g., cerebral palsy, spinal cord injury). Maximum treatment duration is 2–3 weeks.",
        challengeType: .multipleChoice,
        options: [
            "A. Short-term adjunct for acute musculoskeletal muscle spasms — not for CNS spasticity",
            "B. Long-term management of fibromyalgia and chronic muscle pain",
            "C. First-line treatment for spasticity from spinal cord injury",
            "D. Indicated for both acute muscle spasm and cerebral palsy spasticity"
        ],
        correctAnswer: "A. Short-term adjunct for acute musculoskeletal muscle spasms — not for CNS spasticity",
        xOffset: 0.33,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / MECHANISM",
        loreText: "Cyclobenzaprine is structurally related to tricyclic antidepressants (TCAs). It acts primarily within the CNS at the brainstem, reducing tonic somatic motor activity and influencing both gamma and alpha motor systems. It does NOT act directly on skeletal muscle or the neuromuscular junction.",
        challengeType: .multipleChoice,
        options: [
            "A. Acts centrally at the brainstem to reduce motor neuron activity — structurally related to TCAs",
            "B. Acts directly at the neuromuscular junction to block acetylcholine release",
            "C. Inhibits calcium release from the sarcoplasmic reticulum in skeletal muscle",
            "D. Blocks spinal interneurons via GABA-B receptor activation"
        ],
        correctAnswer: "A. Acts centrally at the brainstem to reduce motor neuron activity — structurally related to TCAs",
        xOffset: 0.38,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / SAFETY",
        loreText: "Strong anticholinergic side effects: dry mouth, urinary retention, blurred vision, constipation. Significant sedation — do not drive. Beers Criteria: avoid in elderly (anticholinergic burden, sedation risk, falls). Absolute contraindication: MAOIs (risk of hyperpyrexic crisis, seizures). Avoid in acute MI, arrhythmias, hyperthyroidism (TCA structure).",
        challengeType: .multipleChoice,
        options: [
            "A. MAOIs are absolutely contraindicated; Beers Criteria flags it for elderly due to anticholinergic/sedation risk",
            "B. Cyclobenzaprine is preferred in elderly patients due to peripheral muscle relaxation",
            "C. MAOIs can be combined with cyclobenzaprine if doses are separated by 12 hours",
            "D. Anticholinergic effects are minimal since it acts centrally, not peripherally"
        ],
        correctAnswer: "A. MAOIs are absolutely contraindicated; Beers Criteria flags it for elderly due to anticholinergic/sedation risk",
        xOffset: 0.43,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / DOSING",
        loreText: "IR: 5 mg TID initially; may increase to 10 mg TID. Max: 30 mg/day. ER (Amrix): 15–30 mg once daily. Duration: limited to 2–3 weeks — efficacy beyond 3 weeks not established and risks outweigh benefits. Use lowest effective dose. Reduce dose in mild hepatic impairment; avoid in moderate-severe hepatic disease.",
        challengeType: .multipleChoice,
        options: [
            "A. Start 5 mg TID; max 30 mg/day; limit use to 2–3 weeks — efficacy beyond this not established",
            "B. Dose 100 mg daily for chronic pain management up to 6 months",
            "C. Cyclobenzaprine ER is dosed three times daily",
            "D. No hepatic dose adjustment is needed for cyclobenzaprine"
        ],
        correctAnswer: "A. Start 5 mg TID; max 30 mg/day; limit use to 2–3 weeks — efficacy beyond this not established",
        xOffset: 0.48,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / INTERACTIONS",
        loreText: "MAOIs: hyperpyrexic crisis, seizures, death — absolute contraindication (14-day washout). SSRIs/SNRIs/tramadol: serotonin syndrome risk (TCA structure). CNS depressants (opioids, benzodiazepines, alcohol): additive sedation. Anticholinergic drugs: additive anticholinergic toxicity. CYP1A2 inhibitors (fluvoxamine) may increase levels.",
        challengeType: .multipleChoice,
        options: [
            "A. MAOIs are absolutely contraindicated; serotonin syndrome risk exists with SSRIs/tramadol",
            "B. Cyclobenzaprine and MAOIs can be combined for refractory muscle spasm",
            "C. SSRIs reduce the risk of cyclobenzaprine side effects",
            "D. Alcohol does not interact with cyclobenzaprine since it acts on different receptors"
        ],
        correctAnswer: "A. MAOIs are absolutely contraindicated; serotonin syndrome risk exists with SSRIs/tramadol",
        xOffset: 0.53,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CYCLOBENZAPRINE / COUNSELING",
        loreText: "Avoid driving or operating machinery — significant sedation. Do not drink alcohol. Do not use longer than 2–3 weeks. Expect dry mouth, blurred vision, constipation (anticholinergic effects). Rise slowly to avoid dizziness. Take with or without food. Do not use MAOIs within 14 days. Elderly patients should discuss risks with provider.",
        challengeType: .multipleChoice,
        options: [
            "A. Avoid driving due to sedation; do not use more than 2–3 weeks; avoid alcohol and MAOIs",
            "B. Cyclobenzaprine can be taken indefinitely for chronic muscle pain",
            "C. Alcohol enhances the muscle relaxant effect safely",
            "D. Dry mouth indicates an allergic reaction requiring immediate discontinuation"
        ],
        correctAnswer: "A. Avoid driving due to sedation; do not use more than 2–3 weeks; avoid alcohol and MAOIs",
        xOffset: 0.58,
        yOffset: 0.500,
        baseConceptTitle: "Cyclobenzaprine"
    ),

    // ─── NALOXONE ────────────────────────────────────────────────

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / INDICATION",
        loreText: "Naloxone is indicated for emergency reversal of opioid overdose — including respiratory depression, sedation, and hypotension. Also used in medication-assisted treatment (co-formulated with buprenorphine as Suboxone). Widely dispensed under community naloxone programs to laypersons. Available without prescription in most states.",
        challengeType: .multipleChoice,
        options: [
            "A. Emergency reversal of opioid overdose — also co-formulated with buprenorphine for OUD",
            "B. Chronic pain management as a partial opioid agonist",
            "C. Alcohol use disorder — reduces cravings via opioid receptor blockade",
            "D. Indicated only for hospital use by medical professionals"
        ],
        correctAnswer: "A. Emergency reversal of opioid overdose — also co-formulated with buprenorphine for OUD",
        xOffset: 0.33,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / MECHANISM",
        loreText: "Naloxone is a pure, competitive opioid receptor antagonist — it has no intrinsic opioid activity. It rapidly displaces opioids from mu, kappa, and delta receptors, reversing analgesia, sedation, and respiratory depression. Half-life (~60–90 min) is SHORTER than most opioids — re-dosing may be required as the opioid re-occupies receptors.",
        challengeType: .multipleChoice,
        options: [
            "A. Pure competitive opioid antagonist — displaces opioids from receptors; shorter half-life than most opioids requires re-dosing",
            "B. Partial opioid agonist — reduces overdose severity without full reversal",
            "C. Irreversibly blocks opioid receptors — a single dose provides 24 hours of protection",
            "D. Inhibits opioid absorption from the GI tract"
        ],
        correctAnswer: "A. Pure competitive opioid antagonist — displaces opioids from receptors; shorter half-life than most opioids requires re-dosing",
        xOffset: 0.38,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / SAFETY",
        loreText: "Precipitated withdrawal: administration to opioid-dependent patients causes sudden, severe withdrawal (agitation, pain, vomiting, tachycardia). Naloxone itself is NOT addictive and has no abuse potential. Caution: re-narcotization — patient may re-enter overdose as naloxone wears off before the opioid does. Always call 911. Not effective against benzodiazepine-only overdose.",
        challengeType: .multipleChoice,
        options: [
            "A. Causes precipitated withdrawal in opioid-dependent patients; re-narcotization can occur as it wears off — always call 911",
            "B. Naloxone has significant abuse potential and is a Schedule II drug",
            "C. A single dose of naloxone provides definitive overdose reversal for all opioids",
            "D. Naloxone reverses both opioid and benzodiazepine overdose effectively"
        ],
        correctAnswer: "A. Causes precipitated withdrawal in opioid-dependent patients; re-narcotization can occur as it wears off — always call 911",
        xOffset: 0.43,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / DOSING",
        loreText: "Intranasal (Narcan): 4 mg per nostril; repeat q2–3 min if needed. IM/SQ: 0.4–2 mg; repeat q2–3 min (max ~10 mg). IV: 0.4–2 mg; onset within 2 min. Auto-injector (Evzio): 0.4 mg IM thigh with voice instructions. Pediatric: 0.01 mg/kg IV. Community dispensing: pharmacists can dispense under standing orders in most states — no individual Rx required.",
        challengeType: .multipleChoice,
        options: [
            "A. Narcan nasal spray 4 mg per nostril; repeat every 2–3 minutes; can be dispensed under standing orders",
            "B. Naloxone 10 mg IV is required for fentanyl overdose reversal",
            "C. Naloxone requires an individual prescription in all 50 states",
            "D. Only one dose can ever be given — repeat dosing causes permanent receptor blockade"
        ],
        correctAnswer: "A. Narcan nasal spray 4 mg per nostril; repeat every 2–3 minutes; can be dispensed under standing orders",
        xOffset: 0.48,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / INTERACTIONS",
        loreText: "Naloxone reverses ALL opioid agonists — including therapeutic buprenorphine (precipitating withdrawal in Suboxone patients). Reversal of opioid analgesia means acute pain returns immediately. No significant pharmacokinetic interactions. In Suboxone, the naloxone component deters IV misuse — sublingual naloxone is poorly absorbed, but IV precipitates withdrawal.",
        challengeType: .multipleChoice,
        options: [
            "A. Reverses all opioid agonists including buprenorphine; in Suboxone the naloxone deters IV misuse",
            "B. Naloxone does not reverse buprenorphine due to its partial agonist properties",
            "C. Naloxone has significant CYP3A4 interactions affecting many medications",
            "D. Naloxone in Suboxone is absorbed sublingually and causes immediate withdrawal"
        ],
        correctAnswer: "A. Reverses all opioid agonists including buprenorphine; in Suboxone the naloxone deters IV misuse",
        xOffset: 0.53,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),

    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALOXONE / COUNSELING",
        loreText: "Community training: (1) Call 911 FIRST. (2) Give naloxone — IN one nostril OR IM outer thigh. (3) Rescue breathing if unresponsive. (4) Repeat dose every 2–3 min if no response. (5) Stay until EMS arrives — re-narcotization risk. Know your state's Good Samaritan law. Store in a cool, dry place (not in a hot car). Pharmacists can train anyone who picks up naloxone.",
        challengeType: .multipleChoice,
        options: [
            "A. Call 911 first, administer naloxone, repeat every 2–3 min, stay with patient due to re-narcotization risk",
            "B. Administer naloxone before calling 911 for fastest response",
            "C. One dose is always sufficient — leave the patient once they wake up",
            "D. Naloxone should only be given in a hospital setting due to withdrawal risk"
        ],
        correctAnswer: "A. Call 911 first, administer naloxone, repeat every 2–3 min, stay with patient due to re-narcotization risk",
        xOffset: 0.58,
        yOffset: 0.530,
        baseConceptTitle: "Naloxone"
    ),
]
