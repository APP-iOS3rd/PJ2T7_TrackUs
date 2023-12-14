//
//  MateList2.swift
//  TrackUs
//
//  Created by 최주원 on 12/11/23.
//

import SwiftUI

struct MateList2: View {
    let trackInfo: TrackInfo
    //임의값
    let title = "달릴 러닝 브로..."
    let distance = 500
    let location = "여기서 달린다"
    let date = "2023.12.08"
    let time = "10:00" // 나중에 타입 변경
    
    var body: some View {
        NavigationLink(destination: MateDetailView(trackInfo: trackInfo)) {
            HStack(spacing: 12){
                // 마크
                ZStack{
                    Circle()
                        .foregroundStyle(Color.main)
                        .frame(width: 70, height: 70)
                    Image(systemName: "figure.run")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundStyle(.mainFont)
                }
                // 모집 내용
                VStack(alignment: .leading,spacing: 3){
                    Text(trackInfo.trackName)
                        .foregroundStyle(Color.main)
                        .customTextStyle(style: .title)
                    VStack(alignment: .leading,spacing: 1){
                        HStack{
                            Image(systemName: "arrow.triangle.turn.up.right.diamond")
                            //.foregroundStyle(.white)
                            Text(distanceConversion(trackInfo.estimatedDistance))
                        }
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            //.foregroundStyle(.white)
                            Text("\(Functions().formatDate(date: trackInfo.startDate))")
                        }
                        HStack{
                            Image(systemName: "clock")
                            //.foregroundStyle(.white)
                            Text("\(Functions().formatTime(time: trackInfo.startDate))")
                        }
                    }
                    .foregroundStyle(.community)
                    .customTextStyle(style: .caption)
                    
                }
                Spacer()
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                    .fill(Color.sub)
            )
        }.padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
        
    }
    func distanceConversion(_ distance: Double) -> String{
        if distance >= 1000 {
            return String(format: "%.1fkm", distance/1000)
        }else {
            return String(format: "%.0fm", distance)
        }
    }
}

//
//#Preview {
//    MateList2()
//}
