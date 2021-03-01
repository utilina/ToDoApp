//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//
import UIKit

enum Section: Int, CaseIterable {
    case toDo
    case done
}

class DataProvider: NSObject {

    // MARK: - Properties

    var taskManager: TaskManager?

    override init() {
        taskManager = TaskManager()
    }
}

// MARK: - TableViewDelegate

extension DataProvider: UITableViewDelegate {

}

// MARK: - TableViewDataSource

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let section = Section(rawValue: section),
              let taskManager = taskManager else { fatalError() }

        switch section {
        case .toDo: return taskManager.tasksCount
        case .done: return taskManager.doneTasksCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell

        guard let section = Section(rawValue: indexPath.section),
              let taskManager = taskManager
        else { fatalError() }

        let task: Task
        switch section {
        case .toDo:
            task = taskManager.task(at: indexPath.row)
        case .done:
            task = taskManager.doneTask(at: indexPath.row)
        }
        cell.configure(withTask: task)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
}
