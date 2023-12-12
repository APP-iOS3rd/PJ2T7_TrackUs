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
                // MARK: - 메인 타이틀
                Group {
                    HStack {
                            Text("Track")
                                .font(.largeTitle)
                            Text("Us")
                                .font(.largeTitle)
                                .foregroundColor(Color.orange)
                            Spacer()
                        }
                    .padding()
                }
                // MARK: - 버튼 (추가예정)
                VStack {
                    HStack {
                        Text("런닝 모집")
                            .frame(width: 200)
                        Spacer()
                        Text("내 러닝 모음")
                            .frame(width: 200)
                    }
                }
                // MARK: - 리스트 & 네비게이션 뷰
            NavigationView {
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: MateDetailView()) {
                            HStack {
                                //이미지 수정필요(human runing Image)
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 40)
                                    .foregroundColor(Color.white)
                                // MARK: - 메이트 모집 데이터(거리,날짜,시간)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.title)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(.white)
                                        .lineLimit(1)
                                        .frame(width: 200)
                                    
                                    HStack {
                                        Image(systemName: "figure.track.and.field")
                                            .foregroundColor(Color.white)
                                        Text(item.distance)
                                            .font(.subheadline)
                                            .foregroundColor(.init(hex: "FFA500"))
                                            .frame(width: 50)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color.white)
                                        Text(item.date)
                                            .font(.subheadline)
                                            .foregroundColor(.init(hex: "FFA500"))
                                            .lineLimit(1)
                                            .frame(width: 80)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "clock")
                                            .foregroundColor(Color.white)
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
                        //리스트 배경색
                        .listRowBackground(Color.init(hex: "212121"))
                    }
                }
            }
            //.navigationBarColor(backgroundColor: .white, titleColor: .white) //네비게이션바컬러
        }
    }
}
/* 네비게이션바컬러
struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
 */

//리스트 데이터 구조체
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
