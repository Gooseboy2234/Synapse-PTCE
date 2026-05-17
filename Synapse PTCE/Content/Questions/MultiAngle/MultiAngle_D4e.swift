import Foundation

// Phase 13 — Order Entry / Math Final Gap Fill
// 10 nodes: sig interpretation, volume conversions, reconstitution,
// partial dose, drug concentration, IV admixture, expiration date,
// compounding yield, solution strength, unit conversions (grains/drams)

let multiAngleNodes_D4e: [DataNode] = [

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "SIG INTERPRETATION / ABBREVIATIONS",
        loreText: "Common sig abbreviations: QD/QAM = once daily; BID = twice daily; TID = three times daily; QID = four times daily; QHS = at bedtime; PRN = as needed; AC = before meals; PC = after meals; PO = by mouth; SL = sublingual; TOP = topical; NTE = not to exceed; UD = as directed.",
        challengeType: .multipleChoice,
        options: [
            "A. TID = three times daily; QID = four times daily; QHS = at bedtime; PRN = as needed",
            "B. TID = twice daily; QID = three times daily; BID = four times daily",
            "C. PRN = always; AC = after meals; QHS = every other night",
            "D. QD = four times daily; SL = swallow; PO = topically"
        ],
        correctAnswer: "A. TID = three times daily; QID = four times daily; QHS = at bedtime; PRN = as needed",
        xOffset: 0.50,
        yOffset: 0.850,
        baseConceptTitle: "Sig Abbreviations"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "VOLUME CONVERSIONS / OZ AND TBSP",
        loreText: "Key volume conversions: 1 fluid ounce (fl oz) = 30 mL; 1 tablespoon (tbsp) = 15 mL; 1 teaspoon (tsp) = 5 mL; 1 pint = 473 mL (~480 mL); 1 gallon = 3,785 mL. Example: patient instructed to take 2 tbsp BID × 10 days — total volume = (2 × 15 mL) × 2 × 10 = 600 mL.",
        challengeType: .multipleChoice,
        options: [
            "A. 1 fl oz = 30 mL; 1 tbsp = 15 mL; 1 tsp = 5 mL; 1 pint ≈ 480 mL",
            "B. 1 fl oz = 15 mL; 1 tbsp = 30 mL; 1 tsp = 10 mL",
            "C. 1 fl oz = 20 mL; 1 tbsp = 10 mL; 1 pint = 300 mL",
            "D. 1 tbsp = 5 mL; 1 tsp = 15 mL; 1 fl oz = 45 mL"
        ],
        correctAnswer: "A. 1 fl oz = 30 mL; 1 tbsp = 15 mL; 1 tsp = 5 mL; 1 pint ≈ 480 mL",
        xOffset: 0.54,
        yOffset: 0.850,
        baseConceptTitle: "Volume Conversions"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "RECONSTITUTION CALCULATIONS",
        loreText: "Reconstitution: adding diluent to a powder to make a solution. Formula: C1 × V1 = C2 × V2. Example: Amoxicillin 125 mg/5 mL, 150 mL bottle. Dose = 250 mg. Volume per dose = (250 mg ÷ 125 mg) × 5 mL = 10 mL. Days supply = 150 mL ÷ 10 mL/dose ÷ 3 doses/day = 5 days.",
        challengeType: .multipleChoice,
        options: [
            "A. Amoxicillin 125 mg/5 mL: 250 mg dose requires 10 mL; 150 mL bottle = 5-day supply at TID dosing",
            "B. Amoxicillin 125 mg/5 mL: 250 mg dose requires 5 mL",
            "C. Reconstitution always yields 1 mg/mL concentration regardless of labeled strength",
            "D. Days supply = total volume ÷ dose volume only (ignore dosing frequency)"
        ],
        correctAnswer: "A. Amoxicillin 125 mg/5 mL: 250 mg dose requires 10 mL; 150 mL bottle = 5-day supply at TID dosing",
        xOffset: 0.58,
        yOffset: 0.850,
        baseConceptTitle: "Reconstitution Calculations"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "TABLET SCORING / PARTIAL DOSES",
        loreText: "Partial doses require scored tablets for safe splitting. Only split along the score line. Example: Warfarin 7.5 mg daily prescribed; available as 5 mg and 10 mg tablets. One approach: alternate 5 mg one day, 10 mg next day (average 7.5 mg/day). Or: half a 10 mg scored tablet + half a 5 mg = 7.5 mg. Capsules cannot be split.",
        challengeType: .multipleChoice,
        options: [
            "A. Only scored tablets can be safely split; capsules cannot be split for partial doses",
            "B. Any tablet can be safely split regardless of coating or scoring",
            "C. Capsules can be split by pouring out half the contents",
            "D. Extended-release tablets can be split as long as the dose is halved"
        ],
        correctAnswer: "A. Only scored tablets can be safely split; capsules cannot be split for partial doses",
        xOffset: 0.62,
        yOffset: 0.850,
        baseConceptTitle: "Tablet Scoring Partial Doses"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "DRUG CONCENTRATION CALCULATIONS",
        loreText: "Concentration = amount ÷ volume. Example: prepare 100 mL of 0.9% NaCl solution. Amount of NaCl needed = 0.9% × 100 mL = 0.9 g = 900 mg. Percent weight/volume (w/v): grams of solute per 100 mL. Percent volume/volume (v/v): mL of solute per 100 mL. Percent weight/weight (w/w): grams per 100 g.",
        challengeType: .multipleChoice,
        options: [
            "A. 0.9% NaCl = 0.9 g NaCl per 100 mL; a 250 mL bag contains 2.25 g of NaCl",
            "B. 0.9% NaCl means 0.9 mg of NaCl per 100 mL",
            "C. Percent weight/volume is expressed as mL of solute per 100 mL of solution",
            "D. A 1% solution contains 10 mg of drug per 100 mL"
        ],
        correctAnswer: "A. 0.9% NaCl = 0.9 g NaCl per 100 mL; a 250 mL bag contains 2.25 g of NaCl",
        xOffset: 0.66,
        yOffset: 0.850,
        baseConceptTitle: "Drug Concentration Calculations"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "IV ADMIXTURE PREPARATION",
        loreText: "IV admixture: adding drug to IV fluid. Example: prepare vancomycin 1500 mg in 250 mL NS. Vancomycin comes as 1 g/10 mL (100 mg/mL). Volume to withdraw = 1500 mg ÷ 100 mg/mL = 15 mL. Total bag volume = 250 mL + 15 mL = 265 mL (remove 15 mL from bag first if fixed volume needed). Infuse over 90 minutes.",
        challengeType: .multipleChoice,
        options: [
            "A. Vancomycin 1500 mg from 100 mg/mL stock: withdraw 15 mL and add to IV bag",
            "B. Vancomycin 1500 mg from 100 mg/mL stock: withdraw 150 mL",
            "C. Always add full vial contents regardless of ordered dose",
            "D. Vancomycin concentration does not need to be verified before admixture"
        ],
        correctAnswer: "A. Vancomycin 1500 mg from 100 mg/mL stock: withdraw 15 mL and add to IV bag",
        xOffset: 0.70,
        yOffset: 0.850,
        baseConceptTitle: "IV Admixture Preparation"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "EXPIRATION DATE INTERPRETATION",
        loreText: "Federal law: expiration date on manufacturer label = last day of the labeled month. If label reads 'EXP 09/2026' — valid through September 30, 2026. Beyond-use date (BUD): assigned by pharmacy upon dispensing or compounding, usually shorter than manufacturer expiration. BUD ≤ manufacturer expiration date.",
        challengeType: .multipleChoice,
        options: [
            "A. EXP 09/2026 means the drug is valid through September 30, 2026 — the last day of that month",
            "B. EXP 09/2026 means the drug expires on September 1, 2026",
            "C. Expiration date refers to when the drug becomes toxic, not when potency changes",
            "D. Beyond-use date assigned by pharmacy can exceed the manufacturer expiration date"
        ],
        correctAnswer: "A. EXP 09/2026 means the drug is valid through September 30, 2026 — the last day of that month",
        xOffset: 0.74,
        yOffset: 0.850,
        baseConceptTitle: "Expiration Date Interpretation"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "COMPOUNDING YIELD CALCULATIONS",
        loreText: "Compounding yield: amount of final product made. Example: compound 60 g of 2.5% hydrocortisone cream. Active ingredient needed = 2.5% × 60 g = 1.5 g hydrocortisone. If hydrocortisone powder is 100% pure: weigh 1.5 g of powder. Geometric dilution technique used for potent drugs. All ingredients must be weighed accurately.",
        challengeType: .multipleChoice,
        options: [
            "A. To make 60 g of 2.5% hydrocortisone cream: weigh 1.5 g of hydrocortisone powder",
            "B. To make 60 g of 2.5% hydrocortisone cream: weigh 2.5 g of hydrocortisone powder",
            "C. Percent in compounding recipes refers to mg per 100 g (not g per 100 g)",
            "D. 60 g of 2.5% cream requires 60 × 2.5 = 150 g of active ingredient"
        ],
        correctAnswer: "A. To make 60 g of 2.5% hydrocortisone cream: weigh 1.5 g of hydrocortisone powder",
        xOffset: 0.78,
        yOffset: 0.850,
        baseConceptTitle: "Compounding Yield Calculations"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "APOTHECARY UNITS / GRAINS AND DRAMS",
        loreText: "Legacy apothecary conversions still tested on PTCE: 1 grain (gr) = 64.8 mg ≈ 65 mg. 1 dram = 60 grains ≈ 4 g (liquid: 1 fl dram = 4 mL). 1 ounce apothecary = 480 grains ≈ 31 g. Example: Convert gr x (10 grains) to mg: 10 × 65 = 650 mg. Aspirin 5 grains = 325 mg (standard tablet).",
        challengeType: .multipleChoice,
        options: [
            "A. 1 grain ≈ 65 mg; aspirin 5 grains = 325 mg; gr x (10 grains) = 650 mg",
            "B. 1 grain = 100 mg; aspirin 5 grains = 500 mg",
            "C. 1 dram = 15 mL; 1 grain = 1 mg",
            "D. Apothecary units are no longer tested and can be ignored on the PTCE"
        ],
        correctAnswer: "A. 1 grain ≈ 65 mg; aspirin 5 grains = 325 mg; gr x (10 grains) = 650 mg",
        xOffset: 0.82,
        yOffset: 0.850,
        baseConceptTitle: "Apothecary Unit Conversions"
    ),

    DataNode(
        id: UUID(),
        domain: .orderEntry,
        nodeTitle: "DAYS SUPPLY / COMPLEX CALCULATIONS",
        loreText: "Days supply calculation: total quantity dispensed ÷ quantity used per day. Variable dosing: example — Prednisone taper: 40 mg × 3 days, 20 mg × 3 days, 10 mg × 3 days, 5 mg × 3 days. Tablets dispensed: (2+1+0.5+0.25) × 3 = 11.25 tablets if using 20 mg tablets. PRN medications: use maximum daily dose for days supply calculation.",
        challengeType: .multipleChoice,
        options: [
            "A. For PRN medications, use maximum daily dose to calculate days supply for insurance billing",
            "B. Days supply for PRN medications assumes once daily use regardless of instructions",
            "C. Taper regimens always count as a 30-day supply for insurance purposes",
            "D. Days supply is only calculated by the prescriber, not the pharmacy"
        ],
        correctAnswer: "A. For PRN medications, use maximum daily dose to calculate days supply for insurance billing",
        xOffset: 0.86,
        yOffset: 0.850,
        baseConceptTitle: "Complex Days Supply Calculation"
    ),
]
