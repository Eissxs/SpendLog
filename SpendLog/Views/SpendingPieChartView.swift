//
//  SpendingPieChartView.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI
import Charts

struct SpendingPieChartView: View {
    let expenses: [Expense]

    // Pastel colors to match app theme
    let pastelColors: [Color] = [
        Color(red: 255/255, green: 204/255, blue: 204/255), // Soft Pink
        Color(red: 204/255, green: 229/255, blue: 255/255), // Light Blue
        Color(red: 204/255, green: 255/255, blue: 229/255), // Mint Green
        Color(red: 255/255, green: 255/255, blue: 204/255), // Light Yellow
        Color(red: 229/255, green: 204/255, blue: 255/255), // Lavender
        Color(red: 255/255, green: 229/255, blue: 204/255)  // Peach
    ]

    @State private var animateChart = false

    var categoryTotals: [(category: String, total: Double)] {
        Dictionary(grouping: expenses, by: { $0.category })
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
            .sorted { $0.value > $1.value }
            .map { ($0.key, $0.value) }
    }

    var totalAmount: Double {
        categoryTotals.reduce(0) { $0 + $1.total }
    }

    var body: some View {
        Chart {
            ForEach(Array(categoryTotals.enumerated()), id: \.element.category) { index, element in
                SectorMark(
                    angle: .value("Amount", animateChart ? element.total : 0),
                    innerRadius: .ratio(0.6),
                    angularInset: 1.5
                )
                .foregroundStyle(pastelColors[index % pastelColors.count])
                .shadow(radius: 6) // Adding shadow for a modern minimalist look
                .annotation(position: .overlay, alignment: .center) {
                    if element.total > 0 {
                        VStack {
                            Text(element.category)
                                .font(.body) // Increased font size for the name
                                .foregroundColor(.primary)
                                .opacity(0.8)
                            Text(String(format: "%.1f%%", (element.total / totalAmount) * 100))
                                .font(.headline) // Increased font size for the percentage
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .chartLegend(.hidden)
        .frame(height: 240)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                animateChart = true
            }
        }
        .onChange(of: expenses) { _ in
            animateChart = false
            withAnimation(.easeOut(duration: 0.6)) {
                animateChart = true
            }
        }
    }
}
