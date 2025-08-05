import SwiftUI

struct TransactionListView: View {
    @State private var transactions: [Transaction] = []
    @State private var showDetail: Bool = false
    @State private var selectedTransaction: Transaction?

    var body: some View {
        NavigationView {
            List(transactions) { transaction in
                VStack(alignment: .leading) {
                    Text(transaction.description)
                        .font(.headline)
                    Text(transaction.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(String(format: "%.2f", transaction.amount))
                        .foregroundColor(transaction.type == .spend ? .red : .green)
                }
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
        }
    }
}
