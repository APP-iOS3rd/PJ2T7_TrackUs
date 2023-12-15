//
//  MyRunning.swift
//  TrackUs
//
//  Created by 박선구 on 12/11/23.
//

//import SwiftUI
//
//struct MyRunningList: View {
////    @EnvironmentObject var trackViewModel: TrackViewModel
////    @StateObject var userViewModel: UserViewModel
////    var trackDatas: [TrackInfo] = []
////    var trackInfo: TrackInfo
//    @StateObject var userViewModel = UserViewModel.shared
////    @EnvironmentObject var trackViewModel: TrackViewModel
////    @EnvironmentObject var userViewModel: UserViewModel
//    @ObservedObject var trackViewModel : TrackViewModel
//    
//    private var vGridItems = [GridItem()]
//    
//    var body: some View {
//            ScrollView {
//                LazyVGrid(columns: vGridItems, spacing: 0) {
////                    ForEach(trackViewModel.trackDatas.filter { $0.author == userViewModel.currentUser.id}) { item in
////                    ForEach(trackViewModel.trackDatas.filter{ $0.id == userViewModel.currentUser.id}) { item in
////                    ForEach(trackDatas.filter{ $0.id == userViewModel.currentUser.id}) { item in
//                    ForEach(trackDatas.filter{ $0.id == userViewModel.currentUser.id}) { item in
//                        
//                        RecruitmentCell(trackInfo: item)
//                    }
//                    Button {
//                        print("\(userViewModel.currentUser.id)")
//                    } label: {
//                        Text("가나다라마바사")
//                            .foregroundStyle(.white)
//                    }
//                }
//                Button {
//                    print("\(userViewModel.currentUser.id)")
//                } label: {
//                    Text("가나다라마바사")
//                        .foregroundStyle(.white)
//                }
//            }
//            .foregroundStyle(.mainFont)
//            .background(Color.main)
//    }
//}


//#Preview {
//    MyRunning()
//}
