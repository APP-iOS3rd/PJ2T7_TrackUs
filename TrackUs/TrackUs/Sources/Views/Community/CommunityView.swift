//
//  CommunityView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

// 커뮤니티 메인화면
struct CommunityView: View {
    var body: some View {
        ZStack {
            Color.main
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(1...40, id: \.self) { _ in
                        CommunityCard()
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    CommunityView()
}
