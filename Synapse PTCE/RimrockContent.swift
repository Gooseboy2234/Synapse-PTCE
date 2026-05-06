//
//  RimrockContent.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Story content as structured data. Each day's beats live here.
//

import Foundation

enum RimrockContent {

    // MARK: - Day 1 — Rimrock

    static let day1: RimrockShift = RimrockShift(
        dayNumber: 1,
        title: "Rimrock",
        dateLine: "Tuesday, May 12",
        timeLine: "8:41 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("You step inside. The bell over the door clatters once and goes still. The lobby smells like dust and old coffee. Two folding chairs face the consultation window. A pothos in a cracked planter has, against all odds, survived. Rain on the roof, the soft kind. Through the front windows the Bighorns wear that low gray cloud they wear in May."),
            .scene("The radio on the back counter is already on."),
            .scene("A green dial glows where the tuner is parked. Static breathes in and out, the way it does when the signal's holding but nobody's talking. Then it talks."),

            .dialogue(speaker: .mara, lines: [
                "Rimrock, this is Mara. You there?"
            ]),

            .dialogue(speaker: .mara, lines: [
                "Good. Nineteen minutes till we open. Cash drawer's in the bottom right cabinet under the computer. Key's in the magnetic catch under the lip of the desk. Yes, that's a security violation. We'll fix it this week.",
                "Previous tech's keychain is — was — in the safe. Use the spare. Log into the computer, password's rimrock1965, lowercase, all one word. We'll change that today too."
            ]),

            .dialogue(speaker: .mara, lines: [
                "What's your name? I should probably know."
            ]),

            .nameEntry(prompt: "Enter your name"),

            .dialogue(speaker: .mara, lines: [
                "Before customers — fridge log. Clipboard hanging next to the med fridge. Read the temperature off the digital thermometer, write it down with the time and your initials. Twice a day, every day. Insulin doesn't like surprises."
            ]),

            RimrockCYOA.day1_fridgeLogSkip,

            .question(.uspFridgeTemp),

            // 9:00 AM — Harlan walks in
            .scene("The bell clatters at 9:00 sharp. A man walks in — mid-fifties, work coat, thinning hair under a Cabela's cap. Sets a paper script on the counter without saying hello."),

            .dialogue(speaker: .named("HARLAN"), lines: [
                "New one for me."
            ]),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Ellen Hollis",
                prescriberDetail: "DEA stamp tidy beside the signature. Fountain pen.",
                patientName: "HARLAN MORROW",
                patientDOB: "04/19/1968",
                drug: "Metoprolol Succinate ER",
                strength: "50 mg",
                sig: "i tab po qd",
                quantity: 30,
                refills: 5,
                isHandwritten: true,
                physicalNote: "Real prescription pad, pre-printed letterhead. The handwriting is careful."
            )),

            .dialogue(speaker: .mara, lines: [
                "Read it back to me. Out loud's fine."
            ]),

            .question(.sigCodeQD),
            .question(.brandGenericToprolXL),

            .scene("You enter the prescription into the system. NDC, days supply 30, refills 5. Submit to insurance."),
            .scene("The screen blinks. Rejection: DUR 76 — Refill Too Soon."),

            .dialogue(speaker: .mara, lines: [
                "That's not too-soon. He's never had this filled. Plan's looking at his file wrong. Override 03 — vacation / new therapy. Resubmit."
            ]),

            .scene("Resubmit. Insurance pays. $7.42 copay."),

            .dialogue(speaker: .mara, lines: [
                "Welcome to retail. Half this job is convincing computers their own data is wrong."
            ]),

            .scene("Print label. Count thirty tablets. Verify, bag."),

            .dialogue(speaker: .mara, lines: [
                "Counsel offer — federal law. OBRA-90. Every new prescription, you ask. Even if they say no. Especially if they say no, actually, because the ones who decline are the ones who go home and take it wrong. But you ask, you document the offer, and if they decline, that's their right."
            ]),

            .scene("You ask Harlan if he wants counseling. He grunts a no without breaking eye contact with the lottery rack."),

            .dialogue(speaker: .mara, lines: [
                "Document the decline. Initials and time on the slip. Hand him the bag, tell him to have a nice day. Don't expect a response."
            ]),

            .scene("He doesn't respond. The bell clatters on his way out."),
            .scene("The next ninety minutes are paperwork — three refills, two transfers in from the chain pharmacy in Sheridan."),

            // 10:47 AM — Evie's call
            .scene("At 10:47 the phone rings. The caller ID reads E. ABERNATHY."),

            .dialogue(speaker: .mara, lines: [
                "Oh. Take this one. You'll like her. She's harmless and she's lonely. Don't rush her."
            ]),

            .phoneCall(RimrockPhoneCall(
                callerID: "E. ABERNATHY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("EVIE"), line: "Hi sweetheart, is Mara there?"),
                    RimrockPhoneTurn(speaker: .player, line: "She's, uh — she's working remote right now, I —"),
                    RimrockPhoneTurn(speaker: .named("EVIE"), line: "Oh I know that, dear. I just like to ask. You must be the new one. She told me you were starting this week."),
                    RimrockPhoneTurn(speaker: .player, line: "I —"),
                    RimrockPhoneTurn(speaker: .named("EVIE"), line: "I'm calling because I can't find my little pill. The one for my nerves. I had it last night and now it's gone. Did I take it twice?")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Pull her profile. Look at the hydroxyzine."
            ]),

            .scene("You pull her profile. Hydroxyzine 25 mg, 1 tab PRN anxiety, dispensed last week, qty 30. Even at maximum PRN, there should be plenty left."),

            .dialogue(speaker: .mara, lines: [
                "Tell her she didn't take it twice. Tell her to look on the kitchen counter, by the toaster."
            ]),

            .dialogue(speaker: .player, lines: [
                "...by the toaster?"
            ]),

            .dialogue(speaker: .mara, lines: [
                "Trust me."
            ]),

            .scene("You tell her. There's a long shuffling pause on Evie's end. Then:"),

            .phoneCall(RimrockPhoneCall(
                callerID: "E. ABERNATHY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("EVIE"), line: "Oh! It's right here. Bless you, dear. What's your name again?")
                ]
            )),

            .scene("You tell her your name. She repeats it back. You hang up."),

            .dialogue(speaker: .mara, lines: [
                "She does that twice a week. Hydroxyzine's hydroxyzine but mostly she's looking for someone to say hi to. Don't ever rush her."
            ]),

            .object(
                name: "Shift Log",
                description: "Evie Abernathy. Found her pill by the toaster.",
                logEntry: RimrockLogEntry(
                    title: "Evie Abernathy",
                    body: "Calls about refills, mostly to talk. Found her pill by the toaster."
                )
            ),

            // Afternoon — amoxicillin partial fill
            .scene("The afternoon brings an amoxicillin 500 mg, sig i cap po tid x 10 d. Quantity 30. Stock check — fourteen caps on the shelf, next bottle isn't due in until tomorrow."),

            .dialogue(speaker: .mara, lines: [
                "Partial fill. Give her fourteen today, owe her sixteen. Note it on the slip and in the system. The rest comes off tomorrow's truck."
            ]),

            .question(.partialFillOwed),

            .dialogue(speaker: .mara, lines: [
                "Right. Patients don't care about logistics, they care about feeling better. Tell her she can come pick the rest up after lunch tomorrow. We'll have it."
            ]),

            // End of day
            .scene("At 4:50 PM the lobby is empty. Rain has stopped. The Bighorns are clearing in patches."),

            .dialogue(speaker: .mara, lines: [
                "That'll do. Lock the safe — combination's on the slip in your folder, don't memorize it out loud — flip the Closed sign, and shut the back door from the inside. The radio stays on overnight. Just so you know."
            ]),

            .scene("You tidy. In the back, on the shelf above the deionized water dispenser, there's a coffee mug. White, generic, four-pack-from-the-grocery kind. Someone has scratched a name off the side with the point of a pen, scratched it down past the glaze."),

            .object(
                name: "A mug",
                description: "You can still read the first letter if you tilt it. W.",
                logEntry: RimrockLogEntry(
                    title: "A mug, in the back",
                    body: "Scratched-off name on the side. The first letter is W."
                )
            ),

            .scene("You set it down. Decide not to ask about it tonight."),

            .dialogue(speaker: .mara, lines: [
                "Heading off. Tomorrow's controls intake — Dolores is on the route, she'll be by around ten with the Schedule III through V order. I'll walk you through receiving. Sleep well."
            ]),

            .scene("The radio doesn't click off. The static breathes for a second longer than it should."),
            .scene("Then it does."),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 2 — Dolores

    static let day2: RimrockShift = RimrockShift(
        dayNumber: 2,
        title: "Dolores",
        dateLine: "Wednesday, May 13",
        timeLine: "9:48 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("The bell clatters. You're early today; coffee's already on, the radio's already on. Outside, the rain has gone east. The sun is still working out whether it wants to commit."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Beat me here. Good.",
                "Fridge log first, then the queue. Three new scripts came through overnight on e-prescribe. Print them and stack by patient. Dolores'll be here at ten with the truck."
            ]),

            .scene("You print the queue. Two refills you've already seen, one new — a metformin 500 mg, just sitting there waiting. You stack them by patient and start the metformin. Routine."),

            // 10:14 — Dolores arrives
            .scene("10:14. The bell clatters. A woman in her sixties comes in pulling a hand truck, two cardboard boxes lashed down. Steel-gray hair under a Carhartt cap. Knees that have lifted things for forty years."),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "You must be the new one. Mara hasn't shut up about needing help. Where do you want these."
            ]),

            .dialogue(speaker: .mara, lines: [
                "Dolores. About time."
            ]),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Prodigy, your invoice is short on the labetalol. Sheridan did it again."
            ]),

            .dialogue(speaker: .mara, lines: [
                "Tell Sheridan I'm not paying for what they didn't put on the truck. And put your back into the lifting, you said it makes you feel younger."
            ]),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Said that one time."
            ]),

            .scene("Dolores sets the boxes on the back counter and hands you a clipboard. The invoice is two pages — line items, NDC numbers, quantities. The bottom of page two has a signature box with Dolores's name printed under it."),

            .dialogue(speaker: .mara, lines: [
                "Receiving controls intake. Schedules Three through Five come on a regular wholesale invoice — no Form 222. Form 222 is C-II only. We'll handle those next time."
            ]),

            .question(.day2_form222),

            .dialogue(speaker: .mara, lines: [
                "Open the box. Count each line against the invoice. Match the NDC, match the count, sign and date the invoice. File it in the controls binder, second drawer."
            ]),

            .scene("You open the box. Pregabalin 75 mg, count of 500, intact seal. Clonazepam 0.5 mg, count of 100, intact seal. Testosterone cypionate 200 mg/mL, count of 1, intact seal. Pseudoephedrine 60 mg, count of 24."),

            .dialogue(speaker: .mara, lines: [
                "Pregabalin's a Five — Lyrica. Clonazepam's a Four — Klonopin, benzo, anxiety. Testosterone is a Three. Pseudoephedrine isn't a controlled substance but it's behind the counter. Federal MethCheck system before any of it gets sold. Do that now, before Dolores leaves and forgets to ask about it."
            ]),

            .question(.day2_pseudoephedrineLimit),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Tell her her hold mail is at the front desk."
            ]),

            .dialogue(speaker: .mara, lines: [
                "...Right. Thanks, Dolores."
            ]),

            .scene("A small thing — Mara has hold mail at the post office in town. She's local. Just not coming in."),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Hang in there, kid. She's a pain but she's worth it."
            ]),

            .scene("Dolores pulls the hand truck out the door. The bell clatters."),

            // 10:43 — Pseudoephedrine sale
            RimrockCYOA.day2_pseudoephedrineSale,

            // Midday — Cora Morrow LASA
            .scene("After lunch you find two prescriptions in yesterday's night drop pile that you didn't see this morning. Same patient. CORA MORROW, DOB 11/03/1962. Harlan's wife, you'd guess from the address."),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Ellen Hollis",
                prescriberDetail: "Same fountain pen. Same prescription pad. Dated four days ago.",
                patientName: "CORA MORROW",
                patientDOB: "11/03/1962",
                drug: "Hydroxyzine HCl",
                strength: "50 mg",
                sig: "i tab po q6h prn anxiety",
                quantity: 60,
                refills: 2,
                isHandwritten: true,
                physicalNote: "Handwritten. Fountain pen."
            )),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Linh Vinh, MD",
                prescriberDetail: "A name you haven't seen before. Faxed from a clinic in Buffalo.",
                patientName: "CORA MORROW",
                patientDOB: "11/03/1962",
                drug: "Hydralazine",
                strength: "25 mg",
                sig: "i tab po tid",
                quantity: 90,
                refills: 5,
                isHandwritten: false,
                physicalNote: "Computer-printed. Faxed."
            )),

            .dialogue(speaker: .mara, lines: [
                "Read me both. Out loud is fine."
            ]),

            .scene("You read them. Hydroxyzine 50 milligrams, Hollis. Hydralazine 25 milligrams, Vinh. Same patient, four days apart, two prescribers."),

            .dialogue(speaker: .mara, lines: [
                "That's one of my favorites. Same patient, two doctors, two drugs that look like they were designed to be confused. So whose problem is it?"
            ]),

            .choice(
                prompt: "Whose problem is this?",
                choices: [
                    RimrockChoice(
                        label: "It's the doctors' problem — they should coordinate.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "In an ideal world, sure. We don't live there. Pull her med list and call Hollis."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "It's our problem.",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Yeah. Always. Pull her med list and call Hollis. Vinh's clinic is new — they don't know us yet."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "It's the patient's problem if she takes them both wrong.",
                        tone: .press,
                        rapportDelta: -1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Right. Cora's seventy-two and was sent home from a hospital admission two weeks ago. Of course she might mix them up. Pull her med list and call Hollis. We're not the patient's last line of defense — we're somewhere around the second-to-last, and we don't get to decide we're not there."
                            ])
                        ]
                    )
                ]
            ),

            .question(.day2_lasaHydralazine),

            .dialogue(speaker: .mara, lines: [
                "Set Vinh's prescription aside. Call Hollis's office, ask if she knows about the hydralazine. Document the call. We'll resolve before tomorrow."
            ]),

            // Afternoon — Synthroid
            .scene("3:20 PM. The phone rings. Caller ID: P. STENMARK."),

            .phoneCall(RimrockPhoneCall(
                callerID: "P. STENMARK",
                turns: [
                    RimrockPhoneTurn(speaker: .named("STENMARK"), line: "I am NOT taking that generic crap again. I told you people last time. I want the real Synthroid. You hear me?"),
                    RimrockPhoneTurn(speaker: .player, line: "I — sir, levothyroxine is the same drug as Synthroid, the FDA—"),
                    RimrockPhoneTurn(speaker: .named("STENMARK"), line: "I don't care what the FDA says. The pills don't WORK. I'll drive to Sheridan if I have to.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Don't argue with him. Pull his record."
            ]),

            .scene("You pull P. Stenmark's record. He's been on Synthroid 75 mcg for six years. Last fill: generic levothyroxine 75 mcg, Mylan. Before that: levothyroxine, Sandoz. Before THAT: brand-name Synthroid."),

            .dialogue(speaker: .mara, lines: [
                "Levothyroxine is what's called narrow therapeutic index. NTI. The dose window is small — a little too much, hyperthyroid. A little too little, sluggish. Doctors really want patients to stay on the same manufacturer once they're stable. We bounced him from brand to Sandoz to Mylan. He noticed.",
                "If he's having symptoms, those could be real. Or psychological. Or both. Either way, we don't fight him."
            ]),

            .question(.day2_ntiLevothyroxine),

            .dialogue(speaker: .mara, lines: [
                "Tell him we'll order brand-name Synthroid for tomorrow. Special-order, three-day supply to bridge. He pays the difference. Don't apologize for the FDA — just solve his problem."
            ]),

            .scene("You tell him. He grunts approval. He hangs up."),

            .dialogue(speaker: .mara, lines: [
                "Welcome to retail, part two: you will be insulted by people whose lives you are actively trying to make better. Don't take it personal. He's not mad at you. He's mad at his thyroid."
            ]),

            // Late afternoon — the dog
            .scene("4:40 PM. Quiet stretch. You're filing the day's invoices. Mara's been silent for a while. Then:"),

            .dialogue(speaker: .mara, lines: [
                "Hold on — Beans, off the counter. Off. Off. Good.",
                "Sorry. He's a menace."
            ]),

            .choice(
                prompt: "Respond",
                choices: [
                    RimrockChoice(
                        label: "No problem.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Mm. Anyway. Where were we."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "What kind of dog?",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Aussie shepherd. Nine years old.",
                                "Anyway. Where were we."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "He sounds great.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Aussie shepherd. Nine. Smarter than me on a good day. Came with the house — previous owner couldn't take him to assisted living, the shelter is in Sheridan, and I had a yard.",
                                "...Anyway. Where were we."
                            ])
                        ]
                    )
                ]
            ),

            // End of day
            .scene("At 5:00 PM the lobby is empty. Light through the front windows is going amber. The Bighorns have come back into focus."),

            .dialogue(speaker: .mara, lines: [
                "Good day. You're better than I expected.",
                "Lock up. See you tomorrow — we'll start with the Cora situation. I want to know what Hollis says."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 3 — The Note

    static let day3: RimrockShift = RimrockShift(
        dayNumber: 3,
        title: "The Note",
        dateLine: "Thursday, May 14",
        timeLine: "8:38 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Sun's clearing the ridge by the time you unlock. Coffee on, fridge log, queue. Routine, already."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Hollis's office called back on Cora — they're aware of Vinh's hydralazine, it was intentional, they're managing both. We can fill both. Document the resolution in her chart and move on.",
                "Today's spotlight is controlled substances. We'll see at least one C-II walk in. Be ready."
            ]),

            // 10:30 — CII walk-in
            .scene("10:30. The bell clatters. A young man, twenty-four maybe, hand on his jaw, eyes a little glassy from the night before. He sets a paper script on the counter."),

            .dialogue(speaker: .named("CALEB"), lines: [
                "Wisdom teeth. Yesterday."
            ]),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Andrew Boateng, DDS",
                prescriberDetail: "Wet-ink signature. DEA: AB7491825. Oral surgery practice in Sheridan.",
                patientName: "CALEB ANDERS",
                patientDOB: "08/22/2001",
                drug: "Hydrocodone-Acetaminophen",
                strength: "5/325 mg",
                sig: "i tab po q4-6h prn pain",
                quantity: 20,
                refills: 0,
                isHandwritten: true,
                physicalNote: "Paper Rx. Yesterday's date. Wet-ink signature, not stamped, not photocopied."
            )),

            .dialogue(speaker: .mara, lines: [
                "C-II. Look at the date — written yesterday. Federal allows up to ninety days from issue for a CII fill; some states tighter. We're fine.",
                "Verify the signature is wet ink. Actual pen on actual paper. Not a stamp, not a photocopy, not a fax. Verify the prescriber's DEA number. EPCS marker — no, it's paper. So wet ink, no exceptions."
            ]),

            .question(.day3_scheduleIIRefills),

            .dialogue(speaker: .mara, lines: [
                "DEA number on his slip is AB7491825. First letter A — practitioner. Second letter B — registrant's last name. His name is Boateng, B. That checks. Old DEAs follow the rule. Newer ones don't always, since they ran out of A/B and started issuing F."
            ]),

            .question(.day3_deaNumberLetter),

            .scene("Print label, count 20, verify, bag. The check digit on the DEA number passes when the system runs it through the modulus arithmetic."),

            .dialogue(speaker: .mara, lines: [
                "Counsel him on this one specifically. Take with food. Don't drink. Don't drive. Twenty tablets sounds like a lot but at q4-6h that's three days, four if he's lucky. After that, plain ibuprofen or acetaminophen will do the work. You don't want him calling back next week asking for more — that's not a road we walk anyone down."
            ]),

            .scene("You counsel. He nods. Doesn't speak much. Pays the copay, puts the bag in his hoodie pocket, leaves. Bell clatters."),

            // 11:35 — Caleb calls back
            RimrockCYOA.day3_ciiRefillPhone,

            // 11:50 — LASA Celebrex/Celexa/Cerebyx
            .scene("11:50. Refill queue. The system has printed a label for CELEBREX 200 mg, sig i cap po qd, disp #30, for a patient named Margaret Thiel. You scan her record. Her last fill four months ago was CELEXA 20 mg."),

            .dialogue(speaker: .mara, lines: [
                "Pause. What is Celebrex. What is Celexa."
            ]),

            .question(.day3_lasaCelebrex),

            .dialogue(speaker: .mara, lines: [
                "Pull her chart. Make sure today's prescription is actually Celebrex — celecoxib, anti-inflammatory — and not Celexa, citalopram, antidepressant. Both are real prescriptions she's had at different points. Read the doctor's handwriting on the new Rx. Match the strength: Celebrex 200 is right; Celexa would be 10 or 20.",
                "Confirm before you bag."
            ]),

            .scene("You pull the new Rx — handwritten, 'Celebrex 200 mg' clearly. The doctor's handwriting is bad but the strength gives it away. Filled correctly."),

            // 2:30 PM — PMP / tramadol
            .scene("2:30 PM. Phone rings. Caller ID: V. ARTHUR."),

            .phoneCall(RimrockPhoneCall(
                callerID: "V. ARTHUR",
                turns: [
                    RimrockPhoneTurn(speaker: .named("ARTHUR"), line: "Hi, calling to check on my tramadol. Should be ready today."),
                    RimrockPhoneTurn(speaker: .player, line: "Let me look. ...Mr. Arthur, I'm not seeing anything new in the queue. Did your doctor call it in today?"),
                    RimrockPhoneTurn(speaker: .named("ARTHUR"), line: "Yeah. Should be there. Look, I'm an hour out, can you hurry.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Run his name through PMP. I'll wait."
            ]),

            .scene("Prescription Drug Monitoring Program. State database. You enter his name and DOB. Results appear: tramadol 50 mg, qty 90, filled five days ago at a CVS in Sheridan. Nothing else. No new prescription."),

            .dialogue(speaker: .mara, lines: [
                "Five days. He's not refilling, he's doctor-shopping. That or his doctor wrote him another script knowing about the first one, in which case there's a paper trail somewhere we don't have. Either way, we don't fill today."
            ]),

            .question(.day3_pmpResponse),

            .scene("You tell V. Arthur. Polite. He starts to argue. You hold the line. He hangs up."),

            .dialogue(speaker: .mara, lines: [
                "He'll try another pharmacy in Casper. Or he'll call his doctor, get a story straight, and his doctor will call us. Or he won't. Most of them don't. They just disappear. Don't lecture them. Don't moralize. We're not the cops."
            ]),

            // 4:15 — The note
            .scene("4:15 PM. Slow stretch. You're cleaning the back. Stocking. On the third shelf above the deionized water dispenser, behind a row of empty stock bottles, there's a cracked amber prescription bottle with no label. You pick it up. The cap rattles. Inside, a folded piece of notebook paper."),

            .scene("You unfold it. The handwriting is small, careful, all caps."),

            .object(
                name: "A Note in a Bottle",
                description: "DON'T ASK ABOUT THE MARLOW PRESCRIPTION.\n— W",
                logEntry: RimrockLogEntry(
                    title: "Note in a pill bottle",
                    body: "Found in a cracked amber bottle behind the empty stock. \"DON'T ASK ABOUT THE MARLOW PRESCRIPTION. — W\""
                )
            ),

            .scene("The radio is silent. You wait."),

            .dialogue(speaker: .mara, lines: [
                "...",
                "Yeah. I figured you'd find that eventually.",
                "Just leave that one alone for now. I'll walk you through it when we get there. Promise."
            ]),

            .choice(
                prompt: "Respond",
                choices: [
                    RimrockChoice(
                        label: "Who's W?",
                        tone: .press,
                        rapportDelta: -1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "I said I'd explain. Later.",
                                "...Sorry. Bad day for it."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "OK.",
                        tone: .accept,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Thanks."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Whatever you need.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Thanks. I owe you for that."
                            ])
                        ]
                    )
                ]
            ),

            .scene("Mara's voice has gotten smaller. The static under it sounds louder than it has been."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 4 — What Brought You Out Here

    static let day4: RimrockShift = RimrockShift(
        dayNumber: 4,
        title: "What Brought You Out Here",
        dateLine: "Friday, May 15",
        timeLine: "8:50 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. The fog is burning off the Bighorns in patches. Coffee's already on. The queue printer chunked out twelve scripts overnight."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Friday's payday for some folks, so brace yourself for a busy afternoon.",
                "Today's pharmacology. You can pass the PTCE without being a pharmacist, but you can't be useful if you don't know what every pill in your hand actually does. So we're going to go through somebody's list."
            ]),

            .scene("9:30. The bell clatters. ELOISE NESBIT, sixty-seven, raincoat over a sweater, glasses on a beaded chain, one of those handbags with a hundred pockets. Her profile shows five chronic medications. She's here for the monthly pickup."),

            .dialogue(speaker: .named("ELOISE"), lines: [
                "All five today, dear. The usuals."
            ]),

            .dialogue(speaker: .mara, lines: [
                "Pull her stack. Walk me through it."
            ]),

            .scene("Profile: lisinopril 10 mg, atorvastatin 20 mg, metformin 1000 mg, omeprazole 20 mg, aspirin 81 mg. Five medications. All standard. All chronic."),

            .question(.day4_lisinoprilClass),
            .question(.day4_atorvastatinClass),
            .question(.day4_metforminIndication),

            .dialogue(speaker: .mara, lines: [
                "You're knocking these out. Where'd you go to school?"
            ]),

            .choice(
                prompt: "Where you trained",
                choices: [
                    RimrockChoice(
                        label: "Big chain pharmacy program. East coast.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Mm. Same drugs out here. Different patients."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Community college program. Out here, actually.",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Sheridan or Casper?"
                            ]),
                            .dialogue(speaker: .player, lines: [
                                "Sheridan."
                            ]),
                            .dialogue(speaker: .mara, lines: [
                                "I rotated through that program in third year. Small world."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "It's a long story.",
                        tone: .warm,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Long stories are usually good ones. ...When you want to."
                            ])
                        ]
                    )
                ]
            ),

            .question(.day4_omeprazoleClass),

            .scene("Print labels, count, verify, bag. All five. The bag is the size of a small grocery sack."),

            .dialogue(speaker: .mara, lines: [
                "Counsel offer."
            ]),

            .scene("You ask Eloise. She says she knows them all by heart. You ask anyway. She tells you metformin needs food, the lisinopril sometimes makes her cough, the aspirin bothers her stomach but she takes it with breakfast. She's right about all of it. You document the offer."),

            .dialogue(speaker: .mara, lines: [
                "Same patient, four drug classes, all rational, all working. That's how it's supposed to look. Trouble starts when someone else adds a sixth without knowing what's already in the picture."
            ]),

            .scene("Eloise leaves. The bell clatters. The lobby is quiet for a stretch."),

            // Late morning — phone call
            .scene("11:45. The phone rings. Caller ID: UNKNOWN."),

            .phoneCall(RimrockPhoneCall(
                callerID: "UNKNOWN",
                turns: [
                    RimrockPhoneTurn(speaker: .named("CALLER"), line: "Hi, when will my Adderall refill be ready?"),
                    RimrockPhoneTurn(speaker: .player, line: "Adderall is C-II — there are no refills. Your doctor needs to send a new prescription."),
                    RimrockPhoneTurn(speaker: .named("CALLER"), line: "...oh. Right. They never remember.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "They never remember. Patients on stimulants for ADHD, every single month. Same call. Tell them gently. Their executive function is the reason they're on the medication."
            ]),

            // End of day
            .scene("4:55 PM. The lobby empties out. Sun is full. The Bighorns are pink at the top edges."),

            .dialogue(speaker: .mara, lines: [
                "Good Friday. We open at ten on Saturdays — sleep in tomorrow. See you then."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 5 — Brett

    static let day5: RimrockShift = RimrockShift(
        dayNumber: 5,
        title: "Brett",
        dateLine: "Saturday, May 16",
        timeLine: "9:46 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Saturday. The store opens at ten — you're early. Coffee. Fridge log. The queue is small: three refills, no new scripts. Saturdays are slow until they aren't."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Slow start. We'll do cardiovascular drugs today since we have the runway. Heart stuff is a third of every PTCE — beta-blockers, ACEs, ARBs, statins, anticoagulants. Bread and butter."
            ]),

            // Mid-morning — warfarin profile
            .scene("10:38. The bell clatters. A regular — DON HARTLEY, mid-seventies, suspenders, always pays in cash — comes in for his warfarin refill. Disp #30, sig per INR clinic."),

            .dialogue(speaker: .mara, lines: [
                "He goes to the anti-coag clinic in Sheridan every two weeks. They dose his warfarin based on his INR. We just count the tablets. But you should know what they're doing."
            ]),

            .question(.day5_warfarinINR),

            .dialogue(speaker: .mara, lines: [
                "Counsel anyway. Vitamin K affects warfarin — kale, spinach, broccoli. Not 'avoid them' but 'eat them consistently.' If he switches diets, INR moves. Tell him."
            ]),

            // 11:20 — Brett calls
            .scene("11:20. The phone rings. Caller ID: HARDER, BRETT — RPh."),

            .dialogue(speaker: .mara, lines: [
                "Don't put it on speaker."
            ]),

            .phoneCall(RimrockPhoneCall(
                callerID: "HARDER, BRETT — RPh",
                turns: [
                    RimrockPhoneTurn(speaker: .named("BRETT"), line: "Mara. It's Brett. Listen, I gotta swap Wednesday again. Can you cover."),
                    RimrockPhoneTurn(speaker: .player, line: "I — let me get her—"),
                    RimrockPhoneTurn(speaker: .named("BRETT"), line: "Where's Mara, kid. Just put her on."),
                    RimrockPhoneTurn(speaker: .mara, line: "I heard you. Brett, I'm not covering Wednesday. You took my Wednesday last month."),
                    RimrockPhoneTurn(speaker: .named("BRETT"), line: "Yeah but Mara — listen, just this one time."),
                    RimrockPhoneTurn(speaker: .mara, line: "Wednesday's no. Saturday I can do."),
                    RimrockPhoneTurn(speaker: .named("BRETT"), line: "...fine. Saturday.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "That's Brett. He floats — covers Rimrock when I can't. Capable pharmacist on paper. Lazy on every other axis.",
                "Don't take it personally if he treats you like furniture. He treats everyone like furniture."
            ]),

            // Continue CV drugs
            .question(.day5_betaBlockerContra),

            .scene("12:30. A teleprescription comes through for Eloise's daughter — VIRGINIA NESBIT, fifty-two — who's already on lisinopril. Now her doctor wants to add spironolactone for treatment-resistant hypertension. And Virginia takes a daily potassium supplement she buys OTC."),

            .dialogue(speaker: .mara, lines: [
                "Three sources of potassium stacking. ACE inhibitor retains it, spironolactone retains it, potassium chloride is potassium. DUR alert is going to fire. What's the concern?"
            ]),

            .question(.day5_hyperkalemia),

            .dialogue(speaker: .mara, lines: [
                "Call her doctor. Tell him about the OTC potassium. He probably doesn't know — patients don't volunteer it. Document the call. The doctor will probably say 'have her stop the supplement,' and that'll be that. But don't fill until we hear back."
            ]),

            // Late afternoon — warfarin DDI
            .scene("3:15. A new Rx for Don Hartley — trimethoprim-sulfamethoxazole 800/160 mg, sig i tab po bid x 7d, prescribed for a UTI by the urgent care in Buffalo. He's still on warfarin."),

            .question(.day5_warfarinBactrim),

            .dialogue(speaker: .mara, lines: [
                "Call the urgent care. Tell them Don's on warfarin. They might switch the antibiotic; they might want him to recheck INR in three days; they might know already and want to monitor. We don't change the prescription, we close the loop."
            ]),

            // Late afternoon — small personal beat
            .scene("4:30. Quiet. You hear something through the radio that isn't Mara — an Aussie shepherd's whine, then a snort."),

            .dialogue(speaker: .mara, lines: [
                "Beans is on the porch staring at a mule deer. He thinks he's terrifying. Deer has not moved."
            ]),

            .scene("A small laugh, off the radio."),

            // End of day
            .dialogue(speaker: .mara, lines: [
                "Solid Saturday. Sunday's closed. Have a weekend."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 6 — Hollis

    static let day6: RimrockShift = RimrockShift(
        dayNumber: 6,
        title: "Hollis",
        dateLine: "Monday, May 18",
        timeLine: "8:35 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Monday. The weekend left a stack of Hollis-handwritten Rx in the night drop. Coffee. Fridge log. Queue."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's drug interactions and patient ID. Boring on paper. Kills people in real life.",
                "Top of your stack — a Hollis. Pull it."
            ]),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Ellen Hollis",
                prescriberDetail: "Fountain pen, of course. Dated this morning.",
                patientName: "MARGE THIEL",
                patientDOB: "1955",
                drug: "Amlodipine",
                strength: "10 mg",
                sig: "i tab po qd",
                quantity: 30,
                refills: 5,
                isHandwritten: true,
                physicalNote: "Patient is just 'Marge,' no last name confirmation. DOB is just the year."
            )),

            .dialogue(speaker: .mara, lines: [
                "Stop. What's wrong with this prescription?"
            ]),

            .question(.day6_rxRequiredElements),

            .dialogue(speaker: .mara, lines: [
                "Right. We need full name, full DOB. 'Marge Thiel' is probably MARGARET THIEL, DOB twelve four nineteen fifty-five — she's in our system. But probably isn't certain. We call Hollis's office and confirm.",
                "Hollis. Of course. I love her. She's a hazard."
            ]),

            .scene("You call. Hollis's receptionist confirms Margaret Thiel, full DOB. You document the call in the system, write CONFIRMED PATIENT ID PER PRESCRIBER OFFICE on the slip with your initials, and proceed."),

            .dialogue(speaker: .mara, lines: [
                "Now read the drug. Amlodipine ten."
            ]),

            .question(.day6_amlodipineClass),

            .dialogue(speaker: .mara, lines: [
                "Counsel point: don't mix it with grapefruit. Grapefruit inhibits CYP3A4, which metabolizes amlodipine. Levels spike, blood pressure drops too far. Older patients especially. The other major CCB warning is constipation — verapamil, diltiazem, all of them.",
                "And while you're at it, check her profile. Anything else there I should know about?"
            ]),

            .scene("Margaret Thiel's profile: levothyroxine 50 mcg, atorvastatin 40 mg, the new amlodipine. No documented allergies. Clean cardiac stack."),

            .dialogue(speaker: .mara, lines: [
                "Clean. Fill it. Hollis took her off the metoprolol she used to be on — last visit, probably. We don't always find out until the next refill cycle.",
                "Welcome to retail, part three: prescribers change minds and we're the last to know."
            ]),

            // Mid-morning — sulfa allergy DUR
            .scene("11:08. New e-Rx hits the queue. Patient: HENRY ALLEN, DOB 03/12/1971. Drug: trimethoprim-sulfamethoxazole 800/160 mg, sig i tab po bid x 10d, for sinusitis. Prescriber: Dr. Linh Vinh — the Buffalo clinic name you've seen before."),

            .scene("DUR alert fires immediately: ALLERGY ALERT — SULFA."),

            .dialogue(speaker: .mara, lines: [
                "There it is. Pull his profile. What's the allergy?"
            ]),

            .scene("Henry Allen, allergy listed: SULFA — RASH AND HIVES, documented 2018."),

            .question(.day6_sulfaAllergy),

            RimrockCYOA.day6_sulfaOverride,

            .dialogue(speaker: .mara, lines: [
                "Don't fill. Call Vinh's office. Say 'documented' specifically — some prescribers are cavalier about sulfa, others take it seriously. Ask for an alternative. Doxycycline or amoxicillin-clavulanate would be reasonable for sinusitis. Document the call in his chart."
            ]),

            .scene("You call. Vinh's NP answers, says 'oh god, yes, my fault, I'll send doxy in five minutes.' She does. You bag the doxycycline when it comes through. Henry picks up that afternoon. The system worked."),

            // Afternoon — grapefruit interaction
            .scene("3:30. Margaret Thiel comes back. She forgot to ask, when she picked up the amlodipine — could she have a glass of grapefruit juice with breakfast? Just in the morning?"),

            .question(.day6_amlodipineGrapefruit),

            .dialogue(speaker: .mara, lines: [
                "Tell her no. Even small amounts boost amlodipine levels. The half-life of grapefruit's CYP3A4 inhibition is about three days. So 'just in the morning' isn't a workaround — it stacks across days. Lemons, oranges, limes are fine. Grapefruit and Seville orange marmalade are out."
            ]),

            // End of day
            .scene("4:45 PM. Quiet. Light through the window has gone amber. The Bighorns are showing teeth — high snow is melting fast this week."),

            .dialogue(speaker: .mara, lines: [
                "Good Monday. We caught two prescribing errors today — that's a good day. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 7 — Six

    static let day7: RimrockShift = RimrockShift(
        dayNumber: 7,
        title: "Six",
        dateLine: "Tuesday, May 19",
        timeLine: "8:42 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Tuesday. Cooler than yesterday. The radio is on but Mara is already there, mid-conversation with somebody you can't see — short, bright sentences."),

            .dialogue(speaker: .mara, lines: [
                "Yes. Yes. Bus is at eight twenty. I know. I know. I love you. Go."
            ]),

            .scene("There's a brief pause on the radio. A door closing in the distance. Then she's back."),

            .dialogue(speaker: .mara, lines: [
                "...Sorry. Morning.",
                "Today's patient safety. High-alert meds, weight-based dosing — the ones that hurt people when we get them wrong."
            ]),

            // Mid-morning — pediatric dosing
            .scene("9:50. The bell clatters. A grandmother — RUTH, late seventies, no chart in your system, says she's covering for her daughter today. Hands you a pediatric Rx for her grandson MASON, age 6, weight 22 kg. Drug: amoxicillin-clavulanate 600 mg / 5 mL suspension, sig 5 mL po bid x 10d, for an ear infection."),

            .dialogue(speaker: .mara, lines: [
                "Pediatrics. Always check the dose. Children aren't small adults. Amoxicillin-clavulanate at the high range is ninety mg/kg/day of the amoxicillin component, divided BID. Math the dose."
            ]),

            .question(.day7_pediDosing),

            .dialogue(speaker: .mara, lines: [
                "Twenty-two kilos times ninety equals nineteen-eighty milligrams a day. The 600 mg / 5 mL suspension delivers six hundred per dose; BID is twelve hundred a day. Twelve hundred divided by twenty-two is fifty-five mg/kg/day. Within range, on the low end. Acceptable for a moderate ear infection.",
                "Dispense. Counsel her on shaking the bottle, refrigeration, finishing the full ten days. Even if Mason feels better in three."
            ]),

            // Mid-morning — IV contrast / metformin
            .scene("11:15. Phone rings. Caller ID: SHERIDAN IMAGING."),

            .phoneCall(RimrockPhoneCall(
                callerID: "SHERIDAN IMAGING",
                turns: [
                    RimrockPhoneTurn(speaker: .named("CLERK"), line: "Hi, calling about a patient scheduled for CT with contrast tomorrow morning. We see he's on metformin. Can you confirm he's been told to hold it?"),
                    RimrockPhoneTurn(speaker: .player, line: "Let me pull his record.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Look him up. Find the metformin. Note the contrast study."
            ]),

            .scene("Patient: BURT BRENNAN, on metformin 1000 mg BID. Last fill three weeks ago. No notes about IV contrast in his chart."),

            .question(.day7_metforminContrast),

            .dialogue(speaker: .mara, lines: [
                "Tell Sheridan we hadn't been notified. Ask them to confirm with Mr. Brennan that he's holding metformin for forty-eight hours after contrast and rechecking renal function before restarting. That's standard. They probably already told him; they're calling to be safe.",
                "Note it in the chart. Next refill, we ask whether he's restarted."
            ]),

            // Afternoon — insulin / high-alert
            .scene("2:40. A new Rx hits the queue: insulin glargine 100 units/mL, dispense one 10 mL vial, sig 18 units sub-Q at bedtime, for a new diabetic. The DUR tags it: HIGH-ALERT MEDICATION."),

            .question(.day7_highAlertMed),

            .dialogue(speaker: .mara, lines: [
                "Insulin is on every high-alert list — ISMP, Joint Commission, every safety body. Mix-ups between insulin types — long-acting glargine confused with rapid-acting lispro — kill people. Same with units versus mL — write 'units' as 'units,' never 'U,' which gets read as zero. Tall man lettering: HumaLOG vs HumuLIN.",
                "He's new — has he been on insulin before?"
            ]),

            .scene("New diabetic, just diagnosed, scared. You spend twenty minutes counseling: injection sites, refrigeration, what to do if blood sugar drops too low, when to call the doctor. He thanks you twice."),

            .question(.day7_ismpDoNotUse),

            // 3:10 — Insulin LASA trap
            RimrockCYOA.day7_insulinLASA,

            // End of day — Mara's son
            .scene("4:35. Quiet stretch. You hear something through the radio — a small voice, far from the microphone, asking something. Mara, off-mic, soft: 'In a minute, sweetheart. I'm working.'"),

            .scene("She's back."),

            .dialogue(speaker: .mara, lines: [
                "...Sorry. He's six. He thinks every minute I'm not on the phone is a minute I'm available.",
                "Anyway. Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 8 — Form 222

    static let day8: RimrockShift = RimrockShift(
        dayNumber: 8,
        title: "Form 222",
        dateLine: "Wednesday, May 20",
        timeLine: "8:30 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Wednesday. The day Mara's been talking about. Coffee. Fridge log. Queue."),

            .dialogue(speaker: .mara, lines: [
                "Today's C-II inventory. Dolores brings them at noon. Two things to set up first.",
                "One — there's a hospice script in the queue. We'll do it before noon. Two — clear off the back counter, you're going to need the space."
            ]),

            // Hospice walk-in
            .scene("9:45. The bell clatters. A man in his fifties, navy blazer, tired eyes. Sets a paper Rx on the counter and pushes it toward you carefully, like it might wake somebody."),

            .dialogue(speaker: .named("CALEB MORROW"), lines: [
                "For my mother. She's at the hospice on Pine. They sent me with this."
            ]),

            .scene("Wait — Morrow. You glance at the address. It IS the same Morrow family — Harlan from Day 1, Cora from Day 2. This is their son. His mother is up the road from the pharmacy he just walked into."),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Patel, MD (hospice attending)",
                prescriberDetail: "Wet ink. Fresh. The hospice address is stamped at the top.",
                patientName: "MAUREEN MORROW",
                patientDOB: "02/14/1944",
                drug: "Oxycodone-Acetaminophen",
                strength: "10/325 mg",
                sig: "i tab po q4h prn pain",
                quantity: 60,
                refills: 0,
                isHandwritten: true,
                physicalNote: "Hospice prescriber. C-II. New prescription each fill — no refills. Federal allows partial-fill flexibility for hospice."
            )),

            .dialogue(speaker: .mara, lines: [
                "Hospice. We get more flexibility there. Federal lets a tech fill a partial CII for any patient, but for hospice or LTC, the remaining quantity can be dispensed across multiple partial fills within thirty days. CARA — Comprehensive Addiction and Recovery Act, 2016."
            ]),

            .question(.day8_ciiPartialFill),

            .dialogue(speaker: .mara, lines: [
                "Fill all sixty today. The family is dealing with enough; don't make them come back. Counsel briefly — pain control, constipation prevention, what to do if she stops being able to swallow. He probably knows but you ask. Be gentle."
            ]),

            .scene("You count, verify, bag. Caleb signs for it. He tries to thank you and his voice catches. He just nods and leaves. The bell clatters."),

            .dialogue(speaker: .mara, lines: [
                "...Yeah.",
                "We do that one over and over in this job. Some of them harder than others."
            ]),

            // Noon — C-II delivery
            .scene("12:04. The bell clatters. Dolores comes in pulling a hand truck with two locked steel containers strapped to it."),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Two for the safe. Form 222s in the brown envelope. Sign the back of each one when you've matched the count. I'll wait — I have to take the carbons back to Sheridan."
            ]),

            .dialogue(speaker: .mara, lines: [
                "Open the brown envelope. Three carbon copies. White, green, blue. Read me what's where."
            ]),

            .scene("White copy: blank, ours. Green: blank, ours after counting. Blue: filled out, signed by the supplier — that's Dolores's bringback for the wholesaler. Each line item: drug name, strength, package size, number of packages."),

            .question(.day8_form222Copies),

            .dialogue(speaker: .mara, lines: [
                "Or — if we'd ordered through CSOS, the electronic system, no paper. Same data, digital signatures, same DEA records. Most chain pharmacies are CSOS-only by now. We do paper because Hollis still uses a fountain pen, and the wholesaler accommodates her. So.",
                "Open the containers."
            ]),

            .scene("Inside: a sealed bottle of oxycodone IR 5 mg, count 100. A bottle of hydrocodone-acetaminophen 5/325, count 500. A bottle of methylphenidate 10 mg, count 100. A bottle of methadone 10 mg, count 100 — for pain, not for OUD."),

            .dialogue(speaker: .mara, lines: [
                "Match the bottle counts against the Form 222. Match the NDCs. Sign the green and white copies, file the white in the controls binder, give the green back to Dolores. She takes it to the wholesaler.",
                "Now open the safe and add these to the perpetual inventory log."
            ]),

            .scene("You unlock the controlled vault. Inside: a binder with one page per drug, each page tracking every transaction in and out. You add today's amounts to the running totals. The perpetual count for each drug now matches what's physically on the shelf."),

            .question(.day8_perpetualInventory),

            .dialogue(speaker: .mara, lines: [
                "Every two weeks we physically count what's in the safe and reconcile against the perpetual. If they match, all good. If they don't, we investigate immediately. Could be a count error. Could be a billing error. Could be theft. Always look at the boring explanations first.",
                "Today's clean. Document the count, sign and date the log, lock the safe."
            ]),

            // 12:40 — Brett tries the pre-sign
            RimrockCYOA.day8_form222PreSign,

            // Afternoon — biennial inventory question
            .scene("Dolores has left. The afternoon goes quiet. You file the new invoice and start straightening the controls binder."),

            .dialogue(speaker: .mara, lines: [
                "While you're in there — biennial inventory's due in November. Means every two years we count every controlled substance in the building. C-IIs counted exactly; C-III through V can be estimated for bottles over a thousand. Records kept on-site for two years, accessible to DEA on request."
            ]),

            .question(.day8_biennialInventory),

            .dialogue(speaker: .mara, lines: [
                "Some pharmacies do it more often than every two years just to be safe. We do every six months for our own peace of mind. Brett does the count when he's in. I do it when he's not.",
                "...Anyway."
            ]),

            // End of day
            .scene("4:30 PM. The lobby is empty. The Bighorns are clear today, all the way to the snow line."),

            .dialogue(speaker: .mara, lines: [
                "Good day. Hospice script and a clean inventory. We earned this evening.",
                "Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 9 — Operations

    static let day9: RimrockShift = RimrockShift(
        dayNumber: 9,
        title: "Operations",
        dateLine: "Thursday, May 21",
        timeLine: "8:36 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Thursday. Coffee. Fridge log. The queue is the longest it's been — twelve scripts waiting, half flagged in red for insurance issues."),

            .dialogue(speaker: .mara, lines: [
                "Welcome to the worst part of the job. Today's operations — insurance, NDCs, prior auths, copays, vacation overrides. The work nobody talks about in pharmacy school but eats half your hours in retail."
            ]),

            // Insurance rejection — NDC issue
            .scene("9:00. First red flag in the queue: a Lipitor 40 mg refill, six months on file, kicked back from the insurance with: NDC NOT COVERED."),

            .dialogue(speaker: .mara, lines: [
                "She's been on this for half a year, suddenly her plan doesn't cover the NDC we've been billing. Either the manufacturer changed the NDC, or the plan changed formularies, or both. Read me the NDC structure."
            ]),

            .question(.day9_ndcStructure),

            .dialogue(speaker: .mara, lines: [
                "Eleven digits in three segments — labeler, product, package. Sometimes you'll see ten-digit NDCs from old packaging; pharmacy software pads them to eleven. The labeler segment changed if the manufacturer transferred the product or repackaged. Pull her insurance card. What's the BIN and PCN?"
            ]),

            .question(.day9_binPcn),

            .dialogue(speaker: .mara, lines: [
                "BIN routes the claim to the processor. PCN routes within the processor — different plans use different PCNs even if they share a BIN. Group ID identifies the employer plan. Cardholder ID is the patient.",
                "Try a different NDC for the same drug — Mylan 40 mg generic instead of the brand. Same patient, same dose, different labeler segment. See if that goes through."
            ]),

            .scene("You resubmit with the Mylan generic NDC. Insurance pays. $4 copay. Done."),

            // Mid-morning — copay coupon + Medicare
            .scene("10:30. The bell clatters. A woman in her late sixties hands you a manufacturer copay coupon for an Eliquis prescription. Her insurance card is Medicare Part D."),

            .dialogue(speaker: .mara, lines: [
                "Do not run that coupon."
            ]),

            RimrockCYOA.day9_medicareCouponKickback,

            .question(.day9_couponMedicare),

            .dialogue(speaker: .mara, lines: [
                "Manufacturer coupons can't be used with Medicare or Medicaid — federal anti-kickback statute. Doing so is a federal crime, and not a small one. The patient may not know. Tell her gently. Look at her plan's tier; if Eliquis is tier four, she's looking at a real copay. Direct her to the manufacturer's patient assistance program — most have one for Medicare patients that's not a coupon, it's a separate enrollment.",
                "Document the conversation. Don't just hand the coupon back; explain why."
            ]),

            .scene("You explain. She thanks you, takes the coupon back, asks if you can call the manufacturer about the assistance program. You say yes and write down the patient services number."),

            // Mid-day — vacation override
            .scene("12:50. The phone rings. A patient — JIM HORACEK — calling about a vacation override. He's on a thirty-day refill of metformin and lisinopril, leaving for three weeks to see his daughter in Maine, won't be back before next refill."),

            .question(.day9_vacationOverride),

            .dialogue(speaker: .mara, lines: [
                "Most insurances allow a vacation override once per year for a thirty- or ninety-day early fill. Submit with override code 03 — vacation. If the insurance kicks it back, we call them. If they refuse, the patient pays cash for the bridge supply. We don't let him run out of metformin in Maine.",
                "He's got two refills left — easy. Bill for thirty more days, ship to his Maine address if he wants, or he picks up before he leaves."
            ]),

            .scene("You set up the override. Approved on the first try. Jim picks up that afternoon."),

            // Afternoon — prior auth
            .scene("2:15. The queue throws another red flag. A new prescription for Ozempic — a GLP-1 agonist for type 2 diabetes — kicked back: PRIOR AUTHORIZATION REQUIRED."),

            .question(.day9_priorAuth),

            .dialogue(speaker: .mara, lines: [
                "Prior auth. Insurance wants the prescriber to justify why this drug, this patient, this dose, before they pay. We can't do the prior auth — it has to come from the prescriber. We notify the prescriber's office and tell the patient we're working on it. Average turnaround: three to seven business days, sometimes weeks for specialty drugs.",
                "Patient often doesn't understand we're not the bottleneck. Tell them clearly: we sent the request to the prescriber, the prescriber sends it to the insurance, the insurance decides. We're the messenger. Once you stop apologizing for things you can't control, this job gets easier."
            ]),

            .scene("You fax the prior auth request to the prescriber's office. Stamp the queue with PA-PENDING. Move on."),

            // End of day
            .scene("5:00 PM. Twelve scripts cleared. Three prior auths still pending. Two vacation overrides processed. One copay coupon redirected to a patient assistance program. Real work."),

            .dialogue(speaker: .mara, lines: [
                "Good Thursday. Operations is the part nobody respects but it's half the value we add. You did clean work today.",
                "Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 10 — Marlow

    static let day10: RimrockShift = RimrockShift(
        dayNumber: 10,
        title: "Marlow",
        dateLine: "Friday, May 22",
        timeLine: "8:42 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. The morning is brighter than it's been in days. The Bighorns have cleared. The queue printer is chunking out something."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Easy Friday, hopefully. We'll do high-alert opioid content today — there's a lot of it on the PTCE."
            ]),

            // 9:30 — first opioid teaching beat
            .scene("9:30. A walk-in for a refill on tramadol. Patient: SAUL EVERETT, on tramadol 50 mg for chronic back pain, been on it eighteen months, no flags."),

            .question(.day10_oxycodoneClass),

            .dialogue(speaker: .mara, lines: [
                "Tramadol's interesting — partial mu opioid agonist plus serotonin and norepinephrine reuptake inhibition. C-IV. Dual mechanism means dual side effects: classic opioid plus serotonin syndrome risk if combined with SSRIs or SNRIs. Saul's not on those, so we're fine. But ALWAYS check.",
                "Counsel: don't drink with it, don't drive until he knows how it affects him, don't double doses if he forgets."
            ]),

            .scene("Fill, verify, counsel. Saul nods through it; he knows the routine. He pays in cash and leaves."),

            // 11:15 — the Marlow Rx arrives
            .scene("11:15. The night drop pile from Thursday — you didn't get to it yesterday. You start sorting. Three refills, two transfers in, and one paper Rx you don't recognize."),

            .scene("You pick it up. The handwriting is fountain pen — Hollis. The patient name doesn't appear in your system."),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. Ellen Hollis",
                prescriberDetail: "Fountain pen. Dated yesterday. Wet-ink signature.",
                patientName: "MARCUS MARLOW",
                patientDOB: "06/14/1978",
                drug: "Oxycodone IR",
                strength: "10 mg",
                sig: "i tab po q4h prn pain",
                quantity: 120,
                refills: 0,
                isHandwritten: true,
                physicalNote: "Address is a P.O. box in Buffalo, not a residential address. Diagnosis line: 'CHRONIC PAIN.' That's all."
            )),

            .scene("You read it twice. Marcus Marlow. Not in the system. C-II. Oxycodone 10 mg, every four hours as needed, quantity one hundred twenty. That's a thirty-day supply at maximum dose."),

            .dialogue(speaker: .mara, lines: [
                "..."
            ]),

            .scene("The radio is silent. Then:"),

            .dialogue(speaker: .mara, lines: [
                "Set that one aside. Don't fill it. Don't bill it. Don't enter it in the system. Put it in the top drawer of the back desk under the FAX RECEIVED tray. We'll deal with it together."
            ]),

            .choice(
                prompt: "Respond",
                choices: [
                    RimrockChoice(
                        label: "Why? What is it?",
                        tone: .press,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "I need to think about it. I'll explain. Not today.",
                                "Just — set it aside."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Got it.",
                        tone: .accept,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Thank you."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Same patient as the note?",
                        tone: .curious,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...You read it. Of course you did.",
                                "Yeah. Same name. I'll explain. Not today. Set it aside."
                            ])
                        ]
                    )
                ]
            ),

            .object(
                name: "A prescription, set aside",
                description: "You file it in the top drawer of the back desk, under the FAX RECEIVED tray. The drawer holds papers Mara doesn't want filled and doesn't want talked about.",
                logEntry: RimrockLogEntry(
                    title: "Marcus Marlow — first prescription",
                    body: "Hollis-handwritten oxycodone IR 10 mg, qty 120. P.O. box address in Buffalo. \"CHRONIC PAIN.\" Set aside per Mara, not filled."
                )
            ),

            // Afternoon — red flag teaching
            .scene("Mara is quiet for a long stretch after that. You work the queue. A flu shot walk-in. Two refills. A transfer-out request. Routine work, the rhythm of it grounding."),

            .dialogue(speaker: .mara, lines: [
                "...Okay. Since we're on opioids today anyway. Tell me what you'd flag as suspicious on a controlled-substance prescription. Hypothetically."
            ]),

            .question(.day10_redFlags),

            .dialogue(speaker: .mara, lines: [
                "All of those, and combinations. The DEA's Practitioner's Manual lists more — out-of-state prescriber for a local patient, cash payment, large quantities, multiple short-acting opioids together, geographic patterns where patients drive past three closer pharmacies to fill at one specific one. Each red flag in isolation might mean nothing. Stacked, they mean something.",
                "Pharmacist's corresponding responsibility — federal regulation 21 CFR 1306.04 — says a prescription is only valid if issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice. Pharmacists who fill prescriptions they should have known were illegitimate share liability with the prescriber.",
                "We don't fill what we know shouldn't be filled."
            ]),

            .question(.day10_correspondingResponsibility),

            // Afternoon — verification
            .scene("Quiet stretch. The afternoon goes long. Mara's voice, when she comes back, is different — more measured."),

            .dialogue(speaker: .mara, lines: [
                "While we're at it — DEA verification. You can look up any prescriber's DEA registration on the DEA Diversion Control website. Free. Active, expired, surrendered, revoked. Doesn't tell you whether the prescription is legitimate, but tells you whether the prescriber is current and what schedules they're allowed to write."
            ]),

            .question(.day10_deaLookup),

            .dialogue(speaker: .mara, lines: [
                "Ellen Hollis is current, full schedules. I checked.",
                "...Anyway. Lock up. We'll talk about Monday's plan first thing Monday. Have a weekend."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 11 — Late Shift

    static let day11: RimrockShift = RimrockShift(
        dayNumber: 11,
        title: "Late Shift",
        dateLine: "Monday, May 25",
        timeLine: "1:14 PM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("You walk in at one. The lobby is at noon-quiet. The radio is already on. You can hear Beans in the background — a soft snort, the click of nails on hardwood. Mara is at home today; she said she would be."),

            .dialogue(speaker: .mara, lines: [
                "Afternoon. Twelve to eight today — Monday closing shift. Slow afternoon usually, busier toward seven when people get off work.",
                "We'll do HIPAA. Lot of it on the PTCE. Most of it is common sense; the edge cases will trip you up."
            ]),

            // Mid-afternoon — privacy phone call
            .scene("3:42. Phone rings. Caller ID: VOLLMER, J."),

            .phoneCall(RimrockPhoneCall(
                callerID: "VOLLMER, J.",
                turns: [
                    RimrockPhoneTurn(speaker: .named("CALLER"), line: "Hi, calling about my wife's prescriptions. Can you tell me what she's picking up?"),
                    RimrockPhoneTurn(speaker: .player, line: "Could I get her name and date of birth?"),
                    RimrockPhoneTurn(speaker: .named("CALLER"), line: "Margaret Vollmer, October fifteenth, fifty-eight. Just want to know what's in the bag.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Easy now. Pull her record. Look for HIPAA authorization on file."
            ]),

            .scene("Margaret Vollmer's profile. Authorization to share PHI with husband: NOT ON FILE. Standard pickup permitted under treatment, payment, operations. But specifics — drug names, diagnoses, dosing — require written authorization."),

            .question(.day11_hipaaPHI),

            .dialogue(speaker: .mara, lines: [
                "He can come pick it up. That's permitted under TPO — treatment, payment, operations. He can't ask what's IN the bag, can't ask what it's for, can't ask the dose. Tell him politely she'll need to authorize it in writing if she wants you to discuss specifics. Most husbands take that fine. Some get angry. He sounds like a fine."
            ]),

            RimrockCYOA.day11_hipaaSpouseLeak,

            .question(.day11_hipaaTPO),

            // Late afternoon — refill phone call
            .scene("5:30. Another phone call. Caller ID: UNKNOWN. A young man's voice, says he's calling for his father's refill — Burt Brennan, who you remember from Day 7's CT contrast call."),

            .dialogue(speaker: .mara, lines: [
                "Treatment, payment, operations covers refill requests. He doesn't need a paper authorization to ask for a refill on his dad's behalf. Doesn't need to discuss what the drug is or why. Just bill it, ready it, hand it over when whoever picks up shows up. Family members do this all the time."
            ]),

            .question(.day11_hipaaNPP),

            .scene("You process the refill. The son says he'll come by tomorrow."),

            // Quiet evening
            .scene("7:10. The lobby is empty. Through the front windows the light has gone full amber, then violet at the high edges. Mara has been quiet for a while. Beans sighs audibly."),

            .dialogue(speaker: .mara, lines: [
                "Theo's at his dad's tonight. Quiet house. Beans doesn't approve.",
                "...What kept you in this part of the country, anyway?"
            ]),

            .choice(
                prompt: "What kept you here",
                choices: [
                    RimrockChoice(
                        label: "Cheap rent.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Mm. That's how I ended up here too."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "I needed somewhere quiet.",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "It's that, alright."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "I had a person here once. They're not here anymore.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "I won't ask."
                            ])
                        ]
                    )
                ]
            ),

            .question(.day11_hipaaBreach),

            // End of shift
            .scene("8:00. You lock up. The Bighorns are blacking out against the last of the light."),

            .dialogue(speaker: .mara, lines: [
                "Drive safe. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 12 — What's Her Name

    static let day12: RimrockShift = RimrockShift(
        dayNumber: 12,
        title: "What's Her Name",
        dateLine: "Tuesday, May 26",
        timeLine: "8:38 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Tuesday. Cool morning, fog still on the lower valleys. Coffee. Fridge log. The queue is light — Memorial Day weekend ate most of the Friday-Saturday volume."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's pharmacy law — recordkeeping, registration, inventory, recalls. The stuff that gets us audited if we don't do it right."
            ]),

            // Wren reference
            .scene("9:15. You're straightening the back of the dispensary. The label printer was relocated to a corner that doesn't make sense. The C-IV bottles are alphabetized by brand name, not generic. Things are in inconsistent places, like someone different organized this room once and you're seeing their fingerprint."),

            .dialogue(speaker: .mara, lines: [
                "Wren had her own system. Different from mine. You'll keep finding it."
            ]),

            .scene("You set the bottle down."),

            .choice(
                prompt: "Wren",
                choices: [
                    RimrockChoice(
                        label: "Who's Wren?",
                        tone: .curious,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "She was the tech here before you. About a year. She's not here anymore."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "The W on the mug.",
                        tone: .press,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah. The W on the mug. The W on the note. Wren Bishop. She was the tech here before you, about a year. She's not here anymore."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Whatever you want to tell me.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Thanks.",
                                "Her name is Wren Bishop. She was the tech here before you. About a year. She's not here anymore."
                            ])
                        ]
                    )
                ]
            ),

            .dialogue(speaker: .mara, lines: [
                "I'll tell you the rest when I'm ready. Not yet."
            ]),

            // Mid-morning — recordkeeping spotlight
            .scene("Back to work. A C-IV refill processing. Alprazolam 0.5 mg, sig i tab po tid prn anxiety, qty 90, the second of three refills. Patient: Hollis-prescribed."),

            .dialogue(speaker: .mara, lines: [
                "While we're processing — how long do we keep controlled-substance records?"
            ]),

            .question(.day12_recordRetention),

            .dialogue(speaker: .mara, lines: [
                "Two years federally for controls. State can require longer — Wyoming says five for some things. We keep ten because Brett has lost things before and I don't trust the room.",
                "C-IIs in their own binder, separated. C-III through V together. Invoices, Form 222s, perpetual logs, biennial counts, theft reports. All of it."
            ]),

            // Subpoena reveal
            .scene("11:30. The radio is quiet. Then:"),

            .dialogue(speaker: .mara, lines: [
                "...I was subpoenaed last month. Witness, not target. That's all I'll say about it right now. I tell you because if anyone calls asking about pharmacy records, you put them through to me. Don't answer questions on your own. Even if they say they're law enforcement.",
                "Especially if they say they're law enforcement."
            ]),

            .scene("There's a pause. Then a small voice in the background. Mara, off-mic: 'Theo, sweetheart, I'll be done at six. ...Yes. ...I love you.'"),

            .dialogue(speaker: .mara, lines: [
                "...Sorry. Theo's birthday is next week. He's turning seven. He's been counting down for two months."
            ]),

            // Continue spotlight
            .scene("Afternoon brings a wholesaler delivery — the standard Tuesday non-controlled order. You verify against the invoice and start stocking."),

            .question(.day12_deaRegistrationTypes),

            .dialogue(speaker: .mara, lines: [
                "Pharmacy registration is its own DEA number — different from the prescribers we get scripts from. Every site, every registrant, separate registration. Renewed every three years."
            ]),

            // Recall scenario
            .scene("3:20. The fax machine kicks on. A drug recall notice — Class II, voluntary recall by manufacturer. Lisinopril 10 mg, specific lot numbers, due to potential nitrosamine impurity. Affected lots include a number we have."),

            .question(.day12_drugRecallClass),

            .dialogue(speaker: .mara, lines: [
                "Class II recall — temporary or medically reversible adverse effects. Class I is reasonable probability of serious harm or death. Class III is unlikely to cause harm but doesn't meet labeling requirements. The recall notice tells us the lot, what to do with stock, and how to notify patients who got the affected lot.",
                "Pull our stock of that lot, segregate it for return. Run a report of patients who got that lot in the last six months. We call them. Doesn't matter how late we close — we call them."
            ]),

            .question(.day12_recallProcedure),

            .scene("You pull the affected lot. Five bottles in stock. Tag them, segregate. Run the dispensing report — eleven patients in the last six months. You get the call list together for tomorrow morning."),

            // End of day
            .scene("4:55. The valley is going long-shadowed. Theo's voice, distant: 'Mom, are you done?' Mara, soft: 'Almost.'"),

            .dialogue(speaker: .mara, lines: [
                "Lock up. We'll work the recall calls in the morning. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 13 — Second Marlow

    static let day13: RimrockShift = RimrockShift(
        dayNumber: 13,
        title: "Second Marlow",
        dateLine: "Wednesday, May 27",
        timeLine: "8:35 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Wednesday. The recall calls take the morning — eleven patients, half of whom answered, half of whom got voicemails. By eleven you've reached most of them and arranged returns. The work feels good. Useful."),

            .dialogue(speaker: .mara, lines: [
                "That was clean. Today's prescription verification — signatures, forgery, EPCS, supply chain. Patient Safety domain, but it bleeds into Federal."
            ]),

            // 11:40 — second Marlow Rx
            .scene("11:40. You're sorting the morning night drop pile that you didn't get to during recall calls. Three refills. One transfer. One paper Rx."),

            .scene("You pick it up. C-II preprinted pad. Patient: MARCUS MARLOW, DOB 06/14/1978. Same name. Different prescriber line. Signed Dr. T. Stevens, MD."),

            .scene("But the handwriting. The way the o's are closed. The slight backslant. The way 'mg' is written with the lowercase g looping below the line. It's the same handwriting as the first Marlow Rx. It's Hollis's hand. With Stevens's name on the signature line."),

            .prescription(RimrockPrescription(
                prescriberName: "Dr. T. Stevens, MD",
                prescriberDetail: "Wet ink. The signature is rounded and confident. The handwriting in the body is the same as a Hollis script you handled this week.",
                patientName: "MARCUS MARLOW",
                patientDOB: "06/14/1978",
                drug: "Oxycodone IR",
                strength: "10 mg",
                sig: "i tab po q4h prn pain",
                quantity: 120,
                refills: 0,
                isHandwritten: true,
                physicalNote: "Same handwriting as Hollis's. Different prescriber name printed at the top. Different signature."
            )),

            .dialogue(speaker: .mara, lines: [
                "..."
            ]),

            .scene("Static. Radio silence."),

            .dialogue(speaker: .mara, lines: [
                "Same drawer. Set it aside. Same drawer as the first one."
            ]),

            .object(
                name: "A second prescription, same drawer",
                description: "Set aside. Same name on the patient line. Different prescriber printed at the top. Same handwriting in the body of the script.",
                logEntry: RimrockLogEntry(
                    title: "Marcus Marlow — second prescription",
                    body: "Same patient name, same drug, same dose, same quantity. Different prescriber name and signature. Handwriting in the body matches the first Marlow Rx (Hollis's). Set aside, not filled."
                )
            ),

            // Spotlight: forgery red flags
            .dialogue(speaker: .mara, lines: [
                "Forgery red flags. Walk me through what you'd watch for. Hypothetically."
            ]),

            .question(.day13_forgeryRedFlags),

            .dialogue(speaker: .mara, lines: [
                "All of those, plus altered or different-color ink between the body and signature, prescription pad numbers that don't match the prescriber's office, prescriptions that look photocopied. The Pharmacist's Manual lists more.",
                "Verifying the signature against a known sample is harder than it sounds. We don't have a reference signature on file for most prescribers. We rely on internal consistency — does the body of the script and the signature look like the same person wrote both?"
            ]),

            .question(.day13_signatureVerification),

            // Mid-afternoon — EPCS context
            .scene("Afternoon. An e-Rx hits the queue. Hollis's name, hydrocodone-acetaminophen for a different patient. Sent through EPCS — Electronic Prescriptions for Controlled Substances."),

            .dialogue(speaker: .mara, lines: [
                "EPCS. The prescriber authenticated through their identity-proofed credential, signed digitally, and the system transmitted directly to us. Two-factor authentication on the prescriber side. Tamper-evident audit trail. Can't be photocopied or modified. The DEA started allowing it in 2010 and Medicare mandated it for most prescriptions in 2021."
            ]),

            .question(.day13_epcsRequirements),

            .dialogue(speaker: .mara, lines: [
                "EPCS prescriptions are harder to forge than paper. Doesn't make them impossible. A compromised prescriber credential — if someone gets the prescriber's two-factor — can write scripts that look legitimate all the way down. The audit trail catches it eventually, but eventually can be a long time."
            ]),

            // Late afternoon — DSCSA / supply chain
            .scene("3:40. A wholesaler call about a manufacturer transaction. Mara walks the player through the Drug Supply Chain Security Act paperwork — DSCSA, the system for tracking prescription drugs from manufacturer to dispensing pharmacy."),

            .question(.day13_dscsa),

            .dialogue(speaker: .mara, lines: [
                "DSCSA — every prescription drug has a transaction history that follows it through the supply chain. Manufacturer to wholesaler to pharmacy. Pharmacy keeps the records six years. Catches counterfeits, catches diversion, catches recalls. The full track-and-trace requirements went into effect 2023.",
                "We don't usually deal with DSCSA paperwork directly — the wholesaler handles most of it — but we have to be able to produce records on request."
            ]),

            // 4:20 — Margaret Thiel DUR clarithromycin
            .scene("4:20. Margaret Thiel — Hollis's amlodipine patient from Day 6 — sends through a new e-Rx. Clarithromycin 500 mg, sig BID x 7d, sinus infection. Her profile shows simvastatin 40 mg has been on board for two years."),

            RimrockCYOA.day13_durOverride,

            // End of day — Mara strained
            .scene("4:50. The lobby is empty. Mara has been quieter than usual since the second Marlow showed up."),

            .dialogue(speaker: .mara, lines: [
                "...Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 14 — Inspector

    static let day14: RimrockShift = RimrockShift(
        dayNumber: 14,
        title: "Inspector",
        dateLine: "Thursday, May 28",
        timeLine: "8:30 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Thursday. The fog is in the trees today, thick. Coffee. Fridge log. Queue."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Heads up — state board inspectors do unannounced visits, sometimes by phone first. Be ready. They're testing whether we know what we're doing.",
                "If one calls today or any day, take the call. Calm. Answer in your own words first; I'll feed you the answers if you stall, but they're listening for whether you understand."
            ]),

            // 10:14 — the inspector calls
            .scene("10:14. Phone rings. Caller ID: WYOMING STATE BOARD OF PHARMACY."),

            .dialogue(speaker: .mara, lines: [
                "There it is. Take it."
            ]),

            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Hi, this is Inspector Riggs from the Wyoming State Board. Few questions if you have a moment. Nothing's wrong — routine compliance check."),
                    RimrockPhoneTurn(speaker: .player, line: "...sure. Go ahead.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Calm. Breathe. He's nice."
            ]),

            // Inspector Q1 — HIPAA scenario
            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Quick scenario. A friend of a patient calls and says she's worried, asks what medications the patient is on. She's not on the HIPAA authorization. What do you do?")
                ]
            )),

            .question(.day14_inspectorHIPAA),

            .dialogue(speaker: .mara, lines: [
                "Good. Tell him exactly that."
            ]),

            // Inspector Q2 — Form 222 retention
            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Good. Next — DEA Form 222 records. How long are you required to keep them, and where?")
                ]
            )),

            .question(.day14_inspectorRecords),

            .dialogue(speaker: .mara, lines: [
                "Good. He likes specifics — \"on-site, accessible to DEA on request\" is the phrase he wants."
            ]),

            // Inspector Q3 — OBRA-90 counseling
            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Patient counseling — federal requirement under OBRA-90. What's required, and what counts?")
                ]
            )),

            .question(.day14_inspectorOBRA),

            .dialogue(speaker: .mara, lines: [
                "Yeah. He likes that you said \"offered, not required\" — that's the federal floor. Many states require an actual counseling attempt, not just an offer."
            ]),

            // Inspector Q4 — USP <795>
            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Last one. Non-sterile compounding — USP chapter, beyond-use dating for water-containing oral preparation?")
                ]
            )),

            .question(.day14_inspectorUSP795),

            .dialogue(speaker: .mara, lines: [
                "Good. He's nodding."
            ]),

            // Inspector signs off
            .phoneCall(RimrockPhoneCall(
                callerID: "WYOMING STATE BOARD OF PHARMACY",
                turns: [
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "That's all I have. Tell Mara the chocolates I owe her are still coming. We'll do an in-person walkthrough later this summer. You did fine."),
                    RimrockPhoneTurn(speaker: .player, line: "Thank you."),
                    RimrockPhoneTurn(speaker: .named("INSPECTOR RIGGS"), line: "Take care.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "...That was Inspector Riggs. He calls every six months. He's nice. He likes that we don't bullshit him.",
                "Most pharmacies fail the first half of his questions because they're guessing. You didn't guess. That's the difference."
            ]),

            // Afternoon — quiet
            .scene("The afternoon goes quiet. The fog never quite burns off. The radio crackles less today than it has — Mara's voice steadier, almost relieved."),

            // End of day
            .scene("4:50 PM."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Sleep well. Tomorrow we'll talk about geriatric pharmacology — Beers Criteria, fall risks. I want you ready."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 15 — Evie

    static let day15: RimrockShift = RimrockShift(
        dayNumber: 15,
        title: "Evie",
        dateLine: "Friday, May 29",
        timeLine: "8:46 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. The valley is full sun, the snow line is up around 11,000 feet now. Coffee. Fridge log. The queue is small and clean."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's geriatric pharmacology — Beers Criteria, fall risk, polypharmacy. Half our patients are over sixty-five and most of those are on more drugs than is good for them. Knowing what to deprescribe is as much of a skill as knowing what to prescribe."
            ]),

            // Mid-morning — phone call about Evie
            .scene("10:18. The phone rings. Caller ID: ABERNATHY, R."),

            .dialogue(speaker: .mara, lines: [
                "Russell. That's Evie's son. Take it."
            ]),

            .phoneCall(RimrockPhoneCall(
                callerID: "ABERNATHY, R.",
                turns: [
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "Hi, this is Russell Abernathy. Calling about my mom — Evie. She fell yesterday afternoon. They kept her at the Sheridan hospital overnight."),
                    RimrockPhoneTurn(speaker: .player, line: "...is she okay?"),
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "Concussion and a bruised hip. She's home now, on bed rest. The hospital doctor said she's on too much medication. He told me to call her pharmacy and figure out what she's actually supposed to be on. I'm at her house. There's bottles of stuff she doesn't even know what for.")
                ]
            )),

            .dialogue(speaker: .mara, lines: [
                "Pull her profile. Read me everything."
            ]),

            .scene("Evie's profile, expanded view. Hydroxyzine 25 mg PRN anxiety. Diphenhydramine 50 mg at bedtime, OTC. Oxybutynin 5 mg BID — added a month ago for overactive bladder. Atorvastatin 40 mg. Metoprolol succinate 50 mg BID. Amlodipine 5 mg QD. Omeprazole 20 mg. A multivitamin she takes whenever she remembers."),

            .dialogue(speaker: .mara, lines: [
                "Stop. Look at the anticholinergics."
            ]),

            .question(.day15_anticholinergicBurden),

            .dialogue(speaker: .mara, lines: [
                "Hydroxyzine, diphenhydramine, oxybutynin — three anticholinergic drugs in one elderly patient. That's textbook anticholinergic burden. Confusion, dry mouth, constipation, urinary retention, falls. Beers Criteria flags every single one of those for adults over sixty-five.",
                "Now look at the orthostatic combination."
            ]),

            .question(.day15_orthostaticCombo),

            .dialogue(speaker: .mara, lines: [
                "Metoprolol plus amlodipine plus an aging vascular system. Get up too fast, blood pressure drops, you go over. Add the anticholinergic burden — confusion plus orthostasis — and a fall is not a question of if. It's when.",
                "She fell yesterday."
            ]),

            .question(.day15_beersCriteria),

            .scene("Russell, on the phone, has gone quiet."),

            .dialogue(speaker: .named("RUSSELL"), lines: [
                "...is that what happened to her?"
            ]),

            .dialogue(speaker: .player, lines: [
                "We can't say for sure. But the medications she's on stack risks. Let me talk to my pharmacist about what to recommend."
            ]),

            .dialogue(speaker: .mara, lines: [
                "Tell him we'll call Hollis's office and recommend deprescribing the diphenhydramine — there's no good reason for an eighty-year-old to be on diphenhydramine for sleep, and it's the worst offender on the list. We'll ask about reducing or stopping the oxybutynin. The hydroxyzine is harder — she relies on it. We'll suggest a non-anticholinergic alternative. The metoprolol and amlodipine probably stay; her cardiologist will want to weigh in.",
                "Tell him to keep her on bed rest, push fluids, no driving until she's reassessed. We'll call when we have the new orders."
            ]),

            .scene("You tell Russell. He thanks you twice. Says he'll wait by the phone."),

            // Late morning — call Hollis's office
            .scene("11:30. You call Hollis's office. The NP is on. You walk through the polypharmacy concerns — anticholinergic burden, fall risk, recent hospitalization. The NP listens. She's good. She'll talk to Hollis and call you back."),

            .dialogue(speaker: .mara, lines: [
                "...Yeah. Good call. Document everything."
            ]),

            .question(.day15_deprescribing),

            // Mid-afternoon — Hollis's office calls back
            .scene("2:40. Hollis's office calls back. New prescriptions: discontinue diphenhydramine, switch hydroxyzine to oral buspirone for daytime anxiety, reduce oxybutynin to 5 mg QD instead of BID, add a fall-prevention referral to physical therapy."),

            .dialogue(speaker: .mara, lines: [
                "Hollis listened. She doesn't always.",
                "Process the new orders. Bag them, label clearly. We'll have to coordinate the changeover with Russell — discontinue means stop tonight, not finish the bottle. Some of these are supplies she'll have at home; we want her to throw those out."
            ]),

            // Late afternoon — Russell calls back
            .scene("4:20. Russell calls back. He sounds different. He's been crying."),

            .phoneCall(RimrockPhoneCall(
                callerID: "ABERNATHY, R.",
                turns: [
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "I — thank you. I don't know how she would have figured this out without you. She doesn't know what most of these pills are."),
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "She's going to be okay."),
                    RimrockPhoneTurn(speaker: .player, line: "Tell her we said hi.")
                ]
            )),

            .scene("You hang up. The radio is quiet for a stretch."),

            .dialogue(speaker: .mara, lines: [
                "...That's the work. Most days you don't get a thank-you that bright. Today you did.",
                "Have you ever lost someone?"
            ]),

            .choice(
                prompt: "Have you ever lost someone",
                choices: [
                    RimrockChoice(
                        label: "Not in a way I want to talk about.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Right. Sorry I asked."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "My grandmother. She fell.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "I figured. The way you stayed on the phone with him. That's why you're good at this part."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Yeah. Long time ago.",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Mm.",
                                "It doesn't really go away. You just get more used to carrying it."
                            ])
                        ]
                    )
                ]
            ),

            // End of day
            .scene("4:55 PM. The lobby is empty. The Bighorns are clear and bright."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Drive safe. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 16 — Subpoena

    static let day16: RimrockShift = RimrockShift(
        dayNumber: 16,
        title: "Subpoena",
        dateLine: "Monday, June 1",
        timeLine: "8:32 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Monday. Coffee. Fridge log. The two-week C-II count is on the schedule. You unlock the safe."),

            .dialogue(speaker: .mara, lines: [
                "Cycle count first thing. We'll do the perpetual reconciliation while it's quiet."
            ]),

            // The count
            .scene("You take down the controls binder. Drug by drug. Oxycodone IR 5 mg: count matches. Methylphenidate 10 mg: matches. Adderall: matches. Methadone: matches."),

            .scene("Hydrocodone-acetaminophen 5/325, perpetual count says 458. You count physical bottles, then loose tablets in the working bottle. Four-forty-two."),

            .dialogue(speaker: .mara, lines: [
                "Recount. Slowly. Twice."
            ]),

            .scene("You recount. Twice. Sixteen short. The perpetual log says 458. The shelf has 442."),

            .dialogue(speaker: .mara, lines: [
                "...",
                "Are you kidding me. Are you actually kidding me."
            ]),

            .scene("Static. Then her voice, controlled."),

            .dialogue(speaker: .mara, lines: [
                "Brett. Of course it's Brett. He's been pulling the Wednesdays."
            ]),

            .question(.day16_theftResponseSequence),

            .dialogue(speaker: .mara, lines: [
                "Right. Secure the safe — don't touch anything else, don't redo the count again. Document what you found, with the times and your initials. Photograph if you can. The perpetual log entry stands as it is.",
                "I'll handle the rest. State board notification today, DEA Form 106 within the next business day. Pharmacist-in-charge has the obligation. That's me."
            ]),

            .question(.day16_form106),

            // Mid-morning — Mara handles Brett
            .scene("Mara is silent for a stretch. Then you hear the radio click as she takes another call. You can't hear the words, just her voice — flat, professional, then sharper, then very quiet. Then a click. The radio comes back."),

            .dialogue(speaker: .mara, lines: [
                "Brett denies. Then admits the alprazolam from last year. Then denies the hydrocodone. Then admits the hydrocodone. Then says we owe him for unused vacation.",
                "He's terminated effective immediately. State board has been notified. DEA gets the 106 in the morning. He won't fight it — he can't — and the board will pull his license within ninety days."
            ]),

            .question(.day16_pharmacistInCharge),

            // Mid-day — Mara mentions the warrant
            .scene("Lunch hour passes. The lobby is empty. Mara is back on the radio at one, voice steadier."),

            .dialogue(speaker: .mara, lines: [
                "Listen. While we're on the topic of investigations.",
                "If anyone calls asking about Marcus Marlow. Anyone. Including law enforcement. *Especially* law enforcement.",
                "You ask for a warrant. You don't acknowledge the name. You don't confirm or deny. You ask for a warrant. If they have one, you call me before you do anything. If they don't have one, you tell them politely that you can't help. Not until they have one. Got it?"
            ]),

            .choice(
                prompt: "Mara",
                choices: [
                    RimrockChoice(
                        label: "Got it.",
                        tone: .accept,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "Thank you."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "What's going on, Mara.",
                        tone: .press,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "I'll tell you. Soon. I promise.",
                                "...Soon."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Whatever you need. I trust you.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Thank you.",
                                "I'll explain. Soon."
                            ])
                        ]
                    )
                ]
            ),

            // Afternoon — opioid teaching to fill the day
            .scene("The afternoon goes quieter than usual. A few refills, two transfers, one new Rx — a methadone refill from the methadone clinic in Sheridan, separate from any C-II diversion concerns."),

            .question(.day16_mme),

            .dialogue(speaker: .mara, lines: [
                "MME — morphine milligram equivalents. Standardized way to compare opioid doses across different drugs. CDC and most state guidelines suggest caution above 50 MME daily, very careful conversation above 90. The Marlow scripts are 120 oxycodone IR 10 mg per month — that's a hundred and fifty MME a day at maximum dosing. Not in itself proof of anything. In combination with everything else — yeah."
            ]),

            // End of day
            .scene("4:50 PM. You lock the safe again. Document everything one more time. The day feels heavier than other days."),

            .dialogue(speaker: .mara, lines: [
                "Good work today. Brett is done. Lock up. Drive safe.",
                "Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 17 — Wren

    static let day17: RimrockShift = RimrockShift(
        dayNumber: 17,
        title: "Wren",
        dateLine: "Tuesday, June 2",
        timeLine: "8:34 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Tuesday. The morning is bright but cold. Coffee. Fridge log. Queue is small. Mara is quieter than yesterday, but steadier."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's pharmacy technician scope of practice. Boring on paper, but the PTCE asks because the line between what techs can do and what only pharmacists can do gets crossed in retail every day, mostly by pharmacists letting their techs do too much.",
                "We'll do questions in the gaps. Truck comes at ten."
            ]),

            // 10:08 — Dolores arrives
            .scene("10:08. The bell clatters. Dolores comes in pulling the hand truck. One box today — small order, mid-week."),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Just the one. Sign the invoice when you've matched it."
            ]),

            .scene("You count, sign, file. Dolores lingers a second longer than usual at the counter. She looks toward the radio, then back at you."),

            .dialogue(speaker: .named("DOLORES"), lines: [
                "Hey, kid.",
                "Off the record. Wren is at the Walgreens in Sheridan. She's a tech there now. Started about three months ago.",
                "I just thought you'd want to know.",
                "Don't tell Mara I said anything. She'll figure it out herself when she's ready."
            ]),

            .scene("Dolores pulls the hand truck out the door before you can answer. The bell clatters."),

            .object(
                name: "Information",
                description: "Wren Bishop. Tech at the Walgreens in Sheridan. Started about three months ago. Alive, working, twenty-five miles away.",
                logEntry: RimrockLogEntry(
                    title: "Wren is alive",
                    body: "Per Dolores: Wren Bishop is working as a tech at the Walgreens in Sheridan. Started about three months ago."
                )
            ),

            // 11:30 — Brett's count "round-up"
            .scene("11:30. Brett came in this morning to do the cycle count while Mara is at home with Theo. He has been quiet most of the morning, alphabetizing the C-IV bottles by brand name like that's a normal habit. Now he sets the controls binder down on the back counter and taps the oxycodone 30 mg page."),

            RimrockCYOA.day17_brettCountRoundUp,

            // Spotlight: pharmacy tech scope
            .dialogue(speaker: .mara, lines: [
                "...Good. Anyway. Tech scope.",
                "What can you do, what can you not do, what's pharmacist-only?"
            ]),

            .question(.day17_techScope),

            .dialogue(speaker: .mara, lines: [
                "Pharmacist-only: final verification, clinical judgment, counseling, DUR override decisions. Tech-allowed: data entry, label generation, counting, packaging, billing, inventory. The list narrows in some states and widens in others — Wyoming gives techs more than some, less than others. Tech-check-tech is permitted in some states for specific products in specific settings; not generally in retail."
            ]),

            .question(.day17_techCheckTech),

            .dialogue(speaker: .mara, lines: [
                "Tech-check-tech — TCT — usually limited to refills of the same drug at the same dose for the same patient. Floor stock in hospitals. Unit dose repackaging. Not for new prescriptions, not for controls, not in most retail. State law varies."
            ]),

            // Mid-afternoon — credentialing
            .scene("After lunch. A refill comes through that's coded oddly — patient name flagged \"REQUIRES PHARMACIST REVIEW\" in the system. You ask Mara about it."),

            .dialogue(speaker: .mara, lines: [
                "DUR override. The system flagged a potential interaction. Tech can flag it; tech can't override it. Pharmacist has to review the alert, decide whether to dispense as written, and document the rationale. That's pharmacist-only by federal regulation, and PTCE's favorite trap."
            ]),

            .question(.day17_dur),

            .dialogue(speaker: .mara, lines: [
                "Tell me, while we're at it — credentialing. PTCB versus NHA, certified versus registered."
            ]),

            .question(.day17_credentialing),

            .dialogue(speaker: .mara, lines: [
                "PTCB and NHA both administer national exams. PTCB is the older one. CPhT — Certified Pharmacy Technician — is the credential most states recognize. Registration is state-level — Wyoming registers techs through the state board, similar to most states. Continuing education, renewal cycles, criminal background check, depending on state."
            ]),

            // Late afternoon — Wren
            .scene("3:40. The lobby is empty. You've been thinking about Dolores's words all day."),

            .dialogue(speaker: .player, lines: [
                "Mara.",
                "Dolores told me Wren is at the Sheridan Walgreens. She wasn't sure I should tell you. I think she wanted me to."
            ]),

            .scene("Long pause. Static. The kind of static that's been there before."),

            .dialogue(speaker: .mara, lines: [
                "...Yeah.",
                "I figured she landed somewhere. I haven't asked."
            ]),

            .choice(
                prompt: "Mara",
                choices: [
                    RimrockChoice(
                        label: "You should call her.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "I'll think about it."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "I won't bring it up again.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Thanks. But you can. It's not — it's not a secret. It's just hard."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Whatever you want to do is right.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "I haven't done anything in six months. So.",
                                "...I'll think about it."
                            ])
                        ]
                    )
                ]
            ),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Drive safe. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 18 — Penance

    static let day18: RimrockShift = RimrockShift(
        dayNumber: 18,
        title: "Penance",
        dateLine: "Wednesday, June 3",
        timeLine: "1:18 PM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Late shift again. Mondays and Wednesdays now. The lobby is at noon-quiet when you arrive. The radio is on. You can hear Beans somewhere in the background, a contented sigh."),

            .dialogue(speaker: .mara, lines: [
                "Afternoon. Today's medication errors — reporting, root cause, Just Culture, Joint Commission goals. The PTCE asks a lot of questions on this and they all sound abstract until you've made an error. Then they're not abstract.",
                "We'll work through them as they come up."
            ]),

            // Mid-afternoon — Mara starts the confession
            .scene("3:20. The lobby has been empty for two hours. You've been working through the queue. Then the radio goes quiet for a long stretch and Mara comes back, voice low."),

            .dialogue(speaker: .mara, lines: [
                "Wren found the first Marlow Rx six months ago.",
                "She brought it to me. She'd looked at the address — same P.O. box you saw. She'd run the patient name in PMP and gotten nothing. She'd checked Hollis's prescribing history, what she could of it, and the dose was inconsistent with what Hollis had been writing for similar patients.",
                "She was right.",
                "I told her she was new. I told her she didn't know how this works. I told her Hollis wrote what Hollis wrote, and we filled what we could fill, and if she had concerns she could write them up to the state board if she felt that strongly, and otherwise to mind the counter.",
                "She wrote them up to the state board."
            ]),

            .scene("Pause. The static is the only sound."),

            .dialogue(speaker: .mara, lines: [
                "Three weeks later we had a state inspection. Different inspector — not Riggs. They pulled a CII miscount on a transfer that hadn't been logged in the perpetual yet. Sixteen tablets of methylphenidate that were already accounted for in the Sheridan transfer paperwork — I'd countersigned but not posted. Routine error, fixable in five minutes if anyone wanted to fix it.",
                "They didn't want to fix it.",
                "Wren got fired. Officially for the miscount. Actually for the report.",
                "I knew.",
                "I didn't fight it.",
                "I let her go because I didn't want to be the next one."
            ]),

            .question(.day18_errorReporting),

            .dialogue(speaker: .mara, lines: [
                "Just Culture. The framework. Three categories of error — human error, at-risk behavior, reckless behavior. Human error is consoled. At-risk behavior is coached. Reckless behavior is punished. Most errors are the first two; the system's job is to make the third less likely by addressing the first two.",
                "What I did to Wren was not Just Culture. It was the opposite."
            ]),

            .question(.day18_justCulture),

            .scene("Pause again."),

            .dialogue(speaker: .mara, lines: [
                "Six weeks after that the investigation came around to me. Subpoena. Witness. They made it clear — cooperate and stay a witness, or don't and become a target.",
                "I've been cooperating.",
                "The Marlow scripts have been going through us for at least eight months. Not just Hollis — at least three prescriber names on different scripts, all with the same handwriting in the body of the prescription. Clinic in Buffalo. Patient identities that may be real, may be lifted, may be invented. Federal investigation, two state boards, DEA involved.",
                "Quantity flowing through the wholesaler is consistent with diversion at scale. Bigger than Brett's tablet-pinching by orders of magnitude."
            ]),

            .question(.day18_rootCause),

            .dialogue(speaker: .mara, lines: [
                "Root cause. Not a person — a system. The clinic. The supervising physician's lax oversight. The wholesaler's failure to flag the volume. The state board's slow response. Hollis's fountain pen. My silence.",
                "I'm training you because I have to be useful. The state board wants demonstrated remediation. I'm the pharmacist of record at a rural pharmacy that's been dispensing forged prescriptions for the better part of a year. I have to show I can run a pharmacy that doesn't fill them. You're part of that.",
                "...That's not the only reason. But it's part of it."
            ]),

            .question(.day18_jointCommission),

            // Player's response
            .choice(
                prompt: "Respond",
                choices: [
                    RimrockChoice(
                        label: "Thank you for telling me.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "Thanks for taking it the way you took it."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "You should call Wren.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "I will. Soon."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "I'm sorry, Mara.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Don't be sorry for me. Be sorry for Wren.",
                                "...Thanks anyway."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "What do we do now?",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "We do the work right.",
                                "When the next Marlow Rx comes in — and one will come in — we refuse to fill, document, contact the prescriber, report to the board. We do the textbook thing.",
                                "I think there's one in the queue tomorrow."
                            ])
                        ]
                    )
                ]
            ),

            // End of late shift
            .scene("8:00 PM. The valley is going dark. The Bighorns are silhouettes."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Sleep well.",
                "Tomorrow we do the textbook thing."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 19 — Textbook

    static let day19: RimrockShift = RimrockShift(
        dayNumber: 19,
        title: "Textbook",
        dateLine: "Thursday, June 4",
        timeLine: "8:30 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Thursday. Mara was on the radio when you walked in. She stayed up last night."),

            .dialogue(speaker: .mara, lines: [
                "Morning. There's a new Marlow Rx in the queue, hit overnight. As I figured. Today we do the textbook thing.",
                "Pull it."
            ]),

            // The third Marlow Rx
            .prescription(RimrockPrescription(
                prescriberName: "Dr. Ellen Hollis",
                prescriberDetail: "Same fountain pen. Wet ink. Dated yesterday afternoon.",
                patientName: "MARCUS MARLOW",
                patientDOB: "06/14/1978",
                drug: "Oxycodone IR",
                strength: "10 mg",
                sig: "i tab po q4h prn pain",
                quantity: 120,
                refills: 0,
                isHandwritten: true,
                physicalNote: "Same pattern. Same P.O. box. Same diagnosis: \"CHRONIC PAIN.\" Same handwriting as the first."
            )),

            .dialogue(speaker: .mara, lines: [
                "Verify Hollis on the DEA Diversion Control site. Not because there's any doubt — she's current — but because we need a clean documented verification on the file."
            ]),

            .scene("You pull the DEA Diversion Control website. Look up Hollis, ELLEN. Active. Schedule II through V. Expires next year. Clean record on the public side. You take a screenshot, file it in the patient chart."),

            .question(.day19_correspondingResponsibility),

            .dialogue(speaker: .mara, lines: [
                "Now run the patient through PMP."
            ]),

            .scene("Wyoming PMP lookup: MARCUS MARLOW, DOB 06/14/1978. ...No record. No fills, no providers, no history in the state. The first two Marlow scripts are still set aside in your drawer; they were never entered into the system or billed, so PMP doesn't have them either."),

            .dialogue(speaker: .mara, lines: [
                "No PMP record. A real chronic-pain patient would have a paper trail somewhere — even a new patient would have something. He doesn't.",
                "We've now got documented red flags: identical handwriting on multiple prescriptions with different prescriber names, no PMP record, no insurance on file, P.O. box address with no residence verification, vague diagnosis, large quantity at maximum dosing. That's the package."
            ]),

            .question(.day19_redFlagsRefusal),

            // Call Hollis's office
            .scene("9:50. You call Hollis's office. The receptionist answers. You ask to speak with Dr. Hollis directly about a prescription clarification. The receptionist transfers you to the NP, who you've spoken with before."),

            .phoneCall(RimrockPhoneCall(
                callerID: "DR. HOLLIS'S OFFICE",
                turns: [
                    RimrockPhoneTurn(speaker: .player, line: "Hi, calling about a prescription dated yesterday for a patient named Marcus Marlow, oxycodone IR, quantity 120."),
                    RimrockPhoneTurn(speaker: .named("NP"), line: "...let me look that up. ...I don't see Marcus Marlow in our system. We don't have a patient by that name."),
                    RimrockPhoneTurn(speaker: .player, line: "The script has Dr. Hollis's signature."),
                    RimrockPhoneTurn(speaker: .named("NP"), line: "...let me get her.")
                ]
            )),

            .scene("Long hold. Then Hollis's voice. She doesn't sound like the NP — older, a little raspy."),

            .phoneCall(RimrockPhoneCall(
                callerID: "DR. HOLLIS",
                turns: [
                    RimrockPhoneTurn(speaker: .named("HOLLIS"), line: "I did not write that prescription. I do not have a patient named Marcus Marlow. If you have a script in my handwriting for a Marcus Marlow, hold it. Don't fill it. I'll be making a report myself today."),
                    RimrockPhoneTurn(speaker: .player, line: "Understood, Dr. Hollis. We'll hold and document. Thank you."),
                    RimrockPhoneTurn(speaker: .named("HOLLIS"), line: "...Thank you for catching this. Tell Mara I owe her an apology and a phone call.")
                ]
            )),

            .scene("Click. The radio is quiet for a beat."),

            .dialogue(speaker: .mara, lines: [
                "...Hollis didn't write it.",
                "We've been assuming Hollis was either complicit or sloppy. Maybe she's neither. Somebody is forging her. Her name, her handwriting, her DEA. That changes who's at risk. That changes the case."
            ]),

            .question(.day19_refusalDocumentation),

            .dialogue(speaker: .mara, lines: [
                "Document everything. Every Marlow script we've held, every red flag, every phone call, every screenshot. Two copies — one in the patient chart we never created, one in a separate file labeled MARLOW INVESTIGATION SUPPORT. Today's call from Hollis goes in both.",
                "I'll prep the suspicious-order report to DEA tonight. Submit it through the formal channel — Suspicious Order Monitoring is required when a pharmacy detects orders or prescriptions that meet defined criteria for suspicion."
            ]),

            .question(.day19_suspiciousOrderMonitoring),

            // End of day
            .scene("4:30 PM. The Marlow file is now thick — three prescriptions, a call log, screenshots from DEA Diversion Control, the PMP lookup, a written narrative of the timeline. Mara reads it back to you over the radio, you fix two typos, you both sign."),

            .dialogue(speaker: .mara, lines: [
                "We did it textbook. The system can't fix what's wrong without paperwork like this — we just made it possible.",
                "Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 20 — Review I

    static let day20: RimrockShift = RimrockShift(
        dayNumber: 20,
        title: "Review I",
        dateLine: "Friday, June 5",
        timeLine: "8:38 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. Quieter than usual — the Marlow case is moving but not at the counter. Coffee. Fridge log. Empty queue."),

            .dialogue(speaker: .mara, lines: [
                "We have time today. Let's run drills.",
                "Mixed practice — pharmacy math, IV calculations, drug interactions, dosage forms. Whatever the PTCE wants to throw at you. Same energy you had on the Marlow paperwork yesterday."
            ]),

            // Drill 1 — pharmacy math
            .scene("First drill. A compounding scenario: the prescription calls for 240 mL of an oral suspension at 25 mg/mL. You have a 50 mg/mL stock solution. How much stock and how much diluent?"),

            .question(.day20_dilutionMath),

            .dialogue(speaker: .mara, lines: [
                "C₁V₁ = C₂V₂. Fifty times what equals twenty-five times two-forty. V₁ is one-twenty milliliters of stock. Diluent is two-forty minus one-twenty — also one-twenty mL.",
                "Practice this until it's not a thing you have to think about. Pharmacy math on the PTCE is reliable points if you don't panic."
            ]),

            // Drill 2 — IV math
            .scene("Drill two. An IV order: heparin 25,000 units in 250 mL D5W, infusing at 18 units/kg/hour for an 80 kg patient. What rate in mL/hour?"),

            .question(.day20_ivRate),

            .dialogue(speaker: .mara, lines: [
                "Eighteen times eighty equals fourteen-forty units per hour. Concentration is twenty-five thousand divided by two-fifty equals one hundred units per mL. Rate is fourteen-forty divided by one hundred equals fourteen point four mL per hour.",
                "Always check that the answer's plausible. If your math says infuse the bag in seven minutes, you did it wrong."
            ]),

            // Drill 3 — drug interaction
            .scene("Drill three. A patient on sertraline (an SSRI) is started on linezolid for a resistant infection. What's the concern?"),

            .question(.day20_serotoninSyndrome),

            .dialogue(speaker: .mara, lines: [
                "Serotonin syndrome. Linezolid is a weak monoamine oxidase inhibitor — combining it with serotonergic drugs (SSRIs, SNRIs, triptans, MAOIs, tramadol, methylene blue) can cause excess serotonin: agitation, hyperthermia, tachycardia, clonus, rigidity. Severe cases are fatal.",
                "Common offenders to know: linezolid, tramadol, MAOIs, methylene blue, triptans, St. John's wort. Counsel the prescriber if they're combining any of these with an SSRI/SNRI."
            ]),

            // Drill 4 — math / dose conversion
            .scene("Drill four. A pediatric patient weighs 35 lb. Acetaminophen suspension is 160 mg/5 mL. The order is 15 mg/kg/dose. How much do you dispense per dose?"),

            .question(.day20_pediConversion),

            .dialogue(speaker: .mara, lines: [
                "Thirty-five pounds divided by 2.2 is fifteen point nine kilograms — round to sixteen for dispensing. Sixteen times fifteen is two-forty mg per dose. Two-forty divided by one-sixty equals one point five — multiplied by five mL gives seven point five mL per dose.",
                "Always show your work and double-check pediatric math twice. The most common errors in retail are pediatric dose calculations and insulin units. Both are math errors with serious consequences."
            ]),

            // Late afternoon — Mara opens up
            .scene("3:50 PM. The radio is quiet for a stretch. Then:"),

            .dialogue(speaker: .mara, lines: [
                "I called Wren last night.",
                "We talked for an hour. She's doing well. The Sheridan Walgreens has her doing immunizations now — she got her certification through their program.",
                "She asked about you. I told her you're going to be a good tech. She said tell you welcome.",
                "...That's the first conversation I've had with her in eight months."
            ]),

            // End of day
            .scene("4:50 PM. The light through the window is Friday-amber."),

            .dialogue(speaker: .mara, lines: [
                "Sleep well. Have a weekend."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 21 — Review II

    static let day21: RimrockShift = RimrockShift(
        dayNumber: 21,
        title: "Review II",
        dateLine: "Monday, June 8",
        timeLine: "8:32 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Monday. The valley is dry and warming up. Coffee. Fridge log. A note on the counter from the wholesaler about a back-order on losartan — we're switching all losartan refills to valsartan until further notice."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's review is compounding and inventory. Less common questions on the PTCE but they show up.",
                "Also — Brett's license was officially revoked last Friday. Sixty-day appeal window, but he's not appealing. He'll never practice pharmacy again in Wyoming."
            ]),

            // Drill 1 — USP 797 sterile compounding
            .scene("First topic. A pharmacy is preparing sterile IV antibiotics for a long-term care facility. USP <797>."),

            .question(.day21_usp797BUD),

            .dialogue(speaker: .mara, lines: [
                "USP <797> categories were revised in 2023. Category 1 — minimal contamination risk environment, BUDs measured in hours to days. Category 2 — more complex CSPs, longer BUDs in the right environment. Category 3 — most rigorous, longest BUDs, ISO 5 in ISO 7 buffer area with full validation. Sterile compounding without certification is one of the highest-risk things a pharmacy can do badly. We don't do sterile compounding here."
            ]),

            // Drill 2 — USP 800 hazardous drugs
            .scene("Topic two. A pharmacy receives an order for oral methotrexate 2.5 mg tablets — used for rheumatoid arthritis at low weekly doses. USP <800>."),

            .question(.day21_usp800Hazardous),

            .dialogue(speaker: .mara, lines: [
                "Methotrexate is on the NIOSH list of hazardous drugs. USP <800> requires assessment of risk for handling, segregated storage, and PPE for compounding. For oral tablet dispensing, less invasive — but spillage cleanup, return handling, and disposal still follow hazardous-drug protocols. The list is updated regularly: methotrexate, leuprolide, finasteride, oxytocin, warfarin (yes, warfarin), many oncology drugs.",
                "Methotrexate also has a deadly retail trap — patients confuse weekly dosing with daily dosing. Counsel hard."
            ]),

            // Drill 3 — billing units / NCPDP
            .scene("Topic three. A claim rejection: BILLING UNITS DO NOT MATCH QUANTITY. The prescription is for an inhaler — albuterol HFA, 8.5 g, one inhaler dispensed."),

            .question(.day21_billingUnits),

            .dialogue(speaker: .mara, lines: [
                "NCPDP billing standards. For solid oral, billing unit equals tablet or capsule. For liquid, billing unit equals milliliter. For inhalers, billing unit equals gram of canister contents — that's the trap. Albuterol HFA 8.5 g, one inhaler, billed as 8.5 units, not 1.",
                "Eye drops: milliliters. Topical creams: grams. Patches: each. Vials: milliliters. The billing unit isn't always intuitive. NCPDP D.0 standard specifies it for every dosage form."
            ]),

            // Drill 4 — WAC vs AWP
            .scene("Topic four. The wholesaler invoice and your pricing list don't match. WAC versus AWP."),

            .question(.day21_wacAwp),

            .dialogue(speaker: .mara, lines: [
                "WAC — Wholesale Acquisition Cost — published by the manufacturer, what wholesalers are charged before discounts. AWP — Average Wholesale Price — historically the published average wholesalers charged pharmacies. AWP is largely deprecated; insurances now use NADAC, AAC, MAC, and other contract-specific benchmarks. We pay close to WAC; insurance reimburses based on negotiated formulas. The gap is the pharmacy's margin — and on most drugs, especially generics, that gap is razor-thin."
            ]),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Sleep well. Tomorrow we hit immunizations and emergency contraception."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 22 — Review III

    static let day22: RimrockShift = RimrockShift(
        dayNumber: 22,
        title: "Review III",
        dateLine: "Tuesday, June 9",
        timeLine: "8:30 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Tuesday. Cool morning. Coffee. Fridge log. The flu vaccine fridge is at three point eight Celsius — within range, low end."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Today's review is immunizations, OTCs, and disposal.",
                "Audit's tomorrow. Just so you know in advance — I'll be there. Physically. The board wants me on-site for the visit. Won't be the radio."
            ]),

            // Drill 1 — vaccine storage
            .scene("First topic. The fridge log this morning showed flu vaccine at 3.8 °C. The morning before, it was 5.4. The freezer next to it has the MMR — different storage requirement."),

            .question(.day22_vaccineStorage),

            .dialogue(speaker: .mara, lines: [
                "Most adult flu vaccines are refrigerated at 2 to 8 °C — same range as insulin. Some live vaccines like MMR and varicella require frozen, -50 to -15 °C. Always check the package insert. Excursion logs go in the fridge log binder — temperature out of range, action taken, vaccine status (use, return, discard).",
                "Cold chain integrity is everything for vaccines. Most pharmacies lose product to power flickers, not active error."
            ]),

            // Drill 2 — Plan B / OTC
            .scene("Topic two. A young woman comes in asking for emergency contraception. She wants to know if she needs a prescription."),

            .question(.day22_planB),

            .dialogue(speaker: .mara, lines: [
                "Levonorgestrel — Plan B One-Step and generics — is OTC, no age restriction, no ID required. Effective up to 72 hours after, more effective the sooner taken. Ulipristal — ella — is prescription only, effective up to 120 hours, more effective at higher BMIs.",
                "Counseling matters: Plan B is not 100%, doesn't work if pregnancy is already established, doesn't protect against STIs. If she asks where things are, point. Don't make her ask twice. Don't ask why. Don't editorialize."
            ]),

            // Drill 3 — OTC switch / behind-the-counter
            .scene("Topic three. A patient asks where the diphenhydramine is. You tell her aisle three. She also asks for pseudoephedrine. That's behind the counter."),

            .question(.day22_btcMethCheck),

            .dialogue(speaker: .mara, lines: [
                "Pseudoephedrine is the classic behind-the-counter — not OTC, not prescription, but logged. CMEA limits: 3.6 g of base per day, 9 g per month per customer. ID required. NPLEX (National Precursor Log Exchange) catches purchases at multiple pharmacies. Some products require Schedule V prescription in some states — codeine cough syrups, paregoric.",
                "Behind-the-counter is a real category, distinct from OTC and Rx. PTCE asks because techs handle BTC sales every day."
            ]),

            // Drill 4 — hazardous drug disposal
            .scene("Topic four. A patient brings in unused chemotherapy oral tablets from a deceased family member. She wants to dispose of them."),

            .question(.day22_hazardousDisposal),

            .dialogue(speaker: .mara, lines: [
                "Hazardous drugs follow special disposal — DEA take-back if it's a controlled substance, hazardous-waste vendor if not. Don't flush, don't trash, don't pour down the sink. Most pharmacies aren't authorized to take back medications directly except through DEA take-back programs or specific state-licensed programs. We give her the contact info for the closest take-back location and a sealed mail-back envelope if we have one.",
                "Patient education on hazardous-drug disposal is part of why USP <800> exists. Improperly disposed chemo gets into water tables."
            ]),

            // Late afternoon — Mara reflects
            .scene("3:30 PM. The lobby is empty. Mara is on the radio, voice steady."),

            .dialogue(speaker: .mara, lines: [
                "Good drills. You're ready for the certification exam, I think. You'd pass it today.",
                "...Anyway. I'll see you in the morning. I'll be the woman with the dog hair on her shirt."
            ]),

            // End of day
            .dialogue(speaker: .mara, lines: [
                "Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 23 — The Visit

    static let day23: RimrockShift = RimrockShift(
        dayNumber: 23,
        title: "The Visit",
        dateLine: "Wednesday, June 10",
        timeLine: "8:24 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Wednesday. The bell clatters at 8:24 — earlier than you've ever heard it. You walk into the lobby and there's a woman behind the counter in a wool sweater, dog hair on the cuff, hair pulled back loose. Mid-twenties. She looks up."),

            .dialogue(speaker: .named("MARA"), lines: [
                "Hi. I'm Mara."
            ]),

            .scene("She doesn't shake your hand. She nods toward the back. The radio on the back counter is dark for the first time since you started here."),

            .dialogue(speaker: .named("MARA"), lines: [
                "I'll be in the back office for the audit. They're due at ten. State board, DEA, both. You handle the counter. Radio still works if you need me — I'll keep mine on.",
                "...You did good work. They're going to find clean records because you kept them that way."
            ]),

            .scene("She heads to the back. You don't see her again for hours."),

            // 9:30 — first walk-in
            .scene("9:30. Steady morning. Refills, a vacation override, two new e-Rx for chronic patients. Routine."),

            // 10:05 — auditors arrive
            .scene("10:05. Three auditors come in. Politely identify themselves — DEA Diversion Investigator, two state board staff. They ask if Mara's available. You point to the back office. They go through. The door closes."),

            .dialogue(speaker: .mara, lines: [
                "They've got our perpetual log for the past year, the Form 222 file, the controls binder, the recall response file, the Marlow refusal documentation. Take whatever they ask for. Be polite, be specific, don't volunteer."
            ]),

            .question(.day23_recordsProduction),

            // 11:40 — customer with urgent need
            .scene("11:40. The bell clatters. A man in his sixties, breathing fast, hand on his chest — not chest pain, just out of breath from walking up the steps. Hands you a paper Rx for nitroglycerin sublingual 0.4 mg, sig 1 tab SL prn chest pain, qty 25 tablets, no refills. New prescription."),

            .dialogue(speaker: .mara, lines: [
                "...Take that one. I can hear the way he's breathing. Counsel hard."
            ]),

            .scene("You verify, fill, counsel: one tablet under the tongue at onset of chest pain. If pain not relieved in five minutes, repeat — up to three doses, then call 911. Don't swallow. Light-headedness is normal; lie down. Replace every six months — light, heat, and air degrade nitroglycerin. He thanks you, takes the bag, leaves slowly."),

            .question(.day23_nitroglycerinCounsel),

            // Auditors over the radio
            .dialogue(speaker: .mara, lines: [
                "They're tightening one thing on our recordkeeping — they want refusal documentation cross-referenced to the patient profile, not just on the script. Easy fix. They're satisfied with everything else.",
                "They've also formally cleared me as a witness. The Marlow scripts are being prosecuted as forgery against the prescribing physician, not against the pharmacy. We did what we were supposed to do."
            ]),

            .question(.day23_aueditClosing),

            .question(.day23_pharmacyTechRecord),

            // 1:50 — auditors leave
            .scene("1:50 PM. The auditors come out, polite goodbye, leave through the front. Mara stays in the back another half hour, then comes out herself."),

            .dialogue(speaker: .named("MARA"), lines: [
                "Clean. We're done.",
                "...I'm going home. I'll be back tomorrow. On the radio."
            ]),

            .scene("She nods, picks up her bag, leaves. The bell clatters."),

            // End of day
            .scene("4:50 PM."),

            .dialogue(speaker: .mara, lines: [
                "(over the radio, from home)",
                "...Lock up. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 24 — News

    static let day24: RimrockShift = RimrockShift(
        dayNumber: 24,
        title: "News",
        dateLine: "Thursday, June 11",
        timeLine: "8:38 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Thursday. The Buffalo Bulletin is on the counter when you arrive — Russell Abernathy must have left his copy. The headline is two columns: \"FEDERAL INDICTMENTS UNSEALED IN BUFFALO CLINIC PRESCRIPTION FRAUD CASE.\""),

            .dialogue(speaker: .mara, lines: [
                "It's everywhere this morning. National news picked it up too.",
                "Three prescribers indicted — a nurse practitioner who'd been writing under stolen prescriber IDs, the clinic's medical director who looked the other way, the office manager who set up the P.O. box patient identities. Eighteen months of forgery, scripts at six pharmacies across two states. The investigation goes back further than anyone realized."
            ]),

            .scene("You read the article. Marcus Marlow doesn't exist. He never did. The address was a P.O. box rented under a stolen identity. The prescriptions were a money pump — fake patient, real opioids, sold downstream."),

            .dialogue(speaker: .mara, lines: [
                "Hollis is cleared. Her DEA was being used by the NP — Hollis didn't write a single Marlow script. She'd noticed weeks ago that her prescription pad numbers were missing — somebody at the clinic was tearing pages out of her pad — and had reported it to the medical director, who then suppressed the report.",
                "Hollis is retiring. She's seventy-eight. She's been hand-writing prescriptions for fifty years. Someone else was using her hand to forge them, and she missed it because she didn't expect to be the target.",
                "...She called me last night. She apologized."
            ]),

            // Day continues normally
            .scene("The day works through normally. The pharmacy goes about its rhythm — refills, a flu shot walk-in, a partial fill, a vacation override. Real work, the kind that's easier when the worry is named."),

            .question(.day24_finalReviewMed),
            .question(.day24_finalReviewPS),
            .question(.day24_finalReviewOE),
            .question(.day24_finalReviewFed),

            // Mara reflects
            .scene("3:40 PM. Quiet stretch."),

            .dialogue(speaker: .mara, lines: [
                "It worked. Slowly. Painfully. But it worked.",
                "Wren's name will get cleared too — that's part of the settlement the state board is working out. She'll be eligible for back pay and a clean record. She told me she might come back to the floor as a tech. Not here. But somewhere closer than Sheridan."
            ]),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Sleep well. One more day."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 25 — Goodbye

    static let day25: RimrockShift = RimrockShift(
        dayNumber: 25,
        title: "Goodbye",
        dateLine: "Friday, June 12",
        timeLine: "8:35 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. The valley is full sun, the snow line is up around the highest peaks, the air is the kind of clear that makes you think you can see another state. Coffee. Fridge log. Queue."),

            .dialogue(speaker: .mara, lines: [
                "Morning. Last day on the radio.",
                "Monday I'm back on the floor. Different rhythm — we'll be in the same building, but I'll be filling, you'll be at the counter or the back, and we won't be on the radio together every day. The board cleared me last week; I just had to finish out the audit and the news cycle.",
                "Brett's spot stays open for now. They might float someone from Sheridan. Might bring Wren back. We'll see."
            ]),

            // Light morning — a few normal scripts
            .scene("Through the morning the work feels lighter than it has in weeks. A new amoxicillin for an ear infection. A levothyroxine refill. A counseling session with a new diabetic. The kind of work that's easy when you've been doing it long enough."),

            // Mid-day — Mara reflects
            .dialogue(speaker: .mara, lines: [
                "I want to tell you something.",
                "When you started, I thought I'd train you and that would be it. Useful penance, get me through the investigation, hand you a job that's a little better than the one Wren had because I'd learned from what I'd done to her.",
                "...That's still part of it.",
                "But you turned out to be a good tech. And you turned out to be — I don't know. Steady. The kind of person who hears bad news and doesn't make it about themselves. That's rare."
            ]),

            // A real, small case in the afternoon — to land the work
            .scene("2:15 PM. The phone rings. Caller ID: ABERNATHY, R."),

            .phoneCall(RimrockPhoneCall(
                callerID: "ABERNATHY, R.",
                turns: [
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "Hi. I just wanted to call and say thank you, again. Mom's doing well. The deprescribing helped — she hasn't fallen since. She wanted me to bring her down to meet you next week. Is that okay?"),
                    RimrockPhoneTurn(speaker: .player, line: "...yeah. We'd love that."),
                    RimrockPhoneTurn(speaker: .named("RUSSELL"), line: "She'll bring cookies. Just — be ready for cookies.")
                ]
            )),

            .scene("You hang up. The radio is quiet for a long stretch."),

            .dialogue(speaker: .mara, lines: [
                "...Yeah. That's the work.",
                "Most days you don't hear the outcome. Sometimes you do."
            ]),

            // Late afternoon — final review beat
            .scene("4:00 PM. The light through the window has gone the long, slow amber of late afternoon. Beans is audible somewhere in the background, a sigh, then the sound of him settling onto something that creaks."),

            .dialogue(speaker: .mara, lines: [
                "I had coffee with Wren on Saturday.",
                "We talked for two hours. She forgave me. Or she's pretending to. Either way, we're talking. I told her about you.",
                "She said tell you welcome.",
                "...You're going to be a good tech. Better than me, probably."
            ]),

            // The choice
            .choice(
                prompt: "Goodbye",
                choices: [
                    RimrockChoice(
                        label: "You're a good pharmacist, Mara.",
                        tone: .warm,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah.",
                                "Don't let the work make you cynical. It will try to. Most days you'll fight it back; some days you won't. Forgive yourself the days you don't.",
                                "I'll see you Monday."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "Thanks for everything.",
                        tone: .curious,
                        rapportDelta: 1,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "You're welcome.",
                                "It was — it was a thing I needed to do, and you turned out to be a good person to do it with.",
                                "...See you Monday."
                            ])
                        ]
                    ),
                    RimrockChoice(
                        label: "See you Monday.",
                        tone: .stoic,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "See you Monday."
                            ])
                        ]
                    )
                ]
            ),

            // The fade
            .scene("4:55 PM. The Bighorns are pink at the high edges. Through the front window, you can see the grass moving in the parking lot strip; the wind is coming back. Beans is silent. The static is louder than it's been."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Drive safe."
            ]),

            .scene("The static breathes a moment longer. Then the radio clicks. Not off — clicked, like she set the handset down. The dial keeps glowing green. The static continues. You sit with it for a second."),

            .scene("Then you flip the Closed sign, lock the back, lock the front."),

            .scene("Outside, the air is cool. The sun is on the road. You can hear water somewhere — the creek behind the building, where it runs along the back fence."),

            .scene("Monday, you'll be at the counter. Mara will be filling. You won't be on the radio together every day."),

            .scene("But you'll see her in the morning."),

            .shiftEnd(closingLine: "End of the radio days. The arc closes here.")
        ]
    )

    // MARK: - Day 26 — Antibiotics

    static let day26: RimrockShift = RimrockShift(
        dayNumber: 26,
        title: "Antibiotics",
        dateLine: "Monday, June 15",
        timeLine: "8:32 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Monday. First day with Mara back on the floor. The bell clatters at 8:30 and she's already there at the counter when you arrive — wool sweater, dog hair on the cuff, hair pulled back loose. She nods, hands you a coffee."),

            .dialogue(speaker: .named("MARA"), lines: [
                "I've got the counter. You take the back today — refills, transfers, anything that doesn't need a face. I've got the radio on. We'll keep going on PTCE review while it's quiet.",
                "Today's antibiotics. Biggest blind spot for new techs."
            ]),

            // Walk to back. Switch to radio.
            .scene("You set up in the back office. The radio crackles to life on its usual channel. Mara's voice, but now you can hear her in stereo — the radio echoing the live voice through the door."),

            // Penicillin allergy
            .dialogue(speaker: .mara, lines: [
                "First topic. Penicillin allergies. Patient walks up with an amoxicillin Rx and a documented penicillin allergy. What's the cross-reactivity story?"
            ]),

            .question(.day26_penicillinAllergy),

            .dialogue(speaker: .mara, lines: [
                "Cross-reactivity between true penicillin allergy and cephalosporins is much lower than the historical 10% number — modern data says about 1-2% for first-generation cephs, even less for later generations. Carbapenems carry small risk. Aztreonam is structurally different and generally safe.",
                "True anaphylaxis to penicillin is a hard contraindication for cephalosporins. Rash-only history is more nuanced — many of those aren't true allergies."
            ]),

            // Fluoroquinolone
            .dialogue(speaker: .mara, lines: [
                "Fluoroquinolones — '-floxacin.' Levofloxacin, ciprofloxacin, moxifloxacin. What's on the FDA black box?"
            ]),

            .question(.day26_fluoroquinoloneBlackBox),

            .dialogue(speaker: .mara, lines: [
                "Tendon rupture, peripheral neuropathy, CNS effects — and aortic aneurysm risk added recently. FDA recommends fluoroquinolones be reserved for serious infections when alternatives aren't available. Counsel patients to stop and call the doctor at any tendon pain. Avoid in patients on systemic steroids — synergistic tendon risk.",
                "Also: divalent and trivalent cation interactions. Antacids, calcium, magnesium, iron, zinc — separate by two hours before or six hours after the fluoroquinolone."
            ]),

            // Macrolide CYP
            .dialogue(speaker: .mara, lines: [
                "Macrolides — '-thromycin.' Erythromycin, clarithromycin, azithromycin. CYP3A4 story?"
            ]),

            .question(.day26_macrolideCYP),

            .dialogue(speaker: .mara, lines: [
                "Erythromycin and clarithromycin are strong CYP3A4 inhibitors — bump up levels of statins, calcium channel blockers, warfarin, several others. QT prolongation across the class. Azithromycin is the cleanest of the three for interactions but still has QT risk.",
                "Common error: a patient on simvastatin gets azithromycin for a sinus infection. Statin level rises, rhabdomyolysis risk goes up. Counsel."
            ]),

            // Vancomycin
            .dialogue(speaker: .mara, lines: [
                "Last one. Vancomycin. Oral versus IV, and red man syndrome."
            ]),

            .question(.day26_vancomycin),

            .dialogue(speaker: .mara, lines: [
                "Oral vancomycin is for C. difficile colitis only — not absorbed systemically. IV is for systemic infection. Red man syndrome is the classic infusion-rate adverse effect — flushing, pruritus, sometimes hypotension. Slow the infusion to over an hour and pretreat with antihistamines. Not a true allergy; an infusion-rate problem.",
                "Trough monitoring matters — vancomycin is renally cleared, narrow window for serious infections."
            ]),

            // End of day
            .scene("4:50 PM."),

            .dialogue(speaker: .mara, lines: [
                "Good first day back. See you tomorrow. Have a beer or a tea or whatever you do."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 27 — Insulin & Diabetes

    static let day27: RimrockShift = RimrockShift(
        dayNumber: 27,
        title: "Insulin & Diabetes",
        dateLine: "Tuesday, June 16",
        timeLine: "8:30 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Tuesday. Cool morning. Mara at the counter, you in the back. Radio on."),

            .dialogue(speaker: .mara, lines: [
                "Today's insulin and oral diabetes agents. Insulin is the most common error class in retail pharmacy after look-alike sound-alike — units versus mL, rapid versus long-acting, brand versus generic naming.",
                "Let's run drills."
            ]),

            // Insulin onset/peak/duration
            .dialogue(speaker: .mara, lines: [
                "First. Insulin glargine — Lantus, Basaglar, Toujeo. What's its onset, peak, duration?"
            ]),

            .question(.day27_insulinGlargine),

            .dialogue(speaker: .mara, lines: [
                "Glargine: onset about 1-2 hours, no real peak, duration up to 24 hours. Long-acting basal. Compare to lispro (Humalog), aspart (Novolog), glulisine (Apidra) — rapid-acting, onset 5-15 min, peak 30-90 min, duration 3-5 hours. Regular insulin (Humulin R, Novolin R) is short-acting — onset 30 min, peak 2-4 hours, duration 5-8 hours. NPH (Humulin N, Novolin N) is intermediate — onset 1-2 hours, peak 4-12 hours, duration up to 18 hours. Degludec (Tresiba) is ultra-long — duration 42+ hours.",
                "Memorize the table. PTCE asks every variation."
            ]),

            // Sulfonylurea
            .dialogue(speaker: .mara, lines: [
                "Sulfonylureas — glipizide, glyburide, glimepiride. End in '-ide.' What's the warning?"
            ]),

            .question(.day27_sulfonylureaHypoglycemia),

            .dialogue(speaker: .mara, lines: [
                "Hypoglycemia. Sulfonylureas push the pancreas to release insulin regardless of glucose level. Skipped meal + sulfonylurea = hypoglycemia. Glyburide especially — long half-life, high hypoglycemia risk in older adults. Beers Criteria flags it. Glipizide is shorter-acting and safer for elderly.",
                "Counsel: take with food. Recognize hypoglycemia symptoms — shakiness, sweating, confusion. Have glucose tabs or juice on hand."
            ]),

            // GLP-1
            .dialogue(speaker: .mara, lines: [
                "GLP-1 agonists — semaglutide (Ozempic, Wegovy), liraglutide (Victoza, Saxenda), tirzepatide (Mounjaro, Zepbound — technically GIP/GLP-1 dual). Common side effect class?"
            ]),

            .question(.day27_glp1SideEffects),

            .dialogue(speaker: .mara, lines: [
                "GI side effects — nausea, vomiting, diarrhea, constipation. Usually transient, settle in a few weeks of dose titration. Boxed warning for thyroid C-cell tumors based on rodent data; relevant only for medullary thyroid carcinoma personal/family history. Pancreatitis risk is small but real.",
                "Counsel: start low, titrate slowly, eat smaller meals. Inject once weekly for semaglutide, once daily for liraglutide. Refrigerate the pen until first use, room temp after."
            ]),

            // SGLT2
            .dialogue(speaker: .mara, lines: [
                "SGLT2 inhibitors — empagliflozin (Jardiance), dapagliflozin (Farxiga), canagliflozin (Invokana). End in '-flozin.' Mechanism?"
            ]),

            .question(.day27_sglt2Mechanism),

            .dialogue(speaker: .mara, lines: [
                "Block sodium-glucose cotransporter 2 in the proximal renal tubule. Glucose spills into the urine — A1C drops, weight comes down a little, blood pressure too. Side effects: genital mycotic infections (the urine is sweet, yeast loves it), euglycemic DKA in stress states, lower-limb amputation signal with canagliflozin specifically.",
                "These drugs have shown cardiovascular and renal benefits beyond glucose lowering. They're showing up as add-on therapy regardless of A1C in patients with CKD or heart failure."
            ]),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Good drills. Tomorrow's psych. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 28 — Mind

    static let day28: RimrockShift = RimrockShift(
        dayNumber: 28,
        title: "Mind",
        dateLine: "Wednesday, June 17",
        timeLine: "8:34 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Wednesday. Coffee. Fridge log. The queue is small."),

            .dialogue(speaker: .mara, lines: [
                "Today's psych pharmacology. Common in retail; underweighted in PTCE prep. We'll go through the major classes."
            ]),

            // SSRI/SNRI/TCA
            .dialogue(speaker: .mara, lines: [
                "Antidepressants. SSRIs end in lots of things — sertraline, fluoxetine, paroxetine, citalopram, escitalopram. SNRIs end in '-faxine' or '-anserin' — venlafaxine, duloxetine, desvenlafaxine. TCAs end in '-iptyline' or '-ipramine' — amitriptyline, nortriptyline, imipramine. MAOIs are older — phenelzine, tranylcypromine. Atypicals: bupropion, mirtazapine, trazodone.",
                "Mechanism difference between SSRI and SNRI?"
            ]),

            .question(.day28_ssriSnri),

            .dialogue(speaker: .mara, lines: [
                "SSRI: serotonin reuptake inhibition only. SNRI: both serotonin AND norepinephrine reuptake. Both have serotonin syndrome risk when combined with other serotonergic agents. SNRIs add noradrenergic side effects — increased blood pressure, sweating, sometimes more activating. TCAs are dirty drugs — anticholinergic, antihistaminergic, alpha-blocking — overdose is cardiotoxic. MAOIs require dietary tyramine restriction (no aged cheeses, cured meats, fava beans, etc.) and have devastating drug interactions.",
                "Counsel: SSRIs and SNRIs take 2-4 weeks for full effect. Don't stop abruptly — especially paroxetine and venlafaxine — discontinuation syndrome is real."
            ]),

            // Lithium
            .dialogue(speaker: .mara, lines: [
                "Lithium. Bipolar disorder mainstay. Therapeutic range, monitoring?"
            ]),

            .question(.day28_lithiumRange),

            .dialogue(speaker: .mara, lines: [
                "Therapeutic: 0.6 to 1.2 mEq/L for maintenance. Acute mania can target up to 1.5. Toxic above 1.5 — tremor, GI upset, confusion. Above 2: ataxia, severe tremor, seizures. NTI drug — Beers Criteria for elderly. Renally cleared, so dehydration, NSAIDs, ACE inhibitors, diuretics all bump levels. Sodium intake matters — low sodium raises lithium levels.",
                "Counsel: stable hydration, stable salt intake, no NSAIDs without prescriber knowledge, get levels checked regularly."
            ]),

            // Benzos
            .dialogue(speaker: .mara, lines: [
                "Benzodiazepines. Alprazolam, lorazepam, diazepam, clonazepam, temazepam. C-IV. Dependence and discontinuation?"
            ]),

            .question(.day28_benzoDependence),

            .dialogue(speaker: .mara, lines: [
                "Physical dependence after weeks of regular use. Abrupt discontinuation causes rebound anxiety, insomnia, tremor — and can cause seizures, especially in patients with seizure disorders or alcohol use. Always taper. Beers Criteria flags benzos for elderly — fall risk, cognitive impairment, dependence. The CDC has been clear: benzodiazepines should not be combined with opioids except in specific monitored situations — combined respiratory depression risk is significant.",
                "Counsel: don't stop suddenly. Don't combine with alcohol. Be careful driving."
            ]),

            // Antipsychotic / EPS
            .dialogue(speaker: .mara, lines: [
                "Antipsychotics. Typicals (first-gen): haloperidol, chlorpromazine — strong dopamine blockade, more EPS. Atypicals (second-gen): risperidone, olanzapine, quetiapine, aripiprazole — broader receptor profile, less EPS but more metabolic side effects (weight, glucose, lipids). What's the late, often irreversible motor side effect?"
            ]),

            .question(.day28_tardiveDyskinesia),

            .dialogue(speaker: .mara, lines: [
                "Tardive dyskinesia. Late-onset, sometimes irreversible, repetitive involuntary movements. Higher risk with first-generation antipsychotics, longer treatment, older age. Acute extrapyramidal symptoms — dystonia, akathisia, parkinsonism — appear earlier and respond to anticholinergics or benztropine. Neuroleptic malignant syndrome is the rare emergency: hyperthermia, rigidity, autonomic instability, altered mental status. Stop the drug, supportive care, sometimes dantrolene or bromocriptine.",
                "Counsel: report involuntary movements early. Atypicals add metabolic monitoring — weight, glucose, lipids, blood pressure."
            ]),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Good. Tomorrow's pulmonary and GI. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 29 — Breath & Gut

    static let day29: RimrockShift = RimrockShift(
        dayNumber: 29,
        title: "Breath and Gut",
        dateLine: "Thursday, June 18",
        timeLine: "8:35 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Thursday. Light morning. Mara at the counter, you in the back. The radio's on."),

            .dialogue(speaker: .mara, lines: [
                "Today's pulmonary and GI. Practical retail content — patients pick up inhalers and antiemetics every day, and most of them are using them wrong."
            ]),

            // Inhaler classes
            .dialogue(speaker: .mara, lines: [
                "Inhalers. Three big classes: SABA — short-acting beta-2 agonist, albuterol, levalbuterol. LABA — long-acting beta-2 agonist, salmeterol, formoterol. ICS — inhaled corticosteroid, fluticasone, budesonide, beclomethasone. Combos exist: LABA-ICS (Advair, Symbicort), SAMA-SABA (DuoNeb), ICS-LABA-LAMA (Trelegy). Which one is the rescue inhaler?"
            ]),

            .question(.day29_inhalerClasses),

            .dialogue(speaker: .mara, lines: [
                "SABA — albuterol. Rapid bronchodilation, used as needed. LABA alone is not for asthma rescue and not for monotherapy in asthma — paired with ICS. ICS is daily controller, not rescue. Combos like Advair are daily, not rescue. Patient who's using their albuterol more than twice a week should be reassessed — that's a marker of inadequate control.",
                "Counsel: SABA for acute symptoms; controller meds daily even when asymptomatic."
            ]),

            // Spacer technique
            .dialogue(speaker: .mara, lines: [
                "Spacer technique. Why use one with a metered-dose inhaler?"
            ]),

            .question(.day29_spacerTechnique),

            .dialogue(speaker: .mara, lines: [
                "Spacers improve drug delivery to the lower airways. MDIs without spacers deposit a lot of drug on the back of the throat — kids and elderly especially can't coordinate the breath-and-press timing. Spacer holds the dose, patient breathes it in slowly. Reduces oropharyngeal candidiasis with ICS — patients should rinse mouth after every ICS dose anyway.",
                "Counsel: shake before each puff (most MDIs), one puff at a time with spacer, slow deep breath, hold ten seconds."
            ]),

            // Antiemetics
            .dialogue(speaker: .mara, lines: [
                "Antiemetics. 5-HT3 antagonists end in '-setron' — ondansetron, granisetron, palonosetron. Dopamine antagonists: prochlorperazine, metoclopramide, promethazine. NK1 antagonists: aprepitant. Antihistamines: meclizine, dimenhydrinate. Cannabinoids, scopolamine for motion sickness. What's the QT concern with ondansetron?"
            ]),

            .question(.day29_antiemeticQT),

            .dialogue(speaker: .mara, lines: [
                "QT prolongation, especially at higher doses (above 16 mg single dose). FDA pulled the 32 mg single-dose IV recommendation. Stack with other QT-prolongers (some antibiotics, antipsychotics, antidepressants) and risk goes up. Most patients are fine; pharmacy DUR catches the additive QT cases.",
                "Counsel: routine doses are safe; report palpitations, fainting, or unusual heart symptoms."
            ]),

            // Laxatives
            .dialogue(speaker: .mara, lines: [
                "Laxatives. Five major classes — bulk-forming (psyllium, methylcellulose), osmotic (PEG, lactulose, magnesium hydroxide), stimulant (senna, bisacodyl), stool softener (docusate), emollient (mineral oil). Which is first-line for chronic constipation in most patients?"
            ]),

            .question(.day29_laxatives),

            .dialogue(speaker: .mara, lines: [
                "Bulk-forming agents — psyllium, methylcellulose. Mimic dietary fiber. Take with adequate water — bulk without water is a problem. Osmotic agents like PEG (Miralax) are second-line and excellent. Stimulants are short-term — chronic use leads to dependence and dysmotility. Stool softeners are mild and often combined with stimulants. Mineral oil is largely deprecated for routine use.",
                "Counsel: hydrate. Lifestyle first — fiber, water, exercise, regular bathroom routine. Stimulant laxatives are NOT for daily long-term use."
            ]),

            // End of day
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Good. Tomorrow's specialty topics — REMS, immunizations, contraceptives, supplements. Sleep well."
            ]),

            .shiftEnd(closingLine: nil)
        ]
    )

    // MARK: - Day 30 — Specialty

    static let day30: RimrockShift = RimrockShift(
        dayNumber: 30,
        title: "Specialty",
        dateLine: "Friday, June 19",
        timeLine: "8:33 AM",
        locationLine: "Johnson County, Wyoming",
        beats: [
            .scene("Friday. The arc has wound down — but there's still material to cover. Today's the last formal review day."),

            .dialogue(speaker: .mara, lines: [
                "Last review day. Specialty topics — REMS, immunizations, contraception, dietary supplements. Things that show up on PTCE but don't always get covered in standard prep."
            ]),

            // REMS
            .dialogue(speaker: .mara, lines: [
                "REMS. Risk Evaluation and Mitigation Strategies — FDA-required programs for drugs with serious safety concerns. iPledge for isotretinoin. Clozapine REMS for agranulocytosis monitoring. Mifepristone REMS. Several biologics. The pharmacy's role varies by program — sometimes registered dispenser, sometimes patient enrollment verification, always documentation."
            ]),

            .question(.day30_remsPrograms),

            .dialogue(speaker: .mara, lines: [
                "iPledge for isotretinoin (Accutane and generics). Strict pregnancy prevention for any patient who can become pregnant — two negative pregnancy tests before, monthly during, and after. Two forms of contraception. Patient registration, prescriber registration, pharmacy registration. Each refill requires fresh registry confirmation and a pregnancy test in the registry. Lost prescription rules are tight.",
                "REMS programs change. Always check the specific program's current requirements."
            ]),

            // Immunizations
            .dialogue(speaker: .mara, lines: [
                "Immunizations. Adult key vaccines: annual flu, Tdap or Td booster every 10 years (Tdap at least once for pertussis), shingles series for adults 50+, pneumococcal for adults 65+ or earlier with risk conditions, COVID booster recommendations, HPV through age 45 in some indications. Pregnancy: Tdap each pregnancy, flu, RSV, COVID. Pediatric: a longer schedule from birth onward.",
                "Pharmacy's role varies by state — most states authorize pharmacists to administer most adult vaccines. Documentation goes to the state registry. Vaccine information statements (VIS) given to every patient before every dose."
            ]),

            .question(.day30_immunization),

            .dialogue(speaker: .mara, lines: [
                "Live attenuated vaccines: MMR, varicella, zoster (live form, mostly replaced by Shingrix), yellow fever, intranasal flu. Contraindicated in pregnancy and in significantly immunocompromised patients. Inactivated vaccines: most others — flu shot, Tdap, hepatitis A and B, HPV, pneumococcal, Shingrix, COVID. Generally safer in immunocompromised but immune response may be reduced."
            ]),

            // Contraception
            .dialogue(speaker: .mara, lines: [
                "Contraception. Hormonal: combined (estrogen + progestin) and progestin-only. Combined increases VTE risk especially in smokers over 35; progestin-only is safer for those patients. Long-acting: IUDs (copper non-hormonal, levonorgestrel hormonal), implants (etonogestrel — Nexplanon), injection (depot medroxyprogesterone — Depo-Provera). Emergency: levonorgestrel OTC, ulipristal Rx.",
                "Counseling on combined: take at the same time each day, a missed dose has specific make-up rules per the package insert, antibiotics generally don't reduce efficacy (rifampin is the exception that does), enzyme-inducing seizure meds reduce efficacy."
            ]),

            .question(.day30_contraception),

            // Dietary supplements
            .dialogue(speaker: .mara, lines: [
                "Dietary supplements and herbals. DSHEA — Dietary Supplement Health and Education Act, 1994 — regulates supplements as food, not drugs. No FDA premarket approval; structure-function claims permitted but not disease claims. Quality varies wildly between brands. Look for USP Verified mark.",
                "Major drug-supplement interactions to know: St. John's wort and CYP3A4 induction; ginkgo and bleeding risk; ginseng and warfarin; grapefruit (technically a food but counts here) and CYP3A4. Always ask patients about supplements during med rec — they often don't volunteer."
            ]),

            .question(.day30_stJohnsWort),

            .dialogue(speaker: .mara, lines: [
                "St. John's wort induces CYP3A4 — drops levels of many drugs, including hormonal contraceptives, statins, immunosuppressants, antiretrovirals, warfarin, and SSRIs (with added serotonin syndrome risk). It's the supplement with the highest density of drug interactions. Always document supplement use in the patient profile.",
                "..."
            ]),

            // Final reflection
            .scene("4:30 PM. The light through the back window is full June, the Bighorns clear all the way to the snow line. Mara comes back to the radio one more time before close."),

            .dialogue(speaker: .mara, lines: [
                "...That's the formal review.",
                "There's no thirty-first day on this radio. From Monday on, you and I are just colleagues. You'll keep learning — every shift is a new case, every case is a new question. The PTCE is one exam. The work is forever.",
                "You're ready. Take it whenever you want."
            ]),

            // End
            .scene("4:55 PM."),

            .dialogue(speaker: .mara, lines: [
                "Lock up. Drive safe.",
                "...Sleep well."
            ]),

            .shiftEnd(closingLine: "End of formal review. The work continues.")
        ]
    )

    // MARK: - Day 31 — Drug Stems Comprehensive

    static let day31: RimrockShift = RimrockShift(
        dayNumber: 31,
        title: "Drug Stems",
        dateLine: "Drill — Stems and Suffixes",
        timeLine: "Self-paced",
        locationLine: "Comprehensive review",
        beats: [
            .scene("Mara on the radio, no preamble. The sound of papers being shuffled in the background — she's pulled out an old training binder."),

            .dialogue(speaker: .mara, lines: [
                "Drill day. Stems and suffixes — the backbone of recognizing drug classes on sight. Every PTCB form has a dozen or so questions where the answer is just \"do you know the stem.\" Get these once and they're points forever.",
                "I'll give you the drug; you give me the class. Some I'll explain after; some I won't because the stem is the explanation."
            ]),

            .question(.day31_pril_ace),
            .question(.day31_sartan_arb),
            .question(.day31_olol_betaBlocker),
            .question(.day31_dipine_ccb),
            .question(.day31_statin_hmg),
            .question(.day31_prazole_ppi),
            .question(.day31_tidine_h2),
            .question(.day31_terol_beta2),
            .question(.day31_formin_biguanide),
            .question(.day31_gliflozin_sglt2),
            .question(.day31_glutide_glp1),
            .question(.day31_floxacin_fq),
            .question(.day31_thromycin_macrolide),
            .question(.day31_cycline_tetracycline),
            .question(.day31_conazole_antifungal),
            .question(.day31_vir_antiviral),
            .question(.day31_setron_5ht3),
            .question(.day31_triptan_migraine),
            .question(.day31_azepam_benzo),
            .question(.day31_dronate_bisphosphonate),
            .question(.day31_xaban_doac),
            .question(.day31_mab_monoclonal),
            .question(.day31_nib_kinase),
            .question(.day31_caine_anesthetic),

            .dialogue(speaker: .mara, lines: [
                "That's the core. Memorize the patterns and you'll catch the class on sight. The PTCB doesn't typically test obscure stems — they want the fifteen or twenty patterns that cover most of retail pharmacy. You just covered them."
            ]),

            .shiftEnd(closingLine: "End of Stems drill.")
        ]
    )

    // MARK: - Day 32 — Math Lab

    static let day32: RimrockShift = RimrockShift(
        dayNumber: 32,
        title: "Math Lab",
        dateLine: "Drill — Calculations",
        timeLine: "Self-paced",
        locationLine: "Comprehensive review",
        beats: [
            .scene("The pharmacy is empty for this drill. Mara is on the radio. You're at the back desk with a calculator. The only sound is paper."),

            .dialogue(speaker: .mara, lines: [
                "Pharmacy math. People panic on these because they're rusty on basic algebra. Slow down, write it out, plausibility-check. Math you don't do in your head you don't get wrong.",
                "Today: alligation, BSA dosing, drip rates, ratio strength, powder volume, percentage strength. Every type that shows up on the PTCB."
            ]),

            .question(.day32_alligation),
            .question(.day32_bsa),
            .question(.day32_dripGtt),
            .question(.day32_ratioStrength),
            .question(.day32_powderVolume),
            .question(.day32_percentStrengthWV),
            .question(.day32_doseConversionLbsKg),
            .question(.day32_daysSupplyEyeDrops),
            .question(.day32_daysSupplyInsulin),
            .question(.day32_chemoBSA),

            .dialogue(speaker: .mara, lines: [
                "All the math types the PTCB throws at you. Same pattern every time — write the problem out, identify what you're solving for, plausibility-check the answer. The answers will fight you only if you fight them."
            ]),

            .shiftEnd(closingLine: "End of Math Lab.")
        ]
    )

    // MARK: - Day 33 — Auxiliary Labels

    static let day33: RimrockShift = RimrockShift(
        dayNumber: 33,
        title: "Auxiliary Labels",
        dateLine: "Drill — Warnings and Cautions",
        timeLine: "Self-paced",
        locationLine: "Comprehensive review",
        beats: [
            .scene("Mara on radio, drilling the warnings every tech needs to apply automatically."),

            .dialogue(speaker: .mara, lines: [
                "Auxiliary labels. The orange and yellow stickers we put on the bottle. Each one corresponds to a real safety message and the PTCB asks which label goes with which drug.",
                "Run through these."
            ]),

            .question(.day33_takeWithFood),
            .question(.day33_emptyStomach),
            .question(.day33_avoidGrapefruit),
            .question(.day33_drowsiness),
            .question(.day33_avoidSunExposure),
            .question(.day33_avoidAlcohol),
            .question(.day33_avoidDairy),
            .question(.day33_shakeWell),

            .dialogue(speaker: .mara, lines: [
                "Auxiliary labels are reflex points on the PTCB if you've worked the counter. The trap is patient education — don't just slap labels on; tell the patient WHY each one matters."
            ]),

            .shiftEnd(closingLine: "End of Auxiliary Labels drill.")
        ]
    )

    // MARK: - Day 34 — ISMP Comprehensive

    static let day34: RimrockShift = RimrockShift(
        dayNumber: 34,
        title: "Safety Atlas",
        dateLine: "Drill — ISMP, Beers, High-Alert",
        timeLine: "Self-paced",
        locationLine: "Comprehensive review",
        beats: [
            .scene("The pharmacy quiet. Mara reading from a printed list — her own annotated copy of the ISMP and Beers references."),

            .dialogue(speaker: .mara, lines: [
                "Patient safety atlas. ISMP high-alert list, ISMP do-not-use abbreviations, Beers Criteria patterns, common LASA pairs. Every PTCE has questions from each.",
                "Run through them. I'll explain after each one."
            ]),

            .question(.day34_ismpHighAlertList),
            .question(.day34_ismpDoNotUseTrailingZero),
            .question(.day34_beersBenzoElderly),
            .question(.day34_lasaPairCelexa),
            .question(.day34_lasaPairHumalogHumulin),
            .question(.day34_lasaPairKlonopinClonidine),
            .question(.day34_tallManLettering),
            .question(.day34_blackBoxBeers),

            .dialogue(speaker: .mara, lines: [
                "Patient safety questions are the easiest points on the PTCB if you've actually read the ISMP and Beers lists. Most failures are from people who haven't."
            ]),

            .shiftEnd(closingLine: "End of Safety Atlas.")
        ]
    )

    // MARK: - Day 35 — Final Mock

    static let day35: RimrockShift = RimrockShift(
        dayNumber: 35,
        title: "Mock Exam",
        dateLine: "Final Drill — Mixed Domains",
        timeLine: "Self-paced",
        locationLine: "Comprehensive review",
        beats: [
            .scene("Last drill. Mara on radio, no commentary."),

            .dialogue(speaker: .mara, lines: [
                "Final mock. Mixed domains, blueprint weighted. The PTCE is 90 questions; this is a sampler.",
                "If you're answering most of these without thinking, you're ready. If you're hesitating on more than a third, drill the weak domain again."
            ]),

            .question(.day35_mock1),
            .question(.day35_mock2),
            .question(.day35_mock3),
            .question(.day35_mock4),
            .question(.day35_mock5),
            .question(.day35_mock6),
            .question(.day35_mock7),
            .question(.day35_mock8),
            .question(.day35_mock9),
            .question(.day35_mock10),
            .question(.day35_mock11),
            .question(.day35_mock12),

            .dialogue(speaker: .mara, lines: [
                "...That's it. End of formal review.",
                "Take the exam when you're ready. You're ready."
            ]),

            .shiftEnd(closingLine: "End of mock. End of formal review.")
        ]
    )

    // MARK: - All Shifts

    static let allShifts: [RimrockShift] = [
        day1, day2, day3, day4, day5, day6, day7, day8, day9, day10,
        day11, day12, day13, day14, day15, day16, day17, day18,
        day19, day20, day21, day22, day23, day24, day25,
        day26, day27, day28, day29, day30,
        day31, day32, day33, day34, day35
    ]
}

