//
//  MateDetailTab.swift
//  TrackUs
//
//  Created by 박선구 on 12/14/23.
//

import SwiftUI

enum mateDetailTab: String, CaseIterable {
    case introduction = "소개"
    case jointab = "참가자"
}

struct MateDetailTab: View {
    
    let trackInfo: TrackInfo
////
//    @StateObject var trackViewModels = TrackViewModel()
    
    @EnvironmentObject private var trackViewModel: TrackViewModel
    @State private var selectedPicker: mateDetailTab = .introduction
    @State private var action: Int? = 0
    @Namespace private var animation
    
    var body: some View {
      
        ZStack(alignment: .bottomTrailing){

            VStack {
                animate()
                selectDetailTab(trackInfo: trackInfo, selec: selectedPicker)
            }
        }
        .background(Color.main)
        
        
        
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(mateDetailTab.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .frame(maxWidth: .infinity/2, minHeight: 40)
                        .foregroundStyle(selectedPicker == item ? Color.sub : Color.disableFont)
                        .customTextStyle(style:.largeTitle)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundStyle(Color.sub)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "소개", in: animation)
                    }
                }

                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct selectDetailTab : View {
    let trackInfo: TrackInfo
    var selec : mateDetailTab
    
    var body: some View {
        switch selec {
        case .introduction:
            Introduction(trackInfo: trackInfo) // 소개글
        case .jointab:
            Jointab() // 참가자
        }
    }
}

//#Preview {
//    MateDetailTab()
//}
