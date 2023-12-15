//
//  MainView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        GeometryReader{ geometry in
            MapList(viewHeight: geometry.size.height, mapViewHeight: geometry.size.height/2, listViewHeight: geometry.size.height/2)
        }
        .background(Color.main)
    }
}

struct MapList: View {
    let viewHeight: Double
    @EnvironmentObject var trackViewModel: TrackViewModel
    @State var mapViewHeight: Double
    @State var listViewHeight: Double
    var body: some View {
        VStack{
            // 지도
            ZStack {
                // 지도 추가 코드
                MapView() // 해당부분 제거 후 map 표시 추가
                    .gesture(
                        DragGesture()
                            .onChanged{_ in 
                                withAnimation {
                                    mapViewHeight = viewHeight * 11/12
                                    listViewHeight = viewHeight * 1/12
                                }
                            }
                    )
                    //.overlay(
                        VStack {
                            LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: 30)
                            Spacer()
                            LinearGradient(gradient: Gradient(colors: [Color.main.opacity(0), Color.main.opacity(1)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: 30)
                        }
                    //)
            }
            .frame(height: mapViewHeight )
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            mapViewHeight = viewHeight * 11/12
                            listViewHeight = viewHeight * 1/12
                        }
                    }
            )
            
            // 런닝 모집글
            VStack{
                // 조절 바 표시
                VStack{
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.secondary)
                            .frame(
                                width: 50,
                                height: 6
                            )
                        Spacer()
                    }
                    HStack{
                        // 지역값 Text내부 추가
                        Text("런닝 코스")
                            .customTextStyle(style: .title)
                            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                }
                .frame(height: 40)
                .background(Color.main)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            let dragOffset = value.translation.height
                            let newHeight = mapViewHeight + dragOffset/2
                            let minHeight: CGFloat = UIScreen.main.bounds.height * 1/6
                            let maxHeight: CGFloat = UIScreen.main.bounds.height * 5/6
                            
                            if newHeight >= minHeight && newHeight <= maxHeight {
                                mapViewHeight = mapViewHeight + dragOffset/2
                                listViewHeight = listViewHeight - dragOffset/2
                            }
                        }
                        .onEnded { value in
                            let dragOffset = value.translation.height
                            
                            if dragOffset < 0 && mapViewHeight < viewHeight*3/6{
                                withAnimation(Animation.linear(duration: 0.12)){
                                    mapViewHeight = viewHeight * 1/6
                                    listViewHeight = viewHeight * 5/6
                                }
                            }else if (dragOffset > 0 && mapViewHeight < viewHeight*3/6) || (dragOffset < 0 && mapViewHeight > viewHeight*3/6)  {
                                withAnimation(Animation.linear(duration: 0.12)){
                                    mapViewHeight = viewHeight * 3/6
                                    listViewHeight = viewHeight * 3/6
                                }
                            }else{
                                withAnimation(Animation.linear(duration: 0.12)){
                                    mapViewHeight = viewHeight * 11/12
                                    listViewHeight = viewHeight * 1/12
                                }
                            }
                        }
                )
                ZStack{
                    RecruitmentList(trackDatas: trackViewModel.trackDatas)
                    .background(Color.main)
                    .listStyle(PlainListStyle())
                    VStack{
                        LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 15)
                        Spacer()
                    }
                }
                .frame(height: listViewHeight)
            }
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            listViewHeight = UIScreen.main.bounds.height * 5/6
                            mapViewHeight = UIScreen.main.bounds.height * 1/6
                        }
                    })
        }
    }
}




#Preview {
    MainView()
}
