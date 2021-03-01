//
//  LacationTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LacationTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testInitSetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }

    func testInitSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo",
                                coordinate: coordinate)

        XCTAssertEqual(location.coordinate?.longitude, location.coordinate?.longitude)
        XCTAssertEqual(location.coordinate?.latitude, location.coordinate?.latitude)

    }

}
