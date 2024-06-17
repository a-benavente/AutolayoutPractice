//
//  RemindersListVC.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation
import UIKit

class RemindersListViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = RemindersViewModel()

    override func viewDidLoad() {
        self.title = "Reminders"
        configureTableView()
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReminderCell.self, forCellReuseIdentifier: String(describing: ReminderCell.self))
    }
}

extension RemindersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.reminders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReminderCell.self), for: indexPath) as? ReminderCell else {
            return UITableViewCell()
        }
        let reminder = viewModel.reminders[indexPath.row]
        cell.configuration = ReminderCellConfiguration(title: reminder.title, description: reminder.description, dueDateString: reminder.dueDate.formatted(date: .numeric, time: .omitted))

        return cell
    }
}
