//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import XCTest
@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {

    var sut: NewTaskViewController!

    override func setUpWithError() throws {
        sut = NewTaskViewController()

        _ = sut.view
    }

    func testHasTitleTextField() {
        XCTAssertTrue(sut.titleTextField)
    }

}
