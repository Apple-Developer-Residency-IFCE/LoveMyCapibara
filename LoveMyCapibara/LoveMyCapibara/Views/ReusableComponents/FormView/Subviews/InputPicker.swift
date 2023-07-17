//
//  InputPicker.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct InputPicker<T>: View where T: Hashable {
    var label: String
    @Binding var value: T
    var options: [T]
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(Color("PrimaryText"))
            
            Spacer()
            Picker(label, selection: $value) {
                ForEach(options, id: \.self) { option in
                    buildOption(option)
                }
            }
            .labelsHidden()
            .tint(Color("SecondaryText"))
        }
    }
    
    @ViewBuilder
    func buildOption(_ option: T) -> some View {

        if let boolValue = option as? Bool {
            if boolValue {
                Text("Sim").tag(true)
            } else {
                Text("Não").tag(false)
            }
        } else if let rawValue = (option as? (any RawRepresentable))?.rawValue as? String {
            Text(String(describing: rawValue))
        } else if let pet = option as? PetModel {
            Text(pet.name) 
        } else {
            Text(String(describing: option))
        }
    }
}

struct InputPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InputPicker(label: "Gênero", value: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            InputPicker(label: "Espécie", value: .constant(""), options: ["Não escolhida", "Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Raça", value: .constant(""), options: ["Não escolhida", "Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Castrado", value: .constant(2023), options: Array(Range(1900...2100)))
            
        }
    }
}
