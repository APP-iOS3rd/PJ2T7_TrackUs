//
//  TrackUsApp.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

@main
struct TrackUsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TrackViewModel())
        }
    }
}
