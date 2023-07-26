//
//  TaskDataManagerMock.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 24/07/23.
//

import Foundation
@testable import LoveMyCapibara

class TaskDataManagerMock: TaskDataManagerProtocol {
    func getAllTasks() -> [TaskModel]? {
        return []
    }

    func getAllPetTasks(_ pet: PetModel) -> [TaskModel]? {
        return []
    }

    func getTaskById(_ id: UUID) -> TaskModel? {
        return TaskModel()
    }
    func createTask(_ task: TaskModel) -> Bool {
        return true
    }
    func updateTask(_ task: TaskModel) -> Bool {
        return true
    }
    func deleteTaskById(_ id: UUID) -> Bool {
        return true
    }
}
