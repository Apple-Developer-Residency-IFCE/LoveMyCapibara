//
//  HomeViewModel.swift
//  LoveMyCapibara
//
//  Created by userext on 30/05/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var pets : [PetModel]
    
    static private func convertToPetModel(_ petEntity: Pet) -> PetModel {
            var petModel = PetModel()
            petModel.id = UUID()
            petModel.name = petEntity.name ?? ""
            petModel.gender = GenderModel(rawValue: petEntity.gender ?? "") ?? .none
            petModel.specie = petEntity.specie ?? ""
            petModel.race = petEntity.race ?? ""
            petModel.birthDate = petEntity.birthdate ?? Date.now
            petModel.weight = petEntity.weight
            petModel.castrated = petEntity.castrated

            return petModel
        } 

//    func deletePet(_ pet: PetModel){
//        let petToDelete = HomeViewModel.convertToPetModel(pet)
//        do{
//            coreDataManager.shared.viewContext.delete(pet)
//            try coreDataManager.shared.viewContext.save()
//        }catch{
//            print("Nao foi possivel deletar essa task \(error.localizedDescription)")
//        }
//    }
    
    func updateList(){
        let lista = coreDataManager.shared.getAllTasks()
        
        let resultList = lista.map { item in
            return HomeViewModel.convertToPetModel(item)
        }
        pets = resultList
    }
    
    init(){
        let lista = coreDataManager.shared.getAllTasks()
        
        let resultList = lista.map { item in
            return HomeViewModel.convertToPetModel(item)
        }
        self.pets = resultList
    }
}


