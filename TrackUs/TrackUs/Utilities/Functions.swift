//
//  Functions.swift
//  TrackUs
//
//  Created by 박선구 on 12/13/23.
//

import Foundation

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
