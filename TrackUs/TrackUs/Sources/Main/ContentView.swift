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
        UINavigationBarAppearance().buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.green] //1
        
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
                
                NavigationView {
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
                        .navigationTitle(tabTitle)
                        .navigationBarTitleDisplayMode(.inline)
                        .accentColor(.sub)
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
                // navigatonBar 색상 설정
//                .toolbarBackground(
//                    Color.main,
//                    for: .navigationBar)
//                .toolbarBackground(.visible, for: .navigationBar)
                //.navigationTitle(tabTitle)
                .navigationBarTitleDisplayMode(.inline)
                //.navigationBarColor(backgroundColor: .red, titleColor: .white)
                .accentColor(.sub)
                VStack{
                    LinearGradient(gradient: Gradient(colors: [Color.main.opacity(1), Color.main.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 12)
                    Spacer()
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

//extension View {
//   func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor) -> some View {
//       modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, titleColor: titleColor))
//   }
//}
//
//struct NavigationBarColorModifier: ViewModifier {
//   var backgroundColor: UIColor
//   var titleColor: UIColor
//    
//       
//      UINavigationBar.appearance().tintColor = .white // probably not needed
//       
//      UINavigationBar.appearance().standardAppearance = appearance
//      UINavigationBar.appearance().scrollEdgeAppearance = appearance
//      UINavigationBar.appearance().compactAppearance = appearance
//      UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
//
//   init(backgroundColor: UIColor, titleColor: UIColor) {
//       self.backgroundColor = backgroundColor
//       self.titleColor = titleColor
//
//       let coloredAppearance = UINavigationBarAppearance()
//       coloredAppearance.configureWithOpaqueBackground()
//       coloredAppearance.backgroundColor = backgroundColor
//       coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]
//       coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
//
//       UINavigationBar.appearance().standardAppearance = coloredAppearance
//       UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//       UINavigationBar.appearance().tintColor = .white
//   }
//
//   func body(content: Content) -> some View {
//       content
//   }
//}
