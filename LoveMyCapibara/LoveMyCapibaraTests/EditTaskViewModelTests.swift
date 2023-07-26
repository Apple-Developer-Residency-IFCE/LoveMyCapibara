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
    var viewModelUnsucessfulCase: EditTaskViewModel!
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
        viewModel = .init(
            currentTask: mockTask,
            taskManager: TaskDataManagerMock(),
            petManager: PetDataManagerMock()
        )
        viewModelUnsucessfulCase = .init(
            currentTask: mockTask,
            taskManager: TaskDataManagerUnsucessfulMock(),
            petManager: PetDataManagerUnsucessfulMock()
        )
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
    func test_deleteById_UnsucessfulCase() {
        let mockId = UUID()
        let result = viewModelUnsucessfulCase.deleteById(mockId)
        XCTAssertFalse(result)
    }

    func test_editTask_SucessfulCase() {
        let result = viewModel.editTask(mockTask)
        XCTAssertTrue(result)
    }

    func test_editTask_UnsucessfulCase() {
        let result = viewModelUnsucessfulCase.editTask(mockTask)
        XCTAssertFalse(result)
    }

    func test_TaskIsValid_SucessfulCase() {
        viewModel.txtTitle = "Teste"
        viewModel.type = .others
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertTrue(result, "Erro: a tarefa criada não é valida")
    }

    func test_TaskIsValid_UnsucessfulCaseTitleIsEmpty() {
        viewModel.txtTitle = ""
        viewModel.type = .others
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - título vazio")
    }

    func test_TaskIsValid_UnsucessfulCaseTypeIsEmpty() {
        viewModel.txtTitle = "teste"
        viewModel.type = .empty
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - type empty")
    }

    func test_TaskIsValid_UnsucessfulCaseSelectedPetIsEmpty() {
        viewModel.txtTitle = "teste"
        viewModel.type = .others
        viewModel.selectedPet = ""
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - pet vazio")
    }
}
