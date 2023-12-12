//
//  Task.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

//import Foundation
//
//// Task Model and Sample Tasks
//// Array of Tasks
//struct Task: Identifiable{
//    var id = UUID().uuidString
//    var title: String
//    var time: Date = Date()
//}
//
//// Total Task Meta View
//struct TaskMetaData: Identifiable{
//    
//    var id = UUID().uuidString
//    var task: [Task]
//    var taskDate: Date
//    
//    @StateObject var trackViewModel = TrackViewModel.shared
//
//}
//
//
//// Sample Tasks
//var tasks: [TaskMetaData] = [
//    
//    
//    
//    TaskMetaData(task: [
//        
//        Task(title: "\(2.2)km"),
//        Task(title: "\(13)분\(51)초"),
//        Task(title: "\(110)kcal")
//    ], taskDate: getSampleDate(year: 2023, month: 12, day: 2)),
//    
////    TaskMetaData(task: [
////        
////        Task(title: "\(2.4)km"),
////        Task(title: "\(13)분\(43)초"),
////        Task(title: "\(122)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 3)),
////    
////    TaskMetaData(task: [
////        
////        Task(title: "\(2.5)km"),
////        Task(title: "\(13)분\(41)초"),
////        Task(title: "\(128)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 4)),
////    
////    TaskMetaData(task: [
////        
////        Task(title: "\(2.9)km"),
////        Task(title: "\(14)분\(09)초"),
////        Task(title: "\(131)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 5)),
////    
////    TaskMetaData(task: [
////        
////        Task(title: "\(3.2)km"),
////        Task(title: "\(15)분\(30)초"),
////        Task(title: "\(155)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 6)),
////    
////    TaskMetaData(task: [
////        
////        Task(title: "\(3.6)km"),
////        Task(title: "\(16)분\(02)초"),
////        Task(title: "\(164)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 7)),
////    
////    TaskMetaData(task: [
////        
////        Task(title: "\(2.6)km"),
////        Task(title: "\(15)분\(10)초"),
////        Task(title: "\(130)kcal")
////    ], taskDate: getSampleDate(year: 2023, month: 12, day: 8)),
//
//]
//
//func getSampleDate(year: Int, month: Int, day: Int) -> Date {
//    var dateComponents = DateComponents()
//    dateComponents.year = year
//    dateComponents.month = month
//    dateComponents.day = day
//    
//    let calendar = Calendar.current
//    return calendar.date(from: dateComponents) ?? Date()
//}
