//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 20.02.2021.
//

class TaskManager {

    private var tasks: [Task] = []
    var tasksCount: Int {
        return tasks.count
    }
    private var doneTasks: [Task] = []
    var doneTasksCount: Int {
        return doneTasks.count
    }
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }

    func task(at index: Int) -> Task {
        return tasks[index]
    }

    func checkTask(at index: Int) {
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }

    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }

    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}