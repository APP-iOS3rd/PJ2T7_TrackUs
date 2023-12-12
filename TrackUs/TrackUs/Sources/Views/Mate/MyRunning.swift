//
//  MyRunning.swift
//  TrackUs
//
//  Created by 박선구 on 12/11/23.
//

import SwiftUI

struct MyRunning: View {
    
    private var vGridItems = [GridItem()]
    
    var body: some View {
            ScrollView{
//                NavigationLink(destination: MateDetailView(), label: {
                LazyVGrid(columns: vGridItems, spacing: 0) {
                    ForEach((1...5), id: \.self) { item in
                        MyRunningCell(title: "3.3km", date: "12/02", time: "11시 50 - 12시")
                            
                    }
                }
//            })
            }
            .foregroundStyle(.white)
            .background(Color.main)
    }
}

struct MyRunningCell: View {
    
    let title: String
    let date: String
    let time: String
    
    var body: some View {
        NavigationLink(destination: MateDetailView(), label: {
        VStack{
            HStack(spacing: 10) {
                
                Spacer()
                
                Image(systemName: "figure.run")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("심장 터질 정도로 달릴 러닝 브로...")
                        .font(.headline)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                    HStack{
                        Image(systemName: "figure.track.and.field")
                        Text("\(title)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                    HStack{
                        Image(systemName: "calendar")
                        Text("\(date)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                    HStack{
                        Image(systemName: "clock")
                        Text("\(time)")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.sub)
                    }
                }
                
                Image(systemName: "chevron.forward")
            }
            
            .padding(15)
            
            Text("")
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .background(Color.sub)
            
        }
        .background(Color.main)
        })
    }
}


#Preview {
    MyRunning()
}
