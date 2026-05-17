//
//  RimrockQuestions_Day31_35.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Question content for shift days 31–35. Split out of RimrockContent.swift
//  to keep individual files reviewable.
//

import Foundation

// MARK: - Day 31 Questions — Drug Stems Comprehensive

extension RimrockQuestion {

    static let day31_pril_ace = RimrockQuestion(
        id: "D31_STEM_PRIL",
        domain: .medications,
        topic: "STEM_PRIL",
        prompt: "Drugs ending in -pril (lisinopril, enalapril, ramipril) are which class?",
        options: ["ACE inhibitor", "Beta-blocker", "ARB", "Calcium channel blocker"],
        correctAnswer: "ACE inhibitor",
        onCorrect: "ACE inhibitors. Block angiotensin-converting enzyme — angiotensin I cannot become angiotensin II, vasodilation, BP drops. Side effects: dry cough (~10%), hyperkalemia, angioedema (rare but serious), first-dose hypotension. Pair with ARB if cough is intolerable.",
        onWrong: "ACE inhibitor. -pril stem. Lower blood pressure via the renin-angiotensin axis. Watch for dry cough, hyperkalemia, angioedema."
    )

    static let day31_sartan_arb = RimrockQuestion(
        id: "D31_STEM_SARTAN",
        domain: .medications,
        topic: "STEM_SARTAN",
        prompt: "Drugs ending in -sartan (losartan, valsartan, irbesartan) are which class?",
        options: ["ARB (angiotensin II receptor blocker)", "ACE inhibitor", "Diuretic", "Calcium channel blocker"],
        correctAnswer: "ARB (angiotensin II receptor blocker)",
        onCorrect: "ARB. Block the angiotensin II type-1 receptor directly. Same downstream effect as ACE inhibitors but no kinin accumulation, so much less cough. Same hyperkalemia and angioedema concerns (lower rate). Used when ACE inhibitor is not tolerated.",
        onWrong: "ARB — angiotensin II receptor blocker. -sartan stem. Same BP-lowering pathway as ACEs but blocks the receptor instead of the enzyme. Dry cough is rare; hyperkalemia and angioedema still concerns at lower rate."
    )

    static let day31_olol_betaBlocker = RimrockQuestion(
        id: "D31_STEM_OLOL",
        domain: .medications,
        topic: "STEM_OLOL",
        prompt: "Drugs ending in -olol (metoprolol, atenolol, propranolol) are which class?",
        options: ["Beta-blocker", "Alpha-blocker", "Calcium channel blocker", "Diuretic"],
        correctAnswer: "Beta-blocker",
        onCorrect: "Beta-blocker. -olol stem. Block beta-1 (cardiac) and/or beta-2 (lung/vascular) receptors. Selective beta-1: metoprolol, atenolol, bisoprolol — safer in asthma. Non-selective: propranolol, nadolol — caution in asthma, useful for migraine prophylaxis and tremor. Carvedilol and labetalol are alpha+beta blockers.",
        onWrong: "Beta-blocker. -olol. Lowers heart rate, blood pressure, oxygen demand. Selective beta-1 (metoprolol, atenolol) safer in asthma. Non-selective (propranolol) blocks both. Carvedilol blocks alpha too."
    )

    static let day31_dipine_ccb = RimrockQuestion(
        id: "D31_STEM_DIPINE",
        domain: .medications,
        topic: "STEM_DIPINE",
        prompt: "Drugs ending in -dipine (amlodipine, nifedipine, felodipine) are which subclass?",
        options: ["Dihydropyridine calcium channel blocker", "Non-dihydropyridine CCB", "ACE inhibitor", "ARB"],
        correctAnswer: "Dihydropyridine calcium channel blocker",
        onCorrect: "Dihydropyridine CCB. Block L-type calcium channels in vascular smooth muscle — vasodilation. Side effects: ankle edema, headache, flushing, reflex tachycardia (which is why amlodipine paired with a beta-blocker is common). Non-dihydropyridine CCBs (verapamil, diltiazem) act more on cardiac tissue — slow heart rate, treat AFib, cause constipation.",
        onWrong: "Dihydropyridine CCB. -dipine stem. Vascular-selective vasodilator. Edema, headache, flushing. Verapamil and diltiazem are the OTHER CCB class — non-dihydropyridine, work on heart, AV-blocker, constipation."
    )

    static let day31_statin_hmg = RimrockQuestion(
        id: "D31_STEM_STATIN",
        domain: .medications,
        topic: "STEM_STATIN",
        prompt: "Drugs ending in -statin (atorvastatin, rosuvastatin, simvastatin) are which class?",
        options: ["HMG-CoA reductase inhibitor", "Bile acid sequestrant", "PCSK9 inhibitor", "Fibrate"],
        correctAnswer: "HMG-CoA reductase inhibitor",
        onCorrect: "Statin — HMG-CoA reductase inhibitor. Block the rate-limiting enzyme in cholesterol synthesis. Most-prescribed drug class in the world. Watch for muscle pain (rhabdomyolysis), elevated liver enzymes, drug interactions via CYP3A4 (especially simvastatin and lovastatin with grapefruit, macrolides, azole antifungals).",
        onWrong: "Statin. HMG-CoA reductase inhibitor. -statin stem. Lowers cholesterol production. Watch muscle pain (rhabdo), LFT elevation, CYP3A4 interactions especially with simvastatin and lovastatin."
    )

    static let day31_prazole_ppi = RimrockQuestion(
        id: "D31_STEM_PRAZOLE",
        domain: .medications,
        topic: "STEM_PRAZOLE",
        prompt: "Drugs ending in -prazole (omeprazole, pantoprazole, lansoprazole) are which class?",
        options: ["Proton pump inhibitor (PPI)", "H2 blocker", "Antacid", "Prokinetic"],
        correctAnswer: "Proton pump inhibitor (PPI)",
        onCorrect: "PPI. Block the H/K ATPase in parietal cells — strongly suppress gastric acid. Long-term concerns: B12 deficiency, osteoporosis, hypomagnesemia, increased risk of C. diff. Step-down therapy when reflux resolves; chronic PPI use is overprescribed.",
        onWrong: "PPI — proton pump inhibitor. -prazole stem. Most powerful acid suppressor. Long-term: B12, bone density, magnesium, C. diff risk."
    )

    static let day31_tidine_h2 = RimrockQuestion(
        id: "D31_STEM_TIDINE",
        domain: .medications,
        topic: "STEM_TIDINE",
        prompt: "Drugs ending in -tidine (famotidine, cimetidine) are which class?",
        options: ["H2 receptor blocker", "PPI", "Antacid", "Antihistamine (H1)"],
        correctAnswer: "H2 receptor blocker",
        onCorrect: "H2 blocker. Block histamine H2 receptors on parietal cells — moderate acid suppression. Less potent than PPIs but faster acting and useful for breakthrough symptoms. Cimetidine is a CYP inhibitor — many drug interactions; famotidine is cleaner. Note: -dine ending is also seen in H1 antihistamines (e.g., loratadine), so look at the whole stem.",
        onWrong: "H2 blocker. -tidine. Moderate acid suppression. Cimetidine has CYP issues; famotidine is cleaner. H1 antihistamines (loratadine, cetirizine) also end in -dine — context matters."
    )

