//
//  AddPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation

class AddPetViewModel: ObservableObject {
    var petManager: PetDataManagerProtocol
    
    init(petManager: PetDataManagerProtocol) {
        self.petManager = petManager
    }
    
    @discardableResult
    func add(pet: PetModel) -> Bool {
        return petManager.createPet(pet)
    }
    
    func petIsValid(pet: PetModel) -> Bool {
        return !pet.name.isEmpty && !pet.specie.isEmpty && !pet.race.isEmpty && pet.weight != 0.0
    }
}
