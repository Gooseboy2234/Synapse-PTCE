//
//  Synapse_PTCEApp.swift
//  Synapse PTCE
//
//  Created by Ethan Bradley on 4/14/26.
//

import SwiftUI

@main
struct Synapse_PTCEApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(tvOS)
            TVContentView()
            #else
            ContentView()
            #endif
        }
    }
}
