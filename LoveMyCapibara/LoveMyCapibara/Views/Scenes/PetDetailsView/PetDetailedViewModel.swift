//
//  PetDetailedViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation

class PetDetailedViewModel: ObservableObject{
    var petManager: PetDataManager = PetDataManager()

    func deleteById(_ id : UUID){
        petManager.deletePetById(id)
    }
}
