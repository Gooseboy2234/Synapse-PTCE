//
//  MedicationDatabase.swift
//  Synapse PTCE
//
//  COMPREHENSIVE DATABASE — All Stems, High-Risk Meds, and Interactions
//  This is the "textbook" that the guided learning system teaches from.
//

import Foundation

// MARK: - Drug Stems Database (Expanded)

let allDrugStems: [DrugStem] = [
        
        // CARDIOVASCULAR SYSTEM
        DrugStem(stem: "-pril", drugClass: "ACE Inhibitor", therapeuticUse: "Hypertension, Heart Failure, Diabetic Nephropathy", examples: ["lisinopril", "enalapril", "ramipril", "benazepril"], keyPoint: "Blocks ACE → lowers BP. Watch for dry cough (bradykinin).", systemAffected: .cardiovascular, pronunciation: "prill"),
        
        DrugStem(stem: "-sartan", drugClass: "ARB (Angiotensin Receptor Blocker)", therapeuticUse: "Hypertension, Heart Failure", examples: ["losartan", "valsartan", "olmesartan", "irbesartan"], keyPoint: "Blocks AT1 receptor. No cough. Same benefits as ACE inhibitors.", systemAffected: .cardiovascular, pronunciation: "sar-tan"),
        
        DrugStem(stem: "-olol", drugClass: "Beta-Blocker", therapeuticUse: "Hypertension, Angina, Post-MI, Heart Failure", examples: ["metoprolol", "atenolol", "carvedilol", "propranolol"], keyPoint: "Blocks beta receptors → slows heart. Don't stop abruptly.", systemAffected: .cardiovascular, pronunciation: "oh-lawl"),
        
        DrugStem(stem: "-dipine", drugClass: "Dihydropyridine CCB", therapeuticUse: "Hypertension, Angina", examples: ["amlodipine", "nifedipine", "felodipine"], keyPoint: "Blocks calcium channels → vasodilation. Watch for ankle edema.", systemAffected: .cardiovascular, pronunciation: "dih-peen"),
        
        DrugStem(stem: "-statin", drugClass: "HMG-CoA Reductase Inhibitor", therapeuticUse: "Hyperlipidemia", examples: ["atorvastatin", "simvastatin", "rosuvastatin", "pravastatin"], keyPoint: "Lowers LDL cholesterol. Watch for muscle pain (myopathy).", systemAffected: .cardiovascular, pronunciation: "stah-tin"),
        
        DrugStem(stem: "-thiazide", drugClass: "Thiazide Diuretic", therapeuticUse: "Hypertension, Edema", examples: ["hydrochlorothiazide", "chlorthalidone"], keyPoint: "Promotes Na+ excretion → lowers BP. Monitor K+ (hypokalemia).", systemAffected: .cardiovascular, pronunciation: "thy-ah-zide"),
        
        // ENDOCRINE SYSTEM
        DrugStem(stem: "-gliptin", drugClass: "DPP-4 Inhibitor", therapeuticUse: "Type 2 Diabetes", examples: ["sitagliptin", "linagliptin", "saxagliptin"], keyPoint: "Increases incretin → enhances insulin. Weight-neutral.", systemAffected: .endocrine, pronunciation: "glip-tin"),
        
        DrugStem(stem: "-gliflozin", drugClass: "SGLT-2 Inhibitor", therapeuticUse: "Type 2 Diabetes, Heart Failure", examples: ["empagliflozin", "canagliflozin", "dapagliflozin"], keyPoint: "Blocks glucose reabsorption → glucose in urine. Watch for UTI.", systemAffected: .endocrine, pronunciation: "glih-flow-zin"),
        
        DrugStem(stem: "-glitazone", drugClass: "Thiazolidinedione (TZD)", therapeuticUse: "Type 2 Diabetes", examples: ["pioglitazone", "rosiglitazone"], keyPoint: "Increases insulin sensitivity. WARNING: Fluid retention, weight gain.", systemAffected: .endocrine, pronunciation: "glih-tah-zone"),
        
        DrugStem(stem: "gly-", drugClass: "Sulfonylurea", therapeuticUse: "Type 2 Diabetes", examples: ["glyburide", "glipizide", "glimepiride"], keyPoint: "Stimulates insulin release. CAUTION: Hypoglycemia risk.", systemAffected: .endocrine),
        
        // GASTROINTESTINAL SYSTEM
        DrugStem(stem: "-prazole", drugClass: "Proton Pump Inhibitor (PPI)", therapeuticUse: "GERD, Peptic Ulcer", examples: ["omeprazole", "pantoprazole", "esomeprazole", "lansoprazole"], keyPoint: "Blocks gastric acid pumps. Long-term: fracture risk, B12 deficiency.", systemAffected: .gastrointestinal, pronunciation: "pray-zole"),
        
        DrugStem(stem: "-tidine", drugClass: "H2 Receptor Antagonist", therapeuticUse: "GERD, Peptic Ulcer", examples: ["famotidine", "nizatidine", "cimetidine"], keyPoint: "Blocks H2 receptors → reduces acid. Weaker than PPIs.", systemAffected: .gastrointestinal, pronunciation: "tih-deen"),
        
        // CENTRAL NERVOUS SYSTEM
        DrugStem(stem: "-pam / -lam", drugClass: "Benzodiazepine", therapeuticUse: "Anxiety, Insomnia, Seizures", examples: ["diazepam", "lorazepam", "alprazolam", "clonazepam"], keyPoint: "Enhances GABA. CONTROLLED C-IV. Risk: dependence, respiratory depression.", systemAffected: .centralNervous, pronunciation: "pam / lam"),
        
        DrugStem(stem: "-pine (atypical)", drugClass: "Atypical Antipsychotic", therapeuticUse: "Schizophrenia, Bipolar Disorder", examples: ["quetiapine", "olanzapine", "risperidone", "aripiprazole"], keyPoint: "Blocks D2 + 5-HT2A. Watch for metabolic syndrome, weight gain.", systemAffected: .centralNervous, pronunciation: "peen"),
        
        DrugStem(stem: "-etine", drugClass: "SSRI", therapeuticUse: "Depression, Anxiety, OCD", examples: ["fluoxetine", "sertraline", "paroxetine", "citalopram"], keyPoint: "Blocks serotonin reuptake. Takes 4–6 weeks for effect.", systemAffected: .centralNervous, pronunciation: "eh-teen"),
        
        // RESPIRATORY SYSTEM
        DrugStem(stem: "-terol", drugClass: "Beta-2 Agonist", therapeuticUse: "Asthma, COPD", examples: ["albuterol", "salmeterol", "formoterol"], keyPoint: "Relaxes bronchial smooth muscle. Albuterol = rescue inhaler.", systemAffected: .respiratory, pronunciation: "ter-awl"),
        
        // IMMUNE SYSTEM & INFECTION
        DrugStem(stem: "-cillin", drugClass: "Penicillin Antibiotic", therapeuticUse: "Bacterial Infections", examples: ["amoxicillin", "penicillin", "ampicillin"], keyPoint: "Inhibits bacterial cell wall. ALLERGY WARNING: cross-reactivity.", systemAffected: .immune, pronunciation: "sill-in"),
        
        DrugStem(stem: "-cycline", drugClass: "Tetracycline Antibiotic", therapeuticUse: "Bacterial Infections, Acne", examples: ["doxycycline", "tetracycline", "minocycline"], keyPoint: "Inhibits protein synthesis. AVOID: pregnancy, children < 8 (tooth staining).", systemAffected: .immune, pronunciation: "sigh-kleen"),
        
        DrugStem(stem: "-mycin", drugClass: "Macrolide Antibiotic", therapeuticUse: "Respiratory/Skin Infections", examples: ["azithromycin", "erythromycin", "clarithromycin"], keyPoint: "Inhibits protein synthesis. Alternative for penicillin allergy. Watch QT prolongation.", systemAffected: .immune, pronunciation: "my-sin"),
        
        DrugStem(stem: "-floxacin", drugClass: "Fluoroquinolone", therapeuticUse: "UTI, Respiratory Infections", examples: ["ciprofloxacin", "levofloxacin", "moxifloxacin"], keyPoint: "Inhibits DNA gyrase. BLACK BOX: tendon rupture. AVOID in children.", systemAffected: .immune, pronunciation: "flox-ah-sin"),
        
        DrugStem(stem: "-azole (antifungal)", drugClass: "Azole Antifungal", therapeuticUse: "Fungal Infections", examples: ["fluconazole", "ketoconazole", "itraconazole"], keyPoint: "Inhibits ergosterol synthesis. Watch liver toxicity, drug interactions.", systemAffected: .immune, pronunciation: "ay-zole"),
        
        DrugStem(stem: "-vir", drugClass: "Antiviral", therapeuticUse: "Viral Infections", examples: ["acyclovir", "valacyclovir", "oseltamivir"], keyPoint: "Mechanism varies. Acyclovir = herpes. Oseltamivir = flu (Tamiflu).", systemAffected: .immune, pronunciation: "veer"),
        
        // HEMATOLOGIC SYSTEM
        DrugStem(stem: "-arin", drugClass: "Anticoagulant", therapeuticUse: "DVT, PE, Afib", examples: ["warfarin", "heparin"], keyPoint: "Warfarin = Vit K antagonist. Monitor INR. MANY interactions.", systemAffected: .hematologic, pronunciation: "air-in"),
        
        DrugStem(stem: "-xaban", drugClass: "Direct Oral Anticoagulant (Factor Xa Inhibitor)", therapeuticUse: "DVT, PE, Afib", examples: ["rivaroxaban", "apixaban", "edoxaban"], keyPoint: "No INR monitoring. Fixed dosing. Safer than warfarin for many patients.", systemAffected: .hematologic, pronunciation: "zah-ban"),
        
        // MUSCULOSKELETAL SYSTEM
        DrugStem(stem: "-profen / -fenac", drugClass: "NSAID", therapeuticUse: "Pain, Inflammation, Fever", examples: ["ibuprofen", "naproxen", "diclofenac"], keyPoint: "Blocks COX → reduces prostaglandins. RISK: GI bleeding, renal impairment.", systemAffected: .musculoskeletal, pronunciation: "pro-fen / fee-nak"),
        
        // ADDITIONAL CARDIOVASCULAR STEMS
        DrugStem(stem: "-semide", drugClass: "Loop Diuretic", therapeuticUse: "Heart Failure, Edema, Hypertension", examples: ["furosemide", "bumetanide", "torsemide"], keyPoint: "Blocks Na-K-2Cl transporter in Loop of Henle. More potent than thiazides. RISK: hypokalemia, ototoxicity.", systemAffected: .cardiovascular, pronunciation: "seh-mide"),
        
        DrugStem(stem: "-afil", drugClass: "PDE-5 Inhibitor", therapeuticUse: "Erectile Dysfunction, Pulmonary Hypertension", examples: ["sildenafil", "tadalafil", "vardenafil"], keyPoint: "Inhibits phosphodiesterase-5 → vasodilation. CONTRAINDICATED with nitrates (severe hypotension).", systemAffected: .cardiovascular, pronunciation: "ah-fill"),
        
        DrugStem(stem: "dil- / vera-", drugClass: "Non-Dihydropyridine CCB", therapeuticUse: "Hypertension, Arrhythmias (Afib/Flutter)", examples: ["diltiazem", "verapamil"], keyPoint: "Blocks cardiac calcium channels → slows HR. Do NOT combine with beta-blockers (severe bradycardia risk).", systemAffected: .cardiovascular, pronunciation: "dil-tye-ah-zem / ver-ap-ah-mil"),
        
        DrugStem(stem: "-fibrate", drugClass: "Fibric Acid Derivative", therapeuticUse: "Hypertriglyceridemia", examples: ["fenofibrate", "gemfibrozil"], keyPoint: "Lowers triglycerides. CAUTION: gemfibrozil + statins = severe rhabdomyolysis risk. Use fenofibrate instead.", systemAffected: .cardiovascular, pronunciation: "fy-brate"),
        
        DrugStem(stem: "-nitrate", drugClass: "Nitrate Vasodilator", therapeuticUse: "Angina, Heart Failure", examples: ["nitroglycerin", "isosorbide dinitrate", "isosorbide mononitrate"], keyPoint: "Releases nitric oxide → vasodilation. NEVER with PDE-5 inhibitors (sildenafil). Can cause headache, tolerance.", systemAffected: .cardiovascular, pronunciation: "ny-trate"),
        
        // ADDITIONAL ENDOCRINE STEMS
        DrugStem(stem: "-glutide", drugClass: "GLP-1 Receptor Agonist", therapeuticUse: "Type 2 Diabetes, Weight Loss", examples: ["liraglutide", "semaglutide", "dulaglutide", "exenatide"], keyPoint: "Mimics incretin → insulin release, slows gastric emptying. Injectable. Weight loss benefit. GI side effects common.", systemAffected: .endocrine, pronunciation: "gloo-tide"),
        
        DrugStem(stem: "-formin", drugClass: "Biguanide", therapeuticUse: "Type 2 Diabetes", examples: ["metformin"], keyPoint: "Decreases hepatic glucose production. First-line for T2DM. CONTRAINDICATED if eGFR < 30 (lactic acidosis risk). Hold before contrast.", systemAffected: .endocrine, pronunciation: "for-min"),
        
        DrugStem(stem: "-sone / -lone", drugClass: "Corticosteroid", therapeuticUse: "Inflammation, Autoimmune, Asthma, Allergies", examples: ["prednisone", "methylprednisolone", "dexamethasone", "hydrocortisone"], keyPoint: "Suppresses immune system. Taper when discontinuing (don't stop abruptly). Long-term: osteoporosis, hyperglycemia.", systemAffected: .endocrine, pronunciation: "sone / lone"),
        
        DrugStem(stem: "-thiouracil / -mazole", drugClass: "Antithyroid Agent", therapeuticUse: "Hyperthyroidism", examples: ["propylthiouracil", "methimazole"], keyPoint: "Blocks thyroid hormone synthesis. Monitor for agranulocytosis (severe WBC drop). Pregnancy: PTU preferred (1st trimester).", systemAffected: .endocrine, pronunciation: "thy-oh-yur-ah-sill / mah-zole"),
        
        // ADDITIONAL GI STEMS
        DrugStem(stem: "-setron", drugClass: "5-HT3 Antagonist (Antiemetic)", therapeuticUse: "Chemotherapy-Induced Nausea, Postoperative Nausea", examples: ["ondansetron", "granisetron", "palonosetron"], keyPoint: "Blocks serotonin receptors in gut/brain → prevents nausea. Watch for QT prolongation (especially ondansetron).", systemAffected: .gastrointestinal, pronunciation: "seh-tron"),
        
        DrugStem(stem: "-coxib", drugClass: "COX-2 Selective Inhibitor", therapeuticUse: "Arthritis Pain, Inflammation", examples: ["celecoxib"], keyPoint: "Selective COX-2 inhibition → less GI bleeding than traditional NSAIDs. RISK: cardiovascular events (MI, stroke).", systemAffected: .musculoskeletal, pronunciation: "cox-ib"),
        
        // ADDITIONAL CNS STEMS
        DrugStem(stem: "-triptyline", drugClass: "Tricyclic Antidepressant (TCA)", therapeuticUse: "Depression, Neuropathic Pain", examples: ["amitriptyline", "nortriptyline", "doxepin"], keyPoint: "Blocks serotonin + norepinephrine reuptake. Anticholinergic side effects (dry mouth, constipation). OVERDOSE: cardiac arrhythmias.", systemAffected: .centralNervous, pronunciation: "trip-tih-leen"),
        
        DrugStem(stem: "-venlafaxine / -duloxetine", drugClass: "SNRI (Serotonin-Norepinephrine Reuptake Inhibitor)", therapeuticUse: "Depression, Anxiety, Neuropathic Pain", examples: ["venlafaxine", "duloxetine", "desvenlafaxine"], keyPoint: "Blocks serotonin + norepinephrine reuptake. Used for depression AND chronic pain. Monitor BP (can increase).", systemAffected: .centralNervous, pronunciation: "ven-lah-fax-een / doo-lox-eh-teen"),
        
        DrugStem(stem: "-amphetamine", drugClass: "CNS Stimulant (ADHD)", therapeuticUse: "ADHD, Narcolepsy", examples: ["dextroamphetamine", "lisdexamfetamine", "amphetamine"], keyPoint: "Increases dopamine/norepinephrine. CONTROLLED C-II. Risk: abuse, cardiovascular events. Screen for heart conditions.", systemAffected: .centralNervous, pronunciation: "am-fet-ah-meen"),
        
        DrugStem(stem: "-done (opioid)", drugClass: "Opioid Analgesic", therapeuticUse: "Moderate to Severe Pain", examples: ["hydrocodone", "oxycodone", "methadone"], keyPoint: "Binds opioid receptors. CONTROLLED C-II. Risk: respiratory depression, addiction. Naloxone reverses overdose.", systemAffected: .centralNervous, pronunciation: "dohn"),
        
        DrugStem(stem: "-morphine", drugClass: "Opioid Analgesic", therapeuticUse: "Severe Pain", examples: ["morphine", "hydromorphone", "oxymorphone"], keyPoint: "Strong opioid. CONTROLLED C-II. Use in cancer pain, post-surgical pain. Naloxone reverses overdose.", systemAffected: .centralNervous, pronunciation: "mor-feen"),
        
        DrugStem(stem: "-triptan", drugClass: "Serotonin Agonist (Migraine)", therapeuticUse: "Migraine Headache (Acute Treatment)", examples: ["sumatriptan", "rizatriptan", "eletriptan", "zolmitriptan"], keyPoint: "Stimulates 5-HT1 receptors → vasoconstriction. CONTRAINDICATED in coronary artery disease. Do NOT combine with ergots or MAOIs.", systemAffected: .centralNervous, pronunciation: "trip-tan"),
        
        DrugStem(stem: "-barbital", drugClass: "Barbiturate", therapeuticUse: "Seizures, Anesthesia", examples: ["phenobarbital", "pentobarbital"], keyPoint: "Enhances GABA. CONTROLLED C-II to C-IV. Narrow therapeutic index. Enzyme inducer (many drug interactions).", systemAffected: .centralNervous, pronunciation: "bar-bih-tal"),
        
        DrugStem(stem: "-carbamazepine", drugClass: "Anticonvulsant", therapeuticUse: "Seizures, Trigeminal Neuralgia, Bipolar Disorder", examples: ["carbamazepine", "oxcarbazepine"], keyPoint: "Blocks sodium channels. BLACK BOX: serious skin reactions (SJS/TEN) — screen for HLA-B*1502 in Asians. NTI — monitor levels.", systemAffected: .centralNervous, pronunciation: "car-bah-maz-eh-peen"),
        
        DrugStem(stem: "-racetam", drugClass: "Anticonvulsant", therapeuticUse: "Seizures", examples: ["levetiracetam", "brivaracetam"], keyPoint: "Modulates neurotransmitter release. Well-tolerated. No significant drug interactions. Psychiatric side effects (irritability) possible.", systemAffected: .centralNervous, pronunciation: "rass-eh-tam"),
        
        DrugStem(stem: "-gabapentin / -pregabalin", drugClass: "Gabapentinoid", therapeuticUse: "Neuropathic Pain, Seizures, Fibromyalgia", examples: ["gabapentin", "pregabalin"], keyPoint: "Binds alpha-2-delta calcium channels. Used for nerve pain. Pregabalin = CONTROLLED C-V. Dose adjust for renal impairment.", systemAffected: .centralNervous, pronunciation: "gab-ah-pen-tin / preh-gab-ah-lin"),
        
        DrugStem(stem: "-zolam / -zopiclone", drugClass: "Z-Drug (Non-Benzodiazepine Hypnotic)", therapeuticUse: "Insomnia", examples: ["zolpidem", "eszopiclone", "zaleplon"], keyPoint: "Binds GABA receptors (selectively). CONTROLLED C-IV. Shorter half-life than benzos. RISK: complex sleep behaviors.", systemAffected: .centralNervous, pronunciation: "zole-am / zoe-pih-clone"),
        
        // ADDITIONAL RESPIRATORY STEMS
        DrugStem(stem: "-sone (inhaled steroid)", drugClass: "Inhaled Corticosteroid", therapeuticUse: "Asthma, COPD (Controller)", examples: ["fluticasone", "budesonide", "mometasone", "beclomethasone"], keyPoint: "Reduces airway inflammation. Controller, not rescue. Rinse mouth after use (prevent thrush).", systemAffected: .respiratory, pronunciation: "sone"),
        
        DrugStem(stem: "-tropium", drugClass: "Anticholinergic Bronchodilator", therapeuticUse: "COPD, Asthma", examples: ["ipratropium", "tiotropium"], keyPoint: "Blocks muscarinic receptors → bronchodilation. Ipratropium = short-acting. Tiotropium = long-acting. Dry mouth common.", systemAffected: .respiratory, pronunciation: "tro-pee-um"),
        
        DrugStem(stem: "-lukast", drugClass: "Leukotriene Receptor Antagonist", therapeuticUse: "Asthma, Allergic Rhinitis", examples: ["montelukast", "zafirlukast"], keyPoint: "Blocks leukotriene receptors → reduces inflammation. BLACK BOX: neuropsychiatric events (montelukast). Take at bedtime.", systemAffected: .respiratory, pronunciation: "loo-kast"),
        
        // ADDITIONAL IMMUNE/INFECTION STEMS
        DrugStem(stem: "-navir", drugClass: "Protease Inhibitor (HIV)", therapeuticUse: "HIV Infection", examples: ["ritonavir", "lopinavir", "atazanavir", "darunavir"], keyPoint: "Inhibits HIV protease. Often boosted with ritonavir (CYP3A4 inhibitor). Many drug interactions.", systemAffected: .immune, pronunciation: "nah-veer"),
        
        DrugStem(stem: "-tegravir", drugClass: "Integrase Inhibitor (HIV)", therapeuticUse: "HIV Infection", examples: ["dolutegravir", "raltegravir", "bictegravir"], keyPoint: "Inhibits HIV integrase enzyme. Well-tolerated. Fewer drug interactions than protease inhibitors.", systemAffected: .immune, pronunciation: "teg-rah-veer"),
        
        DrugStem(stem: "-mab (biologic)", drugClass: "Monoclonal Antibody", therapeuticUse: "Autoimmune, Cancer, Inflammation", examples: ["infliximab", "adalimumab", "rituximab", "pembrolizumab"], keyPoint: "Biologic therapy. Injectable. Immunosuppression risk. Screen for TB before starting. Expensive.", systemAffected: .immune, pronunciation: "mab"),
        
        DrugStem(stem: "-tinib", drugClass: "Tyrosine Kinase Inhibitor (Cancer)", therapeuticUse: "Various Cancers", examples: ["imatinib", "erlotinib", "sunitinib"], keyPoint: "Targeted cancer therapy. Inhibits specific kinases. Oral chemotherapy. Many side effects (diarrhea, rash, fatigue).", systemAffected: .immune, pronunciation: "tih-nib"),
        
        DrugStem(stem: "-sulfa-", drugClass: "Sulfonamide Antibiotic", therapeuticUse: "Bacterial Infections, UTI", examples: ["sulfamethoxazole (Bactrim)", "sulfasalazine"], keyPoint: "Inhibits bacterial folic acid synthesis. ALLERGY WARNING: cross-reactivity with other sulfa drugs. Stay hydrated (prevent crystals).", systemAffected: .immune, pronunciation: "sul-fah"),
        
        DrugStem(stem: "-cef-", drugClass: "Cephalosporin Antibiotic", therapeuticUse: "Bacterial Infections", examples: ["cephalexin", "cefdinir", "ceftriaxone", "cefepime"], keyPoint: "Inhibits bacterial cell wall. 5 generations. CAUTION: 10% cross-reactivity with penicillin allergy (not absolute). Alcohol + cefTRIaxone = disulfiram reaction.", systemAffected: .immune, pronunciation: "sef"),
        
        DrugStem(stem: "-penem", drugClass: "Carbapenem Antibiotic", therapeuticUse: "Severe Multi-Drug Resistant Infections", examples: ["meropenem", "imipenem", "ertapenem"], keyPoint: "Broad-spectrum. Reserved for severe infections. Cross-reactivity with penicillin allergy. Seizure risk (especially imipenem).", systemAffected: .immune, pronunciation: "pen-em"),
        
        // ADDITIONAL HEMATOLOGIC STEMS
        DrugStem(stem: "-gatran", drugClass: "Direct Thrombin Inhibitor (DOAC)", therapeuticUse: "DVT, PE, Afib", examples: ["dabigatran"], keyPoint: "Direct thrombin inhibitor. No INR monitoring. REVERSAL AGENT: idarucizumab. Take with food (reduce GI upset).", systemAffected: .hematologic, pronunciation: "gah-tran"),
        
        DrugStem(stem: "-parin (LMWH)", drugClass: "Low Molecular Weight Heparin", therapeuticUse: "DVT Prophylaxis/Treatment", examples: ["enoxaparin", "dalteparin"], keyPoint: "Subcutaneous injection. More predictable than unfractionated heparin. No aPTT monitoring usually. Dose adjust for renal impairment.", systemAffected: .hematologic, pronunciation: "pair-in"),
        
        DrugStem(stem: "-grel", drugClass: "Antiplatelet Agent", therapeuticUse: "MI, Stroke, Stent Prevention", examples: ["clopidogrel", "prasugrel", "ticagrelor"], keyPoint: "Inhibits platelet aggregation. Often combined with aspirin (DAPT). Clopidogrel = prodrug (CYP2C19). BLACK BOX: don't use with PPIs (reduced effect).", systemAffected: .hematologic, pronunciation: "grel"),
        
        // RENAL SYSTEM STEMS
        DrugStem(stem: "-pril (ACE for renal)", drugClass: "ACE Inhibitor", therapeuticUse: "Diabetic Nephropathy, CKD", examples: ["lisinopril", "enalapril"], keyPoint: "Slows CKD progression in diabetes. Monitor Cr/K+ within 1-2 weeks. Small Cr increase OK (up to 30%). Hold during AKI.", systemAffected: .renal, pronunciation: "prill"),
        
        DrugStem(stem: "-osin", drugClass: "Alpha-1 Blocker", therapeuticUse: "BPH (Benign Prostatic Hyperplasia)", examples: ["tamsulosin", "alfuzosin", "doxazosin"], keyPoint: "Relaxes prostate/bladder smooth muscle → improves urination. CAUTION: orthostatic hypotension (especially first dose). Take at bedtime.", systemAffected: .renal, pronunciation: "oh-sin"),
        
        DrugStem(stem: "-steride", drugClass: "5-Alpha Reductase Inhibitor", therapeuticUse: "BPH, Hair Loss", examples: ["finasteride", "dutasteride"], keyPoint: "Blocks DHT production → shrinks prostate. Takes 6-12 months for full effect. CAUTION: can mask PSA (prostate cancer screening). Teratogenic (women shouldn't handle).", systemAffected: .renal, pronunciation: "stair-ide"),
        
        // DERMATOLOGIC STEMS
        DrugStem(stem: "-conazole (topical)", drugClass: "Topical Antifungal", therapeuticUse: "Athlete's Foot, Ringworm, Yeast Infections", examples: ["clotrimazole", "miconazole", "econazole"], keyPoint: "Topical azole for fungal skin infections. Apply twice daily for 2-4 weeks. Continue 1 week after symptoms clear.", systemAffected: .dermatologic, pronunciation: "con-ah-zole"),
        
        DrugStem(stem: "-tretinoin", drugClass: "Topical Retinoid", therapeuticUse: "Acne, Wrinkles", examples: ["tretinoin", "adapalene", "tazarotene"], keyPoint: "Increases skin cell turnover. Apply at night. PHOTOSENSITIVITY — use sunscreen. Can worsen acne initially (purging). Avoid in pregnancy.", systemAffected: .dermatologic, pronunciation: "tret-ih-no-in"),
    ]

