import SwiftUI

struct TransactionDetailView: View {
    @State var transaction: Transaction
    @Environment(\.presentationMode) var presentationMode

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
            .navigationBarTitle("Edit Transaction", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                transaction.description = descriptionText
                transaction.category = selectedCategory
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                descriptionText = transaction.description
                selectedCategory = transaction.category
            }
        }
    }
}
