//
//  DataPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI
struct DatePickerView: View {
    
    @Binding var selectedDate: Date
    @State var toDate: Date = .now
    @State var component: DatePickerComponents = .date
    var title: String?
    
    var body: some View {
        DatePicker(title ?? "Nascimento", selection: $selectedDate, in: ...toDate, displayedComponents: component)
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color("PrimaryText"))
    }
}
