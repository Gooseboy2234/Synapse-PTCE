//
//  RimrockPracticeMode.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  After Day 35, the curated narrative arc gives way to OPEN-ENDED PRACTICE
//  SHIFTS. The generator pulls from the full ~1080-question DataNode bank,
//  guarantees every question is hit at least TWICE with at least 4-shift
//  spacing between exposures, and wraps each pull in light Rimrock narrative
//  scaffolding so the experience still feels like a shift, not a quiz.
//
//  Coverage rule: a question is "verified" when exposureCount >= 2. The
//  generator prioritises (1) re-exposures that have aged ≥4 shifts, (2)
//  brand-new questions, then (3) least-recently-seen as filler. Player can
//  keep playing past full coverage — additional shifts cycle the bank for
//  reinforcement.
//

import Foundation
import SwiftData

// MARK: - Exposure record

@Model
final class QuestionExposure {

    /// `DataNode.id.uuidString` — the unique node this record tracks.
    @Attribute(.unique) var nodeIDString: String

    /// Calendar timestamp of the most recent exposure.
    var lastSeenAt: Date

    /// Practice-shift index of the most recent exposure (1-based, increments
    /// per practice shift completed). Drives in-shift spacing even when the
    /// player binges multiple shifts in one calendar day.
    var lastSeenShift: Int

    /// How many times the player has answered this question.
    var exposureCount: Int

    /// Most recent answer correctness.
    var lastWasCorrect: Bool

    init(nodeID: UUID, sessionShift: Int, wasCorrect: Bool) {
        self.nodeIDString = nodeID.uuidString
        self.lastSeenAt = .now
        self.lastSeenShift = sessionShift
        self.exposureCount = 1
        self.lastWasCorrect = wasCorrect
    }
}

// MARK: - DataNode → RimrockQuestion conversion

extension DataNode {

    /// Wraps this DataNode as a RimrockQuestion for use in generated practice
    /// shifts. The question's `id` is prefixed `DN_` so RimrockShiftView can
    /// route exposure recording back to the originating DataNode.
    func asRimrockPracticeQuestion() -> RimrockQuestion {
        // Use loreText as the prompt body; nodeTitle becomes the topic tag.
        let prompt: String = {
            if !questionText.isEmpty { return questionText }
            // Strip trailing period to keep sentence flow when prepended with "."
            let lore = loreText.trimmingCharacters(in: .whitespacesAndNewlines)
            return lore.isEmpty
                ? "Pick the correct answer for \(nodeTitle)."
                : lore
        }()

        return RimrockQuestion(
            id: "DN_\(id.uuidString)",
            domain: domain.rimrockDomain,
            topic: baseConceptTitle ?? nodeTitle,
            prompt: prompt,
            options: options,
            correctAnswer: correctAnswer,
            onCorrect: RimrockPracticeGenerator.maraAffirm.randomElement() ?? "Right.",
            onWrong: RimrockPracticeGenerator.maraCorrect.randomElement() ?? "Look at it again."
        )
    }
}

// MARK: - Generator

enum RimrockPracticeGenerator {

    /// How many questions per generated shift.
    static let questionsPerShift = 10

    /// Minimum number of practice shifts between first and second exposure of
    /// the same question — the spacing window the player is verified across.
    static let reExposureSpacingShifts = 4

    /// First synthetic day number — anchored after the curated content.
    static let firstPracticeDay = 36

    // MARK: - Mara line pools

    /// Short affirmation when the player answered correctly. Picked at random.
    static let maraAffirm: [String] = [
        "Right.",
        "Good. Move on.",
        "Yep.",
        "That's it.",
        "Mm-hm.",
        "Clean.",
        "Correct.",
        "Alright. Next.",
        "Solid.",
        "Yeah, exactly that.",
        "Sharp.",
        "Locked in.",
        "Good catch.",
        "That's the one.",
        "There we go.",
        "Knew you had it.",
        "Quick. Good.",
        "Confidence sounds right on you.",
        "Yeah, that's instinct now.",
        "Done. Next one."
    ]

