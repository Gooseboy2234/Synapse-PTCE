//
//  RimrockQuestions_Day21_30.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Question content for shift days 21–30. Split out of RimrockContent.swift
//  to keep individual files reviewable.
//

import Foundation

// MARK: - Day 21 Questions

extension RimrockQuestion {

    static let day21_usp797BUD = RimrockQuestion(
        id: "D21_USP_797",
        domain: .orderEntry,
        topic: "USP_797_STERILE",
        prompt: "USP <797> categorizes sterile compounded preparations (CSPs) by what?",
        options: [
            "Risk level and required environment, with corresponding beyond-use dates",
            "Drug class only",
            "Patient diagnosis",
            "Volume of the preparation"
        ],
        correctAnswer: "Risk level and required environment, with corresponding beyond-use dates",
        onCorrect: "Risk and environment determine BUD. Post-2023 revision: Category 1 (lower risk, shorter BUD, less rigorous environment), Category 2 (more rigorous controls, longer BUDs allowed), Category 3 (most rigorous, longest BUDs, ISO 5 in ISO 7 with full validation). Each category has specific environmental, personnel, and validation requirements. Sterile compounding outside the right category is a USP violation and a patient-safety disaster.",
        onWrong: "Risk + environment = BUD. Category 1: lower risk, shorter BUD. Category 2: stricter controls, longer BUDs. Category 3: most rigorous, longest BUDs. Each tier has personnel competency, environmental monitoring, and validation requirements. Sterile compounding done wrong has caused fungal meningitis outbreaks; USP <797> is the response."
    )

    static let day21_usp800Hazardous = RimrockQuestion(
        id: "D21_USP_800",
        domain: .orderEntry,
        topic: "USP_800_HAZARDOUS",
        prompt: "USP <800> applies to which medications?",
        options: [
            "Drugs identified by NIOSH as hazardous to handlers (chemo, certain hormones, antivirals, others)",
            "Only chemotherapy agents",
            "Only injectable medications",
            "Only Schedule II controlled substances"
        ],
        correctAnswer: "Drugs identified by NIOSH as hazardous to handlers (chemo, certain hormones, antivirals, others)",
        onCorrect: "NIOSH list of hazardous drugs. Updated regularly — includes chemo, certain hormones (finasteride, dutasteride, testosterone), antivirals (some), warfarin in some lists, oxytocin, methotrexate, leuprolide, others. USP <800> requires assessment of risk, segregated storage, PPE for handling, environmental controls. Pharmacy must do a Hazardous Drug Risk Assessment and document handling procedures.",
        onWrong: "NIOSH hazardous-drug list. Chemo, hormones, antivirals, oxytocin, warfarin, methotrexate, finasteride, others. Updated regularly. USP <800>: assessment of risk, segregated storage, PPE, environmental controls, hazardous-drug risk assessment documented. Even oral tablet dispensing has handling protocols."
    )

    static let day21_billingUnits = RimrockQuestion(
        id: "D21_BILLING_UNITS",
        domain: .orderEntry,
        topic: "NCPDP_BILLING_UNITS",
        prompt: "An albuterol HFA inhaler weighs 8.5 g of canister contents. One inhaler is dispensed. Per NCPDP D.0, what is the billed quantity?",
        options: ["8.5", "1", "200", "0.085"],
        correctAnswer: "8.5",
        onCorrect: "8.5 — billed in grams of canister contents for inhalers. NCPDP D.0 billing units: solid oral = each tablet/capsule, liquid = milliliter, inhaler = gram, eye drops = milliliter, topical cream = gram, patches = each, vial liquid = milliliter. The trap: \"one inhaler\" feels like quantity 1 but the billing unit is grams.",
        onWrong: "8.5 grams. Billing unit for inhalers is gram of canister contents. Solid oral = each. Liquid = mL. Eye drops = mL. Cream = gram. Patches = each. Vial = mL. NCPDP D.0 specifies. The billing unit ≠ what you intuitively count; rejection codes for billing-unit mismatch are common."
    )

    static let day21_wacAwp = RimrockQuestion(
        id: "D21_WAC_AWP",
        domain: .orderEntry,
        topic: "PHARMACY_PRICING",
        prompt: "What does WAC (Wholesale Acquisition Cost) represent?",
        options: [
            "Manufacturer's list price to wholesalers, before discounts",
            "Average price wholesalers charge pharmacies",
            "Maximum allowable cost reimbursable by insurance",
            "Patient's out-of-pocket cost"
        ],
        correctAnswer: "Manufacturer's list price to wholesalers, before discounts",
        onCorrect: "WAC = manufacturer's list price to wholesalers, before any discounts. Public, published, used as a benchmark in pricing contracts. AWP — Average Wholesale Price — was historically the industry's pricing standard but is largely deprecated due to legal settlements over inflation. Modern reimbursement uses NADAC (National Average Drug Acquisition Cost), AAC, MAC, contract-specific formulas. Pharmacy generally pays close to WAC; insurance reimburses on different formulas, and the gap is the margin.",
        onWrong: "WAC: manufacturer list price to wholesalers before discounts. AWP: largely deprecated, was averaged wholesale charge to pharmacies. Modern pricing uses NADAC, AAC, MAC — multiple benchmarks for different scenarios. We pay close to WAC, get reimbursed on formulas — gap is margin."
    )
}

// MARK: - Day 22 Questions

extension RimrockQuestion {

