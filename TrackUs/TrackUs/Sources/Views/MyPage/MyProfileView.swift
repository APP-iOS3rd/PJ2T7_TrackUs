//
//  MyProfileView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct profile {
    var userName: String = "SeonKoo"
    var userImage = "ProfileImage"
}

struct MyProfile: View {
    @StateObject var userViewModel = UserViewModel.shared
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                
                HStack{
                    //사용자 이미지
                    Image(profile().userImage)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 75, height: 75)
                        .overlay(
                            RoundedRectangle(cornerRadius: 360)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.orange)
                                .offset(CGSize(width: 7.0, height: 5.0))
                        )
                    VStack{
                        HStack{
                            //사용자 이름
                            Group {
                                Text("JeongHwan")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                Button(action: {}, label: {
                                    Image(systemName: "pencil.circle.fill")
                                        .foregroundColor(.sub)
                                })
                            }
                            .offset(x:20, y:4)
                        }
                    }
                }
                .padding(.vertical, 10)
                
                
                Spacer()
                HStack{
                    NavigationLink(destination: SettingView(), label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .offset(x: -10, y: 4)
                    })
                }
            }
            Text("")
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                .background(Color.sub)
            
        }
        .background(Color.main)
        
    }
}

#Preview {
    MyProfile()
}
