//
//  VoiceIntentInbox.swift
//  Synapse PTCE — Voice Mode
//
//  Tiny message-passing inbox that App Intents (Siri / App Shortcuts) write
//  to and the SwiftUI hierarchy reads from. The intent's perform() sets a
//  Pending action; whichever view is mounted observes the inbox and acts on
//  it (typically the iOS map view presenting VoiceModeView).
//

import Foundation

@Observable
@MainActor
final class VoiceIntentInbox {

    static let shared = VoiceIntentInbox()
    private init() {}

    enum Pending: Equatable {
        case startNext
        case continueLast
    }

    private(set) var pending: Pending?

    func requestStartNextShift() {
        pending = .startNext
    }

    func requestContinue() {
        pending = .continueLast
    }

    /// Returns and clears the pending action. Call from .onAppear / .task
    /// hooks in whichever view is responsible for opening VoiceModeView.
    func consume() -> Pending? {
        let p = pending
        pending = nil
        return p
    }
}
