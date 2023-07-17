//
//  EditPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 19/06/23.
//

import Foundation

class EditPetViewModel: ObservableObject {
    var petManager: PetDataManager = PetDataManager()
    var currentPet: PetModel
    
    init(currentPet: PetModel) {
        self.currentPet = currentPet
    }

    func deleteById(_ id: UUID) {
        petManager.deletePetById(id)
    }
    
    func edit(_ pet: PetModel) {
        petManager.updatePet(pet)
    }
    
    func petIsValid(pet: PetModel) -> Bool {
        return !pet.name.isEmpty && !pet.specie.isEmpty && !pet.race.isEmpty && pet.weight != 0.0 && pet != currentPet
    }
}
