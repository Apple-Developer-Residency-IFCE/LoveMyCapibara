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
    
    @Published var hour: Int = 0
    @Published var min: Int = 0
    @Published var amPm: String = "am"
    
    private func add() {
        taskManager.createTask(task)
    }
    
    func getPets() {
        petNameList = petManager.getAllPets().compactMap({ $0.name })
        petNameList.insert("Nenhum", at: 0)
    }
    
    func createTaskForPet() {
        task.pet = petManager.getAllPets().filter({ $0.name == selectedPet }).first
        task.completed = [String: Bool]()
        task.title = txtTitle
        task.text = text
        task.id = UUID()
        task.date = date
        task.type = type
        task.rememberAt = rememberAt
        task.frequency = frequency
        add()
    }
    
    func taskIsValid(task: TaskModel) -> Bool {
        return !txtTitle.isEmpty && !selectedPet.isEmpty && selectedPet != "Nenhum" && type != .empty
    }
}
