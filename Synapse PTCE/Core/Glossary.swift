//
//  Glossary.swift
//  Synapse PTCE
//
//  Comprehensive PTCE terminology reference.
//  Covers every term a pharmacy tech needs to master on the path to CPhT:
//  drug classes, mechanisms, law/regulatory, clinical states, lab values,
//  adverse effects, sig codes, compounding, safety, calculations, and billing.
//
//  Glossary.matches(in:) scans a node's combined text and returns matching terms.
//

import Foundation
import SwiftUI

// MARK: - Glossary

struct Glossary {

    static let terms: [String: String] = [

        // ═══════════════════════════════════════════════════════════════════
        // PHARMACY LAW & REGULATORY
        // ═══════════════════════════════════════════════════════════════════

        "DEA": "Drug Enforcement Administration — the federal agency that enforces the Controlled Substances Act and regulates the manufacture, distribution, and dispensing of controlled substances.",
        "FDA": "Food and Drug Administration — regulates the safety, efficacy, and labeling of drugs, biologics, and medical devices in the United States.",
        "21 CFR": "Title 21 of the Code of Federal Regulations — the section of federal law that governs food, drugs, and controlled substances. DEA regulations are found in 21 CFR Parts 1300–1321.",
        "Schedule I": "Controlled substances with no accepted medical use and high abuse potential (e.g., heroin, LSD, psilocybin, marijuana federally). Cannot be prescribed. Research requires special DEA registration.",
        "Schedule II": "Highest controlled substance schedule with accepted medical use (e.g., oxycodone, fentanyl, amphetamine, methylphenidate). Requires written/electronic Rx; NO refills permitted.",
        "Schedule III": "Controlled substances with moderate abuse potential and accepted medical use (e.g., testosterone, buprenorphine/naloxone). Up to 5 refills within 6 months.",
        "Schedule IV": "Lower abuse potential controlled substances with accepted medical use (e.g., benzodiazepines, zolpidem, tramadol). Up to 5 refills within 6 months.",
        "Schedule V": "Lowest controlled substance schedule (e.g., cough syrups with low-dose codeine, pregabalin). Up to 5 refills within 6 months. Some CV products may be dispensed OTC in certain states with logbook.",
        "EPCS": "Electronic Prescribing for Controlled Substances — DEA-compliant electronic transmission of Schedule II–V prescriptions. Requires two-factor authentication by the prescriber. Legal alternative to handwritten Rx.",
        "DEA Form 222": "The official two-part paper order form required to order Schedule I and II controlled substances from a supplier or manufacturer. Must be signed by the registrant.",
        "DEA Form 106": "Report of Theft or Significant Loss of Controlled Substances — must be filed with the DEA when a reportable loss occurs.",
        "DEA number": "A unique alphanumeric identifier (format: 2 letters + 7 digits, with a checksum) assigned by the DEA to practitioners authorized to prescribe controlled substances. Pharmacists must verify this on every CII–CV Rx.",
        "biennial inventory": "DEA requirement to conduct a complete physical count of all controlled substances on hand every two years. Must be kept on file for at least 2 years.",
        "perpetual inventory": "A real-time, ongoing record of Schedule II drug quantities in stock — updated after every receipt and every dispensing. Required by most states.",
        "partial fill": "Dispensing less than the full quantity prescribed for a Schedule II drug. Allowed for Schedule II only for LTCF patients, terminally ill patients, or when full supply is unavailable.",
        "LTCF": "Long-Term Care Facility — includes nursing homes and skilled nursing facilities. Schedule II prescriptions for LTCF residents may be partially filled; each partial fill must be noted on the prescription.",
        "emergency dispensing": "Oral authorization by a prescriber to dispense a Schedule II in a genuine emergency. The quantity dispensed must be limited to the emergency period; a written Rx must be provided within 7 days.",
        "HIPAA": "Health Insurance Portability and Accountability Act — federal law protecting the privacy (Privacy Rule) and security (Security Rule) of protected health information (PHI). Minimum necessary standard applies.",
        "PHI": "Protected Health Information — any individually identifiable health information held or transmitted by a covered entity. Includes name, DOB, diagnosis, prescription data, and more. Protected under HIPAA.",
        "OBRA-90": "Omnibus Budget Reconciliation Act of 1990 — requires pharmacists to offer prospective drug therapy review and counseling to Medicaid patients. Drove nationwide adoption of pharmacist counseling standards.",
        "NPI": "National Provider Identifier — a unique 10-digit number assigned to every licensed healthcare provider (prescribers, pharmacies, pharmacists) under HIPAA. Required on all insurance claims.",
        "NDC": "National Drug Code — an 11-digit number uniquely identifying a drug by labeler (manufacturer), product, and package size. Required on all prescription labels and insurance claims.",
        "Durham-Humphrey Amendment": "1951 amendment to the FDCA that established the distinction between prescription (legend) drugs and over-the-counter (OTC) drugs. Created the 'Rx only' designation.",
        "legend drug": "Any drug that may only be dispensed pursuant to a valid prescription order. Identified by the statement 'Rx only' on the label. All controlled substances are legend drugs.",
        "Kefauver-Harris Amendment": "1962 amendment to the FDCA that required manufacturers to prove drug efficacy (in addition to safety) before FDA approval. Passed in response to the thalidomide tragedy.",
        "PPPA": "Poison Prevention Packaging Act — requires child-resistant packaging for most prescription drugs and certain OTC products. Patients may request non-child-resistant packaging in writing.",
        "CMEA": "Combat Methamphetamine Epidemic Act of 2005 — regulates sales of pseudoephedrine and ephedrine products (precursors to methamphetamine). Requires placement behind the counter, ID verification, and purchase logbooks. Daily limit: 3.6 g; monthly limit: 9 g.",
        "pseudoephedrine": "A nasal decongestant (found in Sudafed) that is also a precursor to methamphetamine. Regulated under the CMEA — must be kept behind the pharmacy counter; purchases are logged and quantity-limited.",
        "REMS": "Risk Evaluation and Mitigation Strategy — an FDA-required drug safety program for medications with serious risks. May require patient enrollment, prescriber certification, pharmacy certification, or restricted distribution (e.g., isotretinoin/iPLEDGE, clozapine, thalidomide).",
        "DSCSA": "Drug Supply Chain Security Act — requires electronic track-and-trace of prescription drug products through the entire supply chain to prevent counterfeiting, diversion, and contamination. Full interoperability required by November 2025.",
        "drug recall": "The removal of a drug product from the market due to a safety issue, defect, or regulatory violation.",
        "Class I recall": "Most serious recall — there is a reasonable probability the product will cause serious adverse health consequences or death (e.g., contamination with a pathogen or the wrong drug).",
        "Class II recall": "Recall for products that may cause temporary or reversible adverse health consequences, or where the probability of serious harm is remote.",
        "Class III recall": "Recall for products that are unlikely to cause adverse health consequences but violate FDA regulations (e.g., labeling errors, minor quality issues).",
        "MedWatch": "The FDA Safety Information and Adverse Event Reporting Program — healthcare providers and consumers voluntarily report serious adverse events, product quality problems, and medication errors.",
        "NDA": "New Drug Application — the formal submission to the FDA requesting approval to market a new drug in the United States. Includes clinical trial data, manufacturing information, and labeling.",
        "ANDA": "Abbreviated New Drug Application — the application for FDA approval of a generic drug. Must demonstrate bioequivalence to the reference listed drug (RLD). Does not require full clinical trial data.",
        "BLA": "Biologics License Application — the application to FDA for approval of a biological product (e.g., monoclonal antibodies, vaccines). Biologics are regulated separately from small-molecule drugs.",
        "IND": "Investigational New Drug application — a request to the FDA for authorization to administer an unapproved drug to humans in clinical trials before an NDA is submitted.",
        "orphan drug": "A drug developed to treat a rare disease affecting fewer than 200,000 people in the United States. Eligible for 7-year market exclusivity and tax credits under the Orphan Drug Act of 1983.",
        "Orange Book": "FDA publication listing approved drug products and their therapeutic equivalence ratings. 'AB-rated' generics have been determined to be bioequivalent and therapeutically interchangeable with the brand.",
        "Purple Book": "FDA publication listing licensed biological products and biosimilars. Identifies which biosimilars have been designated as 'interchangeable' and may be substituted without prescriber authorization.",
        "biosimilar": "A biological product that is highly similar to an FDA-approved reference biologic with no clinically meaningful differences in safety, purity, or potency. A step toward generic equivalence for biologics.",
        "interchangeable biosimilar": "A biosimilar designated by the FDA as meeting a higher standard of similarity — pharmacists may substitute it for the reference biologic without contacting the prescriber (state laws vary).",
        "DAW": "Dispense As Written (DAW-1) — a prescriber's instruction that the brand-name drug must be dispensed; generic substitution is not permitted. DAW codes 0–9 are used in insurance billing to indicate substitution status.",
        "therapeutic equivalence": "FDA determination (AB rating in Orange Book) that two drug products are pharmaceutically equivalent and bioequivalent, meaning they can be expected to have the same clinical effect.",
        "formulary": "A health plan's list of covered drugs, organized by tier. Tier 1 = generic (lowest copay); Tier 2 = preferred brand; Tier 3 = non-preferred brand; Tier 4+ = specialty drugs (highest copay).",
        "prior authorization": "An insurance requirement that the prescriber must obtain plan approval before a specific drug will be covered. Used to ensure appropriate use of high-cost or high-risk medications.",
        "step therapy": "An insurance requirement that a patient must first try a less costly or preferred drug before the plan will cover a more expensive alternative.",
        "340B program": "Federal program (Section 340B of the Public Health Service Act) that requires drug manufacturers to provide outpatient drugs at significantly reduced prices to qualifying healthcare organizations that serve low-income patients.",
        "PBM": "Pharmacy Benefit Manager — a third-party company that manages prescription drug benefits on behalf of health insurers, employers, and government programs. Negotiates drug prices, manages formularies, and processes claims.",
        "Medicare Part D": "The voluntary outpatient prescription drug benefit under Medicare. Beneficiaries pay premiums, deductibles, and copays. Coverage gap ('donut hole') has been substantially reduced by the Inflation Reduction Act.",
        "Medicare Part B": "Covers medically necessary outpatient services including some drugs administered in a physician's office or outpatient setting (e.g., chemotherapy, biologics, DME). Different from Part D (self-administered drugs).",
        "Medicaid": "A joint federal-state program providing health coverage to low-income individuals. Pharmacy benefits are a mandatory service. States have significant flexibility in managing their Medicaid formularies.",
        "third-party claim": "A prescription billing transaction submitted to an insurance plan (third party) rather than paid directly by the patient. Requires BIN, PCN, group number, and member ID.",
        "BIN": "Bank Identification Number — a 6-digit number on insurance cards that routes the electronic prescription claim to the correct payer. Required for all third-party pharmacy billing.",
        "PCN": "Processor Control Number — an identifier used alongside the BIN to route claims within large PBM systems that process claims for multiple plans.",
        "DIR fee": "Direct and Indirect Remuneration fee — a retroactive fee charged to pharmacies by PBMs after a claim is paid, often based on performance metrics. Can significantly reduce pharmacy reimbursement.",
        "AWP": "Average Wholesale Price — a published benchmark for drug pricing used in reimbursement calculations. Does NOT reflect actual purchase price; often described as the 'sticker price' for drugs.",

        // ═══════════════════════════════════════════════════════════════════
        // DRUG CLASSES & MECHANISMS
        // ═══════════════════════════════════════════════════════════════════

        "ACE inhibitor": "Angiotensin-Converting Enzyme inhibitor — blocks conversion of angiotensin I → angiotensin II, causing vasodilation and lower blood pressure (e.g., lisinopril, enalapril, ramipril). Side effect: dry cough from bradykinin accumulation. Names end in -pril.",
        "ARB": "Angiotensin II Receptor Blocker — directly blocks AT1 receptors, lowering blood pressure without the cough (e.g., losartan, valsartan, olmesartan). Both ACE inhibitors and ARBs are contraindicated in pregnancy. Names end in -sartan.",
        "RAAS": "Renin-Angiotensin-Aldosterone System — a hormonal cascade that regulates blood pressure and fluid balance. Key target for antihypertensives: ACE inhibitors, ARBs, and aldosterone antagonists all act on this system.",
        "bradykinin": "A peptide that causes vasodilation, inflammation, and pain. ACE inhibitors block the enzyme that breaks down bradykinin, causing it to accumulate — this is the direct cause of the ACE inhibitor dry cough and angioedema.",
        "beta blocker": "Blocks beta-adrenergic receptors (β1 = heart, β2 = lungs/vessels). Reduces heart rate and blood pressure (e.g., metoprolol, atenolol, carvedilol). Names end in -olol. Avoid abrupt discontinuation — rebound angina or hypertension risk.",
        "calcium channel blocker": "Blocks voltage-gated calcium channels in cardiac and vascular smooth muscle. Dihydropyridines (amlodipine, nifedipine) affect vessels > heart; non-dihydropyridines (diltiazem, verapamil) affect heart > vessels.",
        "statin": "HMG-CoA reductase inhibitor — blocks the rate-limiting step of hepatic cholesterol synthesis, primarily lowering LDL (e.g., atorvastatin, rosuvastatin, simvastatin). Names end in -statin. Key side effects: myopathy, rhabdomyolysis (rare).",
        "fibrate": "Lipid-lowering drug that primarily lowers triglycerides and raises HDL (e.g., fenofibrate, gemfibrozil). Combined use with statins increases rhabdomyolysis risk, especially gemfibrozil + statin.",
        "bile acid sequestrant": "Resin that binds bile acids in the gut, interrupting enterohepatic circulation and forcing the liver to use cholesterol to make new bile acids, lowering LDL (e.g., cholestyramine, colesevelam). Can impair absorption of other drugs — take other drugs 1 hour before or 4 hours after.",
        "PCSK9 inhibitor": "Monoclonal antibody that blocks PCSK9, a protein that degrades LDL receptors. Dramatically lowers LDL in patients intolerant to statins or with familial hypercholesterolemia (e.g., evolocumab/Repatha, alirocumab/Praluent). Injectable, given every 2–4 weeks.",
        "SSRI": "Selective Serotonin Reuptake Inhibitor — antidepressant that blocks the reuptake of serotonin into the presynaptic neuron, increasing serotonin levels in the synapse (e.g., fluoxetine, sertraline, escitalopram). First-line for depression, anxiety, OCD, PTSD.",
        "SNRI": "Serotonin-Norepinephrine Reuptake Inhibitor — blocks reuptake of both serotonin and norepinephrine (e.g., venlafaxine, duloxetine, desvenlafaxine). Used for depression, anxiety, and neuropathic pain.",
        "TCA": "Tricyclic Antidepressant — older class of antidepressants that block reuptake of serotonin and norepinephrine but also block muscarinic, histamine, and alpha-1 receptors (e.g., amitriptyline, nortriptyline, imipramine). Significant anticholinergic side effects and cardiac toxicity in overdose.",
        "MAOI": "Monoamine Oxidase Inhibitor — inhibits MAO enzyme that breaks down serotonin, norepinephrine, and dopamine (e.g., phenelzine, tranylcypromine). Requires tyramine-free diet (no aged cheese, cured meats, wine) to prevent hypertensive crisis. Lethal interactions with serotonergic drugs.",
        "mood stabilizer": "Drug used to treat bipolar disorder by stabilizing mood cycling (e.g., lithium, valproic acid, carbamazepine, lamotrigine). Lithium has a very narrow therapeutic index; serum levels must be monitored.",
        "atypical antidepressant": "Non-SSRI/SNRI/TCA antidepressant with unique mechanisms. Examples: bupropion (NRI + dopamine), mirtazapine (alpha-2 antagonist + H1 blocker), trazodone (SARI, used mainly for insomnia).",
        "NSAID": "Nonsteroidal Anti-Inflammatory Drug — inhibits COX-1 and/or COX-2 enzymes, reducing prostaglandin synthesis and thereby pain, fever, and inflammation (e.g., ibuprofen, naproxen, ketorolac). Risks: GI bleeding, peptic ulcers, renal impairment, cardiovascular events, fluid retention.",
        "COX-2 inhibitor": "Selectively inhibits COX-2 (inflammation) while sparing COX-1 (GI protection), giving fewer GI side effects than non-selective NSAIDs. Celecoxib (Celebrex) is the only one available in the U.S. Still carries cardiovascular risks.",
        "acetaminophen": "Analgesic and antipyretic with unknown exact mechanism. Does NOT have anti-inflammatory properties. Maximum daily dose: 4 g in healthy adults; 2 g/day in liver disease or chronic alcohol use. Overdose = leading cause of acute liver failure in the U.S. (antidote: N-acetylcysteine).",
        "opioid": "Narcotic analgesic that activates mu-opioid receptors, reducing pain perception (e.g., morphine, oxycodone, hydrocodone, fentanyl). Schedule II–V depending on formulation. Key risks: respiratory depression, sedation, constipation, physical dependence. Antidote: naloxone.",
        "naloxone": "Competitive opioid receptor antagonist that rapidly reverses opioid overdose (brand: Narcan). Given IM, intranasal, or IV. Short duration — may need repeat dosing if opioid half-life is long. Available OTC in many states.",
        "naltrexone": "Opioid receptor antagonist used to prevent opioid and alcohol relapse in patients who are already detoxified. NOT for acute reversal. Available as oral (ReVia) or monthly injection (Vivitrol).",
        "buprenorphine": "Partial opioid agonist used for opioid use disorder (OUD) and chronic pain. High affinity for mu receptors — displaces full agonists. Ceiling effect on respiratory depression makes it safer than full agonists. Products: Suboxone (buprenorphine + naloxone), Sublocade (monthly injection).",
        "benzodiazepine": "CNS depressant that enhances GABA activity at GABA-A receptors (e.g., alprazolam/Xanax, diazepam/Valium, lorazepam/Ativan, clonazepam/Klonopin). Schedule IV. Risks: dependence, tolerance, respiratory depression (especially with opioids — Black Box Warning).",
        "Z-drug": "Non-benzodiazepine hypnotics (e.g., zolpidem/Ambien, eszopiclone/Lunesta, zaleplon/Sonata). Same mechanism as benzodiazepines (GABA-A modulation). Schedule IV. Used for short-term insomnia. Can cause complex sleep behaviors (sleepwalking, sleep driving).",
        "antiepileptic": "Anticonvulsant — drug used to prevent or reduce seizures by various mechanisms (e.g., phenytoin, valproic acid, carbamazepine, lamotrigine, levetiracetam, gabapentin, pregabalin). Many have narrow therapeutic indices and require serum level monitoring.",
        "anticoagulant": "Drug that prevents blood clot formation by interfering with the coagulation cascade. Types: warfarin (Vitamin K antagonist), heparins (anti-Xa/IIa), and DOACs (direct oral anticoagulants). Requires monitoring to prevent both clotting and bleeding.",
        "warfarin": "Oral anticoagulant that inhibits Vitamin K epoxide reductase, blocking synthesis of clotting factors II, VII, IX, and X (e.g., Coumadin, Jantoven). Narrow therapeutic index — monitored by INR. Extensive food and drug interactions. Antidote: Vitamin K, FFP, or 4-factor PCC.",
        "DOAC": "Direct Oral Anticoagulant (also called NOAC) — newer oral anticoagulants that directly inhibit a single clotting factor. Apixaban (Eliquis) and rivaroxaban (Xarelto) = anti-Xa; dabigatran (Pradaxa) = direct thrombin (factor IIa) inhibitor. Less monitoring than warfarin; reversal agents available.",
        "heparin": "Unfractionated heparin (UFH) — injectable anticoagulant that activates antithrombin III, inhibiting thrombin and factor Xa. Used IV for acute anticoagulation. Monitored by aPTT. Antidote: protamine sulfate. Risk: heparin-induced thrombocytopenia (HIT).",
        "LMWH": "Low Molecular Weight Heparin — e.g., enoxaparin (Lovenox). More predictable anticoagulant effect than UFH; monitored by anti-Xa level. Given subcutaneously. Partial reversal with protamine. Used for DVT/PE treatment and prophylaxis.",
        "antiplatelet": "Drug that prevents platelet aggregation, used for arterial clot prevention (e.g., aspirin, clopidogrel/Plavix, ticagrelor/Brilinta, prasugrel). Key use: after MI, stent placement, stroke prevention in A-fib. Aspirin irreversibly inhibits COX-1 in platelets for 7–10 days.",
        "thrombolytic": "Clot-busting drug that activates plasminogen → plasmin, dissolving existing thrombi (e.g., alteplase/tPA, tenecteplase). Used for acute ischemic stroke, STEMI, massive PE. High bleeding risk.",
        "diuretic": "Promotes urine production to reduce fluid volume and blood pressure. Three main classes: thiazides (hydrochlorothiazide — moderate, first-line for HTN), loop (furosemide/Lasix — most potent, used in CHF/edema), potassium-sparing (spironolactone — mild, aldosterone antagonist).",
        "aldosterone antagonist": "Blocks aldosterone receptors in the kidney, causing sodium and water excretion while retaining potassium. Spironolactone (Aldactone) used for heart failure, hyperaldosteronism, and fluid retention. Risk: hyperkalemia.",
        "alpha blocker": "Alpha-1 adrenergic receptor antagonist — relaxes smooth muscle in blood vessels and the prostate. Antihypertensives (doxazosin, terazosin) and BPH treatment (tamsulosin/Flomax). First-dose orthostatic hypotension is a key side effect.",
        "nitrate": "Vasodilator that releases nitric oxide, causing venous and arterial dilation. Used for angina (nitroglycerin), acute coronary syndrome, and heart failure. Sublingual nitroglycerin for acute attacks. Contraindicated with PDE-5 inhibitors (sildenafil) — severe hypotension.",
        "digoxin": "Cardiac glycoside that inhibits the Na+/K+-ATPase pump, increasing intracellular calcium and strengthening heart contractions (positive inotrope) while also slowing AV conduction (negative chronotrope). Narrow therapeutic index — toxic levels cause nausea, visual changes, and arrhythmias. Antidote: Digibind.",
        "antiarrhythmic": "Drug used to treat abnormal heart rhythms. Classified by Vaughan Williams classification: Class I (Na+ channel blockers), II (beta blockers), III (K+ channel blockers — amiodarone), IV (calcium channel blockers). Amiodarone is the most commonly used; many drug interactions and organ toxicities.",
        "PPI": "Proton Pump Inhibitor — irreversibly blocks the H+/K+-ATPase enzyme (proton pump) in gastric parietal cells, maximally reducing stomach acid production (e.g., omeprazole, pantoprazole, lansoprazole, esomeprazole). Names end in -prazole. Used for GERD, PUD, H. pylori eradication.",
        "H2 blocker": "Histamine-2 receptor antagonist — blocks H2 receptors on gastric parietal cells, reducing stomach acid production (e.g., famotidine/Pepcid, ranitidine). Less potent acid suppression than PPIs. Names end in -tidine.",
        "antiemetic": "Drug that prevents or treats nausea and vomiting. Classes include: 5-HT3 antagonists (ondansetron/Zofran — 'setron' suffix), dopamine antagonists (promethazine, prochlorperazine), NK1 receptor antagonists (aprepitant — for chemotherapy nausea), and H1 antagonists (meclizine — for motion sickness).",
        "corticosteroid": "Steroid hormone (natural or synthetic) with potent anti-inflammatory and immunosuppressive effects. Systemic (prednisone, methylprednisolone, dexamethasone) — short-term use for inflammation; long-term causes Cushing's syndrome, osteoporosis, hyperglycemia, adrenal suppression. Inhaled (fluticasone, budesonide) — minimal systemic effects.",
        "anticholinergic": "Blocks muscarinic acetylcholine receptors. Classic side effects: 'Dry as a bone' (dry mouth, dry skin, decreased secretions), 'Blind as a bat' (blurred vision, mydriasis), 'Hot as a hare' (hyperthermia), 'Red as a beet' (flushing), 'Mad as a hatter' (confusion, delirium). Especially dangerous in elderly patients.",
        "antipsychotic": "Drug used to treat schizophrenia, bipolar disorder, and psychosis. First-generation/typical (haloperidol, chlorpromazine): block D2 receptors — higher risk of extrapyramidal symptoms and tardive dyskinesia. Second-generation/atypical (risperidone, quetiapine, olanzapine, aripiprazole): also block serotonin receptors — more metabolic side effects.",
        "muscle relaxant": "Central muscle relaxants (e.g., cyclobenzaprine, methocarbamol, baclofen, tizanidine, carisoprodol) work on the CNS to relieve muscle spasm. Carisoprodol (Soma) is a Schedule IV controlled substance. Often cause sedation. Different from neuromuscular blocking agents used in anesthesia.",
        "bronchodilator": "Opens narrowed airways by relaxing bronchial smooth muscle. SABAs (short-acting beta-2 agonists, e.g., albuterol) = rescue inhalers. LABAs (long-acting, e.g., salmeterol, formoterol) = maintenance. SAMAs (short-acting muscarinic antagonists, e.g., ipratropium) and LAMAs (tiotropium) used in COPD.",
        "SABA": "Short-Acting Beta-2 Agonist — the first-line rescue inhaler for acute asthma and COPD symptoms (e.g., albuterol/ProAir, levalbuterol/Xopenex). Onset within 5–15 minutes. Duration 4–6 hours. Overuse is a marker of poorly controlled asthma.",
        "LABA": "Long-Acting Beta-2 Agonist — maintenance bronchodilator for asthma and COPD (e.g., salmeterol, formoterol, vilanterol). NOT for acute rescue. Black Box Warning: do not use as monotherapy for asthma — must be combined with an inhaled corticosteroid (ICS).",
        "ICS": "Inhaled Corticosteroid — mainstay controller therapy for persistent asthma; reduces airway inflammation (e.g., fluticasone, budesonide, beclomethasone). Minimal systemic effects but can cause oral candidiasis (thrush) — rinse mouth after use.",
        "LAMA": "Long-Acting Muscarinic Antagonist — blocks M3 receptors in the airways, causing bronchodilation. First-line maintenance for COPD (e.g., tiotropium/Spiriva, umeclidinium). Dry mouth is common; do not use in narrow-angle glaucoma or BPH.",
        "leukotriene modifier": "Blocks leukotriene pathways to reduce airway inflammation and bronchoconstriction. Used as adjunct therapy for persistent asthma and allergic rhinitis. Montelukast (Singulair) — note: FDA Black Box Warning for serious neuropsychiatric events (suicidal ideation).",
        "immunosuppressant": "Drug that suppresses the immune system to prevent organ transplant rejection or treat autoimmune diseases (e.g., tacrolimus, cyclosporine, mycophenolate, azathioprine). High risk of infections and malignancies. All have narrow therapeutic windows; most are monitored by trough levels.",
        "DMARD": "Disease-Modifying Antirheumatic Drug — slows or halts progression of rheumatoid arthritis (RA) and other autoimmune conditions by targeting the underlying disease process, not just inflammation. Conventional: methotrexate (first-line), hydroxychloroquine. Biologic: TNF inhibitors, IL-6 inhibitors (tocilizumab), JAK inhibitors.",
        "TNF inhibitor": "Biologic DMARD that blocks tumor necrosis factor-alpha, a key inflammatory cytokine in RA, psoriasis, and IBD (e.g., etanercept/Enbrel, adalimumab/Humira, infliximab/Remicade). Require TB screening and hepatitis B testing before initiation. Black Box Warning: serious infections and lymphoma risk.",
        "bisphosphonate": "Inhibits osteoclast activity, preventing bone resorption and treating/preventing osteoporosis (e.g., alendronate/Fosamax, risedronate, ibandronate, zoledronic acid). Oral bisphosphonates must be taken on an empty stomach with a full glass of water, remaining upright for 30 minutes to prevent esophageal erosion.",
        "SERM": "Selective Estrogen Receptor Modulator — acts as estrogen agonist in some tissues and antagonist in others. Tamoxifen (breast cancer prevention/treatment) = agonist in bone/uterus, antagonist in breast. Raloxifene (Evista) = agonist in bone, antagonist in breast/uterus. Risk of VTE (blood clots).",
        "sulfonylurea": "Oral antidiabetic that stimulates insulin release from pancreatic beta cells (e.g., glipizide, glyburide, glimepiride). Major risk: HYPOGLYCEMIA — especially in elderly, with renal impairment, or if a meal is missed. Take before meals.",
        "biguanide": "Drug class that reduces hepatic glucose production and improves insulin sensitivity. Metformin is the only available biguanide and is first-line for type 2 diabetes. Does NOT cause hypoglycemia as monotherapy. GI side effects are common; take with food.",
        "DPP-4 inhibitor": "Dipeptidyl peptidase-4 inhibitor — blocks DPP-4 from degrading incretin hormones (GLP-1, GIP), increasing insulin secretion in a glucose-dependent manner (e.g., sitagliptin/Januvia, saxagliptin, linagliptin). Weight neutral, low hypoglycemia risk. Names end in -gliptin.",
        "GLP-1 agonist": "Glucagon-like peptide-1 receptor agonist — mimics incretin hormone to increase insulin secretion, slow gastric emptying, and reduce appetite (e.g., semaglutide/Ozempic/Wegovy, liraglutide/Victoza, dulaglutide/Trulicity). Causes significant weight loss. GI side effects common. Injectable (most); oral semaglutide available.",
        "SGLT-2 inhibitor": "Sodium-glucose cotransporter-2 inhibitor — blocks glucose reabsorption in the renal proximal tubule, causing glycosuria and lowering blood glucose (e.g., empagliflozin/Jardiance, canagliflozin/Invokana, dapagliflozin/Farxiga). Also reduce cardiovascular events and kidney disease progression. Risk: genital yeast infections, UTIs, DKA.",
        "thiazolidinedione": "TZD / glitazone — activates PPAR-gamma receptors in fat and muscle, improving insulin sensitivity (e.g., pioglitazone/Actos). Causes fluid retention and weight gain; contraindicated in heart failure. Black Box Warning: increased risk of bladder cancer (pioglitazone).",
        "alpha-glucosidase inhibitor": "Slows carbohydrate absorption in the small intestine by inhibiting alpha-glucosidase enzymes (e.g., acarbose/Precose, miglitol). Reduces postprandial blood glucose spikes. GI side effects (gas, bloating, diarrhea) are common. If hypoglycemia occurs, must use glucose — NOT sucrose (table sugar).",
        "insulin": "Protein hormone that lowers blood glucose by facilitating cellular glucose uptake. Types: rapid-acting (lispro, aspart, glulisine — onset 15 min), short-acting (regular — onset 30 min), intermediate-acting (NPH), long-acting (glargine/Lantus, detemir, degludec). U-100 = 100 units/mL (standard); U-500 = 500 units/mL (high-concentration for severe insulin resistance).",
        "NPH insulin": "Neutral Protamine Hagedorn — an intermediate-acting insulin formulation created by combining regular insulin with protamine to slow its absorption. Cloudy in appearance (unlike clear insulin formulations). Must be gently rolled, not shaken, before use.",
        "antifungal": "Drug that treats fungal infections. Azoles (fluconazole, itraconazole, voriconazole) — inhibit ergosterol synthesis; many CYP450 drug interactions. Polyenes (amphotericin B, nystatin) — bind ergosterol, disrupting the fungal cell membrane. Echinocandins (caspofungin, micafungin) — inhibit fungal cell wall synthesis.",
        "antiretroviral": "Drug used to treat HIV infection by inhibiting HIV replication. Classes: NRTIs (nucleoside reverse transcriptase inhibitors), NNRTIs, protease inhibitors, integrase inhibitors (e.g., dolutegravir). Used in combination as antiretroviral therapy (ART) — patients typically take 2–3 agents. Viral load and CD4 count are monitored.",
        "macrolide": "Antibiotic class that inhibits bacterial protein synthesis by binding the 50S ribosomal subunit (e.g., azithromycin/Z-Pak, clarithromycin, erythromycin). Broad-spectrum, including atypicals. QT prolongation risk; azithromycin has a Black Box Warning for fatal cardiac arrhythmias in high-risk patients.",
        "sulfonamide": "Antibiotic class that inhibits bacterial folic acid synthesis (e.g., sulfamethoxazole — usually combined with trimethoprim as TMP-SMX/Bactrim). Risk of cross-reactivity with sulfa-containing non-antibiotic drugs (controversial) and potentially with sulfa allergy. Can cause Stevens-Johnson syndrome.",
        "aminoglycoside": "Antibiotic class that inhibits bacterial protein synthesis (e.g., gentamicin, tobramycin, amikacin). Active against gram-negative bacteria. Narrow therapeutic index — monitored by peak and trough serum levels. Major toxicities: nephrotoxicity (reversible) and ototoxicity (often irreversible hearing/balance damage).",
        "fluoroquinolone": "Broad-spectrum antibiotic that inhibits bacterial DNA gyrase and topoisomerase IV (e.g., ciprofloxacin, levofloxacin, moxifloxacin). Black Box Warnings: tendon rupture (especially Achilles — increased risk with corticosteroids and in elderly), peripheral neuropathy, worsening myasthenia gravis, risk of aortic aneurysm.",
        "glycopeptide": "Antibiotic class that inhibits bacterial cell wall synthesis; active against gram-positive bacteria including MRSA (vancomycin). Nephrotoxic and ototoxic — monitored by AUC-guided dosing. IV only (oral vancomycin for C. diff colitis only — not absorbed systemically).",
        "neuromuscular blocking agent": "Drug that causes paralysis by blocking acetylcholine transmission at the neuromuscular junction. Used in general anesthesia to facilitate intubation and surgical relaxation. Types: depolarizing (succinylcholine) and non-depolarizing (vecuronium, rocuronium). These are ISMP HIGH-ALERT medications — must be stored separately to prevent accidental administration.",
        "vasopressor": "Drug that causes vasoconstriction to raise blood pressure in shock or hypotension (e.g., norepinephrine, epinephrine, dopamine, phenylephrine, vasopressin). Norepinephrine is the first-line vasopressor for septic shock. Must be administered via central line due to tissue necrosis risk if extravasation occurs.",
        "thyroid hormone replacement": "Levothyroxine (T4) — the standard treatment for hypothyroidism. Narrow therapeutic index — small changes in dose significantly affect TSH. Take on an empty stomach in the morning; many drugs and foods impair absorption. Brands are NOT interchangeable without physician approval (product-specific bioavailability differences).",
        "antithyroid drug": "Reduces thyroid hormone production to treat hyperthyroidism. Methimazole (Tapazole) — preferred for most adults; risk of agranulocytosis. Propylthiouracil (PTU) — preferred in first trimester of pregnancy and thyroid storm. Both require CBC monitoring.",
        "xanthine oxidase inhibitor": "Reduces uric acid production by blocking the enzyme xanthine oxidase. Allopurinol (Zyloprim) — first-line for chronic gout prevention; can trigger acute gout flares when starting. Febuxostat (Uloric) — alternative; Black Box Warning for cardiovascular death risk vs. allopurinol.",
        "uricosuric agent": "Increases renal excretion of uric acid to treat chronic gout (e.g., probenecid). Requires adequate hydration and is ineffective in patients with renal impairment. Avoid aspirin (competes for renal excretion).",
        "local anesthetic": "Blocks sodium channels in nerve membranes, preventing action potential propagation and causing temporary, reversible loss of sensation in a specific area (e.g., lidocaine, bupivacaine, benzocaine). Names end in -caine. Epinephrine is often added to prolong duration and limit systemic absorption.",

        // ═══════════════════════════════════════════════════════════════════
        // CLINICAL TERMS & DISEASE STATES
        // ═══════════════════════════════════════════════════════════════════

        "hypertension": "Persistently elevated blood pressure ≥ 130/80 mmHg (ACC/AHA 2017 guidelines). Major modifiable risk factor for MI, stroke, HF, and chronic kidney disease. First-line treatment: thiazide diuretics, ACE inhibitors, ARBs, or calcium channel blockers.",
        "angina": "Chest pain or discomfort caused by reduced blood flow to the heart muscle, usually due to coronary artery disease. Stable angina: predictable with exertion, relieved by rest and nitroglycerin. Unstable angina: occurs at rest, unpredictable — a medical emergency (part of ACS).",
        "ACS": "Acute Coronary Syndrome — encompasses unstable angina, NSTEMI, and STEMI. Caused by rupture of an atherosclerotic plaque with thrombus formation. Treatment: antiplatelet therapy (aspirin + P2Y12 inhibitor), anticoagulation, beta blockers, and reperfusion (PCI or thrombolytics).",
        "MI": "Myocardial Infarction (heart attack) — irreversible death of cardiac muscle due to prolonged ischemia from coronary artery occlusion. STEMI = complete occlusion (ST-elevation on EKG); NSTEMI = partial occlusion. Time to treatment is critical.",
        "CHF": "Congestive Heart Failure — the heart cannot pump enough blood to meet the body's demands, causing fluid backup. Symptoms: shortness of breath, edema, fatigue. Standard therapy: ACE inhibitor/ARB + beta blocker + diuretic + aldosterone antagonist (in appropriate patients).",
        "atrial fibrillation": "The most common sustained cardiac arrhythmia — chaotic, irregular electrical activity in the atria causing an irregular ventricular response. Significantly increases stroke risk (5x). Management: rate control (beta blockers, diltiazem), rhythm control, and anticoagulation (warfarin or DOACs).",
        "DVT": "Deep Vein Thrombosis — blood clot (thrombus) in a deep vein, usually in the leg. Symptoms: calf pain, swelling, redness. Risk factors: immobility, surgery, oral contraceptives, cancer. Treat with anticoagulants; risk of PE if clot embolizes.",
        "PE": "Pulmonary Embolism — a blood clot that has traveled to and blocked a pulmonary artery. Can be life-threatening depending on size. Symptoms: sudden shortness of breath, chest pain, rapid heart rate. Treat with anticoagulants; thrombolytics for massive PE.",
        "GERD": "Gastroesophageal Reflux Disease — stomach acid backs up into the esophagus, causing heartburn, regurgitation, and potential esophageal damage. First-line treatment: lifestyle modifications, then PPIs or H2 blockers.",
        "PUD": "Peptic Ulcer Disease — sores in the lining of the stomach, duodenum, or esophagus. Most common causes: H. pylori infection (60–70%) and NSAIDs (which inhibit prostaglandins that protect the GI mucosa). Treated with PPIs; H. pylori requires eradication triple or quadruple therapy.",
        "H. pylori": "Helicobacter pylori — a gram-negative bacteria that infects the stomach lining and is the primary cause of peptic ulcers and a risk factor for gastric cancer. Eradicated with combination therapy: PPI + 2 antibiotics (clarithromycin, amoxicillin or metronidazole) for 14 days.",
        "IBD": "Inflammatory Bowel Disease — chronic inflammation of the GI tract. Two main types: Crohn's disease (can affect any part of GI tract, full thickness) and ulcerative colitis (limited to colon and rectum, mucosal). Treated with aminosalicylates, corticosteroids, immunosuppressants, and biologic DMARDs.",
        "COPD": "Chronic Obstructive Pulmonary Disease — irreversible, progressive airflow obstruction primarily caused by cigarette smoking. Includes emphysema and chronic bronchitis. Managed with bronchodilators (LAMA, LABA, SABA), ICS, supplemental oxygen, and smoking cessation. GOLD staging guides therapy.",
        "asthma": "Chronic inflammatory airway disease characterized by reversible bronchoconstriction, airway hyperresponsiveness, and mucus hypersecretion. Triggers include allergens, exercise, cold air, and infections. Controller therapy: ICS ± LABA. Rescue: SABA.",
        "type 2 diabetes": "Chronic metabolic disease characterized by insulin resistance and relative insulin deficiency, leading to hyperglycemia. Managed with lifestyle modifications and pharmacotherapy: metformin (first-line), followed by additional agents based on comorbidities. Monitored by HbA1c.",
        "type 1 diabetes": "Autoimmune destruction of pancreatic beta cells, leading to absolute insulin deficiency. Requires lifelong insulin therapy. Managed with basal-bolus insulin regimens. Cannot be treated with oral antidiabetic agents alone.",
        "DKA": "Diabetic Ketoacidosis — life-threatening complication of diabetes (usually type 1) caused by insulin deficiency, leading to ketone accumulation, metabolic acidosis, and hyperglycemia. Symptoms: polyuria, polydipsia, nausea, abdominal pain, fruity breath. Treatment: IV fluids, insulin, electrolyte replacement.",
        "hypoglycemia": "Blood glucose < 70 mg/dL. Symptoms: shakiness, sweating, confusion, palpitations. Severe: seizures or loss of consciousness. Treated with fast-acting carbohydrates (glucose tablets, juice) or IV dextrose/glucagon injection if unconscious. Main risk with insulin and sulfonylureas.",
        "hyperglycemia": "Elevated blood glucose > 180 mg/dL. Symptoms: polyuria (excessive urination), polydipsia (excessive thirst), blurred vision, fatigue. Long-term: damages kidneys, nerves, eyes, and blood vessels. Target HbA1c < 7% for most diabetic patients.",
        "hypothyroidism": "Underactive thyroid gland — insufficient thyroid hormone production. Most common cause: Hashimoto's thyroiditis. Symptoms: fatigue, weight gain, cold intolerance, constipation, bradycardia, dry skin. Treated with levothyroxine. TSH is the primary monitoring parameter.",
        "hyperthyroidism": "Overactive thyroid — excess thyroid hormone production. Most common cause: Graves' disease (autoimmune). Symptoms: weight loss, heat intolerance, tachycardia, tremor, anxiety, exophthalmos. Treated with antithyroid drugs (methimazole, PTU), radioactive iodine, or surgery.",
        "osteoporosis": "Decreased bone density increasing fracture risk. T-score ≤ -2.5 on DEXA scan = osteoporosis. Treated with calcium, vitamin D, and bisphosphonates (first-line). Denosumab, teriparatide, or romosozumab for severe cases.",
        "gout": "Painful inflammatory arthritis caused by hyperuricemia (elevated uric acid) leading to monosodium urate crystal deposition in joints, usually the big toe. Acute attacks: treated with NSAIDs, colchicine, or corticosteroids. Chronic prevention: urate-lowering therapy (allopurinol, febuxostat, probenecid).",
        "BPH": "Benign Prostatic Hyperplasia — non-cancerous enlargement of the prostate gland in older men, causing urinary symptoms (hesitancy, weak stream, nocturia). Treated with alpha-1 blockers (tamsulosin — first choice, uroselective) and/or 5-alpha reductase inhibitors (finasteride, dutasteride).",
        "UTI": "Urinary Tract Infection — bacterial infection of the urinary system. Uncomplicated cystitis: treated with TMP-SMX, nitrofurantoin, or fosfomycin. Complicated UTI/pyelonephritis: fluoroquinolones or IV antibiotics. E. coli is the most common pathogen.",
        "seizure": "Abnormal, excessive electrical discharge in the brain causing a range of symptoms from brief lapses of awareness (absence seizures) to full convulsions (tonic-clonic). Status epilepticus: seizure lasting > 5 minutes — emergency. First-line rescue: benzodiazepines (lorazepam IV, diazepam rectal, midazolam intranasal).",
        "stroke": "Sudden interruption of blood supply to the brain. Ischemic stroke (87%): clot blocks a brain artery — treated with tPA (alteplase) within 4.5 hours if no contraindications. Hemorrhagic stroke (13%): bleeding into or around the brain — tPA is CONTRAINDICATED. Both are medical emergencies (FAST = Face/Arm/Speech/Time).",
        "HIV": "Human Immunodeficiency Virus — attacks CD4+ T-lymphocytes, progressively destroying the immune system. Treated with combination antiretroviral therapy (ART) using drugs from multiple classes. Goal: undetectable viral load. Monitored by CD4 count and viral load. PrEP (pre-exposure prophylaxis) with emtricitabine/tenofovir prevents infection.",
        "MRSA": "Methicillin-Resistant Staphylococcus aureus — a strain of Staph aureus resistant to beta-lactam antibiotics including penicillins and most cephalosporins. Treated with vancomycin (IV) for serious infections; TMP-SMX, doxycycline, or linezolid for skin infections. Requires contact precautions.",
        "C. diff": "Clostridioides difficile — a spore-forming bacteria that causes diarrhea and colitis, often after antibiotic use disrupts gut flora. Symptoms: watery diarrhea, abdominal cramping, fever. Treat with oral vancomycin (first-line) or fidaxomicin. Metronidazole no longer preferred for first-line treatment.",
        "Parkinson's disease": "Progressive neurodegenerative disorder caused by dopamine deficiency in the substantia nigra. Symptoms: tremor at rest, rigidity, bradykinesia (slow movement), and postural instability. Treated with levodopa/carbidopa (gold standard), dopamine agonists (pramipexole, ropinirole), and MAO-B inhibitors (selegiline, rasagiline).",
        "Alzheimer's disease": "Most common cause of dementia — progressive loss of memory and cognitive function due to amyloid plaques and neurofibrillary tangles. Drugs (cholinesterase inhibitors: donepezil, rivastigmine, galantamine; memantine — NMDA antagonist) treat symptoms but do not stop progression.",

        // ═══════════════════════════════════════════════════════════════════
        // LAB VALUES & MONITORING PARAMETERS
        // ═══════════════════════════════════════════════════════════════════

        "INR": "International Normalized Ratio — standardized measure of the time it takes blood to clot, used to monitor warfarin therapy. Normal (off warfarin) ≈ 1.0. Therapeutic range: most indications = 2.0–3.0; mechanical heart valves = 2.5–3.5. High INR = increased bleeding risk.",
        "aPTT": "Activated Partial Thromboplastin Time — measures the intrinsic and common clotting pathways. Used to monitor unfractionated heparin (UFH) therapy. Therapeutic range: 60–100 seconds (1.5–2.5× normal). High aPTT = increased bleeding risk.",
        "HbA1c": "Glycated hemoglobin A1c — reflects average blood glucose over the past 2–3 months. Used to assess long-term glycemic control in diabetes. Target: < 7% for most adults. Each 1% reduction in HbA1c significantly reduces risk of diabetic complications.",
        "eGFR": "Estimated Glomerular Filtration Rate — estimated rate of kidney filtration (mL/min/1.73m²), calculated from serum creatinine, age, sex, and race. Used to stage CKD (chronic kidney disease) and guide drug dose adjustments. Many drugs require dose reduction when eGFR < 60, 45, or 30 mL/min.",
        "serum creatinine": "A waste product of muscle metabolism cleared by the kidneys. Used to estimate kidney function (eGFR). Rising creatinine indicates declining kidney function. Used in Cockcroft-Gault equation for CrCl calculation, which guides drug dosing in renal impairment.",
        "CrCl": "Creatinine Clearance — estimate of kidney function in mL/min, calculated using the Cockcroft-Gault equation: CrCl = [(140 – age) × weight (kg) / (72 × serum creatinine)] × 0.85 for females. Used to adjust doses of renally-cleared drugs.",
        "TSH": "Thyroid-Stimulating Hormone — secreted by the pituitary gland to stimulate thyroid hormone production. Primary monitoring parameter for thyroid disorders. High TSH = hypothyroidism (thyroid not responding); Low TSH = hyperthyroidism or overtreatment with levothyroxine.",
        "LFTs": "Liver Function Tests — a panel of blood tests assessing liver health: ALT, AST (liver enzymes), alkaline phosphatase, bilirubin, and albumin. Elevated ALT/AST indicates hepatocellular injury. Used to monitor hepatotoxic drugs (e.g., statins, isoniazid, methotrexate, valproic acid).",
        "CBC": "Complete Blood Count — measures red blood cells (RBC), white blood cells (WBC), platelets, hemoglobin, and hematocrit. Used to detect anemia, infection, bleeding disorders, and bone marrow problems. Required monitoring for many drugs (e.g., clozapine, methotrexate, carbamazepine).",
        "WBC": "White Blood Cell count — indicator of immune system activity. High WBC = infection or inflammation; low WBC (leukopenia) = immunosuppression risk. Neutrophils are the most important subtype for infection defense.",
        "platelet": "Cell fragment essential for blood clotting. Low platelets (thrombocytopenia) = increased bleeding risk. High platelets (thrombocytosis) = increased clotting risk. Many drugs can cause thrombocytopenia (heparin-induced thrombocytopenia/HIT is the most dangerous drug-induced form).",
        "peak and trough": "Peak = highest drug concentration (measured after distribution, shortly after dose). Trough = lowest concentration (measured just before next dose). Both are used for therapeutic drug monitoring of aminoglycosides and vancomycin to ensure efficacy and prevent toxicity.",
        "drug level": "Serum concentration of a drug used for therapeutic drug monitoring (TDM). Used for drugs with narrow therapeutic indices: vancomycin (trough/AUC), aminoglycosides (peak + trough), digoxin, lithium, phenytoin, carbamazepine, valproic acid, cyclosporine, tacrolimus.",
        "serum potassium": "Normal range: 3.5–5.0 mEq/L. Hyperkalemia (> 5.5): risk of fatal cardiac arrhythmia — caused by ACE inhibitors, ARBs, potassium-sparing diuretics, excessive potassium supplementation, or renal failure. Hypokalemia (< 3.5): muscle weakness, arrhythmias — caused by loop and thiazide diuretics.",
        "lipid panel": "Blood test measuring cholesterol fractions: total cholesterol, LDL ('bad cholesterol'), HDL ('good cholesterol'), and triglycerides. LDL is the primary target for cardiovascular risk reduction. Target LDL varies by risk category; < 70 mg/dL for very high-risk patients (prior MI, diabetes + HTN).",

        // ═══════════════════════════════════════════════════════════════════
        // ADVERSE EFFECTS & DRUG REACTIONS
        // ═══════════════════════════════════════════════════════════════════

        "rhabdomyolysis": "Breakdown of skeletal muscle fibers, releasing myoglobin into the bloodstream that can damage the kidneys. Symptoms: muscle pain, weakness, dark ('tea-colored') urine. Drug causes: statins (especially at high doses or combined with fibrates/CYP3A4 inhibitors), cocaine, excessive exercise.",
        "lactic acidosis": "Dangerous buildup of lactic acid in the blood. Causes: metformin (rare, especially with renal failure or iodinated contrast), sepsis, tissue ischemia. Symptoms: nausea, abdominal pain, weakness, rapid breathing, altered mental status. Can be fatal.",
        "angioedema": "Rapid, deep swelling of the skin, mucous membranes, face, lips, tongue, or larynx. Can be life-threatening if airway is compromised. Associated with ACE inhibitors (bradykinin accumulation — can occur at any time, even years after starting). Treat with epinephrine if airway threatened.",
        "hyperkalemia": "Elevated serum potassium (> 5.0 mEq/L). Can cause fatal cardiac arrhythmias (tall peaked T waves → bradycardia → asystole). Causes: ACE inhibitors, ARBs, potassium-sparing diuretics, NSAIDs, renal failure, excessive potassium supplementation.",
        "hypokalemia": "Low serum potassium (< 3.5 mEq/L). Causes: loop diuretics, thiazide diuretics, vomiting, diarrhea, laxative abuse. Symptoms: muscle weakness, cramps, constipation, cardiac arrhythmias. Potassium replacement required.",
        "nephrotoxicity": "Drug-induced kidney damage. High-risk drugs: aminoglycosides, vancomycin, IV contrast media, NSAIDs (long-term), cisplatin, amphotericin B, cyclosporine, tacrolimus. Monitor: serum creatinine, BUN, urine output.",
        "ototoxicity": "Drug-induced damage to the inner ear (cochlea = hearing loss; vestibular apparatus = balance problems). Major culprits: aminoglycosides (irreversible) and loop diuretics (especially furosemide at high IV doses — usually reversible). Symptoms: hearing loss, tinnitus (ringing), vertigo.",
        "hepatotoxicity": "Drug-induced liver damage. Can range from asymptomatic enzyme elevation to fulminant liver failure. Common culprits: acetaminophen (overdose — most common cause of acute liver failure in U.S.), isoniazid, methotrexate, valproic acid, amiodarone, statins. Monitor LFTs.",
        "photosensitivity": "Increased sensitivity of the skin to ultraviolet (UV) radiation, resulting in severe sunburn or rash from normal sun exposure. Phototoxic (more common) or photoallergic. Common drug causes: fluoroquinolones, tetracyclines, thiazides, amiodarone, sulfonamides, voriconazole.",
        "Stevens-Johnson syndrome": "SJS — a severe, potentially fatal immune-mediated reaction affecting the skin and mucous membranes. Starts with flu-like symptoms followed by painful blisters and skin sloughing. Toxic Epidermal Necrolysis (TEN) is the most severe form (> 30% skin involved). Caused by: antibiotics (sulfonamides, penicillins), antiepileptics (carbamazepine, lamotrigine), allopurinol. Treatment: immediate drug withdrawal, hospitalization.",
        "tardive dyskinesia": "TD — involuntary, repetitive movements (lip smacking, tongue protrusion, grimacing) caused by long-term blockade of dopamine D2 receptors. Associated with first-generation antipsychotics and metoclopramide. May be irreversible. Valbenazine (Ingrezza) and deutetrabenazine (Austedo) are FDA-approved treatments.",
        "extrapyramidal symptoms": "EPS — movement disorders caused by dopamine receptor blockade. Types: acute dystonia (sustained muscle contractions), akathisia (restlessness), Parkinsonism (tremor, rigidity), and tardive dyskinesia (long-term). More common with first-generation (typical) antipsychotics.",
        "neuroleptic malignant syndrome": "NMS — rare, life-threatening reaction to antipsychotic drugs characterized by hyperthermia, severe muscle rigidity, autonomic instability, and altered mental status. A medical emergency. Treat with immediate drug discontinuation, supportive care, dantrolene, and bromocriptine.",
        "QT prolongation": "Extended repolarization of the ventricles visible as a long QT interval on ECG. Predisposes to torsades de pointes — a potentially fatal ventricular arrhythmia that can degenerate to ventricular fibrillation. Drug causes: fluoroquinolones, macrolides, azole antifungals, antipsychotics, antiarrhythmics, methadone, ondansetron.",
        "serotonin syndrome": "Potentially life-threatening overstimulation of serotonin receptors. Triad: neuromuscular abnormalities (clonus, hyperreflexia), autonomic dysfunction (fever, tachycardia, diaphoresis), and altered mental status. Caused by combining serotonergic drugs (SSRIs + MAOIs, SSRIs + triptans, SSRIs + tramadol, fentanyl, linezolid).",
        "agranulocytosis": "Life-threatening decrease in neutrophils (WBC < 500/μL), leaving the patient severely immunocompromised. Drug causes: clozapine (most notable — requires mandatory REMS monitoring of CBC), carbimazole/methimazole, carbamazepine, clomipramine. Presents with severe infection (fever, mouth sores).",
        "drug-induced lupus": "A reversible lupus-like syndrome triggered by certain drugs (e.g., hydralazine, procainamide, isoniazid, minocycline). Symptoms: arthritis, rash, fever, positive ANA. Resolves upon drug discontinuation.",
        "hypersensitivity reaction": "Immune-mediated drug reaction. Type I (immediate/IgE-mediated): anaphylaxis, urticaria, angioedema. Type II: hemolytic anemia. Type III: serum sickness. Type IV (delayed/T cell-mediated): contact dermatitis, Stevens-Johnson syndrome. Cross-reactivity between penicillins and cephalosporins is ~1–2%.",
        "anaphylaxis": "Severe, systemic Type I hypersensitivity reaction causing massive histamine release, leading to airway compromise, hypotension, and potentially death within minutes. Trigger: drugs (penicillin most common), foods, bee stings. First-line treatment: epinephrine 0.3 mg IM (anterolateral thigh).",
        "teratogen": "A substance that causes birth defects when a pregnant woman is exposed to it during organogenesis (weeks 3–8 of pregnancy). Category X / high-risk drugs include: ACE inhibitors (renal toxicity), ARBs, isotretinoin (severe malformations — requires iPLEDGE), warfarin (fetal hemorrhage and malformations), methotrexate, thalidomide, valproate.",
        "black box warning": "The FDA's most serious warning, printed in a box on the prescribing information. Indicates a drug carries a significant risk of serious or life-threatening adverse events. Pharmacists and technicians should recognize which drugs have Black Box Warnings for major safety issues.",

        // ═══════════════════════════════════════════════════════════════════
        // SIG ABBREVIATIONS & ROUTE CODES
        // ═══════════════════════════════════════════════════════════════════

        "QD": "Quaque die — once daily. ISMP recommends writing 'daily' instead because 'QD' can be confused with 'QID' (four times daily) or 'OD,' which has caused fatal errors.",
        "BID": "Bis in die — twice daily. Also written 'b.i.d.' or 'q12h'.",
        "TID": "Ter in die — three times daily. Also written 't.i.d.' or 'q8h'.",
        "QID": "Quarter in die — four times daily. Also written 'q.i.d.' or 'q6h'.",
        "PRN": "Pro re nata — as needed; the patient takes the medication only when symptoms require it, not on a fixed schedule (e.g., analgesics, antiemetics, sleep aids).",
        "STAT": "Latin statim — immediately. A STAT order must be filled and dispensed as quickly as possible, usually within 15–30 minutes in the hospital setting.",
        "QHS": "Quaque hora somni — every bedtime (at hour of sleep). Commonly used for sleep aids, some antidepressants, and certain seizure medications.",
        "AC": "Ante cibum — before meals. Used for drugs that require an empty stomach for efficacy (e.g., levothyroxine, oral bisphosphonates) or that affect glucose absorption (e.g., sulfonylureas).",
        "PC": "Post cibum — after meals. Used for drugs that cause GI upset when taken on an empty stomach (e.g., metformin, iron supplements).",
        "PO": "Per os — by mouth; oral administration. Most common and convenient route; subject to first-pass metabolism.",
        "SL": "Sublingual — placed under the tongue for direct absorption into sublingual blood vessels, bypassing first-pass metabolism. Onset is faster than oral. Used for nitroglycerin, buprenorphine, and emergency medications.",
        "IV": "Intravenous — drug administered directly into a vein. Provides 100% bioavailability and the fastest onset of action. Used for emergencies and when oral absorption is not possible.",
        "IM": "Intramuscular — drug injected deep into muscle tissue (e.g., deltoid, vastus lateralis, gluteal). Slower onset than IV but faster than oral. Used for vaccines, some antibiotics, antipsychotics, and emergency medications.",
        "SQ": "Subcutaneous — injected into the fatty tissue beneath the skin (e.g., insulin, heparin, many biologics). Also written SC or SubQ. Slower and more prolonged absorption than IM.",
        "ID": "Intradermal — injected into the dermis (just under the skin surface). Used for tuberculin skin test (TST/Mantoux), allergy testing, and some vaccines. Produces a visible wheal.",
        "PR": "Per rectum — administered as a suppository or enema into the rectum. Used when oral administration is not possible (vomiting, unconscious patient) or for local colorectal treatment.",
        "NAS": "Nasal — administered via the nasal mucosa for local or systemic effect. Examples: nasal corticosteroids (fluticasone nasal for allergic rhinitis), nasal naloxone (Narcan), intranasal midazolam for seizures.",
        "TOP": "Topical — applied to the body surface (skin, eyes, ears) for local effect. Minimizes systemic absorption and side effects.",
        "OD": "Oculus dexter (Latin) — right eye. A common source of medication errors; many facilities require 'RIGHT EYE' to be spelled out on orders.",
        "OS": "Oculus sinister (Latin) — left eye.",
        "OU": "Oculus uterque (Latin) — both eyes. Memory tip: 'D = Dexter = RIGHT (dexterous right hand); S = Sinister = LEFT; U = both.'",
        "AD": "Auris dextra (Latin) — right ear.",
        "AS": "Auris sinistra (Latin) — left ear.",
        "AU": "Auris utraque (Latin) — both ears.",
        "gtt": "Gutta (Latin, singular) — a drop. Used in ophthalmic and otic orders. Plural: gtts (guttae). Example: 'ii gtts OS TID' = 2 drops in the left eye three times daily.",
        "sig": "Signa (Latin) — the directions section of a prescription, telling the dispensing pharmacist how to label the medication for the patient. Example sig: 'Take 1 tablet by mouth twice daily with food.'",

        // ═══════════════════════════════════════════════════════════════════
        // ORDER ENTRY, CALCULATIONS & DISPENSING
        // ═══════════════════════════════════════════════════════════════════

        "days supply": "The number of days a dispensed quantity of medication will last at the prescribed dosing frequency. Calculated as: Qty dispensed ÷ doses per day. Insurance plans will typically not pay for a refill until approximately 75–80% of the days supply has elapsed.",
        "quantity limit": "An insurance plan restriction on the maximum quantity of a drug that will be covered per dispensing or per month. Designed to prevent stockpiling, control costs, or ensure appropriate use.",
        "mEq": "Milliequivalent — a unit of measurement for electrolytes that accounts for the ion's charge (valence). Used for potassium (KCl), sodium (NaCl), and other electrolyte solutions. Important in IV compounding.",
        "percent weight-per-volume": "% w/v — grams of solute per 100 mL of solution. The most common concentration expression in pharmacy. Example: 0.9% NaCl (normal saline) = 0.9 g of NaCl per 100 mL of water.",
        "ratio strength": "Expresses drug concentration as a ratio (e.g., 1:1000 = 1 g per 1000 mL = 0.1% w/v). Used for epinephrine (1:1000 for IM injection; 1:10,000 for IV cardiac arrest) and other dilute solutions.",
        "alligation": "A mathematical method used to determine the proportions of two solutions of different concentrations needed to create a desired intermediate concentration. Used when compounding IV solutions or topical preparations from stock solutions of different strengths.",
        "osmolarity": "Total concentration of solutes in a solution expressed in mOsm/L. Clinically important for IV fluids: normal blood osmolarity ≈ 285–295 mOsm/L. Solutions with significantly higher osmolarity than blood must be given via central line to prevent vein damage.",
        "isotonic": "A solution with the same osmotic pressure as blood and body fluids (≈ 285–295 mOsm/L). Examples: 0.9% NaCl (normal saline), D5W (in distribution), lactated Ringer's. No net movement of water across red blood cell membranes — cells maintain their shape.",
        "hypertonic": "A solution with higher osmolarity than blood. Draws water out of cells, causing them to shrink. Examples: 3% NaCl (hypertonic saline). Must be administered via central venous access. Used for severe hyponatremia.",
        "hypotonic": "A solution with lower osmolarity than blood. Causes water to move into cells, potentially causing them to swell and lyse. Examples: 0.45% NaCl (half-normal saline). Excessive administration can cause cellular edema.",
        "flow rate": "Rate of IV infusion in mL/hr. Calculated as: Total volume (mL) ÷ Time (hr). Also expressed as drops per minute when using gravity drip sets. Critical for accurate drug delivery, especially for high-alert medications (insulin drips, vasopressors, heparin infusions).",
        "drop factor": "The number of drops (gtts) per mL delivered by a specific IV administration set. Standard IV sets: 10, 15, or 20 gtts/mL. Microdrip sets: 60 gtts/mL (used for pediatric patients and precise low-rate infusions).",
        "IVPB": "Intravenous Piggyback — a small-volume IV bag (50–250 mL) infused intermittently through a secondary port into an existing primary IV line. Used for antibiotic infusions, electrolyte replacements, and other drugs requiring intermittent dosing.",
        "TPN": "Total Parenteral Nutrition — complete nutrition delivered intravenously to patients who cannot receive adequate nutrition through the GI tract. Contains dextrose, amino acids, lipids, electrolytes, vitamins, and minerals. Must be prepared using strict aseptic technique; administered via central venous access.",
        "loading dose": "A larger-than-usual initial dose given to rapidly achieve therapeutic drug concentrations, especially for drugs with long half-lives (e.g., digoxin, vancomycin, phenytoin). Followed by maintenance doses.",
        "maintenance dose": "The regular dose given after a loading dose to maintain steady-state drug concentrations within the therapeutic range.",
        "reconstitution": "Adding a specified volume of a diluent (sterile water, normal saline, or bacteriostatic water) to a lyophilized (freeze-dried) drug powder to create a liquid solution or suspension for administration. The reconstituted volume and resulting concentration must be calculated carefully.",
        "powder volume": "The volume that a drug powder itself contributes to the final reconstituted solution. Important for accurate dose calculations. Final volume = diluent added + powder volume.",
        "compounding": "The preparation of a customized medication for a specific patient's clinical needs when no commercially available product meets those needs (e.g., different strength, omission of an allergen, alternative dosage form, pediatric formulation). Subject to USP <795> and <797> standards.",
        "specific gravity": "The ratio of a substance's density to the density of water (1.0). Used in pharmaceutical calculations to convert between volume and weight for non-aqueous liquids. Example: if specific gravity = 1.25, then 100 mL of the liquid weighs 125 g.",
        "IBW": "Ideal Body Weight — a calculated weight used as the dosing base for drugs that do not distribute well into fat tissue. Cockcroft-Gault CrCl calculation uses IBW (or actual body weight if ABW < IBW). Males: 50 kg + 2.3 kg per inch > 60 inches. Females: 45.5 kg + 2.3 kg per inch > 60 inches.",
        "BSA": "Body Surface Area — total skin area in m². Calculated by Mosteller formula: √(height(cm) × weight(kg) / 3600). Used to dose chemotherapy agents and some pediatric drugs to normalize for patient size.",
        "apothecary system": "An older system of weight and volume measurement. Key: 1 grain (gr) ≈ 65 mg; 1 dram = 60 grains; 1 ounce = 8 drams; 1 minim ≈ 0.06 mL. Still encountered on some prescriptions for phenobarbital (gr ½ = 30 mg) and thyroid hormone.",
        "grain": "A unit of mass in the apothecary and avoirdupois systems. 1 grain = 64.8 mg (approximately 65 mg). Used on older prescriptions for phenobarbital ('gr ½' = 30 mg) and in the apothecary system. PTCE commonly tests grain-to-milligram conversions.",

        // ═══════════════════════════════════════════════════════════════════
        // STERILE COMPOUNDING & CLEAN ROOM
        // ═══════════════════════════════════════════════════════════════════

        "USP 795": "USP Chapter <795> — the United States Pharmacopeia standards for non-sterile pharmaceutical compounding, covering quality assurance, ingredient selection, beyond-use dating, and labeling for topical creams, oral solutions, and other non-sterile preparations.",
        "USP 797": "USP Chapter <797> — the standards for sterile pharmaceutical compounding. Sets requirements for personnel training, environmental testing (air and surface), garbing, aseptic technique, BUD assignment, and sterility testing for compounded sterile preparations (CSPs).",
        "USP 800": "USP Chapter <800> — standards for handling hazardous drugs in healthcare settings to protect staff from exposure. Requires engineering controls (closed-system drug transfer devices, biological safety cabinets), PPE (gloves, gown, mask), dedicated negative-pressure rooms, and spill management procedures.",
        "HEPA filter": "High-Efficiency Particulate Air filter — removes ≥ 99.97% of airborne particles ≥ 0.3 microns. Used in laminar airflow hoods and cleanroom HVAC systems to provide ISO Class 5 air quality at the critical site of IV preparation.",
        "ISO Class 5": "International Organization for Standardization (ISO) Class 5 cleanroom air quality — maximum of 3,520 particles per m³ ≥ 0.5 microns. Required at the critical work zone (within the LAFW or BSC) during sterile compounding.",
        "LAFW": "Laminar Airflow Workbench — a workbench where HEPA-filtered air flows in a uniform stream (horizontally or vertically) across the work surface to maintain ISO Class 5 conditions. Used for non-hazardous sterile preparations. NOT safe for hazardous drug preparation.",
        "BSC": "Biological Safety Cabinet — a vented containment cabinet that provides ISO Class 5 conditions while protecting the operator from hazardous drug exposure. Required for all hazardous drug (USP <800>) sterile compounding. Vertical laminar airflow with exhaust HEPA filtration.",
        "hazardous drug": "Any drug identified by NIOSH as posing health risks to healthcare workers (carcinogenicity, teratogenicity, reproductive toxicity, organ toxicity). Includes most chemotherapy agents, some antiviral drugs, hormones, and immunosuppressants. Requires special handling per USP <800> and NIOSH guidelines.",
        "NIOSH": "National Institute for Occupational Safety and Health — U.S. agency that identifies and publishes the NIOSH Hazardous Drug List, which pharmacies use to determine which drugs require enhanced safety precautions under USP <800>.",
        "aseptic technique": "The practices used to prevent contamination of sterile preparations with microorganisms. Includes: proper hand washing and garbing, disinfection of vials and ports with 70% IPA, maintaining first air (unobstructed airflow from HEPA filter), and avoiding touch contamination of critical sites.",
        "BUD": "Beyond-Use Date — the date and time after which a compounded preparation must not be used. Set by the pharmacist based on USP <795> or <797> standards, not the manufacturer's expiration date. Sterile CSPs have strict BUD limits based on sterility assurance category and storage conditions.",
        "CSP": "Compounded Sterile Preparation — a sterile drug product prepared in a cleanroom under aseptic conditions, such as IV admixtures, total parenteral nutrition bags, and sterile irrigations.",
        "anteroom": "An ISO Class 7 or 8 room that serves as a transition area between the general pharmacy and the buffer room (cleanroom). Used for garbing, hand hygiene, and preparing non-sterile materials before entering the cleanroom.",
        "buffer room": "The ISO Class 7 clean room where the LAFW or BSC is located and sterile compounding is performed. Positive pressure (for non-hazardous preparations) or negative pressure (for hazardous drugs) is maintained to control particle flow.",
        "media fill test": "A simulation of the compounding process using a microbial growth medium (instead of actual drug) to validate that a compounder's aseptic technique does not introduce contamination. Required under USP <797> for personnel qualification.",
        "endotoxin": "Pyrogen — a heat-stable component of gram-negative bacterial cell walls (lipopolysaccharide/LPS) that can cause fever, chills, and septic shock if introduced into the bloodstream via contaminated IV solutions. Endotoxin testing (LAL test) is required for certain CSPs.",

        // ═══════════════════════════════════════════════════════════════════
        // MEDICATION SAFETY & QUALITY ASSURANCE
        // ═══════════════════════════════════════════════════════════════════

        "ISMP": "Institute for Safe Medication Practices — a nonprofit organization that identifies and disseminates information about medication errors and high-alert drugs. Publishes the high-alert medication list, LASA list, error-prone abbreviations list, and safety alerts.",
        "LASA": "Look-Alike Sound-Alike — drugs whose names appear or sound similar, creating a risk of mix-ups. Examples: hydrALAZINE/hydrOXYzine, DOPamine/DOBUTamine, vinCRIStine/vinBLAStine. Strategies: tall man lettering, separate storage, barcode scanning.",
        "tall man lettering": "The practice of capitalizing the distinguishing portion of LASA drug names (e.g., hydrALAZINE vs. hydrOXYzine) to draw attention to the differences and reduce look-alike errors. Endorsed by FDA and ISMP.",
        "high-alert medication": "A drug that bears a disproportionately high risk of causing significant patient harm when used in error — not necessarily more frequently involved in errors, but when errors occur, the harm is greater. ISMP's high-alert list includes: anticoagulants, insulin, opioids, concentrated electrolytes (KCl, hypertonic NaCl, MgSO4), neuromuscular blocking agents, and chemotherapy.",
        "medication error": "Any preventable event that may cause or lead to inappropriate medication use or patient harm. Types: wrong drug, wrong dose, wrong patient, wrong time, wrong route, wrong duration, omission error. Most common in prescribing and administration, but transcription and dispensing errors also occur.",
        "near miss": "A medication error or unsafe situation that was caught before reaching the patient. Also called 'close call.' Important to report near misses — they reveal system vulnerabilities that can be corrected before a patient is harmed.",
        "adverse drug event": "ADE — harm caused to a patient as a result of drug exposure. Encompasses adverse drug reactions (expected), medication errors, and allergic reactions. A subset of ADEs are preventable.",
        "sentinel event": "An unexpected event in healthcare that results in death or serious physical or psychological injury, or significant risk thereof. Requires immediate investigation, root cause analysis, and corrective action. Defined by The Joint Commission (TJC).",
        "root cause analysis": "RCA — a systematic retrospective investigation of a sentinel event or serious medication error to identify the underlying system failures (not just individual blame) that contributed to the event. Used to develop preventive corrective actions.",
        "FMEA": "Failure Mode and Effects Analysis — a proactive (forward-looking) risk assessment method used to identify potential failure points in a process before they cause harm. Recommended by TJC and ISMP for high-risk processes.",
        "DUR": "Drug Utilization Review — a structured, ongoing review of prescribing, dispensing, and patient use of medications. Prospective DUR: checks for interactions, allergies, and therapeutic duplications before dispensing. Retrospective DUR: analyzes past prescribing patterns for policy improvement.",
        "double check": "An independent verification of a high-risk process (e.g., high-alert drug dose calculation, IV preparation) by a second pharmacist or nurse — without sharing the answer first. Reduces errors caused by confirmation bias. Required by many institutions for specific high-alert medications.",
        "auxiliary label": "A supplemental adhesive label affixed to a drug package to communicate important safety or administration information to patients or staff. Examples: 'Take with food,' 'May cause drowsiness,' 'Keep refrigerated,' 'For external use only,' 'Do not crush.'",
        "dangerous abbreviation": "Abbreviations that have caused or are likely to cause medication errors and should NOT be used per ISMP and TJC. Examples: 'U' (units — can be misread as 0); 'IU' (international units — can be misread as IV); 'QD' and 'QOD' (confused with each other); trailing zeros (1.0 mg — the '.0' can be misread); lack of leading zero (.5 mg — should be 0.5 mg).",
        "independent double check": "A process where a second qualified person independently recalculates and verifies a high-risk drug dose or preparation without knowledge of the first person's result. Different from a co-signature, which may not catch errors due to confirmation bias.",
        "medication reconciliation": "The process of comparing a patient's current medication list against all new orders at transitions of care (hospital admission, transfer, or discharge) to identify and resolve discrepancies such as omissions, duplications, dose errors, or interactions.",
        "MTM": "Medication Therapy Management — pharmacist-provided services that optimize drug therapy and improve patient outcomes. Includes a comprehensive medication review (CMR), targeted medication reviews, and a personal medication record. Medicare Part D requires MTM programs for high-risk beneficiaries.",
        "adherence": "The extent to which a patient takes medications as prescribed — the right drug, right dose, right time, right frequency. Non-adherence is one of the leading causes of treatment failure, hospitalization, and preventable death. Causes: cost, side effects, complex regimens, lack of understanding, and forgetting.",
        "PDMP": "Prescription Drug Monitoring Program — a state-administered electronic database that tracks all controlled substance prescriptions dispensed in the state. Pharmacists and prescribers can check PDMP before dispensing or prescribing to identify patients receiving CS from multiple providers or pharmacies ('doctor shopping').",

        // ═══════════════════════════════════════════════════════════════════
        // PHARMACOKINETICS & PHARMACODYNAMICS
        // ═══════════════════════════════════════════════════════════════════

        "pharmacokinetics": "How the BODY handles a drug — Absorption, Distribution, Metabolism, and Excretion (ADME). Determines the drug's concentration-time profile in the blood and tissues.",
        "pharmacodynamics": "How the DRUG affects the body — mechanisms and effects at the drug's target site. Includes receptor binding, dose-response relationships, and therapeutic and toxic effects.",
        "bioavailability": "The fraction of an administered dose that reaches systemic circulation unchanged and is available to exert its effect. IV = 100% by definition. Oral bioavailability is reduced by incomplete absorption and/or first-pass metabolism.",
        "first-pass effect": "Significant metabolism of an orally administered drug by the liver or gut wall before it reaches systemic circulation, substantially reducing bioavailability. This is why oral doses are often much higher than equivalent IV doses (e.g., morphine: IV 10 mg ≈ oral 30 mg).",
        "half-life": "The time required for the plasma drug concentration to decrease by 50%. Determines dosing frequency and time to steady state (4–5 half-lives). Drugs with short half-lives (e.g., albuterol, regular insulin) require more frequent dosing than drugs with long half-lives (e.g., amiodarone, levothyroxine).",
        "steady state": "The condition reached when drug administration rate equals elimination rate, resulting in a relatively constant average plasma concentration. Achieved after approximately 4–5 half-lives. Before steady state, drug concentrations are changing significantly with each dose.",
        "therapeutic index": "The ratio of the toxic dose to the effective dose (TD50/ED50). Drugs with a narrow (low) therapeutic index have little margin between effective and toxic doses — require careful dosing, monitoring, and patient education. Examples: warfarin, digoxin, lithium, phenytoin, aminoglycosides, vancomycin, cyclosporine.",
        "CYP450": "Cytochrome P450 — a superfamily of liver (and gut) enzymes responsible for metabolizing the majority of drugs. Key enzymes: CYP3A4 (most abundant, metabolizes ~50% of drugs), CYP2D6, CYP2C9, CYP2C19. Drug interactions arise when one drug inhibits (raises levels of another) or induces (lowers levels) CYP enzymes.",
        "enzyme inhibitor": "A drug that blocks a CYP450 enzyme, causing accumulation of other drugs metabolized by that enzyme. Example: fluconazole inhibits CYP3A4 and CYP2C9, dramatically increasing warfarin levels and INR. Grapefruit juice inhibits intestinal CYP3A4.",
        "enzyme inducer": "A drug that increases CYP450 enzyme activity, causing faster metabolism and reduced levels of co-administered drugs. Example: rifampin is the most potent CYP inducer — lowers levels of many drugs including warfarin, oral contraceptives, and HIV medications. Carbamazepine, phenytoin, and St. John's Wort are other common inducers.",
        "protein binding": "The reversible binding of a drug to plasma proteins, primarily albumin. Only the unbound (free) fraction is pharmacologically active and available for elimination. Highly protein-bound drugs (warfarin, phenytoin) can have clinically significant interactions when displaced by other drugs.",
        "volume of distribution": "Vd — a theoretical volume that describes how extensively a drug distributes throughout body tissues relative to blood. High Vd = drug distributes widely into tissues (e.g., amiodarone: Vd > 60 L/kg); Low Vd = drug stays mostly in blood (e.g., warfarin: Vd ~0.14 L/kg). Affects loading dose calculations.",
        "bioequivalence": "Two drug products are bioequivalent if they deliver the same amount of active ingredient at the same rate of absorption (Cmax and AUC within ± 20%). FDA requires bioequivalence for ANDA approval of generic drugs. AB-rated generics in the Orange Book are bioequivalent to the reference brand.",
    ]

