//
//  TaskDataManager.swift
//  LoveMyCapibara
//
//  Created by Ravi on 29/06/23.
//

import Foundation
import CoreData

class TaskDataManager {
    var context: NSManagedObjectContext

    init() {
        self.context = CoreDataManager.shared.viewContext
    }
    
    func getAllTasks() -> [TaskModel] {
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//
//        do {
//            let result = try context.fetch(request)
//            return result.map { task in
//                    .init(taskCoreData: task, pet: .init(petEntity: task.pet))
//            }
//        } catch {
            return []
//        }
    }

    func getTaskById(_ id: UUID) -> TaskModel? {
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
//
//        do {
//            let result = try context.fetch(fetchRequest)
//            guard let taskEntity = result.first else {
//                return nil
//            }
//            return .init(taskCoreData: tas, pet: <#T##PetModel?#>)
//        } catch {
//            print(error.localizedDescription)
            return nil
//        }
    }

    func createTask(_ pet: TaskModel) {
//        let newPet = Pet(context: context)
//        newPet.image = pet.imageName
//        newPet.name = pet.name
//        newPet.gender = pet.gender.description
//        newPet.specie = pet.specie
//        newPet.race = pet.race
//        newPet.birthdate = pet.birthDate
//        newPet.weight = pet.weight
//        newPet.castrated = pet.castrated
//        newPet.id = UUID()
//
//        do {
//            try context.save()
//        } catch {
//            print(error.localizedDescription)
//        }
    }

    func updateTask(_ pet: TaskModel) {
//        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", pet.id as CVarArg)
//
//        do {
//            let result = try context.fetch(fetchRequest)
//            let petEntity = result.first
//
//            if let petEntity = petEntity {
//                petEntity.name = pet.name
//                petEntity.gender = pet.gender.rawValue
//                petEntity.specie = pet.specie
//                petEntity.race = pet.race
//                petEntity.birthdate = pet.birthDate
//                petEntity.weight = pet.weight
//                petEntity.castrated = pet.castrated
//                petEntity.image = pet.imageName
//
//                try context.save()
//            }
//        } catch {
//            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
//        }
    }

    func deleteTaskById(_ id: UUID) {
//        let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
//
//        do {
//            let result = try context.fetch(fetchRequest)
//            let playerEntity = result.first
//
//            if let playerEntity = playerEntity {
//                // Remover o petEntity do contexto e salvar as mudanças
//                context.delete(playerEntity)
//                try context.save()
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}
