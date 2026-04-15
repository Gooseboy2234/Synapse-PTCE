//
//  ChallengeNodes.swift
//  Synapse PTCE
//
//  Phase 7b — Challenge Mode: 30 advanced nodes (one per high-frequency topic).
//  Each node retests a topic already covered in the base database, but from a
//  harder, application-based angle — clinical scenarios, calculations, and
//  multi-step reasoning instead of pure recall.
//
//  Node titles use a "+" suffix to signal they are challenge variants.
//  Distribution: 12 D1 | 6 D2 | 6 D3 | 6 D4 = 30 nodes
//

import Foundation

extension DataNode {

    // MARK: - Challenge Nodes: Domain 1 (12 nodes)

    static let challengeNodes_D1: [DataNode] = [

        // ── D1-C01 ── METFORMIN + ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Metformin — Renal Dosing and Contrast Procedures
            >
            > CLINICAL SCENARIO:
            >   Metformin is contraindicated when eGFR < 30 mL/min due to the risk of
            >   LACTIC ACIDOSIS — metformin accumulates when the kidneys cannot clear it.
            >
            > KEY THRESHOLDS:
            >   eGFR ≥ 60:     Continue at normal dose
            >   eGFR 45–59:    Use with caution; assess benefit vs. risk
            >   eGFR 30–44:    Reduce dose; close monitoring required
            >   eGFR < 30:     CONTRAINDICATED — discontinue
            >
            > IODINATED CONTRAST MEDIA:
            >   HOLD metformin at time of or before any procedure using iodinated contrast.
            >   Restart only after renal function is re-assessed (typically 48 hours post-procedure).
            >   Reason: Contrast nephropathy could acutely drop eGFR → lactic acidosis risk.
            >
            > QUESTION: A patient's eGFR just dropped from 52 mL/min to 27 mL/min.
            >   They are currently taking metformin 1000 mg twice daily. What is correct?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Continue metformin — the dose is already split to reduce renal load",
                "B) Reduce to 500 mg twice daily and recheck in 1 week",
                "C) Discontinue metformin — eGFR < 30 is a contraindication",
                "D) Switch to metformin ER — extended-release is safer in renal impairment"
            ],
            correctAnswer: "C) Discontinue metformin — eGFR < 30 is a contraindication",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.12
        ),

        // ── D1-C02 ── WARFARIN + ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Warfarin — Identifying High-Risk Drug Interactions
            >
            > CLINICAL SCENARIO:
            >   A patient stabilized on warfarin (INR 2.4) is prescribed a new medication.
            >   Within 5 days, their INR rises to 5.9 with bruising.
            >
            > WARFARIN INTERACTION MECHANISM REVIEW:
            >   Warfarin is metabolized primarily by CYP2C9.
            >   INHIBITORS of CYP2C9 → slow warfarin metabolism → higher warfarin levels
            >   → elevated INR → INCREASED BLEEDING RISK.
            >
            > HIGH-RISK INTERACTING ANTIBIOTICS:
            >   Metronidazole (Flagyl): CYP2C9 inhibitor + gut flora disruption → very high risk
            >   Fluconazole: CYP2C9 inhibitor → very high risk
            >   TMP/SMX (Bactrim): CYP2C9 inhibitor → significant risk
            >
            > LOWER-RISK ANTIBIOTICS WITH WARFARIN:
            >   Doxycycline: modest interaction
            >   Azithromycin: minimal interaction (some gut flora effect)
            >   Amoxicillin: mild interaction via gut flora only
            >
            > QUESTION: Which newly added antibiotic is MOST likely responsible
            >   for this patient's sudden INR increase to 5.9?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Amoxicillin — the most commonly prescribed antibiotic",
                "B) Metronidazole — a CYP2C9 inhibitor with one of the strongest warfarin interactions",
                "C) Azithromycin — a macrolide with extensive hepatic enzyme induction",
                "D) Doxycycline — a tetracycline that blocks warfarin protein binding"
            ],
            correctAnswer: "B) Metronidazole — a CYP2C9 inhibitor with one of the strongest warfarin interactions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.18
        ),

        // ── D1-C03 ── ATORVASTATIN + ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Statins — Recognizing Myopathy / Rhabdomyolysis
            >
            > CLINICAL SCENARIO:
            >   A patient on atorvastatin for 3 months reports new muscle pain,
            >   weakness, and dark (cola-colored) urine.
            >
            > STATIN ADVERSE EFFECT SPECTRUM:
            >   Myalgia: Muscle aches without CPK elevation — most common (dose-related)
            >   Myopathy: Muscle symptoms WITH elevated CPK
            >   Rhabdomyolysis: Severe muscle breakdown — CPK > 10× normal + myoglobinuria
            >     → acute kidney injury, dark urine, potentially fatal
            >     → STOP statin immediately; IV fluids; emergent care
            >
            > KEY LABORATORY MARKER:
            >   CPK (creatine phosphokinase / creatine kinase): the enzyme released
            >   from damaged muscle cells. Elevated CPK = muscle damage.
            >   Dark "tea-colored" urine = myoglobinuria (myoglobin filtered by kidneys).
            >
            > RISK FACTORS FOR STATIN MYOPATHY:
            >   — High-dose statins (simvastatin 80 mg particularly high risk)
            >   — CYP3A4 inhibitors (increase statin levels): azole antifungals,
            >     macrolides, HIV protease inhibitors, grapefruit juice
            >   — Concomitant fibrates (gemfibrozil >> fenofibrate for risk)
            >   — Hypothyroidism, renal impairment, advanced age
            >
            > QUESTION: A patient on atorvastatin presents with muscle weakness and
            >   dark urine. Which lab finding MOST directly indicates serious muscle injury?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Elevated ALT and AST — indicating hepatotoxicity from statin use",
                "B) Markedly elevated CPK (creatine phosphokinase) — indicating muscle breakdown",
                "C) Elevated TSH — indicating statin-induced hypothyroidism",
                "D) Prolonged INR — indicating coagulation impairment from liver damage"
            ],
            correctAnswer: "B) Markedly elevated CPK (creatine phosphokinase) — indicating muscle breakdown",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.22
        ),

        // ── D1-C04 ── LISINOPRIL + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: ACE Inhibitor Cough — Switching to an ARB
            >
            > CLINICAL SCENARIO:
            >   A patient with hypertension and heart failure on lisinopril develops
            >   a persistent dry cough that is affecting their sleep. The prescriber
            >   wants to maintain RAAS (renin-angiotensin-aldosterone system) blockade.
            >
            > WHY ACE INHIBITORS CAUSE COUGH:
            >   ACE inhibitors block the conversion of angiotensin I → angiotensin II,
            >   BUT they also prevent the breakdown of bradykinin.
            >   Accumulated bradykinin causes airway irritation → dry, persistent cough.
            >   Incidence: ~10–15% of patients; more common in women and Asian patients.
            >   DOES NOT indicate hypersensitivity — the drug is pharmacologically safe to continue,
            >   but if intolerable, switching is appropriate.
            >
            > ARBs (Angiotensin Receptor Blockers) DO NOT cause cough:
            >   ARBs block the AT1 receptor DOWNSTREAM.
            >   They do NOT affect ACE enzyme → bradykinin is still degraded normally.
            >   → No bradykinin accumulation → No cough.
            >
            > SWITCHING STRATEGY:
            >   ACE inhibitor → ARB (e.g., losartan, valsartan, olmesartan)
            >   Provides continued RAAS blockade with the same BP/cardiac benefits.
            >
            > QUESTION: The prescriber replaces lisinopril with another RAAS blocker
            >   that will NOT cause a cough. Which is the most appropriate choice?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Amlodipine (Norvasc) — a calcium channel blocker with no RAAS activity",
                "B) Losartan (Cozaar) — an ARB that does not affect bradykinin metabolism",
                "C) Metoprolol (Lopressor) — a beta-blocker that reduces renin release",
                "D) Hydrochlorothiazide — a diuretic that reduces plasma volume"
            ],
            correctAnswer: "B) Losartan (Cozaar) — an ARB that does not affect bradykinin metabolism",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.32
        ),

        // ── D1-C05 ── METOPROLOL + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Beta-Blocker Abrupt Withdrawal — Why It's Dangerous
            >
            > CLINICAL SCENARIO:
            >   A patient with coronary artery disease (CAD) ran out of metoprolol
            >   3 days ago and did not refill. They present to the ER with chest pain.
            >
            > MECHANISM OF REBOUND EFFECT:
            >   Chronic beta-blocker therapy causes UPREGULATION of beta-adrenergic receptors
            >   (the body compensates for blocked receptors by making more of them).
            >   Abrupt discontinuation → unblocked, upregulated receptors → sudden catecholamine
            >   hyperstimulation → rebound tachycardia, hypertension, angina, and potentially
            >   MYOCARDIAL INFARCTION or fatal arrhythmia.
            >
            > WITHDRAWAL SYNDROME — SYMPTOMS:
            >   Tachycardia (most prominent), palpitations, hypertension, diaphoresis,
            >   worsening angina, myocardial infarction, ventricular arrhythmias.
            >   Most dangerous in patients with CAD, heart failure, or tachyarrhythmias.
            >
            > TAPERING PROTOCOL:
            >   Beta-blockers should ALWAYS be tapered gradually over 1–2 weeks,
            >   NOT stopped abruptly — especially in cardiac patients.
            >
            > QUESTION: Why is abrupt discontinuation of metoprolol particularly
            >   dangerous in patients with coronary artery disease?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Abrupt withdrawal causes severe hypokalemia, increasing arrhythmia risk",
                "B) Withdrawal triggers serotonin rebound, causing rebound hypertension",
                "C) Upregulated beta-receptors become suddenly unblocked, causing rebound tachycardia and risk of MI",
                "D) Stopping abruptly causes acute kidney injury due to loss of renal vasodilation"
            ],
            correctAnswer: "C) Upregulated beta-receptors become suddenly unblocked, causing rebound tachycardia and risk of MI",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68,
            yOffset: 0.36
        ),

        // ── D1-C06 ── SERTRALINE + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: SSRI Counseling — Onset of Effect and Early Side Effects
            >
            > CLINICAL SCENARIO:
            >   A patient newly started on sertraline calls after 3 days stating
            >   the medication "isn't working" and they want to stop taking it.
            >
            > SSRI ONSET OF ACTION — KEY FACT:
            >   Antidepressant effect: 2–4 WEEKS for noticeable improvement.
            >   Full therapeutic effect: may take 6–8 weeks.
            >   Side effects (nausea, insomnia, headache, anxiety) typically appear
            >   in the FIRST 1–2 WEEKS — before the benefit kicks in.
            >   → This is the highest risk period for non-adherence and discontinuation.
            >
            > EARLY SIDE EFFECTS (expected and typically transient):
            >   Nausea (most common — take with food)
            >   Insomnia or sedation (timing of dose matters)
            >   Headache, increased anxiety, jitteriness initially
            >   Sexual dysfunction (persistent — ongoing concern)
            >
            > DISCONTINUATION SYNDROME:
            >   Abrupt stopping of SSRIs → "FINISH" symptoms:
            >   Flu-like symptoms, Insomnia, Nausea, Imbalance, Sensory disturbances,
            >   Hyperarousal. Fluoxetine (long half-life) has the lowest risk.
            >   Must taper gradually after extended use.
            >
            > QUESTION: A patient says sertraline hasn't helped their depression after
            >   4 days and they want to stop. What is the MOST accurate counseling response?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) \"You're right — if it hasn't worked in 4 days, a different medication is needed\"",
                "B) \"Antidepressant effects take 2–4 weeks to develop; give it more time before stopping\"",
                "C) \"SSRIs work immediately — you may need a higher dose if it's not working yet\"",
                "D) \"Stop taking it now and contact your doctor to try a different drug class\""
            ],
            correctAnswer: "B) \"Antidepressant effects take 2–4 weeks to develop; give it more time before stopping\"",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.33,
            yOffset: 0.44
        ),

        // ── D1-C07 ── INSULIN MIX + ──────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN MIX +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Insulin Mixing Rules — Which Insulins Can Be Combined
            >
            > THE RULE:
            >   Long-acting insulin analogs (glargine/detemir/degludec) have MODIFIED pH
            >   or chemical structures that make them INCOMPATIBLE with other insulins.
            >   Mixing precipitates the long-acting insulin, altering its absorption profile
            >   and unpredictably changing its duration of action.
            >
            > CANNOT BE MIXED:
            >   Insulin glargine (Lantus) — pH 4; precipitates at neutral pH
            >   Insulin detemir (Levemir) — acylated; structure altered by mixing
            >   Insulin degludec (Tresiba) — ultra-long acting; structure incompatible
            >   Pre-mixed insulins (70/30) — already fixed ratio; cannot adjust
            >
            > CAN BE MIXED (in the same syringe):
            >   NPH + Regular insulin: the classic combination
            >   NPH + Rapid-acting analogs (lispro, aspart): works, but less stable
            >     than NPH+Regular; some loss of rapid-acting peak (check product labeling)
            >
            > MIXING ORDER (if combining in a syringe):
            >   "Clear before cloudy"
            >   1. Draw air into syringe equal to cloudy (NPH) dose; inject into NPH vial
            >   2. Draw air equal to clear (regular/rapid) dose; inject into clear vial
            >   3. Draw up the CLEAR insulin first
            >   4. Draw up the CLOUDY insulin second
            >   Reason: Prevents contamination of clear insulin with NPH.
            >
            > QUESTION: A patient asks if they can mix their insulin glargine and
            >   regular insulin in the same syringe to save time. The correct response is:
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Yes — all insulins can be mixed as long as they are both U-100 concentration",
                "B) Yes — draw the glargine first (clear before cloudy) to prevent contamination",
                "C) No — glargine cannot be mixed with any other insulin; administer as separate injections",
                "D) Only if the total combined dose is less than 50 units per syringe"
            ],
            correctAnswer: "C) No — glargine cannot be mixed with any other insulin; administer as separate injections",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.75,
            yOffset: 0.50
        ),

        // ── D1-C08 ── ALPRAZOLAM + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Benzodiazepine Withdrawal — Why Tapering Is Critical
            >
            > CLINICAL SCENARIO:
            >   A patient has been taking alprazolam 1 mg TID for 2 years.
            >   They decide on their own to stop "cold turkey" after reading about
            >   the risks of benzodiazepine dependence.
            >
            > BENZODIAZEPINE WITHDRAWAL — MECHANISM:
            >   Chronic benzodiazepine use → DOWNREGULATION of GABA-A receptors.
            >   Abrupt removal → unchecked CNS excitation (GABA deficiency relative state).
            >   Result: The opposite of the drug's effects — hyperexcitability.
            >
            > WITHDRAWAL SYMPTOMS (by severity):
            >   Mild: Anxiety, insomnia, irritability, tremor, diaphoresis, palpitations
            >   Moderate: Nausea, vomiting, muscle cramps, photosensitivity
            >   Severe (LIFE-THREATENING): GRAND MAL SEIZURES, delirium, hyperthermia,
            >   cardiovascular collapse — similar to alcohol withdrawal
            >
            > IMPORTANT: Benzodiazepine withdrawal can be MORE DANGEROUS than opioid
            >   withdrawal — opioid withdrawal is rarely fatal; benzo withdrawal CAN be.
            >
            > TAPERING PROTOCOL:
            >   Reduce dose by ~10–25% per week over weeks to months (longer for
            >   longer-acting benzos or longer duration of use).
            >   Some protocols switch to a longer-acting benzo (diazepam) to taper.
            >
            > QUESTION: A patient abruptly stops alprazolam after 2 years of daily use.
            >   What is the MOST serious potential consequence?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Rebound anxiety only — benzodiazepine withdrawal is uncomfortable but not dangerous",
                "B) Opioid-like withdrawal syndrome with severe muscle cramps for 48 hours",
                "C) Life-threatening grand mal seizures — abrupt benzodiazepine withdrawal can be fatal",
                "D) Severe hypokalemia from excessive sweating during withdrawal"
            ],
            correctAnswer: "C) Life-threatening grand mal seizures — abrupt benzodiazepine withdrawal can be fatal",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.58
        ),

        // ── D1-C09 ── NALOXONE + ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NALOXONE +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Naloxone — Re-Narcotization Risk After Administration
            >
            > CLINICAL SCENARIO:
            >   A bystander administers an intranasal naloxone (Narcan) 4 mg spray to
            >   a person found unresponsive. The person wakes up, is alert and refuses
            >   further medical attention, saying they feel fine.
            >
            > THE RE-NARCOTIZATION PROBLEM:
            >   Naloxone half-life: 30–90 minutes (intranasal/IM).
            >   Most opioids have LONGER half-lives than naloxone:
            >   — Heroin: converts to morphine (morphine t½ ~2–4 hours)
            >   — Methadone: t½ 24–36+ hours
            >   — Extended-release oxycodone: up to 12-hour release
            >   — Fentanyl: 2–4 hours (shorter, but doses can be very high)
            >
            >   After naloxone wears off → remaining opioid in the body
            >   re-occupies receptors → patient can RELAPSE into respiratory depression.
            >   This is called RE-NARCOTIZATION (or re-sedation).
            >
            > WHAT HAPPENS AFTER NALOXONE WEARS OFF?
            >   The opioid is still circulating. The patient "feels fine" while
            >   naloxone is active — this is a false sense of safety.
            >
            > STANDARD OF CARE AFTER NALOXONE:
            >   ALWAYS call 911 (emergency services).
            >   Patient needs monitoring for at least 4 hours in a medical facility.
            >   Repeat doses of naloxone may be needed (every 2–3 minutes if no response,
            >   or when re-narcotization occurs).
            >
            > QUESTION: After administering Narcan and the patient wakes up, what
            >   is the MOST important next action?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Discharge — the patient is awake and the emergency has passed",
                "B) Give a second Narcan dose immediately as a precaution, then discharge",
                "C) Call 911 — naloxone wears off faster than most opioids and re-narcotization can occur",
                "D) Administer activated charcoal to prevent further opioid absorption"
            ],
            correctAnswer: "C) Call 911 — naloxone wears off faster than most opioids and re-narcotization can occur",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.64
        ),

        // ── D1-C10 ── DIGOXIN + ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Digoxin + Furosemide — Electrolyte Connection
            >
            > CLINICAL SCENARIO:
            >   A patient with heart failure is on both digoxin (Lanoxin) and furosemide
            >   (Lasix). The prescriber adds an oral potassium supplement to the regimen.
            >
            > THE ELECTROLYTE CONNECTION:
            >   Digoxin binds Na+/K+-ATPase. When extracellular K+ is LOW (hypokalemia),
            >   more receptor sites are available for digoxin binding → HIGHER effective
            >   digoxin activity → toxicity even at "therapeutic" serum levels.
            >
            >   Furosemide (loop diuretic) → WASTES potassium → hypokalemia.
            >   Hypokalemia from furosemide → potentiates digoxin toxicity.
            >
            > CLINICAL PEARL:
            >   This is why patients on BOTH digoxin AND a loop diuretic should ALWAYS
            >   have their potassium monitored and supplemented if needed.
            >   A K+ of 3.0 mEq/L with a "normal" digoxin level can still cause toxicity.
            >
            > ALSO WATCH:
            >   Magnesium depletion (also from loop diuretics) worsens digoxin toxicity.
            >   Hypomagnesemia → difficulty correcting hypokalemia.
            >
            > QUESTION: Why does a patient on digoxin AND furosemide require concurrent
            >   potassium supplementation?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Digoxin itself directly depletes serum potassium through its ATPase mechanism",
                "B) Furosemide-induced hypokalemia potentiates digoxin toxicity by increasing receptor binding",
                "C) Potassium improves GI absorption of digoxin tablets when levels are low",
                "D) Furosemide raises digoxin serum levels by competing for renal tubular secretion"
            ],
            correctAnswer: "B) Furosemide-induced hypokalemia potentiates digoxin toxicity by increasing receptor binding",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.72
        ),

        // ── D1-C11 ── METHOTREXATE + ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METHOTREXATE +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Methotrexate — Folic Acid Co-Prescribing and NSAID Interaction
            >
            > CLINICAL SCENARIO A — FOLIC ACID:
            >   A patient with RA is on weekly methotrexate 15 mg and calls complaining
            >   of mouth sores (stomatitis) and nausea. They were not prescribed folic acid.
            >
            > WHY FOLIC ACID IS CO-PRESCRIBED:
            >   MTX inhibits DHFR → depletes folate → mouth sores, nausea, GI upset,
            >   and hepatotoxicity are folate-deficiency related adverse effects.
            >   Folic acid 1 mg/day REPLENISHES folate, reducing toxicity WITHOUT
            >   significantly reducing MTX's anti-inflammatory efficacy.
            >   (The anti-inflammatory mechanism does not depend solely on folate depletion.)
            >
            > CLINICAL SCENARIO B — NSAID INTERACTION:
            >   The same patient also takes ibuprofen 400 mg PRN for pain.
            >
            > WHY NSAIDs ARE DANGEROUS WITH METHOTREXATE:
            >   NSAIDs inhibit prostaglandin-mediated renal afferent arteriolar dilation.
            >   → Reduced renal blood flow → reduced MTX renal tubular secretion
            >   → MTX accumulates → TOXICITY (myelosuppression, mucositis, hepatotoxicity).
            >   This interaction can be FATAL at even low MTX doses.
            >
            > QUESTION: Why is folic acid prescribed alongside methotrexate for RA?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Folic acid potentiates the anti-inflammatory effect of methotrexate",
                "B) Folic acid reduces methotrexate toxicity (mucositis, nausea) without significantly reducing its efficacy",
                "C) Folic acid prevents the drug interaction between methotrexate and NSAIDs",
                "D) Folic acid improves oral absorption of methotrexate tablets when taken together"
            ],
            correctAnswer: "B) Folic acid reduces methotrexate toxicity (mucositis, nausea) without significantly reducing its efficacy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.78
        ),

        // ── D1-C12 ── NITROGLYCERIN + ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NITROGLYCERIN +",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY — ADVANCED
            > TOPIC: Sublingual NTG — The 3-Dose / 5-Minute Protocol
            >
            > CLINICAL SCENARIO:
            >   A patient takes one sublingual nitroglycerin for acute chest pain.
            >   After 5 minutes, the pain has not resolved. They call the pharmacy
            >   asking what to do next.
            >
            > STANDARD SUBLINGUAL NTG DOSING PROTOCOL:
            >   At onset of angina:
            >   1. Sit or lie down first (prevent fainting from hypotension).
            >   2. Place ONE tablet under the tongue.
            >   3. Wait 5 MINUTES.
            >   4. If pain persists: take a SECOND tablet; wait 5 more minutes.
            >   5. If pain STILL persists: take a THIRD tablet; wait 5 more minutes.
            >   6. If pain has NOT resolved after 3 tablets (15 minutes total):
            >      CALL 911 IMMEDIATELY — this may be an acute MI.
            >
            > DO NOT drive yourself to the ER.
            > DO NOT take more than 3 doses without emergency assistance.
            >
            > TOLERANCE:
            >   Headache is expected (vasodilation) — is NOT a reason to stop.
            >   Takes 10–12 headache-free hours off nitrates to prevent tolerance
            >   (patch-off period at night for patients on long-acting nitrates).
            >
            > STORAGE REMINDER:
            >   SL NTG tablets begin to lose potency once opened; replace after 6 months.
            >   Lack of burning under the tongue may indicate loss of potency.
            >
            > QUESTION: A patient's chest pain is not relieved after one SL nitroglycerin
            >   tablet. What is the correct next step?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Drive immediately to the emergency room — one tablet should have worked",
                "B) Wait 30 minutes before taking a second dose to prevent dangerous hypotension",
                "C) Take a second tablet after 5 minutes; if no relief after 3 total tablets, call 911",
                "D) Take two tablets simultaneously for faster relief of the unresolved pain"
            ],
            correctAnswer: "C) Take a second tablet after 5 minutes; if no relief after 3 total tablets, call 911",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.85
        )

    ] // end challengeNodes_D1

    // MARK: - Challenge Nodes: Domain 2 (6 nodes)

    static let challengeNodes_D2: [DataNode] = [

        // ── D2-C01 ── DEA SCHEDULES + ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DEA SCHEDULES +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: Schedule Application — Hydrocodone Combination Products
            >
            > CLINICAL SCENARIO:
            >   A prescriber writes for "hydrocodone/acetaminophen 5/325 mg, Disp #30,
            >   Sig: 1 tab q6h PRN pain, Refills: 3" for a patient post-surgery.
            >
            > CRITICAL HISTORY:
            >   Prior to October 6, 2014: Hydrocodone combination products (Vicodin,
            >   Norco, Lortab) were Schedule III — up to 5 refills in 6 months.
            >
            >   As of October 6, 2014: ALL hydrocodone-containing products
            >   (including combinations) were rescheduled to SCHEDULE II.
            >
            >   Therefore: Hydrocodone/APAP = CII = ZERO refills.
            >   The "Refills: 3" on this prescription is ILLEGAL and must be rejected.
            >
            > OTHER COMMON CII DRUGS (PTCB frequently tests classification):
            >   Oxycodone (OxyContin, Percocet), fentanyl (Duragesic), morphine,
            >   hydromorphone (Dilaudid), methadone (as analgesic),
            >   methylphenidate (Ritalin), amphetamine salts (Adderall), cocaine (topical)
            >
            > QUESTION: A prescriber writes hydrocodone/APAP with "3 refills."
            >   What is the pharmacist's required action?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Fill as written — hydrocodone combinations are Schedule III and allow refills",
                "B) Dispense the initial fill only and contact the prescriber — refills are not permitted for Schedule II",
                "C) Fill with 1 refill — the maximum allowed for a recently rescheduled substance",
                "D) Dispense all 3 refills upfront as a 90-day supply to comply with patient needs"
            ],
            correctAnswer: "B) Dispense the initial fill only and contact the prescriber — refills are not permitted for Schedule II",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.14
        ),

        // ── D2-C02 ── HIPAA PHI + ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "HIPAA PHI +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: HIPAA — Disclosing PHI Without Patient Authorization
            >
            > CLINICAL SCENARIO:
            >   A patient's adult daughter calls the pharmacy asking for a list of her
            >   father's current medications. She says she is his primary caregiver.
            >   The father has not provided written authorization or named her as a
            >   personal representative on file.
            >
            > HIPAA MINIMUM NECESSARY STANDARD:
            >   PHI may only be shared with those who have a NEED TO KNOW and only
            >   the minimum information necessary.
            >
            > WHO MAY RECEIVE PHI WITHOUT SEPARATE AUTHORIZATION:
            >   — The patient themselves
            >   — Designated personal representatives (with documented authorization)
            >   — Healthcare providers directly involved in the patient's care
            >   — Insurers for payment/treatment purposes
            >
            > WHO MAY NOT RECEIVE PHI WITHOUT AUTHORIZATION:
            >   — Family members (even adult children) — UNLESS the patient has
            >     given permission or is incapacitated and family involvement is
            >     in the patient's best interest (professional judgment applies)
            >   — Friends, neighbors, coworkers
            >   — Law enforcement (with narrow exceptions)
            >
            > THE CORRECT ACTION IN THIS SCENARIO:
            >   Politely decline; explain the pharmacy cannot share the information
            >   without the patient's authorization. Offer to have the patient call
            >   or come in to provide verbal or written permission.
            >
            > QUESTION: What is the correct action when the patient's daughter
            >   requests the medication list without prior patient authorization?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Provide the list — adult family members are always permitted to receive PHI",
                "B) Email the medication list to the daughter for her records",
                "C) Decline and explain that patient authorization is required before sharing the information",
                "D) Provide the non-controlled medications only — controlled substances are the only protected PHI"
            ],
            correctAnswer: "C) Decline and explain that patient authorization is required before sharing the information",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.26
        ),

        // ── D2-C03 ── OBRA '90 + ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "OBRA '90 +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: OBRA '90 — What the Pharmacist Must OFFER to Counsel
            >
            > CLINICAL SCENARIO:
            >   A Medicaid patient picks up a new prescription. The pharmacy is busy.
            >   A technician tells the patient "here are your pills" and sends them on
            >   their way without any offer of counseling.
            >
            > OBRA '90 COUNSELING REQUIREMENTS FOR MEDICAID PATIENTS:
            >   Pharmacists must OFFER to counsel on EVERY new prescription.
            >   (Refills require offer of counseling if significant change occurred.)
            >   The patient may REFUSE the offer — but the offer MUST be made.
            >
            > WHAT THE PHARMACIST MUST OFFER TO DISCUSS:
            >   1. Name and description of the medication
            >   2. Dosage form, dose, route, and duration of therapy
            >   3. Intended use / therapeutic purpose
            >   4. Special directions / precautions for use
            >   5. Common severe side effects and interactions
            >   6. Techniques for self-monitoring
            >   7. Proper storage
            >   8. Refill information
            >   9. What to do in the event of a missed dose
            >
            > PHARMACY TECHNICIAN ROLE:
            >   Technicians may NOT legally perform the OBRA counseling — that is the
            >   RPh's responsibility. However, technicians must ensure the patient is
            >   directed to the pharmacist for counseling before they leave.
            >
            > QUESTION: Under OBRA '90, a new Medicaid prescription is being dispensed.
            >   What is the pharmacist's MINIMUM legal obligation?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Counsel only if the patient specifically requests information about the medication",
                "B) Provide a written medication information sheet with every new prescription",
                "C) Offer to counsel the patient; document the offer even if the patient declines",
                "D) Counseling is required only for Schedule II controlled substances under OBRA"
            ],
            correctAnswer: "C) Offer to counsel the patient; document the offer even if the patient declines",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.42,
            yOffset: 0.40
        ),

        // ── D2-C04 ── DSCSA + ────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DSCSA +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: DSCSA — Transaction Documents and Product Tracing
            >
            > CLINICAL SCENARIO:
            >   A pharmacy receives a shipment of prescription medications from a
            >   wholesale distributor. The delivery arrives with the packages but
            >   without the required documentation.
            >
            > DSCSA "T3" DOCUMENTS — REQUIRED WITH EVERY TRANSFER:
            >   The Drug Supply Chain Security Act (DSCSA) requires that three
            >   documents accompany every transfer of prescription drugs:
            >
            >   TI — Transaction Information:
            >     Product name, strength, dosage form, NDC, container size,
            >     number of containers, lot number, transaction date, business names
            >     and addresses of the transferor and transferee.
            >
            >   TH — Transaction History:
            >     Complete prior transaction history back to the ORIGINAL manufacturer.
            >     (Required until November 2024; then electronic tracing takes over)
            >
            >   TS — Transaction Statement:
            >     A statement certifying that the transferor is authorized to distribute
            >     and that the product is not known to be counterfeit or illegitimate.
            >
            > WHEN DOCUMENTS ARE MISSING:
            >   The pharmacy should NOT accept the shipment OR quarantine and hold
            >   the product until legitimate documentation is received.
            >   Accepting a shipment without T3 documentation is a DSCSA violation.
            >
            > QUESTION: A shipment of prescription drugs arrives without the required
            >   DSCSA documentation. What should the pharmacy do?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Accept the shipment and request the documentation within 30 days",
                "B) Accept the shipment — DSCSA documentation is only required for controlled substances",
                "C) Refuse to accept or quarantine the shipment until valid T3 documentation is provided",
                "D) Accept the shipment but immediately file a DEA Form 106 (theft/loss report)"
            ],
            correctAnswer: "C) Refuse to accept or quarantine the shipment until valid T3 documentation is provided",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.56
        ),

        // ── D2-C05 ── DRUG RECALLS + ─────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "DRUG RECALLS +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: Drug Recall Classes — Recognizing Urgency and Required Actions
            >
            > RECALL CLASSES — DEFINED BY FDA:
            >
            >   CLASS I (Most Urgent):
            >     Reasonable probability that using or being exposed to the product
            >     will cause serious adverse health consequences or DEATH.
            >     EXAMPLES: Contaminated injectables, wrong drug in packaging,
            >     potency far outside specifications for a critical medication.
            >     ACTION: IMMEDIATE removal from shelves; contact ALL patients who
            >     received the product; report to state pharmacy board.
            >
            >   CLASS II (Moderate Urgency):
            >     May cause temporary adverse health consequences, but the probability
            >     of serious harm is remote.
            >     EXAMPLES: Minor labeling errors, minor potency deviations.
            >     ACTION: Remove from dispensing; contact patients as indicated.
            >
            >   CLASS III (Least Urgent):
            >     Unlikely to cause adverse health consequences.
            >     EXAMPLES: Cosmetic defects (color variation), minor packaging issues.
            >     ACTION: Remove from dispensing; patient notification typically not required.
            >
            > MARKET WITHDRAWAL vs. RECALL:
            >   Market withdrawal: Voluntary removal by the manufacturer for reasons
            >   not related to a safety defect (reformulation, minor quality issue).
            >
            > QUESTION: A pharmacy receives a Class I recall notice for an anticoagulant
            >   tablet that was packaged at twice the intended dose. What is required?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Remove from dispensing shelves only — patient notification is optional for recalls",
                "B) File the notice and monitor for adverse event reports before taking action",
                "C) Remove immediately from dispensing stock AND notify all patients who received the recalled lot",
                "D) Continue dispensing until replacement stock arrives — Class I recalls have a 30-day grace period"
            ],
            correctAnswer: "C) Remove immediately from dispensing stock AND notify all patients who received the recalled lot",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.72
        ),

        // ── D2-C06 ── REMS + ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .federalRequirements,
            nodeTitle: "REMS +",
            loreText: """
            > SECTOR-02 // FEDERAL_LAW — ADVANCED
            > TOPIC: REMS — Elements Beyond Labeling (ETASU)
            >
            > CLINICAL SCENARIO:
            >   A pharmacy receives a prescription for clozapine (Clozaril) for a new
            >   patient. Clozapine is subject to a REMS with ETASU. The pharmacy is NOT
            >   currently enrolled as a certified REMS pharmacy for this drug.
            >
            > REMS — RISK EVALUATION AND MITIGATION STRATEGY:
            >   FDA-required program for drugs with serious known risks that require
            >   active management beyond standard labeling.
            >
            > ETASU — ELEMENTS TO ASSURE SAFE USE:
            >   The most restrictive REMS elements. May include ANY combination of:
            >   — Healthcare provider (prescriber) certification / training
            >   — Pharmacy certification (enrollment required to dispense)
            >   — Patient enrollment / registry
            >   — Monitoring laboratory tests before dispensing (e.g., ANC for clozapine)
            >   — Controlled distribution to certified sites only
            >
            > CLOZAPINE REMS SPECIFICS:
            >   Clozapine → severe risk of AGRANULOCYTOSIS (dangerous drop in ANC).
            >   REMS requires: prescriber certification, pharmacy certification, AND
            >   ANC (absolute neutrophil count) monitoring before each dispense.
            >   Pharmacy cannot dispense without a verified current ANC on file.
            >
            > QUESTION: Can a pharmacy that is NOT enrolled in the clozapine REMS
            >   dispense a clozapine prescription?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Yes — any licensed pharmacy may dispense any FDA-approved drug",
                "B) Yes — but only for a 3-day emergency supply while enrollment is processed",
                "C) No — clozapine may only be dispensed by pharmacies certified in the REMS program",
                "D) Yes — REMS certification is only required for the prescriber, not the pharmacy"
            ],
            correctAnswer: "C) No — clozapine may only be dispensed by pharmacies certified in the REMS program",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.86
        )

    ] // end challengeNodes_D2

    // MARK: - Challenge Nodes: Domain 3 (6 nodes)

    static let challengeNodes_D3: [DataNode] = [

        // ── D3-C01 ── HIGH-ALERT MEDS + ──────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "HIGH-ALERT MEDS +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: High-Alert Medications — Insulin Preparation Safety
            >
            > CLINICAL SCENARIO:
            >   A nurse requests "1 unit" of insulin for a patient's bedside blood
            >   glucose correction. A new technician prepares the dose in a standard
            >   3 mL syringe, drawing up to the 1 mL mark, thinking "1 unit = 1 mL."
            >
            > THE CRITICAL ERROR:
            >   1 unit ≠ 1 mL.
            >   Insulin U-100: 100 units per mL.
            >   Drawing 1 mL of U-100 insulin = 100 units — 100× the ordered dose.
            >   This is a potentially fatal 100-fold overdose.
            >
            > PROPER EQUIPMENT:
            >   Insulin MUST be prepared in a U-100 INSULIN SYRINGE (orange cap).
            >   U-100 insulin syringes are marked in UNITS (not mL).
            >   Available in: 30-unit, 50-unit, and 100-unit sizes.
            >   Use the smallest syringe appropriate for the dose (improves accuracy).
            >
            > U-500 INSULIN DANGER:
            >   Insulin U-500 (Humulin R U-500): 500 units/mL — 5× more concentrated.
            >   Requires a dedicated U-500 syringe (gray cap) or insulin pen.
            >   Using a standard U-100 syringe for U-500 = 5× overdose.
            >
            > INDEPENDENT DOUBLE-CHECK:
            >   Insulin is on the ISMP high-alert list. ALL insulin preparations should
            >   undergo independent pharmacist verification before dispensing.
            >
            > QUESTION: Which action is MOST important when preparing an insulin dose
            >   to prevent a measurement error?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Use a 3 mL standard syringe — it allows more precise measurement than insulin syringes",
                "B) Use a U-100 insulin syringe calibrated in units, and verify the dose with an independent check",
                "C) Measure insulin in mL using a 1 mL tuberculin syringe for accuracy",
                "D) Estimate the dose visually — small insulin doses are difficult to measure precisely"
            ],
            correctAnswer: "B) Use a U-100 insulin syringe calibrated in units, and verify the dose with an independent check",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.11
        ),

        // ── D3-C02 ── LASA DRUGS + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "LASA DRUGS +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: LASA — Identifying Specific High-Risk Pairs
            >
            > CONTEXT:
            >   Look-Alike/Sound-Alike (LASA) drugs are one of the most common sources
            >   of medication errors. The ISMP maintains a targeted list of LASA pairs
            >   that require active error prevention (Tall Man lettering, physical separation,
            >   barcode scanning at dispensing and administration).
            >
            > HIGH-YIELD ISMP LASA PAIRS (with Tall Man lettering):
            >   hydrALAZINE vs. hydrOXYzine
            >   (antihypertensive vs. antihistamine/anxiolytic — very different uses)
            >
            >   vinBLAStine vs. vinCRIStine
            >   (both are vinca alkaloid chemotherapy agents — a historically fatal mix-up;
            >   different dosing and toxicity profiles)
            >
            >   CARBOplatin vs. CISplatin
            >   (both platinums but very different doses — cisplatin 10x overdose reported)
            >
            >   ZyPREXA (olanzapine) vs. ZyrTEC (cetirizine)
            >   (antipsychotic vs. antihistamine — brand name confusion)
            >
            >   PredniSONE vs. methylPREDNISolone
            >   (different potencies and dosing)
            >
            >   metFORMIN vs. metRONIDAZOLE vs. metOPROLOL
            >   (all start with "met" — must verify complete drug name)
            >
            > QUESTION: Which is an example of a classic LASA pair that Tall Man
            >   lettering specifically helps distinguish?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Lisinopril and losartan — both ARBs starting with the letter L",
                "B) HydrALAZINE and hydrOXYzine — different drug classes with very similar names",
                "C) Atorvastatin and rosuvastatin — both statins with similar endings",
                "D) Metoprolol succinate and metoprolol tartrate — same drug, different salts"
            ],
            correctAnswer: "B) HydrALAZINE and hydrOXYzine — different drug classes with very similar names",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.22
        ),

        // ── D3-C03 ── 5 RIGHTS + ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "5 RIGHTS +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: Five Rights — Scenario-Based Application
            >
            > THE FIVE RIGHTS (plus extended rights):
            >   Right PATIENT — Verify at least 2 patient identifiers
            >   Right DRUG — Correct medication name (generic and/or brand)
            >   Right DOSE — Correct amount per administration
            >   Right ROUTE — Correct administration route (PO, IV, SQ, topical, etc.)
            >   Right TIME — Correct frequency and timing
            >
            >   Extended Rights (also PTCB-tested):
            >   Right DOCUMENTATION — record administered as given
            >   Right REASON — appropriate indication for this patient
            >   Right TO REFUSE — patient autonomy
            >
            > APPLYING THE FIVE RIGHTS TO ERRORS:
            >   Each type of dispensing or administration error violates a specific Right:
            >
            >   "Wrong patient received the drug" → Right PATIENT
            >   "Patient received 500 mg instead of 250 mg" → Right DOSE
            >   "Oral tablet was crushed and given IV" → Right ROUTE
            >   "Morning medication given at night" → Right TIME
            >   "Metoprolol dispensed instead of metformin" → Right DRUG
            >
            > QUESTION: A pharmacy fills a prescription for lisinopril 40 mg but the
            >   prescription was written for lisinopril 20 mg. Which Right was violated?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Right Patient — the medication was dispensed to the wrong individual",
                "B) Right Drug — lisinopril is the wrong drug class for this condition",
                "C) Right Dose — 40 mg was dispensed instead of the prescribed 20 mg",
                "D) Right Time — the medication was filled before the refill was due"
            ],
            correctAnswer: "C) Right Dose — 40 mg was dispensed instead of the prescribed 20 mg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.38
        ),

        // ── D3-C04 ── NTI DRUGS + ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "NTI DRUGS +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: NTI Drugs — Why Generic Substitution Requires Extra Caution
            >
            > CLINICAL SCENARIO:
            >   A patient stabilized on brand-name Synthroid (levothyroxine) 100 mcg
            >   has their prescription switched to a different manufacturer's generic
            >   at refill due to a formulary change. Two weeks later, TSH is out of range.
            >
            > WHY NTI MATTERS FOR SUBSTITUTION:
            >   Narrow Therapeutic Index (NTI) drugs: small differences in bioavailability
            >   can cause clinically significant changes in drug effect.
            >   FDA allows generic bioequivalence range of 80–125% of the reference product.
            >   For most drugs, this range is clinically acceptable.
            >   For NTI drugs, even within this range, a shift can push patients into
            >   toxicity OR sub-therapeutic range.
            >
            > LEVOTHYROXINE SPECIFICALLY:
            >   Multiple manufacturers have different formulations.
            >   The FDA has issued guidance that levothyroxine products are NOT
            >   interchangeable without monitoring (some states restrict substitution).
            >   ENDOCRINE SOCIETY position: if switching is done, recheck TSH in 6 weeks.
            >
            > OTHER KEY NTI DRUGS (PTCB high-yield list):
            >   Warfarin (Coumadin) — INR monitoring essential when switching
            >   Digoxin (Lanoxin) — narrow range 0.5–2 ng/mL
            >   Phenytoin (Dilantin) — nonlinear kinetics amplify any bioavailability shift
            >   Lithium — 0.6–1.2 mEq/L therapeutic; >1.5 toxic
            >   Cyclosporine (Sandimmune, Neoral) — immunosuppressant; transplant rejection risk
            >   Carbamazepine (Tegretol) — antiepileptic
            >
            > QUESTION: Why is it clinically concerning when a patient's levothyroxine
            >   is switched from one manufacturer's product to another?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Generic levothyroxine products contain different active ingredients",
                "B) As a narrow therapeutic index drug, even small bioavailability differences between manufacturers can shift TSH out of range",
                "C) Levothyroxine generics are never AB-rated and cannot legally be substituted",
                "D) Brand-name Synthroid contains a unique proprietary additive that generics lack"
            ],
            correctAnswer: "B) As a narrow therapeutic index drug, even small bioavailability differences between manufacturers can shift TSH out of range",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.56
        ),

        // ── D3-C05 ── BUD + ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BUD +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: Beyond-Use Dating — USP 797 Category 1 CSP Application
            >
            > CLINICAL SCENARIO:
            >   A hospital pharmacy compounds a Category 1 sterile preparation (CSP)
            >   in an ISO 5 laminar airflow workbench at 10:00 AM.
            >   The preparation is placed in the medication room refrigerator.
            >
            > USP 797 (2023) — CATEGORY 1 CSP BUD:
            >   Category 1 = NO sterility testing or environmental monitoring data
            >   that would support a longer BUD.
            >
            >   At CONTROLLED ROOM TEMPERATURE (CRT, 20–25°C):  ≤ 12 HOURS
            >   REFRIGERATED (2–8°C):                           ≤ 24 HOURS
            >
            > CATEGORY 2 CSPs:
            >   Extended BUDs are allowed only with documentation:
            >   — Facility-specific sterility testing
            >   — Ongoing environmental monitoring data
            >   — Validated compounding procedures
            >   Category 2 BUDs can extend to days–weeks (per USP 797 tables).
            >
            > PRACTICAL IMPLICATION:
            >   Most hospital-compounded IVs (antibiotics, small-volume parenterals)
            >   made in a standard clean room and not tested are Category 1.
            >   A bag made in the morning must be used or discarded by that evening
            >   (12h at room temp) or the next morning (24h refrigerated).
            >
            > QUESTION: A Category 1 CSP is prepared at 10:00 AM and stored in the
            >   refrigerator at 4°C. What is the LATEST time it can be administered?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 10:00 PM the same day — 12 hours maximum for refrigerated Category 1 CSPs",
                "B) 10:00 AM the next day — 24 hours maximum for refrigerated Category 1 CSPs",
                "C) 10:00 AM three days later — refrigeration extends all CSP BUDs to 72 hours",
                "D) 7 days from preparation — standard hospital IV expiration for refrigerated products"
            ],
            correctAnswer: "B) 10:00 AM the next day — 24 hours maximum for refrigerated Category 1 CSPs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.72
        ),

        // ── D3-C06 ── BEERS CRITERIA + ───────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .patientSafety,
            nodeTitle: "BEERS CRITERIA +",
            loreText: """
            > SECTOR-03 // SAFETY_OPS — ADVANCED
            > TOPIC: Beers Criteria — Clinical Application in a Patient Scenario
            >
            > CLINICAL SCENARIO:
            >   A 78-year-old patient with chronic lower back pain, anxiety, and insomnia
            >   presents with a medication profile including:
            >   — Cyclobenzaprine (Flexeril) 5 mg TID PRN pain
            >   — Diphenhydramine (Benadryl) 50 mg QHS for sleep
            >   — Alprazolam (Xanax) 0.5 mg QHS for anxiety
            >
            > BEERS ANALYSIS — ALL THREE ARE PROBLEMATIC IN THIS PATIENT:
            >
            >   Cyclobenzaprine: On Beers — muscle relaxants are poorly tolerated in elderly;
            >     highly anticholinergic, sedating, associated with falls and fractures.
            >     AVOID in adults ≥ 65.
            >
            >   Diphenhydramine: On Beers — strong anticholinergic agent; causes confusion,
            >     urinary retention, constipation, and is a major fall risk.
            >     AVOID in adults ≥ 65. (Melatonin or low-dose doxepin are safer alternatives.)
            >
            >   Alprazolam: On Beers — ALL benzodiazepines (short, intermediate, and long-acting)
            >     are on the Beers list; cause cognitive impairment, delirium, and falls.
            >     AVOID in adults ≥ 65.
            >
            > ALSO NOTE: This patient is at HIGH RISK for FALLS due to the combination
            >   of multiple CNS depressants (triple sedation hazard).
            >
            > QUESTION: Which of the following medications in this patient's profile is
            >   the MOST concerning according to the Beers Criteria?
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Lisinopril for blood pressure — ACE inhibitors cause hypokalemia in the elderly",
                "B) All three — cyclobenzaprine, diphenhydramine, and alprazolam are all on the Beers Criteria",
                "C) Only the diphenhydramine — benzodiazepines are generally safe in controlled doses",
                "D) None — the Beers Criteria only applies to patients in long-term care facilities"
            ],
            correctAnswer: "B) All three — cyclobenzaprine, diphenhydramine, and alprazolam are all on the Beers Criteria",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.88
        )

    ] // end challengeNodes_D3

    // MARK: - Challenge Nodes: Domain 4 (6 nodes)

    static let challengeNodes_D4: [DataNode] = [

        // ── D4-C01 ── DAYS SUPPLY + ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "DAYS SUPPLY +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: Days' Supply — Insulin Vial Calculation
            >
            > SETUP:
            >   Insulin U-100 = 100 units per mL.
            >   Standard insulin vial = 10 mL → 10 mL × 100 units/mL = 1,000 units total.
            >
            > FORMULA:
            >   Days' Supply = Total Units in Package ÷ Units Used per Day
            >
            > WORKED EXAMPLE:
            >   Insulin glargine U-100 (one 10 mL vial).
            >   Sig: Inject 30 units subcutaneously at bedtime daily.
            >   Days' supply = 1,000 ÷ 30 = 33.3 → round DOWN to 33 days.
            >
            > INSURANCE BILLING NOTE:
            >   Always round DOWN (you cannot dispense a partial day's supply).
            >   Use the maximum possible daily dose for PRN medications.
            >
            > > QUERY: A patient is prescribed insulin glargine U-100.
            > > Sig: Inject 45 units subcutaneously at bedtime daily.
            > > One 10 mL vial is dispensed. How many days will the vial last?
            > > [1,000 units total ÷ 45 units/day]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 15 days",
                "B) 22 days",
                "C) 30 days",
                "D) 45 days"
            ],
            correctAnswer: "B) 22 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.11
        ),

        // ── D4-C02 ── IV FLOW RATE + ──────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "IV FLOW RATE +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: IV Flow Rate — mL/hr from Volume and Time
            >
            > FORMULA:
            >   Flow Rate (mL/hr) = Volume (mL) ÷ Time (hr)
            >
            >   For drip rate in gtt/min (gravity infusion):
            >   Drip Rate (gtt/min) = [Volume (mL) × Drop Factor (gtt/mL)] ÷ Time (min)
            >
            > COMMON DROP FACTORS:
            >   Macrodrip sets: 10, 15, or 20 gtt/mL (used for most adults)
            >   Microdrip sets: 60 gtt/mL (used for pediatrics or precise small volumes)
            >
            > WORKED EXAMPLE:
            >   Vancomycin 1 g in 250 mL NS, infuse over 2 hours.
            >   Flow Rate = 250 mL ÷ 2 hr = 125 mL/hr
            >
            > VANCOMYCIN INFUSION NOTE:
            >   Minimum infusion time = 60 minutes (to prevent Red Man Syndrome).
            >   For doses > 1 g, infuse over longer (e.g., 1.5–2 g over 2–3 hours).
            >
            > > QUERY: A patient is ordered piperacillin/tazobactam 4.5 g in 100 mL NS
            > > to infuse over 30 minutes. What is the flow rate in mL/hr?
            > > [Hint: Convert 30 min to hours, then divide volume by time in hours]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 100 mL/hr",
                "B) 150 mL/hr",
                "C) 200 mL/hr",
                "D) 400 mL/hr"
            ],
            correctAnswer: "C) 200 mL/hr",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.22
        ),

        // ── D4-C03 ── WEIGHT-BASED DOSE + ────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "WEIGHT-BASED DOSE +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: Pediatric Weight-Based Dosing — mg/kg to mL
            >
            > MULTI-STEP APPROACH:
            >   Step 1: Convert weight from lbs to kg (÷ 2.2)
            >   Step 2: Calculate total DAILY dose (mg/kg/day × kg = mg/day)
            >   Step 3: Divide by frequency to get PER-DOSE amount (mg/dose)
            >   Step 4: Convert mg to mL using the suspension concentration
            >           Volume (mL) = Dose (mg) ÷ Concentration (mg/mL)
            >
            > WORKED EXAMPLE:
            >   Patient: 33 lbs; Amoxicillin suspension 250 mg/5 mL
            >   Dose: 40 mg/kg/day divided TID
            >   Step 1: 33 lbs ÷ 2.2 = 15 kg
            >   Step 2: 40 mg/kg/day × 15 kg = 600 mg/day
            >   Step 3: 600 ÷ 3 (TID) = 200 mg/dose
            >   Step 4: 200 mg × (5 mL / 250 mg) = 4 mL per dose
            >
            > > QUERY: A child weighs 44 lbs and is prescribed amoxicillin
            > > 40 mg/kg/day divided every 8 hours.
            > > Available: amoxicillin suspension 400 mg/5 mL.
            > > How many mL should be given per dose?
            > > [Step 1: lbs→kg | Step 2: daily dose | Step 3: per-dose | Step 4: mL]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 2.5 mL",
                "B) 5 mL",
                "C) 7.5 mL",
                "D) 10 mL"
            ],
            correctAnswer: "B) 5 mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.36
        ),

        // ── D4-C04 ── ALLIGATION + ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "ALLIGATION +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: Alligation — Preparing Dextrose Solutions
            >
            > ALLIGATION METHOD REVIEW:
            >   Used to find how much of two different concentrations to combine
            >   to make a desired intermediate concentration.
            >
            >   Higher %  ╲               Parts of higher = Desired − Lower
            >              ╲  Desired %
            >   Lower %   ╱               Parts of lower  = Higher − Desired
            >
            >   Ratio of higher : lower = (Desired−Lower) : (Higher−Desired)
            >   Total parts = sum of both ratios
            >   mL of each = (parts / total parts) × final volume
            >
            > WORKED EXAMPLE:
            >   Make 500 mL of D20W from D70W and sterile water (D0W).
            >   Parts of D70W:    20 − 0  = 20 parts
            >   Parts of D0W:     70 − 20 = 50 parts
            >   Total parts: 70
            >   mL of D70W:  (20/70) × 500 = 142.9 mL ≈ 143 mL
            >   mL of water: (50/70) × 500 = 357.1 mL ≈ 357 mL
            >   Check: 143 + 357 = 500 mL ✓
            >
            > > QUERY: Using alligation, how many mL of D70W are needed to
            > > prepare 1,000 mL of D10W? (Available: D70W and sterile water)
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 100 mL of D70W + 900 mL of water",
                "B) 143 mL of D70W + 857 mL of water",
                "C) 200 mL of D70W + 800 mL of water",
                "D) 250 mL of D70W + 750 mL of water"
            ],
            correctAnswer: "B) 143 mL of D70W + 857 mL of water",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.52
        ),

        // ── D4-C05 ── PERCENT STRENGTH + ─────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "PERCENT STRENGTH +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: Percent Strength — Calculating w/v from Grams and Volume
            >
            > PERCENT WEIGHT-IN-VOLUME (% w/v):
            >   Definition: grams of solute per 100 mL of solution.
            >   % w/v = (grams of solute ÷ mL of solution) × 100
            >
            > WORKED EXAMPLE 1 (% from known values):
            >   240 mL of solution contains 7.2 g of active ingredient.
            >   % w/v = (7.2 ÷ 240) × 100 = 0.03 × 100 = 3%
            >
            > WORKED EXAMPLE 2 (grams from percent and volume):
            >   How many grams are in 500 mL of a 2% solution?
            >   Grams = (% ÷ 100) × volume = 0.02 × 500 = 10 g
            >
            > WORKED EXAMPLE 3 (volume from percent and grams):
            >   How many mL of a 5% solution can be made from 25 g?
            >   mL = grams ÷ (% ÷ 100) = 25 ÷ 0.05 = 500 mL
            >
            > CONVERSIONS USED ON THE PTCB:
            >   Normal saline (NS) = 0.9% NaCl = 0.9 g/100 mL = 9 g/L
            >   Half-normal saline (½NS) = 0.45% NaCl
            >   Dextrose 5% (D5W) = 5 g/100 mL = 50 g/L
            >
            > > QUERY: A pharmacist prepares 150 mL of a solution and adds 6 g of
            > > an active ingredient. What is the percent strength (w/v)?
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 0.4%",
                "B) 2.5%",
                "C) 4%",
                "D) 40%"
            ],
            correctAnswer: "C) 4%",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.70
        ),

        // ── D4-C06 ── METRIC CONVERT + ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .orderEntry,
            nodeTitle: "METRIC CONVERT +",
            loreText: """
            > SECTOR-04 // ORDER_PROC — ADVANCED
            > TOPIC: Metric Conversions — Combined Unit Calculation (lbs→kg then mg→mcg)
            >
            > METRIC PREFIX LADDER:
            >   kg → g → mg → mcg (μg) → ng
            >   × 1,000 moving down; ÷ 1,000 moving up
            >
            >   1 kg  = 1,000 g
            >   1 g   = 1,000 mg
            >   1 mg  = 1,000 mcg (micrograms)
            >   1 mcg = 1,000 ng (nanograms)
            >
            > WEIGHT CONVERSION:
            >   1 kg = 2.2 lbs
            >   lbs → kg: divide by 2.2
            >   kg → lbs: multiply by 2.2
            >
            > MULTI-STEP WORKED EXAMPLE:
            >   A patient weighs 154 lbs. Drug dose = 0.5 mg/kg. Answer in mcg.
            >   Step 1: 154 ÷ 2.2 = 70 kg
            >   Step 2: 0.5 mg/kg × 70 kg = 35 mg
            >   Step 3: 35 mg × 1,000 = 35,000 mcg
            >
            > > QUERY: A drug is dosed at 0.5 mg/kg.
            > > The patient weighs 176 lbs.
            > > What is the total dose expressed in micrograms (mcg)?
            > > [Step 1: lbs→kg | Step 2: mg dose | Step 3: mg→mcg]
            """,
            challengeType: .proceduralMath,
            options: [
                "A) 400 mcg",
                "B) 4,000 mcg",
                "C) 40,000 mcg",
                "D) 400,000 mcg"
            ],
            correctAnswer: "C) 40,000 mcg",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.84
        )

    ] // end challengeNodes_D4
}
