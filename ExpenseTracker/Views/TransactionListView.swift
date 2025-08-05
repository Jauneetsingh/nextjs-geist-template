import SwiftUI

struct TransactionListView: View {
    @State private var transactions: [Transaction] = []
    @State private var showDetail: Bool = false
    @State private var selectedTransaction: Transaction?

    var body: some View {
        NavigationStack {
            List(transactions) { transaction in
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.description)
                        .font(.headline)
                    Text(transaction.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        Text(String(format: "%.2f", transaction.amount))
                            .foregroundColor(transaction.type == .spend ? .red : .green)
                        Spacer()
                        Text(transaction.type == .spend ? "Spend" : "Earn")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(transaction.type == .spend ? Color.red.opacity(0.1) : Color.green.opacity(0.1))
                            .cornerRadius(4)
                    }
                }
                .padding(.vertical, 2)
                .onTapGesture {
                    selectedTransaction = transaction
                    showDetail = true
                }
            }
            .navigationTitle("Transactions")
            .sheet(isPresented: $showDetail) {
                if let selectedTransaction = selectedTransaction {
                    TransactionDetailView(transaction: selectedTransaction)
                }
            }
            .onAppear {
                loadSampleData()
            }
        }
    }
    
    private func loadSampleData() {
        if transactions.isEmpty {
            transactions = [
                Transaction(amount: 25.50, type: .spend, category: "Food", description: "Coffee and sandwich", date: Date(), source: "manual"),
                Transaction(amount: 1200.00, type: .earn, category: "Salary", description: "Monthly salary", date: Date(), source: "manual"),
                Transaction(amount: 15.75, type: .spend, category: "Transport", description: "Bus fare", date: Date(), source: "manual")
            ]
        }
    }
}
