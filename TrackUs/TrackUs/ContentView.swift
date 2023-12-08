//
//  ContentView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            CommunityView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("메이트 모집")
                }
            
            MateView()
                .tabItem {
                    Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
                    Text("커뮤니티")
                }
            
            MyPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("내 정보")
                }
        }
        .accentColor(.sub)
    }
}

#Preview {
    ContentView()
}
