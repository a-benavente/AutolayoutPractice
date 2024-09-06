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
        prioritySymbol.isHidden = !reminder.isPriority
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

    private let prioritySymbol: UIImageView = {
        let img = UIImage(systemName: "exclamationmark.bubble.fill")
        let imageView = UIImageView(image: img)
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

        let stack = UIStackView(arrangedSubviews: [title, summary])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        contentView.addSubview(dueDate)
        contentView.addSubview(prioritySymbol)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stack.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor),
            dueDate.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            dueDate.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor),
            prioritySymbol.topAnchor.constraint(equalTo: dueDate.bottomAnchor, constant: 10),
            prioritySymbol.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10),
            prioritySymbol.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -15)
        ])
    }
}
