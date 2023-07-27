//
//  HomeViewModel.swift
//  LoveMyCapibara
//
//  Created by userext on 30/05/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var pets: [PetModel] = []
    let petManager: PetDataManagerProtocol
    
    init(petManager: PetDataManagerProtocol) {
        self.petManager = petManager
    }
    
    @discardableResult
    func updateList() -> Bool {
        guard let fetchedList = petManager.getAllPets() else {
            return false
        }
        self.pets = fetchedList
     
        return true
    }
}
