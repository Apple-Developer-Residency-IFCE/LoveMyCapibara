//
//  PetDataManagerMock.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 24/07/23.
//

import Foundation
@testable import LoveMyCapibara

class PetDataManagerMock: PetDataManagerProtocol {
    func deleteAssociatedTasks(_ pet: PetModel) -> Bool {
        return true
    }

    func createPet(_ pet: PetModel) -> Bool {
        return true
    }

    func updatePet(_ pet: PetModel) -> Bool {
        return true
    }

    func deletePetById(_ id: UUID) -> Bool {
        return true
    }

    func getAllPets() -> [PetModel]? {
        return []
    }

    func getPetById(_ id: UUID) -> PetModel? {
        return PetModel()
    }

    func getCoreDataPet(_ id: UUID) -> Pet? {
        return Pet()
    }
}

class PetDataManagerUnsucessfulMock: PetDataManagerProtocol {
    func deleteAssociatedTasks(_ pet: PetModel) -> Bool {
        return false
    }

    func createPet(_ pet: PetModel) -> Bool {
        return false
    }

    func updatePet(_ pet: PetModel) -> Bool {
        return false
    }

    func deletePetById(_ id: UUID) -> Bool {
        return false
    }

    func getAllPets() -> [PetModel]? {
        return nil
    }

    func getPetById(_ id: UUID) -> PetModel? {
        return nil
    }

    func getCoreDataPet(_ id: UUID) -> Pet? {
        return nil
    }
}
