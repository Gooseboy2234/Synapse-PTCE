//
//  VoiceModeView.swift
//  Synapse PTCE — Voice Mode
//
//  Full-screen hands-free playthrough of a Rimrock shift.
//
//  iOS: TTS narrates; SFSpeechRecognizer captures voice answers on-device.
//       A pulsing mic ring confirms the listener is hot; partial transcript
//       appears live below the question text.
//
//  tvOS: TTS narrates; a focused TextField below the options activates
//        Siri Remote dictation. The user holds the Siri button, dictates,
//        and the text is matched against the available options. Visual
//        options are also focusable via the directional pad as a fallback.
//

import SwiftUI

#if os(iOS)
import UIKit
#endif

struct VoiceModeView: View {

    let shift: RimrockShift
    let onExit: () -> Void

    @State private var session = VoiceSession()
    @State private var hasShownOnboarding = false
    @State private var pulse: Bool = false
    @State private var elapsedTimer: Timer?
    @State private var elapsedSeconds: Int = 0

    #if os(tvOS)
    @FocusState private var dictationFocused: Bool
    @State private var dictationText: String = ""
    #endif

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @AppStorage("voice_mode_onboarded") private var voiceOnboarded = false

    // ── Palette ───────────────────────────────────────────────────────────
    private let accent = Color(red: 1.0, green: 0.65, blue: 0.0)
    private let listen = Color(red: 0.20, green: 0.95, blue: 0.55)
    private let bgTop  = Color(red: 0.08, green: 0.07, blue: 0.06)
    private let bgBot  = Color(red: 0.03, green: 0.025, blue: 0.02)

    // ── Body ──────────────────────────────────────────────────────────────
    var body: some View {
        ZStack {
            backdrop
            // Constrain on iPad / large windows so the readable max-width feels
            // intentional rather than stretched edge to edge.
            content
                .padding(.horizontal, padding.h)
                .padding(.vertical, padding.v)
                .frame(maxWidth: 720)
                .frame(maxWidth: .infinity)

            if !voiceOnboarded {
                onboardingOverlay
                    .transition(.opacity)
            }
        }
        .preferredColorScheme(.dark)
        .task {
            session.onFinished = onExit
            session.onAnswerResolved = { isCorrect in
                #if os(iOS)
                if isCorrect == true {
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                } else if isCorrect == false {
                    UINotificationFeedbackGenerator().notificationOccurred(.error)
                } else {
                    UISelectionFeedbackGenerator().selectionChanged()
                }
                #endif
            }
            startElapsedTimer()
            session.start(shift: shift)
            startPulse()
        }
        .onDisappear {
            stopElapsedTimer()
            session.stop()
        }
    }

    // MARK: - Background

