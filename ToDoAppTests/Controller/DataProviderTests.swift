//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//

import XCTest
@testable import ToDoApp

class DataProviderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSectionsIsTwo() {
        let sut = DataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut

        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }

    func testNumberOfRowsInSectionZeroIsTaskCount() {
        let sut = DataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut

        sut.taskManager?.add(task: Task(title: "Foo"))
    }


}
