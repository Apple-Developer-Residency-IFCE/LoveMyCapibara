//
//  ButtonWeightPicker.swift
//  LoveMyCapibara
//
//  Created by José Winny on 12/06/23.
//

import SwiftUI

struct ButtonWeightPicker: View {
    @State var kg : Int
    @State var gram : Int
    @State var buttonState : Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Peso")
                Spacer()
                Button("\(kg) kg"){
                    buttonState.toggle()
                }.buttonStyle(.bordered)
            }
            if(buttonState){
                WeightPickerView(kg: $kg, gram: $gram)
            }
        }
        .padding(.horizontal,16)
        .font(Font.custom("Poppins-Regular", size: 16))
        .foregroundColor(Color("PrimaryText"))
    }
}

struct ButtonWeightPicker_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWeightPicker(kg: 0, gram: 0)
    }
}