    static let day31_terol_beta2 = RimrockQuestion(
        id: "D31_STEM_TEROL",
        domain: .medications,
        topic: "STEM_TEROL",
        prompt: "Drugs ending in -terol (albuterol, salmeterol, formoterol) are which class?",
        options: ["Beta-2 agonist (bronchodilator)", "Alpha-blocker", "Antimuscarinic", "Corticosteroid"],
        correctAnswer: "Beta-2 agonist (bronchodilator)",
        onCorrect: "Beta-2 agonist. -terol stem. Dilate bronchial smooth muscle. Albuterol is short-acting (SABA) — rescue. Salmeterol, formoterol, vilanterol are long-acting (LABA) — controllers, never used alone for asthma. Side effects: tachycardia, tremor, hypokalemia at high doses.",
        onWrong: "Beta-2 agonist (bronchodilator). -terol stem. Albuterol = SABA, rescue. Salmeterol/formoterol = LABA, controllers (paired with ICS). Side effects: tachycardia, tremor."
    )

    static let day31_formin_biguanide = RimrockQuestion(
        id: "D31_STEM_FORMIN",
        domain: .medications,
        topic: "STEM_FORMIN",
        prompt: "The drug stem -formin (metformin) identifies which class?",
        options: ["Biguanide", "Sulfonylurea", "Thiazolidinedione", "GLP-1 agonist"],
        correctAnswer: "Biguanide",
        onCorrect: "Biguanide. Metformin is the only widely-used member. Decreases hepatic glucose production, increases peripheral insulin sensitivity. First-line in type 2 diabetes. Hold for IV contrast (lactic acidosis risk). Can cause B12 deficiency on long-term therapy.",
        onWrong: "Biguanide. Metformin's class. First-line for type 2 diabetes. Watch B12, lactic acidosis with contrast or renal impairment."
    )

    static let day31_gliflozin_sglt2 = RimrockQuestion(
        id: "D31_STEM_GLIFLOZIN",
        domain: .medications,
        topic: "STEM_GLIFLOZIN",
        prompt: "Drugs ending in -gliflozin (empagliflozin, dapagliflozin) are which class?",
        options: ["SGLT2 inhibitor", "DPP-4 inhibitor", "GLP-1 agonist", "Sulfonylurea"],
        correctAnswer: "SGLT2 inhibitor",
        onCorrect: "SGLT2 inhibitor. Block sodium-glucose cotransporter 2 in proximal tubule. Glucose spills into urine. Cardiovascular and renal benefits beyond glucose lowering. Side effects: genital mycotic infection, euglycemic DKA in stress, canagliflozin amputation signal.",
        onWrong: "SGLT2 inhibitor. -gliflozin. Pee out glucose. CV and renal benefits. Yeast infections, euglycemic DKA risk."
    )

    static let day31_glutide_glp1 = RimrockQuestion(
        id: "D31_STEM_GLUTIDE",
        domain: .medications,
        topic: "STEM_GLUTIDE",
        prompt: "Drugs ending in -glutide (semaglutide, liraglutide, dulaglutide) are which class?",
        options: ["GLP-1 receptor agonist", "DPP-4 inhibitor", "SGLT2 inhibitor", "Sulfonylurea"],
        correctAnswer: "GLP-1 receptor agonist",
        onCorrect: "GLP-1 agonist. Mimic incretin hormone — promote insulin release, suppress glucagon, slow gastric emptying, reduce appetite. Side effects: nausea, vomiting, diarrhea, constipation. Black box: thyroid C-cell tumor (rodent data; clinical relevance with MEN2/MTC family history).",
        onWrong: "GLP-1 agonist. -glutide. Type 2 diabetes + weight loss. Nausea/GI side effects. Black-box thyroid C-cell tumor warning."
    )

    static let day31_floxacin_fq = RimrockQuestion(
        id: "D31_STEM_FLOXACIN",
        domain: .medications,
        topic: "STEM_FLOXACIN",
        prompt: "Drugs ending in -floxacin (levofloxacin, ciprofloxacin, moxifloxacin) are which class?",
        options: ["Fluoroquinolone antibiotic", "Macrolide antibiotic", "Penicillin", "Tetracycline"],
        correctAnswer: "Fluoroquinolone antibiotic",
        onCorrect: "Fluoroquinolone. -floxacin stem. Black box: tendon rupture, peripheral neuropathy, CNS effects, aortic aneurysm. Cation interactions — antacids, calcium, iron, magnesium, zinc all chelate the drug — separate by 2 hours before / 6 hours after.",
        onWrong: "Fluoroquinolone. -floxacin. Multiple black box warnings; reserve for serious infections. Cation interactions."
    )

    static let day31_thromycin_macrolide = RimrockQuestion(
        id: "D31_STEM_THROMYCIN",
        domain: .medications,
        topic: "STEM_THROMYCIN",
        prompt: "Drugs ending in -thromycin (azithromycin, erythromycin, clarithromycin) are which class?",
        options: ["Macrolide antibiotic", "Tetracycline", "Aminoglycoside", "Cephalosporin"],
        correctAnswer: "Macrolide antibiotic",
        onCorrect: "Macrolide. -thromycin stem. CYP3A4 inhibition (erythromycin, clarithromycin strong; azithromycin minimal). QT prolongation across the class. Common interactions: statins, calcium channel blockers, warfarin, several antiarrhythmics.",
        onWrong: "Macrolide. -thromycin. CYP3A4 inhibition (less for azithromycin), QT prolongation. Watch interactions with statins and CCBs."
    )

    static let day31_cycline_tetracycline = RimrockQuestion(
        id: "D31_STEM_CYCLINE",
        domain: .medications,
        topic: "STEM_CYCLINE",
        prompt: "Drugs ending in -cycline (doxycycline, minocycline, tetracycline) are which class?",
        options: ["Tetracycline antibiotic", "Macrolide antibiotic", "Penicillin", "Aminoglycoside"],
        correctAnswer: "Tetracycline antibiotic",
        onCorrect: "Tetracycline. -cycline stem. Cation chelation — separate from antacids, dairy (calcium), iron, magnesium. Photosensitivity. Avoid in pregnancy and children under 8 (teeth staining). Doxycycline is the most-used; minocycline has more CNS side effects.",
        onWrong: "Tetracycline. -cycline. Avoid dairy/cations near dose. Photosensitivity. Pregnancy + young children contraindicated."
    )

    static let day31_conazole_antifungal = RimrockQuestion(
        id: "D31_STEM_CONAZOLE",
        domain: .medications,
        topic: "STEM_CONAZOLE",
        prompt: "Drugs ending in -conazole (fluconazole, ketoconazole, itraconazole) are which class?",
        options: ["Azole antifungal", "Antibacterial", "Antiviral", "Antiparasitic"],
        correctAnswer: "Azole antifungal",
        onCorrect: "Azole antifungal. -conazole stem. Strong CYP3A4 inhibitors — many drug interactions. Hepatotoxicity, especially ketoconazole (oral ketoconazole is largely deprecated for systemic use due to liver risk). Topical and intravaginal preparations have fewer systemic concerns.",
        onWrong: "Azole antifungal. -conazole. CYP3A4 inhibition (strong) — many interactions. Hepatotoxicity, especially oral ketoconazole."
    )

    static let day31_vir_antiviral = RimrockQuestion(
        id: "D31_STEM_VIR",
        domain: .medications,
        topic: "STEM_VIR",
        prompt: "Drugs ending in -vir (acyclovir, valacyclovir, oseltamivir) are which class?",
        options: ["Antiviral", "Antibacterial", "Antifungal", "Antiparasitic"],
        correctAnswer: "Antiviral",
        onCorrect: "Antiviral. -vir stem. Different agents target different viruses — acyclovir/valacyclovir for herpes family, oseltamivir/zanamivir for influenza, antiretrovirals (-vir suffix common) for HIV, sofosbuvir for hepatitis C. Renal dosing matters for many.",
        onWrong: "Antiviral. -vir stem. Range from herpes (acyclovir, valacyclovir) to flu (oseltamivir) to HIV (multiple) to hepatitis (sofosbuvir). Renal dosing common."
    )

