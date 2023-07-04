//
//  CreateTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Ravi on 30/06/23.
//

import Foundation

final class CreateTaskViewModel: ObservableObject {
    
    let taskManager = TaskDataManager()
    
    @Published var pets: [PetModel] = []
    @Published var task: TaskModel = .init()
    @Published var txtTitle: String = ""
    @Published var text: String = ""
    @Published var petNameList: [String] = ["Carneiro", "Gato jorge"]
    @Published var selectedPet: String = ""
    
    func add(task: TaskModel) {
        taskManager.createTask(task)
    }
}
