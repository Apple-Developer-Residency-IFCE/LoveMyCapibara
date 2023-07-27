//
//  EditPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 19/06/23.
//

import Foundation

class EditPetViewModel: ObservableObject {
    var petManager: PetDataManagerProtocol
    var currentPet: PetModel
    
    init(petManager: PetDataManagerProtocol, currentPet: PetModel) {
        self.petManager = petManager
        self.currentPet = currentPet
    }

    @discardableResult
    func deleteById(_ id: UUID) -> Bool {
        return petManager.deletePetById(id)
    }
    
    @discardableResult
    func edit(_ pet: PetModel) -> Bool {
        return petManager.updatePet(pet)
    }
    
    func petIsValid(pet: PetModel) -> Bool {
        return !pet.name.isEmpty && !pet.specie.isEmpty && !pet.race.isEmpty && pet.weight != 0.0 && pet != currentPet
    }
}
