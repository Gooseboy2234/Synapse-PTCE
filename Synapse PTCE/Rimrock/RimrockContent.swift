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

            .scene("You tidy. In the back, on the shelf above the deionized water dispenser, there's a coffee mug. White, generic, four-pack-from-the-grocery kind. Someone has scratched a black X on the side with a permanent marker — clean, deliberate, the way techs at the chain pharmacies mark an open stock bottle so anyone walking past knows: this one's already been broken into, use it before you crack a sealed one."),

            .object(
                name: "A mug",
                description: "Big black X on the side. Pharmacy-tech shorthand for open stock — the previous tech kept the habit even on her own coffee mug.",
                logEntry: RimrockLogEntry(
                    title: "A mug, in the back",
                    body: "Black X marked on the side, the open-stock-bottle convention. The previous tech kept the habit on her personal mug."
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
                        label: "The W on the note. The X on her mug.",
                        tone: .press,
                        rapportDelta: 0,
                        response: [
                            .dialogue(speaker: .mara, lines: [
                                "...Yeah. The X on the mug — that's a chain-pharmacy habit, marking open stock so the next tech doesn't crack a sealed bottle. Wren came over from a CVS in Gillette and never lost it. The W on the note's the giveaway. Wren Bishop. She was the tech here before you, about a year. She's not here anymore."
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


// MARK: - Question Content
//
// Per-day question banks moved to RimrockQuestions_Day*.swift.
