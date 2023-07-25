//
//  HomeViewModel.swift
//  LoveMyCapibara
//
//  Created by userext on 30/05/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var pets: [PetModel] = []
    let petManager = PetDataManager.shared
    
    func updateList() {
        self.pets = petManager.getAllPets() ?? []
    }
}
