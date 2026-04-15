import Foundation

// Multi-Angle Phase 12 — D1g Interactions & Counseling
// 10 drugs × 2 angles = 20 nodes (all with full MCQ content)
// Drugs: Apixaban, Rivaroxaban, Quetiapine, Empagliflozin, Methylphenidate,
//        Cetirizine, Metronidazole, Ondansetron, Alendronate, Colchicine

let multiAngleNodes_D1i: [DataNode] = [

    // APIXABAN
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > P-GP + CYP3A4 DUAL INHIBITORS: Ketoconazole, itraconazole, ritonavir → significantly increase apixaban exposure → use 2.5 mg BID (reduce dose) or avoid.
        > P-GP + CYP3A4 DUAL INDUCERS: Rifampin, carbamazepine, phenytoin, St. John's Wort → reduce apixaban levels → avoid combination.
        > OTHER ANTICOAGULANTS: Additive bleeding risk — avoid combining.
        > ANTIPLATELETS (aspirin, clopidogrel): Increased bleeding risk — use lowest effective aspirin dose.
        > NSAIDs: Increased GI bleeding risk.
        > NO dietary restrictions (unlike warfarin).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rifampin increases apixaban levels through CYP3A4 inhibition, requiring dose reduction",
            "B. Dual P-gp/CYP3A4 inhibitors (ketoconazole, ritonavir) raise apixaban levels (reduce to 2.5 mg BID); dual inducers (rifampin, carbamazepine) lower levels (avoid); additive bleeding with other anticoagulants",
            "C. Apixaban requires the same dietary vitamin K restrictions as warfarin",
            "D. NSAIDs can be safely combined with apixaban because they work through different mechanisms"
        ],
        correctAnswer: "B. Dual P-gp/CYP3A4 inhibitors (ketoconazole, ritonavir) raise apixaban levels (reduce to 2.5 mg BID); dual inducers (rifampin, carbamazepine) lower levels (avoid); additive bleeding with other anticoagulants",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "APIXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > NEVER STOP WITHOUT PROVIDER: Abrupt discontinuation markedly increases stroke risk.
        > BLEEDING: Report unusual bruising, prolonged bleeding, blood in urine/stool, severe headache.
        > NO MONITORING NEEDED: Unlike warfarin — no routine INR; consistent adherence critical.
        > SURGERY/PROCEDURES: Hold 24–48 hours before (48 hrs for high bleed risk); inform all providers.
        > MISSED DOSE: Take same day; skip if <6 hrs to next dose (BID); do NOT double dose.
        > STORAGE: Room temperature; protect from moisture.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Apixaban requires weekly INR testing to ensure therapeutic anticoagulation",
            "B. Never stop without provider (stroke risk); no routine INR monitoring needed; report bleeding signs; hold 24–48 hrs before surgery; do not double dose if missed",
            "C. If a dose is missed, take double the next dose to maintain adequate anticoagulation",
            "D. Apixaban can be safely stopped before any dental procedure without consulting the provider"
        ],
        correctAnswer: "B. Never stop without provider (stroke risk); no routine INR monitoring needed; report bleeding signs; hold 24–48 hrs before surgery; do not double dose if missed",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "APIXABAN"
    ),

    // RIVAROXABAN
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > Same dual P-gp/CYP3A4 pathway as apixaban.
        > DUAL INHIBITORS: Ketoconazole, ritonavir, clarithromycin → increase rivaroxaban → avoid.
        > DUAL INDUCERS: Rifampin, carbamazepine, phenytoin → decrease rivaroxaban → avoid.
        > FOOD REQUIREMENT: 15–20 mg doses must be taken with food (food-dependent bioavailability).
        > ANTIPLATELETS + NSAIDs: Increased GI bleed risk.
        > SPINAL ANESTHESIA: Black Box — hold per procedural timing guidelines before epidural.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban 20 mg can be taken without food because it has 100% bioavailability",
            "B. Dual P-gp/CYP3A4 inhibitors (ketoconazole, ritonavir) raise rivaroxaban levels (avoid); inducers (rifampin) lower levels (avoid); 15–20 mg doses require food for adequate absorption",
            "C. Clarithromycin can be safely combined with rivaroxaban at standard doses",
            "D. Rivaroxaban has no dietary restrictions or food-related absorption concerns"
        ],
        correctAnswer: "B. Dual P-gp/CYP3A4 inhibitors (ketoconazole, ritonavir) raise rivaroxaban levels (avoid); inducers (rifampin) lower levels (avoid); 15–20 mg doses require food for adequate absorption",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.22,
        angle: .safety,
        baseConceptTitle: "RIVAROXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > TAKE WITH FOOD: 15 mg and 20 mg doses must be taken with the evening meal.
        > NEVER STOP ABRUPTLY: Increases stroke risk — always discuss discontinuation with provider.
        > REPORT BLEEDING: Blood in urine (pink/red), stool (red or tarry black), coughing blood, severe headache.
        > SURGICAL PROCEDURES: Inform all surgeons/dentists; hold per provider instructions.
        > MISSED DOSE (QD): Take same day; do NOT double next dose.
        > MISSED DOSE (BID during treatment): Take immediately if same day; do NOT double.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban 20 mg should be taken on an empty stomach for maximum effectiveness",
            "B. Take 15–20 mg doses with food (food-dependent absorption); never stop abruptly; report any bleeding signs; inform all providers before surgery",
            "C. Rivaroxaban can be stopped the night before any planned dental procedure",
            "D. A missed daily dose of rivaroxaban should be compensated by doubling the next dose"
        ],
        correctAnswer: "B. Take 15–20 mg doses with food (food-dependent absorption); never stop abruptly; report any bleeding signs; inform all providers before surgery",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.22,
        angle: .safety,
        baseConceptTitle: "RIVAROXABAN"
    ),

    // QUETIAPINE
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CYP3A4 INHIBITORS: Ketoconazole, ritonavir → significantly increase quetiapine levels (reduce quetiapine dose).
        > CYP3A4 INDUCERS: Rifampin, carbamazepine, phenytoin → reduce quetiapine 5-fold → may need 5× dose increase.
        > QT PROLONGATION: Avoid with other QT-prolonging agents (antiarrhythmics, fluoroquinolones, azithromycin, ondansetron).
        > CNS DEPRESSANTS: Additive sedation with alcohol, benzos, opioids, antihistamines.
        > ANTIHYPERTENSIVES: Additive hypotension (α1 blockade).
        > DOPAMINE AGONISTS: Quetiapine antagonizes dopamine agonists (levodopa, pramipexole) — use with caution in Parkinson's.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rifampin increases quetiapine levels by inhibiting its CYP3A4 metabolism",
            "B. CYP3A4 inhibitors (ketoconazole, ritonavir) raise quetiapine levels; inducers (rifampin, carbamazepine) dramatically lower levels; additive QT prolongation with antiarrhythmics/fluoroquinolones",
            "C. Quetiapine enhances the effects of levodopa in Parkinson's disease",
            "D. Quetiapine + benzodiazepines is safe because they work through completely different CNS pathways"
        ],
        correctAnswer: "B. CYP3A4 inhibitors (ketoconazole, ritonavir) raise quetiapine levels; inducers (rifampin, carbamazepine) dramatically lower levels; additive QT prolongation with antiarrhythmics/fluoroquinolones",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.29,
        angle: .safety,
        baseConceptTitle: "QUETIAPINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SEDATION: Causes drowsiness — avoid driving until effect is known; take at bedtime for insomnia indication.
        > ORTHOSTATIC HYPOTENSION: Rise slowly from sitting/lying — dizziness common, especially initially.
        > METABOLIC MONITORING: Weight, blood glucose, lipids — monitor regularly with provider.
        > DO NOT STOP ABRUPTLY: May precipitate relapse/withdrawal — taper under guidance.
        > ALCOHOL: Avoid — additive CNS depression.
        > SUICIDALITY: Monitor in patients <25 on antidepressant adjunct use (Black Box).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Quetiapine does not require metabolic monitoring because it has no effect on blood glucose",
            "B. Causes sedation (avoid driving); rise slowly (orthostatic hypotension); monitor weight/glucose/lipids; do not stop abruptly; avoid alcohol; monitor suicidality in patients <25",
            "C. Quetiapine can be stopped abruptly without risk of relapse or withdrawal effects",
            "D. Orthostatic hypotension from quetiapine is prevented by taking it in the morning"
        ],
        correctAnswer: "B. Causes sedation (avoid driving); rise slowly (orthostatic hypotension); monitor weight/glucose/lipids; do not stop abruptly; avoid alcohol; monitor suicidality in patients <25",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.29,
        angle: .safety,
        baseConceptTitle: "QUETIAPINE"
    ),

    // EMPAGLIFLOZIN
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > INSULIN + SULFONYLUREAS: Empagliflozin + insulin or sulfonylurea → additive hypoglycemia risk (reduce insulin/SU dose).
        > DIURETICS: Additive volume depletion → hypotension; use caution with loop/thiazide diuretics.
        > NSAIDs: May worsen renal function (additive nephrotoxic effect with volume depletion from SGLT-2).
        > DIGOXIN: Empagliflozin may slightly increase digoxin levels (monitor).
        > UGT INDUCERS (rifampin): May reduce empagliflozin levels (decreased efficacy).
        > MINIMAL CYP: SGLT-2 inhibitors are primarily UGT-metabolized — fewer CYP-based interactions.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Empagliflozin + insulin is always safe because SGLT-2 inhibitors prevent hypoglycemia",
            "B. Empagliflozin + insulin/sulfonylureas increases hypoglycemia risk (reduce their doses); + diuretics increases volume depletion/hypotension; minimal CYP-based interactions (primarily UGT metabolism)",
            "C. SGLT-2 inhibitors are metabolized by CYP3A4, giving them many drug interactions with CYP inhibitors",
            "D. Empagliflozin + NSAIDs is safe because NSAIDs protect against SGLT-2-related volume depletion"
        ],
        correctAnswer: "B. Empagliflozin + insulin/sulfonylureas increases hypoglycemia risk (reduce their doses); + diuretics increases volume depletion/hypotension; minimal CYP-based interactions (primarily UGT metabolism)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.36,
        angle: .safety,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > GENITAL HYGIENE: Increased yeast infections/UTIs from glucosuria — maintain genital hygiene; report symptoms.
        > DKA SIGNS: Even with normal blood sugar — nausea, vomiting, abdominal pain, difficulty breathing → go to ER (euglycemic DKA).
        > HOLD BEFORE SURGERY: Stop 3–4 days before major surgery.
        > HYDRATION: Stay well-hydrated — osmotic diuresis from glucosuria.
        > FOOT CARE: Check feet regularly (especially with canagliflozin amputation risk, but all SGLT-2 warrant vigilance).
        > ID CARD: Carry card noting SGLT-2 inhibitor use (DKA risk for emergency providers).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Euglycemic DKA from empagliflozin only occurs when blood glucose exceeds 400 mg/dL",
            "B. Report nausea/vomiting/abdominal pain even with normal glucose (euglycemic DKA); maintain genital hygiene (yeast/UTI risk); hold 3–4 days before major surgery; stay well-hydrated",
            "C. Genital infections are rare with empagliflozin and do not require routine hygiene measures",
            "D. Empagliflozin should be continued through major surgery to maintain glucose control"
        ],
        correctAnswer: "B. Report nausea/vomiting/abdominal pain even with normal glucose (euglycemic DKA); maintain genital hygiene (yeast/UTI risk); hold 3–4 days before major surgery; stay well-hydrated",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.36,
        angle: .safety,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),

    // METHYLPHENIDATE
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MAOIs: CONTRAINDICATED within 14 days — hypertensive crisis.
        > ANTIHYPERTENSIVES: Methylphenidate may counteract antihypertensive effects (raises BP/HR).
        > ANTICOAGULANTS (warfarin): Methylphenidate may inhibit warfarin metabolism → increased anticoagulation — monitor INR.
        > ANTICONVULSANTS (phenytoin, phenobarbital): May increase anticonvulsant levels → toxicity.
        > ACID SUPPRESSANTS: Antacids and acid-lowering agents reduce MPH extended-release absorption (Concerta osmotic mechanism).
        > ALCOHOL: Additive CNS effects; may affect Concerta OROS release mechanism.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Methylphenidate can be safely started 24 hours after stopping an MAOI",
            "B. MAOIs contraindicated within 14 days (hypertensive crisis); may raise warfarin levels (monitor INR); may increase anticonvulsant levels; antacids reduce ER formulation absorption",
            "C. Methylphenidate lowers blood pressure, complementing antihypertensive medications",
            "D. Antacids enhance the absorption of Concerta OROS by improving gastric pH"
        ],
        correctAnswer: "B. MAOIs contraindicated within 14 days (hypertensive crisis); may raise warfarin levels (monitor INR); may increase anticonvulsant levels; antacids reduce ER formulation absorption",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.43,
        angle: .safety,
        baseConceptTitle: "METHYLPHENIDATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > FOOD: Take with food to reduce GI upset; ER capsule beads can be sprinkled on applesauce — do NOT crush ER tablets.
        > APPETITE: Take 30–45 min before meals to minimize appetite suppression at mealtime.
        > TIMING: Last dose by 4–6 PM to prevent insomnia.
        > GROWTH: Monitor height/weight in children — consider drug holidays.
        > CII RULES: 30-day supply; cannot be refilled; new Rx each month.
        > SHARE/DIVERT: Never share — Schedule II; high abuse potential.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Concerta ER tablets can be cut in half for a lower dose without affecting drug release",
            "B. Take with food; last dose by 4–6 PM (insomnia); ER capsule beads can be sprinkled on applesauce (do not crush tablets); monitor height/weight; CII — 30-day supply, no refills",
            "C. Methylphenidate should be taken at bedtime to improve sleep and concentration",
            "D. Drug holidays are not recommended because they reduce the therapeutic benefit in children"
        ],
        correctAnswer: "B. Take with food; last dose by 4–6 PM (insomnia); ER capsule beads can be sprinkled on applesauce (do not crush tablets); monitor height/weight; CII — 30-day supply, no refills",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.43,
        angle: .safety,
        baseConceptTitle: "METHYLPHENIDATE"
    ),

    // CETIRIZINE
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CNS DEPRESSANTS: Additive sedation with alcohol, benzodiazepines, opioids, sleep aids.
        > RITONAVIR: Increases cetirizine levels (ritonavir inhibits P-gp transport of cetirizine) — use with caution.
        > THEOPHYLLINE: Large doses of theophylline may decrease cetirizine clearance slightly.
        > ANTICHOLINERGICS: Additive anticholinergic effects (dry mouth, urinary retention) at higher doses.
        > RENAL DRUGS: Cetirizine is renally cleared — other renally cleared drugs may compete.
        > MINIMAL CYP: Very few CYP-based drug interactions (cetirizine is minimally hepatically metabolized).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Cetirizine has extensive CYP3A4-based drug interactions similar to first-generation antihistamines",
            "B. Cetirizine has minimal CYP interactions; additive sedation with CNS depressants/alcohol; ritonavir may increase cetirizine levels; additive anticholinergic effects at high doses",
            "C. Cetirizine + alcohol is safe because second-generation antihistamines are completely non-sedating",
            "D. Theophylline significantly reduces cetirizine levels, requiring a dose increase"
        ],
        correctAnswer: "B. Cetirizine has minimal CYP interactions; additive sedation with CNS depressants/alcohol; ritonavir may increase cetirizine levels; additive anticholinergic effects at high doses",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.50,
        angle: .safety,
        baseConceptTitle: "CETIRIZINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DRIVING: May cause drowsiness — more sedating than loratadine or fexofenadine; caution until effect known.
        > ALCOHOL: Avoid — additive sedation.
        > TIMING: Take in the evening to minimize daytime drowsiness.
        > RENAL ADJUSTMENT: Reduce to 5 mg QD if CrCl <31 mL/min — inform provider of kidney disease.
        > ELDERLY: Beers Criteria caution — may cause confusion, falls, urinary retention.
        > CONSISTENT USE: Works best when taken daily for seasonal allergies rather than as-needed.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Cetirizine is completely non-sedating and safe to take before driving at any time",
            "B. May cause drowsiness (take in evening; caution with driving); avoid alcohol; reduce to 5 mg QD if CrCl <31; Beers Criteria concern in elderly; daily use more effective than as-needed",
            "C. Cetirizine should be taken in the morning for maximum allergy control throughout the day",
            "D. Renal impairment does not affect cetirizine dosing because it is hepatically metabolized"
        ],
        correctAnswer: "B. May cause drowsiness (take in evening; caution with driving); avoid alcohol; reduce to 5 mg QD if CrCl <31; Beers Criteria concern in elderly; daily use more effective than as-needed",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.50,
        angle: .safety,
        baseConceptTitle: "CETIRIZINE"
    ),

    // ONDANSETRON
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > QT PROLONGATION: Serotonin syndrome AND QT risk with apomorphine — CONTRAINDICATED.
        > SEROTONIN SYNDROME: With MAOIs, SSRIs, SNRIs, tramadol, fentanyl (5-HT3 receptor involvement).
        > CYP3A4 AND CYP2D6: Ondansetron is metabolized by both; inhibitors (fluoxetine, ketoconazole) may increase levels.
        > INDUCERS (rifampin, carbamazepine): Decrease ondansetron levels — may need higher dose.
        > TEMAZEPAM: Additive CNS depression.
        > PHENYTOIN, CARBAMAZEPINE: Reduce ondansetron levels.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ondansetron + SSRIs is a safe and preferred combination for CINV in depressed patients",
            "B. Ondansetron + apomorphine is contraindicated (QT prolongation + hypotension); serotonin syndrome risk with MAOIs/SSRIs/tramadol; CYP inducers (rifampin) reduce ondansetron levels",
            "C. Rifampin increases ondansetron levels through CYP3A4 inhibition",
            "D. Ondansetron has no serotonin-based interactions because it blocks rather than activates 5-HT3 receptors"
        ],
        correctAnswer: "B. Ondansetron + apomorphine is contraindicated (QT prolongation + hypotension); serotonin syndrome risk with MAOIs/SSRIs/tramadol; CYP inducers (rifampin) reduce ondansetron levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.57,
        angle: .safety,
        baseConceptTitle: "ONDANSETRON"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ODT ADMINISTRATION: Place ODT on tongue — do NOT push through foil; dissolves without water.
        > CONSTIPATION: 5-HT3 blockade in gut slows motility — increase fluids and fiber.
        > HEADACHE: Most common side effect — OTC analgesic usually sufficient.
        > HEART RHYTHM: Report palpitations, dizziness, fainting (QT prolongation concern).
        > TIMING: Take 30 min before chemotherapy or as directed; for PONV given at end of surgery.
        > PREGNANCY (off-label): Discuss with provider — evidence is mixed re: cardiac defects.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. ODT tablets should be swallowed whole with a full glass of water for proper dissolution",
            "B. Place ODT on tongue (dissolves without water); constipation common (increase fluids/fiber); take 30 min before chemotherapy; report palpitations (QT concern); headache most common side effect",
            "C. Ondansetron causes diarrhea because it stimulates 5-HT3 receptors in the gut",
            "D. Ondansetron has no cardiac monitoring concerns at any therapeutic dose"
        ],
        correctAnswer: "B. Place ODT on tongue (dissolves without water); constipation common (increase fluids/fiber); take 30 min before chemotherapy; report palpitations (QT concern); headache most common side effect",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.57,
        angle: .safety,
        baseConceptTitle: "ONDANSETRON"
    ),

    // ALENDRONATE
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CALCIUM/ANTACIDS/IRON: Divalent and polyvalent cations bind alendronate → dramatically reduce absorption — separate by ≥30–60 minutes (take alendronate first thing in the morning).
        > NSAIDs/ASPIRIN: Additive GI irritation and esophageal/gastric ulceration risk.
        > AMINOGLYCOSIDES: Additive hypocalcemia risk.
        > FOOD: ANY food (including coffee, OJ) severely reduces absorption — strict fasting required.
        > RANITIDINE IV: May increase bioavailability (not clinically significant in practice).
        > ABSORPTION: Only 0.5–1% absorbed orally — any interference is clinically significant.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alendronate can be taken with calcium supplements to improve bone mineral density",
            "B. Any food, calcium, antacids, or iron taken with alendronate drastically reduces its already low (<1%) oral bioavailability; take on empty stomach with plain water only; NSAIDs worsen GI irritation",
            "C. Orange juice improves alendronate absorption through acidification of the stomach",
            "D. Alendronate has high oral bioavailability (~80%) so food interactions are clinically insignificant"
        ],
        correctAnswer: "B. Any food, calcium, antacids, or iron taken with alendronate drastically reduces its already low (<1%) oral bioavailability; take on empty stomach with plain water only; NSAIDs worsen GI irritation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.64,
        angle: .safety,
        baseConceptTitle: "ALENDRONATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ADMINISTRATION RITUAL: First thing in the morning; 6–8 oz plain water ONLY; remain upright ≥30 min; wait 30 min before eating/drinking/other medications.
        > CALCIUM + VITAMIN D: Take separately (2+ hrs after alendronate); supplementation essential for bone health.
        > DENTAL: Inform dentist — ONJ risk with invasive procedures; do not stop without provider.
        > UNUSUAL THIGH PAIN: Report groin or thigh pain — possible atypical femur fracture.
        > DRUG HOLIDAY: After 3–5 years, discuss reassessment with provider.
        > SWALLOWING DIFFICULTY: Do not use if unable to sit/stand upright for 30 min.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Take alendronate with breakfast and lie down for 30 minutes to maximize GI comfort",
            "B. Take first thing in morning with 6–8 oz plain water only; remain upright ≥30 min; supplement calcium/vitamin D separately; inform dentist (ONJ risk); report thigh/groin pain",
            "C. Calcium supplements should be taken simultaneously with alendronate for synergistic bone benefit",
            "D. Alendronate does not require any special administration instructions beyond taking it once weekly"
        ],
        correctAnswer: "B. Take first thing in morning with 6–8 oz plain water only; remain upright ≥30 min; supplement calcium/vitamin D separately; inform dentist (ONJ risk); report thigh/groin pain",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.64,
        angle: .safety,
        baseConceptTitle: "ALENDRONATE"
    ),

    // COLCHICINE
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / INTERACTIONS",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CYP3A4 + P-GP INHIBITORS: Clarithromycin, ketoconazole, cyclosporine, ritonavir → dramatically increase colchicine levels → FATALITIES REPORTED. Reduce dose or avoid.
        > STATINS: Cyclosporine + colchicine → myopathy/rhabdomyolysis; statins alone also mildly increase risk.
        > FIBRATES (gemfibrozil): Additive myopathy risk.
        > DILTIAZEM/VERAPAMIL: CYP3A4 + P-gp inhibition → raise colchicine levels.
        > DIGOXIN/P-GP SUBSTRATES: Colchicine is a P-gp substrate — P-gp inhibitors raise levels.
        > NTI DRUG: Narrow margin — even modest level increases cause severe toxicity.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Clarithromycin is safe with colchicine at standard doses for antibiotic treatment",
            "B. CYP3A4/P-gp inhibitors (clarithromycin, ketoconazole, cyclosporine) raise colchicine levels dramatically — fatalities reported; diltiazem/verapamil also raise levels; reduce dose or avoid these combinations",
            "C. Colchicine levels are unaffected by P-gp inhibitors",
            "D. Statin + colchicine is a recommended combination for gout patients with hyperlipidemia"
        ],
        correctAnswer: "B. CYP3A4/P-gp inhibitors (clarithromycin, ketoconazole, cyclosporine) raise colchicine levels dramatically — fatalities reported; diltiazem/verapamil also raise levels; reduce dose or avoid these combinations",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.45,
        yOffset: 0.71,
        angle: .safety,
        baseConceptTitle: "COLCHICINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / COUNSELING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DIARRHEA = STOP: Diarrhea is the first sign of toxicity — stop taking immediately and call provider.
        > COMPLETE PRESCRIBED COURSE for acute gout (1.2 mg then 0.6 mg is the total acute dose — not ongoing).
        > MUSCLE WEAKNESS: Report muscle pain, weakness, tingling (myopathy/neuropathy with long-term use).
        > ANTIBIOTICS: Alert providers if prescribed clarithromycin/azithromycin — fatal interaction risk.
        > BLOOD TESTS: Long-term use — monitor CBC (bone marrow suppression risk).
        > GOUT DIET: Avoid purine-rich foods (organ meats, shellfish), excess alcohol, high-fructose corn syrup.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Mild diarrhea from colchicine should be managed with antidiarrheal medications while continuing treatment",
            "B. Diarrhea = first sign of toxicity — stop immediately; alert providers about antibiotic prescriptions (clarithromycin risk); report muscle weakness; monitor CBC with long-term use; avoid purine-rich diet",
            "C. Colchicine can be safely combined with clarithromycin for respiratory infections",
            "D. Bone marrow suppression from colchicine is only a concern with IV formulations"
        ],
        correctAnswer: "B. Diarrhea = first sign of toxicity — stop immediately; alert providers about antibiotic prescriptions (clarithromycin risk); report muscle weakness; monitor CBC with long-term use; avoid purine-rich diet",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.55,
        yOffset: 0.71,
        angle: .safety,
        baseConceptTitle: "COLCHICINE"
    ),
]
