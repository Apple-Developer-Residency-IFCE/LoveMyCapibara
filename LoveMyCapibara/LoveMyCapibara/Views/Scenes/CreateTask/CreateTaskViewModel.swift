//
//  CreateTaskViewModel.swift
//  LoveMyCapibara
//
//  Created by Ravi on 30/06/23.
//

import Foundation

final class CreateTaskViewModel: ObservableObject {
    
    let taskManager = TaskDataManager()
    
    func add(task: TaskModel) {
        taskManager.createTask(task)
    }
}
