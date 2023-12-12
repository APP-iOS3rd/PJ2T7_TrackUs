//
//  MateDetailView.swift
//  TrackUs
//
//  Created by 박소희 on 12/10/23.
//

import SwiftUI

// 프로필 이미지를 나타내는 구조체
struct ParticipantImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

// 커뮤니티 상세화면
struct MateDetailView: View {
    @State private var showGreeting: Bool = true
    @State private var showJoinButton: Bool = true

    var body: some View {
//        Color.main
        
        ScrollView {
            VStack(spacing: 10) {
                // MARK: - 소요시간, 칼로리, 거리
                HStack(spacing: 80) {
                    TUText(style: .smallTitle, text: "예상거리")
                    TUText(style: .smallTitle, text: "소요시간")
                    TUText(style: .smallTitle, text: "소모칼로리")
                }
                HStack(spacing: 70) {
                    TUText(style: .mediumTitle, text: "3.3km")
                    TUText(style: .mediumTitle, text: "14min")
                    TUText(style: .mediumTitle, text: "160kcal")
                }
                .padding(.horizontal, 10)
                
                // MARK: - 지도
                // 이미지
                Image("photo-add")
                    .resizable()
                    .background(.gray)
                    .frame(height: 185)
                
                // MARK: - 내용
                VStack(spacing: 20) {
                    // 내용
                    TUText(style: .body, text: "심장 터질 정도로 달릴 러닝 브로 구함!🫁🏃🏻‍♀️🏃🏻")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "12월 06일 수, 19:00")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "서울숲카페거리 성수동12동")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "1.59km")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "3/6명")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 20)
                
                // MARK: - 소개, 참여자
                HStack(spacing: 150) {
                    // 소개 버튼
                    Button(action: {
                        withAnimation {
                            showGreeting = true
                        }
                    }) {
                        TUText(style: .mediumTitle, text: "소개")
                    }
                    .background(RoundedRectangle(cornerRadius: 2).frame(height: 3).foregroundColor(showGreeting ? .yellow : .clear))
                    
                    // 참여자
                    Button(action: {
                        withAnimation {
                            showGreeting = false
                        }
                    }) {
                        TUText(style: .mediumTitle, text: "참여자")
                    }
                    .background(RoundedRectangle(cornerRadius: 2).frame(height: 3).foregroundColor(!showGreeting ? .yellow : .clear))
                }
                
                // MARK: - 추가된 내용
                if !showGreeting {
                    // 참여자에 해당하는 내용
                    VStack(spacing: 30) {
                        HStack {
                            ParticipantImage(imageName: "image1")
                            ParticipantImage(imageName: "image1")
                            ParticipantImage(imageName: "image1")
                            ParticipantImage(imageName: "image1")
                        }
                    }
                    .padding(.top, 30)
                } else {
                    // 소개에 해당하는 내용
                    TUText(style: .body, text: "우리는 누구?\n- 중급부터 고급자까지 환영합니다!👐🏻\n-(초급자분들은 힘드실 수 있어요😂)\n\n우리가 찾는 메이트:\n- 19시 이후로 가능한 사람\n- 서로에게 도전과 지지를 줄 수 있는 사람\n- 약속시간을 잘 지키는 사람")
                }
            }
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            
            Spacer() // 맨 하단에 공간을 확보
            
            // 참가하기 버튼
            TUButton(text: "참가하기") {
                // TODO: 참가하기 버튼 클릭 시 동작 구현
            }
            .padding(.top, showJoinButton ? 20 : 0) // 상태에 따라 여백 조절
            .opacity(showJoinButton ? 1 : 0) // 상태에 따라 투명도 조절
            .animation(.default) // 애니메이션 적용
        }
        .background(Color.main.edgesIgnoringSafeArea(.all))
        .onChange(of: showGreeting) { _ in
            // 참여자 또는 소개 버튼이 눌렸을 때 상태 변경
            withAnimation {
                showJoinButton = true
            }
        }
    }
}
#Preview {
    MateDetailView()
}
