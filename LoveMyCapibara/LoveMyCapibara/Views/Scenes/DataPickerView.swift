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
        DatePicker("Nascimento",selection: $birthdayDate, displayedComponents: .date)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color("SelectionFieldBackground"))
            }
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color("PrimaryText"))
    }
}

struct DataPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DataPickerView()
            .preferredColorScheme(.dark)
    }
}
