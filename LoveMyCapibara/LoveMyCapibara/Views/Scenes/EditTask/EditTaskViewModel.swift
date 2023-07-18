//
//  EditTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 17/07/23.
//

import Foundation

class EditTaskViewModel: ObservableObject {
    var taskManager = TaskDataManager()
    var petManager = PetDataManager()
    @Published var currentTask: TaskModel
    
    init(currentTask: TaskModel) {
        self.currentTask = currentTask
        self.selectedPet = currentTask.pet?.name ?? ""
        self.txtTitle = currentTask.title ?? ""
        self.text = currentTask.text ?? ""
        self.petNameList = getPets()
        self.type = currentTask.type ?? .empty
        self.frequency = currentTask.frequency ?? .never
        self.date = currentTask.date
        self.rememberAt = currentTask.rememberAt ?? .empty
    }
    
    @Published var selectedPet: String = ""
    @Published var txtTitle: String = ""
    @Published var text: String = ""
    @Published var petNameList: [String] = []
    @Published var type: TaskTypeModel = .empty
    @Published var frequency: FrequencyModel = .never
    @Published var date: Date = .now
    @Published var rememberAt: RememberAtModel = .empty
    
    func deleteById(_ id: UUID) {
        taskManager.deleteTaskById(id)
    }

    func editTask(_ task: TaskModel) {
        taskManager.updateTask(task)
    }
    
    func getPets() -> [String] {
        let result = petManager.getAllPets().compactMap({ $0.name })
        return result
    }
    
    func updateSelectedTask() -> TaskModel {
        currentTask.id = currentTask.id
        currentTask.title = txtTitle
        currentTask.type = type
        currentTask.pet = petManager.getAllPets().filter({ $0.name == selectedPet}).first
        currentTask.date = date
        currentTask.frequency = frequency
        currentTask.text = text
        currentTask.completed = currentTask.completed
        currentTask.rememberAt = rememberAt
        
        return currentTask
    }
    
    func taskIsValid(_ task: TaskModel) -> Bool {
        return !(task.title?.isEmpty ?? false)
    }
}
