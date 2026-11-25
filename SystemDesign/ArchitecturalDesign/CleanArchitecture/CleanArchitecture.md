
# Clean Architecture 

<details>
<summary>$\color{blue}{\huge{\textbf{How to Define Clean Architecture in an Interview}}}$</summary>  

A concise interview answer:

> Clean Architecture is a `software architecture pattern` proposed by Robert C. Martin that separates an application into `independent layers with clear responsibilities`. The goal is to make the application maintainable, testable, scalable, and independent of frameworks, UI, databases, and external services.
>
> The core rule is the **Dependency Rule**:
>
> **Dependencies always point inward toward the business logic.**
>
> Outer layers can depend on inner layers, but inner layers never depend on outer layers.

</details>

---

<details> 
<summary>$\color{blue}{\huge{\textbf{Why Do We Need Clean Architecture?}}}$</summary>  


#### Without it:

```text
View
  ↓
API Call
  ↓
Parsing
  ↓
Database
```

Problems:

* Difficult to test
* Difficult to replace API
* Difficult to change UI
* Business logic scattered everywhere
    
    
[Explaination](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Problem_Without_CleanArchitecture.md)

---

#### With Clean Architecture:

```text
Presentation
      ↓
Domain
      ↓
Data
```

Each layer has one responsibility.  

</details>

---
  
<details> 
<summary>$\color{blue}{\huge{\textbf{The Three Main Layers}}}$</summary>

```text
┌──────────────────────┐
│    Presentation      │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│       Domain         │
└──────────┬───────────┘
           ↓
┌──────────────────────┐
│        Data          │
└──────────────────────┘
```

---

# 1. Presentation Layer

## Purpose

Responsible for:

* UI
* User interactions
* State management

In SwiftUI:

```swift
View
ViewModel
```

Examples:

```swift
ProductView
ProductViewModel
```

Presentation layer should never know:

* URLSession
* CoreData
* Firebase

It only talks to Use Cases.

---

# 2. Domain Layer

Most important layer.

Contains:

```text
Entities
UseCases
Repository Protocols
```

---

## Entity

Represents business data.

Example:

```swift
struct Product {
    let id: Int
    let name: String
}
```

Entity should not know:

```swift
SwiftUI
UIKit
CoreData
URLSession
```

Entity is pure Swift.

---

## Use Case

Represents a business action.

Examples:

```text
FetchProducts
LoginUser
PlaceOrder
```

Example:

```swift
protocol FetchProductsUseCase {
    func execute() async throws -> [Product]
}
```

Use Case contains business rules.

<details>
<summary><b>Is UseCases same as Business logic, are these only protocols or implementation also</b></summary>

**Use Cases are not synonymous with *all* business logic; rather, they are the orchestrators of application-specific business logic**, and they typically include **both a protocol (interface) and a concrete implementation** living inside the Domain Layer.

### 1. Are Use Cases the Same as Business Logic?

Business logic in Clean Architecture is split into two distinct levels:

* **Enterprise Business Logic (Entities):** Core rules that belong to a single data model and remain true across your entire company—even if you built a completely different app.
* *Example:* A `BankAccount` entity knowing how to check `hasSufficientFunds(for: amount)` or calculate simple interest.


* **Application Business Logic (Use Cases / Interactors):** Specific user actions or workflows that coordinate entities and repositories to accomplish a single task in your app.
* *Example:* `TransferMoneyUseCase` fetches both accounts via a repository, checks KYC verification limits, deducts the amount, applies a transfer fee, and saves the updated balances.



Think of **Entities** as the nouns (the core rules of the objects) and **Use Cases** as the verbs (what the user or system actually *does* with those objects).

---

### 2. Are Use Cases Only Protocols or Implementation Also?

Unlike **Repositories** (where the protocol lives in the Domain Layer and the implementation lives in the Data Layer), **a Use Case has both its protocol and its concrete implementation inside the Domain Layer.**

Because a Use Case contains pure business rules—and no UIKit/SwiftUI, `URLSession`, or CoreData code—it has zero external framework dependencies and belongs completely in the Domain Layer.

