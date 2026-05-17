//
//  DailyReminderController.swift
//  Synapse PTCE
//
//  Daily local notification that nudges the user back into the app to
//  preserve their study streak. Permission is requested only when the user
//  explicitly opts in via Settings — we never surface the system prompt
//  unsolicited.
//

import Foundation

#if canImport(UserNotifications)
import UserNotifications
#endif

@MainActor
final class DailyReminderController {

    static let shared = DailyReminderController()
    private init() {}

    private static let identifier = "synapse.daily.reminder"

    private enum Key {
        static let enabled = "daily_reminder_enabled"
        static let hour    = "daily_reminder_hour"
        static let minute  = "daily_reminder_minute"
    }

    var isEnabled: Bool {
        get { UserDefaults.standard.bool(forKey: Key.enabled) }
        set {
            UserDefaults.standard.set(newValue, forKey: Key.enabled)
            if newValue { scheduleIfPermitted() } else { cancel() }
        }
    }

    var hour: Int {
        get { (UserDefaults.standard.object(forKey: Key.hour) as? Int) ?? 19 }
        set {
            UserDefaults.standard.set(newValue, forKey: Key.hour)
            scheduleIfPermitted()
        }
    }

    var minute: Int {
        get { (UserDefaults.standard.object(forKey: Key.minute) as? Int) ?? 0 }
        set {
            UserDefaults.standard.set(newValue, forKey: Key.minute)
            scheduleIfPermitted()
        }
    }

    var time: DateComponents {
        var dc = DateComponents()
        dc.hour = hour
        dc.minute = minute
        return dc
    }

    // MARK: - Authorization + scheduling

    /// Request permission. Calls the completion on the main actor with the
    /// outcome. If the user has already accepted, fires true immediately.
    func requestAuthorization(_ completion: @escaping (Bool) -> Void) {
        #if canImport(UserNotifications)
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional, .ephemeral:
                Task { @MainActor in completion(true) }
            case .denied:
                Task { @MainActor in completion(false) }
            case .notDetermined:
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                        Task { @MainActor in completion(granted) }
                    }
            @unknown default:
                Task { @MainActor in completion(false) }
            }
        }
        #else
        completion(false)
        #endif
    }

    /// Convenience wrapper that requests permission, then schedules on success.
    func enableAndSchedule(_ completion: @escaping (Bool) -> Void) {
        requestAuthorization { granted in
            if granted {
                self.isEnabled = true
                completion(true)
            } else {
                self.isEnabled = false
                completion(false)
            }
        }
    }

    func scheduleIfPermitted() {
        #if canImport(UserNotifications)
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            guard settings.authorizationStatus == .authorized ||
                  settings.authorizationStatus == .provisional else { return }

            let content = UNMutableNotificationContent()
            let streak = UserDefaults.standard.integer(forKey: "rimrock_streak_count")
            if streak > 0 {
                content.title = "Your \(streak)-day streak is waiting."
                content.body  = "Open a shift to keep it going. Voice Mode works hands-free if you're on the go."
            } else {
                content.title = "Your next shift is ready."
                content.body  = "Five minutes of Rimrock keeps the PTCE prep moving forward."
            }
            content.sound = .default

            let trigger = UNCalendarNotificationTrigger(
                dateMatching: self.time,
                repeats: true
            )
            let request = UNNotificationRequest(
                identifier: Self.identifier,
                content: content,
                trigger: trigger
            )
            UNUserNotificationCenter.current().add(request) { _ in }
        }
        #endif
    }

    func cancel() {
        #if canImport(UserNotifications)
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [Self.identifier])
        #endif
    }
}