    static let day31_setron_5ht3 = RimrockQuestion(
        id: "D31_STEM_SETRON",
        domain: .medications,
        topic: "STEM_SETRON",
        prompt: "Drugs ending in -setron (ondansetron, granisetron, palonosetron) are which class?",
        options: ["5-HT3 antagonist (antiemetic)", "Dopamine antagonist", "NK1 antagonist", "Antihistamine"],
        correctAnswer: "5-HT3 antagonist (antiemetic)",
        onCorrect: "5-HT3 antagonist. -setron stem. First-line for chemotherapy-induced and post-operative nausea. Mild side effects (headache, constipation). QT prolongation at high doses; FDA pulled the 32 mg single-dose IV indication.",
        onWrong: "5-HT3 antagonist antiemetic. -setron. CINV and post-op N/V. QT risk at high doses."
    )

    static let day31_triptan_migraine = RimrockQuestion(
        id: "D31_STEM_TRIPTAN",
        domain: .medications,
        topic: "STEM_TRIPTAN",
        prompt: "Drugs ending in -triptan (sumatriptan, rizatriptan, eletriptan) are which class?",
        options: ["Migraine abortive (5-HT1B/1D agonist)", "Migraine prophylactic", "NSAID", "Opioid analgesic"],
        correctAnswer: "Migraine abortive (5-HT1B/1D agonist)",
        onCorrect: "Triptan. -triptan stem. 5-HT1B/1D agonist — vasoconstrict cranial vessels and inhibit pain transmission. For abortive treatment of migraine, not prophylaxis. Contraindicated in patients with CV disease, uncontrolled hypertension, basilar migraine, recent ergot use. Serotonin syndrome risk with SSRIs/SNRIs/MAOIs.",
        onWrong: "Triptan. Migraine abortive. CV contraindications. Serotonin syndrome risk with serotonergic combos."
    )

    static let day31_azepam_benzo = RimrockQuestion(
        id: "D31_STEM_AZEPAM",
        domain: .medications,
        topic: "STEM_AZEPAM",
        prompt: "Drugs ending in -azepam or -azolam (diazepam, lorazepam, alprazolam, clonazepam) are which class?",
        options: ["Benzodiazepine", "Barbiturate", "Z-drug (non-benzo sleep agent)", "SSRI"],
        correctAnswer: "Benzodiazepine",
        onCorrect: "Benzodiazepine. -azepam / -azolam stem. C-IV controlled. Physical dependence after weeks of regular use; abrupt cessation can cause rebound, withdrawal, seizures. Beers Criteria flag for elderly. CDC: don't combine with opioids except in specifically monitored situations.",
        onWrong: "Benzo. -azepam / -azolam. C-IV. Dependence + taper. Beers list for elderly. Don't stack with opioids."
    )

    static let day31_dronate_bisphosphonate = RimrockQuestion(
        id: "D31_STEM_DRONATE",
        domain: .medications,
        topic: "STEM_DRONATE",
        prompt: "Drugs ending in -dronate (alendronate, risedronate, ibandronate) are which class?",
        options: ["Bisphosphonate (osteoporosis)", "Calcium supplement", "Vitamin D analog", "Calcitonin"],
        correctAnswer: "Bisphosphonate (osteoporosis)",
        onCorrect: "Bisphosphonate. -dronate stem. Inhibit bone resorption. Counsel hard: take with full glass of water on empty stomach, remain upright 30+ minutes, separate from food/calcium. Risks: esophagitis, osteonecrosis of the jaw (rare), atypical femur fracture (rare with prolonged use).",
        onWrong: "Bisphosphonate. -dronate. Strict counsel: water, upright 30+ min, empty stomach, no food/calcium near dose. Esophagitis risk."
    )

    static let day31_xaban_doac = RimrockQuestion(
        id: "D31_STEM_XABAN",
        domain: .medications,
        topic: "STEM_XABAN",
        prompt: "Drugs ending in -xaban (apixaban, rivaroxaban, edoxaban) are which class?",
        options: ["Direct oral anticoagulant (factor Xa inhibitor)", "Heparin", "Warfarin", "Antiplatelet"],
        correctAnswer: "Direct oral anticoagulant (factor Xa inhibitor)",
        onCorrect: "DOAC — factor Xa inhibitor. -xaban stem. Apixaban, rivaroxaban, edoxaban. Dabigatran is a DOAC too but it's a direct thrombin inhibitor. Advantages over warfarin: no INR monitoring, fewer food/drug interactions. Renal dose adjustment needed. Reversal agents exist (andexanet alfa for Xa inhibitors, idarucizumab for dabigatran).",
        onWrong: "DOAC factor Xa inhibitor. -xaban. No INR. Renal dose-adjust. Reversal agents available."
    )

    static let day31_mab_monoclonal = RimrockQuestion(
        id: "D31_STEM_MAB",
        domain: .medications,
        topic: "STEM_MAB",
        prompt: "Drugs ending in -mab (adalimumab, infliximab, rituximab, pembrolizumab) are which class?",
        options: ["Monoclonal antibody", "Small-molecule inhibitor", "Vaccine", "Hormone"],
        correctAnswer: "Monoclonal antibody",
        onCorrect: "Monoclonal antibody. -mab stem. Refrigerated biologics for autoimmune conditions, oncology, transplant. Subcutaneous, intramuscular, or IV. Watch for infusion reactions and immunosuppression. Storage matters — refrigerated, often a defined room-temp window before discard.",
        onWrong: "Monoclonal antibody. -mab. Refrigerated biologics. Autoimmune, oncology, transplant. Storage critical."
    )

    static let day31_nib_kinase = RimrockQuestion(
        id: "D31_STEM_NIB",
        domain: .medications,
        topic: "STEM_NIB",
        prompt: "Drugs ending in -nib or -tinib (imatinib, ibrutinib, sunitinib) are which class?",
        options: ["Kinase inhibitor (oncology)", "Antibody", "Antibiotic", "Hormone"],
        correctAnswer: "Kinase inhibitor (oncology)",
        onCorrect: "Kinase inhibitor. -nib / -tinib stem. Small-molecule oncology drugs targeting specific kinases. Hazardous drug handling per USP <800>. Many have grapefruit / CYP3A4 interactions, QT prolongation, hepatotoxicity. Patient counseling significant — adherence in cancer therapy is non-negotiable.",
        onWrong: "Kinase inhibitor. -nib / -tinib. Targeted oncology. USP <800> handling. CYP3A4 interactions."
    )

    static let day31_caine_anesthetic = RimrockQuestion(
        id: "D31_STEM_CAINE",
        domain: .medications,
        topic: "STEM_CAINE",
        prompt: "Drugs ending in -caine (lidocaine, bupivacaine, benzocaine) are which class?",
        options: ["Local anesthetic", "Antiarrhythmic only", "Beta-blocker", "Analgesic opioid"],
        correctAnswer: "Local anesthetic",
        onCorrect: "Local anesthetic. -caine stem. Block sodium channels in nerves — local numbing. Lidocaine is also a class IB antiarrhythmic IV. Benzocaine OTC for teething/sore throat carries a methemoglobinemia risk — FDA warning, especially in children under 2.",
        onWrong: "Local anesthetic. -caine. Sodium channel block. Lidocaine doubles as antiarrhythmic IV. Benzocaine: methemoglobinemia warning."
    )
}

