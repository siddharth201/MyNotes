struct Transaction: Identifiable {

    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
}
