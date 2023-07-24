//
//  CreateTaskViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 24/07/23.
//

import XCTest
@testable import LoveMyCapibara

class TaskDataManagerMock: TaskDataManagerProtocol {
    func getAllTasks(searchDate: Date?) -> [TaskModel] {
        return [TaskModel()]
    }
    func getTaskById(_ id: UUID) -> TaskModel? {
        return TaskModel()
    }
    func createTask(_ task: TaskModel) {
    }
    func updateTask(_ task: TaskModel) {
    }
    func deleteTaskById(_ id: UUID) {
    }
}

final class CreateTaskViewModelTests: XCTestCase {
    func testSucessfulGetPets() throws {
        // Arrange

        // Act
        
        // Assert
        
    }
}