    @ViewBuilder
    private var backdrop: some View {
        ZStack {
            LinearGradient(colors: [bgTop, bgBot], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            // A second very subtle accent halo that breathes with the mic.
            RadialGradient(
                colors: [(isListening ? listen : accent).opacity(pulse ? 0.16 : 0.08), .clear],
                center: .center, startRadius: 40, endRadius: 480
            )
            .animation(reduceMotion ? nil : .easeInOut(duration: 2.4).repeatForever(autoreverses: true), value: pulse)
            .ignoresSafeArea()
        }
    }

    // MARK: - Layout

    private var padding: (h: CGFloat, v: CGFloat) {
        #if os(tvOS)
        return (60, 40)
        #else
        return (24, 24)
        #endif
    }

    private var content: some View {
        VStack(spacing: 18) {
            header
            Spacer(minLength: 8)
            statusCard
            Spacer(minLength: 8)
            transportControls
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                Button(action: exitVoiceMode) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white.opacity(0.7))
                        .padding(10)
                        .background(Color.white.opacity(0.06))
                        .clipShape(Circle())
                }
                .accessibilityLabel("Close voice mode")
                .buttonStyle(.plain)

                Spacer()

                VStack(spacing: 2) {
                    Text("VOICE MODE")
                        .font(.system(.caption2, design: .monospaced).weight(.black))
                        .foregroundColor(accent)
                        .tracking(2)
                    Text("Day \(shift.dayNumber) — \(shift.title)")
                        .font(.system(.subheadline, design: .rounded).weight(.semibold))
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer()

                Text(elapsedFormatted)
                    .font(.system(.footnote, design: .monospaced).weight(.semibold))
                    .foregroundColor(.white.opacity(0.55))
                    .monospacedDigit()
                    .frame(minWidth: 56, alignment: .trailing)
                    .accessibilityLabel("Elapsed time \(elapsedFormatted)")
            }

            // Shift-progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(.white.opacity(0.08)).frame(height: 3)
                    Capsule().fill(accent.opacity(0.85))
                        .frame(width: max(0, geo.size.width * shiftProgress), height: 3)
                        .animation(reduceMotion ? nil : .easeOut(duration: 0.25), value: shiftProgress)
                }
            }
            .frame(height: 3)
        }
    }

    // MARK: - Status card

    @ViewBuilder
    private var statusCard: some View {
        VStack(spacing: 14) {
            phaseChip
            phaseBody
                .frame(maxWidth: .infinity, alignment: .leading)
            if isAwaitingResponse {
                listenIndicator
            }
            if !session.lastHeard.isEmpty {
                Text("\u{201C}\(session.lastHeard)\u{201D}")
                    .font(.system(.footnote, design: .rounded).weight(.medium))
                    .italic()
                    .foregroundColor(.white.opacity(0.55))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 2)
                    .accessibilityLabel("You said \(session.lastHeard)")
                    .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(22)
        .background(Color.white.opacity(0.05))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(accent.opacity(0.22), lineWidth: 1))
        .cornerRadius(18)
        .animation(.easeInOut(duration: 0.25), value: session.lastHeard)
    }

    private var phaseChip: some View {
        let (label, color, icon) = phaseChrome
        return HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(.caption, design: .default).weight(.bold))
                .foregroundColor(color)
                .contentTransition(.symbolEffect(.replace))
            Text(label)
                .font(.system(.caption2, design: .monospaced).weight(.black))
                .foregroundColor(color)
                .tracking(2)
                .contentTransition(.opacity)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(color.opacity(0.10))
        .overlay(Capsule().stroke(color.opacity(0.4), lineWidth: 1))
        .clipShape(Capsule())
        .animation(.easeInOut(duration: 0.2), value: label)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label)
    }

    @ViewBuilder
    private var phaseBody: some View {
        switch session.phase {
        case .idle:
            Text("Preparing your shift…")
                .font(.system(.headline, design: .rounded).weight(.semibold))
                .foregroundColor(.white.opacity(0.85))
        case .narrating:
            narrationCaption
        case .awaitingChoice(let prompt, let choices):
            choicePanel(prompt: prompt, options: choices)
        case .awaitingQuestion(let prompt, let options, _):
            choicePanel(prompt: prompt, options: options)
        case .confirmingAnswer(let picked, let heard):
            confirmationPanel(picked: picked, heard: heard)
        case .feedback(let line, _):
            Text(line)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.leading)
        case .finished:
            Text("Shift complete.")
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
        case .paused:
            Text("Paused. Press Resume when you're ready.")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
        }
    }

    @ViewBuilder
    private var narrationCaption: some View {
        VStack(alignment: .leading, spacing: 10) {
            if !session.currentSpeaker.isEmpty {
                Text(session.currentSpeaker.uppercased())
                    .font(.system(.caption2, design: .monospaced).weight(.heavy))
                    .foregroundColor(accent.opacity(0.85))
                    .tracking(2)
                    .accessibilityLabel(session.currentSpeaker)
            }
            if session.currentNarration.isEmpty {
                Text("Listen — the next prompt will arrive shortly.")
                    .font(.system(.subheadline, design: .rounded).weight(.medium))
                    .foregroundColor(.white.opacity(0.65))
            } else if VoicePreferences.shared.showCaptions {
                highlightedNarration(full: session.currentNarration,
                                     current: session.narrator.currentChunkText)
                    .font(.system(.body, design: .serif))
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                    .id(session.currentNarration)
            } else {
                // Captions disabled — show a calm waveform animation instead.
                HStack(spacing: 4) {
                    ForEach(0..<5, id: \.self) { i in
                        Capsule()
                            .fill(accent.opacity(0.7))
                            .frame(width: 4, height: pulse ? CGFloat(8 + (i % 3) * 8) : 8)
                            .animation(
                                reduceMotion ? nil
                                             : .easeInOut(duration: 0.6 + Double(i) * 0.05)
                                                  .repeatForever(autoreverses: true),
                                value: pulse
                            )
                    }
                }
                .frame(height: 28)
                .accessibilityHidden(true)
            }
        }
        .animation(.easeInOut(duration: 0.28), value: session.currentNarration)
        .animation(.easeInOut(duration: 0.18), value: session.narrator.currentChunkText)
    }

    /// Renders the full beat text with the currently-speaking sentence
    /// highlighted in white and the rest dimmed — a "karaoke" effect at
    /// sentence granularity. Falls back to even dimming when no chunk is
    /// currently active (between sentences).
    private func highlightedNarration(full: String, current: String) -> Text {
        let dim = Color.white.opacity(0.45)
        let active = Color.white.opacity(0.95)
        let trimmedCurrent = current.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedCurrent.isEmpty,
              let range = full.range(of: trimmedCurrent) else {
            return Text(full).foregroundColor(dim)
        }
        let before = String(full[..<range.lowerBound])
        let after  = String(full[range.upperBound...])
        return Text(before).foregroundColor(dim)
            + Text(trimmedCurrent).foregroundColor(active)
            + Text(after).foregroundColor(dim)
    }

    private func confirmationPanel(picked: String, heard: String) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            VStack(alignment: .leading, spacing: 4) {
                Text("I HEARD")
                    .font(.system(.caption2, design: .monospaced).weight(.black))
                    .foregroundColor(.white.opacity(0.45))
                    .tracking(1.5)
                Text("\u{201C}\(heard)\u{201D}")
                    .italic()
                    .font(.system(.footnote, design: .rounded).weight(.medium))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(2)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("DID YOU MEAN")
                    .font(.system(.caption2, design: .monospaced).weight(.black))
                    .foregroundColor(listen)
                    .tracking(1.5)
                Text(picked)
                    .font(.system(.title3, design: .rounded).weight(.semibold))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }

            HStack(spacing: 12) {
                Button(action: {
                    haptic(.medium)
                    session.submitAnswer(picked)
                }) {
                    HStack {
                        Image(systemName: "checkmark")
                        Text("Yes — submit")
                    }
                    .font(.system(.footnote, design: .rounded).weight(.bold))
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(listen)
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Yes, submit \(picked)")

                Button(action: {
                    haptic(.light)
                    session.repeatLast()
                }) {
                    HStack {
                        Image(systemName: "arrow.uturn.left")
                        Text("No — try again")
                    }
                    .font(.system(.footnote, design: .rounded).weight(.bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.white.opacity(0.08))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(0.18), lineWidth: 1))
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("No, try again")
            }
        }
    }

    private func choicePanel(prompt: String, options: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(prompt)
                .font(.system(.headline, design: .rounded).weight(.semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            ForEach(Array(options.enumerated()), id: \.offset) { idx, c in
                optionRow(letter: letter(idx), text: c) {
                    session.submitAnswer(c)
                }
            }

            #if os(tvOS)
            dictationField
            #endif
        }
    }

    private func optionRow(letter: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            haptic(.selection)
            action()
        }) {
            HStack(spacing: 12) {
                Text(letter)
                    .font(.system(.callout, design: .monospaced).weight(.black))
                    .foregroundColor(accent)
                    .frame(width: 26, height: 26)
                    .background(accent.opacity(0.14))
                    .clipShape(Circle())
                Text(text)
                    .font(.system(.callout, design: .rounded).weight(.medium))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 8)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .frame(minHeight: 48)            // 44pt minimum tap target + breathing room
            .background(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.white.opacity(0.08), lineWidth: 1))
            .cornerRadius(12)
            .contentShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(letter). \(text)")
        .accessibilityAddTraits(.isButton)
    }

    // MARK: - Listening indicator

    private var listenIndicator: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill((isDenied ? Color.red : listen).opacity(0.18))
                    .frame(width: pulse ? 56 : 44, height: pulse ? 56 : 44)
                    .animation(reduceMotion ? nil : .easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: pulse)
                Circle()
                    .fill((isDenied ? Color.red : listen).opacity(0.55))
                    .frame(width: 28, height: 28)
                Image(systemName: isDenied ? "mic.slash.fill" : "mic.fill")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .symbolEffect(.variableColor.iterative, options: reduceMotion ? .nonRepeating : .repeating, isActive: isListening && !reduceMotion)
            }
            .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(listenHeadline)
                    .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    .foregroundColor(.white.opacity(0.92))
                Text(listenSubhead)
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.white.opacity(0.55))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()

            #if os(iOS)
            if isDenied {
                Button("Open Settings") {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                }
                .font(.system(.caption, design: .monospaced).weight(.bold))
                .foregroundColor(.black)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.85))
                .cornerRadius(8)
            }
            #endif
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background((isDenied ? Color.red : listen).opacity(0.06))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke((isDenied ? Color.red : listen).opacity(0.3), lineWidth: 1))
        .cornerRadius(12)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(listenHeadline). \(listenSubhead)")
    }

    private var isDenied: Bool {
        #if os(iOS)
        if case .denied = session.listener.state { return true }
        if case .unavailable = session.listener.state { return true }
        #endif
        return false
    }

    private var listenHeadline: String {
        #if os(iOS)
        switch session.listener.state {
        case .denied:               return "Microphone access needed"
        case .unavailable:          return "Voice answers unavailable"
        case .listening:            return "Listening…"
        case .requestingAuthorization: return "Asking for permission…"
        case .error:                return "Listening hit a snag"
        default:                    return "Tap an option, or say it"
        }
        #else
        return "Press the Siri button on your remote"
        #endif
    }

    private var listenSubhead: String {
        #if os(iOS)
        switch session.listener.state {
        case .denied:    return "Enable Microphone + Speech Recognition in Settings."
        case .listening: return "Say a letter, paraphrase, or say \u{201C}pause\u{201D} / \u{201C}skip\u{201D} / \u{201C}repeat\u{201D}."
        case .error(let e): return e
        default:         return "Or tap an answer above."
        }
        #else
        return "Then dictate your answer, or use the directional pad to pick."
        #endif
    }

    // MARK: - tvOS Siri Remote dictation field

    #if os(tvOS)
    private var dictationField: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("OR DICTATE")
                .font(.system(.caption2, design: .monospaced).weight(.black))
                .foregroundColor(listen.opacity(0.85))
                .tracking(2)
            TextField("Press Siri to speak, or type", text: $dictationText)
                .focused($dictationFocused)
                .submitLabel(.send)
                .font(.system(.callout, design: .rounded))
                .onSubmit {
                    let text = dictationText.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !text.isEmpty else { return }
                    session.submitAnswer(text)
                    dictationText = ""
                }
                .padding(14)
                .background(Color.white.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(listen.opacity(0.35), lineWidth: 1))
                .cornerRadius(10)
        }
    }
    #endif

    // MARK: - Transport controls

    private var transportControls: some View {
        HStack(spacing: 22) {
            controlButton(icon: "backward.fill", label: "Repeat", tint: .white) {
                haptic(.light)
                session.repeatLast()
            }
            controlButton(
                icon: isPaused ? "play.fill" : "pause.fill",
                label: isPaused ? "Resume" : "Pause",
                tint: isPaused ? listen : .white
            ) {
                haptic(.medium)
                if isPaused { session.resume() } else { session.pause() }
            }
            controlButton(icon: "forward.fill", label: "Skip", tint: .white) {
                haptic(.light)
                session.skip()
            }
        }
        .padding(.bottom, 4)
    }

    private func controlButton(icon: String, label: String, tint: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(.title3).weight(.bold))
                    .foregroundColor(tint.opacity(0.95))
                    .frame(width: 56, height: 56)
                    .background(Color.white.opacity(0.06))
                    .overlay(Circle().stroke(.white.opacity(0.1), lineWidth: 1))
                    .clipShape(Circle())
                    .contentTransition(.symbolEffect(.replace))
                Text(label)
                    .font(.system(.caption2, design: .monospaced).weight(.semibold))
                    .foregroundColor(.white.opacity(0.55))
                    .tracking(1.2)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(label)
        .accessibilityAddTraits(.isButton)
    }

    // MARK: - Onboarding overlay

    private var onboardingOverlay: some View {
        ZStack {
            Color.black.opacity(0.65).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 22) {
                Text("VOICE MODE")
                    .font(.system(.caption2, design: .monospaced).weight(.black))
                    .foregroundColor(accent)
                    .tracking(2.5)

                Text("Study with your hands free.")
                    .font(.system(.title, design: .rounded).weight(.black))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)

                VStack(alignment: .leading, spacing: 14) {
                    onboardingRow(icon: "headphones",
                                  title: "Listen to the shift",
                                  body: "Mara narrates each scene. Pause, skip, or repeat any time.")
                    #if os(iOS)
                    onboardingRow(icon: "mic.fill",
                                  title: "Answer out loud",
                                  body: "Say a letter, the choice itself, or paraphrase. On-device recognition — nothing leaves your phone.")
                    #else
                    onboardingRow(icon: "av.remote",
                                  title: "Press Siri on your remote",
                                  body: "Dictate your answer, or use the directional pad to pick visually.")
                    #endif
                    onboardingRow(icon: "lock.shield",
                                  title: "Lock-screen safe",
                                  body: "Audio keeps playing while the screen is off. Great for commutes and chores.")
                    onboardingRow(icon: "person.wave.2.fill",
                                  title: "Voice commands",
                                  body: "Say \u{201C}pause\u{201D}, \u{201C}repeat\u{201D}, \u{201C}skip\u{201D}, or \u{201C}exit\u{201D} any time.")
                }

                Button(action: {
                    haptic(.medium)
                    withAnimation(.easeInOut(duration: 0.25)) { voiceOnboarded = true }
                }) {
                    Text("Start the shift")
                        .font(.system(.headline, design: .rounded).weight(.bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(accent)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Start the shift")
                .accessibilityAddTraits(.isButton)
            }
            .padding(28)
            .frame(maxWidth: 480)
            .background(Color(white: 0.08))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(accent.opacity(0.4), lineWidth: 1))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.55), radius: 30)
            .padding(.horizontal, 24)
        }
    }

    private func onboardingRow(icon: String, title: String, body: String) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.system(.title3).weight(.semibold))
                .foregroundColor(accent)
                .frame(width: 30)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.subheadline, design: .rounded).weight(.bold))
                    .foregroundColor(.white)
                Text(body)
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accessibilityElement(children: .combine)
    }

    // MARK: - Derived state

    private var phaseChrome: (label: String, color: Color, icon: String) {
        switch session.phase {
        case .idle:                  return ("PREPARING",  .white.opacity(0.6), "ellipsis")
        case .narrating:             return ("NARRATING",  accent,              "waveform")
        case .awaitingChoice:        return ("YOUR CALL",  listen,              "questionmark.bubble.fill")
        case .awaitingQuestion:      return ("QUESTION",   listen,              "questionmark.bubble.fill")
        case .confirmingAnswer:      return ("CONFIRM",    listen,              "questionmark.diamond.fill")
        case .feedback(_, let ok):
            if ok == true  { return ("CORRECT", Color(red: 0.30, green: 0.85, blue: 0.55), "checkmark.seal.fill") }
            if ok == false { return ("REFLECT", Color(red: 0.95, green: 0.65, blue: 0.30), "exclamationmark.bubble.fill") }
            return ("MARA",   accent, "ellipsis.bubble.fill")
        case .finished:              return ("COMPLETE",   accent,              "checkmark.circle.fill")
        case .paused:                return ("PAUSED",     .white.opacity(0.55), "pause.circle.fill")
        }
    }

    private var shiftProgress: Double {
        switch session.phase {
        case .finished: return 1.0
        case .idle:     return 0.0
        default:        return session.beatProgress
        }
    }

    private var isAwaitingResponse: Bool {
        switch session.phase {
        case .awaitingChoice, .awaitingQuestion, .confirmingAnswer: return true
        default: return false
        }
    }

    private var isListening: Bool {
        #if os(iOS)
        if case .listening = session.listener.state { return true }
        #endif
        return isAwaitingResponse
    }

    private var isPaused: Bool {
        if case .paused = session.phase { return true }
        return false
    }

    private var elapsedFormatted: String {
        let m = elapsedSeconds / 60
        let s = elapsedSeconds % 60
        return String(format: "%d:%02d", m, s)
    }

    // MARK: - Helpers

    private func startElapsedTimer() {
        elapsedTimer?.invalidate()
        elapsedSeconds = 0
        elapsedTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            elapsedSeconds += 1
        }
    }

    private func stopElapsedTimer() {
        elapsedTimer?.invalidate()
        elapsedTimer = nil
    }

    private func startPulse() {
        guard !reduceMotion else { return }
        pulse = true
    }

    private func exitVoiceMode() {
        haptic(.medium)
        session.stop()
        onExit()
    }

    private func letter(_ i: Int) -> String {
        guard i >= 0, i < 26 else { return "\(i + 1)" }
        return String(UnicodeScalar(65 + i)!)
    }

    private enum HapticStrength { case selection, light, medium, heavy }

    private func haptic(_ kind: HapticStrength) {
        #if os(iOS)
        switch kind {
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
        #endif
    }
}
