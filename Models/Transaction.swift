import Foundation

enum TransactionType: String, Codable {
    case spend
    case earn
}

struct Transaction: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var type: TransactionType
    var category: String
    var description: String
    var date: Date
    var source: String
    var rawMessage: String?
}
