//
//  Color+.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI


// MARK: - 사용법
/*
    파일 네이밍룰은 objective-c 방식을 차용 확장할 파일명 + 확장기능 으로 파일을 생성
    - 파일명으로 확장의 목적을 파악
    - 프로젝트 규모가 커짐에 따라 확장에 대한 관리 방법을 제시
 
    Color+.swift ->  Color 클래스를 확장하는 swift파일
 */

// HEX 코드를 사용하여 컬러를 지정해줄 수 있는 확장
extension Color {
    init(hex: String) {
      let scanner = Scanner(string: hex)
      _ = scanner.scanString("#")
      
      var rgb: UInt64 = 0
      scanner.scanHexInt64(&rgb)
      
      let r = Double((rgb >> 16) & 0xFF) / 255.0
      let g = Double((rgb >>  8) & 0xFF) / 255.0
      let b = Double((rgb >>  0) & 0xFF) / 255.0
      self.init(red: r, green: g, blue: b)
    }
}

// HEX 코드를 사용하여 컬러를 미리 지정
extension Color {
      static let peach = Color(hex: "#ff8882")
      static let ivory = Color(hex: "f8ede3")
      static let brown = Color(hex: "897853")  // #을 제거하고 사용해도 됩니다.
}
