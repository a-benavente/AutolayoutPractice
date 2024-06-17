//
//  ReminderCell.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation
import UIKit

class ReminderCell: UITableViewCell {

    var configuration: ReminderCellConfiguration? {
        didSet {
            if let configuration {
                setup(reminder: configuration)
            }
        }
    }

    private func setup(reminder: ReminderCellConfiguration) {
        title.text = reminder.title
        summary.text = reminder.description
        dueDate.text = reminder.dueDateString
    }

    private let title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let summary: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let dueDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {

        contentView.addSubview(title)
        contentView.addSubview(dueDate)
        contentView.addSubview(summary)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),

            summary.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            summary.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            summary.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            summary.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),

            dueDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dueDate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
