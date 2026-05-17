import Foundation

// Multi-Angle Phase 9.5 — D1c Interactions & Counseling
// 12 drugs × 2 angles = 24 nodes (all with full MCQ content)

let multiAngleNodes_D1e: [DataNode] = [

    // ============================================================
    // FUROSEMIDE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FUROSEMIDE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CRITICAL PAIRS: Furosemide + aminoglycosides → additive ototoxicity (hearing loss).
        > FUROSEMIDE + NSAIDs → reduced diuretic effect (prostaglandin antagonism).
        > FUROSEMIDE + lithium → lithium toxicity (reduces renal lithium clearance).
        > FUROSEMIDE + digoxin → hypokalemia from furosemide worsens digoxin toxicity.
        > FUROSEMIDE + antihypertensives → additive hypotension.
        > SULFA ALLERGY: Cross-reactivity rare but possible (monitor).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Furosemide + NSAIDs increases diuretic effect through synergistic prostaglandin stimulation",
            "B. Furosemide + aminoglycosides causes additive ototoxicity; furosemide + lithium raises lithium levels; furosemide-induced hypokalemia worsens digoxin toxicity",
            "C. Furosemide has no clinically significant drug interactions because it is renally eliminated",
            "D. Furosemide + ACE inhibitors causes hyperkalemia because both retain potassium"
        ],
        correctAnswer: "B. Furosemide + aminoglycosides causes additive ototoxicity; furosemide + lithium raises lithium levels; furosemide-induced hypokalemia worsens digoxin toxicity",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.930,
        angle: .safety,
        baseConceptTitle: "FUROSEMIDE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "FUROSEMIDE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TIMING: Take in morning (or morning + afternoon) to avoid nocturia.
        > POTASSIUM: Eat potassium-rich foods (bananas, oranges, potatoes) or take K+ supplement.
        > MONITOR: Daily weight — report >2 lbs/day gain to provider.
        > ORTHOSTATIC: Rise slowly; dizziness/lightheadedness common initially.
        > FLUID INTAKE: Do not restrict water unless told by provider.
        > LABS: Regular electrolyte and renal function monitoring required.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Take furosemide at bedtime to maximize overnight diuresis and kidney protection",
            "B. Take in the morning to avoid nighttime urination; eat potassium-rich foods; report weight gain >2 lbs/day",
            "C. Restrict fluid intake to less than 1 liter per day while taking furosemide",
            "D. Furosemide does not affect electrolytes, so diet modification is unnecessary"
        ],
        correctAnswer: "B. Take in the morning to avoid nighttime urination; eat potassium-rich foods; report weight gain >2 lbs/day",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.930,
        angle: .safety,
        baseConceptTitle: "FUROSEMIDE"
    ),

    // ============================================================
    // HCTZ — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "HCTZ / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > HCTZ + NSAIDs → reduced antihypertensive effect.
        > HCTZ + lithium → lithium toxicity (volume depletion increases reabsorption).
        > HCTZ + digoxin → hypokalemia potentiates digoxin toxicity.
        > HCTZ + oral antidiabetics → hyperglycemia (thiazides impair insulin release).
        > HCTZ + cholestyramine → reduced HCTZ absorption (give HCTZ 1 hr before).
        > SULFONAMIDE ALLERGY: True cross-reactivity is rare.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. HCTZ + lithium is safe because thiazides increase lithium excretion through volume expansion",
            "B. HCTZ + lithium raises lithium levels (volume depletion increases reabsorption); HCTZ + digoxin: hypokalemia worsens digoxin toxicity; HCTZ raises blood sugar",
            "C. HCTZ + NSAIDs increases diuretic effect through complementary mechanisms",
            "D. HCTZ has no interaction with antidiabetic medications"
        ],
        correctAnswer: "B. HCTZ + lithium raises lithium levels (volume depletion increases reabsorption); HCTZ + digoxin: hypokalemia worsens digoxin toxicity; HCTZ raises blood sugar",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.936,
        angle: .safety,
        baseConceptTitle: "HCTZ"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "HCTZ / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SUN SENSITIVITY: HCTZ causes photosensitivity — use sunscreen, wear protective clothing.
        > POTASSIUM: Low-dose HCTZ (12.5–25 mg) rarely causes significant K+ loss, but monitor.
        > TIMING: Morning dosing preferred.
        > GLUCOSE: May raise blood sugar — diabetics should monitor glucose closely.
        > GOUT: May trigger gout attacks by raising uric acid.
        > ELECTROLYTES: Report muscle cramps, weakness (sign of hypokalemia).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. HCTZ is safe to take at night and does not affect sun exposure or blood glucose",
            "B. HCTZ causes photosensitivity (use sunscreen); may raise blood glucose and uric acid; take in the morning; report muscle cramps",
            "C. HCTZ routinely causes life-threatening hyperkalemia and requires weekly potassium monitoring",
            "D. HCTZ lowers blood glucose, making it beneficial for diabetic patients"
        ],
        correctAnswer: "B. HCTZ causes photosensitivity (use sunscreen); may raise blood glucose and uric acid; take in the morning; report muscle cramps",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.936,
        angle: .safety,
        baseConceptTitle: "HCTZ"
    ),

    // ============================================================
    // LOSARTAN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LOSARTAN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > LOSARTAN + K-SPARING DIURETICS/K+ SUPPLEMENTS → hyperkalemia.
        > LOSARTAN + ACE INHIBITORS → NOT recommended (dual RAS blockade: hyperkalemia, renal failure).
        > LOSARTAN + NSAIDs → reduced antihypertensive effect; acute renal failure in at-risk patients.
        > LOSARTAN + RIFAMPIN → CYP2C9 inducer reduces losartan levels.
        > LOSARTAN + FLUCONAZOLE → CYP2C9 inhibitor increases active metabolite (E-3174) levels.
        > PREGNANCY: Category X — absolutely contraindicated (fetotoxic).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Losartan + ACE inhibitors is a preferred combination for maximum blood pressure control",
            "B. Losartan + ACE inhibitors causes dual RAS blockade (hyperkalemia, renal failure — avoid); losartan + K-sparing diuretics raises K+; NSAIDs blunt effect",
            "C. Losartan is safe in pregnancy and is preferred for hypertensive pregnant patients",
            "D. Losartan has no significant CYP-based drug interactions"
        ],
        correctAnswer: "B. Losartan + ACE inhibitors causes dual RAS blockade (hyperkalemia, renal failure — avoid); losartan + K-sparing diuretics raises K+; NSAIDs blunt effect",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.942,
        angle: .safety,
        baseConceptTitle: "LOSARTAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "LOSARTAN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PREGNANCY: Stop immediately if pregnancy is detected — fetotoxic.
        > POTASSIUM: Avoid salt substitutes (contain KCl); limit high-K+ foods.
        > BP MONITORING: Check BP regularly; do not stop abruptly.
        > DIZZINESS: Common initially, especially first dose — rise slowly.
        > NO COUGH: Unlike ACE inhibitors, ARBs do not cause cough.
        > SWELLING: Report facial swelling (angioedema — rare but serious).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients should liberally use salt substitutes (KCl) to replace sodium while on losartan",
            "B. Avoid pregnancy (fetotoxic); avoid salt substitutes (KCl raises K+); report facial swelling; ARBs do not cause cough unlike ACE inhibitors",
            "C. Losartan commonly causes a dry cough similar to ACE inhibitors due to bradykinin accumulation",
            "D. Losartan must be stopped 2 weeks before any planned pregnancy"
        ],
        correctAnswer: "B. Avoid pregnancy (fetotoxic); avoid salt substitutes (KCl raises K+); report facial swelling; ARBs do not cause cough unlike ACE inhibitors",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.942,
        angle: .safety,
        baseConceptTitle: "LOSARTAN"
    ),

    // ============================================================
    // ACETAMINOPHEN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ACETAMINOPHEN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > APAP + ALCOHOL: Chronic heavy alcohol → increased hepatotoxicity risk (CYP2E1 induction).
        > APAP + WARFARIN: High-dose APAP (>2 g/day chronic) potentiates warfarin → increased INR.
        > APAP + OTHER APAP-CONTAINING PRODUCTS: Cumulative hepatotoxicity risk — max 4 g/day total.
        > APAP + ISONIAZID: Additive hepatotoxicity risk.
        > HIDDEN SOURCES: Many OTC combo products contain APAP (NyQuil, Percocet, Vicodin, Tylenol PM).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Acetaminophen safely enhances warfarin's anticoagulation with no monitoring needed",
            "B. Chronic alcohol use increases APAP hepatotoxicity (CYP2E1); high-dose APAP potentiates warfarin; hidden APAP in combination products risks exceeding 4 g/day limit",
            "C. Acetaminophen interacts with NSAIDs to cause additive renal toxicity",
            "D. Acetaminophen is completely safe in all doses because it has no metabolic interactions"
        ],
        correctAnswer: "B. Chronic alcohol use increases APAP hepatotoxicity (CYP2E1); high-dose APAP potentiates warfarin; hidden APAP in combination products risks exceeding 4 g/day limit",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.948,
        angle: .safety,
        baseConceptTitle: "ACETAMINOPHEN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ACETAMINOPHEN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MAX DOSE: 4 g/day total (3 g/day if elderly, liver disease, or alcohol use).
        > HIDDEN APAP: Check ALL medications — many combos contain APAP (NyQuil, Percocet, Excedrin).
        > ALCOHOL: Avoid or limit alcohol — increases liver damage risk.
        > OVERDOSE SIGN: Nausea, vomiting, abdominal pain → seek ER immediately (antidote: N-acetylcysteine).
        > NO ANTI-INFLAMMATORY: APAP relieves pain and fever but NOT inflammation.
        > STORAGE: Keep out of reach of children — leading cause of pediatric poisoning.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients can take up to 8 g/day of acetaminophen as long as they space doses evenly",
            "B. Maximum 4 g/day (3 g/day elderly/liver disease); check all products for hidden APAP; avoid alcohol; go to ER if overdose signs appear",
            "C. Acetaminophen is a strong anti-inflammatory and can replace NSAIDs for arthritis swelling",
            "D. Acetaminophen overdose is treated with activated charcoal at home before going to the ER"
        ],
        correctAnswer: "B. Maximum 4 g/day (3 g/day elderly/liver disease); check all products for hidden APAP; avoid alcohol; go to ER if overdose signs appear",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.948,
        angle: .safety,
        baseConceptTitle: "ACETAMINOPHEN"
    ),

    // ============================================================
    // IBUPROFEN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "IBUPROFEN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > IBUPROFEN + WARFARIN: Antiplatelet + anticoagulant → bleeding risk (also GI bleed).
        > IBUPROFEN + ASPIRIN: NSAIDs block aspirin's antiplatelet effect on COX-1 (take aspirin 30 min before ibuprofen).
        > IBUPROFEN + ACE INHIBITORS/ARBs: Reduces antihypertensive effect; risk of acute renal failure.
        > IBUPROFEN + LITHIUM: Reduces lithium clearance → lithium toxicity.
        > IBUPROFEN + SSRIs: Increased GI bleeding risk.
        > IBUPROFEN + CORTICOSTEROIDS: Additive GI ulcer risk.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ibuprofen enhances aspirin's cardioprotective antiplatelet effect when taken together",
            "B. Ibuprofen blocks aspirin's antiplatelet effect (take ASA 30 min before); increases bleeding with warfarin/SSRIs; reduces ACE inhibitor/ARB antihypertensive effect",
            "C. Ibuprofen is safe with lithium because NSAIDs increase renal lithium excretion",
            "D. Ibuprofen + corticosteroids reduces GI ulcer risk through complementary mucosal protection"
        ],
        correctAnswer: "B. Ibuprofen blocks aspirin's antiplatelet effect (take ASA 30 min before); increases bleeding with warfarin/SSRIs; reduces ACE inhibitor/ARB antihypertensive effect",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.954,
        angle: .safety,
        baseConceptTitle: "IBUPROFEN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "IBUPROFEN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > FOOD: Take with food or milk to reduce stomach upset and ulcer risk.
        > KIDNEY: Stay well-hydrated; avoid in dehydration or kidney disease.
        > HEART: Avoid with CHF or recent MI — increases fluid retention and CV risk.
        > PREGNANCY: Avoid in third trimester (premature ductus arteriosus closure).
        > DURATION: Use shortest effective duration at lowest effective dose.
        > SIGNS TO STOP: Black/tarry stools, severe stomach pain, edema, shortness of breath.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ibuprofen is safe to use on an empty stomach and during the third trimester of pregnancy",
            "B. Take with food; stay hydrated; avoid in third trimester (ductus arteriosus closure); avoid in CHF; use shortest effective duration; stop if black stools or edema occur",
            "C. Ibuprofen should be taken with antacids for best absorption and stomach protection",
            "D. Ibuprofen is the preferred NSAID in patients with heart failure due to its anti-inflammatory selectivity"
        ],
        correctAnswer: "B. Take with food; stay hydrated; avoid in third trimester (ductus arteriosus closure); avoid in CHF; use shortest effective duration; stop if black stools or edema occur",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.954,
        angle: .safety,
        baseConceptTitle: "IBUPROFEN"
    ),

    // ============================================================
    // AZITHROMYCIN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AZITHROMYCIN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > QT PROLONGATION: Major risk — avoid with other QT-prolonging drugs (antipsychotics, fluoroquinolones, amiodarone).
        > WARFARIN: Azithromycin may potentiate warfarin — monitor INR.
        > ANTACIDS (Al/Mg): Reduce azithromycin absorption — separate by 2 hours.
        > NELFINAVIR: Increases azithromycin levels (risk of hearing loss).
        > CYCLOSPORINE: Azithromycin may raise cyclosporine levels.
        > CYP PROFILE: Azithromycin is a weak CYP3A4 inhibitor.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Azithromycin is safe with all antipsychotics because it does not affect cardiac ion channels",
            "B. Azithromycin prolongs QT interval — avoid with other QT-prolonging drugs; may potentiate warfarin; separate from antacids by 2 hours",
            "C. Azithromycin is a strong CYP3A4 inducer that reduces levels of many medications",
            "D. Azithromycin has no interactions with anticoagulants or other antibiotics"
        ],
        correctAnswer: "B. Azithromycin prolongs QT interval — avoid with other QT-prolonging drugs; may potentiate warfarin; separate from antacids by 2 hours",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.960,
        angle: .safety,
        baseConceptTitle: "AZITHROMYCIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "AZITHROMYCIN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > COMPLETE COURSE: Finish all doses even if feeling better.
        > FOOD: May be taken with or without food (Z-Pack).
        > GI EFFECTS: Nausea, diarrhea common — take with food if bothersome.
        > HEART RHYTHM: Report palpitations, fainting, or irregular heartbeat.
        > ANTACIDS: Separate from antacids by 2 hours.
        > MISSED DOSE: Take as soon as remembered (do not double-dose).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Stop azithromycin as soon as symptoms improve to prevent resistance",
            "B. Complete the full course even if feeling better; take with food if GI upset occurs; report palpitations or irregular heartbeat; separate antacids by 2 hours",
            "C. Azithromycin must be taken on an empty stomach for adequate absorption",
            "D. If a dose is missed, take two doses together at the next scheduled time"
        ],
        correctAnswer: "B. Complete the full course even if feeling better; take with food if GI upset occurs; report palpitations or irregular heartbeat; separate antacids by 2 hours",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.960,
        angle: .safety,
        baseConceptTitle: "AZITHROMYCIN"
    ),

    // ============================================================
    // GABAPENTIN — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GABAPENTIN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Additive sedation with opioids, benzodiazepines, alcohol — respiratory depression risk.
        > ANTACIDS (Al/Mg): Reduce gabapentin absorption by ~20% — take gabapentin 2 hrs after antacid.
        > MORPHINE: Increases gabapentin levels (monitor for sedation).
        > OPIOIDS: Black Box warning (2019) — combination increases risk of serious respiratory depression and death.
        > HYDROCODONE: Reduces hydrocodone Cmax but may increase gabapentin absorption.
        > ETHANOL: Additive CNS depression.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Gabapentin + opioids is a preferred combination for breakthrough pain management",
            "B. Gabapentin + opioids/CNS depressants causes additive respiratory depression (Black Box Warning); antacids reduce absorption (separate by 2 hrs)",
            "C. Gabapentin increases opioid metabolism, requiring higher opioid doses for pain control",
            "D. Antacids enhance gabapentin absorption and should be taken together for better bioavailability"
        ],
        correctAnswer: "B. Gabapentin + opioids/CNS depressants causes additive respiratory depression (Black Box Warning); antacids reduce absorption (separate by 2 hrs)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.966,
        angle: .safety,
        baseConceptTitle: "GABAPENTIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GABAPENTIN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SEDATION: Causes drowsiness and dizziness — do not drive until effect is known.
        > DO NOT STOP ABRUPTLY: Taper to avoid seizure threshold lowering and withdrawal.
        > ALCOHOL: Avoid — additive CNS depression.
        > ANTACIDS: Take gabapentin 2 hours AFTER antacids.
        > SUICIDAL IDEATION: Report mood changes, depression, unusual behavior.
        > WEIGHT GAIN: May occur with long-term use; monitor.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Gabapentin can be stopped immediately when pain resolves without tapering",
            "B. Do not stop abruptly (risk of seizure/withdrawal); avoid alcohol and driving until effect known; take 2 hrs after antacids; report mood changes",
            "C. Gabapentin is non-sedating and safe to take before operating machinery",
            "D. Gabapentin should be taken simultaneously with antacids to improve absorption"
        ],
        correctAnswer: "B. Do not stop abruptly (risk of seizure/withdrawal); avoid alcohol and driving until effect known; take 2 hrs after antacids; report mood changes",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.966,
        angle: .safety,
        baseConceptTitle: "GABAPENTIN"
    ),

    // ============================================================
    // PREDNISONE — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREDNISONE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PREDNISONE + NSAIDs/ASPIRIN: Additive GI ulceration risk.
        > PREDNISONE + FLUOROQUINOLONES: Additive tendon rupture risk.
        > PREDNISONE + ANTIDIABETICS: Hyperglycemia — may require dose adjustments.
        > PREDNISONE + ANTIFUNGALS (ketoconazole): CYP3A4 inhibition increases prednisone levels.
        > PREDNISONE + RIFAMPIN: CYP3A4 induction reduces prednisone effect.
        > PREDNISONE + LIVE VACCINES: Contraindicated — immunosuppression.
        > PREDNISONE + K-WASTING DIURETICS: Additive hypokalemia.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Prednisone + live vaccines is safe and recommended to prevent infections in immunocompromised patients",
            "B. Prednisone + NSAIDs increases GI ulcer risk; + antidiabetics requires glucose monitoring (hyperglycemia); + live vaccines is contraindicated; + rifampin reduces prednisone levels",
            "C. Prednisone reduces blood glucose, complementing antidiabetic therapy",
            "D. Prednisone + ketoconazole decreases prednisone levels through CYP3A4 induction"
        ],
        correctAnswer: "B. Prednisone + NSAIDs increases GI ulcer risk; + antidiabetics requires glucose monitoring (hyperglycemia); + live vaccines is contraindicated; + rifampin reduces prednisone levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.972,
        angle: .safety,
        baseConceptTitle: "PREDNISONE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "PREDNISONE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DO NOT STOP ABRUPTLY: Taper required — adrenal suppression can cause adrenal crisis.
        > FOOD: Take with food to reduce GI upset.
        > GLUCOSE: Monitor blood sugar — steroids raise glucose.
        > INFECTION RISK: Avoid crowds and sick people — immunosuppressed.
        > BONE HEALTH: Long-term use → osteoporosis; consider calcium + vitamin D.
        > MOOD: May cause mood swings, insomnia, euphoria — report extreme changes.
        > CARRY CARD: For long-term use, carry steroid card.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Prednisone can be stopped abruptly when symptoms resolve to prevent further immunosuppression",
            "B. Must taper gradually (adrenal suppression); take with food; monitor blood glucose; supplement calcium/vitamin D for long-term use; avoid infections",
            "C. Prednisone lowers blood glucose, so diabetics can reduce their antidiabetic doses",
            "D. Prednisone should be taken on an empty stomach for maximum anti-inflammatory absorption"
        ],
        correctAnswer: "B. Must taper gradually (adrenal suppression); take with food; monitor blood glucose; supplement calcium/vitamin D for long-term use; avoid infections",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.972,
        angle: .safety,
        baseConceptTitle: "PREDNISONE"
    ),

    // ============================================================
    // CLOPIDOGREL — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLOPIDOGREL / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > PROTON PUMP INHIBITORS (omeprazole, esomeprazole): CYP2C19 inhibition → reduces clopidogrel activation → decreased antiplatelet effect (use pantoprazole instead).
        > CLOPIDOGREL + WARFARIN: Additive bleeding risk.
        > CLOPIDOGREL + NSAIDs: Additive bleeding/GI bleed risk.
        > CLOPIDOGREL + SSRIs: Additive bleeding risk.
        > CYP2C19 POOR METABOLIZERS: Reduced efficacy (genetic variation).
        > ASPIRIN: Often combined intentionally (dual antiplatelet — post-stent), but increases bleed risk.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Omeprazole is the preferred PPI with clopidogrel because it provides the best GI protection",
            "B. Omeprazole/esomeprazole inhibit CYP2C19 and reduce clopidogrel activation — use pantoprazole; clopidogrel + warfarin/NSAIDs/SSRIs increases bleeding",
            "C. Clopidogrel does not interact with PPIs because it is metabolized by CYP3A4",
            "D. Clopidogrel + SSRIs is safe because SSRIs do not affect platelet function"
        ],
        correctAnswer: "B. Omeprazole/esomeprazole inhibit CYP2C19 and reduce clopidogrel activation — use pantoprazole; clopidogrel + warfarin/NSAIDs/SSRIs increases bleeding",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.978,
        angle: .safety,
        baseConceptTitle: "CLOPIDOGREL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLOPIDOGREL / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DO NOT STOP WITHOUT PROVIDER: Stopping clopidogrel increases stent thrombosis risk.
        > BLEEDING: Report unusual bleeding or bruising, bloody/tarry stools.
        > SURGERY: Tell ALL providers (dentist, surgeon) you take clopidogrel.
        > BRUISING: Expected — press firm on cuts; bleed longer than normal.
        > FOOD: May take with or without food.
        > MISSED DOSE: Take next scheduled dose (do not double).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clopidogrel can be stopped before dental procedures without telling the dentist",
            "B. Never stop without provider approval (stent thrombosis risk); inform all providers including dentist; report unusual bleeding or black stools",
            "C. Clopidogrel must be taken with food to prevent dangerous GI absorption changes",
            "D. If you miss a dose, double the next dose to maintain antiplatelet effect"
        ],
        correctAnswer: "B. Never stop without provider approval (stent thrombosis risk); inform all providers including dentist; report unusual bleeding or black stools",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.978,
        angle: .safety,
        baseConceptTitle: "CLOPIDOGREL"
    ),

    // ============================================================
    // TRAMADOL — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "TRAMADOL / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TRAMADOL + MAOIs: CONTRAINDICATED — serotonin syndrome (life-threatening).
        > TRAMADOL + SSRIs/SNRIs/TCAs: Serotonin syndrome risk; also lowers seizure threshold.
        > TRAMADOL + CNS DEPRESSANTS (opioids, benzos, alcohol): Additive respiratory depression.
        > TRAMADOL + CARBAMAZEPINE: CYP induction reduces tramadol levels.
        > TRAMADOL + CYP2D6 INHIBITORS (fluoxetine, paroxetine): Reduces conversion to active M1 metabolite.
        > SEIZURE RISK: Tramadol lowers seizure threshold — caution in epilepsy.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Tramadol + SSRIs is a safe and preferred combination for chronic pain with depression",
            "B. Tramadol + MAOIs is absolutely contraindicated (serotonin syndrome); + SSRIs/SNRIs increases serotonin syndrome and seizure risk; + CNS depressants causes respiratory depression",
            "C. Tramadol + CNS depressants is safe because tramadol is not a true opioid",
            "D. Tramadol raises the seizure threshold, making it preferred in patients with epilepsy"
        ],
        correctAnswer: "B. Tramadol + MAOIs is absolutely contraindicated (serotonin syndrome); + SSRIs/SNRIs increases serotonin syndrome and seizure risk; + CNS depressants causes respiratory depression",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.984,
        angle: .safety,
        baseConceptTitle: "TRAMADOL"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "TRAMADOL / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DRIVING: May cause dizziness, sedation — avoid driving until response known.
        > ALCOHOL: Avoid — increases CNS depression.
        > SEIZURE: Report any seizure activity.
        > SEROTONIN: Report agitation, confusion, rapid heart rate, high fever (serotonin syndrome).
        > DEPENDENCY: Risk of abuse and dependence — C-IV controlled substance.
        > DO NOT CRUSH: Extended-release tablets must be swallowed whole.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Tramadol is non-addictive and can be shared with family members who have pain",
            "B. Avoid alcohol and driving; report seizures or agitation/rapid HR (serotonin syndrome); C-IV controlled substance with dependency risk; do not crush extended-release",
            "C. Tramadol extended-release tablets can be crushed for patients who have difficulty swallowing",
            "D. Tramadol has no abuse potential and is not a controlled substance in any state"
        ],
        correctAnswer: "B. Avoid alcohol and driving; report seizures or agitation/rapid HR (serotonin syndrome); C-IV controlled substance with dependency risk; do not crush extended-release",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.984,
        angle: .safety,
        baseConceptTitle: "TRAMADOL"
    ),

    // ============================================================
    // MONTELUKAST — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "MONTELUKAST / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MONTELUKAST + RIFAMPIN: CYP induction reduces montelukast levels (reduced efficacy).
        > MONTELUKAST + PHENOBARBITAL: Induces CYP3A4/2C9 — reduces montelukast levels.
        > MONTELUKAST + GEMFIBROZIL: CYP2C8 inhibition may increase montelukast levels.
        > NEUROPSYCHIATRIC: Black Box Warning — agitation, depression, suicidal ideation (all ages).
        > ASPIRIN-SENSITIVE ASTHMA: Montelukast is preferred; avoid NSAIDs.
        > RELATIVELY FEW INTERACTIONS: Fewer drug interactions than inhaled corticosteroids.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Montelukast has a Black Box Warning for QT prolongation with antiarrhythmic drugs",
            "B. Montelukast has a Black Box Warning for neuropsychiatric effects (depression, suicidal ideation); rifampin/phenobarbital reduce levels through CYP induction",
            "C. Montelukast is contraindicated with all NSAIDs in all patients",
            "D. Montelukast is a strong CYP inhibitor with multiple clinically significant drug interactions"
        ],
        correctAnswer: "B. Montelukast has a Black Box Warning for neuropsychiatric effects (depression, suicidal ideation); rifampin/phenobarbital reduce levels through CYP induction",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.990,
        angle: .safety,
        baseConceptTitle: "MONTELUKAST"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "MONTELUKAST / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TIMING: Take in the evening for allergic rhinitis; or 2 hours before exercise for EIB.
        > NOT RESCUE: Montelukast is preventive — do NOT use for acute asthma attack.
        > MOOD CHANGES: Report agitation, depression, suicidal thoughts — Black Box Warning.
        > CONTINUOUS USE: Take daily even when feeling well.
        > FOOD: May be taken with or without food.
        > GRANULES: Can be mixed with soft food (applesauce, baby formula) for young children.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Use montelukast as a rescue inhaler during acute asthma attacks for rapid relief",
            "B. Take daily in the evening (preventive, not rescue); report mood changes/depression (Black Box); can be mixed with soft food for children; not for acute attacks",
            "C. Montelukast must be taken on an empty stomach in the morning for maximum efficacy",
            "D. Montelukast can be used as needed during allergen exposure instead of daily"
        ],
        correctAnswer: "B. Take daily in the evening (preventive, not rescue); report mood changes/depression (Black Box); can be mixed with soft food for children; not for acute attacks",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.990,
        angle: .safety,
        baseConceptTitle: "MONTELUKAST"
    ),

    // ============================================================
    // BUPROPION — INTERACTIONS & COUNSELING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPROPION / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BUPROPION + MAOIs: CONTRAINDICATED — hypertensive crisis (14-day washout required).
        > BUPROPION + CYP2D6 SUBSTRATES: Bupropion is a strong CYP2D6 INHIBITOR — raises levels of codeine, tamoxifen, TCAs, metoprolol, antipsychotics.
        > BUPROPION + OTHER BUPROPION PRODUCTS: Multiple brand names (Wellbutrin, Zyban, Contrave) — risk of overdose if doubled.
        > BUPROPION + ALCOHOL: Lowers seizure threshold — bupropion + abrupt alcohol cessation → high seizure risk.
        > BUPROPION + LINEZOLID: Additive serotonergic/hypertensive risk.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Bupropion is a CYP2D6 inducer that decreases levels of codeine and metoprolol",
            "B. Bupropion is a strong CYP2D6 inhibitor (raises levels of codeine, metoprolol, TCAs); contraindicated with MAOIs; multiple brand names risk double-dosing; lowers seizure threshold with alcohol",
            "C. Bupropion + MAOIs requires only a 24-hour washout before switching",
            "D. Bupropion + alcohol increases seizure threshold, making the combination protective"
        ],
        correctAnswer: "B. Bupropion is a strong CYP2D6 inhibitor (raises levels of codeine, metoprolol, TCAs); contraindicated with MAOIs; multiple brand names risk double-dosing; lowers seizure threshold with alcohol",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.62,
        yOffset: 0.996,
        angle: .safety,
        baseConceptTitle: "BUPROPION"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "BUPROPION / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SEIZURE RISK: Bupropion lowers seizure threshold — avoid eating disorders, abrupt alcohol/benzo cessation.
        > SLEEP: May cause insomnia — take morning dose; avoid late afternoon/evening doses.
        > MULTIPLE PRODUCTS: Wellbutrin SR, XL (depression) vs Zyban (smoking) vs Contrave (weight) — same drug, different formulations.
        > ANTIDEPRESSANT EFFECT: 4–6 weeks for full antidepressant benefit.
        > SMOKING: Effective as smoking cessation; start 1 week before quit date.
        > MOOD MONITORING: Report suicidal ideation (young adults/adolescents under 25 — Black Box).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Bupropion can be taken at bedtime to avoid insomnia from daytime dosing",
            "B. Take in the morning (can cause insomnia); avoid alcohol cessation without tapering (seizure risk); allow 4–6 weeks for antidepressant effect; report suicidal thoughts in patients under 25",
            "C. Bupropion works immediately for depression within 24–48 hours of starting",
            "D. Bupropion is safe to use in patients with active bulimia or anorexia nervosa"
        ],
        correctAnswer: "B. Take in the morning (can cause insomnia); avoid alcohol cessation without tapering (seizure risk); allow 4–6 weeks for antidepressant effect; report suicidal thoughts in patients under 25",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.77,
        yOffset: 0.996,
        angle: .safety,
        baseConceptTitle: "BUPROPION"
    ),
]
