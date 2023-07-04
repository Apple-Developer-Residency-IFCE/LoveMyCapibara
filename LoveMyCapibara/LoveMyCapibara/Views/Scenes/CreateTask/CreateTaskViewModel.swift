//
//  CreateTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Ravi on 30/06/23.
//

import Foundation

final class CreateTaskViewModel: ObservableObject {
    
    let taskManager = TaskDataManager()
    let petManager = PetDataManager()
    
    @Published var pets: [PetModel] = []
    @Published var task: TaskModel = .init()
    @Published var txtTitle: String = ""
    @Published var text: String = ""
    @Published var petNameList: [String] = []
    @Published var selectedPet: String = ""
    
    func add() {
        taskManager.createTask(task)
    }
    
    func getPets() {
        petNameList = petManager.getAllPets().compactMap({ $0.name })
    }
    
    func createTaskForPet() {
        task.pet = petManager.getAllPets().filter({ $0.name == selectedPet }).first
    }
}
