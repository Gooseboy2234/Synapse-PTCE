import Foundation

// Multi-Angle Phase 11 — Critical PTCE Drugs Expansion
// 14 drug categories × 4 angles = 56 nodes (all with full MCQ content)
// Drugs: Apixaban, Rivaroxaban, Quetiapine, Risperidone, Semaglutide,
//        Empagliflozin, Amphetamine, Cetirizine, Metronidazole, Allopurinol,
//        Ondansetron, Alendronate, Clindamycin, Colchicine

let multiAngleNodes_D1g: [DataNode] = [

    // ============================================================
    // APIXABAN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Direct oral anticoagulant (DOAC); factor Xa inhibitor.
        > INDICATIONS:
        >   1. Non-valvular atrial fibrillation (stroke/embolism prevention)
        >   2. DVT and PE treatment
        >   3. DVT/PE prophylaxis (post-hip/knee replacement)
        > BRAND: Eliquis
        > ADVANTAGE OVER WARFARIN: No routine INR monitoring; fewer dietary restrictions; predictable pharmacokinetics.
        > REVERSAL: Andexanet alfa (Andexxa) — FDA-approved reversal agent.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Apixaban is indicated for all types of atrial fibrillation, including valvular (mechanical valve) AF",
            "B. Apixaban is indicated for non-valvular AF, DVT/PE treatment and prophylaxis; reversed by andexanet alfa; no routine INR monitoring required",
            "C. Apixaban's primary indication is myocardial infarction prevention in patients with coronary artery disease",
            "D. Apixaban requires weekly INR monitoring to ensure therapeutic anticoagulation"
        ],
        correctAnswer: "B. Apixaban is indicated for non-valvular AF, DVT/PE treatment and prophylaxis; reversed by andexanet alfa; no routine INR monitoring required",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.15,
        angle: .indication,
        baseConceptTitle: "APIXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Direct, selective, reversible inhibitor of Factor Xa.
        > PATHWAY: Factor Xa is required to convert prothrombin → thrombin; without thrombin, fibrinogen cannot form fibrin clot.
        > ORAL BIOAVAILABILITY: ~50%; dual elimination (renal 27%, fecal).
        > HALF-LIFE: ~12 hours; twice-daily dosing for treatment, once-daily for prophylaxis in some contexts.
        > NO: Does not inhibit thrombin directly (unlike dabigatran); does not require antithrombin (unlike heparin).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Apixaban works by directly inhibiting thrombin (Factor IIa), preventing fibrin clot formation",
            "B. Apixaban directly and selectively inhibits Factor Xa, blocking prothrombin → thrombin conversion; ~50% oral bioavailability; dual elimination (renal + fecal)",
            "C. Apixaban requires antithrombin III as a cofactor to exert its anticoagulant effect",
            "D. Apixaban inhibits Vitamin K epoxide reductase, preventing clotting factor synthesis"
        ],
        correctAnswer: "B. Apixaban directly and selectively inhibits Factor Xa, blocking prothrombin → thrombin conversion; ~50% oral bioavailability; dual elimination (renal + fecal)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.15,
        angle: .mechanism,
        baseConceptTitle: "APIXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLEEDING: Major risk — GI bleed, intracranial hemorrhage; no routine monitoring.
        > AVOID: With other anticoagulants, antiplatelets (increased bleed risk).
        > P-GP + CYP3A4: Dual inhibitors (ketoconazole, ritonavir) ↑ apixaban levels → reduce dose or avoid.
        > INDUCERS: Rifampin, carbamazepine, phenytoin → ↓ apixaban levels → avoid combination.
        > RENAL: Dose reduce if 2 of 3 criteria met: age ≥80, weight ≤60 kg, SCr ≥1.5 mg/dL.
        > SURGICAL: Hold 24–48 hrs pre-surgery (48 hrs for high bleed risk); bridging generally not needed.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Apixaban dose reduction is required when any single criterion (age, weight, or SCr) is abnormal",
            "B. Apixaban dose reduce (2.5 mg BID) when ≥2 of 3 criteria: age ≥80, weight ≤60 kg, SCr ≥1.5; dual P-gp/CYP3A4 inhibitors raise levels; inducers (rifampin) reduce levels",
            "C. Rifampin increases apixaban levels through P-glycoprotein inhibition",
            "D. Apixaban requires bridging with heparin before surgical procedures"
        ],
        correctAnswer: "B. Apixaban dose reduce (2.5 mg BID) when ≥2 of 3 criteria: age ≥80, weight ≤60 kg, SCr ≥1.5; dual P-gp/CYP3A4 inhibitors raise levels; inducers (rifampin) reduce levels",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.15,
        angle: .safety,
        baseConceptTitle: "APIXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "APIXABAN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > AF STROKE PREVENTION: 5 mg BID (reduce to 2.5 mg BID if ≥2 of 3 criteria met).
        > DVT/PE TREATMENT: 10 mg BID × 7 days, then 5 mg BID.
        > DVT/PE PREVENTION (post-orthopedic surgery): 2.5 mg BID × 12 days (knee) or 35 days (hip).
        > RENAL IMPAIRMENT: Avoid if CrCl <25 mL/min (limited data); 2.5 mg BID criteria applies.
        > MISSED DOSE: Take same day; skip if <6 hrs to next dose.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The standard apixaban dose for DVT/PE treatment is 5 mg BID throughout the entire treatment course",
            "B. DVT/PE treatment: 10 mg BID × 7 days then 5 mg BID; AF: 5 mg BID (or 2.5 mg BID if ≥2 criteria); post-op prophylaxis: 2.5 mg BID",
            "C. Apixaban for AF prevention is dosed once daily at 10 mg",
            "D. Apixaban dosing is the same for all indications at 5 mg BID"
        ],
        correctAnswer: "B. DVT/PE treatment: 10 mg BID × 7 days then 5 mg BID; AF: 5 mg BID (or 2.5 mg BID if ≥2 criteria); post-op prophylaxis: 2.5 mg BID",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.15,
        angle: .dosing,
        baseConceptTitle: "APIXABAN"
    ),

    // ============================================================
    // RIVAROXABAN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Direct Factor Xa inhibitor (DOAC); brand: Xarelto.
        > INDICATIONS:
        >   1. Non-valvular AF — stroke prevention
        >   2. DVT/PE treatment and prevention (post-knee/hip surgery)
        >   3. Prophylaxis in medically ill patients
        >   4. Reduction of CV events in CAD/PAD (2.5 mg BID with aspirin)
        > REVERSAL: Andexanet alfa (Andexxa).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban is approved for use in patients with mechanical heart valves for stroke prevention",
            "B. Rivaroxaban is indicated for non-valvular AF, DVT/PE treatment/prevention, and CV risk reduction in CAD/PAD; reversed by andexanet alfa",
            "C. Rivaroxaban is only FDA-approved for DVT prophylaxis after knee surgery",
            "D. Rivaroxaban requires regular INR monitoring to ensure therapeutic anticoagulation"
        ],
        correctAnswer: "B. Rivaroxaban is indicated for non-valvular AF, DVT/PE treatment/prevention, and CV risk reduction in CAD/PAD; reversed by andexanet alfa",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.22,
        angle: .indication,
        baseConceptTitle: "RIVAROXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Direct selective inhibition of Factor Xa (both free and clot-bound).
        > ORAL BIOAVAILABILITY: 10 mg dose ~100%; 20 mg dose ~66% (must be taken with food for higher doses).
        > ELIMINATION: ~33% renal unchanged; CYP3A4 and P-gp metabolism.
        > HALF-LIFE: 5–9 hrs (young), 11–13 hrs (elderly).
        > ONCE DAILY: Higher doses given once daily with evening meal for AF/DVT.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban's higher doses (15-20 mg) have 100% oral bioavailability regardless of food intake",
            "B. Rivaroxaban 20 mg has only ~66% bioavailability fasting — must be taken with food for full absorption; Factor Xa inhibitor; CYP3A4 and P-gp metabolism",
            "C. Rivaroxaban inhibits Factor IIa (thrombin) directly, unlike other DOACs",
            "D. Rivaroxaban is exclusively eliminated by renal excretion without any hepatic metabolism"
        ],
        correctAnswer: "B. Rivaroxaban 20 mg has only ~66% bioavailability fasting — must be taken with food for full absorption; Factor Xa inhibitor; CYP3A4 and P-gp metabolism",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.22,
        angle: .mechanism,
        baseConceptTitle: "RIVAROXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLEEDING: Same as all anticoagulants — GI bleed most common; intracranial hemorrhage.
        > FOOD REQUIREMENT: Take 15–20 mg doses with food — fasting reduces absorption significantly.
        > RENAL: Dose reduction needed for AF if CrCl 15–50 mL/min; avoid if CrCl <15 mL/min.
        > DRUG INTERACTIONS: Dual P-gp/CYP3A4 inhibitors increase; inducers decrease — same as apixaban.
        > SPINAL ANESTHESIA: Black Box — epidural hematoma risk; hold before spinal procedures.
        > PREMATURE D/C: Increases stroke risk — never stop without provider guidance.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban 20 mg can be taken on an empty stomach with no effect on drug levels",
            "B. 15–20 mg doses must be taken with food (food-dependent absorption); Black Box for spinal epidural hematoma; dose reduce in renal impairment; never stop abruptly (stroke risk)",
            "C. Rivaroxaban has no interaction with CYP3A4 inhibitors",
            "D. Rivaroxaban's spinal hematoma risk only applies if the patient is also taking aspirin"
        ],
        correctAnswer: "B. 15–20 mg doses must be taken with food (food-dependent absorption); Black Box for spinal epidural hematoma; dose reduce in renal impairment; never stop abruptly (stroke risk)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.22,
        angle: .safety,
        baseConceptTitle: "RIVAROXABAN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RIVAROXABAN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > AF STROKE PREVENTION: 20 mg QD with evening meal (15 mg QD if CrCl 15–50 mL/min).
        > DVT/PE TREATMENT: 15 mg BID × 21 days, then 20 mg QD with food.
        > DVT/PE PREVENTION (post-surgery): 10 mg QD × 12 days (knee) or 35 days (hip).
        > CAD/PAD VASCULAR PROTECTION: 2.5 mg BID + aspirin 100 mg QD.
        > MISSED DOSE: If BID — take immediately; if QD — take same day.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Rivaroxaban for DVT/PE treatment is 20 mg QD throughout the entire treatment course",
            "B. DVT/PE treatment: 15 mg BID × 21 days then 20 mg QD with food; AF: 20 mg QD with evening meal (15 mg if renal impairment); CAD/PAD: 2.5 mg BID + aspirin",
            "C. Rivaroxaban for AF prevention is dosed twice daily at 15 mg",
            "D. All rivaroxaban doses are given without food regardless of the strength"
        ],
        correctAnswer: "B. DVT/PE treatment: 15 mg BID × 21 days then 20 mg QD with food; AF: 20 mg QD with evening meal (15 mg if renal impairment); CAD/PAD: 2.5 mg BID + aspirin",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.22,
        angle: .dosing,
        baseConceptTitle: "RIVAROXABAN"
    ),

    // ============================================================
    // QUETIAPINE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Atypical (second-generation) antipsychotic; brand: Seroquel.
        > INDICATIONS:
        >   1. Schizophrenia
        >   2. Bipolar I disorder (manic, depressive, and maintenance)
        >   3. Major depressive disorder (adjunct; XR formulation)
        >   4. Bipolar depression
        > OFF-LABEL: Insomnia, anxiety, PTSD (use controversial).
        > NOTE: Quetiapine is one of the most frequently prescribed atypical antipsychotics.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Quetiapine is FDA-approved only for schizophrenia and is not approved for mood disorders",
            "B. Quetiapine is FDA-approved for schizophrenia, bipolar I disorder (all phases), and as adjunct for MDD; commonly used off-label for insomnia",
            "C. Quetiapine (Seroquel) is a first-generation (typical) antipsychotic",
            "D. Quetiapine is FDA-approved as monotherapy for major depressive disorder"
        ],
        correctAnswer: "B. Quetiapine is FDA-approved for schizophrenia, bipolar I disorder (all phases), and as adjunct for MDD; commonly used off-label for insomnia",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.29,
        angle: .indication,
        baseConceptTitle: "QUETIAPINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Antagonist at D2 (dopamine), 5-HT2A (serotonin), H1 (histamine), α1-adrenergic, and muscarinic receptors.
        > LOW D2 AFFINITY: Lower EPS risk than first-generation antipsychotics (haloperidol).
        > H1 ANTAGONISM: Explains sedation/weight gain.
        > α1 BLOCKADE: Explains orthostatic hypotension.
        > ACTIVE METABOLITE: Norquetiapine — inhibits norepinephrine reuptake (antidepressant effect).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Quetiapine works exclusively by blocking dopamine D2 receptors with high affinity",
            "B. Quetiapine blocks D2, 5-HT2A, H1, and α1 receptors; low D2 affinity = lower EPS risk; H1 blockade causes sedation/weight gain; norquetiapine metabolite provides antidepressant effect",
            "C. Quetiapine's primary antidepressant effect is through direct serotonin reuptake inhibition",
            "D. H1 antagonism from quetiapine causes hypertension and tachycardia"
        ],
        correctAnswer: "B. Quetiapine blocks D2, 5-HT2A, H1, and α1 receptors; low D2 affinity = lower EPS risk; H1 blockade causes sedation/weight gain; norquetiapine metabolite provides antidepressant effect",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.29,
        angle: .mechanism,
        baseConceptTitle: "QUETIAPINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BLACK BOX: Elderly dementia patients — increased mortality risk (not approved for dementia-related psychosis).
        > BLACK BOX: Suicidality in pediatric/young adult patients (antidepressant adjunct use).
        > METABOLIC SYNDROME: Weight gain, hyperglycemia, dyslipidemia — monitor glucose, lipids, weight.
        > QT PROLONGATION: Dose-dependent QT prolongation — avoid with other QT-prolonging agents.
        > TARDIVE DYSKINESIA: Risk with long-term use.
        > NEUROLEPTIC MALIGNANT SYNDROME (NMS): Rare but life-threatening — fever, rigidity, autonomic instability.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Quetiapine is preferred for elderly patients with dementia-related psychosis",
            "B. Black Box for elderly dementia patients (increased mortality); monitor metabolic parameters (weight, glucose, lipids); QT prolongation risk; tardive dyskinesia with long-term use",
            "C. Quetiapine does not cause metabolic side effects and is weight-neutral",
            "D. Tardive dyskinesia from quetiapine resolves immediately upon stopping the medication"
        ],
        correctAnswer: "B. Black Box for elderly dementia patients (increased mortality); monitor metabolic parameters (weight, glucose, lipids); QT prolongation risk; tardive dyskinesia with long-term use",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.29,
        angle: .safety,
        baseConceptTitle: "QUETIAPINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "QUETIAPINE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SCHIZOPHRENIA: Start 25 mg BID; titrate to 300–800 mg/day in divided doses.
        > BIPOLAR MANIA: 50 mg BID Day 1; titrate to 400–800 mg/day.
        > BIPOLAR DEPRESSION: 50 mg QHS titrate to 300 mg QHS.
        > MDD ADJUNCT (XR): 50 mg QHS; usual dose 150–300 mg/day.
        > TITRATE SLOWLY: Rapid titration worsens orthostatic hypotension.
        > RENAL/HEPATIC: Not significantly adjusted for mild impairment; reduce in severe hepatic.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Quetiapine for schizophrenia should be started at the full therapeutic dose (600 mg) immediately",
            "B. Start quetiapine low (25–50 mg) and titrate slowly to minimize orthostatic hypotension; schizophrenia target: 300–800 mg/day; bipolar depression: target 300 mg QHS",
            "C. Quetiapine for bipolar depression is dosed at 800 mg QD for maximum efficacy",
            "D. Quetiapine dosing is identical for schizophrenia, bipolar, and MDD indications"
        ],
        correctAnswer: "B. Start quetiapine low (25–50 mg) and titrate slowly to minimize orthostatic hypotension; schizophrenia target: 300–800 mg/day; bipolar depression: target 300 mg QHS",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.29,
        angle: .dosing,
        baseConceptTitle: "QUETIAPINE"
    ),

    // ============================================================
    // EMPAGLIFLOZIN — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: SGLT-2 inhibitor (sodium-glucose cotransporter-2 inhibitor); brand: Jardiance.
        > INDICATIONS:
        >   1. Type 2 diabetes (glycemic control)
        >   2. Cardiovascular death reduction in T2DM + established CVD (EMPA-REG OUTCOME)
        >   3. Heart failure with reduced AND preserved ejection fraction (HFrEF/HFpEF)
        >   4. CKD progression reduction
        > RELATED: Dapagliflozin (Farxiga), Canagliflozin (Invokana) — same class.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Empagliflozin is FDA-approved only for glycemic control in type 2 diabetes",
            "B. Empagliflozin is FDA-approved for T2DM glycemic control, CV death reduction in T2DM+CVD, heart failure (both HFrEF and HFpEF), and CKD progression reduction",
            "C. SGLT-2 inhibitors are first-line therapy for type 1 diabetes management",
            "D. Empagliflozin is contraindicated in patients with established cardiovascular disease"
        ],
        correctAnswer: "B. Empagliflozin is FDA-approved for T2DM glycemic control, CV death reduction in T2DM+CVD, heart failure (both HFrEF and HFpEF), and CKD progression reduction",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.36,
        angle: .indication,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Inhibits SGLT-2 in the proximal renal tubule → blocks reabsorption of glucose → glucosuria (glucose excreted in urine).
        > OSMOTIC DIURESIS: Glucose in urine draws water → reduces preload and afterload (heart failure benefit).
        > CALORIC LOSS: ~60–70 g glucose excreted daily → modest weight loss.
        > SODIUM EXCRETION: Also reduces sodium reabsorption → lowers blood pressure.
        > CARDIOPROTECTIVE: Reduces intraglomerular pressure → kidney protection.
        > INSULIN-INDEPENDENT: Works regardless of insulin secretion.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Empagliflozin works by stimulating insulin secretion from pancreatic beta cells",
            "B. Empagliflozin inhibits SGLT-2, blocking renal glucose reabsorption → glucosuria; causes osmotic diuresis (heart failure benefit) and sodium excretion; insulin-independent mechanism",
            "C. SGLT-2 inhibitors work by blocking hepatic glucose production (similar to metformin)",
            "D. Empagliflozin requires insulin to exert its glucose-lowering effect"
        ],
        correctAnswer: "B. Empagliflozin inhibits SGLT-2, blocking renal glucose reabsorption → glucosuria; causes osmotic diuresis (heart failure benefit) and sodium excretion; insulin-independent mechanism",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.36,
        angle: .mechanism,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DKA: Diabetic ketoacidosis — even with near-normal glucose (euglycemic DKA); rare but serious.
        > GENITAL INFECTIONS: Glucosuria promotes yeast infections (Candida) and UTIs.
        > FOURNIER'S GANGRENE: Rare necrotizing fasciitis of perineum — Black Box Warning.
        > LOWER LIMB AMPUTATION: Canagliflozin specifically associated — monitor feet.
        > RENAL: Do not use if eGFR <20–30 mL/min (for glucose lowering); heart failure indication: can use lower eGFR.
        > HYPOTENSION: Volume depletion from glucosuria — monitor BP and hydration.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. DKA from SGLT-2 inhibitors only occurs when blood glucose is above 400 mg/dL",
            "B. SGLT-2 inhibitors can cause euglycemic DKA (normal glucose); genital yeast infections and UTIs common; Fournier's gangrene (Black Box); volume depletion/hypotension; avoid at low eGFR for diabetes indication",
            "C. SGLT-2 inhibitors eliminate UTI risk because glucosuria is antibacterial",
            "D. Lower limb amputations are associated with empagliflozin specifically, not canagliflozin"
        ],
        correctAnswer: "B. SGLT-2 inhibitors can cause euglycemic DKA (normal glucose); genital yeast infections and UTIs common; Fournier's gangrene (Black Box); volume depletion/hypotension; avoid at low eGFR for diabetes indication",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.36,
        angle: .safety,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "EMPAGLIFLOZIN / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > T2DM: Start 10 mg QD; may increase to 25 mg QD for additional glycemic/CV benefit.
        > HEART FAILURE: 10 mg QD.
        > CKD: 10 mg QD (can continue to eGFR as low as 20 mL/min for renal protection).
        > TIMING: Morning, with or without food.
        > HOLD BEFORE SURGERY: Stop 3–4 days before major surgery (euglycemic DKA risk).
        > RENAL THRESHOLD: Glucose lowering requires adequate eGFR — reduced efficacy as eGFR falls.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Empagliflozin for heart failure is dosed at 25 mg QD for maximum fluid reduction",
            "B. Empagliflozin: T2DM 10–25 mg QD; HF and CKD 10 mg QD; hold 3–4 days pre-surgery (euglycemic DKA risk); efficacy for glucose lowering decreases with low eGFR",
            "C. Empagliflozin should be held until after surgery because it causes acute kidney injury",
            "D. Empagliflozin must be taken with food to prevent dangerous blood sugar drops"
        ],
        correctAnswer: "B. Empagliflozin: T2DM 10–25 mg QD; HF and CKD 10 mg QD; hold 3–4 days pre-surgery (euglycemic DKA risk); efficacy for glucose lowering decreases with low eGFR",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.36,
        angle: .dosing,
        baseConceptTitle: "EMPAGLIFLOZIN"
    ),

    // ============================================================
    // METHYLPHENIDATE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: CNS stimulant (CII controlled substance).
        > BRANDS: Ritalin (IR), Concerta (OROS ER), Metadate, Quillivant XR.
        > INDICATIONS:
        >   1. ADHD in children (≥6), adolescents, and adults
        >   2. Narcolepsy
        > RELATED: Amphetamine salts (Adderall), lisdexamfetamine (Vyvanse) — same class, different mechanism.
        > DIAGNOSTIC NOTE: ADHD must meet DSM-5 criteria for prescription.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Methylphenidate is only FDA-approved for children aged 6–12 and not for adults with ADHD",
            "B. Methylphenidate is FDA-approved for ADHD (children ≥6, adolescents, adults) and narcolepsy; it is a CII controlled substance",
            "C. Methylphenidate is a Schedule V controlled substance with low abuse potential",
            "D. Methylphenidate is first-line treatment for bipolar disorder with ADHD comorbidity"
        ],
        correctAnswer: "B. Methylphenidate is FDA-approved for ADHD (children ≥6, adolescents, adults) and narcolepsy; it is a CII controlled substance",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.43,
        angle: .indication,
        baseConceptTitle: "METHYLPHENIDATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Blocks reuptake of dopamine and norepinephrine from the synapse (via DAT and NET inhibition) → increases dopamine and NE in prefrontal cortex.
        > DIFFERENT FROM AMPHETAMINES: Methylphenidate does NOT cause vesicular monoamine release (unlike amphetamines which reverse the transporter).
        > EFFECT: Improves attention, focus, impulse control, executive function.
        > STIMULANT PARADOX: Calms hyperactivity in ADHD patients via prefrontal cortex modulation.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Methylphenidate works by causing reverse transport of dopamine and norepinephrine (like amphetamines)",
            "B. Methylphenidate blocks DAT and NET, preventing reuptake of dopamine and norepinephrine; does NOT cause vesicular monoamine release (unlike amphetamines)",
            "C. Methylphenidate primarily works through serotonin reuptake inhibition in the prefrontal cortex",
            "D. Methylphenidate and amphetamine have identical mechanisms of action at the dopamine transporter"
        ],
        correctAnswer: "B. Methylphenidate blocks DAT and NET, preventing reuptake of dopamine and norepinephrine; does NOT cause vesicular monoamine release (unlike amphetamines)",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.43,
        angle: .mechanism,
        baseConceptTitle: "METHYLPHENIDATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CARDIOVASCULAR: Black Box Warning — avoid in patients with serious CV abnormalities; may increase HR and BP.
        > GROWTH SUPPRESSION: Long-term use in children — monitor height/weight; consider drug holidays.
        > PSYCHIATRIC: May precipitate or worsen psychosis, mania, or bipolar symptoms.
        > MAOIs: CONTRAINDICATED within 14 days — hypertensive crisis.
        > APPETITE SUPPRESSION: Commonly reduces appetite — take with meals; give last dose by afternoon to avoid insomnia.
        > ABUSE POTENTIAL: CII — high potential; prescribers must comply with CII rules.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Methylphenidate is safe to use in patients with severe congenital heart disease",
            "B. Black Box for serious CV disease; growth suppression (monitor in children); contraindicated with MAOIs within 14 days; appetite suppression; CII — high abuse potential; may worsen psychosis",
            "C. Methylphenidate improves appetite and promotes healthy weight gain in children",
            "D. Methylphenidate can be safely combined with MAOIs for treatment-resistant ADHD"
        ],
        correctAnswer: "B. Black Box for serious CV disease; growth suppression (monitor in children); contraindicated with MAOIs within 14 days; appetite suppression; CII — high abuse potential; may worsen psychosis",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.43,
        angle: .safety,
        baseConceptTitle: "METHYLPHENIDATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHYLPHENIDATE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > IR (Ritalin): Children start 5 mg BID-TID; usual 20–30 mg/day; give with meals.
        > ER (Concerta): Children start 18 mg QAM; max 54 mg/day (adults max 72 mg/day).
        > TIMING: Give IR last dose by 4–6 PM to avoid insomnia.
        > DRUG HOLIDAY: Consider during summer/school breaks to assess growth and need.
        > CII RULES: Max 30-day supply; no refills; cannot be telephoned in (except emergencies).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Methylphenidate ER (Concerta) is started at 36 mg QD for most children",
            "B. Concerta starts at 18 mg QAM (children); IR starts at 5 mg BID-TID; last IR dose by 4–6 PM; CII rules apply (30-day supply, no refills); drug holidays recommended periodically",
            "C. Methylphenidate should be taken at bedtime to improve sleep and ADHD symptoms overnight",
            "D. Methylphenidate extended-release can be prescribed with 5 refills like other CIII medications"
        ],
        correctAnswer: "B. Concerta starts at 18 mg QAM (children); IR starts at 5 mg BID-TID; last IR dose by 4–6 PM; CII rules apply (30-day supply, no refills); drug holidays recommended periodically",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.43,
        angle: .dosing,
        baseConceptTitle: "METHYLPHENIDATE"
    ),

    // ============================================================
    // CETIRIZINE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Second-generation antihistamine (H1 antagonist); brand: Zyrtec.
        > INDICATIONS:
        >   1. Allergic rhinitis (seasonal and perennial)
        >   2. Chronic idiopathic urticaria (hives)
        >   3. Allergic conjunctivitis symptoms
        > RELATED: Loratadine (Claritin), fexofenadine (Allegra), levocetirizine (Xyzal).
        > OTC: Available OTC; also available as generic.
        > AGE: Approved for children ≥2 years.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Cetirizine is a first-generation antihistamine associated with significant CNS effects and anticholinergic properties",
            "B. Cetirizine is a second-generation antihistamine for allergic rhinitis, urticaria, and conjunctivitis; less sedating than first-generation; OTC; approved age ≥2 years",
            "C. Cetirizine is FDA-approved for anaphylaxis as the primary treatment",
            "D. Cetirizine requires a prescription and is not available OTC"
        ],
        correctAnswer: "B. Cetirizine is a second-generation antihistamine for allergic rhinitis, urticaria, and conjunctivitis; less sedating than first-generation; OTC; approved age ≥2 years",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.50,
        angle: .indication,
        baseConceptTitle: "CETIRIZINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Competitive antagonist at peripheral H1 histamine receptors; also weak inhibition of eosinophil migration.
        > SECOND GENERATION: Minimal CNS penetration (less sedation than diphenhydramine); does not cross BBB as readily.
        > METABOLISM: Active metabolite of hydroxyzine (cetirizine IS the active metabolite).
        > HALF-LIFE: ~8–9 hours → once-daily dosing.
        > NOTE: More sedating than loratadine or fexofenadine — can cause drowsiness in some patients.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Cetirizine is a prodrug that is converted to hydroxyzine in the liver",
            "B. Cetirizine is the active metabolite of hydroxyzine; competitively blocks peripheral H1 receptors; less CNS penetration than first-generation antihistamines; t½ ~8–9 hours",
            "C. Cetirizine blocks both H1 and H2 receptors, providing both antiallergic and antacid effects",
            "D. All second-generation antihistamines, including cetirizine, are completely non-sedating"
        ],
        correctAnswer: "B. Cetirizine is the active metabolite of hydroxyzine; competitively blocks peripheral H1 receptors; less CNS penetration than first-generation antihistamines; t½ ~8–9 hours",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.50,
        angle: .mechanism,
        baseConceptTitle: "CETIRIZINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > SEDATION: Can cause drowsiness — more than loratadine/fexofenadine; caution when driving.
        > RENAL IMPAIRMENT: Reduce dose if CrCl <31 mL/min (renally eliminated).
        > ALCOHOL: Additive CNS depression — avoid.
        > ELDERLY: Beers Criteria cautions against all antihistamines in elderly (falls, confusion, urinary retention).
        > PREGNANCY: Category B (hydroxyzine is C) — generally considered safe for short-term use.
        > INTERACTIONS: CNS depressants additive; some anticholinergic effects at high doses.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Cetirizine is completely non-sedating and safe for all patients including elderly",
            "B. Cetirizine can cause sedation (more than loratadine); requires dose reduction in renal impairment; Beers Criteria warns against antihistamines in elderly (falls, confusion); avoid alcohol",
            "C. Cetirizine is primarily eliminated by liver metabolism and requires dose adjustment in hepatic disease",
            "D. Cetirizine is preferred over other antihistamines in elderly patients due to its non-sedating profile"
        ],
        correctAnswer: "B. Cetirizine can cause sedation (more than loratadine); requires dose reduction in renal impairment; Beers Criteria warns against antihistamines in elderly (falls, confusion); avoid alcohol",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.50,
        angle: .safety,
        baseConceptTitle: "CETIRIZINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CETIRIZINE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ADULTS/CHILDREN ≥12: 5–10 mg QD.
        > CHILDREN 6–11: 5–10 mg QD.
        > CHILDREN 2–5: 2.5 mg QD (or 2.5 mg BID if needed).
        > RENAL IMPAIRMENT (CrCl <31 mL/min): 5 mg QD.
        > TIMING: Evening dosing preferred (reduce daytime sedation risk).
        > AVAILABLE FORMS: Tablets, chewable tablets, syrup (1 mg/mL).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The standard adult dose of cetirizine is 20 mg QD for year-round allergic rhinitis",
            "B. Adults/children ≥12: 5–10 mg QD; children 2–5: 2.5 mg QD; renal impairment (CrCl <31): 5 mg QD; evening dosing preferred to minimize daytime sedation",
            "C. Cetirizine requires BID dosing in adults for adequate 24-hour allergy control",
            "D. Children under 6 should not receive cetirizine under any circumstances"
        ],
        correctAnswer: "B. Adults/children ≥12: 5–10 mg QD; children 2–5: 2.5 mg QD; renal impairment (CrCl <31): 5 mg QD; evening dosing preferred to minimize daytime sedation",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.50,
        angle: .dosing,
        baseConceptTitle: "CETIRIZINE"
    ),

    // ============================================================
    // METRONIDAZOLE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METRONIDAZOLE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Nitroimidazole antibiotic/antiprotozoal.
        > INDICATIONS:
        >   1. Bacterial vaginosis
        >   2. Trichomoniasis (treat partner too)
        >   3. C. difficile infection (oral — alternative to vancomycin for mild CDI)
        >   4. Anaerobic/mixed infections (intra-abdominal, pelvic)
        >   5. H. pylori eradication (combination therapy)
        >   6. Giardia, Entamoeba
        > NOTE: Excellent anaerobic and protozoal coverage; not effective against aerobic bacteria alone.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Metronidazole is effective for all aerobic bacterial infections including MRSA",
            "B. Metronidazole covers anaerobes and protozoa (BV, Trichomonas, C. diff, Giardia, H. pylori); excellent anaerobic coverage; no activity against aerobic bacteria alone",
            "C. Metronidazole is the first-line treatment for severe C. difficile infections",
            "D. Metronidazole does not require treatment of sexual partners for Trichomonas infections"
        ],
        correctAnswer: "B. Metronidazole covers anaerobes and protozoa (BV, Trichomonas, C. diff, Giardia, H. pylori); excellent anaerobic coverage; no activity against aerobic bacteria alone",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.57,
        angle: .indication,
        baseConceptTitle: "METRONIDAZOLE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METRONIDAZOLE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Prodrug — reduced (activated) by anaerobic/microaerophilic organisms to nitro radical anions → damages DNA → bactericidal/protozoalcidal.
        > SELECTIVITY: Requires anaerobic environment for activation — explains selectivity for anaerobes.
        > DISTRIBUTION: Excellent CSF penetration — used for brain abscesses.
        > HALF-LIFE: ~8 hours; hepatic metabolism.
        > NOTE: Mechanism is similar to tinidazole (same class).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Metronidazole is activated by aerobic bacteria through oxidative phosphorylation",
            "B. Metronidazole is a prodrug activated by anaerobic organisms → nitro radical anion → DNA damage; selectivity for anaerobes; excellent CSF penetration for brain abscess treatment",
            "C. Metronidazole inhibits cell wall synthesis like penicillin-based antibiotics",
            "D. Metronidazole requires aerobic conditions for activation and is therefore most active against gram-positive aerobes"
        ],
        correctAnswer: "B. Metronidazole is a prodrug activated by anaerobic organisms → nitro radical anion → DNA damage; selectivity for anaerobes; excellent CSF penetration for brain abscess treatment",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.57,
        angle: .mechanism,
        baseConceptTitle: "METRONIDAZOLE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METRONIDAZOLE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > DISULFIRAM-LIKE REACTION: Severe nausea, vomiting, flushing with ALCOHOL — avoid alcohol during and 48–72 hrs after course.
        > METALLIC TASTE: Common; usually resolves.
        > PERIPHERAL NEUROPATHY: With prolonged use — numbness/tingling.
        > SEIZURES: High doses or CNS disease — rarely causes seizures.
        > WARFARIN: Metronidazole inhibits CYP2C9 → significantly increases warfarin effect → monitor INR.
        > PREGNANCY: Avoid first trimester (historical concerns; newer data generally reassuring).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. A single glass of wine is safe while taking metronidazole if taken 2 hours apart",
            "B. Avoid all alcohol during and 48–72 hrs after metronidazole (disulfiram-like reaction); inhibits CYP2C9 (raises warfarin — monitor INR); metallic taste common; peripheral neuropathy with long-term use",
            "C. Metronidazole enhances warfarin metabolism and lowers INR",
            "D. The disulfiram-like reaction from metronidazole + alcohol is mild and only causes mild flushing"
        ],
        correctAnswer: "B. Avoid all alcohol during and 48–72 hrs after metronidazole (disulfiram-like reaction); inhibits CYP2C9 (raises warfarin — monitor INR); metallic taste common; peripheral neuropathy with long-term use",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.57,
        angle: .safety,
        baseConceptTitle: "METRONIDAZOLE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METRONIDAZOLE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > BACTERIAL VAGINOSIS: 500 mg PO BID × 7 days; or 0.75% gel intravaginally QD × 5 days.
        > TRICHOMONIASIS: 2 g PO single dose (treat partner); or 500 mg BID × 7 days.
        > C. DIFF (mild): 500 mg PO TID × 10–14 days (alternative; oral vancomycin preferred).
        > ANAEROBIC INFECTIONS: 500 mg IV q8h or 500 mg PO TID.
        > H. PYLORI (combo): Usually 500 mg BID as part of triple or quadruple therapy.
        > HEPATIC: Reduce dose in severe hepatic impairment.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The standard dose for Trichomonas is 500 mg PO BID × 14 days",
            "B. Trichomonas: 2 g single dose (or 500 mg BID × 7 days); BV: 500 mg BID × 7 days; treat sexual partner for Trichomonas; C. diff mild alternative: 500 mg TID × 10–14 days",
            "C. Metronidazole is not used for H. pylori eradication",
            "D. Metronidazole for BV is 250 mg QD × 3 days only"
        ],
        correctAnswer: "B. Trichomonas: 2 g single dose (or 500 mg BID × 7 days); BV: 500 mg BID × 7 days; treat sexual partner for Trichomonas; C. diff mild alternative: 500 mg TID × 10–14 days",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.57,
        angle: .dosing,
        baseConceptTitle: "METRONIDAZOLE"
    ),

    // ============================================================
    // ONDANSETRON — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: 5-HT3 receptor antagonist (serotonin antagonist); brand: Zofran.
        > INDICATIONS:
        >   1. Chemotherapy-induced nausea and vomiting (CINV) — highly emetogenic chemo
        >   2. Radiation-induced nausea and vomiting
        >   3. Post-operative nausea and vomiting (PONV)
        >   4. Off-label: Pregnancy-related nausea (morning sickness), gastroenteritis
        > FORMS: Oral (tablet, ODT), IV, IM.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ondansetron is FDA-approved for pregnancy nausea and morning sickness",
            "B. Ondansetron is FDA-approved for CINV, radiation-induced nausea, and PONV; commonly used off-label for pregnancy nausea; available as oral, ODT, and IV formulations",
            "C. Ondansetron is a dopamine antagonist similar to metoclopramide in its mechanism",
            "D. Ondansetron is only available as an injectable for hospital use"
        ],
        correctAnswer: "B. Ondansetron is FDA-approved for CINV, radiation-induced nausea, and PONV; commonly used off-label for pregnancy nausea; available as oral, ODT, and IV formulations",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.64,
        angle: .indication,
        baseConceptTitle: "ONDANSETRON"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Selective 5-HT3 receptor antagonist — blocks serotonin receptors in the GI tract (vagal afferent neurons) and chemoreceptor trigger zone (CTZ) in the brain.
        > SEROTONIN: Chemotherapy damages GI enterochromaffin cells → release of serotonin → stimulates vagal afferents → vomiting; ondansetron blocks this signal.
        > NO DOPAMINE: Unlike metoclopramide and prochlorperazine — no EPS or tardive dyskinesia.
        > ONSET: PO 30 min; IV 5 min.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Ondansetron works by blocking dopamine D2 receptors in the chemoreceptor trigger zone",
            "B. Ondansetron selectively blocks 5-HT3 receptors on vagal afferents and CTZ, blocking serotonin-triggered vomiting from chemotherapy; no dopamine blockade — no EPS risk",
            "C. Ondansetron inhibits gastric motility by blocking muscarinic receptors",
            "D. Ondansetron causes extrapyramidal symptoms because it is a potent dopamine antagonist"
        ],
        correctAnswer: "B. Ondansetron selectively blocks 5-HT3 receptors on vagal afferents and CTZ, blocking serotonin-triggered vomiting from chemotherapy; no dopamine blockade — no EPS risk",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.64,
        angle: .mechanism,
        baseConceptTitle: "ONDANSETRON"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > QT PROLONGATION: Dose-dependent QT prolongation — FDA warning; avoid with other QT-prolonging drugs.
        > IV DOSE LIMIT: Single IV dose capped at 16 mg (QT risk with 32 mg IV).
        > SEROTONIN SYNDROME: Risk when combined with other serotonergic drugs (SSRIs, MAOIs, tramadol).
        > CONSTIPATION: Common side effect (5-HT3 receptors in gut).
        > HEADACHE: Most common side effect.
        > PREGNANCY: Off-label — some concern for cardiac septal defects (controversial); generally used when benefit outweighs risk.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The maximum single IV dose of ondansetron is 32 mg for severe CINV",
            "B. Single IV dose capped at 16 mg (QT prolongation risk); QT prolongation dose-dependent — avoid other QT drugs; serotonin syndrome risk with SSRIs/MAOIs; headache and constipation most common",
            "C. Ondansetron does not prolong QT interval at any therapeutic dose",
            "D. Ondansetron is the preferred antiemetic for patients already on SSRIs because both affect serotonin"
        ],
        correctAnswer: "B. Single IV dose capped at 16 mg (QT prolongation risk); QT prolongation dose-dependent — avoid other QT drugs; serotonin syndrome risk with SSRIs/MAOIs; headache and constipation most common",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.64,
        angle: .safety,
        baseConceptTitle: "ONDANSETRON"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ONDANSETRON / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CINV (highly emetogenic): 24 mg PO × 1 before chemo; or 8 mg IV.
        > CINV (moderately emetogenic): 8 mg PO BID (or 8 mg IV 30 min before chemo).
        > PONV: 4 mg IV at end of surgery.
        > GASTROENTERITIS (off-label): 4 mg ODT × 1 dose (adults); weight-based in children.
        > HEPATIC: Reduce dose in severe hepatic impairment (max 8 mg/day).
        > ODT TABLET: Dissolves on tongue — do not push through foil; place on tongue.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The standard PONV dose of ondansetron is 8 mg IV given 30 minutes before surgery",
            "B. PONV: 4 mg IV at end of surgery; CINV (high emetogenicity): 8 mg IV or 24 mg PO before chemo; ODT placed on tongue (dissolves without water); reduce dose in severe hepatic impairment",
            "C. Ondansetron ODT tablets should be swallowed whole with a full glass of water",
            "D. The maximum daily dose of ondansetron for CINV is 8 mg in all patient populations"
        ],
        correctAnswer: "B. PONV: 4 mg IV at end of surgery; CINV (high emetogenicity): 8 mg IV or 24 mg PO before chemo; ODT placed on tongue (dissolves without water); reduce dose in severe hepatic impairment",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.64,
        angle: .dosing,
        baseConceptTitle: "ONDANSETRON"
    ),

    // ============================================================
    // ALENDRONATE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Bisphosphonate; brand: Fosamax.
        > INDICATIONS:
        >   1. Osteoporosis treatment and prevention (postmenopausal women, men ≥50)
        >   2. Glucocorticoid-induced osteoporosis
        >   3. Paget's disease of bone
        > GOAL: Reduce vertebral, hip, and non-vertebral fracture risk.
        > RELATED: Risedronate (Actonel), ibandronate (Boniva), zoledronic acid (Reclast IV).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alendronate is primarily indicated for hypercalcemia of malignancy",
            "B. Alendronate treats and prevents osteoporosis (postmenopausal women, men ≥50), glucocorticoid-induced osteoporosis, and Paget's disease; reduces fracture risk",
            "C. Alendronate is the only bisphosphonate available and has no related drugs in its class",
            "D. Alendronate is indicated for hypophosphatemia and calcium supplementation"
        ],
        correctAnswer: "B. Alendronate treats and prevents osteoporosis (postmenopausal women, men ≥50), glucocorticoid-induced osteoporosis, and Paget's disease; reduces fracture risk",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.71,
        angle: .indication,
        baseConceptTitle: "ALENDRONATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Inhibits osteoclast-mediated bone resorption by binding to hydroxyapatite crystals in bone → osteoclasts undergo apoptosis.
        > NITROGEN-CONTAINING: Alendronate inhibits farnesyl pyrophosphate synthase (mevalonate pathway) → disrupts osteoclast cytoskeleton.
        > NET EFFECT: Bone resorption reduced → bone mineral density (BMD) increases over time.
        > SKELETON AFFINITY: Very high bone affinity — long skeletal half-life (years).
        > NO ANABOLIC: Does not build new bone — only reduces breakdown.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alendronate stimulates osteoblast activity to build new bone tissue",
            "B. Alendronate inhibits osteoclast-mediated bone resorption (osteoclast apoptosis via farnesyl pyrophosphate synthase inhibition); reduces bone breakdown but does not build new bone",
            "C. Alendronate works by providing calcium directly to bone to increase mineral density",
            "D. Alendronate is metabolized rapidly by the liver, explaining its once-daily dosing"
        ],
        correctAnswer: "B. Alendronate inhibits osteoclast-mediated bone resorption (osteoclast apoptosis via farnesyl pyrophosphate synthase inhibition); reduces bone breakdown but does not build new bone",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.71,
        angle: .mechanism,
        baseConceptTitle: "ALENDRONATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ESOPHAGEAL EROSION: Must take with 6–8 oz water; remain upright ≥30 min; do not take if cannot stand/sit upright.
        > ONJ: Osteonecrosis of the jaw — rare; increased risk with invasive dental procedures, cancer, IV bisphosphonates.
        > ATYPICAL FEMUR FRACTURE: Rare with long-term use (>5 years) — pain in thigh/groin before fracture.
        > HYPOCALCEMIA: Correct calcium/vitamin D deficiency BEFORE starting.
        > RENAL: Avoid if CrCl <35 mL/min.
        > GI CONTRAINDICATIONS: Esophageal abnormalities, inability to stand/sit.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Patients can lie down immediately after taking alendronate for maximum GI comfort",
            "B. Must remain upright ≥30 min after taking (esophageal erosion risk); ONJ possible with invasive dental work; atypical femur fracture with long-term use; correct calcium/vitamin D first; avoid if CrCl <35",
            "C. Alendronate should be taken with milk or orange juice for best absorption",
            "D. Osteonecrosis of the jaw from alendronate is common with routine dental cleanings"
        ],
        correctAnswer: "B. Must remain upright ≥30 min after taking (esophageal erosion risk); ONJ possible with invasive dental work; atypical femur fracture with long-term use; correct calcium/vitamin D first; avoid if CrCl <35",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.71,
        angle: .safety,
        baseConceptTitle: "ALENDRONATE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALENDRONATE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > OSTEOPOROSIS TREATMENT: 10 mg PO QD or 70 mg PO QWeekly.
        > OSTEOPOROSIS PREVENTION: 5 mg QD or 35 mg QWeekly.
        > PAGET'S DISEASE: 40 mg QD × 6 months.
        > ADMINISTRATION: Take first thing in morning with 6–8 oz plain water (NOT juice or coffee); wait 30 min before eating/drinking anything else or taking other meds.
        > DRUG HOLIDAY: After 5 years, consider reassessing (atypical fracture risk vs. benefit).
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Alendronate for osteoporosis treatment can be taken with breakfast for better absorption",
            "B. Take alendronate first thing in morning with 6–8 oz plain water only; wait 30 min before eating/other meds; treatment: 70 mg QWeekly or 10 mg QD; consider drug holiday after 5 years",
            "C. Alendronate can be taken with coffee or juice as long as it is taken on an empty stomach",
            "D. Alendronate for osteoporosis treatment is always dosed daily, not weekly"
        ],
        correctAnswer: "B. Take alendronate first thing in morning with 6–8 oz plain water only; wait 30 min before eating/other meds; treatment: 70 mg QWeekly or 10 mg QD; consider drug holiday after 5 years",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.71,
        angle: .dosing,
        baseConceptTitle: "ALENDRONATE"
    ),

    // ============================================================
    // COLCHICINE — INDICATION / MECHANISM / SAFETY / DOSING
    // ============================================================
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / INDICATION",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > CLASS: Antigout agent; mitosis inhibitor; brand: Colcrys, Mitigare.
        > INDICATIONS:
        >   1. Acute gout attack treatment
        >   2. Gout prophylaxis (when starting urate-lowering therapy)
        >   3. Familial Mediterranean fever (FMF)
        >   4. Pericarditis (acute and recurrent)
        > MECHANISM OVERVIEW: Inhibits microtubule polymerization → impairs neutrophil migration to joint.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Colchicine is primarily used to lower uric acid levels as urate-lowering therapy",
            "B. Colchicine treats and prevents acute gout attacks, treats FMF, and treats pericarditis; does NOT lower uric acid — it reduces inflammation by impairing neutrophil migration",
            "C. Colchicine is a uricosuric agent that increases renal uric acid excretion",
            "D. Colchicine is FDA-approved only for acute gout and has no other indications"
        ],
        correctAnswer: "B. Colchicine treats and prevents acute gout attacks, treats FMF, and treats pericarditis; does NOT lower uric acid — it reduces inflammation by impairing neutrophil migration",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.04,
        yOffset: 0.78,
        angle: .indication,
        baseConceptTitle: "COLCHICINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / MECHANISM",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > MECHANISM: Binds tubulin → inhibits microtubule polymerization → blocks neutrophil and monocyte migration to the inflamed joint → reduces crystal-induced inflammation.
        > ALSO: Inhibits NLRP3 inflammasome → decreases IL-1β release.
        > DOES NOT: Lower uric acid or dissolve crystals — only blocks inflammatory response.
        > NARROW THERAPEUTIC INDEX: Toxic doses close to therapeutic doses — important for dosing.
        > GI TOXICITY: First sign of toxicity is diarrhea — stop if diarrhea occurs.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Colchicine lowers serum uric acid by inhibiting xanthine oxidase like allopurinol",
            "B. Colchicine inhibits microtubule polymerization → blocks neutrophil migration to joint; also inhibits NLRP3 inflammasome/IL-1β; does NOT lower uric acid; NTI drug — diarrhea = first toxicity sign",
            "C. Colchicine dissolves monosodium urate crystals in the joint, providing direct pain relief",
            "D. Colchicine increases uric acid excretion through direct tubular secretion in the kidney"
        ],
        correctAnswer: "B. Colchicine inhibits microtubule polymerization → blocks neutrophil migration to joint; also inhibits NLRP3 inflammasome/IL-1β; does NOT lower uric acid; NTI drug — diarrhea = first toxicity sign",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.09,
        yOffset: 0.78,
        angle: .mechanism,
        baseConceptTitle: "COLCHICINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / SAFETY",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > GI TOXICITY: Diarrhea, nausea, vomiting — first sign of overdose; stop immediately.
        > MYOPATHY: Muscle weakness/pain with long-term use — more common with CYP3A4/P-gp inhibitors.
        > CYP3A4 + P-GP INTERACTIONS: Clarithromycin, ketoconazole, cyclosporine, statins → dramatically increase colchicine levels → toxicity/fatality reported.
        > RENAL/HEPATIC: Reduce dose in impairment — narrower safety margin.
        > BONE MARROW SUPPRESSION: At toxic doses — agranulocytosis, aplastic anemia.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. Diarrhea from colchicine is a minor cosmetic side effect and treatment should continue",
            "B. Diarrhea = first sign of colchicine toxicity — stop immediately; CYP3A4/P-gp inhibitors (clarithromycin, ketoconazole) dramatically raise levels (fatalities reported); myopathy and bone marrow suppression at toxic doses",
            "C. Colchicine has a wide therapeutic index and can be safely combined with all antibiotics",
            "D. Clarithromycin lowers colchicine levels through CYP3A4 induction"
        ],
        correctAnswer: "B. Diarrhea = first sign of colchicine toxicity — stop immediately; CYP3A4/P-gp inhibitors (clarithromycin, ketoconazole) dramatically raise levels (fatalities reported); myopathy and bone marrow suppression at toxic doses",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.14,
        yOffset: 0.78,
        angle: .safety,
        baseConceptTitle: "COLCHICINE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "COLCHICINE / DOSING",
        loreText: """
        > SECTOR-01 // PHARMACOLOGY
        > ACUTE GOUT: 1.2 mg PO at first sign of flare, then 0.6 mg 1 hour later (total 1.8 mg).
        > PROPHYLAXIS: 0.6 mg QD–BID during initiation of urate-lowering therapy (6–12 months).
        > FMF: 0.6–1.8 mg QD.
        > PERICARDITIS: 0.5 mg BID (weight-based) + NSAID ± colchicine.
        > RENAL: Reduce to 0.6 mg QD if CrCl <30 mL/min; avoid dialysis.
        > LOWER DOSES + INTERACTIONS: Reduce dose when combined with CYP3A4/P-gp inhibitors.
        """,
        challengeType: .multipleChoice,
        options: [
            "A. The correct acute gout dosing for colchicine is 0.6 mg every hour until pain resolves (maximum 6 mg)",
            "B. Acute gout: 1.2 mg at first sign, then 0.6 mg 1 hour later (total 1.8 mg); prophylaxis: 0.6 mg QD–BID; reduce dose with CYP3A4/P-gp inhibitors or renal impairment",
            "C. Colchicine for acute gout is dosed at 0.6 mg TID for 5 days",
            "D. Colchicine prophylaxis dose is the same as the acute gout treatment dose"
        ],
        correctAnswer: "B. Acute gout: 1.2 mg at first sign, then 0.6 mg 1 hour later (total 1.8 mg); prophylaxis: 0.6 mg QD–BID; reduce dose with CYP3A4/P-gp inhibitors or renal impairment",
        isUnlocked: false,
        isCompleted: false,
        xOffset: 0.19,
        yOffset: 0.78,
        angle: .dosing,
        baseConceptTitle: "COLCHICINE"
    ),
]
