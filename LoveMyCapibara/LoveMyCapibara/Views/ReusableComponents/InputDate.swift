//
//  InputDate.swift
//  LoveMyCapibara
//
//  Created by userext on 02/06/23.
//

import SwiftUI

struct InputDate: View {
    var label: String
    @Binding var value: Date
    
    var body: some View {
        DatePicker(label, selection: $value, displayedComponents: .date)
            .datePickerStyle(CustomDatePickerStyle())
    }
}

struct CustomDatePickerStyle: DatePickerStyle {
    @State private var currentDate = Date()
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            Button {
                currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            } label: {
                Text(currentDate.formatted(date: .abbreviated, time: .shortened))
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .font(FontManager.poppinsRegular(size: 16))
        .background(Color("FieldBackgroundColor"))
    }
}

struct InputDate_Previews: PreviewProvider {
    static var previews: some View {
        InputDate(label: "Nascimento", value: .constant(Date.now))
    }
}
