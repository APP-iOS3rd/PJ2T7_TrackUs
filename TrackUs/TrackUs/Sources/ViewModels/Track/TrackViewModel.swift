//
//  TrackViewModel.swift
//  TrackUs
//
//  Created by SeokKi Kwon on 2023/12/12.
//

import Foundation
import NMapsMap

// (임시)
//enum TrackListType {
//    case recruitment
//    case myRunning
//}

class TrackViewModel: ObservableObject {
    // 좌표데이터
    let mapPoints = [
        [
            NMGLatLng(lat: 37.360588143749716, lng: 127.10927920086243),
            NMGLatLng(lat: 37.35997393335383, lng: 127.11090376958516),
            NMGLatLng(lat:  37.35899984718702, lng: 127.11194081070394),
        ],
        [
            NMGLatLng(lat: 37.36254038357527, lng: 127.10255420691483),
            NMGLatLng(lat: 37.363802947505384, lng: 127.10124646072798),
            NMGLatLng(lat:  37.36340836940597, lng: 127.09903339886807),
            NMGLatLng(lat:  37.36330196712128, lng: 127.0969561913323),
        ],
        [
            NMGLatLng(lat: 37.359028776133805, lng: 127.09975006134782),
            NMGLatLng(lat: 37.359138352407456, lng: 127.09801188705698),
            NMGLatLng(lat:  37.35948169080621, lng: 127.09686097393336),
            NMGLatLng(lat: 37.358851433157746
                      , lng: 127.0962957767195),
            NMGLatLng(lat: 37.35814813474165, lng: 127.09690441072416),
            NMGLatLng(lat:  37.358271761561305, lng: 127.09992966201068),
        ],
    ]
    
    // 유저가 입력한 트랙정보
    @Published var currnetTrackData: TrackInfo = TrackInfo(trackName: "", trackBio: "", startDate: Date(), estimatedDistance: 0.0, limitedMember: 1, participations: [], timeTaken: 0, author: UUID(), caloriesConsumed: 0, trackPaths: NMFArrowheadPath(), startMarker: NMFMarker())
    
    // 트랙정보
    @Published var trackDatas: [TrackInfo] = []
    
    let R = 6371000.0
    
    init() { setTrackDatas() }
    
    /**
    트랙정보 초기세팅
     */
    func setTrackDatas() {
        for (idx, mapPoint) in mapPoints.enumerated() {
            let fakeUUID = UUID()
            let pointList = mapPoint
            let mapPaths = NMFArrowheadPath(pointList)
            trackDatas.append(TrackInfo(trackName: "트랙이름", trackBio: "소개글", startDate: Date(), estimatedDistance: 2300, limitedMember: 6, participations: [fakeUUID], timeTaken: 2300, author: fakeUUID, caloriesConsumed: 190, trackPaths: mapPaths!, startMarker: NMFMarker(position: NMGLatLng(lat: mapPaths!.points[0].lat, lng: mapPaths!.points[0].lng))))
        }
    }
    
    /**
     트랙정보를 리스트에 추가합니다
     */
    func addTrackData(trackData: TrackInfo) {
        // 트랙경로의 첫번째 위도, 경도를 이용하여 한글 주소를 먼저 지정
        self.trackDatas.append(trackData)
        resetTrackData()
    }
    
    /**
     현재 form에 입력된 트랙정보를 초기화합니다
     */
    func resetTrackData() {
        self.currnetTrackData = TrackInfo(trackName: "", trackBio: "", startDate: Date(), estimatedDistance: 0.0, limitedMember: 1, participations: [], timeTaken: 0, author: UUID(), caloriesConsumed: 0, trackPaths: NMFArrowheadPath(), startMarker: NMFMarker())
    }
    
    /**
     현재 설정된 트랙경로의 정보 비웁니다
     */
    func resetTrackPathData() {
        self.currnetTrackData.trackPaths.points.removeAll() // 현재 선택된 경로를 모두 비웁니다
        self.currnetTrackData.trackPaths.mapView = nil // 맵뷰상에서 경로를 사라지게 설정
        self.currnetTrackData.startMarker.mapView = nil // 맵뷰 상에서 시작마커를 사라지게 설정
        // 소요시간, 칼로리, 예상거리 데이터를 0으로 초기화
        self.currnetTrackData.estimatedDistance = 0
        self.currnetTrackData.caloriesConsumed = 0
        self.currnetTrackData.timeTaken = 0
    }
    