// MARK: - Day 32 Questions — Math Lab

extension RimrockQuestion {

    static let day32_alligation = RimrockQuestion(
        id: "D32_ALLIGATION",
        domain: .orderEntry,
        topic: "ALLIGATION",
        prompt: "Prepare 100 g of 5% hydrocortisone cream from 10% and 1% stocks. How much of each?",
        options: [
            "44.4 g of 10% + 55.6 g of 1%",
            "50 g of 10% + 50 g of 1%",
            "33.3 g of 10% + 66.7 g of 1%",
            "10 g of 10% + 90 g of 1%"
        ],
        correctAnswer: "44.4 g of 10% + 55.6 g of 1%",
        onCorrect: "Alligation. Differences: |10−5|=5 (parts of 1%), |1−5|=4 (parts of 10%). Total parts = 9. 10% portion: (4/9)×100 = 44.4 g. 1% portion: (5/9)×100 = 55.6 g. Verify: 44.4×10% + 55.6×1% = 4.44 + 0.556 = 5.0 g of active = 5% of 100 g. ✓",
        onWrong: "Alligation. Set up the tic-tac-toe: high (10), low (1), desired (5). Differences cross-diagonally: 10 minus 5 = 5 parts of low; 5 minus 1 = 4 parts of high. Ratio is 4:5. Total parts 9. High = (4/9)×100 = 44.4 g; low = (5/9)×100 = 55.6 g. Always verify."
    )

    static let day32_bsa = RimrockQuestion(
        id: "D32_BSA",
        domain: .orderEntry,
        topic: "BSA_CHEMO",
        prompt: "A patient is 175 cm and 70 kg. Order: doxorubicin 60 mg/m². Approximately how much doxorubicin? (Use Mosteller: BSA = √(ht × wt / 3600))",
        options: [
            "~110 mg",
            "~70 mg",
            "~150 mg",
            "~210 mg"
        ],
        correctAnswer: "~110 mg",
        onCorrect: "BSA Mosteller = √(175 × 70 / 3600) = √(3.4) = 1.84 m². Dose = 60 mg/m² × 1.84 m² = ~110 mg. BSA-based dosing is standard in oncology; double-check pediatric and chemo math twice — these are high-stakes errors.",
        onWrong: "BSA = √(175 × 70 / 3600) = √(3.4) ≈ 1.84 m². Dose = 60 × 1.84 ≈ 110 mg. Mosteller formula. Always verify; chemo math errors are high-stakes."
    )

    static let day32_dripGtt = RimrockQuestion(
        id: "D32_DRIP_GTT",
        domain: .orderEntry,
        topic: "DRIP_RATE",
        prompt: "Order: 1 L NS over 8 hours, drop factor 15 gtt/mL. What's the gtt/min rate?",
        options: ["~31 gtt/min", "~15 gtt/min", "~62 gtt/min", "~125 gtt/min"],
        correctAnswer: "~31 gtt/min",
        onCorrect: "1000 mL ÷ 480 min = 2.08 mL/min. ×15 gtt/mL = 31 gtt/min. Always plausibility-check: at 31 gtt/min × 60 min = 1860 gtt/hour ÷ 15 = 124 mL/hour × 8 hr = 992 mL ≈ 1 L. ✓",
        onWrong: "1000 mL / 480 min = 2.08 mL/min. ×15 gtt/mL = 31 gtt/min. Plausibility-check: ~125 mL/hr × 8 hr = 1 L. Drip rates use drop factor (10, 15, 20 gtt/mL macro; 60 gtt/mL micro)."
    )

    static let day32_ratioStrength = RimrockQuestion(
        id: "D32_RATIO_STRENGTH",
        domain: .orderEntry,
        topic: "RATIO_STRENGTH",
        prompt: "Express 1:1000 epinephrine in mg/mL.",
        options: ["1 mg/mL", "0.1 mg/mL", "10 mg/mL", "0.01 mg/mL"],
        correctAnswer: "1 mg/mL",
        onCorrect: "1:1000 means 1 g per 1000 mL = 1000 mg per 1000 mL = 1 mg/mL. The classic anaphylaxis IM/SQ dose. Compare 1:10,000 epinephrine = 0.1 mg/mL — used IV for cardiac arrest. Mixing them up has killed patients. PTCB asks this directly.",
        onWrong: "1:1000 = 1 g/1000 mL = 1 mg/mL (anaphylaxis IM). 1:10,000 = 0.1 mg/mL (IV cardiac arrest). DO NOT MIX UP. PTCB and clinical setting both test it."
    )

    static let day32_powderVolume = RimrockQuestion(
        id: "D32_POWDER_VOLUME",
        domain: .orderEntry,
        topic: "POWDER_VOLUME",
        prompt: "An antibiotic vial contains 1 g powder. Reconstitution: add 9.6 mL diluent to yield 10 mL of 100 mg/mL. What's the powder volume?",
        options: ["0.4 mL", "1 mL", "0.6 mL", "1.4 mL"],
        correctAnswer: "0.4 mL",
        onCorrect: "Final volume 10 mL minus diluent added 9.6 mL = 0.4 mL displaced by powder. Powder volume matters for accurate concentration when reconstituting — package insert or pharmacy reference gives the value for each product.",
        onWrong: "10 mL final − 9.6 mL diluent = 0.4 mL powder volume. Always check the package insert; powder volume varies by product. Critical for accurate concentration."
    )

    static let day32_percentStrengthWV = RimrockQuestion(
        id: "D32_PERCENT_STRENGTH",
        domain: .orderEntry,
        topic: "PERCENT_STRENGTH",
        prompt: "How much active drug is in 250 mL of 5% w/v dextrose?",
        options: ["12.5 g", "5 g", "1.25 g", "50 g"],
        correctAnswer: "12.5 g",
        onCorrect: "5% w/v = 5 g per 100 mL = 50 mg/mL. 250 mL × 50 mg/mL = 12,500 mg = 12.5 g. Percent strength rules: w/v = grams per 100 mL; w/w = grams per 100 g; v/v = mL per 100 mL.",
        onWrong: "5% w/v = 5 g/100 mL = 50 mg/mL. 250 mL × 50 mg/mL = 12,500 mg = 12.5 g. Memorize: w/v = g/100mL; w/w = g/100g; v/v = mL/100mL."
    )

    static let day32_doseConversionLbsKg = RimrockQuestion(
        id: "D32_LBS_KG",
        domain: .orderEntry,
        topic: "WEIGHT_CONVERSION",
        prompt: "Convert 154 lb to kg.",
        options: ["70 kg", "154 kg", "338 kg", "77 kg"],
        correctAnswer: "70 kg",
        onCorrect: "154 ÷ 2.2 = 70 kg. Memorize: 1 kg ≈ 2.2 lb. Most weight-based dosing in pharmacy uses kg. Common pediatric doses use mg/kg/dose or mg/kg/day.",
        onWrong: "Divide pounds by 2.2 to get kg. 154/2.2 = 70 kg. Inverse: 1 kg = 2.2 lb. All clinical dosing uses kg."
    )

