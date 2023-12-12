//
//  TrackViewModel.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/11.
//

import Foundation

// 테스트데이터
class TrackViewModel: ObservableObject {
    @Published var track = [Track]()
    
    init() {
        self.track = [
            Track(trackName: "러닝크루 모집 테스트글1", bio: "러닝크루 모집 합니다2", estimatedTime: 1200, estimatedDistance: 3.3, caloriesConsumed: 330, participantsMember: 3, limitedMember: 6, startDate: Date(), startLocation: PathLatLng(lat: 37.56694851897021, lng: 126.97023083123904), paths: [PathLatLng(lat: 37.56694851897021, lng: 126.97023083123904), PathLatLng(lat: 37.56572323844142, lng: 126.97052560997525)], author: UUID(), participants: [UUID(), UUID(),UUID()]),
            Track(trackName: "러닝크루 모집 테스트글2", bio: "오늘도 러닝", estimatedTime: 1400, estimatedDistance: 3.8, caloriesConsumed: 330, participantsMember: 3, limitedMember: 6, startDate: Date(), startLocation: PathLatLng(lat: 37.567507221454676, lng: 126.97057018369017), paths: [PathLatLng(lat: 37.567255337718635, lng: 126.97220023632316), PathLatLng(lat: 37.565038379047515, lng: 126.97011840350035)], author: UUID(), participants: [UUID(), UUID(),UUID()]),
            Track(trackName: "러닝크루 모집 테스트글3", bio: "혼자 뛰지말고 같이 뛰어요", estimatedTime: 2000, estimatedDistance: 4.3, caloriesConsumed: 630, participantsMember: 3, limitedMember: 6, startDate: Date(), startLocation: PathLatLng(lat: 37.56530927134414, lng: 126.97256316199348), paths: [PathLatLng(lat: 37.564191843961694, lng: 126.9717486284146), PathLatLng(lat: 37.563326300736364, lng: 126.96939470159279)], author: UUID(), participants: [UUID(), UUID(),UUID()])
        ]
    }
}
