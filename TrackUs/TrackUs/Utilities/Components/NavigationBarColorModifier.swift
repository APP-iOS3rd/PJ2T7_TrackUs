//
//  NavigationBarColorModifier.swift
//  TrackUs
//
//  Created by 최주원 on 12/13/23.
//

import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor) -> some View {
        modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: UIColor
    var titleColor: UIColor

    init(backgroundColor: UIColor, titleColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        
        

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        content
    }
}
