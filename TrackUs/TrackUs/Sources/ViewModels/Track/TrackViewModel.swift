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
            TrackInfo(trackName: "트랙네임1", trackBio: "소개글1", distance: "500m", participationTime: "12시 50분 ~ 13시 30분", startDate: " 12월 12일" , estimatedDistance: 3.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1200, author: UUID(), trackPaths: []),
            TrackInfo(trackName: "트랙네임2", trackBio: "소개글3",distance: "600m", participationTime: "13시 50분 ~ 14시 30분", startDate: " 12월 13일" , estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1400, author: UUID(), trackPaths: []),
            TrackInfo(trackName: "트랙네임3", trackBio: "소개글3",distance: "700m", participationTime: "15시 50분 ~ 16시 30분", startDate: " 12월 14일", estimatedDistance: 4.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 600, author: UUID(), trackPaths: []),
            TrackInfo(trackName: "트랙네임4", trackBio: "소개글4",distance: "800m", participationTime: "17시 50분 ~ 18시 30분", startDate:  "12월 15일", estimatedDistance: 1.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1700, author: UUID(), trackPaths: []),
            TrackInfo(trackName: "트랙네임5", trackBio: "소개글5",distance: "900m", participationTime: "19시 50분 ~ 20시 30분", startDate:  "12월 16일", estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1100, author: UUID(), trackPaths: []),
        ]

        static let shared = TrackViewModel()
        private init() {}
}
