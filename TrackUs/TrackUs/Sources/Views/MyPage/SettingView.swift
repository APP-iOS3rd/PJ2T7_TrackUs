//
//  SettingView.swift
//  TrackUs
//
//  Created by 박선구 on 12/13/23.
//

import SwiftUI

struct SettingList: Identifiable {
    var id = UUID()
    var text: String
}

struct SettingView: View {
    
    @State var listData: [SettingList] = [
        SettingList(text: "개인정보 처리방침"),
        SettingList(text: "오픈소스 라이센스"),
        SettingList(text: "로그아웃")
    ]
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                Text("설정")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                List{
                    Section(){
                        ForEach(listData) { item in
                            Text(item.text)
                                .foregroundStyle(.white)
                                .listRowSeparator(.hidden)
                            //                            .listRowSeparatorTint(.white)
                                .listRowBackground(Color.main)
                        }
                    }
                    
                    Section(){
                        Text("탈퇴하기")
                            .foregroundStyle(.disableFont)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.main)
                    }

                }
//                .listStyle(.plain)
                .listStyle(.grouped)
                //                .background(.main)
                //                .background(.gray)
                .scrollContentBackground(.hidden)
                //            .padding(.horizontal, 20)
            }
            
            
            HStack(spacing: 0){
                Text("Track")
                    .foregroundStyle(.white)
                Text("Us")
                    .foregroundStyle(.sub)
            }
            Text("박소희, 권석기, 김정환, 윤준성, 최주원, 박선구")
                .foregroundStyle(Color.secret)
        }
        .padding(.horizontal, 20)
        .background(.main)
    }
}

#Preview {
    SettingView()
}