// MARK: - Day 1 Questions

extension RimrockQuestion {

    static let uspFridgeTemp = RimrockQuestion(
        id: "D1_USP_FRIDGE_TEMP",
        domain: .orderEntry,
        topic: "USP_STORAGE",
        prompt: "Acceptable temperature range for refrigerated medications?",
        options: ["2–8 °C", "0–10 °C", "4–12 °C", "8–15 °C"],
        correctAnswer: "2–8 °C",
        onCorrect: "Two to eight. Fahrenheit if you prefer it — thirty-six to forty-six. Anything outside that range, you call me before you do anything else. Even if it's the middle of the night. We had a power flicker in March that cost us a tray of Lantus. I am not going through that again.",
        onWrong: "Two to eight Celsius. Write that on the inside of your eyelids. Thirty-six to forty-six Fahrenheit. Anything outside that range, you call me. Doesn't matter if it's the middle of the night. We had a power flicker in March that cost us a tray of Lantus. We are not doing that again."
    )

    static let sigCodeQD = RimrockQuestion(
        id: "D1_SIG_QD",
        domain: .orderEntry,
        topic: "SIG_CODE",
        prompt: "\"i tab po qd\" — what's that telling you?",
        options: [
            "One tablet by mouth daily",
            "One tablet by mouth twice daily",
            "One tablet under the tongue daily",
            "One tablet by mouth as needed"
        ],
        correctAnswer: "One tablet by mouth daily",
        onCorrect: "Yeah. Lowercase i is one. PO is by mouth — per os. QD is daily. Joint Commission phased it out years ago because doctors were writing it sloppy and it was getting read as QID — four times daily — and people died. Hollis still uses QD. Hollis still uses a fountain pen, so. Pick your battles.",
        onWrong: "Slow down. Lowercase i is one. PO is by mouth — per os. QD is once daily. The reason Joint Commission tried to bury QD is doctors writing it sloppy and people reading it as QID. Four times daily. People died. Always read it twice. Hollis still writes it because Hollis still uses a fountain pen, so."
    )

