//
//  AddTrack.swift
//  TrackUs
//
//  Created by 박선구 on 12/10/23.
//

import SwiftUI

struct AddTrack: View {
    
    @State var numberOfPerson : Int = 1
    
    @State var estimatedTime: Int = 0
    @State var estimatedDistance : Double = 0
    @State var calories : Int = 0
    
    @State var runDate = Date()
    
    @State var trackName : String = ""
    @State var tracktext : String = ""
    let titlePlaceholder : String = "트랙 이름을 입력해 주세요"
    let textPlaceholder : String = "소개 글을 입력해 주세요"
    
    var body: some View {
//        NavigationStack{
            VStack{
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
                VStack{
                        NavigationLink(destination: {
                            // 마커 찍는 지도 들어갈 자리
                        }, label: {
                            ZStack(alignment: .center){
                                Image("mapImage")
//                                    .frame(width: .infinity, height: 80)
                                    .frame(minWidth: 300, maxWidth: .infinity,minHeight: 80,maxHeight: 80)
                                    .cornerRadius(10)
                                Text("코스를 입력해 주세요")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                        })
                    }
                    
                    ZStack(alignment: .topLeading){
                        TextEditor(text: $trackName)
                            .frame(maxWidth: .infinity, minHeight: 70)
                            .scrollContentBackground(.hidden)
                            .background(Color.main)
                        
                        if trackName.isEmpty{
                            Text(titlePlaceholder)
                                .foregroundStyle(.gray)
                                .padding(.top, 10)
                        }
                    }
                    
                    Text("")
                        .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                        .background(Color.gray)
                    
                    //            Divider()
                    
                    ZStack(alignment: .topLeading){
                        TextEditor(text: $tracktext)
                            .frame(maxWidth: .infinity, minHeight: 200)
                            .scrollContentBackground(.hidden)
                            .background(Color.main)
                        
                        if tracktext.isEmpty{
                            Text(textPlaceholder)
                                .foregroundStyle(.gray)
                                .padding(.top, 10)
                        }
                    }
                    
                    
                    Text("")
                        .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                        .background(Color.gray)
                    //            Divider()
                    
                    VStack{
                        HStack{ // 예상 소요 시간
                            Text("예상 소요 시간(분)")
                            
                            Spacer()
                            
                            Button(action: {
                                if estimatedTime > 0 {
                                    estimatedTime -= 1
                                }
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
                                if estimatedTime < 99 {
                                    estimatedTime += 1
                                }
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
                                minus()
                            }, label: {
                                Image(systemName: "minus.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.sub)
                            })
                            
                            Text("\(numberOfPerson)").foregroundStyle(.white)
                                .frame(width: 25)
                                .fontWeight(.bold)
                            
                            Button(action: {
                                plus()
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
                            
                            DatePicker("", selection: $runDate)
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                    }
                    .padding(.vertical)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("코스 등록")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 120)
                            .padding(.vertical, 15)
                            .background(Color.sub)
                            .cornerRadius(100)
                    })
                }
//                .navigationTitle("코스 등록하기")
//                .navigationBarTitleDisplayMode(.inline)
            }
            .padding(.horizontal, 20)
            .background(Color.main)
        
    }
    
    func plus() {
        if numberOfPerson < 10 {
            numberOfPerson += 1
        }
    }
    func minus() {
        if numberOfPerson > 1 {
            numberOfPerson -= 1
        }
    }
}

#Preview {
    AddTrack()
}
