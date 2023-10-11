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
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                
                Text(expense.subTitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
            
            /// Currency string 
            Text(expense.currrencyString)
                .font(.title3.bold())
        }
    }
}
