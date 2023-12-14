//
//  ContentView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.


import SwiftUI
import UIKit

struct ContentView: View {
    @State var tabBarIndex: Int = 0
    @State var showSplash = true
    init() {
        // TabBar 설정
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .init(red: 22/225, green: 22/225, blue: 22/225, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .community
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.mainFont]
        UINavigationBar.appearance().tintColor = .sub
        UINavigationBar.appearance().backItem?.backBarButtonItem?.tintColor = .red
        UINavigationBarAppearance().buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.green]
        
        //UINavigationBarAppearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    var body: some View {
        ZStack {
            if showSplash {
                LaunchScreen()
                    .transition(.opacity)
            }
            else {
                Text("Hi TrackUs")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                NavigationStack {
                        TabView(selection: $tabBarIndex) {
                            MainView()
                                .onTapGesture {
                                    tabBarIndex = 0
                                }
                                .tabItem {
                                    Image(systemName: "house")
                                    Text("홈")
                                }.tag(0)
                            
                            MateView()
                                .onTapGesture {
                                    tabBarIndex = 1
                                }
                                .tabItem {
                                    Image(systemName: "doc.plaintext")
                                    Text("메이트 모집")
                                }.tag(1)
                            
                            
                            CommunityView()
                                .onTapGesture {
                                    tabBarIndex = 2
                                }
                                .tabItem {
                                    Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
                                    Text("커뮤니티")
                                }.tag(2)
                            
                            MyPageView()
                                .onTapGesture {
                                    tabBarIndex = 3
                                }
                                .tabItem {
                                    Image(systemName: "person")
                                    Text("내 정보")
                                }.tag(3)
                        }
                        .navigationBarItems(
                            leading:
                                HStack {
                                    HStack(spacing: 0) {
                                        Text("Track")
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundStyle(.mainFont)
                                        Text("Us")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .foregroundStyle(.sub)
                                        Spacer()
                                    }
                                    .padding()
                                }
                        )
                }
                .navigationBarItems(
                    leading:
                        HStack {
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
                        }
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(backgroundColor: .main, titleColor: .mainFont)
                .accentColor(.sub)
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 ){
                withAnimation{
                    self.showSplash = false
                }
            }
        }
        
    }
    
    var tabTitle: String {
        switch tabBarIndex {
        case 0: return "홈"
        case 1: return "메이트 모집"
        case 2: return "커뮤니티"
        case 3: return "내 정보"
        default: return "홈"
        }
    }
}

#Preview {
    ContentView()
}


// 추후 옮기기


