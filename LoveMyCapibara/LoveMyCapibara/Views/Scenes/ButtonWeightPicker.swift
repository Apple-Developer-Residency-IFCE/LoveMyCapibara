//
//  ButtonWeightPicker.swift
//  LoveMyCapibara
//
//  Created by José Winny on 12/06/23.
//

import SwiftUI

struct ButtonWeightPicker: View {
    @Binding var kg : Int
    @State var buttonState : Bool = false
    var body: some View {
        VStack {
            Button("\(kg) kg"){
                buttonState.toggle()
            }.buttonStyle(.bordered)
            if(buttonState){
                WeightPickerView()
            }
        }
    }
}

struct ButtonWeightPicker_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWeightPicker(kg: .constant(1))
    }
}

