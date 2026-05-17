//
//  RimrockQuestions_Day01_10.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Question content for shift days 1–10. Split out of RimrockContent.swift
//  to keep individual files reviewable.
//

import Foundation

// MARK: - Day 1 Questions

extension RimrockQuestion {

    static let uspFridgeTemp = RimrockQuestion(
        id: "D1_USP_FRIDGE_TEMP",
        domain: .orderEntry,
        topic: "USP_STORAGE",
        prompt: "Acceptable temperature range for refrigerated medications?",
        options: ["2–8 °C", "0–10 °C", "4–12 °C", "8–15 °C"],
        correctAnswer: "2–8 °C",
        onCorrect: "Two to eight. Fahrenheit if you prefer it — thirty-six to forty-six. Anything outside that range, you call me before you do anything else. Even if it's the middle of the night. We had a power flicker in March that cost us a tray of Lantus. I am not going through that again.",
        onWrong: "Two to eight Celsius. Write that on the inside of your eyelids. Thirty-six to forty-six Fahrenheit. Anything outside that range, you call me. Doesn't matter if it's the middle of the night. We had a power flicker in March that cost us a tray of Lantus. We are not doing that again."
    )

    static let sigCodeQD = RimrockQuestion(
        id: "D1_SIG_QD",
        domain: .orderEntry,
        topic: "SIG_CODE",
        prompt: "\"i tab po qd\" — what's that telling you?",
        options: [
            "One tablet by mouth daily",
            "One tablet by mouth twice daily",
            "One tablet under the tongue daily",
            "One tablet by mouth as needed"
        ],
        correctAnswer: "One tablet by mouth daily",
        onCorrect: "Yeah. Lowercase i is one. PO is by mouth — per os. QD is daily. Joint Commission phased it out years ago because doctors were writing it sloppy and it was getting read as QID — four times daily — and people died. Hollis still uses QD. Hollis still uses a fountain pen, so. Pick your battles.",
        onWrong: "Slow down. Lowercase i is one. PO is by mouth — per os. QD is once daily. The reason Joint Commission tried to bury QD is doctors writing it sloppy and people reading it as QID. Four times daily. People died. Always read it twice. Hollis still writes it because Hollis still uses a fountain pen, so."
    )

    static let brandGenericToprolXL = RimrockQuestion(
        id: "D1_BRAND_TOPROL_XL",
        domain: .medications,
        topic: "BRAND_GENERIC",
        prompt: "Brand-name equivalent of metoprolol succinate ER 50 mg?",
        options: ["Toprol-XL", "Lopressor", "Tenormin", "Coreg"],
        correctAnswer: "Toprol-XL",
        onCorrect: "Toprol-XL. If he calls and asks why he's getting little white pills instead of little white pills with a different logo, that's your answer. Same drug, same release profile, twenty bucks instead of two hundred. Lopressor is metoprolol tartrate — different salt, different release, twice a day. Don't mix them up. People do. Easy way to put someone in the hospital.",
        onWrong: "Toprol-XL. The succinate goes with Toprol-XL — once daily, extended release. Lopressor is metoprolol tartrate — different salt, different release, twice a day. Tenormin is atenolol. Coreg is carvedilol. All beta-blockers, none the same drug. Mix them up and you put someone in the hospital."
    )

    static let partialFillOwed = RimrockQuestion(
        id: "D1_PARTIAL_FILL_AMOX",
        domain: .orderEntry,
        topic: "PARTIAL_FILL",
        prompt: "Total quantity 30, you dispensed 14. How many do you owe?",
        options: ["16", "14", "30", "0"],
        correctAnswer: "16",
        onCorrect: "Right. Patients don't care about logistics, they care about feeling better. Tell her she can come pick the rest up after lunch tomorrow. We'll have it.",
        onWrong: "Sixteen. Thirty minus fourteen. Note it on the slip — partial fill, 14 dispensed, 16 owed — and in the system. We owe her the rest off tomorrow's truck."
    )
}

// MARK: - Day 2 Questions

extension RimrockQuestion {

    static let day2_form222 = RimrockQuestion(
        id: "D2_FORM_222",
        domain: .federalRequirements,
        topic: "DEA_FORM_222",
        prompt: "A DEA Form 222 is required for ordering which controlled substance schedule?",
        options: ["Schedule II", "Schedule III", "Schedule IV", "Schedule V"],
        correctAnswer: "Schedule II",
        onCorrect: "Two only. Schedule II — the heavy stuff. Oxy, hydrocodone, fentanyl, methadone, Adderall, Ritalin. Three through Five come on the same wholesale invoice as your benzonatate and your nasal spray. CSOS is the electronic version of Form 222 — same idea, same scheduling rules.",
        onWrong: "Two. Schedule II only. Three through Five come on the same invoice as everything else. Form 222 is for the controlled substances we keep in the safe behind two locks. CSOS is the electronic version. We'll handle those next time."
    )

    static let day2_pseudoephedrineLimit = RimrockQuestion(
        id: "D2_PSE_LIMIT",
        domain: .federalRequirements,
        topic: "PSE_CMEA",
        prompt: "Federal limit on pseudoephedrine: how many grams of base may a single customer purchase per day?",
        options: ["3.6 g", "7.5 g", "9 g", "Unlimited with prescription"],
        correctAnswer: "3.6 g",
        onCorrect: "Three point six grams a day. Nine grams a month. Federal floor — your state can tighten it. Wyoming basically uses the federal numbers. The point isn't to make life hard for people with allergies; the point is the methamphetamine epidemic that gave us this paperwork. Combat Meth Epidemic Act, 2005.",
        onWrong: "Three point six grams per day. Nine grams per month — federal, states can tighten. Wyoming sticks with the floor. We log the buyer's name, ID, address. Customer gets one box, signs the electronic registry, gets out. We keep records two years. Combat Meth Epidemic Act."
    )

