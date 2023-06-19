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
    
    // MARK: Funções
    func save(){
        do{
            try viewContext.save()
            
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
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
