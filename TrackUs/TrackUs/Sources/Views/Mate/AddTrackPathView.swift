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
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var trackViewModel: TrackViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TrackPathUIMapView(trackViewModel: trackViewModel)
        }
        .edgesIgnoringSafeArea(.bottom)
        .overlay(TUExerciseIndicator(estimatedDistance: $trackViewModel.currnetTrackData.estimatedDistance, timeTaken: $trackViewModel.currnetTrackData.timeTaken, caloriesConsumed: $trackViewModel.currnetTrackData.caloriesConsumed), alignment: .top)
        .overlay(TUButton(text: "트랙추가", action: {
            // 트랙추가 하는경우 데이터 유지 화면이동
            self.mode.wrappedValue.dismiss()
        }).padding(20), alignment: .bottom)
        .toolbar{
            ToolbarItem {
                HStack{
                    Button(action: { trackViewModel.revertTrackPathData() }, label: {
                        Text("되돌리기")
                    })
                    
                    Button(action: { trackViewModel.resetTrackPathData() }, label: {
                        Text("초기화")
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
                        // 뒤로가기 버튼을 누르는경우 데이터 삭제
                        self.mode.wrappedValue.dismiss()
                        trackViewModel.resetTrackPathData()
                    }){
                        Image(systemName: "arrow.left")
                    })
    }
}

//#Preview {
//    AddTrackPathView()
//}
