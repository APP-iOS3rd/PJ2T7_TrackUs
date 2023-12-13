//
//  AddPostView.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

// 커뮤니티 글쓰기 페이지
struct AddPostView: View {
    @State var title: String = ""
    @State var content: String = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        ZStack {
            Color.main
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                // 제목입력 필드
                VStack {
                    TextField(text: $title) {
                        TUText(style: .mediumTitle, text: "제목을 입력해주세요.")
                    }
                    .focused($isFocused)
                    .padding(20)
                    .foregroundColor(.white)
                    Divider()
                        .background(.gray)
                }
                // 글내용 입력필드
                ZStack(alignment:.topLeading) {
                    let placeholder: String = "글 내용을 입력해 주세요."
                    if content.isEmpty {
                        TUText(style: .mediumTitle, text: placeholder)
                            .padding(20)
                            .padding(.top, 8)
                            .zIndex(2)
                    }
                 
                    VStack {
                        TextEditor(text: $content)
                        .padding(20)
                        .scrollContentBackground(.hidden)
                        .background(.main)
                        .foregroundColor(.white)
                        Divider()
                            .background(.gray)
                    }
                    
                }
                
                // 사진업로드, 코스등록
                VStack {
                    HStack {
                        Button(action: {}, label: {
                            Image("add_photo")
                                .frame(width: 70, height: 70)
                        })
                        Spacer()
                    }
                    Spacer()
                    TUButton(text: "코스등록", action: {})
                        .padding(.bottom, 8)
                }
                .padding(.horizontal, 20)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle("작성하기")
    }
}


#Preview {
    AddPostView(title: "", content: "")
}
