//
//  MateDetailView.swift
//  TrackUs
//
//  Created by 박소희 on 12/10/23.
//

import SwiftUI

// 프로필 이미지를 나타내는 구조체
struct ParticipantImage: View {
  
    var participationsImage: String

    var body: some View {
        Image(participationsImage)
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}

// 메이트모집 상세화면
struct MateDetailView: View {
    let trackInfo: TrackInfo

    @StateObject var trackViewModel = TrackViewModel()
    @State private var showGreeting: Bool = true
    @State private var showJoinButton: Bool = true
    //var trackInfo: TrackInfo

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd"
        return formatter.string(from: trackInfo.startDate)
    }
    
    var formattedTime: String {
        let seconds = trackInfo.timeTaken
        let minutes = (seconds / 60) % 60
        let hours = seconds / 3600
        return String(format: "%02d", minutes)
    }
    
    var formattedDateTime: String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: trackInfo.startDate)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                // MARK: - 소요시간, 칼로리, 거리
                HStack(spacing: 80) {
                    TUText(style: .smallTitle, text: "예상거리")
                    TUText(style: .smallTitle, text: "소요시간")
                    TUText(style: .smallTitle, text: "소모칼로리")
                }
                HStack(spacing: 70) {
                    if let firstTrack = trackViewModel.trackDatas.first {
                        TUText(style: .mediumTitle, text: "\(trackInfo.estimatedDistance)km")
//                        TUText(style: .mediumTitle, text: "\(trackInfo.timeTaken)min")
                        TUText(style: .mediumTitle, text: "\(formattedTime)min")
                        TUText(style: .mediumTitle, text: "\(trackInfo.caloriesConsumed)kcal")
                    } else {
                        // 예외 처리: 트랙 정보가 없을 경우 기본값 또는 에러 메시지 표시
                        TUText(style: .mediumTitle, text: "N/A")
                        TUText(style: .mediumTitle, text: "N/A")
                        TUText(style: .mediumTitle, text: "N/A")
                    }
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
                    TUText(style: .body, text: trackInfo.trackName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: formattedDate)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: formattedDateTime)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    HStack {
                        Image(systemName: "pin")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "\(trackInfo.trackPaths)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    HStack {
                        Image(systemName: "flag")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "\(trackInfo.estimatedDistance)km")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        TUText(style: .body, text: "\(trackInfo.participations.count)/\(trackInfo.limitedMember)명")
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
                            ParticipantImage(participationsImage: "image1")
                            ParticipantImage(participationsImage: "image1")
                            ParticipantImage(participationsImage: "image1")
                            ParticipantImage(participationsImage: "image1")
                        }
                    }
                    .padding(.top, 30)
                } else {
                    // 소개에 해당하는 내용
                    TUText(style: .body, text: trackInfo.trackBio)

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
//#Preview {
//    MateDetailView()
//}
