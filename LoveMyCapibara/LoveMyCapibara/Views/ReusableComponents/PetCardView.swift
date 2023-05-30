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
        GeometryReader{ geometry in
            HStack(){
                Image(petImage)
                    .clipShape(Circle())
                    .padding(.trailing,4)
                VStack(alignment: .leading){
                    Text(petName)
                        .font(FontManager.poppinsBold(size: 16))
                        .foregroundColor(Color("PrimaryText"))
                    Text(petSpecies)
                        .font(FontManager.poppinsRegular(size: 13))
                        .foregroundColor(Color("PrimaryText"))
                }
            }
            .frame(width: geometry.size.width * 0.8,alignment: .leading)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("CardBorderColor"), lineWidth: 2)
            )
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("CardBackgroundColor"))
            )
        }
        
    }
}

struct PetCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView(petName: "Bud", petSpecies: "Husky Siberiano", petImage: "PetTestImage")
    }
}
