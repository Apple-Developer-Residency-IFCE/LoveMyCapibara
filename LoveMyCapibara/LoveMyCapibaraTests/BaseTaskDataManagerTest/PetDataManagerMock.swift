//
//  PetDataManagerMock.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 24/07/23.
//

import Foundation
@testable import LoveMyCapibara

class PetDataManagerMock: PetDataManagerProtocol {
    func getAllPets() -> [LoveMyCapibara.PetModel]? {
        return []
    }

    func getPetById(_ id: UUID) -> LoveMyCapibara.PetModel? {
        return nil
    }

    func getCoreDataPet(_ id: UUID) -> LoveMyCapibara.Pet? {
        return nil
    }
    func createPet(_ pet: LoveMyCapibara.PetModel) {
    }
    func updatePet(_ pet: LoveMyCapibara.PetModel) {
    }
    func deletePetById(_ id: UUID) {

    }
}
