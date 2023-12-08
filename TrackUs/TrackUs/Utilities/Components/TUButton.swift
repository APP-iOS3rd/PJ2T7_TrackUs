//
//  TUButton.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI

// MARK: - 사용법
/*
 
 공통으로 사용될 버튼 스타일을 지정
 - 공통으로 사용될 타이포그라피, 버튼스타일 등을 한개의 컴포넌트에서 동시에 관리
 - 타이포그라피, 버튼의 스펙을 미리 지정해서 일관적인 스펙을 유지하는 목적
 */

struct TUButton: View {
    var text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            TUText(style: .big_title, text: text)
        })
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(.sub)
        .clipShape(Capsule())
    }
}

#Preview {
    TUButton(text: "Button") {
        
    }
}
