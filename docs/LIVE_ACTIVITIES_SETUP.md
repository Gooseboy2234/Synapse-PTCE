# Live Activities — Xcode setup steps

The app-side code for the Rimrock Live Activity is already in place:

- `Synapse PTCE/LiveActivities/RimrockActivityAttributes.swift` — the shared
  `ActivityAttributes` type. Compiles into the main app target as-is.
- `Synapse PTCE/LiveActivities/LiveActivityController.swift` — facade for
  starting / updating / ending a `RimrockActivityAttributes` activity.
- `VoiceSession` already calls `LiveActivityController.shared` on shift
  start, scene/dialogue/question/choice transitions, and shift end.

What you have to add in Xcode (the filesystem can't reliably add a new
target to `.xcodeproj`):

## 1. Create the Widget Extension target

1. Open `Synapse PTCE.xcodeproj` in Xcode.
2. **File → New → Target…** → choose **Widget Extension** under iOS.
3. Product name: `SynapsePTCEWidgets`.
4. Check **"Include Live Activity"**.
5. Uncheck **"Include Configuration App Intent"** unless you want one.
6. Bundle identifier: defaults to `Yellow-Labs.Synapse-PTCE.SynapsePTCEWidgets`.
7. Activate the scheme when prompted.

## 2. Replace the auto-generated files

Xcode will scaffold a folder named `SynapsePTCEWidgets/` with placeholder
files. The repo already contains three files at the workspace root
`SynapsePTCEWidgets/`:

- `SynapsePTCEWidgetsBundle.swift`
- `RimrockLiveActivityWidget.swift`
- `Info.plist`

Replace the auto-generated files with these (or move these into the
folder Xcode created — same outcome). Make sure the three files are
members of the `SynapsePTCEWidgets` target. Delete any placeholder
widgets Xcode generated (e.g. `SynapsePTCEWidgetsLiveActivity.swift`,
`AppIntent.swift`).

## 3. Share `RimrockActivityAttributes.swift` with the widget target

In Xcode's File Inspector for
`Synapse PTCE/LiveActivities/RimrockActivityAttributes.swift`:
check **both** the main app target **and** the new widget target. The
attributes type has to compile into both so the system can match
activity attributes across processes.

## 4. Add the `NSSupportsLiveActivities` Info.plist key

On the main app target, in **Build Settings** find or add:

```
INFOPLIST_KEY_NSSupportsLiveActivities = YES
```

(or set `NSSupportsLiveActivities = YES` in the generated Info.plist.)

## 5. Test

1. Build & run on a device with iOS 16.2+ (Live Activities require a
   physical device or iOS 16.2+ simulator).
2. Open a Rimrock shift in Voice Mode.
3. Lock the device or swipe to Dynamic Island — you should see the
   shift activity with the current scene label and progress bar.
4. When the session reaches a question or choice, the activity flips to
   the "respond" state with a mic icon.

## Future enhancements

- A second activity for the in-progress Blueprint Exam (countdown timer,
  current question number, current scaled-score estimate).
- App-intent-driven activity buttons so the lock screen / Dynamic Island
  can drive answer selection directly (iOS 17+).
- Push-based updates so the activity can survive longer than ~8 hours
  of foreground activity.
