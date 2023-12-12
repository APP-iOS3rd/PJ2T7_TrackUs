//
//  Track.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/11.
//

import Foundation
import NMapsMap

struct TrackInfo : Hashable {
    var trackName: String // 트랙이름
    var trackBio: String // 소개
    var distance: String //트랙거리 (distance추가)
    var participationTime : String //참여시간 (participationTime추가)
    var startDate: String // 시작날짜 (자료형수정)
    var estimatedDistance: Double // 예상거리
    var limitedMember: Int // 제한인원
    var participations: [UUID] // 참여자리스트
    var timeTaken: Int // 소요시간
    var author: UUID // 작성
    var trackPaths: [NMFMarker]
}


