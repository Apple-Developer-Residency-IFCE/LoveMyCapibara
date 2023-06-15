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
        return numberFormatter.string(from: NSNumber(value: pet.weight)) ?? ""
    }
    
    var genderImage: String{
        if pet.gender == .male{
            return "Icon Macho _ Default"
        }else if pet.gender == .female{
            return "Icon Fêmea _ Default"
        }else{
            return "Icon Nenhum _ Default"
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16){
            Image(genderImage)
            Group {
                Text("\(pet.name)")
                
                Text("\(pet.specie)")
                
                Text("\(formattedDate)")
                
                Text("\(pet.race)")
                
                Text("\(formattedWeight) Kg")
            }
            .font(FontManager.poppinsRegular(size: 16))
            .foregroundColor(Color("PrimaryText"))
        }.padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 24))
    }
}

struct PetAttributes_Previews: PreviewProvider {
    static var previews: some View {
        PetAttributes(pet: PetModel(imageName: "PetTestImage", id: 1, name: "Diego", gender: .female, specie: "Cachorro", birthDate: Date(), weight: 12.3, castrated: true))
    }
}