    static let brandGenericToprolXL = RimrockQuestion(
        id: "D1_BRAND_TOPROL_XL",
        domain: .medications,
        topic: "BRAND_GENERIC",
        prompt: "Brand-name equivalent of metoprolol succinate ER 50 mg?",
        options: ["Toprol-XL", "Lopressor", "Tenormin", "Coreg"],
        correctAnswer: "Toprol-XL",
        onCorrect: "Toprol-XL. If he calls and asks why he's getting little white pills instead of little white pills with a different logo, that's your answer. Same drug, same release profile, twenty bucks instead of two hundred. Lopressor is metoprolol tartrate — different salt, different release, twice a day. Don't mix them up. People do. Easy way to put someone in the hospital.",
        onWrong: "Toprol-XL. The succinate goes with Toprol-XL — once daily, extended release. Lopressor is metoprolol tartrate — different salt, different release, twice a day. Tenormin is atenolol. Coreg is carvedilol. All beta-blockers, none the same drug. Mix them up and you put someone in the hospital."
    )

    static let partialFillOwed = RimrockQuestion(
        id: "D1_PARTIAL_FILL_AMOX",
        domain: .orderEntry,
        topic: "PARTIAL_FILL",
        prompt: "Total quantity 30, you dispensed 14. How many do you owe?",
        options: ["16", "14", "30", "0"],
        correctAnswer: "16",
        onCorrect: "Right. Patients don't care about logistics, they care about feeling better. Tell her she can come pick the rest up after lunch tomorrow. We'll have it.",
        onWrong: "Sixteen. Thirty minus fourteen. Note it on the slip — partial fill, 14 dispensed, 16 owed — and in the system. We owe her the rest off tomorrow's truck."
    )
}

