//
//  PetDataManager.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 19/06/23.
//

import Foundation
import CoreData

class PetDataManager{
    var context: NSManagedObjectContext
    
    
    init() {
        self.context = coreDataManager.shared.viewContext
    }
    
    func createPet(_ pet: PetModel){
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
        
        do{
            try context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func deletePetById(_ id: UUID) {
            let fetchRequest: NSFetchRequest<Pet> = Pet.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
            do {
                let result = try context.fetch(fetchRequest)
                let playerEntity = result.first

                if let playerEntity = playerEntity {
                    // Remover o petEntity do contexto e salvar as mudanças
                    context.delete(playerEntity)
                    try context.save()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
}
