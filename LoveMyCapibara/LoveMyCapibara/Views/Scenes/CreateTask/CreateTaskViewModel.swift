//
//  CreateTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Ravi on 30/06/23.
//

import Foundation

final class CreateTaskViewModel: ObservableObject {
    
    let taskManager: TaskDataManagerProtocol
    let petManager: PetDataManagerProtocol
    
    init(taskManager: TaskDataManagerProtocol, petManager: PetDataManagerProtocol) {
        self.taskManager = taskManager
        self.petManager = petManager
    }
    
    @Published var task: TaskModel = .init()
    @Published var selectedPet: String = ""
    
    // Task Form
    @Published var txtTitle: String = ""
    @Published var text: String = ""
    @Published var petNameList: [String] = []
    @Published var type: TaskTypeModel = .empty
    @Published var frequency: FrequencyModel = .never
    @Published var date: Date = .now
    @Published var rememberAt: RememberAtModel = .empty
    
    private func add() -> Bool {
        return taskManager.createTask(task)
    }
    
    private func configPetsList() {
        petNameList.insert("Nenhum", at: 0)
    }
    
    func getPetsList() -> Bool {
        guard let pets = petManager.getAllPets() else {
            return false
        }
        petNameList = pets.compactMap({ $0.name })
        configPetsList()
        return true
    }
    
    func createTaskForPet() -> Bool {
        task.pet = petManager.getAllPets()?.filter({ $0.name == selectedPet }).first
        task.completed = [String: Bool]()
        task.title = txtTitle
        task.text = text
        task.id = UUID()
        task.date = date
        task.type = .empty
        task.rememberAt = rememberAt
        task.frequency = frequency
        return add()
    }
    
    func taskIsValid() -> Bool {
        return !txtTitle.isEmpty && !selectedPet.isEmpty && selectedPet != "Nenhum" && type != .empty
    }
}
