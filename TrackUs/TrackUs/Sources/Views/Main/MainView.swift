//
//  MainView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MainView: View {
    @State private var mapViewHeight = UIScreen.main.bounds.height * 3/8
    @State private var listViewHeight = UIScreen.main.bounds.height * 4/8

    
    var body: some View {
        NavigationStack{
            VStack{
                // TrackUs 제목용
                //            HStack(spacing: 0, content: {
                //                Text("Track")
                //                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                //                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //                Text("Us")
                //                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                //                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //                    .foregroundStyle(.mainTheme)
                //                Spacer()
                //            })
                //            .padding(.init(top: 50, leading: 20, bottom: 0, trailing: 0))
                //            .frame(height: UIScreen.main.bounds.height * 1/7)
                
                // 지도
                VStack{
                    ZStack{
                        // map 추가 코드
                        Color.black
                        Text("지도 표시")
                        VStack{
                            LinearGradient(gradient: Gradient(colors: [Color.background.opacity(1), Color.background.opacity(0)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: UIScreen.main.bounds.height * 1/20)
                            Spacer()
                            LinearGradient(gradient: Gradient(colors: [Color.background.opacity(0), Color.background.opacity(1)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: UIScreen.main.bounds.height * 1/20)
                        }
                    }
                }
                .frame(height: mapViewHeight )
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation {
                                mapViewHeight = UIScreen.main.bounds.height * 6/8
                                listViewHeight = UIScreen.main.bounds.height * 1/8
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
                            //                        Image(systemName: "chevron.compact.up")
                            //                        Image(systemName: "chevron.compact.down")
                        }
                        Spacer()
                    }
                    .padding(.init(top: 1, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.background)
                    .foregroundStyle(Color.main)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                let dragOffset = value.translation.height
                                let newHeight = mapViewHeight + dragOffset/2
                                let minHeight: CGFloat = UIScreen.main.bounds.height * 1/8
                                let maxHeight: CGFloat = UIScreen.main.bounds.height * 6/8
                                
                                if newHeight >= minHeight && newHeight <= maxHeight {
                                    mapViewHeight = mapViewHeight + dragOffset/2
                                    listViewHeight = listViewHeight - dragOffset/2
                                }
                            }
                            .onEnded { value in
                                let dragOffset = value.translation.height
                                let newHeight = mapViewHeight + dragOffset/2
                                let minHeight: CGFloat = UIScreen.main.bounds.height * 1/8
                                let maxHeight: CGFloat = UIScreen.main.bounds.height * 6/8
                                
                                if newHeight >= minHeight && newHeight <= maxHeight {
                                    mapViewHeight = mapViewHeight + dragOffset/2
                                    listViewHeight = listViewHeight - dragOffset/2
                                } else {
                                    
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
                                        MateList2()
                                    }
                                    .listRowBackground(Color.background)
                                }
                            }
                            .background(Color.background)
                            .listStyle(PlainListStyle())
                        //}
                        //.background(Color.background)
                        VStack{
                            LinearGradient(gradient: Gradient(colors: [Color.background.opacity(1), Color.background.opacity(0)]), startPoint: .top, endPoint: .bottom)
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
                                listViewHeight = UIScreen.main.bounds.height * 6/8
                                mapViewHeight = UIScreen.main.bounds.height * 1/8
                            }
                        }
                )
                Spacer()
            }
            .safeAreaInset(edge: .top, content: {
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
            })
            .background(Color.background)
        }
    }
}




#Preview {
    MainView()
}
