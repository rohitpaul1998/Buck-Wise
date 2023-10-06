//
//  ExpensesView.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    /// Grouped expenses properties - in order to create a separate grouped expense model
    /// and manually split the expenses based on day wise and display it for users.
    @Query(sort: [
        SortDescriptor(\Expense.date, order: .reverse)
    ], animation: .snappy) private var allExpenses: [Expense]
    /// Grouped Expenses
    @State private var groupedExpenses: [GroupedExpenses] = []
    @State private var addExpense: Bool = false
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Expenses")
            .overlay {
                if allExpenses.isEmpty || groupedExpenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "tray.fill")
                    }
                }
            }
            /// New category add button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addExpense.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
        }
        .onChange(of: allExpenses, initial: true) { oldValue, newValue in
            if groupedExpenses.isEmpty {
                createGroupedExpenses(newValue)
            }
        }
        .sheet(isPresented: $addExpense) {
            AddExpenseView()
        }
    }
    /// Creating grouped expenses (Grouping by date)
    func createGroupedExpenses(_ expenses: [Expense]) {
        Task.detached(priority: .high) { ///this method is called to avoid UI lags when processing large sets of data, I'm grouping an splitting them into detached tasks.
            let groupedDict = Dictionary(grouping: expenses) { expense in
                let dateComponents = Calendar.current.dateComponents([.month, .day, .year], from: expense.date)
                
                return dateComponents
            }
            
            /// Sorting dictionary in descending order
            let sortedDict = groupedDict.sorted {
                let calendar = Calendar.current
                let date1 = calendar.date(from: $0.key) ?? .init()
                let date2 = calendar.date(from: $1.key) ?? .init()
                
                return calendar.compare(date1, to: date2, toGranularity: .day) == .orderedDescending
            }
            
            /// Adding to the grouped expenses array
            /// UI must be updated on main thread
            await MainActor.run {
                groupedExpenses = sortedDict.compactMap({ dict in
                    let date = Calendar.current.date(from: dict.key) ?? .init()
                    return .init(date: date, expenses: dict.value)
                })
            }
        }
    }
}

#Preview {
    ExpensesView()
}
