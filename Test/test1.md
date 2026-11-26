struct Transaction: Identifiable {

    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
}
protocol TransactionRepository {

    func fetchTransactions() async throws -> [Transaction]
}
final class MockTransactionRepository: TransactionRepository {

    var shouldFail = false
    var transactions: [Transaction] = [
        Transaction(title: "Salary", amount: 50000, date: .now),
        Transaction(title: "Amazon", amount: -1200, date: .now),
        Transaction(title: "Netflix", amount: -500, date: .now)
    ]

    func fetchTransactions() async throws -> [Transaction] {

        try await Task.sleep(for: .seconds(2))

        if shouldFail {
            throw URLError(.notConnectedToInternet)
        }

        return transactions
    }
}
