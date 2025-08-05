import Foundation

class MessageParser {
    static func parseTransaction(from message: String) -> Transaction? {
        // Simple regex patterns for demo purposes
        // Example message: "Rs. 500 debited from your account"
        let patterns = [
            #"Rs\.?\s?(\d+(\.\d{1,2})?)\s?(debited|credited)"#,
            #"INR\s?(\d+(\.\d{1,2})?)\s?(debited|credited)"#
        ]

        for pattern in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
                let range = NSRange(location: 0, length: message.utf16.count)
                if let match = regex.firstMatch(in: message, options: [], range: range) {
                    if let amountRange = Range(match.range(at: 1), in: message),
                       let amount = Double(message[amountRange]) {
                        let typeRange = Range(match.range(at: 3), in: message)!
                        let typeString = String(message[typeRange]).lowercased()
                        let type: TransactionType = typeString == "credited" ? .earn : .spend

                        return Transaction(
                            amount: amount,
                            type: type,
                            category: "Uncategorized",
                            description: message,
                            date: Date(),
                            source: "message",
                            rawMessage: message
                        )
                    }
                }
            }
        }
        return nil
    }
}
