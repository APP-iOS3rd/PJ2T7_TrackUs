//
//  View+Keyboard.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/8/23.
//

import SwiftUI
// 키보드관련 확장
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