#### Example in Swift

```swift
// MARK: - Domain Layer

// 1. Protocol (Interface)
// Allows the ViewModel to depend on an abstraction, making the ViewModel easy to unit test with mocks.
protocol TransferMoneyUseCaseProtocol {
    func execute(from sourceID: String, to destinationID: String, amount: Double) async throws -> Receipt
}

// 2. Concrete Implementation (Also in the Domain Layer!)
// Contains the actual business logic, talking only to Domain Entities and Repository Protocols.
final class TransferMoneyUseCase: TransferMoneyUseCaseProtocol {
    private let accountRepository: AccountRepositoryProtocol // Data Layer abstraction

    init(accountRepository: AccountRepositoryProtocol) {
        self.accountRepository = accountRepository
    }

    func execute(from sourceID: String, to destinationID: String, amount: Double) async throws -> Receipt {
        // Application Business Logic
        guard amount > 0 else {
            throw TransferError.invalidAmount
        }

        var sourceAccount = try await accountRepository.fetchAccount(id: sourceID)
        var destinationAccount = try await accountRepository.fetchAccount(id: destinationID)

        // Delegating Enterprise Business Logic to the Entity
        guard sourceAccount.canWithdraw(amount: amount) else {
            throw TransferError.insufficientFunds
        }

        sourceAccount.withdraw(amount: amount)
        destinationAccount.deposit(amount: amount)

        try await accountRepository.save(sourceAccount)
        try await accountRepository.save(destinationAccount)

        return Receipt(amount: amount, date: Date())
    }
}

```

### Summary Comparison: Use Case vs. Repository

| Component | Protocol Location | Implementation Location | Why? |
| --- | --- | --- | --- |
| **Use Case** | **Domain Layer** | **Domain Layer** | Pure business logic with no external framework dependencies. The protocol exists primarily so you can mock the Use Case when testing your ViewModel. |
| **Repository** | **Domain Layer** | **Data Layer** | The Domain layer defines *what* data it needs (the protocol), while the Data layer handles *how* to get it using `URLSession`, CoreData, or SwiftData (the implementation). |

*(Note: In smaller projects, some teams skip the `UseCaseProtocol` and inject the concrete `TransferMoneyUseCase` directly into the ViewModel, mocking the `AccountRepositoryProtocol` underneath during tests instead.)*
</details>
---

## Repository Protocol

Defines what data is needed.

Example:

```swift
protocol ProductRepository {
    func fetchProducts() async throws -> [Product]
}
```

Notice:

Domain layer does not know where data comes from.

Could be:

* API
* Cache
* CoreData
* Mock

Domain doesn't care.

---

# 3. Data Layer

Responsible for data sources.

Contains:

```text
API
Database
Repository Implementation
DTOs
```

---

Example:

```swift
class ProductRepositoryImpl: ProductRepository {
}
```

This layer knows:

```swift
URLSession
CoreData
Firebase
```
</details>  

---


<details> 
<summary>$\color{blue}{\huge{\textbf{Dependency Rule}}}$</summary>  

Most important interview point.

```text
Presentation
      ↓
Domain
      ↓
Data
```

Allowed:

```swift
ViewModel
  ↓
UseCase
  ↓
RepositoryProtocol
```

Not allowed:

```swift
UseCase
  ↓
SwiftUI
```

or

```swift
Entity
  ↓
URLSession
```  

[Explaination](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Chapter-2_UDD.md)

</details>  

---

<details> 
<summary>$\color{blue}{\huge{\textbf{Complete Example}}}$</summary> 

Let's build:

## Product List Screen

Flow:

```text
User opens screen
        ↓
ViewModel
        ↓
UseCase
        ↓
Repository
        ↓
API
        ↓
Response
        ↑
Repository
        ↑
UseCase
        ↑
ViewModel
        ↑
View
```

---

# Folder Structure

