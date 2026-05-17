//
//  AppShortcuts.swift
//  Synapse PTCE — Voice Mode
//
//  Siri / App Shortcuts integration. Users can say "Hey Siri, start my
//  Synapse PTCE shift" (or any of the variants below) and the app opens
//  directly into Voice Mode. App Intents framework, iOS 16+.
//

import Foundation

#if os(iOS)
import AppIntents

// MARK: - Start the next shift

@available(iOS 16.0, *)
struct StartShiftIntent: AppIntent {

    static let title: LocalizedStringResource = "Start my next shift"
    static let description = IntentDescription(
        "Opens Synapse PTCE Voice Mode with your next pharmacy tech shift. Mara narrates while you study hands-free.",
        categoryName: "Study"
    )

    /// Force the app to open so the SwiftUI hierarchy can mount voice mode.
    static let openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        VoiceIntentInbox.shared.requestStartNextShift()
        return .result(dialog: "Starting your next shift.")
    }
}

// MARK: - Continue the last shift

@available(iOS 16.0, *)
struct ContinueShiftIntent: AppIntent {

    static let title: LocalizedStringResource = "Continue my last shift"
    static let description = IntentDescription(
        "Resumes the Synapse PTCE Voice Mode shift you were in the middle of.",
        categoryName: "Study"
    )

    static let openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        VoiceIntentInbox.shared.requestContinue()
        if let saved = VoiceSessionMemory.shared.last {
            let day = saved.dayNumber
            return .result(dialog: "Resuming Day \(day).")
        } else {
            return .result(dialog: "No saved shift — starting your next one.")
        }
    }
}

// MARK: - Shortcuts provider

@available(iOS 16.0, *)
struct SynapsePTCEAppShortcuts: AppShortcutsProvider {

    static var shortcutTileColor: ShortcutTileColor = .orange

    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: StartShiftIntent(),
            phrases: [
                "Start my \(.applicationName) shift",
                "Start \(.applicationName) Voice Mode",
                "Open \(.applicationName) Voice Mode",
                "Begin a \(.applicationName) shift",
                "Practice \(.applicationName) hands free"
            ],
            shortTitle: "Start shift",
            systemImageName: "mic.fill"
        )

        AppShortcut(
            intent: ContinueShiftIntent(),
            phrases: [
                "Continue my \(.applicationName) shift",
                "Resume \(.applicationName) Voice Mode",
                "Pick up where I left off in \(.applicationName)"
            ],
            shortTitle: "Continue shift",
            systemImageName: "play.fill"
        )
    }
}

#endif

