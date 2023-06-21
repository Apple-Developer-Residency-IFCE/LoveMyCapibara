//
//  ButtonWeightPicker.swift
//  LoveMyCapibara
//
//  Created by José Winny on 12/06/23.
//

import SwiftUI

struct ButtonWeightPicker: View {

    @Binding var weight: Double
    @State var kg: Int = 0
    @State var gram: Int = 0

    init(weight: Binding<Double>) {
            _weight = weight
            _kg = State(initialValue: weight.wrappedValue.separate()?.kg ?? 0)
            _gram = State(initialValue: weight.wrappedValue.separate()?.gram ?? 0)
    }
    
    @State var buttonIsActive : Bool = false
    var body: some View {
        VStack {
                HStack {
                    Text("Peso")
                    Spacer()
                    Button("\(kg).\(gram)kg"){
                            withAnimation {
                                buttonIsActive.toggle()
                            }
                        weight = Double(kg) + Double(gram)/10.0
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
    @State static private var pesoFake = 10.0
    
    static var previews: some View {
        ButtonWeightPicker(weight: $pesoFake)
    }
}

extension Double {
    func separate() -> (kg: Int,gram: Int)? {
        let (integerPart, fractionalPart) = modf(self)
        guard let integer = Int(exactly: integerPart),
              let fractional = Int(exactly: fractionalPart * 10) else {
            return nil
        }
        return (kg: integer,gram: fractional)
    }
}
