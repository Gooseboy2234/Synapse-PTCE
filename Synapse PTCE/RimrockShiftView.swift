//
//  RimrockShiftView.swift
//  Synapse PTCE — Rimrock Pharmacy
//
//  Plays a single shift end-to-end. Renders the shift's beats as a scrolling
//  transcript: prior beats stay visible (so the player can re-read what just
//  happened) and the active beat shows interaction widgets (continue button,
//  question options, choice buttons, name entry).
//

import SwiftUI

#if os(iOS)
import UIKit
#endif

// MARK: - Focus Management (tvOS)

enum RimrockFocusField: Hashable {
    case nameEntry
    case questionOption(String)
    case choiceOption(Int)
    case continueButton
    case submitButton
    case dismissButton
}

// MARK: - Platform-Specific Sizing

extension RimrockShiftView {
    /// Returns a font size scaled for 10-foot viewing on tvOS.
    ///
    /// Multiplies by ~1.8× AND clamps to a 20pt minimum so micro-labels
    /// (9–11pt iPhone captions) bump up to Apple's recommended tvOS body
    /// floor instead of staying squint-sized. Apple's HIG recommends ≥21pt
    /// for body text on Apple TV; this helper lands right around that band.
    private func fontSize(_ base: CGFloat) -> CGFloat {
        #if os(tvOS)
        return max(base * 1.8, 20)
        #else
        return base
        #endif
    }

    /// Returns spacing adjusted for platform — larger on tvOS.
    private func spacing(_ base: CGFloat) -> CGFloat {
        #if os(tvOS)
        return base * 1.5
        #else
        return base
        #endif
    }
}

struct RimrockShiftView: View {

    // MARK: - State

    @State private var engine: RimrockEngine

    // Name entry
    @State private var nameInput: String = ""

    // Question state — keyed by question.id so prior beats keep their resolved state.
    @State private var questionAnswers: [String: String] = [:]
    @State private var questionResults: [String: Bool] = [:]
    @State private var selectedAnswerForCurrent: String? = nil

    // tvOS focus management
    @FocusState private var focusedField: RimrockFocusField?

    /// Highest day number the player has reached the END of. Drives Today's Path
    /// recommendations on the home screen — bumped when this view's shiftEnd
    /// beat is rendered as current.
    @AppStorage("rimrock_last_shift_played") private var lastShiftPlayed: Int = 0

    /// Consecutive calendar days the player has completed at least one shift.
    /// Resets when a calendar day is skipped. Drives the streak readout in
    /// the tvOS top bar and the iOS home subtitle.
    @AppStorage("rimrock_streak_count") private var streakCount: Int = 0
    @AppStorage("rimrock_streak_last_date") private var streakLastDateRaw: Double = 0

    /// One-time-fired flag for each bank-coverage milestone. Once a milestone
    /// shows the player a celebration line, it never re-fires — even if the
    /// player drops below the threshold (which won't happen, but still).
    @AppStorage("rimrock_milestone_25_fired")  private var milestone25Fired:  Bool = false
    @AppStorage("rimrock_milestone_50_fired")  private var milestone50Fired:  Bool = false
    @AppStorage("rimrock_milestone_75_fired")  private var milestone75Fired:  Bool = false
    @AppStorage("rimrock_milestone_100_fired") private var milestone100Fired: Bool = false

    /// The most-recently-crossed milestone, set in `shiftCompleteCard.onAppear`
    /// and rendered as a celebratory banner at the top of that card.
    @State private var firedMilestone: CoverageMilestone? = nil

    enum CoverageMilestone {
        case quarter, half, threeQuarters, full

        var headline: String {
            switch self {
            case .quarter:       return "QUARTER OF THE BANK VERIFIED"
            case .half:          return "HALF THE BANK VERIFIED"
            case .threeQuarters: return "THREE-QUARTERS VERIFIED"
            case .full:          return "FULL BANK VERIFIED · PTCB-READY"
            }
        }

        var maraLine: String {
            switch self {
            case .quarter:
                return "Quarter of the bank's in your head now. You're past the part where most techs quit. Keep going."
            case .half:
                return "Halfway through every question in the place. Things are clicking — you can feel that, right? Keep going."
            case .threeQuarters:
                return "Three-quarters verified. The shape of this test should feel familiar by now. The last quarter teaches itself."
            case .full:
                return "Every question in this place, twice over. You've seen everything the PTCB can throw at you. Schedule the test. Show up rested. You're ready."
            }
        }
    }

    let onDismiss: () -> Void

    /// Optional reference to the main game engine. When present, Rimrock answers
    /// feed the concept-level mastery tracker (spaced repetition).
    let gameEngine: GameEngine?

    // MARK: - Palette (day-driven via RimrockAtmosphere)

    private var palette: RimrockAtmosphere.Palette {
        RimrockAtmosphere.palette(for: engine.shift.dayNumber)
    }

    private var bg:          Color { palette.skyMid }
    private var panel:       Color { palette.panel }
    private var maraAccent:  Color { palette.accent }
    private var sceneText:   Color { palette.sceneText }
    private var divider:     Color { palette.divider }
    private var paper:       Color { palette.paperBase }
    private var paperWarm:   Color { palette.paperWarm }
    private var ink:         Color { palette.ink }
    private var label:       Color { palette.label }

