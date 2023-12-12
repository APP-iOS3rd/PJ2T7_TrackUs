//
//  AddTrackView.swift
//  TrackUs
//
//  Created by 박선구 on 12/10/23.
//

import SwiftUI
import NMapsMap
struct AddTrackView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var trackViewModel: TrackViewModel
    let titlePlaceholder : String = "트랙 이름을 입력해 주세요"
    let textPlaceholder : String = "소개 글을 입력해 주세요"
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - 입력된 정보로 예상거리, 소요시간, 소모칼로리를 보여줌
            TUExerciseIndicator(estimatedDistance: trackViewModel.currnetTrackData.estimatedDistance, timeTaken: trackViewModel.currnetTrackData.timeTaken, caloriesConsumed: trackViewModel.currnetTrackData.caloriesConsumed)
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
            
            ScrollView(showsIndicators: false){
                // MARK: - 트랙경로 설정하는 화면으로 이동
                VStack{
                    NavigationLink(destination: {
                        AddTrackPathView()
                    }, label: {
                        ZStack(alignment: .center){
                            Image("mapImage")
                                .frame(minWidth: 300, maxWidth: .infinity,minHeight: 80,maxHeight: 80)
                                .cornerRadius(10)
                                
                            Text("코스를 입력해 주세요")
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                        }
                    })
                }.padding(.horizontal, 20)
                
                // MARK: - 트랙정보 입력폼
                // 트랙이름
                
                TextField(text: $trackViewModel.currnetTrackData.trackName) {
                    Text("트랙 이름을 입력해주세요")
                        .foregroundColor(.gray)
                }
                .foregroundColor(.white)
                .padding(20)
                
                Divider().background(.gray)
                
                // 소개글
                ZStack(alignment: .topLeading){
                    TextEditor(text: $trackViewModel.currnetTrackData.trackBio)
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .scrollContentBackground(.hidden)
                        .background(Color.main)
                        .padding(20)
                        .foregroundColor(.white)
                    
                    if trackViewModel.currnetTrackData.trackBio.isEmpty {
                        Text(textPlaceholder)
                            .foregroundStyle(.gray)
                            .padding(20)
                    }
                }
                
                Divider().background(.gray)
                
                // MARK: - 인원, 날짜, 시간설정
                VStack(spacing: 20) {
                    // 예상 소요 시간
                    HStack{
                        Text("예상 소요 시간(분)")
                        Spacer()
                        Button(action: {
                            minusTimeButtonTapped()
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.sub)
                        })
                        
                        Text("\(trackViewModel.currnetTrackData.timeTaken)")
                            .frame(width: 25)
                            .fontWeight(.bold)
                        
                        Button(action: {
                            plusTimeButtonTapped()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.sub)
                        })
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    HStack{ // 인원 설정
                        Text("인원 설정")
                        
                        Spacer()
                        
                        Button(action: {
                            minusMemberButtonTapped()
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.sub)
                        })
                        
                        Text("\(trackViewModel.currnetTrackData.limitedMember)").foregroundStyle(.white)
                            .frame(width: 25)
                            .fontWeight(.bold)
                        
                        Button(action: {
                            plusMemberButtonTapped()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.sub)
                        })
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    HStack{ // 날짜 설정
                        Text("날짜 설정")
                        
                        Spacer()
                        
                        DatePicker("", selection: $trackViewModel.currnetTrackData.startDate)
                    }
                    .foregroundStyle(.white)
                } .padding(.horizontal, 20)
            }
            TUButton(text: "코스등록") {
                trackViewModel.addTrackData(trackData: trackViewModel.currnetTrackData)
                mode.wrappedValue.dismiss()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
            
        }
        //        .environmentObject(TrackViewModel())
        .onTapGesture {hideKeyboard()}
        .background(Color.main)
    }
    
    //     MARK: - Button actions
    func plusTimeButtonTapped() {
        trackViewModel.currnetTrackData.timeTaken += 1
    }
    
    func minusTimeButtonTapped() {
        if trackViewModel.currnetTrackData.timeTaken > 0 {
            trackViewModel.currnetTrackData.timeTaken -= 1
        }
    }
    
    func plusMemberButtonTapped() {
        if trackViewModel.currnetTrackData.limitedMember < 10 {
            trackViewModel.currnetTrackData.limitedMember += 1
        }
    }
    
    func minusMemberButtonTapped() {
        if trackViewModel.currnetTrackData.limitedMember > 1 {
            trackViewModel.currnetTrackData.limitedMember -= 1
        }
    }
    
}

#Preview {
    AddTrackView()
}
