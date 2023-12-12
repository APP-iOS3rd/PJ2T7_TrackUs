//
//  FloatingButton.swift
//  TrackUs
//
//  Created by SeokkiKwon on 12/9/23.
//

import SwiftUI

struct FloatingButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "plus")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.main)
                .frame(width: 60, height: 60)
                .background(.sub)
                .cornerRadius(20)
        })
    }
}

#Preview {
    FloatingButton {
        
    }
}
