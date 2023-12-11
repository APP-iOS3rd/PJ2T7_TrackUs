//
//  ChartTabBarView.swift
//  TrackUs
//
//  Created by 박선구 on 12/9/23.
//

import SwiftUI

enum chartTab: String, CaseIterable {
    case km = "Kilometer"
    case kcal = "Calorie"
}

struct ChartTabBarView: View {
    
    @State private var selectedPicker: chartTab = .km
    @Namespace private var animation
    
    var body: some View {
        VStack{
            animate()
            selectView(selec: selectedPicker)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.orange)
                )
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(chartTab.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity/2, minHeight: 50)
                        .foregroundStyle(selectedPicker == item ? Color.sub : Color.gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundStyle(Color.sub)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "km", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct selectView : View {
    var selec : chartTab
    
    var body: some View {
        switch selec {
        case .km:
            KmChart()
        case .kcal:
            RunningChartView()
        }
    }
}
    
#Preview {
    ChartTabBarView()
}
