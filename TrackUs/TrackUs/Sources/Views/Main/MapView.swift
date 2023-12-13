//
//  MapView.swift
//  TrackUs
//
//  Created by 윤준성 on 12/11/23.
//

import SwiftUI
import UIKit
import NMapsMap

struct MapView: View {
    @StateObject var coordinator: Coordinator = Coordinator.shared
    
    var body: some View {
        ZStack {
            VStack {
                MapViewModel()
            }
        }
        .onAppear {
            Coordinator.shared.checkIfLocationServiceIsEnabled()
        }
    }
}


#Preview {
    MapView()
}
