//
//  PetAttributes.swift
//  LoveMyCapibara
//
//  Created by userext on 05/06/23.
//

import SwiftUI

struct PetAttributes: View {
    var pet : PetModel
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: pet.birthDate)
    }
    
    var formattedWeight: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: pet.weigth)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16){
            Image("Icon Macho _ Default")
            Text("\(pet.name)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(pet.specie.rawValue)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(formattedDate)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(pet.race)")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
            Text("\(formattedWeight) Kg")
                .font(FontManager.poppinsBold(size: 16))
                .foregroundColor(Color("PrimaryText"))
        }.padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 24))
    }
}

struct PetAttributes_Previews: PreviewProvider {
    static var previews: some View {
        PetAttributes(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: .dog, birthDate: Date(), weigth: 12.0, castraded: true))
    }
}