    /// Short correction line for wrong answers — leans on the lore for nuance,
    /// but stays Mara-voiced and not preachy.
    static let maraCorrect: [String] = [
        "Look at it again.",
        "Hmm. Read the body of the question one more time.",
        "Not quite. The lore tells you which one.",
        "No — the right one's hiding in the second sentence of the stem.",
        "Off by one. The detail you missed is in the explanation.",
        "Try the next-most-obvious answer. That's usually it.",
        "Nope. The correct one is the answer that mentions the mechanism explicitly.",
        "Reread carefully — the question gives you the answer.",
        "That's the trap option. The right one is more specific.",
        "Close. The detail you skipped is the timing clause.",
        "Slow down. The qualifier in the prompt eliminates two of the options.",
        "That's the look-alike answer. Real one shares the suffix, not the prefix.",
        "Read the verb. The right answer matches the action, not the noun.",
        "You're picking the obvious one. The PTCB likes one rule deeper.",
        "No — that answer is true for a related drug but not this one.",
        "Nope. You skimmed the unit. The dose is in milligrams, not micrograms.",
        "Close, but that's the brand pair, not the generic.",
        "That's safe-sounding. The right one is technically correct.",
        "Wrong route. The question said by mouth, the answer you picked is IV.",
        "You got the class right but the specific drug wrong. Reread the indication."
    ]

    // MARK: - Opening templates

    private struct OpeningTemplate {
        let title: String
        let dateLine: String
        let timeLine: String
        let beats: [RimrockBeat]
    }

