import Foundation

// Multi-Angle Phase 12 — 8 Important Drugs × 4 Angles = 32 nodes
// Fluticasone, Pregabalin, Lithium, Nitroglycerin, Vancomycin, Amiodarone, Buprenorphine, Cephalexin

let multiAngleNodes_D1j: [DataNode] = [

    // ============================================================
    // FLUTICASONE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Inhaled corticosteroid (ICS); brand: Flovent (inhaler), Flonase (nasal spray).
        > INDICATIONS:
        >   INHALED: Asthma — maintenance/prevention (NOT rescue); also used in COPD combinations.
        >   NASAL: Allergic rhinitis (seasonal and perennial), non-allergic rhinitis.
        > KEY POINT: Fluticasone does NOT provide acute bronchospasm relief — always have rescue inhaler.
        > COMBINATIONS: Advair (fluticasone + salmeterol LABA), Breo (fluticasone furoate + vilanterol).
        > AVAILABLE OTC: Flonase Allergy Relief (nasal) — OTC since 2014.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Fluticasone inhaler is a rescue medication used during acute asthma attacks",
            "B. Fluticasone inhaler is a maintenance/prevention medication (not rescue) for asthma; nasal spray treats allergic rhinitis; Flonase is available OTC; combined with LABAs in Advair/Breo",
            "C. Fluticasone is only available by prescription and has no OTC formulations",
            "D. Fluticasone is the first-line rescue bronchodilator for acute bronchospasm"
        ],
        correctAnswer: "B. Fluticasone inhaler is a maintenance/prevention medication (not rescue) for asthma; nasal spray treats allergic rhinitis; Flonase is available OTC; combined with LABAs in Advair/Breo",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.15,
        angle: .indication,
        baseConceptTitle: "FLUTICASONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Binds glucocorticoid receptors → reduces transcription of pro-inflammatory genes → decreased cytokine production (IL-4, IL-5, IL-13), eosinophil recruitment, and airway edema.
        > LOCAL EFFECT: Inhaled = high local concentration, minimal systemic absorption (reduces systemic side effects vs. oral steroids).
        > ANTI-INFLAMMATORY: Reduces airway hyperresponsiveness over weeks — NOT immediate bronchodilation.
        > ONSET: Full anti-inflammatory benefit takes 1–2 weeks of regular use.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Fluticasone provides immediate bronchodilation by relaxing airway smooth muscle",
            "B. Fluticasone binds glucocorticoid receptors, suppressing airway inflammation over 1–2 weeks; inhaled route provides high local effect with minimal systemic absorption; does not cause immediate bronchodilation",
            "C. Fluticasone works by blocking histamine receptors in the airway mucosa",
            "D. Inhaled fluticasone has the same systemic side effect profile as oral prednisone"
        ],
        correctAnswer: "B. Fluticasone binds glucocorticoid receptors, suppressing airway inflammation over 1–2 weeks; inhaled route provides high local effect with minimal systemic absorption; does not cause immediate bronchodilation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.15,
        angle: .mechanism,
        baseConceptTitle: "FLUTICASONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ORAL CANDIDIASIS: Thrush — rinse mouth and gargle with water after every use.
        > DYSPHONIA (hoarse voice): Local deposition on vocal cords — use spacer, rinse mouth.
        > SYSTEMIC EFFECTS (high doses/prolonged): HPA axis suppression, growth suppression in children, osteoporosis.
        > NOT RESCUE: Patients must still carry a SABA (albuterol) — using ICS during acute attack is dangerous.
        > NASAL SPRAY: Epistaxis (nosebleeds), nasal irritation — direct spray toward lateral wall, not septum.
        > PREGNANCY: Category C; generally acceptable benefit vs. risk for asthma control.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Fluticasone inhaler does not cause oral candidiasis if taken at the correct dose",
            "B. Rinse mouth after every use (oral candidiasis/thrush prevention); high-dose long-term use causes HPA suppression and growth suppression in children; nasal epistaxis — spray toward lateral wall",
            "C. Fluticasone provides both anti-inflammatory and rescue bronchodilator effects",
            "D. Oral candidiasis from inhaled corticosteroids is prevented by using the inhaler without a spacer"
        ],
        correctAnswer: "B. Rinse mouth after every use (oral candidiasis/thrush prevention); high-dose long-term use causes HPA suppression and growth suppression in children; nasal epistaxis — spray toward lateral wall",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "FLUTICASONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FLUTICASONE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > FLOVENT HFA: Low: 88 mcg BID; Medium: 88–264 mcg BID; High: >264 mcg BID.
        > FLONASE NASAL: 2 sprays per nostril QD initially; reduce to 1 spray per nostril QD for maintenance.
        > INHALER TECHNIQUE: Shake well; exhale fully; seal lips; inhale slowly while actuating; hold breath 10 sec; use spacer.
        > RINSE MOUTH: After every dose — non-negotiable.
        > DAILY USE: Must be used daily (even when feeling well) for maintenance effect.
        > STEP THERAPY: ICS is Step 2 in asthma step therapy; Step 3 adds LABA (Advair).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Fluticasone nasal spray (Flonase) should be sprayed directly at the nasal septum for best results",
            "B. Flovent inhaler: 88–264+ mcg BID based on severity; Flonase: 2 sprays/nostril QD initially; rinse mouth after every dose; daily use required even when asymptomatic; use spacer for better lung deposition",
            "C. Fluticasone should only be used during asthma attacks and not on symptom-free days",
            "D. The Flovent HFA inhaler does not require mouth rinsing because it is an inhaled formulation"
        ],
        correctAnswer: "B. Flovent inhaler: 88–264+ mcg BID based on severity; Flonase: 2 sprays/nostril QD initially; rinse mouth after every dose; daily use required even when asymptomatic; use spacer for better lung deposition",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.15,
        angle: .dosing,
        baseConceptTitle: "FLUTICASONE"
    ),

    // ============================================================
    // PREGABALIN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Alpha-2-delta ligand (related to gabapentin); brand: Lyrica; Schedule CV.
        > INDICATIONS:
        >   1. Neuropathic pain: diabetic peripheral neuropathy, postherpetic neuralgia, spinal cord injury pain
        >   2. Fibromyalgia
        >   3. Partial-onset seizures (adjunct)
        >   4. Generalized anxiety disorder (GAD) — approved in EU, off-label in US
        > CONTROLLED: CV — abuse potential noted; patients may misuse for sedation/euphoria.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pregabalin is FDA-approved as monotherapy for generalized tonic-clonic seizures",
            "B. Pregabalin is approved for diabetic neuropathy, postherpetic neuralgia, fibromyalgia, and adjunct partial seizures; Schedule CV due to abuse potential",
            "C. Pregabalin is a Schedule II substance with very high abuse potential",
            "D. Pregabalin is the first-line treatment for all types of epilepsy"
        ],
        correctAnswer: "B. Pregabalin is approved for diabetic neuropathy, postherpetic neuralgia, fibromyalgia, and adjunct partial seizures; Schedule CV due to abuse potential",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.25,
        angle: .indication,
        baseConceptTitle: "PREGABALIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Binds voltage-gated calcium channel alpha-2-delta subunit → reduces calcium influx → decreases release of excitatory neurotransmitters (glutamate, substance P, norepinephrine) from hyperexcited neurons.
        > NOT GABA: Despite name, pregabalin does NOT bind GABA receptors or mimic GABA.
        > LINEAR PK: Unlike gabapentin — pregabalin has linear, predictable pharmacokinetics (complete absorption up to highest doses).
        > ONSET: Pain relief may begin within 1 week; full effect in 2–4 weeks.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pregabalin works by directly binding GABA receptors, explaining its antiseizure effect",
            "B. Pregabalin binds alpha-2-delta subunit of voltage-gated Ca²⁺ channels → reduces excitatory neurotransmitter release; does NOT bind GABA receptors; linear PK unlike gabapentin",
            "C. Pregabalin inhibits GABA transaminase, increasing GABA levels in the CNS",
            "D. Pregabalin has non-linear pharmacokinetics that limit its use at higher doses"
        ],
        correctAnswer: "B. Pregabalin binds alpha-2-delta subunit of voltage-gated Ca²⁺ channels → reduces excitatory neurotransmitter release; does NOT bind GABA receptors; linear PK unlike gabapentin",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.25,
        angle: .mechanism,
        baseConceptTitle: "PREGABALIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Black Box Warning — additive respiratory depression with opioids (same as gabapentin).
        > SEDATION/DIZZINESS: Dose-dependent; avoid driving until effect known.
        > PERIPHERAL EDEMA: Weight gain and edema — monitor in CHF, renal patients.
        > ABRUPT CESSATION: Withdrawal syndrome — taper over ≥1 week.
        > SUICIDAL IDEATION: Black Box — all antiepileptics.
        > HYPERSENSITIVITY: Angioedema (facial, oropharyngeal swelling) — rare but serious; discontinue immediately.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pregabalin can be stopped abruptly when pain resolves without any risk of withdrawal",
            "B. Black Box for respiratory depression with opioids; causes sedation/dizziness; peripheral edema/weight gain; taper to avoid withdrawal; angioedema rare but serious — stop immediately",
            "C. Pregabalin does not cause withdrawal symptoms because it does not affect GABA receptors",
            "D. Peripheral edema from pregabalin is a cosmetic concern only and does not require monitoring"
        ],
        correctAnswer: "B. Black Box for respiratory depression with opioids; causes sedation/dizziness; peripheral edema/weight gain; taper to avoid withdrawal; angioedema rare but serious — stop immediately",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.25,
        angle: .safety,
        baseConceptTitle: "PREGABALIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREGABALIN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DIABETIC NEUROPATHY: Start 50 mg TID (150 mg/day); may increase to 300 mg/day within 1 week; max 300 mg/day.
        > POSTHERPETIC NEURALGIA: Start 75 mg BID or 50 mg TID; titrate to 150–300 mg/day; max 600 mg/day.
        > FIBROMYALGIA: Start 75 mg BID; target 225–450 mg/day.
        > PARTIAL SEIZURES (adjunct): 150–600 mg/day in 2–3 divided doses.
        > RENAL: CrCl 30–60: reduce by ~50%; CrCl 15–30: reduce by ~75%; dialysis: supplement post-dialysis.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Pregabalin dosing is the same for all indications at 150 mg TID",
            "B. Diabetic neuropathy max 300 mg/day; postherpetic neuralgia max 600 mg/day; fibromyalgia target 225–450 mg/day; significant renal dose reduction required (CrCl-based)",
            "C. Renal impairment does not affect pregabalin dosing because it is hepatically metabolized",
            "D. Pregabalin for postherpetic neuralgia is capped at 300 mg/day, the same as diabetic neuropathy"
        ],
        correctAnswer: "B. Diabetic neuropathy max 300 mg/day; postherpetic neuralgia max 600 mg/day; fibromyalgia target 225–450 mg/day; significant renal dose reduction required (CrCl-based)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.25,
        angle: .dosing,
        baseConceptTitle: "PREGABALIN"
    ),

    // ============================================================
    // LITHIUM — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Mood stabilizer (alkali metal salt); brand: Lithobid, Eskalith.
        > INDICATIONS:
        >   1. Bipolar I disorder — acute manic episodes AND maintenance
        >   2. Bipolar depression (adjunct)
        >   3. Augmentation of antidepressants in treatment-resistant depression (off-label)
        >   4. Cluster headache prevention (off-label)
        > GOLD STANDARD: One of few agents with evidence for bipolar suicide reduction.
        > NARROW THERAPEUTIC INDEX: Serum level monitoring mandatory.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lithium is primarily indicated for major depressive disorder as monotherapy",
            "B. Lithium is indicated for bipolar I disorder (acute mania and maintenance); evidence for suicide risk reduction in bipolar; NTI drug requiring regular serum level monitoring",
            "C. Lithium does not require serum level monitoring because it has a wide therapeutic window",
            "D. Lithium is a first-generation antipsychotic that works by blocking dopamine D2 receptors"
        ],
        correctAnswer: "B. Lithium is indicated for bipolar I disorder (acute mania and maintenance); evidence for suicide risk reduction in bipolar; NTI drug requiring regular serum level monitoring",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.35,
        angle: .indication,
        baseConceptTitle: "LITHIUM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Not fully understood. Inhibits inositol monophosphatase (IP phosphatase) and GSK-3β → modulates phosphatidylinositol signaling → neuroprotective and mood-stabilizing effects.
        > IONS: Lithium competes with Na⁺, K⁺, Ca²⁺, Mg²⁺ at cellular transporters.
        > RENAL HANDLING: Reabsorbed like Na⁺ in proximal tubule — sodium depletion causes lithium retention → toxicity risk.
        > THYROID: Inhibits thyroid hormone synthesis and release → hypothyroidism.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lithium works by blocking serotonin and norepinephrine reuptake like SNRIs",
            "B. Lithium inhibits IP phosphatase and GSK-3β; reabsorbed like Na⁺ (Na⁺ depletion → lithium retention → toxicity); inhibits thyroid hormone synthesis (monitor thyroid function)",
            "C. Lithium is excreted by the liver and sodium depletion has no effect on lithium levels",
            "D. Lithium directly binds and activates GABA receptors to reduce neuronal excitability"
        ],
        correctAnswer: "B. Lithium inhibits IP phosphatase and GSK-3β; reabsorbed like Na⁺ (Na⁺ depletion → lithium retention → toxicity); inhibits thyroid hormone synthesis (monitor thyroid function)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.35,
        angle: .mechanism,
        baseConceptTitle: "LITHIUM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TOXICITY SIGNS: Tremor (fine → coarse), nausea → vomiting → diarrhea, ataxia, slurred speech, confusion, seizures, cardiac arrhythmias.
        > THERAPEUTIC RANGE: 0.6–1.2 mEq/L (maintenance); 0.8–1.2 mEq/L (acute mania). Toxic: >1.5 mEq/L.
        > LITHIURETICS — TOXICITY TRIGGERS: NSAIDs, ACE inhibitors, thiazide diuretics → reduce Li⁺ excretion → toxicity.
        > DEHYDRATION: Any cause of sodium/volume depletion → lithium retention → toxicity.
        > THYROID: Hypothyroidism in 20–40% long-term — monitor TSH.
        > RENAL: Nephrogenic diabetes insipidus (polyuria/polydipsia) — lithium damages collecting duct.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lithium toxicity occurs only at levels above 2.5 mEq/L",
            "B. Lithium toxicity signs: coarse tremor, ataxia, confusion, GI symptoms; toxic above 1.5 mEq/L; NSAIDs/ACE inhibitors/thiazides reduce Li⁺ excretion → toxicity; monitor TSH (hypothyroidism in 20–40%)",
            "C. NSAIDs are safe with lithium because they do not affect renal tubular handling",
            "D. Dehydration reduces lithium levels by increasing renal clearance"
        ],
        correctAnswer: "B. Lithium toxicity signs: coarse tremor, ataxia, confusion, GI symptoms; toxic above 1.5 mEq/L; NSAIDs/ACE inhibitors/thiazides reduce Li⁺ excretion → toxicity; monitor TSH (hypothyroidism in 20–40%)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.35,
        angle: .safety,
        baseConceptTitle: "LITHIUM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LITHIUM / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > STARTING DOSE: 300 mg TID (immediate-release); titrate based on levels and tolerability.
        > TARGET LEVELS: Acute mania: 0.8–1.2 mEq/L; Maintenance: 0.6–1.0 mEq/L.
        > MONITORING: Trough level 12 hours after last dose; check 5 days after dose change.
        > BASELINE LABS: CMP, CBC, TSH, urinalysis, pregnancy test.
        > ONGOING: Lithium levels, BMP/creatinine, TSH every 3–6 months.
        > RENAL: Dose reduce with CKD — lithium is renally excreted.
        > PREGNANCY: Ebstein's anomaly risk (cardiac) — avoid if possible, especially first trimester.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lithium trough levels should be drawn 2 hours after the last dose for accuracy",
            "B. Trough level drawn 12 hours after last dose; target 0.8–1.2 mEq/L for mania, 0.6–1.0 mEq/L for maintenance; monitor renal/thyroid function every 3–6 months; avoid in first trimester (Ebstein's anomaly)",
            "C. Lithium levels should be checked immediately after administering a dose",
            "D. Lithium requires no laboratory monitoring once a stable dose is established"
        ],
        correctAnswer: "B. Trough level drawn 12 hours after last dose; target 0.8–1.2 mEq/L for mania, 0.6–1.0 mEq/L for maintenance; monitor renal/thyroid function every 3–6 months; avoid in first trimester (Ebstein's anomaly)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.35,
        angle: .dosing,
        baseConceptTitle: "LITHIUM"
    ),

    // ============================================================
    // NITROGLYCERIN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Organic nitrate; vasodilator; brand: Nitrostat (SL), Nitro-Dur (patch), Nitro-Bid (ointment).
        > INDICATIONS:
        >   SUBLINGUAL: Acute angina attack — FIRST LINE.
        >   IV: Acute MI, unstable angina, acute decompensated heart failure, hypertensive emergency with ischemia.
        >   LONG-ACTING (patch/oral): Angina prophylaxis, heart failure.
        > PEARL: Sublingual NTG does NOT prevent angina — only treats acute attacks.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Sublingual nitroglycerin is used as a daily preventive agent for chronic stable angina",
            "B. Sublingual NTG is first-line for acute angina attacks (not prevention); IV NTG for acute MI/CHF/hypertensive emergency; long-acting formulations (patch, oral) prevent angina",
            "C. Nitroglycerin patch should be used during acute angina attacks for rapid relief",
            "D. Sublingual nitroglycerin is contraindicated in acute MI"
        ],
        correctAnswer: "B. Sublingual NTG is first-line for acute angina attacks (not prevention); IV NTG for acute MI/CHF/hypertensive emergency; long-acting formulations (patch, oral) prevent angina",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.45,
        angle: .indication,
        baseConceptTitle: "NITROGLYCERIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Converted to nitric oxide (NO) in vascular smooth muscle → activates guanylate cyclase → increases cGMP → smooth muscle relaxation → vasodilation.
        > VENODILATION (primary): Reduces preload → decreased myocardial oxygen demand.
        > ARTERIAL DILATION (higher doses): Reduces afterload; coronary vasodilation (relieves coronary spasm).
        > RESULT: Reduced myocardial O₂ consumption → angina relief.
        > NITRATE TOLERANCE: With continuous exposure → tolerance in 24–48 hrs; nitrate-free interval required.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Nitroglycerin primarily works by directly blocking calcium channels in cardiac muscle",
            "B. Nitroglycerin → NO → cGMP → vasodilation; primarily venodilation reduces preload and myocardial O₂ demand; nitrate tolerance develops with continuous use — require nitrate-free interval",
            "C. Nitroglycerin increases myocardial oxygen demand to stimulate coronary blood flow",
            "D. Nitrate tolerance never occurs with transdermal nitroglycerin patches"
        ],
        correctAnswer: "B. Nitroglycerin → NO → cGMP → vasodilation; primarily venodilation reduces preload and myocardial O₂ demand; nitrate tolerance develops with continuous use — require nitrate-free interval",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.45,
        angle: .mechanism,
        baseConceptTitle: "NITROGLYCERIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PDE5 INHIBITORS: ABSOLUTE CONTRAINDICATION — sildenafil, tadalafil, vardenafil within 24–48 hrs → profound hypotension, death.
        > HYPOTENSION: Significant BP drop — patients should sit/lie down during use.
        > HEADACHE: Very common (vasodilation of cerebral vessels) — resolves with continued use or acetaminophen.
        > TACHYCARDIA/REFLEX: Arterial dilation → reflex tachycardia.
        > LIGHT SENSITIVE: Store in original dark glass bottle; heat/light/air degrade NTG rapidly.
        > EXPIRY: Replace SL tabs every 6 months after opening; stinging on tongue = still potent.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Nitroglycerin + sildenafil can be co-administered if timed 1 hour apart",
            "B. PDE5 inhibitors (sildenafil, tadalafil) are absolutely contraindicated with nitrates (24–48 hr washout) — fatal hypotension; headache common; store in dark glass; replace SL tabs every 6 months",
            "C. NTG should be stored in a plastic prescription bottle for convenience",
            "D. Headache from nitroglycerin means the dose is too high and should be reduced"
        ],
        correctAnswer: "B. PDE5 inhibitors (sildenafil, tadalafil) are absolutely contraindicated with nitrates (24–48 hr washout) — fatal hypotension; headache common; store in dark glass; replace SL tabs every 6 months",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.45,
        angle: .safety,
        baseConceptTitle: "NITROGLYCERIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NITROGLYCERIN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SUBLINGUAL ACUTE ANGINA PROTOCOL:
        >   1 tablet (0.4 mg) SL; may repeat q5 min × 3 doses.
        >   If pain not relieved after 3 doses in 15 min → CALL 911.
        > PATCH (prevention): Apply 1 patch daily for 12–14 hours; REMOVE for 10–12 hr nitrate-free interval (usually overnight).
        > OINTMENT: 1–2 inches applied to chest or upper arm; gloves required for caregiver.
        > IV NTG: Titrated by nursing to effect; non-PVC tubing required (NTG adsorbs to PVC).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. For acute angina, take one sublingual tablet and wait 15 minutes before calling 911 if no relief",
            "B. SL NTG: 0.4 mg q5 min × 3 doses; call 911 if still no relief; patch worn 12–14 hrs then 10–12 hr nitrate-free interval; IV NTG requires non-PVC tubing",
            "C. Nitroglycerin patches should be worn continuously for 24 hours to prevent nitrate tolerance",
            "D. Sublingual NTG can be repeated every 15 minutes up to 6 doses before seeking emergency care"
        ],
        correctAnswer: "B. SL NTG: 0.4 mg q5 min × 3 doses; call 911 if still no relief; patch worn 12–14 hrs then 10–12 hr nitrate-free interval; IV NTG requires non-PVC tubing",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.45,
        angle: .dosing,
        baseConceptTitle: "NITROGLYCERIN"
    ),

    // ============================================================
    // VANCOMYCIN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Glycopeptide antibiotic; brand: Vancocin.
        > INDICATIONS:
        >   IV: Serious MRSA infections (bacteremia, endocarditis, pneumonia, osteomyelitis, meningitis)
        >   IV: PCN-allergic patients with serious gram-positive infections
        >   ORAL: C. difficile colitis (NOT absorbed orally — acts locally in colon)
        > COVERAGE: Gram-positive only (MRSA, MSSA, streptococci, enterococci).
        > NOT FOR: Gram-negative bacteria (no gram-negative coverage).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Oral vancomycin has excellent systemic bioavailability and can treat MRSA bacteremia",
            "B. IV vancomycin treats serious MRSA and gram-positive infections; oral vancomycin treats C. difficile (not absorbed, acts locally); no gram-negative coverage",
            "C. Vancomycin provides broad-spectrum coverage including gram-negative bacteria",
            "D. Oral vancomycin is absorbed and reaches therapeutic blood levels for systemic MRSA treatment"
        ],
        correctAnswer: "B. IV vancomycin treats serious MRSA and gram-positive infections; oral vancomycin treats C. difficile (not absorbed, acts locally); no gram-negative coverage",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.55,
        angle: .indication,
        baseConceptTitle: "VANCOMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Binds D-alanyl-D-alanine terminus of peptidoglycan precursors → inhibits cell wall synthesis (transglycosylation step) → bactericidal against dividing organisms.
        > DIFFERENT FROM BETA-LACTAMS: Beta-lactams inhibit transpeptidation; vancomycin inhibits transglycosylation — thus active against MRSA despite beta-lactam resistance.
        > VRE: Vancomycin-resistant enterococci — mutation in D-ala-D-lac → reduced binding.
        > TIME-DEPENDENT: Efficacy depends on time above MIC.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Vancomycin and beta-lactams work through identical mechanisms — both inhibit transpeptidation",
            "B. Vancomycin inhibits transglycosylation by binding D-ala-D-ala peptidoglycan precursors; different target from beta-lactams (explains activity against MRSA); VRE changes D-ala-D-lac reducing binding",
            "C. Vancomycin is active against gram-negative bacteria through outer membrane disruption",
            "D. Vancomycin is concentration-dependent like aminoglycosides"
        ],
        correctAnswer: "B. Vancomycin inhibits transglycosylation by binding D-ala-D-ala peptidoglycan precursors; different target from beta-lactams (explains activity against MRSA); VRE changes D-ala-D-lac reducing binding",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.55,
        angle: .mechanism,
        baseConceptTitle: "VANCOMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > NEPHROTOXICITY: Major concern — especially with other nephrotoxins (aminoglycosides, NSAIDs, amphotericin B); monitor SCr and urine output.
        > RED MAN SYNDROME: Infusion-related — flushing, erythema, pruritus of neck/face/upper torso (NOT allergic). Prevent by infusing over ≥60 min; pretreat with diphenhydramine if recurrent.
        > OTOTOXICITY: Rare with modern dosing; risk increases with aminoglycoside co-administration.
        > AUC-GUIDED MONITORING: Target AUC/MIC 400–600 mg·h/L; superior to trough-only monitoring.
        > VANCOMYCIN-RESISTANT ENTEROCOCCI (VRE): Emerging resistance — linezolid or daptomycin used.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Red Man Syndrome is a true allergic reaction requiring epinephrine treatment",
            "B. Nephrotoxicity is the major risk (monitor SCr); Red Man Syndrome is infusion-related (not allergic) — slow infusion rate and/or pretreat with diphenhydramine; AUC/MIC monitoring preferred over trough-only",
            "C. Red Man Syndrome can only be prevented by avoiding vancomycin entirely",
            "D. Vancomycin ototoxicity is so common it is a routine expected side effect at therapeutic doses"
        ],
        correctAnswer: "B. Nephrotoxicity is the major risk (monitor SCr); Red Man Syndrome is infusion-related (not allergic) — slow infusion rate and/or pretreat with diphenhydramine; AUC/MIC monitoring preferred over trough-only",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.55,
        angle: .safety,
        baseConceptTitle: "VANCOMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VANCOMYCIN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > IV DOSING: 15–20 mg/kg q8–12h (based on renal function and indication).
        > AUC TARGET: AUC₂₄/MIC = 400–600 mg·h/L (modern standard for serious MRSA).
        > INFUSE OVER: ≥60 min (to prevent Red Man Syndrome); max rate 10–15 mg/min.
        > C. DIFFICILE (ORAL): 125 mg PO q6h × 10 days (severe CDI) — oral dose not systemically absorbed.
        > RENAL ADJUSTMENT: Major renal dose reduction based on CrCl; may extend interval to q24–48h.
        > LOADING DOSE: 25–30 mg/kg for critically ill patients to reach therapeutic levels faster.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Vancomycin IV should be infused as a rapid bolus over 10 minutes for fastest onset",
            "B. IV vancomycin: 15–20 mg/kg q8–12h infused over ≥60 min; AUC target 400–600; oral dose 125 mg q6h for C. diff (local action); loading dose 25–30 mg/kg in critically ill; renal dose reduction required",
            "C. Oral vancomycin 500 mg q6h reaches therapeutic blood levels for MRSA pneumonia",
            "D. Vancomycin infusion rate does not affect the risk of Red Man Syndrome"
        ],
        correctAnswer: "B. IV vancomycin: 15–20 mg/kg q8–12h infused over ≥60 min; AUC target 400–600; oral dose 125 mg q6h for C. diff (local action); loading dose 25–30 mg/kg in critically ill; renal dose reduction required",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.55,
        angle: .dosing,
        baseConceptTitle: "VANCOMYCIN"
    ),

    // ============================================================
    // AMIODARONE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Class III antiarrhythmic (Vaughan-Williams); also has I, II, and IV properties; brand: Cordarone, Pacerone.
        > INDICATIONS:
        >   1. Ventricular fibrillation / pulseless VT (ACLS first-line antiarrhythmic)
        >   2. Hemodynamically stable VT
        >   3. Atrial fibrillation (rate and rhythm control)
        >   4. Life-threatening recurrent arrhythmias unresponsive to other agents
        > NOTE: Used with significant caution due to extensive toxicity profile.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Amiodarone is a first-line antiarrhythmic for benign premature atrial contractions",
            "B. Amiodarone is ACLS first-line antiarrhythmic for VF/pulseless VT; also treats hemodynamically stable VT and AF; reserved for serious arrhythmias due to extensive toxicity profile",
            "C. Amiodarone is a Class IV antiarrhythmic that primarily blocks calcium channels",
            "D. Amiodarone is preferred for routine atrial fibrillation in all patients"
        ],
        correctAnswer: "B. Amiodarone is ACLS first-line antiarrhythmic for VF/pulseless VT; also treats hemodynamically stable VT and AF; reserved for serious arrhythmias due to extensive toxicity profile",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.65,
        angle: .indication,
        baseConceptTitle: "AMIODARONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Multi-class — Class III (potassium channel blockade, prolongs action potential/QT), Class I (Na⁺ channel), Class II (beta-blockade), Class IV (Ca²⁺ channel).
        > QT PROLONGATION: Significant — monitor QTc.
        > HALF-LIFE: Extremely long — 40–55 days. Slow onset and offset.
        > IODINE-RICH: Contains 37% iodine by weight → thyroid effects.
        > TISSUE ACCUMULATION: Deposits in adipose, lung, liver, cornea — explains organ toxicities.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Amiodarone is a pure Class III antiarrhythmic with no effects on other ion channels",
            "B. Amiodarone has multi-class effects (I, II, III, IV); 40–55 day half-life; 37% iodine content causes thyroid effects; tissue accumulation in lung/liver/cornea/adipose explains organ toxicities",
            "C. Amiodarone's half-life of 4–6 hours allows for easy dose titration",
            "D. Amiodarone shortens the QT interval, protecting against torsades de pointes"
        ],
        correctAnswer: "B. Amiodarone has multi-class effects (I, II, III, IV); 40–55 day half-life; 37% iodine content causes thyroid effects; tissue accumulation in lung/liver/cornea/adipose explains organ toxicities",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.65,
        angle: .mechanism,
        baseConceptTitle: "AMIODARONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PULMONARY TOXICITY: Black Box Warning — potentially fatal; cough, dyspnea, pulmonary infiltrates. Baseline and periodic CXR/PFTs.
        > HEPATOTOXICITY: Black Box Warning — monitor LFTs (baseline and periodically).
        > THYROID: Hypo OR hyperthyroidism (iodine load). Monitor TSH every 3–6 months.
        > CORNEAL MICRODEPOSITS: Nearly universal; rarely affects vision. Sun sensitivity (UV-blocking glasses).
        > QT PROLONGATION: Major drug interaction risk with other QT-prolonging agents.
        > DRUG INTERACTIONS: CYP inhibitor (3A4, 2D6, 2C9) — raises warfarin, digoxin, statins, beta-blockers.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Amiodarone's corneal microdeposits require stopping the drug immediately",
            "B. Black Box for pulmonary toxicity (fatal) and hepatotoxicity; thyroid dysfunction (both hypo and hyper); corneal deposits almost universal (rarely affects vision); major CYP inhibitor (raises warfarin/digoxin/statins)",
            "C. Amiodarone causes only hypothyroidism, never hyperthyroidism",
            "D. Amiodarone has minimal drug interactions because of its unique multi-class mechanism"
        ],
        correctAnswer: "B. Black Box for pulmonary toxicity (fatal) and hepatotoxicity; thyroid dysfunction (both hypo and hyper); corneal deposits almost universal (rarely affects vision); major CYP inhibitor (raises warfarin/digoxin/statins)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.65,
        angle: .safety,
        baseConceptTitle: "AMIODARONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AMIODARONE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > VF/PULSELESS VT (ACLS): 300 mg IV push; second dose 150 mg IV push.
        > AF LOADING (PO): 400–600 mg/day × 4–6 weeks, then 100–200 mg/day maintenance.
        > IV INFUSION: 150 mg IV over 10 min (loading); then 1 mg/min × 6 hrs; then 0.5 mg/min × 18 hrs.
        > MONITORING: Baseline + periodic: LFTs, TFTs, CXR, PFTs, ophthalmology, ECG (QTc).
        > WARFARIN: Amiodarone inhibits CYP2C9 → increase in INR; reduce warfarin dose by 30–50%.
        > DIGOXIN: Raises digoxin levels 70–100% — reduce digoxin dose by 50%.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The ACLS dose of amiodarone for VF/pulseless VT is 150 mg IV push",
            "B. ACLS VF/pulseless VT: 300 mg IV push (second dose 150 mg); AF oral loading 400–600 mg/day × 4–6 weeks then 100–200 mg/day; inhibits CYP2C9 (reduce warfarin 30–50%); raises digoxin 70–100%",
            "C. Amiodarone maintenance for AF is 400–600 mg/day indefinitely",
            "D. Amiodarone does not interact with warfarin or digoxin"
        ],
        correctAnswer: "B. ACLS VF/pulseless VT: 300 mg IV push (second dose 150 mg); AF oral loading 400–600 mg/day × 4–6 weeks then 100–200 mg/day; inhibits CYP2C9 (reduce warfarin 30–50%); raises digoxin 70–100%",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.65,
        angle: .dosing,
        baseConceptTitle: "AMIODARONE"
    ),

    // ============================================================
    // BUPRENORPHINE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Partial mu-opioid agonist / kappa antagonist; Schedule III; brand: Subutex (alone), Suboxone (+ naloxone).
        > INDICATIONS:
        >   1. Opioid use disorder (OUD) — medication-assisted treatment (MAT/MOUD)
        >   2. Chronic moderate-severe pain (Belbuca buccal film, Butrans patch)
        >   3. Acute pain: Buprenex (IV/IM, hospital)
        > WAIVER: Historically required DEA waiver (DATA 2000); waiver eliminated by SUPPORT Act (2023 onward) — any DEA-registered practitioner may prescribe.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Buprenorphine (Suboxone) requires a special DEA waiver that must be obtained before any practitioner can prescribe it",
            "B. Buprenorphine treats OUD (Suboxone), chronic pain (Belbuca/Butrans), and acute pain; Schedule III partial mu-agonist; DEA waiver requirement eliminated — any DEA-registered prescriber can prescribe",
            "C. Buprenorphine is a Schedule II full opioid agonist with the same abuse potential as oxycodone",
            "D. Suboxone (buprenorphine/naloxone) is approved only for pain management, not opioid use disorder"
        ],
        correctAnswer: "B. Buprenorphine treats OUD (Suboxone), chronic pain (Belbuca/Butrans), and acute pain; Schedule III partial mu-agonist; DEA waiver requirement eliminated — any DEA-registered prescriber can prescribe",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.60,
        yOffset: 0.75,
        angle: .indication,
        baseConceptTitle: "BUPRENORPHINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Partial mu-opioid agonist (high affinity, low intrinsic activity) + kappa antagonist.
        > CEILING EFFECT: Respiratory depression plateaus — safer than full agonists (reduced overdose risk).
        > HIGH AFFINITY: Displaces other opioids from mu receptors → can precipitate withdrawal if given too early.
        > NALOXONE COMPONENT (Suboxone): Added as abuse deterrent — naloxone is SL inactive (poor bioavailability), but blocks opioid effect if injected → discourages IV misuse.
        > BUPRENORPHINE ALONE (Subutex): Used in pregnancy (naloxone avoided due to fetal concerns).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Buprenorphine is a full mu-opioid agonist with no ceiling effect on respiratory depression",
            "B. Partial mu-agonist with ceiling effect (safer overdose profile); high affinity — displaces opioids (can precipitate withdrawal if given too early); naloxone in Suboxone deters IV misuse but is SL inactive",
            "C. Buprenorphine should be given immediately with other opioids still on board to prevent withdrawal",
            "D. The naloxone in Suboxone is systemically absorbed sublingually, reversing buprenorphine's effect"
        ],
        correctAnswer: "B. Partial mu-agonist with ceiling effect (safer overdose profile); high affinity — displaces opioids (can precipitate withdrawal if given too early); naloxone in Suboxone deters IV misuse but is SL inactive",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.65,
        yOffset: 0.75,
        angle: .mechanism,
        baseConceptTitle: "BUPRENORPHINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PRECIPITATED WITHDRAWAL: If given too soon after last opioid use (before withdrawal starts) → acute severe withdrawal. Wait until COWS score ≥8–12 before first dose.
        > CNS DEPRESSANTS: Black Box — additive respiratory depression with benzodiazepines, alcohol, sedatives.
        > HEPATOTOXICITY: Transaminase elevations; risk in hepatitis B/C patients.
        > NEONATAL OPIOID WITHDRAWAL: If used in pregnancy — neonates should be monitored.
        > DENTAL: Black Box — dental caries with SL/buccal formulations (acid + reduced salivation).
        > NOT REVERSED FULLY BY NALOXONE: High affinity reduces naloxone reversal effectiveness.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Buprenorphine should be given immediately when a patient requests it, regardless of last opioid use",
            "B. Must wait until COWS ≥8–12 before first dose (precipitated withdrawal risk); Black Box for CNS depressant combination; dental caries with SL formulations; hepatotoxicity risk in hepatitis patients",
            "C. Buprenorphine is fully reversed by standard naloxone doses due to its partial agonist properties",
            "D. Precipitated withdrawal from buprenorphine is mild and does not require clinical management"
        ],
        correctAnswer: "B. Must wait until COWS ≥8–12 before first dose (precipitated withdrawal risk); Black Box for CNS depressant combination; dental caries with SL formulations; hepatotoxicity risk in hepatitis patients",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.70,
        yOffset: 0.75,
        angle: .safety,
        baseConceptTitle: "BUPRENORPHINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPRENORPHINE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > OUD INDUCTION (Suboxone): Start 2/0.5 mg or 4/1 mg SL when COWS ≥8; titrate up; usual maintenance 8–24 mg/day.
        > SUBOXONE RATIO: 4:1 buprenorphine:naloxone.
        > SUBLINGUAL ADMINISTRATION: Place under tongue; do NOT swallow — bioavailability drops sharply.
        > SUBLOCADE (monthly SQ injection): 300 mg SQ × 2 months, then 100 mg monthly (maintenance).
        > PREGNANCY: Subutex (buprenorphine alone) preferred — monitor for neonatal withdrawal.
        > CYP3A4: Buprenorphine metabolized by CYP3A4; inhibitors raise levels (sedation/toxicity risk).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Buprenorphine for OUD should be started at the full maintenance dose of 24 mg immediately",
            "B. OUD induction: start 2–4 mg SL when COWS ≥8, titrate to 8–24 mg/day; SL only (swallowing reduces bioavailability dramatically); pregnancy: use Subutex (no naloxone); monthly Sublocade injection available",
            "C. Suboxone tablets can be swallowed for equivalent bioavailability compared to sublingual administration",
            "D. Buprenorphine should be started before a patient experiences any opioid withdrawal symptoms"
        ],
        correctAnswer: "B. OUD induction: start 2–4 mg SL when COWS ≥8, titrate to 8–24 mg/day; SL only (swallowing reduces bioavailability dramatically); pregnancy: use Subutex (no naloxone); monthly Sublocade injection available",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.75,
        yOffset: 0.75,
        angle: .dosing,
        baseConceptTitle: "BUPRENORPHINE"
    ),
]
