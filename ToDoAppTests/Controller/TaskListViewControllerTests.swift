//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {

    // MARK: - Properties

    var sut: TaskListViewController?

    // MARK: - Lifecycle

    override func setUpWithError() throws {
        sut = TaskListViewController()

        _ = sut?.view // sut.loadViewIfNeeded()
    }

    // MARK: - Functions

    func testWhenViewIsLoadTableViewNotNil() {
        XCTAssertNotNil(sut?.tableView)
    }

    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut?.dataProvider)
    }

    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut?.tableView?.delegate is DataProvider)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut?.tableView?.dataSource is DataProvider)
    }

    func testWhenViewIsLoadedTableViewDelegateEqaulsTableViewDataSource() {
        XCTAssertEqual(sut?.tableView?.delegate as? DataProvider,
                       sut?.tableView?.dataSource as? DataProvider)
    }

}
