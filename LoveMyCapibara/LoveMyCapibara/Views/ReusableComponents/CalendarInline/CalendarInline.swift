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
