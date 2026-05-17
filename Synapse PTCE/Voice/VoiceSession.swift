//
//  VoiceSession.swift
//  Synapse PTCE — Voice Mode
//
//  Orchestrates a hands-free playthrough of a RimrockShift. Walks the beat
//  stream, narrates scenes and dialogue, presents questions and choices,
//  and matches spoken responses to the available options.
//

import Foundation
import AVFoundation

@Observable
@MainActor
final class VoiceSession {

    enum Phase: Equatable {
        case idle
        case narrating(beatIndex: Int)
        case awaitingChoice(prompt: String, choices: [String])
        case awaitingQuestion(prompt: String, options: [String], correct: String)
        /// Low-confidence match — asking the user to confirm before submitting.
        case confirmingAnswer(picked: String, heard: String)
        case feedback(line: String, isCorrect: Bool?)
        case finished
        case paused
    }

    private(set) var phase: Phase = .idle
    private(set) var lastHeard: String = ""
    /// Text the narrator is currently speaking — surfaced as a live caption.
    private(set) var currentNarration: String = ""
    /// Optional label identifying the speaker, e.g. "Mara", "Narrator".
    private(set) var currentSpeaker: String = ""

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
    /// Optional view hook for haptics or sound effects on every answer.
    /// Bool argument is isCorrect for questions; nil for tone-only choices.
    var onAnswerResolved: ((Bool?) -> Void)?

    private var activeShift: RimrockShift?

    // MARK: - Lifecycle

    func start(shift: RimrockShift) {
        beats = shift.beats
        cursor = 0
        activeShift = shift
        sessionStartedAt = Date()
        startLiveActivity(for: shift)
        setupAudioSession()
        observeInterruptions()
        NowPlayingController.shared.attach(self)
        pushNowPlaying(label: "Starting…", awaiting: false)
        narrator.speak("\(shift.title). Day \(shift.dayNumber).") { [weak self] in
            self?.advance()
        }
    }

    private var sessionStartedAt: Date?

    private func pushNowPlaying(label: String, awaiting: Bool) {
        guard let shift = activeShift else { return }
        let elapsed = sessionStartedAt.map { Date().timeIntervalSince($0) } ?? 0
        NowPlayingController.shared.updateMetadata(
            shiftTitle: "\(shift.title) — Day \(shift.dayNumber)",
            sceneLabel: label,
            awaiting: awaiting,
            elapsedSeconds: elapsed
        )
    }

    private func setupAudioSession() {
        #if os(iOS) || os(tvOS)
        do {
            let session = AVAudioSession.sharedInstance()
            // .playback keeps TTS audible while the screen is locked. When the
            // listener actually starts mic capture, it upgrades to .playAndRecord
            // temporarily.
            try session.setCategory(.playback, mode: .spokenAudio,
                                    options: [.duckOthers])
            try session.setActive(true, options: [])
        } catch {
            // Best-effort; voice mode degrades to foreground-only audio.
        }
        #endif
    }

    private var interruptionObserver: NSObjectProtocol?
    private var routeChangeObserver: NSObjectProtocol?

    private func observeInterruptions() {
        #if os(iOS) || os(tvOS)
        if interruptionObserver == nil {
            interruptionObserver = NotificationCenter.default.addObserver(
                forName: AVAudioSession.interruptionNotification,
                object: AVAudioSession.sharedInstance(),
                queue: .main
            ) { [weak self] note in
                guard let self else { return }
                guard let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
                      let type = AVAudioSession.InterruptionType(rawValue: raw) else { return }
                Task { @MainActor in
                    switch type {
                    case .began:
                        self.pause()
                    case .ended:
                        // Don't auto-resume — let the user decide. They tapped
                        // into a phone call or Siri; coming back to the app
                        // and pressing Resume is the correct mental model.
                        break
                    @unknown default:
                        break
                    }
                }
            }
        }

        if routeChangeObserver == nil {
            routeChangeObserver = NotificationCenter.default.addObserver(
                forName: AVAudioSession.routeChangeNotification,
                object: AVAudioSession.sharedInstance(),
                queue: .main
            ) { [weak self] note in
                guard let self,
                      VoicePreferences.shared.pauseOnHeadphoneUnplug,
                      let raw = note.userInfo?[AVAudioSessionRouteChangeReasonKey] as? UInt,
                      let reason = AVAudioSession.RouteChangeReason(rawValue: raw)
                else { return }
                Task { @MainActor in
                    // .oldDeviceUnavailable fires when AirPods are removed or a
                    // wired headphone is unplugged. Auto-pause so the shift
                    // doesn't blast out of the phone speaker.
                    if reason == .oldDeviceUnavailable {
                        self.pause()
                    }
                }
            }
        }
        #endif
    }

