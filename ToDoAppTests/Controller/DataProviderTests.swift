//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//

import XCTest
@testable import ToDoApp

class DataProviderTests: XCTestCase {


    // MARK: - Properties

    var sut: DataProvider?
    var tableView: UITableView?
    var controller: TaskListViewController?

    // MARK: - Lifecycle

    override func setUpWithError() throws {
        sut = DataProvider()
        sut?.taskManager = TaskManager()
        controller = TaskListViewController()
        _ = controller?.loadViewIfNeeded()
        tableView = controller?.tableView
        tableView?.dataSource = sut
    }

    // MARK: - Functions

    func testNumberOfSectionsIsTwo() {
        let numberOfSections = tableView?.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }

    func testNumberOfRowsInSectionZeroIsTasksCount() {
        sut?.taskManager?.add(task: Task(title: "Foo"))

        XCTAssertEqual(tableView?.numberOfRows(inSection: 0), 1)

        sut?.taskManager?.add(task: Task(title: "Bar"))
        tableView?.reloadData()

        XCTAssertEqual(tableView?.numberOfRows(inSection: 0), 2)
    }

    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
        sut?.taskManager?.add(task: Task(title: "Foo"))
        sut?.taskManager?.checkTask(at: 0)

        XCTAssertEqual(tableView?.numberOfRows(inSection: 1), 1)

        sut?.taskManager?.add(task: Task(title: "Bar"))
        sut?.taskManager?.checkTask(at: 0)

        tableView?.reloadData()

        XCTAssertEqual(tableView?.numberOfRows(inSection: 1), 2)
    }

    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut?.taskManager?.add(task: Task(title: "Foo"))
        tableView?.reloadData()

        let cell = tableView?.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(cell is TaskCell)
    }

    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSOurce: sut!)

        sut?.taskManager?.add(task: Task(title: "Foo"))
        mockTableView.reloadData()

        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellIsDequeued)
    }

    func testCellForRowInSectionZeroConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSOurce: sut!)

        let task = Task(title: "Foo")
        sut?.taskManager?.add(task: task)
        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell

        XCTAssertEqual(cell.task, task)
    }

    func testCellForRowInSectionOneConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSOurce: sut!)

        let task = Task(title: "Foo")
        let task2 = Task(title: "Bar")
        sut?.taskManager?.add(task: task)
        sut?.taskManager?.add(task: task2)
        sut?.taskManager?.checkTask(at: 0)
        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockTaskCell

        XCTAssertEqual(cell.task, task)
    }
}

extension DataProviderTests {
    class MockTableView: UITableView {

        var cellIsDequeued = false

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }

        static func mockTableView(withDataSOurce dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 375, height: 640), style: .plain)
            print(mockTableView.frame.size)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
            return mockTableView
        }
    }

    class MockTaskCell: TaskCell {
        var task: Task?

        override func configure(withTask task: Task) {
            self.task = task
        }
    }

}
