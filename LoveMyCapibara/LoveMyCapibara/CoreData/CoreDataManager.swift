//
//  CoreDataManager.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 16/06/23.
//

import Foundation
import CoreData

class coreDataManager{
    //Inicialização do container do coreData
    let persistentContainer: NSPersistentContainer
    
    //Inicialização do singleton que vai coordenar a classe
    static let shared = coreDataManager()
    
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    //Funções do manager
    func save(){
        do{
            try viewContext.save()
            
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func getAllTasks() -> [Pet]{
        let request: NSFetchRequest<Pet> = Pet.fetchRequest()
        
        do{
            return try viewContext.fetch(request)
        } catch{
            return []
        }
    }
    
    //Private init para ninguem ter acesso ao init e ser obrigado a utilizar o singleton para acessar a classe
    private init() {
        persistentContainer = NSPersistentContainer(name: "PetCoreData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
               print("Falha na inicialização do core data \(error)")
            }
        }
    }
}
