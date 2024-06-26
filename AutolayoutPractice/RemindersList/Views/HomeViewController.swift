//
//  HomeVC.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Set your reminders"
        navigationController?.navigationBar.prefersLargeTitles = true

        setupButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    func setupButton() {
        view.addSubview(button)
        button.setTitle("View Reminders", for: .normal)
        button.backgroundColor = .systemMint
        button.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        button.layer.cornerRadius = 8

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

    @objc func navigateTo() {
        navigationController?.pushViewController(RemindersListViewController(), animated: true)
    }
}
