//
//  AddPetViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation

class AddPetViewModel: ObservableObject{
    var petManager: PetDataManager = PetDataManager()
    
    func add(pet: PetModel){
        petManager.createPet(pet)
    }
}
