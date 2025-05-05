//
//  ExpenseViewModel.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [] {
        didSet { saveExpenses() }
    }

    @Published var categories: [String] = [] {
        didSet { saveCategories() }
    }

    @Published var monthlyGoal: Double = 5000 {
        didSet {
            UserDefaults.standard.set(monthlyGoal, forKey: goalKey)
        }
    }

    private let expensesKey = "expensesKey"
    private let categoriesKey = "categoriesKey"
    private let goalKey = "monthlyGoalKey"

    init() {
        loadExpenses()
        loadCategories()

        let savedGoal = UserDefaults.standard.double(forKey: goalKey)
        if savedGoal != 0 {
            monthlyGoal = savedGoal
        }
    }

    // MARK: - Expense Methods

    func addExpense(_ expense: Expense) {
        expenses.append(expense)
    }

    func updateExpense(_ updatedExpense: Expense) {
        if let index = expenses.firstIndex(where: { $0.id == updatedExpense.id }) {
            expenses[index] = updatedExpense
            saveExpenses()
        }
    }

    func deleteExpense(_ expense: Expense) {
        expenses.removeAll { $0.id == expense.id }
        saveExpenses()
    }

    // MARK: - Category Methods

    func addCategory(_ category: String) {
        guard !category.isEmpty && !categories.contains(category) else { return }
        categories.append(category)
    }

    func removeCategory(_ category: String) {
        categories.removeAll { $0 == category }
    }

    // MARK: - Reset All

    func resetAllData() {
        expenses.removeAll()
        categories = ["Food", "Bills", "Transport", "Shopping"]
        monthlyGoal = 5000
        saveExpenses()
        saveCategories()
        UserDefaults.standard.set(monthlyGoal, forKey: goalKey)
    }

    // MARK: - Persistence

    private func saveExpenses() {
        if let encoded = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encoded, forKey: expensesKey)
        }
    }

    private func loadExpenses() {
        if let data = UserDefaults.standard.data(forKey: expensesKey),
           let decoded = try? JSONDecoder().decode([Expense].self, from: data) {
            expenses = decoded
        }
    }

    private func saveCategories() {
        UserDefaults.standard.set(categories, forKey: categoriesKey)
    }

    private func loadCategories() {
        if let saved = UserDefaults.standard.stringArray(forKey: categoriesKey) {
            categories = saved
        } else {
            categories = ["Food", "Bills", "Transport", "Shopping"]
            saveCategories()
        }
    }

    // MARK: - Totals

    var dailyTotal: Double {
        total(for: .day)
    }

    var weeklyTotal: Double {
        total(for: .weekOfYear)
    }

    var monthlyTotal: Double {
        total(for: .month)
    }

    var yearlyTotal: Double {
        total(for: .year)
    }

    var highestSpendingDay: (date: Date, total: Double)? {
        let grouped = Dictionary(grouping: expenses) { Calendar.current.startOfDay(for: $0.date) }
        let dayTotals = grouped.mapValues { $0.reduce(0) { $0 + $1.amount } }
        
        if let maxEntry = dayTotals.max(by: { $0.value < $1.value }) {
            return (date: maxEntry.key, total: maxEntry.value)
        } else {
            return nil
        }
    }
    private func total(for component: Calendar.Component) -> Double {
        let calendar = Calendar.current
        let now = Date()
        return expenses
            .filter { calendar.isDate($0.date, equalTo: now, toGranularity: component) }
            .reduce(0) { $0 + $1.amount }
    }
}
