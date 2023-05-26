//
//  PetCardView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct PetCardView: View {
    
    var petName: String
    var petSpecies: String
    var petImage: String
    
    var body: some View {
        HStack(){
            Image(petImage)
                .clipShape(Circle())
                .padding(.trailing,4)
            VStack(alignment: .leading){
                Text(petName)
                //.font(Font.custom("Poppins-Bold", size: 16))
                    .font(FontManager.poppinsBold(size: 16))
                Text(petSpecies)
                //.font(Font.custom("Poppins-Regular", size: 13))
                    .font(FontManager.poppinsRegular(size: 13))
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8,alignment: .leading)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1.4)
        )
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView(petName: "Bud", petSpecies: "Husky Siberiano", petImage: "PetTestImage")
    }
}
