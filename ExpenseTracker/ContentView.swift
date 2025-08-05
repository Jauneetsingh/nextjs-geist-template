import SwiftUI

struct ContentView: View {
    @StateObject private var messageListener = MessageListener()
    @State private var transactions: [Transaction] = []
    @State private var showAddTransaction = false
    @State private var showDetail = false
    @State private var selectedTransaction: Transaction?
    
    var body: some View {
        NavigationStack {
            VStack {
                // Summary Cards
                HStack(spacing: 16) {
                    SummaryCard(
                        title: "Total Spent",
                        amount: totalSpent,
                        color: .red
                    )
                    SummaryCard(
                        title: "Total Earned",
                        amount: totalEarned,
                        color: .green
                    )
                }
                .padding(.horizontal)
                
                // Transactions List
                List(transactions) { transaction in
                    TransactionRow(transaction: transaction)
                        .onTapGesture {
                            selectedTransaction = transaction
                            showDetail = true
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Expense Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTransaction = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTransaction) {
                AddTransactionView { transaction in
                    transactions.append(transaction)
                }
            }
            .sheet(isPresented: $showDetail) {
                if let selectedTransaction = selectedTransaction {
                    TransactionDetailView(transaction: selectedTransaction)
                }
            }
            .onAppear {
                loadSampleData()
            }
            .onChange(of: messageListener.newTransaction) { newTransaction in
                if let transaction = newTransaction {
                    transactions.append(transaction)
                    // Show categorization popup for new transactions
                    selectedTransaction = transaction
                    showDetail = true
                }
            }
        }
    }
    
    private var totalSpent: Double {
        transactions.filter { $0.type == .spend }.reduce(0) { $0 + $1.amount }
    }
    
    private var totalEarned: Double {
        transactions.filter { $0.type == .earn }.reduce(0) { $0 + $1.amount }
    }
    
    private func loadSampleData() {
        if transactions.isEmpty {
            transactions = [
                Transaction(amount: 25.50, type: .spend, category: "Food", description: "Coffee and sandwich", date: Date(), source: "manual"),
                Transaction(amount: 1200.00, type: .earn, category: "Salary", description: "Monthly salary", date: Date(), source: "manual"),
                Transaction(amount: 15.75, type: .spend, category: "Transport", description: "Bus fare", date: Date(), source: "manual"),
                Transaction(amount: 85.00, type: .spend, category: "Shopping", description: "Groceries", date: Date(), source: "manual"),
                Transaction(amount: 500.00, type: .earn, category: "Others", description: "Freelance work", date: Date(), source: "manual")
            ]
        }
    }
}

struct SummaryCard: View {
    let title: String
    let amount: Double
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(String(format: "$%.2f", amount))
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.description)
                    .font(.headline)
                Text(transaction.category)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(DateFormatter.shortDate.string(from: transaction.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(String(format: "$%.2f", transaction.amount))
                    .font(.headline)
                    .foregroundColor(transaction.type == .spend ? .red : .green)
                
                Text(transaction.type == .spend ? "Spend" : "Earn")
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(transaction.type == .spend ? Color.red.opacity(0.1) : Color.green.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 4)
    }
}

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    let onSave: (Transaction) -> Void
    
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var selectedType: TransactionType = .spend
    @State private var selectedCategory: String = "Others"
    
    private let categories = ["Food", "Transport", "Shopping", "Salary", "Others"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Details")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Description", text: $description)
                    
                    Picker("Type", selection: $selectedType) {
                        Text("Spend").tag(TransactionType.spend)
                        Text("Earn").tag(TransactionType.earn)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                }
            }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveTransaction()
                    }
                    .disabled(amount.isEmpty || description.isEmpty)
                }
            }
        }
    }
    
    private func saveTransaction() {
        guard let amountValue = Double(amount) else { return }
        
        let transaction = Transaction(
            amount: amountValue,
            type: selectedType,
            category: selectedCategory,
            description: description,
            date: Date(),
            source: "manual"
        )
        
        onSave(transaction)
        dismiss()
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

#Preview {
    ContentView()
}
