//
//  TaskTests.swift
//  TaskTests
//
//  Created by Улитина Анастасия Сергеевна on 19.02.2021.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    // MARK: - Functions

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo") // Foo Bar Bus

        XCTAssertNotNil(task)
    }

    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar") // Foo Bar Bus

        XCTAssertNotNil(task)
    }

    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")

        XCTAssertEqual(task.title, "Foo")
    }

    func testWhenGivenDescriptionSetsTitle() {
        let task = Task(title: "Foo", description: "Bar")

        XCTAssertEqual(task.description, "Bar")
    }
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")

        XCTAssertNotNil(task.date)
    }

    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")

        let task = Task(title: "Bar", description: "Baz",
            location: location)

        XCTAssertEqual(location, task.location)
    }

}