    private func teardownInterruptionObserver() {
        if let obs = interruptionObserver {
            NotificationCenter.default.removeObserver(obs)
            interruptionObserver = nil
        }
        if let obs = routeChangeObserver {
            NotificationCenter.default.removeObserver(obs)
            routeChangeObserver = nil
        }
    }

    func pause() {
        narrator.pause()
        listener.stop()
        phase = .paused
        pushNowPlaying(label: "Paused", awaiting: true)
    }

    func resume() {
        if narrator.state == .paused {
            narrator.resume()
        } else {
            advance()
        }
        pushNowPlaying(label: nowPlayingLabelForCurrentPhase(), awaiting: false)
    }

    private func clearNarration() {
        currentNarration = ""
        currentSpeaker = ""
    }

    private func nowPlayingLabelForCurrentPhase() -> String {
        switch phase {
        case .awaitingChoice(let prompt, _): return "Your call — \(prompt)"
        case .awaitingQuestion(let prompt, _, _): return "Question — \(prompt)"
        case .feedback(let line, _):  return "Mara: \(line.prefix(60))"
        default:                      return "Listening to your shift"
        }
    }

    func stop() {
        // Persist mid-shift state for the "Continue your shift" CTA, but only
        // for curated shifts (procedural shifts can't be reconstructed).
        if let shift = activeShift,
           phase != .finished,
           !beats.isEmpty,
           cursor > 0,
           cursor < beats.count {
            let elapsed = sessionStartedAt.map { Int(Date().timeIntervalSince($0)) } ?? 0
            VoiceSessionMemory.shared.record(
                dayNumber: shift.dayNumber,
                elapsedSeconds: elapsed,
                beatCursor: cursor
            )
        } else if phase == .finished {
            VoiceSessionMemory.shared.clear()
        }
        narrator.stop()
        listener.stop()
        endLiveActivity()
        teardownInterruptionObserver()
        NowPlayingController.shared.detach()
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
                promptPreview: nil,
                sessionStartedAt: sessionStartedAt ?? Date()
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
                promptPreview: prompt,
                sessionStartedAt: sessionStartedAt ?? Date()
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
            currentSpeaker = "Narration"
            currentNarration = text
            updateLiveActivity(label: "Scene", awaiting: false)
            pushNowPlaying(label: "Scene", awaiting: false)
            narrator.speak(text) { [weak self] in self?.clearNarration(); self?.advance() }

        case .dialogue(let speaker, let lines):
            phase = .narrating(beatIndex: cursor - 1)
            let label = speaker.displayLabel.isEmpty ? "" : "\(speaker.displayLabel) says, "
            let nowLabel = speaker.displayLabel.isEmpty ? "Narration" : speaker.displayLabel
            currentSpeaker = nowLabel
            currentNarration = lines.joined(separator: " ")
            updateLiveActivity(label: nowLabel, awaiting: false)
            pushNowPlaying(label: nowLabel, awaiting: false)
            narrator.speak(label + lines.joined(separator: " ")) { [weak self] in self?.clearNarration(); self?.advance() }

        case .nameEntry:
            // Voice mode skips name entry for now — the engine collects it in the UI.
            advance()

        case .prescription(let rx):
            phase = .narrating(beatIndex: cursor - 1)
            let text = "Prescription from \(rx.prescriberName). For \(rx.patientName). \(rx.drug) \(rx.strength). Sig: \(rx.sig). Quantity \(rx.quantity), refills \(rx.refills)."
            currentSpeaker = "Prescription"
            currentNarration = text
            narrator.speak(text) { [weak self] in self?.clearNarration(); self?.advance() }

        case .question(let q):
            presentQuestion(q)

        case .phoneCall(let call):
            phase = .narrating(beatIndex: cursor - 1)
            let lines = call.turns.map { "\($0.speaker.displayLabel): \($0.line)" }.joined(separator: ". ")
            currentSpeaker = "Phone — \(call.callerID)"
            currentNarration = lines
            narrator.speak("Phone call from \(call.callerID). \(lines)") { [weak self] in self?.clearNarration(); self?.advance() }

        case .choice(let prompt, let choices):
            presentChoice(prompt: prompt, choices: choices)

        case .object(let name, let description, _):
            phase = .narrating(beatIndex: cursor - 1)
            currentSpeaker = "You notice"
            currentNarration = "\(name) — \(description)"
            narrator.speak("You notice \(name). \(description)") { [weak self] in self?.clearNarration(); self?.advance() }

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
        pushNowPlaying(label: "Question — \(q.prompt)", awaiting: true)
        let optionText = q.options.enumerated()
            .map { "\(letter(for: $0.offset)). \($0.element)" }
            .joined(separator: ". ")
        narrator.speak("\(q.prompt). \(optionText).") { [weak self] in
            self?.listenForAnswer(options: q.options, correct: q.correctAnswer) { picked in
                let isCorrect = picked == q.correctAnswer
                let line = isCorrect ? q.onCorrect : q.onWrong
                self?.phase = .feedback(line: line, isCorrect: isCorrect)
                self?.onQuestionResolved?(picked, isCorrect)
                self?.onAnswerResolved?(isCorrect)
                self?.narrator.speak(line) { self?.advance() }
            }
        }
    }

