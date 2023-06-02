//
//  HomeViewWithoutPets.swift
//  LoveMyCapibara
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct HomeViewWithoutPets: View {
    var body: some View {
        VStack {
            Image("Pet Card Placeholder")
                .padding()

            Text("Você não possui nenhum pet cadastrado :(")
                .font(FontManager.poppinsMedium(size: 18))
                .multilineTextAlignment(.center)
                .frame(width: 328)

            Spacer()
        }
        .foregroundColor(Color("SecondaryText"))
    }
}

struct HomeViewWithoutPets_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWithoutPets()
    }
}
