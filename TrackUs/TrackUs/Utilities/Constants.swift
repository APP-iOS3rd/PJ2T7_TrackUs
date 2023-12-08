//
//  Constants.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

enum Constants {
    // MARK: - GLOBAL
    enum GlobalUIConst {
        static let HORIZONTAL_SPACING: CGFloat = 20
        static let VERTICAL_SPACING: CGFloat = 20
    }
    
    // MARK: - Text
    enum TUTextConst {
        // Font Sizes
        static let BIG_TITLE_SIZE:CGFloat = 20 // 대제목 사이즈
        static let MEDIUM_TITLE_SIZE:CGFloat = 16 // 중제목 사이즈
        static let SMALL_TITLE_SIZE:CGFloat = 12 // 소제목 사이즈
        static let BODY_SIZE:CGFloat = 14 // 본문 사이즈
        static let CAPTION_SIZE:CGFloat = 12 // 캡션 사이즈
        
        // Font Weight
        static let TITLE_WEIGHT: Font.Weight = .bold // 제목 굵기를 bold로 설정
        static let BODY_WEIGHT: Font.Weight = .medium // 본문 굵기를 medium으로 설정
    }
}
