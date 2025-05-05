//
//  AddExpenseView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ExpenseViewModel

    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var note: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("₱0.00", text: $amount)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Category")) {
                    Picker("Select Category", selection: $category) {
                        ForEach(viewModel.categories, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section(header: Text("Note (optional)")) {
                    TextField("Add a note", text: $note)
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let amountValue = Double(amount), !category.isEmpty {
                            let expense = Expense(amount: amountValue, category: category, note: note)
                            viewModel.addExpense(expense)
                            dismiss()
                        }
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
            }
        }
    }
}
