//
//  Introduction.swift
//  TrackUs
//
//  Created by 박선구 on 12/14/23.
//

import SwiftUI

struct Introduction: View {
    
    let trackInfo: TrackInfo

    @StateObject var trackViewModel = TrackViewModel()
    
    var body: some View {
        
        // 소개에 해당하는 내용
        TUText(style: .body, text: trackInfo.trackBio)

        
    }
}

//#Preview {
//    Introduction()
//}
