//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Godson on 17/08/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
   @StateObject var transactionListVM = TransactionListViewModal()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