    static let day2_lasaHydralazine = RimrockQuestion(
        id: "D2_LASA_HYDRALAZINE",
        domain: .patientSafety,
        topic: "LASA",
        prompt: "Which medication treats hypertension?",
        options: ["Hydroxyzine", "Hydralazine", "Both", "Neither"],
        correctAnswer: "Hydralazine",
        onCorrect: "Hydralazine — the vasodilator. Hydroxyzine is the antihistamine, used for anxiety and itching. Different drug, different class, different reason. The names look almost identical on a prescription pad. The classic look-alike sound-alike. Tall man lettering helps — hydrALAzine, hydrOXYzine. Once you've seen the trap once, you don't fall for it. The first time, though, people die.",
        onWrong: "Hydralazine. The vasodilator. Hydroxyzine is the antihistamine — anxiety and itch. Names look identical, drugs are not. Tall man lettering helps — hydrALAzine, hydrOXYzine. Always read twice."
    )

    static let day2_ntiLevothyroxine = RimrockQuestion(
        id: "D2_NTI_LEVO",
        domain: .medications,
        topic: "NTI_DRUGS",
        prompt: "Which of the following is considered a narrow therapeutic index (NTI) drug?",
        options: ["Levothyroxine", "Acetaminophen", "Ibuprofen", "Loratadine"],
        correctAnswer: "Levothyroxine",
        onCorrect: "Levothyroxine. Warfarin's the other one most people know. Lithium, digoxin, phenytoin, carbamazepine, theophylline — that's most of the NTI list. Small therapeutic window, big difference between not enough and too much. The classics.",
        onWrong: "Levothyroxine. NTI list includes warfarin, lithium, digoxin, phenytoin, carbamazepine, theophylline, levothyroxine — drugs where a small dose change throws the patient off. Acetaminophen actually has the OPPOSITE problem — wide window then sudden hepatotoxicity at high doses. Ibuprofen and loratadine — wide windows, both."
    )
}

// MARK: - Day 3 Questions

extension RimrockQuestion {

    static let day3_scheduleIIRefills = RimrockQuestion(
        id: "D3_C2_REFILLS",
        domain: .federalRequirements,
        topic: "C2_REFILL_RULES",
        prompt: "How many refills are permitted on a Schedule II prescription?",
        options: ["0", "1", "5", "Unlimited within 6 months"],
        correctAnswer: "0",
        onCorrect: "Zero. Period. Schedule II — no refills, no phone-ins, no faxing except in narrow exceptions like LTC or hospice. New prescription each time. The prescriber can write multiple sequential prescriptions for up to ninety days of therapy total, post-dated, but each is its own document.",
        onWrong: "Zero. None. Schedule II is no refills, ever. New prescription each time. Prescribers can write multiple sequential prescriptions for up to ninety days of therapy — each post-dated, each its own document. Never refilled. Faxing or phoning C-IIs is only allowed in narrow LTC / hospice / emergency cases."
    )

    static let day3_deaNumberLetter = RimrockQuestion(
        id: "D3_DEA_LETTER",
        domain: .federalRequirements,
        topic: "DEA_NUMBER",
        prompt: "For a practitioner-registered prescriber, the first letter of the DEA number is...?",
        options: ["A or B (or F)", "A only", "Always P", "Always M"],
        correctAnswer: "A or B (or F)",
        onCorrect: "A or B for traditional practitioners. F was added later when A/B numbers ran out. M is for mid-level practitioners — NPs, PAs in some states. The second letter historically matches the registrant's last name initial. Newer registrations don't always follow that, but old DEAs still do.",
        onWrong: "A, B, or F for practitioners. M for mid-levels — NPs, PAs in some states. The second letter is the registrant's last name initial — at least historically. If the second letter doesn't match the prescriber's last name, that doesn't always mean fraud, but it's worth a second look."
    )

    static let day3_lasaCelebrex = RimrockQuestion(
        id: "D3_LASA_CELEBREX",
        domain: .patientSafety,
        topic: "LASA",
        prompt: "Celebrex, Celexa, Cerebyx — which is the anti-inflammatory?",
        options: ["Celebrex", "Celexa", "Cerebyx", "They're all anti-inflammatories"],
        correctAnswer: "Celebrex",
        onCorrect: "Celebrex is celecoxib — a COX-2 selective NSAID, anti-inflammatory. Celexa is citalopram — SSRI, antidepressant. Cerebyx is fosphenytoin — anti-seizure. Three drugs that sound the same and treat nothing in common. Pharmacy school's favorite trap. Always read twice.",
        onWrong: "Celebrex. Celecoxib — COX-2 NSAID. Celexa is citalopram, SSRI. Cerebyx is fosphenytoin, anti-seizure. Three drugs that sound the same and have nothing in common. Always read twice. The patient on Celebrex who got Celexa instead is a real case from real years — search the FDA archives if you want to lose sleep."
    )

    static let day3_pmpResponse = RimrockQuestion(
        id: "D3_PMP_RESPONSE",
        domain: .patientSafety,
        topic: "PMP_DOCTOR_SHOPPING",
        prompt: "A patient calls about a controlled-substance refill. The state PMP shows the same drug filled at another pharmacy five days ago. What's the appropriate response?",
        options: [
            "Fill it; he's on file with a valid prescription",
            "Refuse to fill, document the PMP findings, and contact the prescriber",
            "Fill it but call the police",
            "Fill it but reduce the quantity"
        ],
        correctAnswer: "Refuse to fill, document the PMP findings, and contact the prescriber",
        onCorrect: "Refuse the fill, document the lookup, contact the prescriber. We're not the cops. We're not the patient's parent. We're the gate between his prescriber's intent and what actually goes home. If the prescriber says fill it after seeing the PMP, that's between them. We did our part by checking.",
        onWrong: "Refuse, document, contact prescriber. PMP exists exactly for this — a near-50-state database designed to catch the gaps between prescribers. Filling without resolving the discrepancy isn't compassion, it's malpractice. Calling the police isn't our job either. We're the gate, not the punishment."
    )
}

