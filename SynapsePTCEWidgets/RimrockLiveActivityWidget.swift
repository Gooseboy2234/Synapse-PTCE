//
//  RimrockLiveActivityWidget.swift
//  SynapsePTCEWidgets
//
//  Lock-screen + Dynamic Island UI for an in-progress Rimrock shift.
//  Reads RimrockActivityAttributes (defined in the main app and added to
//  this target's Compile Sources via Xcode's File Inspector).
//

import ActivityKit
import WidgetKit
import SwiftUI

@available(iOS 16.1, *)
struct RimrockLiveActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RimrockActivityAttributes.self) { context in
            // Lock screen / banner
            RimrockLockScreenView(
                attributes: context.attributes,
                state: context.state
            )
            .activityBackgroundTint(.black.opacity(0.85))
            .activitySystemActionForegroundColor(.orange)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Label("Day \(context.state.dayNumber)", systemImage: "moon.stars.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 12, weight: .semibold, design: .monospaced))
                }
                DynamicIslandExpandedRegion(.trailing) {
                    if context.state.awaitingResponse {
                        Label("Respond", systemImage: "mic.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    } else {
                        Text(context.state.sessionStartedAt, style: .timer)
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .monospacedDigit()
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(context.state.sceneLabel)
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .lineLimit(1)
                        if let prompt = context.state.promptPreview, !prompt.isEmpty {
                            Text(prompt)
                                .font(.system(size: 11, design: .rounded))
                                .foregroundColor(.white.opacity(0.7))
                                .lineLimit(2)
                        }
                        ProgressView(value: context.state.progress)
                            .progressViewStyle(.linear)
                            .tint(.orange)
                    }
                }
            } compactLeading: {
                Image(systemName: "moon.stars.fill")
                    .foregroundColor(.orange)
            } compactTrailing: {
                if context.state.awaitingResponse {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.green)
                        .symbolEffect(.pulse, options: .repeating)
                } else {
                    Text(context.state.sessionStartedAt, style: .timer)
                        .font(.system(size: 11, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white.opacity(0.7))
                        .monospacedDigit()
                        .frame(maxWidth: 44)
                }
            } minimal: {
                Image(systemName: context.state.awaitingResponse ? "mic.fill" : "moon.stars.fill")
                    .foregroundColor(context.state.awaitingResponse ? .green : .orange)
            }
        }
    }
}

@available(iOS 16.1, *)
private struct RimrockLockScreenView: View {
    let attributes: RimrockActivityAttributes
    let state: RimrockActivityAttributes.ContentState

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 4) {
                Text(attributes.shiftTitle.uppercased())
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .foregroundColor(.orange)
                    .tracking(1.5)
                Text(state.sceneLabel)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
                if let prompt = state.promptPreview, !prompt.isEmpty {
                    Text(prompt)
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                        .lineLimit(2)
                }
                ProgressView(value: state.progress)
                    .progressViewStyle(.linear)
                    .tint(.orange)
                    .padding(.top, 2)
            }
            Spacer(minLength: 0)
            VStack(alignment: .trailing, spacing: 6) {
                if state.awaitingResponse {
                    Image(systemName: "mic.circle.fill")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.green)
                        .symbolEffect(.pulse, options: .repeating)
                } else {
                    Image(systemName: "moon.stars.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                }
                Text(state.sessionStartedAt, style: .timer)
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.55))
                    .monospacedDigit()
            }
        }
        .padding(16)
    }
}
