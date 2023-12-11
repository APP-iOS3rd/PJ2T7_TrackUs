//
//  MateView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MateView: View {
    var body: some View {
            VStack {
                    HStack {
                        Text("Track")
                            .font(.largeTitle)
                        Text("Us")
                            .font(.largeTitle)
                            .foregroundColor(Color.orange)
                        Spacer()
                    }
                    .padding()
                
                VStack {
                    HStack {
                        Text("buttons")
                            .frame(width: 200)
                        Spacer()
                        Text("button")
                            .frame(width: 200)
                    }
                }
                
            NavigationView {
                List(0 ..< 20) { item in
                    //이미지 수정필요(human runing Image)
                    HStack {
                        Image(systemName: "figure.run")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 40)
                            
                        VStack(alignment: .leading, spacing: 5) {
                            Text("심장 터질정도로 달릴 러닝 브로")
                                .font(.system(size: 18, weight: .semibold))
                                .lineLimit(1)
                                .frame(width: 200)
                            
                            HStack {
                                Image(systemName: "figure.track.and.field")
                                Text("500m")
                                    .font(.subheadline)
                                    .foregroundColor(.init(hex: "FFA500"))
                            }
                            
                            HStack {
                                Image(systemName: "calendar")
                                Text("2023.12.02")
                                    .font(.subheadline)
                                    .foregroundColor(.init(hex: "FFA500"))
                            }
                            
                            HStack {
                                Image(systemName: "clock")
                                Text("9:00 PM ~ 11:00 PM")
                                    .font(.subheadline)
                                    .foregroundColor(.init(hex: "FFA500"))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MateView()
}
