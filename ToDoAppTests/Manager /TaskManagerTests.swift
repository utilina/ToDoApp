//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {

    var sut: TaskManager!

    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        XCTAssertEqual(sut.tasksCount, 0)
    }

    func testInitTaskManagerWithZeroDoneTasks() {
        XCTAssertEqual(sut.doneTasksCount, 0)
    }

    func testAddTaskIncrementTaskCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        XCTAssertEqual(sut.tasksCount, 1)
    }

    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)

        let returnedTask = sut.task(at: 0)
        XCTAssertEqual(task.title, returnedTask.title)
    }

    func testCheckTaskAtIndexChangesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)

        sut.checkTask(at: 0)

        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)

    }

    func testCheckedTaskRemovedFromTask() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)

        sut.checkTask(at: 0)

        XCTAssertEqual(sut.task(at: 0), secondTask)
    }

    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)

        sut.checkTask(at: 0)
        let reternedTask = sut.doneTask(at:0)

        XCTAssertEqual(reternedTask, task)
    }

    func testRemoveAllResultsCountsBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))

        sut.checkTask(at: 0)

        sut.removeAll()

        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
    }

    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))

        XCTAssertTrue(sut.tasksCount == 1)
    }

}
