//
//  Task.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

import Foundation

struct Task {

    let title: String
    let descriptiton: String?
    private(set) var date: Date?
    let location: Location?

    init(title: String, description: String? = nil, location: Location? = nil ) {
        self.title = title
        self.descriptiton = description
        self.location = location
        self.date = Date()
    }
}

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