    static let day22_vaccineStorage = RimrockQuestion(
        id: "D22_VACCINE_STORAGE",
        domain: .orderEntry,
        topic: "VACCINE_STORAGE",
        prompt: "Refrigerated vaccines (e.g., adult flu, hepatitis B, Tdap) require what storage temperature range?",
        options: ["2–8 °C (36–46 °F)", "0–4 °C", "10–15 °C", "-15 to -50 °C"],
        correctAnswer: "2–8 °C (36–46 °F)",
        onCorrect: "Two to eight Celsius. Same range as insulin and most refrigerated medications. Frozen vaccines (some MMR, varicella, zoster) require -50 to -15 °C. Always check the package insert. Excursions outside range require: log the time, log the temperature, log corrective action, contact the manufacturer or state for guidance — vaccine may need to be discarded or may be salvageable depending on the excursion.",
        onWrong: "2–8 °C for refrigerated vaccines. Frozen vaccines (some MMR, varicella, zoster): -50 to -15 °C. Always check the insert. Out-of-range = log time/temp/action, manufacturer or state guidance, possibly discard. Cold chain = patient safety."
    )

    static let day22_planB = RimrockQuestion(
        id: "D22_PLAN_B",
        domain: .medications,
        topic: "EMERGENCY_CONTRACEPTION",
        prompt: "Which emergency contraceptive is available OTC without age restriction or prescription?",
        options: [
            "Levonorgestrel (Plan B One-Step and generics)",
            "Ulipristal acetate (ella)",
            "Mifepristone (Mifeprex)",
            "All require prescription"
        ],
        correctAnswer: "Levonorgestrel (Plan B One-Step and generics)",
        onCorrect: "Levonorgestrel — Plan B One-Step and generics — is OTC, no age, no ID, no questions. Ulipristal (ella) is Rx only. Mifepristone is for medical abortion, not emergency contraception. Counseling: Plan B is most effective in the first 24 hours, decreasing through 72 hours; doesn't work if pregnancy is established; doesn't protect against STIs. Don't ask why; don't editorialize; point to the aisle.",
        onWrong: "Levonorgestrel — OTC, no restrictions. Ulipristal (ella): prescription, longer window (up to 120h), more effective at higher BMI. Mifepristone: not emergency contraception — medical abortion. Patient counseling: timing matters, doesn't protect against STIs, doesn't end an established pregnancy. Treat the patient with the same dignity you'd give any other customer."
    )

    static let day22_btcMethCheck = RimrockQuestion(
        id: "D22_BTC_METHCHECK",
        domain: .federalRequirements,
        topic: "BEHIND_THE_COUNTER",
        prompt: "A pseudoephedrine sale requires which of the following federally?",
        options: [
            "ID, electronic logbook entry, and adherence to daily/monthly purchase limits",
            "Only adult age verification",
            "Pharmacist counseling only",
            "Prescription from a physician"
        ],
        correctAnswer: "ID, electronic logbook entry, and adherence to daily/monthly purchase limits",
        onCorrect: "ID, NPLEX entry, daily/monthly limits. CMEA 2005. Daily: 3.6 g of pseudoephedrine base. Monthly: 9 g. NPLEX (National Precursor Log Exchange) catches multi-pharmacy purchases. Records retained two years. Some states (Oregon, Mississippi) require Schedule V prescription; most states use the federal floor. Behind-the-counter is a real category — not OTC, not Rx, but logged.",
        onWrong: "ID + NPLEX + limits. CMEA 2005: 3.6 g/day, 9 g/month per customer. NPLEX flags multi-pharmacy stacking. Records two years. State variation: Oregon, Mississippi require Rx. Behind-the-counter is its own category between OTC and Rx."
    )

    static let day22_hazardousDisposal = RimrockQuestion(
        id: "D22_HAZARDOUS_DISPOSAL",
        domain: .patientSafety,
        topic: "HAZARDOUS_DISPOSAL",
        prompt: "What's the appropriate disposal route for unused oral chemotherapy returned by a patient's family?",
        options: [
            "DEA take-back program (if controlled) or licensed hazardous-waste vendor — never trash, flush, or pour",
            "Standard pharmacy waste bin",
            "Down the sink with running water",
            "Return to manufacturer for refund"
        ],
        correctAnswer: "DEA take-back program (if controlled) or licensed hazardous-waste vendor — never trash, flush, or pour",
        onCorrect: "DEA take-back for controls; licensed hazardous-waste vendor for non-controlled hazardous drugs. Never trash (animals/scavengers), never flush (water systems), never pour. Most pharmacies aren't authorized to accept patient returns directly; refer to closest take-back location, mail-back program, or state-licensed disposal site. USP <800> handling extends to disposal — proper containment, labeled hazardous, vendor pickup.",
        onWrong: "DEA take-back (controls) or hazardous-waste vendor (non-controlled hazardous). Never trash, flush, or pour. Closest take-back, mail-back program, state-licensed disposal. USP <800> handling continues through disposal — containment, labels, vendor. Public-health backbone of hazardous-drug stewardship."
    )
}

// MARK: - Day 23 Questions

extension RimrockQuestion {

    static let day23_recordsProduction = RimrockQuestion(
        id: "D23_RECORDS_PRODUCTION",
        domain: .federalRequirements,
        topic: "INSPECTION_RECORDS",
        prompt: "During a DEA inspection, what records must a pharmacy be able to produce on request?",
        options: [
            "All controlled-substance records (Form 222s, perpetual logs, biennial inventory, theft reports) plus prescription records — on-site",
            "Only Form 222s",
            "Only the most recent biennial inventory",
            "Records can be retrieved within 30 days; not required on-site"
        ],
        correctAnswer: "All controlled-substance records (Form 222s, perpetual logs, biennial inventory, theft reports) plus prescription records — on-site",
        onCorrect: "All controlled records, on-site, accessible. Form 222s, perpetual log, biennial inventory, Form 41 destruction records, Form 106 theft reports, prescription records (originals or images depending on state), DSCSA transaction records, biennial counts, refusal documentation. Inspection notice may be unannounced. \"On-site, accessible to DEA on request\" is the federal standard.",
        onWrong: "All of them, on-site, accessible. Form 222s, perpetual log, biennial inventory, Form 41 (destruction), Form 106 (theft/loss), prescription records, DSCSA transaction history, refusal documentation. Inspections can be unannounced. The records package is the audit trail; if it's clean, the inspection is fast."
    )

