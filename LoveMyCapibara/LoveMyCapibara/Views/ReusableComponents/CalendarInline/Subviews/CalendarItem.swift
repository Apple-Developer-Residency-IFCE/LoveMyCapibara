//
//  CalendarItem.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 04/07/23.
//

import SwiftUI

struct CalendarItem: View {
    var dayLetter: String
    var dayNumber: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Text(dayLetter)
                .padding(.bottom, 8)
            Text(dayNumber)
        }
        .font(FontManager.interBold(size: 20))
        .frame(width: 39, height: 64)
        .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 4))
        .foregroundColor(isSelected ? Color("CalendarSelectedText") : Color("PrimaryText"))
        .background(isSelected ? Color("PrimaryColor") : Color("TransparentColor"))
        .cornerRadius(4)
        .id(dayNumber)
    }
}

struct CalendarItem_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CalendarItem(dayLetter: "Q", dayNumber: "14", isSelected: true)
            CalendarItem(dayLetter: "Q", dayNumber: "15", isSelected: false)
        }
    }
}
