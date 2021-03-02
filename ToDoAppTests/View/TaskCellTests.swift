//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {

    var sut: TaskListViewController?
    var cell: TaskCell?

    override func setUpWithError() throws {
        sut = TaskListViewController()

        sut?.loadViewIfNeeded()

        let tableView = sut?.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource

        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as! TaskCell
    }

    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell?.titleLabel)
    }

    func testCellHasTitleLabelInContentView() {
        XCTAssertTrue(((cell?.titleLabel.isDescendant(of: cell!.contentView)) != nil))
    }

    func testCellHasLocationLabel() {
        XCTAssertNotNil(cell?.locationLabel)
    }

    func testCellHasLocationLabelInContentView() {
        XCTAssertTrue(((cell?.locationLabel.isDescendant(of: cell!.contentView)) != nil))
    }

    func testCellHasDateLabel() {
        XCTAssertNotNil(cell?.dateLabel)
    }

    func testCellHasDateLabelInContentView() {
        XCTAssertTrue(((cell?.dateLabel.isDescendant(of: cell!.contentView)) != nil))
    }

    func testConfigureSetsTitle() {
        let task = Task(title: "Foo")
        cell?.configure(withTask: task)
        XCTAssertEqual(cell?.titleLabel.text, task.title)
    }

    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        cell?.configure(withTask: task)
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = df.string(from: date)

        XCTAssertEqual(cell?.dateLabel.text, dateString)
    }

    func testConfigureSetsLocationTitle() {
        let location = Location(name: "Bar")
        let task = Task(title: "Foo", location: location)
        cell?.configure(withTask: task)
        XCTAssertEqual(cell?.locationLabel.text, task.location?.name)
    }

    func testDoneTaskShouldStrikeThrough() {
        let task = Task(title: "Foo")
        cell?.configure(withTask: task, done: true)
        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        XCTAssertEqual(cell?.titleLabel.attributedText, attributedString)
    }

    func testDoneTaskDateLabelEqualsNil() {
        let task = Task(title: "Foo")
        cell?.configure(withTask: task, done: true)
        XCTAssertTrue(((cell?.dateLabel.isHidden) != nil))
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

