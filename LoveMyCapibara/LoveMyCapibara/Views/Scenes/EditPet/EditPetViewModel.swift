//
//  EditPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 19/06/23.
//

import Foundation

class EditPetViewModel: ObservableObject{
    var petManager: PetDataManager = PetDataManager()

    func deleteById(_ id : UUID){
        petManager.deletePetById(id)
    }
    
    func edit(_ pet: PetModel){
        petManager.updatePet(pet)
    }
}
