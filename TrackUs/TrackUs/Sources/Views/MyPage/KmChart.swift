//
//  KmChart.swift
//  TrackUs
//
//  Created by 박선구 on 12/9/23.
//

import SwiftUI
import Charts

struct KmChart: View {
    
    var data: [SampleData] = [
    .init(minute: 15, second: 10, km: 2.6, kcal: 130, date: "12-08"),
    .init(minute: 16, second: 02, km: 3.6, kcal: 164, date: "12-07"),
    .init(minute: 15, second: 30, km: 3.2, kcal: 155, date: "12-06"),
    .init(minute: 14, second: 09, km: 2.9, kcal: 131, date: "12-05"),
    .init(minute: 13, second: 41, km: 2.5, kcal: 128, date: "12-04"),
    .init(minute: 13, second: 43, km: 2.4, kcal: 122, date: "12-03"),
    .init(minute: 13, second: 51, km: 2.2, kcal: 110, date: "12-02")
]
    
    var body: some View {
        Chart {
            ForEach(data) { shape in
                BarMark(x: .value("date", shape.date), y: .value("Calorie", shape.kcal))
            }
        }
    }
}

#Preview {
    KmChart()
}
