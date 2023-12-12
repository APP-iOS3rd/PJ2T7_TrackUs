//
//  gridTest.swift
//  sss
//
//  Created by 박선구 on 12/11/23.
//

import SwiftUI

struct Recruitment: View {
    @StateObject private var trackViewModel = TrackViewModel.shared
    private var vGridItems = [GridItem()]
    
    var body: some View {
            ScrollView{
                NavigationLink(destination: MateDetailView(), label: {
                LazyVGrid(columns: vGridItems, spacing: 0) {
                    ForEach(trackViewModel.trackDatas, id: \.self) { item in
                        RecruitmentCell(title: item.trackName, distance: item.distance, date: item.startDate, time: item.participationTime)
                    }
                }
            })
            }
            .foregroundStyle(.white)
            .background(Color.main)
    }
}

struct RecruitmentCell: View {
    
    let title: String
    let distance: String
    let date: String
    let time: String
    
    var body: some View {
        NavigationLink(destination: MateDetailView(), label: {
        VStack{
            HStack(spacing: 10) {
                
                Spacer()
                
                Image(systemName: "figure.run")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                    HStack{
                        Image(systemName: "figure.track.and.field")
                        Text("\(distance)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                    HStack{
                        Image(systemName: "calendar")
                        Text("\(date)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                    HStack{
                        Image(systemName: "clock")
                        Text("\(time)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                }
                
                Image(systemName: "chevron.forward")
            }
            
            .padding(15)
            
            Text("")
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background(Color.sub)
            
        }
        .background(Color.main)
        })
    }
}

//struct ListItemModel: Identifiable {
//    let id = UUID()
//    let title: String
//    let date: String
//    let time: String
//}

#Preview {
    Recruitment()
}
