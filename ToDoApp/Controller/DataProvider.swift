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

//    override init() {
//        self.taskManager = TaskManager()
//        super.init()
//    }
}

// MARK: - TableViewDelegate

extension DataProvider: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        switch section {
        case .toDo:
            return "Done"
        case .done:
            return "Undone"
        }
    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell

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

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        guard let section = Section(rawValue: indexPath.section),
              let taskManager = taskManager else { fatalError() }
        switch section {
        case .toDo: taskManager.checkTask(at: indexPath.row)
        case .done: taskManager.uncheckTask(at: indexPath.row)
        }
        tableView.reloadData()
    }
}
