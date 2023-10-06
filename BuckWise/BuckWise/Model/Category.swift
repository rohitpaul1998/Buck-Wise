//
//  Category.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI
import SwiftData


@Model
class Category {
    var categoryName: String
    /// Category expenses
    @Relationship(deleteRule: .cascade, inverse: \Expense.category) // the use of this relationship macro is to
    // define and delete rules for swiftdata properties. So when we delete a certain category, all associated expenses
    // will also be deleted
    var expenses: [Expense]?
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
    
}