    static let day32_daysSupplyEyeDrops = RimrockQuestion(
        id: "D32_DS_DROPS",
        domain: .orderEntry,
        topic: "DAYS_SUPPLY_DROPS",
        prompt: "Latanoprost 2.5 mL bottle, sig 1 drop OU at bedtime. About how many drops per mL? Days supply?",
        options: [
            "~20 drops/mL → 2.5 × 20 = 50 drops total ÷ 2 (OU) = 25 days",
            "~10 drops/mL → 25 drops total = 12 days",
            "~30 drops/mL → 75 drops total = 75 days",
            "Cannot calculate without manufacturer data"
        ],
        correctAnswer: "~20 drops/mL → 2.5 × 20 = 50 drops total ÷ 2 (OU) = 25 days",
        onCorrect: "20 drops/mL is the pharmacy convention for ophthalmics (some references use 16 or 19). 2.5 mL × 20 = 50 drops. OU = both eyes, so 2 drops/day. 50 ÷ 2 = 25 days. Insurance billing for eye drops uses days supply derived from this calculation; software pricing varies in default drops/mL.",
        onWrong: "20 drops/mL convention. 2.5 mL × 20 = 50 drops total. OU (both eyes) = 2/day. 50/2 = 25 days. Drops/mL conventions vary 16–20 by reference; pharmacy software has a default."
    )

    static let day32_daysSupplyInsulin = RimrockQuestion(
        id: "D32_DS_INSULIN",
        domain: .orderEntry,
        topic: "DAYS_SUPPLY_INSULIN",
        prompt: "Insulin glargine 100 units/mL, 10 mL vial, sig 30 units sub-Q at bedtime. Days supply?",
        options: ["~33 days", "~10 days", "~100 days", "~3 days"],
        correctAnswer: "~33 days",
        onCorrect: "10 mL × 100 units/mL = 1000 units total. 1000 ÷ 30 units/day = 33.3 days. Insurance billing for insulin: total units ÷ daily units. Pen units varies; vials are 10 mL (1000 units of U-100). U-500 insulin is 5x more concentrated — different math, different patient population.",
        onWrong: "1000 units / 30 units per day = 33.3 days. 10 mL × 100 units/mL = 1000 units in vial. U-500 insulin (5x concentration) is a separate calculation and a critical safety issue."
    )

    static let day32_chemoBSA = RimrockQuestion(
        id: "D32_CHEMO_BSA",
        domain: .orderEntry,
        topic: "BSA_PEDS",
        prompt: "A child weighs 22 kg, height 110 cm. BSA via Mosteller? (BSA = √(ht × wt / 3600))",
        options: ["~0.82 m²", "~1.5 m²", "~0.5 m²", "~1.0 m²"],
        correctAnswer: "~0.82 m²",
        onCorrect: "√(110 × 22 / 3600) = √(2420/3600) = √0.672 = 0.82 m². Pediatric BSA is small. Dose = mg/m² × BSA. Pediatric chemo dosing has narrow margins; double-checking is non-negotiable.",
        onWrong: "Mosteller: √(110×22/3600) = √0.67 ≈ 0.82 m². Pediatric chemo + BSA needs verification by two pharmacists per most institutional policies."
    )
}

// MARK: - Day 33 Questions — Auxiliary Labels

extension RimrockQuestion {

    static let day33_takeWithFood = RimrockQuestion(
        id: "D33_LABEL_FOOD",
        domain: .patientSafety,
        topic: "AUX_TAKE_WITH_FOOD",
        prompt: "Which medication should be labeled \"TAKE WITH FOOD\"?",
        options: ["Metformin", "Levothyroxine", "Bisphosphonate (alendronate)", "Tetracycline"],
        correctAnswer: "Metformin",
        onCorrect: "Metformin — take with food to reduce GI side effects (nausea, diarrhea). Other take-with-food drugs: NSAIDs (gastric protection), HCTZ, valproate, carbamazepine, ritonavir. Levothyroxine is empty stomach. Bisphosphonates are empty stomach + upright. Tetracycline avoids dairy/cations.",
        onWrong: "Metformin — take with food to reduce GI upset. NSAIDs, HCTZ also benefit from food (gastric protection). Levothyroxine and bisphosphonates are EMPTY stomach. Tetracycline avoids dairy/cations."
    )

    static let day33_emptyStomach = RimrockQuestion(
        id: "D33_LABEL_EMPTY",
        domain: .patientSafety,
        topic: "AUX_EMPTY_STOMACH",
        prompt: "Which drug should be labeled \"TAKE ON AN EMPTY STOMACH\"?",
        options: ["Levothyroxine", "Metformin", "Atorvastatin", "Lisinopril"],
        correctAnswer: "Levothyroxine",
        onCorrect: "Levothyroxine — empty stomach, 30-60 minutes before breakfast, with water. Food and especially calcium / iron / soy / coffee reduce absorption significantly. Other empty-stomach drugs: bisphosphonates (with strict water/upright rules), proton pump inhibitors, isoniazid, several quinolones.",
        onWrong: "Levothyroxine — empty stomach, 30-60 min before food. Calcium, iron, soy, coffee all interfere with absorption. Bisphosphonates also empty stomach with strict water/upright rules."
    )

    static let day33_avoidGrapefruit = RimrockQuestion(
        id: "D33_LABEL_GRAPEFRUIT",
        domain: .patientSafety,
        topic: "AUX_GRAPEFRUIT",
        prompt: "Which medication carries a \"AVOID GRAPEFRUIT\" auxiliary label?",
        options: ["Simvastatin", "Pravastatin", "Rosuvastatin", "Atorvastatin"],
        correctAnswer: "Simvastatin",
        onCorrect: "Simvastatin — significant CYP3A4 metabolism, large grapefruit interaction risk. Atorvastatin and lovastatin similar. Pravastatin and rosuvastatin are less affected. Other grapefruit-affected drugs: amlodipine (and other CCBs to varying degrees), some immunosuppressants (cyclosporine, tacrolimus), certain antiarrhythmics (amiodarone), sildenafil, some psych meds.",
        onWrong: "Simvastatin (and lovastatin, atorvastatin) — strong CYP3A4 interactions. Pravastatin and rosuvastatin minimal grapefruit issue. Other grapefruit drugs: amlodipine, cyclosporine, tacrolimus, amiodarone, sildenafil."
    )

    static let day33_drowsiness = RimrockQuestion(
        id: "D33_LABEL_DROWSINESS",
        domain: .patientSafety,
        topic: "AUX_DROWSINESS",
        prompt: "Which medication should be labeled with a \"MAY CAUSE DROWSINESS\" warning?",
        options: ["Diphenhydramine", "Loratadine", "Cetirizine", "Fexofenadine"],
        correctAnswer: "Diphenhydramine",
        onCorrect: "Diphenhydramine — first-generation antihistamine, sedating. Other sedating drugs: opioids, benzos, gabapentin, pregabalin, muscle relaxants, many psych meds, scopolamine. Second-generation antihistamines (loratadine, cetirizine, fexofenadine, desloratadine, levocetirizine) are non-sedating or minimally so — fexofenadine the cleanest, cetirizine slightly more drowsy than the others.",
        onWrong: "Diphenhydramine — first-gen, sedating. Loratadine, cetirizine, fexofenadine, desloratadine — second-gen, non-sedating (fexofenadine cleanest). Sedation also relevant for opioids, benzos, gabapentinoids, muscle relaxants."
    )

    static let day33_avoidSunExposure = RimrockQuestion(
        id: "D33_LABEL_SUN",
        domain: .patientSafety,
        topic: "AUX_PHOTOSENSITIVITY",
        prompt: "Which medication should carry a \"AVOID PROLONGED SUN EXPOSURE\" warning (photosensitivity)?",
        options: ["Doxycycline", "Acetaminophen", "Loratadine", "Lisinopril"],
        correctAnswer: "Doxycycline",
        onCorrect: "Doxycycline — significant photosensitivity. Other photosensitizing drugs: most fluoroquinolones (especially ciprofloxacin), sulfonamides (Bactrim), thiazide diuretics (HCTZ), amiodarone, retinoids (isotretinoin), some chemo agents, voriconazole, St. John's wort. Counsel: sunscreen, protective clothing, especially at high altitude.",
        onWrong: "Doxycycline — strong photosensitizer. Also: fluoroquinolones (especially cipro), sulfonamides, thiazides (HCTZ), amiodarone, retinoids, voriconazole, St. John's wort. Sunscreen + protective clothing + altitude awareness."
    )