```text
Presentation
 ├── ProductView
 └── ProductViewModel

Domain
 ├── Entity
 │    └── Product
 ├── UseCases
 │    └── FetchProductsUseCase
 └── Repository
      └── ProductRepository

Data
 ├── API
 │    └── ProductAPIService
 ├── DTO
 │    └── ProductDTO
 └── Repository
      └── ProductRepositoryImpl
```

---

# Domain Layer

## Entity

```swift
struct Product: Identifiable {
    let id: Int
    let title: String
}
```

---

## Repository Protocol

```swift
protocol ProductRepository {
    func fetchProducts() async throws -> [Product]
}
```

---

## Use Case

```swift
protocol FetchProductsUseCase {
    func execute() async throws -> [Product]
}
```

---

## Use Case Implementation

```swift
final class FetchProductsUseCaseImpl: FetchProductsUseCase {

    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Product] {
        try await repository.fetchProducts()
    }
}
```

---

# Data Layer

## DTO

```swift
struct ProductDTO: Decodable {
    let id: Int
    let title: String
}
```

---

## API Service

To keep it runnable, use dummy data:

```swift
protocol ProductAPIService {
    func fetchProducts() async throws -> [ProductDTO]
}
```

---

```swift
final class ProductAPIServiceImpl: ProductAPIService {

    func fetchProducts() async throws -> [ProductDTO] {

        try await Task.sleep(for: .seconds(1))

        return [
            ProductDTO(id: 1, title: "iPhone"),
            ProductDTO(id: 2, title: "MacBook"),
            ProductDTO(id: 3, title: "iPad")
        ]
    }
}
```

---

## Repository Implementation

```swift
final class ProductRepositoryImpl: ProductRepository {

    private let api: ProductAPIService

    init(api: ProductAPIService) {
        self.api = api
    }

    func fetchProducts() async throws -> [Product] {

        let dtos = try await api.fetchProducts()

        return dtos.map {
            Product(
                id: $0.id,
                title: $0.title
            )
        }
    }
}
```

Notice:

```text
DTO → Entity
```

mapping happens here.

---

# Presentation Layer

## ViewModel

```swift
@MainActor
final class ProductViewModel: ObservableObject {

    @Published var products: [Product] = []

    private let useCase: FetchProductsUseCase

    init(useCase: FetchProductsUseCase) {
        self.useCase = useCase
    }

    func loadProducts() async {

        do {
            products = try await useCase.execute()
        } catch {
            print(error)
        }
    }
}
```

---

## View

```swift
struct ProductView: View {

    @StateObject private var viewModel: ProductViewModel

    init(viewModel: ProductViewModel) {
        _viewModel = StateObject(
            wrappedValue: viewModel
        )
    }

    var body: some View {

        List(viewModel.products) { product in
            Text(product.title)
        }
        .task {
            await viewModel.loadProducts()
        }
    }
}
```

---

# Dependency Injection

In App Entry:

```swift
@main
struct DemoApp: App {

    var body: some Scene {

        WindowGroup {

            let api = ProductAPIServiceImpl()

            let repository = ProductRepositoryImpl(
                api: api
            )

            let useCase = FetchProductsUseCaseImpl(
                repository: repository
            )

            let viewModel = ProductViewModel(
                useCase: useCase
            )

            ProductView(
                viewModel: viewModel
            )
        }
    }
}
```

---

# Data Flow Diagram

```text
ProductView
      ↓
ProductViewModel
      ↓
FetchProductsUseCase
      ↓
ProductRepository
      ↓
ProductAPIService
      ↓
Network
```

Response:

```text
Network
      ↑
ProductAPIService
      ↑
ProductRepository
      ↑
FetchProductsUseCase
      ↑
ProductViewModel
      ↑
ProductView
```

---

# Interview Explanation in 30 Seconds

> In Clean Architecture, I separate the app into Presentation, Domain, and Data layers. Presentation contains SwiftUI Views and ViewModels, Domain contains Entities, Use Cases, and Repository Protocols, while Data contains API services, database implementations, DTOs, and Repository implementations. The Dependency Rule ensures dependencies point inward toward the Domain layer. This makes the application highly testable, maintainable, and allows us to swap implementations such as APIs or databases without affecting business logic.

</details>

