//
//  CommunityView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

// 커뮤니티 메인화면
struct CommunityView: View {
    @State private var action: Int? = 0  // 화면이동 테스트를 위해서 임시로 선언
    var body: some View {
        
            ZStack(alignment: .bottomTrailing) {
                Color.main
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(1...40, id: \.self) { _ in
                            NavigationLink(destination: CommunityDetailView().navigationTitle("상세보기") ) {
                                CommunityCard()
                            }
                        }
                    }
                }
                .navigationTitle("Community")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 20)
                
                // 글추가 화면으로 이동
                NavigationLink(destination: AddPostView(), tag: 1, selection: $action) {
                   EmptyView()
                }
                FloatingButton(action: {
                                self.action = 1
                })
                    .padding(20)
        }
    }
}

#Preview {
    CommunityView()
}
