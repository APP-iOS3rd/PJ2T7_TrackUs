//
//  CommentCell.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .background(.gray)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            // 유저이름
            TUText(style: .body, text: "댓글댓글댓글댓글")
                .lineLimit(1)
                .padding(.leading, 10)
            Spacer()
        }
    }
}

#Preview {
    CommentCell()
}