    static let day23_nitroglycerinCounsel = RimrockQuestion(
        id: "D23_NITRO_COUNSEL",
        domain: .medications,
        topic: "NITROGLYCERIN",
        prompt: "Patient counseling for sublingual nitroglycerin should include which of the following?",
        options: [
            "All of these (one tab SL at chest pain onset; repeat in 5 min if needed up to 3 doses then 911; lie down; replace every 6 months)",
            "Only \"call 911 immediately\"",
            "Only \"swallow tablet whole with water\"",
            "Only \"take with food\""
        ],
        correctAnswer: "All of these (one tab SL at chest pain onset; repeat in 5 min if needed up to 3 doses then 911; lie down; replace every 6 months)",
        onCorrect: "All of those. Sublingual — under the tongue, don't swallow. One tablet at chest pain onset. If pain not relieved in five minutes, repeat — up to three tablets total, then call 911. Lie down — light-headedness is normal due to vasodilation. Bottle replacement every six months because heat, light, and air degrade nitroglycerin. Some pharmacies dispense in the manufacturer's brown glass container; don't move it to a non-protective bottle.",
        onWrong: "All of those. Sublingual, one tablet at chest pain onset, repeat at 5 minutes if needed (max 3 then 911), lie down, replace every 6 months — light/heat/air degrade nitro. Counseling on nitro is more critical than counseling on antibiotics; this is acute symptom relief tied to MI risk."
    )

    static let day23_aueditClosing = RimrockQuestion(
        id: "D23_AUDIT_CLOSE",
        domain: .patientSafety,
        topic: "AUDIT_RESPONSE",
        prompt: "After a pharmacy inspection, what's the appropriate response if the inspector identifies a minor recordkeeping deficiency?",
        options: [
            "Document the finding, implement the correction, follow up in writing",
            "Dispute the finding regardless",
            "Ignore it; minor deficiencies don't require follow-up",
            "Close the pharmacy until corrected"
        ],
        correctAnswer: "Document the finding, implement the correction, follow up in writing",
        onCorrect: "Document, correct, follow up in writing. Inspectors expect remediation. A timely, documented correction with written confirmation back to the inspector resolves most findings. Disputing inappropriately or ignoring findings escalates fast. Most pharmacies cycle through findings every audit; that's the system working as intended.",
        onWrong: "Document, correct, written follow-up. Inspectors expect remediation, not perfection. Timely correction + written confirmation closes most findings. Disputes appropriate when finding is wrong; ignoring is never appropriate. Audit findings usually have a 30-day correction window."
    )

    static let day23_pharmacyTechRecord = RimrockQuestion(
        id: "D23_TECH_DOC",
        domain: .orderEntry,
        topic: "DOCUMENTATION_BY_TECH",
        prompt: "When a pharmacy technician transfers a prescription to another pharmacy or refuses a refill, what documentation is required?",
        options: [
            "Date, time, action taken, technician name and certification number, pharmacist authorization where required",
            "Just the date",
            "Documentation is required only for controlled substances",
            "Documentation required only when the patient asks"
        ],
        correctAnswer: "Date, time, action taken, technician name and certification number, pharmacist authorization where required",
        onCorrect: "Full attribution. Date, time, action, technician identity, pharmacist authorization for activities that require pharmacist sign-off. The chain of accountability matters because techs can do many things but can't make pharmacist decisions. Documentation makes the line clear. Some actions (DUR override, controlled substance transfer) require pharmacist documentation regardless of who did the work.",
        onWrong: "Full attribution: date, time, action, tech name + cert number, pharmacist authorization where required. Tech actions are documented; pharmacist decisions require pharmacist signature. The documentation makes the scope-of-practice line legible later."
    )
}

// MARK: - Day 24 Questions

extension RimrockQuestion {

    static let day24_finalReviewMed = RimrockQuestion(
        id: "D24_FINAL_REVIEW_MED",
        domain: .medications,
        topic: "REVIEW_DRUG_INTERACTIONS",
        prompt: "Which combination most increases bleeding risk?",
        options: [
            "Warfarin + ibuprofen",
            "Levothyroxine + acetaminophen",
            "Metformin + omeprazole",
            "Atorvastatin + amlodipine"
        ],
        correctAnswer: "Warfarin + ibuprofen",
        onCorrect: "Warfarin + ibuprofen. NSAID-warfarin combinations carry double the bleed risk: NSAIDs inhibit platelet aggregation AND damage GI mucosa AND can boost INR. Counsel hard against OTC NSAIDs in any patient on warfarin or DOACs. Acetaminophen in moderate doses is the safer analgesic for these patients.",
        onWrong: "Warfarin + ibuprofen. NSAID-anticoagulant combinations: platelet inhibition + GI mucosal damage + INR effects. OTC ibuprofen in a warfarin patient is a frequent cause of preventable GI bleeds. Acetaminophen is the safer analgesic option."
    )

    static let day24_finalReviewPS = RimrockQuestion(
        id: "D24_FINAL_REVIEW_PS",
        domain: .patientSafety,
        topic: "REVIEW_HIGH_ALERT",
        prompt: "Which of the following combines two ISMP high-alert medications and increases the risk profile?",
        options: [
            "Insulin + warfarin",
            "Acetaminophen + ibuprofen",
            "Loratadine + cetirizine",
            "Calcium + vitamin D"
        ],
        correctAnswer: "Insulin + warfarin",
        onCorrect: "Insulin + warfarin. Both are ISMP high-alert. Both have narrow therapeutic windows. Both have devastating outcomes when dosed wrong. A patient on both is at compounded risk for the wrong end of either curve — hypoglycemia, bleeding, or both. Patient education is at least double the work; reconciliation across care transitions is critical.",
        onWrong: "Insulin + warfarin — two high-alert drugs in one patient. Stacked monitoring, stacked patient education, stacked reconciliation. ISMP high-alert list: anticoagulants (warfarin, DOACs, heparin), insulin, opioids, methotrexate, neuromuscular blockers, concentrated electrolytes (KCl), chemotherapy."
    )

