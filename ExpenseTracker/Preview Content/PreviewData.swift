//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Godson on 17/08/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "27/6/2021", institution: "Desjardins" , account: "Visa desjardin" , merchant: "Apple", amount: 9067.23, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
