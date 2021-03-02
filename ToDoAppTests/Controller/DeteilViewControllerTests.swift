//
//  DeteilViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class DeteilViewControllerTests: XCTestCase {

    var controller: DeteilViewController?

    override func setUpWithError() throws {
        controller = DeteilViewController()

        _ = controller?.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasTitleLabel() {
        XCTAssertNotNil(controller?.titleLabel)
        XCTAssertTrue(((controller?.titleLabel.isDescendant(of: controller!.view)) != nil))
    }

    func testHasDescriptionLabel() {
        XCTAssertNotNil(controller?.descriptionLabel)
        XCTAssertTrue(((controller?.descriptionLabel.isDescendant(of: controller!.view)) != nil))
    }

    func testHasDateLabel() {
        XCTAssertNotNil(controller?.dateLabel)
        XCTAssertTrue(((controller?.dateLabel.isDescendant(of: controller!.view)) != nil))
    }

    func testHasMapView() {
        XCTAssertNotNil(controller?.mapView)
        XCTAssertTrue(((controller?.mapView.isDescendant(of: controller!.view)) != nil))
    }

    func setupTaskAndAppearanceTransition() {
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(50.7143528), longitude: CLLocationDegrees(50.0059731))
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1614694659)
        let task = Task(title: "Bar", description: "Foo", date: date, location: location)
        controller?.task = task

        controller?.beginAppearanceTransition(true, animated: true)
        controller?.endAppearanceTransition()
    }

    func testSettingTaskSetsTitleLabel() {
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(controller?.titleLabel.text, "Bar")
    }

    func testSettingTaskSetsDescription() {
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(controller?.descriptionLabel.text, "Foo")
    }

    func testSettingTaskSetsLocationLabel() {
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(controller?.locationLabel.text, "Baz")
    }

    func testSettingTaskSetsDateLabel() {
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(controller?.dateLabel.text, "02.03.21")
    }

//    func testSettingTaskSetsMapView() {
//        setupTaskAndAppearanceTransition()
//        guard let latitute = controller?.mapView.centerCoordinate else {fatalError()}
//        XCTAssertEqual(latitute.latitude, 40.7143528, accuracy: 0.001)
////        XCTAssertEqual(controller?.mapView.centerCoordinate.longitude as! CLLocationDegrees, -74.0059731, accuracy: 0.001)
//    }
}
