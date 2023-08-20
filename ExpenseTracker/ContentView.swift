//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Godson on 17/08/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModal
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "INR")), type: .title, format: "$%02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                          
                              
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                     
                        
                        RecentTransactionsList()
                    }
                  
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModal = {
        let transactionListVM = TransactionListViewModal()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }

}