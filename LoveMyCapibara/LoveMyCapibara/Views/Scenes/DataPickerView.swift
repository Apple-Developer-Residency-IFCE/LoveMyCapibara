//
//  DataPickerView.swift
//  LoveMyCapibara
//
//  Created by José Winny on 06/06/23.
//

import SwiftUI

struct DataPickerView: View {
    @State var birthdayDate : Date = Date.now
    var body: some View {
        DatePicker("Nascimento",selection: $birthdayDate, in: ...Date.now, displayedComponents: .date)
            .padding([.horizontal],16)
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color("PrimaryText"))
    }
}

struct DataPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DataPickerView()
//            .preferredColorScheme(.dark)
    }
}
