//
//  LiveActivityController.swift
//  Synapse PTCE — Live Activities
//
//  Thin facade over ActivityKit. Starts, updates, and ends a Rimrock shift
//  Live Activity from inside the app. iOS only; no-ops elsewhere.
//

import Foundation

#if canImport(ActivityKit)
import ActivityKit

@available(iOS 16.2, *)
@MainActor
final class LiveActivityController {

    static let shared = LiveActivityController()
    private init() {}

    private var current: Activity<RimrockActivityAttributes>?

    /// True if the system allows Live Activities right now.
    var areActivitiesEnabled: Bool {
        ActivityAuthorizationInfo().areActivitiesEnabled
    }

    func start(shiftTitle: String, initialState: RimrockActivityAttributes.ContentState) {
        guard areActivitiesEnabled else { return }
        end()  // collapse any prior activity
        let attrs = RimrockActivityAttributes(shiftTitle: shiftTitle)
        do {
            current = try Activity.request(
                attributes: attrs,
                content: .init(state: initialState, staleDate: nil),
                pushType: nil
            )
        } catch {
            // Swallow — Live Activities are best-effort.
        }
    }

    func update(_ state: RimrockActivityAttributes.ContentState) {
        guard let current else { return }
        Task {
            await current.update(.init(state: state, staleDate: nil))
        }
    }

    func end(finalState: RimrockActivityAttributes.ContentState? = nil) {
        guard let activity = current else { return }
        self.current = nil
        let content: ActivityContent<RimrockActivityAttributes.ContentState>? =
            finalState.map { .init(state: $0, staleDate: nil) }
        Task {
            await activity.end(content, dismissalPolicy: .immediate)
        }
    }
}

#else

@MainActor
final class LiveActivityController {
    static let shared = LiveActivityController()
    private init() {}
    var areActivitiesEnabled: Bool { false }
    func start(shiftTitle: String, initialState: Any) {}
    func update(_ state: Any) {}
    func end(finalState: Any? = nil) {}
}

#endif
