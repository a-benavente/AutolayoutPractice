//
//  RemindersListVC.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation
import UIKit

class RemindersListViewController: UIViewController, AddReminderDelegate {
    func addReminder(title: String, description: String, dueDate: Date) {
        viewModel.addReminder(title: title, description: description, dueDate: dueDate)
        reloadTableView()
    }

    private let tableView = UITableView()
    private let viewModel = RemindersViewModel()

    override func viewDidLoad() {
        self.title = "Reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(openAddReminderSheet))
        configureTableView()
    }

    @objc private func openAddReminderSheet() {
        let sheetViewController = AddReminderViewController()
        sheetViewController.delegate = self
        present(sheetViewController, animated: true)
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReminderCell.self, forCellReuseIdentifier: String(describing: ReminderCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        reloadTableView()

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func emptyTableView() -> UIView {
        let backgroundView = UIView()
        let messageLabel = UILabel()
        messageLabel.text = "Looks like you don't have any reminders!"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 18)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            messageLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.5)
        ])

        return backgroundView
    }

    private func reloadTableView() {
        if viewModel.reminders.isEmpty {
            tableView.backgroundView = emptyTableView()
        } else {
            tableView.backgroundView = nil
        }
        tableView.reloadData()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reminder = viewModel.reminders[indexPath.row]
        let reminderDetailsView = ReminderDetailsViewController()
        reminderDetailsView.configuration = ReminderDetailConfiguration(title: reminder.title, description: reminder.description, dueDateString: reminder.dueDate.formatted(date: .numeric, time: .omitted), completed: reminder.completed)
        navigationController?.pushViewController(reminderDetailsView, animated: true)
    }
}
