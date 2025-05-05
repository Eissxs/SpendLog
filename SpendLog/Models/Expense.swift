//
//  Expense.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import Foundation

struct Expense: Identifiable, Codable, Equatable {
    let id: UUID
    var amount: Double
    var category: String
    var note: String
    var date: Date

    init(id: UUID = UUID(), amount: Double, category: String, note: String = "", date: Date = Date()) {
        self.id = id
        self.amount = amount
        self.category = category
        self.note = note
        self.date = date
    }
}
