//
//  GroupedExpense.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI

struct GroupedExpenses: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
}
