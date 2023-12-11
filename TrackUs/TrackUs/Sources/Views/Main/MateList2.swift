//
//  MateList2.swift
//  TrackUs
//
//  Created by 최주원 on 12/11/23.
//

import SwiftUI

struct MateList2: View {
    
    //임의값
    let title = "달릴 러닝 브로..."
    let distance = 500
    let location = "여기서 달린다"
    let date = "2023.12.08"
    let time = "10:00" // 나중에 타입 변경
    
    
    var body: some View {
        HStack(spacing: 12){
            // 마크
            ZStack{
                Circle()
                    .foregroundStyle(Color.background)
                    .frame(width: 70, height: 70)
                Image(systemName: "figure.run")
                    .resizable()
                    .frame(width: 40,height: 40)
            }
            // 모집 내용
            VStack(alignment: .leading,spacing: 3){
                Text(title)
                    .foregroundStyle(Color.background)
                    .customTextStyle(style: .title)
                VStack(alignment: .leading,spacing: 1){
                    HStack{
                        Image(systemName: "arrow.triangle.turn.up.right.diamond")
                            //.foregroundStyle(.white)
                        Text("\(distance)m")
                    }
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            //.foregroundStyle(.white)
                        Text(location)
                    }
                    HStack{
                        Image(systemName: "clock")
                            //.foregroundStyle(.white)
                        Text(date)
                        Text(time)
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
                            .fill(Color.mainTheme)
                    )
    }
}


#Preview {
    MateList2()
}
