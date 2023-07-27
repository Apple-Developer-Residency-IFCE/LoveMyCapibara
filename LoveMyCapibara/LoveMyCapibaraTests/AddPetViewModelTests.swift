//
//  AddPetViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 26/07/23.
//

import XCTest
@testable import LoveMyCapibara

class AddPetViewModelTests: XCTestCase {
    var viewModel: AddPetViewModel!
    var viewModelUnsucessfulCase: AddPetViewModel!
    var petMock: PetModel!

    override func setUp() {
        super.setUp()
        petMock = PetModel()
        viewModel = .init(
            petManager: PetDataManagerMock()
        )
        viewModelUnsucessfulCase = .init(
            petManager: PetDataManagerUnsucessfulMock()
        )
    }

    override func tearDown() {
        viewModel = nil
        viewModelUnsucessfulCase = nil
        super.tearDown()
    }

    func test_add_SuccessfulCase() {
        let result = viewModel.add(pet: petMock)
        XCTAssertTrue(result)
    }

    func test_add_UnsuccessfulCase() {
        let result = viewModelUnsucessfulCase.add(pet: petMock)
        XCTAssertFalse(result)
    }

    func test_petIsValid_SuccessfulCase() {
        let mockPet = PetModel(name: "Pedro", specie: "Dragao", race: "guepardo", weight: 0.1)
        let result = viewModel.petIsValid(pet: mockPet)
        XCTAssertTrue(result)
    }

    func test_petIsValid_UnsuccessfulCaseTitleIsEmpty() {
        let mockPet = PetModel(name: "", specie: "Dragao", race: "guepardo", weight: 0.1)
        let result = viewModelUnsucessfulCase.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsuccessfulCaseSpecieIsEmpty() {
        let mockPet = PetModel(name: "Pedro", specie: "", race: "guepardo", weight: 0.1)
        let result = viewModelUnsucessfulCase.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsuccessfulCaseRaceIsEmpty() {
        let mockPet = PetModel(name: "Pedro", specie: "Dragao", race: "", weight: 0.1)
        let result = viewModelUnsucessfulCase.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }

    func test_petIsValid_UnsuccessfulCaseWeightIsZero() {
        let mockPet = PetModel(name: "Pedro", specie: "Dragao", race: "guepardo", weight: 0.0)
        let result = viewModelUnsucessfulCase.petIsValid(pet: mockPet)
        XCTAssertFalse(result)
    }
}
