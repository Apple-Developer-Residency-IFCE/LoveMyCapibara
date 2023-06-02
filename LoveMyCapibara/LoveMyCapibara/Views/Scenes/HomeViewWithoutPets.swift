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
            PlusSignCard()
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

struct PlusSignCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .frame(width: 328, height: 94)

            Image(systemName: "plus")
                .resizable()
                .frame(width: 43, height: 43)
        }
    }
}
struct HomeViewWithoutPets_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWithoutPets()
    }
}