// MARK: - Day 4 Questions

extension RimrockQuestion {

    static let day4_lisinoprilClass = RimrockQuestion(
        id: "D4_LISINOPRIL_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_ACE",
        prompt: "Lisinopril belongs to which drug class?",
        options: ["ACE inhibitor", "ARB", "Beta-blocker", "Calcium channel blocker"],
        correctAnswer: "ACE inhibitor",
        onCorrect: "ACE inhibitor. Stem is '-pril' — lisinopril, enalapril, ramipril, benazepril. Blocks angiotensin-converting enzyme. Side effect everyone gets tested on: dose-independent dry cough, about ten percent of patients. Switch them to an ARB if the cough is bad — those end in '-sartan' and don't cause it.",
        onWrong: "ACE inhibitor. The '-pril' stem gives it away — that's the whole class. Lisinopril, enalapril, ramipril. Blocks angiotensin-converting enzyme, lowers blood pressure, dry cough is the classic side effect. Switch to ARB ('-sartan') if cough is intolerable."
    )

    static let day4_atorvastatinClass = RimrockQuestion(
        id: "D4_ATORVASTATIN_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_STATIN",
        prompt: "Atorvastatin's mechanism of action?",
        options: ["HMG-CoA reductase inhibitor", "Bile acid sequestrant", "PCSK9 inhibitor", "Niacin derivative"],
        correctAnswer: "HMG-CoA reductase inhibitor",
        onCorrect: "Statin. Stem is '-statin' — atorvastatin, rosuvastatin, simvastatin, pravastatin. Blocks HMG-CoA reductase, the rate-limiting enzyme in cholesterol synthesis. Risks: rhabdomyolysis at high doses, especially with grapefruit juice for some statins. Counsel: muscle pain or dark urine, call the doctor.",
        onWrong: "HMG-CoA reductase inhibitor. The '-statin' stem is the class. Blocks the rate-limiting enzyme in cholesterol synthesis. Watch for muscle pain or dark urine — that's rhabdomyolysis. Grapefruit juice raises levels of some statins. Counsel on it."
    )

    static let day4_metforminIndication = RimrockQuestion(
        id: "D4_METFORMIN_INDICATION",
        domain: .medications,
        topic: "DRUG_INDICATION",
        prompt: "Metformin is first-line for which condition?",
        options: ["Type 2 diabetes", "Hypertension", "Heart failure", "GERD"],
        correctAnswer: "Type 2 diabetes",
        onCorrect: "Type 2 diabetes. ADA first-line, has been for decades. Decreases hepatic glucose production, increases peripheral insulin sensitivity. Watch for B12 deficiency on long-term therapy. Hold for forty-eight hours before IV contrast — lactic acidosis risk. Take with food.",
        onWrong: "Type 2 diabetes. ADA first-line. Decreases hepatic glucose production, increases peripheral insulin sensitivity. Long-term: B12 deficiency. Critical: HOLD before IV contrast — lactic acidosis risk. Take with food."
    )

    static let day4_omeprazoleClass = RimrockQuestion(
        id: "D4_OMEPRAZOLE_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_PPI",
        prompt: "Omeprazole is a...?",
        options: ["Proton pump inhibitor (PPI)", "H2 blocker", "Antacid", "Prokinetic"],
        correctAnswer: "Proton pump inhibitor (PPI)",
        onCorrect: "PPI. Stem is '-prazole' — omeprazole, esomeprazole, pantoprazole, lansoprazole. Blocks the H/K ATPase pump in parietal cells. Long-term use: B12 deficiency, increased fracture risk, possible C. diff. Step patients down when reflux resolves. Don't keep them on these forever.",
        onWrong: "PPI. The '-prazole' stem is the class. Blocks the H/K ATPase pump. Long-term: B12 deficiency, fracture risk, C. diff risk. H2 blockers end in '-tidine' (ranitidine, famotidine) and are weaker. Antacids are calcium/magnesium/aluminum salts. PPIs are first-line for GERD."
    )
}

// MARK: - Day 5 Questions

extension RimrockQuestion {

    static let day5_warfarinINR = RimrockQuestion(
        id: "D5_WARFARIN_INR",
        domain: .medications,
        topic: "WARFARIN_INR",
        prompt: "Therapeutic INR range for atrial fibrillation on warfarin?",
        options: ["1.0–1.5", "2.0–3.0", "2.5–3.5", "4.0–5.0"],
        correctAnswer: "2.0–3.0",
        onCorrect: "Two to three. Standard. Two-five to three-five for mechanical heart valves, that's the higher target. Below two, clot risk; above three, bleed risk. We don't dose warfarin — that's the prescriber and the anti-coag clinic. We dispense and we counsel.",
        onWrong: "Two to three for AFib, DVT, PE. Two-five to three-five for mechanical heart valves. Below two: clot. Above three: bleed. Anti-coag clinic dose-adjusts. We dispense and counsel — vitamin K consistency, watch for bleeding, don't double doses."
    )

