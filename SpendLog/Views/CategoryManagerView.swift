//
//  CategoryManagerView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

struct CategoryManagerView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    @Environment(\.dismiss) var dismiss

    @State private var newCategory = ""
    @State private var goalInput: String = ""
    @State private var showResetConfirmation = false
    @State private var showToast = false

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section(header: Text("Spending Categories")) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            HStack {
                                Text(category)
                                Spacer()
                                Button(role: .destructive) {
                                    viewModel.removeCategory(category)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                        }

                        HStack {
                            TextField("New category", text: $newCategory)
                            Button("Add") {
                                viewModel.addCategory(newCategory)
                                newCategory = ""
                            }
                            .disabled(newCategory.isEmpty)
                            .foregroundColor(.accentOrangeRed)
                        }
                    }

                    Section(header: Text("Monthly Limit (₱)")) {
                        TextField("Enter goal", text: $goalInput)
                            .keyboardType(.decimalPad)
                            .onAppear {
                                goalInput = String(format: "%.2f", viewModel.monthlyGoal)
                            }
                            .onChange(of: goalInput) { newValue in
                                if let value = Double(newValue) {
                                    viewModel.monthlyGoal = value
                                }
                            }
                    }

                    Section {
                        Button(role: .destructive) {
                            showResetConfirmation = true
                        } label: {
                            Label("Reset All Data", systemImage: "arrow.counterclockwise")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationTitle("Manage Categories")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }

                if showToast {
                    VStack {
                        Spacer()
                        Text("All data reset.")
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                            .padding(.bottom, 40)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .animation(.easeInOut, value: showToast)
                }
            }
            .alert("Reset All Data?", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) {}
                Button("Reset", role: .destructive) {
                    viewModel.resetAllData()
                    showToast = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showToast = false
                        }
                    }
                }
            } message: {
                Text("This will permanently delete all expenses and restore default categories and goal.")
            }
        }
    }
}
