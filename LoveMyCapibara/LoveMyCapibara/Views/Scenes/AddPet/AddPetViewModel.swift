//
//  AddPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation

class AddPetViewModel: ObservableObject {
    var petManager: PetDataManager = PetDataManager()
    
    func add(pet: PetModel) {
        petManager.createPet(pet)
    }
    
    func petIsValid(pet: PetModel) -> Bool {
        return !pet.name.isEmpty && !pet.specie.isEmpty && !pet.race.isEmpty && pet.weight != 0.0
    }
}
