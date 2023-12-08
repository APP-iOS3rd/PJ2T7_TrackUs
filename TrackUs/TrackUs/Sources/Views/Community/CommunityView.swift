//
//  CommunityView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        ZStack {
            Color.main
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack(spacing: Constants.GlobalUIConst.VERTICAL_SPACING) {
                    ForEach(1...40, id: \.self) { _ in
                        CommunityCard()
                    }
                }
            }
            .padding(.horizontal, Constants.GlobalUIConst.HORIZONTAL_SPACING)
        }
    }
}

#Preview {
    CommunityView()
}