    static let day33_avoidAlcohol = RimrockQuestion(
        id: "D33_LABEL_ALCOHOL",
        domain: .patientSafety,
        topic: "AUX_ALCOHOL",
        prompt: "Which medication carries the strongest \"AVOID ALCOHOL\" warning due to disulfiram-like reaction?",
        options: ["Metronidazole", "Lisinopril", "Acetaminophen", "Atorvastatin"],
        correctAnswer: "Metronidazole",
        onCorrect: "Metronidazole — disulfiram-like reaction (flushing, nausea, vomiting, headache, tachycardia) when combined with alcohol; even small amounts including alcohol-containing mouthwash. Avoid for the duration of treatment plus 48-72 hours after. Tinidazole same. Other significant alcohol issues: opioids/benzos (CNS depression), warfarin (variable effects), TCAs, MAOIs, acetaminophen (hepatotoxicity in heavy drinkers).",
        onWrong: "Metronidazole — disulfiram-like reaction with alcohol. Avoid alcohol DURING treatment + 48-72 hours after. Includes alcohol-containing products (mouthwash, cough syrups). Tinidazole same."
    )

    static let day33_avoidDairy = RimrockQuestion(
        id: "D33_LABEL_DAIRY",
        domain: .patientSafety,
        topic: "AUX_DAIRY_CATIONS",
        prompt: "Which medication should be separated from dairy products and antacids?",
        options: ["Tetracycline", "Penicillin V", "Metformin", "Levothyroxine"],
        correctAnswer: "Tetracycline",
        onCorrect: "Tetracycline — chelates with calcium, magnesium, iron, aluminum, zinc — significantly reduces absorption. Separate by 2-3 hours from dairy, antacids, multivitamins with minerals, iron supplements. Same for fluoroquinolones — separate from cations by 2 hours before / 6 hours after. Bisphosphonates also affected by cations.",
        onWrong: "Tetracycline — cation chelation. Separate from dairy, antacids, calcium, iron, multivitamins. Same applies to fluoroquinolones (-floxacin) and bisphosphonates (-dronate)."
    )

    static let day33_shakeWell = RimrockQuestion(
        id: "D33_LABEL_SHAKE",
        domain: .patientSafety,
        topic: "AUX_SHAKE_WELL",
        prompt: "Which formulation requires a \"SHAKE WELL BEFORE USE\" auxiliary label?",
        options: ["Suspensions and emulsions", "Tablets", "Capsules", "Solutions"],
        correctAnswer: "Suspensions and emulsions",
        onCorrect: "Suspensions and emulsions — undissolved particles or dispersed phases settle. Without shaking, doses are inconsistent — first dose under-medicated, last dose over-medicated. Solutions are homogeneous; no shake needed. Examples: amoxicillin suspension, ibuprofen suspension, MDI inhalers (most), insulin NPH (cloudy — gentle roll, not shake, to avoid foaming).",
        onWrong: "Suspensions and emulsions — particles/phases settle. Solutions don't. Shake to redistribute the active drug evenly across doses. Insulin NPH (cloudy) is rolled gently, not shaken, to avoid foaming."
    )
}

// MARK: - Day 34 Questions — Safety Atlas

extension RimrockQuestion {

    static let day34_ismpHighAlertList = RimrockQuestion(
        id: "D34_ISMP_HIGH_ALERT",
        domain: .patientSafety,
        topic: "ISMP_HIGH_ALERT",
        prompt: "Which group of drugs is on the ISMP high-alert medications list for outpatient pharmacy?",
        options: [
            "Anticoagulants, insulin, opioids, methotrexate (oral, weekly), chemotherapy",
            "All antibiotics",
            "All over-the-counter pain relievers",
            "All antihistamines"
        ],
        correctAnswer: "Anticoagulants, insulin, opioids, methotrexate (oral, weekly), chemotherapy",
        onCorrect: "Outpatient ISMP high-alert: anticoagulants (warfarin, DOACs, heparin), insulin, opioids (especially long-acting and methadone), methotrexate (oral weekly — accidental daily dosing has killed people), chemotherapy, hypoglycemic agents, immunosuppressants. Same drugs cause most harm; same drugs need most safety guardrails.",
        onWrong: "Anticoagulants, insulin, opioids, methotrexate (oral weekly!), chemo, hypoglycemics, immunosuppressants. ISMP outpatient list. The drugs that hurt most patients when used in error."
    )

    static let day34_ismpDoNotUseTrailingZero = RimrockQuestion(
        id: "D34_TRAILING_ZERO",
        domain: .patientSafety,
        topic: "ISMP_TRAILING_ZERO",
        prompt: "Which prescription notation is on ISMP's do-not-use list?",
        options: [
            "1.0 mg (trailing zero) — risk of misreading as 10 mg",
            "0.5 mg",
            "0.5 mL",
            "1 mg"
        ],
        correctAnswer: "1.0 mg (trailing zero) — risk of misreading as 10 mg",
        onCorrect: "Trailing zeros after decimals — \"1.0 mg\" can be misread as \"10 mg\" if the decimal is missed. Always write 1 mg without the trailing zero. Conversely, naked decimals — \".5 mg\" should be \"0.5 mg\" — leading zeros prevent misreading as 5 mg. Other ISMP do-not-use: U for units, IU for international units, QD for daily, MS or MSO4 for morphine, etc.",
        onWrong: "Trailing zeros after decimals (\"1.0\" → \"10\"). Naked decimals (\".5\" → \"5\"). Always use leading zeros, never trailing zeros. Other do-not-use: U (units), IU, QD, MS/MSO4. ISMP and Joint Commission both maintain the lists."
    )

    static let day34_beersBenzoElderly = RimrockQuestion(
        id: "D34_BEERS_BENZO",
        domain: .patientSafety,
        topic: "BEERS_BENZO",
        prompt: "Per Beers Criteria, benzodiazepines in adults over 65 are:",
        options: [
            "Generally avoided due to fall, cognitive, and dependence risks",
            "Recommended first-line for anxiety",
            "Safer than in younger adults",
            "Required for sleep disorders"
        ],
        correctAnswer: "Generally avoided due to fall, cognitive, and dependence risks",
        onCorrect: "Generally avoided. Beers flags benzos for elderly — sedation, cognitive impairment, falls, dependence. Same with non-benzo Z-drugs (zolpidem, zaleplon, eszopiclone). Other Beers high-flag categories in older adults: first-generation antihistamines (diphenhydramine), TCAs, anticholinergic stacking, NSAIDs in CKD, sliding-scale insulin, glyburide, muscle relaxants, long-acting sulfonylureas.",
        onWrong: "Beers list — generally avoid in 65+. Sedation, cognition, falls, dependence. Same for Z-drugs. Other Beers flags: first-gen antihistamines, TCAs, NSAIDs in CKD, glyburide, muscle relaxants, sliding-scale insulin."
    )

