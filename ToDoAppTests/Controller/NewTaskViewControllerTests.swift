//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {

    var sut: NewTaskViewController!
    var placemark: MockCLPlacemark!

    override func setUpWithError() throws {
        sut = NewTaskViewController()

        _ = sut.view
    }

    func testHasTitleTextField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }

    func testHasLocationTextField() {
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }

    func testHasDateTextField() {
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }

    func testHasAdressTextField() {
        XCTAssertTrue(sut.adressTextField.isDescendant(of: sut.view))
    }

    func testHasDescriptionTextField() {
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }

    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }

    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }

    func testSaveUsesGeocoderToConvertCoordinateFromAddress() {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from: "01.01.19")

        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        //sut.dateTextField.text = "01.01.19"
        sut.adressTextField.text = "Уфа"
        sut.descriptionTextField.text = "Baz"

        sut.taskManager = TaskManager()
        let mockGeocoder = MockCLGeocoder()
        sut.geocoder = mockGeocoder
        sut.save()

        let coordinate = CLLocationCoordinate2D(latitude: 54.7373058, longitude: 55.9722491)
        let location = Location(name: "Bar", coordinate: coordinate)
        let generatedTask = Task(title: "Foo", description: "Baz", date: date, location: location)

        placemark = MockCLPlacemark()
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)

        let task = sut.taskManager.task(at: 0)

        XCTAssertEqual(task, generatedTask)
    }

    func testSaveButtonHasSaveMethod() {
        let saveButton = sut.saveButton

        guard let actions = saveButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        XCTAssertTrue(actions.contains("save"))
    }

    func testGeocoderFetchesCorrectCoordinates() {
        let geocoderAnswer = expectation(description: "Geocoder answer")
        let addressString = "Уфа"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            let placemark = placemarks?.first
            let location = placemark?.location

            guard let latitude = location?.coordinate.latitude,
                  let longitude = location?.coordinate.longitude else {
                XCTFail()
                return
            }

            XCTAssertEqual(latitude, 54.7373058)
            XCTAssertEqual(longitude, 55.9722491)
            geocoderAnswer.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testSaveDismissesNewTaskViewController() {
        
    }
}


extension NewTaskViewControllerTests {
    class MockCLGeocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler

        }
    }

    class MockCLPlacemark: CLPlacemark {

        var mockCoordinate: CLLocationCoordinate2D!

        override var location: CLLocation? {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}

extension XCTestCase {
    func wait(interval: TimeInterval = 0.1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1) // add 0.1 for sure asyn after called
    }
}