// MARK: - Day 2 Questions

extension RimrockQuestion {

    static let day2_form222 = RimrockQuestion(
        id: "D2_FORM_222",
        domain: .federalRequirements,
        topic: "DEA_FORM_222",
        prompt: "A DEA Form 222 is required for ordering which controlled substance schedule?",
        options: ["Schedule II", "Schedule III", "Schedule IV", "Schedule V"],
        correctAnswer: "Schedule II",
        onCorrect: "Two only. Schedule II — the heavy stuff. Oxy, hydrocodone, fentanyl, methadone, Adderall, Ritalin. Three through Five come on the same wholesale invoice as your benzonatate and your nasal spray. CSOS is the electronic version of Form 222 — same idea, same scheduling rules.",
        onWrong: "Two. Schedule II only. Three through Five come on the same invoice as everything else. Form 222 is for the controlled substances we keep in the safe behind two locks. CSOS is the electronic version. We'll handle those next time."
    )

    static let day2_pseudoephedrineLimit = RimrockQuestion(
        id: "D2_PSE_LIMIT",
        domain: .federalRequirements,
        topic: "PSE_CMEA",
        prompt: "Federal limit on pseudoephedrine: how many grams of base may a single customer purchase per day?",
        options: ["3.6 g", "7.5 g", "9 g", "Unlimited with prescription"],
        correctAnswer: "3.6 g",
        onCorrect: "Three point six grams a day. Nine grams a month. Federal floor — your state can tighten it. Wyoming basically uses the federal numbers. The point isn't to make life hard for people with allergies; the point is the methamphetamine epidemic that gave us this paperwork. Combat Meth Epidemic Act, 2005.",
        onWrong: "Three point six grams per day. Nine grams per month — federal, states can tighten. Wyoming sticks with the floor. We log the buyer's name, ID, address. Customer gets one box, signs the electronic registry, gets out. We keep records two years. Combat Meth Epidemic Act."
    )

