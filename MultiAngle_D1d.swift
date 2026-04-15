
//
//  MultiAngle_D1d.swift
//  Synapse PTCE
//
//  Multi-angle nodes for Domain 1: Medications — Wave 3
//  56 nodes — 14 high-priority PTCE drugs × 4 angles each
//

import Foundation

extension DataNode {

    static var multiAngleNodes_D1d: [DataNode] {[

        // MARK: — HYDROCODONE/APAP

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HYDROCODONE/APAP / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Opioid Analgesic Combination — Schedule CII
            > BRAND: Norco, Vicodin, Lortab
            > USE: Moderate-to-severe pain requiring opioid analgesia.
            > COMBINATION: Hydrocodone (mu-opioid agonist) + acetaminophen (central COX inhibitor).
            > APAP CAP: All current formulations capped at 325 mg APAP/tablet (FDA 2014 mandate).
            > NOTE: CII — no refills; emergency 72-hour supply only.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Mild musculoskeletal pain; contains hydrocodone + ibuprofen; Schedule CIII",
                "B. Moderate-to-severe pain; Schedule CII combination of hydrocodone + acetaminophen; each tablet capped at 325 mg APAP",
                "C. Neuropathic pain only; standalone hydrocodone formulation; no acetaminophen component",
                "D. Chronic cancer pain exclusively; each tablet contains 650 mg acetaminophen"
            ],
            correctAnswer: "B. Moderate-to-severe pain; Schedule CII combination of hydrocodone + acetaminophen; each tablet capped at 325 mg APAP",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.15,
            angle: .indication,
            baseConceptTitle: "HYDROCODONE/APAP"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HYDROCODONE/APAP / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > HYDROCODONE: Mu-opioid receptor full agonist → ↓ pain perception, ↑ pain tolerance.
            > ACETAMINOPHEN: Central COX inhibitor + endocannabinoid modulation; analgesic/antipyretic.
            > SYNERGY: Dual mechanism → adequate analgesia at lower opioid dose.
            > METABOLISM: Hydrocodone → CYP2D6 → hydromorphone (active metabolite).
            > NOTE: CYP2D6 ultra-rapid metabolizers may have enhanced opioid effects.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Dual COX-1/COX-2 peripheral inhibition plus central dopamine reuptake blockade",
                "B. Selective serotonin reuptake inhibition plus peripheral opioid receptor modulation",
                "C. Mu-opioid receptor agonism (hydrocodone) plus central COX inhibition/endocannabinoid modulation (acetaminophen)",
                "D. NMDA receptor antagonism plus descending norepinephrine pathway activation"
            ],
            correctAnswer: "C. Mu-opioid receptor agonism (hydrocodone) plus central COX inhibition/endocannabinoid modulation (acetaminophen)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.15,
            angle: .mechanism,
            baseConceptTitle: "HYDROCODONE/APAP"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HYDROCODONE/APAP / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Addiction, abuse, misuse; respiratory depression; neonatal opioid withdrawal.
            > BLACK BOX: Accidental ingestion (children); CNS depressant interactions.
            > APAP HEPATOTOXICITY: Total APAP ≤ 4 g/day (≤ 3 g/day if elderly/alcohol use).
            > HIDDEN APAP: Patients may be on multiple APAP-containing products unknowingly.
            > OVERDOSE: Naloxone (opioid) + N-acetylcysteine (APAP component).
            > REMS: Opioid REMS education required for ER/LA opioid products.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. The primary safety concern is cardiac arrhythmia from hydrocodone-APAP interaction at high doses",
                "B. APAP hepatotoxicity from exceeding 4 g/day total; patients must check ALL APAP-containing products; no refills (CII)",
                "C. Nephrotoxicity is the primary risk; monitor creatinine every 3 months during therapy",
                "D. QT prolongation is the main risk; avoid with antiarrhythmics and azithromycin"
            ],
            correctAnswer: "B. APAP hepatotoxicity from exceeding 4 g/day total; patients must check ALL APAP-containing products; no refills (CII)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.15,
            angle: .safety,
            baseConceptTitle: "HYDROCODONE/APAP"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "HYDROCODONE/APAP / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ADULT DOSE: Hydrocodone 5–10 mg / APAP 325 mg every 4–6 hours PRN pain.
            > APAP: All current combination products contain ≤ 325 mg APAP per tablet.
            > SCHEDULE: CII — no refills; new Rx required for each fill.
            > ER FORMS: Zohydro ER, Hysingla ER (hydrocodone only, abuse-deterrent).
            > EQUIANALGESIC: Oral hydrocodone 30 mg ≈ oral morphine 30 mg (1:1 ratio).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. 10–20 mg hydrocodone / 650 mg APAP q2h; up to 5 refills in 6 months (Schedule CIII)",
                "B. 5–10 mg hydrocodone / 325 mg APAP every 4–6 hours PRN; NO refills (Schedule CII)",
                "C. 2.5 mg hydrocodone / 500 mg APAP q8h; unlimited refills with prescriber authorization",
                "D. 20 mg hydrocodone once daily ER formulation; combination with APAP not available in ER"
            ],
            correctAnswer: "B. 5–10 mg hydrocodone / 325 mg APAP every 4–6 hours PRN; NO refills (Schedule CII)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.15,
            angle: .dosing,
            baseConceptTitle: "HYDROCODONE/APAP"
        ),

        // MARK: — OXYCODONE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OXYCODONE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Opioid Analgesic — Schedule CII
            > BRAND: OxyContin (ER), Roxicodone (IR), Percocet (+ APAP)
            > IR: Moderate-to-severe acute pain.
            > ER (OxyContin): Around-the-clock pain management for opioid-tolerant patients.
            > ABUSE-DETERRENT: OxyContin ER contains tamper-resistant matrix (gels if crushed).
            > NOTE: ER doses ≥ 60 mg/day require prior opioid tolerance.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. OxyContin ER is appropriate for opioid-naive patients with mild acute pain",
                "B. Oxycodone IR is Schedule CIII; OxyContin ER is Schedule CII",
                "C. Oxycodone IR for moderate-to-severe acute pain; OxyContin ER for opioid-tolerant patients requiring around-the-clock analgesia",
                "D. Oxycodone is FDA-approved only for cancer pain; non-cancer use is strictly off-label"
            ],
            correctAnswer: "C. Oxycodone IR for moderate-to-severe acute pain; OxyContin ER for opioid-tolerant patients requiring around-the-clock analgesia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.21,
            angle: .indication,
            baseConceptTitle: "OXYCODONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OXYCODONE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: Full mu-opioid receptor agonist; also kappa and delta activity.
            > BIOAVAILABILITY: Oral ~60–87% (higher than morphine ~30–40%).
            > METABOLISM: CYP3A4 → noroxycodone (inactive); CYP2D6 → oxymorphone (active).
            > HALF-LIFE: IR ~3–5 hours; OxyContin ER ~12 hours.
            > POTENCY: Oxycodone 20 mg oral ≈ morphine 30 mg oral (1.5× more potent than morphine mg:mg).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Oxycodone has lower oral bioavailability (~20%) than morphine due to extensive first-pass metabolism",
                "B. Oxycodone is a prodrug requiring hepatic activation to oxymorphone before it has any analgesic effect",
                "C. Oxycodone is a full mu-opioid receptor agonist with higher oral bioavailability (~60–87%) than morphine (~30–40%)",
                "D. Oxycodone's mechanism is exclusively peripheral — it does not cross the blood-brain barrier at therapeutic doses"
            ],
            correctAnswer: "C. Oxycodone is a full mu-opioid receptor agonist with higher oral bioavailability (~60–87%) than morphine (~30–40%)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.21,
            angle: .mechanism,
            baseConceptTitle: "OXYCODONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OXYCODONE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Respiratory depression; addiction, abuse; neonatal opioid withdrawal.
            > ER TABLETS: MUST swallow whole — crushing/chewing → fatal dose dumping.
            > CNS DEPRESSANTS: Synergistic respiratory depression with benzodiazepines (BLACK BOX).
            > CONSTIPATION: Most common side effect; recommend stimulant laxative prophylactically.
            > OVERDOSE: Naloxone reversal; may need multiple/higher doses for ER formulation.
            > SCHEDULE CII: No refills; PDMP check required.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. OxyContin ER tablets can be split in half to provide intermediate 6-hour dosing",
                "B. OxyContin ER must be swallowed whole — crushing or chewing causes fatal dose dumping of the full extended-release amount",
                "C. The primary safety concern is nephrotoxicity; avoid in patients with CrCl < 60 mL/min",
                "D. OxyContin ER is safe to crush for patients with dysphagia; sprinkle on applesauce and consume immediately"
            ],
            correctAnswer: "B. OxyContin ER must be swallowed whole — crushing or chewing causes fatal dose dumping of the full extended-release amount",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.21,
            angle: .safety,
            baseConceptTitle: "OXYCODONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "OXYCODONE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > IR (OPIOID-NAIVE): 5–10 mg every 4–6 hours PRN.
            > ER (OPIOID-TOLERANT): OxyContin 10–80 mg every 12 hours.
            > OPIOID TOLERANCE defined as ≥ 60 mg oral morphine/day (or equivalent) for ≥ 1 week.
            > EQUIANALGESIC: Oxycodone 20 mg ≈ morphine 30 mg oral (1.5:1 morphine:oxycodone ratio).
            > PERCOCET LIMIT: Max 12 tablets/day (APAP 325 mg × 12 = 3.9 g — near APAP daily max).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. OxyContin ER is appropriate for all patients with chronic pain regardless of opioid history; start at 10 mg q8h",
                "B. Oxycodone IR 5–10 mg q4-6h PRN for opioid-naive; OxyContin ER requires prior opioid tolerance (≥60 mg oral morphine/day)",
                "C. Oxycodone IR 20–30 mg q4h for opioid-naive adults; tolerance is not required to start OxyContin ER",
                "D. Maximum dose of oxycodone IR is 5 mg q8h regardless of patient weight or opioid tolerance"
            ],
            correctAnswer: "B. Oxycodone IR 5–10 mg q4-6h PRN for opioid-naive; OxyContin ER requires prior opioid tolerance (≥60 mg oral morphine/day)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.21,
            angle: .dosing,
            baseConceptTitle: "OXYCODONE"
        ),

        // MARK: — ALPRAZOLAM

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Benzodiazepine — Schedule CIV
            > BRAND: Xanax, Xanax XR
            > FDA APPROVED: Panic disorder (with or without agoraphobia); generalized anxiety disorder (GAD).
            > SHORT-ACTING: Rapid onset beneficial for acute panic attacks.
            > NOTE: Short half-life (~11h) → higher abuse potential than long-acting benzos.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Major depressive disorder and bipolar I disorder; Schedule CII",
                "B. Panic disorder and generalized anxiety disorder; Schedule CIV benzodiazepine",
                "C. Schizophrenia and treatment-resistant depression; non-controlled substance",
                "D. Insomnia and restless leg syndrome; Schedule CV"
            ],
            correctAnswer: "B. Panic disorder and generalized anxiety disorder; Schedule CIV benzodiazepine",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.27,
            angle: .indication,
            baseConceptTitle: "ALPRAZOLAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: GABA-A receptor positive allosteric modulator at benzodiazepine binding site.
            > ACTION: ↑ frequency of Cl⁻ channel opening → neuronal hyperpolarization → CNS depression.
            > HALF-LIFE: ~11 hours; intermediate-acting benzodiazepine.
            > METABOLISM: CYP3A4 (major) → alpha-hydroxyalprazolam (active, weaker metabolite).
            > NOTE: Does not directly activate GABA-A (unlike barbiturates which activate at different site).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Selective dopamine D2 receptor antagonist causing anxiolysis through mesolimbic pathway suppression",
                "B. GABA-A receptor positive allosteric modulator — increases frequency of Cl⁻ channel opening → neuronal hyperpolarization",
                "C. Serotonin 5-HT1A partial agonist reducing anxiety without sedation or dependence",
                "D. Competitive NMDA receptor antagonist reducing excitatory glutamate neurotransmission"
            ],
            correctAnswer: "B. GABA-A receptor positive allosteric modulator — increases frequency of Cl⁻ channel opening → neuronal hyperpolarization",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.27,
            angle: .mechanism,
            baseConceptTitle: "ALPRAZOLAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Respiratory depression with CNS depressants/opioids.
            > DEPENDENCE: Physical and psychological dependence; tolerance develops.
            > WITHDRAWAL: Life-threatening (seizures, delirium) — MUST taper slowly (≤10%/week).
            > ELDERLY: Beers Criteria — high fall risk; avoid if possible in ≥ 65y.
            > CYP3A4: Ketoconazole, grapefruit → ↑ alprazolam levels → ↑ toxicity.
            > REBOUND ANXIETY: Interdose anxiety with short half-life.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Alprazolam can be safely stopped abruptly after 6 months of use; no taper is needed",
                "B. The primary safety concern is nephrotoxicity; avoid in patients with estimated GFR < 45",
                "C. Benzodiazepine withdrawal can be life-threatening (seizures, delirium); must taper gradually; high fall risk in elderly (Beers Criteria)",
                "D. Alprazolam causes QT prolongation; avoid with macrolide antibiotics and fluoroquinolones"
            ],
            correctAnswer: "C. Benzodiazepine withdrawal can be life-threatening (seizures, delirium); must taper gradually; high fall risk in elderly (Beers Criteria)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.27,
            angle: .safety,
            baseConceptTitle: "ALPRAZOLAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ALPRAZOLAM / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ANXIETY: 0.25–0.5 mg TID; max 4 mg/day.
            > PANIC DISORDER: 0.5–1 mg TID; may titrate; max 10 mg/day (clinical range 1–10 mg/day).
            > XR (Xanax XR): 0.5–1 mg once daily morning; max 10 mg/day.
            > ELDERLY: Start 0.25 mg BID–TID; increased CNS sensitivity.
            > TAPERING: Reduce ≤ 0.5 mg every 3 days to prevent seizures.
            > CIV: Up to 5 refills within 6 months of issue date.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Max 1 mg/day for all indications; no XR formulation exists for alprazolam",
                "B. Start 2 mg TID; maximum dose of 20 mg/day for panic disorder",
                "C. 0.25–0.5 mg TID for anxiety (max 4 mg/day); up to 10 mg/day for panic disorder; up to 5 refills within 6 months (CIV)",
                "D. Alprazolam is Schedule CII; no refills are permitted under any circumstances"
            ],
            correctAnswer: "C. 0.25–0.5 mg TID for anxiety (max 4 mg/day); up to 10 mg/day for panic disorder; up to 5 refills within 6 months (CIV)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.27,
            angle: .dosing,
            baseConceptTitle: "ALPRAZOLAM"
        ),

        // MARK: — LORAZEPAM

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LORAZEPAM / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Benzodiazepine — Schedule CIV
            > BRAND: Ativan
            > USES: Anxiety; IV status epilepticus (first-line); alcohol withdrawal; procedural sedation; chemotherapy-related nausea.
            > ELDERLY PREFERRED: No active metabolites → safer in hepatic impairment and elderly vs diazepam.
            > NOTE: No active metabolites — eliminated by glucuronidation (Phase II only).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. FDA-approved only for generalized anxiety disorder; status epilepticus use is strictly off-label",
                "B. Anxiety, IV status epilepticus (first-line), alcohol withdrawal, procedural sedation; preferred in elderly/hepatic impairment due to no active metabolites",
                "C. Bipolar disorder mood stabilization (adjunct to lithium); not approved for anxiety",
                "D. ADHD in adults; the benzodiazepine component provides calming without sedation"
            ],
            correctAnswer: "B. Anxiety, IV status epilepticus (first-line), alcohol withdrawal, procedural sedation; preferred in elderly/hepatic impairment due to no active metabolites",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.33,
            angle: .indication,
            baseConceptTitle: "LORAZEPAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LORAZEPAM / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: GABA-A receptor positive allosteric modulator (same as all benzos).
            > KEY ADVANTAGE: No active metabolites (unlike diazepam → desmethyldiazepam, t½ 200h).
            > ELIMINATION: Phase II glucuronidation only — not CYP-dependent.
            > HALF-LIFE: 10–20 hours; intermediate duration.
            > ROUTES: Oral, IV, IM, sublingual.
            > WHY PREFERRED: Safe in hepatic impairment (Phase II preserved) and elderly (no accumulation).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Lorazepam has a longer half-life than diazepam, providing smoother plasma levels with less rebound anxiety",
                "B. Lorazepam undergoes Phase II glucuronidation with no active metabolites — not CYP-dependent; safe in hepatic impairment and elderly",
                "C. Lorazepam is a prodrug converted to the active form by hepatic esterases",
                "D. Lorazepam is more lipophilic than diazepam, providing faster CNS penetration and shorter duration of action"
            ],
            correctAnswer: "B. Lorazepam undergoes Phase II glucuronidation with no active metabolites — not CYP-dependent; safe in hepatic impairment and elderly",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.33,
            angle: .mechanism,
            baseConceptTitle: "LORAZEPAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LORAZEPAM / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Respiratory depression with CNS depressants/opioids.
            > IV PROPYLENE GLYCOL: High-dose/prolonged IV lorazepam → metabolic acidosis, renal failure — monitor with continuous infusions > 24 hours.
            > PARADOXICAL REACTIONS: Agitation, hostility (especially elderly and children).
            > ANTEROGRADE AMNESIA: Impairs formation of new memories — useful for procedures.
            > SAME CLASS: Dependence, withdrawal, falls (Beers Criteria in ≥ 65y).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. IV lorazepam is safe to infuse at any rate; cardiovascular side effects are not a concern with IV lorazepam",
                "B. IV lorazepam contains propylene glycol — prolonged infusions (>24h) can cause metabolic acidosis and renal failure",
                "C. The primary safety concern with lorazepam is severe hepatotoxicity; check LFTs monthly",
                "D. Lorazepam must not be given intramuscularly due to unpredictable and dangerous absorption"
            ],
            correctAnswer: "B. IV lorazepam contains propylene glycol — prolonged infusions (>24h) can cause metabolic acidosis and renal failure",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.33,
            angle: .safety,
            baseConceptTitle: "LORAZEPAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LORAZEPAM / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ORAL ANXIETY: 0.5–2 mg BID–TID; max 10 mg/day.
            > STATUS EPILEPTICUS (IV): 0.1 mg/kg (max 4 mg single dose); may repeat once in 5 min.
            > IV RATE: Max 2 mg/min (to prevent respiratory depression/hypotension).
            > PROCEDURAL SEDATION: 2–4 mg IV/IM 30–60 min before procedure.
            > ALCOHOL WITHDRAWAL: CIWA-Ar protocol; symptom-triggered dosing.
            > CIV: Up to 5 refills within 6 months.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Status epilepticus IV dose is 0.5 mg/kg (max 20 mg); infuse as fast as possible for rapid effect",
                "B. Lorazepam IV for status epilepticus: 0.1 mg/kg (max 4 mg); may repeat once in 5 min; max IV rate 2 mg/min",
                "C. Oral lorazepam max dose is 2 mg/day; IV and IM routes are not approved formulations",
                "D. Lorazepam 10 mg IV is the standard loading dose for status epilepticus in adults"
            ],
            correctAnswer: "B. Lorazepam IV for status epilepticus: 0.1 mg/kg (max 4 mg); may repeat once in 5 min; max IV rate 2 mg/min",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.33,
            angle: .dosing,
            baseConceptTitle: "LORAZEPAM"
        ),

        // MARK: — ESCITALOPRAM

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ESCITALOPRAM / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: SSRI — Selective Serotonin Reuptake Inhibitor
            > BRAND: Lexapro
            > FDA APPROVED: MDD in adults and adolescents ≥ 12y; GAD in adults.
            > KEY FEATURE: S-enantiomer of citalopram; highest SERT selectivity among SSRIs.
            > FIRST-LINE: Commonly chosen for favorable tolerability and minimal CYP interactions.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. MDD in adults; bipolar depression; OCD and PTSD in all ages including children ≥ 6y",
                "B. MDD in adults and adolescents ≥ 12y; GAD in adults; pure S-enantiomer of citalopram with highest SERT selectivity",
                "C. Panic disorder, social anxiety disorder, and MDD exclusively in adults; pediatric use is off-label only",
                "D. MDD and fibromyalgia in adults; anxiety disorders are not FDA-approved indications"
            ],
            correctAnswer: "B. MDD in adults and adolescents ≥ 12y; GAD in adults; pure S-enantiomer of citalopram with highest SERT selectivity",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.39,
            angle: .indication,
            baseConceptTitle: "ESCITALOPRAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ESCITALOPRAM / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ACTION: Blocks SERT (serotonin transporter) → ↑ synaptic serotonin.
            > SELECTIVITY: Highest SERT selectivity of all SSRIs → fewest off-target effects.
            > CYP: Weak CYP2D6 inhibitor only; minimal CYP3A4 interaction — fewest drug interactions of all SSRIs.
            > ONSET: 2–4 weeks for mood; 6–8 weeks for full effect; anxiolytic effects may be earlier.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Escitalopram is a strong CYP3A4 and CYP2D6 inhibitor — major interaction risk with statins and TCAs",
                "B. Escitalopram blocks SERT with the highest selectivity among SSRIs and has minimal CYP inhibition — fewest drug interactions of the SSRIs",
                "C. Escitalopram also inhibits norepinephrine reuptake (SNRI activity) at doses above 20 mg/day",
                "D. Escitalopram is a serotonin 5-HT1A partial agonist plus SERT blocker — same mechanism as buspirone"
            ],
            correctAnswer: "B. Escitalopram blocks SERT with the highest selectivity among SSRIs and has minimal CYP inhibition — fewest drug interactions of the SSRIs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.39,
            angle: .mechanism,
            baseConceptTitle: "ESCITALOPRAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ESCITALOPRAM / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Suicidality in children, adolescents, and young adults ≤ 24y.
            > QT PROLONGATION: Dose-dependent; max 20 mg/day; max 10 mg/day if > 60y, hepatic impairment, or CYP2C19 poor metabolizer.
            > SEROTONIN SYNDROME: With MAOIs (14-day washout), linezolid, methylene blue.
            > DISCONTINUATION SYNDROME: "FINISH" — taper before stopping.
            > HYPONATREMIA/SIADH: Risk in elderly; check sodium.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Escitalopram is safe at 40 mg/day in all patients; QT prolongation is not a recognized concern",
                "B. Max dose in patients over age 60 is 10 mg/day due to QT prolongation risk; 14-day washout required before/after MAOIs",
                "C. Escitalopram causes agranulocytosis; monthly CBC required for first 6 months of therapy",
                "D. The primary safety concern is severe hepatotoxicity; avoid in all patients with liver disease"
            ],
            correctAnswer: "B. Max dose in patients over age 60 is 10 mg/day due to QT prolongation risk; 14-day washout required before/after MAOIs",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.39,
            angle: .safety,
            baseConceptTitle: "ESCITALOPRAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ESCITALOPRAM / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > STANDARD: Start 10 mg/day; may increase to 20 mg/day after ≥ 1 week.
            > MAX DOSE: 20 mg/day.
            > ELDERLY / HEPATIC IMPAIRMENT: 10 mg/day maximum.
            > PEDIATRIC (≥ 12y, MDD): 10 mg/day; may increase to 20 mg/day.
            > TIMING: Once daily; morning or evening (consistent timing preferred).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Start 5 mg/day; maximum dose 40 mg/day; taken in divided doses BID",
                "B. Start 10 mg/day; may increase to 20 mg/day after ≥ 1 week; max 10 mg/day in elderly/hepatic impairment",
                "C. Start 20 mg/day immediately; max 60 mg/day for severe depression",
                "D. Start 25 mg/day; max 100 mg/day; must be taken with a high-fat meal for optimal absorption"
            ],
            correctAnswer: "B. Start 10 mg/day; may increase to 20 mg/day after ≥ 1 week; max 10 mg/day in elderly/hepatic impairment",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.39,
            angle: .dosing,
            baseConceptTitle: "ESCITALOPRAM"
        ),

        // MARK: — DULOXETINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DULOXETINE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: SNRI — Serotonin-Norepinephrine Reuptake Inhibitor
            > BRAND: Cymbalta
            > FDA APPROVED: MDD; GAD; diabetic peripheral neuropathic pain; fibromyalgia; chronic musculoskeletal pain.
            > UNIQUE: Only common antidepressant with FDA-approved PAIN indications.
            > NOTE: Avoid in substantial alcohol use or hepatic impairment (hepatotoxicity risk).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. MDD and insomnia only; pain indications are off-label uses not supported by FDA",
                "B. MDD, GAD, diabetic peripheral neuropathic pain, fibromyalgia, and chronic musculoskeletal pain",
                "C. Panic disorder and PTSD exclusively; MDD is an off-label use",
                "D. MDD in adults only; pediatric and geriatric use is contraindicated due to hepatotoxicity"
            ],
            correctAnswer: "B. MDD, GAD, diabetic peripheral neuropathic pain, fibromyalgia, and chronic musculoskeletal pain",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.45,
            angle: .indication,
            baseConceptTitle: "DULOXETINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DULOXETINE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > DUAL ACTION: Inhibits SERT (serotonin) AND NET (norepinephrine) transporters.
            > PAIN PATHWAY: NE reuptake inhibition in descending pain pathways → modulates chronic/neuropathic pain.
            > METABOLISM: CYP1A2 (major) and CYP2D6; CYP1A2 inhibitors (fluvoxamine, ciprofloxacin) → ↑ duloxetine levels.
            > CYP2D6 INHIBITOR: Duloxetine inhibits CYP2D6 → ↑ levels of metoprolol, TCAs, etc.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Duloxetine blocks only SERT; norepinephrine activity is an off-target side effect not contributing to efficacy",
                "B. Duloxetine inhibits both SERT and NET; the NE component modulates descending pain pathways explaining analgesic benefit",
                "C. Duloxetine is primarily a dopamine reuptake inhibitor with secondary serotonin effects",
                "D. Duloxetine is a full mu-opioid receptor agonist with mild SERT inhibitory properties"
            ],
            correctAnswer: "B. Duloxetine inhibits both SERT and NET; the NE component modulates descending pain pathways explaining analgesic benefit",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.45,
            angle: .mechanism,
            baseConceptTitle: "DULOXETINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DULOXETINE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Suicidality in ≤ 24y.
            > HEPATOTOXICITY: Avoid in substantial alcohol use or hepatic impairment.
            > BLOOD PRESSURE: NE component may ↑ BP; monitor at initiation and dose changes.
            > DISCONTINUATION: Severe syndrome — taper over weeks; one of the hardest antidepressants to stop.
            > CYP1A2 INHIBITORS: Fluvoxamine, ciprofloxacin → significantly ↑ duloxetine levels.
            > URINARY RETENTION: NE component → caution in BPH.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Duloxetine is safe in all liver disease; hepatotoxicity is an extremely rare theoretical concern",
                "B. Duloxetine should be avoided in substantial alcohol use or hepatic impairment; discontinuation syndrome is severe — always taper",
                "C. The primary safety concern is prolonged QT interval; avoid with all antiarrhythmics",
                "D. Duloxetine causes severe agranulocytosis; monthly CBC required for the first year of therapy"
            ],
            correctAnswer: "B. Duloxetine should be avoided in substantial alcohol use or hepatic impairment; discontinuation syndrome is severe — always taper",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.45,
            angle: .safety,
            baseConceptTitle: "DULOXETINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DULOXETINE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > MDD: 30 mg/day × 1 week → 60 mg/day; max 120 mg/day.
            > NEUROPATHIC PAIN / FIBROMYALGIA: 60 mg once daily.
            > FORMULATION: Delayed-release capsule — swallow whole; can open and sprinkle on applesauce (do NOT crush contents).
            > RENAL: Avoid if CrCl < 30 mL/min.
            > HEPATIC: AVOID in significant hepatic impairment.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Start 60 mg/day immediately for all indications; max 60 mg/day",
                "B. MDD: 30 mg × 1 week then 60 mg/day (max 120 mg); neuropathic pain: 60 mg once daily; delayed-release capsule — can sprinkle on applesauce",
                "C. Start 20 mg BID for first month; increase to 40 mg BID for maintenance; crush and dissolve in water for patients with dysphagia",
                "D. Duloxetine 120 mg/day is required from day 1 for pain indications; lower doses are ineffective"
            ],
            correctAnswer: "B. MDD: 30 mg × 1 week then 60 mg/day (max 120 mg); neuropathic pain: 60 mg once daily; delayed-release capsule — can sprinkle on applesauce",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.45,
            angle: .dosing,
            baseConceptTitle: "DULOXETINE"
        ),

        // MARK: — DOXYCYCLINE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DOXYCYCLINE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Tetracycline Antibiotic
            > BRAND: Vibramycin, Doryx; Oracea (40 mg for rosacea)
            > USES: CAP (atypical coverage), Lyme disease (early), MRSA skin infections, chlamydia (first-line), rosacea/acne, malaria prophylaxis, anthrax post-exposure.
            > KEY: Contraindicated in children < 8y and in pregnancy (tooth/bone effects).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Streptococcal pharyngitis (first-line alternative to penicillin); community-acquired bacterial meningitis",
                "B. Community-acquired pneumonia (atypical coverage), Lyme disease, chlamydia (first-line), MRSA skin infections, malaria prophylaxis",
                "C. Hospital-acquired pneumonia (MRSA bacteremia); reserved for penicillin-resistant gram-positive infections",
                "D. Tuberculosis (second-line agent); Helicobacter pylori eradication as monotherapy"
            ],
            correctAnswer: "B. Community-acquired pneumonia (atypical coverage), Lyme disease, chlamydia (first-line), MRSA skin infections, malaria prophylaxis",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.51,
            angle: .indication,
            baseConceptTitle: "DOXYCYCLINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DOXYCYCLINE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: 30S ribosomal subunit — blocks aminoacyl-tRNA from entering A site → inhibits protein synthesis.
            > SPECTRUM: Broad-spectrum bacteriostatic; covers gram+, gram-, atypicals (Mycoplasma, Chlamydia, Rickettsia).
            > CHELATION: Chelates divalent cations (Ca²⁺, Mg²⁺, Fe²⁺, Al³⁺) → explains absorption interaction with dairy/antacids.
            > ANTI-INFLAMMATORY: MMP inhibition at sub-antimicrobial doses (rosacea/acne mechanism).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Inhibits cell wall (peptidoglycan) synthesis by blocking transpeptidation — same mechanism as penicillin",
                "B. Inhibits DNA gyrase (topoisomerase II) preventing bacterial DNA replication — same class as fluoroquinolones",
                "C. Binds 30S ribosomal subunit blocking aminoacyl-tRNA entry — bacteriostatic; chelates divalent cations (explains dairy/antacid interaction)",
                "D. Disrupts bacterial cell membrane integrity by inserting into the lipid bilayer — same class as polymyxins"
            ],
            correctAnswer: "C. Binds 30S ribosomal subunit blocking aminoacyl-tRNA entry — bacteriostatic; chelates divalent cations (explains dairy/antacid interaction)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.51,
            angle: .mechanism,
            baseConceptTitle: "DOXYCYCLINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DOXYCYCLINE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > AGE: Contraindicated < 8 years — permanent tooth discoloration and bone growth inhibition.
            > PREGNANCY: Category D — same tooth/bone concerns for fetus.
            > PHOTOSENSITIVITY: HIGH RISK — counsel; broad-spectrum SPF sunscreen mandatory.
            > GI IRRITATION: Esophageal ulceration — take with full glass water; remain upright ≥ 30 min.
            > ABSORPTION: Antacids, calcium, iron, dairy → chelation → ↓ absorption; separate by 2–6 hours.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Doxycycline is safe in children of all ages; the tooth discoloration concern applies only to the older tetracyclines",
                "B. Doxycycline is contraindicated in children < 8y (permanent tooth discoloration/bone effects); high photosensitivity risk; take with full glass water upright",
                "C. The primary concern is severe nephrotoxicity; reduce dose by 50% for any degree of renal impairment",
                "D. Doxycycline causes agranulocytosis; weekly CBC is required during the first month of therapy"
            ],
            correctAnswer: "B. Doxycycline is contraindicated in children < 8y (permanent tooth discoloration/bone effects); high photosensitivity risk; take with full glass water upright",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.51,
            angle: .safety,
            baseConceptTitle: "DOXYCYCLINE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "DOXYCYCLINE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > STANDARD: 100 mg BID (200 mg/day); loading dose 200 mg on day 1 for most indications.
            > MALARIA PROPHYLAXIS: 100 mg once daily; start 1–2 days before travel; continue 4 weeks after.
            > CHLAMYDIA: 100 mg BID × 7 days.
            > LYME DISEASE: 100 mg BID × 14–21 days.
            > ROSACEA: Oracea 40 mg modified-release once daily (sub-antimicrobial dose).
            > RENAL: No dose adjustment needed (fecal elimination).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standard dose is 500 mg once daily for all indications; renal dose reduction required for CrCl < 50",
                "B. 100 mg BID for most infections; 100 mg once daily for malaria prophylaxis (start 1–2 days before travel, continue 4 weeks after); no renal adjustment needed",
                "C. 50 mg four times daily for all bacterial infections; 250 mg loading dose on day 1",
                "D. Doxycycline must be dosed by weight (4 mg/kg/day) in all adult patients regardless of body habitus"
            ],
            correctAnswer: "B. 100 mg BID for most infections; 100 mg once daily for malaria prophylaxis (start 1–2 days before travel, continue 4 weeks after); no renal adjustment needed",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.51,
            angle: .dosing,
            baseConceptTitle: "DOXYCYCLINE"
        ),

        // MARK: — TMP-SMX

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP-SMX / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Sulfonamide + Diaminopyrimidine combination antibiotic
            > BRAND: Bactrim DS (double strength), Septra
            > USES: UTI (uncomplicated), PCP prophylaxis/treatment (first-line), outpatient MRSA skin infections, toxoplasmosis prophylaxis (HIV), traveler's diarrhea.
            > DS TABLET: 160 mg TMP / 800 mg SMX — standard adult dose.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Community-acquired pneumonia (CAP) as first-line empiric therapy; hospital-acquired MRSA bacteremia",
                "B. UTI, PCP prophylaxis/treatment (first-line), MRSA skin infections, toxoplasmosis prophylaxis in HIV",
                "C. Streptococcal pharyngitis (first-line); Lyme disease in penicillin-allergic adults",
                "D. Clostridium difficile colitis (first-line); hospital-acquired gram-negative bacteremia"
            ],
            correctAnswer: "B. UTI, PCP prophylaxis/treatment (first-line), MRSA skin infections, toxoplasmosis prophylaxis in HIV",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.57,
            angle: .indication,
            baseConceptTitle: "TMP-SMX"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP-SMX / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > SEQUENTIAL BLOCKADE of folate synthesis → synergistic bactericidal:
            > SMX: Inhibits dihydropteroate synthase → blocks PABA → dihydropteroate conversion.
            > TMP: Inhibits dihydrofolate reductase (DHFR) → blocks dihydrofolate → tetrahydrofolate.
            > RESULT: Folate depletion → ↓ purines → DNA synthesis arrested.
            > RATIO: Fixed 1:5 TMP:SMX achieves synergistic tissue concentrations.
            > SELECTIVITY: Human DHFR is 50,000× less sensitive to TMP than bacterial DHFR.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Both TMP and SMX inhibit the same enzyme (dihydropteroate synthase) at different binding sites — additive, not synergistic",
                "B. TMP inhibits RNA polymerase; SMX disrupts cell membrane integrity — completely different targets",
                "C. Sequential blockade of two steps in folate synthesis: SMX inhibits dihydropteroate synthase; TMP inhibits dihydrofolate reductase — synergistic bactericidal",
                "D. TMP is a prodrug activated by SMX to form the active sulfonamide compound that inhibits DNA gyrase"
            ],
            correctAnswer: "C. Sequential blockade of two steps in folate synthesis: SMX inhibits dihydropteroate synthase; TMP inhibits dihydrofolate reductase — synergistic bactericidal",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.57,
            angle: .mechanism,
            baseConceptTitle: "TMP-SMX"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP-SMX / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > SULFA ALLERGY: Contraindicated; cross-sensitivity possible with furosemide, HCTZ, sulfonylureas.
            > HYPERKALEMIA: TMP blocks ENaC (amiloride-like) → K⁺ retention — risk with ACE inhibitors/ARBs.
            > SCr ELEVATION: TMP inhibits tubular creatinine secretion → ↑ SCr without true GFR decrease.
            > WARFARIN: CYP2C9 inhibition → ↑ INR significantly; monitor closely.
            > PREGNANCY: Avoid first trimester (neural tube) and at term (kernicterus risk).
            > G6PD: Hemolytic anemia risk.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. TMP-SMX has no significant drug interactions; the primary safety concern is mild GI upset only",
                "B. Sulfa allergy is a contraindication; TMP causes hyperkalemia (ENaC blockade) and raises serum creatinine; inhibits CYP2C9 → warfarin interaction",
                "C. The primary safety concern is ototoxicity; TMP-SMX is contraindicated with loop diuretics",
                "D. TMP-SMX causes severe hepatotoxicity in 10% of patients; LFTs must be monitored weekly"
            ],
            correctAnswer: "B. Sulfa allergy is a contraindication; TMP causes hyperkalemia (ENaC blockade) and raises serum creatinine; inhibits CYP2C9 → warfarin interaction",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.57,
            angle: .safety,
            baseConceptTitle: "TMP-SMX"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "TMP-SMX / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > DS TABLET: 160 mg TMP / 800 mg SMX (standard adult unit dose).
            > UNCOMPLICATED UTI: 1 DS BID × 3 days (women); × 7–14 days (complicated/men).
            > PCP PROPHYLAXIS: 1 SS tab once daily OR 1 DS tab Mon/Wed/Fri.
            > PCP TREATMENT: 15–20 mg/kg/day (TMP component) divided q6–8h × 21 days.
            > MRSA SKIN: 1–2 DS tabs BID × 5–10 days.
            > RENAL: CrCl 15–30 → reduce dose 50%; CrCl < 15 → avoid.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standard uncomplicated UTI dose: 1 DS tab once daily × 14 days; no renal adjustment needed",
                "B. 1 DS tab BID × 3 days for uncomplicated UTI in women; 1 SS tab once daily for PCP prophylaxis; avoid if CrCl < 15",
                "C. 2 DS tabs four times daily for all indications; dose is not adjusted based on renal function",
                "D. TMP-SMX comes only in SS (single strength) tablets; DS refers to the frequency, not the strength"
            ],
            correctAnswer: "B. 1 DS tab BID × 3 days for uncomplicated UTI in women; 1 SS tab once daily for PCP prophylaxis; avoid if CrCl < 15",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.57,
            angle: .dosing,
            baseConceptTitle: "TMP-SMX"
        ),

        // MARK: — PHENYTOIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Antiepileptic — Hydantoin
            > BRAND: Dilantin
            > USES: Tonic-clonic (grand mal) and complex partial seizures; status epilepticus (IV fosphenytoin preferred).
            > NOTE: Narrow therapeutic index drug — requires serum level monitoring.
            > FOSPHENYTOIN: IV/IM prodrug (converted to phenytoin); dosed in phenytoin equivalents (PE).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Absence (petit mal) seizures — first-line treatment for all seizure types including absence",
                "B. Tonic-clonic and complex partial seizures; IV fosphenytoin preferred for status epilepticus; narrow therapeutic index requiring level monitoring",
                "C. Infantile spasms (West syndrome) as first-line therapy; used as monotherapy in pediatric patients",
                "D. Febrile seizures in children — the only antiepileptic approved for this indication"
            ],
            correctAnswer: "B. Tonic-clonic and complex partial seizures; IV fosphenytoin preferred for status epilepticus; narrow therapeutic index requiring level monitoring",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.63,
            angle: .indication,
            baseConceptTitle: "PHENYTOIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: Voltage-gated Na⁺ channels — binds preferentially to INACTIVATED state.
            > EFFECT: Slows Na⁺ channel recovery → reduces repetitive high-frequency neuronal firing.
            > ZERO-ORDER KINETICS: Saturable metabolism (Michaelis-Menten) — small dose ↑ near saturation → large level ↑.
            > THERAPEUTIC RANGE: Total 10–20 mcg/mL; free 1–2 mcg/mL.
            > PROTEIN BINDING: 90% albumin-bound → measure FREE phenytoin in hypoalbuminemia/renal failure.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Phenytoin enhances GABA-A receptor activity, increasing inhibitory chloride conductance throughout the brain",
                "B. Phenytoin blocks voltage-gated Na⁺ channels in their inactivated state; has saturable (Michaelis-Menten) metabolism — zero-order kinetics at therapeutic doses",
                "C. Phenytoin inhibits T-type calcium channels in thalamic neurons — same mechanism as ethosuximide",
                "D. Phenytoin is a competitive NMDA receptor antagonist reducing excitatory glutamate neurotransmission"
            ],
            correctAnswer: "B. Phenytoin blocks voltage-gated Na⁺ channels in their inactivated state; has saturable (Michaelis-Menten) metabolism — zero-order kinetics at therapeutic doses",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.63,
            angle: .mechanism,
            baseConceptTitle: "PHENYTOIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TOXICITY LEVELS: Nystagmus > 20 mcg/mL; ataxia > 30 mcg/mL; mental status changes > 40 mcg/mL.
            > CHRONIC EFFECTS: Gingival hyperplasia; hirsutism; folate deficiency; osteomalacia; peripheral neuropathy.
            > CYP INDUCER: Strong CYP1A2/2C9/3A4 inducer → ↓ warfarin, OCPs, statins, many drugs.
            > IV: NS only (precipitates in D5W); max rate 50 mg/min; fosphenytoin preferred.
            > TERATOGEN: Category D; fetal hydantoin syndrome.
            > BRAND/GENERIC: NOT interchangeable (narrow TI).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. A phenytoin level of 32 mcg/mL — the expected finding is severe bone marrow suppression and pancytopenia",
                "B. Ataxia is expected at phenytoin levels > 30 mcg/mL; phenytoin is a strong CYP inducer; NOT interchangeable with generic (narrow TI)",
                "C. Phenytoin is safe in pregnancy; teratogenicity concerns apply only to valproic acid and carbamazepine",
                "D. Phenytoin IV can be given in D5W or NS with equal safety; the preferred rate is 100 mg/min"
            ],
            correctAnswer: "B. Ataxia is expected at phenytoin levels > 30 mcg/mL; phenytoin is a strong CYP inducer; NOT interchangeable with generic (narrow TI)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.63,
            angle: .safety,
            baseConceptTitle: "PHENYTOIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "PHENYTOIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > MAINTENANCE: 300–400 mg/day; individualized by serum levels.
            > LOADING DOSE: 15–20 mg/kg IV (fosphenytoin PE preferred); max rate 50 mg/min IV phenytoin.
            > TARGET: Total 10–20 mcg/mL; free 1–2 mcg/mL.
            > HYPOALBUMINEMIA CORRECTION: Corrected phenytoin = measured / (0.2 × albumin + 0.1).
            > EXAMPLE: Patient albumin 2.0 g/dL, measured level 10 mcg/mL → corrected = 10 / (0.2×2+0.1) = 10/0.5 = 20 mcg/mL.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Standard maintenance dose is 100 mg q8h; no dose correction needed for albumin levels",
                "B. Maintenance 300–400 mg/day individualized; corrected phenytoin = measured ÷ (0.2 × albumin + 0.1) in hypoalbuminemia",
                "C. Loading dose is always 500 mg IV regardless of weight; target range is 5–10 mcg/mL",
                "D. For a patient with albumin 3.0, measured level 15, corrected level = 15 × (4/3) = 20 mcg/mL (simple ratio)"
            ],
            correctAnswer: "B. Maintenance 300–400 mg/day individualized; corrected phenytoin = measured ÷ (0.2 × albumin + 0.1) in hypoalbuminemia",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.63,
            angle: .dosing,
            baseConceptTitle: "PHENYTOIN"
        ),

        // MARK: — LEVETIRACETAM

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVETIRACETAM / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Antiepileptic — Pyrrolidine derivative
            > BRAND: Keppra (oral/IV), Spritam (ODT)
            > FDA APPROVED: Adjunctive for partial-onset seizures; myoclonic seizures (JME); primary generalized tonic-clonic seizures.
            > IV FORM: Available; same dose as oral — 1:1 conversion.
            > NOTE: Unique mechanism (SV2A binding) — does not affect Na⁺/Ca²⁺ channels or GABA.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. First-line monotherapy for absence seizures in children; not indicated for tonic-clonic seizures",
                "B. Adjunctive therapy for partial-onset, myoclonic (JME), and primary generalized tonic-clonic seizures; IV form available with 1:1 oral conversion",
                "C. First-line IV treatment for status epilepticus; not indicated for outpatient seizure management",
                "D. Exclusively approved for infantile spasms; adult epilepsy use is off-label"
            ],
            correctAnswer: "B. Adjunctive therapy for partial-onset, myoclonic (JME), and primary generalized tonic-clonic seizures; IV form available with 1:1 oral conversion",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.69,
            angle: .indication,
            baseConceptTitle: "LEVETIRACETAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVETIRACETAM / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > UNIQUE TARGET: Binds synaptic vesicle protein 2A (SV2A) → modulates neurotransmitter release.
            > DISTINCT: Does NOT affect Na⁺ channels, Ca²⁺ channels, or GABA directly.
            > MINIMAL INTERACTIONS: Not significantly CYP metabolized → very few drug interactions.
            > RENAL ELIMINATION: ~66% excreted unchanged — dose adjustment required in renal impairment.
            > LINEAR PHARMACOKINETICS: Predictable levels; no saturable metabolism (unlike phenytoin).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Enhances GABA-A receptor activity like benzodiazepines — the two drugs have additive anticonvulsant effects via the same mechanism",
                "B. Blocks voltage-gated sodium channels in their inactivated state — same mechanism as phenytoin",
                "C. Binds synaptic vesicle protein 2A (SV2A) — unique mechanism; not CYP-metabolized; minimal drug interactions; linear pharmacokinetics",
                "D. Inhibits carbonic anhydrase enzyme — reduces intracellular bicarbonate and neuronal excitability"
            ],
            correctAnswer: "C. Binds synaptic vesicle protein 2A (SV2A) — unique mechanism; not CYP-metabolized; minimal drug interactions; linear pharmacokinetics",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.69,
            angle: .mechanism,
            baseConceptTitle: "LEVETIRACETAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVETIRACETAM / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BEHAVIORAL: 'Keppra Rage' — irritability, agitation, hostility, depression, psychosis (~15%); most significant adverse effect.
            > RENAL DOSING CRITICAL: Renally eliminated — accumulation and toxicity in renal impairment.
            > HEMATOLOGIC: Leukopenia, thrombocytopenia (rare; monitor CBC).
            > DISCONTINUATION: Taper to reduce seizure rebound risk.
            > ADVANTAGE: Minimal CYP interactions; fewer enzyme-induction concerns vs phenytoin/carbamazepine.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Levetiracetam commonly causes severe gingival hyperplasia and hirsutism — same cosmetic side effects as phenytoin",
                "B. Neuropsychiatric side effects ('Keppra Rage' — irritability, hostility, depression) in ~15% of patients; renal dose adjustment is critical",
                "C. Levetiracetam causes severe hepatotoxicity in 20% of patients; monthly LFT monitoring required",
                "D. The primary safety concern is severe QT prolongation; avoid with all class I and III antiarrhythmics"
            ],
            correctAnswer: "B. Neuropsychiatric side effects ('Keppra Rage' — irritability, hostility, depression) in ~15% of patients; renal dose adjustment is critical",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.69,
            angle: .safety,
            baseConceptTitle: "LEVETIRACETAM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "LEVETIRACETAM / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > STARTING DOSE: 500 mg BID; ↑ by 500 mg/dose every 2 weeks.
            > MAX: 1500 mg BID (3000 mg/day).
            > RENAL DOSING:
              · CrCl 50–80: max 1000 mg BID
              · CrCl 30–50: max 750 mg BID
              · CrCl < 30: max 500 mg BID
              · ESRD/dialysis: 500–1000 mg/day; supplement post-dialysis.
            > IV: 1:1 conversion from oral; infuse over 15 min.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. No renal adjustment needed regardless of CrCl; levetiracetam is hepatically metabolized and renally excreted as inactive metabolites only",
                "B. Start 500 mg BID; max 1500 mg BID; maximum dose for CrCl 30–50 mL/min is 750 mg BID",
                "C. Loading dose of 3000 mg IV required for all patients; then 1500 mg BID maintenance",
                "D. Start 250 mg once daily; increase weekly by 250 mg; maximum 500 mg/day regardless of renal function"
            ],
            correctAnswer: "B. Start 500 mg BID; max 1500 mg BID; maximum dose for CrCl 30–50 mL/min is 750 mg BID",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.69,
            angle: .dosing,
            baseConceptTitle: "LEVETIRACETAM"
        ),

        // MARK: — ROSUVASTATIN

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ROSUVASTATIN / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: HMG-CoA Reductase Inhibitor — HIGH INTENSITY statin
            > BRAND: Crestor
            > USES: Hypercholesterolemia; primary and secondary ASCVD prevention.
            > HIGH-INTENSITY: 20–40 mg reduces LDL > 50% (per ACC/AHA guidelines).
            > UNIQUE: Can be taken at any time of day; most statins recommend evening.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Rosuvastatin is a moderate-intensity statin; only atorvastatin 40–80 mg qualifies as high-intensity",
                "B. Rosuvastatin 20–40 mg is high-intensity statin therapy (>50% LDL reduction); used for primary and secondary ASCVD prevention",
                "C. Rosuvastatin is FDA-approved only for familial hypercholesterolemia; primary prevention is off-label",
                "D. Rosuvastatin must be combined with ezetimibe to achieve high-intensity statin therapy by ACC/AHA definition"
            ],
            correctAnswer: "B. Rosuvastatin 20–40 mg is high-intensity statin therapy (>50% LDL reduction); used for primary and secondary ASCVD prevention",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.74,
            angle: .indication,
            baseConceptTitle: "ROSUVASTATIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ROSUVASTATIN / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: Competitive inhibition of HMG-CoA reductase → ↓ hepatic cholesterol synthesis.
            > COMPENSATORY: ↑ hepatic LDL receptor expression → ↑ LDL clearance from plasma.
            > HYDROPHILIC: More hydrophilic than atorvastatin → primarily CYP2C9 (not CYP3A4) → fewer interactions.
            > LDL REDUCTION: 45–63% dose-dependent — most potent per mg among statins.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Rosuvastatin is strongly CYP3A4-dependent — major interactions with grapefruit, azole antifungals, and macrolide antibiotics",
                "B. Rosuvastatin is more hydrophilic and primarily CYP2C9-metabolized — fewer CYP3A4 interactions than atorvastatin; potent LDL reduction (45–63%)",
                "C. Rosuvastatin blocks cholesterol absorption in the intestine — same mechanism as ezetimibe",
                "D. Rosuvastatin inhibits bile acid reabsorption, causing fecal cholesterol loss — same class as cholestyramine"
            ],
            correctAnswer: "B. Rosuvastatin is more hydrophilic and primarily CYP2C9-metabolized — fewer CYP3A4 interactions than atorvastatin; potent LDL reduction (45–63%)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.74,
            angle: .mechanism,
            baseConceptTitle: "ROSUVASTATIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ROSUVASTATIN / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > MYOPATHY/RHABDOMYOLYSIS: Risk; ↑ with dose and interactions.
            > DOSE LIMITS: Cyclosporine → max 5 mg/day; gemfibrozil → avoid (max 10 mg); atazanavir/ritonavir → max 10 mg.
            > ASIAN PATIENTS: Higher plasma concentrations → start 5 mg/day.
            > PREGNANCY: CONTRAINDICATED — Category X (teratogen).
            > DIABETES RISK: Modest ↑ in new-onset diabetes (class effect of all statins).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Asian patients should start at 40 mg/day (higher dose needed due to faster metabolism in this population)",
                "B. Asian patients achieve higher rosuvastatin plasma concentrations — start at 5 mg/day; pregnancy is absolutely contraindicated (Category X)",
                "C. Rosuvastatin 80 mg/day is safe in Asian patients; the dose restriction applies only to simvastatin",
                "D. Rosuvastatin is the only statin safe in pregnancy; the Category X label applies only to atorvastatin and simvastatin"
            ],
            correctAnswer: "B. Asian patients achieve higher rosuvastatin plasma concentrations — start at 5 mg/day; pregnancy is absolutely contraindicated (Category X)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.74,
            angle: .safety,
            baseConceptTitle: "ROSUVASTATIN"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ROSUVASTATIN / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > STANDARD: 10–20 mg once daily.
            > HIGH-INTENSITY: 20–40 mg once daily.
            > MAX: 40 mg/day.
            > ASIAN PATIENTS: Start 5 mg/day.
            > RENAL (CrCl < 30): Start 5 mg/day; max 10 mg/day.
            > TIMING: Can be taken at ANY time of day (unlike simvastatin/lovastatin which are evening-only).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Rosuvastatin must be taken at bedtime; daytime dosing reduces efficacy by 40%",
                "B. Standard 10–20 mg/day; high-intensity 20–40 mg/day; max 40 mg; can be taken at any time of day; start 5 mg in Asian patients or CrCl < 30",
                "C. Maximum dose is 80 mg/day in high cardiovascular risk patients; lower doses are ineffective for secondary prevention",
                "D. Rosuvastatin requires BID dosing for high-intensity therapy; once daily dosing is appropriate only for maintenance"
            ],
            correctAnswer: "B. Standard 10–20 mg/day; high-intensity 20–40 mg/day; max 40 mg; can be taken at any time of day; start 5 mg in Asian patients or CrCl < 30",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.74,
            angle: .dosing,
            baseConceptTitle: "ROSUVASTATIN"
        ),

        // MARK: — SPIRONOLACTONE

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SPIRONOLACTONE / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Potassium-Sparing Diuretic / Aldosterone Antagonist
            > BRAND: Aldactone
            > USES: HFrEF (mortality reduction — RALES trial); primary hyperaldosteronism; cirrhosis-related ascites; resistant hypertension; female acne/hirsutism (anti-androgen off-label).
            > NOTE: Eplerenone is a more selective aldosterone antagonist with fewer anti-androgen effects.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. First-line diuretic for HFpEF (preserved ejection fraction); also IV treatment for acute decompensated heart failure",
                "B. HFrEF mortality reduction (RALES trial), primary hyperaldosteronism, cirrhosis/ascites, resistant hypertension, female acne/hirsutism (anti-androgen)",
                "C. Spironolactone is exclusively used for primary hyperaldosteronism; all other uses are investigational",
                "D. Fluid retention in nephrotic syndrome as first-line monotherapy; not indicated for heart failure"
            ],
            correctAnswer: "B. HFrEF mortality reduction (RALES trial), primary hyperaldosteronism, cirrhosis/ascites, resistant hypertension, female acne/hirsutism (anti-androgen)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.79,
            angle: .indication,
            baseConceptTitle: "SPIRONOLACTONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SPIRONOLACTONE / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: Competitive antagonist at mineralocorticoid (aldosterone) receptor in collecting duct.
            > RENAL EFFECT: Blocks aldosterone-mediated Na⁺ reabsorption and K⁺ excretion → diuresis with K⁺ RETENTION.
            > ANTI-ANDROGEN: Also blocks androgen receptors → treats female acne/hirsutism; causes gynecomastia in men.
            > ACTIVE METABOLITE: Canrenone (longer half-life than parent).
            > ONSET: Slow (2–3 days); not for immediate diuresis.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Spironolactone directly inhibits the Na-K-ATPase pump — same mechanism as cardiac glycosides",
                "B. Spironolactone blocks aldosterone at the mineralocorticoid receptor → K⁺-sparing diuresis; also blocks androgen receptors (anti-androgen effects)",
                "C. Spironolactone blocks ENaC sodium channels directly like amiloride, independent of aldosterone levels",
                "D. Spironolactone inhibits carbonic anhydrase in the proximal tubule — same mechanism as acetazolamide"
            ],
            correctAnswer: "B. Spironolactone blocks aldosterone at the mineralocorticoid receptor → K⁺-sparing diuresis; also blocks androgen receptors (anti-androgen effects)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.79,
            angle: .mechanism,
            baseConceptTitle: "SPIRONOLACTONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SPIRONOLACTONE / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > HYPERKALEMIA: Primary risk — critical with concurrent ACE inhibitor, ARB, or K supplements; monitor K⁺ and SCr regularly.
            > GYNECOMASTIA/BREAST TENDERNESS: In males (anti-androgen); menstrual irregularities in women.
            > RENAL: Avoid if CrCl < 30 mL/min (K⁺ accumulation).
            > EPLERENONE: More selective mineralocorticoid antagonist — fewer anti-androgen effects; preferred in men with HF.
            > PREGNANCY: Anti-androgen may feminize male fetus.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Hypokalemia is the primary concern with spironolactone; supplement potassium during therapy",
                "B. Hyperkalemia is the primary risk — critical with ACE inhibitors/ARBs; gynecomastia in men due to anti-androgen effect; avoid CrCl < 30",
                "C. Spironolactone is safe in renal failure; it actually protects the kidneys and can be used without dose adjustment",
                "D. QT prolongation is the primary concern; spironolactone blocks hERG potassium channels at therapeutic doses"
            ],
            correctAnswer: "B. Hyperkalemia is the primary risk — critical with ACE inhibitors/ARBs; gynecomastia in men due to anti-androgen effect; avoid CrCl < 30",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.79,
            angle: .safety,
            baseConceptTitle: "SPIRONOLACTONE"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "SPIRONOLACTONE / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > HEART FAILURE: Start 25 mg/day; target 25–50 mg/day (check K⁺ < 5.0 mEq/L, SCr < 2.5 mg/dL).
            > HYPERTENSION: 25–100 mg/day.
            > HYPERALDOSTERONISM: 100–400 mg/day preoperatively.
            > ASCITES (cirrhosis): 50–200 mg/day (often with furosemide in 10:4 ratio to maintain normokalemia).
            > TAKE WITH FOOD: Increases absorption ~30%.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. HF dose: start 100 mg/day; reduce to 25 mg/day if hyperkalemia develops",
                "B. HF: start 25 mg/day; ascites with cirrhosis use 50–200 mg/day with furosemide (10:4 ratio); take with food (↑ absorption 30%)",
                "C. Spironolactone 400 mg/day is the starting dose for all indications; titrate down based on K⁺ levels",
                "D. Spironolactone is dosed once weekly; daily dosing causes dose-dependent adrenal insufficiency"
            ],
            correctAnswer: "B. HF: start 25 mg/day; ascites with cirrhosis use 50–200 mg/day with furosemide (10:4 ratio); take with food (↑ absorption 30%)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.79,
            angle: .dosing,
            baseConceptTitle: "SPIRONOLACTONE"
        ),

        // MARK: — ZOLPIDEM

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Non-Benzodiazepine Sedative-Hypnotic ('Z-drug') — Schedule CIV
            > BRAND: Ambien (IR), Ambien CR (ER), Intermezzo (sublingual)
            > IR: Sleep-onset insomnia.
            > CR: Sleep onset AND sleep maintenance.
            > INTERMEZZO (sublingual): Middle-of-night awakening — ONLY if ≥ 4 hours of sleep time remain.
            > SHORT-TERM USE: Recommended ≤ 7–10 days.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Chronic insomnia requiring nightly use > 6 months; also approved for anxiety with insomnia comorbidity",
                "B. Zolpidem IR for sleep-onset insomnia; Ambien CR for sleep onset and maintenance; Intermezzo sublingual for middle-of-night awakening (≥4h sleep remaining)",
                "C. Zolpidem is FDA-approved only for sleep-onset insomnia; sleep maintenance and middle-of-night awakening are off-label uses",
                "D. Zolpidem is a Schedule CII drug; it requires the same prescribing rules as opioids including no refills"
            ],
            correctAnswer: "B. Zolpidem IR for sleep-onset insomnia; Ambien CR for sleep onset and maintenance; Intermezzo sublingual for middle-of-night awakening (≥4h sleep remaining)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.84,
            angle: .indication,
            baseConceptTitle: "ZOLPIDEM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > TARGET: GABA-A receptor positive allosteric modulator — preferentially binds omega-1 (BZ1) subunit.
            > SELECTIVITY: Omega-1 selectivity → predominantly sedative with less anxiolytic/muscle relaxant activity vs benzos.
            > NON-BENZODIAZEPINE: Different chemical structure; 'Z-drug' class.
            > HALF-LIFE: ~2.5 hours (IR); short to minimize next-day effects.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Zolpidem blocks histamine H1 receptors exclusively — purely antihistaminergic mechanism like diphenhydramine",
                "B. Zolpidem binds melatonin MT1/MT2 receptors to synchronize the circadian rhythm — same class as ramelteon",
                "C. Zolpidem is a GABA-A positive allosteric modulator preferentially binding the omega-1 subunit — predominantly sedative with less anxiolytic activity vs benzos",
                "D. Zolpidem is a benzodiazepine with identical mechanism to alprazolam and lorazepam"
            ],
            correctAnswer: "C. Zolpidem is a GABA-A positive allosteric modulator preferentially binding the omega-1 subunit — predominantly sedative with less anxiolytic activity vs benzos",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.84,
            angle: .mechanism,
            baseConceptTitle: "ZOLPIDEM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BLACK BOX: Complex sleep behaviors (sleepwalking, sleep-driving, sleep-eating) → potentially fatal; CONTRAINDICATED if prior episode.
            > SEX-BASED DOSING: Women eliminate zolpidem 45% more slowly → FDA lowered women's dose to 5 mg IR (men 10 mg).
            > NEXT-DAY IMPAIRMENT: Especially with Ambien CR; do NOT drive next morning.
            > ELDERLY: High fall/fracture/MVA risk — Beers Criteria.
            > CIV: Tolerance, dependence with prolonged use.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Zolpidem has the same dose for men and women; sex-based dosing is a misconception not supported by pharmacokinetic data",
                "B. FDA lowered women's zolpidem dose to 5 mg IR (men 10 mg) because women eliminate it 45% more slowly — next-morning impairment risk; Black Box warning for complex sleep behaviors",
                "C. The primary safety concern is QT prolongation; zolpidem should not be used with any antidepressant",
                "D. Zolpidem is completely safe for long-term nightly use; tolerance does not develop with Z-drugs unlike benzodiazepines"
            ],
            correctAnswer: "B. FDA lowered women's zolpidem dose to 5 mg IR (men 10 mg) because women eliminate it 45% more slowly — next-morning impairment risk; Black Box warning for complex sleep behaviors",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.84,
            angle: .safety,
            baseConceptTitle: "ZOLPIDEM"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "ZOLPIDEM / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > IR: Women 5 mg; men 5–10 mg at bedtime immediately before sleep.
            > AMBIEN CR: Women 6.25 mg; men 6.25–12.5 mg.
            > INTERMEZZO: Women 1.75 mg; men 3.5 mg (only if ≥ 4 hours sleep remain).
            > ELDERLY: 5 mg IR or 6.25 mg CR regardless of sex (start lowest dose).
            > DURATION: Intended for short-term use (7–10 nights); reassess if > 2 weeks.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Zolpidem 10 mg is the standard dose for all adults regardless of sex; elderly patients use 7.5 mg",
                "B. Women: 5 mg IR or 6.25 mg CR; men: 5–10 mg IR or 6.25–12.5 mg CR; elderly: 5 mg IR or 6.25 mg CR regardless of sex",
                "C. Intermezzo 10 mg sublingual can be taken at any time during the night; no minimum sleep time requirement",
                "D. Zolpidem CR 12.5 mg is the recommended starting dose for elderly patients with maintenance insomnia"
            ],
            correctAnswer: "B. Women: 5 mg IR or 6.25 mg CR; men: 5–10 mg IR or 6.25–12.5 mg CR; elderly: 5 mg IR or 6.25 mg CR regardless of sex",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.84,
            angle: .dosing,
            baseConceptTitle: "ZOLPIDEM"
        ),

        // MARK: — CARVEDILOL

        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CARVEDILOL / INDICATION",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > CLASS: Non-selective Beta-blocker + Alpha-1 blocker
            > BRAND: Coreg (IR), Coreg CR (ER)
            > FDA APPROVED: HFrEF mortality reduction (one of only 3 beta-blockers); post-MI LV dysfunction; hypertension.
            > KEY TRIALS: COPERNICUS (severe HF), CAPRICORN (post-MI LV dysfunction).
            > INITIATE: Only in STABLE, euvolemic HF patients (not in acute decompensation).
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Carvedilol is appropriate to initiate in acute decompensated HF; the vasodilatory alpha-1 effect reduces pulmonary edema",
                "B. HFrEF mortality reduction, post-MI LV dysfunction, and hypertension; initiate only in stable euvolemic HF patients",
                "C. Carvedilol is a selective beta-1 blocker approved exclusively for hypertension; HF use is off-label",
                "D. Carvedilol is FDA-approved for HFpEF (preserved EF); it is not indicated for reduced EF (HFrEF)"
            ],
            correctAnswer: "B. HFrEF mortality reduction, post-MI LV dysfunction, and hypertension; initiate only in stable euvolemic HF patients",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.83,
            yOffset: 0.89,
            angle: .indication,
            baseConceptTitle: "CARVEDILOL"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CARVEDILOL / MECHANISM",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > BETA-1: ↓ HR, ↓ contractility → ↓ cardiac oxygen demand.
            > BETA-2 (non-selective): Can cause bronchospasm — avoid in asthma/severe COPD.
            > ALPHA-1: Vasodilation → ↓ afterload (beneficial in HF; causes orthostatic hypotension).
            > NET HF BENEFIT: ↓ preload, ↓ afterload, ↓ HR → improved cardiac remodeling.
            > METABOLISM: CYP2D6 (major) + CYP2C9 → poor metabolizers have higher drug exposure.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Carvedilol is a selective beta-1 blocker like metoprolol — safe in asthma; no vasodilatory properties",
                "B. Carvedilol is non-selective (beta-1 + beta-2) plus alpha-1 blocker — triple blockade reduces HR, contractility, AND afterload; bronchospasm risk (non-selective)",
                "C. Carvedilol's main mechanism is aldosterone antagonism — same class as spironolactone with additional beta-blocking properties",
                "D. Carvedilol is a pure alpha-1 blocker similar to tamsulosin; beta-blockade is an off-target side effect"
            ],
            correctAnswer: "B. Carvedilol is non-selective (beta-1 + beta-2) plus alpha-1 blocker — triple blockade reduces HR, contractility, AND afterload; bronchospasm risk (non-selective)",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.88,
            yOffset: 0.89,
            angle: .mechanism,
            baseConceptTitle: "CARVEDILOL"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CARVEDILOL / SAFETY",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > ORTHOSTATIC HYPOTENSION: Alpha-1 blockade → vasodilation → dizziness on standing; worst at initiation; take WITH FOOD to reduce.
            > DECOMPENSATED HF: Do NOT initiate; may worsen acutely.
            > BRONCHOSPASM: Non-selective beta-2 → CONTRAINDICATED in asthma; caution in COPD.
            > MASKING: Blocks tachycardia sign of hypoglycemia (beta-2) — caution in diabetics.
            > CYP2D6: Fluoxetine, paroxetine → ↑ carvedilol levels.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. Carvedilol is safe in asthma — the alpha-1 blockade counteracts the bronchospasm from beta-2 blockade",
                "B. Orthostatic hypotension from alpha-1 blockade (take with food); contraindicated in asthma (non-selective beta-2 → bronchospasm); do not initiate in decompensated HF",
                "C. The primary safety concern is severe QT prolongation; avoid with all antiarrhythmics and antibiotics",
                "D. Carvedilol causes hyperkalemia through aldosterone receptor blockade; monitor K⁺ weekly during the first month"
            ],
            correctAnswer: "B. Orthostatic hypotension from alpha-1 blockade (take with food); contraindicated in asthma (non-selective beta-2 → bronchospasm); do not initiate in decompensated HF",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.93,
            yOffset: 0.89,
            angle: .safety,
            baseConceptTitle: "CARVEDILOL"
        ),
        DataNode(
            id: UUID(),
            domain: .medications,
            nodeTitle: "CARVEDILOL / DOSING",
            loreText: """
            > SECTOR-01 // PHARMACOLOGY
            > HF START: 3.125 mg BID × 2 weeks; double if tolerated (6.25 → 12.5 → 25 mg BID).
            > HF TARGET: 25 mg BID (if ≤ 85 kg); 50 mg BID (if > 85 kg).
            > HYPERTENSION: 6.25–25 mg BID.
            > TAKE WITH FOOD: ↓ orthostatic hypotension risk (slows absorption).
            > COREG CR: Once daily; Coreg CR 20 mg = Coreg (IR) 12.5 mg BID.
            """,
            challengeType: .multipleChoice,
            options: [
                "A. HF starting dose is 25 mg BID; titrate up to 50 mg BID over 4 weeks for all patients",
                "B. HF starting dose 3.125 mg BID; double every 2 weeks as tolerated; target 25 mg BID (≤85 kg) or 50 mg BID (>85 kg); take with food",
                "C. Carvedilol is dosed once daily for heart failure; BID dosing causes excessive beta-blockade",
                "D. Loading dose of 25 mg, then 3.125 mg BID maintenance — start high to immediately suppress cardiac remodeling"
            ],
            correctAnswer: "B. HF starting dose 3.125 mg BID; double every 2 weeks as tolerated; target 25 mg BID (≤85 kg) or 50 mg BID (>85 kg); take with food",
            isUnlocked: false,
            isCompleted: false,
            xOffset: 0.97,
            yOffset: 0.89,
            angle: .dosing,
            baseConceptTitle: "CARVEDILOL"
        ),

    ]}
}
