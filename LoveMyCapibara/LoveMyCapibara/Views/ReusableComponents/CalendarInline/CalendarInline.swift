//
//  CalendarInline.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 30/06/23.
//

import SwiftUI

let rows = [GridItem()]

struct CalendarInline: View {
    @StateObject var viewModel = CalendarInlineViewModel()
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { scrollView in
                LazyHGrid(rows: rows) {
                    ForEach(viewModel.getMonth(currentDate: selectedDate), id: \.self) { day in
                        CalendarItem(
                            dayLetter: viewModel.getInitialOfDay(date: day),
                            dayNumber: viewModel.getNumberOfDay(date: day),
                            isSelected: viewModel.isSameDay(selectedDate, day))
                        .onTapGesture {
                            selectedDate = day
                        }
                    }
                }
                .onAppear {
                    scrollView.scrollTo(viewModel.getWeekInitialDay(currentDate: selectedDate), anchor: .leading)
                }
            }
        }
    }
}

class CalendarInlineViewModel: ObservableObject {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    func getInitialOfDay(date: Date) -> String {
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "E"
        var initial = dateFormatter.string(from: date)
        initial = String(initial.prefix(1))
        return initial.capitalized
    }
    
    func getNumberOfDay(date: Date) -> String {
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    func getWeekInitialDay(currentDate: Date) -> String {
        if let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)) {
            
            return getNumberOfDay(date: startOfWeek)
        }
        
        return getNumberOfDay(date: .now)
    }
    
    func getMonth(currentDate: Date) -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: currentDate)
        
        if let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) {
            var dates: [Date] = []
            if let daysInMonth = range?.count {
                for index in 0..<daysInMonth {
                    if let date = calendar.date(byAdding: .day, value: index, to: startOfMonth) {
                        dates.append(date)
                    }
                }
            }
            
            return dates
        }
        
        return []
    }
}

struct CalendarInline_Previews: PreviewProvider {
    static let dateFormatter = DateFormatter()
    static func generateDate(date: String) -> Date {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: date) ?? .now
    }
    @State static var date = generateDate(date: "2023-07-26")
    
    static var previews: some View {
        CalendarInline(selectedDate: .constant(.now))
    }
}
