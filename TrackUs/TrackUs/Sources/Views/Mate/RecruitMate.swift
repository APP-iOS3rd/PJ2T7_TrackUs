//
//  MyRunning.swift
//  TrackUs
//
//  Created by 박선구 on 12/11/23.
//

import SwiftUI

enum mateTab: String, CaseIterable {
    case recruitment = "런닝 모집"
    case myRunning = "내 러닝 모음"
}

struct RecruitMate: View {
    @EnvironmentObject private var trackViewModel: TrackViewModel
    @State private var selectedPicker: mateTab = .recruitment
    @State private var action: Int? = 0
    @Namespace private var animation
    
    var body: some View {
      
        ZStack(alignment: .bottomTrailing){

            VStack {
                animate()
                selectTab(selec: selectedPicker)
            }
            
            NavigationLink(destination: AddTrackView(), label: {
                Image(systemName: "plus")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.main)
                    .frame(width: 60, height: 60)
                    .background(.sub)
                    .cornerRadius(20)
            })
            .padding(20)
        }
        .background(Color.main)
        
        
        
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(mateTab.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .frame(maxWidth: .infinity/2, minHeight: 40)
                        .foregroundStyle(selectedPicker == item ? Color.sub : Color.disableFont)
                        .customTextStyle(style:.largeTitle)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundStyle(Color.sub)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "Recruitment", in: animation)
                    }
                }
                //.padding(10)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct selectTab : View {
    var selec : mateTab
    
    var body: some View {
        switch selec {
        case .recruitment:
            RecruitmentList() //모집
        case .myRunning:
            RecruitmentList() //내 러닝 모음
        }
    }
}

#Preview {
    RecruitMate()
}
