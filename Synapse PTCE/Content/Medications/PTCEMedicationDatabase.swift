//
//  PTCEMedicationDatabase.swift
//  Synapse PTCE
//
//  ⚠️ DEPRECATED - Use MedicationDatabase.swift instead
//  This file references non-existent types and has been disabled
//

/*
 
 THIS FILE HAS BEEN DISABLED TO PREVENT COMPILE ERRORS
 Use MedicationDatabase.swift instead
 
*/

#if false

import Foundation

// MARK: - Drug Stems Database (EXPANDED TO 50+)

struct PTCEDatabase {
    
    static let allStems: [PTCEDrugStem] = [
        
        // CARDIOVASCULAR SYSTEM (12 stems)
        PTCEDrugStem(stem: "-pril", drugClass: "ACE Inhibitor", therapeuticUse: "Hypertension, Heart Failure, Diabetic Nephropathy", examples: ["lisinopril", "enalapril", "ramipril", "benazepril", "quinapril"], keyPoint: "Blocks ACE → lowers BP. Watch for dry cough (bradykinin).", systemAffected: .cardiovascular, pronunciation: "prill", audioFileName: "pril"),
        
        PTCEDrugStem(stem: "-sartan", drugClass: "ARB (Angiotensin Receptor Blocker)", therapeuticUse: "Hypertension, Heart Failure", examples: ["losartan", "valsartan", "olmesartan", "irbesartan", "telmisartan"], keyPoint: "Blocks AT1 receptor. No cough. Same benefits as ACE inhibitors.", systemAffected: .cardiovascular, pronunciation: "sar-tan", audioFileName: "sartan"),
        
        PTCEDrugStem(stem: "-olol", drugClass: "Beta-Blocker", therapeuticUse: "Hypertension, Angina, Post-MI, Heart Failure, Arrhythmias", examples: ["metoprolol", "atenolol", "carvedilol", "propranolol", "bisoprolol", "labetalol"], keyPoint: "Blocks beta receptors → slows heart. Don't stop abruptly (rebound HTN).", systemAffected: .cardiovascular, pronunciation: "oh-lawl", audioFileName: "olol"),
        
        PTCEDrugStem(stem: "-dipine", drugClass: "Dihydropyridine CCB", therapeuticUse: "Hypertension, Angina", examples: ["amlodipine", "nifedipine", "felodipine", "nicardipine"], keyPoint: "Blocks calcium channels → vasodilation. Watch for ankle edema.", systemAffected: .cardiovascular, pronunciation: "dih-peen", audioFileName: "dipine"),
        
        PTCEDrugStem(stem: "-statin", drugClass: "HMG-CoA Reductase Inhibitor", therapeuticUse: "Hyperlipidemia (high cholesterol)", examples: ["atorvastatin", "simvastatin", "rosuvastatin", "pravastatin", "lovastatin"], keyPoint: "Lowers LDL cholesterol. Watch for muscle pain (myopathy). Take at bedtime.", systemAffected: .cardiovascular, pronunciation: "stah-tin", audioFileName: "statin"),
        
        PTCEDrugStem(stem: "-thiazide", drugClass: "Thiazide Diuretic", therapeuticUse: "Hypertension, Edema", examples: ["hydrochlorothiazide", "chlorthalidone", "indapamide"], keyPoint: "Promotes Na+ excretion → lowers BP. Monitor K+ (hypokalemia risk).", systemAffected: .cardiovascular, pronunciation: "thy-ah-zide", audioFileName: "thiazide"),
        
        PTCEDrugStem(stem: "-ide (loop diuretic)", drugClass: "Loop Diuretic", therapeuticUse: "Heart Failure, Edema, Hypertension", examples: ["furosemide", "bumetanide", "torsemide"], keyPoint: "Blocks Na-K-2Cl transporter in Loop of Henle. More potent than thiazides. Risk: hypokalemia, ototoxicity.", systemAffected: .cardiovascular, pronunciation: "seh-mide", audioFileName: "semide"),
        
        PTCEDrugStem(stem: "-afil", drugClass: "PDE-5 Inhibitor", therapeuticUse: "Erectile Dysfunction, Pulmonary Hypertension", examples: ["sildenafil", "tadalafil", "vardenafil"], keyPoint: "Inhibits phosphodiesterase-5 → vasodilation. CONTRAINDICATED with nitrates (severe hypotension).", systemAffected: .cardiovascular, pronunciation: "ah-fill", audioFileName: "afil"),
        
        PTCEDrugStem(stem: "-pine (non-DHP CCB)", drugClass: "Non-Dihydropyridine CCB", therapeuticUse: "Hypertension, Arrhythmias (Afib/Flutter)", examples: ["diltiazem", "verapamil"], keyPoint: "Blocks cardiac calcium channels → slows HR. Do NOT combine with beta-blockers (severe bradycardia risk).", systemAffected: .cardiovascular, pronunciation: "peen", audioFileName: "pine_ccb"),
        
        PTCEDrugStem(stem: "-pril + -sartan combo", drugClass: "ACE/ARB Combination (AVOID)", therapeuticUse: "NONE — Contraindicated Combination", examples: ["lisinopril + losartan"], keyPoint: "NEVER combine ACE + ARB. Increased risk of hyperkalemia, hypotension, renal failure. No added benefit.", systemAffected: .cardiovascular, pronunciation: nil, audioFileName: nil),
        
        PTCEDrugStem(stem: "-terol (cardiac)", drugClass: "Inotrope / Vasopressor", therapeuticUse: "Shock, Cardiac Arrest", examples: ["dobutamine", "isoproterenol"], keyPoint: "Stimulates beta receptors → increases cardiac contractility. Used in ICU/ER settings.", systemAffected: .cardiovascular, pronunciation: "ter-awl", audioFileName: "terol_cardiac"),
        
        PTCEDrugStem(stem: "-gilol", drugClass: "Combined Alpha/Beta Blocker", therapeuticUse: "Hypertension", examples: ["carvedilol", "labetalol"], keyPoint: "Blocks both alpha and beta receptors → lowers BP and HR. Used in heart failure and hypertensive emergencies.", systemAffected: .cardiovascular, pronunciation: "jih-lawl", audioFileName: "gilol"),
        
        // ENDOCRINE SYSTEM (10 stems)
        PTCEDrugStem(stem: "-gliptin", drugClass: "DPP-4 Inhibitor", therapeuticUse: "Type 2 Diabetes", examples: ["sitagliptin", "linagliptin", "saxagliptin", "alogliptin"], keyPoint: "Increases incretin → enhances insulin, suppresses glucagon. Weight-neutral. Low hypoglycemia risk.", systemAffected: .endocrine, pronunciation: "glip-tin", audioFileName: "gliptin"),
        
        PTCEDrugStem(stem: "-gliflozin", drugClass: "SGLT-2 Inhibitor", therapeuticUse: "Type 2 Diabetes, Heart Failure", examples: ["empagliflozin", "canagliflozin", "dapagliflozin", "ertugliflozin"], keyPoint: "Blocks glucose reabsorption in kidneys → glucose in urine. Watch for UTI/genital yeast infections.", systemAffected: .endocrine, pronunciation: "glih-flow-zin", audioFileName: "gliflozin"),
        
        PTCEDrugStem(stem: "-glitazone", drugClass: "Thiazolidinedione (TZD)", therapeuticUse: "Type 2 Diabetes", examples: ["pioglitazone", "rosiglitazone"], keyPoint: "Increases insulin sensitivity. WARNING: Fluid retention, weight gain, heart failure risk. BLACK BOX: bladder cancer (pioglitazone).", systemAffected: .endocrine, pronunciation: "glih-tah-zone", audioFileName: "glitazone"),
        
        PTCEDrugStem(stem: "gly-", drugClass: "Sulfonylurea", therapeuticUse: "Type 2 Diabetes", examples: ["glyburide", "glipizide", "glimepiride"], keyPoint: "Stimulates pancreatic insulin release. CAUTION: Hypoglycemia risk, especially in elderly. Take 30 min before meals.", systemAffected: .endocrine, pronunciation: "gly", audioFileName: "gly"),
        
        PTCEDrugStem(stem: "-glutide", drugClass: "GLP-1 Receptor Agonist", therapeuticUse: "Type 2 Diabetes, Weight Loss", examples: ["liraglutide", "semaglutide", "dulaglutide", "exenatide"], keyPoint: "Mimics incretin → insulin release, slows gastric emptying. Injectable. Weight loss benefit. GI side effects common.", systemAffected: .endocrine, pronunciation: "gloo-tide", audioFileName: "glutide"),
        
        PTCEDrugStem(stem: "-roid", drugClass: "Corticosteroid", therapeuticUse: "Inflammation, Autoimmune, Asthma, Allergies", examples: ["prednisone", "methylprednisolone", "dexamethasone", "hydrocortisone"], keyPoint: "Suppresses immune system. Taper when discontinuing (don't stop abruptly). Long-term: osteoporosis, hyperglycemia, immunosuppression.", systemAffected: .endocrine, pronunciation: "roy-d", audioFileName: "roid"),
        
        PTCEDrugStem(stem: "-thiouracil / -mazole", drugClass: "Antithyroid Agent", therapeuticUse: "Hyperthyroidism", examples: ["propylthiouracil", "methimazole"], keyPoint: "Blocks thyroid hormone synthesis. Monitor for agranulocytosis (severe WBC drop). Pregnancy: PTU preferred (1st trimester).", systemAffected: .endocrine, pronunciation: "thy-oh-yur-ah-sill / mah-zole", audioFileName: "antithyroid"),
        
        PTCEDrugStem(stem: "-tropin", drugClass: "Growth Hormone / Hormone Analog", therapeuticUse: "Growth Hormone Deficiency, Fertility", examples: ["somatropin", "follitropin", "menotropin"], keyPoint: "Hormone replacement therapy. Injectable. Refrigerate. Various endocrine uses.", systemAffected: .endocrine, pronunciation: "troh-pin", audioFileName: "tropin"),
        
        PTCEDrugStem(stem: "-formin", drugClass: "Biguanide", therapeuticUse: "Type 2 Diabetes", examples: ["metformin"], keyPoint: "Decreases hepatic glucose production. First-line for T2DM. CONTRAINDICATED if eGFR < 30 (lactic acidosis risk). Hold before contrast procedures.", systemAffected: .endocrine, pronunciation: "for-min", audioFileName: "formin"),
        
        PTCEDrugStem(stem: "-glycerin", drugClass: "Alpha-Glucosidase Inhibitor", therapeuticUse: "Type 2 Diabetes", examples: ["acarbose", "miglitol"], keyPoint: "Delays carbohydrate absorption in gut. Take with first bite of meal. GI side effects (flatulence, diarrhea) common.", systemAffected: .endocrine, pronunciation: "gliss-er-in", audioFileName: "glycerin"),
        
        // GASTROINTESTINAL SYSTEM (6 stems)
        PTCEDrugStem(stem: "-prazole", drugClass: "Proton Pump Inhibitor (PPI)", therapeuticUse: "GERD, Peptic Ulcer, H. pylori Eradication", examples: ["omeprazole", "pantoprazole", "esomeprazole", "lansoprazole", "rabeprazole"], keyPoint: "Blocks gastric acid pumps. Take 30-60 min before meals. Long-term: fracture risk, B12 deficiency, C. diff risk.", systemAffected: .gastrointestinal, pronunciation: "pray-zole", audioFileName: "prazole"),
        
        PTCEDrugStem(stem: "-tidine", drugClass: "H2 Receptor Antagonist", therapeuticUse: "GERD, Peptic Ulcer", examples: ["famotidine", "nizatidine", "cimetidine"], keyPoint: "Blocks H2 receptors → reduces acid. Weaker than PPIs. Ranitidine recalled (NDMA contamination).", systemAffected: .gastrointestinal, pronunciation: "tih-deen", audioFileName: "tidine"),
        
        PTCEDrugStem(stem: "-setron", drugClass: "5-HT3 Antagonist (Antiemetic)", therapeuticUse: "Chemotherapy-Induced Nausea, Postoperative Nausea", examples: ["ondansetron", "granisetron", "palonosetron"], keyPoint: "Blocks serotonin receptors in gut/brain → prevents nausea. Watch for QT prolongation (especially ondansetron).", systemAffected: .gastrointestinal, pronunciation: "seh-tron", audioFileName: "setron"),
        
        PTCEDrugStem(stem: "-mab (GI biologic)", drugClass: "Monoclonal Antibody (GI)", therapeuticUse: "Crohn's Disease, Ulcerative Colitis", examples: ["infliximab", "adalimumab", "vedolizumab"], keyPoint: "Biologic therapy for IBD. Injectable. Immunosuppression risk. Screen for TB before starting.", systemAffected: .gastrointestinal, pronunciation: "mab", audioFileName: "mab_gi"),
        
        PTCEDrugStem(stem: "-statin (bile acid)", drugClass: "Bile Acid Sequestrant", therapeuticUse: "Hyperlipidemia, Cholesterol", examples: ["cholestyramine", "colesevelam", "colestipol"], keyPoint: "Binds bile acids in gut → prevents reabsorption. Take other meds 1-4 hours before/after. GI side effects common.", systemAffected: .gastrointestinal, pronunciation: "stah-tin", audioFileName: "statin_bile"),
        
        PTCEDrugStem(stem: "-zine (antiemetic)", drugClass: "Phenothiazine Antiemetic", therapeuticUse: "Nausea, Vomiting", examples: ["prochlorperazine", "promethazine"], keyPoint: "Blocks dopamine receptors. Watch for extrapyramidal symptoms (EPS), sedation. Promethazine BLACK BOX: respiratory depression in children < 2.", systemAffected: .gastrointestinal, pronunciation: "zeen", audioFileName: "zine_antiemetic"),
        
        // CENTRAL NERVOUS SYSTEM (12 stems)
        PTCEDrugStem(stem: "-pam / -lam", drugClass: "Benzodiazepine", therapeuticUse: "Anxiety, Insomnia, Seizures, Muscle Spasm", examples: ["diazepam", "lorazepam", "alprazolam", "clonazepam", "temazepam", "midazolam"], keyPoint: "Enhances GABA. CONTROLLED C-IV. Risk: dependence, respiratory depression. Flumazenil reverses overdose.", systemAffected: .centralNervous, pronunciation: "pam / lam", audioFileName: "benzos"),
        
        PTCEDrugStem(stem: "-pine (atypical antipsychotic)", drugClass: "Atypical Antipsychotic", therapeuticUse: "Schizophrenia, Bipolar Disorder", examples: ["quetiapine", "olanzapine", "risperidone", "aripiprazole", "ziprasidone", "clozapine"], keyPoint: "Blocks D2 + 5-HT2A. Watch for metabolic syndrome, weight gain. Clozapine: agranulocytosis risk (REMS).", systemAffected: .centralNervous, pronunciation: "peen", audioFileName: "pine_antipsychotic"),
        
        PTCEDrugStem(stem: "-etine", drugClass: "SSRI (Selective Serotonin Reuptake Inhibitor)", therapeuticUse: "Depression, Anxiety, OCD", examples: ["fluoxetine", "sertraline", "paroxetine", "citalopram", "escitalopram"], keyPoint: "Blocks serotonin reuptake. Takes 4-6 weeks for full effect. Don't stop abruptly (discontinuation syndrome). BLACK BOX: increased suicide risk < 25 y/o.", systemAffected: .centralNervous, pronunciation: "eh-teen", audioFileName: "etine"),
        
        PTCEDrugStem(stem: "-triptyline", drugClass: "Tricyclic Antidepressant (TCA)", therapeuticUse: "Depression, Neuropathic Pain", examples: ["amitriptyline", "nortriptyline", "doxepin"], keyPoint: "Blocks serotonin + norepinephrine reuptake. Anticholinergic side effects (dry mouth, constipation, urinary retention). OVERDOSE: cardiac arrhythmias.", systemAffected: .centralNervous, pronunciation: "trip-tih-leen", audioFileName: "triptyline"),
        
        PTCEDrugStem(stem: "-venlafaxine / -duloxetine", drugClass: "SNRI (Serotonin-Norepinephrine Reuptake Inhibitor)", therapeuticUse: "Depression, Anxiety, Neuropathic Pain", examples: ["venlafaxine", "duloxetine", "desvenlafaxine"], keyPoint: "Blocks serotonin + norepinephrine reuptake. Used for depression AND chronic pain. Monitor BP (can increase).", systemAffected: .centralNervous, pronunciation: "ven-lah-fax-een / doo-lox-eh-teen", audioFileName: "snri"),
        
        PTCEDrugStem(stem: "-ine (stimulant)", drugClass: "CNS Stimulant (ADHD)", therapeuticUse: "ADHD, Narcolepsy", examples: ["methylphenidate", "dextroamphetamine", "lisdexamfetamine", "amphetamine"], keyPoint: "Increases dopamine/norepinephrine. CONTROLLED C-II. Risk: abuse, cardiovascular events. Screen for heart conditions before starting.", systemAffected: .centralNervous, pronunciation: "een", audioFileName: "stimulant"),
        
        PTCEDrugStem(stem: "-done (opioid)", drugClass: "Opioid Analgesic", therapeuticUse: "Moderate to Severe Pain", examples: ["hydrocodone", "oxycodone", "methadone", "tramadone"], keyPoint: "Binds opioid receptors. CONTROLLED C-II (except tramadol = C-IV). Risk: respiratory depression, addiction. Naloxone reverses overdose.", systemAffected: .centralNervous, pronunciation: "dohn", audioFileName: "done_opioid"),
        
        PTCEDrugStem(stem: "-morphine", drugClass: "Opioid Analgesic", therapeuticUse: "Severe Pain", examples: ["morphine", "hydromorphone", "oxymorphone"], keyPoint: "Strong opioid. CONTROLLED C-II. Use in cancer pain, post-surgical pain. Naloxone reverses overdose.", systemAffected: .centralNervous, pronunciation: "mor-feen", audioFileName: "morphine"),
        
        PTCEDrugStem(stem: "-triptan", drugClass: "Serotonin Agonist (Migraine)", therapeuticUse: "Migraine Headache (Acute Treatment)", examples: ["sumatriptan", "rizatriptan", "eletriptan", "zolmitriptan"], keyPoint: "Stimulates 5-HT1 receptors → vasoconstriction. CONTRAINDICATED in coronary artery disease. Do NOT combine with ergots or MAOIs.", systemAffected: .centralNervous, pronunciation: "trip-tan", audioFileName: "triptan"),
        
        PTCEDrugStem(stem: "-barb", drugClass: "Barbiturate", therapeuticUse: "Seizures, Anesthesia", examples: ["phenobarbital", "pentobarbital"], keyPoint: "Enhances GABA. CONTROLLED C-II to C-IV. Narrow therapeutic index. Enzyme inducer (many drug interactions).", systemAffected: .centralNervous, pronunciation: "barb", audioFileName: "barb"),
        
        PTCEDrugStem(stem: "-carbamazepine / -oxcarbazepine", drugClass: "Anticonvulsant", therapeuticUse: "Seizures, Trigeminal Neuralgia, Bipolar Disorder", examples: ["carbamazepine", "oxcarbazepine"], keyPoint: "Blocks sodium channels. BLACK BOX: serious skin reactions (SJS/TEN) — screen for HLA-B*1502 in Asians. NTI — monitor levels.", systemAffected: .centralNervous, pronunciation: "car-bah-maz-eh-peen", audioFileName: "carbamazepine"),
        
        PTCEDrugStem(stem: "-racetam", drugClass: "Anticonvulsant", therapeuticUse: "Seizures", examples: ["levetiracetam", "brivaracetam"], keyPoint: "Modulates neurotransmitter release. Well-tolerated. No significant drug interactions. Psychiatric side effects (irritability, depression) possible.", systemAffected: .centralNervous, pronunciation: "rass-eh-tam", audioFileName: "racetam"),
        
        // (Database continues in next file due to length...)
    ]
}

#endif