    static let day2_lasaHydralazine = RimrockQuestion(
        id: "D2_LASA_HYDRALAZINE",
        domain: .patientSafety,
        topic: "LASA",
        prompt: "Which medication treats hypertension?",
        options: ["Hydroxyzine", "Hydralazine", "Both", "Neither"],
        correctAnswer: "Hydralazine",
        onCorrect: "Hydralazine — the vasodilator. Hydroxyzine is the antihistamine, used for anxiety and itching. Different drug, different class, different reason. The names look almost identical on a prescription pad. The classic look-alike sound-alike. Tall man lettering helps — hydrALAzine, hydrOXYzine. Once you've seen the trap once, you don't fall for it. The first time, though, people die.",
        onWrong: "Hydralazine. The vasodilator. Hydroxyzine is the antihistamine — anxiety and itch. Names look identical, drugs are not. Tall man lettering helps — hydrALAzine, hydrOXYzine. Always read twice."
    )

    static let day2_ntiLevothyroxine = RimrockQuestion(
        id: "D2_NTI_LEVO",
        domain: .medications,
        topic: "NTI_DRUGS",
        prompt: "Which of the following is considered a narrow therapeutic index (NTI) drug?",
        options: ["Levothyroxine", "Acetaminophen", "Ibuprofen", "Loratadine"],
        correctAnswer: "Levothyroxine",
        onCorrect: "Levothyroxine. Warfarin's the other one most people know. Lithium, digoxin, phenytoin, carbamazepine, theophylline — that's most of the NTI list. Small therapeutic window, big difference between not enough and too much. The classics.",
        onWrong: "Levothyroxine. NTI list includes warfarin, lithium, digoxin, phenytoin, carbamazepine, theophylline, levothyroxine — drugs where a small dose change throws the patient off. Acetaminophen actually has the OPPOSITE problem — wide window then sudden hepatotoxicity at high doses. Ibuprofen and loratadine — wide windows, both."
    )
}

// MARK: - Day 3 Questions

extension RimrockQuestion {

    static let day3_scheduleIIRefills = RimrockQuestion(
        id: "D3_C2_REFILLS",
        domain: .federalRequirements,
        topic: "C2_REFILL_RULES",
        prompt: "How many refills are permitted on a Schedule II prescription?",
        options: ["0", "1", "5", "Unlimited within 6 months"],
        correctAnswer: "0",
        onCorrect: "Zero. Period. Schedule II — no refills, no phone-ins, no faxing except in narrow exceptions like LTC or hospice. New prescription each time. The prescriber can write multiple sequential prescriptions for up to ninety days of therapy total, post-dated, but each is its own document.",
        onWrong: "Zero. None. Schedule II is no refills, ever. New prescription each time. Prescribers can write multiple sequential prescriptions for up to ninety days of therapy — each post-dated, each its own document. Never refilled. Faxing or phoning C-IIs is only allowed in narrow LTC / hospice / emergency cases."
    )

    static let day3_deaNumberLetter = RimrockQuestion(
        id: "D3_DEA_LETTER",
        domain: .federalRequirements,
        topic: "DEA_NUMBER",
        prompt: "For a practitioner-registered prescriber, the first letter of the DEA number is...?",
        options: ["A or B (or F)", "A only", "Always P", "Always M"],
        correctAnswer: "A or B (or F)",
        onCorrect: "A or B for traditional practitioners. F was added later when A/B numbers ran out. M is for mid-level practitioners — NPs, PAs in some states. The second letter historically matches the registrant's last name initial. Newer registrations don't always follow that, but old DEAs still do.",
        onWrong: "A, B, or F for practitioners. M for mid-levels — NPs, PAs in some states. The second letter is the registrant's last name initial — at least historically. If the second letter doesn't match the prescriber's last name, that doesn't always mean fraud, but it's worth a second look."
    )

    static let day3_lasaCelebrex = RimrockQuestion(
        id: "D3_LASA_CELEBREX",
        domain: .patientSafety,
        topic: "LASA",
        prompt: "Celebrex, Celexa, Cerebyx — which is the anti-inflammatory?",
        options: ["Celebrex", "Celexa", "Cerebyx", "They're all anti-inflammatories"],
        correctAnswer: "Celebrex",
        onCorrect: "Celebrex is celecoxib — a COX-2 selective NSAID, anti-inflammatory. Celexa is citalopram — SSRI, antidepressant. Cerebyx is fosphenytoin — anti-seizure. Three drugs that sound the same and treat nothing in common. Pharmacy school's favorite trap. Always read twice.",
        onWrong: "Celebrex. Celecoxib — COX-2 NSAID. Celexa is citalopram, SSRI. Cerebyx is fosphenytoin, anti-seizure. Three drugs that sound the same and have nothing in common. Always read twice. The patient on Celebrex who got Celexa instead is a real case from real years — search the FDA archives if you want to lose sleep."
    )

    static let day3_pmpResponse = RimrockQuestion(
        id: "D3_PMP_RESPONSE",
        domain: .patientSafety,
        topic: "PMP_DOCTOR_SHOPPING",
        prompt: "A patient calls about a controlled-substance refill. The state PMP shows the same drug filled at another pharmacy five days ago. What's the appropriate response?",
        options: [
            "Fill it; he's on file with a valid prescription",
            "Refuse to fill, document the PMP findings, and contact the prescriber",
            "Fill it but call the police",
            "Fill it but reduce the quantity"
        ],
        correctAnswer: "Refuse to fill, document the PMP findings, and contact the prescriber",
        onCorrect: "Refuse the fill, document the lookup, contact the prescriber. We're not the cops. We're not the patient's parent. We're the gate between his prescriber's intent and what actually goes home. If the prescriber says fill it after seeing the PMP, that's between them. We did our part by checking.",
        onWrong: "Refuse, document, contact prescriber. PMP exists exactly for this — a near-50-state database designed to catch the gaps between prescribers. Filling without resolving the discrepancy isn't compassion, it's malpractice. Calling the police isn't our job either. We're the gate, not the punishment."
    )
}

// MARK: - Day 4 Questions

extension RimrockQuestion {

    static let day4_lisinoprilClass = RimrockQuestion(
        id: "D4_LISINOPRIL_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_ACE",
        prompt: "Lisinopril belongs to which drug class?",
        options: ["ACE inhibitor", "ARB", "Beta-blocker", "Calcium channel blocker"],
        correctAnswer: "ACE inhibitor",
        onCorrect: "ACE inhibitor. Stem is '-pril' — lisinopril, enalapril, ramipril, benazepril. Blocks angiotensin-converting enzyme. Side effect everyone gets tested on: dose-independent dry cough, about ten percent of patients. Switch them to an ARB if the cough is bad — those end in '-sartan' and don't cause it.",
        onWrong: "ACE inhibitor. The '-pril' stem gives it away — that's the whole class. Lisinopril, enalapril, ramipril. Blocks angiotensin-converting enzyme, lowers blood pressure, dry cough is the classic side effect. Switch to ARB ('-sartan') if cough is intolerable."
    )

    static let day4_atorvastatinClass = RimrockQuestion(
        id: "D4_ATORVASTATIN_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_STATIN",
        prompt: "Atorvastatin's mechanism of action?",
        options: ["HMG-CoA reductase inhibitor", "Bile acid sequestrant", "PCSK9 inhibitor", "Niacin derivative"],
        correctAnswer: "HMG-CoA reductase inhibitor",
        onCorrect: "Statin. Stem is '-statin' — atorvastatin, rosuvastatin, simvastatin, pravastatin. Blocks HMG-CoA reductase, the rate-limiting enzyme in cholesterol synthesis. Risks: rhabdomyolysis at high doses, especially with grapefruit juice for some statins. Counsel: muscle pain or dark urine, call the doctor.",
        onWrong: "HMG-CoA reductase inhibitor. The '-statin' stem is the class. Blocks the rate-limiting enzyme in cholesterol synthesis. Watch for muscle pain or dark urine — that's rhabdomyolysis. Grapefruit juice raises levels of some statins. Counsel on it."
    )

    static let day4_metforminIndication = RimrockQuestion(
        id: "D4_METFORMIN_INDICATION",
        domain: .medications,
        topic: "DRUG_INDICATION",
        prompt: "Metformin is first-line for which condition?",
        options: ["Type 2 diabetes", "Hypertension", "Heart failure", "GERD"],
        correctAnswer: "Type 2 diabetes",
        onCorrect: "Type 2 diabetes. ADA first-line, has been for decades. Decreases hepatic glucose production, increases peripheral insulin sensitivity. Watch for B12 deficiency on long-term therapy. Hold for forty-eight hours before IV contrast — lactic acidosis risk. Take with food.",
        onWrong: "Type 2 diabetes. ADA first-line. Decreases hepatic glucose production, increases peripheral insulin sensitivity. Long-term: B12 deficiency. Critical: HOLD before IV contrast — lactic acidosis risk. Take with food."
    )

    static let day4_omeprazoleClass = RimrockQuestion(
        id: "D4_OMEPRAZOLE_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_PPI",
        prompt: "Omeprazole is a...?",
        options: ["Proton pump inhibitor (PPI)", "H2 blocker", "Antacid", "Prokinetic"],
        correctAnswer: "Proton pump inhibitor (PPI)",
        onCorrect: "PPI. Stem is '-prazole' — omeprazole, esomeprazole, pantoprazole, lansoprazole. Blocks the H/K ATPase pump in parietal cells. Long-term use: B12 deficiency, increased fracture risk, possible C. diff. Step patients down when reflux resolves. Don't keep them on these forever.",
        onWrong: "PPI. The '-prazole' stem is the class. Blocks the H/K ATPase pump. Long-term: B12 deficiency, fracture risk, C. diff risk. H2 blockers end in '-tidine' (ranitidine, famotidine) and are weaker. Antacids are calcium/magnesium/aluminum salts. PPIs are first-line for GERD."
    )
}

// MARK: - Day 5 Questions

extension RimrockQuestion {

    static let day5_warfarinINR = RimrockQuestion(
        id: "D5_WARFARIN_INR",
        domain: .medications,
        topic: "WARFARIN_INR",
        prompt: "Therapeutic INR range for atrial fibrillation on warfarin?",
        options: ["1.0–1.5", "2.0–3.0", "2.5–3.5", "4.0–5.0"],
        correctAnswer: "2.0–3.0",
        onCorrect: "Two to three. Standard. Two-five to three-five for mechanical heart valves, that's the higher target. Below two, clot risk; above three, bleed risk. We don't dose warfarin — that's the prescriber and the anti-coag clinic. We dispense and we counsel.",
        onWrong: "Two to three for AFib, DVT, PE. Two-five to three-five for mechanical heart valves. Below two: clot. Above three: bleed. Anti-coag clinic dose-adjusts. We dispense and counsel — vitamin K consistency, watch for bleeding, don't double doses."
    )

    static let day5_betaBlockerContra = RimrockQuestion(
        id: "D5_BB_CONTRA",
        domain: .patientSafety,
        topic: "DRUG_CONTRAINDICATION",
        prompt: "Which condition is a relative contraindication for non-selective beta-blockers?",
        options: ["Hypertension", "Asthma", "Atrial fibrillation", "Angina"],
        correctAnswer: "Asthma",
        onCorrect: "Asthma. Non-selective beta-blockers like propranolol can trigger bronchospasm. Selective beta-1 like metoprolol or atenolol are safer but still ask before recommending. The other three are actually INDICATIONS for beta-blockers. Always check the chart.",
        onWrong: "Asthma. Beta-2 receptors in the lungs need to stay open. Non-selectives like propranolol block both beta-1 and beta-2 — bad for asthmatics. Selective beta-1 (metoprolol, atenolol — '-olol' stems with bisop, meto, atenol) are safer but not zero risk. The other three are indications, not contraindications."
    )

    static let day5_hyperkalemia = RimrockQuestion(
        id: "D5_HYPERKALEMIA",
        domain: .patientSafety,
        topic: "DRUG_INTERACTION",
        prompt: "A patient on lisinopril is also taking potassium chloride and spironolactone. The pharmacist's concern is...?",
        options: ["Hyperkalemia", "Hypokalemia", "Hyponatremia", "Hypoglycemia"],
        correctAnswer: "Hyperkalemia",
        onCorrect: "Hyperkalemia. ACE inhibitors retain potassium. Spironolactone retains potassium. Potassium chloride IS potassium. Three sources stacking. The patient might be fine — or might end up with a six-point-five K and a wonky EKG. DUR alert exists for exactly this. Don't override without thinking.",
        onWrong: "Hyperkalemia. Three potassium-elevating sources: ACE inhibitor (retention), aldosterone antagonist (spironolactone — retention), and the supplement (direct). Stack effects. Severe hyperkalemia is cardiac — peaked T waves, arrhythmia. The OTC supplement is the easiest one to stop."
    )

    static let day5_warfarinBactrim = RimrockQuestion(
        id: "D5_WARFARIN_BACTRIM",
        domain: .patientSafety,
        topic: "WARFARIN_DDI",
        prompt: "A patient on warfarin is prescribed which of the following is most likely to require dose adjustment?",
        options: ["Trimethoprim-sulfamethoxazole", "Cetirizine", "Loratadine", "Acetaminophen ≤2 g/day"],
        correctAnswer: "Trimethoprim-sulfamethoxazole",
        onCorrect: "Bactrim. Trimethoprim-sulfamethoxazole inhibits CYP enzymes that metabolize warfarin — INR can go through the roof. Other classics: amiodarone, fluconazole, metronidazole, rifampin (other direction — induces, lowers INR). When in doubt, look it up. Don't trust your memory on warfarin interactions — there are too many.",
        onWrong: "Bactrim. Trimethoprim-sulfamethoxazole spikes INR via CYP inhibition — risk of major bleed. The big-name warfarin DDIs: amiodarone, Bactrim, fluconazole, metronidazole all RAISE INR. Rifampin LOWERS it. Antihistamines and low-dose acetaminophen are usually fine. Always check the chart, never trust memory."
    )
}

// MARK: - Day 6 Questions

extension RimrockQuestion {

    static let day6_rxRequiredElements = RimrockQuestion(
        id: "D6_RX_REQUIRED_ELEMENTS",
        domain: .patientSafety,
        topic: "RX_PATIENT_ID",
        prompt: "What's missing from this prescription that prevents you from filling it as written?",
        options: [
            "Complete patient name and full date of birth",
            "Drug strength",
            "Quantity dispensed",
            "Prescriber signature"
        ],
        correctAnswer: "Complete patient name and full date of birth",
        onCorrect: "Complete patient ID. 'Marge' is a nickname; the full DOB is missing. Federal and state law require enough information to unambiguously identify the patient — full name, full DOB, address often. Drug, strength, qty, and signature are present. ID isn't. We don't fill until we confirm.",
        onWrong: "Patient ID. 'Marge' could be Margaret or Marjorie. The DOB is just a year. We need full first and last name plus complete date of birth to confirm we're filling for the right person. The other elements — drug, strength, qty, signature — are all on the slip. The patient ID is the gap."
    )

    static let day6_amlodipineClass = RimrockQuestion(
        id: "D6_AMLODIPINE_CLASS",
        domain: .medications,
        topic: "DRUG_CLASS_CCB",
        prompt: "Amlodipine belongs to which drug class?",
        options: ["Calcium channel blocker (CCB)", "ACE inhibitor", "Beta-blocker", "Thiazide diuretic"],
        correctAnswer: "Calcium channel blocker (CCB)",
        onCorrect: "Calcium channel blocker. Stem is '-dipine' — amlodipine, nifedipine, felodipine, all dihydropyridines. Block calcium influx into vascular smooth muscle, vasodilation, lower BP. Watch for ankle edema, headache, flushing. Verapamil and diltiazem are non-dihydropyridine CCBs — different stem, different side effect profile (constipation, AV node blockade).",
        onWrong: "Calcium channel blocker. The '-dipine' stem is the dihydropyridine subclass — amlodipine, nifedipine, felodipine. Block calcium influx into vascular smooth muscle. Watch for ankle edema, flushing, headache. Verapamil and diltiazem are the OTHER CCB subclass — non-dihydropyridines."
    )

    static let day6_sulfaAllergy = RimrockQuestion(
        id: "D6_SULFA_ALLERGY",
        domain: .patientSafety,
        topic: "ALLERGY_DUR",
        prompt: "A patient with documented sulfa allergy is prescribed trimethoprim-sulfamethoxazole. What should the pharmacy do?",
        options: [
            "Fill it; documented allergies are often outdated",
            "Refuse to fill, document the alert, and contact the prescriber for an alternative",
            "Fill it but counsel the patient extensively",
            "Substitute amoxicillin without contacting the prescriber"
        ],
        correctAnswer: "Refuse to fill, document the alert, and contact the prescriber for an alternative",
        onCorrect: "Refuse, document, contact. Sulfa allergies range from rash to Stevens-Johnson — the rash and hives this patient has documented are real. Bactrim contains sulfamethoxazole; we don't override a documented allergy without a prescriber's explicit OK. Substituting drug class on our own is dispensing without authority — that's the prescriber's call.",
        onWrong: "Refuse, document, contact. Sulfa reactions range from rash to Stevens-Johnson syndrome — Henry's documented rash is real. Bactrim contains sulfamethoxazole. We never override documented allergies on our own; the prescriber decides what alternative — doxycycline, amoxicillin-clavulanate, both are reasonable for sinusitis."
    )

    static let day6_amlodipineGrapefruit = RimrockQuestion(
        id: "D6_GRAPEFRUIT_CYP",
        domain: .medications,
        topic: "FOOD_DRUG_INTERACTION",
        prompt: "Why should patients on amlodipine avoid grapefruit?",
        options: [
            "Grapefruit inhibits CYP3A4, raising amlodipine levels",
            "Grapefruit lowers amlodipine absorption",
            "Grapefruit and amlodipine both lower potassium",
            "Grapefruit increases the risk of edema"
        ],
        correctAnswer: "Grapefruit inhibits CYP3A4, raising amlodipine levels",
        onCorrect: "CYP3A4 inhibition. Grapefruit (and Seville orange marmalade — the bitter ones) block CYP3A4, the enzyme that metabolizes amlodipine. Drug stays in the system longer, levels go up, blood pressure can drop too far. Effect lasts about three days, so 'just in the morning' isn't a workaround. Same applies to other CYP3A4 substrates like simvastatin, some immunosuppressants, certain antiarrhythmics.",
        onWrong: "CYP3A4 inhibition. Grapefruit blocks the enzyme that breaks down amlodipine — drug stays around longer, levels climb, blood pressure can drop too far. Inhibition lasts about three days, so timing it doesn't help. Lemons, oranges, limes are fine; grapefruit and Seville orange marmalade are out. Same for several other drugs: simvastatin, some immunosuppressants."
    )
}

// MARK: - Day 7 Questions

extension RimrockQuestion {

    static let day7_pediDosing = RimrockQuestion(
        id: "D7_PEDI_DOSING",
        domain: .orderEntry,
        topic: "WEIGHT_BASED_DOSING",
        prompt: "Mason weighs 22 kg. Amoxicillin-clavulanate at 90 mg/kg/day BID. Prescribed: 5 mL of 600 mg / 5 mL suspension twice daily. Is this within range?",
        options: [
            "Yes, ~55 mg/kg/day — within range",
            "No, dose is too low",
            "No, dose is too high",
            "Cannot calculate from given information"
        ],
        correctAnswer: "Yes, ~55 mg/kg/day — within range",
        onCorrect: "Within range. 5 mL × 600 mg / 5 mL = 600 mg per dose. BID = 1200 mg/day total. 1200 ÷ 22 kg = ~54.5 mg/kg/day. Standard amoxicillin-clavulanate range for otitis media is 45 to 90 mg/kg/day, so this is on the low end. Acceptable. If we wanted high-dose for resistant strains, we'd push to ninety.",
        onWrong: "Within range, on the low end. 5 mL × 600 mg/5 mL = 600 mg per dose. BID = 1200 mg/day. 1200 ÷ 22 = ~55 mg/kg/day. The 45–90 mg/kg/day range covers this. Always do the math for pediatric scripts; weight-based dosing is the most common dosing error in retail pharmacy."
    )

    static let day7_metforminContrast = RimrockQuestion(
        id: "D7_METFORMIN_CONTRAST",
        domain: .patientSafety,
        topic: "METFORMIN_CONTRAST_HOLD",
        prompt: "A patient on metformin is scheduled for IV iodinated contrast. What's the standard recommendation?",
        options: [
            "Hold metformin for 48 hours after contrast and recheck renal function before restarting",
            "Continue metformin without changes",
            "Stop metformin permanently",
            "Increase metformin dose to compensate"
        ],
        correctAnswer: "Hold metformin for 48 hours after contrast and recheck renal function before restarting",
        onCorrect: "Hold for 48 hours after contrast, recheck renal function, then restart. The risk is lactic acidosis — metformin accumulates if contrast-induced kidney injury reduces clearance. ACR guidelines support this for patients with eGFR < 30 or with AKI; many imaging centers apply it broadly to be safe. The patient should be told; we should be told; sometimes the loop misses us.",
        onWrong: "Hold 48 hours after contrast, recheck renal function, restart. Risk is lactic acidosis if kidneys are stunned by the contrast — metformin accumulates. ACR guidelines, applied broadly by most imaging centers. Every diabetic on metformin who's getting CT/MRI/cath needs this conversation. Loop usually closes; sometimes it misses us."
    )

    static let day7_highAlertMed = RimrockQuestion(
        id: "D7_HIGH_ALERT_INSULIN",
        domain: .patientSafety,
        topic: "HIGH_ALERT_MEDICATIONS",
        prompt: "Which of the following is on the ISMP list of high-alert medications?",
        options: ["Insulin", "Loratadine", "Acetaminophen", "Cetirizine"],
        correctAnswer: "Insulin",
        onCorrect: "Insulin. Top of the ISMP high-alert list for outpatient and inpatient. Mix-ups between long-acting (glargine, detemir, degludec) and rapid-acting (lispro, aspart, glulisine) cause severe hypoglycemia or hyperglycemia. Other high-alert classes: anticoagulants, opioids, chemotherapy, neuromuscular blockers, concentrated electrolytes (KCl).",
        onWrong: "Insulin. ISMP high-alert list — drugs with a heightened risk of significant patient harm when used in error. Other top entries: anticoagulants (warfarin, heparin, DOACs), opioids, methotrexate (oral, weekly dosing!), neuromuscular blockers, concentrated KCl, chemotherapy. Loratadine, acetaminophen, cetirizine are not on the list."
    )

    static let day7_ismpDoNotUse = RimrockQuestion(
        id: "D7_ISMP_DO_NOT_USE",
        domain: .patientSafety,
        topic: "ISMP_ABBREVIATIONS",
        prompt: "Which abbreviation is on the ISMP \"Do Not Use\" list because of error risk?",
        options: ["U or u (for units)", "mg", "mL", "bid"],
        correctAnswer: "U or u (for units)",
        onCorrect: "'U' or 'u' for units. It gets misread as a zero — '4U' becomes '40,' a tenfold dose error. Always write 'units' fully. Other do-not-use entries: 'IU' (international units, mistaken for IV), 'qd' (mistaken for qid — that's the QD-people-died story from Day 1), trailing zeros after decimals (1.0 mg can read as 10 mg), naked decimals (.5 mg should be 0.5 mg). ISMP and Joint Commission keep the list current.",
        onWrong: "'U' or 'u' for units. Misread as zero — '4U' becomes '40,' tenfold overdose. Always spell 'units.' Other do-not-use: 'IU' (mistaken for IV), 'qd' (mistaken for qid), trailing zeros (1.0 mg → 10 mg), naked decimals (.5 mg should be 0.5). The list exists because each entry is somebody who died."
    )
}

// MARK: - Day 8 Questions

extension RimrockQuestion {

    static let day8_ciiPartialFill = RimrockQuestion(
        id: "D8_CII_PARTIAL_FILL",
        domain: .federalRequirements,
        topic: "CII_PARTIAL_FILL_HOSPICE",
        prompt: "Under CARA (Comprehensive Addiction and Recovery Act, 2016), how long does a hospice or LTC patient have to receive the remainder of a partially-filled C-II prescription?",
        options: ["30 days from issue date", "7 days", "60 days", "Same calendar month only"],
        correctAnswer: "30 days from issue date",
        onCorrect: "Thirty days from the date the prescription was issued. CARA expanded partial-fill flexibility for hospice, LTC, and any patient who requests it. Standard CII patients also have the option, but the remaining quantity must still be dispensed within thirty days. After thirty, the leftover quantity is forfeit unless the prescriber writes a new script.",
        onWrong: "Thirty days from issue date. CARA, 2016, expanded partial-fill rules. Hospice and LTC patients can split the fill across multiple visits; same for patients who simply request it. Past thirty days, the remaining quantity is forfeit."
    )

    static let day8_form222Copies = RimrockQuestion(
        id: "D8_FORM_222_COPIES",
        domain: .federalRequirements,
        topic: "FORM_222_PROCESS",
        prompt: "How many copies (parts) does a paper DEA Form 222 have, and who keeps which?",
        options: [
            "Three: white kept by purchaser, green kept by purchaser after receipt, blue kept by supplier",
            "Two: pink kept by purchaser, white kept by supplier",
            "Four: copies for purchaser, supplier, DEA, and state board",
            "One: a single sheet signed by both parties"
        ],
        correctAnswer: "Three: white kept by purchaser, green kept by purchaser after receipt, blue kept by supplier",
        onCorrect: "Three carbon copies. The supplier (wholesaler) gets the blue when shipping; the purchaser keeps white as the order record and adds green to the records once the shipment arrives and is verified. CSOS — the electronic Controlled Substance Ordering System — replaces the paper form with digital signatures but follows the same audit trail. Records kept on-site for two years, accessible to DEA on request.",
        onWrong: "Three parts: white (purchaser keeps as order record), green (purchaser keeps after receiving), blue (supplier keeps). Records on-site for two years, DEA on request. CSOS is the electronic equivalent — same data, digital signatures, no paper."
    )

    static let day8_perpetualInventory = RimrockQuestion(
        id: "D8_PERPETUAL_INVENTORY",
        domain: .federalRequirements,
        topic: "CII_PERPETUAL",
        prompt: "Federal law requires perpetual inventory for which schedule of controlled substances?",
        options: ["Schedule II", "Schedule III only", "All schedules", "No federal perpetual requirement"],
        correctAnswer: "Schedule II",
        onCorrect: "Schedule II requires perpetual count federally. Many states extend perpetual inventory to all controlled substances; many pharmacies do it voluntarily for III through V to catch theft early. The federal floor is C-II only — running count of every transaction in and out, reconciled against physical count regularly.",
        onWrong: "Schedule II — federal floor. Running count of every C-II transaction; reconciled to physical count on a schedule. States often extend to III through V; pharmacies often go further voluntarily. Discrepancies must be investigated immediately — count error, billing error, or theft."
    )

    static let day8_biennialInventory = RimrockQuestion(
        id: "D8_BIENNIAL_INVENTORY",
        domain: .federalRequirements,
        topic: "BIENNIAL_INVENTORY",
        prompt: "DEA biennial inventory: how often must a pharmacy do a complete physical count of all controlled substances?",
        options: ["Every 2 years", "Annually", "Every 5 years", "Every 6 months"],
        correctAnswer: "Every 2 years",
        onCorrect: "Every two years — biennial. C-IIs counted exactly. C-III through V can be estimated for any container of more than 1,000 dosage units; under that, exact count. Records on-site, accessible to DEA on request, kept at least two years. Many pharmacies do it more frequently — every six or twelve months — for their own peace of mind.",
        onWrong: "Every two years — biennial inventory. C-IIs counted exact; C-III through V estimated for bottles over 1,000 dosage units, exact below. Two-year recordkeeping, DEA on request. Internal policy often more frequent — six-month or annual is common."
    )
}

// MARK: - Day 9 Questions

extension RimrockQuestion {

    static let day9_ndcStructure = RimrockQuestion(
        id: "D9_NDC_STRUCTURE",
        domain: .orderEntry,
        topic: "NDC_FORMAT",
        prompt: "An 11-digit NDC is segmented as which three parts?",
        options: [
            "Labeler / product / package (e.g., 5-4-2)",
            "Drug class / strength / package",
            "Manufacturer / lot / expiration",
            "Schedule / form / quantity"
        ],
        correctAnswer: "Labeler / product / package (e.g., 5-4-2)",
        onCorrect: "Labeler-product-package. The 11-digit format pads to 5-4-2 segments — five digits for the labeler (manufacturer or repackager), four for the product (drug, strength, dosage form), two for the package (size, type). Original 10-digit NDCs come in 4-4-2, 5-3-2, or 5-4-1 patterns; pharmacy software pads them to 11 by adding a leading zero to the segment that's short.",
        onWrong: "Labeler-product-package — 5-4-2 in the padded 11-digit format. Labeler is the manufacturer or repackager. Product is the drug, strength, and form together. Package is the bottle size and type. Old 10-digit NDCs (4-4-2, 5-3-2, 5-4-1) get padded to 11 by adding a leading zero where the segment is short."
    )

    static let day9_binPcn = RimrockQuestion(
        id: "D9_BIN_PCN",
        domain: .orderEntry,
        topic: "INSURANCE_BIN_PCN",
        prompt: "On a prescription insurance card, what does the BIN number identify?",
        options: [
            "The claims processor for routing",
            "The patient's specific plan",
            "The prescriber",
            "The pharmacy"
        ],
        correctAnswer: "The claims processor for routing",
        onCorrect: "BIN — Bank Identification Number — routes the claim to the correct pharmacy benefit manager (PBM) or processor. PCN routes within that processor — same BIN may serve multiple plans, PCN distinguishes them. Group ID identifies the employer or plan; Cardholder ID is the patient. Four pieces, all required for clean billing.",
        onWrong: "BIN routes to the processor (PBM). PCN routes within the processor. Group ID is the employer/plan. Cardholder ID is the patient. Four pieces — all needed for billing. If any one is wrong or missing, claim rejects with an unhelpful error code."
    )

    static let day9_couponMedicare = RimrockQuestion(
        id: "D9_COUPON_MEDICARE",
        domain: .federalRequirements,
        topic: "ANTI_KICKBACK",
        prompt: "Why can't a manufacturer copay coupon be applied to a prescription billed through Medicare?",
        options: [
            "Federal anti-kickback statute prohibits it",
            "Medicare doesn't accept coupons",
            "Manufacturers don't allow it",
            "It causes a billing error"
        ],
        correctAnswer: "Federal anti-kickback statute prohibits it",
        onCorrect: "Anti-kickback. The federal Anti-Kickback Statute prohibits offering anything of value to induce purchases reimbursed by federal healthcare programs (Medicare, Medicaid, TRICARE, VA). Manufacturer coupons that lower the patient's out-of-pocket cost on a Medicare claim count as inducement. Penalties run up to felony for the patient and the pharmacy. Direct patients to the manufacturer's separate patient assistance program — that's a different mechanism, federally permitted.",
        onWrong: "Federal Anti-Kickback Statute. Manufacturer coupons applied to Medicare or Medicaid claims count as illegal inducement; penalties are felony-level. Manufacturers' separate patient assistance programs (PAP) — distinct enrollment, often based on income — ARE permitted. Direct the patient there."
    )

