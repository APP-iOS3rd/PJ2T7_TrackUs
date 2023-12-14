//
//  MateDetailView.swift
//  TrackUs
//
//  Created by 박소희 on 12/10/23.
//

import SwiftUI
import MapKit

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
    @State private var convertedAddress = ""
    //var trackInfo: TrackInfo


    var body: some View {
        VStack {
            //                 MARK: - 소요시간, 칼로리, 거리
            TUExerciseIndicator(estimatedDistance: trackInfo.estimatedDistance, timeTaken: trackInfo.timeTaken, caloriesConsumed: trackInfo.caloriesConsumed)
            ScrollView {
                VStack(spacing: 10) {
                    
                    // MARK: - 지도
                    // 이미지
                    Rectangle()
                        .background(.gray)
                        .frame(height: 185)
                    
                    // MARK: - 내용
                    VStack(spacing: 15) {
                        // 내용
                        Text(trackInfo.trackName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .customTextStyle(style: .largeTitle)
                        VStack(spacing: 6) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.mainFont)
                                Text(Functions().formatDate(date: trackInfo.startDate))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.mainFont)
                                Text(Functions().formatTime(time: trackInfo.startDate))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.mainFont)
                                Text(convertedAddress)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            HStack {
                                Image(systemName: "arrow.triangle.turn.up.right.diamond")
                                    .foregroundColor(.mainFont)
                                Text(distanceConversion(trackInfo.estimatedDistance))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            HStack {
                                Image(systemName: "person")
                                    .foregroundColor(.mainFont)
                                Text("\(trackInfo.participations.count)/\(trackInfo.limitedMember)명")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .customTextStyle(style: .captionGray)
                    .padding(12)
                    
                    
                    // MARK: - 소개, 참여자
                    HStack(spacing: 150) {
                        // 소개 버튼
                        Button(action: {
                            withAnimation {
                                showGreeting = true
                            }
                        }) {
                            TUText(style: .mediumTitle, text: "소 개")
                        }
                        .background(RoundedRectangle(cornerRadius: 2).frame(height: 3).foregroundColor(showGreeting ? .yellow : .clear).padding(.top, 30)) // 밑줄
                        
                        // 참여자
                        Button(action: {
                            withAnimation {
                                showGreeting = false
                            }
                        }) {
                            TUText(style: .mediumTitle, text: "참여자")
                        }
                        .background(RoundedRectangle(cornerRadius: 2).frame(height: 3).foregroundColor(!showGreeting ? .yellow : .clear).padding(.top, 30)) // 밑줄
                        
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
                            
                            Spacer()
                            
                        }
                        .padding(.top, 30)
                    } else {
                        // 소개에 해당하는 내용
                        TUText(style: .body, text: trackInfo.trackBio)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                        
                    }
                }
                .foregroundColor(.white)
                
//                Spacer()
                
            }
            .onChange(of: showGreeting) { _ in
                // 참여자 또는 소개 버튼이 눌렸을 때 상태 변경
                withAnimation {
                    showJoinButton = true
                }
            }
            
            // 참가하기 버튼
            TUButton(text: "참가하기") {
                // TODO: 참가하기 버튼 클릭 시 동작 구현
            }
            .padding(.bottom, 8)
            .animation(.default) // 애니메이션 적용
        }
        .onAppear {
            convertCLLocationToAddress(location: CLLocation(latitude: trackInfo.trackPaths.points[0].lat, longitude: trackInfo.trackPaths.points[0].lng)) { address in
                self.convertedAddress = address
            }
        }
        .navigationTitle("상세보기")
        
        .padding(.horizontal, 20)
        .background(Color.main)
    }
    
    // 거리 변환 함수
    func distanceConversion(_ distance: Double) -> String{
        if distance >= 1000 {
            return String(format: "%.1fkm", distance/1000)
        }else {
            return String(format: "%.0fm", distance)
        }
    }
}

//#Preview {
//    MateDetailView()
//}
