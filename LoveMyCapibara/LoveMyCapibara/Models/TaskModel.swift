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
    var pet: PetModel?
    var date: Date = .now
    var frequency: FrequencyModel?
    var text: String?
    var completed: Bool?
    var rememberAt: RememberAtModel?
    
    init(id: UUID? = nil, title: String? = nil, type: TaskTypeModel? = nil, pet: PetModel? = nil, date: Date? = nil, frequency: FrequencyModel? = nil, text: String? = nil, completed: Bool? = false, rememberAt: RememberAtModel? = .empty) {
        self.id = id
        self.title = title
        self.type = type
        self.pet = pet
        self.date = date ?? .now
        self.frequency = frequency
        self.text = text
        self.completed = completed
        self.rememberAt = rememberAt
    }
    
    init(taskCoreData: Task) {
        self.id = UUID()
        self.title = taskCoreData.title
        self.type = TaskTypeModel(rawValue: taskCoreData.type ?? "") ?? .empty
        self.pet = .init()
        self.date = taskCoreData.date ?? .now
        self.frequency = FrequencyModel(rawValue: taskCoreData.frequency ?? "") ?? .none
        self.text = taskCoreData.text
        self.completed = false
        self.rememberAt = RememberAtModel(rawValue: taskCoreData.rememberAt ?? "") ?? .empty
    }
}
