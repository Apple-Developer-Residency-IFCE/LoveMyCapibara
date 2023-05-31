//
//  HomeView.swift
//  LoveMyCapibara
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct HomeView: View {
    var pets: [PetModel]

    var body: some View {
        if pets.isEmpty {
            HomeViewWithoutPets()
        }
    }
}

let emptyPetList: [PetModel] = []
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pets: emptyPetList)
    }
}
