
//
//  MultiAngle_D1.swift
//  Synapse PTCE
//
//  Multi-angle nodes for Domain 1: Medications
//  56 nodes — 14 key PTCE drugs × 4 angles each
//  Angles: Indication, Mechanism, Safety, Dosing
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D1: [DataNode] {[

        // MARK: — LISINOPRIL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Why is lisinopril prescribed?
            > CLASS: ACE Inhibitor
            > BRAND: Prinivil, Zestril
            > PRIMARY USE: Hypertension, heart failure (HFrEF), diabetic nephropathy.
            > POST-MI: Reduces cardiovascular mortality after myocardial infarction.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Angina pectoris and arrhythmia control",
                "B. Hypertension, heart failure, and diabetic nephropathy",
                "C. Atrial fibrillation rate control",
                "D. Hyperlipidemia and stroke prevention"
            ],
            correctAnswer: "B. Hypertension, heart failure, and diabetic nephropathy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.15,
            angle: .indication,
            baseConceptTitle: "LISINOPRIL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How does lisinopril work?
            > CLASS: ACE Inhibitor
            > TARGET: Angiotensin-Converting Enzyme (ACE)
            > EFFECT: Blocks conversion of angiotensin I → angiotensin II.
            > RESULT: Vasodilation, decreased aldosterone, lower BP and afterload.
            > ALSO: Reduces bradykinin breakdown → causes cough side effect.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks beta-1 receptors to reduce heart rate",
                "B. Inhibits ACE, preventing angiotensin I → II conversion",
                "C. Blocks calcium channels in vascular smooth muscle",
                "D. Stimulates alpha-2 receptors to reduce sympathetic outflow"
            ],
            correctAnswer: "B. Inhibits ACE, preventing angiotensin I → II conversion",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.15,
            angle: .mechanism,
            baseConceptTitle: "LISINOPRIL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Key adverse effects and contraindications
            > CLASS: ACE Inhibitor
            > ADR #1: Dry, persistent cough (bradykinin accumulation) — switch to ARB
            > ADR #2: Angioedema (rare but life-threatening) — BLACK BOX WARNING in pregnancy
            > CONTRAINDICATION: Pregnancy (Category D/X) — causes fetal renal injury
            > MONITOR: Potassium (hyperkalemia risk), SCr, blood pressure
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Peripheral edema and headache",
                "B. Constipation and sexual dysfunction",
                "C. Dry, persistent cough (bradykinin accumulation)",
                "D. Tachycardia and tremor"
            ],
            correctAnswer: "C. Dry, persistent cough (bradykinin accumulation)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.15,
            angle: .safety,
            baseConceptTitle: "LISINOPRIL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Monitoring and electrolyte considerations
            > CLASS: ACE Inhibitor
            > MONITOR: Potassium (K+) — ACE inhibitors block aldosterone → K+ retention
            > RISK: Hyperkalemia, especially with K+-sparing diuretics or K+ supplements
            > RENAL: Dose adjust in CKD; monitor creatinine
            > SCr INCREASE: Up to 30% rise acceptable; larger rise → hold drug
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Potassium — risk of hyperkalemia from aldosterone suppression",
                "B. Sodium — risk of hyponatremia from SIADH",
                "C. Calcium — risk of hypocalcemia",
                "D. Phosphorus — risk of hyperphosphatemia"
            ],
            correctAnswer: "A. Potassium — risk of hyperkalemia from aldosterone suppression",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.15,
            angle: .dosing,
            baseConceptTitle: "LISINOPRIL"
        ),

        // MARK: — METOPROLOL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — What conditions does metoprolol treat?
            > CLASS: Beta-1 Selective Blocker (Cardioselective Beta-Blocker)
            > BRAND: Lopressor (tartrate), Toprol-XL (succinate)
            > USES: Hypertension, angina, heart failure (HFrEF), post-MI, arrhythmias
            > NOTE: Metoprolol SUCCINATE (Toprol-XL) preferred in heart failure — once daily
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperlipidemia and metabolic syndrome",
                "B. Heart failure — metoprolol succinate (Toprol-XL) is preferred",
                "C. Hypothyroidism and fatigue",
                "D. GERD and peptic ulcer disease"
            ],
            correctAnswer: "B. Heart failure — metoprolol succinate (Toprol-XL) is preferred",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.21,
            angle: .indication,
            baseConceptTitle: "METOPROLOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How does metoprolol reduce heart rate?
            > CLASS: Beta-1 Selective Blocker
            > TARGET: Beta-1 adrenergic receptors (cardiac)
            > EFFECT: Decreases heart rate, contractility, and cardiac output
            > SELECTIVITY: Beta-1 selective at normal doses (safer in mild asthma vs non-selective)
            > AV NODE: Slows conduction → rate control in SVT/AF
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Beta-1 adrenergic receptors — reduces heart rate and contractility",
                "B. Alpha-1 receptors — causes peripheral vasodilation",
                "C. Calcium channels — relaxes vascular smooth muscle",
                "D. ACE — prevents angiotensin II formation"
            ],
            correctAnswer: "A. Beta-1 adrenergic receptors — reduces heart rate and contractility",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.21,
            angle: .mechanism,
            baseConceptTitle: "METOPROLOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Why must metoprolol never be stopped abruptly?
            > CLASS: Beta-1 Selective Blocker
            > WARNING: Abrupt discontinuation → rebound hypertension, angina, MI
            > TAPER: Must taper dose over 1–2 weeks
            > CAUTION: Masks hypoglycemia symptoms in diabetics (except sweating)
            > CONTRAINDICATION: Cardiogenic shock, decompensated HF, severe bradycardia
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Seizures and visual disturbances",
                "B. Hepatotoxicity requiring liver function monitoring",
                "C. Rebound hypertension and angina from abrupt discontinuation",
                "D. Anaphylaxis and severe allergic reactions"
            ],
            correctAnswer: "C. Rebound hypertension and angina from abrupt discontinuation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.21,
            angle: .safety,
            baseConceptTitle: "METOPROLOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Tartrate vs Succinate formulations
            > TARTRATE (Lopressor): Immediate-release; dosed BID-TID for angina/HTN
            > SUCCINATE (Toprol-XL): Extended-release; dosed ONCE DAILY for HF
            > HEART FAILURE DOSE: Start 12.5–25 mg/day, titrate to 200 mg/day
            > CRITICAL: XL and IR are NOT interchangeable mg-for-mg
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Metoprolol tartrate (Lopressor) — dosed once daily",
                "B. Metoprolol succinate (Toprol-XL) — dosed once daily",
                "C. Both formulations are dosed identically",
                "D. Metoprolol tartrate — preferred due to faster absorption"
            ],
            correctAnswer: "B. Metoprolol succinate (Toprol-XL) — dosed once daily",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.21,
            angle: .dosing,
            baseConceptTitle: "METOPROLOL"
        ),

        // MARK: — ATORVASTATIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Primary use of atorvastatin
            > CLASS: HMG-CoA Reductase Inhibitor (Statin)
            > BRAND: Lipitor
            > PRIMARY: Reduce LDL cholesterol in hyperlipidemia / mixed dyslipidemia
            > CARDIOPROTECTIVE: Reduces risk of MI, stroke in high-risk patients (ASCVD)
            > ALSO USED: Familial hypercholesterolemia (even in children ≥10)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Treatment of hypertriglyceridemia only",
                "B. Reduction of LDL cholesterol and cardiovascular risk (ASCVD)",
                "C. Treatment of type 2 diabetes and insulin resistance",
                "D. Management of gout and uric acid levels"
            ],
            correctAnswer: "B. Reduction of LDL cholesterol and cardiovascular risk (ASCVD)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.27,
            angle: .indication,
            baseConceptTitle: "ATORVASTATIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How do statins lower cholesterol?
            > CLASS: HMG-CoA Reductase Inhibitor
            > TARGET: HMG-CoA reductase — the rate-limiting enzyme of cholesterol synthesis
            > EFFECT: Reduces hepatic cholesterol production → liver upregulates LDL receptors
            > RESULT: Increased LDL clearance from blood → lower serum LDL
            > ALSO: Modest increase in HDL, reduction in triglycerides
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibiting bile acid reabsorption in the intestine",
                "B. Blocking PCSK9, increasing LDL receptor activity",
                "C. Inhibiting HMG-CoA reductase, reducing hepatic cholesterol synthesis",
                "D. Activating PPAR-alpha receptors to increase lipoprotein lipase"
            ],
            correctAnswer: "C. Inhibiting HMG-CoA reductase, reducing hepatic cholesterol synthesis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.27,
            angle: .mechanism,
            baseConceptTitle: "ATORVASTATIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Muscle toxicity risk
            > CLASS: HMG-CoA Reductase Inhibitor
            > ADR: Myalgia (muscle pain) — most common complaint
            > SERIOUS: Rhabdomyolysis — muscle breakdown, CK elevation, renal failure
            > MONITOR: CK if symptomatic; LFTs at baseline
            > RISK FACTORS: High dose, gemfibrozil combo, CYP3A4 inhibitors (e.g., clarithromycin)
            > CONTRAINDICATION: Active liver disease, pregnancy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Nephrotoxicity leading to acute kidney injury",
                "B. Rhabdomyolysis — skeletal muscle breakdown with elevated CK",
                "C. Severe hypoglycemia in diabetic patients",
                "D. QT prolongation and risk of torsades de pointes"
            ],
            correctAnswer: "B. Rhabdomyolysis — skeletal muscle breakdown with elevated CK",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.27,
            angle: .safety,
            baseConceptTitle: "ATORVASTATIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Timing flexibility vs other statins
            > CLASS: HMG-CoA Reductase Inhibitor
            > HALF-LIFE: ~14 hours (longest among common statins)
            > TIMING: Can be taken any time of day (morning OR evening)
            > CONTRAST: Simvastatin/lovastatin must be taken at BEDTIME (peak synthesis at night)
            > RANGE: 10–80 mg once daily; high-intensity = 40–80 mg/day
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Only at bedtime, like simvastatin",
                "B. Only in the morning with food",
                "C. Any time of day due to its long half-life",
                "D. Twice daily to maintain stable serum levels"
            ],
            correctAnswer: "C. Any time of day due to its long half-life",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.27,
            angle: .dosing,
            baseConceptTitle: "ATORVASTATIN"
        ),

        // MARK: — WARFARIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — When is warfarin prescribed?
            > CLASS: Vitamin K Antagonist (Oral Anticoagulant)
            > BRAND: Coumadin, Jantoven
            > USES: Atrial fibrillation, DVT/PE treatment and prevention, mechanical heart valves
            > BRIDGE: Often bridged with heparin when initiating therapy
            > NOTE: Still preferred over DOACs for mechanical heart valves
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Acute MI and unstable angina (antiplatelet use)",
                "B. Atrial fibrillation, DVT/PE, and mechanical heart valves",
                "C. Type 2 diabetes and insulin resistance",
                "D. Hypertension refractory to other agents"
            ],
            correctAnswer: "B. Atrial fibrillation, DVT/PE, and mechanical heart valves",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.33,
            angle: .indication,
            baseConceptTitle: "WARFARIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How does warfarin prevent clotting?
            > CLASS: Vitamin K Antagonist
            > TARGET: Vitamin K epoxide reductase (VKORC1)
            > EFFECT: Blocks recycling of Vitamin K → depletes Vit K-dependent clotting factors
            > FACTORS INHIBITED: II (prothrombin), VII, IX, X; and Proteins C and S
            > ONSET: Delayed 2–3 days (must deplete existing clotting factors)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Directly inhibits thrombin (Factor IIa)",
                "B. Blocks Factor Xa in the coagulation cascade",
                "C. Inhibits Vitamin K recycling, depleting Factors II, VII, IX, X",
                "D. Prevents platelet aggregation via ADP receptor blockade"
            ],
            correctAnswer: "C. Inhibits Vitamin K recycling, depleting Factors II, VII, IX, X",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.33,
            angle: .mechanism,
            baseConceptTitle: "WARFARIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Drug and food interactions
            > CLASS: Vitamin K Antagonist
            > FOOD: Vitamin K-rich foods (leafy greens) DECREASE warfarin effect
            > DRUG INTERACTIONS: Extensive — CYP2C9 inhibitors INCREASE bleeding risk
            > HIGH-RISK COMBO: Warfarin + aspirin = major bleeding risk
            > ALSO: NSAIDs, antibiotics (kill gut flora → reduce Vit K), amiodarone
            > REVERSAL: Vitamin K (phytonadione); 4-factor PCC for urgent reversal
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Aspirin — potentiates anticoagulation and antiplatelet effects",
                "B. Vitamin C supplements — neutralize warfarin activity",
                "C. Calcium carbonate — chelates warfarin in the GI tract",
                "D. Protein pump inhibitors — reduce warfarin absorption"
            ],
            correctAnswer: "A. Aspirin — potentiates anticoagulation and antiplatelet effects",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.33,
            angle: .safety,
            baseConceptTitle: "WARFARIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — INR monitoring and therapeutic targets
            > CLASS: Vitamin K Antagonist
            > MONITORING: INR (International Normalized Ratio) — derived from PT
            > STANDARD RANGE: INR 2.0–3.0 (AF, DVT/PE, most indications)
            > HIGHER RANGE: INR 2.5–3.5 for mechanical heart valves
            > FREQUENCY: Weekly when initiating; monthly when stable
            > DOSE ADJUST: Increase dose if INR sub-therapeutic; decrease if supratherapeutic
            """,
            challengeType: .multipleChoice,
            options: [
                "A. aPTT (activated partial thromboplastin time)",
                "B. INR (International Normalized Ratio), therapeutic range 2.0–3.0",
                "C. Anti-Xa level, target 0.5–1.0 IU/mL",
                "D. Thrombin time (TT) for direct thrombin inhibitors"
            ],
            correctAnswer: "B. INR (International Normalized Ratio), therapeutic range 2.0–3.0",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.33,
            angle: .dosing,
            baseConceptTitle: "WARFARIN"
        ),

        // MARK: — METFORMIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — First-line agent for type 2 diabetes
            > CLASS: Biguanide (Oral Antidiabetic)
            > BRAND: Glucophage, Glumetza
            > FIRST-LINE: Type 2 diabetes mellitus (ADA guideline recommended)
            > ADVANTAGES: No hypoglycemia risk as monotherapy, weight-neutral or loss, low cost
            > OFF-LABEL: Prediabetes prevention, PCOS insulin resistance
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Type 1 diabetes mellitus requiring insulin replacement",
                "B. Type 2 diabetes mellitus — first-line agent per ADA guidelines",
                "C. Diabetic ketoacidosis emergency management",
                "D. Gestational diabetes requiring insulin therapy"
            ],
            correctAnswer: "B. Type 2 diabetes mellitus — first-line agent per ADA guidelines",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.39,
            angle: .indication,
            baseConceptTitle: "METFORMIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How does metformin lower blood glucose?
            > CLASS: Biguanide
            > PRIMARY: Decreases hepatic gluconeogenesis (liver glucose output)
            > SECONDARY: Increases peripheral insulin sensitivity in muscle
            > SECONDARY: Decreases GI glucose absorption
            > DOES NOT: Stimulate insulin secretion (no hypoglycemia as monotherapy)
            > MOA (molecular): Activates AMPK pathway, inhibits mitochondrial complex I
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stimulates pancreatic beta cells to release insulin",
                "B. Blocks alpha-glucosidase to delay carbohydrate absorption",
                "C. Primarily decreases hepatic gluconeogenesis (liver glucose output)",
                "D. Increases GLP-1 secretion from intestinal L-cells"
            ],
            correctAnswer: "C. Primarily decreases hepatic gluconeogenesis (liver glucose output)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.39,
            angle: .mechanism,
            baseConceptTitle: "METFORMIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Lactic acidosis and contrast media
            > CLASS: Biguanide
            > BLACK BOX WARNING: Lactic acidosis (rare but fatal) — especially in renal impairment
            > HOLD: Before iodinated contrast procedures (risk of AKI → lactic acidosis)
            > RESTART: 48 hours after contrast if renal function normal
            > HOLD ALSO: Surgery, acute illness, excessive alcohol use
            > CONTRAINDICATION: eGFR < 30 mL/min; use caution eGFR 30–45
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hepatotoxicity requiring monthly liver function tests",
                "B. Hypoglycemia when used with sulfonylureas",
                "C. Lactic acidosis — must hold before iodinated contrast procedures",
                "D. Severe constipation requiring bowel regimen"
            ],
            correctAnswer: "C. Lactic acidosis — must hold before iodinated contrast procedures",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.39,
            angle: .safety,
            baseConceptTitle: "METFORMIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Minimizing GI side effects
            > CLASS: Biguanide
            > GI ADRs: Nausea, diarrhea, abdominal cramping (most common reason for discontinuation)
            > MINIMIZE: Take WITH meals; start low (500 mg BID) and titrate slowly
            > ER FORMULATION: Extended-release (Glucophage XR) — once daily with evening meal, less GI upset
            > MAX DOSE: 2550 mg/day (IR); 2000 mg/day (XR)
            > B12: Long-term use may deplete vitamin B12 — monitor annually
            """,
            challengeType: .multipleChoice,
            options: [
                "A. On an empty stomach, 30 minutes before breakfast",
                "B. With meals to minimize GI side effects such as nausea and diarrhea",
                "C. At bedtime to align with overnight glucose production",
                "D. Timing does not matter — absorption is not affected by food"
            ],
            correctAnswer: "B. With meals to minimize GI side effects such as nausea and diarrhea",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.39,
            angle: .dosing,
            baseConceptTitle: "METFORMIN"
        ),

        // MARK: — AMOXICILLIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Preferred antibiotic uses
            > CLASS: Aminopenicillin (Beta-Lactam Antibiotic)
            > BRAND: Amoxil, Trimox
            > USES: Acute otitis media (AOM), strep pharyngitis, sinusitis, CAP (mild)
            > H. PYLORI: Part of triple therapy (amoxicillin + clarithromycin + PPI)
            > DENTAL: Prophylaxis before dental procedures in high-risk cardiac patients
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Pseudomonal pneumonia and gram-negative sepsis",
                "B. Acute otitis media, strep pharyngitis, and H. pylori (triple therapy)",
                "C. MRSA skin infections and catheter-related bloodstream infections",
                "D. Clostridium difficile colitis as first-line therapy"
            ],
            correctAnswer: "B. Acute otitis media, strep pharyngitis, and H. pylori (triple therapy)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.45,
            angle: .indication,
            baseConceptTitle: "AMOXICILLIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Bactericidal cell wall disruption
            > CLASS: Aminopenicillin / Beta-Lactam
            > TARGET: Penicillin-Binding Proteins (PBPs) on bacterial cell walls
            > EFFECT: Inhibits peptidoglycan cross-linking → weakened cell wall → cell lysis
            > BACTERICIDAL: Kills bacteria (vs bacteriostatic agents which only inhibit growth)
            > SPECTRUM: Gram-positive + some gram-negative (NOT beta-lactamase producers)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits 30S ribosome to block protein synthesis",
                "B. Disrupts cell membrane integrity causing osmotic lysis",
                "C. Inhibits PBPs → blocks peptidoglycan synthesis → bactericidal cell wall disruption",
                "D. Inhibits DNA gyrase to prevent bacterial DNA replication"
            ],
            correctAnswer: "C. Inhibits PBPs → blocks peptidoglycan synthesis → bactericidal cell wall disruption",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.45,
            angle: .mechanism,
            baseConceptTitle: "AMOXICILLIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Cross-reactivity with penicillin allergy
            > CLASS: Aminopenicillin / Beta-Lactam
            > ALLERGY: Shares beta-lactam ring with penicillin — cross-reactivity risk
            > RATE: ~1–2% true cross-reactivity with penicillin-allergic patients
            > MACULOPAPULAR RASH: Common (especially with EBV/mono — not true allergy)
            > ANAPHYLAXIS: Rare but life-threatening; epinephrine is antidote
            > ALTERNATIVE: Azithromycin or clindamycin for PCN-allergic patients
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Amoxicillin is safe in penicillin allergy — no shared structure",
                "B. Use cautiously — shares beta-lactam ring with penicillin, cross-reactivity risk",
                "C. Switch to cephalosporins — no cross-reactivity with penicillin",
                "D. Amoxicillin allergy is always anaphylactic — avoid all beta-lactams forever"
            ],
            correctAnswer: "B. Use cautiously — shares beta-lactam ring with penicillin, cross-reactivity risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.45,
            angle: .safety,
            baseConceptTitle: "AMOXICILLIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Standard adult regimens
            > CLASS: Aminopenicillin / Beta-Lactam
            > STREP PHARYNGITIS: 500 mg BID or 250 mg TID × 10 days
            > ACUTE OTITIS MEDIA: 80–90 mg/kg/day (pediatric high-dose)
            > CAP (OUTPATIENT): 500 mg TID or 875 mg BID (adult)
            > FOOD: Can be taken with or without food (stable in gastric acid)
            > STORAGE: Reconstituted suspension refrigerated; shake well before use
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 500 mg once daily — single-dose therapy is sufficient",
                "B. 500 mg TID or 875 mg BID for most adult respiratory infections",
                "C. 1 g IV q8h — oral formulation is unreliable",
                "D. 250 mg once daily for 3 days (Z-pack equivalent)"
            ],
            correctAnswer: "B. 500 mg TID or 875 mg BID for most adult respiratory infections",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.45,
            angle: .dosing,
            baseConceptTitle: "AMOXICILLIN"
        ),

        // MARK: — CIPROFLOXACIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Gram-negative and UTI coverage
            > CLASS: Fluoroquinolone Antibiotic (2nd Generation)
            > BRAND: Cipro
            > USES: UTI, prostatitis, gonorrhea, anthrax prophylaxis, traveler's diarrhea
            > GRAM-NEGATIVE: Excellent coverage (Pseudomonas, E. coli, Salmonella)
            > NOTE: Avoid as first-line for uncomplicated UTI in areas with >10% resistance
            """,
            challengeType: .multipleChoice,
            options: [
                "A. MRSA skin infections and osteomyelitis",
                "B. UTIs, gram-negative infections, and anthrax prophylaxis",
                "C. Anaerobic infections and C. difficile colitis",
                "D. Streptococcal pharyngitis and community-acquired pneumonia"
            ],
            correctAnswer: "B. UTIs, gram-negative infections, and anthrax prophylaxis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.51,
            angle: .indication,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — DNA gyrase inhibition
            > CLASS: Fluoroquinolone
            > TARGET: DNA gyrase (topoisomerase II) and topoisomerase IV
            > EFFECT: Prevents DNA unwinding and replication → bacterial death
            > BACTERICIDAL: Concentration-dependent killing
            > SPECTRUM: Broad gram-negative; poor anaerobic; limited gram-positive
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits 50S ribosomal subunit to block protein synthesis",
                "B. Blocks cell wall synthesis via PBP binding",
                "C. Inhibits DNA gyrase (topoisomerase II) and topoisomerase IV",
                "D. Disrupts folate synthesis by inhibiting dihydropteroate synthase"
            ],
            correctAnswer: "C. Inhibits DNA gyrase (topoisomerase II) and topoisomerase IV",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.51,
            angle: .mechanism,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — FDA Black Box Warnings for fluoroquinolones
            > CLASS: Fluoroquinolone
            > BBW #1: Tendinitis and tendon rupture (especially Achilles) — risk increases with corticosteroids
            > BBW #2: Peripheral neuropathy — may be permanent
            > BBW #3: CNS effects — seizures, psychosis, increased ICP
            > BBW #4: Myasthenia gravis exacerbation
            > RESERVE: For infections with no safe alternatives (2016 FDA update)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Photosensitivity and drug-induced lupus",
                "B. Tendon rupture (especially Achilles) — FDA Black Box Warning",
                "C. Severe constipation and GI bleeding",
                "D. Thyroid dysfunction requiring TSH monitoring"
            ],
            correctAnswer: "B. Tendon rupture (especially Achilles) — FDA Black Box Warning",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.51,
            angle: .safety,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Absorption interactions with divalent cations
            > CLASS: Fluoroquinolone
            > INTERACTION: Divalent/trivalent cations chelate ciprofloxacin → reduce absorption
            > CHELATORS: Antacids (Mg2+, Al3+, Ca2+), iron, zinc, dairy products, sucralfate
            > SEPARATE BY: At least 2 hours before or 6 hours after ciprofloxacin
            > UNCOMPLICATED UTI: 250–500 mg BID × 3 days; Complicated: 500 mg BID × 7–14 days
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Grapefruit juice — inhibits CYP3A4 metabolism of ciprofloxacin",
                "B. High-fat foods — increase ciprofloxacin Cmax and risk of toxicity",
                "C. Antacids and divalent cations (Mg2+, Al3+, Ca2+) — chelation reduces absorption",
                "D. Proton pump inhibitors — raise gastric pH and impair absorption"
            ],
            correctAnswer: "C. Antacids and divalent cations (Mg2+, Al3+, Ca2+) — chelation reduces absorption",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.51,
            angle: .dosing,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        // MARK: — ALBUTEROL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Rescue bronchodilator use
            > CLASS: Short-Acting Beta-2 Agonist (SABA)
            > BRAND: ProAir HFA, Ventolin HFA, Proventil HFA
            > PRIMARY: Acute bronchospasm relief in asthma and COPD
            > ALSO: Exercise-induced bronchospasm (EIB) — used 15 min before exercise
            > NOTE: PRN (as-needed) use only; NOT for long-term daily control
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Long-term controller therapy for persistent asthma",
                "B. Acute bronchospasm relief (rescue inhaler) in asthma and COPD",
                "C. Anti-inflammatory treatment for eosinophilic asthma",
                "D. Nighttime cough suppression in asthmatic patients"
            ],
            correctAnswer: "B. Acute bronchospasm relief (rescue inhaler) in asthma and COPD",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.57,
            angle: .indication,
            baseConceptTitle: "ALBUTEROL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Beta-2 receptor bronchodilation
            > CLASS: Short-Acting Beta-2 Agonist (SABA)
            > TARGET: Beta-2 adrenergic receptors in bronchial smooth muscle
            > EFFECT: Activates adenylyl cyclase → increased cAMP → smooth muscle relaxation
            > ONSET: 5–15 minutes; Duration: 4–6 hours
            > SELECTIVITY: Beta-2 selective (but also stimulates heart at high doses → tachycardia)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Alpha-1 receptors — causes bronchoconstriction and vasoconstriction",
                "B. Beta-2 adrenergic receptors — relaxes bronchial smooth muscle via cAMP",
                "C. Muscarinic receptors — blocks parasympathetic bronchoconstriction",
                "D. Leukotriene receptors — reduces airway inflammation and mucus"
            ],
            correctAnswer: "B. Beta-2 adrenergic receptors — relaxes bronchial smooth muscle via cAMP",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.57,
            angle: .mechanism,
            baseConceptTitle: "ALBUTEROL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Cardiovascular side effects
            > CLASS: Short-Acting Beta-2 Agonist (SABA)
            > ADR #1: Tachycardia and palpitations (beta-2 spillover to heart)
            > ADR #2: Tremor (skeletal muscle beta-2 stimulation)
            > ADR #3: Hypokalemia (high-dose or nebulized — K+ shifts intracellularly)
            > ADR #4: Nervousness, headache, dizziness
            > OVERUSE WARNING: >2 canisters/month = poor asthma control → escalate therapy
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Bradycardia and hypotension",
                "B. Tachycardia and palpitations from beta-2 receptor spillover",
                "C. Hypercalcemia and renal calculi",
                "D. Peripheral edema and weight gain"
            ],
            correctAnswer: "B. Tachycardia and palpitations from beta-2 receptor spillover",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.57,
            angle: .safety,
            baseConceptTitle: "ALBUTEROL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Standard MDI rescue dosing
            > CLASS: Short-Acting Beta-2 Agonist (SABA)
            > MDI DOSING: 1–2 inhalations every 4–6 hours as needed
            > TECHNIQUE: Shake, exhale fully, inhale slowly over 3–5 sec while pressing
            > SPACER: Use spacer/valved holding chamber for improved lung deposition
            > NEBULIZER: 2.5 mg in 3 mL NS q4-6h PRN (hospitalized or severe)
            > ACUTE SEVERE: 2.5–5 mg nebulized q20 min × 3 doses (status asthmaticus)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 4 inhalations every 2 hours scheduled around the clock",
                "B. 1–2 inhalations every 4–6 hours as needed for acute bronchospasm",
                "C. 1 inhalation once daily in the morning for maintenance",
                "D. 3 inhalations every 1 hour until symptoms resolve"
            ],
            correctAnswer: "B. 1–2 inhalations every 4–6 hours as needed for acute bronchospasm",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.57,
            angle: .dosing,
            baseConceptTitle: "ALBUTEROL"
        ),

        // MARK: — INSULIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — When is insulin essential?
            > CLASS: Antidiabetic — Pancreatic Hormone Replacement
            > REQUIRED: Type 1 diabetes mellitus (absolute insulin deficiency — autoimmune beta-cell destruction)
            > ALSO USED: Type 2 DM (when oral agents fail or at diagnosis if A1C >10%)
            > EMERGENCIES: DKA, HHS, hyperkalemia treatment (drives K+ into cells)
            > SURGERY/HOSPITAL: Often transitioned from oral agents to insulin when NPO
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Type 2 diabetes as first-line before oral agents are tried",
                "B. Type 1 diabetes mellitus — absolute insulin deficiency requires insulin for survival",
                "C. Prediabetes prevention per ADA guidelines",
                "D. Obesity management combined with diet modification"
            ],
            correctAnswer: "B. Type 1 diabetes mellitus — absolute insulin deficiency requires insulin for survival",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.63,
            angle: .indication,
            baseConceptTitle: "INSULIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Rapid-acting insulin onset
            > CLASS: Rapid-Acting Insulin Analogs
            > AGENTS: Lispro (Humalog), Aspart (NovoLog), Glulisine (Apidra)
            > ONSET: 5–15 minutes
            > PEAK: 1–2 hours
            > DURATION: 3–5 hours
            > USE: Mealtime (prandial) coverage — inject 0–15 min BEFORE meals
            > CONTRAST: Regular insulin onset 30–60 min; inject 30 min before meals
            """,
            challengeType: .multipleChoice,
            options: [
                "A. NPH insulin — onset 2–4 hours, peak 4–10 hours",
                "B. Insulin glargine — onset 2–4 hours, no pronounced peak",
                "C. Rapid-acting analogs (lispro/aspart) — onset 5–15 minutes, peak 1–2 hours",
                "D. Regular insulin — onset 30–60 minutes, used for IV drips"
            ],
            correctAnswer: "C. Rapid-acting analogs (lispro/aspart) — onset 5–15 minutes, peak 1–2 hours",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.63,
            angle: .mechanism,
            baseConceptTitle: "INSULIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Hypoglycemia recognition and management
            > CLASS: All Insulin Types
            > #1 RISK: Hypoglycemia — blood glucose < 70 mg/dL
            > SYMPTOMS: Shakiness, sweating, confusion, pallor, palpitations
            > RULE OF 15: 15g fast carbs → wait 15 min → recheck BG; repeat if still low
            > SEVERE: Glucagon injection or IV dextrose if unconscious
            > HIGH-ALERT: Insulin is on ISMP High-Alert Medication list — independent double-check required
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperkalemia — insulin drives potassium into cells dangerously",
                "B. Hypoglycemia — blood glucose drops below 70 mg/dL",
                "C. Hyperglycemia rebound from insulin resistance",
                "D. Lactic acidosis in patients with renal impairment"
            ],
            correctAnswer: "B. Hypoglycemia — blood glucose drops below 70 mg/dL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.63,
            angle: .safety,
            baseConceptTitle: "INSULIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Storage of opened vs unopened insulin
            > CLASS: All Insulin Types
            > UNOPENED: Refrigerate at 36–46°F (2–8°C) until expiration date
            > OPENED/IN-USE: Room temperature up to 28–30 days (product-specific)
            > NEVER FREEZE: Freezing destroys insulin structure
            > AVOID HEAT: Keep away from direct sunlight and heat (>77°F degrades insulin)
            > MIXING: Do NOT mix glargine/detemir with other insulins
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Freeze opened vials to extend stability beyond 28 days",
                "B. Room temperature up to 28–30 days; refrigerate unopened vials",
                "C. Refrigerate all insulin at all times including in-use vials",
                "D. Store at 77°F (25°C) indefinitely — insulin is heat stable"
            ],
            correctAnswer: "B. Room temperature up to 28–30 days; refrigerate unopened vials",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.63,
            angle: .dosing,
            baseConceptTitle: "INSULIN"
        ),

        // MARK: — DIGOXIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Cardiac uses of digoxin
            > CLASS: Cardiac Glycoside
            > BRAND: Lanoxin
            > USE #1: Rate control in atrial fibrillation/flutter (slows AV conduction)
            > USE #2: Symptomatic heart failure (HFrEF) — improves contractility
            > NOTE: Does NOT improve mortality in HF; reduces hospitalizations
            > NARROW THERAPEUTIC INDEX — requires serum level monitoring
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Treatment of ventricular tachycardia and ventricular fibrillation",
                "B. Atrial fibrillation rate control and symptomatic heart failure (HFrEF)",
                "C. First-line treatment for hypertension and angina",
                "D. Anticoagulation in patients with mechanical heart valves"
            ],
            correctAnswer: "B. Atrial fibrillation rate control and symptomatic heart failure (HFrEF)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.69,
            angle: .indication,
            baseConceptTitle: "DIGOXIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Positive inotropic effect
            > CLASS: Cardiac Glycoside
            > TARGET: Na+/K+-ATPase pump in cardiac myocytes
            > STEP 1: Inhibits Na+/K+ pump → intracellular Na+ increases
            > STEP 2: Na+/Ca2+ exchanger reverses → intracellular Ca2+ increases
            > EFFECT: Increased Ca2+ → stronger cardiac contractions (positive inotropy)
            > VAGAL: Also increases vagal tone → slower AV conduction (rate control)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stimulates beta-1 receptors to increase heart rate and contractility",
                "B. Blocks calcium channels to reduce heart rate",
                "C. Inhibits Na+/K+-ATPase → increases intracellular Ca2+ → positive inotropy",
                "D. Activates adenylyl cyclase to increase cAMP in cardiac cells"
            ],
            correctAnswer: "C. Inhibits Na+/K+-ATPase → increases intracellular Ca2+ → positive inotropy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.69,
            angle: .mechanism,
            baseConceptTitle: "DIGOXIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Toxicity and electrolyte interactions
            > CLASS: Cardiac Glycoside
            > TOXICITY SYMPTOMS: Nausea, vomiting, visual changes (yellow-green halos), bradycardia
            > HYPOKALEMIA: K+ competes with digoxin at Na+/K+ pump — low K+ → enhanced digoxin binding → TOXICITY
            > HYPOMAGNESEMIA: Also increases toxicity risk
            > NARROW WINDOW: Therapeutic 0.5–2.0 ng/mL; toxicity possible >2.0 ng/mL
            > ANTIDOTE: Digibind (digoxin immune fab) for severe toxicity
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperkalemia — digoxin causes K+ retention",
                "B. Hypokalemia — low K+ increases digoxin binding at Na+/K+-ATPase → toxicity",
                "C. Hypercalcemia — calcium potentiates digoxin cardiotoxicity",
                "D. Hyponatremia — low sodium impairs digoxin distribution"
            ],
            correctAnswer: "B. Hypokalemia — low K+ increases digoxin binding at Na+/K+-ATPase → toxicity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.69,
            angle: .safety,
            baseConceptTitle: "DIGOXIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Therapeutic serum level monitoring
            > CLASS: Cardiac Glycoside
            > THERAPEUTIC RANGE: 0.5–2.0 ng/mL
            > HEART FAILURE TARGET: 0.5–0.9 ng/mL (lower end reduces mortality)
            > SAMPLE TIMING: Draw level at least 6–8 hours AFTER dose (distribution phase complete)
            > RENAL ADJUSTMENT: Excreted renally — dose reduce in CKD; monitor in elderly
            > INTERACTIONS: Amiodarone, verapamil, quinidine all raise digoxin levels → reduce dose 50%
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 2.0–4.0 ng/mL for all indications",
                "B. 0.5–2.0 ng/mL; draw level 6–8 hours after dose",
                "C. 1.5–3.0 ng/mL; draw immediately before the next dose",
                "D. 0.1–0.5 ng/mL; levels above this range indicate toxicity"
            ],
            correctAnswer: "B. 0.5–2.0 ng/mL; draw level 6–8 hours after dose",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.69,
            angle: .dosing,
            baseConceptTitle: "DIGOXIN"
        ),

        // MARK: — SERTRALINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Breadth of FDA-approved uses
            > CLASS: SSRI (Selective Serotonin Reuptake Inhibitor)
            > BRAND: Zoloft
            > FDA USES: MDD, OCD, PTSD, panic disorder, social anxiety disorder, PMDD
            > BROADEST SSRI: Most FDA-approved indications among SSRIs
            > ONSET: Mood effects take 2–4 weeks; full effect 6–8 weeks
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Bipolar disorder mania as a mood stabilizer",
                "B. MDD, OCD, PTSD, panic disorder, social anxiety, and PMDD",
                "C. Schizophrenia as a first-line antipsychotic",
                "D. ADHD and narcolepsy via dopamine enhancement"
            ],
            correctAnswer: "B. MDD, OCD, PTSD, panic disorder, social anxiety, and PMDD",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.74,
            angle: .indication,
            baseConceptTitle: "SERTRALINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Serotonin reuptake inhibition
            > CLASS: SSRI
            > TARGET: Serotonin transporter (SERT) in presynaptic neurons
            > EFFECT: Blocks reuptake → more serotonin in synapse → enhanced mood signaling
            > SELECTIVITY: Minimal effect on norepinephrine, dopamine transporters (vs TCAs)
            > RESULT: Fewer anticholinergic/cardiovascular side effects than older antidepressants
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks reuptake of serotonin, norepinephrine, and dopamine equally",
                "B. Selectively inhibits the serotonin transporter (SERT) → increased synaptic serotonin",
                "C. Inhibits MAO-A and MAO-B to prevent serotonin breakdown",
                "D. Acts as a serotonin receptor antagonist and reuptake inhibitor (SARI)"
            ],
            correctAnswer: "B. Selectively inhibits the serotonin transporter (SERT) → increased synaptic serotonin",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.74,
            angle: .mechanism,
            baseConceptTitle: "SERTRALINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Serotonin syndrome and BBW
            > CLASS: SSRI
            > BLACK BOX: Increased suicidal ideation in children/adolescents ≤24 years
            > SEROTONIN SYNDROME: Hyperthermia, agitation, clonus, tachycardia — life-threatening
            > TRIGGER: Combining SSRI + MAOIs, triptans, tramadol, linezolid
            > WASHOUT: 14-day washout between MAOI and SSRI (5 weeks if switching from fluoxetine)
            > DISCONTINUATION: Taper slowly to avoid discontinuation syndrome (flu-like symptoms)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Neuroleptic malignant syndrome — manage with dantrolene",
                "B. Serotonin syndrome — risk highest when combined with MAO inhibitors",
                "C. Anticholinergic toxicity — dry mouth, urinary retention, confusion",
                "D. Bone marrow suppression requiring CBC monitoring"
            ],
            correctAnswer: "B. Serotonin syndrome — risk highest when combined with MAO inhibitors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "SERTRALINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Starting dose and titration for adults
            > CLASS: SSRI
            > STARTING DOSE: 25–50 mg once daily (25 mg in elderly or panic disorder)
            > TITRATION: Increase by 25–50 mg every 1–2 weeks as tolerated
            > TARGET DOSE: 50–200 mg/day (most patients respond to 50–150 mg)
            > TIMING: Can be given morning or evening; with food if GI upset
            > FORMULATION: Oral concentrate contains 12% alcohol — avoid in alcoholic patients
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 100 mg twice daily — start at full therapeutic dose",
                "B. 25–50 mg once daily, titrating to 50–200 mg/day",
                "C. 10 mg once daily — only dose approved by FDA for safety",
                "D. 200 mg once daily as a loading dose for rapid effect"
            ],
            correctAnswer: "B. 25–50 mg once daily, titrating to 50–200 mg/day",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.74,
            angle: .dosing,
            baseConceptTitle: "SERTRALINE"
        ),

        // MARK: — AMLODIPINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Cardiovascular uses
            > CLASS: Dihydropyridine Calcium Channel Blocker (CCB)
            > BRAND: Norvasc
            > USES: Hypertension, chronic stable angina, vasospastic (Prinzmetal's) angina
            > PREFERRED IN: Elderly, Black patients with HTN (effective as monotherapy)
            > COMBINATIONS: Frequently combined with ACE inhibitor or ARB for HTN
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Atrial fibrillation rate control (preferred over diltiazem)",
                "B. Hypertension and chronic stable / Prinzmetal's angina",
                "C. Heart failure with reduced ejection fraction (HFrEF)",
                "D. Migraine prophylaxis and cluster headache prevention"
            ],
            correctAnswer: "B. Hypertension and chronic stable / Prinzmetal's angina",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.79,
            angle: .indication,
            baseConceptTitle: "AMLODIPINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Dihydropyridine calcium channel blockade
            > CLASS: Dihydropyridine CCB
            > TARGET: L-type voltage-gated calcium channels in vascular smooth muscle
            > EFFECT: Blocks Ca2+ entry → vascular smooth muscle relaxation → vasodilation
            > VASCULAR SELECTIVITY: High affinity for vessels vs heart (unlike diltiazem/verapamil)
            > RESULT: Reduced peripheral resistance → lower BP; coronary vasodilation → relieves angina
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks beta-1 receptors to reduce heart rate and contractility",
                "B. Blocks L-type calcium channels in vascular smooth muscle → vasodilation",
                "C. Inhibits ACE to prevent angiotensin II-mediated vasoconstriction",
                "D. Activates potassium channels causing membrane hyperpolarization"
            ],
            correctAnswer: "B. Blocks L-type calcium channels in vascular smooth muscle → vasodilation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.79,
            angle: .mechanism,
            baseConceptTitle: "AMLODIPINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Peripheral edema as dose-dependent ADR
            > CLASS: Dihydropyridine CCB
            > MOST COMMON ADR: Peripheral edema (ankle swelling) — dose-dependent
            > MECHANISM OF EDEMA: Arterial vasodilation without venous dilation → fluid shift
            > MANAGEMENT: Lower dose; add ACE inhibitor/ARB (venoconstriction reduces edema)
            > OTHER ADRs: Flushing, headache, palpitations, dizziness
            > NOT A DIURETIC ISSUE: Edema is not fluid overload — diuretics won't help much
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Dry cough from bradykinin accumulation",
                "B. Peripheral edema (ankle swelling) — dose-dependent vasodilation effect",
                "C. Hyperkalemia from aldosterone suppression",
                "D. Rhabdomyolysis with elevated CK levels"
            ],
            correctAnswer: "B. Peripheral edema (ankle swelling) — dose-dependent vasodilation effect",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.79,
            angle: .safety,
            baseConceptTitle: "AMLODIPINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Starting and maximum doses
            > CLASS: Dihydropyridine CCB
            > STARTING DOSE: 5 mg once daily (2.5 mg in elderly, small patients, hepatic impairment)
            > MAXIMUM DOSE: 10 mg once daily
            > TITRATION: May increase to 10 mg after 7–14 days if needed
            > TIMING: Once daily; can be taken with or without food at any time
            > HALF-LIFE: ~30–50 hours — once-daily dosing effective, gradual BP lowering
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 2.5 mg twice daily for all patients",
                "B. 5 mg once daily, titrated up to 10 mg once daily as needed",
                "C. 10 mg twice daily — split dosing required for efficacy",
                "D. 20 mg once daily maximum for resistant hypertension"
            ],
            correctAnswer: "B. 5 mg once daily, titrated up to 10 mg once daily as needed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.79,
            angle: .dosing,
            baseConceptTitle: "AMLODIPINE"
        ),

        // MARK: — OMEPRAZOLE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — PPI clinical applications
            > CLASS: Proton Pump Inhibitor (PPI)
            > BRAND: Prilosec (OTC and Rx)
            > USES: GERD (erosive esophagitis), peptic ulcer disease, Zollinger-Ellison syndrome
            > H. PYLORI: Part of triple/quadruple therapy regimens
            > STRESS ULCER: PPI prophylaxis in mechanically ventilated ICU patients
            > OTC: Available OTC for frequent heartburn (14-day courses, max 3×/year)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Constipation and irritable bowel syndrome (IBS)",
                "B. GERD, peptic ulcer disease, H. pylori eradication, Zollinger-Ellison syndrome",
                "C. Nausea and vomiting as a first-line antiemetic",
                "D. Inflammatory bowel disease (Crohn's and ulcerative colitis)"
            ],
            correctAnswer: "B. GERD, peptic ulcer disease, H. pylori eradication, Zollinger-Ellison syndrome",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.84,
            angle: .indication,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Irreversible proton pump inhibition
            > CLASS: Proton Pump Inhibitor
            > TARGET: H+/K+-ATPase enzyme (proton pump) on gastric parietal cells
            > EFFECT: Irreversibly inhibits pump → suppresses gastric acid secretion
            > PRODRUG: Omeprazole is a prodrug — activated at acidic pH in parietal cell canaliculi
            > ONSET: Effect seen in 1 hour; maximal effect in 4 days
            > DURATION: Lasts 24+ hours despite short plasma half-life (effect tied to pump turnover)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Competitively blocks H2 receptors on parietal cells",
                "B. Neutralizes gastric acid via bicarbonate buffer system",
                "C. Irreversibly inhibits H+/K+-ATPase (proton pump) on gastric parietal cells",
                "D. Stimulates prostaglandin production to protect gastric mucosa"
            ],
            correctAnswer: "C. Irreversibly inhibits H+/K+-ATPase (proton pump) on gastric parietal cells",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.84,
            angle: .mechanism,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Long-term use risks
            > CLASS: Proton Pump Inhibitor
            > HYPOMAGNESEMIA: Long-term use (>1 year) can cause severe low magnesium
            > VITAMIN B12: Reduced gastric acid impairs B12 absorption → deficiency over years
            > C. DIFF: Suppressed acid increases susceptibility to C. difficile infection
            > BONE FRACTURE: Long-term use associated with increased osteoporosis/fracture risk
            > CLOPIDOGREL: Omeprazole inhibits CYP2C19 → reduces clopidogrel activation (use pantoprazole instead)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hypermagnesemia and hypercalcemia",
                "B. Hypomagnesemia and vitamin B12 deficiency with long-term use",
                "C. Hypokalemia and metabolic acidosis",
                "D. Hepatotoxicity requiring monthly LFT monitoring"
            ],
            correctAnswer: "B. Hypomagnesemia and vitamin B12 deficiency with long-term use",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.84,
            angle: .safety,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Timing relative to meals for maximum efficacy
            > CLASS: Proton Pump Inhibitor
            > TIMING: Take 30–60 MINUTES BEFORE FIRST MEAL OF THE DAY
            > RATIONALE: Drug must be absorbed while proton pumps are actively pumping (after meal stimulus)
            > COMMON ERROR: Taking at bedtime or with food → suboptimal acid suppression
            > GERD DOSE: 20 mg once daily × 4–8 weeks
            > PEPTIC ULCER: 20–40 mg once daily
            > CAPSULE: Can be opened and contents sprinkled on applesauce for swallowing difficulty
            """,
            challengeType: .multipleChoice,
            options: [
                "A. At bedtime to suppress overnight acid production",
                "B. 30–60 minutes before the first meal of the day for maximum efficacy",
                "C. Immediately after meals to neutralize food-stimulated acid",
                "D. Any time with plenty of water — timing does not affect efficacy"
            ],
            correctAnswer: "B. 30–60 minutes before the first meal of the day for maximum efficacy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.84,
            angle: .dosing,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        // MARK: — LEVOTHYROXINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Drug of choice for hypothyroidism
            > CLASS: Thyroid Hormone Replacement (Synthetic T4)
            > BRAND: Synthroid, Levoxyl, Tirosint, Unithroid
            > PRIMARY: Hypothyroidism (primary, secondary, congenital, post-thyroidectomy)
            > ALSO: Thyroid cancer suppression (higher doses suppress TSH)
            > PREFERRED: T4 monotherapy preferred over T3/T4 combinations for most patients
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperthyroidism (overactive thyroid) to suppress excess hormone",
                "B. Hypothyroidism — drug of choice for thyroid hormone replacement",
                "C. Thyroid storm (myxedema coma) as IV emergency only",
                "D. Subclinical hyperthyroidism to normalize TSH levels"
            ],
            correctAnswer: "B. Hypothyroidism — drug of choice for thyroid hormone replacement",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.89,
            angle: .indication,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — T4 to T3 peripheral conversion
            > CLASS: Synthetic Thyroxine (T4)
            > PRODRUG: Levothyroxine (T4) is peripherally converted to T3 (liothyronine)
            > ENZYME: Deiodinase enzymes in liver, kidney, muscle perform T4 → T3 conversion
            > ACTIVE FORM: T3 is 3–5× more potent than T4; binds nuclear thyroid receptors
            > EFFECT: Increases metabolic rate, heart rate, protein synthesis, and thermogenesis
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Levothyroxine (T4) directly activates thyroid receptors without conversion",
                "B. T4 is converted peripherally to active T3 (triiodothyronine) by deiodinase enzymes",
                "C. Stimulates TSH release from pituitary to increase endogenous T3/T4",
                "D. Inhibits thyroid peroxidase to reduce thyroid hormone synthesis"
            ],
            correctAnswer: "B. T4 is converted peripherally to active T3 (triiodothyronine) by deiodinase enzymes",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.89,
            angle: .mechanism,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Absorption interactions
            > CLASS: Synthetic Thyroxine (T4)
            > ABSORPTION: Must be separated from substances that bind/reduce absorption
            > SEPARATE BY 4 HOURS: Calcium supplements, iron (ferrous sulfate), antacids (Mg, Al)
            > SEPARATE BY 4 HOURS: Sucralfate, cholestyramine, proton pump inhibitors
            > FOOD: High-fiber foods and soy can reduce absorption
            > NARROW THERAPEUTIC INDEX: Small changes in dose → significant hormonal effects
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Grapefruit juice — inhibits CYP3A4 metabolism significantly",
                "B. Calcium, iron, and antacids — must be separated by at least 4 hours",
                "C. High-protein meals — chelate levothyroxine in the GI tract",
                "D. Vitamin D supplements — compete for the same absorption pathway"
            ],
            correctAnswer: "B. Calcium, iron, and antacids — must be separated by at least 4 hours",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.89,
            angle: .safety,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Optimal administration timing
            > CLASS: Synthetic Thyroxine (T4)
            > TIMING: Take on an EMPTY STOMACH, 30–60 minutes before breakfast
            > RATIONALE: Food (especially high-fiber or soy) significantly reduces absorption
            > ALTERNATIVE: Some patients may take at bedtime (2+ hours after last meal) — equal efficacy
            > MONITORING: TSH level checked 6–8 weeks after dose changes; annually when stable
            > BRAND vs GENERIC: FDA-rated AB, but some endocrinologists prefer brand consistency
            """,
            challengeType: .multipleChoice,
            options: [
                "A. With breakfast — food enhances levothyroxine absorption",
                "B. 30–60 minutes before breakfast on an empty stomach",
                "C. At bedtime with a full glass of milk to enhance calcium-mediated uptake",
                "D. Twice daily — the drug has a short half-life requiring split dosing"
            ],
            correctAnswer: "B. 30–60 minutes before breakfast on an empty stomach",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.89,
            angle: .dosing,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

    ]}
}
