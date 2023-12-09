//
//  DataValue.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import Foundation

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
