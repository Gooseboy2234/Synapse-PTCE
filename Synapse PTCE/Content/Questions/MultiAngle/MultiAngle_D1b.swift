
//
//  MultiAngle_D1b.swift
//  Synapse PTCE
//
//  Multi-angle nodes — Domain 1 Drug Interactions + Patient Counseling
//  28 nodes: 14 key drugs × 2 additional angles each
//  Angles: Drug Interactions (.safety) | Patient Counseling (.indication)
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D1b: [DataNode] {[

        // MARK: — LISINOPRIL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Dangerous combinations with lisinopril
            > NSAIDs (ibuprofen, naproxen): Reduce antihypertensive effect AND increase risk of AKI — avoid regular use
            > POTASSIUM-SPARING DIURETICS + K+ SUPPLEMENTS: Additive hyperkalemia risk — monitor K+ closely
            > ALISKIREN: Contraindicated in diabetes (dual RAAS blockade → hyperkalemia, hypotension, renal failure)
            > LITHIUM: ACE inhibitors reduce lithium clearance → lithium toxicity — monitor levels
            > OTHER ANTIHYPERTENSIVES: Additive hypotension — titrate carefully
            """,
            challengeType: .multipleChoice,
            options: [
                "A. NSAIDs — reduce antihypertensive effect and increase risk of AKI",
                "B. Calcium supplements — reduce lisinopril absorption significantly",
                "C. Metformin — both cause lactic acidosis when combined",
                "D. Statins — additive myopathy risk when taken with ACE inhibitors"
            ],
            correctAnswer: "A. NSAIDs — reduce antihypertensive effect and increase risk of AKI",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.15,
            angle: .safety,
            baseConceptTitle: "LISINOPRIL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LISINOPRIL / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for lisinopril patients
            > COUGH: A dry, persistent cough may develop — report to prescriber; switch to ARB if intolerable
            > ANGIOEDEMA: Report any swelling of face, lips, tongue, or throat IMMEDIATELY — this is an emergency
            > PREGNANCY: Report pregnancy at once — lisinopril is absolutely contraindicated (fetal injury)
            > AVOID: OTC NSAIDs (Advil, Aleve) without prescriber approval
            > AVOID: K+ supplements and salt substitutes (many contain KCl)
            > MONITORING: Regular blood pressure and kidney function checks needed
            """,
            challengeType: .multipleChoice,
            options: [
                "A. It is safe to take ibuprofen for headaches while on lisinopril",
                "B. Report swelling of face/lips/tongue immediately — this may be life-threatening angioedema",
                "C. Stop lisinopril as soon as you feel better — it only needs short-term use",
                "D. Take with food — absorption is significantly reduced on an empty stomach"
            ],
            correctAnswer: "B. Report swelling of face/lips/tongue immediately — this may be life-threatening angioedema",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.15,
            angle: .indication,
            baseConceptTitle: "LISINOPRIL"
        ),

        // MARK: — METOPROLOL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Dangerous combinations with metoprolol
            > VERAPAMIL / DILTIAZEM (non-DHP CCBs): Additive AV node blockade → severe bradycardia, heart block — generally avoid
            > CYP2D6 INHIBITORS (fluoxetine, paroxetine, bupropion): Increase metoprolol plasma levels → bradycardia
            > CLONIDINE: Abrupt clonidine withdrawal + beta-blocker → severe rebound hypertension
            > INSULIN / ORAL ANTIDIABETICS: Beta-blockade masks hypoglycemia symptoms (except sweating) — use with caution in diabetics
            > OTHER ANTIHYPERTENSIVES: Additive hypotension — monitor BP
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Fluoxetine (CYP2D6 inhibitor) — increases metoprolol levels, risking bradycardia",
                "B. Warfarin — beta-blockers inhibit CYP2C9 metabolism of warfarin",
                "C. Metformin — competing renal tubular secretion increases both levels",
                "D. Omeprazole — CYP2C19 interaction significantly reduces metoprolol activity"
            ],
            correctAnswer: "A. Fluoxetine (CYP2D6 inhibitor) — increases metoprolol levels, risking bradycardia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.21,
            angle: .safety,
            baseConceptTitle: "METOPROLOL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METOPROLOL / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for metoprolol patients
            > NEVER STOP ABRUPTLY: Taper over 1–2 weeks — abrupt stop can cause rebound angina or MI
            > PULSE CHECK: Take pulse before each dose; call prescriber if < 60 bpm or irregular
            > FOOD: Take metoprolol tartrate (IR) with food — improves absorption
            > EXTENDED RELEASE: Toprol-XL tablet may be halved along score line; NEVER crush or chew
            > DIABETES: Metoprolol may hide low blood sugar symptoms — monitor glucose carefully
            > DIZZINESS: Common when starting; change positions slowly
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stop metoprolol immediately if you experience any side effects",
                "B. Crush extended-release tablet to improve absorption if swallowing is difficult",
                "C. Never stop metoprolol abruptly — taper over 1–2 weeks to avoid rebound",
                "D. Metoprolol enhances awareness of low blood sugar symptoms in diabetics"
            ],
            correctAnswer: "C. Never stop metoprolol abruptly — taper over 1–2 weeks to avoid rebound",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.21,
            angle: .indication,
            baseConceptTitle: "METOPROLOL"
        ),

        // MARK: — ATORVASTATIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — CYP3A4 and myopathy risks
            > STRONG CYP3A4 INHIBITORS (clarithromycin, itraconazole, HIV protease inhibitors): Increase atorvastatin levels → myopathy/rhabdomyolysis — avoid or use lowest statin dose
            > GEMFIBROZIL: Significantly increases statin exposure + inhibits statin glucuronidation → highest rhabdomyolysis risk — avoid combination
            > CYCLOSPORINE: Increases atorvastatin AUC 8× — avoid
            > NIACIN (high dose): Additive myopathy risk
            > GRAPEFRUIT JUICE: Moderate CYP3A4 inhibition — limit large quantities
            > AMLODIPINE: When dose > 5mg, limits simvastatin to 20mg (not atorvastatin — atorvastatin safer)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Gemfibrozil — highest rhabdomyolysis risk; avoid this combination",
                "B. Aspirin — competes for albumin binding, increasing free atorvastatin",
                "C. Metformin — additive hepatotoxicity requiring liver function monitoring",
                "D. Omeprazole — significantly reduces atorvastatin oral bioavailability"
            ],
            correctAnswer: "A. Gemfibrozil — highest rhabdomyolysis risk; avoid this combination",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.27,
            angle: .safety,
            baseConceptTitle: "ATORVASTATIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ATORVASTATIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for atorvastatin patients
            > MUSCLE SYMPTOMS: Report muscle pain, weakness, or dark urine immediately — possible rhabdomyolysis
            > TIMING: Can be taken at any time of day (unlike simvastatin/lovastatin which require bedtime)
            > GRAPEFRUIT: Avoid large amounts of grapefruit juice — CYP3A4 inhibition increases drug levels
            > PREGNANCY: Contraindicated — use effective contraception; stop before pregnancy
            > BENEFITS: Cholesterol reduction takes 4–6 weeks; cardiovascular risk reduction is the primary goal
            > LAB MONITORING: Lipid panel 4–12 weeks after starting, then annually; baseline LFTs
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Atorvastatin must be taken at bedtime to match the liver's peak cholesterol synthesis",
                "B. Report muscle pain, weakness, or dark urine immediately — these may signal rhabdomyolysis",
                "C. Avoid all fruit juices while on atorvastatin — they universally inhibit its absorption",
                "D. Cholesterol lowering is seen within 24–48 hours of the first dose"
            ],
            correctAnswer: "B. Report muscle pain, weakness, or dark urine immediately — these may signal rhabdomyolysis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.27,
            angle: .indication,
            baseConceptTitle: "ATORVASTATIN"
        ),

        // MARK: — WARFARIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Warfarin has the most drug interactions of any medication
            > INCREASE INR (BLEEDING RISK): Amiodarone, fluconazole, metronidazole, TMP/SMX, clarithromycin (CYP2C9 inhibitors or displace warfarin)
            > DECREASE INR (CLOT RISK): Rifampin, carbamazepine, phenytoin (CYP2C9/CYP1A2 inducers)
            > HIGH-RISK COMBINATIONS: NSAIDs + warfarin = GI bleeding; aspirin + warfarin = major bleeding
            > DIET INTERACTION: Vit K-rich foods (kale, spinach) decrease warfarin effect — keep intake consistent
            > ANTIBIOTICS: Reduce gut flora → decreased Vit K production → increased INR
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Amiodarone — potent CYP2C9 inhibitor that significantly elevates INR",
                "B. Rifampin — reduces warfarin effect, placing patient at risk for clot",
                "C. Metronidazole — Flagyl inhibits CYP2C9, increasing bleeding risk",
                "D. All of the above are clinically significant warfarin interactions"
            ],
            correctAnswer: "D. All of the above are clinically significant warfarin interactions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.33,
            angle: .safety,
            baseConceptTitle: "WARFARIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "WARFARIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for warfarin patients
            > DIET CONSISTENCY: Keep Vitamin K intake CONSISTENT — don't suddenly start/stop leafy greens
            > BLEEDING SIGNS: Report unusual bleeding (gums, nosebleeds, blood in urine/stool, prolonged cuts)
            > NO OTC NSAIDs: Ibuprofen, naproxen, aspirin increase bleeding risk significantly
            > INFORM ALL PROVIDERS: Every new Rx, OTC drug, herbal product can affect INR
            > ID CARD: Carry an anticoagulation wallet card or wear medical alert ID
            > APPOINTMENTS: Regular INR monitoring is essential — never miss INR checks
            > ALCOHOL: Limit — heavy use can significantly alter INR in either direction
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Eat as many leafy greens as possible — Vitamin K helps warfarin work better",
                "B. OTC ibuprofen is safe to use since it doesn't affect the INR level",
                "C. Keep Vitamin K intake consistent and report any unusual bleeding to your prescriber",
                "D. Warfarin is safe to stop any time — just call your doctor within a week"
            ],
            correctAnswer: "C. Keep Vitamin K intake consistent and report any unusual bleeding to your prescriber",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.33,
            angle: .indication,
            baseConceptTitle: "WARFARIN"
        ),

        // MARK: — METFORMIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Key metformin interactions
            > IODINATED CONTRAST: HOLD metformin 48 hours before/after procedures — combined risk of AKI + lactic acidosis
            > ALCOHOL: Increases risk of lactic acidosis — advise limiting intake
            > OCT2 INHIBITORS (cimetidine, dolutegravir): Reduce renal tubular secretion of metformin → increased levels
            > CARBONIC ANHYDRASE INHIBITORS (topiramate, acetazolamide): Additive risk of metabolic acidosis/lactic acidosis
            > CORTICOSTEROIDS: Antagonize metformin; increase blood glucose — may require dose adjustment
            > DIURETICS (thiazides, loop): Can increase blood glucose and BG control worsens
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Ibuprofen — reduces metformin absorption via chelation in the GI tract",
                "B. Iodinated contrast media — must hold metformin 48 hours before contrast due to lactic acidosis risk",
                "C. Warfarin — metformin inhibits CYP2C9 metabolism of warfarin",
                "D. Proton pump inhibitors — significantly increase metformin plasma levels"
            ],
            correctAnswer: "B. Iodinated contrast media — must hold metformin 48 hours before contrast due to lactic acidosis risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.39,
            angle: .safety,
            baseConceptTitle: "METFORMIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METFORMIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for metformin patients
            > TAKE WITH MEALS: Reduces GI side effects (nausea, diarrhea, stomach upset)
            > GI SIDE EFFECTS: Usually temporary — most patients tolerate after 2–4 weeks; ER formulation helps
            > CONTRAST DYE: Tell every radiologist, nurse, and tech that you take metformin before any scan with dye
            > ALCOHOL: Limit alcohol consumption — increases lactic acidosis risk
            > SURGERY: Hold metformin the day of surgery — discuss with prescriber and surgeon
            > B12: Long-term use can deplete Vitamin B12 — annual B12 check recommended
            > DIABETES: Metformin is ONE PART of management — diet, exercise, and blood sugar monitoring also essential
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take metformin on an empty stomach for best absorption",
                "B. Take with meals to reduce GI side effects like nausea and diarrhea",
                "C. Grapefruit juice should be avoided — it inhibits metformin's activation",
                "D. Annual eye exams are the most critical monitoring parameter for metformin"
            ],
            correctAnswer: "B. Take with meals to reduce GI side effects like nausea and diarrhea",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.39,
            angle: .indication,
            baseConceptTitle: "METFORMIN"
        ),

        // MARK: — AMOXICILLIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Key amoxicillin interactions
            > WARFARIN: Amoxicillin (by killing gut flora) can increase INR — monitor INR if on warfarin
            > METHOTREXATE: Amoxicillin reduces renal tubular secretion of MTX → methotrexate toxicity — monitor closely
            > PROBENECID: Inhibits renal tubular secretion of amoxicillin → increases amoxicillin levels (used therapeutically for some infections)
            > ORAL CONTRACEPTIVES: Historically cautioned; current evidence suggests no clinically significant interaction, but backup method still often advised
            > ALLOPURINOL: Concurrent use increases incidence of skin rash (ampicillin/amoxicillin + allopurinol → rash)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Probenecid — increases amoxicillin levels by blocking renal tubular secretion",
                "B. Warfarin — amoxicillin-mediated gut flora changes may increase INR",
                "C. Allopurinol — increases the incidence of skin rash with amoxicillin",
                "D. All of the above are recognized amoxicillin drug interactions"
            ],
            correctAnswer: "D. All of the above are recognized amoxicillin drug interactions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.45,
            angle: .safety,
            baseConceptTitle: "AMOXICILLIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMOXICILLIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for amoxicillin patients
            > COMPLETE COURSE: Finish ALL antibiotic doses even if feeling better — stopping early leads to resistance
            > FOOD: May be taken with or without food
            > ALLERGY ALERT: Report any rash, hives, difficulty breathing, or swelling immediately
            > LIQUID: Keep reconstituted suspension REFRIGERATED; shake well before each use; discard after 14 days
            > DIARRHEA: Report severe or bloody diarrhea — may indicate C. difficile (rare but serious)
            > OCP: Advise using backup contraception during antibiotic therapy (abundance of caution)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Stop amoxicillin as soon as symptoms improve to limit antibiotic exposure",
                "B. Keep reconstituted liquid amoxicillin refrigerated and discard after 14 days",
                "C. The reconstituted suspension is stable at room temperature for 60 days",
                "D. Take on an empty stomach for most rapid absorption and efficacy"
            ],
            correctAnswer: "B. Keep reconstituted liquid amoxicillin refrigerated and discard after 14 days",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.45,
            angle: .indication,
            baseConceptTitle: "AMOXICILLIN"
        ),

        // MARK: — CIPROFLOXACIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Critical ciprofloxacin combinations
            > DIVALENT CATIONS: Antacids (Mg2+, Al3+), iron, Ca2+, dairy — CHELATION → drastically reduces absorption; separate by 2h before or 6h after
            > THEOPHYLLINE: Cipro inhibits CYP1A2 → theophylline levels double → seizures and cardiac arrhythmias
            > WARFARIN: CYP2C9 inhibition → increases INR → bleeding risk — monitor INR closely
            > TIZANIDINE: CONTRAINDICATED — cipro dramatically increases tizanidine levels → severe hypotension, sedation
            > QT-PROLONGING DRUGS: Class IA/III antiarrhythmics, ondansetron — additive QT prolongation risk
            > NSAIDs: Additive CNS stimulation → lower seizure threshold
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Tizanidine — absolutely contraindicated; cipro increases tizanidine to dangerous levels",
                "B. Theophylline — cipro inhibits CYP1A2, potentially doubling theophylline levels",
                "C. Antacids — chelation by divalent cations significantly reduces ciprofloxacin absorption",
                "D. All of the above are critical ciprofloxacin interactions"
            ],
            correctAnswer: "D. All of the above are critical ciprofloxacin interactions",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.51,
            angle: .safety,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CIPROFLOXACIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for ciprofloxacin patients
            > ANTACIDS/SUPPLEMENTS: Take cipro 2 hours BEFORE or 6 hours AFTER antacids, iron, or calcium supplements
            > TENDON WARNING: Report any tendon pain or swelling (especially heel/Achilles) — stop drug and call doctor
            > PHOTOSENSITIVITY: Use sunscreen and protective clothing — avoid tanning beds
            > STAY HYDRATED: Drink plenty of water to prevent crystalluria (crystals in urine)
            > COMPLETE COURSE: Finish all doses even if feeling better
            > AVOID: Caffeine may accumulate (CYP1A2 inhibition) — limit intake to avoid jitteriness/insomnia
            > DRIVING: May impair concentration/alertness — caution when driving
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take ciprofloxacin with a calcium supplement to improve bone absorption",
                "B. Report tendon pain, especially Achilles heel pain — stop the drug and call your doctor",
                "C. Antacids help protect the stomach — take together to prevent GI upset",
                "D. Avoid all fluids for 2 hours after ciprofloxacin to maximize absorption"
            ],
            correctAnswer: "B. Report tendon pain, especially Achilles heel pain — stop the drug and call your doctor",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.51,
            angle: .indication,
            baseConceptTitle: "CIPROFLOXACIN"
        ),

        // MARK: — ALBUTEROL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Important albuterol combinations
            > BETA-BLOCKERS: Non-selective (propranolol) blocks bronchodilation and can worsen bronchospasm — generally contraindicated in asthma
            > MAOIs: Severe hypertension risk with sympathomimetics like albuterol — avoid within 14 days of MAOI
            > DIGOXIN: Albuterol-induced hypokalemia → increased digoxin toxicity risk — monitor K+ and digoxin
            > TRICYCLIC ANTIDEPRESSANTS: Potentiate cardiovascular effects of albuterol (tachycardia, hypertension)
            > OTHER SYMPATHOMIMETICS (decongestants, epinephrine): Additive cardiovascular effects → tachycardia
            > LOOP DIURETICS: Additive hypokalemia — monitor potassium especially with high-dose nebulization
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Non-selective beta-blockers — block albuterol's bronchodilatory effect and worsen bronchospasm",
                "B. Aspirin — reduces albuterol absorption via GI chelation mechanism",
                "C. SSRIs — compete for the same serotonin receptor sites in the bronchioles",
                "D. Calcium channel blockers — additive bronchoconstriction with albuterol"
            ],
            correctAnswer: "A. Non-selective beta-blockers — block albuterol's bronchodilatory effect and worsen bronchospasm",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.57,
            angle: .safety,
            baseConceptTitle: "ALBUTEROL"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALBUTEROL / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for albuterol inhaler patients
            > SHAKE FIRST: Shake canister well before each use
            > PRIME: Prime with 4 sprays into the air if new or not used in > 2 weeks
            > SPACER: Use a valved holding chamber (spacer) — significantly improves lung delivery
            > TECHNIQUE: Exhale fully, place in mouth, press and inhale slowly over 5 seconds; hold breath 10 sec
            > RESCUE ONLY: Albuterol is for ACUTE relief — not a daily controller medication
            > OVERUSE WARNING: Using > 2 canisters/month = poorly controlled asthma → contact prescriber to escalate therapy
            > RINSE MOUTH: Not required for albuterol, but good habit after any inhaler
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Albuterol should be taken on a scheduled basis twice daily for best results",
                "B. Use a spacer/valved holding chamber to maximize the amount of drug reaching the lungs",
                "C. Always inhale rapidly and forcefully — this improves drug deposition in the airways",
                "D. If using more than 4 puffs per week, this indicates excellent asthma control"
            ],
            correctAnswer: "B. Use a spacer/valved holding chamber to maximize the amount of drug reaching the lungs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.57,
            angle: .indication,
            baseConceptTitle: "ALBUTEROL"
        ),

        // MARK: — INSULIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Substances that alter insulin's effect
            > BETA-BLOCKERS: Mask hypoglycemia symptoms (except sweating) AND can prolong hypoglycemia — use with caution
            > CORTICOSTEROIDS (prednisone): Antagonize insulin → raise blood glucose — insulin dose increase needed
            > ALCOHOL: Enhances hypoglycemia (blocks gluconeogenesis) — serious risk, especially on empty stomach
            > FLUOROQUINOLONES: Can cause both hypoglycemia AND hyperglycemia (dysglycemia) — monitor glucose
            > THIAZIDE DIURETICS: Increase blood glucose, may require insulin adjustment
            > SULFONYLUREAS + INSULIN: Additive hypoglycemia risk
            > THIAZOLIDINEDIONES: Additive hypoglycemia + fluid retention risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Beta-blockers — mask hypoglycemia warning signs and can prolong the hypoglycemic episode",
                "B. ACE inhibitors — block insulin's ability to lower blood glucose effectively",
                "C. Statins — compete with insulin at pancreatic beta-cell receptors",
                "D. PPIs — inhibit gastric acid, reducing insulin absorption from subcutaneous injection sites"
            ],
            correctAnswer: "A. Beta-blockers — mask hypoglycemia warning signs and can prolong the hypoglycemic episode",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.63,
            angle: .safety,
            baseConceptTitle: "INSULIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for insulin patients
            > INJECTION TECHNIQUE: Rotate injection sites within same area (e.g., left abdomen → different spot each time) — prevents lipohypertrophy
            > HYPOGLYCEMIA SUPPLIES: Always carry fast-acting glucose (juice, glucose tablets, candy)
            > INSPECT BEFORE USE: Clear insulins should be clear; check for particles or color change
            > NEVER FREEZE: Never use frozen insulin — freezing destroys the protein structure
            > SYRINGE DISPOSAL: Use sharps container — never dispose of needles in regular trash
            > ALCOHOL SWAB: Let injection site dry after swabbing — wet alcohol can cause stinging and slight dilution
            > SICK DAYS: Never skip insulin when sick, even if not eating — illness raises blood glucose
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inject into the same site every time for consistent absorption",
                "B. Rotate injection sites to prevent lipohypertrophy (fatty lumps under skin)",
                "C. Freeze unused insulin to extend shelf life past the expiration date",
                "D. Skip insulin doses on days when not eating — fasting negates the need"
            ],
            correctAnswer: "B. Rotate injection sites to prevent lipohypertrophy (fatty lumps under skin)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.63,
            angle: .indication,
            baseConceptTitle: "INSULIN"
        ),

        // MARK: — DIGOXIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Critical digoxin interactions (narrow therapeutic index)
            > AMIODARONE: Inhibits P-glycoprotein and renal elimination → doubles digoxin level → REDUCE digoxin dose by 50%
            > VERAPAMIL / DILTIAZEM: Increase digoxin levels → monitor and reduce dose
            > QUINIDINE: P-gp inhibitor → increase digoxin by 50–100% → reduce digoxin dose 50%
            > LOOP DIURETICS (furosemide): Cause hypokalemia → enhance digoxin toxicity — monitor K+
            > CLARITHROMYCIN / ERYTHROMYCIN: Kill gut flora that metabolize digoxin → increase absorption
            > SPIRONOLACTONE: Can falsely elevate digoxin immunoassay levels — use specialized assay
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Amiodarone, verapamil, and quinidine all increase digoxin levels — reduce digoxin dose when starting these",
                "B. Aspirin directly competes with digoxin at Na+/K+-ATPase binding sites",
                "C. ACE inhibitors reduce digoxin clearance, requiring significant dose reductions",
                "D. Statins compete with P-glycoprotein efflux of digoxin from GI tract"
            ],
            correctAnswer: "A. Amiodarone, verapamil, and quinidine all increase digoxin levels — reduce digoxin dose when starting these",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.69,
            angle: .safety,
            baseConceptTitle: "DIGOXIN"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for digoxin patients
            > PULSE CHECK: Take pulse before each dose — hold if < 60 bpm and call prescriber
            > MISSED DOSE: If missed, skip it — do NOT double the next dose
            > TOXICITY SIGNS: Report nausea, vomiting, visual changes (yellow/green halos, blurred vision), or irregular heartbeat
            > HIGH FIBER FOODS: Large amounts of dietary fiber can reduce digoxin absorption — be consistent
            > REGULAR LABS: Blood tests for digoxin level AND electrolytes (K+, Mg2+) are required
            > MEDICATIONS: Tell every provider about digoxin — many drugs affect levels
            > WEIGHT: Weigh daily — report significant gain (may indicate fluid retention/HF worsening)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take double the dose if you miss a dose to maintain therapeutic levels",
                "B. Check your pulse before each dose — hold if below 60 bpm and call your prescriber",
                "C. Visual changes (seeing halos) are a normal side effect and not cause for alarm",
                "D. Potassium levels are irrelevant to digoxin therapy and don't need monitoring"
            ],
            correctAnswer: "B. Check your pulse before each dose — hold if below 60 bpm and call your prescriber",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.69,
            angle: .indication,
            baseConceptTitle: "DIGOXIN"
        ),

        // MARK: — SERTRALINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Serotonin syndrome and CYP interactions
            > MAOIs: CONTRAINDICATED — serotonin syndrome risk; 14-day washout between MAOI and SSRI
            > LINEZOLID / METHYLENE BLUE: MAO-inhibiting properties — serious serotonin syndrome risk
            > TRAMADOL / TRIPTANS: Additive serotonergic effects — risk of serotonin syndrome
            > CYP2D6 SUBSTRATES: Sertraline inhibits CYP2D6 → increases TCAs, antipsychotics, codeine levels
            > NSAIDS / WARFARIN + SSRIs: Additive GI bleeding risk (SSRIs reduce platelet serotonin)
            > ST. JOHN'S WORT: Herbal serotonin reuptake inhibitor — additive serotonin syndrome risk
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Antacids — reduce sertraline absorption by raising gastric pH",
                "B. MAO inhibitors — life-threatening serotonin syndrome; 14-day washout required",
                "C. Beta-blockers — compete at serotonin receptors, reducing antidepressant efficacy",
                "D. Statins — both drugs inhibit CYP3A4, leading to toxicity of both agents"
            ],
            correctAnswer: "B. MAO inhibitors — life-threatening serotonin syndrome; 14-day washout required",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "SERTRALINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SERTRALINE / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for sertraline patients
            > DELAYED ONSET: Takes 2–4 weeks for mood improvement; full antidepressant effect in 6–8 weeks — be patient
            > INITIAL ANXIETY: May worsen anxiety or cause insomnia for the first 1–2 weeks — usually resolves
            > NEVER STOP ABRUPTLY: Taper to avoid discontinuation syndrome (flu-like symptoms, electric shock sensations)
            > ALCOHOL: Avoid — additive CNS depression and worsened depression
            > SUICIDAL THOUGHTS: Report immediately, especially in patients ≤24 years old — increased risk in early treatment (FDA Black Box Warning)
            > AVOID: St. John's Wort herbal supplement — serious serotonin syndrome risk
            > ORAL CONCENTRATE: Contains 12% alcohol — avoid in patients with alcohol problems
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Expect full antidepressant effects within 48–72 hours of the first dose",
                "B. Stop sertraline immediately if you still feel depressed after 2 weeks",
                "C. Takes 2–4 weeks for effects; never stop abruptly; report suicidal thoughts immediately",
                "D. Sertraline works best when taken at bedtime with a small alcoholic beverage to aid relaxation"
            ],
            correctAnswer: "C. Takes 2–4 weeks for effects; never stop abruptly; report suicidal thoughts immediately",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.74,
            angle: .indication,
            baseConceptTitle: "SERTRALINE"
        ),

        // MARK: — AMLODIPINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — CYP3A4 and co-prescribing risks
            > CYP3A4 INHIBITORS (clarithromycin, itraconazole, ritonavir): Increase amlodipine AUC up to 40% → hypotension
            > GRAPEFRUIT JUICE: Moderate CYP3A4 inhibitor → modestly increases levels; advise to avoid large quantities
            > SIMVASTATIN: FDA recommends limiting simvastatin to 20mg/day if amlodipine > 5mg (P-gp interaction — applies to simvastatin, not atorvastatin)
            > CYCLOSPORINE: Amlodipine increases cyclosporine levels
            > OTHER ANTIHYPERTENSIVES: Additive hypotension — titrate carefully when combining
            > SILDENAFIL (Viagra): Both cause vasodilation → additive hypotension — use caution
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Simvastatin doses should be limited when combined with amlodipine > 5mg (not atorvastatin)",
                "B. Aspirin reduces amlodipine efficacy via prostaglandin competition",
                "C. Beta-blockers are contraindicated with amlodipine in all patients",
                "D. Metformin increases amlodipine levels via OCT renal transporter interactions"
            ],
            correctAnswer: "A. Simvastatin doses should be limited when combined with amlodipine > 5mg (not atorvastatin)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.79,
            angle: .safety,
            baseConceptTitle: "AMLODIPINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AMLODIPINE / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for amlodipine patients
            > ANKLE SWELLING: Report significant ankle swelling — common side effect; may require dose adjustment
            > SLOW POSITION CHANGES: Rise slowly from sitting/lying to avoid orthostatic hypotension (dizziness)
            > GRAPEFRUIT: Limit large quantities of grapefruit juice
            > DO NOT STOP ABRUPTLY: May precipitate angina; consult prescriber before stopping
            > FLUSHING/HEADACHE: Especially in first few weeks — usually subsides with continued use
            > FLEXIBLE TIMING: Can be taken at any time of day, with or without food — convenience matters for adherence
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Large amounts of grapefruit juice should be encouraged — they enhance amlodipine's efficacy",
                "B. Significant ankle swelling and dizziness when rising are common — report swelling to your prescriber",
                "C. Amlodipine must be taken at exactly the same time every day or it will not work",
                "D. Stop immediately if you notice any flushing or headache during the first week"
            ],
            correctAnswer: "B. Significant ankle swelling and dizziness when rising are common — report swelling to your prescriber",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.79,
            angle: .indication,
            baseConceptTitle: "AMLODIPINE"
        ),

        // MARK: — OMEPRAZOLE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — CYP2C19 interactions and acid-dependent drugs
            > CLOPIDOGREL: Omeprazole inhibits CYP2C19 → reduces conversion of clopidogrel to active form → REDUCED antiplatelet effect — use PANTOPRAZOLE instead
            > ACID-DEPENDENT DRUGS: Ketoconazole, itraconazole, erlotinib, nilotinib — require acidic stomach for absorption; PPIs reduce effectiveness
            > METHOTREXATE: PPIs reduce renal tubular secretion of MTX → toxicity at high MTX doses
            > TACROLIMUS: Omeprazole may increase tacrolimus levels via CYP3A4/CYP2C19 inhibition
            > ANTIRETROVIRALS: Atazanavir, rilpivirine require low pH for absorption — PPIs may reduce levels
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Clopidogrel — omeprazole reduces its antiplatelet activation; use pantoprazole instead",
                "B. Warfarin — omeprazole dramatically increases INR requiring weekly monitoring",
                "C. Levothyroxine — both drugs compete for the same GI absorption transporter",
                "D. Insulin — omeprazole increases insulin degradation in the GI tract"
            ],
            correctAnswer: "A. Clopidogrel — omeprazole reduces its antiplatelet activation; use pantoprazole instead",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.84,
            angle: .safety,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OMEPRAZOLE / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for omeprazole patients
            > TIMING: Take 30–60 minutes BEFORE the first meal — critical for maximum efficacy
            > OTC LIMIT: If buying OTC for heartburn, take for 14 days only; if symptoms persist, see a doctor
            > SWALLOWING DIFFICULTY: If unable to swallow capsule, open and sprinkle contents on 1 tablespoon of applesauce — do NOT crush pellets; swallow immediately without chewing
            > LONG-TERM USE: Discuss with prescriber — long-term use may deplete magnesium and B12; may increase fracture and C. diff risk
            > MISSED DOSE: If missed, take when remembered (if before meal); skip if close to next meal
            > DIETARY TRIGGERS: PPIs control acid but don't replace diet modification for GERD (avoid fatty foods, caffeine, alcohol, spicy foods, late-night eating)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take omeprazole at bedtime to maximize suppression of overnight acid production",
                "B. Take 30–60 minutes before the first meal for maximum effectiveness",
                "C. For heartburn, take omeprazole as needed when symptoms occur",
                "D. Crush the capsule contents to ensure faster absorption and onset of action"
            ],
            correctAnswer: "B. Take 30–60 minutes before the first meal for maximum effectiveness",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.84,
            angle: .indication,
            baseConceptTitle: "OMEPRAZOLE"
        ),

        // MARK: — LEVOTHYROXINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / INTERACTIONS",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Drug Interactions — Critical absorption and metabolism interactions
            > ABSORPTION REDUCERS (separate by 4h): Calcium carbonate, ferrous sulfate (iron), antacids (Mg, Al), sucralfate, cholestyramine, sevelamer, proton pump inhibitors
            > WARFARIN: Levothyroxine increases catabolism of clotting factors → increased anticoagulation → monitor INR
            > AMIODARONE: Contains 37% iodine → inhibits T4 → T3 conversion and displaces T4 from proteins → complex thyroid effects; monitor TSH closely
            > INSULIN / ANTIDIABETICS: As thyroid normalizes metabolism, glucose management may require adjustment
            > CYP INDUCERS (rifampin, phenytoin): Increase levothyroxine metabolism → hypothyroidism may return
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Calcium supplements taken at same time significantly reduce levothyroxine absorption",
                "B. Iron supplements taken with levothyroxine double its efficacy via iron chelation enhancement",
                "C. Antacids should be taken within 30 minutes of levothyroxine to protect the GI tract",
                "D. Grapefruit juice is the primary interaction concern for levothyroxine patients"
            ],
            correctAnswer: "A. Calcium supplements taken at same time significantly reduce levothyroxine absorption",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.28,
            yOffset: 0.89,
            angle: .safety,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVOTHYROXINE / COUNSELING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANGLE: Patient Counseling — Key points for levothyroxine patients
            > EMPTY STOMACH: Take 30–60 minutes BEFORE breakfast on an empty stomach — food reduces absorption
            > CALCIUM AND IRON: Never take at same time — separate by at least 4 hours
            > BRAND CONSISTENCY: If switching brands or generic, check TSH levels in 6–8 weeks — small bioavailability differences matter
            > ADHERENCE: Even one missed dose per week can reduce thyroid control — consistency is critical
            > TSH MONITORING: Regular TSH checks needed — dose adjustments common, especially in pregnancy, after surgery, or aging
            > SYMPTOMS TO REPORT: Palpitations, excessive sweating, tremor, weight loss (suggests too much) OR fatigue, weight gain, cold intolerance (suggests too little)
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Take levothyroxine at bedtime with a glass of milk for best absorption",
                "B. Take on an empty stomach 30–60 minutes before breakfast; separate calcium/iron by 4 hours",
                "C. Once stable, TSH monitoring is no longer necessary — stop yearly tests",
                "D. Switch between generic and brand-name formulations freely — they are identical in all patients"
            ],
            correctAnswer: "B. Take on an empty stomach 30–60 minutes before breakfast; separate calcium/iron by 4 hours",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.89,
            angle: .indication,
            baseConceptTitle: "LEVOTHYROXINE"
        ),

    ]}
}
