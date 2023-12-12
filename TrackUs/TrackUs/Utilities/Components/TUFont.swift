//
//  TUFont.swift
//  TrackUs
//
//  Created by 최주원 on 12/11/23.
//

import SwiftUI

// .customTextStyle(style: .caption) 방식으로 사용

enum CustomTextStyle {
    case largeTitle
    case title
    case headline
    case body
    case caption
}
extension View {
    func customTextStyle(style: CustomTextStyle) -> some View {
        var font: Font
        var color: Color

        switch style {
        case .largeTitle:
            font = Font.system(size: 20, weight: .bold)
            color = Color.mainFont
        case .title:
            font = Font.system(size: 16, weight: .bold)
            color = Color.mainFont
        case .headline:
            font = Font.system(size: 12, weight: .bold)
            color = Color.mainFont
        case .body:
            font = Font.system(size: 14, weight: .medium)
            color = Color.mainFont
        case .caption:
            font = Font.system(size: 12, weight: .medium)
            color = Color.sub // 캡션에 대한 컬러 지정
        }

        return self
            .font(font)
            .foregroundColor(color)
    }
}
