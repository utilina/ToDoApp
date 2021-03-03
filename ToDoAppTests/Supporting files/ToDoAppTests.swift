//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 03.03.2021.
//

import XCTest
@testable import ToDoApp

class ToDoAppTests: XCTestCase {

    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testInitialViewControllerIsTaskListViewController() {
        let navigationController = UINavigationController(rootViewController: TaskListViewController())
        let rootViewController = navigationController.viewControllers.first as? TaskListViewController

        XCTAssertTrue(rootViewController is TaskListViewController)
    }

    
}