    static let day5_betaBlockerContra = RimrockQuestion(
        id: "D5_BB_CONTRA",
        domain: .patientSafety,
        topic: "DRUG_CONTRAINDICATION",
        prompt: "Which condition is a relative contraindication for non-selective beta-blockers?",
        options: ["Hypertension", "Asthma", "Atrial fibrillation", "Angina"],
        correctAnswer: "Asthma",
        onCorrect: "Asthma. Non-selective beta-blockers like propranolol can trigger bronchospasm. Selective beta-1 like metoprolol or atenolol are safer but still ask before recommending. The other three are actually INDICATIONS for beta-blockers. Always check the chart.",
        onWrong: "Asthma. Beta-2 receptors in the lungs need to stay open. Non-selectives like propranolol block both beta-1 and beta-2 — bad for asthmatics. Selective beta-1 (metoprolol, atenolol — '-olol' stems with bisop, meto, atenol) are safer but not zero risk. The other three are indications, not contraindications."
    )

    static let day5_hyperkalemia = RimrockQuestion(
        id: "D5_HYPERKALEMIA",
        domain: .patientSafety,
        topic: "DRUG_INTERACTION",
        prompt: "A patient on lisinopril is also taking potassium chloride and spironolactone. The pharmacist's concern is...?",
        options: ["Hyperkalemia", "Hypokalemia", "Hyponatremia", "Hypoglycemia"],
        correctAnswer: "Hyperkalemia",
        onCorrect: "Hyperkalemia. ACE inhibitors retain potassium. Spironolactone retains potassium. Potassium chloride IS potassium. Three sources stacking. The patient might be fine — or might end up with a six-point-five K and a wonky EKG. DUR alert exists for exactly this. Don't override without thinking.",
        onWrong: "Hyperkalemia. Three potassium-elevating sources: ACE inhibitor (retention), aldosterone antagonist (spironolactone — retention), and the supplement (direct). Stack effects. Severe hyperkalemia is cardiac — peaked T waves, arrhythmia. The OTC supplement is the easiest one to stop."
    )

    static let day5_warfarinBactrim = RimrockQuestion(
        id: "D5_WARFARIN_BACTRIM",
        domain: .patientSafety,
        topic: "WARFARIN_DDI",
        prompt: "A patient on warfarin is prescribed which of the following is most likely to require dose adjustment?",
        options: ["Trimethoprim-sulfamethoxazole", "Cetirizine", "Loratadine", "Acetaminophen ≤2 g/day"],
        correctAnswer: "Trimethoprim-sulfamethoxazole",
        onCorrect: "Bactrim. Trimethoprim-sulfamethoxazole inhibits CYP enzymes that metabolize warfarin — INR can go through the roof. Other classics: amiodarone, fluconazole, metronidazole, rifampin (other direction — induces, lowers INR). When in doubt, look it up. Don't trust your memory on warfarin interactions — there are too many.",
        onWrong: "Bactrim. Trimethoprim-sulfamethoxazole spikes INR via CYP inhibition — risk of major bleed. The big-name warfarin DDIs: amiodarone, Bactrim, fluconazole, metronidazole all RAISE INR. Rifampin LOWERS it. Antihistamines and low-dose acetaminophen are usually fine. Always check the chart, never trust memory."
    )
}

// MARK: - Day 6 Questions

extension RimrockQuestion {

    static let day6_rxRequiredElements = RimrockQuestion(
        id: "D6_RX_REQUIRED_ELEMENTS",
        domain: .patientSafety,
        topic: "RX_PATIENT_ID",
        prompt: "What's missing from this prescription that prevents you from filling it as written?",
        options: [
            "Complete patient name and full date of birth",
            "Drug strength",
            "Quantity dispensed",
            "Prescriber signature"
        ],
        correctAnswer: "Complete patient name and full date of birth",
        onCorrect: "Complete patient ID. 'Marge' is a nickname; the full DOB is missing. Federal and state law require enough information to unambiguously identify the patient — full name, full DOB, address often. Drug, strength, qty, and signature are present. ID isn't. We don't fill until we confirm.",
        onWrong: "Patient ID. 'Marge' could be Margaret or Marjorie. The DOB is just a year. We need full first and last name plus complete date of birth to confirm we're filling for the right person. The other elements — drug, strength, qty, signature — are all on the slip. The patient ID is the gap."
    )

    static let day6_amlodipineClass = RimrockQuestion(
        id: "D6_AMLODIPINE_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_CCB",
        prompt: "Amlodipine belongs to which drug class?",
        options: ["Calcium channel blocker (CCB)", "ACE inhibitor", "Beta-blocker", "Thiazide diuretic"],
        correctAnswer: "Calcium channel blocker (CCB)",
        onCorrect: "Calcium channel blocker. Stem is '-dipine' — amlodipine, nifedipine, felodipine, all dihydropyridines. Block calcium influx into vascular smooth muscle, vasodilation, lower BP. Watch for ankle edema, headache, flushing. Verapamil and diltiazem are non-dihydropyridine CCBs — different stem, different side effect profile (constipation, AV node blockade).",
        onWrong: "Calcium channel blocker. The '-dipine' stem is the dihydropyridine subclass — amlodipine, nifedipine, felodipine. Block calcium influx into vascular smooth muscle. Watch for ankle edema, flushing, headache. Verapamil and diltiazem are the OTHER CCB subclass — non-dihydropyridines."
    )

