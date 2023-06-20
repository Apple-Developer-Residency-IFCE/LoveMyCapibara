//
//  ButtonWeightPicker.swift
//  LoveMyCapibara
//
//  Created by José Winny on 12/06/23.
//

import SwiftUI

struct ButtonWeightPicker: View {
    @State var kg : Int = 0
    @State var gram : Int = 0
    var weight: Double {
        Double(kg) + Double(gram)/10
    }
    @State var buttonIsActive : Bool = false
    var body: some View {
        VStack {
                HStack {
                    Text("Peso")
                    Spacer()
                        Button("\(kg) \(gram % 10) kg"){
                            withAnimation {
                                buttonIsActive.toggle()
                            }
                        }.buttonStyle(.bordered)
                }
            if(buttonIsActive){
                WeightPickerView(kg: $kg, gram: $gram)
                    .transition(.scale)
            }
        }
        .font(FontManager.poppinsRegular(size: 16))
        .foregroundColor(Color("PrimaryText"))
    }
}

struct ButtonWeightPicker_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWeightPicker()
    }
}

extension Double {
    func separate() -> (Int, Int)? {
        let (integerPart, fractionalPart) = modf(self)
        guard let integer = Int(exactly: integerPart),
              let fractional = Int(exactly: fractionalPart * 10) else {
            return nil
        }
        return (integer, fractional)
    }
}
