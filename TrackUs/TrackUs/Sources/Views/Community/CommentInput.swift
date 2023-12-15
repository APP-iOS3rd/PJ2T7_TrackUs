//
//  CommentInput.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

// 댓글입력
struct CommentInput: View {
    @State var comment: String = ""
    var body: some View {
        HStack {
            // 유저프로필 이미지
            Image("")
                .resizable()
                .background(.gray)
                .clipShape(Circle())
                .frame(width: 32, height: 32)
            // 댓글 입력필드
            TextField(text: $comment) {
                TUText(style: .body, text: "댓글을 입력해 주세요.", color:.white)
            }
            .foregroundColor(.white)
            .frame(width: 290,height: 32)
            .padding(.leading, 8)
            .offset(x:10)
            .background(.gray)
            .clipShape(Capsule())
            // 댓글입력 버튼
            Button(action: {}, label: {
                Image(systemName: "arrow.up")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
                    .background(.sub)
                    .clipShape(Circle())
                    
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .border(width: 1, edges: [.top], color: .gray)
    }
}

#Preview {
    CommentInput()
}