    static let day34_lasaPairCelexa = RimrockQuestion(
        id: "D34_LASA_CELEXA",
        domain: .patientSafety,
        topic: "LASA_PAIR",
        prompt: "Which is a documented look-alike sound-alike pair?",
        options: [
            "Celebrex and Celexa",
            "Lisinopril and atorvastatin",
            "Albuterol and amoxicillin",
            "Metformin and acetaminophen"
        ],
        correctAnswer: "Celebrex and Celexa",
        onCorrect: "Celebrex (celecoxib, COX-2 NSAID) and Celexa (citalopram, SSRI) — three syllables each, similar spelling. Add Cerebyx (fosphenytoin, anti-seizure) for the trio of doom. ISMP maintains a comprehensive LASA list. Tall man lettering (CelEBREX vs CelEXA) is a mitigation. Always read twice.",
        onWrong: "Celebrex and Celexa — three of the worst LASA. Plus Cerebyx (anti-seizure). Tall man lettering: CelEBREX vs CelEXA. ISMP LASA list is the comprehensive reference."
    )

    static let day34_lasaPairHumalogHumulin = RimrockQuestion(
        id: "D34_LASA_HUMA",
        domain: .patientSafety,
        topic: "LASA_INSULIN",
        prompt: "Which insulin pair has been a frequent LASA cause of medication error?",
        options: [
            "Humalog (rapid-acting lispro) and Humulin (regular or NPH)",
            "Lantus and Levemir",
            "Tresiba and Toujeo",
            "Apidra and Trulicity"
        ],
        correctAnswer: "Humalog (rapid-acting lispro) and Humulin (regular or NPH)",
        onCorrect: "Humalog (rapid-acting insulin lispro) vs Humulin (which can be regular short-acting OR NPH intermediate). Confused names + confused timing = severe hypoglycemia or hyperglycemia. Tall man lettering: HumaLOG vs HumuLIN. Insulin is on every high-alert list; insulin LASA pairs are a major cause of harm.",
        onWrong: "HumaLOG (lispro, rapid) vs HumuLIN (regular short or NPH intermediate). Tall man lettering. Critical separation in pharmacy storage and verification. Insulin = every high-alert list."
    )

    static let day34_lasaPairKlonopinClonidine = RimrockQuestion(
        id: "D34_LASA_KLON",
        domain: .patientSafety,
        topic: "LASA_KLONOPIN_CLONIDINE",
        prompt: "Which LASA pair includes a controlled substance and a non-controlled antihypertensive?",
        options: [
            "Klonopin (clonazepam) and clonidine",
            "Adderall and Allegra",
            "Vicodin and Vicoprofen",
            "Concerta and Strattera"
        ],
        correctAnswer: "Klonopin (clonazepam) and clonidine",
        onCorrect: "Klonopin (clonazepam — C-IV benzo) vs clonidine (alpha-2 agonist, non-controlled, used for hypertension and ADHD). Names start similarly. Confusion between a controlled substance and a non-controlled drug carries DEA documentation consequences as well as patient safety. Always read twice; verify the indication makes sense.",
        onWrong: "Klonopin (clonazepam, benzo, C-IV) vs clonidine (non-controlled antihypertensive). Confusion crosses controlled/non-controlled boundary. Read twice; verify the indication makes sense for the drug."
    )

    static let day34_tallManLettering = RimrockQuestion(
        id: "D34_TALL_MAN",
        domain: .patientSafety,
        topic: "TALL_MAN_LETTERING",
        prompt: "Tall man lettering is used to:",
        options: [
            "Highlight the differing parts of look-alike drug names (e.g., hydrOXYzine vs hydrALAzine)",
            "Indicate brand-name medications",
            "Indicate over-the-counter medications",
            "Mark Schedule II controlled substances"
        ],
        correctAnswer: "Highlight the differing parts of look-alike drug names (e.g., hydrOXYzine vs hydrALAzine)",
        onCorrect: "Tall man lettering — capitalize the differing parts of LASA pairs to draw attention. hydrOXYzine vs hydrALAzine. CelEBREX vs CelEXA. predniSONE vs prednisoLONE. ISMP and FDA maintain official tall-man lists for hundreds of pairs. Pharmacy software, label printers, and shelf labels should all use them where applicable.",
        onWrong: "Tall man lettering capitalizes the differing portions of LASA names: hydrOXYzine vs hydrALAzine, CelEBREX vs CelEXA, predniSONE vs prednisoLONE. ISMP/FDA maintain official lists."
    )

    static let day34_blackBoxBeers = RimrockQuestion(
        id: "D34_BEERS_NSAID",
        domain: .patientSafety,
        topic: "BEERS_NSAIDS_KIDNEY",
        prompt: "Per Beers Criteria, NSAIDs in adults over 65 should be avoided in:",
        options: [
            "Patients with chronic kidney disease, heart failure, or on anticoagulants",
            "All patients regardless of conditions",
            "Only patients with diabetes",
            "Only patients with hypertension"
        ],
        correctAnswer: "Patients with chronic kidney disease, heart failure, or on anticoagulants",
        onCorrect: "NSAIDs in CKD, heart failure, or anticoagulants — Beers flags. NSAIDs reduce renal perfusion (worse in CKD or HF), inhibit platelets and damage GI mucosa (worse with anticoagulants). Acetaminophen up to 3 g/day is generally safer for elderly. Topical NSAIDs (diclofenac gel) have less systemic effect.",
        onWrong: "Avoid NSAIDs in CKD, HF, anticoagulant users — Beers flag. Renal perfusion + platelet/GI effects. Acetaminophen ≤3 g/day generally safer. Topical NSAIDs less systemic exposure."
    )
}

// MARK: - Day 35 Questions — Final Mock

extension RimrockQuestion {

    static let day35_mock1 = RimrockQuestion(
        id: "D35_MOCK_01",
        domain: .medications,
        topic: "MOCK_BRAND_GENERIC",
        prompt: "Brand name for atorvastatin?",
        options: ["Lipitor", "Crestor", "Zocor", "Pravachol"],
        correctAnswer: "Lipitor",
        onCorrect: "Lipitor. Crestor = rosuvastatin; Zocor = simvastatin; Pravachol = pravastatin. Memorize the brand-generic pairings — easy points, the PTCB asks at least a half dozen.",
        onWrong: "Lipitor = atorvastatin. Crestor = rosuvastatin; Zocor = simvastatin; Pravachol = pravastatin. Brand-generic recall is reflex points."
    )

    static let day35_mock2 = RimrockQuestion(
        id: "D35_MOCK_02",
        domain: .federalRequirements,
        topic: "MOCK_SCHEDULE",
        prompt: "Which is the schedule for tramadol?",
        options: ["Schedule IV", "Schedule II", "Schedule III", "Schedule V"],
        correctAnswer: "Schedule IV",
        onCorrect: "Tramadol — Schedule IV since 2014. Limited refills (up to 5 within 6 months), prescription valid 6 months. Partial mu-agonist with SNRI activity — serotonin syndrome risk with serotonergic combos. C-IVs also include benzodiazepines, zolpidem, eszopiclone, modafinil.",
        onWrong: "C-IV. Tramadol joined the C-IV list in 2014. Partial-agonist + SNRI = serotonin syndrome risk."
    )

    static let day35_mock3 = RimrockQuestion(
        id: "D35_MOCK_03",
        domain: .patientSafety,
        topic: "MOCK_HIGH_ALERT",
        prompt: "Which is on the ISMP high-alert list?",
        options: ["Methotrexate (oral, weekly)", "Loratadine", "Acetaminophen", "Calcium carbonate"],
        correctAnswer: "Methotrexate (oral, weekly)",
        onCorrect: "Oral methotrexate, weekly. Patients have died from accidental daily dosing — \"once weekly\" is the safety phrase. Always counsel on the day of the week, never \"daily.\" The PTCB tests this specifically.",
        onWrong: "Oral methotrexate — weekly dosing. Daily dosing has killed people. Always anchor to a specific day of the week. ISMP high-alert."
    )

