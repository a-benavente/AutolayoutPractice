//
//  Reminder.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation

struct Reminder: Codable {
    var title: String
    var description: String
    var dueDate: Date
    var completed: Bool
}
