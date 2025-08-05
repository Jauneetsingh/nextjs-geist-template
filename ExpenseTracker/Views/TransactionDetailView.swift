import SwiftUI

struct TransactionDetailView: View {
    @State var transaction: Transaction
    @Environment(\.dismiss) private var dismiss

    @State private var selectedCategory: String = ""
    @State private var descriptionText: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Details")) {
                    Text("Amount: \(String(format: "%.2f", transaction.amount))")
                    TextField("Description", text: $descriptionText)
                    Picker("Category", selection: $selectedCategory) {
                        Text("Select Category").tag("")
                        Text("Food").tag("Food")
                        Text("Transport").tag("Transport")
                        Text("Shopping").tag("Shopping")
                        Text("Salary").tag("Salary")
                        Text("Others").tag("Others")
                    }
                }
            }
            .navigationTitle("Edit Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        transaction.description = descriptionText
                        transaction.category = selectedCategory
                        dismiss()
                    }
                }
            }
            .onAppear {
                descriptionText = transaction.description
                selectedCategory = transaction.category
            }
        }
    }
}
