//
//  Track.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/11.
//

import Foundation

struct PathLatLng {
    var lat: Double
    var lng: Double
}

struct Track {
    var trackName: String // 트랙이름
    var bio: String // 트랙소개
    var estimatedTime: Int // 예상시간(밀리초)
    var estimatedDistance: Double // 예상거리
    var caloriesConsumed: Int // 예상소모 칼로리
    var participantsMember: Int // 참여인원
    var limitedMember: Int // 참여제한 인원
    var startDate: Date // 시작날짜
    var startLocation: PathLatLng // 시작위치 -> 위도(lat) 경도(lng)
    var paths: [PathLatLng] // 경로선
    var author: UUID // 작성자
    var participants: [UUID] // 참여자
}
