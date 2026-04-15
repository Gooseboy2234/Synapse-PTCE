import Foundation

// Phase 13 — 8 Important Single-Node Drugs × 4 Angles
// Glipizide, Methotrexate, Isotretinoin/iPLEDGE, Sildenafil/PDE5, Cephalexin,
// Aripiprazole, Naltrexone, Venlafaxine (32 nodes)

let multiAngleNodes_D1m: [DataNode] = [

    // ─── GLIPIZIDE ───────────────────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / INDICATION",
        loreText: "Glipizide is a second-generation sulfonylurea used for type 2 diabetes mellitus. It stimulates insulin secretion from pancreatic beta cells. Used as monotherapy or combined with metformin/insulin when diet/exercise alone are insufficient.",
        challengeType: .multipleChoice,
        options: [
            "A. Type 2 diabetes mellitus — stimulates pancreatic insulin secretion",
            "B. Type 1 diabetes mellitus — replaces absent insulin production",
            "C. Hypothyroidism — stimulates thyroid hormone release",
            "D. Hyperlipidemia — inhibits cholesterol synthesis in the liver"
        ],
        correctAnswer: "A. Type 2 diabetes mellitus — stimulates pancreatic insulin secretion",
        xOffset: 0.04,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / MECHANISM",
        loreText: "Glipizide binds ATP-sensitive K+ channels on pancreatic beta cell membranes, causing depolarization, calcium influx, and insulin release. This action is glucose-independent — meaning insulin is released even at low blood sugar levels, creating hypoglycemia risk.",
        challengeType: .multipleChoice,
        options: [
            "A. Blocks ATP-sensitive K+ channels on beta cells, triggering insulin secretion regardless of glucose level",
            "B. Activates PPAR-gamma receptors to improve insulin sensitivity",
            "C. Inhibits DPP-4 enzyme to increase GLP-1 levels",
            "D. Blocks glucose reabsorption in the renal tubules"
        ],
        correctAnswer: "A. Blocks ATP-sensitive K+ channels on beta cells, triggering insulin secretion regardless of glucose level",
        xOffset: 0.09,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / SAFETY",
        loreText: "Major risk: hypoglycemia — glucose-independent mechanism means insulin secretion even at low glucose. Risk increases with missed meals, alcohol, renal impairment (reduced clearance), or concurrent sulfonylurea interactions. Elderly patients at higher risk for severe hypoglycemia.",
        challengeType: .multipleChoice,
        options: [
            "A. Hypoglycemia — secretion is glucose-independent, risk increases with missed meals or renal impairment",
            "B. Hyperkalemia — blocks potassium channels throughout the body",
            "C. Hepatotoxicity — metabolized by CYP2C9 with hepatic accumulation",
            "D. Agranulocytosis — suppresses white blood cell production"
        ],
        correctAnswer: "A. Hypoglycemia — secretion is glucose-independent, risk increases with missed meals or renal impairment",
        xOffset: 0.14,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "GLIPIZIDE / DOSING",
        loreText: "Starting dose: 5 mg daily taken 30 minutes before breakfast. Max: 40 mg/day (doses >15 mg divided BID). Extended-release (Glucotrol XL) given once daily with breakfast. Dose reduce in hepatic impairment. Avoid in severe renal impairment (CrCl <30 mL/min) due to hypoglycemia risk.",
        challengeType: .multipleChoice,
        options: [
            "A. Start 5 mg daily taken 30 minutes before breakfast; max 40 mg/day",
            "B. Start 500 mg twice daily with meals (like metformin)",
            "C. Given once weekly as a subcutaneous injection",
            "D. Start 100 mg once daily with no regard to meals"
        ],
        correctAnswer: "A. Start 5 mg daily taken 30 minutes before breakfast; max 40 mg/day",
        xOffset: 0.19,
        yOffset: 0.650,
        baseConceptTitle: "Glipizide"
    ),

    // ─── METHOTREXATE ────────────────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / INDICATION",
        loreText: "Methotrexate is used for: (1) cancer — ALL, NHL, osteosarcoma at high doses; (2) rheumatoid arthritis and psoriatic arthritis (DMARD); (3) psoriasis; (4) ectopic pregnancy and medication abortion. It is a cornerstone DMARD for RA.",
        challengeType: .multipleChoice,
        options: [
            "A. Rheumatoid arthritis (DMARD), certain cancers, psoriasis, and ectopic pregnancy",
            "B. Type 2 diabetes mellitus — reduces hepatic glucose output",
            "C. Bacterial infections — inhibits bacterial dihydrofolate reductase only",
            "D. Hypothyroidism — stimulates thyroid hormone synthesis"
        ],
        correctAnswer: "A. Rheumatoid arthritis (DMARD), certain cancers, psoriasis, and ectopic pregnancy",
        xOffset: 0.04,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / MECHANISM",
        loreText: "Methotrexate inhibits dihydrofolate reductase (DHFR), blocking tetrahydrofolate production needed for purine and pyrimidine synthesis. This inhibits DNA replication and rapidly dividing cells. Also inhibits AICAR transformylase, increasing anti-inflammatory adenosine.",
        challengeType: .multipleChoice,
        options: [
            "A. Inhibits dihydrofolate reductase (DHFR), blocking DNA synthesis in rapidly dividing cells",
            "B. Activates PPAR-gamma to reduce synovial inflammation",
            "C. Blocks TNF-alpha by binding its receptor",
            "D. Inhibits COX-1 and COX-2 to reduce prostaglandin synthesis"
        ],
        correctAnswer: "A. Inhibits dihydrofolate reductase (DHFR), blocking DNA synthesis in rapidly dividing cells",
        xOffset: 0.09,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / SAFETY",
        loreText: "Black box warnings: hepatotoxicity (baseline LFTs required), bone marrow suppression (CBC monitoring), severe pulmonary toxicity, nephrotoxicity (renal elimination — avoid NSAIDs), embryotoxicity/teratogenicity (contraindicated in pregnancy — Category X). Leucovorin rescue used for overdose or high-dose therapy.",
        challengeType: .multipleChoice,
        options: [
            "A. Hepatotoxicity, bone marrow suppression, and teratogenicity — contraindicated in pregnancy",
            "B. Hyperglycemia and pancreatitis are the main safety concerns",
            "C. Methotrexate is safe in pregnancy when used at low RA doses",
            "D. NSAIDs enhance methotrexate clearance reducing toxicity risk"
        ],
        correctAnswer: "A. Hepatotoxicity, bone marrow suppression, and teratogenicity — contraindicated in pregnancy",
        xOffset: 0.14,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "METHOTREXATE / DOSING",
        loreText: "RA: 7.5–25 mg once WEEKLY (not daily — fatal errors have occurred with daily dosing). Cancer: high-dose IV protocols (e.g., 12 g/m²) with leucovorin rescue. Folic acid 1 mg daily supplementation reduces GI side effects and mouth sores. CBC/LFTs monitored periodically.",
        challengeType: .multipleChoice,
        options: [
            "A. For RA: dosed ONCE WEEKLY — daily dosing has caused fatal errors",
            "B. For RA: 7.5 mg taken daily every morning",
            "C. Methotrexate is only given intravenously",
            "D. No supplementation is needed alongside methotrexate"
        ],
        correctAnswer: "A. For RA: dosed ONCE WEEKLY — daily dosing has caused fatal errors",
        xOffset: 0.19,
        yOffset: 0.700,
        baseConceptTitle: "Methotrexate"
    ),

    // ─── ISOTRETINOIN / iPLEDGE ─────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / INDICATION",
        loreText: "Isotretinoin (Accutane, Claravis, Absorica) is indicated for severe recalcitrant nodular acne that has failed other treatments. It is a vitamin A derivative. Due to severe teratogenicity, it is only available through the iPLEDGE REMS program.",
        challengeType: .multipleChoice,
        options: [
            "A. Severe recalcitrant nodular acne unresponsive to other therapies",
            "B. Mild to moderate acne as first-line treatment",
            "C. Psoriasis and rheumatoid arthritis as an anti-inflammatory",
            "D. Cystic acne only when combined with topical antibiotics"
        ],
        correctAnswer: "A. Severe recalcitrant nodular acne unresponsive to other therapies",
        xOffset: 0.04,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / MECHANISM",
        loreText: "Isotretinoin (a retinoic acid isomer) reduces sebaceous gland size and sebum production (primary mechanism), normalizes follicular keratinization, inhibits P. acnes proliferation, and has anti-inflammatory effects. These combined actions result in long-term or permanent acne remission.",
        challengeType: .multipleChoice,
        options: [
            "A. Reduces sebaceous gland size and sebum production while normalizing follicular keratinization",
            "B. Inhibits 5-alpha reductase, reducing dihydrotestosterone levels",
            "C. Acts as a COX-2 inhibitor reducing follicular inflammation only",
            "D. Kills P. acnes bacteria via antibiotic action"
        ],
        correctAnswer: "A. Reduces sebaceous gland size and sebum production while normalizing follicular keratinization",
        xOffset: 0.09,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / SAFETY",
        loreText: "iPLEDGE REMS: all prescribers, pharmacies, and patients must register. Patients capable of pregnancy require 2 forms of contraception and monthly negative pregnancy tests. No blood donation during treatment or 1 month after. Depression and psychiatric effects monitored. Teratogenicity is Category X.",
        challengeType: .multipleChoice,
        options: [
            "A. iPLEDGE requires 2 contraceptive methods and monthly negative pregnancy tests — teratogenicity is Category X",
            "B. iPLEDGE only requires a single pregnancy test before starting",
            "C. Male patients do not need to register in iPLEDGE",
            "D. Blood donation is unrestricted during isotretinoin therapy"
        ],
        correctAnswer: "A. iPLEDGE requires 2 contraceptive methods and monthly negative pregnancy tests — teratogenicity is Category X",
        xOffset: 0.14,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ISOTRETINOIN / DOSING",
        loreText: "Typical dosing: 0.5–1 mg/kg/day divided twice daily with meals for 15–20 weeks. Cumulative dose target: 120–150 mg/kg. Pharmacists must verify iPLEDGE authorization (Risk Management Authorization/RMA) within 7 days of prescriber authorization. No more than 30-day supply dispensed.",
        challengeType: .multipleChoice,
        options: [
            "A. Dispense no more than a 30-day supply after verifying iPLEDGE authorization (RMA) within 7 days",
            "B. Dispense up to a 90-day supply for convenience",
            "C. No special verification needed before dispensing isotretinoin",
            "D. Dose is fixed at 10 mg/day regardless of weight"
        ],
        correctAnswer: "A. Dispense no more than a 30-day supply after verifying iPLEDGE authorization (RMA) within 7 days",
        xOffset: 0.19,
        yOffset: 0.750,
        baseConceptTitle: "Isotretinoin/iPLEDGE"
    ),

    // ─── SILDENAFIL / PDE5 INHIBITORS ──────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / INDICATION",
        loreText: "Sildenafil (Viagra) treats erectile dysfunction (ED). At higher doses (Revatio), it treats pulmonary arterial hypertension (PAH). Tadalafil (Cialis) also treats benign prostatic hyperplasia (BPH). PDE5 inhibitors do not increase libido — they facilitate erection when sexually stimulated.",
        challengeType: .multipleChoice,
        options: [
            "A. Erectile dysfunction and pulmonary arterial hypertension (Revatio)",
            "B. Erectile dysfunction and benign prostatic hyperplasia only (all PDE5 inhibitors)",
            "C. Systemic hypertension as a primary antihypertensive",
            "D. Heart failure by increasing cardiac contractility"
        ],
        correctAnswer: "A. Erectile dysfunction and pulmonary arterial hypertension (Revatio)",
        xOffset: 0.04,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / MECHANISM",
        loreText: "PDE5 inhibitors block phosphodiesterase type 5, preventing breakdown of cGMP. Elevated cGMP relaxes smooth muscle in the corpus cavernosum (promoting erection) and pulmonary vasculature (reducing PAH). Sexual stimulation is required to release NO and generate cGMP.",
        challengeType: .multipleChoice,
        options: [
            "A. Inhibits PDE5, increasing cGMP — relaxes smooth muscle in corpus cavernosum and pulmonary vessels",
            "B. Directly increases testosterone levels to improve erectile function",
            "C. Blocks alpha-1 receptors causing penile smooth muscle relaxation",
            "D. Inhibits PDE3, increasing cAMP in cardiac muscle"
        ],
        correctAnswer: "A. Inhibits PDE5, increasing cGMP — relaxes smooth muscle in corpus cavernosum and pulmonary vessels",
        xOffset: 0.09,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / SAFETY",
        loreText: "ABSOLUTE CONTRAINDICATION: nitrates (nitroglycerin, isosorbide) — profound, potentially fatal hypotension. Contraindicated with riociguat. Alpha-blockers cause additive hypotension (caution). Vision changes (NAION — non-arteritic anterior ischemic optic neuropathy) reported. Priapism: erection >4 hours requires emergency treatment.",
        challengeType: .multipleChoice,
        options: [
            "A. Absolutely contraindicated with nitrates — risk of profound fatal hypotension",
            "B. Can be combined with nitroglycerin if separated by 2 hours",
            "C. Alpha-blockers and sildenafil are safe to combine at full doses",
            "D. Priapism resolving within 6 hours requires no medical attention"
        ],
        correctAnswer: "A. Absolutely contraindicated with nitrates — risk of profound fatal hypotension",
        xOffset: 0.14,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SILDENAFIL / DOSING",
        loreText: "ED: sildenafil 50 mg 1 hour before sexual activity (range 25–100 mg); max once daily. Tadalafil: 10 mg (range 5–20 mg) before activity OR 2.5–5 mg daily. Dose reduce in hepatic/renal impairment and elderly. Take on empty stomach for faster onset (sildenafil — fatty food delays absorption).",
        challengeType: .multipleChoice,
        options: [
            "A. Sildenafil 50 mg taken ~1 hour before sexual activity; fatty food delays absorption",
            "B. Sildenafil 100 mg taken 4 hours before activity is standard",
            "C. Tadalafil and sildenafil can be taken simultaneously for better effect",
            "D. Sildenafil is taken daily regardless of sexual activity schedule"
        ],
        correctAnswer: "A. Sildenafil 50 mg taken ~1 hour before sexual activity; fatty food delays absorption",
        xOffset: 0.19,
        yOffset: 0.800,
        baseConceptTitle: "Sildenafil/PDE5 Inhibitors"
    ),

    // ─── CEPHALEXIN / CEPHALOSPORINS ──────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / INDICATION",
        loreText: "Cephalexin (1st-generation cephalosporin) is used for skin/soft tissue infections (SSTI), streptococcal pharyngitis, UTIs (uncomplicated), and bone infections. Excellent gram-positive coverage (MSSA, strep). Cephalosporins are classified as 1st through 5th generation based on gram-negative spectrum.",
        challengeType: .multipleChoice,
        options: [
            "A. Skin/soft tissue infections and streptococcal pharyngitis — excellent gram-positive coverage",
            "B. MRSA infections — first-line for methicillin-resistant organisms",
            "C. Atypical pneumonia caused by Mycoplasma and Chlamydophila",
            "D. Anaerobic infections in the GI tract"
        ],
        correctAnswer: "A. Skin/soft tissue infections and streptococcal pharyngitis — excellent gram-positive coverage",
        xOffset: 0.04,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / MECHANISM",
        loreText: "Cephalosporins, like penicillins, are beta-lactam antibiotics that inhibit bacterial cell wall synthesis by binding to penicillin-binding proteins (PBPs). This prevents cross-linking of peptidoglycan, causing osmotic lysis and death. Bactericidal and time-dependent killing.",
        challengeType: .multipleChoice,
        options: [
            "A. Inhibits bacterial cell wall synthesis by binding penicillin-binding proteins (PBPs) — bactericidal",
            "B. Inhibits bacterial ribosome 50S subunit — bacteriostatic",
            "C. Disrupts bacterial cell membrane permeability",
            "D. Inhibits DNA gyrase, preventing DNA replication"
        ],
        correctAnswer: "A. Inhibits bacterial cell wall synthesis by binding penicillin-binding proteins (PBPs) — bactericidal",
        xOffset: 0.09,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / SAFETY",
        loreText: "Cross-reactivity with penicillin allergy: ~1–2% true cross-reactivity (historical 10% estimate was inflated). Assess penicillin allergy history — most patients with penicillin allergy can safely receive cephalosporins. Contraindicated with known cephalosporin hypersensitivity. GI side effects common.",
        challengeType: .multipleChoice,
        options: [
            "A. Cross-reactivity with penicillin is ~1-2% — most penicillin-allergic patients can receive cephalosporins",
            "B. Cross-reactivity with penicillin is 100% — never use cephalosporins in penicillin-allergic patients",
            "C. Cephalosporins are first-line for MRSA infections",
            "D. Cephalosporins are contraindicated in all patients with any antibiotic allergy"
        ],
        correctAnswer: "A. Cross-reactivity with penicillin is ~1-2% — most penicillin-allergic patients can receive cephalosporins",
        xOffset: 0.14,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CEPHALEXIN / DOSING",
        loreText: "Cephalexin: 250–500 mg every 6 hours (QID) for 7–14 days depending on indication. Dose adjust in renal impairment (renally eliminated). Take with or without food. For strep pharyngitis, 500 mg BID for 10 days is preferred for adherence. Complete the full course.",
        challengeType: .multipleChoice,
        options: [
            "A. 250–500 mg every 6 hours; complete the full course and adjust dose in renal impairment",
            "B. 1000 mg once daily — convenient once-daily dosing",
            "C. No renal dose adjustment needed for cephalexin",
            "D. Cephalexin is only available as an IV formulation"
        ],
        correctAnswer: "A. 250–500 mg every 6 hours; complete the full course and adjust dose in renal impairment",
        xOffset: 0.19,
        yOffset: 0.850,
        baseConceptTitle: "Cephalexin/Cephalosporins"
    ),

    // ─── ARIPIPRAZOLE ────────────────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / INDICATION",
        loreText: "Aripiprazole (Abilify) is an atypical antipsychotic indicated for: schizophrenia, bipolar I disorder (manic/mixed episodes), as adjunct for major depressive disorder (MDD), irritability associated with autism spectrum disorder (ASD), and Tourette's disorder.",
        challengeType: .multipleChoice,
        options: [
            "A. Schizophrenia, bipolar I disorder, adjunct for MDD, and autism-related irritability",
            "B. Schizophrenia only — not approved for mood disorders",
            "C. Type 2 diabetes mellitus as an insulin sensitizer",
            "D. ADHD as a first-line stimulant alternative"
        ],
        correctAnswer: "A. Schizophrenia, bipolar I disorder, adjunct for MDD, and autism-related irritability",
        xOffset: 0.04,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / MECHANISM",
        loreText: "Aripiprazole is a dopamine D2 and D3 partial agonist and serotonin 5-HT1A partial agonist. As a partial agonist, it acts as a functional antagonist when dopamine is excessive (psychosis) and as an agonist when dopamine is deficient. Also antagonizes 5-HT2A receptors.",
        challengeType: .multipleChoice,
        options: [
            "A. Partial agonist at D2/D3 and 5-HT1A receptors — acts as antagonist or agonist depending on dopamine tone",
            "B. Full dopamine D2 antagonist with no serotonergic activity",
            "C. Pure serotonin reuptake inhibitor with no dopamine activity",
            "D. GABA-A receptor positive allosteric modulator"
        ],
        correctAnswer: "A. Partial agonist at D2/D3 and 5-HT1A receptors — acts as antagonist or agonist depending on dopamine tone",
        xOffset: 0.09,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / SAFETY",
        loreText: "Compared to other atypicals: lower risk of weight gain/metabolic syndrome and QTc prolongation. Still carries black box warnings: increased mortality in elderly dementia patients and suicidality in pediatric/young adult patients. EPS and tardive dyskinesia possible. Monitor for compulsive behaviors (gambling, hypersexuality).",
        challengeType: .multipleChoice,
        options: [
            "A. Black box: increased mortality in elderly dementia patients; monitor for compulsive behaviors",
            "B. Aripiprazole causes significant weight gain and metabolic syndrome like other atypicals",
            "C. No risk of tardive dyskinesia with aripiprazole",
            "D. Aripiprazole is contraindicated in bipolar disorder"
        ],
        correctAnswer: "A. Black box: increased mortality in elderly dementia patients; monitor for compulsive behaviors",
        xOffset: 0.14,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ARIPIPRAZOLE / DOSING",
        loreText: "Schizophrenia/bipolar: start 10–15 mg once daily; target 10–30 mg/day. MDD adjunct: 2–5 mg/day added to antidepressant. Available as oral tablets, ODT (dissolving), oral solution, IM injection (acute agitation), and long-acting injectable (Abilify Maintena, Aristada — monthly or longer). CYP2D6/3A4 metabolism — dose adjust with inhibitors.",
        challengeType: .multipleChoice,
        options: [
            "A. Start 10–15 mg once daily; available as oral, ODT, oral solution, and long-acting injectable formulations",
            "B. Aripiprazole is only available as an oral tablet",
            "C. Start at 100 mg daily due to partial agonism requiring higher doses",
            "D. Aripiprazole is dosed twice daily due to its short half-life"
        ],
        correctAnswer: "A. Start 10–15 mg once daily; available as oral, ODT, oral solution, and long-acting injectable formulations",
        xOffset: 0.19,
        yOffset: 0.900,
        baseConceptTitle: "Aripiprazole"
    ),

    // ─── NALTREXONE ──────────────────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / INDICATION",
        loreText: "Naltrexone is a pure opioid antagonist used for: (1) opioid use disorder (OUD) — maintenance treatment after detox; (2) alcohol use disorder (AUD) — reduces craving and reinforcement. Available as oral tablet (ReVia) and extended-release monthly IM injection (Vivitrol).",
        challengeType: .multipleChoice,
        options: [
            "A. Opioid use disorder (maintenance) and alcohol use disorder — reduces craving and relapse",
            "B. Opioid use disorder only — not approved for alcohol use disorder",
            "C. Acute opioid overdose reversal — same as naloxone",
            "D. Pain management as an opioid partial agonist"
        ],
        correctAnswer: "A. Opioid use disorder (maintenance) and alcohol use disorder — reduces craving and relapse",
        xOffset: 0.04,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / MECHANISM",
        loreText: "Naltrexone competitively blocks mu, kappa, and delta opioid receptors with no intrinsic activity (pure antagonist). By blocking opioid receptors, it prevents euphoria from opioids and reduces alcohol craving (endorphin pathway). Long half-life vs naloxone — oral dosing effective.",
        challengeType: .multipleChoice,
        options: [
            "A. Pure opioid receptor antagonist — blocks euphoria from opioids and reduces alcohol craving via endorphin pathway",
            "B. Partial opioid agonist like buprenorphine — provides mild euphoria to prevent relapse",
            "C. GABA-B receptor agonist — reduces alcohol craving by different mechanism",
            "D. Dopamine reuptake inhibitor reducing reward from alcohol"
        ],
        correctAnswer: "A. Pure opioid receptor antagonist — blocks euphoria from opioids and reduces alcohol craving via endorphin pathway",
        xOffset: 0.09,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / SAFETY",
        loreText: "CONTRAINDICATION: must be fully opioid-free for 7–10 days (oral) or 7–14 days (IM Vivitrol) before starting — will precipitate severe withdrawal in opioid-dependent patients. Hepatotoxicity risk at high doses (black box warning). Not a scheduled substance. Opioid pain medications will be ineffective while taking naltrexone.",
        challengeType: .multipleChoice,
        options: [
            "A. Patient must be fully opioid-free 7-10 days before starting — precipitates severe withdrawal otherwise",
            "B. Naltrexone can be started immediately after last opioid use",
            "C. Naltrexone is a Schedule II controlled substance",
            "D. Patients can still use opioids for pain while on naltrexone"
        ],
        correctAnswer: "A. Patient must be fully opioid-free 7-10 days before starting — precipitates severe withdrawal otherwise",
        xOffset: 0.14,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "NALTREXONE / DOSING",
        loreText: "Oral (ReVia): 50 mg once daily (OUD and AUD). Some use 25 mg first day to assess tolerance. IM (Vivitrol): 380 mg deep IM gluteal injection every 4 weeks. Confirm opioid-free status with urine drug screen before initiation. Monitor LFTs. No DEA schedule — no special prescription requirements.",
        challengeType: .multipleChoice,
        options: [
            "A. Oral 50 mg once daily OR 380 mg IM injection monthly (Vivitrol); confirm opioid-free first",
            "B. Naltrexone requires a DEA Schedule III prescription",
            "C. The injectable form (Vivitrol) is given weekly",
            "D. Starting dose is 100 mg daily to ensure adequate receptor blockade"
        ],
        correctAnswer: "A. Oral 50 mg once daily OR 380 mg IM injection monthly (Vivitrol); confirm opioid-free first",
        xOffset: 0.19,
        yOffset: 0.950,
        baseConceptTitle: "Naltrexone"
    ),

    // ─── VENLAFAXINE ─────────────────────────────────────────────
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / INDICATION",
        loreText: "Venlafaxine (Effexor) is an SNRI indicated for major depressive disorder (MDD), generalized anxiety disorder (GAD), social anxiety disorder, and panic disorder. Desvenlafaxine (Pristiq) is the active metabolite. Also used off-label for neuropathic pain, fibromyalgia, and hot flashes.",
        challengeType: .multipleChoice,
        options: [
            "A. MDD, generalized anxiety disorder, social anxiety, and panic disorder",
            "B. MDD only — not approved for anxiety disorders",
            "C. Bipolar depression as a mood stabilizer",
            "D. ADHD as a non-stimulant alternative"
        ],
        correctAnswer: "A. MDD, generalized anxiety disorder, social anxiety, and panic disorder",
        xOffset: 0.04,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / MECHANISM",
        loreText: "Venlafaxine inhibits both serotonin (5-HT) and norepinephrine (NE) reuptake transporters. At low doses (<150 mg), primarily serotonergic. At higher doses (≥150 mg), norepinephrine reuptake inhibition increases. Also weakly inhibits dopamine reuptake at very high doses.",
        challengeType: .multipleChoice,
        options: [
            "A. Inhibits serotonin and norepinephrine reuptake (SNRI); NE inhibition increases at higher doses",
            "B. Inhibits serotonin reuptake only (SSRI mechanism)",
            "C. Blocks dopamine D2 receptors as primary mechanism",
            "D. Inhibits monoamine oxidase (MAO-A and MAO-B)"
        ],
        correctAnswer: "A. Inhibits serotonin and norepinephrine reuptake (SNRI); NE inhibition increases at higher doses",
        xOffset: 0.09,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / SAFETY",
        loreText: "Dose-dependent blood pressure increases (hypertension monitoring required). Black box: suicidality in children/young adults. Serotonin syndrome risk with MAOIs, triptans, linezolid. Discontinuation syndrome is severe — taper gradually. Sexual dysfunction, nausea, and insomnia common. Avoid in uncontrolled hypertension.",
        challengeType: .multipleChoice,
        options: [
            "A. Monitor BP (dose-dependent hypertension); taper slowly to avoid severe discontinuation syndrome",
            "B. Venlafaxine can be stopped abruptly without discontinuation effects",
            "C. Venlafaxine has no interaction with MAOIs",
            "D. Blood pressure is not affected by venlafaxine at any dose"
        ],
        correctAnswer: "A. Monitor BP (dose-dependent hypertension); taper slowly to avoid severe discontinuation syndrome",
        xOffset: 0.14,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "VENLAFAXINE / DOSING",
        loreText: "MDD: start 37.5–75 mg/day; titrate to 75–225 mg/day (ER formulation once daily; IR twice or three times daily). GAD: 75–225 mg/day. Reduce dose 25–50% in renal impairment; 50% in hepatic impairment. MAOIs: wait 14 days after stopping MAOI before starting; wait 7 days after stopping venlafaxine before starting MAOI.",
        challengeType: .multipleChoice,
        options: [
            "A. Start 37.5–75 mg/day; ER form taken once daily; dose reduce in renal/hepatic impairment",
            "B. Venlafaxine IR is taken once daily at bedtime",
            "C. No dose adjustment needed in renal or hepatic impairment",
            "D. Maximum dose is 75 mg/day regardless of indication"
        ],
        correctAnswer: "A. Start 37.5–75 mg/day; ER form taken once daily; dose reduce in renal/hepatic impairment",
        xOffset: 0.19,
        yOffset: 0.990,
        baseConceptTitle: "Venlafaxine"
    ),
]
