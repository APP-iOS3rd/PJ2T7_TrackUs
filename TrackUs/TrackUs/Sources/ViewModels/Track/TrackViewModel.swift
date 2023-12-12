//
//  TrackViewModel.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import Foundation
import NMapsMap

class TrackViewModel: ObservableObject { 
        @Published var trackDatas: [TrackInfo] = [
            TrackInfo(trackName: "트랙네임1", trackBio: "소개글1", startDate: Date(), estimatedDistance: 3.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1200, author: UUID(), caloriesConsumed:1500, trackPaths: []),
            TrackInfo(trackName: "트랙네임2", trackBio: "소개글3", startDate: Date(), estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1400, author: UUID(), caloriesConsumed:1300, trackPaths: []),
            TrackInfo(trackName: "트랙네임3", trackBio: "소개글3", startDate: Date(), estimatedDistance: 4.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 600, author: UUID(), caloriesConsumed:500, trackPaths: []),
            TrackInfo(trackName: "트랙네임4", trackBio: "소개글4", startDate: Date(), estimatedDistance: 1.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1700, author: UUID(), caloriesConsumed:1000,trackPaths: []),
            TrackInfo(trackName: "트랙네임5", trackBio: "소개글5", startDate: Date(), estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1100, author: UUID(), caloriesConsumed:1200,trackPaths: []),
        ]

        static let shared = TrackViewModel()
        private init() {}
}
