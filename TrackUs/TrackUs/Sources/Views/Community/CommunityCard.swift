//
//  CommunityCard.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

// 커뮤니티에 사용되는 카드형 UI
struct CommunityCard: View {
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - 유저
            HStack {
                // 프로필 이미지
                Image("")
                    .resizable()
                    .background(.main)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                // 유저이름
                TUText(style: .mediumTitle, text: "트랙어스")
                Spacer()
                Image("ellipsis")
            }
            
            // MARK: - 컨텐츠
            VStack(alignment:.leading, spacing: 20) {
                // 제목
                TUText(style: .bigTitle, text: "제목")
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // 본문
                TUText(style: .body, text: "내용.....")
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // 이미지
                Image("")
                  .resizable()
                  .background(.gray)
                  .frame(maxHeight: 185)
                
                // MARK: - 좋아요, 댓글
                HStack {
                    // 좋아요 버튼
                    Button(action: {}, label: {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        
                    })
                    TUText(style: .mediumTitle, text: "10")
                    
                    // 댓글 버튼
                    Button(action: {}, label: {
                    Image(systemName: "bubble")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    })
                    TUText(style: .mediumTitle, text: "10")
                }
                
            }
        }
        .padding(20)
        .background(Color.comunityCard)
        .cornerRadius(15)
    }
}

#Preview {
    CommunityCard()
}
