import Foundation

// Phase 13 — D1h Interactions + Counseling
// Risperidone, Semaglutide, Allopurinol, Clindamycin (8 nodes)

let multiAngleNodes_D1k: [DataNode] = [

    // RISPERIDONE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / INTERACTIONS",
        loreText: "Risperidone is metabolized by CYP2D6 and CYP3A4. CYP2D6 inhibitors (fluoxetine, paroxetine) raise levels. Additive QTc prolongation with antiarrhythmics and other antipsychotics. CNS depressants potentiate sedation.",
        challengeType: .multipleChoice,
        options: [
            "A. Fluoxetine inhibits CYP2D6, increasing risperidone plasma levels",
            "B. Risperidone is primarily metabolized by CYP1A2",
            "C. Risperidone has no clinically significant drug interactions",
            "D. Antacids significantly reduce risperidone absorption"
        ],
        correctAnswer: "A. Fluoxetine inhibits CYP2D6, increasing risperidone plasma levels",
        xOffset: 0.82,
        yOffset: 0.100,
        baseConceptTitle: "Risperidone"
    ),

    // RISPERIDONE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "RISPERIDONE / COUNSELING",
        loreText: "Counsel patients: may cause orthostatic hypotension (rise slowly), weight gain, sedation, and EPS. Report involuntary movements (tardive dyskinesia). Avoid alcohol. Take at the same time daily. Do not stop abruptly.",
        challengeType: .multipleChoice,
        options: [
            "A. Rise slowly from sitting/lying due to orthostatic hypotension risk",
            "B. Risperidone must be taken on an empty stomach only",
            "C. Risperidone can be stopped abruptly without tapering",
            "D. Weight loss is a common expected side effect"
        ],
        correctAnswer: "A. Rise slowly from sitting/lying due to orthostatic hypotension risk",
        xOffset: 0.87,
        yOffset: 0.100,
        baseConceptTitle: "Risperidone"
    ),

    // SEMAGLUTIDE — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / INTERACTIONS",
        loreText: "Semaglutide slows gastric emptying, reducing absorption rate of oral medications taken concurrently. Combined with insulin or sulfonylureas, hypoglycemia risk increases substantially — dose adjustment often required.",
        challengeType: .multipleChoice,
        options: [
            "A. Semaglutide slows gastric emptying, delaying absorption of oral drugs",
            "B. Semaglutide is a strong CYP3A4 inhibitor",
            "C. Semaglutide has no clinically significant interaction with insulin",
            "D. Semaglutide accelerates gastric emptying, increasing drug absorption"
        ],
        correctAnswer: "A. Semaglutide slows gastric emptying, delaying absorption of oral drugs",
        xOffset: 0.82,
        yOffset: 0.130,
        baseConceptTitle: "Semaglutide"
    ),

    // SEMAGLUTIDE — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "SEMAGLUTIDE / COUNSELING",
        loreText: "Inject subcutaneously once weekly on the same day each week. GI side effects (nausea, vomiting, diarrhea) are common early and usually improve. Report severe abdominal pain (pancreatitis). Contraindicated in personal/family history of medullary thyroid carcinoma.",
        challengeType: .multipleChoice,
        options: [
            "A. Report severe abdominal pain immediately — may indicate pancreatitis",
            "B. Semaglutide is injected daily for optimal glucose control",
            "C. GI side effects are permanent and do not improve over time",
            "D. Semaglutide is safe with a personal history of medullary thyroid cancer"
        ],
        correctAnswer: "A. Report severe abdominal pain immediately — may indicate pancreatitis",
        xOffset: 0.87,
        yOffset: 0.130,
        baseConceptTitle: "Semaglutide"
    ),

    // ALLOPURINOL — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / INTERACTIONS",
        loreText: "Allopurinol inhibits xanthine oxidase, which also metabolizes azathioprine and 6-mercaptopurine — levels increase dramatically requiring 75% dose reduction. Potentiates warfarin. Ampicillin/amoxicillin combination increases rash incidence significantly.",
        challengeType: .multipleChoice,
        options: [
            "A. Allopurinol inhibits azathioprine metabolism, requiring a 75% dose reduction",
            "B. Allopurinol has no interactions with warfarin",
            "C. Allopurinol accelerates azathioprine clearance",
            "D. Allopurinol and ampicillin should always be combined"
        ],
        correctAnswer: "A. Allopurinol inhibits azathioprine metabolism, requiring a 75% dose reduction",
        xOffset: 0.82,
        yOffset: 0.160,
        baseConceptTitle: "Allopurinol"
    ),

    // ALLOPURINOL — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "ALLOPURINOL / COUNSELING",
        loreText: "Take with food and drink at least 2L of fluid daily to prevent kidney stones. Gout flares may worsen initially — colchicine or NSAID prophylaxis is used. Report any rash immediately (SJS/DRESS risk; HLA-B*5801 carriers at highest risk). Full effect takes weeks to months.",
        challengeType: .multipleChoice,
        options: [
            "A. Drink plenty of fluids and report any rash immediately due to SJS/DRESS risk",
            "B. Allopurinol immediately relieves acute gout attacks",
            "C. No extra fluid intake is necessary with allopurinol",
            "D. Skin rash is minor and does not need to be reported"
        ],
        correctAnswer: "A. Drink plenty of fluids and report any rash immediately due to SJS/DRESS risk",
        xOffset: 0.87,
        yOffset: 0.160,
        baseConceptTitle: "Allopurinol"
    ),

    // CLINDAMYCIN — Interactions
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / INTERACTIONS",
        loreText: "Clindamycin enhances neuromuscular blockade of nondepolarizing blockers. Antagonism occurs with erythromycin (both compete for the 50S ribosomal binding site). Clindamycin increases INR with warfarin by altering gut flora.",
        challengeType: .multipleChoice,
        options: [
            "A. Clindamycin and erythromycin are antagonistic — they compete for the same ribosomal site",
            "B. Clindamycin and erythromycin are synergistic antibacterials",
            "C. Clindamycin has no interaction with warfarin",
            "D. Clindamycin reduces INR in patients on warfarin"
        ],
        correctAnswer: "A. Clindamycin and erythromycin are antagonistic — they compete for the same ribosomal site",
        xOffset: 0.82,
        yOffset: 0.190,
        baseConceptTitle: "Clindamycin"
    ),

    // CLINDAMYCIN — Counseling
    DataNode(
        id: UUID(),
        domain: .medications,
        nodeTitle: "CLINDAMYCIN / COUNSELING",
        loreText: "Complete the full course even if feeling better. Report watery or bloody diarrhea immediately — C. difficile colitis risk persists even after completion. Take with food to reduce GI upset. Topical clindamycin for acne does not cause systemic C. diff.",
        challengeType: .multipleChoice,
        options: [
            "A. Report watery/bloody diarrhea immediately due to C. difficile colitis risk",
            "B. Stop clindamycin as soon as symptoms improve",
            "C. C. difficile is not a concern with clindamycin use",
            "D. Clindamycin must be taken on an empty stomach for best absorption"
        ],
        correctAnswer: "A. Report watery/bloody diarrhea immediately due to C. difficile colitis risk",
        xOffset: 0.87,
        yOffset: 0.190,
        baseConceptTitle: "Clindamycin"
    ),
]
