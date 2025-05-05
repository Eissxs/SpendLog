//
//  EditExpenseView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

struct EditExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ExpenseViewModel

    @State private var amount: String
    @State private var category: String
    @State private var note: String
    @State private var date: Date

    var expense: Expense

    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var showToast = false

    init(viewModel: ExpenseViewModel, expense: Expense) {
        self.viewModel = viewModel
        self.expense = expense
        _amount = State(initialValue: String(format: "%.2f", expense.amount))
        _category = State(initialValue: expense.category)
        _note = State(initialValue: expense.note)
        _date = State(initialValue: expense.date)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: Text("Amount")) {
                        TextField("₱0.00", text: $amount)
                            .keyboardType(.decimalPad)
                    }

                    Section(header: Text("Category")) {
                        Picker("Category", selection: $category) {
                            ForEach(viewModel.categories, id: \.self) { cat in
                                Text(cat).tag(cat)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }

                    Section(header: Text("Note")) {
                        TextField("Note (optional)", text: $note)
                    }

                    Section(header: Text("Date")) {
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                    }

                    Section {
                        Button("Save Changes") {
                            if validateFields() {
                                let updatedExpense = Expense(
                                    id: expense.id,
                                    amount: Double(amount) ?? 0,
                                    category: category,
                                    note: note,
                                    date: date
                                )
                                viewModel.updateExpense(updatedExpense)
                                showToast = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        showToast = false
                                        dismiss()
                                    }
                                }
                            }
                        }
                        .foregroundColor(.blue)

                        Button("Delete Expense", role: .destructive) {
                            viewModel.deleteExpense(expense)
                            dismiss()
                        }
                    }
                }

                if showToast {
                    VStack {
                        Spacer()
                        Text("Changes saved.")
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                            .padding(.bottom, 40)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .animation(.easeInOut, value: showToast)
                }
            }
            .navigationTitle("Edit Expense")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func validateFields() -> Bool {
        guard let parsedAmount = Double(amount), parsedAmount > 0 else {
            alertMessage = "Please enter a valid amount greater than 0."
            showAlert = true
            return false
        }

        if category.trimmingCharacters(in: .whitespaces).isEmpty {
            alertMessage = "Category cannot be empty."
            showAlert = true
            return false
        }

        return true
    }
}
