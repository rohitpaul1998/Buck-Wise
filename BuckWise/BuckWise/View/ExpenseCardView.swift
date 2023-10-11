//
//  ExpenseCardView.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI

struct ExpenseCardView: View {
    @Bindable var expense: Expense /// SwiftData objects conform to @Observable
    ///, so we can use them as bindable objects too. In this project, there is no use for the bindable object , but we can make use of it.
    var displayTag: Bool = true
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                
                Text(expense.subTitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                if let categorName = expense.category?.categoryName, displayTag {
                    Text(categorName)
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.red.gradient, in: .capsule)
                }
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
            
            /// Currency string 
            Text(expense.currrencyString)
                .font(.title3.bold())
        }
    }
}
