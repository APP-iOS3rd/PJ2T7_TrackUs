//
//  Task.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import Foundation

// Task Model and Sample Tasks
// Array of Tasks
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
    
//    @Binding var currentDate: Date
}

// sample Date for Testing
//func getSampleDate(offset: Int) -> Date{
//    let calendar = Calendar.current
//    
//    let date = calendar.date(byAdding: .day, value: offset, to: Date())
//    
//    return date ?? Date()
//}

// Sample Tasks
var tasks: [TaskMetaData] = [
    
//    TaskMetaData(task: [
//        
//        Task(title: "\(3.24)km \n\(15)분\(21)초 \n\(160)kcal"),
////    ], taskDate: getSampleDate(offset: -1)),
//    ], taskDate: getSampleDate(year: 2023, month: 12, day: 5)),
    
    TaskMetaData(task: [
        
        Task(title: "\(2.2)km"),
        Task(title: "\(13)분\(51)초"),
        Task(title: "\(110)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 2)),
    
    TaskMetaData(task: [
        
        Task(title: "\(2.4)km"),
        Task(title: "\(13)분\(43)초"),
        Task(title: "\(122)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 3)),
    
    TaskMetaData(task: [
        
        Task(title: "\(2.5)km"),
        Task(title: "\(13)분\(41)초"),
        Task(title: "\(128)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 4)),
    
    TaskMetaData(task: [
        
        Task(title: "\(2.9)km"),
        Task(title: "\(14)분\(09)초"),
        Task(title: "\(131)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 5)),
    
    TaskMetaData(task: [
        
        Task(title: "\(3.2)km"),
        Task(title: "\(15)분\(30)초"),
        Task(title: "\(155)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 6)),
    
    TaskMetaData(task: [
        
        Task(title: "\(3.6)km"),
        Task(title: "\(16)분\(02)초"),
        Task(title: "\(164)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 7)),
    
    TaskMetaData(task: [
        
        Task(title: "\(2.6)km"),
        Task(title: "\(15)분\(10)초"),
        Task(title: "\(130)kcal")
//    ], taskDate: getSampleDate(offset: 0)),
    ], taskDate: getSampleDate(year: 2023, month: 12, day: 8)),

]

func getSampleDate(year: Int, month: Int, day: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    
    let calendar = Calendar.current
    return calendar.date(from: dateComponents) ?? Date()
}

//var data: [SampleData] = [
//.init(minute: 15, second: 10, km: 2.6, kcal: 130, date: "12-08"),
//.init(minute: 16, second: 02, km: 3.6, kcal: 164, date: "12-07"),
//.init(minute: 15, second: 30, km: 3.2, kcal: 155, date: "12-06"),
//.init(minute: 14, second: 09, km: 2.9, kcal: 131, date: "12-05"),
//.init(minute: 13, second: 41, km: 2.5, kcal: 128, date: "12-04"),
//.init(minute: 13, second: 43, km: 2.4, kcal: 122, date: "12-03"),
//.init(minute: 13, second: 51, km: 2.2, kcal: 110, date: "12-02")
//]
