//
//  ReminderDetailsViewController.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 9/6/24.
//

import UIKit

class ReminderDetailsViewController: UIViewController {

    var configuration: ReminderDetailConfiguration? {
        didSet {
            if let configuration {
                setup(reminder: configuration)
            }
        }
    }

    private func setup(reminder: ReminderDetailConfiguration) {
        reminderTitle.text = reminder.title
        dueDate.text = reminder.dueDateString
        descriptionText.text = reminder.description
        checkboxButton.isSelected = reminder.completed
    }

    private let reminderTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let dueDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let descriptionText: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private lazy var checkboxButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "unchecked"), for: .normal)
        button.setImage(UIImage(named: "checked"), for: .selected)
        button.addTarget(self, action: #selector(toggleCheckbox(_:)), for: .touchUpInside)
        return button
    }()

    @objc private func toggleCheckbox(_ sender: UIButton) {
        sender.isSelected.toggle()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }

    private func configure() {
        view.addSubview(reminderTitle)
        view.addSubview(dueDate)
        view.addSubview(descriptionText)

        NSLayoutConstraint.activate([
            reminderTitle.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            reminderTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            dueDate.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            dueDate.topAnchor.constraint(equalTo: reminderTitle.bottomAnchor, constant: 25),
            descriptionText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            descriptionText.topAnchor.constraint(equalTo: dueDate.bottomAnchor, constant: 20)
        ])
    }
}