    static let day35_mock4 = RimrockQuestion(
        id: "D35_MOCK_04",
        domain: .orderEntry,
        topic: "MOCK_NDC",
        prompt: "An 11-digit NDC has which segment structure?",
        options: ["Labeler-Product-Package (5-4-2)", "Drug-Form-Strength", "Manufacturer-Lot-Expiration", "BIN-PCN-Group"],
        correctAnswer: "Labeler-Product-Package (5-4-2)",
        onCorrect: "Labeler-Product-Package, 5-4-2 in 11-digit format. Old 10-digit NDCs (4-4-2, 5-3-2, 5-4-1) get padded by adding a leading zero to the short segment.",
        onWrong: "Labeler-Product-Package, 5-4-2 padded format."
    )

    static let day35_mock5 = RimrockQuestion(
        id: "D35_MOCK_05",
        domain: .medications,
        topic: "MOCK_DRUG_INTERACTION",
        prompt: "A patient on warfarin starts trimethoprim-sulfamethoxazole. The concern is:",
        options: [
            "Bactrim significantly raises INR via CYP inhibition",
            "Bactrim lowers INR",
            "No interaction",
            "Bleeding only at high doses"
        ],
        correctAnswer: "Bactrim significantly raises INR via CYP inhibition",
        onCorrect: "Bactrim raises INR via CYP inhibition — risk of major bleed. Other classic warfarin interactions: amiodarone, fluconazole, metronidazole (raise INR); rifampin (lowers INR). Always check before dispensing.",
        onWrong: "Bactrim raises INR. The classic warfarin DDIs: amiodarone, Bactrim, fluconazole, metronidazole = raise. Rifampin = lowers."
    )

    static let day35_mock6 = RimrockQuestion(
        id: "D35_MOCK_06",
        domain: .federalRequirements,
        topic: "MOCK_HIPAA",
        prompt: "Under HIPAA, which is permitted without separate authorization?",
        options: [
            "Refill processing under TPO (treatment, payment, operations)",
            "Releasing medication list to a friend who calls",
            "Discussing treatment with a neighbor at the patient's request without documentation",
            "Sharing PHI for marketing"
        ],
        correctAnswer: "Refill processing under TPO (treatment, payment, operations)",
        onCorrect: "TPO. Treatment, payment, operations — pharmacy's standard activities don't require separate authorization. Friend disclosure WITHOUT authorization, marketing without authorization, undocumented designations all require explicit signed authorization.",
        onWrong: "TPO permits standard pharmacy activities. Other disclosures require written authorization."
    )

    static let day35_mock7 = RimrockQuestion(
        id: "D35_MOCK_07",
        domain: .patientSafety,
        topic: "MOCK_LASA",
        prompt: "Patient on hydroxyzine 50 mg gets a new prescription for hydralazine 25 mg from another doctor. Which is true?",
        options: [
            "Different drugs (antihistamine vs antihypertensive); both can be appropriate but require coordination",
            "Same drug, different strength",
            "Cannot be filled simultaneously",
            "Hydralazine is a brand name for hydroxyzine"
        ],
        correctAnswer: "Different drugs (antihistamine vs antihypertensive); both can be appropriate but require coordination",
        onCorrect: "Different drugs. Hydroxyzine = antihistamine (anxiety/itch). Hydralazine = vasodilator (BP). Tall man lettering: hydrALAzine vs hydrOXYzine. Coordination via prescriber call ensures both prescribers know about both drugs.",
        onWrong: "Different drugs. hydrOXYzine = antihistamine; hydrALAzine = vasodilator. Tall man lettering. Coordinate via prescriber when both are present."
    )

    static let day35_mock8 = RimrockQuestion(
        id: "D35_MOCK_08",
        domain: .orderEntry,
        topic: "MOCK_DAYS_SUPPLY",
        prompt: "Sig: 1 tablet PO BID. Quantity dispensed: 60. Days supply?",
        options: ["30 days", "60 days", "15 days", "Cannot determine"],
        correctAnswer: "30 days",
        onCorrect: "60 ÷ 2 (per day) = 30 days. Insurance billing depends on accurate days supply. Refill timing, vacation overrides, MTM all reference it.",
        onWrong: "30 days. Quantity / daily quantity. Always check the sig. Days supply errors are billing AND patient safety."
    )

    static let day35_mock9 = RimrockQuestion(
        id: "D35_MOCK_09",
        domain: .federalRequirements,
        topic: "MOCK_FORM_222",
        prompt: "DEA Form 222 is required for ordering:",
        options: ["Schedule II only", "Schedule II-V", "All controlled substances and OTC behind-the-counter", "Schedule III-V"],
        correctAnswer: "Schedule II only",
        onCorrect: "Schedule II only. Other schedules use the standard wholesaler invoice. CSOS is the electronic equivalent of Form 222 for C-II ordering.",
        onWrong: "C-II only. Other schedules on regular invoice. CSOS = electronic Form 222."
    )

    static let day35_mock10 = RimrockQuestion(
        id: "D35_MOCK_10",
        domain: .medications,
        topic: "MOCK_NTI",
        prompt: "Which is on the FDA's narrow therapeutic index list?",
        options: ["Warfarin", "Acetaminophen", "Loratadine", "Ibuprofen"],
        correctAnswer: "Warfarin",
        onCorrect: "Warfarin — small dose change has big effect. NTI list also includes: levothyroxine, lithium, digoxin, phenytoin, carbamazepine, theophylline, cyclosporine, tacrolimus. Generic substitution requires extra care; once stable on a manufacturer, stay there.",
        onWrong: "Warfarin. NTI list: warfarin, levothyroxine, lithium, digoxin, phenytoin, carbamazepine, theophylline, cyclosporine, tacrolimus. Stay-on-same-manufacturer principle."
    )

    static let day35_mock11 = RimrockQuestion(
        id: "D35_MOCK_11",
        domain: .patientSafety,
        topic: "MOCK_BEERS",
        prompt: "Beers Criteria flags which of the following for elderly patients?",
        options: [
            "First-generation antihistamines (diphenhydramine)",
            "Levothyroxine",
            "Loratadine",
            "Acetaminophen at usual doses"
        ],
        correctAnswer: "First-generation antihistamines (diphenhydramine)",
        onCorrect: "First-gen antihistamines (diphenhydramine, hydroxyzine, chlorpheniramine) — anticholinergic burden, sedation, fall risk. Other Beers flags in elderly: benzos, glyburide, NSAIDs in CKD, sliding-scale insulin, muscle relaxants, TCAs, anticholinergic stacking generally.",
        onWrong: "First-gen antihistamines (diphenhydramine). Anticholinergic burden + sedation + falls. Beers list — pause and reconsider in adults 65+."
    )

    static let day35_mock12 = RimrockQuestion(
        id: "D35_MOCK_12",
        domain: .orderEntry,
        topic: "MOCK_INSULIN_DAYS",
        prompt: "Insulin glargine 100 units/mL, 10 mL vial, 25 units sub-Q daily. Days supply?",
        options: ["40 days", "10 days", "100 days", "25 days"],
        correctAnswer: "40 days",
        onCorrect: "10 mL × 100 units/mL = 1000 units. 1000 ÷ 25 = 40 days. Insulin days supply is total units divided by daily units — and is one of the most commonly mis-billed quantities in retail.",
        onWrong: "1000 units / 25 daily = 40 days. Insulin = total units / daily units. Common billing error."
    )
}