    static let day9_vacationOverride = RimrockQuestion(
        id: "D9_VACATION_OVERRIDE",
        domain: .orderEntry,
        topic: "REFILL_OVERRIDE",
        prompt: "A patient needs a 30-day refill of a maintenance medication 5 days early because they're traveling. What's the correct billing approach?",
        options: [
            "Submit a vacation override (code 03) through the insurance",
            "Refuse the early refill",
            "Bill cash without insurance",
            "Submit normally; insurance will figure it out"
        ],
        correctAnswer: "Submit a vacation override (code 03) through the insurance",
        onCorrect: "Vacation override, NCPDP code 03. Most insurances allow once or twice per year for a 30- or 90-day early refill. If the override is rejected, call the insurance — sometimes the patient just hasn't used theirs yet this year. If they refuse, the patient pays cash for the bridge supply. We don't let chronic-disease patients run out of medication on the road.",
        onWrong: "Vacation override, code 03. Most insurances allow it once or twice annually. If rejected, call the insurance — could be a system glitch, could be the override is already used. Cash bridge fill is the last resort. Patient on chronic meds should not run out on a trip."
    )

    static let day9_priorAuth = RimrockQuestion(
        id: "D9_PRIOR_AUTH",
        domain: .orderEntry,
        topic: "PRIOR_AUTHORIZATION",
        prompt: "An insurance rejection requires \"prior authorization.\" Whose responsibility is it to obtain the PA?",
        options: [
            "The prescriber, who must justify the prescription to the insurance",
            "The pharmacy",
            "The patient",
            "The patient's employer"
        ],
        correctAnswer: "The prescriber, who must justify the prescription to the insurance",
        onCorrect: "The prescriber. Prior authorization is the insurance company's process for confirming medical necessity before paying — only the prescriber can justify the clinical decision. Pharmacy's role: notify the prescriber's office, fax or e-fax the PA request, and tell the patient who's doing what. Average turnaround three to seven business days, longer for specialty drugs. Patient often blames the pharmacy because we're who they see; we explain the process and don't apologize for delays we don't control.",
        onWrong: "The prescriber. They have the clinical justification — what diagnosis, why this drug, why this dose, why not the cheaper alternative. We notify the prescriber's office, fax the PA form, communicate with the patient. We're not the bottleneck even if we look like it. Patient education matters here."
    )
}

// MARK: - Day 10 Questions

extension RimrockQuestion {

    static let day10_oxycodoneClass = RimrockQuestion(
        id: "D10_OXYCODONE_CLASS",
        domain: .medications,
        topic: "OPIOID_PHARMACOLOGY",
        prompt: "Tramadol is best classified as which of the following?",
        options: [
            "Partial mu opioid agonist with SNRI activity",
            "Pure opioid antagonist",
            "Pure mu opioid agonist (similar to morphine)",
            "Non-opioid analgesic"
        ],
        correctAnswer: "Partial mu opioid agonist with SNRI activity",
        onCorrect: "Partial mu agonist plus serotonin and norepinephrine reuptake inhibition. Dual mechanism — that's why it's distinct from morphine, oxycodone, hydromorphone (pure mu agonists). The SNRI side means serotonin syndrome risk when combined with SSRIs, SNRIs, MAOIs, or other serotonergic drugs. C-IV. Lower abuse potential than C-II opioids but real misuse risk; the schedule was tightened in 2014.",
        onWrong: "Partial mu agonist + SNRI activity. Two mechanisms in one molecule. The SNRI piece is what makes it interactive — serotonin syndrome risk with SSRIs, SNRIs, MAOIs, triptans. C-IV scheduled in 2014. Pure mu agonists like morphine and oxycodone don't carry the serotonergic interaction; tramadol does."
    )

    static let day10_redFlags = RimrockQuestion(
        id: "D10_RED_FLAGS",
        domain: .patientSafety,
        topic: "CONTROLLED_RX_RED_FLAGS",
        prompt: "Which of the following is a red flag for a potentially illegitimate controlled-substance prescription?",
        options: [
            "All of these (out-of-area address, cash payment, large quantity, generic diagnosis line)",
            "Out-of-area address only",
            "Cash payment only",
            "None of these are red flags"
        ],
        correctAnswer: "All of these (out-of-area address, cash payment, large quantity, generic diagnosis line)",
        onCorrect: "All of them. The DEA's Pharmacist's Manual lists these and more — out-of-state prescribers for local patients, cash-only payments, unusually large quantities, vague diagnosis (\"chronic pain\"), patients driving past closer pharmacies, multiple short-acting opioids together, prescriptions written outside the prescriber's specialty. Each in isolation might be benign. Stacked, they require investigation.",
        onWrong: "All of those, and combinations. DEA's Pharmacist's Manual catalogs more: out-of-state prescriber for local patient, cash-only, big quantity, vague diagnosis, geographic patterns where patients drive past three pharmacies to fill at one. Each red flag alone is suggestive; stacked, they're actionable. The pharmacist's job is to notice patterns."
    )

    static let day10_correspondingResponsibility = RimrockQuestion(
        id: "D10_CORRESPONDING_RESPONSIBILITY",
        domain: .federalRequirements,
        topic: "CORRESPONDING_RESPONSIBILITY",
        prompt: "Under 21 CFR 1306.04, who shares legal responsibility for ensuring a controlled-substance prescription is for a legitimate medical purpose?",
        options: [
            "Both the prescriber and the dispensing pharmacist",
            "The prescriber alone",
            "The pharmacist alone",
            "The patient"
        ],
        correctAnswer: "Both the prescriber and the dispensing pharmacist",
        onCorrect: "Both. 21 CFR 1306.04 — \"corresponding responsibility.\" The prescription is only valid when issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice. A pharmacist who fills a prescription that should have been recognized as illegitimate shares liability with the prescriber. Federal felony exposure. The phrase \"knew or should have known\" is the legal standard.",
        onWrong: "Both, jointly. 21 CFR 1306.04 — \"corresponding responsibility.\" Pharmacist who fills knowing or who SHOULD HAVE KNOWN the prescription was illegitimate shares the prescriber's liability. Felony exposure. This is the regulation behind every PMP check, every red-flag review, every \"set this one aside.\""
    )

    static let day10_deaLookup = RimrockQuestion(
        id: "D10_DEA_LOOKUP",
        domain: .federalRequirements,
        topic: "DEA_REGISTRATION_LOOKUP",
        prompt: "Where can a pharmacy verify a prescriber's current DEA registration status?",
        options: [
            "DEA Diversion Control website (free public lookup)",
            "By calling the FDA",
            "Only the wholesaler can verify",
            "It cannot be verified externally"
        ],
        correctAnswer: "DEA Diversion Control website (free public lookup)",
        onCorrect: "DEA Diversion Control website — free, public, accessible from any browser. Shows registration status (active, expired, surrendered, revoked), registered schedules, and registration expiration date. Doesn't tell you whether the specific prescription is legitimate, but tells you whether the prescriber is current and what they're authorized to write. Standard due diligence on any unfamiliar prescriber.",
        onWrong: "DEA Diversion Control website, free public lookup. Active, expired, surrendered, revoked. Registered schedules and expiration date. Standard due diligence. It tells you the prescriber is current — it doesn't tell you the specific script is legitimate. That's a separate investigation."
    )
}

// MARK: - Day 11 Questions

extension RimrockQuestion {

    static let day11_hipaaPHI = RimrockQuestion(
        id: "D11_HIPAA_PHI",
        domain: .federalRequirements,
        topic: "HIPAA_PHI",
        prompt: "A patient's spouse calls asking about specific medications she's picking up. There is no HIPAA authorization on file. What can you share?",
        options: [
            "Confirm the prescription is ready for pickup; do not discuss specifics",
            "Share everything; spouses are presumed authorized",
            "Refuse to acknowledge the patient exists",
            "Share only if the spouse provides the patient's date of birth"
        ],
        correctAnswer: "Confirm the prescription is ready for pickup; do not discuss specifics",
        onCorrect: "Confirm pickup status only. The pickup itself is permitted disclosure under treatment, payment, operations (TPO) — minimum necessary information. Drug names, diagnoses, dosing details are PHI requiring written authorization. Politely decline to discuss specifics; offer to help him understand how to get authorization on file.",
        onWrong: "Pickup status only. TPO covers logistics — \"yes, prescription is ready, copay is X.\" Specifics — what drug, what for, what dose — are PHI requiring written authorization. Knowing the patient's DOB doesn't unlock disclosure; that's identifying the patient, not authorizing release."
    )

    static let day11_hipaaTPO = RimrockQuestion(
        id: "D11_HIPAA_TPO",
        domain: .federalRequirements,
        topic: "HIPAA_TPO",
        prompt: "Under HIPAA, \"TPO\" — what does it stand for, and what does it permit?",
        options: [
            "Treatment, Payment, Operations — permitted PHI use without authorization",
            "Tracking, Pharmacy, Order — required for billing claims",
            "Therapy, Patient, Outcome — required for clinical documentation",
            "Tier, Processor, Override — relates to insurance claims"
        ],
        correctAnswer: "Treatment, Payment, Operations — permitted PHI use without authorization",
        onCorrect: "Treatment, Payment, Operations. Treatment includes coordinating care, refilling prescriptions, contacting prescribers. Payment includes billing insurance, processing claims. Operations includes quality improvement, training, audits. Disclosure for TPO doesn't require patient authorization — it's the baseline that lets pharmacies function. Anything OUTSIDE TPO needs written authorization.",
        onWrong: "Treatment, Payment, Operations. The baseline of permitted disclosures without authorization. Treatment: coordinating care, refills, prescriber contact. Payment: insurance billing, claims. Operations: quality, training, audits. Disclosures outside TPO — marketing, research, third-party access — require written authorization."
    )

    static let day11_hipaaNPP = RimrockQuestion(
        id: "D11_HIPAA_NPP",
        domain: .federalRequirements,
        topic: "HIPAA_NPP",
        prompt: "What is the Notice of Privacy Practices (NPP) and when must it be provided?",
        options: [
            "A required disclosure given to patients describing how PHI is used",
            "An internal pharmacy document never shared with patients",
            "A signed authorization required from every patient",
            "A federal form filed with HHS quarterly"
        ],
        correctAnswer: "A required disclosure given to patients describing how PHI is used",
        onCorrect: "Notice of Privacy Practices. Pharmacies and other covered entities must provide it at first service, post it visibly, and make it available on request. Describes how the pharmacy uses PHI, the patient's rights, how to file a complaint. The patient signs an acknowledgment of receipt — not authorization, just confirmation they got it.",
        onWrong: "NPP — Notice of Privacy Practices. Required disclosure at first service, posted visibly, available on request. Describes PHI usage, patient rights, complaint process. Acknowledgment of receipt is required; that acknowledgment is not the same as authorization to share."
    )

    static let day11_hipaaBreach = RimrockQuestion(
        id: "D11_HIPAA_BREACH",
        domain: .federalRequirements,
        topic: "HIPAA_BREACH",
        prompt: "A pharmacy accidentally hands a bag of prescriptions to the wrong patient (different family). What is required under HIPAA breach rules?",
        options: [
            "Notify the affected patient(s); document the incident; consider HHS notification depending on scope",
            "Nothing; the medications were returned promptly",
            "Notify the FDA only",
            "Issue a press release"
        ],
        correctAnswer: "Notify the affected patient(s); document the incident; consider HHS notification depending on scope",
        onCorrect: "Notify affected patients, document, evaluate scope. Single-patient breaches go through the standard process — patient letter, internal documentation, mitigation. Breaches affecting 500+ patients trigger HHS notification within 60 days. Smaller breaches roll up into annual HHS reporting. Pharmacy keeps records for six years. Mitigation matters — was the wrong bag retrieved, did anyone read the contents, what's the actual exposure.",
        onWrong: "Patient notification, documentation, possible HHS reporting. Single-patient incident: letter to affected patient, internal incident log. 500+ patients: report to HHS within 60 days. Smaller incidents: roll into annual reporting. Records retained six years. Documentation of mitigation — bag retrieved, exposure assessed — is part of the file."
    )
}

// MARK: - Day 12 Questions

extension RimrockQuestion {

    static let day12_recordRetention = RimrockQuestion(
        id: "D12_RECORD_RETENTION",
        domain: .federalRequirements,
        topic: "DEA_RECORDS",
        prompt: "How long must federal law require pharmacies retain controlled-substance records (Form 222s, invoices, inventories)?",
        options: ["At least 2 years, on-site, accessible to DEA on request", "1 year", "5 years", "Indefinitely"],
        correctAnswer: "At least 2 years, on-site, accessible to DEA on request",
        onCorrect: "Two years federally — on-site, accessible to DEA on request. Many states require longer; some require five. Most pharmacies keep records longer than required because the cost of paper is small and the cost of not having a record when DEA comes asking is large. C-IIs typically kept separately, marked, in their own binder.",
        onWrong: "Two years federally; many states require five. On-site, DEA-accessible. C-IIs usually filed separately. Pharmacies often keep records longer voluntarily because storage is cheap and the consequences of missing a record during an audit aren't."
    )

    static let day12_deaRegistrationTypes = RimrockQuestion(
        id: "D12_DEA_REG_TYPES",
        domain: .federalRequirements,
        topic: "DEA_REGISTRATION",
        prompt: "How often must a pharmacy renew its DEA registration?",
        options: ["Every 3 years", "Annually", "Every 5 years", "One-time, no renewal"],
        correctAnswer: "Every 3 years",
        onCorrect: "Every three years. Each registered location is its own registration — a chain with multiple sites has multiple DEA numbers. Practitioners renew on a different cycle (also 3 years). Don't let it lapse — operating with an expired registration is a federal violation, and the wholesaler will refuse to ship controls without a current registration on file.",
        onWrong: "Every three years per location. Multi-site chains have multiple registrations, one per site. Practitioner registrations also renew every three years. Lapsed registration is a violation; wholesalers won't ship controls without a current one on file."
    )

    static let day12_drugRecallClass = RimrockQuestion(
        id: "D12_RECALL_CLASS",
        domain: .federalRequirements,
        topic: "FDA_RECALL_CLASSES",
        prompt: "An FDA Class II recall indicates which level of risk?",
        options: [
            "Temporary or medically reversible adverse health consequences",
            "Reasonable probability of serious adverse health consequences or death",
            "Unlikely to cause adverse health consequences",
            "Voluntary withdrawal with no FDA classification"
        ],
        correctAnswer: "Temporary or medically reversible adverse health consequences",
        onCorrect: "Class II — temporary or medically reversible. Class I is the most serious — reasonable probability of serious harm or death. Class III is unlikely to cause adverse effects but doesn't meet labeling or quality requirements. Most pharmacy-relevant recalls are Class II — affects health but reversible.",
        onWrong: "Class II — temporary or reversible adverse effects. Class I: serious harm or death possible. Class III: unlikely to cause harm, usually labeling or minor quality issues. The recall notice tells you the lot, the action required, and how to handle returns."
    )

    static let day12_recallProcedure = RimrockQuestion(
        id: "D12_RECALL_PROCEDURE",
        domain: .patientSafety,
        topic: "RECALL_RESPONSE",
        prompt: "When a recall affects medication you've already dispensed to patients, what should the pharmacy do?",
        options: [
            "Run a dispensing report by lot number; contact affected patients",
            "Wait for patients to inquire about the recall",
            "Only contact patients who have a refill due",
            "Notify the prescriber and let them handle it"
        ],
        correctAnswer: "Run a dispensing report by lot number; contact affected patients",
        onCorrect: "Dispensing report by lot number, contact affected patients. We're the last point of patient contact — we have the records of who got which lot. The notice usually specifies a window (six months back, twelve months back). Pharmacy notifies patients, arranges replacement or return depending on the recall instructions. Many pharmacies do this through automated systems for large recalls; small ones get handled by hand.",
        onWrong: "Dispensing report by lot, contact affected patients. Pharmacy has the dispensing records, prescriber doesn't. Time window per the recall notice. Replacement or return per recall instructions. Patient education at point of contact — what to do with the affected stock at home."
    )
}

// MARK: - Day 13 Questions

extension RimrockQuestion {

    static let day13_forgeryRedFlags = RimrockQuestion(
        id: "D13_FORGERY_RED_FLAGS",
        domain: .patientSafety,
        topic: "RX_FORGERY_INDICATORS",
        prompt: "Which of the following can be a red flag for prescription forgery?",
        options: [
            "All of these (different ink between body and signature, altered quantities, photocopied appearance)",
            "Different ink only",
            "Photocopied appearance only",
            "Altered quantities only"
        ],
        correctAnswer: "All of these (different ink between body and signature, altered quantities, photocopied appearance)",
        onCorrect: "All of them. Other forgery indicators: prescription pad numbers that don't match the prescriber's office, signatures inconsistent with prescriber's known handwriting, drug name written in different style than the rest, dates altered or unclear, atypical drug combinations or quantities, refills altered or added. Pattern recognition matters — one indicator is suggestive, multiple together is actionable.",
        onWrong: "All of those, plus pad numbers that don't match the office, inconsistent signatures, altered dates, drug names written in different style, atypical combinations or quantities. Pattern matters — one flag is suggestive, multiple together is reason to investigate before filling."
    )

    static let day13_signatureVerification = RimrockQuestion(
        id: "D13_SIGNATURE_VERIFY",
        domain: .patientSafety,
        topic: "RX_SIGNATURE",
        prompt: "On a paper Schedule II prescription, the signature must be...?",
        options: [
            "Wet ink (handwritten signature in ink)",
            "Stamped signature acceptable",
            "Photocopied signature acceptable if clear",
            "Initials acceptable in lieu of full signature"
        ],
        correctAnswer: "Wet ink (handwritten signature in ink)",
        onCorrect: "Wet ink. C-II paper prescriptions require a handwritten signature in ink — actual pen on actual paper. Stamps, photocopies, and initials are not acceptable. Only EPCS — Electronic Prescriptions for Controlled Substances — permits a digital signature, and that requires DEA-compliant identity proofing and two-factor authentication on the prescriber's side.",
        onWrong: "Wet ink. Pen, ink, paper. No stamps, no photocopies, no initials. EPCS allows digital signature but only with DEA-compliant identity proofing and 2FA. Faxing a C-II Rx is not permitted as the original; the original wet-ink paper must follow."
    )

    static let day13_epcsRequirements = RimrockQuestion(
        id: "D13_EPCS",
        domain: .federalRequirements,
        topic: "EPCS",
        prompt: "Electronic Prescriptions for Controlled Substances (EPCS) require which of the following on the prescriber side?",
        options: [
            "Identity proofing and two-factor authentication",
            "A signed paper backup",
            "FDA registration only",
            "No special requirements"
        ],
        correctAnswer: "Identity proofing and two-factor authentication",
        onCorrect: "Identity proofing plus two-factor authentication. The prescriber's identity is verified through a DEA-approved process; their credentials are protected by 2FA. Each EPCS prescription is digitally signed and tamper-evident. Audit trail follows the prescription from prescriber to pharmacy. Medicare mandated EPCS for most controlled prescriptions in 2021.",
        onWrong: "Identity proofing + 2FA on the prescriber side. DEA-approved identity proofing process, two-factor for transmission. Tamper-evident audit trail. Medicare mandate for most controlled prescriptions, 2021. Pharmacy receives via certified secure pathway; prescription is uneditable at our end."
    )

    static let day13_dscsa = RimrockQuestion(
        id: "D13_DSCSA",
        domain: .federalRequirements,
        topic: "DSCSA",
        prompt: "Under the Drug Supply Chain Security Act (DSCSA), how long must a pharmacy retain transaction history records?",
        options: ["6 years", "2 years", "10 years", "Indefinitely"],
        correctAnswer: "6 years",
        onCorrect: "Six years. DSCSA — track-and-trace from manufacturer to dispensing pharmacy. Each transaction documented: who shipped, who received, when, what lot, what quantity. Pharmacy retains six years; counterfeit detection, recall response, supply chain integrity all rely on that recordkeeping. Full track-and-trace requirements went into effect 2023.",
        onWrong: "Six years. DSCSA tracks every transaction in the prescription drug supply chain — manufacturer to wholesaler to pharmacy. Pharmacy keeps six years of records. Catches counterfeits, supports recalls, blocks diversion. Full requirements effective 2023."
    )
}

// MARK: - Day 14 Questions

extension RimrockQuestion {

    static let day14_inspectorHIPAA = RimrockQuestion(
        id: "D14_INSPECTOR_HIPAA",
        domain: .federalRequirements,
        topic: "HIPAA_FRIEND_DISCLOSURE",
        prompt: "Inspector's question: A friend (not authorized) calls asking what medications a patient is on. Correct response?",
        options: [
            "Decline to confirm or share PHI; offer to take a message for the patient",
            "Confirm whether the patient is on a specific medication if asked",
            "Share medications if the friend says it's an emergency",
            "Share only over-the-counter medications"
        ],
        correctAnswer: "Decline to confirm or share PHI; offer to take a message for the patient",
        onCorrect: "Decline. Without authorization, friends are not permitted recipients of PHI — even if the friend says emergency, even if the friend is well-known to the pharmacy. Offer to take a message for the patient or to have the patient call back. Emergencies handled by emergency services, not by us bypassing HIPAA. The right answer to inspectors is the careful one.",
        onWrong: "Decline to confirm or disclose. Friends without authorization don't get PHI, no matter the urgency they claim. Offer to take a message. Real emergencies go through 911 and clinical providers, not through us bypassing HIPAA. Inspectors want to hear the careful answer because the careful answer is the one that holds up."
    )

    static let day14_inspectorRecords = RimrockQuestion(
        id: "D14_INSPECTOR_RECORDS",
        domain: .federalRequirements,
        topic: "DEA_RECORD_LOCATION",
        prompt: "Inspector's question: DEA Form 222 records — retention and storage?",
        options: [
            "At least 2 years on-site, accessible to DEA on request, separated from other records",
            "1 year off-site, retrievable within 48 hours",
            "Stored only at the wholesaler",
            "5 years anywhere on the premises"
        ],
        correctAnswer: "At least 2 years on-site, accessible to DEA on request, separated from other records",
        onCorrect: "Two years on-site, DEA-accessible, separated. C-II records (Form 222s, perpetual inventory, biennial inventory) usually maintained in their own binder. Many states require longer than two years; many pharmacies keep records longer voluntarily. The phrasing inspectors listen for: 'on-site, accessible to DEA on request.'",
        onWrong: "Two years on-site, DEA-accessible, separated from non-controlled records. C-II in its own binder. Many states extend to five years; many pharmacies keep more. \"On-site, accessible to DEA on request\" is the inspector's preferred phrasing."
    )

    static let day14_inspectorOBRA = RimrockQuestion(
        id: "D14_INSPECTOR_OBRA",
        domain: .federalRequirements,
        topic: "OBRA_90_COUNSELING",
        prompt: "Inspector's question: OBRA-90 patient counseling — federal requirement?",
        options: [
            "Counseling must be offered on every new prescription; states often require an actual attempt",
            "Counseling is required only on controlled substances",
            "Counseling is required only on patient request",
            "Counseling is required only for first-time patients"
        ],
        correctAnswer: "Counseling must be offered on every new prescription; states often require an actual attempt",
        onCorrect: "Offered on every new prescription. Federal floor under OBRA-90 (Omnibus Budget Reconciliation Act, 1990) — pharmacy must offer counseling to every Medicaid patient on every new prescription, and most states extended this to all patients. Some states require an actual attempt, not just an offer. Decline must be documented. The phrasing matters — 'offered, not required to be accepted.'",
        onWrong: "Offered on every new Rx — federal floor. Most states extended to all patients. Some states require actual counseling, not just an offer. Decline must be documented. Inspectors hear the difference between 'must offer' and 'must counsel' and like that you know the difference."
    )

    static let day14_inspectorUSP795 = RimrockQuestion(
        id: "D14_INSPECTOR_USP795",
        domain: .orderEntry,
        topic: "USP_795_BUD",
        prompt: "Inspector's question: Non-sterile compounding — water-containing oral preparation, beyond-use date per USP <795>?",
        options: [
            "No more than 14 days when refrigerated (current USP <795>)",
            "30 days at room temperature",
            "90 days when refrigerated",
            "Same as the manufacturer's expiration date"
        ],
        correctAnswer: "No more than 14 days when refrigerated (current USP <795>)",
        onCorrect: "Fourteen days refrigerated, water-containing oral. USP <795> revised default beyond-use dating in 2023. Non-aqueous: 90 days. Water-containing topical/dermal: 30 days. Water-containing oral: 14 days refrigerated. Always defer to a stability study if one exists for the formulation. Compounding records kept three years.",
        onWrong: "Fourteen days refrigerated for water-containing oral, current USP <795>. Non-aqueous: 90 days. Water-containing topical: 30 days. Defer to a published stability study when one exists. Compounding records kept three years. The 2023 revision tightened a lot of older defaults."
    )
}

// MARK: - Day 15 Questions

extension RimrockQuestion {

    static let day15_anticholinergicBurden = RimrockQuestion(
        id: "D15_ANTICHOLINERGIC",
        domain: .medications,
        topic: "ANTICHOLINERGIC_BURDEN",
        prompt: "Which combination represents an anticholinergic burden risk in an elderly patient?",
        options: [
            "Diphenhydramine + hydroxyzine + oxybutynin",
            "Lisinopril + atorvastatin + metformin",
            "Acetaminophen + ibuprofen + aspirin",
            "Levothyroxine + omeprazole + multivitamin"
        ],
        correctAnswer: "Diphenhydramine + hydroxyzine + oxybutynin",
        onCorrect: "All three are strong anticholinergics. Diphenhydramine — first-generation antihistamine. Hydroxyzine — also first-gen antihistamine, often misclassified as 'just' anxiety/itch. Oxybutynin — antimuscarinic for OAB. Stacked: confusion, dry mouth, constipation, urinary retention, blurred vision, falls. Beers Criteria flags all three for adults 65+. Cumulative anticholinergic burden is correlated with cognitive decline and fall risk independent of dose.",
        onWrong: "Diphenhydramine + hydroxyzine + oxybutynin. Three drugs, all strong anticholinergics, stacked. Beers Criteria flags every one for adults 65+. Cumulative burden — confusion, dry mouth, constipation, urinary retention, blurred vision, FALLS. Even subclinical from each alone, additive effects are real."
    )

    static let day15_orthostaticCombo = RimrockQuestion(
        id: "D15_ORTHOSTATIC",
        domain: .medications,
        topic: "ORTHOSTATIC_HYPOTENSION",
        prompt: "Which combination most increases the risk of orthostatic hypotension in an elderly patient?",
        options: [
            "Beta-blocker + calcium channel blocker + anticholinergic",
            "PPI + statin + aspirin",
            "Levothyroxine + multivitamin",
            "Acetaminophen + omeprazole"
        ],
        correctAnswer: "Beta-blocker + calcium channel blocker + anticholinergic",
        onCorrect: "Beta-blocker plus CCB plus anticholinergic. Beta-blocker blunts the heart-rate compensation when blood pressure drops. CCB causes vasodilation directly. Anticholinergic blunts the autonomic reflex and can also cause confusion that masks symptoms. Stand up, blood pressure crashes, you don't compensate fast enough, you fall. The anticholinergic confusion piece means the patient may not realize they're light-headed before they go down.",
        onWrong: "Beta-blocker + CCB + anticholinergic. The first two drop blood pressure and blunt heart rate response; the third blocks autonomic reflex AND clouds awareness. You can't feel the warning, can't compensate, can't catch yourself. Falls in the elderly are usually multifactorial — drug stacking is a top contributor."
    )

    static let day15_beersCriteria = RimrockQuestion(
        id: "D15_BEERS",
        domain: .patientSafety,
        topic: "BEERS_CRITERIA",
        prompt: "The Beers Criteria identify medications that are...?",
        options: [
            "Potentially inappropriate for adults 65 and older",
            "Always contraindicated in pregnancy",
            "Not covered by Medicare",
            "Available only by prescription"
        ],
        correctAnswer: "Potentially inappropriate for adults 65 and older",
        onCorrect: "Potentially inappropriate in adults 65+. Updated regularly by the American Geriatrics Society. Categories: avoid in older adults regardless, avoid in specific conditions, use with caution, drug-drug combinations to avoid. The list isn't a ban — it's a flag. 'Beers' just means 'pause and reconsider.' First-generation antihistamines (diphenhydramine, hydroxyzine), benzodiazepines, anticholinergics, NSAIDs in CKD, and many more.",
        onWrong: "Potentially inappropriate for older adults. AGS updates regularly. Not a ban — a 'pause and reconsider' list. First-gen antihistamines, benzodiazepines, anticholinergics, NSAIDs in CKD, sliding-scale insulin, long-acting sulfonylureas, several muscle relaxants. The dispensing pharmacy is a meaningful checkpoint for catching it."
    )

    static let day15_deprescribing = RimrockQuestion(
        id: "D15_DEPRESCRIBING",
        domain: .medications,
        topic: "DEPRESCRIBING",
        prompt: "What is \"deprescribing\"?",
        options: [
            "The systematic process of identifying and discontinuing medications that may no longer be beneficial",
            "Never restarting a medication after discontinuation",
            "Refusing to fill any prescription deemed unnecessary",
            "Substituting cheaper generics without prescriber approval"
        ],
        correctAnswer: "The systematic process of identifying and discontinuing medications that may no longer be beneficial",
        onCorrect: "Systematic discontinuation when the harm/benefit ratio has shifted. Common targets: PPIs after the indication resolves, statins in advanced age with limited life expectancy, anticholinergics in patients showing cognitive decline, opioids when chronic pain has improved. Done collaboratively — pharmacist flags candidates, prescriber decides, patient is part of the conversation. Tapering matters; abrupt stops cause rebound.",
        onWrong: "Systematic discontinuation when benefit no longer outweighs risk. Common targets: PPIs past their indication, anticholinergics in cognitive decline, statins in limited life expectancy, opioids when pain improves. Collaborative — pharmacist flags, prescriber decides, patient consents. Taper to avoid rebound or withdrawal."
    )
}

// MARK: - Day 16 Questions

extension RimrockQuestion {

    static let day16_theftResponseSequence = RimrockQuestion(
        id: "D16_THEFT_RESPONSE",
        domain: .federalRequirements,
        topic: "CII_THEFT_RESPONSE",
        prompt: "You discover a discrepancy in the C-II perpetual count. What's the correct immediate sequence?",
        options: [
            "Secure the safe; document the discrepancy with times and initials; notify the pharmacist-in-charge",
            "Recount until the numbers match",
            "Wait until end of shift to investigate",
            "Notify the patient who filled the most recent C-II prescription"
        ],
        correctAnswer: "Secure the safe; document the discrepancy with times and initials; notify the pharmacist-in-charge",
        onCorrect: "Secure, document, notify. Don't keep recounting — the discrepancy is real once you've confirmed it. The perpetual log entry stands as it was. Pharmacist-in-charge has the legal obligation to investigate and report. State board notification typically same day; DEA Form 106 within one business day. Photographs and dated documentation matter — investigators will reconstruct the chain of custody.",
        onWrong: "Secure, document, notify pharmacist-in-charge. Don't keep recounting; the perpetual stands. PIC investigates and reports — state board same day, DEA Form 106 within one business day. Documentation with times, initials, photographs. The chain of custody is critical for the investigation."
    )

    static let day16_form106 = RimrockQuestion(
        id: "D16_FORM_106",
        domain: .federalRequirements,
        topic: "DEA_FORM_106",
        prompt: "DEA Form 106 is used to report which event?",
        options: [
            "Theft or significant loss of controlled substances",
            "Routine inventory of controlled substances",
            "Ordering Schedule II drugs from a wholesaler",
            "Destruction of expired controlled substances"
        ],
        correctAnswer: "Theft or significant loss of controlled substances",
        onCorrect: "Form 106 reports theft or significant loss. Filed with the DEA within one business day of discovery. Required even if the loss is later reconciled — the report is about the event, not the final accounting. Form 41 is for destruction (with witness signature, often a reverse distributor). Form 222 is for ordering C-IIs. Each form has its purpose.",
        onWrong: "Form 106 — theft or significant loss. Within one business day of discovery. Even if later reconciled, the report stands. Form 41 — destruction. Form 222 — ordering C-IIs. Form 224 — pharmacy registration application. Each has its job."
    )

    static let day16_pharmacistInCharge = RimrockQuestion(
        id: "D16_PIC",
        domain: .federalRequirements,
        topic: "PIC_RESPONSIBILITIES",
        prompt: "Which is a responsibility of the Pharmacist-in-Charge (PIC)?",
        options: [
            "All of these (compliance with state and federal law, reporting to the board, supervising staff)",
            "Compliance with state and federal law only",
            "Reporting to the board only",
            "Filling prescriptions only"
        ],
        correctAnswer: "All of these (compliance with state and federal law, reporting to the board, supervising staff)",
        onCorrect: "All of them. PIC is the legally responsible pharmacist for the location — compliance with state and federal law, reporting controlled-substance losses, supervising staff (techs and other pharmacists), maintaining policy and procedure manuals, ensuring regulatory inspections are handled. PIC's name is on the registration; PIC's license is on the line if compliance fails. State law defines specifics — Wyoming requires the PIC to be on-site a minimum number of hours per week; varies by state.",
        onWrong: "All of those. The PIC is the licensed pharmacist legally responsible for the location's controlled-substance compliance, staff supervision, policy and procedure, regulatory response. Their name is on the DEA registration; their license carries the consequences. State law specifies on-site time requirements."
    )

    static let day16_mme = RimrockQuestion(
        id: "D16_MME",
        domain: .medications,
        topic: "OPIOID_MME",
        prompt: "What is morphine milligram equivalent (MME) used for?",
        options: [
            "Standardizing opioid dose comparisons across different drugs",
            "Calculating insurance copayments",
            "Determining DEA schedule",
            "Setting pharmacy markup"
        ],
        correctAnswer: "Standardizing opioid dose comparisons across different drugs",
        onCorrect: "Dose standardization across opioids. Lets you compare 10 mg of oxycodone to 30 mg of morphine to 75 mcg/h of fentanyl. CDC guidelines suggest caution above 50 MME/day, very careful conversation above 90. State PDMPs flag patients above thresholds. The conversion factors are imperfect but useful — some drugs (methadone, fentanyl, buprenorphine) have non-linear or specialty conversions and should be done by clinical decision tools, not back-of-envelope.",
        onWrong: "MME — morphine milligram equivalents. Standardizes opioid dose across drugs. CDC: caution >50 MME/day, very careful conversation >90. State PDMPs flag thresholds. Conversion factors for oxycodone, hydrocodone, fentanyl, etc. Methadone and fentanyl conversions are non-linear — use validated clinical tools."
    )
}

// MARK: - Day 17 Questions

extension RimrockQuestion {

    static let day17_techScope = RimrockQuestion(
        id: "D17_TECH_SCOPE",
        domain: .federalRequirements,
        topic: "TECH_SCOPE_OF_PRACTICE",
        prompt: "Which task is typically pharmacist-only and not delegated to a pharmacy technician?",
        options: [
            "Final verification and DUR override decisions",
            "Counting tablets",
            "Generating prescription labels",
            "Submitting insurance claims"
        ],
        correctAnswer: "Final verification and DUR override decisions",
        onCorrect: "Final verification, DUR overrides, clinical judgment, patient counseling — pharmacist-only by federal regulation, with state law adding more in some places. Tech-allowed: data entry, label generation, counting, packaging, billing, inventory. The line moves between states; Wyoming gives techs more than some, less than others. PTCE asks because the line gets crossed in retail.",
        onWrong: "Final verification, DUR override decisions, clinical judgment, counseling — pharmacist-only by federal regulation. State law adds more in some places. Counting, billing, label printing, data entry, inventory — tech-allowed. Always check state-specific scope; the line moves."
    )

    static let day17_techCheckTech = RimrockQuestion(
        id: "D17_TECH_CHECK_TECH",
        domain: .patientSafety,
        topic: "TECH_CHECK_TECH",
        prompt: "Tech-check-tech (TCT) is most commonly permitted in which situation?",
        options: [
            "Refills of the same drug at the same dose for the same patient, in specific settings",
            "All retail prescriptions",
            "All controlled substance prescriptions",
            "Never permitted in any state"
        ],
        correctAnswer: "Refills of the same drug at the same dose for the same patient, in specific settings",
        onCorrect: "Refills, same drug, same dose, same patient — and even then, only in specific settings (institutional, LTC, sometimes hospital floor stock). Generally not for new prescriptions. Generally not for controlled substances. Generally not in retail. State law varies widely — some states don't permit TCT at all; some permit it for unit-dose repackaging. Always check state-specific rules.",
        onWrong: "Limited TCT — refills, same drug, same dose, same patient, in specific settings (institutional, LTC, floor stock). Not new Rx, not controls, generally not retail. State law varies widely. Always check the specific permitted activities; tech-check-tech is one of the most state-variable rules in pharmacy."
    )

