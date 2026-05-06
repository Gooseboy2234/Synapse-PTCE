//
//  BlueprintFills2.swift
//  Synapse PTCE
//
//  Second pass against the PTCB blueprint, plugging the three remaining
//  thin areas after BlueprintFills.swift:
//
//    1. Math drill volume — bring per-type problem count up from ~4-10 to
//       ~15+ to match dedicated math-review books.
//    2. Federal record-keeping timelines — Form 222/41/106/224 retention,
//       HIPAA / DSCSA records, biennial inventory cycle, refill limits,
//       emergency C-II 7-day rule, registration validity.
//    3. CDC vaccine schedule depth — birth / 2-mo / MMR-varicella / HPV /
//       Tdap intervals / pneumococcal in 65+ / Shingrix / live-vaccine
//       spacing / pregnancy Tdap / contraindications / VFC eligibility.
//
//  Loaded in GameEngine.makeAsync() after blueprintFillNodes.
//

import Foundation

extension DataNode {

    static let blueprintFillNodes2: [DataNode] = [

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  MATH — BSA & WEIGHT                                             ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "BSA / DUBOIS",
            loreText: "DuBois formula: BSA (m²) = 0.007184 × height(cm)^0.725 × weight(kg)^0.425. The Mosteller formula — BSA = √(height × weight ÷ 3600) — is the simpler approximation used in retail/clinical practice. For a 170 cm, 70 kg adult: √(170×70/3600) = √3.31 ≈ 1.82 m².",
            options: [
                "A. ≈1.82 m² (Mosteller)",
                "B. ≈0.95 m²",
                "C. ≈3.31 m²",
                "D. ≈11.9 m²"
            ], correctAnswer: "A. ≈1.82 m² (Mosteller)",
            xOffset: 0.05, yOffset: 0.78, baseConceptTitle: "BSA Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "BSA / PEDS",
            loreText: "A child weighs 18 kg, height 110 cm. Calculate BSA via Mosteller. √(110 × 18 ÷ 3600) = √(0.55) = 0.74 m². If the chemo dose is 250 mg/m², actual dose = 250 × 0.74 = 185 mg.",
            options: [
                "A. BSA ≈ 0.74 m²; dose = 185 mg",
                "B. BSA ≈ 1.50 m²; dose = 375 mg",
                "C. BSA ≈ 0.30 m²; dose = 75 mg",
                "D. BSA ≈ 2.10 m²; dose = 525 mg"
            ], correctAnswer: "A. BSA ≈ 0.74 m²; dose = 185 mg",
            xOffset: 0.10, yOffset: 0.78, baseConceptTitle: "BSA Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "BSA / ADULT CHEMO",
            loreText: "Patient: 165 cm, 60 kg. BSA = √(165 × 60 / 3600) = √2.75 ≈ 1.66 m². Cisplatin order: 75 mg/m² IV. Calculated dose = 75 × 1.66 = 124.5 mg. Round per institution policy (typically nearest 5 mg = 125 mg).",
            options: [
                "A. BSA ≈ 1.66 m²; dose ≈ 124.5 mg (≈125 mg rounded)",
                "B. BSA ≈ 0.83 m²; dose ≈ 62 mg",
                "C. BSA ≈ 2.75 m²; dose ≈ 206 mg",
                "D. BSA ≈ 1.10 m²; dose ≈ 82 mg"
            ], correctAnswer: "A. BSA ≈ 1.66 m²; dose ≈ 124.5 mg (≈125 mg rounded)",
            xOffset: 0.15, yOffset: 0.78, baseConceptTitle: "BSA Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "WEIGHT / LB→KG",
            loreText: "Conversion: 1 kg = 2.2 lb (approximate, exact 2.20462). To convert pounds → kilograms, divide by 2.2. A 154 lb adult = 154/2.2 = 70 kg.",
            options: [
                "A. 70 kg",
                "B. 154 kg",
                "C. 339 kg",
                "D. 35 kg"
            ], correctAnswer: "A. 70 kg",
            xOffset: 0.20, yOffset: 0.78, baseConceptTitle: "Weight Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "WEIGHT / MG/KG",
            loreText: "Order: amoxicillin 50 mg/kg/day divided q8h for a 22-lb child. Step 1: convert pounds — 22/2.2 = 10 kg. Step 2: total daily dose = 50 × 10 = 500 mg/day. Step 3: divided q8h (3 doses) = 500/3 ≈ 167 mg/dose.",
            options: [
                "A. ≈167 mg/dose",
                "B. 500 mg/dose",
                "C. 50 mg/dose",
                "D. 1100 mg/dose"
            ], correctAnswer: "A. ≈167 mg/dose",
            xOffset: 0.25, yOffset: 0.78, baseConceptTitle: "Weight Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "WEIGHT / VANCOMYCIN",
            loreText: "Order: vancomycin 15 mg/kg q12h for a 88-kg adult. Dose = 15 × 88 = 1320 mg q12h. Round to nearest 250 mg available in IVPB premix → 1250 mg or 1500 mg per institution rule. Maximum single dose typically 2000 mg.",
            options: [
                "A. 1320 mg q12h calculated; round to 1250 or 1500 mg per institution rule",
                "B. 88 mg q12h",
                "C. 220 mg q12h",
                "D. 5280 mg q12h"
            ], correctAnswer: "A. 1320 mg q12h calculated; round to 1250 or 1500 mg per institution rule",
            xOffset: 0.30, yOffset: 0.78, baseConceptTitle: "Weight Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "WEIGHT / IBW",
            loreText: "Ideal Body Weight (Devine): Males = 50 kg + 2.3 kg per inch over 5 ft. Females = 45.5 kg + 2.3 kg per inch over 5 ft. A 5'10\" male: 50 + 2.3×10 = 73 kg. Used for renal dosing of aminoglycosides, vancomycin (depending on protocol), and some weight-based opioids.",
            options: [
                "A. ≈73 kg (50 + 2.3 × 10 in)",
                "B. ≈100 kg",
                "C. ≈45.5 kg",
                "D. ≈58 kg"
            ], correctAnswer: "A. ≈73 kg (50 + 2.3 × 10 in)",
            xOffset: 0.35, yOffset: 0.78, baseConceptTitle: "Weight Math"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  MATH — % STRENGTH                                               ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / W/V",
            loreText: "% w/v means grams per 100 mL. 0.9% NaCl = 0.9 g of NaCl per 100 mL. In a 1000 mL bag of 0.9% NS: 0.9 × (1000/100) = 9 g NaCl total.",
            options: [
                "A. 9 g NaCl in 1000 mL of 0.9%",
                "B. 0.9 g NaCl",
                "C. 90 g NaCl",
                "D. 0.09 g NaCl"
            ], correctAnswer: "A. 9 g NaCl in 1000 mL of 0.9%",
            xOffset: 0.05, yOffset: 0.83, baseConceptTitle: "Percent Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / D5W",
            loreText: "How many grams of dextrose are in a 1000 mL bag of D5W (5% w/v)? 5 g per 100 mL × 10 (because 1000 mL is 10 × 100 mL) = 50 g.",
            options: [
                "A. 50 g",
                "B. 5 g",
                "C. 500 g",
                "D. 0.5 g"
            ], correctAnswer: "A. 50 g",
            xOffset: 0.10, yOffset: 0.83, baseConceptTitle: "Percent Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / W/W",
            loreText: "% w/w means grams of solute per 100 g of total preparation. 1% hydrocortisone ointment = 1 g HC per 100 g of finished ointment. In 30 g of 1% HC: 0.30 g HC.",
            options: [
                "A. 0.30 g HC in 30 g of 1% ointment",
                "B. 1 g HC per 30 g",
                "C. 3 g HC per 30 g",
                "D. 0.03 g HC per 30 g"
            ], correctAnswer: "A. 0.30 g HC in 30 g of 1% ointment",
            xOffset: 0.15, yOffset: 0.83, baseConceptTitle: "Percent Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / V/V",
            loreText: "% v/v means mL of solute per 100 mL of total. 70% isopropyl alcohol = 70 mL alcohol per 100 mL solution. In 500 mL of 70% IPA: 350 mL alcohol.",
            options: [
                "A. 350 mL alcohol in 500 mL of 70% IPA",
                "B. 70 mL alcohol",
                "C. 7 mL alcohol",
                "D. 35 mL alcohol"
            ], correctAnswer: "A. 350 mL alcohol in 500 mL of 70% IPA",
            xOffset: 0.20, yOffset: 0.83, baseConceptTitle: "Percent Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / FROM GRAMS",
            loreText: "If you dissolve 4 g of a powder in enough water to make 80 mL of solution, what is the % w/v? 4 g / 80 mL × 100 = 5%.",
            options: [
                "A. 5%",
                "B. 4%",
                "C. 0.5%",
                "D. 50%"
            ], correctAnswer: "A. 5%",
            xOffset: 0.25, yOffset: 0.83, baseConceptTitle: "Percent Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "% STRENGTH / SUSP",
            loreText: "An amoxicillin suspension is 250 mg per 5 mL. What is the % w/v? 250 mg = 0.25 g; per 5 mL → multiply by 20 to get per 100 mL = 5 g/100 mL = 5%.",
            options: [
                "A. 5%",
                "B. 0.5%",
                "C. 50%",
                "D. 2.5%"
            ], correctAnswer: "A. 5%",
            xOffset: 0.30, yOffset: 0.83, baseConceptTitle: "Percent Strength"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  MATH — RATIO STRENGTH                                           ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "RATIO / 1:1000",
            loreText: "Ratio strength 1:1000 (w/v) means 1 g per 1000 mL. Epinephrine 1:1000 = 1 mg/mL (1 g = 1000 mg, divided by 1000 mL = 1 mg/mL). 1:10,000 = 0.1 mg/mL (cardiac arrest dosing).",
            options: [
                "A. 1:1000 = 1 mg/mL; 1:10,000 = 0.1 mg/mL",
                "B. 1:1000 = 0.1 mg/mL",
                "C. 1:1000 = 1 g/mL",
                "D. 1:1000 = 0.001 mg/mL"
            ], correctAnswer: "A. 1:1000 = 1 mg/mL; 1:10,000 = 0.1 mg/mL",
            xOffset: 0.05, yOffset: 0.88, baseConceptTitle: "Ratio Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "RATIO / TO PERCENT",
            loreText: "Convert ratio strength 1:200 to %. 1:200 means 1 g per 200 mL. % w/v = (1 g / 200 mL) × 100 = 0.5%.",
            options: [
                "A. 0.5%",
                "B. 1%",
                "C. 5%",
                "D. 0.05%"
            ], correctAnswer: "A. 0.5%",
            xOffset: 0.10, yOffset: 0.88, baseConceptTitle: "Ratio Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "RATIO / PERCENT TO RATIO",
            loreText: "Convert 0.1% w/v to ratio strength. 0.1% = 0.1 g / 100 mL = 1 g / 1000 mL = 1:1000.",
            options: [
                "A. 1:1000",
                "B. 1:100",
                "C. 1:10,000",
                "D. 1:10"
            ], correctAnswer: "A. 1:1000",
            xOffset: 0.15, yOffset: 0.88, baseConceptTitle: "Ratio Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "RATIO / DRUG MASS",
            loreText: "How many milligrams of epinephrine in a 30 mL ampule of 1:10,000? 1:10,000 = 1 g / 10,000 mL = 100 mg / 1000 mL = 0.1 mg/mL. 30 mL × 0.1 mg/mL = 3 mg total.",
            options: [
                "A. 3 mg total in 30 mL of 1:10,000",
                "B. 30 mg",
                "C. 0.3 mg",
                "D. 300 mg"
            ], correctAnswer: "A. 3 mg total in 30 mL of 1:10,000",
            xOffset: 0.20, yOffset: 0.88, baseConceptTitle: "Ratio Strength"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "RATIO / 1:200 OINTMENT",
            loreText: "How many grams of an active ingredient in 60 g of a 1:200 (w/w) ointment? 1:200 means 1 g per 200 g of base. 60 g / 200 = 0.3 g active.",
            options: [
                "A. 0.3 g",
                "B. 3 g",
                "C. 30 g",
                "D. 0.03 g"
            ], correctAnswer: "A. 0.3 g",
            xOffset: 0.25, yOffset: 0.88, baseConceptTitle: "Ratio Strength"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  MATH — DILUTION C₁V₁ = C₂V₂                                     ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DILUTION / C1V1",
            loreText: "C₁V₁ = C₂V₂. To make 100 mL of 0.5% solution from 5% stock: V₁ = (C₂V₂)/C₁ = (0.5 × 100)/5 = 10 mL of 5% stock + 90 mL diluent.",
            options: [
                "A. 10 mL of 5% stock + 90 mL diluent",
                "B. 50 mL of 5% stock + 50 mL diluent",
                "C. 100 mL of 5% stock + 0 mL diluent",
                "D. 5 mL of 5% stock + 95 mL diluent"
            ], correctAnswer: "A. 10 mL of 5% stock + 90 mL diluent",
            xOffset: 0.05, yOffset: 0.93, baseConceptTitle: "Dilution"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DILUTION / IV PIGGYBACK",
            loreText: "Order: 50 mg/100 mL of an antibiotic IVPB; stock is 100 mg/mL. Volume of stock = (50 mg)/(100 mg/mL) = 0.5 mL. Add 0.5 mL of stock to a 100 mL bag.",
            options: [
                "A. 0.5 mL stock added to 100 mL bag",
                "B. 5 mL stock added to 100 mL bag",
                "C. 50 mL stock added",
                "D. 100 mL stock added"
            ], correctAnswer: "A. 0.5 mL stock added to 100 mL bag",
            xOffset: 0.10, yOffset: 0.93, baseConceptTitle: "Dilution"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DILUTION / RECONSTITUTE",
            loreText: "A vial labeled 'Add 4.6 mL diluent for final concentration 250 mg/mL'. Drug per vial = 250 × 4.6 ≈ 1150 mg. Always note the FINAL concentration after reconstitution, not the powder mass alone.",
            options: [
                "A. Drug ≈ 1150 mg (250 mg/mL × 4.6 mL)",
                "B. 4.6 mg total",
                "C. 250 mg total",
                "D. 5 g total"
            ], correctAnswer: "A. Drug ≈ 1150 mg (250 mg/mL × 4.6 mL)",
            xOffset: 0.15, yOffset: 0.93, baseConceptTitle: "Dilution"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DILUTION / DOWN",
            loreText: "Dilute 500 mL of 10% solution to 4%. C₁V₁ = C₂V₂ → V₂ = (10 × 500)/4 = 1250 mL final. Add 750 mL diluent to the original 500 mL.",
            options: [
                "A. Add 750 mL diluent → 1250 mL of 4% final",
                "B. Add 500 mL → 1000 mL of 4%",
                "C. Add 1500 mL → 2000 mL of 4%",
                "D. Add 250 mL → 750 mL of 4%"
            ], correctAnswer: "A. Add 750 mL diluent → 1250 mL of 4% final",
            xOffset: 0.20, yOffset: 0.93, baseConceptTitle: "Dilution"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DILUTION / TPN",
            loreText: "TPN base contains 70% dextrose stock. Order: prepare 1000 mL with 25% final dextrose. C₁V₁ = C₂V₂ → V₁ = (25 × 1000)/70 = 357 mL of 70% stock + 643 mL of other components/water.",
            options: [
                "A. 357 mL of 70% stock + 643 mL other (total 1000 mL)",
                "B. 250 mL of 70% stock + 750 mL water",
                "C. 700 mL of 70% stock + 300 mL water",
                "D. 175 mL of 70% stock + 825 mL water"
            ], correctAnswer: "A. 357 mL of 70% stock + 643 mL other (total 1000 mL)",
            xOffset: 0.25, yOffset: 0.93, baseConceptTitle: "Dilution"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  MATH — mEq, SPECIFIC GRAVITY, TEMP, ROMAN, AWP, APOTHECARY      ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "MEQ / NACL",
            loreText: "mEq = (mg × valence) ÷ molecular weight. NaCl (MW 58.5, valence 1): 1 mEq Na = 1 mEq Cl = 58.5 mg NaCl. So 1 g NaCl = 1000/58.5 ≈ 17.1 mEq.",
            options: [
                "A. 1 g NaCl ≈ 17.1 mEq",
                "B. 1 g NaCl ≈ 1 mEq",
                "C. 1 g NaCl ≈ 58.5 mEq",
                "D. 1 g NaCl ≈ 100 mEq"
            ], correctAnswer: "A. 1 g NaCl ≈ 17.1 mEq",
            xOffset: 0.05, yOffset: 0.98, baseConceptTitle: "mEq Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "MEQ / KCL",
            loreText: "Potassium chloride MW = 74.5, valence 1. 1 mEq K = 74.5 mg KCl. Standard 10 mEq KCl tablet = 745 mg KCl. 20 mEq = 1490 mg ≈ 1.5 g.",
            options: [
                "A. 10 mEq KCl ≈ 745 mg",
                "B. 10 mEq KCl ≈ 10 mg",
                "C. 10 mEq KCl ≈ 74.5 g",
                "D. 10 mEq KCl ≈ 1 mg"
            ], correctAnswer: "A. 10 mEq KCl ≈ 745 mg",
            xOffset: 0.10, yOffset: 0.98, baseConceptTitle: "mEq Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "MEQ / CALCIUM",
            loreText: "Calcium has valence 2. CaCl₂ MW = 111. 1 mEq Ca = 111/2 = 55.5 mg CaCl₂. So 10 mEq = 555 mg CaCl₂. (Note: calcium gluconate, MW 430, gives different mEq-to-mg conversion — 215 mg/mEq.)",
            options: [
                "A. CaCl₂: 1 mEq ≈ 55.5 mg (because valence 2)",
                "B. CaCl₂: 1 mEq = 111 mg",
                "C. CaCl₂: 1 mEq = 1 mg",
                "D. CaCl₂: 1 mEq = 1000 mg"
            ], correctAnswer: "A. CaCl₂: 1 mEq ≈ 55.5 mg (because valence 2)",
            xOffset: 0.15, yOffset: 0.98, baseConceptTitle: "mEq Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "SG / VOLUME-MASS",
            loreText: "Specific gravity (SG) is unitless: density of substance ÷ density of water. Glycerin SG = 1.26 → 1 mL of glycerin weighs 1.26 g. To weigh out 50 g of glycerin: V = mass/SG = 50/1.26 ≈ 39.7 mL.",
            options: [
                "A. ≈39.7 mL of glycerin (SG 1.26) for 50 g",
                "B. 63 mL",
                "C. 50 mL",
                "D. 25 mL"
            ], correctAnswer: "A. ≈39.7 mL of glycerin (SG 1.26) for 50 g",
            xOffset: 0.20, yOffset: 0.98, baseConceptTitle: "Specific Gravity"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "TEMP / C TO F",
            loreText: "Conversions: °F = (°C × 9/5) + 32. °C = (°F − 32) × 5/9. Refrigerated 2-8°C → 35.6-46.4°F. CRT 20-25°C → 68-77°F. USP common ranges to memorize.",
            options: [
                "A. Fridge 2–8°C ≈ 36–46°F; CRT 20–25°C ≈ 68–77°F",
                "B. Fridge 2–8°C = 2–8°F",
                "C. Fridge 2–8°C ≈ 100–120°F",
                "D. CRT 20–25°C ≈ 50–60°F"
            ], correctAnswer: "A. Fridge 2–8°C ≈ 36–46°F; CRT 20–25°C ≈ 68–77°F",
            xOffset: 0.25, yOffset: 0.98, baseConceptTitle: "Temperature"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "ROMAN / NUMERALS",
            loreText: "Common Roman numerals on prescriptions: ss = ½, i = 1, ii = 2, iii = 3, iv = 4, v = 5, vi = 6, x = 10, xx = 20, l = 50, c = 100. \"Disp viiss\" = dispense 7½.",
            options: [
                "A. viiss = 7½",
                "B. viiss = 12",
                "C. viiss = 8.25",
                "D. viiss = 75"
            ], correctAnswer: "A. viiss = 7½",
            xOffset: 0.30, yOffset: 0.98, baseConceptTitle: "Roman Numerals"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "AWP / MARKUP",
            loreText: "Pharmacy buys metformin 500 mg #100 at AWP $4.20. Pharmacy markup 50% + dispensing fee $1.25. Selling price = $4.20 × 1.50 + $1.25 = $6.30 + $1.25 = $7.55.",
            options: [
                "A. $7.55",
                "B. $6.30",
                "C. $4.20",
                "D. $9.45"
            ], correctAnswer: "A. $7.55",
            xOffset: 0.35, yOffset: 0.98, baseConceptTitle: "AWP Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "AWP / GROSS MARGIN",
            loreText: "Gross margin % = (selling price − cost) ÷ selling price × 100. Drug costs $40, sells for $60. Margin = (60−40)/60 × 100 = 33.3%. Distinct from markup % which uses cost as denominator (50% in this case).",
            options: [
                "A. Margin 33.3% (markup 50%)",
                "B. Margin 50% (markup 33.3%)",
                "C. Margin = markup = 25%",
                "D. Margin 60%"
            ], correctAnswer: "A. Margin 33.3% (markup 50%)",
            xOffset: 0.40, yOffset: 0.98, baseConceptTitle: "AWP Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "APOTHECARY / TSP-ML",
            loreText: "Household / apothecary equivalents to memorize: 1 tsp = 5 mL, 1 tbsp = 15 mL, 1 fl oz = 30 mL, 1 cup = 240 mL, 1 pint = 480 mL, 1 quart = 960 mL. 1 grain (gr) = 65 mg (some sources 60 mg). 1 lb = 454 g (16 oz).",
            options: [
                "A. 1 tsp = 5 mL; 1 fl oz = 30 mL; 1 grain ≈ 65 mg",
                "B. 1 tsp = 15 mL; 1 fl oz = 5 mL",
                "C. 1 tsp = 30 mL",
                "D. 1 grain = 100 mg"
            ], correctAnswer: "A. 1 tsp = 5 mL; 1 fl oz = 30 mL; 1 grain ≈ 65 mg",
            xOffset: 0.45, yOffset: 0.98, baseConceptTitle: "Apothecary"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "APOTHECARY / GRAINS",
            loreText: "Aspirin 5 grain dose ≈ 325 mg (5 × 65 mg/grain ≈ 325 mg, the standard adult aspirin tablet). Phenobarbital ¼ grain ≈ 16 mg. \"gr i\" on a prescription = 1 grain.",
            options: [
                "A. 5 gr aspirin ≈ 325 mg",
                "B. 5 gr aspirin ≈ 81 mg",
                "C. 5 gr aspirin ≈ 1000 mg",
                "D. 5 gr aspirin ≈ 50 mg"
            ], correctAnswer: "A. 5 gr aspirin ≈ 325 mg",
            xOffset: 0.50, yOffset: 0.98, baseConceptTitle: "Apothecary"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAYS SUPPLY / INHALER",
            loreText: "Albuterol HFA 90 mcg, 200 puffs/inhaler, sig 2 puffs q4-6h prn (assume q6h = 4 doses/day). Daily puffs = 2 × 4 = 8 puffs. Days supply = 200/8 = 25 days. PTCB allows estimating max-use days for PRN inhalers.",
            options: [
                "A. ≈25 days (200 puffs / 8 puffs/day at q6h)",
                "B. ≈100 days",
                "C. ≈12 days",
                "D. ≈5 days"
            ], correctAnswer: "A. ≈25 days (200 puffs / 8 puffs/day at q6h)",
            xOffset: 0.55, yOffset: 0.98, baseConceptTitle: "Days Supply Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAYS SUPPLY / EYE",
            loreText: "Latanoprost 2.5 mL bottle, 1 drop in each eye HS (q24h). Eye drops standard: 20 drops/mL. Total drops = 2.5 × 20 = 50 drops. Daily use = 2 drops (one each eye). Days = 50/2 = 25 days.",
            options: [
                "A. ≈25 days",
                "B. ≈50 days",
                "C. ≈10 days",
                "D. ≈100 days"
            ], correctAnswer: "A. ≈25 days",
            xOffset: 0.60, yOffset: 0.98, baseConceptTitle: "Days Supply Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DAYS SUPPLY / INSULIN",
            loreText: "Insulin glargine U-100, 10 mL vial = 1000 units. Sig: 24 units sub-Q at bedtime (24 units/day). Days supply = 1000/24 ≈ 41 days. Bill insurance for 41 days; vial discarded after 28-30 days post-puncture per manufacturer.",
            options: [
                "A. Calculated 41 days but vial discarded ~28-30 days post-puncture",
                "B. 100 days",
                "C. 10 days",
                "D. 240 days"
            ], correctAnswer: "A. Calculated 41 days but vial discarded ~28-30 days post-puncture",
            xOffset: 0.65, yOffset: 0.98, baseConceptTitle: "Days Supply Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DRIP / DROPS PER MIN",
            loreText: "Order: 1000 mL D5W over 8 h with drop factor 20 gtt/mL. Rate (mL/h) = 1000/8 = 125 mL/h. gtt/min = (125 × 20)/60 = 41.7 → ~42 gtt/min.",
            options: [
                "A. ≈42 gtt/min",
                "B. ≈21 gtt/min",
                "C. ≈125 gtt/min",
                "D. ≈8 gtt/min"
            ], correctAnswer: "A. ≈42 gtt/min",
            xOffset: 0.70, yOffset: 0.98, baseConceptTitle: "Drip Rate Math"),
        DataNode(id: UUID(), domain: .orderEntry, nodeTitle: "DRIP / MICRODRIP",
            loreText: "Microdrip set: 60 gtt/mL (always — used for pediatric / precise rates). Order: 50 mL over 30 min via microdrip. mL/h = 50/0.5 = 100 mL/h. gtt/min = (100 × 60)/60 = 100 gtt/min.",
            options: [
                "A. 100 gtt/min on a 60 gtt/mL microdrip set",
                "B. 50 gtt/min",
                "C. 25 gtt/min",
                "D. 10 gtt/min"
            ], correctAnswer: "A. 100 gtt/min on a 60 gtt/mL microdrip set",
            xOffset: 0.75, yOffset: 0.98, baseConceptTitle: "Drip Rate Math"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  FEDERAL RECORD-KEEPING TIMELINES                                ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "DEA RETENTION / 222",
            loreText: "DEA Form 222 (paper Schedule II ordering form) and CSOS electronic records must be retained at the registered location for 2 years. Available for DEA inspection on request. White copy stays with pharmacy after the supplier returns the green copy.",
            options: [
                "A. 2 years on-site",
                "B. 6 years on-site",
                "C. 10 years off-site allowed",
                "D. 90 days, then destroy"
            ], correctAnswer: "A. 2 years on-site",
            xOffset: 0.05, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "DEA RETENTION / 41",
            loreText: "DEA Form 41 (controlled substance destruction / disposal record) — retained for 2 years after the destruction event. Required when controlled substances are destroyed, including reverse distribution and on-site witnessed destruction.",
            options: [
                "A. 2 years",
                "B. 6 years",
                "C. 1 year",
                "D. 5 years"
            ], correctAnswer: "A. 2 years",
            xOffset: 0.10, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "DEA RETENTION / 106",
            loreText: "DEA Form 106 (theft or significant loss of controlled substances) — must be filed with DEA within ONE BUSINESS DAY of discovery. Retain copy on-site for 2 years. Includes circumstances, parties involved, full inventory of loss.",
            options: [
                "A. File within 1 business day of discovery; retain 2 years",
                "B. File within 30 days; retain 6 years",
                "C. File within 6 months; retain 90 days",
                "D. No filing needed if loss is small"
            ], correctAnswer: "A. File within 1 business day of discovery; retain 2 years",
            xOffset: 0.15, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "DEA / FORM 224",
            loreText: "DEA Form 224 — pharmacy registration to dispense controlled substances. Renewed every 3 YEARS. Pharmacy must register at each location. Renewal at deadiversion.usdoj.gov. Failure to renew → loss of controlled-dispensing authority.",
            options: [
                "A. Renewed every 3 years",
                "B. Renewed annually",
                "C. Renewed every 5 years",
                "D. Lifetime registration"
            ], correctAnswer: "A. Renewed every 3 years",
            xOffset: 0.20, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "INVENTORY / BIENNIAL",
            loreText: "Federal CSA biennial inventory: every 2 YEARS, the pharmacy must take a complete physical count of all controlled substances on-hand. Schedule II counted exactly; Schedule III–V can be estimated for containers with >1000 units. Records retained on-site for 2 years.",
            options: [
                "A. Every 2 years; CII counted exactly; CIII–V can estimate >1000-count containers",
                "B. Every 6 months",
                "C. Annually for all schedules",
                "D. Every 5 years"
            ], correctAnswer: "A. Every 2 years; CII counted exactly; CIII–V can estimate >1000-count containers",
            xOffset: 0.25, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "INVENTORY / INITIAL",
            loreText: "Initial inventory required when pharmacy first becomes a DEA registrant. Newly scheduled drug requires inventory inclusion on the EFFECTIVE DATE of scheduling. Both records retained on-site, accessible to DEA on request.",
            options: [
                "A. Initial inventory at first registration; newly scheduled drug on effective date",
                "B. Initial inventory only required for chains",
                "C. No inventory needed for newly scheduled drugs",
                "D. Inventory delayed up to 1 year after registration"
            ], correctAnswer: "A. Initial inventory at first registration; newly scheduled drug on effective date",
            xOffset: 0.30, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "CII / EMERGENCY",
            loreText: "Emergency oral C-II prescriptions: pharmacist may dispense an emergency quantity sufficient for the emergency period. Prescriber must provide a written follow-up Rx within 7 days. Document call, prescriber name, DEA, drug, quantity, sig in pharmacy records.",
            options: [
                "A. Emergency quantity allowed; written Rx required within 7 days",
                "B. Written Rx required within 30 days",
                "C. Written Rx required within 24 hours",
                "D. Written follow-up not required"
            ], correctAnswer: "A. Emergency quantity allowed; written Rx required within 7 days",
            xOffset: 0.35, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "CII / VALID PERIOD",
            loreText: "C-II prescriptions are valid for 6 months from the date issued (federal — many states are stricter). After 6 months, the prescription cannot be filled and a new Rx must be obtained. Partial fills allowed, but remaining quantity must be filled within 30 days of original Rx (CARA 2016).",
            options: [
                "A. CII valid 6 months from issue (federal); partial fill remainder within 30 days",
                "B. Valid 1 year from issue",
                "C. Valid only on date of issue",
                "D. Valid indefinitely"
            ], correctAnswer: "A. CII valid 6 months from issue (federal); partial fill remainder within 30 days",
            xOffset: 0.40, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "REFILLS / CIII-V",
            loreText: "Schedule III, IV, V prescriptions: maximum 5 refills within 6 months from date of issue, whichever comes first. After either limit, a new prescription is required. Must be transmitted via paper, fax, oral, or EPCS by authorized prescriber.",
            options: [
                "A. Max 5 refills within 6 months — either limit ends the original Rx",
                "B. Unlimited refills within 1 year",
                "C. Max 12 refills within 1 year",
                "D. No refills permitted"
            ], correctAnswer: "A. Max 5 refills within 6 months — either limit ends the original Rx",
            xOffset: 0.45, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "POWER OF ATTORNEY",
            loreText: "DEA Form 222 / CSOS — registrant may execute Power of Attorney authorizing one or more designated agents to sign 222s on behalf of the pharmacy. POA must be filed at the registered location, signed by the registrant. POA can be revoked at any time and must be retained 2 years after revocation.",
            options: [
                "A. Designated agent may sign 222s under POA; POA retained 2 years after revocation",
                "B. Only registrant can ever sign — no POA permitted",
                "C. POA must be filed with DEA before use",
                "D. POA never expires"
            ], correctAnswer: "A. Designated agent may sign 222s under POA; POA retained 2 years after revocation",
            xOffset: 0.50, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "HIPAA / RECORDS",
            loreText: "HIPAA requires retention of compliance documentation (Notice of Privacy Practices, written authorizations, breach notifications, training records, BAAs) for 6 YEARS from the date of creation or the last effective date — whichever is later. Patient PHI itself follows state record-keeping laws.",
            options: [
                "A. HIPAA compliance docs: 6 years from creation or last effective date",
                "B. HIPAA compliance docs: 2 years",
                "C. HIPAA compliance docs: indefinite",
                "D. No retention requirement"
            ], correctAnswer: "A. HIPAA compliance docs: 6 years from creation or last effective date",
            xOffset: 0.55, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "DSCSA / RECORDS",
            loreText: "DSCSA (Drug Supply Chain Security Act) Transaction Information / Statement / History records — retained for 6 YEARS from the date of the transaction. Pharmacy must be able to produce records on request from FDA, state board, or law enforcement.",
            options: [
                "A. DSCSA records: 6 years from transaction",
                "B. DSCSA records: 2 years",
                "C. DSCSA records: 90 days",
                "D. DSCSA records optional"
            ], correctAnswer: "A. DSCSA records: 6 years from transaction",
            xOffset: 0.60, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "OBRA-90 / COUNSELING",
            loreText: "OBRA-90 (Omnibus Budget Reconciliation Act of 1990) federally requires pharmacist offer of counseling for new Medicaid prescriptions (most states extended to all prescriptions). Document the OFFER, and document the patient's accept/decline. Retain documentation per state law (typically 2-7 years).",
            options: [
                "A. Document the counseling OFFER and the patient's accept/decline; state retention typically 2-7 years",
                "B. Counseling is optional and undocumented",
                "C. Only document if patient accepts",
                "D. Federal law requires accept-only documentation"
            ], correctAnswer: "A. Document the counseling OFFER and the patient's accept/decline; state retention typically 2-7 years",
            xOffset: 0.65, yOffset: 1.03, baseConceptTitle: "Federal Records"),
        DataNode(id: UUID(), domain: .federalRequirements, nodeTitle: "CII SEPARATE FILING",
            loreText: "Federal options for filing C-II prescriptions: (1) keep in a SEPARATE file; OR (2) file with C-III-V if each C-II is stamped with red ink \"C\" not less than 1 inch tall in the lower right corner. Some states mandate separate filing regardless. Records retained 2 years.",
            options: [
                "A. Separate file OR red \"C\" ≥1 inch on each CII; retain 2 years",
                "B. CII can be filed with anything, no marking",
                "C. Stored only electronically — no paper",
                "D. Mixed file with no requirements"
            ], correctAnswer: "A. Separate file OR red \"C\" ≥1 inch on each CII; retain 2 years",
            xOffset: 0.70, yOffset: 1.03, baseConceptTitle: "Federal Records"),

