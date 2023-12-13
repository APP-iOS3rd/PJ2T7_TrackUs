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
    @Published var currnetTrackData: TrackInfo = TrackInfo(trackName: "", trackBio: "", startDate: Date(), estimatedDistance: 0.0, limitedMember: 1, participations: [], timeTaken: 0, author: UUID(), caloriesConsumed: 0, trackPaths: NMFArrowheadPath())
    
    @Published var trackDatas: [TrackInfo] = [
        TrackInfo(trackName: "트랙네임1", trackBio: "소개글1", startDate: Date(), estimatedDistance: 1222, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1200, author: UUID(), caloriesConsumed:1500, trackPaths: NMFArrowheadPath()),
        TrackInfo(trackName: "트랙네임2", trackBio: "소개글3", startDate: Date(), estimatedDistance: 1400, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1400, author: UUID(), caloriesConsumed:1300, trackPaths: NMFArrowheadPath()),
        TrackInfo(trackName: "트랙네임3", trackBio: "소개글3", startDate: Date(), estimatedDistance: 552, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 600, author: UUID(), caloriesConsumed:500, trackPaths: NMFArrowheadPath()),
        TrackInfo(trackName: "트랙네임4", trackBio: "소개글4", startDate: Date(), estimatedDistance: 2333, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1700, author: UUID(), caloriesConsumed:1000,trackPaths: NMFArrowheadPath()),
        TrackInfo(trackName: "트랙네임5", trackBio: "소개글5", startDate: Date(), estimatedDistance: 2300, limitedMember: 6, participations: [UUID(), UUID()], timeTaken: 1100, author: UUID(), caloriesConsumed:1200,trackPaths: NMFArrowheadPath()),
    ]
    
    let R = 6371000.0
    
    /**
    트랙정보를 리스트에 추가합니다
     */
    func addTrackData(trackData: TrackInfo) {
        self.trackDatas.append(trackData)
        self.currnetTrackData = TrackInfo(trackName: "", trackBio: "", startDate: Date(), estimatedDistance: 0.0, limitedMember: 1, participations: [], timeTaken: 0, author: UUID(), caloriesConsumed: 0, trackPaths: NMFArrowheadPath())
        print(self.trackDatas)
    }
    /**
     현재 설정된 트랙경로의 정보 비웁니다
     */
    func resetTrackPathData() {
       print("RESET PATHS")
        print(self.currnetTrackData.trackPaths.points.count)
        self.currnetTrackData.trackPaths.points.removeAll()
        self.currnetTrackData.trackPaths.mapView = nil
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
            self.currnetTrackData.trackPaths.points.removeAll()
            self.currnetTrackData.trackPaths.mapView = nil
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
    
    return Int(timeInSeconds) / 60
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