    static let day6_sulfaAllergy = RimrockQuestion(
        id: "D6_SULFA_ALLERGY",
        domain: .patientSafety,
        topic: "ALLERGY_DUR",
        prompt: "A patient with documented sulfa allergy is prescribed trimethoprim-sulfamethoxazole. What should the pharmacy do?",
        options: [
            "Fill it; documented allergies are often outdated",
            "Refuse to fill, document the alert, and contact the prescriber for an alternative",
            "Fill it but counsel the patient extensively",
            "Substitute amoxicillin without contacting the prescriber"
        ],
        correctAnswer: "Refuse to fill, document the alert, and contact the prescriber for an alternative",
        onCorrect: "Refuse, document, contact. Sulfa allergies range from rash to Stevens-Johnson — the rash and hives this patient has documented are real. Bactrim contains sulfamethoxazole; we don't override a documented allergy without a prescriber's explicit OK. Substituting drug class on our own is dispensing without authority — that's the prescriber's call.",
        onWrong: "Refuse, document, contact. Sulfa reactions range from rash to Stevens-Johnson syndrome — Henry's documented rash is real. Bactrim contains sulfamethoxazole. We never override documented allergies on our own; the prescriber decides what alternative — doxycycline, amoxicillin-clavulanate, both are reasonable for sinusitis."
    )

    static let day6_amlodipineGrapefruit = RimrockQuestion(
        id: "D6_GRAPEFRUIT_CYP",
        domain: .medications,
        topic: "FOOD_DRUG_INTERACTION",
        prompt: "Why should patients on amlodipine avoid grapefruit?",
        options: [
            "Grapefruit inhibits CYP3A4, raising amlodipine levels",
            "Grapefruit lowers amlodipine absorption",
            "Grapefruit and amlodipine both lower potassium",
            "Grapefruit increases the risk of edema"
        ],
        correctAnswer: "Grapefruit inhibits CYP3A4, raising amlodipine levels",
        onCorrect: "CYP3A4 inhibition. Grapefruit (and Seville orange marmalade — the bitter ones) block CYP3A4, the enzyme that metabolizes amlodipine. Drug stays in the system longer, levels go up, blood pressure can drop too far. Effect lasts about three days, so 'just in the morning' isn't a workaround. Same applies to other CYP3A4 substrates like simvastatin, some immunosuppressants, certain antiarrhythmics.",
        onWrong: "CYP3A4 inhibition. Grapefruit blocks the enzyme that breaks down amlodipine — drug stays around longer, levels climb, blood pressure can drop too far. Inhibition lasts about three days, so timing it doesn't help. Lemons, oranges, limes are fine; grapefruit and Seville orange marmalade are out. Same for several other drugs: simvastatin, some immunosuppressants."
    )
}

// MARK: - Day 7 Questions

extension RimrockQuestion {

    static let day7_pediDosing = RimrockQuestion(
        id: "D7_PEDI_DOSING",
        domain: .orderEntry,
        topic: "WEIGHT_BASED_DOSING",
        prompt: "Mason weighs 22 kg. Amoxicillin-clavulanate at 90 mg/kg/day BID. Prescribed: 5 mL of 600 mg / 5 mL suspension twice daily. Is this within range?",
        options: [
            "Yes, ~55 mg/kg/day — within range",
            "No, dose is too low",
            "No, dose is too high",
            "Cannot calculate from given information"
        ],
        correctAnswer: "Yes, ~55 mg/kg/day — within range",
        onCorrect: "Within range. 5 mL × 600 mg / 5 mL = 600 mg per dose. BID = 1200 mg/day total. 1200 ÷ 22 kg = ~54.5 mg/kg/day. Standard amoxicillin-clavulanate range for otitis media is 45 to 90 mg/kg/day, so this is on the low end. Acceptable. If we wanted high-dose for resistant strains, we'd push to ninety.",
        onWrong: "Within range, on the low end. 5 mL × 600 mg/5 mL = 600 mg per dose. BID = 1200 mg/day. 1200 ÷ 22 = ~55 mg/kg/day. The 45–90 mg/kg/day range covers this. Always do the math for pediatric scripts; weight-based dosing is the most common dosing error in retail pharmacy."
    )

    static let day7_metforminContrast = RimrockQuestion(
        id: "D7_METFORMIN_CONTRAST",
        domain: .patientSafety,
        topic: "METFORMIN_CONTRAST_HOLD",
        prompt: "A patient on metformin is scheduled for IV iodinated contrast. What's the standard recommendation?",
        options: [
            "Hold metformin for 48 hours after contrast and recheck renal function before restarting",
            "Continue metformin without changes",
            "Stop metformin permanently",
            "Increase metformin dose to compensate"
        ],
        correctAnswer: "Hold metformin for 48 hours after contrast and recheck renal function before restarting",
        onCorrect: "Hold for 48 hours after contrast, recheck renal function, then restart. The risk is lactic acidosis — metformin accumulates if contrast-induced kidney injury reduces clearance. ACR guidelines support this for patients with eGFR < 30 or with AKI; many imaging centers apply it broadly to be safe. The patient should be told; we should be told; sometimes the loop misses us.",
        onWrong: "Hold 48 hours after contrast, recheck renal function, restart. Risk is lactic acidosis if kidneys are stunned by the contrast — metformin accumulates. ACR guidelines, applied broadly by most imaging centers. Every diabetic on metformin who's getting CT/MRI/cath needs this conversation. Loop usually closes; sometimes it misses us."
    )

    static let day7_highAlertMed = RimrockQuestion(
        id: "D7_HIGH_ALERT_INSULIN",
        domain: .patientSafety,
        topic: "HIGH_ALERT_MEDICATIONS",
        prompt: "Which of the following is on the ISMP list of high-alert medications?",
        options: ["Insulin", "Loratadine", "Acetaminophen", "Cetirizine"],
        correctAnswer: "Insulin",
        onCorrect: "Insulin. Top of the ISMP high-alert list for outpatient and inpatient. Mix-ups between long-acting (glargine, detemir, degludec) and rapid-acting (lispro, aspart, glulisine) cause severe hypoglycemia or hyperglycemia. Other high-alert classes: anticoagulants, opioids, chemotherapy, neuromuscular blockers, concentrated electrolytes (KCl).",
        onWrong: "Insulin. ISMP high-alert list — drugs with a heightened risk of significant patient harm when used in error. Other top entries: anticoagulants (warfarin, heparin, DOACs), opioids, methotrexate (oral, weekly dosing!), neuromuscular blockers, concentrated KCl, chemotherapy. Loratadine, acetaminophen, cetirizine are not on the list."
    )

