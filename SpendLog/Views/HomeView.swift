//
//  HomeView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ExpenseViewModel()
    @State private var showingAdd = false
    @State private var showingCategoryManager = false
    @State private var selectedExpense: Expense? = nil
    @State private var showSummary = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {

                    // Add space between the title and the pie chart
                    Spacer().frame(height: 24)

                    // MARK: - Pie Chart
                    Text("Spending Breakdown")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .padding(.horizontal)

                    SpendingPieChartView(expenses: viewModel.expenses)
                        .frame(height: 240)
                        .padding(.horizontal)

                    // MARK: - Stats Card
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Spending Summary")
                                .font(.title3.bold())
                                .foregroundColor(.primary)
                            Spacer()
                            Button(action: {
                                showSummary = true
                            }) {
                                Image(systemName: "chart.bar.xaxis")
                                    .font(.title)  // Make the icon bigger
                                    .foregroundColor(.gray)
                                    .padding()  // Add padding for a larger hit area
                                    .background(Circle().fill(Color.gray.opacity(0.1)))  // Optional background to make the button more noticeable
                                    .clipShape(Circle())  // Ensure it's circular
                            }
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Today: ₱\(viewModel.dailyTotal, specifier: "%.2f")")
                            Text("This Week: ₱\(viewModel.weeklyTotal, specifier: "%.2f")")
                            Text("This Month: ₱\(viewModel.monthlyTotal, specifier: "%.2f")")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Divider()

                        // MARK: - Goal Progress
                        let percentage = min(viewModel.monthlyTotal / viewModel.monthlyGoal, 1.0)
                        let overGoal = viewModel.monthlyTotal > viewModel.monthlyGoal
                        let progressColor = overGoal ? Color.accentOrangeRed : Color.savingGreen
                        let animatedProgress = min(viewModel.monthlyTotal, viewModel.monthlyGoal)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Monthly Limit: ₱\(viewModel.monthlyGoal, specifier: "%.0f")")
                                .font(.subheadline.bold())

                            ProgressView(value: animatedProgress, total: viewModel.monthlyGoal)
                                .tint(progressColor)
                                .scaleEffect(x: 1, y: 2, anchor: .center)
                                .animation(.easeInOut(duration: 0.4), value: viewModel.monthlyTotal)

                            Text("\(Int(percentage * 100))% of your limit")
                                .font(.caption)
                                .foregroundColor(overGoal ? .accentOrangeRed : .gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)

                    // MARK: - Expense List
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recent Expenses")
                            .font(.title3.bold())
                            .padding(.horizontal)

                        ForEach(viewModel.expenses.reversed()) { expense in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text("₱\(expense.amount, specifier: "%.2f")")
                                        .font(.headline)
                                        .foregroundColor(.accentOrangeRed)
                                    Spacer()
                                    Text(expense.category)
                                        .font(.subheadline)
                                        .foregroundColor(.textGrey)
                                }

                                if !expense.note.isEmpty {
                                    Text(expense.note)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.03), radius: 4, x: 0, y: 2)
                            .padding(.horizontal)
                            .transition(.slide)
                            .onTapGesture {
                                selectedExpense = expense
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .background(Color.backgroundBeige.ignoresSafeArea())
            .navigationTitle("SpendLog") // Navigation title will automatically be displayed
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { showingAdd = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.accentOrangeRed)
                    }
                    Button(action: { showingCategoryManager = true }) {
                        Image(systemName: "folder.fill")
                            .font(.title2)
                            .foregroundColor(.textGrey)
                    }
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddExpenseView(viewModel: viewModel)
            }
            .sheet(isPresented: $showingCategoryManager) {
                CategoryManagerView(viewModel: viewModel)
            }
            .sheet(item: $selectedExpense) { expense in
                EditExpenseView(viewModel: viewModel, expense: expense)
            }
            .sheet(isPresented: $showSummary) {
                SpendingSummaryView(
                    monthlyTotal: viewModel.monthlyTotal,
                    yearlyTotal: viewModel.yearlyTotal,
                    highestSpendingDate: viewModel.highestSpendingDay?.date,
                    highestSpendingAmount: viewModel.highestSpendingDay?.total ?? 0
                )
            }
        }
    }
}
