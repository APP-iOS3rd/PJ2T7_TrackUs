//
//  TUExerciseIndicator.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import SwiftUI

// 예상거리, 칼로리, 운동정보를 표시해주는 컴포넌트
struct TUExerciseIndicator: View {
    var body: some View {
        HStack{
            VStack{
                Text("예상거리")
                    .font(.footnote)
                Text("\(String(format: "%.2f",0))km")
                    .italic()
                    .fontWeight(.black)
            }
            
            Spacer()
            
            VStack{
                Text("소요시간")
                    .font(.footnote)
                Text("\(0)min")
                    .italic()
                    .fontWeight(.black)
            }
            
            Spacer()
            
            VStack{
                Text("소모칼로리")
                    .font(.footnote)
                Text("\(0)kcal")
                    .italic()
                    .fontWeight(.black)
            }
        }
        .foregroundStyle(.white)
        .padding(20)
        .background(.main)
      
    }
}

#Preview {
    TUExerciseIndicator()
}