    static let day7_ismpDoNotUse = RimrockQuestion(
        id: "D7_ISMP_DO_NOT_USE",
        domain: .patientSafety,
        topic: "ISMP_ABBREVIATIONS",
        prompt: "Which abbreviation is on the ISMP \"Do Not Use\" list because of error risk?",
        options: ["U or u (for units)", "mg", "mL", "bid"],
        correctAnswer: "U or u (for units)",
        onCorrect: "'U' or 'u' for units. It gets misread as a zero — '4U' becomes '40,' a tenfold dose error. Always write 'units' fully. Other do-not-use entries: 'IU' (international units, mistaken for IV), 'qd' (mistaken for qid — that's the QD-people-died story from Day 1), trailing zeros after decimals (1.0 mg can read as 10 mg), naked decimals (.5 mg should be 0.5 mg). ISMP and Joint Commission keep the list current.",
        onWrong: "'U' or 'u' for units. Misread as zero — '4U' becomes '40,' tenfold overdose. Always spell 'units.' Other do-not-use: 'IU' (mistaken for IV), 'qd' (mistaken for qid), trailing zeros (1.0 mg → 10 mg), naked decimals (.5 mg should be 0.5). The list exists because each entry is somebody who died."
    )
}

// MARK: - Day 8 Questions

extension RimrockQuestion {

    static let day8_ciiPartialFill = RimrockQuestion(
        id: "D8_CII_PARTIAL_FILL",
        domain: .federalRequirements,
        topic: "CII_PARTIAL_FILL_HOSPICE",
        prompt: "Under CARA (Comprehensive Addiction and Recovery Act, 2016), how long does a hospice or LTC patient have to receive the remainder of a partially-filled C-II prescription?",
        options: ["30 days from issue date", "7 days", "60 days", "Same calendar month only"],
        correctAnswer: "30 days from issue date",
        onCorrect: "Thirty days from the date the prescription was issued. CARA expanded partial-fill flexibility for hospice, LTC, and any patient who requests it. Standard CII patients also have the option, but the remaining quantity must still be dispensed within thirty days. After thirty, the leftover quantity is forfeit unless the prescriber writes a new script.",
        onWrong: "Thirty days from issue date. CARA, 2016, expanded partial-fill rules. Hospice and LTC patients can split the fill across multiple visits; same for patients who simply request it. Past thirty days, the remaining quantity is forfeit."
    )

    static let day8_form222Copies = RimrockQuestion(
        id: "D8_FORM_222_COPIES",
        domain: .federalRequirements,
        topic: "FORM_222_PROCESS",
        prompt: "How many copies (parts) does a paper DEA Form 222 have, and who keeps which?",
        options: [
            "Three: white kept by purchaser, green kept by purchaser after receipt, blue kept by supplier",
            "Two: pink kept by purchaser, white kept by supplier",
            "Four: copies for purchaser, supplier, DEA, and state board",
            "One: a single sheet signed by both parties"
        ],
        correctAnswer: "Three: white kept by purchaser, green kept by purchaser after receipt, blue kept by supplier",
        onCorrect: "Three carbon copies. The supplier (wholesaler) gets the blue when shipping; the purchaser keeps white as the order record and adds green to the records once the shipment arrives and is verified. CSOS — the electronic Controlled Substance Ordering System — replaces the paper form with digital signatures but follows the same audit trail. Records kept on-site for two years, accessible to DEA on request.",
        onWrong: "Three parts: white (purchaser keeps as order record), green (purchaser keeps after receiving), blue (supplier keeps). Records on-site for two years, DEA on request. CSOS is the electronic equivalent — same data, digital signatures, no paper."
    )

    static let day8_perpetualInventory = RimrockQuestion(
        id: "D8_PERPETUAL_INVENTORY",
        domain: .federalRequirements,
        topic: "CII_PERPETUAL",
        prompt: "Federal law requires perpetual inventory for which schedule of controlled substances?",
        options: ["Schedule II", "Schedule III only", "All schedules", "No federal perpetual requirement"],
        correctAnswer: "Schedule II",
        onCorrect: "Schedule II requires perpetual count federally. Many states extend perpetual inventory to all controlled substances; many pharmacies do it voluntarily for III through V to catch theft early. The federal floor is C-II only — running count of every transaction in and out, reconciled against physical count regularly.",
        onWrong: "Schedule II — federal floor. Running count of every C-II transaction; reconciled to physical count on a schedule. States often extend to III through V; pharmacies often go further voluntarily. Discrepancies must be investigated immediately — count error, billing error, or theft."
    )

    static let day8_biennialInventory = RimrockQuestion(
        id: "D8_BIENNIAL_INVENTORY",
        domain: .federalRequirements,
        topic: "BIENNIAL_INVENTORY",
        prompt: "DEA biennial inventory: how often must a pharmacy do a complete physical count of all controlled substances?",
        options: ["Every 2 years", "Annually", "Every 5 years", "Every 6 months"],
        correctAnswer: "Every 2 years",
        onCorrect: "Every two years — biennial. C-IIs counted exactly. C-III through V can be estimated for any container of more than 1,000 dosage units; under that, exact count. Records on-site, accessible to DEA on request, kept at least two years. Many pharmacies do it more frequently — every six or twelve months — for their own peace of mind.",
        onWrong: "Every two years — biennial inventory. C-IIs counted exact; C-III through V estimated for bottles over 1,000 dosage units, exact below. Two-year recordkeeping, DEA on request. Internal policy often more frequent — six-month or annual is common."
    )
}

