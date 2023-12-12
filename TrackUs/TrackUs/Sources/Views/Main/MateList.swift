//
//  MateList.swift
//  TrackUs
//
//  Created by 최주원 on 12/10/23.
//

import SwiftUI

struct MateList: View {
    
    //임의값
    let title = "심장 터질 정도로 달릴 러닝 브로..."
    let distance = 500
    let location = "여기서 달린다"
    let date = "2023.12.08"
    let time = "10:00" // 나중에 타입 변경
    
    
    var body: some View {
        HStack(spacing: 30){
            // 마크
            Image(systemName: "figure.run")
                .resizable()
                .frame(width: 50,height: 50)
                .foregroundStyle(.mainFont)
            // 모집 내용
            VStack(alignment: .leading,spacing: 8){
                Text(title)
                    .customTextStyle(style: .title)
                VStack(alignment: .leading,spacing: 2){
                    HStack{
                        Image(systemName: "arrow.triangle.turn.up.right.diamond")
                            .foregroundStyle(.white)
                        Text("\(distance)m")
                    }
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.white)
                        Text(location)
                    }
                    HStack{
                        Image(systemName: "clock")
                            .foregroundStyle(.white)
                        Text(date)
                        Text(time)
                    }
                }.customTextStyle(style: .caption)
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
