//
//  LaunchScreen.swift
//  TrackUs
//
//  Created by 김정환 on 12/13/23.
//

import SwiftUI

struct LaunchScreen: View {
        var body: some View {
            ZStack {
                Color(hex: "212121")
                    .ignoresSafeArea()
                
                Image("launchLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 320, alignment: .center)
            }
        }
    }


#Preview {
    LaunchScreen()
}
