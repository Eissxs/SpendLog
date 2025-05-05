//
//  SpendingSummaryView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI
import Charts

struct SpendingSummaryView: View {
    let monthlyTotal: Double
    let yearlyTotal: Double
    let highestSpendingDate: Date?
    let highestSpendingAmount: Double

    var body: some View {
        VStack(spacing: 24) {
            // Title with more bottom padding
            Text("Spending Summary")
                .font(.title3.bold())
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)

            // Info Section
            VStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text("This Month")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    Text("₱\(String(format: "%.2f", monthlyTotal))")
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                }

                VStack(spacing: 4) {
                    Text("This Year")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    Text("₱\(String(format: "%.2f", yearlyTotal))")
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                }

                if let date = highestSpendingDate {
                    VStack(spacing: 4) {
                        Text("Most Spent On")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        Text(date.formatted(date: .abbreviated, time: .omitted))
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        Text("₱\(String(format: "%.2f", highestSpendingAmount))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
            }

            // Bar Chart for Totals
            Chart {
                BarMark(
                    x: .value("Category", "This Month"),
                    y: .value("Amount", monthlyTotal)
                )
                .foregroundStyle(Color.purple.opacity(0.4))

                BarMark(
                    x: .value("Category", "This Year"),
                    y: .value("Amount", yearlyTotal)
                )
                .foregroundStyle(Color.green.opacity(0.4))
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
            .padding(.top)

            // Line Chart for Most Spent On (if available)
            if let date = highestSpendingDate {
                Chart {
                    LineMark(
                        x: .value("Date", date),
                        y: .value("Amount", highestSpendingAmount)
                    )
                    .foregroundStyle(Color.orange.opacity(0.6))
                    .symbol(Circle())
                    .symbolSize(60)
                }
                .chartXAxis {
                    AxisMarks(values: [date]) {
                        AxisValueLabel(format: .dateTime.day().month())
                    }
                }
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .padding(.top, 12)
            }

            Spacer()
        }
        .padding()
    }
}
