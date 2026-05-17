
//
//  MultiAngle_D1c.swift
//  Synapse PTCE
//
//  Multi-angle nodes — Domain 1: 12 Additional High-Yield PTCE Drugs
//  48 nodes: Furosemide, HCTZ, Losartan, Acetaminophen, Ibuprofen, Azithromycin,
//             Gabapentin, Prednisone, Clopidogrel, Tramadol, Montelukast, Bupropion
//  Each drug covered with 4 angles: Indication, Mechanism, Safety, Dosing
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D1c: [DataNode] {[

        // MARK: — FUROSEMIDE (Lasix)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Why is furosemide prescribed?
            > CLASS: Loop Diuretic
            > BRAND: Lasix
            > PRIMARY USE: Edema associated with congestive heart failure (CHF), hepatic cirrhosis, and renal disease
            > HYPERTENSION: Used when thiazides are insufficient or patient has renal impairment (CrCl < 30)
            > HYPERCALCEMIA: IV furosemide promotes calciuria — used acutely to lower serum calcium
            > ACUTE PULMONARY EDEMA: IV furosemide provides rapid diuresis — drug of choice for flash pulmonary edema
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Primary hypertension in patients with normal renal function",
                "B. Edema in CHF/cirrhosis/renal disease and acute pulmonary edema",
                "C. Nephrolithiasis prevention by reducing urinary calcium excretion",
                "D. Hypokalemia treatment — furosemide conserves potassium"
            ],
            correctAnswer: "B. Edema in CHF/cirrhosis/renal disease and acute pulmonary edema",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.930,
            angle: .indication,
            baseConceptTitle: "FUROSEMIDE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How does furosemide produce diuresis?
            > CLASS: Loop Diuretic
            > TARGET: Na-K-2Cl cotransporter (NKCC2) in the thick ascending limb of the Loop of Henle
            > EFFECT: Blocks reabsorption of Na+, K+, and Cl- → large volume of hypotonic urine
            > RESULT: Potent diuresis; also decreases venous capacitance (preload reduction) quickly
            > CONTRAST: Thiazides act on distal convoluted tubule (less potent); loop diuretics work even in poor renal function
            > MAXIMUM EFFICACY: Most potent diuretics available; effective in GFR as low as 10–20 mL/min
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits Na-Cl cotransporter in the distal convoluted tubule",
                "B. Blocks aldosterone receptors in the collecting duct → K+ sparing",
                "C. Inhibits Na-K-2Cl cotransporter in the thick ascending Loop of Henle",
                "D. Inhibits carbonic anhydrase in the proximal tubule"
            ],
            correctAnswer: "C. Inhibits Na-K-2Cl cotransporter in the thick ascending Loop of Henle",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.930,
            angle: .mechanism,
            baseConceptTitle: "FUROSEMIDE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Key adverse effects of furosemide
            > ELECTROLYTE DEPLETION: Hypokalemia (most common), hyponatremia, hypomagnesemia, hypocalcemia
            > OTOTOXICITY: High-dose or rapid IV infusion → hearing loss (usually reversible); worst with aminoglycosides
            > METABOLIC ALKALOSIS: Loss of H+ and Cl- with diuresis
            > HYPERURICEMIA: Reduced uric acid excretion → can precipitate gout
            > SULFONAMIDE ALLERGY: Contains sulfonamide moiety — cross-reactivity possible (clinical significance debated)
            > PHOTOSENSITIVITY: Use sunscreen
            > DEHYDRATION/AZOTEMIA: Excessive diuresis → prerenal azotemia → elevated BUN/Cr
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperkalemia — furosemide spares potassium in the collecting duct",
                "B. Hypokalemia — furosemide causes significant loss of K+ at the Loop of Henle",
                "C. Hypocalcemia is the most clinically significant electrolyte disturbance",
                "D. Hyperphosphatemia — furosemide blocks phosphate reabsorption"
            ],
            correctAnswer: "B. Hypokalemia — furosemide causes significant loss of K+ at the Loop of Henle",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.930,
            angle: .safety,
            baseConceptTitle: "FUROSEMIDE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Administration and monitoring
            > ORAL DOSE: 20–80 mg once or twice daily; may double dose every 6–8 h if inadequate response
            > IV DOSE: 20–40 mg IV push; do not infuse > 4 mg/min (ototoxicity risk)
            > TIMING: Give in morning (or morning and early afternoon) to avoid nocturia
            > POTASSIUM MONITORING: Check K+ regularly; supplement K+ (KCl) or add K+-sparing diuretic if hypokalemia develops
            > BIOAVAILABILITY: Oral bioavailability variable (10–100%); IV is 100% — IV dose is roughly 50% of oral dose
            > RENAL EFFICACY: Effective even in CKD — unlike thiazides (ineffective in GFR < 30)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Give furosemide at bedtime to maximize nighttime diuresis",
                "B. IV furosemide may be infused at any rate — rate of infusion does not affect toxicity",
                "C. Give in the morning; do not infuse IV > 4 mg/min (ototoxicity risk); monitor K+",
                "D. Furosemide is contraindicated in all patients with renal impairment"
            ],
            correctAnswer: "C. Give in the morning; do not infuse IV > 4 mg/min (ototoxicity risk); monitor K+",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.930,
            angle: .dosing,
            baseConceptTitle: "FUROSEMIDE"
        ),

        // MARK: — HYDROCHLOROTHIAZIDE (HCTZ)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HCTZ / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Uses of hydrochlorothiazide
            > CLASS: Thiazide Diuretic
            > BRAND: HydroDIURIL (less used); mainly generic; often in combo products (Lisinopril/HCTZ, Valsartan/HCTZ)
            > PRIMARY: Hypertension — preferred for uncomplicated HTN per JNC guidelines
            > EDEMA: Mild edema (less potent than loop diuretics)
            > NEPHROLITHIASIS: Calcium oxalate stones — HCTZ reduces urinary calcium (unique among diuretics)
            > DIABETES INSIPIDUS: Paradoxically reduces urine output in nephrogenic DI
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Severe edema in heart failure — more potent than furosemide",
                "B. Hypertension, calcium oxalate kidney stones, and nephrogenic diabetes insipidus",
                "C. Hyperkalemia treatment via potassium wasting",
                "D. Osteoporosis prevention by increasing urinary phosphate excretion"
            ],
            correctAnswer: "B. Hypertension, calcium oxalate kidney stones, and nephrogenic diabetes insipidus",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.936,
            angle: .indication,
            baseConceptTitle: "HCTZ"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HCTZ / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How HCTZ causes diuresis and reduces blood pressure
            > CLASS: Thiazide Diuretic
            > TARGET: Na-Cl cotransporter (NCC) in the distal convoluted tubule (DCT)
            > EFFECT: Blocks Na+ and Cl- reabsorption → moderate diuresis
            > BP EFFECT: Initially via volume depletion; long-term via vasodilation (reduced vascular resistance)
            > CALCIUM RETENTION: Unlike loop diuretics, thiazides INCREASE calcium reabsorption (reduces Ca2+ in urine → reduces Ca stones)
            > CONTRAST: Loop diuretics cause hypocalcemia; thiazides cause hypercalcemia
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits Na-K-2Cl cotransporter in the thick ascending Loop of Henle",
                "B. Blocks aldosterone receptors in collecting duct — K+-sparing effect",
                "C. Inhibits Na-Cl cotransporter in the distal convoluted tubule — moderate diuresis",
                "D. Inhibits carbonic anhydrase in the proximal tubule — weak diuretic effect"
            ],
            correctAnswer: "C. Inhibits Na-Cl cotransporter in the distal convoluted tubule — moderate diuresis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.936,
            angle: .mechanism,
            baseConceptTitle: "HCTZ"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HCTZ / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Metabolic side effects of HCTZ
            > HYPOKALEMIA: Most common — monitor K+ and supplement if needed
            > HYPONATREMIA: Especially in elderly — potentially serious
            > HYPERGLYCEMIA: Impairs insulin secretion — may worsen diabetes control
            > HYPERURICEMIA: Reduces uric acid excretion → can precipitate gout
            > HYPERLIPIDEMIA: Modest increase in LDL and triglycerides (less clinically relevant at low doses)
            > HYPERCALCEMIA: Increases Ca2+ reabsorption — avoid in hypercalcemia
            > PHOTOSENSITIVITY: Use sunscreen; avoid prolonged sun exposure
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hyperkalemia and metabolic acidosis",
                "B. Hypokalemia, hyperglycemia, hyperuricemia, and photosensitivity",
                "C. Hypocalcemia and ototoxicity at high doses",
                "D. Hyperphosphatemia and metabolic alkalosis"
            ],
            correctAnswer: "B. Hypokalemia, hyperglycemia, hyperuricemia, and photosensitivity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.936,
            angle: .safety,
            baseConceptTitle: "HCTZ"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HCTZ / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Standard doses and key considerations
            > HTN DOSE: 12.5–25 mg once daily (higher doses add more side effects without much BP benefit)
            > EDEMA DOSE: 25–100 mg/day in 1–2 divided doses
            > TIMING: Give in morning to avoid nocturia
            > INEFFECTIVE IN RENAL IMPAIRMENT: Does NOT work when GFR < 30 mL/min — use loop diuretic instead
            > COMBINATION PRODUCTS: Commonly formulated with ACE inhibitors, ARBs, or beta-blockers as fixed-dose combos
            > MONITORING: Electrolytes (K+, Na+), BUN/Cr, glucose, uric acid
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 50–100 mg twice daily for optimal blood pressure control",
                "B. 12.5–25 mg once daily; ineffective in renal impairment (GFR < 30)",
                "C. Give at bedtime to maximize antihypertensive effect overnight",
                "D. Effective in all patients regardless of renal function — unlike loop diuretics"
            ],
            correctAnswer: "B. 12.5–25 mg once daily; ineffective in renal impairment (GFR < 30)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.936,
            angle: .dosing,
            baseConceptTitle: "HCTZ"
        ),

        // MARK: — LOSARTAN (Cozaar) — ARB

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LOSARTAN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Why choose an ARB over an ACE inhibitor?
            > CLASS: Angiotensin II Receptor Blocker (ARB)
            > BRAND: Cozaar
            > USES: Hypertension, diabetic nephropathy (reduces proteinuria), heart failure, stroke prevention (hypertensive patients with LVH)
            > ACE INHIBITOR INTOLERANCE: First choice when patient cannot tolerate ACE inhibitor due to persistent dry cough
            > NOTE: ARBs DO NOT cause cough (no bradykinin accumulation — key differentiator from ACE inhibitors)
            > LOSARTAN UNIQUE: Only ARB with uricosuric effect — slightly lowers uric acid (modest anti-gout benefit)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Atrial fibrillation as a first-line rate control agent",
                "B. Hypertension, especially in patients intolerant to ACE inhibitors due to dry cough",
                "C. Heart failure with preserved ejection fraction (HFpEF) — preferred over ACE inhibitors",
                "D. Acute kidney injury — ARBs protect against AKI in all settings"
            ],
            correctAnswer: "B. Hypertension, especially in patients intolerant to ACE inhibitors due to dry cough",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.942,
            angle: .indication,
            baseConceptTitle: "LOSARTAN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LOSARTAN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How ARBs differ from ACE inhibitors
            > CLASS: ARB (Angiotensin II Receptor Blocker)
            > TARGET: AT1 (angiotensin II type 1) receptors in blood vessels, adrenal gland, and kidney
            > EFFECT: Blocks angiotensin II from binding → vasodilation, reduced aldosterone, lower BP
            > NO BRADYKININ: Unlike ACE inhibitors, ARBs do NOT inhibit ACE → bradykinin NOT elevated → no cough
            > PRODRUG: Losartan is converted to active metabolite EXP-3174 (more potent) by CYP2C9
            > ALDOSTERONE: Reduced → less K+ excretion → hyperkalemia risk (same as ACE inhibitors)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. ARBs block ACE enzyme, preventing angiotensin I → II conversion",
                "B. ARBs block AT1 receptors, preventing angiotensin II from causing vasoconstriction",
                "C. ARBs stimulate AT2 receptors to produce bradykinin and vasodilation",
                "D. ARBs inhibit renin secretion from juxtaglomerular cells"
            ],
            correctAnswer: "B. ARBs block AT1 receptors, preventing angiotensin II from causing vasoconstriction",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.942,
            angle: .mechanism,
            baseConceptTitle: "LOSARTAN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LOSARTAN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — ARB adverse effects and contraindications
            > NO COUGH: Key advantage over ACE inhibitors — bradykinin not elevated
            > HYPERKALEMIA: Blocks aldosterone → K+ retention; avoid K+ supplements without monitoring
            > RENAL IMPAIRMENT: Can worsen renal function in bilateral renal artery stenosis
            > FETAL TOXICITY: CONTRAINDICATED in PREGNANCY (Category D) — same as ACE inhibitors
            > ANGIOEDEMA: Rare but possible (much less common than with ACE inhibitors)
            > DO NOT COMBINE: Losartan + ACE inhibitor + aliskiren in diabetes → dual RAAS blockade → serious adverse effects
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Dry, persistent cough — the most common ARB side effect",
                "B. Hyperkalemia and fetal toxicity; angioedema rare but possible; no cough",
                "C. Bradycardia — ARBs block sympathetic stimulation of the heart",
                "D. Hypocalcemia requiring regular calcium supplementation"
            ],
            correctAnswer: "B. Hyperkalemia and fetal toxicity; angioedema rare but possible; no cough",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.942,
            angle: .safety,
            baseConceptTitle: "LOSARTAN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LOSARTAN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Standard regimens and special populations
            > HTN STARTING DOSE: 50 mg once daily; range 25–100 mg/day (once or divided BID)
            > VOLUME-DEPLETED / RENAL IMPAIRMENT: Start at 25 mg once daily
            > DIABETIC NEPHROPATHY: 50 mg/day, increase to 100 mg/day based on BP
            > FOOD: No food interaction — take with or without meals
            > RENAL/HEPATIC: Reduce dose in hepatic impairment (CYP2C9 conversion); mild-moderate renal impairment OK
            > MONITORING: BP, serum K+, BUN/Cr at baseline and after initiation
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 100 mg twice daily — the minimum effective dose for hypertension",
                "B. 50 mg once daily; reduce to 25 mg in volume-depleted or hepatic impaired patients",
                "C. Must always be taken at bedtime to prevent morning BP surge",
                "D. Available only as injectable formulation — oral form is not bioavailable"
            ],
            correctAnswer: "B. 50 mg once daily; reduce to 25 mg in volume-depleted or hepatic impaired patients",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.942,
            angle: .dosing,
            baseConceptTitle: "LOSARTAN"
        ),

        // MARK: — ACETAMINOPHEN (Tylenol)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ACETAMINOPHEN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Appropriate uses of acetaminophen
            > CLASS: Analgesic / Antipyretic (Non-Opioid)
            > BRAND: Tylenol (many OTC products contain APAP)
            > USES: Mild-to-moderate pain (headache, dental pain, arthritis), fever reduction
            > ADVANTAGE: No GI ulceration risk (unlike NSAIDs); no platelet inhibition; safe in third trimester
            > PREFERRED IN: Elderly, patients on anticoagulants, GI bleeding history, mild osteoarthritis pain
            > COMBINATION PRODUCTS: Found in Norco (HCTZ/APAP is wrong — Norco = hydrocodone/APAP), Percocet, NyQuil, Vicodin — count ALL sources
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inflammatory arthritis — acetaminophen provides anti-inflammatory relief",
                "B. Mild-to-moderate pain and fever, especially when NSAIDs are contraindicated",
                "C. Neuropathic pain — acetaminophen targets nerve-specific pain pathways",
                "D. Migraine with aura — requires high-dose IV acetaminophen specifically"
            ],
            correctAnswer: "B. Mild-to-moderate pain and fever, especially when NSAIDs are contraindicated",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.948,
            angle: .indication,
            baseConceptTitle: "ACETAMINOPHEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ACETAMINOPHEN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How acetaminophen works (and why it's unique)
            > CLASS: Analgesic / Antipyretic
            > MECHANISM: Exact mechanism incompletely understood; proposed: central COX-3 inhibition; modulation of endocannabinoid system; serotonergic descending pain pathway
            > KEY FACT: NO significant peripheral anti-inflammatory effect (unlike NSAIDs)
            > NO GI PROTECTION FROM: NSAIDs' gastroprotective prostaglandins — acetaminophen doesn't affect them
            > FEVER: Inhibits prostaglandin synthesis in the hypothalamus → reduces fever set point
            > DOES NOT: Inhibit platelet aggregation (unlike aspirin/NSAIDs)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Peripherally blocks COX-1 and COX-2 to reduce inflammation",
                "B. Centrally acts to reduce pain perception and fever, without significant peripheral anti-inflammatory effect",
                "C. Blocks opioid receptors in the central nervous system",
                "D. Inhibits leukotriene synthesis via 5-lipoxygenase pathway"
            ],
            correctAnswer: "B. Centrally acts to reduce pain perception and fever, without significant peripheral anti-inflammatory effect",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.948,
            angle: .mechanism,
            baseConceptTitle: "ACETAMINOPHEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ACETAMINOPHEN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Hepatotoxicity and maximum dose limits
            > HEPATOTOXICITY: Overdose causes severe liver damage — leading cause of acute liver failure in the US
            > MECHANISM OF TOXICITY: NAPQI (toxic metabolite) accumulates when glutathione depleted
            > ANTIDOTE: N-acetylcysteine (NAC) — replenishes glutathione; most effective within 8–10 hours
            > MAX DOSE (healthy adults): 4,000 mg/day (FDA); many guidelines recommend 3,000 mg/day for safety
            > MAX DOSE (liver disease/alcoholism): 2,000 mg/day or AVOID
            > HIDDEN SOURCES: Many combination Rx and OTC products contain APAP — ALWAYS count all sources
            > ALCOHOL: Chronic heavy alcohol use + acetaminophen = dramatically increased hepatotoxicity risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Max dose is 8,000 mg/day for healthy adults — acetaminophen is very safe",
                "B. Hepatotoxicity from NAPQI accumulation — antidote is N-acetylcysteine; max 4,000 mg/day",
                "C. Renal toxicity is the primary concern — avoid in any patient with CrCl < 60",
                "D. Bleeding risk — all patients on acetaminophen need platelet count monitoring"
            ],
            correctAnswer: "B. Hepatotoxicity from NAPQI accumulation — antidote is N-acetylcysteine; max 4,000 mg/day",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.948,
            angle: .safety,
            baseConceptTitle: "ACETAMINOPHEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ACETAMINOPHEN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — How to safely dose and counsel on acetaminophen
            > ADULT DOSE: 325–1,000 mg every 4–6 hours as needed; not to exceed 4,000 mg/day (healthy); 3,000 mg/day (conservative)
            > PEDIATRIC: Weight-based dosing: 10–15 mg/kg every 4–6 hours; never exceed 5 doses in 24 hours
            > COUNTING: Count acetaminophen in ALL combination products (Norco, Percocet, Nyquil, Theraflu, etc.)
            > LIVER DISEASE: Limit to 2,000 mg/day or avoid altogether in severe hepatic impairment
            > ALCOHOL: No more than 3 drinks/day while taking acetaminophen; chronic alcoholics: avoid
            > OTC FORMULATIONS: 325 mg regular-strength, 500 mg extra-strength tablets; 650 mg ER tablets
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 500–1,000 mg every 2 hours as needed, up to 8,000 mg/day",
                "B. 325–1,000 mg every 4–6 hours, max 4,000 mg/day (healthy adults); count all product sources",
                "C. Only one dose of 1,000 mg per day is safe — higher amounts are always toxic",
                "D. Acetaminophen must always be taken with food — GI upset is the primary concern"
            ],
            correctAnswer: "B. 325–1,000 mg every 4–6 hours, max 4,000 mg/day (healthy adults); count all product sources",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.948,
            angle: .dosing,
            baseConceptTitle: "ACETAMINOPHEN"
        ),

        // MARK: — IBUPROFEN (Advil, Motrin)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "IBUPROFEN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — When is ibuprofen appropriate?
            > CLASS: Non-selective NSAID (Non-Steroidal Anti-Inflammatory Drug)
            > BRAND: Advil, Motrin, Caldolor (IV)
            > USES: Pain (mild-moderate), fever, inflammation, dysmenorrhea, arthritis, dental pain
            > ANTI-INFLAMMATORY: Used in rheumatoid arthritis, osteoarthritis, bursitis, tendinitis
            > ADVANTAGE OVER ACETAMINOPHEN: Actual anti-inflammatory effect for inflammatory conditions
            > NOTE: Use lowest effective dose for shortest duration to minimize GI/CV risks
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Neuropathic pain — ibuprofen targets nerve-specific COX-3 enzymes",
                "B. Pain, fever, and inflammation — preferred over acetaminophen when anti-inflammatory effect needed",
                "C. Migraine prevention — daily ibuprofen reduces frequency of migraine attacks",
                "D. Gout prevention — ibuprofen reduces uric acid production"
            ],
            correctAnswer: "B. Pain, fever, and inflammation — preferred over acetaminophen when anti-inflammatory effect needed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.954,
            angle: .indication,
            baseConceptTitle: "IBUPROFEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "IBUPROFEN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Dual COX inhibition
            > CLASS: Non-selective NSAID
            > TARGETS: Cyclooxygenase-1 (COX-1) AND Cyclooxygenase-2 (COX-2)
            > COX-1: Constitutive — protects gastric mucosa (prostaglandins maintain mucus layer); platelet aggregation (TXA2); renal blood flow
            > COX-2: Inducible — mediates inflammation, pain, and fever
            > NET EFFECT: Blocks both → analgesic + anti-inflammatory + antipyretic, BUT also GI ulceration risk and platelet inhibition
            > SELECTIVITY: Non-selective (both) vs. celecoxib (COX-2 selective) → less GI risk, more CV risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Selectively inhibits COX-2 only — no GI side effects",
                "B. Non-selectively inhibits both COX-1 and COX-2 — effective but GI ulceration risk",
                "C. Inhibits leukotriene synthesis via 5-LOX pathway — primarily for asthma",
                "D. Blocks prostaglandin receptors in the brain — central mechanism only"
            ],
            correctAnswer: "B. Non-selectively inhibits both COX-1 and COX-2 — effective but GI ulceration risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.954,
            angle: .mechanism,
            baseConceptTitle: "IBUPROFEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "IBUPROFEN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — GI, CV, and renal risks of NSAIDs
            > GI RISK: Peptic ulcer disease, GI bleeding (COX-1 inhibition → reduced gastroprotective prostaglandins)
            > GI PROTECTION: Add PPI (omeprazole) for high-risk patients (elderly, history of ulcers, warfarin)
            > CARDIOVASCULAR: Increased risk of MI and stroke (especially selective COX-2 inhibitors and high doses)
            > RENAL: NSAIDs reduce renal prostaglandins → reduced renal blood flow → AKI, fluid retention, hypertension
            > AVOID: Third trimester pregnancy (premature closure of ductus arteriosus)
            > AVOID WITH: Anticoagulants (additive GI bleed), ACE inhibitors/ARBs (AKI triad: NSAID + ACEI/ARB + diuretic)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. NSAIDs are safe to use with warfarin — no interaction exists",
                "B. GI ulceration, cardiovascular risk, renal impairment, and contraindicated in third trimester",
                "C. Hepatotoxicity requiring monthly liver function monitoring in all patients",
                "D. NSAIDs are the safest pain option in third trimester pregnancy"
            ],
            correctAnswer: "B. GI ulceration, cardiovascular risk, renal impairment, and contraindicated in third trimester",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.954,
            angle: .safety,
            baseConceptTitle: "IBUPROFEN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "IBUPROFEN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — OTC vs Rx doses and key counseling
            > OTC DOSE: 200–400 mg every 4–6 hours PRN, max 1,200 mg/day (OTC label)
            > RX DOSE: Up to 800 mg TID-QID, max 3,200 mg/day (anti-inflammatory)
            > TAKE WITH FOOD: Always take with food, milk, or antacids to reduce GI irritation
            > AVOID DEHYDRATION: Stay well hydrated — especially important for renal protection
            > DURATION: Use lowest effective dose for shortest necessary time
            > THIRD TRIMESTER: CONTRAINDICATED — may cause premature closure of fetal ductus arteriosus
            > ELDERLY: Use lowest possible dose; highest GI/renal/CV risk in this population
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take on an empty stomach for fastest onset — food reduces absorption",
                "B. Take with food to reduce GI irritation; OTC max 1,200 mg/day; Rx max 3,200 mg/day",
                "C. Maximum dose is 400 mg per day regardless of indication",
                "D. Avoid fluids with ibuprofen — water increases GI absorption and toxicity"
            ],
            correctAnswer: "B. Take with food to reduce GI irritation; OTC max 1,200 mg/day; Rx max 3,200 mg/day",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.954,
            angle: .dosing,
            baseConceptTitle: "IBUPROFEN"
        ),

        // MARK: — AZITHROMYCIN (Z-Pak)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AZITHROMYCIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Azithromycin clinical uses
            > CLASS: Macrolide Antibiotic
            > BRAND: Zithromax, Z-Pak (5-day course)
            > USES: Community-acquired pneumonia (CAP), pharyngitis (PCN-allergic), sinusitis, atypical pneumonia (Mycoplasma, Legionella, Chlamydophila)
            > STIs: Chlamydia (single 1g dose); gonorrhea (combined with ceftriaxone)
            > TRAVELER'S DIARRHEA: Azithromycin as alternative to ciprofloxacin
            > NOT FOR: Strep pharyngitis (resistance rate >30%) — use amoxicillin or penicillin instead if susceptible
            """,
            challengeType: .multipleChoice,
            options: [
                "A. MRSA skin and soft tissue infections",
                "B. CAP, atypical pneumonia, chlamydia STI, PCN-allergic patients",
                "C. C. difficile colitis as first-line therapy",
                "D. Urinary tract infections caused by E. coli"
            ],
            correctAnswer: "B. CAP, atypical pneumonia, chlamydia STI, PCN-allergic patients",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.960,
            angle: .indication,
            baseConceptTitle: "AZITHROMYCIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AZITHROMYCIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Protein synthesis inhibition
            > CLASS: Macrolide Antibiotic
            > TARGET: 50S ribosomal subunit of bacteria
            > EFFECT: Blocks translocation step of peptide elongation → inhibits bacterial protein synthesis
            > BACTERIOSTATIC: Generally; may be bactericidal at higher concentrations
            > ATYPICAL COVERAGE: Excellent intracellular penetration — reaches intracellular organisms (Mycoplasma, Legionella, Chlamydophila) that beta-lactams cannot
            > LONG HALF-LIFE: ~68 hours — allows once-daily dosing and short 5-day Z-Pak course with prolonged tissue concentrations
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Binds 30S ribosome — same mechanism as tetracyclines",
                "B. Binds 50S ribosomal subunit, blocking bacterial protein synthesis; bacteriostatic",
                "C. Inhibits DNA gyrase — same mechanism as fluoroquinolones",
                "D. Blocks cell wall synthesis — same mechanism as beta-lactam antibiotics"
            ],
            correctAnswer: "B. Binds 50S ribosomal subunit, blocking bacterial protein synthesis; bacteriostatic",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.960,
            angle: .mechanism,
            baseConceptTitle: "AZITHROMYCIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AZITHROMYCIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — QT prolongation and other risks
            > QT PROLONGATION: Major concern — FDA warning 2013; avoid in patients with known QT prolongation, hypokalemia, hypomagnesemia, or on other QT-prolonging drugs
            > AVOID WITH: Class IA/III antiarrhythmics (amiodarone, quinidine), fluoroquinolones, ondansetron
            > GI SIDE EFFECTS: Nausea, vomiting, diarrhea (most common complaints)
            > MOTILIN AGONIST: Azithromycin stimulates motilin receptors → GI motility → cramping, diarrhea
            > HEPATOTOXICITY: Rare cholestatic jaundice
            > CDAD: C. difficile-associated diarrhea possible with any antibiotic
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Tendon rupture — the FDA Black Box Warning for all macrolides",
                "B. QT prolongation — FDA warning 2013; avoid in patients with cardiac risk or QT-prolonging drugs",
                "C. Bone marrow suppression requiring CBC monitoring during therapy",
                "D. Nephrotoxicity — azithromycin is excreted entirely renally"
            ],
            correctAnswer: "B. QT prolongation — FDA warning 2013; avoid in patients with cardiac risk or QT-prolonging drugs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.960,
            angle: .safety,
            baseConceptTitle: "AZITHROMYCIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AZITHROMYCIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Z-Pak regimen and special indications
            > Z-PAK (CAP/Pharyngitis): 500 mg on Day 1, then 250 mg on Days 2–5 (total 5 days)
            > CHLAMYDIA STI: Single 1 gram oral dose (azithromycin 4 × 250 mg tablets at once)
            > LEGIONELLA/ATYPICAL CAP: 500 mg daily × 3 days (or 7–10 days for severe)
            > FOOD: Tablets: with or without food; Oral suspension: take on empty stomach (food reduces absorption)
            > RENAL/HEPATIC: Generally no dose adjustment needed; use caution in severe hepatic impairment
            > LONG HALF-LIFE: ~68 hours; tissue levels remain therapeutic for days after completing course
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 500 mg twice daily for 10 days for all respiratory infections",
                "B. 500 mg Day 1, then 250 mg Days 2–5 (Z-Pak); single 1g dose for chlamydia",
                "C. 250 mg once daily for 14 days — short courses are ineffective",
                "D. Always take on empty stomach — food reduces azithromycin absorption by 90%"
            ],
            correctAnswer: "B. 500 mg Day 1, then 250 mg Days 2–5 (Z-Pak); single 1g dose for chlamydia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.960,
            angle: .dosing,
            baseConceptTitle: "AZITHROMYCIN"
        ),

        // MARK: — GABAPENTIN (Neurontin)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — On-label and off-label uses
            > CLASS: Anticonvulsant / Gabapentinoid
            > BRAND: Neurontin
            > FDA-APPROVED: Partial (focal) seizures with or without secondary generalization; postherpetic neuralgia (PHN)
            > OFF-LABEL (very common): Diabetic peripheral neuropathy, fibromyalgia, restless leg syndrome, anxiety, alcohol withdrawal
            > HIGH VOLUME: One of the most frequently dispensed drugs in the US — primarily for off-label pain
            > CONTROLLED STATUS: Not federally scheduled, but CIII in several states (abuse potential recognized)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Type 1 epilepsy requiring first-line monotherapy",
                "B. Partial seizures and postherpetic neuralgia (FDA-approved); widely used off-label for neuropathic pain",
                "C. Atonic (drop) seizures and absence epilepsy",
                "D. Bipolar disorder as primary mood stabilizer"
            ],
            correctAnswer: "B. Partial seizures and postherpetic neuralgia (FDA-approved); widely used off-label for neuropathic pain",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.966,
            angle: .indication,
            baseConceptTitle: "GABAPENTIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — How gabapentin modulates pain and seizures
            > CLASS: Gabapentinoid / Structural GABA Analog
            > DESPITE NAME: Gabapentin does NOT bind to GABA receptors
            > ACTUAL TARGET: Alpha-2-delta (α2δ) subunit of voltage-gated calcium channels
            > EFFECT: Reduces presynaptic calcium influx → decreased release of excitatory neurotransmitters (glutamate, substance P, norepinephrine)
            > RESULT: Anticonvulsant effect; reduced pain signaling in neuropathic pain
            > ABSORPTION: Non-linear, saturable absorption — higher doses have proportionally less bioavailability
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Enhances GABA binding at GABA-A receptors — same mechanism as benzodiazepines",
                "B. Binds alpha-2-delta subunit of voltage-gated Ca2+ channels — reduces excitatory neurotransmitter release",
                "C. Blocks sodium channels — same mechanism as carbamazepine and phenytoin",
                "D. Inhibits GABA transaminase — same mechanism as vigabatrin"
            ],
            correctAnswer: "B. Binds alpha-2-delta subunit of voltage-gated Ca2+ channels — reduces excitatory neurotransmitter release",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.966,
            angle: .mechanism,
            baseConceptTitle: "GABAPENTIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Somnolence and withdrawal risks
            > CNS EFFECTS: Sedation, dizziness, ataxia (dose-dependent) — most common adverse effects
            > RESPIRATORY DEPRESSION: Significant risk when combined with opioids, benzodiazepines, or alcohol — FDA Black Box Warning (with opioids)
            > PERIPHERAL EDEMA: Weight gain and edema in some patients
            > ABRUPT DISCONTINUATION: Can cause seizures and withdrawal symptoms — always taper
            > ABUSE POTENTIAL: Misused recreationally for euphoric effects (potentiates opioid high); controlled in several states
            > RENAL EXCRETION: Excreted unchanged renally — require significant dose reduction in CKD
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hepatotoxicity requiring regular LFT monitoring in all patients",
                "B. Respiratory depression when combined with opioids (FDA BBW); sedation; withdrawal seizures if stopped abruptly",
                "C. QT prolongation requiring ECG monitoring before therapy",
                "D. Severe hypoglycemia in diabetic patients via pancreatic beta-cell stimulation"
            ],
            correctAnswer: "B. Respiratory depression when combined with opioids (FDA BBW); sedation; withdrawal seizures if stopped abruptly",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.966,
            angle: .safety,
            baseConceptTitle: "GABAPENTIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Titration and renal adjustment
            > NEUROPATHIC PAIN START: 300 mg on Day 1, 300 mg BID on Day 2, 300 mg TID on Day 3
            > MAINTENANCE: 300–600 mg TID (1800 mg/day common target); maximum 3600 mg/day
            > TITRATION: Slowly increase — rapid titration increases CNS side effects
            > SEIZURES: 300–1200 mg TID (total 3600 mg/day max)
            > RENAL DOSE ADJUSTMENT: CrCl 30–60 → 200–700 mg BID; CrCl 15–30 → 200–700 mg daily; CrCl < 15 → 100–300 mg daily
            > FOOD: No significant food interaction; can be taken with or without food
            > CANNOT BE CRUSHED: Some sustained-release products (Gralise) require whole tablet
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Start 1200 mg TID immediately — dose-dependent responses require high starting doses",
                "B. Start 300 mg daily, titrate to TID; adjust dose in renal impairment (renally cleared)",
                "C. No dose adjustment needed in any degree of renal impairment",
                "D. Administer at bedtime only — daytime sedation is unavoidable with any dosing"
            ],
            correctAnswer: "B. Start 300 mg daily, titrate to TID; adjust dose in renal impairment (renally cleared)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.966,
            angle: .dosing,
            baseConceptTitle: "GABAPENTIN"
        ),

        // MARK: — PREDNISONE (Corticosteroid)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREDNISONE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Broad anti-inflammatory uses
            > CLASS: Systemic Glucocorticoid (Corticosteroid)
            > BRAND: Deltasone
            > USES: Asthma exacerbations, COPD exacerbations, severe allergic reactions, autoimmune disorders (RA, lupus), organ transplant rejection prevention, certain cancers, adrenal insufficiency (physiologic replacement)
            > BURST THERAPY: Short 5–7 day courses for asthma/COPD flares — generally no tapering needed
            > LONG-TERM: Requires gradual taper and monitoring for multiple side effects
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Mild intermittent asthma as daily maintenance therapy",
                "B. Asthma/COPD exacerbations, autoimmune conditions, severe allergic reactions",
                "C. Type 2 diabetes — prednisone reduces insulin resistance",
                "D. Bacterial infections — prednisone enhances antibiotic activity"
            ],
            correctAnswer: "B. Asthma/COPD exacerbations, autoimmune conditions, severe allergic reactions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.972,
            angle: .indication,
            baseConceptTitle: "PREDNISONE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREDNISONE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Anti-inflammatory genomic effects
            > CLASS: Glucocorticoid
            > MECHANISM: Binds intracellular glucocorticoid receptor → receptor complex enters nucleus → modifies gene transcription
            > ANTI-INFLAMMATORY EFFECTS: Reduces synthesis of prostaglandins, leukotrienes, cytokines (IL-1, IL-6, TNF-α), and other inflammatory mediators
            > IMMUNOSUPPRESSIVE: Reduces lymphocyte proliferation and function; inhibits mast cells
            > PRODRUG: Prednisone is converted to prednisolone (active form) in the liver
            > QUICK EFFECTS: Some actions occur rapidly (membrane-level); full genomic effects take hours
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits COX-1 and COX-2 enzymes peripherally — same as NSAIDs",
                "B. Binds glucocorticoid receptors → modulates gene transcription → reduces inflammatory mediator synthesis",
                "C. Blocks histamine H1 receptors — antihistamine mechanism underlying anti-inflammation",
                "D. Inhibits leukotriene receptors — same mechanism as montelukast"
            ],
            correctAnswer: "B. Binds glucocorticoid receptors → modulates gene transcription → reduces inflammatory mediator synthesis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.972,
            angle: .mechanism,
            baseConceptTitle: "PREDNISONE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREDNISONE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — HPA suppression and long-term effects
            > HPA AXIS SUPPRESSION: Long-term use (> 2–3 weeks) suppresses adrenal glands — NEVER stop abruptly; must taper
            > ADRENAL CRISIS: Abrupt discontinuation after long-term use → life-threatening adrenal insufficiency
            > HYPERGLYCEMIA: Significant glucose elevation especially in diabetics — monitor blood sugar
            > OSTEOPOROSIS: Long-term use → bone loss; supplement calcium + Vit D; bisphosphonate if prolonged
            > CUSHING SYNDROME: Long-term: moon face, buffalo hump, central obesity, striae, hypertension
            > PEPTIC ULCER: Impairs gastric mucosal defense — take with food or PPI for high-risk patients
            > IMMUNOSUPPRESSION: Increased susceptibility to infections; avoid live vaccines
            """,
            challengeType: .multipleChoice,
            options: [
                "A. It is safe to stop prednisone abruptly after any course of therapy",
                "B. After > 2–3 weeks, must taper — abrupt stoppage causes adrenal crisis",
                "C. Prednisone lowers blood glucose — monitor for hypoglycemia in diabetics",
                "D. Prednisone strengthens bones — used to treat osteoporosis"
            ],
            correctAnswer: "B. After > 2–3 weeks, must taper — abrupt stoppage causes adrenal crisis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.972,
            angle: .safety,
            baseConceptTitle: "PREDNISONE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREDNISONE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Burst, taper, and timing
            > BURST DOSE (asthma/COPD): 40–60 mg/day × 5–7 days — no taper needed for short courses
            > ANTI-INFLAMMATORY: 0.5–1 mg/kg/day (physiologic dose is 5–7.5 mg/day equivalent)
            > TAKE WITH FOOD: Reduces GI irritation and peptic ulcer risk
            > MORNING DOSING: Aligns with natural cortisol peak (reduces HPA suppression)
            > ALTERNATE DAY THERAPY: For long-term use → reduces HPA suppression and some side effects
            > TAPER: For courses > 2–3 weeks, gradually reduce over days to weeks depending on duration
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take at bedtime — peak anti-inflammatory effect occurs during sleep",
                "B. Take in the morning with food; taper doses taken for more than 2–3 weeks",
                "C. Take on an empty stomach — food significantly reduces prednisone absorption",
                "D. Dosing time is irrelevant for prednisone — take whenever convenient"
            ],
            correctAnswer: "B. Take in the morning with food; taper doses taken for more than 2–3 weeks",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.972,
            angle: .dosing,
            baseConceptTitle: "PREDNISONE"
        ),

        // MARK: — CLOPIDOGREL (Plavix)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CLOPIDOGREL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Antiplatelet uses for cardiovascular protection
            > CLASS: P2Y12 ADP Receptor Antagonist (Antiplatelet Agent)
            > BRAND: Plavix
            > USES: Acute coronary syndrome (ACS), recent MI or stroke, percutaneous coronary intervention (PCI) / coronary stent placement, peripheral arterial disease (PAD)
            > DUAL ANTIPLATELET THERAPY (DAPT): Clopidogrel + aspirin is standard of care after ACS/stent
            > NOTE: Clopidogrel alone or with aspirin reduces risk of recurrent cardiovascular events
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Anticoagulation for atrial fibrillation — clopidogrel replaces warfarin",
                "B. ACS, recent MI/stroke, coronary stent placement, peripheral arterial disease",
                "C. Hyperlipidemia management — reduces platelet-bound cholesterol",
                "D. Hypertension refractory to other antihypertensive agents"
            ],
            correctAnswer: "B. ACS, recent MI/stroke, coronary stent placement, peripheral arterial disease",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.978,
            angle: .indication,
            baseConceptTitle: "CLOPIDOGREL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CLOPIDOGREL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Prodrug activation and irreversible platelet inhibition
            > CLASS: P2Y12 ADP Receptor Antagonist
            > PRODRUG: Clopidogrel must be converted to active metabolite by CYP2C19 in the liver
            > ACTIVE METABOLITE: Irreversibly binds to P2Y12 ADP receptors on platelets
            > EFFECT: Blocks ADP-mediated platelet activation and aggregation → reduces thrombus formation
            > IRREVERSIBLE: Platelet inhibition lasts the platelet's lifetime (~7–10 days)
            > CYP2C19 POOR METABOLIZERS: ~20% of patients — reduced conversion → less antiplatelet effect ("clopidogrel resistance")
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Directly inhibits COX-1 on platelets — same mechanism as aspirin",
                "B. Prodrug activated by CYP2C19; active metabolite irreversibly blocks P2Y12 ADP receptors on platelets",
                "C. Inhibits thromboxane A2 synthesis — reduces platelet aggregation without receptor binding",
                "D. Directly inhibits thrombin (Factor IIa) — same mechanism as dabigatran"
            ],
            correctAnswer: "B. Prodrug activated by CYP2C19; active metabolite irreversibly blocks P2Y12 ADP receptors on platelets",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.978,
            angle: .mechanism,
            baseConceptTitle: "CLOPIDOGREL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CLOPIDOGREL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Bleeding risk and CYP2C19 drug interaction
            > BLEEDING: Primary risk — increased bruising, GI bleeding; no reversal agent like warfarin
            > OMEPRAZOLE INTERACTION: Omeprazole inhibits CYP2C19 → reduces clopidogrel activation → reduced antiplatelet effect (FDA warning) — use PANTOPRAZOLE instead for gastroprotection
            > CYP2C19 POOR METABOLIZERS: Genetic variants (15–25% of patients) → reduced drug activation → cardiovascular events → FDA Black Box Warning; genetic testing available
            > HOLD BEFORE SURGERY: Stop 5–7 days before elective surgery (irreversible platelet inhibition)
            > TTP: Rare but serious — thrombotic thrombocytopenic purpura reported
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Use omeprazole for gastroprotection — it enhances clopidogrel's antiplatelet activity",
                "B. Omeprazole inhibits CYP2C19, reducing clopidogrel activation — use pantoprazole instead",
                "C. Clopidogrel is reversible — no need to hold before surgery",
                "D. CYP2C19 genetic variation has no clinical impact on clopidogrel effectiveness"
            ],
            correctAnswer: "B. Omeprazole inhibits CYP2C19, reducing clopidogrel activation — use pantoprazole instead",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.978,
            angle: .safety,
            baseConceptTitle: "CLOPIDOGREL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CLOPIDOGREL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Loading doses and maintenance
            > MAINTENANCE DOSE: 75 mg once daily (with or without food)
            > LOADING DOSE (ACS/PCI): 300–600 mg single loading dose before procedure, then 75 mg/day
            > DAPT: Combined with aspirin 81 mg/day — duration depends on stent type (6–12 months for drug-eluting)
            > FOOD: No significant food interaction — may take with or without meals
            > HEPATIC: Caution in moderate hepatic impairment (CYP2C19 activation); avoid in severe
            > HOLD: Discontinue 5–7 days before elective surgery (platelet function returns as new platelets form)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 75 mg twice daily maintenance; 150 mg loading dose for ACS",
                "B. 75 mg once daily maintenance; 300–600 mg loading dose before PCI; stop 5–7 days before surgery",
                "C. 300 mg once daily — lower doses are ineffective for antiplatelet therapy",
                "D. Loading dose is not needed — therapeutic levels reached after 2 weeks of 75 mg daily"
            ],
            correctAnswer: "B. 75 mg once daily maintenance; 300–600 mg loading dose before PCI; stop 5–7 days before surgery",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.978,
            angle: .dosing,
            baseConceptTitle: "CLOPIDOGREL"
        ),

        // MARK: — TRAMADOL (Ultram)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Appropriate uses of tramadol
            > CLASS: Opioid Agonist + SNRI (Dual-Mechanism Analgesic)
            > BRAND: Ultram, ConZip (ER)
            > DEA: Schedule CIV (federally)
            > USES: Moderate to moderately-severe pain (acute and chronic)
            > NOT APPROPRIATE FOR: Severe pain requiring full opioid agonist; patients with history of seizures; patients on MAOIs, SSRIs, or SNRIs (serotonin syndrome risk)
            > COMPARED TO OPIOIDS: Less respiratory depression at standard doses; still has significant abuse potential
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Severe cancer pain requiring strong opioid therapy",
                "B. Moderate to moderately-severe pain when non-opioid analgesics are insufficient",
                "C. Cough suppression — tramadol is primarily an antitussive agent",
                "D. Anxiety and panic disorder management via SNRI activity"
            ],
            correctAnswer: "B. Moderate to moderately-severe pain when non-opioid analgesics are insufficient",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.984,
            angle: .indication,
            baseConceptTitle: "TRAMADOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Dual opioid and monoamine mechanism
            > CLASS: CIV Opioid Agonist + Serotonin/Norepinephrine Reuptake Inhibitor
            > OPIOID COMPONENT: Weak mu-opioid receptor agonist (itself); STRONG after CYP2D6 metabolism to O-desmethyltramadol
            > SNRI COMPONENT: Inhibits reuptake of serotonin and norepinephrine → descending pain pathway modulation
            > NET RESULT: Analgesia via two mechanisms — explains efficacy in neuropathic pain
            > PRODRUG: CYP2D6 converts tramadol to active O-desmethyltramadol; poor metabolizers get less analgesia; ultra-rapid metabolizers get dangerous opioid effect
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Full mu-opioid receptor agonist — same potency as morphine",
                "B. Weak mu-opioid agonist + serotonin and norepinephrine reuptake inhibition (dual mechanism)",
                "C. GABA-A receptor potentiator — same mechanism as benzodiazepines",
                "D. Pure SNRI — no opioid receptor activity whatsoever"
            ],
            correctAnswer: "B. Weak mu-opioid agonist + serotonin and norepinephrine reuptake inhibition (dual mechanism)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.984,
            angle: .mechanism,
            baseConceptTitle: "TRAMADOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Seizure risk and serotonin syndrome
            > SEIZURE RISK: Dose-dependent risk; significantly increased with SSRIs/SNRIs/TCAs — FDA warning
            > SEROTONIN SYNDROME: Combining tramadol + SSRIs/SNRIs/MAOIs → serotonin syndrome risk
            > RESPIRATORY DEPRESSION: Present but less than full opioids at standard doses; risk with CNS depressants
            > ABUSE POTENTIAL: Physical and psychological dependence; CIV scheduled
            > CYP2D6 ULTRA-RAPID METABOLIZERS: Convert tramadol rapidly to strong opioid metabolite → overdose risk
            > AVOID IN: History of seizures, current MAOI use (within 14 days), renal/hepatic failure (accumulation)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Tramadol combined with SSRIs has no meaningful interaction — safe combination",
                "B. Seizure risk and serotonin syndrome — dangerous combination with SSRIs/SNRIs/MAOIs",
                "C. Tramadol causes hyperkalemia via renal potassium retention",
                "D. Hepatotoxicity from NAPQI accumulation — identical mechanism to acetaminophen"
            ],
            correctAnswer: "B. Seizure risk and serotonin syndrome — dangerous combination with SSRIs/SNRIs/MAOIs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.984,
            angle: .safety,
            baseConceptTitle: "TRAMADOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Standard dosing and key restrictions
            > IMMEDIATE-RELEASE: 50–100 mg every 4–6 hours PRN; max 400 mg/day (300 mg/day in patients > 75 years)
            > EXTENDED-RELEASE (ConZip): 100–300 mg once daily; for patients requiring around-the-clock pain control
            > RENAL DOSE ADJUST: CrCl < 30 → 50–100 mg q12h (not ER); max 200 mg/day
            > HEPATIC: Cirrhosis → 50 mg q12h only (not ER)
            > TITRATION: Start low (50 mg/day), titrate over days to minimize seizure/GI side effects
            > DEA: CIV — applies all CIV prescription and refill rules (up to 5 refills in 6 months)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 200 mg as a single daily dose for all patients",
                "B. 50–100 mg every 4–6 hours PRN; max 400 mg/day; reduce in elderly and renal/hepatic impairment",
                "C. No dose adjustment needed in renal or hepatic impairment",
                "D. 400 mg TID (1200 mg/day) for severe neuropathic pain"
            ],
            correctAnswer: "B. 50–100 mg every 4–6 hours PRN; max 400 mg/day; reduce in elderly and renal/hepatic impairment",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.984,
            angle: .dosing,
            baseConceptTitle: "TRAMADOL"
        ),

        // MARK: — MONTELUKAST (Singulair)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "MONTELUKAST / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Asthma controller and allergy uses
            > CLASS: Leukotriene Receptor Antagonist (LTRA)
            > BRAND: Singulair
            > FDA-APPROVED: Asthma prophylaxis/maintenance (age ≥ 1 year), allergic rhinitis (seasonal and perennial), exercise-induced bronchoconstriction (EIB) prevention
            > NOT FOR: Acute bronchospasm — not a rescue medication
            > NOTE: 2020 FDA Black Box Warning added for neuropsychiatric effects — reserve for those who cannot use ICS or antihistamines
            > PEDIATRIC: Available as chewable tablet (4 mg, 5 mg) and granules — age-based dosing
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Rescue treatment for acute asthma attacks",
                "B. Asthma maintenance, allergic rhinitis, and exercise-induced bronchoconstriction prevention",
                "C. COPD management — preferred over inhaled bronchodilators",
                "D. Urticaria and anaphylaxis emergency management"
            ],
            correctAnswer: "B. Asthma maintenance, allergic rhinitis, and exercise-induced bronchoconstriction prevention",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.990,
            angle: .indication,
            baseConceptTitle: "MONTELUKAST"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "MONTELUKAST / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Leukotriene receptor blockade
            > CLASS: LTRA (Leukotriene Receptor Antagonist)
            > TARGET: CysLT1 (cysteinyl leukotriene type 1) receptors in airways and nasal mucosa
            > LEUKOTRIENES: Lipid mediators produced by mast cells and eosinophils — cause bronchoconstriction, mucus hypersecretion, airway inflammation, and eosinophil recruitment
            > EFFECT: Blocking CysLT1 → reduces bronchoconstriction, edema, and mucus production
            > NOT A BRONCHODILATOR: Works preventively/chronically; does not cause immediate bronchodilation
            > ASPIRIN-EXACERBATED ASTHMA: LTRAs are particularly useful (leukotrienes mediate aspirin-induced bronchoconstriction)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Blocks beta-2 receptors in airways to prevent bronchoconstriction",
                "B. Inhibits histamine H1 receptors in nasal mucosa and airways",
                "C. Blocks CysLT1 leukotriene receptors — reduces bronchoconstriction and airway inflammation",
                "D. Inhibits IgE binding to mast cells — prevents allergen-triggered histamine release"
            ],
            correctAnswer: "C. Blocks CysLT1 leukotriene receptors — reduces bronchoconstriction and airway inflammation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.990,
            angle: .mechanism,
            baseConceptTitle: "MONTELUKAST"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "MONTELUKAST / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Neuropsychiatric Black Box Warning (2020)
            > BLACK BOX WARNING (2020): Serious neuropsychiatric adverse events including agitation, aggression, anxiety, depression, hallucinations, insomnia, irritability, restlessness, suicidal thinking and behavior, and tremor
            > CHURG-STRAUSS SYNDROME: Rare eosinophilic vasculitis — reported when tapering corticosteroids while on LTRA
            > GI SIDE EFFECTS: Mild — headache, abdominal pain, elevated liver enzymes (uncommon)
            > DISCONTINUE: Advise patients to report any mood/behavior changes immediately
            > WHO TO AVOID: Patients with depression, anxiety, or suicidal ideation — use ICS or antihistamines instead
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hepatotoxicity — requires monthly LFT monitoring in all patients",
                "B. Neuropsychiatric events (depression, suicidal thoughts, aggression) — FDA Black Box Warning 2020",
                "C. Severe bronchoconstriction — montelukast paradoxically worsens asthma in some patients",
                "D. QT prolongation — requires ECG monitoring before starting therapy"
            ],
            correctAnswer: "B. Neuropsychiatric events (depression, suicidal thoughts, aggression) — FDA Black Box Warning 2020",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.990,
            angle: .safety,
            baseConceptTitle: "MONTELUKAST"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "MONTELUKAST / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Age-based dosing and timing
            > ADULTS (15+ years): 10 mg once daily (tablet)
            > CHILDREN 6–14 years: 5 mg once daily (chewable tablet)
            > CHILDREN 2–5 years: 4 mg once daily (chewable tablet or granules)
            > INFANTS 6–23 months: 4 mg granule packet (asthma only)
            > TIMING: For asthma — take in the evening; for EIB — take 2 hours before exercise (do not take additional dose within 24h)
            > ALLERGIC RHINITIS: Can be taken any time of day
            > NO DOSE ADJUSTMENT: Needed for renal or hepatic impairment (mild-moderate); metabolized hepatically
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Adults: 5 mg twice daily; children: 10 mg once daily",
                "B. Adults: 10 mg once daily (evening for asthma); 2 hours before exercise for EIB prevention",
                "C. All ages receive 10 mg — weight-based adjustment not needed for LTRAs",
                "D. Take in the morning — evening dosing reduces drug efficacy in asthma"
            ],
            correctAnswer: "B. Adults: 10 mg once daily (evening for asthma); 2 hours before exercise for EIB prevention",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.990,
            angle: .dosing,
            baseConceptTitle: "MONTELUKAST"
        ),

        // MARK: — BUPROPION (Wellbutrin, Zyban)

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPROPION / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Indication — Antidepressant and smoking cessation uses
            > CLASS: Norepinephrine-Dopamine Reuptake Inhibitor (NDRI) / Atypical Antidepressant
            > BRAND: Wellbutrin (depression), Zyban (smoking cessation), Aplenzin
            > FDA-APPROVED: Major depressive disorder (MDD), seasonal affective disorder (SAD), smoking cessation (Zyban)
            > OFF-LABEL: ADHD (particularly in adults), weight loss, sexual dysfunction caused by SSRIs (add-on)
            > ADVANTAGE: NO sexual dysfunction (unlike SSRIs); no weight gain (may promote weight loss)
            > ADVANTAGE: Can be used when SSRIs are not tolerated or ineffective
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Generalized anxiety disorder as first-line pharmacotherapy",
                "B. MDD, seasonal affective disorder, and smoking cessation; also used off-label for ADHD",
                "C. Bipolar I disorder mania — bupropion stabilizes mood during manic episodes",
                "D. Obsessive-compulsive disorder — first-line with exposure and response prevention"
            ],
            correctAnswer: "B. MDD, seasonal affective disorder, and smoking cessation; also used off-label for ADHD",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.18,
            yOffset: 0.996,
            angle: .indication,
            baseConceptTitle: "BUPROPION"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPROPION / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Mechanism — Dopamine and norepinephrine reuptake inhibition
            > CLASS: NDRI (Norepinephrine-Dopamine Reuptake Inhibitor)
            > EFFECT: Inhibits reuptake of norepinephrine and dopamine (NOT serotonin)
            > SMOKING CESSATION: Also antagonizes nicotinic acetylcholine receptors — reduces nicotine reward
            > RESULT: Increased synaptic dopamine (mood, motivation, reward) and norepinephrine (alertness, attention)
            > NO SEROTONIN: Explains lack of sexual dysfunction and serotonin syndrome risk (alone)
            > ACTIVATING: Can cause insomnia, anxiety, agitation — opposite to sedating SSRIs
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Selectively inhibits serotonin reuptake — same mechanism as SSRIs",
                "B. Inhibits norepinephrine and dopamine reuptake; antagonizes nicotinic receptors for smoking cessation",
                "C. MAO inhibition — prevents breakdown of norepinephrine, dopamine, and serotonin",
                "D. Potentiates GABA at GABA-A receptors — anti-anxiety and mood-stabilizing effect"
            ],
            correctAnswer: "B. Inhibits norepinephrine and dopamine reuptake; antagonizes nicotinic receptors for smoking cessation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.996,
            angle: .mechanism,
            baseConceptTitle: "BUPROPION"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPROPION / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Safety — Seizure risk and contraindications
            > SEIZURE RISK: Dose-dependent; risk increases significantly at doses > 450 mg/day
            > CONTRAINDICATED IN: Seizure disorders, bulimia nervosa, anorexia nervosa (dramatically elevated seizure risk), abrupt alcohol/benzo withdrawal
            > AVOID IN: Patients on MAOIs (within 14 days); risk of hypertensive crisis
            > NEUROPSYCHIATRIC: Black Box Warning for increased suicidal ideation in ≤24-year-olds (same as all antidepressants)
            > STOPPING SMOKING: Neuropsychiatric events (hostility, agitation, depressed mood) with varenicline/bupropion use for smoking cessation — FDA warning
            > ADVANTAGES: No sexual dysfunction, no weight gain/often weight loss, no serotonin syndrome risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Bupropion is safe in patients with eating disorders — the only antidepressant without restriction",
                "B. Contraindicated in seizure disorders and eating disorders (bulimia/anorexia) — significantly increases seizure risk",
                "C. Sexual dysfunction is the most common serious adverse effect requiring drug discontinuation",
                "D. Bupropion should be used first-line for smoking cessation in patients with seizure disorders"
            ],
            correctAnswer: "B. Contraindicated in seizure disorders and eating disorders (bulimia/anorexia) — significantly increases seizure risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.58,
            yOffset: 0.996,
            angle: .safety,
            baseConceptTitle: "BUPROPION"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPROPION / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Dosing — Formulations, titration, and maximum dose
            > IR (Wellbutrin): 100 mg BID × 3 days, then 100 mg TID; max 450 mg/day (150 mg per dose)
            > SR (Wellbutrin SR): 150 mg QAM × 3 days, then 150 mg BID; max 400 mg/day (200 mg per dose)
            > XL (Wellbutrin XL): 150 mg QAM × 4 days, then 300 mg QAM; max 450 mg/day (one XL dose)
            > SMOKING (Zyban): Start 150 mg/day × 3 days, then 150 mg BID; begin 1–2 weeks before quit date; duration 7–12 weeks
            > SEIZURE RULE: Do not exceed 150 mg per dose (IR); do not crush SR/XL
            > SEPARATE DOSES: Space doses ≥ 8 hours apart to minimize seizure risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Maximum single dose is 300 mg — high single doses improve efficacy",
                "B. Never exceed 150 mg per IR dose; space doses ≥ 8 hours; max daily dose varies by formulation",
                "C. Crush extended-release tablet for faster onset in severely depressed patients",
                "D. Once-daily dosing of immediate-release bupropion is preferred for compliance"
            ],
            correctAnswer: "B. Never exceed 150 mg per IR dose; space doses ≥ 8 hours; max daily dose varies by formulation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.996,
            angle: .dosing,
            baseConceptTitle: "BUPROPION"
        ),

    ]}
}
