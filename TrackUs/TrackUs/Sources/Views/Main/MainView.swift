//
//  MainView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var mapViewHeight = UIScreen.main.bounds.height * 3/7
    @State private var listViewHeight = UIScreen.main.bounds.height * 3/7

    
    var body: some View {
        NavigationStack{
            VStack{
                
                /* TrackUs 제목용 >> 추후 삭제 => 하단 safeAreaInset에 있음
                            HStack(spacing: 0, content: {
                                Text("Track")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Text("Us")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.mainTheme)
                                Spacer()
                            })
                            .padding(.init(top: 50, leading: 20, bottom: 0, trailing: 0))
                            .frame(height: UIScreen.main.bounds.height * 1/7)
                */
                // 지도
                VStack {
                    // 지도 추가 코드
                    Color.black // 해당부분 제거 후 map 표시 추가
                        .overlay(
                            VStack {
                                LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                    .frame(height: UIScreen.main.bounds.height * 1/20)
                                Spacer()
                                LinearGradient(gradient: Gradient(colors: [Color.main.opacity(0), Color.main.opacity(1)]), startPoint: .top, endPoint: .bottom)
                                    .frame(height: UIScreen.main.bounds.height * 1/20)
                            }
                        )
                }
                // 지도 터치 여부 확인 후 삭제
                /*VStack{
                    ZStack{
                        // map 추가 코드
                        Color.black
                        Text("지도 표시")
                        VStack{
                            LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: UIScreen.main.bounds.height * 1/20)
                            Spacer()
                            LinearGradient(gradient: Gradient(colors: [Color.main.opacity(0), Color.main.opacity(1)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: UIScreen.main.bounds.height * 1/20)
                        }
                    }
                }*/
                .frame(height: mapViewHeight )
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation {
                                mapViewHeight = UIScreen.main.bounds.height * 5/7
                                listViewHeight = UIScreen.main.bounds.height * 1/7
                            }
                        }
                )
                
                // 런닝 모집글
                VStack{
                    // 조절 바 표시
                    HStack{
                        Spacer()
                        VStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.secondary)
                                .frame(
                                    width: 50,
                                    height: 6
                                )
                        }
                        Spacer()
                    }
                    .padding(.init(top: 1, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.main)
                    .foregroundStyle(Color.main)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                let dragOffset = value.translation.height
                                let newHeight = mapViewHeight + dragOffset/2
                                let minHeight: CGFloat = UIScreen.main.bounds.height * 1/7
                                let maxHeight: CGFloat = UIScreen.main.bounds.height * 5/7
                                
                                if newHeight >= minHeight && newHeight <= maxHeight {
                                    mapViewHeight = mapViewHeight + dragOffset/2
                                    listViewHeight = listViewHeight - dragOffset/2
                                }
                            }
                            .onEnded { value in
                                let height = UIScreen.main.bounds.height
                                let dragOffset = value.translation.height
                                
                                if dragOffset < 0 && mapViewHeight < height*3/7{
                                    withAnimation(Animation.linear(duration: 0.1)){
                                        mapViewHeight = height * 1/7
                                        listViewHeight = height * 5/7
                                    }
                                }else if (dragOffset > 0 && mapViewHeight < height*3/7) || (dragOffset < 0 && mapViewHeight > height*3/7)  {
                                    withAnimation(Animation.linear(duration: 0.1)){
                                        mapViewHeight = height * 3/7
                                        listViewHeight = height * 3/7
                                    }
                                }else{
                                    withAnimation(Animation.linear(duration: 0.1)){
                                        mapViewHeight = height * 5/7
                                        listViewHeight = height * 1/7
                                    }
                                }
                            }
                    )
                    HStack{
                        Text("런닝 코스")
                            .customTextStyle(style: .title)
                            .padding(.init(top: 10, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    ZStack{
                        //NavigationStack{
                            List{
                                ForEach(1...5, id: \.self){_ in
                                    NavigationLink{
                                        //상세보기 View
                                    } label: {
                                        MateList()
                                    }
                                    .listRowBackground(Color.main)
                                }
                            }
                            .background(Color.main)
                            .listStyle(PlainListStyle())
                        //}
                        //.background(Color.main)
                        VStack{
                            LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: UIScreen.main.bounds.height * 1/40)
                            Spacer()
                        }
                    }
                }
                .frame(height: listViewHeight)
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation {
                                listViewHeight = UIScreen.main.bounds.height * 5/7
                                mapViewHeight = UIScreen.main.bounds.height * 1/7
                            }
                        }
                )
                Spacer()
            }
            .safeAreaInset(edge: .top, content: {
                HStack(spacing: 0, content: {
                    Text("Track")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundStyle(.mainFont)
                    Text("Us")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.sub)
                    Spacer()
                })
                .padding(.init(top: 50, leading: 20, bottom: 0, trailing: 0))
            })
            .background(Color.main)
        }
    }
}




#Preview {
    MainView()
}
