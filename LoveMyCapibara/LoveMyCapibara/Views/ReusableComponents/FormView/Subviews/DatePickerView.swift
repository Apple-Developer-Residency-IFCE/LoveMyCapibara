//
//  DataPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI
struct DatePickerView: View {
    @Binding var birthdayDate: Date
    var body: some View {
        DatePicker("Nascimento", selection: $birthdayDate, in: ...Date.now, displayedComponents: .date)
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color("PrimaryText"))
    }
}

struct DataPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(birthdayDate: .constant(Date.now))
    }
}
