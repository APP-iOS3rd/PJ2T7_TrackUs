//
//  Functions.swift
//  TrackUs
//
//  Created by 박선구 on 12/13/23.
//

import Foundation
import MapKit
struct Functions {
    
    func formatTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: time)
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd"
        return formatter.string(from: date)
    }
}

// 위도, 경도를 입력받아 한글 주소로 변환
func convertCLLocationToAddress(location: CLLocation, completion: @escaping (String) -> Void) {
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { placemarks, error in
        if error != nil {
            return
        }
        
        guard let placemark = placemarks?.first else { return }
        completion("\(placemark.locality!) \(placemark.name!)")
    }
}
