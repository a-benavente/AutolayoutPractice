//
//  RemindersViewModel.swift
//  AutolayoutPractice
//
//  Created by Amanda Benavente on 6/17/24.
//

import Foundation

class RemindersViewModel {
    var reminders: [Reminder] = []

    func addReminder(title: String, description: String, dueDate: Date, isPriority: Bool) {
        let newReminder = Reminder(title: title, description: description, dueDate: dueDate, completed: false, isPriority: isPriority)
        reminders.insert(newReminder, at: 0)
    }

    private func createReminders() {
        reminders.append(Reminder(title: "Pick up groceries", description: "At Whole Foods", dueDate: Date(), completed: false, isPriority: false))
        reminders.append(Reminder(title: "Call Jane", description: "Her new num - 888-888-8888, remind her about the recital on Saturday", dueDate: Date(), completed: false, isPriority: true))
        reminders.append(Reminder(title: "Schedule Drs. Appt", description: "First week of July", dueDate: Date(), completed: false, isPriority: true))
        reminders.append(Reminder(title: "RSVP for Danny's Dance Recital", description: "RSVP for 3 people", dueDate: Date(), completed: false, isPriority: false))
        reminders.append(Reminder(title: "Call insurance company", description: "Make sure the have full coverage", dueDate: Date(), completed: false, isPriority: true))
    }
}