// MARK: - Day 9 Questions

extension RimrockQuestion {

    static let day9_ndcStructure = RimrockQuestion(
        id: "D9_NDC_STRUCTURE",
        domain: .orderEntry,
        topic: "NDC_FORMAT",
        prompt: "An 11-digit NDC is segmented as which three parts?",
        options: [
            "Labeler / product / package (e.g., 5-4-2)",
            "Drug class / strength / package",
            "Manufacturer / lot / expiration",
            "Schedule / form / quantity"
        ],
        correctAnswer: "Labeler / product / package (e.g., 5-4-2)",
        onCorrect: "Labeler-product-package. The 11-digit format pads to 5-4-2 segments — five digits for the labeler (manufacturer or repackager), four for the product (drug, strength, dosage form), two for the package (size, type). Original 10-digit NDCs come in 4-4-2, 5-3-2, or 5-4-1 patterns; pharmacy software pads them to 11 by adding a leading zero to the segment that's short.",
        onWrong: "Labeler-product-package — 5-4-2 in the padded 11-digit format. Labeler is the manufacturer or repackager. Product is the drug, strength, and form together. Package is the bottle size and type. Old 10-digit NDCs (4-4-2, 5-3-2, 5-4-1) get padded to 11 by adding a leading zero where the segment is short."
    )

    static let day9_binPcn = RimrockQuestion(
        id: "D9_BIN_PCN",
        domain: .orderEntry,
        topic: "INSURANCE_BIN_PCN",
        prompt: "On a prescription insurance card, what does the BIN number identify?",
        options: [
            "The claims processor for routing",
            "The patient's specific plan",
            "The prescriber",
            "The pharmacy"
        ],
        correctAnswer: "The claims processor for routing",
        onCorrect: "BIN — Bank Identification Number — routes the claim to the correct pharmacy benefit manager (PBM) or processor. PCN routes within that processor — same BIN may serve multiple plans, PCN distinguishes them. Group ID identifies the employer or plan; Cardholder ID is the patient. Four pieces, all required for clean billing.",
        onWrong: "BIN routes to the processor (PBM). PCN routes within the processor. Group ID is the employer/plan. Cardholder ID is the patient. Four pieces — all needed for billing. If any one is wrong or missing, claim rejects with an unhelpful error code."
    )

    static let day9_couponMedicare = RimrockQuestion(
        id: "D9_COUPON_MEDICARE",
        domain: .federalRequirements,
        topic: "ANTI_KICKBACK",
        prompt: "Why can't a manufacturer copay coupon be applied to a prescription billed through Medicare?",
        options: [
            "Federal anti-kickback statute prohibits it",
            "Medicare doesn't accept coupons",
            "Manufacturers don't allow it",
            "It causes a billing error"
        ],
        correctAnswer: "Federal anti-kickback statute prohibits it",
        onCorrect: "Anti-kickback. The federal Anti-Kickback Statute prohibits offering anything of value to induce purchases reimbursed by federal healthcare programs (Medicare, Medicaid, TRICARE, VA). Manufacturer coupons that lower the patient's out-of-pocket cost on a Medicare claim count as inducement. Penalties run up to felony for the patient and the pharmacy. Direct patients to the manufacturer's separate patient assistance program — that's a different mechanism, federally permitted.",
        onWrong: "Federal Anti-Kickback Statute. Manufacturer coupons applied to Medicare or Medicaid claims count as illegal inducement; penalties are felony-level. Manufacturers' separate patient assistance programs (PAP) — distinct enrollment, often based on income — ARE permitted. Direct the patient there."
    )

    static let day9_vacationOverride = RimrockQuestion(
        id: "D9_VACATION_OVERRIDE",
        domain: .orderEntry,
        topic: "REFILL_OVERRIDE",
        prompt: "A patient needs a 30-day refill of a maintenance medication 5 days early because they're traveling. What's the correct billing approach?",
        options: [
            "Submit a vacation override (code 03) through the insurance",
            "Refuse the early refill",
            "Bill cash without insurance",
            "Submit normally; insurance will figure it out"
        ],
        correctAnswer: "Submit a vacation override (code 03) through the insurance",
        onCorrect: "Vacation override, NCPDP code 03. Most insurances allow once or twice per year for a 30- or 90-day early refill. If the override is rejected, call the insurance — sometimes the patient just hasn't used theirs yet this year. If they refuse, the patient pays cash for the bridge supply. We don't let chronic-disease patients run out of medication on the road.",
        onWrong: "Vacation override, code 03. Most insurances allow it once or twice annually. If rejected, call the insurance — could be a system glitch, could be the override is already used. Cash bridge fill is the last resort. Patient on chronic meds should not run out on a trip."
    )

