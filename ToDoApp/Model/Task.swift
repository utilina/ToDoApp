//
//  Task.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

import Foundation

struct Task {

    // MARK: - Properties

    let title: String
    let descriptiton: String?
    let date: Date
    let location: Location?

    // MARK: - Initialization

    init(title: String, description: String? = nil, date: Date? = nil, location: Location? = nil ) {
        self.title = title
        self.date = date ?? Date()
        self.descriptiton = description
        self.location = location
    }
}

// MARK: - Equatable protocol

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
           lhs.descriptiton == rhs.descriptiton,
           lhs.location == rhs.location {
            return true
        }
        return false
    }
}
