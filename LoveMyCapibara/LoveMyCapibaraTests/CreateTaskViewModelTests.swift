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
    var viewModelUnsucessfulCase: CreateTaskViewModel!

    override func setUp() {
        super.setUp()
        viewModel = .init(
            taskManager: TaskDataManagerMock(),
            petManager: PetDataManagerMock()
        )
        viewModelUnsucessfulCase = .init(
            taskManager: TaskDataManagerUnsucessfulMock(),
            petManager: PetDataManagerUnsucessfulMock()
        )

    }

    override func tearDown() {
        viewModel = nil
        viewModelUnsucessfulCase = nil
        super.tearDown()
    }

    func test_GetPetsList_SucessfulCase() {
        let tasks = viewModel.getPetsList()
        XCTAssertTrue(tasks, "Erro: o retorno da lista foi nulo")
    }

    func test_GetPetsList_UnsucessfulCase() {
        let tasks = viewModelUnsucessfulCase.getPetsList()
        XCTAssertFalse(tasks, "Erro: o retorno da lista não foi nulo")
    }

    func test_GetPetsList_IsNotNil() {
        let tasks = viewModel.getPetsList()
        XCTAssertNotNil(tasks, "Erro: o retorno da lista foi nulo")
    }

    func test_GetPetsList_IsNotEmpty() {
        _ = viewModel.getPetsList()
        let petsList = viewModel.petNameList
        XCTAssertTrue(!petsList.isEmpty, "Erro: o retorno da lista foi vazio")
    }

    func test_CreateTaskForPet_SucessfulCase() {
        let result = viewModel.createTaskForPet()
        XCTAssertTrue(result, "Erro: a criação da tarefa não foi bem sucedida")
    }

    func test_CreateTaskForPet_UnsucessfulCase() {
        let result = viewModelUnsucessfulCase.createTaskForPet()
        XCTAssertFalse(result, "Erro: a criação da tarefa não foi bem sucedida")
    }

    func test_CreateTaskForPet_TitleIsNotNil() {
        guard let result = viewModel.task.title else { return }
        XCTAssertNotNil(result, "Erro: o título da tarefa criada é nil")
    }

    func test_CreateTaskForPet_StatusIsNotNil() {
        guard let result = viewModel.task.completed else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o status nil")
    }

    func test_CreateTaskForPet_TypeIsNotNil() {
        guard let result = viewModel.task.type else { return }
        XCTAssertNotNil(result != .empty, "Erro: a tarefa possui o tipo nil")
    }

    func test_CreateTaskForPet_TextIsNotNil() {
        guard let result = viewModel.task.text else { return }
        XCTAssertNotNil(result, "Erro: o texto da tarefa criada é nil")
    }

    func test_CreateTaskForPet_IdIsNotNil() {
        guard let result = viewModel.task.id else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o id nil")
    }

    func test_CreateTaskForPet_PetIsNotNil() {
        guard let result = viewModel.task.pet else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o pet nil")
    }

    func test_CreateTaskForPet_RememberAtIsNotNil() {
        guard let result = viewModel.task.rememberAt else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui o rememberAt nil")
    }

    func test_CreateTaskForPet_FrequencyIsNotNil() {
        guard let result = viewModel.task.frequency else { return }
        XCTAssertNotNil(result, "Erro: a tarefa possui a frequência nil")
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