    static let day9_priorAuth = RimrockQuestion(
        id: "D9_PRIOR_AUTH",
        domain: .orderEntry,
        topic: "PRIOR_AUTHORIZATION",
        prompt: "An insurance rejection requires \"prior authorization.\" Whose responsibility is it to obtain the PA?",
        options: [
            "The prescriber, who must justify the prescription to the insurance",
            "The pharmacy",
            "The patient",
            "The patient's employer"
        ],
        correctAnswer: "The prescriber, who must justify the prescription to the insurance",
        onCorrect: "The prescriber. Prior authorization is the insurance company's process for confirming medical necessity before paying — only the prescriber can justify the clinical decision. Pharmacy's role: notify the prescriber's office, fax or e-fax the PA request, and tell the patient who's doing what. Average turnaround three to seven business days, longer for specialty drugs. Patient often blames the pharmacy because we're who they see; we explain the process and don't apologize for delays we don't control.",
        onWrong: "The prescriber. They have the clinical justification — what diagnosis, why this drug, why this dose, why not the cheaper alternative. We notify the prescriber's office, fax the PA form, communicate with the patient. We're not the bottleneck even if we look like it. Patient education matters here."
    )
}

// MARK: - Day 10 Questions

extension RimrockQuestion {

    static let day10_oxycodoneClass = RimrockQuestion(
        id: "D10_OXYCODONE_CLASS",
        domain: .medications,
        topic: "OPIOID_PHARMACOLOGY",
        prompt: "Tramadol is best classified as which of the following?",
        options: [
            "Partial mu opioid agonist with SNRI activity",
            "Pure opioid antagonist",
            "Pure mu opioid agonist (similar to morphine)",
            "Non-opioid analgesic"
        ],
        correctAnswer: "Partial mu opioid agonist with SNRI activity",
        onCorrect: "Partial mu agonist plus serotonin and norepinephrine reuptake inhibition. Dual mechanism — that's why it's distinct from morphine, oxycodone, hydromorphone (pure mu agonists). The SNRI side means serotonin syndrome risk when combined with SSRIs, SNRIs, MAOIs, or other serotonergic drugs. C-IV. Lower abuse potential than C-II opioids but real misuse risk; the schedule was tightened in 2014.",
        onWrong: "Partial mu agonist + SNRI activity. Two mechanisms in one molecule. The SNRI piece is what makes it interactive — serotonin syndrome risk with SSRIs, SNRIs, MAOIs, triptans. C-IV scheduled in 2014. Pure mu agonists like morphine and oxycodone don't carry the serotonergic interaction; tramadol does."
    )

    static let day10_redFlags = RimrockQuestion(
        id: "D10_RED_FLAGS",
        domain: .patientSafety,
        topic: "CONTROLLED_RX_RED_FLAGS",
        prompt: "Which of the following is a red flag for a potentially illegitimate controlled-substance prescription?",
        options: [
            "All of these (out-of-area address, cash payment, large quantity, generic diagnosis line)",
            "Out-of-area address only",
            "Cash payment only",
            "None of these are red flags"
        ],
        correctAnswer: "All of these (out-of-area address, cash payment, large quantity, generic diagnosis line)",
        onCorrect: "All of them. The DEA's Pharmacist's Manual lists these and more — out-of-state prescribers for local patients, cash-only payments, unusually large quantities, vague diagnosis (\"chronic pain\"), patients driving past closer pharmacies, multiple short-acting opioids together, prescriptions written outside the prescriber's specialty. Each in isolation might be benign. Stacked, they require investigation.",
        onWrong: "All of those, and combinations. DEA's Pharmacist's Manual catalogs more: out-of-state prescriber for local patient, cash-only, big quantity, vague diagnosis, geographic patterns where patients drive past three pharmacies to fill at one. Each red flag alone is suggestive; stacked, they're actionable. The pharmacist's job is to notice patterns."
    )

    static let day10_correspondingResponsibility = RimrockQuestion(
        id: "D10_CORRESPONDING_RESPONSIBILITY",
        domain: .federalRequirements,
        topic: "CORRESPONDING_RESPONSIBILITY",
        prompt: "Under 21 CFR 1306.04, who shares legal responsibility for ensuring a controlled-substance prescription is for a legitimate medical purpose?",
        options: [
            "Both the prescriber and the dispensing pharmacist",
            "The prescriber alone",
            "The pharmacist alone",
            "The patient"
        ],
        correctAnswer: "Both the prescriber and the dispensing pharmacist",
        onCorrect: "Both. 21 CFR 1306.04 — \"corresponding responsibility.\" The prescription is only valid when issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice. A pharmacist who fills a prescription that should have been recognized as illegitimate shares liability with the prescriber. Federal felony exposure. The phrase \"knew or should have known\" is the legal standard.",
        onWrong: "Both, jointly. 21 CFR 1306.04 — \"corresponding responsibility.\" Pharmacist who fills knowing or who SHOULD HAVE KNOWN the prescription was illegitimate shares the prescriber's liability. Felony exposure. This is the regulation behind every PMP check, every red-flag review, every \"set this one aside.\""
    )

    static let day10_deaLookup = RimrockQuestion(
        id: "D10_DEA_LOOKUP",
        domain: .federalRequirements,
        topic: "DEA_REGISTRATION_LOOKUP",
        prompt: "Where can a pharmacy verify a prescriber's current DEA registration status?",
        options: [
            "DEA Diversion Control website (free public lookup)",
            "By calling the FDA",
            "Only the wholesaler can verify",
            "It cannot be verified externally"
        ],
        correctAnswer: "DEA Diversion Control website (free public lookup)",
        onCorrect: "DEA Diversion Control website — free, public, accessible from any browser. Shows registration status (active, expired, surrendered, revoked), registered schedules, and registration expiration date. Doesn't tell you whether the specific prescription is legitimate, but tells you whether the prescriber is current and what they're authorized to write. Standard due diligence on any unfamiliar prescriber.",
        onWrong: "DEA Diversion Control website, free public lookup. Active, expired, surrendered, revoked. Registered schedules and expiration date. Standard due diligence. It tells you the prescriber is current — it doesn't tell you the specific script is legitimate. That's a separate investigation."
    )
}

