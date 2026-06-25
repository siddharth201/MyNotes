
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

# The Three Main Layers

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

---

# Dependency Rule

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

---

# Complete Example

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

If you're comfortable with this foundation, the next step is understanding **why Repository Protocol lives in Domain, Repository Implementation lives in Data, and why DTO and Entity must be separate**, because that's where most interviewers start asking deeper questions.

