//
//  TaskModel.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import Foundation

struct TaskModel {
    
    var id: UUID?
    var title: String?
    var type: TaskTypeModel?
    var petId: UUID?
    var date: Date?
    var frequency: FrequencyModel?
    var text: String?
    var completed: Bool?
    
    init(id: UUID? = nil, title: String? = nil, type: TaskTypeModel? = nil, pet: UUID? = nil, date: Date? = nil, frequency: FrequencyModel? = nil, text: String? = nil, completed: Bool? = false) {
        self.id = id
        self.title = title
        self.type = type
        self.petId = pet
        self.date = date
        self.frequency = frequency
        self.text = text
        self.completed = completed
    }
    
    init(taskCoreData: Task) {
        self.id = taskCoreData.id
        self.title = taskCoreData.title
        self.type = TaskTypeModel(rawValue: taskCoreData.type ?? "") ?? .empty
        self.petId = taskCoreData.petID
        self.date = taskCoreData.date
        self.frequency = FrequencyModel(rawValue: taskCoreData.frequency ?? "") ?? .none
        self.text = taskCoreData.text
        self.completed = false
    }
}
