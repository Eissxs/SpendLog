//
//  SpendLogApp.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI
import UserNotifications

@main
struct SpendLogApp: App {
    init() {
        requestNotificationPermission()
        scheduleDailySpendingReminder()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error)")
            } else if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }

    private func scheduleDailySpendingReminder() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["dailySpendingReminder"])

        let content = UNMutableNotificationContent()
        content.title = "Don't forget to log!"
        content.body = "Track your spending today in SpendLog."
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = 10 // 10 daily

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "dailySpendingReminder", content: content, trigger: trigger)
        center.add(request)
    }
}
