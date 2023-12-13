//
//  CommunityDetailView.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

// 커뮤니티 상세화면
struct CommunityDetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Color.main
                
                ScrollView {
                    VStack(spacing: 20) {
                        // MARK: - 유저프로필, 제목
                        HStack(spacing: 10) {
                            // 프로필 이미지
                            Image("")
                                .resizable()
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                            // 유저이름
                            TUText(style: .mediumTitle, text: "제목")
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        Divider()
                            .background(.gray)
                        
                        // MARK: - 내용, 이미지
                        VStack {
                            VStack(spacing: 20) {
                                // 내용
                                TUText(style: .body, text: "내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                // 이미지
                                Image("photo-add")
                                    .resizable()
                                    .background(.gray)
                                    .frame(height: 185)
                            }
                            .padding(.horizontal, 20)
                        }
                        Divider()
                            .background(.gray)
                        // MARK: - 좋아요, 댓글
                        HStack {
                            Spacer()
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
                        .padding(.horizontal, 20)
                        Divider()
                            .background(.gray)
                        // MARK: - 댓글 목록
                        VStack(spacing: 20) {
                            TUText(style: .mediumTitle, text: "댓글")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // 댓글리스트
                            LazyVStack(spacing: 20) {
                                ForEach(1...20, id:\.self) { _ in
                                    CommentCell()
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 20)
            } // ZStack
            .edgesIgnoringSafeArea(.bottom)
            .onTapGesture {
                hideKeyboard()
            }
            CommentInput()
                .navigationBarTitle("상세보기")
        }
        .background(.main)
    }
}

#Preview {
    CommunityDetailView()
}
