//
//  BuckWiseApp.swift
//  BuckWise
//
//  Created by Rohit Paul on 10/6/23.
//

import SwiftUI

@main
struct BuckWiseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// Setting up the container
        .modelContainer(for: [Expense.self, Category.self])
    }
}
