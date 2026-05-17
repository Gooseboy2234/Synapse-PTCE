import Foundation

// Phase 13 — Patient Safety Final Gap Fill
// 10 nodes: opioid safety, renal/hepatic dosing, drug interaction severity,
// serotonin syndrome, anaphylaxis, photosensitivity, QT prolongation,
// adherence, medication overuse headache, transitions of care

let multiAngleNodes_D3e: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "OPIOID SAFETY MONITORING / PDMP USE",
        loreText: "Prescription Drug Monitoring Programs (PDMPs): state databases tracking controlled substance prescriptions. Pharmacists and prescribers check PDMP before dispensing opioids to identify 'doctor shopping,' early refills, and multiple prescribers. Federal law mandates pharmacists check PDMP in many states. PDMP data is HIPAA-protected.",
        challengeType: .multipleChoice,
        options: [
            "A. PDMPs track CS prescriptions to identify doctor shopping; checking before opioid dispensing is required in many states",
            "B. PDMPs are voluntary databases with no legal requirement to check",
            "C. PDMP data can be shared freely with any third party",
            "D. PDMPs only track Schedule II opioids, not Schedule III-V"
        ],
        correctAnswer: "A. PDMPs track CS prescriptions to identify doctor shopping; checking before opioid dispensing is required in many states",
        xOffset: 0.08,
        yOffset: 0.900,
        baseConceptTitle: "Opioid Safety Monitoring"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "RENAL DOSE ADJUSTMENT / SAFETY",
        loreText: "Renally cleared drugs accumulate in renal impairment, increasing toxicity risk. Drugs requiring adjustment: metformin (contraindicated <30 mL/min), digoxin, aminoglycosides, vancomycin, gabapentin, pregabalin, atenolol, allopurinol, and many others. Use Cockcroft-Gault formula to estimate CrCl for dosing decisions.",
        challengeType: .multipleChoice,
        options: [
            "A. Metformin is contraindicated when CrCl <30 mL/min due to lactic acidosis risk from renal accumulation",
            "B. Renal impairment rarely requires dose adjustment for renally eliminated drugs",
            "C. Only antibiotics require renal dose adjustments",
            "D. Serum creatinine alone is the best measure for dosing in renal impairment"
        ],
        correctAnswer: "A. Metformin is contraindicated when CrCl <30 mL/min due to lactic acidosis risk from renal accumulation",
        xOffset: 0.12,
        yOffset: 0.900,
        baseConceptTitle: "Renal Dose Adjustment"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "HEPATIC DOSE ADJUSTMENT / SAFETY",
        loreText: "Hepatically metabolized drugs accumulate in liver disease. Child-Pugh score (A/B/C) guides dosing adjustments. Drugs requiring caution: statins, acetaminophen (hepatotoxic at >3 g/day in liver disease), warfarin (increased sensitivity), benzodiazepines (prolonged sedation), opioids (increased CNS effects). No equivalent formula like CrCl for renal.",
        challengeType: .multipleChoice,
        options: [
            "A. Acetaminophen dose is limited to ≤2 g/day in significant hepatic impairment due to increased toxicity",
            "B. Liver disease rarely affects drug metabolism significantly",
            "C. The Cockcroft-Gault formula estimates hepatic drug clearance",
            "D. All drugs can be used at full dose in Child-Pugh Class A liver disease"
        ],
        correctAnswer: "A. Acetaminophen dose is limited to ≤2 g/day in significant hepatic impairment due to increased toxicity",
        xOffset: 0.16,
        yOffset: 0.900,
        baseConceptTitle: "Hepatic Dose Adjustment"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "SEROTONIN SYNDROME / RECOGNITION",
        loreText: "Serotonin syndrome: excess serotonergic activity — triad of (1) mental status changes (agitation, confusion), (2) autonomic instability (hyperthermia, diaphoresis, tachycardia, hypertension), (3) neuromuscular abnormalities (clonus, hyperreflexia, tremor, myoclonus). Caused by combinations: SSRIs + MAOIs, SSRIs + triptans, SSRIs + tramadol/linezolid. Can be fatal.",
        challengeType: .multipleChoice,
        options: [
            "A. Serotonin syndrome triad: mental status changes, autonomic instability, and neuromuscular abnormalities (clonus)",
            "B. Serotonin syndrome presents with bradycardia, hypothermia, and lead-pipe rigidity",
            "C. Serotonin syndrome only occurs when SSRIs are taken in overdose",
            "D. Serotonin syndrome is caused exclusively by SSRI-MAOI combinations"
        ],
        correctAnswer: "A. Serotonin syndrome triad: mental status changes, autonomic instability, and neuromuscular abnormalities (clonus)",
        xOffset: 0.20,
        yOffset: 0.900,
        baseConceptTitle: "Serotonin Syndrome"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "ANAPHYLAXIS / RECOGNITION AND RESPONSE",
        loreText: "Anaphylaxis: life-threatening hypersensitivity — rapid onset of urticaria/angioedema + respiratory compromise (bronchospasm) OR cardiovascular collapse (hypotension). Treatment: epinephrine IM 0.3 mg (1:1000) into outer thigh — FIRST LINE. Antihistamines and steroids are adjuncts only. Patient should carry auto-injector (EpiPen).",
        challengeType: .multipleChoice,
        options: [
            "A. Epinephrine IM is the first-line treatment for anaphylaxis — antihistamines are adjuncts only",
            "B. Diphenhydramine IV is the first-line treatment for anaphylaxis",
            "C. Oral corticosteroids should be given first to prevent worsening",
            "D. Epinephrine is only used if antihistamines fail to resolve anaphylaxis"
        ],
        correctAnswer: "A. Epinephrine IM is the first-line treatment for anaphylaxis — antihistamines are adjuncts only",
        xOffset: 0.24,
        yOffset: 0.900,
        baseConceptTitle: "Anaphylaxis Response"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "PHOTOSENSITIVITY / DRUG-INDUCED",
        loreText: "Photosensitivity reactions: phototoxic (more common, dose-dependent, sunburn-like) and photoallergic (immune-mediated). Drugs causing photosensitivity: fluoroquinolones (especially ciprofloxacin), tetracyclines (especially doxycycline), amiodarone, thiazides, voriconazole, NSAIDs, sulfonamides. Counsel: use SPF 30+ sunscreen and protective clothing.",
        challengeType: .multipleChoice,
        options: [
            "A. Doxycycline, ciprofloxacin, amiodarone, and thiazides commonly cause photosensitivity — counsel to use sunscreen",
            "B. Photosensitivity is only caused by antifungal medications",
            "C. Photoallergic reactions are more common than phototoxic reactions",
            "D. Sunscreen use is not needed for drug-induced photosensitivity"
        ],
        correctAnswer: "A. Doxycycline, ciprofloxacin, amiodarone, and thiazides commonly cause photosensitivity — counsel to use sunscreen",
        xOffset: 0.28,
        yOffset: 0.900,
        baseConceptTitle: "Drug-Induced Photosensitivity"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "QT PROLONGATION / DRUG SAFETY",
        loreText: "QTc prolongation risk: drugs that block cardiac hERG K+ channels, delaying repolarization. Risk factors: female sex, hypokalemia/hypomagnesemia, bradycardia, congenital long QT. High-risk drugs: antiarrhythmics (amiodarone, sotalol), antipsychotics (haloperidol, ziprasidone), fluoroquinolones, macrolides (azithromycin), methadone, ondansetron (IV). Torsades de pointes can degrade to VFib.",
        challengeType: .multipleChoice,
        options: [
            "A. QT prolongation risk is highest with antiarrhythmics, antipsychotics, fluoroquinolones, and macrolides — can cause torsades",
            "B. QT prolongation is only a concern with cardiac medications",
            "C. Hyperkalemia is the primary risk factor for drug-induced QT prolongation",
            "D. QT prolongation from drugs resolves immediately upon discontinuation"
        ],
        correctAnswer: "A. QT prolongation risk is highest with antiarrhythmics, antipsychotics, fluoroquinolones, and macrolides — can cause torsades",
        xOffset: 0.32,
        yOffset: 0.900,
        baseConceptTitle: "QT Prolongation Safety"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "MEDICATION ADHERENCE / INTERVENTIONS",
        loreText: "Non-adherence affects 50% of chronic disease patients, leading to preventable hospitalizations. Interventions: medication synchronization (MedSync), blister packs/pill organizers, refill reminders, MTM counseling, simplified regimens, addressing cost barriers (generics, PAPs), and motivational interviewing. Pharmacists are key in identifying and addressing adherence barriers.",
        challengeType: .multipleChoice,
        options: [
            "A. Medication synchronization, simplified regimens, and MTM counseling are evidence-based adherence interventions",
            "B. Adherence issues are best managed by prescribers only — pharmacists have no role",
            "C. Non-adherence affects fewer than 10% of patients with chronic conditions",
            "D. Pill organizers are contraindicated in elderly patients due to confusion risk"
        ],
        correctAnswer: "A. Medication synchronization, simplified regimens, and MTM counseling are evidence-based adherence interventions",
        xOffset: 0.36,
        yOffset: 0.900,
        baseConceptTitle: "Medication Adherence"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "MEDICATION OVERUSE HEADACHE / MOH",
        loreText: "Medication overuse headache (MOH/rebound headache): occurs with frequent use of headache medications >10–15 days/month. Agents: triptans (≥10 days), opioids, combination analgesics (≥10 days), simple analgesics (≥15 days). Treatment: withdraw offending agent (supervised tapering). Preventive therapy initiated. Patient counseling key.",
        challengeType: .multipleChoice,
        options: [
            "A. MOH occurs with headache medication use >10–15 days/month; treatment requires withdrawal of the offending agent",
            "B. MOH is treated by increasing the dose of the headache medication",
            "C. Preventive migraine medications cause medication overuse headache",
            "D. Simple analgesics like acetaminophen never cause medication overuse headache"
        ],
        correctAnswer: "A. MOH occurs with headache medication use >10–15 days/month; treatment requires withdrawal of the offending agent",
        xOffset: 0.40,
        yOffset: 0.900,
        baseConceptTitle: "Medication Overuse Headache"
    ),

    DataNode(
        id: UUID(),
        domain: .patientSafety,
        nodeTitle: "TRANSITIONS OF CARE / MEDICATION SAFETY",
        loreText: "Transitions of care (hospital discharge, transfer, care setting changes) are high-risk periods for medication errors. Pharmacist roles: medication reconciliation, discharge counseling, coordinating with outpatient providers, ensuring medications are affordable and accessible. Unintentional medication discrepancies affect up to 70% of hospital admissions.",
        challengeType: .multipleChoice,
        options: [
            "A. Transitions of care are high-risk for medication errors; pharmacists perform reconciliation and discharge counseling",
            "B. Medication errors rarely occur during care transitions",
            "C. Pharmacist involvement in transitions of care has no impact on readmission rates",
            "D. Discharge counseling is only needed for patients with new diagnoses"
        ],
        correctAnswer: "A. Transitions of care are high-risk for medication errors; pharmacists perform reconciliation and discharge counseling",
        xOffset: 0.44,
        yOffset: 0.900,
        baseConceptTitle: "Transitions of Care Safety"
    ),
]
