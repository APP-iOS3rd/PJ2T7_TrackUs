//
//  TrackViewModel.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import Foundation
import NMapsMap

class TrackViewModel: ObservableObject {
        // 트랙추가에 입력되는 정보
        // 필드가 많고 계산로직이 필요하여 뷰모델에서 관리하는 방식으로 변경
//        @Published var currentTrackPaths = NMFArrowheadPath()
        @Published var arrowPath = NMFArrowheadPath()
        @Published var currnetTrackData: TrackInfo = TrackInfo(trackName: "", trackBio: "", startDate: Date(), estimatedDistance: 0.0, limitedMember: 1, participations: [], timeTaken: 0, author: UUID(), caloriesConsumed: 0, trackPaths: NMFArrowheadPath()
        )
    
        @Published var trackDatas: [TrackInfo] = [
            TrackInfo(trackName: "트랙네임1", trackBio: "소개글1", startDate: Date(), estimatedDistance: 3.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1200, author: UUID(), caloriesConsumed:1500, trackPaths: NMFArrowheadPath()),
            TrackInfo(trackName: "트랙네임2", trackBio: "소개글2", startDate: Date(), estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1400, author: UUID(), caloriesConsumed:1300, trackPaths: NMFArrowheadPath()),
            TrackInfo(trackName: "트랙네임3", trackBio: "소개글3", startDate: Date(), estimatedDistance: 4.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 600, author: UUID(), caloriesConsumed:500, trackPaths: NMFArrowheadPath()),
            TrackInfo(trackName: "트랙네임4", trackBio: "소개글4", startDate: Date(), estimatedDistance: 1.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1700, author: UUID(), caloriesConsumed:1000,trackPaths: NMFArrowheadPath()),
            TrackInfo(trackName: "트랙네임5", trackBio: "소개글5", startDate: Date(), estimatedDistance: 2.3, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1100, author: UUID(), caloriesConsumed:1200,trackPaths: NMFArrowheadPath()),
        ]
    
        // static은 메모리에 올려서 공통으로 올리고 사용하는것
//        static let shared = TrackViewModel()
//        private init() {}
}
