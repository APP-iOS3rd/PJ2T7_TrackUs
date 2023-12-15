//
//  TrackUsApp.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

@main
struct TrackUsApp: App {
    @StateObject var trackViewModel = TrackViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(trackViewModel)
                .environmentObject(UserViewModel.shared)
        }
    }
}
