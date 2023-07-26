//
//  EditTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Gustavo Holzmann on 17/07/23.
//

import Foundation

class EditTaskViewModel: ObservableObject {
    var taskManager: TaskDataManagerProtocol
    var petManager: PetDataManagerProtocol
    @Published var currentTask: TaskModel
    
    init(currentTask: TaskModel, taskManager: TaskDataManagerProtocol, petManager: PetDataManagerProtocol) {
        self.taskManager = taskManager
        self.petManager = petManager
        self.currentTask = currentTask
        self.selectedPet = currentTask.pet?.name ?? ""
        self.txtTitle = currentTask.title ?? ""
        self.text = currentTask.text ?? ""
        self.petNameList = getPets() ?? []
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
    
    @discardableResult
    func deleteById(_ id: UUID) -> Bool {
        return taskManager.deleteTaskById(id)
    }

    @discardableResult
    func editTask(_ task: TaskModel) -> Bool {
        return taskManager.updateTask(task)
    }
    
    func getPets() -> [String]? {
        guard let result = petManager.getAllPets()?.compactMap({ $0.name }) else { return nil }
        return result
    }
    
    func updateSelectedTask() -> TaskModel {
        currentTask.id = currentTask.id
        currentTask.title = txtTitle
        currentTask.type = type
        currentTask.pet = petManager.getAllPets()?.filter({ $0.name == selectedPet}).first
        currentTask.date = date
        currentTask.frequency = frequency
        currentTask.text = text
        currentTask.completed = currentTask.completed
        currentTask.rememberAt = rememberAt
        
        return currentTask
    }
    
    func taskIsValid(task: TaskModel) -> Bool {
        return !txtTitle.isEmpty && !selectedPet.isEmpty && selectedPet != "Nenhum" && type != .empty
    }
}
