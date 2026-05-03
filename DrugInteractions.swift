//
//  DrugInteractions.swift
//  Synapse PTCE
//
//  ⚠️ DEPRECATED - This file is no longer used
//  Data moved to MedicationDatabase.swift
//  Type definitions and extensions are in MedicationDataModels.swift
//

/*
 THIS FILE HAS BEEN DISABLED
 
 The drug interaction data is now in: MedicationDatabase.swift (as allDrugInteractions)
 The DrugInteraction type and extensions are in: MedicationDataModels.swift
 
 This file can be deleted from the project.
*/

#if false

import Foundation
import SwiftUI

// MARK: - Drug Interaction Database

extension DrugInteraction {
    
    static let allInteractions: [DrugInteraction] = [
        
        // MARK: — OTC ↔ PRESCRIPTION
        
        DrugInteraction(
            agent1: "NSAIDs (Ibuprofen, Naproxen)",
            agent2: "Warfarin",
            interactionType: .otcRx,
            severity: .major,
            mechanismDescription: "NSAIDs inhibit platelet aggregation AND increase risk of GI bleeding. Warfarin already increases bleeding risk.",
            clinicalConsequence: "MAJOR BLEEDING RISK — GI bleed, intracranial hemorrhage, excessive bruising.",
            patientCounseling: "Avoid OTC NSAIDs while on warfarin. Use acetaminophen (Tylenol) for pain instead. If NSAID is necessary, monitor INR closely."
        ),
        
        DrugInteraction(
            agent1: "Aspirin (OTC)",
            agent2: "Warfarin",
            interactionType: .otcRx,
            severity: .major,
            mechanismDescription: "Aspirin irreversibly inhibits platelets. Warfarin inhibits clotting factors. Combined effect = extreme bleeding risk.",
            clinicalConsequence: "SEVERE BLEEDING RISK. Sometimes intentionally combined at low aspirin doses in specific cardiac conditions, but requires close monitoring.",
            patientCounseling: "Do NOT take aspirin without MD approval while on warfarin. Even baby aspirin increases bleeding risk."
        ),
        
        DrugInteraction(
            agent1: "Antacids (Tums, Maalox)",
            agent2: "Tetracycline Antibiotics (Doxycycline)",
            interactionType: .otcRx,
            severity: .moderate,
            mechanismDescription: "Calcium, magnesium, and aluminum in antacids bind (chelate) tetracyclines in the GI tract → reduced absorption.",
            clinicalConsequence: "Antibiotic FAILS to reach therapeutic levels → infection not treated.",
            patientCounseling: "Take doxycycline at least 2 hours BEFORE or 4–6 hours AFTER antacids. Same applies to dairy products, iron, zinc."
        ),
        
        DrugInteraction(
            agent1: "Antacids (Tums, Maalox)",
            agent2: "Fluoroquinolones (Ciprofloxacin, Levofloxacin)",
            interactionType: .otcRx,
            severity: .moderate,
            mechanismDescription: "Calcium, magnesium, aluminum, iron, and zinc chelate fluoroquinolones → drastically reduced absorption.",
            clinicalConsequence: "Antibiotic FAILS. Subtherapeutic levels = treatment failure, potential resistance.",
            patientCounseling: "Separate fluoroquinolones from antacids, multivitamins, dairy by at least 2 hours before or 6 hours after."
        ),
        
        DrugInteraction(
            agent1: "Pseudoephedrine (Sudafed)",
            agent2: "MAO Inhibitors (Phenelzine, Tranylcypromine)",
            interactionType: .otcRx,
            severity: .contraindicated,
            mechanismDescription: "MAOIs prevent breakdown of norepinephrine. Pseudoephedrine releases norepinephrine → massive sympathetic surge.",
            clinicalConsequence: "HYPERTENSIVE CRISIS — severe headache, stroke, death.",
            patientCounseling: "NEVER use decongestants (pseudoephedrine, phenylephrine) with MAOIs or within 14 days of stopping an MAOI."
        ),
        
        DrugInteraction(
            agent1: "NSAIDs (Ibuprofen, Naproxen)",
            agent2: "ACE Inhibitors / ARBs",
            interactionType: .otcRx,
            severity: .moderate,
            mechanismDescription: "NSAIDs cause sodium retention and vasoconstriction (via prostaglandin inhibition). ACE/ARBs cause vasodilation. NSAIDs counteract the BP-lowering effect.",
            clinicalConsequence: "Reduced antihypertensive efficacy. Increased risk of acute kidney injury, especially in volume-depleted patients.",
            patientCounseling: "Limit NSAID use. Use acetaminophen for pain if possible. Monitor BP and kidney function if NSAIDs are necessary."
        ),
        
        DrugInteraction(
            agent1: "Omeprazole (OTC Prilosec)",
            agent2: "Clopidogrel (Plavix)",
            interactionType: .otcRx,
            severity: .moderate,
            mechanismDescription: "Omeprazole inhibits CYP2C19, the enzyme that activates clopidogrel (a prodrug). Reduced activation = reduced antiplatelet effect.",
            clinicalConsequence: "Increased risk of cardiovascular events (MI, stroke) in patients taking clopidogrel for stent or ACS.",
            patientCounseling: "Avoid omeprazole and esomeprazole with clopidogrel. If PPI needed, use pantoprazole (weaker CYP2C19 interaction)."
        ),
        
        // MARK: — HERBAL ↔ PRESCRIPTION
        
        DrugInteraction(
            agent1: "St. John's Wort",
            agent2: "Oral Contraceptives (Birth Control Pills)",
            interactionType: .herbalRx,
            severity: .major,
            mechanismDescription: "St. John's Wort is a CYP3A4 INDUCER → increases metabolism of estrogen/progestin → lowers contraceptive levels.",
            clinicalConsequence: "CONTRACEPTIVE FAILURE → unintended pregnancy, breakthrough bleeding.",
            patientCounseling: "Do NOT use St. John's Wort with birth control pills. Use backup contraception if you've taken St. John's Wort recently."
        ),
        
        DrugInteraction(
            agent1: "St. John's Wort",
            agent2: "SSRIs (Fluoxetine, Sertraline, etc.)",
            interactionType: .herbalRx,
            severity: .major,
            mechanismDescription: "Both St. John's Wort and SSRIs increase serotonin levels. Combined effect = excessive serotonin activity.",
            clinicalConsequence: "SEROTONIN SYNDROME — agitation, confusion, rapid heart rate, high fever, seizures. Can be fatal.",
            patientCounseling: "NEVER combine St. John's Wort with prescription antidepressants. Risk of serotonin syndrome."
        ),
        
        DrugInteraction(
            agent1: "Ginkgo Biloba",
            agent2: "Warfarin",
            interactionType: .herbalRx,
            severity: .moderate,
            mechanismDescription: "Ginkgo has antiplatelet effects → increases bleeding risk when combined with anticoagulants.",
            clinicalConsequence: "Increased bleeding risk — bruising, nosebleeds, GI bleeding.",
            patientCounseling: "Avoid ginkgo while on warfarin or other blood thinners. If you're taking it, inform your pharmacist/doctor."
        ),
        
        DrugInteraction(
            agent1: "Ginseng",
            agent2: "Warfarin",
            interactionType: .herbalRx,
            severity: .moderate,
            mechanismDescription: "Ginseng may have antiplatelet effects OR may induce warfarin metabolism (data conflicting). Either way, INR can fluctuate.",
            clinicalConsequence: "Unpredictable INR changes → bleeding or clotting risk.",
            patientCounseling: "Avoid ginseng with warfarin. If used, monitor INR closely."
        ),
        
        DrugInteraction(
            agent1: "Saw Palmetto",
            agent2: "Warfarin",
            interactionType: .herbalRx,
            severity: .moderate,
            mechanismDescription: "Saw palmetto may have antiplatelet effects → additive bleeding risk.",
            clinicalConsequence: "Increased bleeding risk.",
            patientCounseling: "Use caution with saw palmetto and blood thinners. Inform healthcare providers if using."
        ),
        
        DrugInteraction(
            agent1: "Garlic Supplements",
            agent2: "Warfarin",
            interactionType: .herbalRx,
            severity: .moderate,
            mechanismDescription: "High-dose garlic supplements have antiplatelet effects → additive bleeding risk.",
            clinicalConsequence: "Increased bleeding risk.",
            patientCounseling: "Cooking garlic is fine. High-dose garlic SUPPLEMENTS may increase bleeding risk with warfarin."
        ),
        
        DrugInteraction(
            agent1: "Echinacea",
            agent2: "Immunosuppressants (Cyclosporine, Tacrolimus)",
            interactionType: .herbalRx,
            severity: .moderate,
            mechanismDescription: "Echinacea stimulates the immune system → counteracts immunosuppressive therapy.",
            clinicalConsequence: "Risk of organ rejection in transplant patients.",
            patientCounseling: "Avoid echinacea if you're on immunosuppressants (transplant meds, biologics for autoimmune disease)."
        ),
        
        // MARK: — FOOD ↔ PRESCRIPTION
        
        DrugInteraction(
            agent1: "Grapefruit Juice",
            agent2: "Statins (Atorvastatin, Simvastatin, Lovastatin)",
            interactionType: .foodRx,
            severity: .moderate,
            mechanismDescription: "Grapefruit juice inhibits CYP3A4 in the gut → drastically increases statin absorption → higher blood levels.",
            clinicalConsequence: "Increased risk of myopathy, rhabdomyolysis (severe muscle breakdown).",
            patientCounseling: "Avoid grapefruit juice with atorvastatin, simvastatin, lovastatin. Pravastatin and rosuvastatin are safer alternatives (not metabolized by CYP3A4)."
        ),
        
        DrugInteraction(
            agent1: "Grapefruit Juice",
            agent2: "Calcium Channel Blockers (Amlodipine, Felodipine)",
            interactionType: .foodRx,
            severity: .moderate,
            mechanismDescription: "Grapefruit juice inhibits CYP3A4 → increases CCB levels → excessive vasodilation.",
            clinicalConsequence: "Severe hypotension (low blood pressure), dizziness, fainting.",
            patientCounseling: "Avoid grapefruit juice with calcium channel blockers."
        ),
        
        DrugInteraction(
            agent1: "Tyramine-Rich Foods (Aged Cheese, Cured Meats, Soy Sauce)",
            agent2: "MAO Inhibitors (Phenelzine, Tranylcypromine)",
            interactionType: .foodRx,
            severity: .contraindicated,
            mechanismDescription: "MAOIs prevent breakdown of tyramine. Tyramine causes norepinephrine release → massive sympathetic surge.",
            clinicalConsequence: "HYPERTENSIVE CRISIS — severe headache, stroke, death.",
            patientCounseling: "STRICT DIET required on MAOIs. Avoid aged cheese, cured meats, fermented foods, draft beer, red wine, soy sauce."
        ),
        
        DrugInteraction(
            agent1: "Vitamin K-Rich Foods (Leafy Greens, Broccoli, Brussels Sprouts)",
            agent2: "Warfarin",
            interactionType: .foodRx,
            severity: .moderate,
            mechanismDescription: "Warfarin blocks Vitamin K-dependent clotting factors. High vitamin K intake counteracts warfarin → lowers INR.",
            clinicalConsequence: "Reduced anticoagulation → increased clot risk (stroke, DVT, PE).",
            patientCounseling: "Don't AVOID vitamin K foods — just keep intake CONSISTENT. Don't suddenly start or stop eating lots of leafy greens."
        ),
        
        DrugInteraction(
            agent1: "Alcohol",
            agent2: "Metronidazole",
            interactionType: .foodRx,
            severity: .major,
            mechanismDescription: "Metronidazole inhibits aldehyde dehydrogenase (like disulfiram) → acetaldehyde accumulates after alcohol ingestion.",
            clinicalConsequence: "DISULFIRAM-LIKE REACTION — severe nausea, vomiting, flushing, headache, rapid heart rate.",
            patientCounseling: "AVOID ALL ALCOHOL while taking metronidazole and for 3 days after finishing the course."
        ),
        
        DrugInteraction(
            agent1: "Dairy Products (Milk, Yogurt, Cheese)",
            agent2: "Tetracycline Antibiotics (Doxycycline)",
            interactionType: .foodRx,
            severity: .moderate,
            mechanismDescription: "Calcium in dairy chelates tetracyclines → reduced absorption.",
            clinicalConsequence: "Antibiotic failure — subtherapeutic levels.",
            patientCounseling: "Take doxycycline 1–2 hours before or 2–3 hours after dairy products."
        ),
        
        // MARK: — PRESCRIPTION ↔ PRESCRIPTION (High-Yield Pairs)
        
        DrugInteraction(
            agent1: "Metronidazole",
            agent2: "Warfarin",
            interactionType: .rxRx,
            severity: .major,
            mechanismDescription: "Metronidazole inhibits CYP2C9 (warfarin metabolism) AND disrupts gut flora (which produces vitamin K).",
            clinicalConsequence: "MAJOR BLEEDING RISK — INR can skyrocket within days.",
            patientCounseling: "If metronidazole is prescribed to a warfarin patient, monitor INR closely (within 3–5 days). Warfarin dose may need temporary reduction."
        ),
        
        DrugInteraction(
            agent1: "Fluconazole",
            agent2: "Warfarin",
            interactionType: .rxRx,
            severity: .major,
            mechanismDescription: "Fluconazole is a potent CYP2C9 inhibitor → slows warfarin metabolism → higher warfarin levels.",
            clinicalConsequence: "MAJOR BLEEDING RISK — INR elevation.",
            patientCounseling: "Monitor INR closely when starting fluconazole. Warfarin dose may need reduction."
        ),
        
        DrugInteraction(
            agent1: "Trimethoprim/Sulfamethoxazole (Bactrim)",
            agent2: "Warfarin",
            interactionType: .rxRx,
            severity: .major,
            mechanismDescription: "TMP/SMX inhibits CYP2C9 → increased warfarin levels.",
            clinicalConsequence: "MAJOR BLEEDING RISK.",
            patientCounseling: "Monitor INR closely. Warfarin dose adjustment may be needed."
        ),
        
        DrugInteraction(
            agent1: "Macrolide Antibiotics (Azithromycin, Clarithromycin)",
            agent2: "Statins (Atorvastatin, Simvastatin)",
            interactionType: .rxRx,
            severity: .major,
            mechanismDescription: "Macrolides (especially clarithromycin) inhibit CYP3A4 → increased statin levels.",
            clinicalConsequence: "Increased risk of myopathy, rhabdomyolysis.",
            patientCounseling: "Consider temporarily stopping statin during clarithromycin course. Azithromycin has weaker interaction."
        ),
        
        DrugInteraction(
            agent1: "Gemfibrozil (Fibrate)",
            agent2: "Statins",
            interactionType: .rxRx,
            severity: .contraindicated,
            mechanismDescription: "Gemfibrozil inhibits statin metabolism (especially via glucuronidation) → drastically increased statin levels.",
            clinicalConsequence: "VERY HIGH RISK of rhabdomyolysis (severe muscle breakdown → kidney failure, death).",
            patientCounseling: "AVOID gemfibrozil + statin combination. If fibrate needed, use fenofibrate instead (safer interaction profile)."
        ),
        
        DrugInteraction(
            agent1: "ACE Inhibitors / ARBs",
            agent2: "Potassium-Sparing Diuretics (Spironolactone, Triamterene)",
            interactionType: .rxRx,
            severity: .moderate,
            mechanismDescription: "Both drug classes INCREASE potassium levels. ACE/ARBs reduce aldosterone → potassium retention. K-sparing diuretics block potassium excretion.",
            clinicalConsequence: "HYPERKALEMIA (high potassium) → cardiac arrhythmias, cardiac arrest.",
            patientCounseling: "Monitor potassium levels closely if these are combined. Avoid potassium supplements and salt substitutes (often contain potassium)."
        ),
        
        DrugInteraction(
            agent1: "SSRI Antidepressants",
            agent2: "Tramadol",
            interactionType: .rxRx,
            severity: .major,
            mechanismDescription: "SSRIs increase serotonin. Tramadol also has serotonergic activity. Combined = excessive serotonin.",
            clinicalConsequence: "SEROTONIN SYNDROME — agitation, confusion, fever, seizures.",
            patientCounseling: "Use tramadol cautiously with SSRIs. Watch for symptoms: agitation, confusion, rapid heart rate, sweating."
        ),
        
        DrugInteraction(
            agent1: "Beta-Blockers",
            agent2: "Calcium Channel Blockers (Diltiazem, Verapamil)",
            interactionType: .rxRx,
            severity: .moderate,
            mechanismDescription: "Both slow heart rate (negative chronotropy) and reduce cardiac contractility (negative inotropy).",
            clinicalConsequence: "Severe bradycardia (slow heart rate), heart block, hypotension, heart failure exacerbation.",
            patientCounseling: "This combination requires close monitoring. Dihydropyridine CCBs (amlodipine) are safer with beta-blockers."
        ),
        
    ]
    
    // MARK: - Grouping by Type
    
    static func interactions(for type: InteractionType) -> [DrugInteraction] {
        allInteractions.filter { $0.interactionType == type }
    }
    
    // MARK: - Grouping by Severity
    
    static func interactions(for severity: InteractionSeverity) -> [DrugInteraction] {
        allInteractions.filter { $0.severity == severity }
    }
}
#endif

