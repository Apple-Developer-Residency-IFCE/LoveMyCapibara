//
//  CalendarViewModelTests.swift
//  LoveMyCapibaraTests
//
//  Created by Maurício de Moura on 25/07/23.
//

import XCTest
@testable import LoveMyCapibara

final class CalendarViewModelTests: XCTestCase {
    var viewModel: CalendarViewModel!

    override func setUp() {
        super.setUp()
        viewModel = .init(Date.now)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_SelectDay_AnyDate() {
        if let validDate = Calendar.current.date(byAdding: DateComponents(day: 5), to: Date.now) {
            viewModel.selectDay(validDate)

            XCTAssertEqual(validDate, viewModel.firstDate, "A data selecionada é diferente da data passada")
        }
    }

    func test_IsToday_SuccessfulCase() {
        let today = Date.now

        let result = viewModel.isToday(day: today)

        XCTAssertTrue(result, "Erro: o dia atual não foi reconhecido")
    }

    func test_IsToday_FailedCase() {
        if let tomorrow = Calendar.current.date(byAdding: DateComponents(day: 1), to: Date.now) {
            let result = viewModel.isToday(day: tomorrow)

            XCTAssertFalse(result, "Erro: o retorno da função é true mesmo passando um dia diferente de hoje")
        }
    }

    func test_IsDateSelected_SuccessfulCase() {
        if let anyDate = Calendar.current.date(byAdding: DateComponents(day: 5), to: Date.now) {
            viewModel.selectDay(anyDate)
            let result = viewModel.isDateSelected(day: anyDate)

            XCTAssertTrue(result, "Erro: o dia selecionado não é reconhecido após ser selecionado")
        }
    }

    func test_IsDateSelected_FailedCase() {
        if let selectedDate = Calendar.current.date(byAdding: DateComponents(day: 5), to: Date.now) {
            viewModel.selectDay(selectedDate)
            let otherdate = Date.now

            let result = viewModel.isDateSelected(day: otherdate)

            XCTAssertFalse(result, "Erro: o retorno foi true mesmo o dia passado não sendo o selecionado")
        }
    }

    func test_IsFirstDayOfMonth_SuccessfulCase() {
        if let firstDayOfMonth = Calendar.current.date(
            from: Calendar.current.dateComponents([.year, .month],
                                                  from: Date.now)) {
            let result = viewModel.isFirstDayOfMonth(date: firstDayOfMonth)

            XCTAssertTrue(result, "Erro: o retorno foi false mesmo sendo passado o primeiro dia do mês")
        }
    }

    func test_IsFirstDayOfMonth_FailedCase() {
        if let firstDayOfMonth = Calendar.current.date(
            from: Calendar.current.dateComponents([.year, .month],
                                                  from: Date.now)) {

            if let notFirstDayOfMonth = Calendar.current.date(byAdding: DateComponents(day: 5), to: firstDayOfMonth) {
                let result = viewModel.isFirstDayOfMonth(date: notFirstDayOfMonth)

                XCTAssertFalse(result, "Erro: o retorno foi true mesmo não sendo passado o primeiro dia do mês")
            }
        }
    }

    func test_LastDayOfMonth_SuccessfulCase() {
        if let firstDayOfMonth = Calendar.current.date(
            from: Calendar.current.dateComponents([.year, .month],
                                                  from: Date.now)) {
            if let lastDayMonth = Calendar.current.date(
                byAdding: DateComponents(month: 1, day: -1), to: firstDayOfMonth) {

            let result = viewModel.isLastDayOfMonth(date: lastDayMonth)

                XCTAssertTrue(result, "Erro: o retorno foi false mesmo sendo passado o último dia do mês")
            }
        }
    }

    func test_LastDayOfMonth_FailedCase() {
        if let firstDayOfMonth = Calendar.current.date(
            from: Calendar.current.dateComponents([.year, .month],
                                                  from: Date.now)) {

                let result = viewModel.isLastDayOfMonth(date: firstDayOfMonth)

                XCTAssertFalse(result, "Erro: o retorno foi true mesmo não sendo passado o último dia do mês")

        }
    }

    func test_DateToStr_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            let expectedResult = "01.01.2023"

            let result = viewModel.dateToStr(date)

            XCTAssertEqual(expectedResult, result, "Erro: a string de retorno não devolve o formato esperado")
        }
    }

    func test_DateToStr_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            let expectedResult = "1.1.2023"

            let result = viewModel.dateToStr(date)

            XCTAssertNotEqual(expectedResult, result, "Erro: a string de retorno não devolve o formato esperado")
        }
    }

    func test_TitleForMonth_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = "janeiro"

            let result = viewModel.titleForMonth()

            XCTAssertEqual(expectedResult, result, "Erro: a string de retorno não devolve o valor esperado")
        }
    }

    func test_TitleForMonth_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = "Janeiro"

            let result = viewModel.titleForMonth()

            XCTAssertNotEqual(expectedResult, result, "Erro: a string de retorno não devolve o formato esperado")
        }
    }

    func test_TitleForYear_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = "2023"

            let result = viewModel.titleForYear()

            XCTAssertEqual(expectedResult, result, "Erro: a string de retorno não devolve o valor esperado")
        }
    }

    func test_TitleForYear_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = "23"

            let result = viewModel.titleForYear()

            XCTAssertNotEqual(expectedResult, result, "Erro: a string de retorno não devolve o formato esperado")
        }
    }

    func test_SelectBackMonth_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 12

            let result = viewModel.selectBackMonth()

            XCTAssertEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do mês anterior")
        }
    }

    func test_SelectBackMonth_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2

            let result = viewModel.selectBackMonth()

            XCTAssertNotEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do mês anterior")
        }
    }

    func test_SelectForwardMonth_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2

            let result = viewModel.selectForwardMonth()

            XCTAssertEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do mês seguinte")
        }
    }

    func test_SelectForwardMonth_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 3

            let result = viewModel.selectForwardMonth()

            XCTAssertNotEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do mês seguinte")
        }
    }

    func test_SelectBackYear_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2022

            let result = viewModel.selectBackYear()

            XCTAssertEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do ano anterior")
        }
    }

    func test_SelectBackYear_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2021

            let result = viewModel.selectBackYear()

            XCTAssertNotEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do ano anterior")
        }
    }

    func test_SelectForwardYear_SuccessCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2024

            let result = viewModel.selectForwardYear()

            XCTAssertEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do ano seguinte")
        }
    }

    func test_SelectForwardYear_FailedCase() {
        if let date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) {
            viewModel.date = date
            let expectedResult = 2025

            let result = viewModel.selectForwardYear()

            XCTAssertNotEqual(expectedResult, result, "Erro: o inteiro de retorno não devolve o valor do ano seguinte")
        }
    }

    func test_HasEvent_SuccessCase() {
        viewModel.events = [Calendar.current.startOfDay(for: Date.now)]

        let dayWithTask = Calendar.current.startOfDay(for: Date.now)
        let result = viewModel.hasEvent(day: dayWithTask)

        XCTAssertTrue(result, "Erro: função não identificou um evento em um dia com evento")
    }

    func test_HasEvent_FailedCase() {
        viewModel.events = [Calendar.current.startOfDay(for: Date.now)]

        if let dayWithoutTask = Calendar.current.date(
            byAdding: DateComponents(day: 3),
            to: Calendar.current.startOfDay(for: Date.now)) {
            let result = viewModel.hasEvent(day: dayWithoutTask)
            XCTAssertFalse(result, "Erro: função não identificou um evento em um dia com evento")
        }
    }
}
