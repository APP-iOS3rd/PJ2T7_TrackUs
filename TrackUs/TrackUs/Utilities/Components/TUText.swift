//
//  TUText.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

// MARK: - 사용법
/*
 - 공통으로 사용될 타이포그라피, 버튼스타일 등을 한개의 컴포넌트에서 동시에 관리
 - 타이포그라피, 버튼의 스펙을 미리 지정해서 일관적인 스펙을 유지하는 목적
 */

struct TUText: View {
    let style: TUTextGuide
    let text: String
    let color: Color
    
    enum TUTextGuide {
        case bigTitle // 대제목
        case mediumTitle // 중제목
        case smallTitle // 소제목
        case body // 본문
        case caption // 캡션
    }
    
    init(style: TUTextGuide, text: String, color: Color = .mainFont) {
        self.style = style
        self.text = text
        self.color = color
    }
    
    var body: some View {
        switch style {
        case .bigTitle:
            Text(text)
                .font(.system(size: 20))
                .fontWeight(Constants.TextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .mediumTitle:
            Text(text)
                .font(.system(size: Constants.TextConst.MEDIUM_TITLE_SIZE))
                .fontWeight(Constants.TextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .smallTitle:
            Text(text)
                .font(.system(size: Constants.TextConst.SMALL_TITLE_SIZE))
                .fontWeight(Constants.TextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .body:
            Text(text)
                .font(.system(size: Constants.TextConst.BODY_SIZE))
                .fontWeight(Constants.TextConst.BODY_WEIGHT)
                .foregroundColor(color)
        case .caption:
            Text(text)
                .font(.system(size: Constants.TextConst.CAPTION_SIZE))
                .fontWeight(Constants.TextConst.BODY_WEIGHT)
                .foregroundColor(.sub)
                .foregroundColor(color)
        }
    }
}

#Preview {
    TUText(style: .bigTitle, text:"TrackUs")
}
