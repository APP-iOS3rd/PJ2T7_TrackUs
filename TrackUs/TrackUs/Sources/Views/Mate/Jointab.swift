//
//  Jointab.swift
//  TrackUs
//
//  Created by 박선구 on 12/14/23.
//

import SwiftUI

struct Jointab: View {
    var body: some View {
        
        VStack(spacing: 30) {
            HStack {
                ParticipantImage(participationsImage: "image1")
                ParticipantImage(participationsImage: "image1")
                ParticipantImage(participationsImage: "image1")
                ParticipantImage(participationsImage: "image1")
            }
            
            Spacer()
            
        }
        .padding(.top, 30)
        
    }
}

#Preview {
    Jointab()
}
