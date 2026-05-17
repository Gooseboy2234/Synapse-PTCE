//
//  Domain1b_Medications.swift
//  Synapse PTCE
//
//  Phase 6 — Domain 1 Expansion: Medications (35% of 2026 PTCB Exam)
//  16 additional nodes — plain-English loreText rewrite for maximum readability.
//

import Foundation

extension DataNode {

    // MARK: - Domain 1b Node Set

    static let domain1bNodes: [DataNode] = [

        // ── 29 ── INSULIN TYPES ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "INSULIN TYPES",
            loreText: """
            > Insulin is the hormone your body uses to move sugar from your blood into cells for energy. In diabetes, either the body doesn't make enough (Type 1) or can't use it well (Type 2), so you inject it.
            > There are FOUR speed categories — and knowing which is fastest vs. longest is the main exam point:
            > RAPID-ACTING (fastest): lispro (Humalog), aspart (NovoLog), glulisine (Apidra) — start working in 15 minutes. Inject RIGHT BEFORE a meal.
            > SHORT-ACTING: Regular insulin (Humulin R, Novolin R) — inject 30 minutes before a meal. Slower than rapid-acting.
            > INTERMEDIATE-ACTING: NPH (Humulin N, Novolin N) — CLOUDY appearance. Can be mixed with Regular; always draw Regular first.
            > LONG-ACTING (slowest, lasts all day): glargine (Lantus, Basaglar), detemir (Levemir), degludec (Tresiba) — CLEAR, NO peak effect, given once daily. CANNOT be mixed with anything.
            > STORAGE: Unopened insulin → refrigerate. In-use vials/pens → room temperature per label (usually 28-30 days). Never freeze — freezing destroys insulin.
            > KEY: Long-acting insulin (Lantus/glargine) has NO peak — it's steady all day. Cannot be mixed with other insulins.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Regular insulin (Humulin R) — it has no peak effect",
                "B) NPH insulin (Humulin N) — it is given only at bedtime",
                "C) Insulin glargine (Lantus) — it is peakless and cannot be mixed",
                "D) Insulin lispro (Humalog) — it has the longest duration of action"
            ],
            correctAnswer: "C) Insulin glargine (Lantus) — it is peakless and cannot be mixed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.30,
            yOffset: 0.07
        ),

        // ── 30 ── ADHD STIMULANTS ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ADHD STIMULANTS",
            loreText: """
            > ADHD stimulants are medications used to improve focus in people with Attention Deficit Hyperactivity Disorder. They work by boosting dopamine and norepinephrine — the brain chemicals that help you pay attention and control impulses.
            > TWO main drug groups:
            > Methylphenidate products: Ritalin (short-acting), Concerta (extended-release), Daytrana (patch), Quillivant XR (liquid)
            > Amphetamine products: Adderall (mixed amphetamine salts), Adderall XR, Vyvanse (lisdexamfetamine — a "prodrug" designed to resist abuse), Dexedrine
            > ALL of these are Schedule II (CII) controlled substances — the STRICTEST category for drugs with accepted medical use.
            > What Schedule II means for the pharmacy: NO REFILLS allowed at all. Patient needs a brand-new prescription every single fill. Cannot call them in by phone (except true emergency). Must be written or electronic (EPCS).
            > Non-stimulant options (NOT Schedule II): Strattera (atomoxetine), Intuniv (guanfacine), Kapvay (clonidine)
            > WATCH FOR: Can raise heart rate and blood pressure, suppress appetite, and cause insomnia. Do NOT use with MAOIs.
            > KEY: ADHD stimulants = Schedule II = ZERO refills, new Rx every time.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Schedule III (CIII) — allows up to 5 refills in 6 months",
                "B) Schedule IV (CIV) — allows up to 5 refills in 6 months",
                "C) Schedule II (CII) — NO refills; new prescription required for each fill",
                "D) Schedule V (CV) — may be dispensed without a prescription in some states"
            ],
            correctAnswer: "C) Schedule II (CII) — NO refills; new prescription required for each fill",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.70,
            yOffset: 0.11
        ),

        // ── 31 ── GABAPENTIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "GABAPENTIN",
            loreText: """
            > Gabapentin (brand: Neurontin) — an anti-seizure drug that's now used more often for nerve pain than for seizures.
            > What is "nerve pain"? It's pain caused by damaged nerves rather than injured tissue — like the burning, shooting pain people get after shingles (a painful rash caused by the chickenpox virus reactivating in adults).
            > How it works: it calms overexcited nerve signals by blocking calcium channels in the nervous system. Despite the name, it does NOT directly work on GABA receptors.
            > FDA-approved uses: nerve pain after shingles (called postherpetic neuralgia) and partial seizures in adults and children.
            > Very commonly used OFF-LABEL for: diabetic nerve pain, fibromyalgia (widespread muscle pain), restless leg syndrome, anxiety, alcohol withdrawal.
            > It leaves the body through the KIDNEYS — so the dose must be reduced when kidneys aren't working well (kidney disease patients).
            > WATCH FOR: Dizziness and drowsiness are very common. Dangerous when combined with opioids — together they can stop breathing. Some states have classified it as Schedule V because of abuse potential.
            > KEY: Gabapentin is used for postherpetic neuralgia (nerve pain after shingles) and partial seizures. Reduce dose in kidney disease.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Generalized anxiety disorder and insomnia — first-line FDA approval",
                "B) Postherpetic neuralgia and adjunctive treatment of partial seizures",
                "C) Bipolar disorder and acute manic episodes",
                "D) Neuropathic pain only — it has no anticonvulsant indication"
            ],
            correctAnswer: "B) Postherpetic neuralgia and adjunctive treatment of partial seizures",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.50,
            yOffset: 0.17
        ),

        // ── 32 ── PHENYTOIN ──────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN",
            loreText: """
            > Phenytoin (brand: Dilantin) — an older anti-seizure medication that works by calming overexcited electrical signals in the brain (technically: blocks sodium channels in neurons).
            > What's a seizure? A sudden burst of abnormal electrical activity in the brain. Phenytoin prevents these bursts from spreading.
            > This is a NARROW THERAPEUTIC INDEX (NTI) drug — meaning the gap between "just right" dose and "too much / toxic" dose is VERY small. You need regular blood level checks.
            > Therapeutic blood level: 10–20 mcg/mL (this is the range you must memorize).
            > Signs of toxicity (too much phenytoin in the blood) — think of someone who appears drunk:
            > At 20+ mcg/mL: NYSTAGMUS — the eyes move back and forth involuntarily on their own
            > At 30+ mcg/mL: Ataxia (stumbling/loss of balance), slurred speech
            > At 40+ mcg/mL: Confusion, then seizures (ironically, the seizure drug causes seizures)
            > Long-term side effects: Gum overgrowth (gingival hyperplasia), acne, unwanted body hair. Also a strong CYP inducer — speeds up metabolism of many other drugs including warfarin and birth control pills.
            > BIG RISK: Causes serious birth defects — avoid in pregnancy.
            > KEY: Phenytoin therapeutic range = 10–20 mcg/mL. First sign of toxicity = nystagmus (eye movement). NTI drug.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) 2–5 mcg/mL",
                "B) 10–20 mcg/mL",
                "C) 50–100 mcg/mL",
                "D) 0.8–2.0 ng/mL"
            ],
            correctAnswer: "B) 10–20 mcg/mL",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.23
        ),

        // ── 33 ── TMP/SMX (BACTRIM) ──────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP/SMX",
            loreText: """
            > Bactrim (generic: sulfamethoxazole/trimethoprim, or TMP/SMX) — a combination antibiotic that kills bacteria by blocking their ability to make folate. Without folate, bacteria can't replicate their DNA and die.
            > Think of it as two drugs working together to hit the same target from two different angles — much more effective than either alone.
            > Used for: Urinary tract infections (UTIs) — this is the #1 use. Also MRSA skin infections (the resistant staph bacteria), prevention of Pneumocystis pneumonia (PCP) in HIV patients, and traveler's diarrhea.
            > CRITICAL — CHECK FOR SULFA ALLERGY FIRST: Bactrim contains a sulfa drug. Sulfa allergies can cause severe rashes — including Stevens-Johnson Syndrome (a life-threatening skin reaction). Always ask before dispensing.
            > Key counseling — tell the patient:
            > 1. Drink plenty of water — prevents kidney stones from forming
            > 2. Avoid prolonged sun exposure — Bactrim causes sun sensitivity (photosensitivity)
            > 3. Can raise INR in patients on warfarin — watch for bleeding
            > NOT safe in pregnancy (especially near delivery) or in people with G6PD deficiency.
            > KEY: Bactrim = TMP/SMX combo. Always screen for sulfa allergy. Drink lots of water, avoid sun.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Take on an empty stomach to enhance absorption and speed onset",
                "B) Avoid prolonged sunlight exposure and drink plenty of water",
                "C) Take with a full glass of milk for best gastrointestinal tolerance",
                "D) This medication is safe to use in patients with sulfa allergies"
            ],
            correctAnswer: "B) Avoid prolonged sunlight exposure and drink plenty of water",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.73,
            yOffset: 0.27
        ),

        // ── 34 ── METRONIDAZOLE ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "METRONIDAZOLE",
            loreText: """
            > Metronidazole (brand: Flagyl) — an antibiotic that also kills parasites. It works by entering bacteria and parasites and creating toxic chemicals that shred their DNA.
            > Used for: bacterial vaginosis (BV — a common vaginal infection), C. diff infections (a dangerous gut infection that causes severe diarrhea), abdominal infections, H. pylori (stomach bacteria), Trichomonas (an STI), giardia.
            > The #1 thing every pharmacy technician must know about Flagyl:
            > ABSOLUTELY NO ALCOHOL during treatment AND for 48 hours after the last dose.
            > What happens if you drink alcohol with Flagyl? A "disulfiram-like reaction" — your body can't break down alcohol properly, causing: severe flushing, intense nausea/vomiting, pounding headache, rapid heartbeat. It feels terrible and can be dangerous.
            > This includes: wine, beer, spirits, mouthwash with alcohol, cough syrups with alcohol, cooking wine.
            > Common side effect: metallic taste in the mouth (very common, harmless).
            > Also darkens urine — this is harmless but warn the patient.
            > Drug interaction: raises warfarin levels (increased bleeding risk).
            > KEY: Flagyl + any alcohol = severe disulfiram-like reaction. No alcohol for 48 hours after last dose. This is the #1 Flagyl counseling point tested on the PTCB.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Dairy products chelate the drug, drastically reducing absorption",
                "B) Grapefruit juice inhibits CYP3A4, significantly increasing drug levels",
                "C) Alcohol produces a disulfiram-like reaction — flushing, nausea, vomiting",
                "D) Antacids bind the drug in the GI tract, reducing bioavailability by 40%"
            ],
            correctAnswer: "C) Alcohol produces a disulfiram-like reaction — flushing, nausea, vomiting",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.42,
            yOffset: 0.33
        ),

        // ── 35 ── VANCOMYCIN ─────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "VANCOMYCIN",
            loreText: """
            > Vancomycin (brand: Vancocin) — a powerful antibiotic used when regular antibiotics stop working, especially for MRSA (methicillin-resistant Staphylococcus aureus — a common drug-resistant bacteria).
            > Think of it as the "antibiotic of last resort" for serious bacterial infections.
            > TWO completely different forms — this is critical:
            > IV vancomycin: Goes into the bloodstream — treats serious MRSA infections anywhere in the body (blood, lungs, bone, brain, heart).
            > ORAL vancomycin (Vancocin capsules): Stays in the GUT — treats C. diff infection ONLY. Oral vancomycin is NOT absorbed into the bloodstream.
            > RED MAN SYNDROME: If vancomycin IV is given too fast, it causes the skin of the face, neck, and upper chest to turn bright red and itchy. This is NOT an allergic reaction — it's a rate reaction (the drug causes mast cells to release histamine). Fix: slow down the infusion. Minimum infusion time = 60 minutes.
            > WATCH FOR: Kidney damage (nephrotoxicity) and hearing damage (ototoxicity). Blood levels must be monitored — it's a narrow therapeutic index drug.
            > KEY: IV vancomycin treats MRSA. Red Man Syndrome = infused too fast, not a true allergy. Monitor drug levels.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Stevens-Johnson Syndrome — a severe hypersensitivity immune reaction",
                "B) Red Man Syndrome — caused by too-rapid IV infusion, not a true allergy",
                "C) Type I anaphylaxis — IgE-mediated immediate hypersensitivity",
                "D) Serum sickness — immune complex deposition causing delayed reaction"
            ],
            correctAnswer: "B) Red Man Syndrome — caused by too-rapid IV infusion, not a true allergy",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.78,
            yOffset: 0.37
        ),

        // ── 36 ── NALOXONE ───────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NALOXONE",
            loreText: """
            > Naloxone (brand: Narcan, Kloxxado, Evzio) — a medication that REVERSES opioid overdose. Think of it as an eraser for opioids.
            > Opioids work by attaching to receptors in your brain and spinal cord. Naloxone works faster and grabs those same receptors first — physically knocking the opioids off and blocking them.
            > What an opioid overdose looks like: person is unconscious, breathing very slowly or not at all, lips turning blue, unresponsive.
            > Naloxone starts working within 2–5 minutes (nasal spray) and can bring a person back from overdose.
            > Available forms: Narcan 4mg nasal spray (most common), Evzio auto-injector (talks you through the steps), IV form (hospitals).
            > As of 2023: Narcan nasal spray is OVER-THE-COUNTER — no prescription needed. Available at pharmacies without an Rx.
            > IMPORTANT: Naloxone wears off in 30–90 minutes — much faster than most opioids. The person can slip back into overdose. ALWAYS call 911 even after giving naloxone — the patient needs monitoring.
            > KEY: Naloxone reverses opioid overdose by blocking opioid receptors. It's now OTC. Duration is SHORT — call 911 even after giving it.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) It stimulates mu-opioid receptors to trigger a paradoxical reversal response",
                "B) It competitively displaces opioids from mu-opioid receptors as a pure antagonist",
                "C) It induces rapid hepatic metabolism of circulating opioids via CYP3A4",
                "D) It binds GABA-A receptors to counteract opioid-induced CNS depression"
            ],
            correctAnswer: "B) It competitively displaces opioids from mu-opioid receptors as a pure antagonist",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.25,
            yOffset: 0.43
        ),

        // ── 37 ── BUPRENORPHINE/NALOXONE ────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BUPRENORPHINE",
            loreText: """
            > Suboxone (buprenorphine/naloxone) — a medication used to treat opioid addiction. It helps people stop using heroin or prescription opioids by reducing cravings and withdrawal symptoms without producing a strong high.
            > It's a treatment, not a cure — patients often take it long-term.
            > BUPRENORPHINE is a "partial opioid agonist." Partial means it attaches to opioid receptors but only activates them partially — enough to prevent withdrawal and cravings, but not enough to get high (has a ceiling effect on euphoria).
            > NALOXONE is added as an abuse-deterrent. If someone tries to inject Suboxone to get high, the naloxone becomes active and immediately causes withdrawal. But when taken correctly under the tongue, the naloxone is not absorbed and doesn't cause problems.
            > This is called MAT — Medication-Assisted Treatment for Opioid Use Disorder (OUD).
            > Subutex = buprenorphine alone (no naloxone) — used during pregnancy when naloxone is not appropriate.
            > MUST be taken sublingually (under the tongue) — swallowing destroys it.
            > Schedule II controlled substance (reclassified as of October 2023).
            > KEY: Suboxone treats opioid use disorder. Naloxone in it prevents IV abuse. Must be dissolved under the tongue. Schedule CII.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Rapid detoxification from opioids in an inpatient emergency setting",
                "B) Treatment of severe acute pain refractory to standard opioid therapy",
                "C) Medication-Assisted Treatment (MAT) for opioid use disorder",
                "D) Reversal of acute opioid overdose in the community setting"
            ],
            correctAnswer: "C) Medication-Assisted Treatment (MAT) for opioid use disorder",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.65,
            yOffset: 0.47
        ),

        // ── 38 ── ANTIHISTAMINES ─────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ANTIHISTAMINES",
            loreText: """
            > Antihistamines block histamine — the chemical your body releases during an allergic reaction that causes itching, sneezing, runny nose, and watery eyes.
            > There are TWO generations, and the key difference is whether they cause drowsiness:
            > FIRST-GENERATION (cause drowsiness — cross into the brain):
            > diphenhydramine (Benadryl) — also used as a sleep aid, for motion sickness
            > hydroxyzine (Vistaril) — also used for anxiety
            > promethazine (Phenergan) — also used for nausea
            > These cause "anticholinergic" side effects: dry mouth, blurry vision, urinary retention (can't urinate), constipation, and confusion.
            > AVOID in elderly patients (65+) — on the Beers List. Causes falls, confusion, and dangerous side effects in older adults.
            > SECOND-GENERATION (non-drowsy — don't cross into the brain much):
            > cetirizine (Zyrtec) — slightly sedating compared to others in class
            > loratadine (Claritin) — least sedating; best for daytime use
            > fexofenadine (Allegra) — very non-drowsy
            > KEY: First-generation (Benadryl) = causes drowsiness + anticholinergic effects. Second-generation (Claritin, Zyrtec, Allegra) = non-drowsy. Benadryl is on the Beers List — avoid in elderly.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Diphenhydramine (Benadryl) — first-generation, non-sedating",
                "B) Hydroxyzine (Vistaril) — second-generation, preferred in elderly",
                "C) Cetirizine (Zyrtec) — second-generation, suitable for daytime use",
                "D) Promethazine (Phenergan) — second-generation, no anticholinergic effects"
            ],
            correctAnswer: "C) Cetirizine (Zyrtec) — second-generation, suitable for daytime use",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.38,
            yOffset: 0.53
        ),

        // ── 39 ── DIGOXIN ────────────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DIGOXIN",
            loreText: """
            > Digoxin (brand: Lanoxin) — a heart medication derived from the foxglove plant. It's been used for centuries.
            > Used for: Heart failure (makes the heart pump more strongly) and atrial fibrillation (slows down a fast, irregular heartbeat).
            > How it works: blocks a pump in heart cells that moves sodium and potassium. This indirectly increases calcium inside the cells, making the heart squeeze harder and beat more slowly.
            > NARROW THERAPEUTIC INDEX (NTI) — the gap between helpful dose and toxic dose is tiny. Therapeutic range: 0.5–2.0 ng/mL (for heart failure: aim for the lower half, 0.5–0.9).
            > DIGOXIN TOXICITY — warning signs:
            > Early: Nausea, vomiting, loss of appetite, fatigue
            > Classic visual sign: Seeing YELLOW-GREEN HALOS around lights (called xanthopsia) — this is a famous PTCB exam sign
            > Heart: Dangerously slow or irregular heartbeat
            > BIG RISK — LOW POTASSIUM (hypokalemia) makes toxicity MUCH MORE LIKELY:
            > Low potassium (often from diuretics like furosemide) causes the body to absorb digoxin more strongly. Always check potassium levels in patients taking both.
            > Antidote for life-threatening toxicity: Digibind/DigiFab (digoxin antibody fragments).
            > KEY: Digoxin toxicity = yellow-green halos + nausea. Low potassium makes it worse. Therapeutic range 0.5–2.0 ng/mL. NTI drug.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) A normal therapeutic response — yellow vision is an expected side effect",
                "B) Digoxin toxicity — often precipitated by concurrent hypokalemia",
                "C) An allergic hypersensitivity reaction requiring drug discontinuation",
                "D) A drug interaction with a concurrently prescribed statin medication"
            ],
            correctAnswer: "B) Digoxin toxicity — often precipitated by concurrent hypokalemia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.75,
            yOffset: 0.57
        ),

        // ── 40 ── NITROGLYCERIN ──────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "NITROGLYCERIN",
            loreText: """
            > Nitroglycerin (NTG) — a medication used to treat angina, which is chest pain from the heart not getting enough blood flow.
            > Think of your coronary arteries (the blood vessels feeding your heart) as pipes. Angina happens when those pipes are too narrow and the heart muscle isn't getting enough oxygen. Nitroglycerin relaxes those pipes so more blood can flow through.
            > Available forms: Sublingual tablets or spray (for acute attack), patches and ointment (for prevention).
            > HOW TO USE SUBLINGUAL (under the tongue) FOR CHEST PAIN:
            > 1. Sit or lie down first (the drug drops blood pressure — standing can cause fainting)
            > 2. Place ONE tablet under the tongue (do NOT swallow)
            > 3. If pain continues after 5 minutes → take a 2nd tablet
            > 4. After a 3rd tablet with no relief → CALL 911 immediately — this may be a heart attack
            > CRITICAL STORAGE RULE: NTG sublingual tablets must stay in their ORIGINAL AMBER GLASS BOTTLE, tightly sealed. Don't put them in a pill organizer. Don't refrigerate. Keep away from heat and light. Discard opened bottles after 6 months.
            > DANGEROUS COMBINATION: NEVER take with Viagra/Cialis/Levitra (PDE5 inhibitors) — together they drop blood pressure dangerously low and can be fatal.
            > KEY: SL nitroglycerin for acute chest pain. Store in original amber glass bottle. Absolutely no Viagra/Cialis — potentially fatal.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Store in a clear plastic pill organizer at room temperature for easy access",
                "B) Keep in the original amber glass bottle, tightly closed, away from heat and light",
                "C) Refrigerate at 2–8°C to preserve potency between uses",
                "D) Transfer to a metal container — glass may cause nitroglycerin crystallization"
            ],
            correctAnswer: "B) Keep in the original amber glass bottle, tightly closed, away from heat and light",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.22,
            yOffset: 0.63
        ),

        // ── 41 ── PDE5 INHIBITORS ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PDE5 INHIBITORS",
            loreText: """
            > PDE5 inhibitors are drugs that relax blood vessels — used for two very different conditions: erectile dysfunction (ED) and pulmonary arterial hypertension (high blood pressure in the lungs).
            > The drugs: sildenafil (Viagra for ED, Revatio for lung condition), tadalafil (Cialis for ED and enlarged prostate, Adcirca for lungs), vardenafil (Levitra), avanafil (Stendra)
            > How they work: Block a specific enzyme (PDE5) that normally breaks down a blood vessel relaxing chemical (cGMP). With more cGMP around, blood vessels stay relaxed and wide open → increased blood flow.
            > ABSOLUTE CONTRAINDICATION — the most dangerous drug combination tested on the PTCB:
            > NEVER combine with NITRATES (nitroglycerin, isosorbide). Both drugs widen blood vessels — together they cause a massive, dangerous drop in blood pressure that can be fatal.
            > If a patient has taken Viagra or Levitra, they must wait at LEAST 24 hours before taking any nitrates.
            > If a patient has taken Cialis (tadalafil), they must wait at LEAST 48 hours — Cialis stays active much longer (nicknamed "the weekend pill" for its 36-hour duration vs 4-6 hours for Viagra).
            > KEY: PDE5 inhibitors + any nitrate (Nitrostat, isosorbide) = potentially fatal blood pressure drop. This is the #1 interaction tested for these drugs.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) QT prolongation — additive cardiac conduction slowing causes fatal arrhythmia",
                "B) Severe hypotension — both drugs increase cGMP causing additive vasodilation",
                "C) Serotonin syndrome — combined CNS stimulation overwhelms serotonin receptors",
                "D) Acute kidney injury — synergistic nephrotoxicity damages proximal tubules"
            ],
            correctAnswer: "B) Severe hypotension — both drugs increase cGMP causing additive vasodilation",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.60,
            yOffset: 0.67
        ),

        // ── 42 ── BISPHOSPHONATES ────────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "BISPHOSPHONATES",
            loreText: """
            > Bisphosphonates are drugs that prevent bones from getting weaker. Your body constantly breaks down old bone and rebuilds new bone. In osteoporosis (weak, brittle bones), the breakdown happens faster than the rebuilding. Bisphosphonates slow down the breakdown.
            > The drugs: alendronate (Fosamax — weekly 70mg pill), risedronate (Actonel — weekly or monthly), ibandronate (Boniva — monthly pill or quarterly IV), zoledronic acid (Reclast — once-a-year IV injection, most potent)
            > Used for: Osteoporosis (preventing fractures), Paget's disease of bone, bone damage from cancer.
            > CRITICAL ADMINISTRATION RULES for the oral versions (alendronate, risedronate):
            > 1. Take FIRST THING IN THE MORNING before eating or drinking anything
            > 2. Take with a FULL glass (8 oz) of plain water ONLY — no juice, coffee, milk, or other meds
            > 3. STAY UPRIGHT (sitting or standing) for AT LEAST 30 MINUTES afterward — do not lie down
            > Why? If you lie down after taking it, the tablet can stick in your esophagus (swallowing tube) and cause severe irritation, ulcers, or burns.
            > WATCH FOR long-term: Rare risk of jaw bone death (osteonecrosis of jaw) and unusual hip fractures with very long-term use.
            > KEY: Take bisphosphonates with full glass of water, stay upright for 30 minutes. This prevents esophageal damage — the #1 counseling point tested.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) Take with a full glass of milk to optimize calcium co-absorption",
                "B) Take at bedtime to allow maximum overnight bone incorporation",
                "C) Take first thing in the morning with plain water, then stay upright for 30 minutes",
                "D) Take with food to minimize the risk of gastrointestinal side effects"
            ],
            correctAnswer: "C) Take first thing in the morning with plain water, then stay upright for 30 minutes",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.35,
            yOffset: 0.73
        ),

        // ── 43 ── MAJOR DRUG INTERACTIONS ───────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DRUG INTERACTIONS",
            loreText: """
            > Drug interactions happen when one drug changes how another drug works. The most important ones tested on the PTCB involve the liver's CYP450 enzyme system — the liver's drug-processing machinery.
            > Think of CYP enzymes as factory workers that break down drugs. Some drugs SLOW DOWN these workers (inhibitors) and some SPEED THEM UP (inducers).
            > CYP INHIBITORS (slow metabolism → drug builds up → stronger effect + more side effects):
            > Fluconazole (Diflucan), clarithromycin, grapefruit juice, amiodarone, metronidazole
            > Example: Fluconazole + warfarin = warfarin builds up → bleeding risk
            > CYP INDUCERS (speed metabolism → drug eliminated faster → less effect):
            > Rifampin (strongest inducer), phenytoin, carbamazepine, St. John's Wort
            > Example: Rifampin + warfarin = warfarin eliminated too fast → clots
            > THE MOST DANGEROUS COMBINATIONS to memorize:
            > MAOIs + SSRIs/SNRIs = SEROTONIN SYNDROME (agitation, fever, rigid muscles, rapid heart — emergency). Must wait 14 days between stopping MAOI and starting SSRI.
            > Opioids + Benzodiazepines = RESPIRATORY DEPRESSION (breathing slows to a stop — can be fatal). Black box warning on all prescriptions.
            > Ciprofloxacin/tetracycline + antacids/dairy = antibiotic absorption blocked by calcium, iron, magnesium. Take 2 hours apart.
            > KEY: CYP inhibitors increase drug levels. CYP inducers decrease drug levels. MAOIs + serotonergic drugs = serotonin syndrome. Opioids + benzos = respiratory depression.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) No interaction — antifungals do not affect hepatic enzyme metabolism",
                "B) Fluconazole inhibits CYP2C9, slowing warfarin metabolism and raising bleeding risk",
                "C) Fluconazole induces CYP2C9, accelerating warfarin clearance and reducing its effect",
                "D) The interaction is only clinically relevant with IV fluconazole, not oral therapy"
            ],
            correctAnswer: "B) Fluconazole inhibits CYP2C9, slowing warfarin metabolism and raising bleeding risk",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.72,
            yOffset: 0.77
        ),

        // ── 44 ── AUXILIARY LABELS ───────────────────────────────────────────
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "AUXILIARY LABELS",
            loreText: """
            > Auxiliary labels are the colored warning stickers on prescription bottles — they add important safety instructions beyond what's on the main label. Knowing which drug gets which label is tested directly on the PTCB.
            > "REFRIGERATE — DO NOT FREEZE": Reconstituted amoxicillin suspension, insulin (unopened), erythromycin suspension, some eye drops
            > "PROTECT FROM LIGHT": IV furosemide, nitroglycerin tablets, nitroprusside, tetracycline, promethazine injection
            > "AVOID PROLONGED SUN EXPOSURE" (photosensitivity): Doxycycline, Bactrim (TMP/SMX), ciprofloxacin, amiodarone, thiazide diuretics — skin burns easily in sunlight
            > "TAKE WITH FOOD OR MILK" (prevent stomach upset): Ibuprofen/NSAIDs, metronidazole, prednisone/steroids, potassium chloride
            > "DO NOT DRINK ALCOHOL": Metronidazole (Flagyl), tinidazole, methotrexate, benzodiazepines, sedatives
            > "SHAKE WELL": All oral suspensions — amoxicillin, azithromycin, clindamycin, antacids
            > "MAY CAUSE DROWSINESS — USE CAUTION WHEN DRIVING": Opioids, benzodiazepines, gabapentin, pregabalin, first-generation antihistamines, muscle relaxants
            > "SWALLOW WHOLE — DO NOT CRUSH OR CHEW": Extended-release (ER/XR/XL/SR) tablets and enteric-coated tablets — crushing destroys the time-release mechanism
            > KEY: Doxycycline → avoid sun. Metronidazole → no alcohol. Bisphosphonates → take with full glass of water. Extended-release → swallow whole, never crush.
            """,
            challengeType: .multipleChoice,
            options: [
                "A) \"May cause drowsiness — avoid driving\" — doxycycline is a sedating antibiotic",
                "B) \"Refrigerate — do not freeze\" — tetracyclines require cold chain storage",
                "C) \"Avoid prolonged exposure to sunlight\" — doxycycline causes photosensitivity",
                "D) \"Take with antacids for best absorption\" — antacids protect the GI tract"
            ],
            correctAnswer: "C) \"Avoid prolonged exposure to sunlight\" — doxycycline causes photosensitivity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.45,
            yOffset: 0.83
        )

    ] // end domain1bNodes
}
