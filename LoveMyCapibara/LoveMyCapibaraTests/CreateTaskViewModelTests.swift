//
//  CreateTaskViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 24/07/23.
//

import XCTest
@testable import LoveMyCapibara

class CreateTaskViewModelTests: XCTestCase {
    var viewModel: CreateTaskViewModel!

    override func setUp() {
        super.setUp()
        viewModel = .init(taskManager: TaskDataManagerMock(), petManager: PetDataManagerMock())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSucessfulGetPetsList() {
        let tasks = viewModel.getPetsList()
        XCTAssertTrue(tasks, "Erro: o retorno da lista foi nulo")
    }

    func testGetPetsListNotNil() {
        let tasks = viewModel.getPetsList()
        XCTAssertNotNil(tasks)
    }

    func testSucessfulCreateTaskForPet() {
        let result = viewModel.createTaskForPet()
        XCTAssertTrue(result)
    }

    func testCreatedTaskTitleNotNil() {
        guard let result = viewModel.task.title else { return }
        XCTAssertNotNil(result, "Erro: o título da tarefa criada é nil")
    }

    func testCreatedTaskStatusNotNil() {
        guard let result = viewModel.task.completed else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o status nil")
    }

    func testCreatedTaskTypeNotNil() {
        guard let result = viewModel.task.type else { return }
        XCTAssertNotNil(result != .empty, "Erro: a tarefa possui o tipo nil")
    }

    func testCreatedTaskTextNotNil() {
        guard let result = viewModel.task.text else { return }
        XCTAssertNotNil(result, "Erro: o texto da tarefa criada é nil")
    }

    func testCreatedTaskIdNotNil() {
        guard let result = viewModel.task.id else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o id nil")
    }

    func testCreatedTaskPetNotNil() {
        guard let result = viewModel.task.pet else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o pet nil")
    }

    func testCreatedTaskRememberAtNotNil() {
        guard let result = viewModel.task.rememberAt else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o rememberAt nil")
    }

    func testCreatedTaskFrequencyNotNil() {
        guard let result = viewModel.task.frequency else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui a frequência nil")
    }

    func testTaskIsValid() {
        viewModel.txtTitle = "Teste"
        viewModel.type = .others
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertTrue(result, "Erro: a tarefa criada não é valida")
    }

    func testTaskIsNotValidTitleEmpty() {
        viewModel.txtTitle = ""
        viewModel.type = .others
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - título vazio")
    }

    func testTaskIsNotValidTypeEmpty() {
        viewModel.txtTitle = "teste"
        viewModel.type = .empty
        viewModel.selectedPet = "Pietro"
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - type empty")
    }

    func testTaskIsNotValidSelectedPetEmpty() {
        viewModel.txtTitle = "teste"
        viewModel.type = .others
        viewModel.selectedPet = ""
        let result = viewModel.taskIsValid()
        XCTAssertFalse(result, "Erro: a tarefa criada não é valida - pet vazio")
    }
}