    static let day24_finalReviewOE = RimrockQuestion(
        id: "D24_FINAL_REVIEW_OE",
        domain: .orderEntry,
        topic: "REVIEW_DAYS_SUPPLY",
        prompt: "A prescription reads: \"Lisinopril 10 mg, sig 1 tab po BID, disp #60.\" What's the days supply?",
        options: ["30 days", "60 days", "15 days", "Cannot be determined"],
        correctAnswer: "30 days",
        onCorrect: "Thirty days. Two tablets per day at quantity sixty equals thirty days. Insurance reimbursement, refill timing, vacation overrides, days-supply audits all depend on getting this right. Common error: techs calculate days supply on q-day dosing without noticing the BID — leads to a thirty-day fill billed as sixty days. Plausibility-check.",
        onWrong: "Thirty days. Total quantity divided by daily quantity = days supply. 60 ÷ 2 = 30. Always check the sig before billing. Days-supply errors are reimbursement issues AND patient-safety issues — patient runs out earlier than expected, or insurance flags refill-too-soon."
    )

    static let day24_finalReviewFed = RimrockQuestion(
        id: "D24_FINAL_REVIEW_FED",
        domain: .federalRequirements,
        topic: "REVIEW_SCHEDULES",
        prompt: "Which of the following is correctly classified?",
        options: [
            "Hydrocodone-acetaminophen 5/325 — Schedule II",
            "Tramadol — Schedule II",
            "Alprazolam — Schedule II",
            "Pregabalin — Schedule II"
        ],
        correctAnswer: "Hydrocodone-acetaminophen 5/325 — Schedule II",
        onCorrect: "Hydrocodone combinations rescheduled to C-II in 2014 (used to be C-III). Tramadol is C-IV. Alprazolam is C-IV. Pregabalin is C-V. Knowing the schedules is the foundation for correct refill rules, transfer rules, partial-fill rules, recordkeeping rules.",
        onWrong: "Hydrocodone-acetaminophen → C-II (rescheduled 2014). Tramadol → C-IV. Alprazolam (and most benzos) → C-IV. Pregabalin → C-V. Schedule determines refill rules, transfers, recordkeeping, partial-fill rules, and prescription validity timeline."
    )
}

// MARK: - Day 26 Questions

extension RimrockQuestion {

    static let day26_penicillinAllergy = RimrockQuestion(
        id: "D26_PCN_ALLERGY",
        domain: .patientSafety,
        topic: "PCN_CEPH_CROSS",
        prompt: "True cross-reactivity rate between penicillin allergy and cephalosporins (modern data) is approximately...?",
        options: ["1-2% for first-gen, less for later generations", "10% for all cephalosporins", "100% — never use a cephalosporin in penicillin allergy", "Negligible — always safe"],
        correctAnswer: "1-2% for first-gen, less for later generations",
        onCorrect: "About 1-2% for first-generation cephs, less for later generations. The historical 10% figure is outdated. True anaphylaxis to penicillin remains a contraindication for cephalosporins. Rash-only history is more nuanced — many of those aren't true IgE-mediated allergies. Carbapenems carry small risk; aztreonam is structurally different and generally safe even in true penicillin allergy.",
        onWrong: "1-2% modern data for first-gen cephs; less for later. The 10% number was historical and overcalled. True anaphylaxis = still a contraindication. Rash-only history = many aren't real IgE allergies. Aztreonam is structurally distinct and usually safe."
    )

    static let day26_fluoroquinoloneBlackBox = RimrockQuestion(
        id: "D26_FQ_BLACK_BOX",
        domain: .medications,
        topic: "FLUOROQUINOLONE_WARNINGS",
        prompt: "Which is on the FDA black box warnings for fluoroquinolones (levofloxacin, ciprofloxacin, etc.)?",
        options: [
            "All of these (tendon rupture, peripheral neuropathy, CNS effects, aortic aneurysm)",
            "Only tendon rupture",
            "Only QT prolongation",
            "Only nephrotoxicity"
        ],
        correctAnswer: "All of these (tendon rupture, peripheral neuropathy, CNS effects, aortic aneurysm)",
        onCorrect: "All of those. FDA recommends fluoroquinolones be reserved for serious infections when alternatives aren't available. Tendon rupture risk multiplied by concurrent corticosteroids. Aortic aneurysm signal added relatively recently. Counsel patients to stop and call the doctor at any tendon pain. Also: divalent/trivalent cation interactions — separate antacids, calcium, magnesium, iron, zinc by 2 hours before or 6 hours after.",
        onWrong: "All of those. Tendon rupture (worse with steroids), peripheral neuropathy, CNS effects, aortic aneurysm. FDA limits fluoroquinolones to serious infections without alternatives. Counsel: stop at tendon pain. Cation interactions: separate from antacids, dairy, iron, calcium."
    )

    static let day26_macrolideCYP = RimrockQuestion(
        id: "D26_MACROLIDE_CYP",
        domain: .medications,
        topic: "MACROLIDE_INTERACTIONS",
        prompt: "Which macrolide is the cleanest of the class for CYP3A4 interactions?",
        options: ["Azithromycin", "Erythromycin", "Clarithromycin", "All are equally strong CYP3A4 inhibitors"],
        correctAnswer: "Azithromycin",
        onCorrect: "Azithromycin. Erythromycin and clarithromycin are strong CYP3A4 inhibitors — bump levels of statins, calcium channel blockers, warfarin, others. QT prolongation across the class. Azithromycin has the cleanest interaction profile but still has QT risk. Common error: a patient on simvastatin gets azithromycin — statin level rises, rhabdomyolysis risk goes up.",
        onWrong: "Azithromycin — cleanest interaction profile of the macrolides. Erythromycin and clarithromycin are strong CYP3A4 inhibitors, raising levels of statins, CCBs, warfarin. All three carry QT risk. Counsel patients on statins or CCBs about temporary changes during macrolide therapy."
    )