    private static let openings: [OpeningTemplate] = [
        OpeningTemplate(
            title: "A Slow Tuesday",
            dateLine: "Tuesday",
            timeLine: "8:30 AM",
            beats: [
                .scene("Bell. Coffee. Fridge log. The queue is calm — the kind of morning that lets you think between calls."),
                .dialogue(speaker: .mara, lines: [
                    "Morning. We've got runway today. Run questions in the gaps; I'll catch you if you drift."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Insurance Hell Wednesday",
            dateLine: "Wednesday",
            timeLine: "9:14 AM",
            beats: [
                .scene("Wednesday. Six rejections in the queue, four of them the same NDC complaint. Coffee's already cold."),
                .dialogue(speaker: .mara, lines: [
                    "Welcome to the day insurance pretends NDCs changed overnight. Work the queue and let me drill you between rejections."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Friday Rush",
            dateLine: "Friday",
            timeLine: "8:42 AM",
            beats: [
                .scene("Payday Friday. The phone is already ringing when you unlock. Coffee, fridge log, queue, and brace."),
                .dialogue(speaker: .mara, lines: [
                    "Brace yourself. Drill the safety stuff hard today — you're going to need it."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Quiet Saturday",
            dateLine: "Saturday",
            timeLine: "10:08 AM",
            beats: [
                .scene("Saturday opens late. The Bighorns are clear. Maybe two scripts in the queue."),
                .dialogue(speaker: .mara, lines: [
                    "Slow shift. We'll grind concepts. Less retail, more book."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Monday Catch-Up",
            dateLine: "Monday",
            timeLine: "8:38 AM",
            beats: [
                .scene("Monday. Weekend pile in the night drop, voicemails on the line. Coffee. Fridge log. Triage."),
                .dialogue(speaker: .mara, lines: [
                    "Mondays earn their reputation. Pull the queue, work it down, and we'll review as we go."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Cold Morning",
            dateLine: "Thursday",
            timeLine: "8:15 AM",
            beats: [
                .scene("Frost on the windows. Fridge log first — the compressor groaned twice last night."),
                .dialogue(speaker: .mara, lines: [
                    "Read me the temp before anything else. Then we run drills until the queue wakes up."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Post-Holiday Catch-Up",
            dateLine: "Tuesday",
            timeLine: "9:02 AM",
            beats: [
                .scene("First day open after a long weekend. The night drop is overflowing, mostly refills, mostly easy."),
                .dialogue(speaker: .mara, lines: [
                    "We'll work through it together. Knock out the questions between fills."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Half-Day Setup",
            dateLine: "Wednesday",
            timeLine: "11:30 AM",
            beats: [
                .scene("You're opening at noon today. Took the morning slow. Coffee on the burner is fresh."),
                .dialogue(speaker: .mara, lines: [
                    "Half-day. We'll pace it accordingly. Drill mode."
                ])
            ]
        ),
        // ── Seasonal & weather variations ──────────────────────────────────
        OpeningTemplate(
            title: "First Snow",
            dateLine: "Thursday",
            timeLine: "8:22 AM",
            beats: [
                .scene("Two inches overnight, still falling. Half the parking lot is footprints. Heater's already humming."),
                .dialogue(speaker: .mara, lines: [
                    "Snow days slow the queue but spike the calls. Drill while you can."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Late August Heat",
            dateLine: "Tuesday",
            timeLine: "8:12 AM",
            beats: [
                .scene("Already 78 outside, supposed to top out near 100. Counter AC labors. You can hear it."),
                .dialogue(speaker: .mara, lines: [
                    "Heat days, fridge logs twice. Compounds drift fast. Then we drill."
                ])
            ]
        ),
        OpeningTemplate(
            title: "October Cold Snap",
            dateLine: "Monday",
            timeLine: "8:45 AM",
            beats: [
                .scene("Pumpkin frost on the back step. The bell sticks when the metal contracts overnight — give it a shove."),
                .dialogue(speaker: .mara, lines: [
                    "Mountains got their first dusting. Flu shot questions are coming. Run the immunization drills."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Spring Thaw",
            dateLine: "Wednesday",
            timeLine: "8:05 AM",
            beats: [
                .scene("Mud season's started. Half the boots tracked through here are caked. The mat's permanently brown until June."),
                .dialogue(speaker: .mara, lines: [
                    "Allergy season ramps. Antihistamine questions today — pick the right generation."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Christmas Eve Half-Day",
            dateLine: "Thursday",
            timeLine: "9:30 AM",
            beats: [
                .scene("Closing at one. Pre-holiday rush already underway — refills three weeks out, everybody at once."),
                .dialogue(speaker: .mara, lines: [
                    "Tight day. Take the bench. We'll drill in three-question bursts between fills."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Day After Christmas",
            dateLine: "Monday",
            timeLine: "10:00 AM",
            beats: [
                .scene("Lobby's empty. Most folks still home with family. Tray of leftover cookies on the counter from Mrs. Henley."),
                .dialogue(speaker: .mara, lines: [
                    "Slowest day of the year. Don't waste it — we drill hard."
                ])
            ]
        ),
        OpeningTemplate(
            title: "New Year's Eve",
            dateLine: "Tuesday",
            timeLine: "8:30 AM",
            beats: [
                .scene("Last day of the year. Patients picking up early so they don't run out over the long weekend."),
                .dialogue(speaker: .mara, lines: [
                    "Year ends today. We end it with you sharper than you started."
                ])
            ]
        ),
        // ── Character cameos ─────────────────────────────────────────────
        OpeningTemplate(
            title: "Theo Drops Off",
            dateLine: "Wednesday",
            timeLine: "9:00 AM",
            beats: [
                .scene("Theo's wholesaler truck pulls up at the back. Three totes plus the C-II safe key swap. Sign and stack while he waits."),
                .dialogue(speaker: .mara, lines: [
                    "Theo's order day. While you log the C-IIs, walk me through the federal questions."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Mrs. Henley Calls Early",
            dateLine: "Friday",
            timeLine: "8:20 AM",
            beats: [
                .scene("Phone's ringing before you've finished the fridge log. Caller ID says HENLEY. She knows the routine."),
                .dialogue(speaker: .mara, lines: [
                    "Take her call, then we drill. She's the one who'll keep you sharp on chronic-care anyway."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Beans Has Opinions",
            dateLine: "Saturday",
            timeLine: "10:30 AM",
            beats: [
                .scene("You can hear Beans barking through the radio. Mara mutes for a beat, comes back."),
                .dialogue(speaker: .mara, lines: [
                    "Beans wants out. I'm pretending I don't hear him. Hit me with the safety set."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Pastor Stops By",
            dateLine: "Tuesday",
            timeLine: "9:45 AM",
            beats: [
                .scene("Pastor Doreen ducks in with a coffee cake for the counter. Won't take payment for anything."),
                .dialogue(speaker: .mara, lines: [
                    "She'll be back for her metformin in an hour. Drill while you wait."
                ])
            ]
        ),
        // ── Atmosphere & pacing ──────────────────────────────────────────
        OpeningTemplate(
            title: "Lightning Storm",
            dateLine: "Wednesday",
            timeLine: "1:18 PM",
            beats: [
                .scene("Storm rolled in over the Bighorns at noon. Lights flicker but hold. UPS is doing the work the line should."),
                .dialogue(speaker: .mara, lines: [
                    "If power drops, the C-II safe stays sealed and we go manual. Until then — drill."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Quiet Sunday",
            dateLine: "Sunday",
            timeLine: "11:00 AM",
            beats: [
                .scene("Open for emergency fills only. The town's at church. Three scripts in the queue, all easy."),
                .dialogue(speaker: .mara, lines: [
                    "Sundays we breathe. We also study. Run the set."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Rodeo Weekend",
            dateLine: "Friday",
            timeLine: "8:30 AM",
            beats: [
                .scene("Buffalo's hosting the rodeo. Traffic on Main is doubled. Half the patients are from out of town with vacation supplies running low."),
                .dialogue(speaker: .mara, lines: [
                    "Out-of-town transfers all weekend. Drill the order-entry rules — you'll use every one."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Smoke from the West",
            dateLine: "Wednesday",
            timeLine: "8:40 AM",
            beats: [
                .scene("Wildfire smoke hanging in the valley. Sun's pink at eye level. Inhaler refills up sharply this week."),
                .dialogue(speaker: .mara, lines: [
                    "Air quality means rescue inhalers and steroid bursts. Walk me through the respiratory set."
                ])
            ]
        ),
        OpeningTemplate(
            title: "End of Pay Period",
            dateLine: "Friday",
            timeLine: "8:55 AM",
            beats: [
                .scene("Last Friday of the pay period. The DIR fees are due. Mara hates this day."),
                .dialogue(speaker: .mara, lines: [
                    "Paperwork day for me. Drilling day for you. Stay on the bench."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Inventory Eve",
            dateLine: "Thursday",
            timeLine: "9:10 AM",
            beats: [
                .scene("Annual inventory tomorrow. C-II count tonight, perpetual reconcile-check today. The bin labels are crooked again."),
                .dialogue(speaker: .mara, lines: [
                    "While you're counting in your head, count out loud through the federal drills."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Mock Inspection",
            dateLine: "Tuesday",
            timeLine: "8:00 AM",
            beats: [
                .scene("Hollis sent over the inspector's mock checklist. Twelve pages, half of them USP 795."),
                .dialogue(speaker: .mara, lines: [
                    "Mock board inspection prep today. Sterile and safety drills all day. Don't fight me on it."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Sunday Morning Quiet",
            dateLine: "Sunday",
            timeLine: "9:30 AM",
            beats: [
                .scene("Sky's gunmetal grey. Nobody in the parking lot. You set the heater up two clicks."),
                .dialogue(speaker: .mara, lines: [
                    "Quiet morning. We work the bank like it's church."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Back to Back",
            dateLine: "Saturday",
            timeLine: "8:18 AM",
            beats: [
                .scene("Two big shifts in a row — yesterday was Friday rush, today the rodeo crowd is back. You're already tired."),
                .dialogue(speaker: .mara, lines: [
                    "Tired-shift drills. We grind through it. Form follows fatigue."
                ])
            ]
        ),
        OpeningTemplate(
            title: "Equipment Drama",
            dateLine: "Thursday",
            timeLine: "8:48 AM",
            beats: [
                .scene("Pyxis is sulking again — login screen frozen. You restart it; takes four minutes you don't have."),
                .dialogue(speaker: .mara, lines: [
                    "While it boots, drill. Tech downtime is study time."
                ])
            ]
        )
    ]

    // MARK: - Closing templates

    private static let closings: [[RimrockBeat]] = [
        [
            .scene("4:50 PM. Lobby empty. Fridge log second read. The radio static settles."),
            .dialogue(speaker: .mara, lines: [
                "That's the day. Lock up. Sleep well."
            ])
        ],
        [
            .scene("End of shift. The Bighorns going gold against the last light. The coffee mug — the one with the X — is empty."),
            .dialogue(speaker: .mara, lines: [
                "Solid work. Tomorrow's a new pile. Drive safe."
            ])
        ],
        [
            .scene("5:00 PM. Closing checks: fridge log, safe, back door, Closed sign. Radio stays on overnight."),
            .dialogue(speaker: .mara, lines: [
                "Good shift. See you tomorrow."
            ])
        ],
        [
            .scene("Last script bagged. Counter wiped. The dispensary smells like tomorrow's coffee and yesterday's amox."),
            .dialogue(speaker: .mara, lines: [
                "Done. Lock up. Don't forget the back door."
            ])
        ],
        [
            .scene("5:10 PM. The phone goes to night-line. Mara's done her counter-rounds. The static on the radio thins."),
            .dialogue(speaker: .mara, lines: [
                "Clean shift. You earned the drive home."
            ])
        ],
        [
            .scene("Sun's already gone behind the ridge. Counter's wiped down twice — second pass for tomorrow."),
            .dialogue(speaker: .mara, lines: [
                "Good day on the bench. Get some food in you."
            ])
        ],
        [
            .scene("Closing checklist done. C-II count balances. The safe lock clicks the same way it always does."),
            .dialogue(speaker: .mara, lines: [
                "Numbers all hit. That's a good shift."
            ])
        ],
        [
            .scene("Lock-up routine. You leave the back light on. The fluorescent over the bench buzzes for a beat after the switch."),
            .dialogue(speaker: .mara, lines: [
                "Sleep on what we drilled today. It sticks better that way."
            ])
        ],
        [
            .scene("Beans is barking on Mara's end. She's late getting home. The shop is quiet on yours."),
            .dialogue(speaker: .mara, lines: [
                "Heading out. You did good. Tomorrow we go harder."
            ])
        ],
        [
            .scene("Snow piling against the back door again. You'll have to shovel before you can lock it."),
            .dialogue(speaker: .mara, lines: [
                "Bundle up. Same time tomorrow."
            ])
        ],
        [
            .scene("Coffee pot empty for the second time. The fluorescent buzz, the fridge hum, the wind outside. End-of-day Rimrock."),
            .dialogue(speaker: .mara, lines: [
                "Good. Lock up. Same drill tomorrow."
            ])
        ],
        [
            .scene("Tomorrow's wholesaler order printed and clipped to the board. Tonight's verifications signed off."),
            .dialogue(speaker: .mara, lines: [
                "Tight shift. Get out before the weather turns."
            ])
        ],
        [
            .scene("Last patient walked out smiling. That doesn't happen every day. You take the win."),
            .dialogue(speaker: .mara, lines: [
                "Nice. Good shift. Drive home."
            ])
        ],
        [
            .scene("4:55 PM. Pyxis is still pretending to load. You give up and write the count by hand."),
            .dialogue(speaker: .mara, lines: [
                "Old-school counts. Good for you. Tomorrow we deal with Pyxis."
            ])
        ],
        [
            .scene("Hollis stopped by at the end to sign off on the inventory. He nodded, which from him means 'no issues'."),
            .dialogue(speaker: .mara, lines: [
                "Hollis's nod is high praise. Take it. Lock up."
            ])
        ]
    ]

    // MARK: - Per-question wrappers

    /// Builds a 1-3 beat narrative wrapper around a single question. Wrapper
    /// shape varies by domain so the practice shift doesn't read as a flat
    /// quiz: meds become walk-ins or DURs, federal becomes paperwork, etc.
    private static func wrap(node: DataNode, idx: Int) -> [RimrockBeat] {
        let q = node.asRimrockPracticeQuestion()
        let lead: RimrockBeat
        switch node.domain {
        case .medications:
            lead = .dialogue(speaker: .mara, lines: medsLeads.randomElement() ?? ["Pull this one."])
        case .federalRequirements:
            lead = .dialogue(speaker: .mara, lines: federalLeads.randomElement() ?? ["Compliance check."])
        case .patientSafety:
            lead = .dialogue(speaker: .mara, lines: safetyLeads.randomElement() ?? ["Safety drill."])
        case .orderEntry:
            lead = .dialogue(speaker: .mara, lines: orderLeads.randomElement() ?? ["Order entry."])
        }
        // Every ~3rd question, drop in an interstitial so the rhythm breathes.
        if idx > 0 && idx % 3 == 0 {
            return [interstitial(for: idx), lead, .question(q)]
        }
        return [lead, .question(q)]
    }

    private static let medsLeads: [[String]] = [
        ["Walk-in. Read me the script."],
        ["Refill in the queue. Pull the patient profile and walk me through it."],
        ["DUR fired. Tell me what's going on."],
        ["E-prescribe came through. What's the right call?"],
        ["Counsel point — I want to hear you say it back."],
        ["Pharmacology drill. Don't think too hard about it."],
        ["Patient on the phone — they're asking about a side effect."],
        ["Doc's office called about a brand sub. Tell me what you'd tell them."],
        ["MTM moment — patient on five drugs, walk me through the interactions."],
        ["High-alert drug just hit the queue. What's the mechanism?"],
        ["Generic name on the script, brand sticker on the bottle. Quick — is it the same drug?"],
        ["Patient asks why their pill changed shape. Talk me through it."],
        ["This one's a pearl I want you to know cold."],
        ["Class question. Tell me the mechanism and a representative example."],
        ["Indication question. The drug is on the label — what is it FOR?"],
        ["Side-effect counseling drill. Two-line version, like you'd say it to a patient."],
        ["The doc called wanting an alternative. Suggest one and tell me why."],
        ["Adherence question. What does the prescription literally tell the patient to do?"],
        ["This is one I see on every PTCB. Lock it down."],
        ["Walk-in, hand on the counter, asking what their drug 'does.' Answer them."]
    ]

    private static let federalLeads: [[String]] = [
        ["Compliance question. Quick one."],
        ["DEA point I want you to lock down."],
        ["Federal rule. Tell me how this one works."],
        ["Schedule logic — read it back."],
        ["Forms and timelines. Drill."],
        ["This one's controlled-substance handling. Take it."],
        ["Audit-relevant. Memorize the rule."],
        ["Recordkeeping question. The inspector WILL ask this."],
        ["PSE / pseudoephedrine drill. The thresholds matter."],
        ["FDA vs state authority. Pick the right answer."],
        ["This is the rule that costs licenses if you miss it. Pay attention."],
        ["222 form drill — be exact."],
        ["Transfer rule. Schedule and number of fills."],
        ["Prescriber DEA number — check digit math. Run it."],
        ["HIPAA scenario. TPO or not?"],
        ["Inventory rule. Biennial — what's it cover?"],
        ["Refill limits drill. What's the federal cap?"],
        ["Disposal question. How does it have to go?"],
        ["Schedule II vs III, the difference matters for THIS rule."],
        ["This is the federal one most techs miss. Don't be one of them."]
    ]

    private static let safetyLeads: [[String]] = [
        ["Safety scenario. Walk me through your thinking."],
        ["High-alert moment. Be specific."],
        ["LASA pair came up. Which is which?"],
        ["DUR alert just fired — what's the right response?"],
        ["Hygiene/standards drill."],
        ["This one's about preventing the kind of error that ends a license."],
        ["Tech vs pharmacist scope question."],
        ["Sterile compounding drill — what does USP say?"],
        ["BUD question. Be specific about the storage condition."],
        ["Tall-man lettering — why does it matter here?"],
        ["Allergy interaction drill. What would you flag?"],
        ["Med-error reduction. ISMP best practice."],
        ["This is the kind of thing that puts a patient in the ER. Don't miss it."],
        ["Look-alike sound-alike — the kind that gets caught at verification."],
        ["Pediatric vs adult dose drill — the trap is unit conversion."],
        ["Vaccine storage question. Cold chain rules."],
        ["Hazardous handling drill — USP 800. What's required?"],
        ["Patient counseling: when is it MANDATED?"],
        ["High-risk medication drill. What's the rule?"],
        ["Two-person verification — when is it required?"]
    ]

    private static let orderLeads: [[String]] = [
        ["Math problem from the queue. Show your work."],
        ["Insurance question. Read it carefully."],
        ["Order entry — practical."],
        ["Calculation. Don't shortcut it."],
        ["NDC / billing drill."],
        ["Compounding step. Take it."],
        ["Formula question. Tell me the rule and the answer."],
        ["Day-supply drill. Show me the math."],
        ["Alligation problem. Walk it slow."],
        ["Sig code interpretation. What does it mean in English?"],
        ["BSA calc. The kind that comes up in oncology."],
        ["Concentration drill. Stock and final, do the conversion."],
        ["Partial fill — what's owed?"],
        ["Quantity-to-dispense drill. Read the directions exactly."],
        ["Reconstitution math. Pay attention to the diluent volume."],
        ["IV drip rate. Drops per minute, work it out."],
        ["Days' supply for an inhaler. The PTCB loves this one."],
        ["Refill billing question. What's the rule?"],
        ["Generic substitution — when is it allowed?"],
        ["Drug utilization review trigger. What fires it?"]
    ]

    private static let interstitials: [String] = [
        "Phone rings — somebody's wife asking about her husband's pickup. Standard TPO call.",
        "Refill faxed in. You set it aside for the next batch.",
        "Bell clatters — UPS dropping off the wholesaler order. Sign and stack.",
        "Mara off-mic for a second, talking to Theo about something. Then back.",
        "The printer chunks out a fresh stack — three new e-prescribes hitting the queue.",
        "You catch the back door air leak again. Draft the maintenance request, send it tomorrow.",
        "Beans is barking at something on Mara's end. She mutes for a beat.",
        "You top off the coffee. The mug with the X is yours now.",
        "Walk-in. Counsel question about a topical you bag, answer, send them off.",
        "Mrs. Henley calls to confirm her pickup time. Two minutes, end of call.",
        "Fax machine wheezes out a transfer request. You drop it into the batch.",
        "Hollis pokes his head in to ask about the temperature log. You read him the morning number. He nods.",
        "Patient counter call: did the doctor send the refill yet? You check, tell them tomorrow.",
        "The bell sticks again on a customer's exit. You make a note: WD-40, Friday.",
        "Wind kicks up against the front window. The hanging sign sways.",
        "Mara's keyboard click-clack rolls steady through the radio while you work.",
        "A delivery you weren't expecting — sample box from the rep. You'll log it after the next question.",
        "Counter clear for ninety seconds. You take a sip of water. Back to work.",
        "Pastor Doreen waves through the front window on her morning walk.",
        "Beans is napping on Mara's end. Just the radio static and the fridge hum.",
        "Theo radios in — order delivered safely. C-II safe locked.",
        "You catch a typo on a label you're about to print. Fix it, reprint.",
        "Tom from the diner two doors down stops in for his refill. Quick smile, quick exit.",
        "Pyxis ding from the back — a tech-station task pinging for attention. It'll wait a minute.",
        "The bell stops jingling. Lobby's empty. The kind of pause that feels earned."
    ]

    private static func interstitial(for idx: Int) -> RimrockBeat {
        .scene(interstitials[idx % interstitials.count])
    }

    // MARK: - Shift builder

    /// Builds a full practice shift for the given session day, using the
    /// supplied questions in the supplied order.
    static func buildShift(dayNumber: Int, questions: [DataNode]) -> RimrockShift {
        let template = openings[(dayNumber - firstPracticeDay) % openings.count]
        let closing = closings[(dayNumber - firstPracticeDay) % closings.count]

        var beats: [RimrockBeat] = template.beats
        for (idx, node) in questions.enumerated() {
            beats.append(contentsOf: wrap(node: node, idx: idx))
        }
        beats.append(contentsOf: closing)
        beats.append(.shiftEnd(closingLine: nil))

        return RimrockShift(
            dayNumber: dayNumber,
            title: template.title,
            dateLine: template.dateLine,
            timeLine: template.timeLine,
            locationLine: "Johnson County, Wyoming",
            beats: beats
        )
    }
}

// MARK: - Coverage snapshot

struct PracticeCoverage {
    /// Total questions in the bank that are eligible for practice.
    let bankSize: Int
    /// How many have been seen at least once.
    let seenOnce: Int
    /// How many have been seen at least twice (verified by spacing).
    let verified: Int
    /// How many shifts have been completed (= max lastSeenShift seen).
    let completedShifts: Int

    var seenPercent: Double {
        bankSize > 0 ? Double(seenOnce) / Double(bankSize) : 0
    }
    var verifiedPercent: Double {
        bankSize > 0 ? Double(verified) / Double(bankSize) : 0
    }
    var nextShiftNumber: Int {
        max(RimrockPracticeGenerator.firstPracticeDay, completedShifts + 1)
    }
    var isFullyVerified: Bool {
        verified >= bankSize && bankSize > 0
    }
}
