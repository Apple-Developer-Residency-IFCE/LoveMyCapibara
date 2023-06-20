//
//  LabelsOfPet.swift
//  LoveMyCapibara
//
//  Created by userext on 05/06/23.
//

import SwiftUI

struct LabelsOfPet: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            Text("Informações")
                .font(FontManager.poppinsBold(size: 20))
                .foregroundColor(Color("PrimaryText"))
                .padding(.bottom, 4)
            Group{
                Text("Nome")
                Text("Espécie")
                Text("Nascimento")
                Text("Raça")
                Text("Peso")
            }
            .font(FontManager.poppinsBold(size: 16))
            .foregroundColor(Color("PrimaryText"))
        }.padding(EdgeInsets(top: 32, leading: 24, bottom: 0, trailing: 0))
    }
}

struct LabelsOfPet_Previews: PreviewProvider {
    static var previews: some View {
        LabelsOfPet()
    }
}
