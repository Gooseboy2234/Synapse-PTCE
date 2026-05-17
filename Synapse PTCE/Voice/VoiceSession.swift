//
//  VoiceSession.swift
//  Synapse PTCE — Voice Mode
//
//  Orchestrates a hands-free playthrough of a RimrockShift. Walks the beat
//  stream, narrates scenes and dialogue, presents questions and choices,
//  and matches spoken responses to the available options.
//

import Foundation

@Observable
@MainActor
final class VoiceSession {

    enum Phase: Equatable {
        case idle
        case narrating(beatIndex: Int)
        case awaitingChoice(prompt: String, choices: [String])
        case awaitingQuestion(prompt: String, options: [String], correct: String)
        case feedback(line: String, isCorrect: Bool?)
        case finished
        case paused
    }

    private(set) var phase: Phase = .idle
    private(set) var lastHeard: String = ""

    let narrator = VoiceNarrator()
    let listener = VoiceListener()

    // Beat stream — set when a shift starts.
    private var beats: [RimrockBeat] = []
    private var cursor: Int = 0
    private var resumeAfterPause: (() -> Void)?
    /// Set while we're waiting on the listener; lets the view inject a tapped answer.
    private var pendingAnswerCompletion: ((String) -> Void)?

    /// Called when the player picks a choice via voice. Returns the index into
    /// the choices array.
    var onChoiceResolved: ((Int) -> Void)?
    /// Called when a question is answered. Returns the chosen option text and
    /// whether it was correct.
    var onQuestionResolved: ((String, Bool) -> Void)?
    /// Called when the shift's beat list is exhausted.
    var onFinished: (() -> Void)?

    private var activeShift: RimrockShift?

    // MARK: - Lifecycle

    func start(shift: RimrockShift) {
        beats = shift.beats
        cursor = 0
        activeShift = shift
        startLiveActivity(for: shift)
        narrator.speak("\(shift.title). Day \(shift.dayNumber).") { [weak self] in
            self?.advance()
        }
    }

    func pause() {
        narrator.pause()
        listener.stop()
        phase = .paused
    }

    func resume() {
        if narrator.state == .paused {
            narrator.resume()
        } else {
            advance()
        }
    }

    func stop() {
        narrator.stop()
        listener.stop()
        endLiveActivity()
        phase = .finished
    }

    // MARK: - Live Activity

