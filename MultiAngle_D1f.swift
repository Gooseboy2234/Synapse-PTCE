import Foundation

// Multi-Angle Phase 11 — D1d Interactions & Counseling
// 14 drugs × 2 angles = 28 nodes (all with full MCQ content)

let multiAngleNodes_D1f: [DataNode] = [

    // ============================================================
    // HYDROCODONE/APAP — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "HYDROCODONE/APAP / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Additive respiratory depression with benzodiazepines, alcohol, muscle relaxants, other opioids — Black Box Warning.
        > SEROTONERGIC DRUGS: Risk of serotonin syndrome with MAOIs, SSRIs, SNRIs, TCAs.
        > ANTICHOLINERGICS: Additive urinary retention, constipation, dry mouth.
        > APAP + WARFARIN: High-dose APAP potentiates anticoagulation.
        > APAP + ALCOHOL (chronic): Additive hepatotoxicity via CYP2E1.
        > CYP2D6: Hydrocodone converted to active hydromorphone via CYP2D6; inhibitors reduce efficacy.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Hydrocodone/APAP + benzodiazepines is a safe analgesic combination for post-operative pain",
            "B. Hydrocodone/APAP + CNS depressants (benzos, alcohol) causes additive respiratory depression (Black Box); + MAOIs/SSRIs risks serotonin syndrome; chronic alcohol + APAP causes hepatotoxicity",
            "C. CYP2D6 inhibitors increase hydrocodone efficacy by blocking its active metabolite production",
            "D. Acetaminophen component has no interactions and is completely safe with all other medications"
        ],
        correctAnswer: "B. Hydrocodone/APAP + CNS depressants (benzos, alcohol) causes additive respiratory depression (Black Box); + MAOIs/SSRIs risks serotonin syndrome; chronic alcohol + APAP causes hepatotoxicity",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "HYDROCODONE/APAP"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "HYDROCODONE/APAP / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > APAP LIMIT: Total APAP ≤ 4 g/day — check ALL products for APAP content.
        > ALCOHOL: Avoid completely — additive CNS depression AND liver toxicity risk.
        > DRIVING: Do not drive or operate machinery — sedating.
        > CONTROLLED SUBSTANCE: CII — no refills; lost prescriptions cannot be replaced easily.
        > CONSTIPATION: Begin bowel regimen proactively; increase fiber and fluids.
        > ADDICTION RISK: Use lowest effective dose for shortest duration; do not share.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients may consume moderate alcohol while taking hydrocodone/APAP as long as doses are spaced appropriately",
            "B. Avoid alcohol completely (CNS depression + APAP hepatotoxicity); check all products for APAP content (max 4 g/day); no refills (CII); start bowel regimen proactively",
            "C. Hydrocodone/APAP may be refilled up to 5 times within 6 months as a CIII substance",
            "D. The constipation from hydrocodone resolves spontaneously and does not need a bowel regimen"
        ],
        correctAnswer: "B. Avoid alcohol completely (CNS depression + APAP hepatotoxicity); check all products for APAP content (max 4 g/day); no refills (CII); start bowel regimen proactively",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "HYDROCODONE/APAP"
    ),

    // ============================================================
    // OXYCODONE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "OXYCODONE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Benzodiazepines, alcohol, muscle relaxants — Black Box Warning for respiratory depression.
        > CYP3A4 INHIBITORS: Ketoconazole, clarithromycin, ritonavir — increase oxycodone exposure (toxicity risk).
        > CYP3A4 INDUCERS: Rifampin, carbamazepine, phenytoin — decrease oxycodone levels (reduced analgesia).
        > SEROTONERGIC: MAOIs, SSRIs, SNRIs — serotonin syndrome risk.
        > ANTICHOLINERGICS: Additive constipation, urinary retention.
        > EXTENDED-RELEASE: OxyContin — do NOT crush (dose dumping = fatal overdose).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. CYP3A4 inducers like rifampin increase oxycodone levels, causing toxicity",
            "B. CYP3A4 inhibitors (ketoconazole, ritonavir) increase oxycodone toxicity; CYP3A4 inducers (rifampin) decrease analgesia; CNS depressants cause additive respiratory depression (Black Box)",
            "C. Oxycodone extended-release tablets can be crushed for patients who cannot swallow whole",
            "D. Oxycodone + SSRIs is a safe combination because opioids do not affect serotonin"
        ],
        correctAnswer: "B. CYP3A4 inhibitors (ketoconazole, ritonavir) increase oxycodone toxicity; CYP3A4 inducers (rifampin) decrease analgesia; CNS depressants cause additive respiratory depression (Black Box)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.21,
        angle: .safety,
        baseConceptTitle: "OXYCODONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "OXYCODONE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > EXTENDED RELEASE: Swallow whole — NEVER crush, break, or chew (fatal dose dumping).
        > ALCOHOL: Do not drink alcohol — respiratory depression risk.
        > STORAGE: Lock up; keep away from children and anyone without a prescription.
        > DISPOSAL: Flush or use take-back program — do NOT leave in medicine cabinet.
        > CII RULES: No refills; lost Rx requires new evaluation.
        > BOWEL: Stool softener + laxative from day 1.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Oxycodone ER tablets may be cut in half to provide a lower dose for elderly patients",
            "B. Never crush, break, or chew ER tablets (dose dumping risk); avoid alcohol; lock up and dispose properly; start bowel regimen day 1; no refills (CII)",
            "C. Oxycodone extended-release tablets should be dissolved in water for patients with swallowing difficulty",
            "D. Leftover oxycodone tablets should be saved for future pain episodes to reduce healthcare costs"
        ],
        correctAnswer: "B. Never crush, break, or chew ER tablets (dose dumping risk); avoid alcohol; lock up and dispose properly; start bowel regimen day 1; no refills (CII)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.21,
        angle: .safety,
        baseConceptTitle: "OXYCODONE"
    ),

    // ============================================================
    // ALPRAZOLAM — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALPRAZOLAM / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLACK BOX: Benzodiazepines + opioids → additive CNS depression, respiratory depression, death.
        > CYP3A4 INHIBITORS: Ketoconazole, itraconazole, ritonavir, clarithromycin → increase alprazolam levels (toxicity).
        > CYP3A4 INDUCERS: Rifampin, carbamazepine → decrease alprazolam levels (reduced efficacy).
        > ALCOHOL: Additive CNS depression — dangerous combination.
        > ANTIHISTAMINES (diphenhydramine): Additive sedation.
        > GRAPEFRUIT JUICE: CYP3A4 inhibition → increased alprazolam exposure.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alprazolam + opioids is a recommended combination for anxiety with chronic pain",
            "B. Alprazolam + opioids has a Black Box Warning (respiratory depression/death); CYP3A4 inhibitors (ketoconazole, ritonavir) raise alprazolam levels; alcohol causes additive CNS depression",
            "C. CYP3A4 inducers increase alprazolam levels by increasing CYP3A4 enzyme activity",
            "D. Grapefruit juice reduces alprazolam levels through CYP3A4 induction"
        ],
        correctAnswer: "B. Alprazolam + opioids has a Black Box Warning (respiratory depression/death); CYP3A4 inhibitors (ketoconazole, ritonavir) raise alprazolam levels; alcohol causes additive CNS depression",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.27,
        angle: .safety,
        baseConceptTitle: "ALPRAZOLAM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALPRAZOLAM / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ALCOHOL: Strictly avoid — life-threatening CNS and respiratory depression.
        > DO NOT STOP ABRUPTLY: Taper required — withdrawal can cause seizures (life-threatening).
        > DRIVING: Impairs coordination and reaction time — do not drive.
        > DEPENDENCY: High potential for physical and psychological dependence — CIV.
        > DURATION: Intended for short-term use (weeks, not months/years).
        > MEMORY: May cause anterograde amnesia (forgetting events after taking the drug).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alprazolam can be stopped abruptly when anxiety resolves without any risk of withdrawal",
            "B. Never stop abruptly (seizure risk from withdrawal); avoid alcohol; avoid driving; CIV with high dependency risk; intended for short-term use",
            "C. Alprazolam is a Schedule II substance with the highest abuse potential among benzodiazepines",
            "D. Alprazolam withdrawal symptoms are mild and consist only of rebound anxiety"
        ],
        correctAnswer: "B. Never stop abruptly (seizure risk from withdrawal); avoid alcohol; avoid driving; CIV with high dependency risk; intended for short-term use",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.27,
        angle: .safety,
        baseConceptTitle: "ALPRAZOLAM"
    ),

    // ============================================================
    // LORAZEPAM — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LORAZEPAM / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > OPIOIDS: Black Box Warning — additive sedation, respiratory depression, death.
        > ALCOHOL: Additive CNS depression.
        > CNS DEPRESSANTS: Antipsychotics, antihistamines, other benzos — additive sedation.
        > VALPROIC ACID: May increase lorazepam levels (reduce lorazepam dose if used together).
        > CLOZAPINE: Additive respiratory depression and cardiovascular collapse — extreme caution.
        > ADVANTAGE OVER OTHER BENZOS: Lorazepam is NOT CYP-metabolized (glucuronidation only) — fewer CYP interactions.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lorazepam is metabolized by CYP3A4, giving it many drug-drug interactions with CYP inhibitors",
            "B. Lorazepam undergoes glucuronidation (not CYP), reducing CYP-based interactions; + opioids has Black Box Warning; + clozapine risks respiratory depression/cardiovascular collapse",
            "C. Lorazepam + valproic acid reduces lorazepam levels, requiring higher lorazepam doses",
            "D. Lorazepam has no significant interactions with other CNS depressants"
        ],
        correctAnswer: "B. Lorazepam undergoes glucuronidation (not CYP), reducing CYP-based interactions; + opioids has Black Box Warning; + clozapine risks respiratory depression/cardiovascular collapse",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.33,
        angle: .safety,
        baseConceptTitle: "LORAZEPAM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LORAZEPAM / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ALCOHOL: Absolutely avoid — dangerous CNS and respiratory depression.
        > DRIVING: Avoid — sedation and psychomotor impairment.
        > TAPER: Never stop abruptly — withdrawal seizures possible.
        > MEMORY: May cause anterograde amnesia.
        > INJECTION (hospital use): Dilute before IV administration; respiratory monitoring required.
        > SHORT-TERM: Approved for short-term anxiety; not for chronic use.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Lorazepam can be stopped suddenly after 2 weeks of use with no taper needed",
            "B. Avoid alcohol and driving; never stop abruptly (withdrawal seizures); memory impairment possible; hospital IV requires dilution and respiratory monitoring; intended for short-term use",
            "C. Lorazepam is approved for long-term (years) treatment of generalized anxiety disorder",
            "D. Memory impairment from lorazepam is retrograde (forgetting events before the drug was taken)"
        ],
        correctAnswer: "B. Avoid alcohol and driving; never stop abruptly (withdrawal seizures); memory impairment possible; hospital IV requires dilution and respiratory monitoring; intended for short-term use",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.33,
        angle: .safety,
        baseConceptTitle: "LORAZEPAM"
    ),

    // ============================================================
    // ESCITALOPRAM — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ESCITALOPRAM / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MAOIs: CONTRAINDICATED — serotonin syndrome (14-day washout required).
        > QT PROLONGATION: Escitalopram dose-dependently prolongs QT — avoid other QT-prolonging drugs; max dose 20 mg (10 mg in elderly).
        > SEROTONIN SYNDROME: With MAOIs, triptans, tramadol, linezolid, St. John's Wort, fentanyl.
        > NSAIDS/ANTICOAGULANTS: SSRIs deplete platelet serotonin → increased bleeding risk.
        > CYP2C19 INHIBITORS: Omeprazole, fluconazole → may increase escitalopram levels.
        > CIMETIDINE: Increases escitalopram levels by ~40%.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Escitalopram can be started 24 hours after stopping an MAOI to minimize serotonin syndrome risk",
            "B. MAOIs contraindicated with escitalopram (14-day washout); QT prolongation risk (max 20 mg, 10 mg elderly); SSRIs + NSAIDs/anticoagulants increase bleeding; CYP2C19 inhibitors raise escitalopram levels",
            "C. Escitalopram has no effect on QT interval at any therapeutic dose",
            "D. SSRIs + NSAIDs is a safe combination because they work through different mechanisms"
        ],
        correctAnswer: "B. MAOIs contraindicated with escitalopram (14-day washout); QT prolongation risk (max 20 mg, 10 mg elderly); SSRIs + NSAIDs/anticoagulants increase bleeding; CYP2C19 inhibitors raise escitalopram levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.39,
        angle: .safety,
        baseConceptTitle: "ESCITALOPRAM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ESCITALOPRAM / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ONSET: 4–6 weeks for full antidepressant effect; partial response may occur in 1–2 weeks.
        > DO NOT STOP ABRUPTLY: Discontinuation syndrome (flu-like, dizziness, electric shock sensations).
        > SUICIDALITY: Monitor for worsening depression, suicidal thoughts in patients <25 (Black Box).
        > SEXUAL SIDE EFFECTS: Common — decreased libido, delayed orgasm; may improve over time.
        > MORNING DOSING: Often recommended to minimize insomnia.
        > AVOID ALCOHOL: Worsens depression and CNS effects.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Escitalopram works immediately and patients should feel better within 24 hours",
            "B. Full effect takes 4–6 weeks; do not stop abruptly (discontinuation syndrome); monitor suicidality in patients <25 (Black Box); sexual side effects common; avoid alcohol",
            "C. Abruptly stopping escitalopram is safe because it has a long half-life",
            "D. Escitalopram should be taken at bedtime to prevent daytime sedation"
        ],
        correctAnswer: "B. Full effect takes 4–6 weeks; do not stop abruptly (discontinuation syndrome); monitor suicidality in patients <25 (Black Box); sexual side effects common; avoid alcohol",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.39,
        angle: .safety,
        baseConceptTitle: "ESCITALOPRAM"
    ),

    // ============================================================
    // DULOXETINE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "DULOXETINE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MAOIs: CONTRAINDICATED — serotonin syndrome (14-day washout).
        > CYP1A2 INHIBITORS: Fluvoxamine, ciprofloxacin → significantly increase duloxetine levels.
        > CYP2D6 INHIBITOR: Duloxetine inhibits CYP2D6 → raises levels of metoprolol, TCAs, codeine, tamoxifen.
        > SEROTONIN SYNDROME RISK: With triptans, tramadol, fentanyl, linezolid, St. John's Wort.
        > NSAIDS/ANTICOAGULANTS: Increased bleeding risk (platelet serotonin depletion).
        > ALCOHOL: Contraindicated in liver disease — duloxetine is hepatotoxic; alcohol worsens.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Duloxetine is a CYP2D6 substrate only and does not inhibit any CYP enzymes",
            "B. Duloxetine inhibits CYP2D6 (raises metoprolol/TCA/tamoxifen levels); CYP1A2 inhibitors (fluvoxamine, cipro) raise duloxetine; MAOIs contraindicated; hepatotoxic — avoid in liver disease",
            "C. Duloxetine + MAOIs can be combined with a 48-hour washout period",
            "D. Duloxetine has no effect on metoprolol or codeine metabolism"
        ],
        correctAnswer: "B. Duloxetine inhibits CYP2D6 (raises metoprolol/TCA/tamoxifen levels); CYP1A2 inhibitors (fluvoxamine, cipro) raise duloxetine; MAOIs contraindicated; hepatotoxic — avoid in liver disease",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.45,
        angle: .safety,
        baseConceptTitle: "DULOXETINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "DULOXETINE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ALCOHOL: Avoid — combined hepatotoxicity risk; also worsens depression.
        > SWALLOW WHOLE: Delayed-release capsules — do not crush or chew.
        > BLOOD PRESSURE: Monitor — duloxetine can raise BP.
        > ONSET: 2–4 weeks for pain; 4–6 weeks for full antidepressant effect.
        > DISCONTINUATION: Taper gradually — discontinuation syndrome (dizziness, nausea, electric shocks).
        > SUICIDALITY: Black Box — monitor in patients <25.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Duloxetine capsules can be opened and sprinkled on food for patients with difficulty swallowing",
            "B. Swallow whole (do not crush); avoid alcohol (hepatotoxicity); monitor blood pressure; taper gradually to avoid discontinuation syndrome; 4–6 weeks for full antidepressant effect",
            "C. Duloxetine lowers blood pressure and is preferred in hypertensive patients",
            "D. Duloxetine can be stopped abruptly without any discontinuation effects"
        ],
        correctAnswer: "B. Swallow whole (do not crush); avoid alcohol (hepatotoxicity); monitor blood pressure; taper gradually to avoid discontinuation syndrome; 4–6 weeks for full antidepressant effect",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.45,
        angle: .safety,
        baseConceptTitle: "DULOXETINE"
    ),

    // ============================================================
    // DOXYCYCLINE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "DOXYCYCLINE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ANTACIDS/DAIRY: Ca²⁺, Mg²⁺, Al³⁺, Fe²⁺ → chelation → drastically reduced absorption.
        > SEPARATE BY ≥2 HOURS: Antacids, calcium supplements, iron, dairy products.
        > WARFARIN: Doxycycline can potentiate warfarin — monitor INR.
        > ORAL CONTRACEPTIVES: May reduce OC efficacy (clinical relevance debated; use backup contraception).
        > RETINOIDS (isotretinoin): CONTRAINDICATED — additive pseudotumor cerebri risk.
        > BARBITURATES/PHENYTOIN/CARBAMAZEPINE: Induce doxycycline metabolism → shorter half-life.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Doxycycline can be taken with dairy products to reduce gastrointestinal upset",
            "B. Doxycycline absorption is significantly reduced by Ca²⁺/Mg²⁺/Fe²⁺ chelation — separate from antacids, dairy, and iron by ≥2 hours; + retinoids = contraindicated (pseudotumor cerebri)",
            "C. Doxycycline + retinoids is a preferred combination for severe acne treatment",
            "D. Doxycycline has no effect on warfarin anticoagulation"
        ],
        correctAnswer: "B. Doxycycline absorption is significantly reduced by Ca²⁺/Mg²⁺/Fe²⁺ chelation — separate from antacids, dairy, and iron by ≥2 hours; + retinoids = contraindicated (pseudotumor cerebri)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.51,
        angle: .safety,
        baseConceptTitle: "DOXYCYCLINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "DOXYCYCLINE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SUN SENSITIVITY: High photosensitivity — wear sunscreen and protective clothing; avoid sun exposure.
        > ESOPHAGITIS: Take with full glass of water; remain upright for 30 minutes (ulceration risk).
        > FOOD: Can be taken with food (except dairy) to reduce nausea.
        > COMPLETE COURSE: Finish all doses.
        > PREGNANCY/CHILDREN <8: Contraindicated — tooth discoloration and bone growth inhibition.
        > HORMONAL CONTRACEPTIVES: Consider backup contraception.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Doxycycline should be taken lying down after meals for maximum absorption",
            "B. Take with full glass of water; remain upright 30 min (esophagitis prevention); wear sunscreen (photosensitivity); contraindicated in pregnancy and children <8 (teeth/bone effects)",
            "C. Doxycycline is the preferred antibiotic for young children because of its broad spectrum",
            "D. Doxycycline does not cause photosensitivity and sun exposure is unrestricted"
        ],
        correctAnswer: "B. Take with full glass of water; remain upright 30 min (esophagitis prevention); wear sunscreen (photosensitivity); contraindicated in pregnancy and children <8 (teeth/bone effects)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.51,
        angle: .safety,
        baseConceptTitle: "DOXYCYCLINE"
    ),

    // ============================================================
    // TMP-SMX — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "TMP-SMX / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > WARFARIN: TMP-SMX significantly potentiates warfarin — check INR closely.
        > METHOTREXATE: Additive folate antagonism → severe bone marrow suppression.
        > ACE INHIBITORS/ARBs/K-SPARING DIURETICS: TMP blocks distal tubular K+ secretion → hyperkalemia.
        > PHENYTOIN: SMX inhibits CYP2C9 → elevated phenytoin levels (toxicity).
        > SULFONYLUREAS: SMX inhibits CYP2C9 → increased hypoglycemia risk.
        > DOFETILIDE: Contraindicated — TMP inhibits renal excretion of dofetilide → arrhythmia.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. TMP-SMX is safe to use with potassium-sparing diuretics because both are renally eliminated",
            "B. TMP-SMX + warfarin significantly raises INR; + ACE inhibitors/K-sparing diuretics causes hyperkalemia (TMP blocks K+ secretion); + methotrexate causes severe bone marrow suppression",
            "C. TMP-SMX lowers phenytoin levels by inducing CYP2C9 metabolism",
            "D. TMP-SMX has no clinically significant interactions with other medications"
        ],
        correctAnswer: "B. TMP-SMX + warfarin significantly raises INR; + ACE inhibitors/K-sparing diuretics causes hyperkalemia (TMP blocks K+ secretion); + methotrexate causes severe bone marrow suppression",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.57,
        angle: .safety,
        baseConceptTitle: "TMP-SMX"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "TMP-SMX / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SULFA ALLERGY: Do not use if sulfa allergy — cross-reactivity possible.
        > FLUID INTAKE: Drink plenty of fluids — prevents crystalluria and kidney stones.
        > SUN SENSITIVITY: Photosensitivity reaction possible — use sunscreen.
        > COMPLETE COURSE: Finish all doses even if feeling better.
        > G6PD DEFICIENCY: May cause hemolytic anemia — screen if at risk.
        > RASH: Stop immediately and report rash — risk of Stevens-Johnson syndrome.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. TMP-SMX is safe for all patients including those with sulfa allergies",
            "B. Contraindicated with sulfa allergy; drink plenty of fluids (prevent crystalluria); stop immediately if rash develops (Stevens-Johnson risk); use sunscreen; G6PD deficiency → hemolytic anemia",
            "C. Restrict fluid intake to less than 1 liter daily to prevent TMP-SMX drug accumulation",
            "D. TMP-SMX rashes are cosmetic only and do not require stopping the medication"
        ],
        correctAnswer: "B. Contraindicated with sulfa allergy; drink plenty of fluids (prevent crystalluria); stop immediately if rash develops (Stevens-Johnson risk); use sunscreen; G6PD deficiency → hemolytic anemia",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.57,
        angle: .safety,
        baseConceptTitle: "TMP-SMX"
    ),

    // ============================================================
    // PHENYTOIN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PHENYTOIN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > STRONG CYP INDUCER: Induces CYP3A4, CYP2C9, CYP2C19, P-glycoprotein — reduces levels of warfarin, OCPs, statins, antivirals, immunosuppressants, steroids.
        > VALPROIC ACID: Displaces phenytoin from protein binding → transient increase in free phenytoin.
        > CYP2C9 INHIBITORS (fluconazole, amiodarone): Increase phenytoin toxicity — ataxia, nystagmus.
        > ANTACIDS: Reduce phenytoin absorption — separate by 2 hours.
        > TUBE FEEDS: Reduce phenytoin absorption — hold TF 2 hrs before and after.
        > ENTERAL NUTRITION: Hold continuous feeds around phenytoin administration.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Phenytoin inhibits CYP enzymes, raising levels of concurrent medications",
            "B. Phenytoin is a strong CYP inducer (3A4, 2C9, 2C19) — reduces warfarin, OCP, statin, antiviral levels; fluconazole/amiodarone inhibit phenytoin metabolism raising levels; tube feeds reduce absorption",
            "C. Phenytoin + valproic acid always leads to significantly increased phenytoin toxicity",
            "D. Antacids enhance phenytoin absorption and should be taken together"
        ],
        correctAnswer: "B. Phenytoin is a strong CYP inducer (3A4, 2C9, 2C19) — reduces warfarin, OCP, statin, antiviral levels; fluconazole/amiodarone inhibit phenytoin metabolism raising levels; tube feeds reduce absorption",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.63,
        angle: .safety,
        baseConceptTitle: "PHENYTOIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PHENYTOIN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CONSISTENCY: Same formulation and brand — generic substitution can alter levels.
        > GINGIVAL HYPERPLASIA: Abnormal gum overgrowth — maintain excellent oral hygiene.
        > RASH: Stop and call provider — risk of Stevens-Johnson syndrome.
        > WOMEN: Reduces OCP efficacy — use barrier contraception; also teratogenic (fetal hydantoin syndrome).
        > LEVEL MONITORING: Narrow therapeutic index — regular drug levels required.
        > ALCOHOL: Acute use raises phenytoin levels; chronic use lowers levels.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients can freely switch between phenytoin brands and generics without any concern",
            "B. Maintain consistent brand/formulation; practice excellent oral hygiene (gingival hyperplasia); stop if rash occurs (SJS risk); oral contraceptives are unreliable — use backup contraception",
            "C. Phenytoin enhances oral contraceptive effectiveness through enzyme inhibition",
            "D. Gingival hyperplasia from phenytoin is reversible by taking higher doses of the drug"
        ],
        correctAnswer: "B. Maintain consistent brand/formulation; practice excellent oral hygiene (gingival hyperplasia); stop if rash occurs (SJS risk); oral contraceptives are unreliable — use backup contraception",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.63,
        angle: .safety,
        baseConceptTitle: "PHENYTOIN"
    ),

    // ============================================================
    // ROSUVASTATIN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ROSUVASTATIN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ROSUVASTATIN is NOT primarily CYP3A4 metabolized — different from simvastatin/lovastatin.
        > CYCLOSPORINE: Significantly increases rosuvastatin levels — contraindicated or dose cap at 5 mg.
        > GEMFIBROZIL: Increases rosuvastatin exposure — avoid combination (myopathy risk).
        > ANTACIDS (Al/Mg): Reduce rosuvastatin absorption — take rosuvastatin ≥2 hrs after antacid.
        > WARFARIN: Rosuvastatin can potentiate warfarin — monitor INR.
        > NIACIN + STATINS: Increased myopathy risk at high niacin doses.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rosuvastatin is safe with cyclosporine at all doses because it avoids CYP3A4 metabolism",
            "B. Cyclosporine raises rosuvastatin levels significantly (contraindicated or max 5 mg); gemfibrozil increases myopathy risk; antacids reduce absorption (separate by 2 hrs); may potentiate warfarin",
            "C. Rosuvastatin is metabolized identically to simvastatin and has the same drug interactions",
            "D. Gemfibrozil lowers rosuvastatin levels, requiring a higher rosuvastatin dose for efficacy"
        ],
        correctAnswer: "B. Cyclosporine raises rosuvastatin levels significantly (contraindicated or max 5 mg); gemfibrozil increases myopathy risk; antacids reduce absorption (separate by 2 hrs); may potentiate warfarin",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.69,
        angle: .safety,
        baseConceptTitle: "ROSUVASTATIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ROSUVASTATIN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TIMING: Can be taken at any time of day (unlike simvastatin/lovastatin which need PM dosing).
        > PREGNANCY: Contraindicated (Category X) — stop immediately if pregnant.
        > MUSCLE SYMPTOMS: Report muscle pain, weakness, or dark urine (rhabdomyolysis warning).
        > LIVER: Monitor liver enzymes; report jaundice, abdominal pain.
        > ASIAN PATIENTS: Rosuvastatin systemic exposure higher — start at lowest dose (5 mg).
        > GRAPEFRUIT: No interaction (unlike CYP3A4-metabolized statins).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rosuvastatin must be taken at night because it only inhibits cholesterol synthesis in the evening",
            "B. Can be taken any time of day; contraindicated in pregnancy; report muscle pain/dark urine (rhabdomyolysis); Asian patients require lower starting doses; no grapefruit interaction",
            "C. Rosuvastatin should be avoided in Asian patients due to reduced efficacy in this population",
            "D. Grapefruit juice significantly increases rosuvastatin levels and must be avoided"
        ],
        correctAnswer: "B. Can be taken any time of day; contraindicated in pregnancy; report muscle pain/dark urine (rhabdomyolysis); Asian patients require lower starting doses; no grapefruit interaction",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.69,
        angle: .safety,
        baseConceptTitle: "ROSUVASTATIN"
    ),

    // ============================================================
    // SPIRONOLACTONE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SPIRONOLACTONE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > HYPERKALEMIA RISK: + ACE inhibitors, ARBs, K+ supplements, K+ salt substitutes — life-threatening hyperkalemia.
        > NSAIDs: Reduce diuretic/antihypertensive effect of spironolactone; risk of acute renal failure.
        > DIGOXIN: Spironolactone may increase digoxin levels and interfere with digoxin assays.
        > LITHIUM: Reduced lithium clearance — lithium toxicity risk.
        > EPLERENONE: Do not combine selective aldosterone antagonists — additive hyperkalemia.
        > WARFARIN: Spironolactone may reduce anticoagulant effect.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Spironolactone + ACE inhibitors is a safe combination with no potassium concerns",
            "B. Spironolactone + ACE inhibitors/ARBs/K+ supplements causes life-threatening hyperkalemia; + NSAIDs reduces effect and risks renal failure; + digoxin raises digoxin levels",
            "C. Spironolactone reduces potassium levels, making it safe to add K+ supplements freely",
            "D. Spironolactone + warfarin increases INR through aldosterone receptor blockade"
        ],
        correctAnswer: "B. Spironolactone + ACE inhibitors/ARBs/K+ supplements causes life-threatening hyperkalemia; + NSAIDs reduces effect and risks renal failure; + digoxin raises digoxin levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.75,
        angle: .safety,
        baseConceptTitle: "SPIRONOLACTONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SPIRONOLACTONE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > POTASSIUM: Avoid salt substitutes (KCl) and high-potassium foods — hyperkalemia risk.
        > GYNECOMASTIA: Men may experience breast tenderness/swelling (anti-androgenic effect).
        > MENSTRUAL IRREGULARITY: Women may experience irregular periods (especially at high doses for acne/hirsutism).
        > DIURESIS: Take in morning to avoid nocturia.
        > LABS: Regular K+ and creatinine monitoring required.
        > PREGNANCY: Category D — avoid during pregnancy.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Men taking spironolactone should supplement with potassium to counteract K+ loss",
            "B. Avoid potassium-rich foods and salt substitutes (K+ retention); gynecomastia possible in men; take in morning; regular potassium/creatinine monitoring required; avoid in pregnancy",
            "C. Spironolactone causes potassium wasting, so high-potassium diets are encouraged",
            "D. Spironolactone has no effect on hormones and cannot cause gynecomastia or menstrual changes"
        ],
        correctAnswer: "B. Avoid potassium-rich foods and salt substitutes (K+ retention); gynecomastia possible in men; take in morning; regular potassium/creatinine monitoring required; avoid in pregnancy",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.75,
        angle: .safety,
        baseConceptTitle: "SPIRONOLACTONE"
    ),

    // ============================================================
    // ZOLPIDEM — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ZOLPIDEM / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Additive sedation with benzodiazepines, opioids, alcohol, antihistamines.
        > CYP3A4 INHIBITORS: Ketoconazole, itraconazole → increase zolpidem levels (prolonged sedation).
        > CYP3A4 INDUCERS: Rifampin → decrease zolpidem levels (reduced efficacy).
        > FLUVOXAMINE (CYP1A2 inhibitor): Increases zolpidem levels.
        > ANTIDEPRESSANTS (SSRIs, bupropion): May increase risk of complex sleep behaviors.
        > FEMALE DOSING: FDA recommends lower starting doses for women (slower metabolism).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Zolpidem + benzodiazepines is a safe combination because they work through different receptors",
            "B. Zolpidem + CNS depressants (benzos, opioids, alcohol) causes additive sedation; CYP3A4 inhibitors (ketoconazole) increase zolpidem levels; women need lower doses (slower metabolism)",
            "C. Rifampin increases zolpidem levels through CYP3A4 inhibition",
            "D. Zolpidem has no sex-based dosing differences"
        ],
        correctAnswer: "B. Zolpidem + CNS depressants (benzos, opioids, alcohol) causes additive sedation; CYP3A4 inhibitors (ketoconazole) increase zolpidem levels; women need lower doses (slower metabolism)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.81,
        angle: .safety,
        baseConceptTitle: "ZOLPIDEM"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ZOLPIDEM / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TIMING: Take immediately before bed; ensure 7–8 hours sleep available.
        > COMPLEX BEHAVIORS: Sleep walking, sleep driving (Black Box 2019) — stop if occurs.
        > ALCOHOL: Never combine — dangerous respiratory depression.
        > SHORT-TERM: Not for chronic nightly use; tolerance and dependence develop.
        > MEMORY: May cause anterograde amnesia (especially with less sleep).
        > WOMEN: Start with lower dose (5 mg instead of 10 mg) — slower elimination.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Zolpidem can be taken in the middle of the night if unable to fall asleep at regular bedtime",
            "B. Take immediately before bed with 7–8 hours available; stop if sleep walking/driving occurs (Black Box); avoid alcohol; women start at 5 mg; not for chronic nightly use",
            "C. Zolpidem is approved for long-term nightly use with no tolerance or dependence concerns",
            "D. Zolpidem can be safely combined with a glass of wine to enhance sleep induction"
        ],
        correctAnswer: "B. Take immediately before bed with 7–8 hours available; stop if sleep walking/driving occurs (Black Box); avoid alcohol; women start at 5 mg; not for chronic nightly use",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.81,
        angle: .safety,
        baseConceptTitle: "ZOLPIDEM"
    ),

    // ============================================================
    // CARVEDILOL — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CARVEDILOL / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ANTIHYPERTENSIVES: Additive hypotension with other BP medications, nitrates, PDE5 inhibitors.
        > CYP2D6 INHIBITORS: Fluoxetine, paroxetine, quinidine → increase carvedilol levels.
        > DIGOXIN: Carvedilol increases digoxin levels ~15% (monitor digoxin levels and signs of toxicity).
        > INSULIN/ANTIDIABETICS: Beta-blockade masks tachycardia of hypoglycemia (main symptom).
        > CLONIDINE: Do not stop clonidine abruptly with beta-blocker — rebound hypertension.
        > AMIODARONE: Additive bradycardia and AV block — use caution.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Carvedilol enhances hypoglycemia recognition by amplifying all hypoglycemic symptoms",
            "B. Carvedilol + insulin: beta-blockade masks tachycardia of hypoglycemia; + digoxin raises digoxin levels; CYP2D6 inhibitors (fluoxetine) raise carvedilol levels; + amiodarone causes additive bradycardia",
            "C. Carvedilol + digoxin reduces digoxin levels through P-glycoprotein induction",
            "D. Carvedilol is safe to combine with clonidine and both can be stopped simultaneously"
        ],
        correctAnswer: "B. Carvedilol + insulin: beta-blockade masks tachycardia of hypoglycemia; + digoxin raises digoxin levels; CYP2D6 inhibitors (fluoxetine) raise carvedilol levels; + amiodarone causes additive bradycardia",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.87,
        angle: .safety,
        baseConceptTitle: "CARVEDILOL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CARVEDILOL / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DO NOT STOP ABRUPTLY: Rebound hypertension, angina, MI risk — taper over 1–2 weeks.
        > FOOD: Take with food to slow absorption and reduce orthostatic hypotension.
        > ORTHOSTATIC: Rise slowly — dizziness common, especially first doses.
        > HEART RATE: Pulse may be lower — expected; report if <50 bpm or symptomatic.
        > DIABETES: Report sweating only (other hypoglycemia signs masked by beta-blockade).
        > EXTENDED-RELEASE: Take once daily with morning meal; do not crush/chew ER formulation.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Carvedilol can be stopped abruptly if side effects occur without any medical consultation",
            "B. Never stop abruptly (MI/angina rebound risk); take with food; rise slowly (orthostatic hypotension); diabetics: only sweating reliably signals hypoglycemia; HR reduction is expected",
            "C. Carvedilol should be taken on an empty stomach for fastest absorption and maximum effect",
            "D. A pulse of 48 bpm on carvedilol indicates the drug is not working and the dose should be increased"
        ],
        correctAnswer: "B. Never stop abruptly (MI/angina rebound risk); take with food; rise slowly (orthostatic hypotension); diabetics: only sweating reliably signals hypoglycemia; HR reduction is expected",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.87,
        angle: .safety,
        baseConceptTitle: "CARVEDILOL"
    ),
]
