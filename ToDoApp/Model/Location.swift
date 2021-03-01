//
//  Location.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

import CoreLocation

struct Location {

    // MARK: - Properties

    let name: String
    let coordinate: CLLocationCoordinate2D?

    // MARK: - Initialization

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

// MARK: - Equatable protocol

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude &&
                rhs.coordinate?.longitude == lhs.coordinate?.latitude &&
                lhs.name == rhs.name else { return false }
        return true
    }
}
