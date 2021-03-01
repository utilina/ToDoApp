//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 19.02.2021.
//

import UIKit

class TaskListViewController: UIViewController {

    var tableView: UITableView?
    var dataProvider: DataProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        dataProvider = DataProvider()
        tableView?.delegate = dataProvider
        tableView?.dataSource = dataProvider
        view.addSubview(tableView!)
        layoutTableView()
    }

    func layoutTableView() {
        view = tableView
    }
}