// MARK: - High-Risk Medications Database

let allHighRiskMedications: [HighRiskMedication] = [
        
        // NARROW THERAPEUTIC INDEX
        HighRiskMedication(genericName: "Warfarin", brandName: "Coumadin", category: .narrowTherapeuticIndex, drugClass: "Anticoagulant", therapeuticUse: "DVT, PE, Atrial Fibrillation", riskDescription: "Too little = clot. Too much = life-threatening bleeding.", monitoringRequired: "INR (target 2.0–3.0)", keyPoint: "NTI. Many drug/food interactions. Educate on vitamin K foods."),
        
        HighRiskMedication(genericName: "Digoxin", brandName: "Lanoxin", category: .narrowTherapeuticIndex, drugClass: "Cardiac Glycoside", therapeuticUse: "Heart Failure, Atrial Fibrillation", riskDescription: "Toxicity: nausea, vision changes, arrhythmias. Worsened by low K+.", monitoringRequired: "Digoxin levels (0.5–2.0 ng/mL), potassium, renal function", keyPoint: "NTI. Hold if pulse < 60 bpm. Hypokalemia increases toxicity."),
        
        HighRiskMedication(genericName: "Levothyroxine", brandName: "Synthroid", category: .narrowTherapeuticIndex, drugClass: "Thyroid Hormone", therapeuticUse: "Hypothyroidism", riskDescription: "Small dose changes = big clinical effects.", monitoringRequired: "TSH levels", keyPoint: "NTI. Take on empty stomach. Don't switch brands without MD approval."),
        
        HighRiskMedication(genericName: "Lithium", brandName: "Lithobid", category: .narrowTherapeuticIndex, drugClass: "Mood Stabilizer", therapeuticUse: "Bipolar Disorder", riskDescription: "Toxicity: tremor, confusion, seizures, renal damage.", monitoringRequired: "Lithium levels (0.6–1.2 mEq/L), renal function, thyroid", keyPoint: "NTI. Maintain hydration. Avoid NSAIDs."),
        
        // HIGH-ALERT
        HighRiskMedication(genericName: "Insulin", brandName: "Humalog, Novolog, Lantus", category: .highAlert, drugClass: "Antidiabetic Hormone", therapeuticUse: "Type 1 & 2 Diabetes", riskDescription: "Dosing errors → severe hypoglycemia → seizures, coma, death.", monitoringRequired: "Blood glucose, A1C", keyPoint: "HIGH-ALERT. Never abbreviate 'units' as 'U'. Use insulin syringes."),
        
        HighRiskMedication(genericName: "Heparin (IV)", brandName: "Generic", category: .highAlert, drugClass: "Anticoagulant", therapeuticUse: "DVT/PE Treatment, ACS", riskDescription: "IV dosing errors = massive bleeding.", monitoringRequired: "aPTT, platelet count (HIT risk)", keyPoint: "HIGH-ALERT. Double-check dose with another provider."),
        
        HighRiskMedication(genericName: "Potassium Chloride (IV)", brandName: "Generic", category: .highAlert, drugClass: "Electrolyte Replacement", therapeuticUse: "Hypokalemia", riskDescription: "IV push or rapid infusion = cardiac arrest. NEVER give IV push.", monitoringRequired: "Serum potassium, ECG", keyPoint: "HIGH-ALERT. Must be DILUTED. Max concentration: 40 mEq/L peripheral."),
        
        HighRiskMedication(genericName: "Methotrexate", brandName: "Rheumatrex", category: .highAlert, drugClass: "Antimetabolite", therapeuticUse: "Cancer, RA, Psoriasis", riskDescription: "For RA/psoriasis: ONCE WEEKLY. Daily dosing by mistake = severe toxicity/death.", monitoringRequired: "CBC, liver function, renal function", keyPoint: "HIGH-ALERT. Verify dosing frequency based on indication."),
        
        // REMS
        HighRiskMedication(genericName: "Isotretinoin", brandName: "Accutane, Absorica", category: .rems, drugClass: "Retinoid", therapeuticUse: "Severe Acne", riskDescription: "SEVERE BIRTH DEFECTS. Requires iPLEDGE program.", monitoringRequired: "Pregnancy test monthly, liver function, lipids", keyPoint: "REMS: iPLEDGE. Two forms of contraception required."),
        
        HighRiskMedication(genericName: "Clozapine", brandName: "Clozaril", category: .rems, drugClass: "Atypical Antipsychotic", therapeuticUse: "Treatment-Resistant Schizophrenia", riskDescription: "Can cause agranulocytosis (severe drop in WBC → fatal infections).", monitoringRequired: "ANC — weekly for 6 months, then biweekly", keyPoint: "REMS: Cannot dispense without valid ANC result."),
        
        // LASA
        HighRiskMedication(genericName: "HydrALAZINE vs. hydrOXYzine", brandName: "Apresoline vs. Vistaril", category: .lookAlikeSoundAlike, drugClass: "Vasodilator vs. Antihistamine", therapeuticUse: "Hypertension vs. Anxiety/Itching", riskDescription: "Commonly confused. HydrALAZINE = BP. HydrOXYzine = anxiety.", monitoringRequired: "Verify indication", keyPoint: "LASA. Use Tall Man lettering: hydrALAZINE vs. hydrOXYzine."),
        
        HighRiskMedication(genericName: "CeleXA vs. CeleBREX", brandName: "Celexa vs. Celebrex", category: .lookAlikeSoundAlike, drugClass: "SSRI vs. NSAID", therapeuticUse: "Depression vs. Arthritis", riskDescription: "Commonly confused. CeleXA = mental health. CeleBREX = joint pain.", monitoringRequired: "Verify indication", keyPoint: "LASA. Use Tall Man lettering."),
        
        // ADDITIONAL NTI MEDICATIONS
        HighRiskMedication(genericName: "Phenytoin", brandName: "Dilantin", category: .narrowTherapeuticIndex, drugClass: "Anticonvulsant", therapeuticUse: "Seizures", riskDescription: "Small dose changes = seizures or toxicity. Non-linear kinetics.", monitoringRequired: "Phenytoin levels (10-20 mcg/mL), albumin", keyPoint: "NTI. Many drug interactions (CYP inducer). Don't switch between brand/generic."),
        
        HighRiskMedication(genericName: "Theophylline", brandName: "Theo-24", category: .narrowTherapeuticIndex, drugClass: "Methylxanthine Bronchodilator", therapeuticUse: "Asthma, COPD", riskDescription: "Toxicity: nausea, arrhythmias, seizures.", monitoringRequired: "Theophylline levels (5-15 mcg/mL)", keyPoint: "NTI. Affected by smoking, caffeine. Many drug interactions."),
        
        HighRiskMedication(genericName: "Cyclosporine", brandName: "Sandimmune, Neoral", category: .narrowTherapeuticIndex, drugClass: "Immunosuppressant", therapeuticUse: "Organ Transplant, Autoimmune", riskDescription: "Too little = organ rejection. Too much = nephrotoxicity, infections.", monitoringRequired: "Cyclosporine levels, SCr, BP", keyPoint: "NTI. Avoid grapefruit juice. Many drug interactions (CYP3A4 substrate)."),
        
        HighRiskMedication(genericName: "Tacrolimus", brandName: "Prograf", category: .narrowTherapeuticIndex, drugClass: "Immunosuppressant", therapeuticUse: "Organ Transplant", riskDescription: "Too little = organ rejection. Too much = neurotoxicity, nephrotoxicity.", monitoringRequired: "Tacrolimus levels, SCr, glucose", keyPoint: "NTI. Avoid grapefruit juice. Can cause diabetes. Extended-release NOT interchangeable with immediate-release."),
        
        // ADDITIONAL HIGH-ALERT MEDICATIONS
        HighRiskMedication(genericName: "Epinephrine", brandName: "EpiPen, Adrenaline", category: .highAlert, drugClass: "Adrenergic Agonist", therapeuticUse: "Anaphylaxis, Cardiac Arrest", riskDescription: "Wrong dose or route = severe hypertension, arrhythmias, death.", monitoringRequired: "Heart rate, BP, ECG", keyPoint: "HIGH-ALERT. IV concentrations vary (1:1,000 vs 1:10,000). Auto-injectors for anaphylaxis."),
        
        HighRiskMedication(genericName: "Chemotherapy Agents", brandName: "Various", category: .highAlert, drugClass: "Antineoplastic", therapeuticUse: "Cancer", riskDescription: "Overdose = severe bone marrow suppression, organ failure, death.", monitoringRequired: "CBC, renal/liver function", keyPoint: "HIGH-ALERT. Verify dose based on BSA. Many require special handling (cytotoxic)."),
        
        HighRiskMedication(genericName: "Opioids (IV)", brandName: "Morphine, Fentanyl, Hydromorphone", category: .highAlert, drugClass: "Opioid Analgesic", therapeuticUse: "Severe Pain", riskDescription: "IV opioids = rapid respiratory depression → death.", monitoringRequired: "Respiratory rate, sedation level, pulse ox", keyPoint: "HIGH-ALERT. Have naloxone ready. Patient-controlled analgesia (PCA) pumps require double-checks."),
        
        HighRiskMedication(genericName: "Neuromuscular Blockers", brandName: "Rocuronium, Vecuronium, Succinylcholine", category: .highAlert, drugClass: "Paralytic Agent", therapeuticUse: "Anesthesia, Intubation", riskDescription: "Paralyzes muscles (including breathing). Patient can't breathe on own.", monitoringRequired: "Mechanical ventilation REQUIRED", keyPoint: "HIGH-ALERT. NEVER give without ventilation support. Store separately from other drugs."),
        
        // ADDITIONAL REMS MEDICATIONS
        HighRiskMedication(genericName: "Lenalidomide", brandName: "Revlimid", category: .rems, drugClass: "Immunomodulator", therapeuticUse: "Multiple Myeloma", riskDescription: "SEVERE BIRTH DEFECTS. Blood clots. Neutropenia.", monitoringRequired: "Pregnancy test, CBC", keyPoint: "REMS: Revlimid REMS program. Cannot dispense without authorization."),
        
        HighRiskMedication(genericName: "Fentanyl Transdermal", brandName: "Duragesic", category: .rems, drugClass: "Opioid Analgesic", therapeuticUse: "Chronic Severe Pain", riskDescription: "For OPIOID-TOLERANT patients ONLY. Naive patients = fatal respiratory depression.", monitoringRequired: "Respiratory rate, pain level", keyPoint: "REMS: Opioid Analgesic REMS. Verify opioid tolerance before prescribing. BLACK BOX warnings."),
        
        HighRiskMedication(genericName: "Long-Acting Beta Agonists", brandName: "Salmeterol (Serevent)", category: .rems, drugClass: "Long-Acting Beta-2 Agonist", therapeuticUse: "Asthma, COPD", riskDescription: "Increased asthma-related deaths when used WITHOUT inhaled steroid.", monitoringRequired: "Asthma control", keyPoint: "REMS: Must be combined with inhaled corticosteroid. NEVER use as monotherapy for asthma. BLACK BOX."),
        
        // ADDITIONAL LASA PAIRS
        HighRiskMedication(genericName: "MetFORMIN vs. MetRONIDAZOLE", brandName: "Glucophage vs. Flagyl", category: .lookAlikeSoundAlike, drugClass: "Antidiabetic vs. Antibiotic", therapeuticUse: "Diabetes vs. Infections", riskDescription: "Commonly confused. MetFORMIN = diabetes. MetRONIDAZOLE = infections.", monitoringRequired: "Verify indication", keyPoint: "LASA. Use Tall Man lettering: metFORMIN vs. metroNIDAZOLE."),
        
        HighRiskMedication(genericName: "LamoTRIgine vs. LamICtal", brandName: "Lamictal", category: .lookAlikeSoundAlike, drugClass: "Anticonvulsant", therapeuticUse: "Seizures, Bipolar Disorder", riskDescription: "Often confused with labetalol. LamoTRIgine = seizures. LamICtal = brand name.", monitoringRequired: "Verify indication", keyPoint: "LASA. Slow titration required (prevent SJS/TEN rash). Use Tall Man lettering."),
        
        HighRiskMedication(genericName: "DOBUTamine vs. DOPamine", brandName: "None vs. None", category: .lookAlikeSoundAlike, drugClass: "Inotrope vs. Vasopressor", therapeuticUse: "Heart Failure vs. Shock", riskDescription: "Both are IV drips in ICU. DOBUTamine = heart. DOPamine = BP.", monitoringRequired: "Verify indication, hemodynamics", keyPoint: "LASA. Use Tall Man lettering: DOBUTamine vs. DOPamine. Separate storage."),
    ]

