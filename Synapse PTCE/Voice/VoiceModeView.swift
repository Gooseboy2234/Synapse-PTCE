//
//  VoiceModeView.swift
//  Synapse PTCE — Voice Mode
//
//  Full-screen hands-free playthrough of a Rimrock shift. TTS narrates;
//  the mic captures voice answers on iOS. tvOS shows visual choices that
//  can be selected with the Siri Remote while TTS narrates.
//

import SwiftUI

struct VoiceModeView: View {
    let shift: RimrockShift
    let onExit: () -> Void

    @State private var session = VoiceSession()
    @State private var listening: Bool = false

    private let accent = Color(red: 1.0, green: 0.65, blue: 0.0)
    private let bgTop  = Color(red: 0.08, green: 0.07, blue: 0.06)
    private let bgBot  = Color(red: 0.03, green: 0.025, blue: 0.02)

    var body: some View {
        ZStack {
            LinearGradient(colors: [bgTop, bgBot], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                header
                Spacer()
                statusCard
                Spacer()
                controls
            }
            .padding(24)
        }
        .task {
            session.onFinished = onExit
            session.start(shift: shift)
        }
        .onDisappear {
            session.stop()
        }
    }

    private var header: some View {
        HStack {
            Button(action: {
                session.stop()
                onExit()
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(10)
                    .background(Color.white.opacity(0.06))
                    .clipShape(Circle())
            }
            Spacer()
            VStack(spacing: 2) {
                Text("VOICE MODE")
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                    .foregroundColor(accent)
                    .tracking(2)
                Text("Day \(shift.dayNumber) — \(shift.title)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(.white.opacity(0.85))
            }
            Spacer()
            // Spacer to balance the close button
            Color.clear.frame(width: 38, height: 38)
        }
    }

    @ViewBuilder
    private var statusCard: some View {
        VStack(spacing: 16) {
            phaseHeadline
            phaseBody
            if !session.lastHeard.isEmpty {
                Text("You said: \"\(session.lastHeard)\"")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.55))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color.white.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(accent.opacity(0.2), lineWidth: 1))
        .cornerRadius(16)
    }

    @ViewBuilder
    private var phaseHeadline: some View {
        switch session.phase {
        case .idle:                        Text("Starting…").phaseHeadlineStyle()
        case .narrating:                   Text("Narrating").phaseHeadlineStyle()
        case .awaitingChoice:              Text("Pick a response").phaseHeadlineStyle(.green)
        case .awaitingQuestion:            Text("Question").phaseHeadlineStyle(.green)
        case .feedback(_, let correct):
            Text(correct == true ? "Correct" : correct == false ? "Reflect" : "")
                .phaseHeadlineStyle(correct == true ? .green : .orange)
        case .finished:                    Text("Shift complete").phaseHeadlineStyle()
        case .paused:                      Text("Paused").phaseHeadlineStyle(.gray)
        }
    }

    @ViewBuilder
    private var phaseBody: some View {
        switch session.phase {
        case .awaitingChoice(let prompt, let choices):
            VStack(alignment: .leading, spacing: 12) {
                Text(prompt)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                ForEach(Array(choices.enumerated()), id: \.offset) { idx, c in
                    optionRow(letter: letter(idx), text: c) {
                        session.submitAnswer(c)
                    }
                }
            }
        case .awaitingQuestion(let prompt, let options, _):
            VStack(alignment: .leading, spacing: 12) {
                Text(prompt)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                ForEach(Array(options.enumerated()), id: \.offset) { idx, c in
                    optionRow(letter: letter(idx), text: c) {
                        session.submitAnswer(c)
                    }
                }
            }
        case .feedback(let line, _):
            Text(line)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
        default:
            EmptyView()
        }
    }

    private func optionRow(letter: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(letter)
                    .font(.system(size: 14, weight: .black, design: .monospaced))
                    .foregroundColor(accent)
                    .frame(width: 24, height: 24)
                    .background(accent.opacity(0.12))
                    .clipShape(Circle())
                Text(text)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.88))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(10)
            .background(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(0.08)))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }

    private var controls: some View {
        HStack(spacing: 22) {
            controlButton(icon: "backward.fill", label: "Repeat") {
                session.repeatLast()
            }
            controlButton(
                icon: session.phase == .paused ? "play.fill" : "pause.fill",
                label: session.phase == .paused ? "Resume" : "Pause"
            ) {
                if session.phase == .paused { session.resume() } else { session.pause() }
            }
            controlButton(icon: "forward.fill", label: "Skip") {
                session.skip()
            }
        }
        .padding(.bottom, 8)
    }

    private func controlButton(icon: String, label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white.opacity(0.85))
                    .frame(width: 52, height: 52)
                    .background(Color.white.opacity(0.06))
                    .clipShape(Circle())
                Text(label)
                    .font(.system(size: 10, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.55))
            }
        }
        .buttonStyle(.plain)
    }

    private func letter(_ i: Int) -> String {
        guard i >= 0, i < 26 else { return "\(i + 1)" }
        return String(UnicodeScalar(65 + i)!)
    }
}

private extension Text {
    func phaseHeadlineStyle(_ color: Color = .orange) -> some View {
        self
            .font(.system(size: 11, weight: .black, design: .monospaced))
            .foregroundColor(color)
            .tracking(2)
    }
}
