//
//  RimrockActivityAttributes.swift
//  Synapse PTCE — Live Activities
//
//  Shared data type for the Rimrock shift Live Activity. Imported by both the
//  main app target (to start/update activities) and the Widget Extension
//  target (to render lock-screen + Dynamic Island views).
//
//  To use this type in the widget extension, add this single .swift file to
//  the widget target's "Compile Sources" build phase via Xcode's File Inspector.
//

import Foundation

#if canImport(ActivityKit)
import ActivityKit

@available(iOS 16.1, *)
public struct RimrockActivityAttributes: ActivityAttributes {

    public struct ContentState: Codable, Hashable {
        /// 1-based shift day number.
        public var dayNumber: Int
        /// Current scene or speaker label, e.g. "Mara: phone with Mrs. Abernathy".
        public var sceneLabel: String
        /// 0.0 to 1.0 — progress through the shift's beat list.
        public var progress: Double
        /// Day streak.
        public var streak: Int
        /// True while waiting on a player choice or question response.
        public var awaitingResponse: Bool
        /// Short prompt for the current choice/question (truncated for chrome).
        public var promptPreview: String?
        /// When the voice-mode session started. Lets the widget render a live
        /// ticking elapsed-time label via `Text(_, style: .timer)`.
        public var sessionStartedAt: Date

        public init(dayNumber: Int,
                    sceneLabel: String,
                    progress: Double,
                    streak: Int,
                    awaitingResponse: Bool,
                    promptPreview: String?,
                    sessionStartedAt: Date) {
            self.dayNumber = dayNumber
            self.sceneLabel = sceneLabel
            self.progress = progress
            self.streak = streak
            self.awaitingResponse = awaitingResponse
            self.promptPreview = promptPreview
            self.sessionStartedAt = sessionStartedAt
        }
    }

    /// Static attributes — set once when the activity starts.
    public let shiftTitle: String

    public init(shiftTitle: String) {
        self.shiftTitle = shiftTitle
    }
}
#endif
