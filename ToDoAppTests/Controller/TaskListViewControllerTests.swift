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

    var sut: TaskListViewController!

    // MARK: - Lifecycle

    override func setUpWithError() throws {
        sut = TaskListViewController()

        _ = sut?.view // sut.loadViewIfNeeded()
    }

    // MARK: - Functions

    func testWhenViewIsLoadTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }

    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }

    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView?.delegate is DataProvider)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView?.dataSource is DataProvider)
    }

    func testWhenViewIsLoadedTableViewDelegateEqaulsTableViewDataSource() {
        XCTAssertEqual(sut.tableView?.delegate as? DataProvider,
                       sut.tableView?.dataSource as? DataProvider)
    }

    func testTaskListVCHasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? TaskListViewController, sut)
    }

    func presentingNewTaskViewController() -> NewTaskViewController {

        guard let newTaskButton = sut.navigationItem.rightBarButtonItem,
              let action = newTaskButton.action else {
            return NewTaskViewController()
        }

        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = sut
        sut.performSelector(onMainThread: action, with: newTaskButton, waitUntilDone: true)

        let newTaskViewController = sut.presentedViewController as! NewTaskViewController
        return newTaskViewController
    }

    func testAddNewTaskPresentsNewTaskViewController() {
        let newTaskViewController = presentingNewTaskViewController()
        XCTAssertNotNil(newTaskViewController.dateTextField)
    }

    func testSharesSameTaskManagerWithNewTaskVC() {
        let newTaskViewController = presentingNewTaskViewController()
        XCTAssertTrue(newTaskViewController.taskManager === sut.dataProvider?.taskManager)
    }

    func testWhenViewAppearedTableViewreloaded() {
        let mockTableView = MockTableView()


        sut.tableView = mockTableView
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()

        XCTAssertTrue((sut.tableView as! MockTableView).isReloaded)
    }
}

extension TaskListViewControllerTests {
    class MockTableView: UITableView {
        var isReloaded = false

        override func reloadData() {
            isReloaded = true
        }
    }
}
