//
//  Domain1c_Medications.swift
//  Synapse PTCE
//
//  Phase 7a — Domain 1 Gap Fill: Medications (35% of 2026 PTCB Exam)
//  7 nodes — plain-English loreText rewrite for maximum readability.
//

import Foundation

extension DataNode {

    // MARK: - Domain 1c Node Set

    static let domain1cNodes: [DataNode] = [

        // ── 45 ── TRAMADOL ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TRAMADOL",
            loreText: """
            > Tramadol (brand: Ultram, ConZip) — a pain medication with a unique two-part mechanism that makes it different from standard opioids.
            > Schedule IV controlled substance (CIV) — available by prescription with up to 5 refills in 6 months.
            > How it works — TWO mechanisms:
            > 1. Weak opioid: it weakly attaches to opioid receptors in the brain and spinal cord to reduce pain signals (much weaker than oxycodone or morphine)
            > 2. Like an antidepressant: it also blocks the reuptake of serotonin AND norepinephrine — two brain chemicals involved in pain processing and mood
            > This second mechanism (the antidepressant-like action) creates an important danger:
            > SEROTONIN SYNDROME RISK: When combined with other drugs that raise serotonin levels — SSRIs (Prozac, Zoloft, Lexapro), SNRIs (Effexor, Cymbalta), MAOIs — you can get a dangerous buildup of serotonin causing: agitation, fever, muscle rigidity, rapid heart rate. MAOI combination is ABSOLUTELY CONTRAINDICATED — can be fatal.
            > Also lowers seizure threshold — avoid in patients with epilepsy.
            > WATCH FOR: Nausea (very common), dizziness, constipation, drowsiness.
            > KEY: Tramadol is Schedule IV. It's a weak opioid PLUS SNRI — so it can cause serotonin syndrome when combined with SSRIs/SNRIs/MAOIs.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It has no opioid activity — it works entirely as an SNRI antidepressant",
                "B) It is a Schedule II drug with a high potential for abuse equal to oxycodone",
                "C) It is a weak mu-opioid agonist that also inhibits serotonin and norepinephrine reuptake",
                "D) It cannot interact with SSRIs because it acts only on opioid receptors"
            ],
            correctAnswer: "C) It is a weak mu-opioid agonist that also inhibits serotonin and norepinephrine reuptake",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.35,
            yOffset: 0.09
        ),

        // ── 46 ── PREGABALIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PREGABALIN",
            loreText: """
            > Pregabalin (brand: Lyrica) — a cousin of gabapentin that treats nerve pain and seizures. Schedule V controlled substance (has some abuse potential).
            > How it works: same mechanism as gabapentin — calms overexcited nerve signals by blocking calcium channels. But pregabalin is more potent and more predictable.
            > FDA-approved uses: diabetic nerve pain (burning/tingling in feet from diabetes), nerve pain after shingles, fibromyalgia (widespread muscle pain syndrome), nerve pain from spinal cord injury, and partial seizures.
            > KEY DIFFERENCE from gabapentin — this is frequently tested:
            > Gabapentin: unpredictable absorption — higher doses don't always give proportionally higher blood levels (the body's absorption gets "saturated")
            > Pregabalin: LINEAR pharmacokinetics — dose and blood level rise together predictably. Double the dose = double the blood level. Much easier to dose and predict.
            > Like gabapentin: eliminated through the kidneys, so dose must be reduced when kidneys are not working well.
            > WATCH FOR: Dizziness, drowsiness, weight gain, and swelling in legs. Rare but serious: angioedema (swelling of face/throat — stop immediately). Can worsen breathing when combined with opioids.
            > KEY: Pregabalin treats diabetic neuropathy, PHN, fibromyalgia. Schedule V. Key advantage over gabapentin = linear pharmacokinetics (predictable dosing).
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It is Schedule II due to significantly higher abuse potential than gabapentin",
                "B) It is approved only for pain indications; it has no anticonvulsant properties",
                "C) It exhibits linear pharmacokinetics — dose and plasma levels are proportional",
                "D) It requires hepatic dose adjustment and should be avoided in liver impairment"
            ],
            correctAnswer: "C) It exhibits linear pharmacokinetics — dose and plasma levels are proportional",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.68,
            yOffset: 0.15
        ),

        // ── 47 ── ZOLPIDEM / Z-DRUGS ────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / Z-DRUGS",
            loreText: """
            > Z-drugs are a class of sleep medications — named for the "Z" sound in each drug name. All are Schedule IV controlled substances.
            > The drugs: zolpidem (Ambien — most common), eszopiclone (Lunesta), zaleplon (Sonata — ultra short-acting)
            > How they work: Activate the same receptors as benzodiazepines (anti-anxiety drugs like Xanax) but more selectively for sleep. Despite being "different" from benzos, they have similar risks in older patients.
            > Ambien IR = helps you fall asleep. Ambien CR = helps you fall AND stay asleep.
            > BLACK BOX WARNING (FDA 2019) — printed on all Z-drug labels:
            > "Complex sleep behaviors" — patients have driven cars, cooked food, made phone calls, and had sex — all while completely asleep and with NO memory afterward. This is called sleep-driving/sleep-walking. These behaviors can cause serious injury or death. If this happens, STOP the medication immediately.
            > IMPORTANT DOSING DIFFERENCE — WOMEN vs MEN:
            > Women metabolize zolpidem SLOWER than men. They have higher blood levels in the morning → unsafe to drive. The FDA lowered the recommended dose for women. Women start at 5mg; men may use 5-10mg.
            > BEERS LIST — AVOID in adults 65 and older: same fall and confusion risks as benzodiazepines.
            > KEY: Z-drugs for insomnia. Schedule IV. Black box warning = sleep-driving (complex sleep behaviors). Women use lower doses than men.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Zolpidem is Schedule II because it is structurally similar to barbiturates",
                "B) The FDA requires a black box warning for complex sleep behaviors such as sleep-driving",
                "C) Women require a higher dose than men due to faster first-pass hepatic metabolism",
                "D) Z-drugs are exempt from the Beers Criteria because they are not benzodiazepines"
            ],
            correctAnswer: "B) The FDA requires a black box warning for complex sleep behaviors such as sleep-driving",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.24
        ),

        // ── 48 ── LITHIUM ────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LITHIUM",
            loreText: """
            > Lithium (brand: Lithobid, Eskalith) — a mood-stabilizing drug used to treat bipolar disorder. Bipolar disorder causes extreme mood swings — from depressive lows to manic highs (where a person may have racing thoughts, no need for sleep, and impulsive dangerous behavior).
            > Lithium is one of the oldest psychiatric medications and still one of the most effective for preventing manic episodes.
            > NARROW THERAPEUTIC INDEX (NTI) — this is critical: the difference between a helpful lithium dose and a toxic one is very small. Regular blood level monitoring is mandatory.
            > Therapeutic blood level: 0.6–1.2 mEq/L (maintenance). Blood must be drawn EXACTLY 12 hours after the last dose.
            > LITHIUM TOXICITY — signs get worse as level rises:
            > 1.5–2.0 mEq/L: Coarse hand tremor, nausea, diarrhea, excessive thirst/urination
            > 2.0–2.5 mEq/L: Stumbling, confusion, slurred speech
            > Above 2.5 mEq/L: Seizures, kidney failure, coma — EMERGENCY
            > KEY CAUSE OF TOXICITY — LOW SODIUM:
            > Lithium and sodium compete for the same transport system in your kidneys. When your sodium is low (from dehydration, sweating, vomiting, diarrhea, low-salt diet, NSAIDs, or ACE inhibitors), the kidneys hold onto MORE lithium → toxicity.
            > Long-term side effects: Hypothyroidism (low thyroid — monitor TSH), kidney damage, fine hand tremor (most common).
            > KEY: Lithium = bipolar disorder. Toxic range >1.5 mEq/L. Low sodium raises lithium levels → toxicity. Monitor levels, kidney function, and thyroid.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 0.8 mEq/L drawn 12 hours after the last dose — within the therapeutic range",
                "B) 1.8 mEq/L drawn 12 hours after the last dose — above the upper therapeutic limit",
                "C) TSH of 3.5 mIU/L — indicating normal thyroid function on long-term therapy",
                "D) SCr of 1.0 mg/dL — indicating normal renal clearance of lithium"
            ],
            correctAnswer: "B) 1.8 mEq/L drawn 12 hours after the last dose — above the upper therapeutic limit",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.30
        ),

        // ── 49 ── FUROSEMIDE / LOOP DIURETICS ───────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "FUROSEMIDE",
            loreText: """
            > Furosemide (brand: Lasix) — a powerful diuretic, meaning it makes you urinate more. "Diuretic" literally means "water pill." Furosemide is the strongest class of diuretic available.
            > How it works: blocks a transporter in the kidneys (in the "Loop of Henle") that normally recycles sodium, potassium, and chloride back into the body. Without this recycling, those salts spill into the urine — and water follows along (osmosis), causing massive urination.
            > Used for: Getting rid of excess fluid (edema) from heart failure, liver failure, kidney disease. Also used for dangerously high blood pressure and high calcium levels.
            > CRITICAL ELECTROLYTE LOSSES — this is the #1 safety issue:
            > Furosemide causes the body to lose POTASSIUM (hypokalemia). Low potassium can cause: muscle weakness, irregular heart rhythm, and — most importantly for the exam — makes DIGOXIN MORE TOXIC.
            > So when a patient takes BOTH furosemide AND digoxin: always monitor potassium. This furosemide + digoxin combination is a classic PTCB test scenario.
            > Also loses: sodium, magnesium, calcium.
            > IV furosemide must be given slowly — infusing too fast can damage hearing (ototoxicity).
            > Other options in same class: bumetanide (Bumex), torsemide (Demadex), ethacrynic acid (Edecrin — the only one for sulfa-allergic patients).
            > KEY: Furosemide causes potassium loss (hypokalemia). Low K+ + digoxin = digoxin toxicity. Monitor electrolytes. Loop diuretic = most potent diuretic class.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Sodium — furosemide raises serum sodium, which activates digoxin receptors",
                "B) Calcium — furosemide-induced hypercalcemia directly increases digoxin binding",
                "C) Potassium — furosemide-induced hypokalemia potentiates digoxin toxicity",
                "D) Magnesium — furosemide raises magnesium, competing with digoxin at receptor sites"
            ],
            correctAnswer: "C) Potassium — furosemide-induced hypokalemia potentiates digoxin toxicity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.48,
            yOffset: 0.38
        ),

        // ── 50 ── METHOTREXATE ───────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METHOTREXATE",
            loreText: """
            > Methotrexate (brand: Trexall, Rheumatrex) — a drug used in two very different contexts: killing cancer cells at high doses, and calming an overactive immune system at low doses.
            > For cancer (leukemia, lymphoma): high dose given in a hospital setting.
            > For rheumatoid arthritis and psoriasis: VERY LOW weekly dose taken at home. This is where the most dangerous medication errors happen.
            > THE MOST IMPORTANT SAFETY FACT ABOUT METHOTREXATE:
            > For rheumatoid arthritis and psoriasis, it is taken ONCE A WEEK — not every day. It looks like a regular daily medication, so patients (and caregivers) can accidentally take it DAILY, which has caused DEATHS from bone marrow failure and severe mouth sores.
            > As a pharmacy technician, if a patient asks "should I take this every day?", the answer is NO — and you should flag it to the pharmacist.
            > TERATOGEN — ABSOLUTELY CANNOT BE USED IN PREGNANCY: Causes severe birth defects and miscarriage. Even a single dose during pregnancy is dangerous. Women must use reliable contraception during treatment.
            > Folic acid (vitamin B9) is always prescribed alongside methotrexate — it reduces side effects without reducing the drug's effectiveness.
            > Monitor: liver function tests, complete blood count, kidney function.
            > KEY: Methotrexate for RA = ONCE WEEKLY dose — daily dosing can be fatal. Teratogen — never in pregnancy. Take folic acid alongside it.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) \"Yes, take one tablet every morning with breakfast\"",
                "B) \"Take it every other day — daily dosing would be too strong\"",
                "C) \"No — methotrexate for RA is taken ONCE WEEKLY; daily dosing can be fatal\"",
                "D) \"Take it twice a day — split the dose to reduce stomach upset\""
            ],
            correctAnswer: "C) \"No — methotrexate for RA is taken ONCE WEEKLY; daily dosing can be fatal\"",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.46
        ),

        // ── 51 ── ISOTRETINOIN / iPLED+ REMS ─────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ISOTRETINOIN",
            loreText: """
            > Isotretinoin (brands: Claravis, Amnesteem, Absorica — original brand Accutane was discontinued) — a vitamin A-based drug used for severe acne that hasn't responded to anything else (antibiotics, topicals, etc.).
            > It works by dramatically shrinking the skin's oil glands and changing how skin cells develop — essentially putting severe acne into long-term remission.
            > MOST RESTRICTIVE REMS PROGRAM IN THE US — iPLED+:
            > iPLED+ stands for internet-based Pregnancy Prevention Program. Isotretinoin causes catastrophic birth defects even from a SINGLE dose — heart malformations, facial deformities, brain abnormalities. Because of this extreme teratogenicity, it has the most tightly controlled distribution system of any drug in the US.
            > WHAT THE PHARMACY MUST DO:
            > 1. Pharmacy MUST be registered in iPLED+
            > 2. Before EVERY dispense, verify a valid RMA number (Risk Management Authorization)
            > 3. Maximum dispense = 30-DAY SUPPLY only — no exceptions, no 90-day fills
            > 4. Fill within 7 days of the RMA date — otherwise the authorization expires
            > 5. No mail-order dispensing allowed
            > FOR FEMALE PATIENTS: Must have TWO negative pregnancy tests, use TWO forms of contraception simultaneously, and have a monthly pregnancy test throughout treatment.
            > Other side effects: Severely dry lips/skin/eyes (expected), high triglycerides, liver effects, depression (monitor mood).
            > KEY: iPLED+ = 30-day supply max, must fill within 7 days of RMA date. Two forms of contraception required. Catastrophic teratogen.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 7-day supply — to allow weekly monitoring of serum triglycerides and LFTs",
                "B) 30-day supply — and the prescription must be filled within 7 days of the RMA date",
                "C) 60-day supply — for patients who have demonstrated 2 months of compliance",
                "D) 90-day supply — standard for chronic dermatological therapy under REMS programs"
            ],
            correctAnswer: "B) 30-day supply — and the prescription must be filled within 7 days of the RMA date",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.52
        )

    ] // end domain1cNodes
}