    init(shift: RimrockShift, gameEngine: GameEngine? = nil, onDismiss: @escaping () -> Void) {
        _engine = State(initialValue: RimrockEngine(shift: shift))
        self.gameEngine = gameEngine
        self.onDismiss = onDismiss
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            RimrockAtmosphere.skyBackground(for: engine.shift.dayNumber)

            VStack(spacing: 0) {
                topChrome
                Divider().background(divider)

                ScrollViewReader { proxy in
                    ScrollView {
                        // tvOS centres a readable 1100pt-wide column; iOS keeps
                        // full-width.
                        HStack(spacing: 0) {
                            #if os(tvOS)
                            Spacer(minLength: 0)
                            #endif

                            VStack(alignment: .leading, spacing: spacing(22)) {
                                let upper = min(engine.currentBeatIndex, engine.beats.count - 1)
                                if upper >= 0 {
                                    ForEach(0...upper, id: \.self) { idx in
                                        beatView(beat: engine.beats[idx],
                                                 isCurrent: idx == engine.currentBeatIndex && !engine.isFinished)
                                            .id(idx)
                                            .transition(
                                                .asymmetric(
                                                    insertion: .opacity.combined(with: .move(edge: .bottom)),
                                                    removal: .opacity
                                                )
                                            )
                                    }
                                }

                                if engine.isFinished {
                                    shiftCompleteCard
                                        .padding(.top, 12)
                                        .id("COMPLETE")
                                        .transition(.opacity.combined(with: .scale(scale: 0.96)))
                                }

                                Color.clear.frame(height: 8).id("BOTTOM")
                            }
                            .padding(.horizontal, spacing(22))
                            .padding(.vertical, spacing(22))
                            #if os(tvOS)
                            .frame(maxWidth: 1100, alignment: .leading)
                            #endif
                            .animation(.easeOut(duration: 0.32), value: engine.currentBeatIndex)
                            .animation(.easeOut(duration: 0.40), value: engine.isFinished)

                            #if os(tvOS)
                            Spacer(minLength: 0)
                            #endif
                        }
                    }
                    .onChange(of: engine.currentBeatIndex) { _, _ in
                        // Reset transient question selection when advancing.
                        selectedAnswerForCurrent = nil
                        // Light haptic on advance — feels like a page turn.
                        #if os(iOS)
                        let gen = UIImpactFeedbackGenerator(style: .soft)
                        gen.impactOccurred(intensity: 0.55)
                        #endif
                        withAnimation(.easeOut(duration: 0.30)) {
                            proxy.scrollTo("BOTTOM", anchor: .bottom)
                        }
                        #if os(tvOS)
                        // On tvOS, drop focus onto the natural next action so
                        // the user doesn't have to hunt with the remote.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            focusedField = autoFocusTarget()
                        }
                        #endif
                    }
                    #if os(tvOS)
                    .onAppear {
                        // Initial focus when the shift view first presents.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
                            focusedField = autoFocusTarget()
                        }
                    }
                    #endif
                }
            }
        }
        #if os(tvOS)
        .onPlayPauseCommand {
            // Allow Play/Pause button to advance on passive beats
            if let currentBeat = engine.beats[safe: engine.currentBeatIndex],
               !engine.isFinished,
               canPlayPauseAdvance(beat: currentBeat) {
                engine.advance()
            }
        }
        .onExitCommand {
            // Menu button (back) dismisses the shift
            onDismiss()
        }
        #endif
    }
    
    #if os(tvOS)
    /// Determines if Play/Pause should advance for this beat type.
    private func canPlayPauseAdvance(beat: RimrockBeat) -> Bool {
        switch beat {
        case .scene, .dialogue, .prescription, .phoneCall, .object, .shiftEnd:
            return true  // Passive beats
        case .nameEntry, .choice:
            return false  // Active input required
        case .question(let q):
            return questionResults[q.id] != nil  // Only after answered
        case .ending:
            return false  // Has explicit buttons
        }
    }

    /// The focus target that the remote should land on whenever a new beat
    /// becomes the current one. Passive beats focus the CONTINUE button;
    /// questions focus the first option; choices focus the first choice;
    /// the name-entry beat focuses the text field.
    private func autoFocusTarget() -> RimrockFocusField? {
        guard let beat = engine.beats[safe: engine.currentBeatIndex], !engine.isFinished else {
            return .dismissButton
        }
        switch beat {
        case .scene, .dialogue, .prescription, .phoneCall, .object, .shiftEnd:
            return .continueButton
        case .nameEntry:
            return .nameEntry
        case .question(let q):
            if questionResults[q.id] != nil {
                return .continueButton
            }
            return q.options.first.map { .questionOption($0) }
        case .choice:
            return .choiceOption(0)
        case .ending:
            return .dismissButton
        }
    }
    #endif

    // MARK: - Top chrome

    private var topChrome: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("DAY \(engine.shift.dayNumber) · \(engine.shift.title.uppercased())")
                    .font(.system(size: fontSize(11), weight: .bold, design: .monospaced))
                    .foregroundColor(maraAccent.opacity(0.85))
                    .tracking(1.2)
                Text("\(engine.shift.dateLine), \(engine.shift.timeLine)")
                    .font(.system(size: fontSize(10), weight: .medium, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.6))
                Text(engine.shift.locationLine)
                    .font(.system(size: fontSize(10), weight: .medium, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.4))
            }
            Spacer()

            #if os(tvOS)
            // tvOS gets a Menu-button hint instead of a tappable X — the remote's
            // Menu button is the canonical "back" gesture; `.onExitCommand`
            // (above on the body) handles the actual dismiss.
            HStack(spacing: 8) {
                Image(systemName: "tv.and.hifispeaker.fill")
                    .font(.system(size: fontSize(11), weight: .bold))
                Text("MENU · BACK")
                    .font(.system(size: fontSize(11), weight: .heavy, design: .monospaced))
                    .tracking(1.4)
            }
            .foregroundColor(sceneText.opacity(0.55))
            .padding(.horizontal, 10).padding(.vertical, 5)
            .background(Color.black.opacity(0.30))
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(sceneText.opacity(0.25), lineWidth: 0.8))
            .cornerRadius(6)
            #else
            Button(action: onDismiss) {
                Image(systemName: "xmark")
                    .font(.system(size: fontSize(14), weight: .semibold))
                    .foregroundColor(sceneText.opacity(0.6))
                    .padding(8)
            }
            #endif
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
        .background(bg)
    }

    // MARK: - Beat dispatch

    @ViewBuilder
    private func beatView(beat: RimrockBeat, isCurrent: Bool) -> some View {
        switch beat {
        case .scene(let text):
            sceneBeatView(text: text, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) { engine.advance() }
        case .dialogue(let speaker, let lines):
            dialogueBeatView(speaker: speaker, lines: lines, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) { engine.advance() }
        case .nameEntry(let prompt):
            // Active input — no tap-to-advance
            nameEntryBeatView(prompt: prompt, isCurrent: isCurrent)
        case .prescription(let rx):
            prescriptionBeatView(rx: rx, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) { engine.advance() }
        case .question(let q):
            // Active input — no tap-to-advance until answered, then tap continues
            let answered = questionResults[q.id] != nil
            questionBeatView(question: q, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent && answered) { engine.advance() }
        case .phoneCall(let call):
            phoneCallBeatView(call: call, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) { engine.advance() }
        case .choice(let prompt, let choices):
            // Active input — player must pick
            choiceBeatView(prompt: prompt, choices: choices, isCurrent: isCurrent)
        case .object(let name, let description, let logEntry):
            objectBeatView(name: name, description: description, logEntry: logEntry, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) {
                    if let entry = logEntry { engine.record(entry) }
                    engine.advance()
                }
        case .ending(let ending):
            // Endings have their own buttons (Restart / Continue) — no tap-to-advance.
            endingBeatView(ending: ending, isCurrent: isCurrent)
        case .shiftEnd(let line):
            shiftEndBeatView(closingLine: line, isCurrent: isCurrent)
                .tapToAdvance(when: isCurrent) { engine.advance() }
        }
    }

    // MARK: - Scene

    private func sceneBeatView(text: String, isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(text)
                .font(.system(size: fontSize(16), weight: .regular, design: .serif))
                .foregroundColor(sceneText)
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)
            if isCurrent { continueButton }
        }
    }

    // MARK: - Dialogue

    private func dialogueBeatView(speaker: RimrockSpeaker, lines: [String], isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            // Speaker row
            HStack(spacing: 8) {
                if speaker.isRadio {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.system(size: fontSize(9), weight: .bold))
                        .foregroundColor(maraAccent)
                    Text("RADIO")
                        .font(.system(size: fontSize(9), weight: .bold, design: .monospaced))
                        .foregroundColor(maraAccent.opacity(0.7))
                        .tracking(1.5)
                }
                Text(speaker.displayLabel)
                    .font(.system(size: fontSize(11), weight: .heavy, design: .monospaced))
                    .foregroundColor(speakerColor(speaker))
                    .tracking(1.5)
                Spacer()
                if speaker.isRadio {
                    RadioSignalDot(color: maraAccent)
                }
            }

            // Subtle transmission divider for radio
            if speaker.isRadio {
                Rectangle()
                    .fill(LinearGradient(
                        colors: [maraAccent.opacity(0.45), maraAccent.opacity(0.05)],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(height: 0.5)
            }

            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(.system(size: fontSize(16), weight: .regular,
                                      design: speaker.isRadio ? .monospaced : .default))
                        .foregroundColor(speakerColor(speaker).opacity(0.95))
                        .lineSpacing(6)
                        .tracking(speaker.isRadio ? 0.3 : 0)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            if isCurrent { continueButton }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background {
            if speaker.isRadio {
                LinearGradient(
                    colors: [maraAccent.opacity(0.10), maraAccent.opacity(0.03)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            } else {
                Color.clear
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(speaker.isRadio ? maraAccent.opacity(0.30) : Color.clear, lineWidth: 1)
        )
    }

    private func speakerColor(_ speaker: RimrockSpeaker) -> Color {
        switch speaker {
        case .mara:     return maraAccent
        case .player:   return Color.white.opacity(0.92)
        case .narrator: return sceneText
        case .named:    return Color(red: 0.92, green: 0.86, blue: 0.60)
        }
    }

    // MARK: - Name entry

    private func nameEntryBeatView(prompt: String, isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            if !engine.playerName.isEmpty {
                HStack(spacing: 8) {
                    Image(systemName: "person.fill")
                        .font(.system(size: fontSize(11)))
                        .foregroundColor(sceneText.opacity(0.5))
                    Text("YOU SAID: \(engine.playerName.uppercased())")
                        .font(.system(size: fontSize(11), weight: .semibold, design: .monospaced))
                        .foregroundColor(sceneText.opacity(0.7))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.white.opacity(0.12), lineWidth: 1)
                )
                .cornerRadius(6)
            } else if isCurrent {
                VStack(alignment: .leading, spacing: 10) {
                    Text(prompt.uppercased())
                        .font(.system(size: fontSize(11), weight: .bold, design: .monospaced))
                        .foregroundColor(maraAccent.opacity(0.7))
                        .tracking(1.5)

                    HStack(spacing: 8) {
                        TextField("", text: $nameInput,
                                  prompt: Text("Your name").foregroundColor(sceneText.opacity(0.4)))
                            .font(.system(size: fontSize(16), weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                            #if os(iOS) || os(tvOS) || os(visionOS) || os(watchOS)
                            .textInputAutocapitalization(.words)
                            #endif
                            #if os(iOS) || os(tvOS) || os(visionOS) || os(watchOS)
                            .submitLabel(.done)
                            #endif
                            .onSubmit { submitName() }
                            #if os(tvOS)
                            .focused($focusedField, equals: .nameEntry)
                            #endif
                            .padding(12)
                            .background(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(maraAccent.opacity(0.4), lineWidth: 1)
                            )
                            .cornerRadius(6)

                        Button(action: submitName) {
                            Text("OK")
                                .font(.system(size: fontSize(12), weight: .bold, design: .monospaced))
                                .foregroundColor(nameInput.trimmingCharacters(in: .whitespaces).isEmpty
                                                 ? sceneText.opacity(0.4) : .black)
                                .padding(.horizontal, 18)
                                .padding(.vertical, 12)
                                .background(nameInput.trimmingCharacters(in: .whitespaces).isEmpty
                                            ? Color.clear : maraAccent)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(maraAccent.opacity(0.5), lineWidth: 1)
                                )
                                .cornerRadius(6)
                        }
                        #if os(tvOS)
                        .buttonStyle(.plain)
                        #endif
                        .disabled(nameInput.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                    #if os(tvOS)
                    .onAppear { focusedField = .nameEntry }
                    #endif
                }
            }
        }
    }

    private func submitName() {
        let trimmed = nameInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        engine.setPlayerName(trimmed)
        engine.advance()
    }

    // MARK: - Prescription

    private func prescriptionBeatView(rx: RimrockPrescription, isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let note = rx.physicalNote {
                Text(note)
                    .font(.system(size: fontSize(14), weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(sceneText.opacity(0.85))
                    .lineSpacing(5)
                    .fixedSize(horizontal: false, vertical: true)
            }

            VStack(alignment: .leading, spacing: 0) {
                // Header band — warm vintage feel
                HStack(spacing: 10) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: fontSize(14)))
                        .foregroundColor(ink.opacity(0.45))
                    VStack(alignment: .leading, spacing: 1) {
                        Text("RIMROCK PHARMACY")
                            .font(.system(size: fontSize(10), weight: .heavy, design: .monospaced))
                            .tracking(1.4)
                            .foregroundColor(ink)
                        Text("Buffalo, Wyoming  ·  Rx #\(String(format: "%07d", abs(rx.patientName.hashValue) % 9_999_999))")
                            .font(.system(size: fontSize(8), design: .monospaced))
                            .foregroundColor(ink.opacity(0.55))
                    }
                    Spacer()
                    Text("PRESCRIPTION")
                        .font(.system(size: fontSize(8), weight: .bold, design: .monospaced))
                        .tracking(1.5)
                        .foregroundColor(ink.opacity(0.55))
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 11)
                .background(
                    LinearGradient(
                        colors: [paperWarm, paperWarm.opacity(0.85)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                Rectangle().fill(ink.opacity(0.18)).frame(height: 0.8)

                // Body
                VStack(alignment: .leading, spacing: 10) {
                    rxRow(label: "PATIENT", value: "\(rx.patientName)   ·   DOB \(rx.patientDOB)")
                    rxRow(label: "PRESCRIBER", value: rx.prescriberName)

                    Rectangle().fill(ink.opacity(0.10)).frame(height: 0.5)

                    HStack(alignment: .top, spacing: 12) {
                        Text("℞")
                            .font(.system(size: fontSize(22), weight: .bold, design: .serif))
                            .italic()
                            .foregroundColor(ink.opacity(0.85))
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(rx.drug)  \(rx.strength)")
                                .font(.system(size: fontSize(14), weight: .bold, design: .monospaced))
                                .foregroundColor(ink)
                            Text("Sig: \(rx.sig)")
                                .font(.system(size: fontSize(12), design: .monospaced))
                                .foregroundColor(ink.opacity(0.85))
                            HStack(spacing: 16) {
                                Label("Disp #\(rx.quantity)", systemImage: "pills")
                                Label("Refills: \(rx.refills)", systemImage: "arrow.clockwise")
                            }
                            .font(.system(size: fontSize(10), weight: .medium, design: .monospaced))
                            .foregroundColor(ink.opacity(0.65))
                        }
                    }

                    if let detail = rx.prescriberDetail {
                        Text(detail)
                            .font(.system(size: fontSize(10), design: .monospaced))
                            .foregroundColor(ink.opacity(0.55))
                            .italic()
                            .padding(.top, 2)
                    }
                }
                .padding(14)
            }
            .background(paper)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(ink.opacity(0.12), lineWidth: 0.5)
            )
            .shadow(color: .black.opacity(0.45), radius: 10, y: 5)
            .rotationEffect(.degrees(rx.isHandwritten ? -0.6 : 0))

            if isCurrent { continueButton }
        }
    }

    private func rxRow(label: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text(label)
                .font(.system(size: fontSize(9), weight: .bold, design: .monospaced))
                .foregroundColor(ink.opacity(0.5))
                .frame(width: 80, alignment: .leading)
            Text(value)
                .font(.system(size: fontSize(11), design: .monospaced))
                .foregroundColor(ink)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
    }

    // MARK: - Phone call

    private func phoneCallBeatView(call: RimrockPhoneCall, isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "phone.fill")
                    .font(.system(size: fontSize(9)))
                Text("CALLER ID — \(call.callerID)")
                    .font(.system(size: fontSize(10), weight: .bold, design: .monospaced))
                    .tracking(1.2)
                Spacer()
            }
            .foregroundColor(sceneText.opacity(0.7))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(sceneText.opacity(0.2), lineWidth: 1))
            .cornerRadius(4)

            VStack(alignment: .leading, spacing: 12) {
                ForEach(Array(call.turns.enumerated()), id: \.offset) { _, turn in
                    HStack(alignment: .top, spacing: 10) {
                        Text(turn.speaker.displayLabel)
                            .font(.system(size: fontSize(10), weight: .heavy, design: .monospaced))
                            .foregroundColor(speakerColor(turn.speaker))
                            .tracking(1)
                            .frame(width: 64, alignment: .leading)
                        Text(turn.line)
                            .font(.system(size: fontSize(14), weight: .regular))
                            .foregroundColor(sceneText.opacity(0.95))
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(.horizontal, 12)

            if isCurrent { continueButton.padding(.top, 4) }
        }
    }

    // MARK: - Question

    private func questionBeatView(question: RimrockQuestion, isCurrent: Bool) -> some View {
        let isAnswered = questionResults[question.id] != nil
        let wasCorrect = questionResults[question.id] ?? false
        let pickedOption = questionAnswers[question.id]

        return VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "checkmark.shield")
                    .font(.system(size: fontSize(10)))
                Text("VERIFY")
                    .font(.system(size: fontSize(10), weight: .bold, design: .monospaced))
                    .tracking(1.2)
                Spacer()
                Text(question.domain.shortName)
                    .font(.system(size: fontSize(9), weight: .bold, design: .monospaced))
                    .foregroundColor(question.domain.accentColor)
                    .tracking(1)
            }
            .foregroundColor(maraAccent)

            Text(question.prompt)
                .font(.system(size: fontSize(16), weight: .semibold))
                .foregroundColor(.white.opacity(0.95))
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 8) {
                ForEach(question.options, id: \.self) { opt in
                    questionOption(option: opt,
                                   question: question,
                                   isAnswered: isAnswered,
                                   pickedOption: pickedOption,
                                   isCurrent: isCurrent)
                }
            }

            if isCurrent && !isAnswered {
                Button(action: { submitQuestion(question) }) {
                    Text(selectedAnswerForCurrent == nil ? "SELECT AN ANSWER" : "SUBMIT")
                        .font(.system(size: fontSize(12), weight: .bold, design: .monospaced))
                        .foregroundColor(selectedAnswerForCurrent == nil ? sceneText.opacity(0.4) : .black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(selectedAnswerForCurrent == nil ? Color.clear : maraAccent)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(maraAccent.opacity(0.5), lineWidth: 1))
                        .cornerRadius(6)
                }
                #if os(tvOS)
                .buttonStyle(.card)
                .focused($focusedField, equals: .submitButton)
                #endif
                .disabled(selectedAnswerForCurrent == nil)
            }

            if isAnswered {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Image(systemName: wasCorrect ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                            .foregroundColor(wasCorrect ? .green : .orange)
                        Text(wasCorrect ? "CORRECT" : "REVIEW")
                            .font(.system(size: fontSize(10), weight: .heavy, design: .monospaced))
                            .foregroundColor(wasCorrect ? .green : .orange)
                            .tracking(1.2)
                    }
                    Rectangle()
                        .fill(LinearGradient(
                            colors: [maraAccent.opacity(0.45), maraAccent.opacity(0.05)],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(height: 0.5)
                    HStack(spacing: 6) {
                        RadioSignalDot(color: maraAccent)
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .font(.system(size: fontSize(9)))
                            .foregroundColor(maraAccent)
                        Text("MARA")
                            .font(.system(size: fontSize(9), weight: .heavy, design: .monospaced))
                            .foregroundColor(maraAccent)
                            .tracking(1.2)
                    }
                    Text(wasCorrect ? question.onCorrect : question.onWrong)
                        .font(.system(size: fontSize(14), design: .monospaced))
                        .foregroundColor(maraAccent.opacity(0.95))
                        .lineSpacing(5)
                        .tracking(0.3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(14)
                .background(
                    LinearGradient(
                        colors: [maraAccent.opacity(0.10), maraAccent.opacity(0.03)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(maraAccent.opacity(0.30), lineWidth: 1))
                .cornerRadius(8)
                .transition(.opacity.combined(with: .move(edge: .leading)).combined(with: .scale(scale: 0.98)))

                if isCurrent { continueButton.padding(.top, 4) }
            }
        }
        .padding(14)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(maraAccent.opacity(0.2), lineWidth: 1))
        .cornerRadius(8)
        .animation(.easeOut(duration: 0.30), value: isAnswered)
    }

    private func questionOption(option: String,
                                question: RimrockQuestion,
                                isAnswered: Bool,
                                pickedOption: String?,
                                isCurrent: Bool) -> some View {
        let activeSelection = isAnswered ? pickedOption : selectedAnswerForCurrent
        let isSelected = activeSelection == option
        let isCorrectOption = option == question.correctAnswer
        
        // Letter badge for tvOS (A, B, C, D)
        let optionIndex = question.options.firstIndex(of: option) ?? 0
        let letter = String(UnicodeScalar(65 + optionIndex)!)  // A=65

        let borderColor: Color = {
            if isAnswered && isCorrectOption { return .green }
            if isAnswered && isSelected && !isCorrectOption { return .red }
            if isSelected { return maraAccent }
            return sceneText.opacity(0.2)
        }()

        let bgColor: Color = {
            if isAnswered && isCorrectOption { return Color.green.opacity(0.12) }
            if isAnswered && isSelected && !isCorrectOption { return Color.red.opacity(0.12) }
            if isSelected { return maraAccent.opacity(0.10) }
            return Color.white.opacity(0.03)
        }()

        return Button(action: {
            guard isCurrent && !isAnswered else { return }
            selectedAnswerForCurrent = option
        }) {
            HStack(alignment: .top, spacing: 12) {
                #if os(tvOS)
                // Letter badge for tvOS
                Text(letter)
                    .font(.system(size: fontSize(14), weight: .black, design: .monospaced))
                    .foregroundColor(isSelected ? .black : maraAccent)
                    .frame(width: 32, height: 32)
                    .background(isSelected ? maraAccent : maraAccent.opacity(0.15))
                    .cornerRadius(8)
                #endif
                
                Text(option)
                    .font(.system(size: fontSize(14), design: .monospaced))
                    .foregroundColor(.white.opacity(0.92))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                if isAnswered && isCorrectOption {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                } else if isAnswered && isSelected && !isCorrectOption {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(bgColor)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(borderColor, lineWidth: 1))
            .cornerRadius(6)
        }
        .accessibilityLabel("Option \(letter): \(option)")
        .accessibilityHint(isAnswered 
            ? (isCorrectOption ? "Correct answer" : (isSelected ? "Incorrect answer" : ""))
            : "Double tap to select")
        #if os(tvOS)
        .buttonStyle(.plain)
        .focused($focusedField, equals: .questionOption(option))
        #endif
        .disabled(isAnswered || !isCurrent)
    }

    private func submitQuestion(_ question: RimrockQuestion) {
        guard let answer = selectedAnswerForCurrent else { return }
        let correct = engine.submitAnswer(answer, for: question)
        questionAnswers[question.id] = answer
        questionResults[question.id] = correct
        // Feed the global spaced-repetition mastery tracker.
        gameEngine?.recordRimrockMastery(question: question, wasCorrect: correct)
        // If this question came from a generated practice shift (DN_<uuid>
        // prefix), also record exposure against the originating DataNode so
        // the bank-coverage tracker advances.
        if question.id.hasPrefix("DN_"),
           let uuid = UUID(uuidString: String(question.id.dropFirst(3))) {
            gameEngine?.recordQuestionExposure(
                nodeID: uuid,
                wasCorrect: correct,
                sessionShift: engine.shift.dayNumber
            )
        }
        // Notification haptic — success/error matches the result.
        #if os(iOS)
        let gen = UINotificationFeedbackGenerator()
        gen.notificationOccurred(correct ? .success : .warning)
        #endif
    }

    // MARK: - Choice

    private func choiceBeatView(prompt: String, choices: [RimrockChoice], isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(prompt.uppercased())
                .font(.system(size: fontSize(11), weight: .bold, design: .monospaced))
                .foregroundColor(maraAccent.opacity(0.7))
                .tracking(1.2)

            VStack(spacing: 8) {
                ForEach(Array(choices.enumerated()), id: \.offset) { idx, choice in
                    Button(action: {
                        guard isCurrent else { return }
                        engine.selectChoice(choice)
                    }) {
                        Text(choice.label)
                            .font(.system(size: fontSize(14), design: .monospaced))
                            .foregroundColor(.white.opacity(0.92))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(maraAccent.opacity(0.3), lineWidth: 1))
                            .cornerRadius(6)
                    }
                    #if os(tvOS)
                    .buttonStyle(.card)
                    .focused($focusedField, equals: .choiceOption(idx))
                    #endif
                    .disabled(!isCurrent)
                }
            }
            #if os(tvOS)
            .onAppear {
                if isCurrent { focusedField = .choiceOption(0) }
            }
            #endif
        }
        .padding(14)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(maraAccent.opacity(0.2), lineWidth: 1))
        .cornerRadius(8)
    }

    // MARK: - Object

    private func objectBeatView(name: String, description: String, logEntry: RimrockLogEntry?, isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "doc.text")
                    .font(.system(size: fontSize(10)))
                Text(name.uppercased())
                    .font(.system(size: fontSize(10), weight: .bold, design: .monospaced))
                    .tracking(1.2)
                Spacer()
            }
            .foregroundColor(sceneText.opacity(0.7))

            Text(description)
                .font(.system(size: fontSize(14), weight: .regular, design: .serif))
                .italic()
                .foregroundColor(sceneText)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            if let entry = logEntry {
                HStack(spacing: 6) {
                    Image(systemName: "book.closed")
                        .font(.system(size: fontSize(9)))
                    Text("ADDED TO SHIFT LOG: \(entry.title)")
                        .font(.system(size: fontSize(9), weight: .semibold, design: .monospaced))
                        .tracking(1)
                }
                .foregroundColor(maraAccent.opacity(0.6))
                .padding(.top, 4)
            }

            if isCurrent {
                Button(action: {
                    if let entry = logEntry { engine.record(entry) }
                    engine.advance()
                }) {
                    continueButtonLabel
                }
                #if os(tvOS)
                .buttonStyle(.card)
                .focused($focusedField, equals: .continueButton)
                #endif
                .padding(.top, 4)
            }
        }
        .padding(14)
        .background(Color.white.opacity(0.025))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(sceneText.opacity(0.15), lineWidth: 1))
        .cornerRadius(8)
    }

    // MARK: - Ending (CYOA bad endings)

    private func endingBeatView(ending: RimrockEnding, isCurrent: Bool) -> some View {
        let isTerminal = ending.kind.isTerminal
        let endingColor: Color = isTerminal
            ? Color(red: 0.86, green: 0.32, blue: 0.30)   // crimson — terminal
            : Color(red: 0.95, green: 0.78, blue: 0.35)   // amber — recoverable

        return VStack(alignment: .leading, spacing: 16) {
            // Header row — kind badge + headline
            HStack(spacing: 10) {
                Image(systemName: isTerminal ? "exclamationmark.octagon.fill" : "exclamationmark.triangle.fill")
                    .font(.system(size: fontSize(14), weight: .heavy))
                    .foregroundColor(endingColor)
                Text(ending.kind.headline)
                    .font(.system(size: fontSize(12), weight: .heavy, design: .monospaced))
                    .foregroundColor(endingColor)
                    .tracking(1.6)
                Spacer()
            }

            // Title
            Text(ending.title.uppercased())
                .font(.system(size: fontSize(22), weight: .heavy, design: .serif))
                .foregroundColor(.white.opacity(0.95))
                .tracking(0.4)
                .fixedSize(horizontal: false, vertical: true)

            // Consequence body
            Text(ending.body)
                .font(.system(size: fontSize(15), weight: .regular, design: .serif))
                .foregroundColor(sceneText.opacity(0.92))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            // PTCE lesson — the rule the bad path teaches
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: fontSize(9), weight: .bold))
                    Text("PTCE LESSON")
                        .font(.system(size: fontSize(9), weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                }
                .foregroundColor(endingColor.opacity(0.85))

                Text(ending.ptceLesson)
                    .font(.system(size: fontSize(13), design: .monospaced))
                    .foregroundColor(.white.opacity(0.88))
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(14)
            .background(endingColor.opacity(0.10))
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(endingColor.opacity(0.40), lineWidth: 1))
            .cornerRadius(6)

            // Buttons — restart for terminal, continue for recoverable
            if isCurrent {
                if isTerminal {
                    Button(action: { restartShift() }) {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.counterclockwise")
                                .font(.system(size: fontSize(11), weight: .bold))
                            Text("RESTART SHIFT")
                                .font(.system(size: fontSize(12), weight: .heavy, design: .monospaced))
                                .tracking(1.4)
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(endingColor)
                        .cornerRadius(6)
                    }
                    #if os(tvOS)
                    .buttonStyle(.card)
                    .focused($focusedField, equals: .dismissButton)
                    #endif
                } else {
                    Button(action: { engine.advance() }) {
                        HStack(spacing: 8) {
                            Text("LIVE WITH IT")
                                .font(.system(size: fontSize(12), weight: .heavy, design: .monospaced))
                                .tracking(1.4)
                            Image(systemName: "arrow.right")
                                .font(.system(size: fontSize(11), weight: .bold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(endingColor)
                        .cornerRadius(6)
                    }
                    #if os(tvOS)
                    .buttonStyle(.card)
                    .focused($focusedField, equals: .continueButton)
                    #endif
                }
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.black.opacity(0.55), Color.black.opacity(0.30)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(endingColor.opacity(0.55), lineWidth: 1.2))
        .cornerRadius(10)
        .shadow(color: endingColor.opacity(0.35), radius: 14, y: 6)
    }

    private func restartShift() {
        // Reset engine state.
        engine.restartShift()
        // Clear local question caches so the player can re-answer.
        questionAnswers.removeAll()
        questionResults.removeAll()
        selectedAnswerForCurrent = nil
        nameInput = ""
        // Sharper haptic on restart.
        #if os(iOS)
        let gen = UIImpactFeedbackGenerator(style: .heavy)
        gen.impactOccurred(intensity: 0.85)
        #endif
    }

    // MARK: - Shift end

    private func shiftEndBeatView(closingLine: String?, isCurrent: Bool) -> some View {
        VStack(alignment: .center, spacing: 14) {
            if let line = closingLine {
                Text(line)
                    .font(.system(size: fontSize(14), weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(sceneText.opacity(0.85))
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
            }
            Text("END OF SHIFT")
                .font(.system(size: fontSize(12), weight: .bold, design: .monospaced))
                .foregroundColor(maraAccent)
                .tracking(2)

            if isCurrent {
                Button(action: { engine.advance() }) {
                    Text("CONTINUE")
                        .font(.system(size: fontSize(12), weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(maraAccent)
                        .cornerRadius(6)
                }
                #if os(tvOS)
                .buttonStyle(.card)
                .focused($focusedField, equals: .continueButton)
                #endif
                .padding(.top, 4)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }

    // MARK: - Continue button

    private var continueButton: some View {
        Button(action: { engine.advance() }) {
            continueButtonLabel
        }
        .accessibilityLabel("Continue to next scene")
        #if os(tvOS)
        .buttonStyle(.card)
        .focused($focusedField, equals: .continueButton)
        .onAppear { focusedField = .continueButton }
        #endif
        .padding(.top, 4)
    }

    private var continueButtonLabel: some View {
        HStack(spacing: 6) {
            Text("CONTINUE")
                .font(.system(size: fontSize(10), weight: .bold, design: .monospaced))
                .tracking(1.2)
            Image(systemName: "arrow.right")
                .font(.system(size: fontSize(9), weight: .bold))
        }
        .foregroundColor(maraAccent.opacity(0.85))
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(maraAccent.opacity(0.08))
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(maraAccent.opacity(0.4), lineWidth: 1))
        .cornerRadius(4)
    }

    // MARK: - Shift complete

    private var shiftCompleteCard: some View {
        VStack(spacing: 12) {
            // Milestone celebration banner — appears once for each bank-coverage
            // threshold the player crosses.
            if let m = firedMilestone {
                milestoneBanner(milestone: m)
            }

            Text("DAY \(engine.shift.dayNumber) COMPLETE")
                .font(.system(size: fontSize(14), weight: .heavy, design: .monospaced))
                .foregroundColor(maraAccent)
                .tracking(2)

            HStack(spacing: 12) {
                statTile(label: "CORRECT", value: "\(engine.questionsCorrect)/\(engine.questionsAnswered)")
                statTile(label: "RAPPORT", value: rapportLabel(engine.rapport))
                if engine.recoverableHitsThisShift > 0 {
                    statTile(label: "SAVES", value: "\(engine.recoverableHitsThisShift)")
                } else {
                    statTile(label: "LOG", value: "\(engine.log.count)")
                }
            }

            Button(action: onDismiss) {
                Text("END SHIFT")
                    .font(.system(size: fontSize(12), weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(maraAccent)
                    .cornerRadius(6)
            }
            #if os(tvOS)
            .buttonStyle(.card)
            .focused($focusedField, equals: .dismissButton)
            #endif
            .padding(.top, 8)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(panel)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(maraAccent.opacity(0.4), lineWidth: 1))
        .cornerRadius(8)
        .onAppear {
            // Persist the highest shift the player has reached the end of.
            // Drives Today's Path advancement on the home screen.
            lastShiftPlayed = max(lastShiftPlayed, engine.shift.dayNumber)
            updateStreakOnCompletion()
            firedMilestone = checkAndFireCoverageMilestone()
        }
    }

    /// Compute the highest newly-crossed bank-coverage milestone, mark it as
    /// fired (so it never re-fires), and return it for one-shot rendering in
    /// the shift-complete card. Returns `nil` when no milestone was crossed
    /// this shift.
    private func checkAndFireCoverageMilestone() -> CoverageMilestone? {
        guard let cov = gameEngine?.practiceCoverage() else { return nil }
        let pct = cov.verifiedPercent

        // Check 100 → 75 → 50 → 25 so we fire only the highest newly-reached
        // milestone if multiple thresholds got crossed in one big shift.
        if pct >= 1.0, !milestone100Fired {
            milestone100Fired = true; milestone75Fired = true
            milestone50Fired = true;  milestone25Fired = true
            return .full
        }
        if pct >= 0.75, !milestone75Fired {
            milestone75Fired = true; milestone50Fired = true; milestone25Fired = true
            return .threeQuarters
        }
        if pct >= 0.5, !milestone50Fired {
            milestone50Fired = true; milestone25Fired = true
            return .half
        }
        if pct >= 0.25, !milestone25Fired {
            milestone25Fired = true
            return .quarter
        }
        return nil
    }

    /// Mara-voiced congratulations banner for a bank-coverage milestone. Sits
    /// at the top of the shift-complete card so the player sees it once when
    /// they cross a threshold, then never again.
    private func milestoneBanner(milestone m: CoverageMilestone) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: m == .full ? "checkmark.seal.fill" : "star.fill")
                    .font(.system(size: fontSize(16), weight: .heavy))
                Text(m.headline)
                    .font(.system(size: fontSize(12), weight: .heavy, design: .monospaced))
                    .tracking(1.5)
            }
            .foregroundColor(m == .full
                             ? Color(red: 0.25, green: 0.85, blue: 0.55)
                             : maraAccent)

            HStack(spacing: 8) {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .font(.system(size: fontSize(9)))
                Text("MARA")
                    .font(.system(size: fontSize(9), weight: .heavy, design: .monospaced))
                    .tracking(1.2)
            }
            .foregroundColor(maraAccent.opacity(0.8))

            Text(m.maraLine)
                .font(.system(size: fontSize(13), design: .serif))
                .italic()
                .foregroundColor(.white.opacity(0.92))
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [maraAccent.opacity(0.18), maraAccent.opacity(0.04)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(m == .full
                        ? Color(red: 0.25, green: 0.85, blue: 0.55).opacity(0.6)
                        : maraAccent.opacity(0.5),
                        lineWidth: 1.5)
        )
        .cornerRadius(10)
        .shadow(color: maraAccent.opacity(0.35), radius: 10)
    }

    /// Bump the consecutive-days-played streak when a shift finishes.
    /// Same-day completion is a no-op; next-day continues the streak;
    /// any gap > 1 calendar day resets it to 1.
    private func updateStreakOnCompletion() {
        let cal = Calendar.current
        let today = cal.startOfDay(for: Date())
        if streakLastDateRaw > 0 {
            let last = cal.startOfDay(for: Date(timeIntervalSince1970: streakLastDateRaw))
            let dayDiff = cal.dateComponents([.day], from: last, to: today).day ?? 0
            switch dayDiff {
            case 0:  break                        // already counted today
            case 1:  streakCount += 1             // continued streak
            default: streakCount = 1              // gap → restart
            }
        } else {
            streakCount = 1                       // first ever completion
        }
        streakLastDateRaw = today.timeIntervalSince1970
    }

    private func statTile(label: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: fontSize(16), weight: .bold, design: .monospaced))
                .foregroundColor(.white.opacity(0.95))
            Text(label)
                .font(.system(size: fontSize(9), weight: .bold, design: .monospaced))
                .foregroundColor(sceneText.opacity(0.6))
                .tracking(1.2)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.04))
        .cornerRadius(6)
    }

    private func rapportLabel(_ value: Int) -> String {
        switch value {
        case ..<0: return "DISTANT"
        case 0:    return "PRO"
        case 1:    return "OPEN"
        default:   return "WARM"
        }
    }
}

// MARK: - Tap to advance (passive beats)

extension View {
    /// Adds a full-bounds tap gesture that triggers `action` only when `isActive`.
    /// Used so the entire passive beat is tappable, not just the small CONTINUE
    /// button — feels more like Firewatch and less like a quiz app.
    /// On tvOS, this is disabled since navigation should be via focused buttons.
    func tapToAdvance(when isActive: Bool, action: @escaping () -> Void) -> some View {
        #if os(tvOS)
        // On tvOS, tapping anywhere would be confusing — use focused buttons only
        return self
        #else
        return contentShape(Rectangle())
            .onTapGesture {
                if isActive { action() }
            }
        #endif
    }
}
