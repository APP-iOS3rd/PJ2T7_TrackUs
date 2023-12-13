//
//  RecruitmentList.swift
//  TrackUs
//
//  Created by 최주원 on 12/13/23.
//

import SwiftUI

struct RecruitmentList: View {
    @EnvironmentObject var trackViewModel: TrackViewModel
    
    private var vGridItems = [GridItem()]
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: vGridItems, spacing: 0) {
                    ForEach(trackViewModel.trackDatas, id: \.self) { item in
                        RecruitmentCell(trackInfo: item)
                    }
                }
            }
            .foregroundStyle(.mainFont)
            .background(Color.main)
    }
}

struct RecruitmentCell: View {
    
    let trackInfo: TrackInfo
    
    var body: some View {
        NavigationLink(destination: MateDetailView(trackInfo: trackInfo)) {
        VStack{
            HStack(spacing: 10) {
                // MARK: - 아이콘
                Spacer()
                
                Image(systemName: "figure.run")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .foregroundStyle(.mainFont)
                
                Spacer()
                // MARK: - 컨텐츠
                VStack(alignment: .leading, spacing: 4) {
                    // 트랙이름
                    Text("\(trackInfo.trackName)")
                        .customTextStyle(style: .title)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 2){
                        HStack{
                            // 거리
                            Image(systemName: "arrow.triangle.turn.up.right.diamond")
                                .foregroundStyle(.mainFont)
                            if trackInfo.estimatedDistance > 1000 {
                                Text(String(format: "%.1f km", trackInfo.estimatedDistance / 1000))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            } else {
                                Text("\(Int(trackInfo.estimatedDistance)) m")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        // 선구님 여기요
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundStyle(.mainFont)
                            Text("\(Functions().formatDate(date: trackInfo.startDate))")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        // 선구님 여기요
                        HStack{
                            Image(systemName: "clock")
                                .foregroundStyle(.mainFont)
                            Text("\(Functions().formatTime(time: trackInfo.startDate))")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .customTextStyle(style: .caption)
                }
                
                Image(systemName: "chevron.forward")
            }
            
            .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            Text("")
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background(Color.sub.opacity(0.1))
        }
        .background(Color.main)
        }
    }
}


#Preview {
    RecruitmentList()
}