    static let day17_dur = RimrockQuestion(
        id: "D17_DUR",
        domain: .patientSafety,
        topic: "DUR_RESPONSIBILITY",
        prompt: "When a Drug Utilization Review (DUR) alert fires, who is responsible for reviewing and deciding whether to dispense?",
        options: [
            "The pharmacist",
            "The pharmacy technician",
            "The prescriber",
            "The insurance company"
        ],
        correctAnswer: "The pharmacist",
        onCorrect: "The pharmacist. DUR alerts are clinical — drug-drug interactions, allergies, duplicate therapy, dose-out-of-range, duration warnings. Tech can flag the alert but only the pharmacist can override. Override decisions must be documented with rationale. The PTCE loves this question because techs do override DUR alerts in real life — and they shouldn't.",
        onWrong: "The pharmacist. DUR is clinical decision-making — drug-drug interactions, allergies, duplicate therapy, dose range, duration. Tech flags, pharmacist decides. Override must be documented. Letting techs override DUR alerts is a common — and indefensible — corner-cutting in busy retail pharmacies."
    )

    static let day17_credentialing = RimrockQuestion(
        id: "D17_CREDENTIALING",
        domain: .federalRequirements,
        topic: "PTCB_NHA",
        prompt: "PTCB and NHA both administer which type of pharmacy technician credential?",
        options: [
            "National certification exams (CPhT and similar)",
            "State licensing exams",
            "DEA registration",
            "Pharmacy technician training programs"
        ],
        correctAnswer: "National certification exams (CPhT and similar)",
        onCorrect: "National certification. PTCB (Pharmacy Technician Certification Board) — older, larger, awards CPhT credential. NHA (National Healthcareer Association) — newer, awards ExCPT. Both are national exams; both require continuing education for renewal; states recognize one or both depending on state law. State registration is separate — handled by the state board of pharmacy. Credentialing and licensing are different processes.",
        onWrong: "National certification: PTCB (CPhT) and NHA (ExCPT). Both national exams, both require CE for renewal. State recognition varies. State registration is separate — through the state board of pharmacy. Credentialing (national) and licensing (state) are different, and PTCE asks which is which."
    )
}

// MARK: - Day 18 Questions

extension RimrockQuestion {

    static let day18_errorReporting = RimrockQuestion(
        id: "D18_ERROR_REPORTING",
        domain: .patientSafety,
        topic: "ERROR_REPORTING",
        prompt: "Which is true about medication error reporting in pharmacy?",
        options: [
            "Reporting near-misses is as important as reporting actual errors that reached the patient",
            "Only errors that harm patients should be reported",
            "Internal reporting is sufficient; no external reporting is needed",
            "Errors caught before reaching the patient don't need to be documented"
        ],
        correctAnswer: "Reporting near-misses is as important as reporting actual errors that reached the patient",
        onCorrect: "Near-misses matter as much as harm events. Most catastrophic errors had near-miss precursors that weren't reported. ISMP and Joint Commission both emphasize: count and analyze near-misses to fix systems before harm happens. Internal reporting (incident logs) feeds external voluntary reporting (ISMP MERP) and mandatory reporting (state board, FDA MedWatch for drug-related events). The reporting culture is what catches systemic issues.",
        onWrong: "Near-misses matter. Catastrophic errors usually have near-miss precursors that nobody reported. Internal reporting (incident logs) → external (ISMP MERP voluntary, MedWatch for FDA, state board for licensure events). Reporting culture is what makes systems safer. Punishing error reports kills safety culture; that's why Just Culture exists."
    )

    static let day18_justCulture = RimrockQuestion(
        id: "D18_JUST_CULTURE",
        domain: .patientSafety,
        topic: "JUST_CULTURE",
        prompt: "In Just Culture, how should an organization respond to a human error (slip, lapse) by an employee?",
        options: [
            "Console the employee; investigate the system that allowed the error",
            "Discipline the employee to deter future errors",
            "Take no action; errors are inevitable",
            "Suspend pharmacy operations until error rate is zero"
        ],
        correctAnswer: "Console the employee; investigate the system that allowed the error",
        onCorrect: "Console the human, investigate the system. Just Culture distinguishes: human error (slip/lapse — console), at-risk behavior (rule cut from convenience — coach), reckless behavior (knowing disregard — discipline). Punishing human error kills reporting and makes systems less safe. Punishing reckless behavior is appropriate. The middle category — at-risk — is where most errors actually live, and coaching reshapes the system more than discipline does.",
        onWrong: "Console the employee, investigate the system. Just Culture's three categories: human error (console), at-risk behavior (coach), reckless behavior (discipline). Most errors are categories one and two. Discipline category three — knowing disregard of rules — but spare categories one and two, because punishing them kills error reporting and makes the next error worse."
    )

    static let day18_rootCause = RimrockQuestion(
        id: "D18_ROOT_CAUSE",
        domain: .patientSafety,
        topic: "ROOT_CAUSE_ANALYSIS",
        prompt: "Root cause analysis (RCA) seeks to identify...?",
        options: [
            "Underlying system factors that allowed the error to occur",
            "Which employee to blame for the error",
            "Whether the patient was harmed",
            "Whether to file an insurance claim"
        ],
        correctAnswer: "Underlying system factors that allowed the error to occur",
        onCorrect: "System factors. Why did the look-alike sound-alike pair sit next to each other on the shelf? Why did the prescriber's handwriting confuse the entry tech? Why didn't the DUR alert fire? Why did the verifying pharmacist miss it? RCA traces backward through process failures, environmental factors, and policy gaps — not toward an individual to blame. Joint Commission requires RCA for sentinel events.",
        onWrong: "System factors, not individuals. Why was the LASA pair shelved together? Why did handwriting confuse the entry tech? Why didn't the DUR fire? Why did verification miss it? RCA traces process, environment, policy — finds the system holes that aligned for harm. Joint Commission requires RCA for sentinel events."
    )

    static let day18_jointCommission = RimrockQuestion(
        id: "D18_JOINT_COMMISSION",
        domain: .patientSafety,
        topic: "JOINT_COMMISSION_NPSG",
        prompt: "Which of the following is a Joint Commission National Patient Safety Goal (NPSG) directly relevant to medication safety?",
        options: [
            "Use at least two patient identifiers when administering medications",
            "Limit pharmacy inventory to 100 unique drugs",
            "Restrict prescribing to physicians only",
            "Eliminate all generic substitutions"
        ],
        correctAnswer: "Use at least two patient identifiers when administering medications",
        onCorrect: "Two patient identifiers — name and date of birth, typically. Joint Commission NPSGs are updated annually; medication-specific ones include: label all medications and containers, reduce harm from anticoagulant therapy, reconcile medications across the continuum of care, use look-alike sound-alike protections. The NPSGs are the floor — accreditation depends on demonstrated compliance.",
        onWrong: "Two patient identifiers. Joint Commission NPSGs include: label all medications, reduce anticoagulant harm, reconcile across care transitions, address LASA, identify patient safety risks. Accreditation depends on compliance. Updated annually — current versions on the Joint Commission website."
    )
}

// MARK: - Day 19 Questions

extension RimrockQuestion {

    static let day19_correspondingResponsibility = RimrockQuestion(
        id: "D19_CORRESP_RESPONSIBILITY",
        domain: .federalRequirements,
        topic: "CORRESPONDING_RESPONSIBILITY",
        prompt: "Under 21 CFR 1306.04, the dispensing pharmacist's \"corresponding responsibility\" requires verifying which of the following before dispensing a controlled substance?",
        options: [
            "That the prescription was issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice",
            "Only that the prescription is properly signed",
            "Only that the patient has insurance coverage",
            "Only that the prescriber has a valid DEA number"
        ],
        correctAnswer: "That the prescription was issued for a legitimate medical purpose by a practitioner acting in the usual course of professional practice",
        onCorrect: "Legitimate medical purpose, usual course of practice. The phrase \"knew or should have known\" is the legal standard. A clean DEA number alone isn't enough; the prescription as a whole has to be defensible. Pharmacist who dispenses a script that should have been recognized as illegitimate shares felony liability with the prescriber.",
        onWrong: "Legitimate medical purpose by a practitioner in usual course of practice. Just a valid DEA isn't enough — pharmacist must evaluate the whole script. \"Knew or should have known\" — felony exposure. Corresponding responsibility is the regulation behind every PMP check, every red-flag review, every refusal."
    )

    static let day19_redFlagsRefusal = RimrockQuestion(
        id: "D19_RED_FLAGS_REFUSAL",
        domain: .patientSafety,
        topic: "RED_FLAGS_DOCUMENTATION",
        prompt: "When refusing to dispense a controlled-substance prescription due to red flags, what should be documented?",
        options: [
            "All red flags identified, time of refusal, prescriber contact attempts, pharmacist's reasoning, initials",
            "Only the patient name and the refusal",
            "Only the date of refusal",
            "Nothing — refusals don't require documentation"
        ],
        correctAnswer: "All red flags identified, time of refusal, prescriber contact attempts, pharmacist's reasoning, initials",
        onCorrect: "All of it. Red flags identified, prescriber contact attempts (with date/time/result), pharmacist's reasoning, your initials. Documentation protects the pharmacist legally if challenged and feeds investigations. Keep originals on-site, copies off-site if your policy allows. The refusal documentation is the difference between a regulatory body believing you and a regulatory body asking why you didn't fill.",
        onWrong: "Comprehensive documentation — every red flag, contact attempts, reasoning, initials, time. Documentation protects you legally and feeds the investigation. Refusal without paperwork is hard to defend; refusal with paperwork is bulletproof."
    )

    static let day19_refusalDocumentation = RimrockQuestion(
        id: "D19_REFUSAL_DOC",
        domain: .orderEntry,
        topic: "REFUSAL_RECORDS",
        prompt: "A controlled-substance prescription is refused. What happens to the original prescription document?",
        options: [
            "Retain the original on file with refusal documentation; do not return it to the patient",
            "Return it to the patient",
            "Forward it to the prescriber",
            "Destroy it immediately"
        ],
        correctAnswer: "Retain the original on file with refusal documentation; do not return it to the patient",
        onCorrect: "Retain on file with documentation. Returning a fraudulent or suspicious script to the patient lets them try elsewhere; it's also evidence in any investigation. Original stays. Refusal note (date, time, reasoning, initials) attached. If the prescriber requests it later for their records, copy goes to them; original remains with pharmacy.",
        onWrong: "Retain on file. Don't return it — the patient will try another pharmacy. Don't destroy it — it's evidence. Original stays with refusal documentation; copy can go to prescriber on request."
    )

    static let day19_suspiciousOrderMonitoring = RimrockQuestion(
        id: "D19_SOM",
        domain: .federalRequirements,
        topic: "SUSPICIOUS_ORDER_MONITORING",
        prompt: "Under DEA's Suspicious Order Monitoring (SOM) requirements, when must a pharmacy report a suspicious order?",
        options: [
            "When the order or pattern of orders deviates from established norms in size, frequency, or pattern",
            "Only when a controlled substance is stolen",
            "Only at the biennial inventory",
            "Suspicious order monitoring is voluntary"
        ],
        correctAnswer: "When the order or pattern of orders deviates from established norms in size, frequency, or pattern",
        onCorrect: "Deviation from established norms — size, frequency, pattern. SUPPORT Act of 2018 codified what DEA had been saying for years. Pharmacies and wholesalers must identify and report suspicious orders. Failure to do so has cost wholesalers nine-figure penalties. The criteria are deliberately flexible — no single threshold — but the obligation is concrete.",
        onWrong: "Deviation from established norms — size, frequency, pattern. SUPPORT Act 2018 codified the requirement. Pharmacy obligation, not voluntary. The criteria are flexible but the requirement is firm. Failure to monitor and report has cost wholesalers and pharmacies nine-figure settlements."
    )
}

// MARK: - Day 20 Questions

extension RimrockQuestion {

    static let day20_dilutionMath = RimrockQuestion(
        id: "D20_DILUTION_MATH",
        domain: .orderEntry,
        topic: "DILUTION_C1V1_C2V2",
        prompt: "You need 240 mL of a 25 mg/mL oral suspension. You have 50 mg/mL stock. How much stock and how much diluent?",
        options: [
            "120 mL stock + 120 mL diluent",
            "60 mL stock + 180 mL diluent",
            "240 mL stock + 0 mL diluent",
            "30 mL stock + 210 mL diluent"
        ],
        correctAnswer: "120 mL stock + 120 mL diluent",
        onCorrect: "C₁V₁ = C₂V₂. 50 × V₁ = 25 × 240. V₁ = 120 mL of stock. Diluent = 240 − 120 = 120 mL. Always plausibility-check: half-strength final, so half stock makes sense.",
        onWrong: "C₁V₁ = C₂V₂. 50 × V₁ = 25 × 240 → V₁ = 120 mL stock. Diluent = 240 − 120 = 120 mL. Half-strength target means half the volume comes from stock. Plausibility-check every dilution problem."
    )

    static let day20_ivRate = RimrockQuestion(
        id: "D20_IV_RATE",
        domain: .orderEntry,
        topic: "IV_RATE_CALC",
        prompt: "Heparin 25,000 units in 250 mL D5W. Order: 18 units/kg/hour for an 80 kg patient. Rate in mL/hour?",
        options: ["14.4 mL/hr", "1.44 mL/hr", "144 mL/hr", "7.2 mL/hr"],
        correctAnswer: "14.4 mL/hr",
        onCorrect: "Dose: 18 × 80 = 1440 units/hr. Concentration: 25000 ÷ 250 = 100 units/mL. Rate: 1440 ÷ 100 = 14.4 mL/hr. Plausibility: 14.4 mL/hr × 24 = ~346 mL/day; bag is 250 mL so it lasts about 17 hours, which is reasonable for ongoing heparin.",
        onWrong: "Dose 18 × 80 = 1440 units/hr. Concentration 25,000/250 = 100 units/mL. Rate 1440/100 = 14.4 mL/hr. Always do plausibility — if you said \"infuse 250 mL bag in 7 minutes,\" you did it wrong."
    )

    static let day20_serotoninSyndrome = RimrockQuestion(
        id: "D20_SEROTONIN_SYNDROME",
        domain: .patientSafety,
        topic: "SEROTONIN_SYNDROME",
        prompt: "A patient on sertraline (SSRI) is started on linezolid. The pharmacist's concern is...?",
        options: [
            "Serotonin syndrome",
            "QT prolongation",
            "Hyperkalemia",
            "Hypoglycemia"
        ],
        correctAnswer: "Serotonin syndrome",
        onCorrect: "Serotonin syndrome. Linezolid is a weak MAOI — combining with serotonergic drugs (SSRIs, SNRIs, triptans, MAOIs, tramadol, methylene blue, St. John's wort) causes excess serotonin: agitation, hyperthermia, tachycardia, clonus, rigidity. Severe cases fatal. Common offenders to memorize: linezolid, tramadol, MAOIs, methylene blue, triptans, St. John's wort, MDMA.",
        onWrong: "Serotonin syndrome. Linezolid + SSRI = MAOI-like combo + serotonin reuptake inhibition. Symptoms: agitation, hyperthermia, tachycardia, clonus, rigidity. Severe = fatal. The combinations to know: linezolid, tramadol, MAOIs, methylene blue, triptans, St. John's wort with any serotonergic agent."
    )

    static let day20_pediConversion = RimrockQuestion(
        id: "D20_PEDI_CONVERSION",
        domain: .orderEntry,
        topic: "PEDIATRIC_DOSING",
        prompt: "A child weighs 35 lb. Acetaminophen suspension 160 mg/5 mL. Order: 15 mg/kg/dose. Dispense per dose?",
        options: ["7.5 mL", "5 mL", "10 mL", "2.5 mL"],
        correctAnswer: "7.5 mL",
        onCorrect: "35 lb ÷ 2.2 = ~15.9 kg → 16 kg. 16 × 15 mg = 240 mg/dose. 240 mg ÷ 160 mg × 5 mL = 7.5 mL. Always do pediatric math twice; pediatric dose calculations and insulin units are the most common math errors in retail.",
        onWrong: "7.5 mL. 35 lb / 2.2 = ~16 kg. 16 × 15 = 240 mg per dose. 240/160 × 5 = 7.5 mL. Pediatric math = double-check. Many drug errors involving children trace back to a fast lb→kg conversion or a slipped decimal. Slow down."
    )
}

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

// MARK: - Day 31 Questions — Drug Stems Comprehensive

extension RimrockQuestion {

    static let day31_pril_ace = RimrockQuestion(
        id: "D31_STEM_PRIL",
        domain: .medications,
        topic: "STEM_PRIL",
        prompt: "Drugs ending in -pril (lisinopril, enalapril, ramipril) are which class?",
        options: ["ACE inhibitor", "Beta-blocker", "ARB", "Calcium channel blocker"],
        correctAnswer: "ACE inhibitor",
        onCorrect: "ACE inhibitors. Block angiotensin-converting enzyme — angiotensin I cannot become angiotensin II, vasodilation, BP drops. Side effects: dry cough (~10%), hyperkalemia, angioedema (rare but serious), first-dose hypotension. Pair with ARB if cough is intolerable.",
        onWrong: "ACE inhibitor. -pril stem. Lower blood pressure via the renin-angiotensin axis. Watch for dry cough, hyperkalemia, angioedema."
    )

    static let day31_sartan_arb = RimrockQuestion(
        id: "D31_STEM_SARTAN",
        domain: .medications,
        topic: "STEM_SARTAN",
        prompt: "Drugs ending in -sartan (losartan, valsartan, irbesartan) are which class?",
        options: ["ARB (angiotensin II receptor blocker)", "ACE inhibitor", "Diuretic", "Calcium channel blocker"],
        correctAnswer: "ARB (angiotensin II receptor blocker)",
        onCorrect: "ARB. Block the angiotensin II type-1 receptor directly. Same downstream effect as ACE inhibitors but no kinin accumulation, so much less cough. Same hyperkalemia and angioedema concerns (lower rate). Used when ACE inhibitor is not tolerated.",
        onWrong: "ARB — angiotensin II receptor blocker. -sartan stem. Same BP-lowering pathway as ACEs but blocks the receptor instead of the enzyme. Dry cough is rare; hyperkalemia and angioedema still concerns at lower rate."
    )

    static let day31_olol_betaBlocker = RimrockQuestion(
        id: "D31_STEM_OLOL",
        domain: .medications,
        topic: "STEM_OLOL",
        prompt: "Drugs ending in -olol (metoprolol, atenolol, propranolol) are which class?",
        options: ["Beta-blocker", "Alpha-blocker", "Calcium channel blocker", "Diuretic"],
        correctAnswer: "Beta-blocker",
        onCorrect: "Beta-blocker. -olol stem. Block beta-1 (cardiac) and/or beta-2 (lung/vascular) receptors. Selective beta-1: metoprolol, atenolol, bisoprolol — safer in asthma. Non-selective: propranolol, nadolol — caution in asthma, useful for migraine prophylaxis and tremor. Carvedilol and labetalol are alpha+beta blockers.",
        onWrong: "Beta-blocker. -olol. Lowers heart rate, blood pressure, oxygen demand. Selective beta-1 (metoprolol, atenolol) safer in asthma. Non-selective (propranolol) blocks both. Carvedilol blocks alpha too."
    )

    static let day31_dipine_ccb = RimrockQuestion(
        id: "D31_STEM_DIPINE",
        domain: .medications,
        topic: "STEM_DIPINE",
        prompt: "Drugs ending in -dipine (amlodipine, nifedipine, felodipine) are which subclass?",
        options: ["Dihydropyridine calcium channel blocker", "Non-dihydropyridine CCB", "ACE inhibitor", "ARB"],
        correctAnswer: "Dihydropyridine calcium channel blocker",
        onCorrect: "Dihydropyridine CCB. Block L-type calcium channels in vascular smooth muscle — vasodilation. Side effects: ankle edema, headache, flushing, reflex tachycardia (which is why amlodipine paired with a beta-blocker is common). Non-dihydropyridine CCBs (verapamil, diltiazem) act more on cardiac tissue — slow heart rate, treat AFib, cause constipation.",
        onWrong: "Dihydropyridine CCB. -dipine stem. Vascular-selective vasodilator. Edema, headache, flushing. Verapamil and diltiazem are the OTHER CCB class — non-dihydropyridine, work on heart, AV-blocker, constipation."
    )

    static let day31_statin_hmg = RimrockQuestion(
        id: "D31_STEM_STATIN",
        domain: .medications,
        topic: "STEM_STATIN",
        prompt: "Drugs ending in -statin (atorvastatin, rosuvastatin, simvastatin) are which class?",
        options: ["HMG-CoA reductase inhibitor", "Bile acid sequestrant", "PCSK9 inhibitor", "Fibrate"],
        correctAnswer: "HMG-CoA reductase inhibitor",
        onCorrect: "Statin — HMG-CoA reductase inhibitor. Block the rate-limiting enzyme in cholesterol synthesis. Most-prescribed drug class in the world. Watch for muscle pain (rhabdomyolysis), elevated liver enzymes, drug interactions via CYP3A4 (especially simvastatin and lovastatin with grapefruit, macrolides, azole antifungals).",
        onWrong: "Statin. HMG-CoA reductase inhibitor. -statin stem. Lowers cholesterol production. Watch muscle pain (rhabdo), LFT elevation, CYP3A4 interactions especially with simvastatin and lovastatin."
    )

    static let day31_prazole_ppi = RimrockQuestion(
        id: "D31_STEM_PRAZOLE",
        domain: .medications,
        topic: "STEM_PRAZOLE",
        prompt: "Drugs ending in -prazole (omeprazole, pantoprazole, lansoprazole) are which class?",
        options: ["Proton pump inhibitor (PPI)", "H2 blocker", "Antacid", "Prokinetic"],
        correctAnswer: "Proton pump inhibitor (PPI)",
        onCorrect: "PPI. Block the H/K ATPase in parietal cells — strongly suppress gastric acid. Long-term concerns: B12 deficiency, osteoporosis, hypomagnesemia, increased risk of C. diff. Step-down therapy when reflux resolves; chronic PPI use is overprescribed.",
        onWrong: "PPI — proton pump inhibitor. -prazole stem. Most powerful acid suppressor. Long-term: B12, bone density, magnesium, C. diff risk."
    )

    static let day31_tidine_h2 = RimrockQuestion(
        id: "D31_STEM_TIDINE",
        domain: .medications,
        topic: "STEM_TIDINE",
        prompt: "Drugs ending in -tidine (famotidine, cimetidine) are which class?",
        options: ["H2 receptor blocker", "PPI", "Antacid", "Antihistamine (H1)"],
        correctAnswer: "H2 receptor blocker",
        onCorrect: "H2 blocker. Block histamine H2 receptors on parietal cells — moderate acid suppression. Less potent than PPIs but faster acting and useful for breakthrough symptoms. Cimetidine is a CYP inhibitor — many drug interactions; famotidine is cleaner. Note: -dine ending is also seen in H1 antihistamines (e.g., loratadine), so look at the whole stem.",
        onWrong: "H2 blocker. -tidine. Moderate acid suppression. Cimetidine has CYP issues; famotidine is cleaner. H1 antihistamines (loratadine, cetirizine) also end in -dine — context matters."
    )

    static let day31_terol_beta2 = RimrockQuestion(
        id: "D31_STEM_TEROL",
        domain: .medications,
        topic: "STEM_TEROL",
        prompt: "Drugs ending in -terol (albuterol, salmeterol, formoterol) are which class?",
        options: ["Beta-2 agonist (bronchodilator)", "Alpha-blocker", "Antimuscarinic", "Corticosteroid"],
        correctAnswer: "Beta-2 agonist (bronchodilator)",
        onCorrect: "Beta-2 agonist. -terol stem. Dilate bronchial smooth muscle. Albuterol is short-acting (SABA) — rescue. Salmeterol, formoterol, vilanterol are long-acting (LABA) — controllers, never used alone for asthma. Side effects: tachycardia, tremor, hypokalemia at high doses.",
        onWrong: "Beta-2 agonist (bronchodilator). -terol stem. Albuterol = SABA, rescue. Salmeterol/formoterol = LABA, controllers (paired with ICS). Side effects: tachycardia, tremor."
    )

    static let day31_formin_biguanide = RimrockQuestion(
        id: "D31_STEM_FORMIN",
        domain: .medications,
        topic: "STEM_FORMIN",
        prompt: "The drug stem -formin (metformin) identifies which class?",
        options: ["Biguanide", "Sulfonylurea", "Thiazolidinedione", "GLP-1 agonist"],
        correctAnswer: "Biguanide",
        onCorrect: "Biguanide. Metformin is the only widely-used member. Decreases hepatic glucose production, increases peripheral insulin sensitivity. First-line in type 2 diabetes. Hold for IV contrast (lactic acidosis risk). Can cause B12 deficiency on long-term therapy.",
        onWrong: "Biguanide. Metformin's class. First-line for type 2 diabetes. Watch B12, lactic acidosis with contrast or renal impairment."
    )

    static let day31_gliflozin_sglt2 = RimrockQuestion(
        id: "D31_STEM_GLIFLOZIN",
        domain: .medications,
        topic: "STEM_GLIFLOZIN",
        prompt: "Drugs ending in -gliflozin (empagliflozin, dapagliflozin) are which class?",
        options: ["SGLT2 inhibitor", "DPP-4 inhibitor", "GLP-1 agonist", "Sulfonylurea"],
        correctAnswer: "SGLT2 inhibitor",
        onCorrect: "SGLT2 inhibitor. Block sodium-glucose cotransporter 2 in proximal tubule. Glucose spills into urine. Cardiovascular and renal benefits beyond glucose lowering. Side effects: genital mycotic infection, euglycemic DKA in stress, canagliflozin amputation signal.",
        onWrong: "SGLT2 inhibitor. -gliflozin. Pee out glucose. CV and renal benefits. Yeast infections, euglycemic DKA risk."
    )

    static let day31_glutide_glp1 = RimrockQuestion(
        id: "D31_STEM_GLUTIDE",
        domain: .medications,
        topic: "STEM_GLUTIDE",
        prompt: "Drugs ending in -glutide (semaglutide, liraglutide, dulaglutide) are which class?",
        options: ["GLP-1 receptor agonist", "DPP-4 inhibitor", "SGLT2 inhibitor", "Sulfonylurea"],
        correctAnswer: "GLP-1 receptor agonist",
        onCorrect: "GLP-1 agonist. Mimic incretin hormone — promote insulin release, suppress glucagon, slow gastric emptying, reduce appetite. Side effects: nausea, vomiting, diarrhea, constipation. Black box: thyroid C-cell tumor (rodent data; clinical relevance with MEN2/MTC family history).",
        onWrong: "GLP-1 agonist. -glutide. Type 2 diabetes + weight loss. Nausea/GI side effects. Black-box thyroid C-cell tumor warning."
    )

    static let day31_floxacin_fq = RimrockQuestion(
        id: "D31_STEM_FLOXACIN",
        domain: .medications,
        topic: "STEM_FLOXACIN",
        prompt: "Drugs ending in -floxacin (levofloxacin, ciprofloxacin, moxifloxacin) are which class?",
        options: ["Fluoroquinolone antibiotic", "Macrolide antibiotic", "Penicillin", "Tetracycline"],
        correctAnswer: "Fluoroquinolone antibiotic",
        onCorrect: "Fluoroquinolone. -floxacin stem. Black box: tendon rupture, peripheral neuropathy, CNS effects, aortic aneurysm. Cation interactions — antacids, calcium, iron, magnesium, zinc all chelate the drug — separate by 2 hours before / 6 hours after.",
        onWrong: "Fluoroquinolone. -floxacin. Multiple black box warnings; reserve for serious infections. Cation interactions."
    )

    static let day31_thromycin_macrolide = RimrockQuestion(
        id: "D31_STEM_THROMYCIN",
        domain: .medications,
        topic: "STEM_THROMYCIN",
        prompt: "Drugs ending in -thromycin (azithromycin, erythromycin, clarithromycin) are which class?",
        options: ["Macrolide antibiotic", "Tetracycline", "Aminoglycoside", "Cephalosporin"],
        correctAnswer: "Macrolide antibiotic",
        onCorrect: "Macrolide. -thromycin stem. CYP3A4 inhibition (erythromycin, clarithromycin strong; azithromycin minimal). QT prolongation across the class. Common interactions: statins, calcium channel blockers, warfarin, several antiarrhythmics.",
        onWrong: "Macrolide. -thromycin. CYP3A4 inhibition (less for azithromycin), QT prolongation. Watch interactions with statins and CCBs."
    )

    static let day31_cycline_tetracycline = RimrockQuestion(
        id: "D31_STEM_CYCLINE",
        domain: .medications,
        topic: "STEM_CYCLINE",
        prompt: "Drugs ending in -cycline (doxycycline, minocycline, tetracycline) are which class?",
        options: ["Tetracycline antibiotic", "Macrolide antibiotic", "Penicillin", "Aminoglycoside"],
        correctAnswer: "Tetracycline antibiotic",
        onCorrect: "Tetracycline. -cycline stem. Cation chelation — separate from antacids, dairy (calcium), iron, magnesium. Photosensitivity. Avoid in pregnancy and children under 8 (teeth staining). Doxycycline is the most-used; minocycline has more CNS side effects.",
        onWrong: "Tetracycline. -cycline. Avoid dairy/cations near dose. Photosensitivity. Pregnancy + young children contraindicated."
    )

    static let day31_conazole_antifungal = RimrockQuestion(
        id: "D31_STEM_CONAZOLE",
        domain: .medications,
        topic: "STEM_CONAZOLE",
        prompt: "Drugs ending in -conazole (fluconazole, ketoconazole, itraconazole) are which class?",
        options: ["Azole antifungal", "Antibacterial", "Antiviral", "Antiparasitic"],
        correctAnswer: "Azole antifungal",
        onCorrect: "Azole antifungal. -conazole stem. Strong CYP3A4 inhibitors — many drug interactions. Hepatotoxicity, especially ketoconazole (oral ketoconazole is largely deprecated for systemic use due to liver risk). Topical and intravaginal preparations have fewer systemic concerns.",
        onWrong: "Azole antifungal. -conazole. CYP3A4 inhibition (strong) — many interactions. Hepatotoxicity, especially oral ketoconazole."
    )

    static let day31_vir_antiviral = RimrockQuestion(
        id: "D31_STEM_VIR",
        domain: .medications,
        topic: "STEM_VIR",
        prompt: "Drugs ending in -vir (acyclovir, valacyclovir, oseltamivir) are which class?",
        options: ["Antiviral", "Antibacterial", "Antifungal", "Antiparasitic"],
        correctAnswer: "Antiviral",
        onCorrect: "Antiviral. -vir stem. Different agents target different viruses — acyclovir/valacyclovir for herpes family, oseltamivir/zanamivir for influenza, antiretrovirals (-vir suffix common) for HIV, sofosbuvir for hepatitis C. Renal dosing matters for many.",
        onWrong: "Antiviral. -vir stem. Range from herpes (acyclovir, valacyclovir) to flu (oseltamivir) to HIV (multiple) to hepatitis (sofosbuvir). Renal dosing common."
    )

    static let day31_setron_5ht3 = RimrockQuestion(
        id: "D31_STEM_SETRON",
        domain: .medications,
        topic: "STEM_SETRON",
        prompt: "Drugs ending in -setron (ondansetron, granisetron, palonosetron) are which class?",
        options: ["5-HT3 antagonist (antiemetic)", "Dopamine antagonist", "NK1 antagonist", "Antihistamine"],
        correctAnswer: "5-HT3 antagonist (antiemetic)",
        onCorrect: "5-HT3 antagonist. -setron stem. First-line for chemotherapy-induced and post-operative nausea. Mild side effects (headache, constipation). QT prolongation at high doses; FDA pulled the 32 mg single-dose IV indication.",
        onWrong: "5-HT3 antagonist antiemetic. -setron. CINV and post-op N/V. QT risk at high doses."
    )

    static let day31_triptan_migraine = RimrockQuestion(
        id: "D31_STEM_TRIPTAN",
        domain: .medications,
        topic: "STEM_TRIPTAN",
        prompt: "Drugs ending in -triptan (sumatriptan, rizatriptan, eletriptan) are which class?",
        options: ["Migraine abortive (5-HT1B/1D agonist)", "Migraine prophylactic", "NSAID", "Opioid analgesic"],
        correctAnswer: "Migraine abortive (5-HT1B/1D agonist)",
        onCorrect: "Triptan. -triptan stem. 5-HT1B/1D agonist — vasoconstrict cranial vessels and inhibit pain transmission. For abortive treatment of migraine, not prophylaxis. Contraindicated in patients with CV disease, uncontrolled hypertension, basilar migraine, recent ergot use. Serotonin syndrome risk with SSRIs/SNRIs/MAOIs.",
        onWrong: "Triptan. Migraine abortive. CV contraindications. Serotonin syndrome risk with serotonergic combos."
    )

    static let day31_azepam_benzo = RimrockQuestion(
        id: "D31_STEM_AZEPAM",
        domain: .medications,
        topic: "STEM_AZEPAM",
        prompt: "Drugs ending in -azepam or -azolam (diazepam, lorazepam, alprazolam, clonazepam) are which class?",
        options: ["Benzodiazepine", "Barbiturate", "Z-drug (non-benzo sleep agent)", "SSRI"],
        correctAnswer: "Benzodiazepine",
        onCorrect: "Benzodiazepine. -azepam / -azolam stem. C-IV controlled. Physical dependence after weeks of regular use; abrupt cessation can cause rebound, withdrawal, seizures. Beers Criteria flag for elderly. CDC: don't combine with opioids except in specifically monitored situations.",
        onWrong: "Benzo. -azepam / -azolam. C-IV. Dependence + taper. Beers list for elderly. Don't stack with opioids."
    )

    static let day31_dronate_bisphosphonate = RimrockQuestion(
        id: "D31_STEM_DRONATE",
        domain: .medications,
        topic: "STEM_DRONATE",
        prompt: "Drugs ending in -dronate (alendronate, risedronate, ibandronate) are which class?",
        options: ["Bisphosphonate (osteoporosis)", "Calcium supplement", "Vitamin D analog", "Calcitonin"],
        correctAnswer: "Bisphosphonate (osteoporosis)",
        onCorrect: "Bisphosphonate. -dronate stem. Inhibit bone resorption. Counsel hard: take with full glass of water on empty stomach, remain upright 30+ minutes, separate from food/calcium. Risks: esophagitis, osteonecrosis of the jaw (rare), atypical femur fracture (rare with prolonged use).",
        onWrong: "Bisphosphonate. -dronate. Strict counsel: water, upright 30+ min, empty stomach, no food/calcium near dose. Esophagitis risk."
    )

    static let day31_xaban_doac = RimrockQuestion(
        id: "D31_STEM_XABAN",
        domain: .medications,
        topic: "STEM_XABAN",
        prompt: "Drugs ending in -xaban (apixaban, rivaroxaban, edoxaban) are which class?",
        options: ["Direct oral anticoagulant (factor Xa inhibitor)", "Heparin", "Warfarin", "Antiplatelet"],
        correctAnswer: "Direct oral anticoagulant (factor Xa inhibitor)",
        onCorrect: "DOAC — factor Xa inhibitor. -xaban stem. Apixaban, rivaroxaban, edoxaban. Dabigatran is a DOAC too but it's a direct thrombin inhibitor. Advantages over warfarin: no INR monitoring, fewer food/drug interactions. Renal dose adjustment needed. Reversal agents exist (andexanet alfa for Xa inhibitors, idarucizumab for dabigatran).",
        onWrong: "DOAC factor Xa inhibitor. -xaban. No INR. Renal dose-adjust. Reversal agents available."
    )

    static let day31_mab_monoclonal = RimrockQuestion(
        id: "D31_STEM_MAB",
        domain: .medications,
        topic: "STEM_MAB",
        prompt: "Drugs ending in -mab (adalimumab, infliximab, rituximab, pembrolizumab) are which class?",
        options: ["Monoclonal antibody", "Small-molecule inhibitor", "Vaccine", "Hormone"],
        correctAnswer: "Monoclonal antibody",
        onCorrect: "Monoclonal antibody. -mab stem. Refrigerated biologics for autoimmune conditions, oncology, transplant. Subcutaneous, intramuscular, or IV. Watch for infusion reactions and immunosuppression. Storage matters — refrigerated, often a defined room-temp window before discard.",
        onWrong: "Monoclonal antibody. -mab. Refrigerated biologics. Autoimmune, oncology, transplant. Storage critical."
    )

    static let day31_nib_kinase = RimrockQuestion(
        id: "D31_STEM_NIB",
        domain: .medications,
        topic: "STEM_NIB",
        prompt: "Drugs ending in -nib or -tinib (imatinib, ibrutinib, sunitinib) are which class?",
        options: ["Kinase inhibitor (oncology)", "Antibody", "Antibiotic", "Hormone"],
        correctAnswer: "Kinase inhibitor (oncology)",
        onCorrect: "Kinase inhibitor. -nib / -tinib stem. Small-molecule oncology drugs targeting specific kinases. Hazardous drug handling per USP <800>. Many have grapefruit / CYP3A4 interactions, QT prolongation, hepatotoxicity. Patient counseling significant — adherence in cancer therapy is non-negotiable.",
        onWrong: "Kinase inhibitor. -nib / -tinib. Targeted oncology. USP <800> handling. CYP3A4 interactions."
    )

    static let day31_caine_anesthetic = RimrockQuestion(
        id: "D31_STEM_CAINE",
        domain: .medications,
        topic: "STEM_CAINE",
        prompt: "Drugs ending in -caine (lidocaine, bupivacaine, benzocaine) are which class?",
        options: ["Local anesthetic", "Antiarrhythmic only", "Beta-blocker", "Analgesic opioid"],
        correctAnswer: "Local anesthetic",
        onCorrect: "Local anesthetic. -caine stem. Block sodium channels in nerves — local numbing. Lidocaine is also a class IB antiarrhythmic IV. Benzocaine OTC for teething/sore throat carries a methemoglobinemia risk — FDA warning, especially in children under 2.",
        onWrong: "Local anesthetic. -caine. Sodium channel block. Lidocaine doubles as antiarrhythmic IV. Benzocaine: methemoglobinemia warning."
    )
}