    static let day26_vancomycin = RimrockQuestion(
        id: "D26_VANCOMYCIN",
        domain: .medications,
        topic: "VANCOMYCIN_USE",
        prompt: "Oral vancomycin is indicated for...?",
        options: [
            "C. difficile colitis only",
            "Any systemic infection",
            "MRSA bacteremia",
            "Pneumonia"
        ],
        correctAnswer: "C. difficile colitis only",
        onCorrect: "Oral vancomycin is for C. diff only — it's not absorbed systemically. IV vancomycin is for systemic infection: MRSA, severe gram-positive infections. Red man syndrome is the infusion-rate adverse effect on IV — flushing, pruritus, sometimes hypotension. Slow the infusion to over an hour, pretreat with antihistamines. Not a true allergy.",
        onWrong: "Oral vancomycin — C. diff only, not absorbed. IV vancomycin — systemic infection (MRSA, gram-positive). Red man syndrome on IV is infusion-rate related, not allergy. Slow infusion + antihistamines pretreatment. Trough monitoring required for serious infections — narrow window for renal toxicity."
    )
}

// MARK: - Day 27 Questions

extension RimrockQuestion {

    static let day27_insulinGlargine = RimrockQuestion(
        id: "D27_INSULIN_GLARGINE",
        domain: .medications,
        topic: "INSULIN_PROFILES",
        prompt: "Insulin glargine (Lantus, Basaglar, Toujeo) is best characterized as...?",
        options: [
            "Long-acting basal — onset ~1-2 hr, no real peak, duration up to 24 hr",
            "Rapid-acting — onset 5-15 min, peak 30-90 min, duration 3-5 hr",
            "Short-acting — onset 30 min, peak 2-4 hr, duration 5-8 hr",
            "Ultra-rapid — onset minutes, peak 60 min"
        ],
        correctAnswer: "Long-acting basal — onset ~1-2 hr, no real peak, duration up to 24 hr",
        onCorrect: "Long-acting basal. Compare: rapid-acting (lispro, aspart, glulisine) — onset 5-15 min, peak 30-90 min, duration 3-5 hr. Short-acting regular insulin — onset 30 min, peak 2-4 hr, duration 5-8 hr. NPH (intermediate) — onset 1-2 hr, peak 4-12 hr, duration up to 18 hr. Degludec (Tresiba, ultra-long) — duration 42+ hr. Memorize this table; PTCE asks every variation.",
        onWrong: "Long-acting basal — 1-2 hr onset, no peak, ~24 hr duration. Rapid (lispro, aspart, glulisine): 5-15 min, 30-90 min peak, 3-5 hr. Regular: 30 min onset, 2-4 hr peak, 5-8 hr. NPH: 1-2 hr, 4-12 hr peak, 18 hr. Degludec: 42+ hr. Memorize — PTCE drills this."
    )

    static let day27_sulfonylureaHypoglycemia = RimrockQuestion(
        id: "D27_SULFONYLUREA",
        domain: .medications,
        topic: "SULFONYLUREA_RISK",
        prompt: "The most clinically significant risk with sulfonylureas (glipizide, glyburide, glimepiride) is...?",
        options: [
            "Hypoglycemia, especially with skipped meals or in elderly patients",
            "Severe weight loss",
            "Hypertension",
            "Pancreatitis"
        ],
        correctAnswer: "Hypoglycemia, especially with skipped meals or in elderly patients",
        onCorrect: "Hypoglycemia. Sulfonylureas push the pancreas to release insulin regardless of glucose level. Skipped meal = hypoglycemia. Glyburide especially — long half-life, high hypoglycemia risk in older adults. Beers Criteria flags glyburide. Glipizide is shorter-acting and safer for elderly. Counsel: take with food, recognize hypoglycemia (shakiness, sweating, confusion), keep glucose tabs or juice handy.",
        onWrong: "Hypoglycemia. The class works by stimulating insulin release regardless of glucose level. Skipped meal = hypoglycemia. Glyburide is the worst offender in elderly (Beers list); glipizide is shorter-acting and preferred. Counsel hard: food with each dose, recognize hypoglycemia, keep fast sugar accessible."
    )

    static let day27_glp1SideEffects = RimrockQuestion(
        id: "D27_GLP1_GI",
        domain: .medications,
        topic: "GLP1_SIDE_EFFECTS",
        prompt: "Most common side effects of GLP-1 agonists (semaglutide, liraglutide, tirzepatide)?",
        options: [
            "GI: nausea, vomiting, diarrhea, constipation",
            "Hypertension and tachycardia",
            "Severe hypoglycemia",
            "Hepatotoxicity"
        ],
        correctAnswer: "GI: nausea, vomiting, diarrhea, constipation",
        onCorrect: "GI side effects. Usually transient, settle with dose titration. Boxed warning for thyroid C-cell tumors based on rodent data — clinical concern only with personal/family history of medullary thyroid carcinoma or MEN2. Pancreatitis risk small but real. Counsel: start low, titrate slowly, smaller meals. Once-weekly semaglutide; once-daily liraglutide. Pen storage: refrigerated until first use, room temp once started for the labeled period.",
        onWrong: "GI: nausea, vomiting, diarrhea, constipation. Usually settle with dose titration. Black-box for thyroid C-cell tumors (rodent data; clinical concern with MEN2 or family history of medullary thyroid carcinoma). Pancreatitis small but real risk. Counsel start-low, smaller meals, expect transient GI."
    )

