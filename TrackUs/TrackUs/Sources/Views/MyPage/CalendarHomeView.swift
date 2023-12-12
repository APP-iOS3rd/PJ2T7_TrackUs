//
//  CalendarHomeView.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct CalendarHomeView: View {
    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                CustomDatePicker(currentDate: $currentDate, trackViewModel: TrackViewModel.shared)
            }
            .padding(.vertical)
        }
        .foregroundStyle(.white)
        .background(Color.main)
    }
}

#Preview {
    CalendarHomeView()
}
