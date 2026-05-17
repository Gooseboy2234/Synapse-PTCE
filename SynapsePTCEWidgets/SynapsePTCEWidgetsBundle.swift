//
//  SynapsePTCEWidgetsBundle.swift
//  SynapsePTCEWidgets — Widget Extension target
//
//  Entry point for the widget extension. The Rimrock Live Activity widget
//  renders shift progress on the lock screen and in the Dynamic Island.
//

import WidgetKit
import SwiftUI

@main
struct SynapsePTCEWidgetsBundle: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            RimrockLiveActivityWidget()
        }
    }
}
