//
//  HighRiskMedications.swift
//  Synapse PTCE
//
//  ⚠️ DEPRECATED - This file is no longer used
//  Data moved to MedicationDatabase.swift
//  Type definitions and extensions are in MedicationDataModels.swift
//

/*
 THIS FILE HAS BEEN DISABLED
 
 The high-risk medication data is now in: MedicationDatabase.swift (as allHighRiskMedications)
 The HighRiskMedication type and extensions are in: MedicationDataModels.swift
 
 This file can be deleted from the project.
*/

#if false

import Foundation
import SwiftUI

// MARK: - High Risk Medication Database

extension HighRiskMedication {
    
    static let allHighRiskMeds: [HighRiskMedication] = [
        
        // MARK: — NARROW THERAPEUTIC INDEX (NTI)
        
        HighRiskMedication(
            genericName: "Warfarin",
            brandName: "Coumadin",
            category: .narrowTherapeuticIndex,
            drugClass: "Anticoagulant (Vitamin K Antagonist)",
            therapeuticUse: "DVT, PE, Atrial Fibrillation (stroke prevention)",
            riskDescription: "Too little = clot risk. Too much = life-threatening bleeding. Affected by diet (vitamin K), alcohol, and MANY drug interactions.",
            monitoringRequired: "INR (International Normalized Ratio) — target usually 2.0–3.0",
            keyPoint: "NARROW THERAPEUTIC INDEX. Monitor INR regularly. Educate on vitamin K foods (leafy greens)."
        ),
        
        HighRiskMedication(
            genericName: "Digoxin",
            brandName: "Lanoxin",
            category: .narrowTherapeuticIndex,
            drugClass: "Cardiac Glycoside",
            therapeuticUse: "Heart Failure, Atrial Fibrillation (rate control)",
            riskDescription: "Toxicity causes nausea, vision changes (yellow/green halos), arrhythmias. Worsened by low potassium.",
            monitoringRequired: "Digoxin levels (0.5–2.0 ng/mL), potassium, renal function",
            keyPoint: "NTI. Hold if pulse < 60 bpm. Hypokalemia increases toxicity risk."
        ),
        
        HighRiskMedication(
            genericName: "Levothyroxine",
            brandName: "Synthroid, Levoxyl",
            category: .narrowTherapeuticIndex,
            drugClass: "Thyroid Hormone Replacement",
            therapeuticUse: "Hypothyroidism",
            riskDescription: "Small dose changes cause big clinical effects. Too much = hyperthyroid (tachycardia, tremor). Too little = fatigue, weight gain.",
            monitoringRequired: "TSH (Thyroid Stimulating Hormone) levels",
            keyPoint: "NTI. Take on empty stomach. Don't switch brands without MD approval (bioavailability varies)."
        ),
        
        HighRiskMedication(
            genericName: "Lithium",
            brandName: "Lithobid",
            category: .narrowTherapeuticIndex,
            drugClass: "Mood Stabilizer",
            therapeuticUse: "Bipolar Disorder",
            riskDescription: "Toxicity causes tremor, confusion, seizures, renal damage. Dehydration and NSAIDs increase levels.",
            monitoringRequired: "Lithium levels (0.6–1.2 mEq/L), renal function, thyroid function",
            keyPoint: "NTI. Maintain hydration. Avoid NSAIDs. Monitor for tremor."
        ),
        
        HighRiskMedication(
            genericName: "Phenytoin",
            brandName: "Dilantin",
            category: .narrowTherapeuticIndex,
            drugClass: "Antiepileptic Drug (AED)",
            therapeuticUse: "Seizures",
            riskDescription: "Nonlinear kinetics — small dose increases can cause large level jumps. Toxicity = nystagmus, ataxia, confusion.",
            monitoringRequired: "Phenytoin levels (10–20 mcg/mL), complete blood count (CBC)",
            keyPoint: "NTI. Many drug interactions (CYP enzyme inducer). Causes gingival hyperplasia."
        ),
        
        HighRiskMedication(
            genericName: "Carbamazepine",
            brandName: "Tegretol",
            category: .narrowTherapeuticIndex,
            drugClass: "Antiepileptic Drug (AED)",
            therapeuticUse: "Seizures, Trigeminal Neuralgia, Bipolar Disorder",
            riskDescription: "Risk of serious blood disorders (aplastic anemia), liver toxicity, hyponatremia.",
            monitoringRequired: "Carbamazepine levels (4–12 mcg/mL), CBC, liver function tests, sodium",
            keyPoint: "NTI. BLACK BOX WARNING: Serious skin reactions (SJS/TEN) — screen for HLA-B*1502 in Asians."
        ),
        
        HighRiskMedication(
            genericName: "Theophylline",
            brandName: "Theo-24, Elixophyllin",
            category: .narrowTherapeuticIndex,
            drugClass: "Methylxanthine Bronchodilator",
            therapeuticUse: "Asthma, COPD",
            riskDescription: "Toxicity causes nausea, seizures, arrhythmias. Smoking, fever, and many drugs affect levels.",
            monitoringRequired: "Theophylline levels (5–15 mcg/mL)",
            keyPoint: "NTI. Rarely used now (better alternatives exist). Smoking INCREASES clearance (lowers levels)."
        ),
        
        // MARK: — HIGH-ALERT MEDICATIONS (ISMP)
        
        HighRiskMedication(
            genericName: "Insulin (all types)",
            brandName: "Humalog, Novolog, Lantus, etc.",
            category: .highAlert,
            drugClass: "Antidiabetic Hormone",
            therapeuticUse: "Type 1 & Type 2 Diabetes",
            riskDescription: "Dosing errors cause severe hypoglycemia → seizures, coma, death. Confusing formulations (rapid vs. long-acting).",
            monitoringRequired: "Blood glucose, A1C",
            keyPoint: "HIGH-ALERT. Always use insulin syringes. Never abbreviate 'units' as 'U' (looks like '0')."
        ),
        
        HighRiskMedication(
            genericName: "Heparin (IV)",
            brandName: "Generic",
            category: .highAlert,
            drugClass: "Anticoagulant",
            therapeuticUse: "DVT/PE Treatment, ACS, Stroke Prevention",
            riskDescription: "IV dosing errors cause massive bleeding. Confusion with heparin flushes vs. therapeutic doses.",
            monitoringRequired: "aPTT (activated Partial Thromboplastin Time), platelet count (HIT risk)",
            keyPoint: "HIGH-ALERT. Double-check dose with another RN/RPh. Watch for Heparin-Induced Thrombocytopenia (HIT)."
        ),
        
        HighRiskMedication(
            genericName: "Potassium Chloride (IV)",
            brandName: "Generic",
            category: .highAlert,
            drugClass: "Electrolyte Replacement",
            therapeuticUse: "Hypokalemia",
            riskDescription: "IV push or rapid infusion causes cardiac arrest. NEVER give IV push.",
            monitoringRequired: "Serum potassium, ECG if infusing >10 mEq/hr",
            keyPoint: "HIGH-ALERT. Must be DILUTED. Maximum concentration: 40 mEq/L peripheral, 80 mEq/L central line."
        ),
        
        HighRiskMedication(
            genericName: "Opioid Analgesics",
            brandName: "Morphine, Fentanyl, Oxycodone, Hydrocodone, etc.",
            category: .highAlert,
            drugClass: "Opioid Analgesics",
            therapeuticUse: "Moderate to Severe Pain",
            riskDescription: "Overdose causes respiratory depression, death. High abuse potential. CONTROLLED C-II.",
            monitoringRequired: "Respiratory rate, sedation level, pain score",
            keyPoint: "HIGH-ALERT. Have naloxone (Narcan) available as reversal agent. Screen PDMP before dispensing."
        ),
        
        HighRiskMedication(
            genericName: "Methotrexate",
            brandName: "Rheumatrex, Trexall",
            category: .highAlert,
            drugClass: "Antimetabolite (Folate Antagonist)",
            therapeuticUse: "Cancer, Rheumatoid Arthritis, Psoriasis",
            riskDescription: "For RA/psoriasis: dosed ONCE WEEKLY. Daily dosing by mistake = severe toxicity/death. Also causes liver damage, immunosuppression.",
            monitoringRequired: "CBC, liver function tests, renal function",
            keyPoint: "HIGH-ALERT. Weekly dosing for RA. Daily dosing for cancer. VERIFY indication before dispensing."
        ),
        
        HighRiskMedication(
            genericName: "Chemotherapy Agents (general)",
            brandName: "Various",
            category: .highAlert,
            drugClass: "Antineoplastic Agents",
            therapeuticUse: "Cancer Treatment",
            riskDescription: "Overdose = severe toxicity, death. Underdose = treatment failure. Many are vesicants (tissue damage).",
            monitoringRequired: "CBC, organ function based on agent",
            keyPoint: "HIGH-ALERT. Requires specialized training. Verify dosing with BSA (body surface area) calculations."
        ),
        
        // MARK: — REMS PROGRAMS
        
        HighRiskMedication(
            genericName: "Isotretinoin",
            brandName: "Accutane (discontinued), Absorica, Zenatane",
            category: .rems,
            drugClass: "Retinoid (Vitamin A Derivative)",
            therapeuticUse: "Severe Acne",
            riskDescription: "SEVERE BIRTH DEFECTS (Category X). Requires iPLEDGE program — patients must use 2 forms of contraception, monthly pregnancy tests.",
            monitoringRequired: "Pregnancy test monthly, liver function tests, lipid panel",
            keyPoint: "REMS: iPLEDGE program. Absolute contraindication in pregnancy. Patients must be counseled extensively."
        ),
        
        HighRiskMedication(
            genericName: "Clozapine",
            brandName: "Clozaril, FazaClo",
            category: .rems,
            drugClass: "Atypical Antipsychotic",
            therapeuticUse: "Treatment-Resistant Schizophrenia",
            riskDescription: "Can cause AGRANULOCYTOSIS (severe drop in white blood cells → fatal infections). Requires weekly/biweekly blood monitoring.",
            monitoringRequired: "Absolute Neutrophil Count (ANC) — weekly for 6 months, then biweekly",
            keyPoint: "REMS: Clozapine Risk Evaluation and Mitigation Strategy. Cannot dispense without valid ANC result."
        ),
        
        HighRiskMedication(
            genericName: "Lenalidomide",
            brandName: "Revlimid",
            category: .rems,
            drugClass: "Immunomodulator",
            therapeuticUse: "Multiple Myeloma, Myelodysplastic Syndrome",
            riskDescription: "SEVERE BIRTH DEFECTS (analog of thalidomide). Requires Revlimid REMS program.",
            monitoringRequired: "Pregnancy test, CBC",
            keyPoint: "REMS: Revlimid REMS. Male and female patients must follow strict contraception requirements."
        ),
        
        HighRiskMedication(
            genericName: "Fentanyl Transdermal",
            brandName: "Duragesic",
            category: .rems,
            drugClass: "Opioid Analgesic",
            therapeuticUse: "Chronic Severe Pain (opioid-tolerant patients ONLY)",
            riskDescription: "ONLY for opioid-tolerant patients. Use in opioid-naïve patients = death. Heat increases absorption → overdose.",
            monitoringRequired: "Respiratory rate, pain score, opioid tolerance verification",
            keyPoint: "REMS: Transmucosal Immediate Release Fentanyl (TIRF) REMS. Contraindicated in opioid-naïve patients."
        ),
        
        // MARK: — LOOK-ALIKE / SOUND-ALIKE (LASA)
        
        HighRiskMedication(
            genericName: "HydrALAZINE vs. hydrOXYzine",
            brandName: "Apresoline vs. Vistaril",
            category: .lookAlikeSoundAlike,
            drugClass: "Vasodilator vs. Antihistamine",
            therapeuticUse: "Hypertension vs. Anxiety/Itching",
            riskDescription: "Commonly confused. HydrALAZINE lowers BP (can cause hypotension). HydrOXYzine treats anxiety/itching (causes sedation).",
            monitoringRequired: "Verify indication before dispensing",
            keyPoint: "LASA pair. Use Tall Man lettering: hydrALAZINE vs. hydrOXYzine."
        ),
        
        HighRiskMedication(
            genericName: "CeleXA (citalopram) vs. CeleBREX (celecoxib)",
            brandName: "Celexa vs. Celebrex",
            category: .lookAlikeSoundAlike,
            drugClass: "SSRI Antidepressant vs. NSAID",
            therapeuticUse: "Depression vs. Arthritis Pain",
            riskDescription: "Commonly confused names. CeleXA = mental health. CeleBREX = joint pain.",
            monitoringRequired: "Verify indication",
            keyPoint: "LASA pair. Use Tall Man lettering: CeleXA vs. CeleBREX."
        ),
        
        HighRiskMedication(
            genericName: "Metformin vs. Metronidazole",
            brandName: "Glucophage vs. Flagyl",
            category: .lookAlikeSoundAlike,
            drugClass: "Antidiabetic vs. Antibiotic",
            therapeuticUse: "Type 2 Diabetes vs. Bacterial/Protozoal Infections",
            riskDescription: "Similar names. Metformin = diabetes. Metronidazole = infections (also interacts with alcohol → disulfiram reaction).",
            monitoringRequired: "Verify indication",
            keyPoint: "LASA pair. Completely different uses. Always verify patient diagnosis."
        ),
        
        HighRiskMedication(
            genericName: "Lamotrigine vs. Labetalol",
            brandName: "Lamictal vs. Trandate",
            category: .lookAlikeSoundAlike,
            drugClass: "Antiepileptic vs. Beta-Blocker",
            therapeuticUse: "Seizures/Bipolar vs. Hypertension",
            riskDescription: "Similar names. Lamotrigine has serious rash risk (SJS/TEN). Labetalol lowers BP/HR.",
            monitoringRequired: "Verify indication",
            keyPoint: "LASA pair. LaMICtal (seizures) vs. LaBEtalol (blood pressure)."
        ),
        
    ]
    
    // MARK: - Grouping by Category
    
    static func medications(for category: HighRiskCategory) -> [HighRiskMedication] {
        allHighRiskMeds.filter { $0.category == category }
    }
}
#endif

