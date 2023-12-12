//
//  Track.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/11.
//

import Foundation
import NMapsMap

struct TrackInfo {
    var trackName: String // 트랙이름
    var trackBio: String // 소개
    var startDate: Date // 시작날짜
    var estimatedDistance: Double // 예상거리
    var limitedMember: Int // 제한인원
    var participations: [UUID] // 참여자리스트
    var timeTaken: Int // 소요시간
    var author: UUID // 작성
    var caloriesConsumed: Int // 소모칼로리
    var trackPaths: [NMFMarker]
}


