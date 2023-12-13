//
//  MateView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MateView: View {
    @State private var action: Int? = 0  // 화면이동 테스트를 위해서 임시로 선언
    var body: some View {
//            ZStack(alignment: .bottomTrailing) {
//                Color.main
//                    .edgesIgnoringSafeArea(.all)
//                ScrollView {
//                    LazyVStack(spacing: 20) {
//                            MyRunning()
//                    }
//                }
//                .navigationTitle("상세보기")
//                .navigationBarTitleDisplayMode(.inline)
//                .padding(.horizontal, 20)
//                
//        }
        RecruitMate()
    }
}
