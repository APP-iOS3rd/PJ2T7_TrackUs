//
//  MateView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct MateView: View {
    
    let items: [ListItemModel] = {
        var listItems: [ListItemModel] = []
        for index in 1...10 {
            listItems.append(ListItemModel(title: "심장 터질정도로 달릴 러닝 브로",distance: "500m", date: "2023.12.5", time: "9:00pm-11:00pm"))
        }
        return listItems
    }()
    
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
                List {
                    //이미지 수정필요(human runing Image)
                    ForEach(items) { item in
                        NavigationLink(destination: MateDetailView()) {
                            HStack {
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 40)
                                    
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.title)
                                        .font(.system(size: 18, weight: .semibold))
                                        .lineLimit(1)
                                        .frame(width: 200)
                                    
                                    HStack {
                                        Image(systemName: "figure.track.and.field")
                                        Text(item.distance)
                                            .font(.subheadline)
                                            .foregroundColor(.init(hex: "FFA500"))
                                            .frame(width: 50)
                                    }
                                    HStack {
                                        Image(systemName: "calendar")
                                        Text(item.date)
                                            .font(.subheadline)
                                            .foregroundColor(.init(hex: "FFA500"))
                                            .lineLimit(1)
                                            .frame(width: 80)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "clock")
                                        Text(item.time)
                                            .font(.subheadline)
                                            .foregroundColor(.init(hex: "FFA500"))
                                            .frame(width: 50)
                                            .lineLimit(1)
                                            .frame(width: 60)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ListItemModel: Identifiable {
    let id = UUID()
    let title: String
    let distance : String
    let date: String
    let time: String
}

#Preview {
    MateView()
}
