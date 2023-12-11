//
//  SmallDatePicker.swift
//  TrackUs
//
//  Created by 박선구 on 12/8/23.
//

import SwiftUI

struct SmallDatePicker: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 35){
            
            
            let days: [String] = ["일", "월", "화", "수", "목", "금", "토"]
            
            HStack(spacing: 20){
                
                HStack(spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.caption.bold())
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days, id: \.self){ day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 5) {
                
                ForEach(extractDate()){value in
                    
                    CardView(value: value)
                }
            }
            
            Divider()
                .background(Color.orange)
        }
        .cornerRadius(10)
        .onChange(of: currentMonth) { newValue in
            
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View {
        
        VStack{
            
            if value.day != -1{
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                    
                        .foregroundStyle(isSameDay(date1: value.date, date2: currentDate) ? .orange : (isSameMonth(date1: value.date, date2: currentDate) && value.date > Date() ? Color.gray : .white))
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                        Circle()
                            .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .orange)
                            .frame(width: 10, height: 10)
                    
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundStyle(isSameDay(date1: value.date, date2: currentDate) ? .orange : (isSameMonth(date1: value.date, date2: currentDate) && value.date > Date() ? Color.gray : .white))
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 50, alignment: .top)
    }
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: currentDate)
    }
    
    // checking dates
    func isSameDay(date1: Date, date2: Date)-> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // extrating Year And Month for display...
    func extraDate()-> [String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() ->[DateValue]{
        
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap{ date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func isSameMonth(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month], from: date1)
        let components2 = calendar.dateComponents([.year, .month], from: date2)
        return components1 == components2
    }

}

#Preview {
//    SmallDatePicker()
//    CalendarHomeView()
    MyPageView()
}
