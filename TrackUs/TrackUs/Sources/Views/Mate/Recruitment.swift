//
//  gridTest.swift
//  sss
//
//  Created by 박선구 on 12/11/23.
//

import SwiftUI

//struct Recruitment: View {
//    
//    @StateObject var trackViewModel = TrackViewModel()
//    
//    
//    private var vGridItems = [GridItem()]
//    
//    var body: some View {
//            ScrollView{
////                NavigationLink(destination: MateDetailView(), label: {
//                LazyVGrid(columns: vGridItems, spacing: 0) {
////                    ForEach((0..<trackViewModel.trackDatas.count), id: \.self) { item in
//                    ForEach(trackViewModel.trackDatas, id: \.self) { item in
////                        MyRunningCell(title: "\(trackInfo.trackName)km", date: "\(trackInfo.startDate)", time: "\(trackInfo.timeTaken)")
//                        RecruitmentCell(trackInfo: item)
//                            
//                    }
//                }
////            })
//            }
//            .foregroundStyle(.white)
//            .background(Color.main)
//    }
//}
//
//struct RecruitmentCell: View {
//    
//    let trackInfo: TrackInfo
//    
//    var body: some View {
//        NavigationLink(destination: MateDetailView(trackInfo: trackInfo)) {
//        VStack{
//            HStack(spacing: 10) {
//                
//                Spacer()
//                
//                Image(systemName: "figure.run")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                
//                Spacer()
//                
//                VStack(alignment: .leading) {
//                    Text("\(trackInfo.trackName)")
//                        .font(.headline)
//                        .bold()
//                        .lineLimit(1)
//                        .truncationMode(.tail)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundStyle(.white)
//                    HStack{
//                        Image(systemName: "figure.track.and.field")
////                        Text("\(trackInfo.estimatedDistance)")
//                        if trackInfo.estimatedDistance < 1000 {
//                            Text(String(format: "%.0f m", trackInfo.estimatedDistance))
//                                .font(.subheadline)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .foregroundStyle(.sub)
//                        } else {
//                            Text(String(format: "%.1f km", trackInfo.estimatedDistance / 1000))
//                                .font(.subheadline)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .foregroundStyle(.sub)
//                        }
//                    }
//                    HStack{
//                        Image(systemName: "calendar")
//                        Text("\(formattedDate)")
//                            .font(.subheadline)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundStyle(.sub)
//                    }
//                    HStack{
//                        Image(systemName: "clock")
//                        Text("\(formattedDateTime)")
//                            .font(.subheadline)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundStyle(.sub)
//                    }
//                }
//                
//                Image(systemName: "chevron.forward")
//            }
//            
//            .padding(15)
//            
//            Text("")
//                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
//                .background(Color.sub)
//            
//        }
//        .background(Color.main)
//        }
//    }
//    
//    var formattedDate: String {
//        let formatter  = DateFormatter()
//        formatter.dateFormat = "YYYY.MM.dd"
//        return formatter.string(from: trackInfo.startDate)
//    }
//    
////    var formattedTime: String {
////        let seconds = trackInfo.timeTaken
////        let minutes = (seconds / 60) % 60
////        let hours = seconds / 3600
////        return String(format: "%02d:%02d", hours, minutes)
////    }
//    
//    var formattedDateTime: String {
//        let formatter  = DateFormatter()
//        formatter.dateFormat = "h:mm a"
//        return formatter.string(from: trackInfo.startDate)
//    }
//}

//struct ListItemModel: Identifiable {
//    let id = UUID()
//    let title: String
//    let date: String
//    let time: String
//}

////    var formattedTime: String {
////        let seconds = trackInfo.timeTaken
////        let minutes = (seconds / 60) % 60
////        let hours = seconds / 3600
////        return String(format: "%02d:%02d", hours, minutes)
////    }
//    
//    var formattedDateTime: String {
//        let formatter  = DateFormatter()
//        formatter.dateFormat = "h:mm a"
//        return formatter.string(from: trackInfo.startDate)
//    }
//}
//
////struct ListItemModel: Identifiable {
////    let id = UUID()
////    let title: String
////    let date: String
////    let time: String
////}
//
//#Preview {
//    Recruitment()
//}