    static let day27_sglt2Mechanism = RimrockQuestion(
        id: "D27_SGLT2_MECH",
        domain: .medications,
        topic: "SGLT2_MECHANISM",
        prompt: "SGLT2 inhibitors (empagliflozin, dapagliflozin, canagliflozin) work by...?",
        options: [
            "Blocking sodium-glucose cotransporter 2 in the proximal renal tubule",
            "Stimulating insulin release from the pancreas",
            "Increasing peripheral insulin sensitivity",
            "Inhibiting alpha-glucosidase in the gut"
        ],
        correctAnswer: "Blocking sodium-glucose cotransporter 2 in the proximal renal tubule",
        onCorrect: "SGLT2 in the proximal tubule. Glucose spills into the urine. A1C drops, weight comes down, blood pressure too. Side effects: genital mycotic infections (sweet urine), euglycemic DKA in stress states, lower-limb amputation signal with canagliflozin specifically, fournier's gangrene rare risk. Cardiovascular and renal benefits beyond glucose lowering — these drugs show up as add-on regardless of A1C in CKD or heart failure.",
        onWrong: "Block SGLT2 in proximal renal tubule → glucose into urine. A1C, weight, BP all drop modestly. Side effects: genital mycotic infections, euglycemic DKA in stress, canagliflozin-specific amputation signal. Cardiovascular and renal benefits proven beyond glucose-lowering — heart failure, CKD indications independent of diabetes."
    )
}

// MARK: - Day 28 Questions

extension RimrockQuestion {

    static let day28_ssriSnri = RimrockQuestion(
        id: "D28_SSRI_SNRI",
        domain: .medications,
        topic: "ANTIDEPRESSANT_CLASSES",
        prompt: "What's the mechanistic difference between SSRIs and SNRIs?",
        options: [
            "SSRIs inhibit serotonin reuptake; SNRIs inhibit both serotonin and norepinephrine reuptake",
            "SSRIs and SNRIs work identically",
            "SSRIs block dopamine; SNRIs block serotonin",
            "SSRIs are stimulants; SNRIs are sedatives"
        ],
        correctAnswer: "SSRIs inhibit serotonin reuptake; SNRIs inhibit both serotonin and norepinephrine reuptake",
        onCorrect: "SSRI = serotonin only. SNRI = serotonin + norepinephrine. SNRIs add noradrenergic effects: increased BP, sweating, sometimes more activating. Both have serotonin syndrome risk with serotonergic combos. TCAs are dirty drugs (anticholinergic, antihistaminergic, alpha-blocking) — overdose cardiotoxic. MAOIs require tyramine restriction and have devastating drug interactions. Counsel: 2-4 weeks for full effect; don't stop abruptly (paroxetine, venlafaxine especially) — discontinuation syndrome.",
        onWrong: "SSRI = serotonin reuptake only. SNRI = serotonin + norepinephrine. SNRIs more activating, may raise BP. Both: serotonin syndrome risk. TCAs: anticholinergic-cardiac risks, fatal in overdose. MAOIs: tyramine restriction. Counsel 2-4 weeks for effect; don't stop abruptly — discontinuation syndrome with paroxetine, venlafaxine, others."
    )

    static let day28_lithiumRange = RimrockQuestion(
        id: "D28_LITHIUM",
        domain: .medications,
        topic: "LITHIUM_RANGE",
        prompt: "Therapeutic range for lithium maintenance therapy?",
        options: ["0.6-1.2 mEq/L", "5-10 mEq/L", "0.05-0.10 mEq/L", "20-40 mEq/L"],
        correctAnswer: "0.6-1.2 mEq/L",
        onCorrect: "0.6-1.2 mEq/L for maintenance. Acute mania can target up to 1.5. Above 1.5: tremor, GI upset, confusion. Above 2: ataxia, severe tremor, seizures. NTI drug. Renally cleared — dehydration, NSAIDs, ACE inhibitors, diuretics raise levels. Sodium intake matters; low sodium raises lithium. Beers Criteria for elderly. Counsel: hydrate consistently, stable salt, no NSAIDs without prescriber, regular level checks.",
        onWrong: "0.6-1.2 mEq/L. Acute mania up to 1.5. Toxic above 1.5; severe above 2. NTI drug. Renally cleared — sensitive to NSAIDs, ACE inhibitors, diuretics, dehydration, sodium changes. Counsel: stable hydration and salt, no NSAIDs, monitor levels regularly."
    )

    static let day28_benzoDependence = RimrockQuestion(
        id: "D28_BENZO_DEPENDENCE",
        domain: .patientSafety,
        topic: "BENZO_DISCONTINUATION",
        prompt: "After several weeks of regular benzodiazepine use, what's the appropriate discontinuation strategy?",
        options: [
            "Gradual taper; abrupt cessation can cause rebound, withdrawal, and seizures",
            "Stop abruptly — benzos do not cause physical dependence",
            "Switch immediately to a different drug class",
            "Halve the dose for one day, then stop"
        ],
        correctAnswer: "Gradual taper; abrupt cessation can cause rebound, withdrawal, and seizures",
        onCorrect: "Gradual taper. Physical dependence after weeks of regular use. Abrupt discontinuation: rebound anxiety, insomnia, tremor — and SEIZURES, especially in patients with seizure disorders or alcohol use. Always taper. Beers Criteria flags benzos for elderly. CDC: don't combine benzos with opioids except in specific monitored situations — stacked respiratory depression. Counsel: don't stop suddenly; don't combine with alcohol.",
        onWrong: "Always taper. Physical dependence after weeks. Abrupt stop = rebound anxiety, insomnia, tremor, SEIZURES. Beers list for elderly. CDC: don't stack with opioids without specific oversight (stacked respiratory depression). Counsel: gradual taper, no alcohol, careful with driving."
    )

