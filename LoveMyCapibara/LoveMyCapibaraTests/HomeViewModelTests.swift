//
//  HomeViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Gustavo Holzmann on 26/07/23.
//

import XCTest
@testable import LoveMyCapibara

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var viewModelUnsucessfulCase: HomeViewModel!

    override func setUp() {
        super.setUp()
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

    func test_updateList_SucessfulCase() {
        let result = viewModel.updateList()
        XCTAssertTrue(result)
    }

    func test_updateList_UnsucessfulCase() {
        let result = viewModelUnsucessfulCase.updateList()
        XCTAssertFalse(result)
    }

    func test_updateList_ListWasSucessfulyUpdated() {
        let result: [PetModel] = []
        viewModel.pets.append(PetModel())
        viewModel.updateList()
        XCTAssertEqual(result, viewModel.pets)
    }
}