        // ╔══════════════════════════════════════════════════════════════════╗
        // ║  CDC VACCINE SCHEDULE DEPTH                                      ║
        // ╚══════════════════════════════════════════════════════════════════╝

        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / BIRTH",
            loreText: "Birth-dose vaccine: HepB (1st of 3-dose series). Universal recommendation since 1991 — protects against perinatal Hep B transmission and gives lifelong immunity if completed.",
            options: [
                "A. HepB (1st dose at birth)",
                "B. MMR (1st dose)",
                "C. DTaP (1st dose)",
                "D. Influenza (1st dose)"
            ], correctAnswer: "A. HepB (1st dose at birth)",
            xOffset: 0.05, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / 2-MO",
            loreText: "2-month visit: DTaP #1, IPV (polio) #1, Hib #1, PCV15/20 (pneumococcal conjugate) #1, Rotavirus #1, HepB #2. The big visit. Catch-up schedules exist for delayed starts.",
            options: [
                "A. DTaP, IPV, Hib, PCV, Rotavirus, HepB at 2 months",
                "B. MMR and varicella at 2 months",
                "C. HPV at 2 months",
                "D. Tdap at 2 months"
            ], correctAnswer: "A. DTaP, IPV, Hib, PCV, Rotavirus, HepB at 2 months",
            xOffset: 0.10, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / MMR",
            loreText: "MMR (measles, mumps, rubella) — first dose at 12-15 months, second dose at 4-6 years (kindergarten entry). Live attenuated vaccine. Contraindicated in pregnancy, severe immunocompromise. Earlier dose at 6-11 months for international travel.",
            options: [
                "A. 1st dose 12-15 mo; 2nd dose 4-6 yr; live attenuated",
                "B. 1st dose at birth; 2nd at 6 months",
                "C. Single dose only at 18 months",
                "D. 3-dose series at 2/4/6 months"
            ], correctAnswer: "A. 1st dose 12-15 mo; 2nd dose 4-6 yr; live attenuated",
            xOffset: 0.15, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / VARICELLA",
            loreText: "Varicella (chickenpox) — 1st dose at 12-15 months, 2nd dose at 4-6 years. Live attenuated. Contraindicated in pregnancy, severe immunocompromise. Combination MMRV available age 1-12.",
            options: [
                "A. 1st dose 12-15 mo; 2nd dose 4-6 yr; live attenuated",
                "B. 1st dose at birth",
                "C. Single dose at age 18",
                "D. Inactivated, no live concerns"
            ], correctAnswer: "A. 1st dose 12-15 mo; 2nd dose 4-6 yr; live attenuated",
            xOffset: 0.20, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / HPV",
            loreText: "HPV (Gardasil 9) — recommended start at age 11-12 (can begin at 9). 2-dose series IF starting before 15 (0, 6-12 months). 3-dose series if starting at 15+ (0, 1-2, 6 months). Approved through age 45 for catch-up after shared decision-making.",
            options: [
                "A. Start age 11-12; 2 doses if <15, 3 doses if ≥15",
                "B. Start age 18; 2 doses",
                "C. Single dose only at any age",
                "D. Birth dose"
            ], correctAnswer: "A. Start age 11-12; 2 doses if <15, 3 doses if ≥15",
            xOffset: 0.25, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / TDAP",
            loreText: "Tdap booster: every 10 YEARS for adults. Adolescent Tdap dose at 11-12 years (or as catch-up). Tdap during EVERY pregnancy at 27-36 weeks gestation (preferably 27-30) — passive antibody transfer protects neonate from pertussis.",
            options: [
                "A. Adult Tdap booster every 10 years; pregnancy Tdap each gestation 27-36 weeks",
                "B. Tdap once in adulthood — never again",
                "C. Tdap every year",
                "D. Tdap only for travel"
            ], correctAnswer: "A. Adult Tdap booster every 10 years; pregnancy Tdap each gestation 27-36 weeks",
            xOffset: 0.30, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / PNEUMOCOCCAL",
            loreText: "Adult pneumococcal vaccination at 65+: PCV15 followed by PPSV23 (≥1 year later) OR a single dose of PCV20 alone. PCV20 is the simpler regimen — no PPSV23 needed. High-risk adults <65 (chronic disease, immunocompromise, smokers): vaccinate earlier per CDC ACIP.",
            options: [
                "A. 65+: PCV15→PPSV23 OR single PCV20; high-risk <65 also indicated",
                "B. Pneumococcal vaccine only for children",
                "C. Single dose of PPSV23 only at any age",
                "D. Annual pneumococcal booster"
            ], correctAnswer: "A. 65+: PCV15→PPSV23 OR single PCV20; high-risk <65 also indicated",
            xOffset: 0.35, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / SHINGRIX",
            loreText: "Shingrix (recombinant zoster vaccine) — recommended for adults 50+ as a 2-dose series, 2-6 months apart. Replaces Zostavax (live, discontinued in US). Also indicated for immunocompromised adults ≥19 years old.",
            options: [
                "A. Adults 50+: 2-dose Shingrix 2-6 months apart; immunocompromised 19+",
                "B. Single dose at age 70 only",
                "C. Annual booster",
                "D. Only for those who have had shingles"
            ], correctAnswer: "A. Adults 50+: 2-dose Shingrix 2-6 months apart; immunocompromised 19+",
            xOffset: 0.40, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / FLU",
            loreText: "Influenza vaccine: annually for everyone aged 6 months and older. Most patients get standard inactivated; adults 65+ get high-dose (Fluzone HD) or adjuvanted (Fluad) for stronger immune response. Live attenuated nasal flumist age 2-49 (not pregnant, not immunocompromised).",
            options: [
                "A. Annual flu starting age 6 months; 65+ get high-dose; nasal LAIV age 2-49 only",
                "B. Flu vaccine only every 5 years",
                "C. Only for adults over 65",
                "D. Same formulation for all ages"
            ], correctAnswer: "A. Annual flu starting age 6 months; 65+ get high-dose; nasal LAIV age 2-49 only",
            xOffset: 0.45, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SCHEDULE / RSV",
            loreText: "RSV vaccines (since 2023): Adults 60+ may receive single-dose Arexvy or Abrysvo via shared decision-making. Pregnant patients 32-36 weeks gestation receive Abrysvo to protect newborn. Infants without maternal vaccination receive nirsevimab (monoclonal Ab — not a vaccine).",
            options: [
                "A. Adults 60+ shared decision; pregnancy 32-36 wks Abrysvo; infants → nirsevimab if mom unvaccinated",
                "B. Universal recommendation for all adults annually",
                "C. RSV vaccine only for travel",
                "D. No RSV vaccine exists"
            ], correctAnswer: "A. Adults 60+ shared decision; pregnancy 32-36 wks Abrysvo; infants → nirsevimab if mom unvaccinated",
            xOffset: 0.50, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SPACING / LIVE",
            loreText: "Live vaccines (MMR, varicella, MMRV, LAIV/Flumist, Yellow Fever, Zostavax legacy, Rotavirus): if not given on the SAME DAY, must be separated by at least 28 DAYS. Inactivated vaccines have no spacing requirement with each other or with live vaccines.",
            options: [
                "A. Two live vaccines: same day OR ≥28 days apart; inactivated vaccines: no spacing",
                "B. All vaccines must be 28 days apart",
                "C. Live vaccines must be 90 days apart",
                "D. Inactivated must be 28 days from live"
            ], correctAnswer: "A. Two live vaccines: same day OR ≥28 days apart; inactivated vaccines: no spacing",
            xOffset: 0.55, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX CONTRAINDICATIONS",
            loreText: "Live vaccines contraindicated in: pregnancy, severe immunocompromise (chemo, high-dose steroids, transplant, advanced HIV with low CD4). Anaphylaxis to a previous dose or component (egg for some flu, gelatin for MMR/varicella) is a contraindication for THAT vaccine.",
            options: [
                "A. Live: avoid in pregnancy, severe immunocompromise, anaphylaxis to component",
                "B. No vaccine has any contraindication",
                "C. Pregnancy precludes ALL vaccines",
                "D. Egg allergy precludes all flu vaccines"
            ], correctAnswer: "A. Live: avoid in pregnancy, severe immunocompromise, anaphylaxis to component",
            xOffset: 0.60, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX SITE / IM",
            loreText: "IM injection sites: deltoid for adolescents/adults; vastus lateralis (anterolateral thigh) for infants <12 months. Needle: 1-1.5\" 22-25 gauge for adults; 5/8-1\" for infants. SubQ (MMR, varicella, zoster, some flu): 5/8\" needle, 25-27 gauge, into upper-outer triceps.",
            options: [
                "A. IM: deltoid (adult), vastus lateralis (<12 mo); SubQ: triceps with 5/8\" needle",
                "B. All vaccines IM in the deltoid",
                "C. All vaccines into the gluteus",
                "D. SubQ goes into the calf"
            ], correctAnswer: "A. IM: deltoid (adult), vastus lateralis (<12 mo); SubQ: triceps with 5/8\" needle",
            xOffset: 0.65, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),
        DataNode(id: UUID(), domain: .patientSafety, nodeTitle: "VAX VFC / ELIGIBILITY",
            loreText: "Vaccines for Children (VFC) federal program covers children 0-18 who are: Medicaid-eligible, uninsured, American Indian/Alaska Native, or underinsured (received at FQHC or RHC only). VFC vaccines are FREE — pharmacies/clinics may charge an admin fee, but cannot deny based on inability to pay it.",
            options: [
                "A. 0-18: Medicaid-eligible, uninsured, AI/AN, or underinsured at FQHC/RHC",
                "B. All children regardless of insurance",
                "C. Adults under 65",
                "D. Only Medicare patients"
            ], correctAnswer: "A. 0-18: Medicaid-eligible, uninsured, AI/AN, or underinsured at FQHC/RHC",
            xOffset: 0.70, yOffset: 1.08, baseConceptTitle: "CDC Schedule"),

    ]   // end blueprintFillNodes2
}
