//
//  SettingView.swift
//  TrackUs
//
//  Created by 박선구 on 12/13/23.
//

import SwiftUI
//import Lottie

struct SettingList: Identifiable {
    var id = UUID()
    var text: String
}

struct SettingView: View {
    @State var logoutCheck = false
    @State var secessionCheck = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 20){

                Text("설정")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 49,height: 100, alignment: .leading)
                    .offset(x: -3, y:20)
                
                VStack(alignment: .leading ,spacing: 20) {
                    Link(destination: URL(string: "https://developer.apple.com/kr/app-store/app-privacy-details/")!, label: {
                        Text("개인정보 처리방침")
                            .foregroundStyle(.white)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.main)
                    })
                    
                    Link(destination: URL(string: "https://www.olis.or.kr/license/Detailselect.do?lId=1002")!, label: {
                        Text("오픈소스 라이센스")
                            .foregroundStyle(.white)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.main)
                    })
                    
                    Button(action: {
                        self.logoutCheck.toggle()
                    }, label: {
                        Text("로그아웃")
                            .foregroundStyle(.white)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.main)
                        if self.logoutCheck{
                            Text("로그아웃 하실 수 없습니다")
                        }
                        
                    })
        
                }
//                LottieView(animation: .named("LottieAnimation"))
//                    .looping()
                
                Button(action: {
                    self.secessionCheck.toggle()
                }, label: {
                    Text("탈퇴하기")
                        .foregroundStyle(.disableFont)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.main)
                        .frame(height: 50)
                    if self.secessionCheck{
                        Text("탈퇴 하실 수 없습니다")
                    }
                })
                
            }
            .padding()
            .frame(width: 350,alignment: .leading)
            Spacer()
          
            HStack(spacing: 0){
                Text("Track")
                    .foregroundStyle(.white)
                Text("Us")
                    .foregroundStyle(.sub)
            }
            Text("박소희, 권석기, 김정환, 윤준성, 최주원, 박선구")
                .foregroundStyle(Color.secret)
                
        }
        .frame(width: .maximum(400, 0),height: .maximum(0, 800))
        .padding(.horizontal, 20)
        .background(.main)
    }
}

#Preview {
    SettingView()
}
