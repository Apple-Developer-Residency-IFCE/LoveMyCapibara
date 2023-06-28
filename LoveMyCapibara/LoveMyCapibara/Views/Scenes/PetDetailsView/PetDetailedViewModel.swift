//
//  PetDetailedViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation

class PetDetailedViewModel: ObservableObject {
    var petManager: PetDataManager = PetDataManager()

    func getUpdatedPet(_ id: UUID) -> PetModel? {
        return petManager.getPetById(id)
    }
}
