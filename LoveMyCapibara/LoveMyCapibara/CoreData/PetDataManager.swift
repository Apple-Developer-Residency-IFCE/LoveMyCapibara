//
//  PetDataManager.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation
import CoreData

protocol PetDataManagerProtocol {
    func getAllPets() -> [PetModel]?
    func getPetById(_ id: UUID) -> PetModel?
    func getCoreDataPet(_ id: UUID) -> Pet?
    func createPet(_ pet: PetModel)
    func updatePet(_ pet: PetModel)
    func deletePetById(_ id: UUID)
}

class PetDataManager: PetDataManagerProtocol {
    var context: NSManagedObjectContext
    static let shared = PetDataManager()
    
    private init() {
        self.context = CoreDataManager.shared.viewContext
    }
    
    func getAllPets() -> [PetModel]? {
        let request: NSFetchRequest<Pet> = Pet.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            return result.map { pet in
                    .init(petEntity: pet)
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getPetById(_ id: UUID) -> PetModel? {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let petEntity = result.first else {
                return nil
            }
            return .init(petEntity: petEntity)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getCoreDataPet(_ id: UUID) -> Pet? {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let petEntity = result.first else {
                return nil
            }
            return petEntity
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func createPet(_ pet: PetModel) {
        let newPet = Pet(context: context)
        newPet.image = pet.imageName
        newPet.name = pet.name
        newPet.gender = pet.gender.description
        newPet.specie = pet.specie
        newPet.race = pet.race
        newPet.birthdate = pet.birthDate
        newPet.weight = pet.weight
        newPet.castrated = pet.castrated
        newPet.id = UUID()
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updatePet(_ pet: PetModel) {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let petEntity = result.first
            
            if let petEntity = petEntity {
                petEntity.name = pet.name
                petEntity.gender = pet.gender.rawValue
                petEntity.specie = pet.specie
                petEntity.race = pet.race
                petEntity.birthdate = pet.birthDate
                petEntity.weight = pet.weight
                petEntity.castrated = pet.castrated
                petEntity.image = pet.imageName
                
                try context.save()
            }
        } catch {
            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
        }
    }
    
    func deletePetById(_ id: UUID) {
        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let playerEntity = result.first
                     
            if let playerEntity = playerEntity {
                deleteAssociatedTasks(.init(petEntity: playerEntity))
                context.delete(playerEntity)
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAssociatedTasks(_ pet: PetModel) {
        let dataManager = TaskDataManager.shared
        guard let result = dataManager.getAllPetTasks(pet) else { return }
        
        for task in result {
            guard let id = task.id else { return }
            _ = dataManager.deleteTaskById(id)
        }
    }
}