    // MARK: - Matching

    /// Scans the provided text and returns all glossary terms found, sorted alphabetically.
    /// Uses word-boundary regex matching to avoid partial-word false positives.
    static func matches(in text: String) -> [(term: String, definition: String)] {
        terms
            .filter { term, _ in
                let pattern = "\\b\(NSRegularExpression.escapedPattern(for: term))\\b"
                return text.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
            }
            .sorted { $0.key < $1.key }
            .map { (term: $0.key, definition: $0.value) }
    }
}

// MARK: - Glossary Panel

struct GlossaryPanel: View {
    let terms: [(term: String, definition: String)]
    let color: Color
    @State private var expanded = false
    @Environment(\.appTheme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // ── Toggle header ────────────────────────────────────────────────────
            Button {
                withAnimation(.easeInOut(duration: 0.22)) { expanded.toggle() }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 11))
                    Text("// TERMINOLOGY")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                    Text("— \(terms.count) term\(terms.count == 1 ? "" : "s") found")
                        .font(.system(size: 9, design: .monospaced))
                        .foregroundColor(color.opacity(0.55))
                    Spacer()
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 9, weight: .semibold))
                }
                .foregroundColor(color.opacity(0.80))
                .padding(.horizontal, 12)
                .padding(.vertical, 9)
                .background(color.opacity(0.07))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color.opacity(0.28), lineWidth: 1)
                )
                .cornerRadius(8)
            }
            .buttonStyle(.plain)

            // ── Expanded definitions ─────────────────────────────────────────────
            if expanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(Array(terms.enumerated()), id: \.element.term) { idx, item in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.term.uppercased())
                                .font(.system(size: 10, weight: .black, design: .monospaced))
                                .foregroundColor(color)
                                .shadow(color: color.opacity(theme.isDark ? 0.5 : 0), radius: 3)
                            Text(item.definition)
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundColor(theme.primaryText.opacity(0.80))
                                .fixedSize(horizontal: false, vertical: true)
                                .lineSpacing(3)
                        }
                        .padding(.vertical, 11)
                        .padding(.horizontal, 12)

                        if idx < terms.count - 1 {
                            Rectangle()
                                .fill(color.opacity(0.12))
                                .frame(height: 1)
                                .padding(.horizontal, 12)
                        }
                    }
                }
                .background(color.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color.opacity(0.22), lineWidth: 1)
                )
                .cornerRadius(8)
                .padding(.top, 4)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
}
