//
//  Expense.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI
import SwiftData

@Model
class Expense {
//    Expense properties
    var title: String
    var subTitle: String
    var amount: Double
    var date: Date
    /// Expense Category
    var category: Category?
    
    init(title: String, subTitle: String, amount: Double, date: Date, category: Category? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.category = category
    }
    
    /// Currency string
    @Transient ///@Transient macro is used to avoid storing properties on disk
    var currrencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: amount) ?? ""
    }
}
