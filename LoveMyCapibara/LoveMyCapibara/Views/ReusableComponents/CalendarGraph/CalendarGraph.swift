//
//  CalendarGraph.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 05/07/23.
//

import SwiftUI

struct CalendarView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = CalendarViewModel()
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    CalendarHeader(viewModel: viewModel)
                        .foregroundColor(Color("PrimaryColor"))
                        .font(FontManager.poppinsBold(size: 20))
                    
                    VStack(spacing: 3) {
                        HStack(spacing: 0) {
                            ForEach(viewModel.days, id: \.self) { day in
                                Text("\(day)")
                                    .frame(height: 36)
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: 13, weight: .bold))
                            }
                        }
                        .foregroundColor(Color("CalendarWeekColor"))
                        
                        VStack(spacing: 6) {
                            ForEach(viewModel.weeks, id: \.self) { week in
                                ZStack {
                                    HStack(spacing: 0) {
                                        ForEach(Array(week.enumerated()), id: \.offset) { index, day in
                                            CalendarDay(viewModel: viewModel, week: week, day: day, index: index)
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            }
        }
        .background(Color("CalendarBackground"))
    }
}

// MARK: - PREVIEW
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
