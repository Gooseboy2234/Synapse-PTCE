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

struct RimrockShiftView: View {

    // MARK: - State

    @State private var engine: RimrockEngine

    // Name entry
    @State private var nameInput: String = ""

    // Question state — keyed by question.id so prior beats keep their resolved state.
    @State private var questionAnswers: [String: String] = [:]
    @State private var questionResults: [String: Bool] = [:]
    @State private var selectedAnswerForCurrent: String? = nil

    /// Highest day number the player has reached the END of. Drives Today's Path
    /// recommendations on the home screen — bumped when this view's shiftEnd
    /// beat is rendered as current.
    @AppStorage("rimrock_last_shift_played") private var lastShiftPlayed: Int = 0

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
                        VStack(alignment: .leading, spacing: 22) {
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
                        .padding(.horizontal, 22)
                        .padding(.vertical, 22)
                        .animation(.easeOut(duration: 0.32), value: engine.currentBeatIndex)
                        .animation(.easeOut(duration: 0.40), value: engine.isFinished)
                    }
                    .onChange(of: engine.currentBeatIndex) { _, _ in
                        // Reset transient question selection when advancing.
                        selectedAnswerForCurrent = nil
                        // Light haptic on advance — feels like a page turn.
                        let gen = UIImpactFeedbackGenerator(style: .soft)
                        gen.impactOccurred(intensity: 0.55)
                        withAnimation(.easeOut(duration: 0.30)) {
                            proxy.scrollTo("BOTTOM", anchor: .bottom)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Top chrome

    private var topChrome: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 2) {
                Text("DAY \(engine.shift.dayNumber) · \(engine.shift.title.uppercased())")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(maraAccent.opacity(0.85))
                    .tracking(1.2)
                Text("\(engine.shift.dateLine), \(engine.shift.timeLine)")
                    .font(.system(size: 10, weight: .medium, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.6))
                Text(engine.shift.locationLine)
                    .font(.system(size: 10, weight: .medium, design: .monospaced))
                    .foregroundColor(sceneText.opacity(0.4))
            }
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(sceneText.opacity(0.6))
                    .padding(8)
            }
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
                .font(.system(size: 16, weight: .regular, design: .serif))
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
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(maraAccent)
                    Text("RADIO")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundColor(maraAccent.opacity(0.7))
                        .tracking(1.5)
                }
                Text(speaker.displayLabel)
                    .font(.system(size: 11, weight: .heavy, design: .monospaced))
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
                        .font(.system(size: 16, weight: .regular,
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
        .background(
            speaker.isRadio
            ? AnyShapeStyle(LinearGradient(
                colors: [maraAccent.opacity(0.10), maraAccent.opacity(0.03)],
                startPoint: .leading,
                endPoint: .trailing
              ))
            : AnyShapeStyle(Color.clear)
        )
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
                        .font(.system(size: 11))
                        .foregroundColor(sceneText.opacity(0.5))
                    Text("YOU SAID: \(engine.playerName.uppercased())")
                        .font(.system(size: 11, weight: .semibold, design: .monospaced))
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
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundColor(maraAccent.opacity(0.7))
                        .tracking(1.5)

                    HStack(spacing: 8) {
                        TextField("", text: $nameInput,
                                  prompt: Text("Your name").foregroundColor(sceneText.opacity(0.4)))
                            .font(.system(size: 16, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                            .textInputAutocapitalization(.words)
                            .submitLabel(.done)
                            .onSubmit { submitName() }
                            .padding(12)
                            .background(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(maraAccent.opacity(0.4), lineWidth: 1)
                            )
                            .cornerRadius(6)

                        Button(action: submitName) {
                            Text("OK")
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
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
                        .disabled(nameInput.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
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
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(sceneText.opacity(0.85))
                    .lineSpacing(5)
                    .fixedSize(horizontal: false, vertical: true)
            }

            VStack(alignment: .leading, spacing: 0) {
                // Header band — warm vintage feel
                HStack(spacing: 10) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 14))
                        .foregroundColor(ink.opacity(0.45))
                    VStack(alignment: .leading, spacing: 1) {
                        Text("RIMROCK PHARMACY")
                            .font(.system(size: 10, weight: .heavy, design: .monospaced))
                            .tracking(1.4)
                            .foregroundColor(ink)
                        Text("Buffalo, Wyoming  ·  Rx #\(String(format: "%07d", abs(rx.patientName.hashValue) % 9_999_999))")
                            .font(.system(size: 8, design: .monospaced))
                            .foregroundColor(ink.opacity(0.55))
                    }
                    Spacer()
                    Text("PRESCRIPTION")
                        .font(.system(size: 8, weight: .bold, design: .monospaced))
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
                            .font(.system(size: 22, weight: .bold, design: .serif))
                            .italic()
                            .foregroundColor(ink.opacity(0.85))
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(rx.drug)  \(rx.strength)")
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                                .foregroundColor(ink)
                            Text("Sig: \(rx.sig)")
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(ink.opacity(0.85))
                            HStack(spacing: 16) {
                                Label("Disp #\(rx.quantity)", systemImage: "pills")
                                Label("Refills: \(rx.refills)", systemImage: "arrow.clockwise")
                            }
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                            .foregroundColor(ink.opacity(0.65))
                        }
                    }

                    if let detail = rx.prescriberDetail {
                        Text(detail)
                            .font(.system(size: 10, design: .monospaced))
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
                .font(.system(size: 9, weight: .bold, design: .monospaced))
                .foregroundColor(ink.opacity(0.5))
                .frame(width: 80, alignment: .leading)
            Text(value)
                .font(.system(size: 11, design: .monospaced))
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
                    .font(.system(size: 9))
                Text("CALLER ID — \(call.callerID)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
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
                            .font(.system(size: 10, weight: .heavy, design: .monospaced))
                            .foregroundColor(speakerColor(turn.speaker))
                            .tracking(1)
                            .frame(width: 64, alignment: .leading)
                        Text(turn.line)
                            .font(.system(size: 14, weight: .regular))
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
                    .font(.system(size: 10))
                Text("VERIFY")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                Spacer()
                Text(question.domain.shortName)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundColor(question.domain.accentColor)
                    .tracking(1)
            }
            .foregroundColor(maraAccent)

            Text(question.prompt)
                .font(.system(size: 16, weight: .semibold))
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
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(selectedAnswerForCurrent == nil ? sceneText.opacity(0.4) : .black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(selectedAnswerForCurrent == nil ? Color.clear : maraAccent)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(maraAccent.opacity(0.5), lineWidth: 1))
                        .cornerRadius(6)
                }
                .disabled(selectedAnswerForCurrent == nil)
            }

            if isAnswered {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 6) {
                        Image(systemName: wasCorrect ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                            .foregroundColor(wasCorrect ? .green : .orange)
                        Text(wasCorrect ? "CORRECT" : "REVIEW")
                            .font(.system(size: 10, weight: .heavy, design: .monospaced))
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
                            .font(.system(size: 9))
                            .foregroundColor(maraAccent)
                        Text("MARA")
                            .font(.system(size: 9, weight: .heavy, design: .monospaced))
                            .foregroundColor(maraAccent)
                            .tracking(1.2)
                    }
                    Text(wasCorrect ? question.onCorrect : question.onWrong)
                        .font(.system(size: 14, design: .monospaced))
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
            HStack {
                Text(option)
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(.white.opacity(0.92))
                    .multilineTextAlignment(.leading)
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
        .disabled(isAnswered || !isCurrent)
    }

    private func submitQuestion(_ question: RimrockQuestion) {
        guard let answer = selectedAnswerForCurrent else { return }
        let correct = engine.submitAnswer(answer, for: question)
        questionAnswers[question.id] = answer
        questionResults[question.id] = correct
        // Feed the global spaced-repetition mastery tracker.
        gameEngine?.recordRimrockMastery(question: question, wasCorrect: correct)
        // Notification haptic — success/error matches the result.
        let gen = UINotificationFeedbackGenerator()
        gen.notificationOccurred(correct ? .success : .warning)
    }

    // MARK: - Choice

    private func choiceBeatView(prompt: String, choices: [RimrockChoice], isCurrent: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(prompt.uppercased())
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(maraAccent.opacity(0.7))
                .tracking(1.2)

            VStack(spacing: 8) {
                ForEach(Array(choices.enumerated()), id: \.offset) { _, choice in
                    Button(action: {
                        guard isCurrent else { return }
                        engine.selectChoice(choice)
                    }) {
                        Text(choice.label)
                            .font(.system(size: 14, design: .monospaced))
                            .foregroundColor(.white.opacity(0.92))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(maraAccent.opacity(0.3), lineWidth: 1))
                            .cornerRadius(6)
                    }
                    .disabled(!isCurrent)
                }
            }
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
                    .font(.system(size: 10))
                Text(name.uppercased())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(1.2)
                Spacer()
            }
            .foregroundColor(sceneText.opacity(0.7))

            Text(description)
                .font(.system(size: 14, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(sceneText)
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)

            if let entry = logEntry {
                HStack(spacing: 6) {
                    Image(systemName: "book.closed")
                        .font(.system(size: 9))
                    Text("ADDED TO SHIFT LOG: \(entry.title)")
                        .font(.system(size: 9, weight: .semibold, design: .monospaced))
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
                    .font(.system(size: 14, weight: .heavy))
                    .foregroundColor(endingColor)
                Text(ending.kind.headline)
                    .font(.system(size: 12, weight: .heavy, design: .monospaced))
                    .foregroundColor(endingColor)
                    .tracking(1.6)
                Spacer()
            }

            // Title
            Text(ending.title.uppercased())
                .font(.system(size: 22, weight: .heavy, design: .serif))
                .foregroundColor(.white.opacity(0.95))
                .tracking(0.4)
                .fixedSize(horizontal: false, vertical: true)

            // Consequence body
            Text(ending.body)
                .font(.system(size: 15, weight: .regular, design: .serif))
                .foregroundColor(sceneText.opacity(0.92))
                .lineSpacing(6)
                .fixedSize(horizontal: false, vertical: true)

            // PTCE lesson — the rule the bad path teaches
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 9, weight: .bold))
                    Text("PTCE LESSON")
                        .font(.system(size: 9, weight: .heavy, design: .monospaced))
                        .tracking(1.6)
                }
                .foregroundColor(endingColor.opacity(0.85))

                Text(ending.ptceLesson)
                    .font(.system(size: 13, design: .monospaced))
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
                                .font(.system(size: 11, weight: .bold))
                            Text("RESTART SHIFT")
                                .font(.system(size: 12, weight: .heavy, design: .monospaced))
                                .tracking(1.4)
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(endingColor)
                        .cornerRadius(6)
                    }
                } else {
                    Button(action: { engine.advance() }) {
                        HStack(spacing: 8) {
                            Text("LIVE WITH IT")
                                .font(.system(size: 12, weight: .heavy, design: .monospaced))
                                .tracking(1.4)
                            Image(systemName: "arrow.right")
                                .font(.system(size: 11, weight: .bold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(endingColor)
                        .cornerRadius(6)
                    }
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
        let gen = UIImpactFeedbackGenerator(style: .heavy)
        gen.impactOccurred(intensity: 0.85)
    }

    // MARK: - Shift end

    private func shiftEndBeatView(closingLine: String?, isCurrent: Bool) -> some View {
        VStack(alignment: .center, spacing: 14) {
            if let line = closingLine {
                Text(line)
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .italic()
                    .foregroundColor(sceneText.opacity(0.85))
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
            }
            Text("END OF SHIFT")
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(maraAccent)
                .tracking(2)

            if isCurrent {
                Button(action: { engine.advance() }) {
                    Text("CONTINUE")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(maraAccent)
                        .cornerRadius(6)
                }
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
        .padding(.top, 4)
    }

    private var continueButtonLabel: some View {
        HStack(spacing: 6) {
            Text("CONTINUE")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .tracking(1.2)
            Image(systemName: "arrow.right")
                .font(.system(size: 9, weight: .bold))
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
            Text("DAY \(engine.shift.dayNumber) COMPLETE")
                .font(.system(size: 14, weight: .heavy, design: .monospaced))
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
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(maraAccent)
                    .cornerRadius(6)
            }
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
        }
    }

    private func statTile(label: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .foregroundColor(.white.opacity(0.95))
            Text(label)
                .font(.system(size: 9, weight: .bold, design: .monospaced))
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
    func tapToAdvance(when isActive: Bool, action: @escaping () -> Void) -> some View {
        contentShape(Rectangle())
            .onTapGesture {
                if isActive { action() }
            }
    }
}
