//
//  EditPetViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 26/07/23.
//

import XCTest
@testable import LoveMyCapibara

class EditPetViewModelTests: XCTestCase {
    var viewModel: EditPetViewModel!
    var viewModelUnsucessfulCase: EditPetViewModel!
    var petMock: PetModel!

    override func setUp() {
        super.setUp()
        petMock = PetModel()
        viewModel = .init(
            petManager: PetDataManagerMock(),
            currentPet: petMock
        )
        viewModelUnsucessfulCase = .init(
            petManager: PetDataManagerUnsucessfulMock(),
            currentPet: petMock
        )
    }

    override func tearDown() {
        viewModel = nil
        viewModelUnsucessfulCase = nil
        super.tearDown()
    }

    func test_deleteById_SuccessfulCase() {
        let mockId = UUID()
        let result = viewModel.deleteById(mockId)
        XCTAssertTrue(result)
    }

    func test_deleteById_UnsuccessfulCase() {
        let mockId = UUID()
        let result = viewModelUnsucessfulCase.deleteById(mockId)
        XCTAssertFalse(result)
    }

    func test_edit_SuccessfulCase() {
        let mockPet = PetModel()
        let result = viewModel.edit(mockPet)
        XCTAssertTrue(result)
    }

    func test_edit_UnsuccessfulCase() {
        let mockPet = PetModel()
        let result = viewModelUnsucessfulCase.edit(mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_SuccessfulCase() {
        let mockPet = PetModel(name: "João Gomes", specie: "Dragão", race: "Human", weight: 0.1)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertTrue(result)
    }

    func test_petIsValid_UnsuccessfulCaseAllFieldsAreEmpty() {
        let mockPet = PetModel(name: "", specie: "", race: "", weight: 0.0)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsuccessfulCaseTitleIsEmpty() {
        let mockPet = PetModel(name: "", specie: "Dragão", race: "Human", weight: 0.1)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsucessfulCaseSpecieIsEmpty() {
        let mockPet = PetModel(name: "a", specie: "", race: "Human", weight: 0.1)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsucessfulCaseRaceIsEmpty() {
        let mockPet = PetModel(name: "a", specie: "Dragão", race: "", weight: 0.1)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsucessfulCaseWeightIsZero() {
        let mockPet = PetModel(name: "a", specie: "Dragão", race: "Human", weight: 0.0)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }
}