    static let day28_tardiveDyskinesia = RimrockQuestion(
        id: "D28_TARDIVE",
        domain: .patientSafety,
        topic: "ANTIPSYCHOTIC_TD",
        prompt: "Tardive dyskinesia is most associated with...?",
        options: [
            "Long-term antipsychotic use, especially first-generation agents",
            "Acute SSRI use",
            "Short-term benzodiazepine use",
            "Lithium therapy"
        ],
        correctAnswer: "Long-term antipsychotic use, especially first-generation agents",
        onCorrect: "Long-term antipsychotic, especially first-gen. Late-onset, sometimes irreversible, repetitive involuntary movements. Higher risk: typicals (haloperidol, chlorpromazine), longer treatment, older age. Acute extrapyramidal symptoms — dystonia, akathisia, parkinsonism — appear earlier and respond to benztropine or anticholinergics. Neuroleptic malignant syndrome is the rare emergency: hyperthermia, rigidity, autonomic instability — stop the drug, supportive care, possibly dantrolene or bromocriptine.",
        onWrong: "Long-term antipsychotic, especially first-gen (haloperidol, chlorpromazine). Late, sometimes irreversible. Risk factors: longer treatment, older age, typicals more than atypicals. Distinct from acute EPS (dystonia, akathisia, parkinsonism — early onset, responds to anticholinergics). Distinct from NMS (hyperthermia, rigidity — emergency)."
    )
}

// MARK: - Day 29 Questions

extension RimrockQuestion {

    static let day29_inhalerClasses = RimrockQuestion(
        id: "D29_INHALER_RESCUE",
        domain: .medications,
        topic: "INHALER_CLASSES",
        prompt: "Which inhaler is the rescue (acute symptom) medication?",
        options: [
            "SABA (short-acting beta-2 agonist) — albuterol",
            "ICS (inhaled corticosteroid) — fluticasone",
            "LABA (long-acting beta-2 agonist) — salmeterol",
            "ICS-LABA combination — fluticasone-salmeterol"
        ],
        correctAnswer: "SABA (short-acting beta-2 agonist) — albuterol",
        onCorrect: "SABA — albuterol. Rapid bronchodilation, used as needed. LABA alone is not for asthma rescue and not for asthma monotherapy — paired with ICS. ICS is daily controller. Combos like Advair are daily controllers, not rescue. Patient using albuterol more than twice a week needs reassessment — marker of inadequate control. Counsel: SABA for acute symptoms; controllers daily even when asymptomatic.",
        onWrong: "SABA — albuterol. Rapid acute bronchodilation. LABA alone never for asthma rescue. ICS daily controller. Combos = daily controllers. Albuterol overuse = uncontrolled asthma. Daily ICS even when asymptomatic. Inhaler technique counseling is half the battle."
    )

    static let day29_spacerTechnique = RimrockQuestion(
        id: "D29_SPACER",
        domain: .patientSafety,
        topic: "INHALER_TECHNIQUE",
        prompt: "Why use a spacer (valved holding chamber) with a metered-dose inhaler?",
        options: [
            "Improves lower-airway delivery; reduces oropharyngeal deposition and ICS-related candidiasis",
            "Allows higher doses without prescriber approval",
            "Eliminates the need to shake the canister",
            "Required by federal law for all MDI prescriptions"
        ],
        correctAnswer: "Improves lower-airway delivery; reduces oropharyngeal deposition and ICS-related candidiasis",
        onCorrect: "Lower-airway delivery improvement. MDIs without spacers deposit significant drug on the back of the throat. Kids and elderly especially can't coordinate the breath-and-press timing. Spacer holds the dose; patient breathes it in slowly. Reduces oropharyngeal candidiasis risk with ICS — patients should rinse mouth after every ICS dose anyway. Counsel: shake before each puff, one puff at a time with spacer, slow deep breath, hold ten seconds.",
        onWrong: "Lower-airway delivery + reduced oropharyngeal deposition. Coordination issue solved — kids, elderly, anyone with timing difficulty. Reduces ICS candidiasis. Always rinse mouth after ICS. Technique: shake (most MDIs), one puff per breath through the spacer, slow deep breath, hold ten seconds."
    )

    static let day29_antiemeticQT = RimrockQuestion(
        id: "D29_ONDANSETRON_QT",
        domain: .patientSafety,
        topic: "ONDANSETRON_QT",
        prompt: "What's the major safety concern with ondansetron at higher doses?",
        options: [
            "QT prolongation (especially above single doses of 16 mg)",
            "Severe constipation",
            "Hypoglycemia",
            "Liver failure"
        ],
        correctAnswer: "QT prolongation (especially above single doses of 16 mg)",
        onCorrect: "QT prolongation. FDA pulled the 32 mg single-dose IV recommendation. Stack with other QT-prolongers (some antibiotics, antipsychotics, antidepressants, methadone) and risk goes up. Most patients are fine; pharmacy DUR catches the additive cases. Counsel: routine doses are safe, but report palpitations, fainting, unusual heart symptoms.",
        onWrong: "QT prolongation, especially above 16 mg single dose. FDA pulled the 32 mg IV indication. Risk goes up when stacked with other QT-prolongers (some macrolides, fluoroquinolones, antipsychotics, methadone). DUR catches the additive risk. Routine doses safe; report palpitations or fainting."
    )

    static let day29_laxatives = RimrockQuestion(
        id: "D29_LAXATIVES",
        domain: .medications,
        topic: "LAXATIVE_FIRST_LINE",
        prompt: "First-line laxative for chronic constipation in most adult patients?",
        options: [
            "Bulk-forming agents (psyllium, methylcellulose) with adequate water",
            "Stimulant laxatives daily (senna, bisacodyl)",
            "Mineral oil long-term",
            "Magnesium citrate weekly"
        ],
        correctAnswer: "Bulk-forming agents (psyllium, methylcellulose) with adequate water",
        onCorrect: "Bulk-forming. Psyllium, methylcellulose. Mimic dietary fiber. Take with adequate water — bulk without water is the trap. Osmotics (PEG/Miralax, lactulose, magnesium hydroxide) are excellent second-line. Stimulants (senna, bisacodyl) are short-term — chronic use causes dependence and dysmotility. Stool softeners are mild, often combined with stimulants. Mineral oil largely deprecated for routine use.",
        onWrong: "Bulk-forming with water (psyllium, methylcellulose). Osmotics (Miralax, lactulose, mag hydroxide) second-line. Stimulants short-term only. Stool softeners mild. Mineral oil deprecated. Lifestyle counseling first: fiber, water, exercise, regular bathroom routine. Don't normalize daily stimulant laxative use."
    )
}