// MARK: - Drug Interactions Database

let allDrugInteractions: [DrugInteraction] = [
        
        // OTC ↔ RX
        DrugInteraction(agent1: "NSAIDs (Ibuprofen)", agent2: "Warfarin", interactionType: .otcRx, severity: .major, mechanismDescription: "NSAIDs inhibit platelets + increase GI bleeding risk. Warfarin already increases bleeding.", clinicalConsequence: "MAJOR BLEEDING RISK — GI bleed, intracranial hemorrhage.", patientCounseling: "Avoid OTC NSAIDs while on warfarin. Use acetaminophen (Tylenol) instead."),
        
        DrugInteraction(agent1: "Aspirin (OTC)", agent2: "Warfarin", interactionType: .otcRx, severity: .major, mechanismDescription: "Aspirin irreversibly inhibits platelets. Warfarin inhibits clotting factors.", clinicalConsequence: "SEVERE BLEEDING RISK. Sometimes intentionally combined at low doses, but requires monitoring.", patientCounseling: "Do NOT take aspirin without MD approval while on warfarin."),
        
        DrugInteraction(agent1: "Antacids (Tums)", agent2: "Tetracyclines", interactionType: .otcRx, severity: .moderate, mechanismDescription: "Calcium/magnesium/aluminum chelate tetracyclines → reduced absorption.", clinicalConsequence: "Antibiotic FAILS to reach therapeutic levels → infection not treated.", patientCounseling: "Take doxycycline at least 2 hours BEFORE or 4–6 hours AFTER antacids."),
        
        DrugInteraction(agent1: "Pseudoephedrine (Sudafed)", agent2: "MAO Inhibitors", interactionType: .otcRx, severity: .contraindicated, mechanismDescription: "MAOIs prevent norepinephrine breakdown. Pseudoephedrine releases NE → massive sympathetic surge.", clinicalConsequence: "HYPERTENSIVE CRISIS — severe headache, stroke, death.", patientCounseling: "NEVER use decongestants with MAOIs or within 14 days of stopping an MAOI."),
        
        // HERBAL ↔ RX
        DrugInteraction(agent1: "St. John's Wort", agent2: "Oral Contraceptives", interactionType: .herbalRx, severity: .major, mechanismDescription: "St. John's Wort is CYP3A4 inducer → increases metabolism of hormones.", clinicalConsequence: "CONTRACEPTIVE FAILURE → unintended pregnancy.", patientCounseling: "Do NOT use St. John's Wort with birth control pills. Use backup contraception."),
        
        DrugInteraction(agent1: "St. John's Wort", agent2: "SSRIs", interactionType: .herbalRx, severity: .major, mechanismDescription: "Both increase serotonin levels. Combined = excessive serotonin activity.", clinicalConsequence: "SEROTONIN SYNDROME — agitation, confusion, fever, seizures.", patientCounseling: "NEVER combine St. John's Wort with prescription antidepressants."),
        
        DrugInteraction(agent1: "Ginkgo Biloba", agent2: "Warfarin", interactionType: .herbalRx, severity: .moderate, mechanismDescription: "Ginkgo has antiplatelet effects → additive bleeding risk.", clinicalConsequence: "Increased bleeding — bruising, nosebleeds, GI bleeding.", patientCounseling: "Avoid ginkgo while on warfarin or other blood thinners."),
        
        // FOOD ↔ RX
        DrugInteraction(agent1: "Grapefruit Juice", agent2: "Statins (Atorvastatin, Simvastatin)", interactionType: .foodRx, severity: .moderate, mechanismDescription: "Grapefruit inhibits CYP3A4 in gut → drastically increases statin absorption.", clinicalConsequence: "Increased risk of myopathy, rhabdomyolysis (severe muscle breakdown).", patientCounseling: "Avoid grapefruit juice. Pravastatin and rosuvastatin are safer alternatives."),
        
        DrugInteraction(agent1: "Tyramine Foods (Aged Cheese, Cured Meats)", agent2: "MAO Inhibitors", interactionType: .foodRx, severity: .contraindicated, mechanismDescription: "MAOIs prevent tyramine breakdown. Tyramine causes NE release → massive surge.", clinicalConsequence: "HYPERTENSIVE CRISIS — stroke, death.", patientCounseling: "STRICT DIET required. Avoid aged cheese, cured meats, fermented foods."),
        
        DrugInteraction(agent1: "Vitamin K Foods (Leafy Greens)", agent2: "Warfarin", interactionType: .foodRx, severity: .moderate, mechanismDescription: "Warfarin blocks Vitamin K-dependent clotting factors. High Vit K counteracts warfarin.", clinicalConsequence: "Reduced anticoagulation → increased clot risk.", patientCounseling: "Don't AVOID vitamin K foods — keep intake CONSISTENT."),
        
        DrugInteraction(agent1: "Alcohol", agent2: "Metronidazole", interactionType: .foodRx, severity: .major, mechanismDescription: "Metronidazole inhibits aldehyde dehydrogenase → acetaldehyde accumulates.", clinicalConsequence: "DISULFIRAM-LIKE REACTION — severe nausea, vomiting, flushing.", patientCounseling: "AVOID ALL ALCOHOL while taking metronidazole and for 3 days after."),
        
        // RX ↔ RX
        DrugInteraction(agent1: "Metronidazole", agent2: "Warfarin", interactionType: .rxRx, severity: .major, mechanismDescription: "Metronidazole inhibits CYP2C9 (warfarin metabolism) + disrupts gut flora (Vit K production).", clinicalConsequence: "MAJOR BLEEDING RISK — INR can skyrocket within days.", patientCounseling: "Monitor INR closely (within 3–5 days). Warfarin dose may need temporary reduction."),
        
        DrugInteraction(agent1: "Gemfibrozil", agent2: "Statins", interactionType: .rxRx, severity: .contraindicated, mechanismDescription: "Gemfibrozil inhibits statin metabolism → drastically increased statin levels.", clinicalConsequence: "VERY HIGH RISK of rhabdomyolysis (severe muscle breakdown → kidney failure, death).", patientCounseling: "AVOID gemfibrozil + statin. Use fenofibrate instead if fibrate needed."),
        
        DrugInteraction(agent1: "ACE Inhibitors / ARBs", agent2: "Potassium-Sparing Diuretics", interactionType: .rxRx, severity: .moderate, mechanismDescription: "Both increase potassium levels. ACE/ARBs reduce aldosterone. K-sparing diuretics block K+ excretion.", clinicalConsequence: "HYPERKALEMIA (high potassium) → cardiac arrhythmias, cardiac arrest.", patientCounseling: "Monitor potassium closely. Avoid potassium supplements and salt substitutes."),
        
        // ADDITIONAL OTC ↔ RX INTERACTIONS
        DrugInteraction(agent1: "NSAIDs", agent2: "ACE Inhibitors / ARBs", interactionType: .otcRx, severity: .moderate, mechanismDescription: "NSAIDs block prostaglandin-mediated vasodilation in kidneys. ACE/ARBs reduce glomerular filtration.", clinicalConsequence: "Reduced BP control. ACUTE KIDNEY INJURY risk, especially with diuretics (triple whammy).", patientCounseling: "Avoid NSAIDs if on ACE/ARBs. Use acetaminophen for pain. Monitor kidney function."),
        
        DrugInteraction(agent1: "Calcium/Iron/Magnesium Supplements", agent2: "Levothyroxine", interactionType: .otcRx, severity: .moderate, mechanismDescription: "Calcium/iron/magnesium bind to levothyroxine → reduced absorption.", clinicalConsequence: "Hypothyroidism symptoms return. TSH increases.", patientCounseling: "Take levothyroxine on empty stomach. Wait 4 hours before taking calcium/iron/magnesium."),
        
        DrugInteraction(agent1: "Fiber Supplements (Psyllium)", agent2: "Levothyroxine / Digoxin", interactionType: .otcRx, severity: .moderate, mechanismDescription: "Fiber binds to drugs in GI tract → reduced absorption.", clinicalConsequence: "Reduced drug effectiveness. TSH increases (levo). Digoxin levels drop.", patientCounseling: "Separate by 2-4 hours. Take levothyroxine first thing in morning, fiber later."),
        
        DrugInteraction(agent1: "Antihistamines (Diphenhydramine)", agent2: "Anticholinergic Drugs (TCAs, Benztropine)", interactionType: .otcRx, severity: .moderate, mechanismDescription: "Additive anticholinergic effects.", clinicalConsequence: "Severe dry mouth, constipation, urinary retention, confusion (especially elderly). FALLS RISK.", patientCounseling: "Avoid combining. Use non-sedating antihistamines (loratadine, cetirizine) instead."),
        
        DrugInteraction(agent1: "Decongestants (Pseudoephedrine, Phenylephrine)", agent2: "Beta-Blockers", interactionType: .otcRx, severity: .moderate, mechanismDescription: "Beta-blockers block beta-mediated vasodilation. Unopposed alpha stimulation from decongestant.", clinicalConsequence: "Severe HYPERTENSION. Reduced beta-blocker effectiveness.", patientCounseling: "Avoid decongestants. Use saline nasal spray or ask MD about alternative."),
        
        // ADDITIONAL HERBAL ↔ RX INTERACTIONS
        DrugInteraction(agent1: "Garlic Supplements", agent2: "Warfarin / Antiplatelet Drugs", interactionType: .herbalRx, severity: .moderate, mechanismDescription: "Garlic has antiplatelet effects → additive bleeding risk.", clinicalConsequence: "Increased bleeding — bruising, nosebleeds. INR may increase.", patientCounseling: "Avoid high-dose garlic supplements while on blood thinners. Small amounts in food OK."),
        
        DrugInteraction(agent1: "Ginseng", agent2: "Warfarin", interactionType: .herbalRx, severity: .moderate, mechanismDescription: "Ginseng can affect warfarin metabolism (mechanism unclear). Effects vary.", clinicalConsequence: "Unpredictable INR changes — either increased bleeding or reduced anticoagulation.", patientCounseling: "Avoid ginseng. If already taking, keep intake consistent and monitor INR closely."),
        
        DrugInteraction(agent1: "Saw Palmetto", agent2: "Antiplatelet / Anticoagulant Drugs", interactionType: .herbalRx, severity: .moderate, mechanismDescription: "Saw palmetto may have antiplatelet effects.", clinicalConsequence: "Increased bleeding risk, especially before surgery.", patientCounseling: "Avoid if on blood thinners. Discontinue 2 weeks before surgery."),
        
        DrugInteraction(agent1: "Kava Kava", agent2: "Benzodiazepines / Sedatives", interactionType: .herbalRx, severity: .major, mechanismDescription: "Additive CNS depression.", clinicalConsequence: "SEVERE SEDATION. Respiratory depression. LIVER TOXICITY (kava alone).", patientCounseling: "NEVER combine kava with sedatives. Kava banned in some countries (liver damage)."),
        
        DrugInteraction(agent1: "Echinacea", agent2: "Immunosuppressants (Tacrolimus, Cyclosporine)", interactionType: .herbalRx, severity: .major, mechanismDescription: "Echinacea stimulates immune system. Counteracts immunosuppression.", clinicalConsequence: "ORGAN REJECTION RISK in transplant patients.", patientCounseling: "NEVER use echinacea after organ transplant. Avoid in autoimmune diseases."),
        
        // ADDITIONAL FOOD ↔ RX INTERACTIONS
        DrugInteraction(agent1: "High-Protein Meals", agent2: "Levodopa", interactionType: .foodRx, severity: .moderate, mechanismDescription: "Levodopa competes with amino acids for absorption.", clinicalConsequence: "Reduced levodopa effectiveness → Parkinson's symptoms worsen (tremor, rigidity).", patientCounseling: "Take levodopa 30 min before meals or 1 hour after. Redistribute protein throughout day."),
        
        DrugInteraction(agent1: "Dairy Products", agent2: "Tetracyclines / Fluoroquinolones", interactionType: .foodRx, severity: .moderate, mechanismDescription: "Calcium in dairy chelates antibiotics → reduced absorption.", clinicalConsequence: "Antibiotic FAILS to reach therapeutic levels → infection not treated.", patientCounseling: "Avoid dairy 2 hours before and 6 hours after antibiotic. OK for doxycycline (less affected)."),
        
        DrugInteraction(agent1: "High-Fat Meals", agent2: "Lipophilic Drugs (Itraconazole, Griseofulvin)", interactionType: .foodRx, severity: .minor, mechanismDescription: "Fat increases absorption of lipophilic drugs.", clinicalConsequence: "INCREASED drug levels → better efficacy but also more side effects.", patientCounseling: "Take with fatty meal for better absorption. Itraconazole: take with food and acidic drink (cola)."),
        
        DrugInteraction(agent1: "Cruciferous Vegetables (Broccoli, Brussels Sprouts)", agent2: "Warfarin", interactionType: .foodRx, severity: .moderate, mechanismDescription: "High vitamin K content counteracts warfarin.", clinicalConsequence: "Reduced anticoagulation → increased clot risk. INR drops.", patientCounseling: "Don't AVOID these foods — keep intake CONSISTENT week to week."),
        
        DrugInteraction(agent1: "Caffeine", agent2: "Theophylline", interactionType: .foodRx, severity: .moderate, mechanismDescription: "Caffeine and theophylline are both methylxanthines. Additive stimulant effects.", clinicalConsequence: "Increased jitteriness, palpitations, insomnia. May increase theophylline toxicity.", patientCounseling: "Limit caffeine intake. No more than 1-2 cups coffee/day while on theophylline."),
        
        // ADDITIONAL RX ↔ RX INTERACTIONS
        DrugInteraction(agent1: "SSRIs", agent2: "Tramadol / Triptans / MAOIs", interactionType: .rxRx, severity: .major, mechanismDescription: "Multiple drugs increase serotonin levels → excessive serotonin activity.", clinicalConsequence: "SEROTONIN SYNDROME — agitation, confusion, hyperthermia, muscle rigidity, seizures, DEATH.", patientCounseling: "NEVER combine these drugs. Wait 2 weeks after stopping MAOI before starting SSRI."),
        
        DrugInteraction(agent1: "Beta-Blockers", agent2: "Diltiazem / Verapamil", interactionType: .rxRx, severity: .major, mechanismDescription: "Both slow heart rate and AV node conduction. Additive effects.", clinicalConsequence: "SEVERE BRADYCARDIA. Heart block. Cardiac arrest.", patientCounseling: "Do NOT combine beta-blockers with non-DHP CCBs. Use DHP CCBs (amlodipine) instead."),
        
        DrugInteraction(agent1: "Warfarin", agent2: "Antibiotics (Fluoroquinolones, Macrolides, Sulfonamides)", interactionType: .rxRx, severity: .major, mechanismDescription: "Antibiotics kill gut bacteria → reduce vitamin K production. Also inhibit warfarin metabolism.", clinicalConsequence: "INR SPIKES → major bleeding risk within 3-7 days.", patientCounseling: "Check INR within 3-5 days of starting antibiotic. May need temporary warfarin dose reduction."),
        
        DrugInteraction(agent1: "Digoxin", agent2: "Amiodarone", interactionType: .rxRx, severity: .major, mechanismDescription: "Amiodarone inhibits P-glycoprotein → reduces digoxin excretion. Also displaces digoxin from tissues.", clinicalConsequence: "Digoxin levels DOUBLE → toxicity (nausea, vision changes, arrhythmias).", patientCounseling: "Reduce digoxin dose by 50% when starting amiodarone. Monitor levels closely."),
        
        DrugInteraction(agent1: "Statins (Simvastatin, Atorvastatin)", agent2: "Macrolide Antibiotics (Clarithromycin, Erythromycin)", interactionType: .rxRx, severity: .major, mechanismDescription: "Macrolides inhibit CYP3A4 → drastically increased statin levels.", clinicalConsequence: "RHABDOMYOLYSIS risk — severe muscle breakdown, myoglobinuria, kidney failure.", patientCounseling: "HOLD statin while on macrolide. Use azithromycin instead (doesn't affect CYP3A4)."),
        
        DrugInteraction(agent1: "ACE Inhibitors / ARBs", agent2: "NSAIDs + Diuretics", interactionType: .rxRx, severity: .major, mechanismDescription: "Triple combination = 'Triple Whammy' for kidneys. All affect renal perfusion.", clinicalConsequence: "ACUTE KIDNEY INJURY. Especially in elderly, dehydrated, or baseline CKD.", patientCounseling: "AVOID this combination. If unavoidable, monitor Cr/K+ closely. Stay well hydrated."),
        
        DrugInteraction(agent1: "Metformin", agent2: "Contrast Dye (IV)", interactionType: .rxRx, severity: .major, mechanismDescription: "Contrast can cause kidney injury. Metformin accumulates if kidneys fail → lactic acidosis.", clinicalConsequence: "LACTIC ACIDOSIS — severe metabolic emergency, can be fatal.", patientCounseling: "HOLD metformin day of and 48 hours after contrast. Check kidney function before restarting."),
        
        DrugInteraction(agent1: "Lithium", agent2: "ACE Inhibitors / ARBs / Diuretics / NSAIDs", interactionType: .rxRx, severity: .major, mechanismDescription: "These drugs reduce lithium excretion → lithium levels increase.", clinicalConsequence: "LITHIUM TOXICITY — tremor, confusion, ataxia, seizures, kidney damage.", patientCounseling: "Monitor lithium levels closely. May need dose reduction. Stay well hydrated. Avoid NSAIDs."),
        
        DrugInteraction(agent1: "Phenytoin", agent2: "Many Drugs (CYP Inducer)", interactionType: .rxRx, severity: .moderate, mechanismDescription: "Phenytoin induces CYP enzymes → increases metabolism of other drugs.", clinicalConsequence: "Reduced effectiveness of: oral contraceptives, warfarin, statins, many others.", patientCounseling: "Use backup contraception. Monitor INR closely. Many drug interactions — check every new med."),
        
        DrugInteraction(agent1: "Proton Pump Inhibitors (Omeprazole)", agent2: "Clopidogrel", interactionType: .rxRx, severity: .moderate, mechanismDescription: "PPIs (especially omeprazole) inhibit CYP2C19 → reduced activation of clopidogrel (prodrug).", clinicalConsequence: "Reduced antiplatelet effect → increased risk of MI, stent thrombosis.", patientCounseling: "Avoid omeprazole/esomeprazole with clopidogrel. Use pantoprazole or H2 blocker (famotidine) instead."),
    ]
