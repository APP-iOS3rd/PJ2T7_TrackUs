//
//  TUExerciseIndicator.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import SwiftUI

// 예상거리, 칼로리, 운동정보를 표시해주는 컴포넌트
struct TUExerciseIndicator: View {
     var estimatedDistance: Double
     var timeTaken: Int
     var caloriesConsumed: Int
    
    var body: some View {
        HStack{
            VStack{
                Text("예상거리")
                    .font(.footnote)
                if estimatedDistance < 1000 {
                    Text(String(format: "%.0f m", estimatedDistance))
                        .italic()
                        .fontWeight(.black)
                } else {
                    Text(String(format: "%.1f km", estimatedDistance / 1000))
                        .italic()
                        .fontWeight(.black)
                }
            }
            
            Spacer()
            
            VStack{
                Text("소요시간")
                    .font(.footnote)
                Text("\(timeTaken)min")
                    .italic()
                    .fontWeight(.black)
            }
            
            Spacer()
            
            VStack{
                Text("소모칼로리")
                    .font(.footnote)
                Text("\(caloriesConsumed)kcal")
                    .italic()
                    .fontWeight(.black)
            }
        }
        .foregroundStyle(.white)
        .padding(20)
        .background(.main)
        
    }
}

//#Preview {
//    TUExerciseIndicator()
//}
