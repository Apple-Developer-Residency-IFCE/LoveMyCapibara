//
//  HomeViewWithoutPets.swift
//  LoveMyCapibara
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct HomeViewWithoutPets: View {
    @StateObject var homeViewModel: HomeViewModel
    var body: some View {
        NavigationView {
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
            .frame(width: UIScreen.main.bounds.width)
            .background(Color("BackgroundColor"))
            .navBarPet(destination: {
                AddPetView()
            }, action: {
                homeViewModel.updateList()
            })
        }
        .foregroundColor(Color("SecondaryText"))
    }
}
