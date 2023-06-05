//
//  AdicionalInfo.swift
//  LoveMyCapibara
//
//  Created by userext on 05/06/23.
//

import SwiftUI

struct AdicionalInfo: View {
    
    var pet : PetModel
    var isCastreded: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Divider()
                .frame(width: 346, height: 2)
                .overlay(Color("SecondaryText"))
            Text("Adicionais")
                .font(FontManager.poppinsBold(size: 20))
                .foregroundColor(Color("PrimaryText"))
            HStack{
                Text("Castrado(a)?")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
                Spacer()
                Text("\(isCastreded)")
                    .font(FontManager.poppinsBold(size: 16))
                    .foregroundColor(Color("PrimaryText"))
            }
        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}

struct AdicionalInfo_Previews: PreviewProvider {
    static var previews: some View {
        AdicionalInfo(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: .dog, birthDate: Date(), weigth: 12.0, castraded: true), isCastreded: "Sim")
    }
}