// MARK: - Day 30 Questions

extension RimrockQuestion {

    static let day30_remsPrograms = RimrockQuestion(
        id: "D30_REMS",
        domain: .federalRequirements,
        topic: "REMS_PROGRAMS",
        prompt: "Which is true about REMS (Risk Evaluation and Mitigation Strategies)?",
        options: [
            "FDA-required programs for drugs with serious safety concerns; pharmacy registration often required",
            "Voluntary manufacturer programs",
            "Required only for controlled substances",
            "Only apply to inpatient settings"
        ],
        correctAnswer: "FDA-required programs for drugs with serious safety concerns; pharmacy registration often required",
        onCorrect: "FDA-required for drugs with serious safety concerns. iPledge for isotretinoin (pregnancy prevention); clozapine REMS (agranulocytosis monitoring); mifepristone REMS; several biologics. Pharmacy role varies — sometimes registered dispenser, sometimes patient enrollment verification, always documentation. Each refill may require fresh registry confirmation. REMS programs evolve; always check current requirements.",
        onWrong: "FDA-required for serious-risk drugs. Pharmacy often must be registered. iPledge (isotretinoin), clozapine, mifepristone, various biologics. Pharmacy role varies by program. Always check the current registry requirements before each fill."
    )

    static let day30_immunization = RimrockQuestion(
        id: "D30_IMMUNIZATION",
        domain: .medications,
        topic: "VACCINE_SCHEDULE",
        prompt: "Live attenuated vaccines (e.g., MMR, varicella, intranasal flu) are contraindicated in...?",
        options: [
            "Pregnancy and significantly immunocompromised patients",
            "Adults over 50",
            "Patients with documented egg allergy only",
            "Patients with diabetes"
        ],
        correctAnswer: "Pregnancy and significantly immunocompromised patients",
        onCorrect: "Pregnancy and significant immunocompromise. Live vaccines: MMR, varicella, zoster (live form, mostly replaced by Shingrix), yellow fever, intranasal flu. Inactivated vaccines (most others — flu shot, Tdap, hepatitis A/B, HPV, pneumococcal, Shingrix, COVID): generally safer in immunocompromised but immune response may be reduced. Egg allergy: most flu vaccines are now egg-free or labeled safe; older recommendations were stricter.",
        onWrong: "Pregnancy + significant immunocompromise. Live attenuated: MMR, varicella, zoster (live), yellow fever, intranasal flu. Inactivated (most others): generally OK in immunocompromised but reduced response. Pharmacist administering vaccines documents to state registry, gives VIS before each dose."
    )

    static let day30_contraception = RimrockQuestion(
        id: "D30_CONTRACEPTION",
        domain: .medications,
        topic: "CONTRACEPTION_VTE",
        prompt: "For a 38-year-old patient who smokes, the safest hormonal contraceptive choice is...?",
        options: [
            "Progestin-only (avoids estrogen-related VTE risk)",
            "Combined estrogen-progestin pill at full dose",
            "Combined estrogen-progestin patch",
            "All hormonal contraception is contraindicated"
        ],
        correctAnswer: "Progestin-only (avoids estrogen-related VTE risk)",
        onCorrect: "Progestin-only. Combined estrogen-progestin contraceptives raise VTE (clot) risk; smoking adds to that, especially in patients over 35. CDC USMEC categorizes combined hormonal contraception as MEC 4 (do not use) for smokers ≥35. Progestin-only options: pill (POP), implant (Nexplanon), injection (Depo-Provera), or hormonal IUD. Non-hormonal: copper IUD. Counseling: VTE symptoms, missed-pill rules, drug interactions (rifampin, St. John's wort, some antiseizure meds).",
        onWrong: "Progestin-only — avoids estrogen-VTE stack with smoking. CDC USMEC MEC 4 (don't use) for combined estrogen-progestin in smokers ≥35. Progestin-only: pill, implant, injection, hormonal IUD. Or non-hormonal copper IUD. Counsel VTE symptoms, missed-pill rules, drug interactions (rifampin, St. John's wort)."
    )

    static let day30_stJohnsWort = RimrockQuestion(
        id: "D30_ST_JOHNS_WORT",
        domain: .medications,
        topic: "HERBAL_INTERACTIONS",
        prompt: "St. John's wort affects drug levels primarily through which mechanism?",
        options: [
            "Strong CYP3A4 induction — drops levels of many drugs",
            "CYP3A4 inhibition — raises levels of many drugs",
            "Direct kidney injury",
            "No significant drug interactions"
        ],
        correctAnswer: "Strong CYP3A4 induction — drops levels of many drugs",
        onCorrect: "CYP3A4 induction. St. John's wort is one of the most clinically significant supplement-drug interactions. Lowers levels of: hormonal contraceptives (failure!), warfarin (subtherapeutic INR), statins, immunosuppressants (cyclosporine, tacrolimus), antiretrovirals, SSRIs (with added serotonin syndrome risk from the herbal's own serotonergic effect). Always document supplement use in patient profile — patients don't volunteer it. DSHEA regulates supplements as food, not drugs — quality varies, premarket approval not required.",
        onWrong: "Strong CYP3A4 induction — drops drug levels. Hormonal contraceptives (failure), warfarin (subtherapeutic), statins, immunosuppressants, antiretrovirals all affected. SSRIs: drop levels AND add serotonin syndrome risk. Always med-rec for supplements; DSHEA leaves them outside drug regulation. The interaction list is the longest of any common supplement."
    )
}

