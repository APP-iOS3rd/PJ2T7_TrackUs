//
//  AddTrackView.swift
//  TrackUs
//
//  Created by 박선구 on 12/10/23.
//

import SwiftUI
import NMapsMap
struct AddTrackView: View {
    @State var trackName : String = "" // 트랙이름
    @State var limitedMember : Int = 1 // 제한인원
    @State var estimatedTime: Int = 0 // 예상시간(분)
    @State var estimatedDistance : Double = 0 // 예상거리
    @State var calories : Int = 0 // 소모칼로리
    @State var startDate = Date() // 시작날짜
    @State var trackBio : String = "" // 트랙소개
    
    let titlePlaceholder : String = "트랙 이름을 입력해 주세요"
    let textPlaceholder : String = "소개 글을 입력해 주세요"
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - 입력된 정보로 예상거리, 소요시간, 소모칼로리를 보여줌
            HStack{
                VStack{
                    Text("예상거리")
                        .font(.footnote)
                    Text("\(String(format: "%.2f",estimatedDistance))km")
                        .italic()
                        .fontWeight(.black)
                }
                
                Spacer()
                
                VStack{
                    Text("소요시간")
                        .font(.footnote)
                    Text("\(estimatedTime)min")
                        .italic()
                        .fontWeight(.black)
                }
                
                Spacer()
                
                VStack{
                    Text("소모칼로리")
                        .font(.footnote)
                    Text("\(calories)kcal")
                        .italic()
                        .fontWeight(.black)
                }
            }
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
                
                TextField(text: $trackName) {
                    Text("트랙 이름을 입력해주세요")
                        .foregroundColor(.gray)
                }
                .foregroundColor(.white)
                .padding(20)
                
                Divider().background(.gray)
                
                // 소개글
                ZStack(alignment: .topLeading){
                    TextEditor(text: $trackBio)
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .scrollContentBackground(.hidden)
                        .background(Color.main)
                        .padding(20)
                        .foregroundColor(.white)
                    
                    if trackBio.isEmpty{
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
                        
                        Text("\(estimatedTime)")
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
                        
                        Text("\(limitedMember)").foregroundStyle(.white)
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
                        
                        DatePicker("", selection: $startDate)
                    }
                    .foregroundStyle(.white)
                } .padding(.horizontal, 20)
            }
            TUButton(text: "코스등록") {}
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
            
        }
        .onTapGesture {hideKeyboard()}
        .background(Color.main)
    }
    
    // MARK: - Methods
    func plusTimeButtonTapped() {
        estimatedTime += 1
    }
    
    func minusTimeButtonTapped() {
        if estimatedTime > 0 {
            estimatedTime -= 1
        }
    }
    
    func plusMemberButtonTapped() {
        if limitedMember < 10 {
            limitedMember += 1
        }
    }
    
    func minusMemberButtonTapped() {
        if limitedMember > 1 {
            limitedMember -= 1
        }
    }
    
}

#Preview {
    AddTrackView()
}
