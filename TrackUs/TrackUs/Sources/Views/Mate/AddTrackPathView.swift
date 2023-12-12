//
//  AddTrackPathView.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import SwiftUI
import NMapsMap

// 트랙경로를 추가하는 화면입니다
struct AddTrackPathView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            TrackPathUIMapView()
        }
        .edgesIgnoringSafeArea(.bottom)
        .overlay(TUExerciseIndicator(), alignment: .top)
        .overlay(TUButton(text: "트랙추가", action: {
            
        }).padding(20), alignment: .bottom)
        
    }
}

#Preview {
    AddTrackPathView()
}
