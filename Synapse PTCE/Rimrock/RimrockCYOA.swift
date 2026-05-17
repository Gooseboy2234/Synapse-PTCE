//
//  RimrockCYOA.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Choose-Your-Own-Adventure decision points spliced into the linear shift arc.
//  Each is a single `.choice` beat whose wrong branches lead to `.ending(...)`
//  beats — terminal endings end the day (Restart Shift), recoverable endings
//  cost rapport but let the shift continue. Each ending teaches the PTCE rule
//  the wrong path violates: the bad path IS the lesson.
//

import Foundation

enum RimrockCYOA {

    // MARK: - Day 1 — Fridge log (RECOVERABLE)

    /// Splice AFTER Mara's "fridge log first" instruction, BEFORE .uspFridgeTemp.
    /// Skipping the cold-chain log on a real first day is a low-stakes habit error
    /// — Mara catches it on the radio before it matters.
    static let day1_fridgeLogSkip: RimrockBeat = .choice(
        prompt: "Fridge log clipboard hangs by the med fridge.",
        choices: [
            RimrockChoice(
                label: "Read the thermometer, log temp + time + initials.",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Good. Habit is 90% of this job. The other 10% is what we're about to teach you."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Skip it for now — start the queue, log it later.",
                tone: .neutral, rapportDelta: -1,
                response: [
                    .scene("You leave the clipboard hanging. Walk over to the queue."),
                    .ending(RimrockEnding(
                        kind: .recoverable,
                        title: "Mara catches it on the radio.",
                        body: "\"Hey. Fridge log first, before the queue. I know it feels like nothing — but the day you skip it is the day the compressor fails overnight and you don't notice until the insulin is room temperature. Twice a day, every day. Initials and time. Go.\" Mara's not angry. Just firm. You walk back to the fridge.",
                        ptceLesson: "USP <797> / cold-chain monitoring: refrigerated medication storage between 2°C–8°C (36°F–46°F), monitored and logged at minimum twice per shift. Frozen products at -25°C to -10°C. Out-of-range events require immediate documentation and stability assessment. The log is the legal record."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 2 — Pseudoephedrine sale (TERMINAL CRIMINAL)

    /// Splice AFTER .day2_pseudoephedrineLimit question. A walk-in tests whether
    /// the player applies what they just learned about CMEA limits.
    static let day2_pseudoephedrineSale: RimrockBeat = .choice(
        prompt: "10:43. A man at the front counter, work boots, hood up. \"Need Sudafed. Three boxes. The big size — 60 mg, 24 count.\"",
        choices: [
            RimrockChoice(
                label: "\"One box is the limit per day under federal law. ID, please.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .scene("You ask for ID. He hesitates, hands over a Wyoming license. You scan into NPLEx. The system clears one box — 1.44 g of pseudoephedrine. He grumbles. He pays. He leaves. You sign the log."),
                    .dialogue(speaker: .mara, lines: [
                        "Three at once is a flag, not a sale. He'll come back tomorrow if it's a real cold."
                    ])
                ]
            ),
            RimrockChoice(
                label: "\"Three boxes is over the federal limit — let me check with the pharmacist.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Already heard. Tell him one box, federal law, no exceptions. CMEA. Combat Methamphetamine Epidemic Act, 2005.",
                        "If he pushes, tell him the limit's federal — same in every pharmacy in the country. He'll move on."
                    ]),
                    .scene("You repeat it back. He swears under his breath, takes one box, pays cash, leaves.")
                ]
            ),
            RimrockChoice(
                label: "Scan all three. He looks tired. Just decongestant.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("Three boxes. 4.32 g of pseudoephedrine in one transaction. The NPLEx system flashes RED — over federal daily limit. You override the warning. Sale completes. He leaves with the bag."),
                    .scene("Three weeks later, two DEA agents are at the front door. They have your override signature, your initials, the timestamp, and a probable-cause warrant for the surveillance footage. They know exactly what they're looking for."),
                    .ending(RimrockEnding(
                        kind: .criminal,
                        title: "CMEA Violation — Federal Charge",
                        body: "Your override pushed the store onto a regional pattern flag. The customer was a runner buying for a meth cook in Casper. State investigators audit the NPLEx logs. Your override is documented, signed under your initials. Mara is named as PIC. The pharmacy keeps its license; you don't. The criminal complaint goes to a U.S. Attorney's discretion — typically a misdemeanor for first offense, but it stays on your record for life.",
                        ptceLesson: "CMEA (Combat Methamphetamine Epidemic Act of 2005): pseudoephedrine, ephedrine, and phenylpropanolamine are limited to 3.6 g per customer per day and 9 g per 30 days. Photo ID required, signed log retained for 2 years, NPLEx (electronic logging) mandatory in most states. Behind-the-counter only. NEVER override the limit — the limit IS the law. Customer doesn't need it. The cooks do."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 3 — C-II refill phone request (TERMINAL LICENSE)

    /// Splice into Day 3 mid-day, after the Caleb hydrocodone walk-in. A patient
    /// calls asking for a "refill" on a Schedule II — federal prohibition.
    static let day3_ciiRefillPhone: RimrockBeat = .choice(
        prompt: "11:35. Phone rings, not even an hour after Caleb left with the bag. Caller: \"Hi — it's Caleb. Look, I dropped a few of those tablets down the sink. Can you just refill it real quick? I'll come pick it up.\"",
        choices: [
            RimrockChoice(
                label: "\"Schedule II can't be refilled. You'd need a new prescription from Dr. Boateng.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Right. C-II — no refills, period. Even if the original Rx says \"refill x 5,\" it's invalid; only C-III through V can carry refills, max 5 within 6 months.",
                        "Tell him to call Boateng's office. They can call in a follow-up Rx by phone for a non-emergency C-II only with a written follow-up within 7 days. Most surgeons just want him to come back in."
                    ]),
                    .scene("You explain. He sighs. Hangs up. He'll figure out it's not your call.")
                ]
            ),
            RimrockChoice(
                label: "\"Hold one second — let me check with the pharmacist.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Tell him no. C-II, no refills, federal. The original script was zero refills — that's not the prescriber forgetting, that's federal law. Boateng would know that. If he wants Caleb to have more, Boateng has to write a new Rx.",
                        "Caleb might not know the rule. That's fine. Tell him kindly."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Process the refill — the original Rx had refills coded.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You enter the refill. The system flags HIGH-RISK / CONTROLLED REFILL but lets it through with a pharmacist override prompt. You override under Mara's stored credentials, which the system has done before."),
                    .scene("Two weeks later the state board audit lands at Rimrock. The DEA cross-referenced refill logs against original prescription quantities for C-IIs across the state. Three illegal refills are flagged — yours is the most recent."),
                    .ending(RimrockEnding(
                        kind: .licenseRevoked,
                        title: "State Board Action.",
                        body: "Refilling a Schedule II is a federal violation under the Controlled Substances Act, regardless of how the original prescription was written. The state board issues a notice of disciplinary action against your tech registration. Mara's PIC license takes a public reprimand for inadequate supervision. The pharmacy receives a $25,000 administrative fine. Your registration is suspended pending hearing — practically, you can't work as a pharmacy tech anywhere in the state.",
                        ptceLesson: "CSA Schedule II prohibition: NO REFILLS, ever, on any C-II prescription. CFR 21 §1306.12. Each fill requires a NEW prescription. C-III–V allow up to 5 refills within 6 months from issue date. Schedule II partial fills are permitted (CARA 2016) but the remaining quantity must be filled within 30 days from the original Rx — it is not a \"refill,\" it is the same prescription completed."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 6 — Sulfa allergy override (TERMINAL PATIENT HARM)

    /// Splice AFTER .day6_sulfaAllergy question, BEFORE Mara's "Don't fill" line.
    /// The wrong path: tech overrides the DUR and dispenses — patient is harmed.
    static let day6_sulfaOverride: RimrockBeat = .choice(
        prompt: "DUR alert is still on screen. ALLERGY ALERT — SULFA. The system asks: OVERRIDE? Y/N",
        choices: [
            RimrockChoice(
                label: "N. Hold the prescription. Page the pharmacist for action.",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Right. Tech doesn't override DUR alerts — pharmacist clinical judgment. Hold for me. We call the prescriber together."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Y. The allergy was rash and hives in 2018. He'll probably be fine.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You override. Print label. Count, verify, bag. Henry Allen picks up at noon. He takes the first Bactrim that afternoon."),
                    .scene("By 6:30 PM he's in the Sheridan ER. Stevens-Johnson syndrome — the rash he had in 2018 was the warning shot, not the worst case. Severe form: skin blistering, mucosal involvement, ICU admission. He survives. Barely."),
                    .ending(RimrockEnding(
                        kind: .patientHarmed,
                        title: "Stevens-Johnson Syndrome.",
                        body: "Sulfa allergies escalate. A 2018 rash is documentation that Henry is in the at-risk population for the severe spectrum: SJS, toxic epidermal necrolysis, fixed drug eruption. Your DUR override is in the audit log — under your initials, not Mara's. The state board investigates. Mara is named as PIC and loses her license. Henry's family files civil suit; the pharmacy's insurer settles seven figures. Henry, who survived, has scarring and chronic eye complications.",
                        ptceLesson: "DUR (Drug Utilization Review) alerts: pharmacy technicians MAY NOT override clinical alerts. Allergy alerts, drug-disease alerts, drug-drug interaction alerts — pharmacist-only review under federal regulation (OBRA-90) and state scope-of-practice law. Documented sulfa allergy means: do not dispense ANY sulfonamide (TMP-SMX, sulfasalazine, etc.) without prescriber consultation and pharmacist clinical judgment. Cross-reactivity within sulfa antimicrobials is well-documented; non-antimicrobial sulfas (HCTZ, furosemide, celecoxib) are safer but still warrant caution."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 7 — Insulin LASA (TERMINAL PATIENT HARM)

    /// Splice AFTER .day7_highAlertMed question, BEFORE Mara's "He's new" line.
    /// A second insulin Rx arrives — this one is a LASA trap (Humalog vs Humulin).
    static let day7_insulinLASA: RimrockBeat = .choice(
        prompt: "3:10. A second insulin Rx prints to the queue: \"HumaLOG 100 units/mL, 1 vial, 8 units sub-Q with meals.\" Patient: ELIAS PORTER, 71, Type 2 diabetic on the profile. Last fill three months ago: HumuLIN 70/30. The handwriting on this new Rx is rushed — could be either.",
        choices: [
            RimrockChoice(
                label: "Pull pharmacist on it. HumaLOG and HumuLIN are tall-man-lettered for a reason.",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Right. Call the prescriber. \"I have a script that reads HumaLOG 8 units with meals — patient's last fill was HumuLIN 70/30. Can you confirm?\" If they say HumaLOG, get them to fax a clean copy. If HumuLIN, have them rewrite. Don't dispense ambiguity."
                    ]),
                    .scene("You call. The doctor's MA pauses, then comes back: \"Sorry — that's HumaLOG. We're starting him on mealtime insulin in addition to the 70/30. Wait, hold — let me get her to call you.\" Hollis calls back five minutes later, confirms HumaLOG, faxes a clean rewrite. You document the verification.")
                ]
            ),
            RimrockChoice(
                label: "Dispense as written. Profile shows HumuLIN — pull HumuLIN 70/30, label as Rx.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You pull HumuLIN 70/30. Slap a label that says HumaLOG (per the script). Hand to pharmacist counter for verification — except the pharmacist is Mara on radio, not in the building, and Brett's the floater today and Brett's not paying attention."),
                    .scene("Elias picks up at 4. Takes 8 units of HumuLIN 70/30 \"with meals\" that night — three doses. The 70/30 is a long-acting basal. By 2 AM his blood glucose is 28 mg/dL. His wife finds him unresponsive on the kitchen floor."),
                    .ending(RimrockEnding(
                        kind: .patientHarmed,
                        title: "Severe Hypoglycemia.",
                        body: "Elias survives — paramedics push D50, he wakes up confused in the ER. Permanent cognitive deficit is possible but not yet known. The error was a triple failure: wrong drug pulled, label says one thing the bottle says another, no pharmacist final verification. Investigation traces back to your dispense. The state board investigates Mara for pharmacist absence during retail hours; the pharmacy faces a malpractice suit; you lose your tech registration.",
                        ptceLesson: "HIGH-ALERT medications (ISMP list): insulin, opioids, anticoagulants, chemotherapy, neuromuscular blockers, concentrated electrolytes. LASA pairs are tall-man-lettered: HumaLOG (lispro, rapid-acting) vs HumuLIN (NPH/regular, intermediate or fixed-mix). NEVER dispense ambiguous handwriting on a high-alert med — call the prescriber. ISMP: \"Use of trailing zeros (5.0) and naked decimals (.5) prohibited.\" Always dose-check against patient profile; flag any change in insulin TYPE for pharmacist review. Tech-only dispense of a high-alert med without pharmacist final verification is a scope-of-practice violation in every state."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 8 — Form 222 pre-sign (TERMINAL CRIMINAL/DEA)

    /// Splice AFTER .day8_form222Copies question. Brett (off-screen) calls in
    /// asking the player to "pre-sign" a Form 222 he'll fill out later.
    static let day8_form222PreSign: RimrockBeat = .choice(
        prompt: "12:40. Phone rings. Caller ID: HARDER, BRETT — RPh. Brett: \"Hey — I'm gonna need you to pre-sign a Form 222 for the next order. I'll fill in the line items when I'm in Friday. Just sign all three copies and leave them in the controls binder.\"",
        choices: [
            RimrockChoice(
                label: "\"I can't do that — Form 222 has to be filled out before signing.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .scene("Long silence on Brett's end. Then a click. He hung up."),
                    .dialogue(speaker: .mara, lines: [
                        "Did Brett just ask you to pre-sign a 222?",
                        "...Of course he did. Don't. Ever. We'll talk about it tomorrow."
                    ])
                ]
            ),
            RimrockChoice(
                label: "\"Hold — let me check with Mara.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "I heard him. Tell him no. Pre-signing a 222 is a federal violation — the form has to be complete before signature, supplier listed, drug listed, package size, quantity, all of it. Brett knows that. He's testing.",
                        "Tell him no. I'll deal with him."
                    ])
                ]
            ),
            RimrockChoice(
                label: "\"Sure, I'll leave them in the binder.\"",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You sign all three copies of a blank Form 222. Place them in the controls binder. Two days later Brett comes in, fills in line items for 500 oxycodone 30 mg, sends the green to a wholesaler that turns out to be a front, the product never arrives at Rimrock and your signature is on the receiving copy."),
                    .scene("Eight months later DEA agents arrive with a federal warrant. Diversion ring out of Sheridan. Your signature is on the form. Brett is the target. You are the witness — and the co-defendant."),
                    .ending(RimrockEnding(
                        kind: .criminal,
                        title: "DEA Form 222 Forgery — Federal Charge.",
                        body: "Pre-signing a DEA Form 222 is a federal felony under the Controlled Substances Act. Even though Brett filled in the line items, your signature certifies the receiving registrant — meaning you certified to the DEA that 500 oxycodone tablets entered Rimrock's inventory. They didn't. Brett's diversion ring used your signature for paper cover. You are charged with conspiracy and false statement to a federal agent. Mara's PIC license is revoked; the pharmacy is permanently closed.",
                        ptceLesson: "DEA Form 222 (paper C-II ordering) and CSOS (electronic): the form must be COMPLETE before signing. The registrant's signature certifies that the listed quantities were received. Pre-signing, signing-off-on-blank, signing-and-leaving-in-binder are federal felonies (21 USC §843). Form 222 carbon copies: white = ordering pharmacy keeps, green = supplier returns to pharmacy after fill, blue = supplier keeps. Storage: 2 years on-site, accessible to DEA on request. Lost or stolen forms reported on DEA Form 106 immediately."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 9 — Manufacturer copay coupon on Medicare (TERMINAL CRIMINAL)

    /// Splice AFTER Mara says "Do not run that coupon" — give the player agency
    /// to disobey her warning. Federal anti-kickback violation.
    static let day9_medicareCouponKickback: RimrockBeat = .choice(
        prompt: "Mara just said: \"Do not run that coupon.\" The patient is leaning over the counter. \"It says right here it's good at any pharmacy. Just run it. Save me $400.\"",
        choices: [
            RimrockChoice(
                label: "\"I'm sorry — federal law prohibits manufacturer copay coupons on Medicare. I can help you with patient-assistance programs instead.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Good. The Eliquis manufacturer can refer her to BMS Access Support — patient assistance for low-income Medicare patients. Different program, federally permitted. Different paperwork.",
                        "She'll be annoyed today. She'll be glad in two months when the paperwork goes through."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Run the coupon. The system will reject it if it's not allowed.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You run the coupon. The system processes it. Copay drops from $437 to $20. She thanks you. She leaves."),
                    .scene("Eighteen months later, Rimrock is named in a federal civil suit by the Office of Inspector General. The OIG audited a list of pharmacies that processed manufacturer coupons against Medicare Part D claims. Yours is on it."),
                    .ending(RimrockEnding(
                        kind: .criminal,
                        title: "Federal Anti-Kickback Statute Violation.",
                        body: "Manufacturer copay assistance applied against a Medicare Part D claim is a federal Anti-Kickback Statute violation (42 USC §1320a-7b). The OIG can pursue civil monetary penalties up to $50,000 per violation, exclusion from federal healthcare programs, and criminal referral. Rimrock loses its Medicare Part D contract — which is roughly 60% of its revenue. The pharmacy closes within four months. Mara loses her PIC license. Your tech registration is revoked under the federal exclusion list — you cannot work in any pharmacy that bills federal programs, anywhere in the country.",
                        ptceLesson: "Anti-Kickback Statute (AKS) and Civil Monetary Penalties Law: manufacturer copay coupons MAY NOT be applied to claims billed to federal healthcare programs (Medicare, Medicaid, TRICARE, VA). Doing so is a felony — \"kickback\" because it induces federally-reimbursed prescription utilization. Permitted: pharmacy-run patient-assistance programs, manufacturer PAP for underinsured patients (different federal pathway). Always check the patient's insurance type BEFORE running any coupon. Federal beneficiaries: NO copay cards. Commercial insurance: yes."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 11 — HIPAA leak to spouse (RECOVERABLE)

    /// Splice AFTER the Vollmer husband phone call, AFTER .day11_hipaaPHI question.
    /// Set up: husband sounds frustrated. Tech can leak details — Mara catches it.
    static let day11_hipaaSpouseLeak: RimrockBeat = .choice(
        prompt: "Husband on the line is starting to push: \"Look, I just want to know if it's the same diabetes pill she usually gets. I'm picking it up — I just want to know it's right.\"",
        choices: [
            RimrockChoice(
                label: "\"I understand — but without authorization on file, I can only confirm that her prescription is ready for pickup.\"",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Good. Stand on it. Most people accept it once you say it firmly. The ones who don't aren't worth the privacy violation."
                    ]),
                    .scene("He grunts, takes it, hangs up.")
                ]
            ),
            RimrockChoice(
                label: "\"It's the metformin — same one as last month, 1000 mg twice daily.\"",
                tone: .neutral, rapportDelta: -1,
                response: [
                    .scene("You said it before you thought about it. The husband thanks you and hangs up."),
                    .ending(RimrockEnding(
                        kind: .recoverable,
                        title: "Mara catches it before it reaches paper.",
                        body: "\"Stop. You just told a man what his wife is on without authorization. We don't know that's her husband. We don't know she wants him to know. That's a HIPAA breach — minor in this case because it's almost certainly her husband, but minor breaches make major board complaints. Document the disclosure in her chart, flag it for me, and we'll figure out whether to call her tonight. Don't beat yourself up — but don't do it again. Married, divorcing, separated, abusive, controlling — we don't know. We only release what TPO covers, and \"what's in the bag\" is not TPO.\" You document the slip. Mara's not angry. She's calibrating you.",
                        ptceLesson: "HIPAA Privacy Rule (45 CFR Part 164): PHI may be released without authorization for TPO — Treatment, Payment, healthcare Operations. Pickup by family/friend is permitted under TPO if reasonable for the patient's care. BUT: drug name, diagnosis, dose, prescriber identity are not \"pickup\" — they require written authorization OR the patient's verbal authorization confirmed in real time. \"I'm her husband\" is not authorization. Minimum-necessary rule applies. Document any disclosure. NPP (Notice of Privacy Practices) explains the rules to patients. Breach of unsecured PHI for >500 records: must notify HHS, the affected individuals, and the media within 60 days."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 13 — DDI override (RECOVERABLE)

    /// Splice into Day 13 mid-day. Player has built tech confidence — tempts them
    /// to override a DUR alert without pharmacist sign-off. Mara catches it.
    static let day13_durOverride: RimrockBeat = .choice(
        prompt: "Queue: a clarithromycin Rx for Margaret Thiel — already on simvastatin 40 mg. The DUR fires: MAJOR INTERACTION — STATIN + STRONG CYP3A4 INHIBITOR — RISK OF RHABDOMYOLYSIS. The system asks: REVIEW? Y/N",
        choices: [
            RimrockChoice(
                label: "Hold the Rx. Page Mara to review the alert.",
                tone: .stoic, rapportDelta: 1,
                response: [
                    .dialogue(speaker: .mara, lines: [
                        "Good. Clarithromycin and simvastatin — strong CYP3A4 inhibitor plus a statin that's almost entirely metabolized by 3A4. Levels go up 10-fold; rhabdo risk is real. Call her doctor. Either swap the antibiotic — azithromycin doesn't hit 3A4 — or hold the simvastatin for the antibiotic course. Document the call."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Override the alert — she's only on it for 7 days, probably fine.",
                tone: .neutral, rapportDelta: -1,
                response: [
                    .ending(RimrockEnding(
                        kind: .recoverable,
                        title: "Mara picks it up off the screen.",
                        body: "\"Reverse that override, please. Tech doesn't override DUR alerts — pharmacist call. And this one isn't a stretch — clarithromycin and simvastatin is a 10x AUC change on the statin. The rhabdo cases land in the ICU. \"Probably fine\" is what we say in retrospect about the ones we got lucky on. Reverse, hold for me, I'll call Hollis.\" You reverse. Mara calls. Hollis swaps to azithromycin without complaint. The patient never knows there was a problem.",
                        ptceLesson: "Drug-drug interactions (DDI) — major CYP3A4 substrate-inhibitor pairs: simvastatin/atorvastatin + clarithromycin/erythromycin/itraconazole/ritonavir → rhabdomyolysis. Warfarin + amiodarone/Bactrim/metronidazole → bleeding. Methotrexate + NSAIDs → toxicity. Tech scope: identify the alert, hold the Rx, escalate to pharmacist. NEVER override a clinical DUR alert under tech credentials. OBRA-90 mandates DUR review by pharmacist for Medicaid; commercial insurance follows similar standards. Document every override decision in patient profile."
                    ))
                ]
            )
        ]
    )

    // MARK: - Day 17 — Brett's CII count "round-up" (TERMINAL CRIMINAL)

    /// Splice into Day 17. Brett shows up in person to do the C-II count and
    /// pressures the player to round a discrepancy. The Wren subplot reveals
    /// Brett has been pinching from the safe — this is the cover request.
    static let day17_brettCountRoundUp: RimrockBeat = .choice(
        prompt: "11:30. Brett is in the back doing the cycle count. He sets the binder down, taps the oxycodone 30 mg page. \"I've got 124, perpetual says 130. We're six short. Just initial it as 130 — I'll figure out where they went later. Cover for me.\"",
        choices: [
            RimrockChoice(
                label: "\"I can't initial a count that's wrong. We have to document the discrepancy.\"",
                tone: .stoic, rapportDelta: 2,
                response: [
                    .dialogue(speaker: .named("BRETT"), lines: [
                        "Christ — kid. It's six tablets. Don't make this a thing.",
                        "...Fine. I'll figure it out."
                    ]),
                    .scene("Brett walks out without finishing the count. Twenty minutes later you hear Mara's voice on the radio, very level."),
                    .dialogue(speaker: .mara, lines: [
                        "...Did Brett just ask you to round a CII count?",
                        "Document what he asked. Verbatim. Time and date. I'll handle it from here. Thank you for not signing.",
                        "I'm sorry he put you in that position."
                    ])
                ]
            ),
            RimrockChoice(
                label: "\"Six tablets is a discrepancy — that needs to be reported on a Form 106.\"",
                tone: .stoic, rapportDelta: 2,
                response: [
                    .dialogue(speaker: .named("BRETT"), lines: [
                        "...alright. Forget I asked.",
                        "Don't tell Mara about this conversation."
                    ]),
                    .scene("You finish your shift. You tell Mara that evening. She is quiet for a long time on the radio."),
                    .dialogue(speaker: .mara, lines: [
                        "Thank you. I'll handle it. You did exactly the right thing."
                    ])
                ]
            ),
            RimrockChoice(
                label: "Initial it. Brett's the pharmacist; if he says it's fine, it's fine.",
                tone: .neutral, rapportDelta: -3,
                response: [
                    .scene("You initial it as 130. Brett initials below you. The discrepancy is buried."),
                    .scene("Two months later the DEA cycle audit cross-references Rimrock's controls against the wholesaler's shipping logs. Eighty-four oxycodone 30 mg are unaccounted-for over four months. Your initials are on three rounded counts. Brett's are on four."),
                    .ending(RimrockEnding(
                        kind: .criminal,
                        title: "DEA Diversion Investigation — Conspiracy Charge.",
                        body: "Falsifying a perpetual inventory record for a Schedule II is a federal felony. The DEA traces 84 oxycodone tablets diverted from Rimrock's safe to Brett's personal use over four months. Your initials on three rounded counts make you a co-conspirator. Brett pleads to a federal felony; you are charged as an accessory and offered a plea to a misdemeanor in exchange for testimony. Mara's PIC license is permanently revoked. Rimrock closes. The pharmacy building goes back to the bank.",
                        ptceLesson: "Perpetual inventory and CII discrepancy reporting: every C-II transaction (in or out) must be logged immediately, reconciled against physical count at minimum biennially (more often by best practice). ANY discrepancy must be investigated; theft or significant loss of a controlled substance requires DEA Form 106 filing within ONE BUSINESS DAY. Falsifying a count to cover a discrepancy is a federal felony under 21 USC §842/843. \"Just round it\" is the most common diversion-coverage request in retail pharmacy. The honest answer is always \"document the variance, file the 106 if warranted, escalate to PIC.\""
                    ))
                ]
            )
        ]
    )
}
