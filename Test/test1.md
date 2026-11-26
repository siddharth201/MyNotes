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
enum TransactionViewState {

    case loading
    case loaded([Transaction])
    case empty
    case failed(String)
}
@MainActor
final class TransactionViewModel: ObservableObject {

    @Published private(set) var state: TransactionViewState = .loading

    private let repository: TransactionRepository

    init(repository: TransactionRepository) {
        self.repository = repository
    }

    func loadTransactions() async {

        state = .loading

        do {
            let transactions = try await repository.fetchTransactions()

            state = transactions.isEmpty
                ? .empty
                : .loaded(transactions)

        } catch {
            state = .failed(error.localizedDescription)
        }
    }

    func retry() async {
        await loadTransactions()
    }
}
struct TransactionRowView: View {

    let transaction: Transaction

    var body: some View {

        HStack {

            VStack(alignment: .leading) {

                Text(transaction.title)
                    .font(.headline)

                Text(transaction.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(
                transaction.amount,
                format: .currency(code: "INR")
            )
            .font(.headline)
        }
        .padding(.vertical, 8)
    }
}
