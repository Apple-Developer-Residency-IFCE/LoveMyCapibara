//
//  DataPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI
struct DatePickerView: View {
    
    @Binding var selectedDate: Date
    var title: String?
    
    var body: some View {
        DatePicker(title ?? "Nascimento", selection: $selectedDate, in: ...Date.now, displayedComponents: .date)
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color("PrimaryText"))
    }
}
