//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 19.02.2021.
//

import UIKit

class TaskListViewController: UIViewController {

    // MARK: - Properties

    var tableView: UITableView!
    var dataProvider: DataProvider!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        dataProvider = DataProvider()
        let taskManager = TaskManager()
        dataProvider?.taskManager = taskManager

        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        view.addSubview(tableView)

        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        tableView.rowHeight = 110
        layoutTableView()
        tableView.backgroundColor = .red

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addTask(_ sender: Any){
        let vc = NewTaskViewController()
        vc.taskManager = self.dataProvider?.taskManager
        self.present(vc, animated: true, completion: nil)

    }

    // MARK: - Functions

    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