    private func startLiveActivity(for shift: RimrockShift) {
        #if canImport(ActivityKit)
        if #available(iOS 16.2, *) {
            let state = RimrockActivityAttributes.ContentState(
                dayNumber: shift.dayNumber,
                sceneLabel: "Starting…",
                progress: 0,
                streak: 0,
                awaitingResponse: false,
                promptPreview: nil
            )
            LiveActivityController.shared.start(
                shiftTitle: "\(shift.title) — Day \(shift.dayNumber)",
                initialState: state
            )
        }
        #endif
    }

    private func updateLiveActivity(label: String, awaiting: Bool, prompt: String? = nil) {
        #if canImport(ActivityKit)
        if #available(iOS 16.2, *) {
            guard let shift = activeShift else { return }
            let p = beats.isEmpty ? 0 : Double(cursor) / Double(max(beats.count, 1))
            let state = RimrockActivityAttributes.ContentState(
                dayNumber: shift.dayNumber,
                sceneLabel: label,
                progress: min(max(p, 0), 1),
                streak: 0,
                awaitingResponse: awaiting,
                promptPreview: prompt
            )
            LiveActivityController.shared.update(state)
        }
        #endif
    }

    private func endLiveActivity() {
        #if canImport(ActivityKit)
        if #available(iOS 16.2, *) {
            LiveActivityController.shared.end(finalState: nil)
        }
        #endif
    }

    /// Re-speak the last narrated beat.
    func repeatLast() {
        guard cursor > 0 else { return }
        cursor -= 1
        advance()
    }

    func skip() {
        narrator.stop()
        advance()
    }

    /// Manually resolve the current question or choice. Used when the user taps
    /// an option in the UI instead of (or after) speaking.
    func submitAnswer(_ text: String) {
        listener.stop()
        let cb = pendingAnswerCompletion
        pendingAnswerCompletion = nil
        cb?(text)
    }

    // MARK: - Beat playback

    private func advance() {
        guard cursor < beats.count else {
            phase = .finished
            narrator.speak("End of shift.") { [weak self] in
                self?.onFinished?()
            }
            return
        }
        let beat = beats[cursor]
        cursor += 1
        play(beat)
    }

    private func play(_ beat: RimrockBeat) {
        switch beat {
        case .scene(let text):
            phase = .narrating(beatIndex: cursor - 1)
            updateLiveActivity(label: "Scene", awaiting: false)
            narrator.speak(text) { [weak self] in self?.advance() }

        case .dialogue(let speaker, let lines):
            phase = .narrating(beatIndex: cursor - 1)
            let label = speaker.displayLabel.isEmpty ? "" : "\(speaker.displayLabel) says, "
            updateLiveActivity(label: speaker.displayLabel.isEmpty ? "Narration" : speaker.displayLabel, awaiting: false)
            narrator.speak(label + lines.joined(separator: " ")) { [weak self] in self?.advance() }

        case .nameEntry:
            // Voice mode skips name entry for now — the engine collects it in the UI.
            advance()

        case .prescription(let rx):
            phase = .narrating(beatIndex: cursor - 1)
            let text = "Prescription from \(rx.prescriberName). For \(rx.patientName). \(rx.drug) \(rx.strength). Sig: \(rx.sig). Quantity \(rx.quantity), refills \(rx.refills)."
            narrator.speak(text) { [weak self] in self?.advance() }

        case .question(let q):
            presentQuestion(q)

        case .phoneCall(let call):
            phase = .narrating(beatIndex: cursor - 1)
            let lines = call.turns.map { "\($0.speaker.displayLabel): \($0.line)" }.joined(separator: ". ")
            narrator.speak("Phone call from \(call.callerID). \(lines)") { [weak self] in self?.advance() }

        case .choice(let prompt, let choices):
            presentChoice(prompt: prompt, choices: choices)

        case .object(let name, let description, _):
            phase = .narrating(beatIndex: cursor - 1)
            narrator.speak("You notice \(name). \(description)") { [weak self] in self?.advance() }

        case .ending(let ending):
            phase = .feedback(line: ending.body, isCorrect: false)
            let line = "\(ending.title). \(ending.body) Lesson: \(ending.ptceLesson)"
            narrator.speak(line) { [weak self] in
                self?.phase = .finished
                self?.onFinished?()
            }

        case .shiftEnd(let closing):
            phase = .feedback(line: closing ?? "Shift complete.", isCorrect: nil)
            narrator.speak(closing ?? "Shift complete.") { [weak self] in
                self?.phase = .finished
                self?.onFinished?()
            }
        }
    }

    // MARK: - Question + choice handling

    private func presentQuestion(_ q: RimrockQuestion) {
        phase = .awaitingQuestion(prompt: q.prompt, options: q.options, correct: q.correctAnswer)
        updateLiveActivity(label: "Question", awaiting: true, prompt: q.prompt)
        let optionText = q.options.enumerated()
            .map { "\(letter(for: $0.offset)). \($0.element)" }
            .joined(separator: ". ")
        narrator.speak("\(q.prompt). \(optionText).") { [weak self] in
            self?.listenForAnswer(options: q.options, correct: q.correctAnswer) { picked in
                let isCorrect = picked == q.correctAnswer
                let line = isCorrect ? q.onCorrect : q.onWrong
                self?.phase = .feedback(line: line, isCorrect: isCorrect)
                self?.onQuestionResolved?(picked, isCorrect)
                self?.narrator.speak(line) { self?.advance() }
            }
        }
    }

    private func presentChoice(prompt: String, choices: [RimrockChoice]) {
        let labels = choices.map(\.label)
        phase = .awaitingChoice(prompt: prompt, choices: labels)
        updateLiveActivity(label: "Choice", awaiting: true, prompt: prompt)
        let optionText = labels.enumerated()
            .map { "\(letter(for: $0.offset)). \($0.element)" }
            .joined(separator: ". ")
        narrator.speak("\(prompt). \(optionText).") { [weak self] in
            self?.listenForAnswer(options: labels, correct: nil) { picked in
                let idx = labels.firstIndex(of: picked) ?? 0
                self?.onChoiceResolved?(idx)
                let response = choices[idx].response
                self?.beats.insert(contentsOf: response, at: self?.cursor ?? 0)
                self?.advance()
            }
        }
    }

    private func listenForAnswer(options: [String],
                                  correct: String?,
                                  completion: @escaping (String) -> Void) {
        pendingAnswerCompletion = completion
        listener.requestPermissions { [weak self] granted in
            guard let self else { return }
            guard granted else {
                // Permission denied — leave pendingAnswerCompletion set so the
                // view's tap-to-pick fallback can resolve.
                return
            }
            self.listener.start(
                onPartial: { partial in
                    self.lastHeard = partial
                },
                onFinal: { final in
                    self.lastHeard = final
                    let picked = self.match(spoken: final, against: options) ?? correct ?? options.first ?? ""
                    let cb = self.pendingAnswerCompletion
                    self.pendingAnswerCompletion = nil
                    cb?(picked)
                }
            )
        }
    }

    // MARK: - Utterance matching

    /// Match a free-form spoken response to one of the available option texts.
    /// Strategy:
    ///   1. Letter ("A"/"B"/"C"/"D" or phonetic alpha/bravo/charlie/delta)
    ///   2. Token overlap (largest Jaccard wins)
    ///   3. Substring containment
    func match(spoken: String, against options: [String]) -> String? {
        let normalized = spoken.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else { return nil }

        // 1. Letter / phonetic
        let phonetic: [String: Int] = [
            "a": 0, "alpha": 0, "ay": 0,
            "b": 1, "bravo": 1, "bee": 1,
            "c": 2, "charlie": 2, "see": 2, "sea": 2,
            "d": 3, "delta": 3, "dee": 3
        ]
        let firstWord = normalized.split(separator: " ").first.map(String.init) ?? normalized
        if let idx = phonetic[firstWord], idx < options.count {
            return options[idx]
        }

        // 2. Token overlap (Jaccard) and substring containment
        let spokenTokens = Set(normalized.split(separator: " ").map(String.init))
        var best: (option: String, score: Double)? = nil
        for opt in options {
            let optLower = opt.lowercased()
            let optTokens = Set(optLower.split(separator: " ").map(String.init))
            let inter = spokenTokens.intersection(optTokens).count
            let union = spokenTokens.union(optTokens).count
            let jaccard = union == 0 ? 0 : Double(inter) / Double(union)
            let containment = (normalized.contains(optLower) || optLower.contains(normalized)) ? 0.5 : 0
            let score = jaccard + containment
            if best == nil || score > best!.score {
                best = (opt, score)
            }
        }
        if let b = best, b.score > 0.2 { return b.option }
        return nil
    }

    private func letter(for index: Int) -> String {
        guard index >= 0, index < 26 else { return "\(index + 1)" }
        return String(UnicodeScalar(65 + index)!)
    }
}
