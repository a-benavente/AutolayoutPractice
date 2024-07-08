//
//  AddReminderViewController.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/23/24.
//

import UIKit

class AddReminderViewController: UIViewController {
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissSheet), for: .touchUpInside)
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        return button
    }()

    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Label for your reminder"
        return textField
    }()

    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Add details for your reminder"
        return lbl
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        textView.layer.borderWidth = 1
        textView.font = .preferredFont(forTextStyle: .body)
        return textView
    }()

    private let dueDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        return datePicker
    }()

    private let notificationPicker: UIPickerView = {
        UIPickerView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }

    @objc private func dismissSheet() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func saveAction() {
        // no-op
        dismiss(animated: true, completion: nil)
    }
    
    private func configure () {
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
        view.addSubview(titleTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(dueDatePicker)

        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleTextField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 25),
            descriptionTextView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 7),
            descriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            descriptionTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            dueDatePicker.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 30),
            dueDatePicker.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor)
        ])
    }
}
