//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 19.02.2021.
//

import UIKit

class TaskListViewController: UIViewController {

    // MARK: - Properties

    var tableView: UITableView?
    var dataProvider: DataProvider?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        dataProvider = DataProvider()
        tableView?.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        tableView?.delegate = dataProvider
        tableView?.dataSource = dataProvider
        view.addSubview(tableView!)
        layoutTableView()
    }

    // MARK: - Functions

    func layoutTableView() {
        view = tableView
    }
}

