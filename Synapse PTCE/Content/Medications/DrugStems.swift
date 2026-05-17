//
//  DrugStems.swift
//  Synapse PTCE
//
//  ⚠️ DEPRECATED - This file is no longer used
//  Data moved to MedicationDatabase.swift
//  Type definitions and extensions are in MedicationDataModels.swift
//

/*
 THIS FILE HAS BEEN DISABLED
 
 The drug stems data is now in: MedicationDatabase.swift (as allDrugStems)
 The DrugStem type and extensions are in: MedicationDataModels.swift
 
 This file can be deleted from the project.
*/

#if false

import Foundation
import SwiftUI

// MARK: - Stem Database
// Note: Type definitions are in MedicationDataModels.swift
// Extension methods (allStems, stems(for:)) are also in MedicationDataModels.swift

// This array is referenced by the extension in MedicationDataModels.swift
let drugStemsData: [DrugStem] = [
        
        // MARK: — CARDIOVASCULAR SYSTEM
        
        DrugStem(
            stem: "-pril",
            drugClass: "ACE Inhibitor",
            therapeuticUse: "Hypertension, Heart Failure, Diabetic Nephropathy",
            examples: ["lisinopril", "enalapril", "ramipril", "benazepril"],
            keyPoint: "Blocks Angiotensin-Converting Enzyme → lowers BP. Watch for dry cough (bradykinin).",
            systemAffected: .cardiovascular
        ),
        
        DrugStem(
            stem: "-sartan",
            drugClass: "ARB (Angiotensin Receptor Blocker)",
            therapeuticUse: "Hypertension, Heart Failure (alternative to ACE inhibitors)",
            examples: ["losartan", "valsartan", "olmesartan", "irbesartan"],
            keyPoint: "Blocks AT1 receptor. No cough (doesn't affect bradykinin). Same benefits as ACE inhibitors.",
            systemAffected: .cardiovascular
        ),
        
        DrugStem(
            stem: "-olol",
            drugClass: "Beta-Blocker",
            therapeuticUse: "Hypertension, Angina, Post-MI, Heart Failure, Arrhythmias",
            examples: ["metoprolol", "atenolol", "carvedilol", "propranolol"],
            keyPoint: "Blocks beta receptors → slows heart rate, reduces BP. Don't stop abruptly (rebound HTN).",
            systemAffected: .cardiovascular
        ),
        
        DrugStem(
            stem: "-dipine",
            drugClass: "Dihydropyridine Calcium Channel Blocker",
            therapeuticUse: "Hypertension, Angina",
            examples: ["amlodipine", "nifedipine", "felodipine"],
            keyPoint: "Blocks calcium in vascular smooth muscle → vasodilation. Watch for peripheral edema.",
            systemAffected: .cardiovascular
        ),
        
        DrugStem(
            stem: "-statin",
            drugClass: "HMG-CoA Reductase Inhibitor",
            therapeuticUse: "Hyperlipidemia (high cholesterol)",
            examples: ["atorvastatin", "simvastatin", "rosuvastatin", "pravastatin"],
            keyPoint: "Lowers LDL cholesterol. Watch for muscle pain (myopathy) and elevated liver enzymes.",
            systemAffected: .cardiovascular
        ),
        
        DrugStem(
            stem: "-thiazide",
            drugClass: "Thiazide Diuretic",
            therapeuticUse: "Hypertension, Edema",
            examples: ["hydrochlorothiazide (HCTZ)", "chlorthalidone"],
            keyPoint: "Promotes sodium/water excretion → lowers BP. Monitor potassium (hypokalemia risk).",
            systemAffected: .cardiovascular
        ),
        
        // MARK: — ENDOCRINE SYSTEM
        
        DrugStem(
            stem: "-gliptin",
            drugClass: "DPP-4 Inhibitor",
            therapeuticUse: "Type 2 Diabetes",
            examples: ["sitagliptin", "linagliptin", "saxagliptin"],
            keyPoint: "Increases incretin levels → enhances insulin, suppresses glucagon. Weight-neutral.",
            systemAffected: .endocrine
        ),
        
        DrugStem(
            stem: "-gliflozin",
            drugClass: "SGLT-2 Inhibitor",
            therapeuticUse: "Type 2 Diabetes, Heart Failure",
            examples: ["empagliflozin", "canagliflozin", "dapagliflozin"],
            keyPoint: "Blocks glucose reabsorption in kidneys → glucose in urine. Watch for UTI/genital yeast infections.",
            systemAffected: .endocrine
        ),
        
        DrugStem(
            stem: "-glitazone",
            drugClass: "Thiazolidinedione (TZD)",
            therapeuticUse: "Type 2 Diabetes",
            examples: ["pioglitazone", "rosiglitazone"],
            keyPoint: "Increases insulin sensitivity. WARNING: Fluid retention, weight gain, heart failure risk.",
            systemAffected: .endocrine
        ),
        
        DrugStem(
            stem: "gly-",
            drugClass: "Sulfonylurea",
            therapeuticUse: "Type 2 Diabetes",
            examples: ["glyburide", "glipizide", "glimepiride"],
            keyPoint: "Stimulates pancreatic insulin release. CAUTION: Hypoglycemia risk, especially in elderly.",
            systemAffected: .endocrine
        ),
        
        // MARK: — GASTROINTESTINAL SYSTEM
        
        DrugStem(
            stem: "-prazole",
            drugClass: "Proton Pump Inhibitor (PPI)",
            therapeuticUse: "GERD, Peptic Ulcer, H. pylori Eradication",
            examples: ["omeprazole", "pantoprazole", "esomeprazole", "lansoprazole"],
            keyPoint: "Blocks gastric acid pumps → strongest acid suppression. Long-term use: ↑ fracture, B12 deficiency risk.",
            systemAffected: .gastrointestinal
        ),
        
        DrugStem(
            stem: "-tidine",
            drugClass: "H2 Receptor Antagonist",
            therapeuticUse: "GERD, Peptic Ulcer (weaker than PPIs)",
            examples: ["ranitidine (recalled)", "famotidine", "cimetidine"],
            keyPoint: "Blocks histamine at H2 receptors → reduces acid. Famotidine now preferred (ranitidine recalled).",
            systemAffected: .gastrointestinal
        ),
        
        // MARK: — CENTRAL NERVOUS SYSTEM
        
        DrugStem(
            stem: "-pam / -lam",
            drugClass: "Benzodiazepine",
            therapeuticUse: "Anxiety, Insomnia, Seizures, Muscle Spasm",
            examples: ["diazepam", "lorazepam", "alprazolam", "clonazepam"],
            keyPoint: "Enhances GABA → CNS depression. CONTROLLED C-IV. Risk: dependence, respiratory depression.",
            systemAffected: .centralNervous
        ),
        
        DrugStem(
            stem: "-pine (atypical antipsychotic)",
            drugClass: "Atypical Antipsychotic",
            therapeuticUse: "Schizophrenia, Bipolar Disorder",
            examples: ["quetiapine", "olanzapine", "risperidone", "aripiprazole"],
            keyPoint: "Blocks dopamine D2 + serotonin 5-HT2A. Watch for metabolic syndrome, weight gain.",
            systemAffected: .centralNervous
        ),
        
        DrugStem(
            stem: "-etine",
            drugClass: "SSRI (Selective Serotonin Reuptake Inhibitor)",
            therapeuticUse: "Depression, Anxiety Disorders, OCD",
            examples: ["fluoxetine", "sertraline", "paroxetine", "citalopram"],
            keyPoint: "Blocks serotonin reuptake. Takes 4–6 weeks for full effect. Don't stop abruptly.",
            systemAffected: .centralNervous
        ),
        
        // MARK: — RESPIRATORY SYSTEM
        
        DrugStem(
            stem: "-terol",
            drugClass: "Beta-2 Agonist (Bronchodilator)",
            therapeuticUse: "Asthma, COPD",
            examples: ["albuterol (short-acting)", "salmeterol (long-acting)", "formoterol"],
            keyPoint: "Relaxes bronchial smooth muscle → opens airways. Albuterol = rescue inhaler.",
            systemAffected: .respiratory
        ),
        
        // MARK: — IMMUNE SYSTEM & INFECTION
        
        DrugStem(
            stem: "-cillin",
            drugClass: "Penicillin Antibiotic",
            therapeuticUse: "Bacterial Infections",
            examples: ["amoxicillin", "penicillin", "ampicillin"],
            keyPoint: "Inhibits bacterial cell wall synthesis. ALLERGY WARNING: cross-reactivity in penicillin class.",
            systemAffected: .immune
        ),
        
        DrugStem(
            stem: "-cycline",
            drugClass: "Tetracycline Antibiotic",
            therapeuticUse: "Bacterial Infections, Acne",
            examples: ["doxycycline", "tetracycline", "minocycline"],
            keyPoint: "Inhibits bacterial protein synthesis. AVOID: pregnancy, children < 8 (tooth staining).",
            systemAffected: .immune
        ),
        
        DrugStem(
            stem: "-mycin",
            drugClass: "Macrolide Antibiotic",
            therapeuticUse: "Bacterial Infections (respiratory, skin)",
            examples: ["azithromycin", "erythromycin", "clarithromycin"],
            keyPoint: "Inhibits protein synthesis. Alternative for penicillin-allergic patients. Watch for QT prolongation.",
            systemAffected: .immune
        ),
        
        DrugStem(
            stem: "-floxacin",
            drugClass: "Fluoroquinolone Antibiotic",
            therapeuticUse: "UTI, Respiratory Infections",
            examples: ["ciprofloxacin", "levofloxacin", "moxifloxacin"],
            keyPoint: "Inhibits DNA gyrase. BLACK BOX: tendon rupture, peripheral neuropathy. AVOID in children.",
            systemAffected: .immune
        ),
        
        DrugStem(
            stem: "-azole (antifungal)",
            drugClass: "Azole Antifungal",
            therapeuticUse: "Fungal Infections (systemic & topical)",
            examples: ["fluconazole", "ketoconazole", "itraconazole"],
            keyPoint: "Inhibits ergosterol synthesis in fungal cell membrane. Watch for liver toxicity, drug interactions.",
            systemAffected: .immune
        ),
        
        DrugStem(
            stem: "-vir",
            drugClass: "Antiviral",
            therapeuticUse: "Viral Infections (HIV, Herpes, Influenza)",
            examples: ["acyclovir", "valacyclovir", "oseltamivir"],
            keyPoint: "Mechanism varies by drug. Acyclovir = herpes. Oseltamivir = influenza (Tamiflu).",
            systemAffected: .immune
        ),
        
        // MARK: — HEMATOLOGIC SYSTEM
        
        DrugStem(
            stem: "-arin",
            drugClass: "Anticoagulant",
            therapeuticUse: "DVT, PE, Afib (stroke prevention)",
            examples: ["warfarin", "heparin"],
            keyPoint: "Warfarin = Vitamin K antagonist. Monitor INR. MANY drug/food interactions. Narrow therapeutic index.",
            systemAffected: .hematologic
        ),
        
        DrugStem(
            stem: "-xaban",
            drugClass: "Direct Oral Anticoagulant (DOAC) — Factor Xa Inhibitor",
            therapeuticUse: "DVT, PE, Afib (stroke prevention)",
            examples: ["rivaroxaban", "apixaban", "edoxaban"],
            keyPoint: "No INR monitoring needed. Fixed dosing. Safer than warfarin for many patients.",
            systemAffected: .hematologic
        ),
        
        // MARK: — MUSCULOSKELETAL SYSTEM
        
        DrugStem(
            stem: "-profen / -fenac",
            drugClass: "NSAID (Non-Steroidal Anti-Inflammatory Drug)",
            therapeuticUse: "Pain, Inflammation, Fever",
            examples: ["ibuprofen", "naproxen", "diclofenac"],
            keyPoint: "Blocks COX enzymes → reduces prostaglandins. RISK: GI bleeding, renal impairment, CV events.",
            systemAffected: .musculoskeletal
        ),
        
    ]

#endif