    private func presentChoice(prompt: String, choices: [RimrockChoice]) {
        let labels = choices.map(\.label)
        phase = .awaitingChoice(prompt: prompt, choices: labels)
        updateLiveActivity(label: "Choice", awaiting: true, prompt: prompt)
        pushNowPlaying(label: "Your call — \(prompt)", awaiting: true)
        let optionText = labels.enumerated()
            .map { "\(letter(for: $0.offset)). \($0.element)" }
            .joined(separator: ". ")
        narrator.speak("\(prompt). \(optionText).") { [weak self] in
            self?.listenForAnswer(options: labels, correct: nil) { picked in
                guard let self else { return }
                let idx = labels.firstIndex(of: picked) ?? 0
                self.onChoiceResolved?(idx)
                self.onAnswerResolved?(nil)
                let response = choices[idx].response
                self.beats.insert(contentsOf: response, at: self.cursor)
                self.advance()
            }
        }
    }

    /// Confidence threshold below which we ask the user to confirm before
    /// submitting (subject to VoicePreferences.confirmLowConfidenceMatches).
    private let lowConfidenceThreshold: Double = 0.55

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
                    // Intercept global voice commands first.
                    if let cmd = self.interpretGlobalCommand(final) {
                        self.handleGlobalCommand(cmd, options: options, correct: correct)
                        return
                    }
                    self.resolveAnswer(spoken: final, options: options, correct: correct)
                }
            )
        }
    }

    private func resolveAnswer(spoken: String, options: [String], correct: String?) {
        let prefs = VoicePreferences.shared
        let match = matchWithConfidence(spoken: spoken, against: options)
        let picked = match?.option ?? correct ?? options.first ?? ""

        // If confidence is comfortably high, or confirmation is disabled, just submit.
        guard prefs.confirmLowConfidenceMatches,
              let m = match,
              m.confidence < lowConfidenceThreshold else {
            let cb = pendingAnswerCompletion
            pendingAnswerCompletion = nil
            cb?(picked)
            return
        }

        // Otherwise present a confirmation prompt: "Did you mean X? Yes or no."
        confirmAnswer(picked: m.option, heard: spoken, options: options, correct: correct)
    }

    private func confirmAnswer(picked: String, heard: String,
                                options: [String], correct: String?) {
        phase = .confirmingAnswer(picked: picked, heard: heard)
        updateLiveActivity(label: "Confirming…", awaiting: true, prompt: "Did you mean: \(picked)?")
        pushNowPlaying(label: "Confirming — \(picked.prefix(40))", awaiting: true)
        let prompt = "I heard \(heard). Did you mean: \(picked)? Say yes or no."
        narrator.speak(prompt) { [weak self] in
            self?.listenForYesNo(options: options, correct: correct, picked: picked)
        }
    }

    private func listenForYesNo(options: [String], correct: String?, picked: String) {
        // Re-arm the listener for a short yes/no answer.
        listener.start(
            onPartial: { [weak self] partial in self?.lastHeard = partial },
            onFinal:   { [weak self] final in
                guard let self else { return }
                self.lastHeard = final
                let normalized = final
                    .lowercased()
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .trimmingCharacters(in: .punctuationCharacters)
                let yes = ["yes", "yeah", "yep", "yup", "correct", "right", "submit", "send it", "uh huh", "mm hm"]
                let no  = ["no", "nope", "nah", "wrong", "redo", "try again", "let me redo", "again"]
                if yes.contains(normalized) || yes.contains(where: { normalized.hasPrefix($0) }) {
                    let cb = self.pendingAnswerCompletion
                    self.pendingAnswerCompletion = nil
                    cb?(picked)
                } else if no.contains(normalized) || no.contains(where: { normalized.hasPrefix($0) }) {
                    // Re-listen for the full answer.
                    self.listenForAnswer(options: options, correct: correct,
                                         completion: self.pendingAnswerCompletion ?? { _ in })
                } else {
                    // Ambiguous yes/no — treat as a fresh answer attempt.
                    self.resolveAnswer(spoken: final, options: options, correct: correct)
                }
            }
        )
    }

    // MARK: - Global voice commands

    enum GlobalCommand {
        case pause
        case resume
        case repeatLast
        case skip
        case exit
    }

    /// Maps a free-form utterance to a global command, if it matches one.
    /// Only triggers on short, unambiguous utterances so it doesn't swallow
    /// answers like "skip the morphine question".
    func interpretGlobalCommand(_ spoken: String) -> GlobalCommand? {
        let normalized = spoken
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .trimmingCharacters(in: .punctuationCharacters)
        // Heuristic: only treat as a command if the utterance is ≤ 3 words.
        guard normalized.split(separator: " ").count <= 3 else { return nil }

        if ["pause", "wait", "hold on", "hold"].contains(normalized) { return .pause }
        if ["resume", "continue", "go", "go on", "go ahead"].contains(normalized) { return .resume }
        if ["repeat", "again", "say again", "say that again", "what"].contains(normalized) { return .repeatLast }
        if ["skip", "next", "move on", "skip it"].contains(normalized) { return .skip }
        if ["exit", "quit", "stop", "end", "stop voice", "stop it"].contains(normalized) { return .exit }
        return nil
    }

    /// Execute a global command in the middle of an answer prompt. If the
    /// command doesn't end the prompt, we re-arm the listener so the user can
    /// still answer the question.
    private func handleGlobalCommand(_ cmd: GlobalCommand,
                                     options: [String],
                                     correct: String?) {
        switch cmd {
        case .pause:
            pause()
        case .resume:
            resume()
            // Re-listen for the answer.
            listenForAnswer(options: options, correct: correct,
                            completion: pendingAnswerCompletion ?? { _ in })
        case .repeatLast:
            pendingAnswerCompletion = nil
            // Move cursor back so we re-play the question/choice prompt.
            cursor = max(0, cursor - 1)
            advance()
        case .skip:
            // Treat skip as picking the canonical correct answer for a question,
            // or the first option for a choice, so the shift can continue.
            let picked = correct ?? options.first ?? ""
            let cb = pendingAnswerCompletion
            pendingAnswerCompletion = nil
            cb?(picked)
        case .exit:
            stop()
            onFinished?()
        }
    }

    // MARK: - Utterance matching

    /// Match a free-form spoken response to one of the available option texts.
    /// Returns the matched option and a confidence score (0…∞ — higher is
    /// better; 1.0 is the threshold above which we treat a match as certain).
    /// Strategy:
    ///   1. Letter ("A"/"B"/"C"/"D" or phonetic alpha/bravo/charlie/delta) →
    ///      perfect confidence (1.5).
    ///   2. Substring containment of an option's text inside the spoken phrase
    ///      → high confidence.
    ///   3. Token overlap (Jaccard) → graded confidence.
    func matchWithConfidence(spoken: String, against options: [String]) -> (option: String, confidence: Double)? {
        let normalized = spoken.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty, !options.isEmpty else { return nil }

        // 1. Letter / phonetic
        let phonetic: [String: Int] = [
            "a": 0, "alpha": 0, "ay": 0, "ae": 0,
            "b": 1, "bravo": 1, "bee": 1, "be": 1,
            "c": 2, "charlie": 2, "see": 2, "sea": 2,
            "d": 3, "delta": 3, "dee": 3, "the": 3
        ]
        let firstWord = normalized.split(separator: " ").first.map(String.init) ?? normalized
        if let idx = phonetic[firstWord], idx < options.count {
            return (options[idx], 1.5)
        }

        // 2 + 3 — score every option, pick the best.
        let spokenTokens = Set(normalized.split(separator: " ").map(String.init))
        var best: (option: String, score: Double)? = nil
        for opt in options {
            let optLower = opt.lowercased()
            let optTokens = Set(optLower.split(separator: " ").map(String.init))
            let inter = spokenTokens.intersection(optTokens).count
            let union = spokenTokens.union(optTokens).count
            let jaccard = union == 0 ? 0 : Double(inter) / Double(union)
            let containment = (normalized.contains(optLower) || optLower.contains(normalized)) ? 0.6 : 0
            let score = jaccard + containment
            if best == nil || score > best!.score {
                best = (opt, score)
            }
        }
        if let b = best, b.score > 0.15 { return (b.option, b.score) }
        return nil
    }

    /// Back-compat — drops the confidence and falls back to the canonical
    /// answer when no match is found.
    func match(spoken: String, against options: [String]) -> String? {
        matchWithConfidence(spoken: spoken, against: options)?.option
    }

    private func letter(for index: Int) -> String {
        guard index >= 0, index < 26 else { return "\(index + 1)" }
        return String(UnicodeScalar(65 + index)!)
    }
}
