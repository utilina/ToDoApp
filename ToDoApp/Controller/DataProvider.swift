//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//
import UIKit

class DataProvider: NSObject {

    // MARK: - Properties

    var taskManager: TaskManager?
}

// MARK: - TableViewDelegate

extension DataProvider: UITableViewDelegate {

}

// MARK: - TableViewDataSource

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