    /**
     최근에 추가된 경로를 제거합니다.
     */
    func revertTrackPathData() {
        // 포인트가 3개 이상인 경우 데이터를 1개씩 삭제
        if self.currnetTrackData.trackPaths.points.count >= 3 {
            self.currnetTrackData.trackPaths.points.popLast()
            calculateWorkoutStats()
        }
        // 포인트가 2개인경우 모든 경로 삭제
        else if self.currnetTrackData.trackPaths.points.count >= 2 {
            resetTrackPathData()
        }
    }
    
    /**
     경로의 데이터를 반복문을 돌면서 운동정보를 다시 계산합니다.
     */
    func calculateWorkoutStats() {
        self.currnetTrackData.estimatedDistance = 0
        let coordinates = self.currnetTrackData.trackPaths.points
        // 경로포인트 개수 -1 부터 0번째 인덱스까지 거리를 재계산
        for index in stride(from: coordinates.count - 1, to: 0, by: -1) {
            let newData = coordinates[index]
            let oldData = coordinates[index - 1]
            self.currnetTrackData.estimatedDistance += calculateCoordinatesDistance(lat1: newData.lat, lon1: newData.lng, lat2: oldData.lat, lon2: oldData.lng)
            self.currnetTrackData.caloriesConsumed = Int(calculateCaloriesBurned(distanceInMeters: self.currnetTrackData.estimatedDistance))
            
            self.currnetTrackData.timeTaken = calculateAverageTimeInMinute(distanceInMeters: self.currnetTrackData.estimatedDistance, averageSpeed: 2.0)
        }
    }
    
    /**
     저장된 경로의 위도, 경도를 기반으로 운동정보를 계산합니다
     */
    func caculateWorkoutMetrics() {
        // 2개의 포인트 이상이 저장된 경우에 계산시작
        if self.currnetTrackData.trackPaths.points.count >= 2 {
            let pathCount = currnetTrackData.trackPaths.points.count
            let newData = currnetTrackData.trackPaths.points.last!
            let oldData = currnetTrackData.trackPaths.points[pathCount - 2]
            self.currnetTrackData.estimatedDistance += calculateCoordinatesDistance(lat1: newData.lat, lon1: newData.lng, lat2: oldData.lat, lon2: oldData.lng)
            self.currnetTrackData.caloriesConsumed = Int(calculateCaloriesBurned(distanceInMeters: self.currnetTrackData.estimatedDistance))
            self.currnetTrackData.timeTaken = calculateAverageTimeInMinute(distanceInMeters: self.currnetTrackData.estimatedDistance, averageSpeed: 2.0)
        }
    }
    
    // (임시)
//    @Published var currentListType: TrackListType = .recruitment
}

// MARK: - 서브함수
func degreesToRadians(_ degrees: Double) -> Double {
    return degrees * .pi / 180.0
}

// 칼로리 계산
func calculateCaloriesBurned(distanceInMeters: Double) -> Double {
    // 칼로리 소모 계수 (임의의 값, 실제로는 개인에 따라 다를 수 있음)
    let caloriesPerMeter: Double = 0.05
    
    // 칼로리 소모 계산
    let caloriesBurned = distanceInMeters * caloriesPerMeter
    return caloriesBurned
}

// 예상 소요시간
func calculateAverageTimeInMinute(distanceInMeters: Double, averageSpeed: Double) -> Int {
    // 평균 시속으로 거리를 이동하는 데 필요한 시간 계산
    let timeInSeconds = distanceInMeters / averageSpeed
    
    return Int(timeInSeconds)
}

// 2개의 위도, 경도를 받아서 거리를 계산
func calculateCoordinatesDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let dLat = degreesToRadians(lat2 - lat1)
    let dLon = degreesToRadians(lon2 - lon1)
    
    let a = sin(dLat / 2) * sin(dLat / 2) +
    cos(degreesToRadians(lat1)) * cos(degreesToRadians(lat2)) *
    sin(dLon / 2) * sin(dLon / 2)
    
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    
    let distance = 6371000.0 * c
    return distance
}

// (임시)
//extension TrackViewModel {
//    func trackDatas(for type: TrackListType) -> [TrackInfo] {
//        switch type {
//        case .recruitment:
//            return trackDatas
//        case .myRunning:
//            // 기존 트랙
//            let exTrackName = ["트랙이름 0", "트랙이름 1", "트랙이름 2"]
//            return trackDatas.filter { TrackInfo in
//                return !exTrackName.contains(TrackInfo.trackName)
//            }
//        }
//    }
//}
