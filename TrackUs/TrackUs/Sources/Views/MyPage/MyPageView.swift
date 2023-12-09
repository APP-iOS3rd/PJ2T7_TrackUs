//
//  MyPageView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MyPageView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    MyProfile() //앱타이틀, 사용자 이미지, 이름
                    
                    VStack(alignment: .leading){
                        Text("Statistics")
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .foregroundStyle(.white)
                        
                        ChartTabBarView() // 차트
                            .frame(width: .infinity, height: 350)
                            .cornerRadius(20)
                            .padding(.vertical)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Calendar")
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                            .foregroundStyle(.white)
                        
                        NavigationLink(destination: CalendarHomeView().toolbar(.hidden, for: .tabBar) , label: {
                            SmallDatePicker(currentDate: $currentDate) //캘린더
                                .foregroundStyle(.white)
                        })
                    }
                }
                .padding(.horizontal, 20)
                
            }
            .background(Color.main)
        }
    }
}

#Preview {
    MyPageView()
}