// MARK: - Day 32 Questions — Math Lab

extension RimrockQuestion {

    static let day32_alligation = RimrockQuestion(
        id: "D32_ALLIGATION",
        domain: .orderEntry,
        topic: "ALLIGATION",
        prompt: "Prepare 100 g of 5% hydrocortisone cream from 10% and 1% stocks. How much of each?",
        options: [
            "44.4 g of 10% + 55.6 g of 1%",
            "50 g of 10% + 50 g of 1%",
            "33.3 g of 10% + 66.7 g of 1%",
            "10 g of 10% + 90 g of 1%"
        ],
        correctAnswer: "44.4 g of 10% + 55.6 g of 1%",
        onCorrect: "Alligation. Differences: |10−5|=5 (parts of 1%), |1−5|=4 (parts of 10%). Total parts = 9. 10% portion: (4/9)×100 = 44.4 g. 1% portion: (5/9)×100 = 55.6 g. Verify: 44.4×10% + 55.6×1% = 4.44 + 0.556 = 5.0 g of active = 5% of 100 g. ✓",
        onWrong: "Alligation. Set up the tic-tac-toe: high (10), low (1), desired (5). Differences cross-diagonally: 10 minus 5 = 5 parts of low; 5 minus 1 = 4 parts of high. Ratio is 4:5. Total parts 9. High = (4/9)×100 = 44.4 g; low = (5/9)×100 = 55.6 g. Always verify."
    )

    static let day32_bsa = RimrockQuestion(
        id: "D32_BSA",
        domain: .orderEntry,
        topic: "BSA_CHEMO",
        prompt: "A patient is 175 cm and 70 kg. Order: doxorubicin 60 mg/m². Approximately how much doxorubicin? (Use Mosteller: BSA = √(ht × wt / 3600))",
        options: [
            "~110 mg",
            "~70 mg",
            "~150 mg",
            "~210 mg"
        ],
        correctAnswer: "~110 mg",
        onCorrect: "BSA Mosteller = √(175 × 70 / 3600) = √(3.4) = 1.84 m². Dose = 60 mg/m² × 1.84 m² = ~110 mg. BSA-based dosing is standard in oncology; double-check pediatric and chemo math twice — these are high-stakes errors.",
        onWrong: "BSA = √(175 × 70 / 3600) = √(3.4) ≈ 1.84 m². Dose = 60 × 1.84 ≈ 110 mg. Mosteller formula. Always verify; chemo math errors are high-stakes."
    )

    static let day32_dripGtt = RimrockQuestion(
        id: "D32_DRIP_GTT",
        domain: .orderEntry,
        topic: "DRIP_RATE",
        prompt: "Order: 1 L NS over 8 hours, drop factor 15 gtt/mL. What's the gtt/min rate?",
        options: ["~31 gtt/min", "~15 gtt/min", "~62 gtt/min", "~125 gtt/min"],
        correctAnswer: "~31 gtt/min",
        onCorrect: "1000 mL ÷ 480 min = 2.08 mL/min. ×15 gtt/mL = 31 gtt/min. Always plausibility-check: at 31 gtt/min × 60 min = 1860 gtt/hour ÷ 15 = 124 mL/hour × 8 hr = 992 mL ≈ 1 L. ✓",
        onWrong: "1000 mL / 480 min = 2.08 mL/min. ×15 gtt/mL = 31 gtt/min. Plausibility-check: ~125 mL/hr × 8 hr = 1 L. Drip rates use drop factor (10, 15, 20 gtt/mL macro; 60 gtt/mL micro)."
    )

    static let day32_ratioStrength = RimrockQuestion(
        id: "D32_RATIO_STRENGTH",
        domain: .orderEntry,
        topic: "RATIO_STRENGTH",
        prompt: "Express 1:1000 epinephrine in mg/mL.",
        options: ["1 mg/mL", "0.1 mg/mL", "10 mg/mL", "0.01 mg/mL"],
        correctAnswer: "1 mg/mL",
        onCorrect: "1:1000 means 1 g per 1000 mL = 1000 mg per 1000 mL = 1 mg/mL. The classic anaphylaxis IM/SQ dose. Compare 1:10,000 epinephrine = 0.1 mg/mL — used IV for cardiac arrest. Mixing them up has killed patients. PTCB asks this directly.",
        onWrong: "1:1000 = 1 g/1000 mL = 1 mg/mL (anaphylaxis IM). 1:10,000 = 0.1 mg/mL (IV cardiac arrest). DO NOT MIX UP. PTCB and clinical setting both test it."
    )

    static let day32_powderVolume = RimrockQuestion(
        id: "D32_POWDER_VOLUME",
        domain: .orderEntry,
        topic: "POWDER_VOLUME",
        prompt: "An antibiotic vial contains 1 g powder. Reconstitution: add 9.6 mL diluent to yield 10 mL of 100 mg/mL. What's the powder volume?",
        options: ["0.4 mL", "1 mL", "0.6 mL", "1.4 mL"],
        correctAnswer: "0.4 mL",
        onCorrect: "Final volume 10 mL minus diluent added 9.6 mL = 0.4 mL displaced by powder. Powder volume matters for accurate concentration when reconstituting — package insert or pharmacy reference gives the value for each product.",
        onWrong: "10 mL final − 9.6 mL diluent = 0.4 mL powder volume. Always check the package insert; powder volume varies by product. Critical for accurate concentration."
    )

    static let day32_percentStrengthWV = RimrockQuestion(
        id: "D32_PERCENT_STRENGTH",
        domain: .orderEntry,
        topic: "PERCENT_STRENGTH",
        prompt: "How much active drug is in 250 mL of 5% w/v dextrose?",
        options: ["12.5 g", "5 g", "1.25 g", "50 g"],
        correctAnswer: "12.5 g",
        onCorrect: "5% w/v = 5 g per 100 mL = 50 mg/mL. 250 mL × 50 mg/mL = 12,500 mg = 12.5 g. Percent strength rules: w/v = grams per 100 mL; w/w = grams per 100 g; v/v = mL per 100 mL.",
        onWrong: "5% w/v = 5 g/100 mL = 50 mg/mL. 250 mL × 50 mg/mL = 12,500 mg = 12.5 g. Memorize: w/v = g/100mL; w/w = g/100g; v/v = mL/100mL."
    )

    static let day32_doseConversionLbsKg = RimrockQuestion(
        id: "D32_LBS_KG",
        domain: .orderEntry,
        topic: "WEIGHT_CONVERSION",
        prompt: "Convert 154 lb to kg.",
        options: ["70 kg", "154 kg", "338 kg", "77 kg"],
        correctAnswer: "70 kg",
        onCorrect: "154 ÷ 2.2 = 70 kg. Memorize: 1 kg ≈ 2.2 lb. Most weight-based dosing in pharmacy uses kg. Common pediatric doses use mg/kg/dose or mg/kg/day.",
        onWrong: "Divide pounds by 2.2 to get kg. 154/2.2 = 70 kg. Inverse: 1 kg = 2.2 lb. All clinical dosing uses kg."
    )

    static let day32_daysSupplyEyeDrops = RimrockQuestion(
        id: "D32_DS_DROPS",
        domain: .orderEntry,
        topic: "DAYS_SUPPLY_DROPS",
        prompt: "Latanoprost 2.5 mL bottle, sig 1 drop OU at bedtime. About how many drops per mL? Days supply?",
        options: [
            "~20 drops/mL → 2.5 × 20 = 50 drops total ÷ 2 (OU) = 25 days",
            "~10 drops/mL → 25 drops total = 12 days",
            "~30 drops/mL → 75 drops total = 75 days",
            "Cannot calculate without manufacturer data"
        ],
        correctAnswer: "~20 drops/mL → 2.5 × 20 = 50 drops total ÷ 2 (OU) = 25 days",
        onCorrect: "20 drops/mL is the pharmacy convention for ophthalmics (some references use 16 or 19). 2.5 mL × 20 = 50 drops. OU = both eyes, so 2 drops/day. 50 ÷ 2 = 25 days. Insurance billing for eye drops uses days supply derived from this calculation; software pricing varies in default drops/mL.",
        onWrong: "20 drops/mL convention. 2.5 mL × 20 = 50 drops total. OU (both eyes) = 2/day. 50/2 = 25 days. Drops/mL conventions vary 16–20 by reference; pharmacy software has a default."
    )

    static let day32_daysSupplyInsulin = RimrockQuestion(
        id: "D32_DS_INSULIN",
        domain: .orderEntry,
        topic: "DAYS_SUPPLY_INSULIN",
        prompt: "Insulin glargine 100 units/mL, 10 mL vial, sig 30 units sub-Q at bedtime. Days supply?",
        options: ["~33 days", "~10 days", "~100 days", "~3 days"],
        correctAnswer: "~33 days",
        onCorrect: "10 mL × 100 units/mL = 1000 units total. 1000 ÷ 30 units/day = 33.3 days. Insurance billing for insulin: total units ÷ daily units. Pen units varies; vials are 10 mL (1000 units of U-100). U-500 insulin is 5x more concentrated — different math, different patient population.",
        onWrong: "1000 units / 30 units per day = 33.3 days. 10 mL × 100 units/mL = 1000 units in vial. U-500 insulin (5x concentration) is a separate calculation and a critical safety issue."
    )

    static let day32_chemoBSA = RimrockQuestion(
        id: "D32_CHEMO_BSA",
        domain: .orderEntry,
        topic: "BSA_PEDS",
        prompt: "A child weighs 22 kg, height 110 cm. BSA via Mosteller? (BSA = √(ht × wt / 3600))",
        options: ["~0.82 m²", "~1.5 m²", "~0.5 m²", "~1.0 m²"],
        correctAnswer: "~0.82 m²",
        onCorrect: "√(110 × 22 / 3600) = √(2420/3600) = √0.672 = 0.82 m². Pediatric BSA is small. Dose = mg/m² × BSA. Pediatric chemo dosing has narrow margins; double-checking is non-negotiable.",
        onWrong: "Mosteller: √(110×22/3600) = √0.67 ≈ 0.82 m². Pediatric chemo + BSA needs verification by two pharmacists per most institutional policies."
    )
}

// MARK: - Day 33 Questions — Auxiliary Labels

extension RimrockQuestion {

    static let day33_takeWithFood = RimrockQuestion(
        id: "D33_LABEL_FOOD",
        domain: .patientSafety,
        topic: "AUX_TAKE_WITH_FOOD",
        prompt: "Which medication should be labeled \"TAKE WITH FOOD\"?",
        options: ["Metformin", "Levothyroxine", "Bisphosphonate (alendronate)", "Tetracycline"],
        correctAnswer: "Metformin",
        onCorrect: "Metformin — take with food to reduce GI side effects (nausea, diarrhea). Other take-with-food drugs: NSAIDs (gastric protection), HCTZ, valproate, carbamazepine, ritonavir. Levothyroxine is empty stomach. Bisphosphonates are empty stomach + upright. Tetracycline avoids dairy/cations.",
        onWrong: "Metformin — take with food to reduce GI upset. NSAIDs, HCTZ also benefit from food (gastric protection). Levothyroxine and bisphosphonates are EMPTY stomach. Tetracycline avoids dairy/cations."
    )

    static let day33_emptyStomach = RimrockQuestion(
        id: "D33_LABEL_EMPTY",
        domain: .patientSafety,
        topic: "AUX_EMPTY_STOMACH",
        prompt: "Which drug should be labeled \"TAKE ON AN EMPTY STOMACH\"?",
        options: ["Levothyroxine", "Metformin", "Atorvastatin", "Lisinopril"],
        correctAnswer: "Levothyroxine",
        onCorrect: "Levothyroxine — empty stomach, 30-60 minutes before breakfast, with water. Food and especially calcium / iron / soy / coffee reduce absorption significantly. Other empty-stomach drugs: bisphosphonates (with strict water/upright rules), proton pump inhibitors, isoniazid, several quinolones.",
        onWrong: "Levothyroxine — empty stomach, 30-60 min before food. Calcium, iron, soy, coffee all interfere with absorption. Bisphosphonates also empty stomach with strict water/upright rules."
    )

    static let day33_avoidGrapefruit = RimrockQuestion(
        id: "D33_LABEL_GRAPEFRUIT",
        domain: .patientSafety,
        topic: "AUX_GRAPEFRUIT",
        prompt: "Which medication carries a \"AVOID GRAPEFRUIT\" auxiliary label?",
        options: ["Simvastatin", "Pravastatin", "Rosuvastatin", "Atorvastatin"],
        correctAnswer: "Simvastatin",
        onCorrect: "Simvastatin — significant CYP3A4 metabolism, large grapefruit interaction risk. Atorvastatin and lovastatin similar. Pravastatin and rosuvastatin are less affected. Other grapefruit-affected drugs: amlodipine (and other CCBs to varying degrees), some immunosuppressants (cyclosporine, tacrolimus), certain antiarrhythmics (amiodarone), sildenafil, some psych meds.",
        onWrong: "Simvastatin (and lovastatin, atorvastatin) — strong CYP3A4 interactions. Pravastatin and rosuvastatin minimal grapefruit issue. Other grapefruit drugs: amlodipine, cyclosporine, tacrolimus, amiodarone, sildenafil."
    )

    static let day33_drowsiness = RimrockQuestion(
        id: "D33_LABEL_DROWSINESS",
        domain: .patientSafety,
        topic: "AUX_DROWSINESS",
        prompt: "Which medication should be labeled with a \"MAY CAUSE DROWSINESS\" warning?",
        options: ["Diphenhydramine", "Loratadine", "Cetirizine", "Fexofenadine"],
        correctAnswer: "Diphenhydramine",
        onCorrect: "Diphenhydramine — first-generation antihistamine, sedating. Other sedating drugs: opioids, benzos, gabapentin, pregabalin, muscle relaxants, many psych meds, scopolamine. Second-generation antihistamines (loratadine, cetirizine, fexofenadine, desloratadine, levocetirizine) are non-sedating or minimally so — fexofenadine the cleanest, cetirizine slightly more drowsy than the others.",
        onWrong: "Diphenhydramine — first-gen, sedating. Loratadine, cetirizine, fexofenadine, desloratadine — second-gen, non-sedating (fexofenadine cleanest). Sedation also relevant for opioids, benzos, gabapentinoids, muscle relaxants."
    )

    static let day33_avoidSunExposure = RimrockQuestion(
        id: "D33_LABEL_SUN",
        domain: .patientSafety,
        topic: "AUX_PHOTOSENSITIVITY",
        prompt: "Which medication should carry a \"AVOID PROLONGED SUN EXPOSURE\" warning (photosensitivity)?",
        options: ["Doxycycline", "Acetaminophen", "Loratadine", "Lisinopril"],
        correctAnswer: "Doxycycline",
        onCorrect: "Doxycycline — significant photosensitivity. Other photosensitizing drugs: most fluoroquinolones (especially ciprofloxacin), sulfonamides (Bactrim), thiazide diuretics (HCTZ), amiodarone, retinoids (isotretinoin), some chemo agents, voriconazole, St. John's wort. Counsel: sunscreen, protective clothing, especially at high altitude.",
        onWrong: "Doxycycline — strong photosensitizer. Also: fluoroquinolones (especially cipro), sulfonamides, thiazides (HCTZ), amiodarone, retinoids, voriconazole, St. John's wort. Sunscreen + protective clothing + altitude awareness."
    )

    static let day33_avoidAlcohol = RimrockQuestion(
        id: "D33_LABEL_ALCOHOL",
        domain: .patientSafety,
        topic: "AUX_ALCOHOL",
        prompt: "Which medication carries the strongest \"AVOID ALCOHOL\" warning due to disulfiram-like reaction?",
        options: ["Metronidazole", "Lisinopril", "Acetaminophen", "Atorvastatin"],
        correctAnswer: "Metronidazole",
        onCorrect: "Metronidazole — disulfiram-like reaction (flushing, nausea, vomiting, headache, tachycardia) when combined with alcohol; even small amounts including alcohol-containing mouthwash. Avoid for the duration of treatment plus 48-72 hours after. Tinidazole same. Other significant alcohol issues: opioids/benzos (CNS depression), warfarin (variable effects), TCAs, MAOIs, acetaminophen (hepatotoxicity in heavy drinkers).",
        onWrong: "Metronidazole — disulfiram-like reaction with alcohol. Avoid alcohol DURING treatment + 48-72 hours after. Includes alcohol-containing products (mouthwash, cough syrups). Tinidazole same."
    )

    static let day33_avoidDairy = RimrockQuestion(
        id: "D33_LABEL_DAIRY",
        domain: .patientSafety,
        topic: "AUX_DAIRY_CATIONS",
        prompt: "Which medication should be separated from dairy products and antacids?",
        options: ["Tetracycline", "Penicillin V", "Metformin", "Levothyroxine"],
        correctAnswer: "Tetracycline",
        onCorrect: "Tetracycline — chelates with calcium, magnesium, iron, aluminum, zinc — significantly reduces absorption. Separate by 2-3 hours from dairy, antacids, multivitamins with minerals, iron supplements. Same for fluoroquinolones — separate from cations by 2 hours before / 6 hours after. Bisphosphonates also affected by cations.",
        onWrong: "Tetracycline — cation chelation. Separate from dairy, antacids, calcium, iron, multivitamins. Same applies to fluoroquinolones (-floxacin) and bisphosphonates (-dronate)."
    )

    static let day33_shakeWell = RimrockQuestion(
        id: "D33_LABEL_SHAKE",
        domain: .patientSafety,
        topic: "AUX_SHAKE_WELL",
        prompt: "Which formulation requires a \"SHAKE WELL BEFORE USE\" auxiliary label?",
        options: ["Suspensions and emulsions", "Tablets", "Capsules", "Solutions"],
        correctAnswer: "Suspensions and emulsions",
        onCorrect: "Suspensions and emulsions — undissolved particles or dispersed phases settle. Without shaking, doses are inconsistent — first dose under-medicated, last dose over-medicated. Solutions are homogeneous; no shake needed. Examples: amoxicillin suspension, ibuprofen suspension, MDI inhalers (most), insulin NPH (cloudy — gentle roll, not shake, to avoid foaming).",
        onWrong: "Suspensions and emulsions — particles/phases settle. Solutions don't. Shake to redistribute the active drug evenly across doses. Insulin NPH (cloudy) is rolled gently, not shaken, to avoid foaming."
    )
}

// MARK: - Day 34 Questions — Safety Atlas

extension RimrockQuestion {

    static let day34_ismpHighAlertList = RimrockQuestion(
        id: "D34_ISMP_HIGH_ALERT",
        domain: .patientSafety,
        topic: "ISMP_HIGH_ALERT",
        prompt: "Which group of drugs is on the ISMP high-alert medications list for outpatient pharmacy?",
        options: [
            "Anticoagulants, insulin, opioids, methotrexate (oral, weekly), chemotherapy",
            "All antibiotics",
            "All over-the-counter pain relievers",
            "All antihistamines"
        ],
        correctAnswer: "Anticoagulants, insulin, opioids, methotrexate (oral, weekly), chemotherapy",
        onCorrect: "Outpatient ISMP high-alert: anticoagulants (warfarin, DOACs, heparin), insulin, opioids (especially long-acting and methadone), methotrexate (oral weekly — accidental daily dosing has killed people), chemotherapy, hypoglycemic agents, immunosuppressants. Same drugs cause most harm; same drugs need most safety guardrails.",
        onWrong: "Anticoagulants, insulin, opioids, methotrexate (oral weekly!), chemo, hypoglycemics, immunosuppressants. ISMP outpatient list. The drugs that hurt most patients when used in error."
    )

    static let day34_ismpDoNotUseTrailingZero = RimrockQuestion(
        id: "D34_TRAILING_ZERO",
        domain: .patientSafety,
        topic: "ISMP_TRAILING_ZERO",
        prompt: "Which prescription notation is on ISMP's do-not-use list?",
        options: [
            "1.0 mg (trailing zero) — risk of misreading as 10 mg",
            "0.5 mg",
            "0.5 mL",
            "1 mg"
        ],
        correctAnswer: "1.0 mg (trailing zero) — risk of misreading as 10 mg",
        onCorrect: "Trailing zeros after decimals — \"1.0 mg\" can be misread as \"10 mg\" if the decimal is missed. Always write 1 mg without the trailing zero. Conversely, naked decimals — \".5 mg\" should be \"0.5 mg\" — leading zeros prevent misreading as 5 mg. Other ISMP do-not-use: U for units, IU for international units, QD for daily, MS or MSO4 for morphine, etc.",
        onWrong: "Trailing zeros after decimals (\"1.0\" → \"10\"). Naked decimals (\".5\" → \"5\"). Always use leading zeros, never trailing zeros. Other do-not-use: U (units), IU, QD, MS/MSO4. ISMP and Joint Commission both maintain the lists."
    )

    static let day34_beersBenzoElderly = RimrockQuestion(
        id: "D34_BEERS_BENZO",
        domain: .patientSafety,
        topic: "BEERS_BENZO",
        prompt: "Per Beers Criteria, benzodiazepines in adults over 65 are:",
        options: [
            "Generally avoided due to fall, cognitive, and dependence risks",
            "Recommended first-line for anxiety",
            "Safer than in younger adults",
            "Required for sleep disorders"
        ],
        correctAnswer: "Generally avoided due to fall, cognitive, and dependence risks",
        onCorrect: "Generally avoided. Beers flags benzos for elderly — sedation, cognitive impairment, falls, dependence. Same with non-benzo Z-drugs (zolpidem, zaleplon, eszopiclone). Other Beers high-flag categories in older adults: first-generation antihistamines (diphenhydramine), TCAs, anticholinergic stacking, NSAIDs in CKD, sliding-scale insulin, glyburide, muscle relaxants, long-acting sulfonylureas.",
        onWrong: "Beers list — generally avoid in 65+. Sedation, cognition, falls, dependence. Same for Z-drugs. Other Beers flags: first-gen antihistamines, TCAs, NSAIDs in CKD, glyburide, muscle relaxants, sliding-scale insulin."
    )

    static let day34_lasaPairCelexa = RimrockQuestion(
        id: "D34_LASA_CELEXA",
        domain: .patientSafety,
        topic: "LASA_PAIR",
        prompt: "Which is a documented look-alike sound-alike pair?",
        options: [
            "Celebrex and Celexa",
            "Lisinopril and atorvastatin",
            "Albuterol and amoxicillin",
            "Metformin and acetaminophen"
        ],
        correctAnswer: "Celebrex and Celexa",
        onCorrect: "Celebrex (celecoxib, COX-2 NSAID) and Celexa (citalopram, SSRI) — three syllables each, similar spelling. Add Cerebyx (fosphenytoin, anti-seizure) for the trio of doom. ISMP maintains a comprehensive LASA list. Tall man lettering (CelEBREX vs CelEXA) is a mitigation. Always read twice.",
        onWrong: "Celebrex and Celexa — three of the worst LASA. Plus Cerebyx (anti-seizure). Tall man lettering: CelEBREX vs CelEXA. ISMP LASA list is the comprehensive reference."
    )

    static let day34_lasaPairHumalogHumulin = RimrockQuestion(
        id: "D34_LASA_HUMA",
        domain: .patientSafety,
        topic: "LASA_INSULIN",
        prompt: "Which insulin pair has been a frequent LASA cause of medication error?",
        options: [
            "Humalog (rapid-acting lispro) and Humulin (regular or NPH)",
            "Lantus and Levemir",
            "Tresiba and Toujeo",
            "Apidra and Trulicity"
        ],
        correctAnswer: "Humalog (rapid-acting lispro) and Humulin (regular or NPH)",
        onCorrect: "Humalog (rapid-acting insulin lispro) vs Humulin (which can be regular short-acting OR NPH intermediate). Confused names + confused timing = severe hypoglycemia or hyperglycemia. Tall man lettering: HumaLOG vs HumuLIN. Insulin is on every high-alert list; insulin LASA pairs are a major cause of harm.",
        onWrong: "HumaLOG (lispro, rapid) vs HumuLIN (regular short or NPH intermediate). Tall man lettering. Critical separation in pharmacy storage and verification. Insulin = every high-alert list."
    )

    static let day34_lasaPairKlonopinClonidine = RimrockQuestion(
        id: "D34_LASA_KLON",
        domain: .patientSafety,
        topic: "LASA_KLONOPIN_CLONIDINE",
        prompt: "Which LASA pair includes a controlled substance and a non-controlled antihypertensive?",
        options: [
            "Klonopin (clonazepam) and clonidine",
            "Adderall and Allegra",
            "Vicodin and Vicoprofen",
            "Concerta and Strattera"
        ],
        correctAnswer: "Klonopin (clonazepam) and clonidine",
        onCorrect: "Klonopin (clonazepam — C-IV benzo) vs clonidine (alpha-2 agonist, non-controlled, used for hypertension and ADHD). Names start similarly. Confusion between a controlled substance and a non-controlled drug carries DEA documentation consequences as well as patient safety. Always read twice; verify the indication makes sense.",
        onWrong: "Klonopin (clonazepam, benzo, C-IV) vs clonidine (non-controlled antihypertensive). Confusion crosses controlled/non-controlled boundary. Read twice; verify the indication makes sense for the drug."
    )

    static let day34_tallManLettering = RimrockQuestion(
        id: "D34_TALL_MAN",
        domain: .patientSafety,
        topic: "TALL_MAN_LETTERING",
        prompt: "Tall man lettering is used to:",
        options: [
            "Highlight the differing parts of look-alike drug names (e.g., hydrOXYzine vs hydrALAzine)",
            "Indicate brand-name medications",
            "Indicate over-the-counter medications",
            "Mark Schedule II controlled substances"
        ],
        correctAnswer: "Highlight the differing parts of look-alike drug names (e.g., hydrOXYzine vs hydrALAzine)",
        onCorrect: "Tall man lettering — capitalize the differing parts of LASA pairs to draw attention. hydrOXYzine vs hydrALAzine. CelEBREX vs CelEXA. predniSONE vs prednisoLONE. ISMP and FDA maintain official tall-man lists for hundreds of pairs. Pharmacy software, label printers, and shelf labels should all use them where applicable.",
        onWrong: "Tall man lettering capitalizes the differing portions of LASA names: hydrOXYzine vs hydrALAzine, CelEBREX vs CelEXA, predniSONE vs prednisoLONE. ISMP/FDA maintain official lists."
    )

    static let day34_blackBoxBeers = RimrockQuestion(
        id: "D34_BEERS_NSAID",
        domain: .patientSafety,
        topic: "BEERS_NSAIDS_KIDNEY",
        prompt: "Per Beers Criteria, NSAIDs in adults over 65 should be avoided in:",
        options: [
            "Patients with chronic kidney disease, heart failure, or on anticoagulants",
            "All patients regardless of conditions",
            "Only patients with diabetes",
            "Only patients with hypertension"
        ],
        correctAnswer: "Patients with chronic kidney disease, heart failure, or on anticoagulants",
        onCorrect: "NSAIDs in CKD, heart failure, or anticoagulants — Beers flags. NSAIDs reduce renal perfusion (worse in CKD or HF), inhibit platelets and damage GI mucosa (worse with anticoagulants). Acetaminophen up to 3 g/day is generally safer for elderly. Topical NSAIDs (diclofenac gel) have less systemic effect.",
        onWrong: "Avoid NSAIDs in CKD, HF, anticoagulant users — Beers flag. Renal perfusion + platelet/GI effects. Acetaminophen ≤3 g/day generally safer. Topical NSAIDs less systemic exposure."
    )
}

// MARK: - Day 35 Questions — Final Mock

extension RimrockQuestion {

    static let day35_mock1 = RimrockQuestion(
        id: "D35_MOCK_01",
        domain: .medications,
        topic: "MOCK_BRAND_GENERIC",
        prompt: "Brand name for atorvastatin?",
        options: ["Lipitor", "Crestor", "Zocor", "Pravachol"],
        correctAnswer: "Lipitor",
        onCorrect: "Lipitor. Crestor = rosuvastatin; Zocor = simvastatin; Pravachol = pravastatin. Memorize the brand-generic pairings — easy points, the PTCB asks at least a half dozen.",
        onWrong: "Lipitor = atorvastatin. Crestor = rosuvastatin; Zocor = simvastatin; Pravachol = pravastatin. Brand-generic recall is reflex points."
    )

    static let day35_mock2 = RimrockQuestion(
        id: "D35_MOCK_02",
        domain: .federalRequirements,
        topic: "MOCK_SCHEDULE",
        prompt: "Which is the schedule for tramadol?",
        options: ["Schedule IV", "Schedule II", "Schedule III", "Schedule V"],
        correctAnswer: "Schedule IV",
        onCorrect: "Tramadol — Schedule IV since 2014. Limited refills (up to 5 within 6 months), prescription valid 6 months. Partial mu-agonist with SNRI activity — serotonin syndrome risk with serotonergic combos. C-IVs also include benzodiazepines, zolpidem, eszopiclone, modafinil.",
        onWrong: "C-IV. Tramadol joined the C-IV list in 2014. Partial-agonist + SNRI = serotonin syndrome risk."
    )

    static let day35_mock3 = RimrockQuestion(
        id: "D35_MOCK_03",
        domain: .patientSafety,
        topic: "MOCK_HIGH_ALERT",
        prompt: "Which is on the ISMP high-alert list?",
        options: ["Methotrexate (oral, weekly)", "Loratadine", "Acetaminophen", "Calcium carbonate"],
        correctAnswer: "Methotrexate (oral, weekly)",
        onCorrect: "Oral methotrexate, weekly. Patients have died from accidental daily dosing — \"once weekly\" is the safety phrase. Always counsel on the day of the week, never \"daily.\" The PTCB tests this specifically.",
        onWrong: "Oral methotrexate — weekly dosing. Daily dosing has killed people. Always anchor to a specific day of the week. ISMP high-alert."
    )

    static let day35_mock4 = RimrockQuestion(
        id: "D35_MOCK_04",
        domain: .orderEntry,
        topic: "MOCK_NDC",
        prompt: "An 11-digit NDC has which segment structure?",
        options: ["Labeler-Product-Package (5-4-2)", "Drug-Form-Strength", "Manufacturer-Lot-Expiration", "BIN-PCN-Group"],
        correctAnswer: "Labeler-Product-Package (5-4-2)",
        onCorrect: "Labeler-Product-Package, 5-4-2 in 11-digit format. Old 10-digit NDCs (4-4-2, 5-3-2, 5-4-1) get padded by adding a leading zero to the short segment.",
        onWrong: "Labeler-Product-Package, 5-4-2 padded format."
    )

    static let day35_mock5 = RimrockQuestion(
        id: "D35_MOCK_05",
        domain: .medications,
        topic: "MOCK_DRUG_INTERACTION",
        prompt: "A patient on warfarin starts trimethoprim-sulfamethoxazole. The concern is:",
        options: [
            "Bactrim significantly raises INR via CYP inhibition",
            "Bactrim lowers INR",
            "No interaction",
            "Bleeding only at high doses"
        ],
        correctAnswer: "Bactrim significantly raises INR via CYP inhibition",
        onCorrect: "Bactrim raises INR via CYP inhibition — risk of major bleed. Other classic warfarin interactions: amiodarone, fluconazole, metronidazole (raise INR); rifampin (lowers INR). Always check before dispensing.",
        onWrong: "Bactrim raises INR. The classic warfarin DDIs: amiodarone, Bactrim, fluconazole, metronidazole = raise. Rifampin = lowers."
    )

    static let day35_mock6 = RimrockQuestion(
        id: "D35_MOCK_06",
        domain: .federalRequirements,
        topic: "MOCK_HIPAA",
        prompt: "Under HIPAA, which is permitted without separate authorization?",
        options: [
            "Refill processing under TPO (treatment, payment, operations)",
            "Releasing medication list to a friend who calls",
            "Discussing treatment with a neighbor at the patient's request without documentation",
            "Sharing PHI for marketing"
        ],
        correctAnswer: "Refill processing under TPO (treatment, payment, operations)",
        onCorrect: "TPO. Treatment, payment, operations — pharmacy's standard activities don't require separate authorization. Friend disclosure WITHOUT authorization, marketing without authorization, undocumented designations all require explicit signed authorization.",
        onWrong: "TPO permits standard pharmacy activities. Other disclosures require written authorization."
    )

    static let day35_mock7 = RimrockQuestion(
        id: "D35_MOCK_07",
        domain: .patientSafety,
        topic: "MOCK_LASA",
        prompt: "Patient on hydroxyzine 50 mg gets a new prescription for hydralazine 25 mg from another doctor. Which is true?",
        options: [
            "Different drugs (antihistamine vs antihypertensive); both can be appropriate but require coordination",
            "Same drug, different strength",
            "Cannot be filled simultaneously",
            "Hydralazine is a brand name for hydroxyzine"
        ],
        correctAnswer: "Different drugs (antihistamine vs antihypertensive); both can be appropriate but require coordination",
        onCorrect: "Different drugs. Hydroxyzine = antihistamine (anxiety/itch). Hydralazine = vasodilator (BP). Tall man lettering: hydrALAzine vs hydrOXYzine. Coordination via prescriber call ensures both prescribers know about both drugs.",
        onWrong: "Different drugs. hydrOXYzine = antihistamine; hydrALAzine = vasodilator. Tall man lettering. Coordinate via prescriber when both are present."
    )

    static let day35_mock8 = RimrockQuestion(
        id: "D35_MOCK_08",
        domain: .orderEntry,
        topic: "MOCK_DAYS_SUPPLY",
        prompt: "Sig: 1 tablet PO BID. Quantity dispensed: 60. Days supply?",
        options: ["30 days", "60 days", "15 days", "Cannot determine"],
        correctAnswer: "30 days",
        onCorrect: "60 ÷ 2 (per day) = 30 days. Insurance billing depends on accurate days supply. Refill timing, vacation overrides, MTM all reference it.",
        onWrong: "30 days. Quantity / daily quantity. Always check the sig. Days supply errors are billing AND patient safety."
    )

    static let day35_mock9 = RimrockQuestion(
        id: "D35_MOCK_09",
        domain: .federalRequirements,
        topic: "MOCK_FORM_222",
        prompt: "DEA Form 222 is required for ordering:",
        options: ["Schedule II only", "Schedule II-V", "All controlled substances and OTC behind-the-counter", "Schedule III-V"],
        correctAnswer: "Schedule II only",
        onCorrect: "Schedule II only. Other schedules use the standard wholesaler invoice. CSOS is the electronic equivalent of Form 222 for C-II ordering.",
        onWrong: "C-II only. Other schedules on regular invoice. CSOS = electronic Form 222."
    )

    static let day35_mock10 = RimrockQuestion(
        id: "D35_MOCK_10",
        domain: .medications,
        topic: "MOCK_NTI",
        prompt: "Which is on the FDA's narrow therapeutic index list?",
        options: ["Warfarin", "Acetaminophen", "Loratadine", "Ibuprofen"],
        correctAnswer: "Warfarin",
        onCorrect: "Warfarin — small dose change has big effect. NTI list also includes: levothyroxine, lithium, digoxin, phenytoin, carbamazepine, theophylline, cyclosporine, tacrolimus. Generic substitution requires extra care; once stable on a manufacturer, stay there.",
        onWrong: "Warfarin. NTI list: warfarin, levothyroxine, lithium, digoxin, phenytoin, carbamazepine, theophylline, cyclosporine, tacrolimus. Stay-on-same-manufacturer principle."
    )

    static let day35_mock11 = RimrockQuestion(
        id: "D35_MOCK_11",
        domain: .patientSafety,
        topic: "MOCK_BEERS",
        prompt: "Beers Criteria flags which of the following for elderly patients?",
        options: [
            "First-generation antihistamines (diphenhydramine)",
            "Levothyroxine",
            "Loratadine",
            "Acetaminophen at usual doses"
        ],
        correctAnswer: "First-generation antihistamines (diphenhydramine)",
        onCorrect: "First-gen antihistamines (diphenhydramine, hydroxyzine, chlorpheniramine) — anticholinergic burden, sedation, fall risk. Other Beers flags in elderly: benzos, glyburide, NSAIDs in CKD, sliding-scale insulin, muscle relaxants, TCAs, anticholinergic stacking generally.",
        onWrong: "First-gen antihistamines (diphenhydramine). Anticholinergic burden + sedation + falls. Beers list — pause and reconsider in adults 65+."
    )

    static let day35_mock12 = RimrockQuestion(
        id: "D35_MOCK_12",
        domain: .orderEntry,
        topic: "MOCK_INSULIN_DAYS",
        prompt: "Insulin glargine 100 units/mL, 10 mL vial, 25 units sub-Q daily. Days supply?",
        options: ["40 days", "10 days", "100 days", "25 days"],
        correctAnswer: "40 days",
        onCorrect: "10 mL × 100 units/mL = 1000 units. 1000 ÷ 25 = 40 days. Insulin days supply is total units divided by daily units — and is one of the most commonly mis-billed quantities in retail.",
        onWrong: "1000 units / 25 daily = 40 days. Insulin = total units / daily units. Common billing error."
    )
}
