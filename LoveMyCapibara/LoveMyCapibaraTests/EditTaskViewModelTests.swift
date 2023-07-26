//
//  EditTaskViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 25/07/23.
//

import XCTest
@testable import LoveMyCapibara

class EditTaskViewModelTests: XCTestCase {
    var viewModel: EditTaskViewModel!
    var mockTask: TaskModel!

    override func setUp() {
        super.setUp()
        mockTask = TaskModel(
            id: UUID(),
            title: "Task teste",
            type: .others,
            pet: PetModel(),
            date: Date.now,
            frequency: .daily,
            text: "Texto descritivo",
            completed: [:],
            rememberAt: .tenMinutes
        )
        viewModel = .init(currentTask: mockTask, taskManager: TaskDataManagerMock(), petManager: PetDataManagerMock())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_deleteById_SucessfulCase() {
        let mockId = UUID()
        let result = viewModel.deleteById(mockId)
        XCTAssertTrue(result)
    }

}
