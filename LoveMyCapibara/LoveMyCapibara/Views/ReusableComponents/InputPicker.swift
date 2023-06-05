//
//  InputPicker.swift
//  LoveMyCapibara
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct InputPicker: View {
    var label: String
    @Binding var value: String
    var options: [String]
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(Color("PrimaryText"))
            
            Spacer()
            Picker(label, selection: $value) {
                ForEach(options, id: \.self){ option in
                    Text(option)
                }
            }
            .tint(Color("SecondaryText"))
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color("FieldBackgroundColor"))
        .font(FontManager.poppinsRegular(size: 16))
    }
}

struct InputPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InputPicker(label: "Gênero",value: .constant(""), options: ["Nenhum", "Macho", "Fêmea"])
            InputPicker(label: "Espécie",value: .constant(""), options: ["Não escolhida","Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Raça",value: .constant(""), options: ["Não escolhida", "Teste1", "Teste2", "Teste3"])
            InputPicker(label: "Castrado",value: .constant(""), options: ["Não", "Sim"])
        }
    }
}
