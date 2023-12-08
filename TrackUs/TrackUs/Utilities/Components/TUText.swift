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
        case big_title // 대제목
        case medium_title // 중제목
        case small_title // 소제목
        case body // 본문
        case caption // 캡션
    }
    
    init(style: TUTextGuide, text: String, color: Color = .white) {
        self.style = style
        self.text = text
        self.color = color
    }
    
    var body: some View {
        switch style {
        case .big_title:
            Text(text)
                .font(.system(size: 20))
                .fontWeight(Constants.TUTextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .medium_title:
            Text(text)
                .font(.system(size: Constants.TUTextConst.MEDIUM_TITLE_SIZE))
                .fontWeight(Constants.TUTextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .small_title:
            Text(text)
                .font(.system(size: Constants.TUTextConst.SMALL_TITLE_SIZE))
                .fontWeight(Constants.TUTextConst.TITLE_WEIGHT)
                .foregroundColor(color)
        case .body:
            Text(text)
                .font(.system(size: Constants.TUTextConst.BODY_SIZE))
                .fontWeight(Constants.TUTextConst.BODY_WEIGHT)
                .foregroundColor(color)
        case .caption:
            Text(text)
                .font(.system(size: Constants.TUTextConst.CAPTION_SIZE))
                .fontWeight(Constants.TUTextConst.BODY_WEIGHT)
                .foregroundColor(.sub)
                .foregroundColor(color)
        }
    }
}

#Preview {
    TUText(style: .big_title, text:"TrackUs")
}
