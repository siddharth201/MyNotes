
# Clean Architecture

## ✅ 1. Interview-Friendly Definition (Short & Strong)

> **Clean Architecture** is a software design approach that organizes code into layers with clear responsibilities and strict dependency rules, so that **business logic is independent of UI, frameworks, and external services**, making the system easy to test, maintain, and scale.

Even shorter:

> Clean Architecture separates an app into layers where inner layers contain business rules and outer layers contain implementation details, and dependencies always point inward.

---

## ✅ 2. Core Principle (Very Important)

### Dependency Rule

👉 **Outer layers can depend on inner layers**
👉 **Inner layers must NEVER depend on outer layers**

```
Presentation → Domain → Data → Infrastructure
```

Domain knows nothing about UI, networking, database, or frameworks.

---

## ✅ 3. High-Level Layers in iOS Clean Architecture

Most iOS implementations use:

1. Presentation Layer (UI)
2. Domain Layer (Business Logic)
3. Data Layer (Repositories)
4. Infrastructure Layer (Networking / DB / Services)

Sometimes Infrastructure is merged into Data, but conceptually it's useful to separate.

---

## ✅ 4. Layer Responsibilities

---

## 🔵 Presentation Layer (UI Layer)

### What it contains

* SwiftUI Views / UIViewControllers
* ViewModels
* UI State
* User Interaction Handling

### What it does

* Displays data
* Sends user actions to ViewModel
* Does NOT contain business rules

### What it must NOT do

❌ Call APIs directly
❌ Contain business logic

### Interview Definition

> Presentation layer is responsible only for rendering UI and reacting to user inputs by delegating work to the domain layer through ViewModels.

---

## 🟡 Domain Layer (Business Layer)

### What it contains

* Entities (Models)
* Use Cases / Interactors
* Repository Protocols

### What it does

* Contains business rules
* Defines WHAT app can do

### What it must NOT know

❌ UI
❌ Networking
❌ Database
❌ Frameworks

### Interview Definition

> Domain layer contains pure business logic and policies of the application, completely independent of external frameworks.

---

## 🟠 Data Layer

### What it contains

* Repository Implementations
* DTOs
* Mappers

### What it does

* Implements domain repository protocols
* Decides where data comes from (API, cache, DB)

### Interview Definition

> Data layer provides concrete implementations of repositories and transforms external data into domain models.

---

## 🔴 Infrastructure Layer

### What it contains

* API Clients
* Network Service
* Persistence (CoreData, Realm, File system)

### What it does

* Talks to outside world

### Interview Definition

> Infrastructure layer contains low-level technical details such as networking and storage.

---

## ✅ 5. Keywords Explained (Interview Focus)

---

### Entity

Business object.

Example:

```
User
```

Represents a real-world concept.

---

### Use Case

Single business action.

Examples:

```
GetUsers
LoginUser
CreateOrder
```

Each use case does ONE thing.

---

### Repository (Abstraction)

Protocol describing how data is accessed.

```
protocol UserRepository
```

Not implementation.

---

### DTO (Data Transfer Object)

Model used for API or DB.

```
UserDTO
```

Not used directly by UI.

---

### Mapper

Converts DTO → Entity.

---

### Dependency Injection

Passing dependencies instead of creating inside.

```
init(repository: UserRepository)
```

---

### Separation of Concerns

Each class has only ONE responsibility.

---

## ✅ 6. Folder Structure (Production-Style)

```
App
│
├── Presentation
│   ├── Users
│   │   ├── UsersView.swift
│   │   ├── UsersViewModel.swift
│
├── Domain
│   ├── Entities
│   │   └── User.swift
│   ├── UseCases
│   │   └── GetUsersUseCase.swift
│   └── Repositories
│       └── UserRepository.swift
│
├── Data
│   ├── DTOs
│   │   └── UserDTO.swift
│   ├── Mappers
│   │   └── UserMapper.swift
│   └── Repositories
│       └── UserRepositoryImpl.swift
│
└── Infrastructure
    └── Network
        ├── APIClient.swift
        └── Endpoints.swift
```

---

## ✅ 7. Production Grade Example

API:
[https://jsonplaceholder.typicode.com/users](https://jsonplaceholder.typicode.com/users)

---

---

## 🟡 DOMAIN LAYER

---

### Entity

```swift
struct User {
    let id: Int
    let name: String
    let email: String
}
```

---

### Repository Protocol

```swift
protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
```

---

### Use Case

```swift
protocol GetUsersUseCase {
    func execute() async throws -> [User]
}

final class GetUsersUseCaseImpl: GetUsersUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> [User] {
        return try await repository.fetchUsers()
    }
}
```

---

## 🔴 INFRASTRUCTURE LAYER

---

### API Client

```swift
protocol APIClient {
    func get<T: Decodable>(_ url: String) async throws -> T
}

final class URLSessionAPIClient: APIClient {

    func get<T: Decodable>(_ url: String) async throws -> T {
        let url = URL(string: url)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
```

---

## 🟠 DATA LAYER

---

### DTO

```swift
struct UserDTO: Decodable {
    let id: Int
    let name: String
    let email: String
}
```

---

### Mapper

```swift
struct UserMapper {

    static func map(dto: UserDTO) -> User {
        return User(
            id: dto.id,
            name: dto.name,
            email: dto.email
        )
    }
}
```

---

### Repository Implementation

```swift
final class UserRepositoryImpl: UserRepository {

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchUsers() async throws -> [User] {
        let dtos: [UserDTO] =
          try await apiClient.get("https://jsonplaceholder.typicode.com/users")

        return dtos.map { UserMapper.map(dto: $0) }
    }
}
```

---

## 🔵 PRESENTATION LAYER

---

### ViewModel

```swift
@MainActor
final class UsersViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: String?

    private let getUsersUseCase: GetUsersUseCase

    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }

    func loadUsers() async {
        isLoading = true
        do {
            users = try await getUsersUseCase.execute()
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
```

---

### SwiftUI View

```swift
struct UsersView: View {

    @StateObject var viewModel: UsersViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}
```

---

## 🧩 Dependency Injection (Composition Root)

Usually in App file:

```swift
@main
struct CleanApp: App {

    var body: some Scene {
        WindowGroup {

            let apiClient = URLSessionAPIClient()
            let repository = UserRepositoryImpl(apiClient: apiClient)
            let useCase = GetUsersUseCaseImpl(repository: repository)
            let viewModel = UsersViewModel(getUsersUseCase: useCase)

            UsersView(viewModel: viewModel)
        }
    }
}
```

---

## ✅ 8. How Data Flows (Important Interview Diagram)

```
View
  ↓
ViewModel
  ↓
UseCase
  ↓
Repository (protocol)
  ↓
RepositoryImpl
  ↓
APIClient
```

Return path is reversed.

---

## ✅ 9. Why Companies Like Clean Architecture

* Easy unit testing
* Replace UI without touching business logic
* Replace API without touching UI
* Better scalability
* Team parallel work

---

## ✅ 10. Common Interview Questions & Short Answers

---

### Q: Where is business logic?

**Domain Layer**

---

### Q: Can ViewModel call API directly?

**No**

---

### Q: Who knows URLSession?

**Infrastructure layer only**

---

### Q: Why repository protocol is in domain?

Because domain defines **what it needs**, not how it is done.

---

### Q: Is Clean Architecture heavy?

Initially yes, but pays off for medium-large apps.

---

---

## **Explain**

👉 Add **Unit Tests** for UseCase & ViewModel<br/>
👉 Add **Caching Layer**<br/>
👉 Convert to **MVVM + Clean + Combine**<br/>
👉 Add **Error Mapping**<br/>


Excellent 👍 — these three additions take your architecture from *basic clean* → *real production-grade clean*.

We will enhance the SAME architecture you already understood and **extend it step-by-step**:

---

## ✅ FINAL ARCHITECTURE (After Enhancements)

```
Presentation (SwiftUI + ViewModel + Combine)
        ↓
Domain (Entities, UseCases, Repositories, Errors)
        ↓
Data (RepositoryImpl, DTOs, Mappers)
        ↓
Infrastructure
   ├── Network
   └── Cache (NSMutableDictionary)
```

---

# PART 1️⃣ — ADD CACHING LAYER

---

## 🎯 Goal

Before hitting API:

1. Check cache
2. If found → return cached data
3. Else → fetch from API
4. Save into cache

---

## ✅ Infrastructure → Cache

### Cache Protocol

```swift
protocol CacheStore {
    func get(key: String) -> Any?
    func set(key: String, value: Any)
}
```

---

### NSMutableDictionary Cache

```swift
final class MemoryCacheStore: CacheStore {

    private let cache = NSMutableDictionary()

    func get(key: String) -> Any? {
        return cache.object(forKey: key)
    }

    func set(key: String, value: Any) {
        cache.setObject(value, forKey: key as NSString)
    }
}
```

---

## ✅ Update Repository Implementation

```swift
final class UserRepositoryImpl: UserRepository {

    private let apiClient: APIClient
    private let cache: CacheStore

    private let cacheKey = "users_cache"

    init(apiClient: APIClient,
         cache: CacheStore) {
        self.apiClient = apiClient
        self.cache = cache
    }

    func fetchUsers() async throws -> [User] {

        // 1. Check Cache
        if let cached = cache.get(key: cacheKey) as? [User] {
            return cached
        }

        // 2. API Call
        let dtos: [UserDTO] =
            try await apiClient.get("https://jsonplaceholder.typicode.com/users")

        let users = dtos.map { UserMapper.map(dto: $0) }

        // 3. Save Cache
        cache.set(key: cacheKey, value: users)

        return users
    }
}
```

---

## 🎤 Interview Line

> We introduced a cache store abstraction so repository can retrieve data from memory before network, improving performance and reducing API calls.

---

---

# PART 2️⃣ — MVVM + CLEAN + COMBINE

Currently we used `async/await`.

Now we move to **Combine publishers**.

---

## 🟡 DOMAIN

### Repository Protocol

```swift
import Combine

protocol UserRepository {
    func fetchUsers() -> AnyPublisher<[User], Error>
}
```

---

### UseCase

```swift
import Combine

protocol GetUsersUseCase {
    func execute() -> AnyPublisher<[User], Error>
}

final class GetUsersUseCaseImpl: GetUsersUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[User], Error> {
        repository.fetchUsers()
    }
}
```

---

## 🔴 INFRASTRUCTURE

### API Client

```swift
import Combine

protocol APIClient {
    func get<T: Decodable>(_ url: String) -> AnyPublisher<T, Error>
}
```

---

### URLSession Client

```swift
final class URLSessionAPIClient: APIClient {

    func get<T: Decodable>(_ url: String) -> AnyPublisher<T, Error> {

        let url = URL(string: url)!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
```

---

## 🟠 DATA LAYER

### Repository Implementation with Cache

```swift
import Combine

final class UserRepositoryImpl: UserRepository {

    private let apiClient: APIClient
    private let cache: CacheStore

    private let key = "users"

    init(apiClient: APIClient,
         cache: CacheStore) {
        self.apiClient = apiClient
        self.cache = cache
    }

    func fetchUsers() -> AnyPublisher<[User], Error> {

        if let cached = cache.get(key: key) as? [User] {
            return Just(cached)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        return apiClient
            .get("https://jsonplaceholder.typicode.com/users")
            .map { (dtos: [UserDTO]) in
                dtos.map { UserMapper.map(dto: $0) }
            }
            .handleEvents(receiveOutput: { [weak self] users in
                self?.cache.set(key: self?.key ?? "", value: users)
            })
            .eraseToAnyPublisher()
    }
}
```

---

## 🔵 PRESENTATION

### ViewModel (Combine)

```swift
import Combine

@MainActor
final class UsersViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var error: String?
    @Published var isLoading = false

    private let useCase: GetUsersUseCase
    private var cancellables = Set<AnyCancellable>()

    init(useCase: GetUsersUseCase) {
        self.useCase = useCase
    }

    func load() {

        isLoading = true

        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                self?.isLoading = false

                if case let .failure(error) = completion {
                    self?.error = error.localizedDescription
                }

            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
```

---

### SwiftUI View

```swift
.task {
    viewModel.load()
}
```

---

## 🎤 Interview Line

> ViewModel subscribes to use case publishers using Combine, making data flow reactive and allowing easy cancellation and binding.

---

---

## PART 3️⃣ — ERROR MAPPING (Production-Level)

We NEVER expose raw system errors to UI.

---

## 🟡 DOMAIN ERROR

```swift
enum AppError: Error {
    case network
    case decoding
    case server
    case unknown
}
```

---

## 🔴 INFRASTRUCTURE ERROR

```swift
enum NetworkError: Error {
    case badURL
    case invalidResponse
}
```

---

## 🟠 DATA → ERROR MAPPER

```swift
struct ErrorMapper {

    static func map(_ error: Error) -> AppError {

        if error is URLError {
            return .network
        }

        if error is DecodingError {
            return .decoding
        }

        return .unknown
    }
}
```

---

## 🟠 Update Repository

```swift
return apiClient
    .get("https://jsonplaceholder.typicode.com/users")
    .map { (dtos: [UserDTO]) in
        dtos.map(UserMapper.map)
    }
    .mapError { ErrorMapper.map($0) }
    .eraseToAnyPublisher()
```

---

## 🔵 ViewModel Handling

```swift
if case let .failure(error as AppError) = completion {
    self?.error = error.userMessage
}
```

---

## 🟡 Add User-Friendly Message

```swift
extension AppError {

    var userMessage: String {
        switch self {
        case .network:
            return "No Internet Connection"
        case .decoding:
            return "Data Error"
        case .server:
            return "Server Error"
        case .unknown:
            return "Something went wrong"
        }
    }
}
```

---

# 🎯 FINAL FLOW

```
View
 → ViewModel
 → UseCase
 → Repository
 → Cache
 → API
 → DTO
 → Mapper
 → Entity
 → ErrorMapper
 → AppError
 → ViewModel
 → View
```

---

# 🚀 WHAT YOU ACHIEVED

✔ Clean Architecture<br/>
✔ MVVM<br/>
✔ Combine<br/>
✔ In-Memory Cache<br/>
✔ Error Mapping<br/>
✔ Testable Code<br/>

This is **interview-ready architecture**.

---


# Q.for caching use ttl of 600, if data persist incache more than 600 invalidate it and use new data.  

Perfect 👍 — this is a **real-world enhancement**.

We will upgrade your cache from:

> Simple key → value
> to
> key → (value + timestamp)

and enforce:

👉 **TTL = 600 seconds (10 minutes)**
👉 If expired → ignore cache → fetch fresh → overwrite cache

---

## ✅ DESIGN

```
CacheEntry
 ├─ value
 └─ timestamp
```

---

## ✅ STEP 1 — Cache Entry Model

```swift
struct CacheEntry {
    let value: Any
    let timestamp: Date
}
```

---

## ✅ STEP 2 — Update Cache Protocol

```swift
protocol CacheStore {
    func get(key: String) -> Any?
    func set(key: String, value: Any)
    func remove(key: String)
}
```

---

## ✅ STEP 3 — Memory Cache With TTL (600 seconds)

```swift
final class MemoryCacheStore: CacheStore {

    private let cache = NSMutableDictionary()
    private let ttl: TimeInterval = 600   // 10 minutes

    func get(key: String) -> Any? {

        guard let entry = cache.object(forKey: key) as? CacheEntry else {
            return nil
        }

        let now = Date()
        let age = now.timeIntervalSince(entry.timestamp)

        // ❌ Expired
        if age > ttl {
            cache.removeObject(forKey: key)
            return nil
        }

        // ✅ Valid
        return entry.value
    }

    func set(key: String, value: Any) {

        let entry = CacheEntry(
            value: value,
            timestamp: Date()
        )

        cache.setObject(entry, forKey: key as NSString)
    }

    func remove(key: String) {
        cache.removeObject(forKey: key)
    }
}
```

---

## ✅ STEP 4 — Repository Remains SAME

Your repository code already checks cache first:

```swift
if let cached = cache.get(key: key) as? [User] {
    return Just(cached)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
}
```

🔥 Now this automatically respects TTL.

---

## ✅ STEP 5 — Full Repository With TTL Cache

```swift
func fetchUsers() -> AnyPublisher<[User], Error> {

    if let cached = cache.get(key: key) as? [User] {
        print("Serving from cache")
        return Just(cached)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    print("Fetching from API")

    return apiClient
        .get("https://jsonplaceholder.typicode.com/users")
        .map { (dtos: [UserDTO]) in
            dtos.map(UserMapper.map)
        }
        .mapError { ErrorMapper.map($0) }
        .handleEvents(receiveOutput: { [weak self] users in
            self?.cache.set(key: self?.key ?? "", value: users)
        })
        .eraseToAnyPublisher()
}
```

---

## 🎤 INTERVIEW LINE

> We implemented a time-based in-memory cache using NSMutableDictionary where each entry stores a timestamp. Repository first checks if cached data exists and is within TTL; otherwise, it fetches fresh data and updates the cache.

---

## ✅ WHY THIS IS PRODUCTION-GRADE

✔ Prevents stale data
✔ Avoids unnecessary API calls
✔ Simple & fast
✔ Easily extendable to disk cache

---

## 🧠 OPTIONAL IMPROVEMENTS (You can mention in interview)

* Different TTL per endpoint
* LRU eviction
* Background cleanup timer
* Disk + Memory hybrid cache

---

## 🔁 FINAL DATA FLOW WITH TTL

```
ViewModel
 → UseCase
 → Repository
 → Cache (check TTL)
     ├─ valid → return
     └─ expired → API
 → Save with timestamp
 → UI
```

--- 


# ✅ BIG IDEA

All Clean Architecture variants follow:

👉 **Dependency Rule**
👉 **Business logic inside, details outside**

The folder naming may differ, but responsibilities remain same.

---

## 🧱 VERSION YOU MENTIONED

```
📁 Presentation
📁 Domain
📁 Data
📁 Core
```

This is a **layered + shared core** model.

---

## 🧠 WHY ADD "CORE"?

Teams often extract **cross-cutting concerns** into Core:

* Networking engine
* Logger
* Cache
* DI Container
* Base errors
* Utilities

So Data and Presentation do not duplicate infrastructure code.

---

## 📁 PRESENTATION LAYER

### Contains

* SwiftUI Views / UIViewControllers
* ViewModels
* UI State models
* Navigation

### Does NOT Contain

❌ API  
  
❌ URLSession  

❌ DTO  

❌ Persistence  


---

### Flow

```
View → ViewModel → UseCase
```

---

### Interview Line

> Presentation layer handles UI and user interactions and communicates with domain layer through use cases.

---

## 📁 DOMAIN LAYER (Pure Business)

### Contains

* Entities
* UseCases
* Repository Protocols
* Domain Errors

### Does NOT Contain

❌ URLSession
❌ SwiftUI
❌ CoreData
❌ Alamofire

---

### Flow

```
UseCase → Repository (protocol)
```

---

### Interview Line

> Domain layer contains enterprise business rules and is independent of frameworks.

---

---

## 📁 DATA LAYER (Business Data Handling)

### Contains

* Repository Implementations
* Data Sources (Remote, Local)
* DTOs
* Mappers

### Does NOT Contain

❌ SwiftUI
❌ Business Rules

---

### Flow

```
RepositoryImpl → RemoteDataSource / LocalDataSource
```

---

### Interview Line

> Data layer implements repository contracts and decides where data comes from.

---

---

## 📁 CORE LAYER (Shared Infrastructure)

### Contains

* Networking engine
* Cache engine
* Logger
* DI container
* Base Error types
* Utilities

### Used By

```
Data Layer
Presentation Layer
```

But Core depends on NOTHING.

---

### Interview Line

> Core layer provides reusable technical building blocks shared across the app.

---

---

# ✅ HOW THIS MAPS TO PREVIOUS VERSION

| Old Version    | New Version  |
| -------------- | ------------ |
| Infrastructure | Core         |
| Data           | Data         |
| Domain         | Domain       |
| Presentation   | Presentation |

Only naming changed.

---

---

# 🎯 REALISTIC ENTERPRISE STRUCTURE

```
App
│
├── Presentation
│   └── Users
│       ├── UsersView.swift
│       └── UsersViewModel.swift
│
├── Domain
│   ├── Entities
│   ├── UseCases
│   └── Repositories
│
├── Data
│   ├── Repositories
│   ├── DTOs
│   └── Mappers
│
└── Core
    ├── Network
    ├── Cache
    ├── DI
    └── Utils
```

---

---

## 🔁 FULL DEPENDENCY DIRECTION

```
Presentation
     ↓
Domain
     ↓
Data
     ↓
Core
```

Only downward.

No reverse arrows.

---

---

## 🔥 EXAMPLE FLOW (Users API)

```
UsersView
 → UsersViewModel
 → GetUsersUseCase
 → UserRepository (protocol)
 → UserRepositoryImpl
 → RemoteDataSource
 → NetworkClient (Core)
```

---

---

# 🧠 WHY TEAMS PREFER THIS STYLE

✔ Clear separation
✔ Infrastructure reusable
✔ Easier testing
✔ Multiple features share Core

---

---

# 🎤 INTERVIEW POWER STATEMENT

> In my projects we organize Clean Architecture using Presentation, Domain, Data and Core layers. Domain holds pure business logic. Presentation handles UI. Data implements repositories. Core provides reusable infrastructure like networking, caching and DI. Dependencies always point inward.

---

---

# ⚠️ IMPORTANT CLARIFICATION

Sometimes teams merge:

```
Core + Data = Infrastructure
```

This is fine.

Architecture principle matters more than folder name.

---

---

# ✅ FINAL TAKEAWAY

Clean Architecture is about:

✔ Direction of dependency
✔ Separation of responsibility

NOT about exact folder names.

---

If you want next, we can:

👉 Convert this structure into **feature-based modules**
👉 Add **RemoteDataSource + LocalDataSource** pattern
👉 Add **Unit test examples per layer**

Just tell me 👍


Presentation → Domain → Data → Infrastructure here which one inner layer and which one outer layer   

Great question 👍 — this goes to the **absolute heart of Clean Architecture**.

Let’s make it **visual, simple, and interview-safe**.

---

# ✅ CORE RULE (AGAIN)

> **Inner layers contain business rules.**
> **Outer layers contain implementation details.**
> **Dependencies always point inward.**

---

# 🧅 CLEAN ARCHITECTURE AS ONION

Think of layers like an onion:

```
        🟡 Domain (CENTER)
      🟠 Data
    🔴 Infrastructure
  🔵 Presentation (OUTER EDGE)
```

But dependency arrows:

```
Presentation → Domain
Data → Domain
Infrastructure → Data
```

(Everyone depends inward)

---

# ✅ IN YOUR CHAIN

```
Presentation → Domain → Data → Infrastructure
```

This chain is a **call flow**, not a dependency hierarchy.

For INNER vs OUTER we look at **importance**, not call order.

---

# 🟡 INNERMOST LAYER

### 👉 Domain Layer

Contains:

* Entities
* UseCases
* Repository protocols
* Business rules

### Why innermost?

Because:

* It should survive if UI changes
* It should survive if network changes
* It has zero framework dependency

🎯 **Domain is INNER LAYER**

---

# 🟠 MIDDLE LAYER

### 👉 Data Layer

Contains:

* Repository implementations
* DTOs
* Mappers

Why middle?

* Depends on Domain
* Implements Domain contracts
* Knows about API & DB

🎯 **Data is MIDDLE LAYER**

---

# 🔴 OUTER LAYER

### 👉 Infrastructure Layer

Contains:

* URLSession
* Database engines
* Cache engines
* File system

Why outer?

* Pure technical details
* Can be replaced anytime

🎯 **Infrastructure is OUTER**

---

# 🔵 OUTERMOST LAYER

### 👉 Presentation Layer

Contains:

* Views
* ViewModels
* Controllers

Why outermost?

* Closest to user
* Changes most frequently

🎯 **Presentation is OUTER**

---

# ✅ FINAL CLASSIFICATION

| Layer          | Position     |
| -------------- | ------------ |
| Domain         | 🟡 Inner     |
| Data           | 🟠 Middle    |
| Infrastructure | 🔴 Outer     |
| Presentation   | 🔵 Outermost |

---

# ✅ SIMPLIFIED DIAGRAM

```
        Domain
          ↑
        Data
          ↑
   Infrastructure
          ↑
   Presentation
```

All arrows point toward Domain.

---

# 🎤 INTERVIEW ANSWER

> Domain is the innermost layer. Data and Infrastructure are outer layers. Presentation is the outermost layer. Dependencies always point inward toward Domain.

---

# 🧠 MEMORY TRICK

**D → B → F → U**

Domain → Business
Data → Bridge
Infrastructure → Frameworks
Presentation → UI

Business in center, UI outside.

---

# ⚠️ IMPORTANT NOTE

Many diagrams show:

```
Presentation → Domain → Data → Infrastructure
```

That is **execution flow**, NOT **dependency rule**.

Interviewers care about dependency direction.

---

# 🚀 ONE-LINE POWER ANSWER

> Domain is the inner layer, Data is middle, Infrastructure and Presentation are outer layers, and dependencies always point toward Domain.

---

If you want, next we can draw **dependency arrows using code examples** showing who imports whom — which makes this even clearer 👍


DTOs and mapper

Great — this is a **core building block** in Clean Architecture and often asked in interviews 👍

Let’s go step-by-step:

---

# ✅ 1️⃣ Interview-Friendly Definitions

### DTO (Data Transfer Object)

> A DTO is a simple object used to represent data coming from or going to external systems such as APIs or databases.

### Mapper

> A Mapper converts DTOs into Domain Entities and vice versa, isolating external data formats from business models.

---

# ✅ 2️⃣ Why We Need DTOs

Imagine API returns:

```json
{
  "id": 1,
  "name": "Leanne Graham",
  "email": "leanne@gmail.com",
  "username": "leanne_g"
}
```

But your app only needs:

```
id
name
email
```

We **don’t want** API shape leaking into business logic.

So:

👉 API → DTO
👉 DTO → Entity

---

# 🧱 3️⃣ Positioning in Clean Architecture

```
Presentation
   ↓
Domain (Entity)
   ↑
Data (DTO + Mapper)
   ↑
Infrastructure (API)
```

| Item   | Layer  |
| ------ | ------ |
| DTO    | Data   |
| Mapper | Data   |
| Entity | Domain |

---

# ✅ 4️⃣ ENTITY (Domain Model)

```swift
struct User {
    let id: Int
    let name: String
    let email: String
}
```

Business-friendly.

No decoding.

No API noise.

---

# ✅ 5️⃣ DTO (API Model)

```swift
struct UserDTO: Decodable {
    let id: Int
    let name: String
    let email: String
    let username: String
}
```

Matches API exactly.

---

# ✅ 6️⃣ Mapper

```swift
struct UserMapper {

    static func toEntity(dto: UserDTO) -> User {
        return User(
            id: dto.id,
            name: dto.name,
            email: dto.email
        )
    }
}
```

---

# ✅ 7️⃣ Repository Using Mapper

```swift
func fetchUsers() -> AnyPublisher<[User], Error> {

    apiClient.get("url")
        .map { (dtos: [UserDTO]) in
            dtos.map(UserMapper.toEntity)
        }
        .eraseToAnyPublisher()
}
```

---

# 🔁 FLOW

```
API JSON
 → UserDTO
 → UserMapper
 → User Entity
 → UseCase
 → ViewModel
 → View
```

---

# ✅ 8️⃣ Reverse Mapping (Optional)

When sending data to API:

---

### Entity

```swift
struct CreateUserRequest {
    let name: String
    let email: String
}
```

---

### DTO

```swift
struct CreateUserDTO: Encodable {
    let name: String
    let email: String
}
```

---

### Mapper

```swift
struct CreateUserMapper {

    static func toDTO(entity: CreateUserRequest) -> CreateUserDTO {
        return CreateUserDTO(
            name: entity.name,
            email: entity.email
        )
    }
}
```

---

# ✅ 9️⃣ Why Mapper Is Important

Without mapper:

```
UI → UserDTO
```

Bad ❌

With mapper:

```
UI → User
API → UserDTO
Mapper converts
```

Good ✅

---

# 🎯 BENEFITS

✔ Loose coupling
✔ API changes don’t break UI
✔ Domain stays pure
✔ Easier testing

---

# 🎤 INTERVIEW ONE-LINERS

* DTO represents external data format.
* Entity represents business model.
* Mapper transforms DTO to Entity.
* DTOs and Mappers live in Data layer.

---

# ⚠️ COMMON MISTAKE

Using DTO as Entity.

```swift
typealias User = UserDTO   // ❌
```

Breaks clean architecture.

---

# 🧠 RULE OF THUMB

If a model is decoded → DTO
If a model is used in business logic → Entity

---

If you want next, we can add:

👉 Nested DTO mapping
👉 Optional field handling
👉 Validation inside Mapper
👉 Unit tests for Mapper

Just tell me 👍


Let suppose I start design app, from which layer I should start. I should I move  


Excellent question 👍 — this is something **senior engineers and interviewers care about a lot**.

Short answer:

👉 **Start from Domain layer**
👉 Then Data
👉 Then Presentation
👉 Infrastructure is built alongside Data

Let’s make this crystal clear.

---

# ✅ GOLDEN RULE

> Always design business rules first, not UI, not API.

Because UI and API can change, but **business rules are stable**.

---

# 🥇 STEP 1 — START WITH DOMAIN (Inner Layer)

Ask:

* What problem does this app solve?
* What actions can user perform?
* What business entities exist?

---

### Example (Users App)

**Entities**

```swift
User
```

**UseCases**

```swift
GetUsers
CreateUser
DeleteUser
```

**Repository Protocol**

```swift
UserRepository
```

At this point:

❌ No URL
❌ No SwiftUI
❌ No ViewModel

Only rules.

---

### Why start here?

Because:

* Forces you to understand problem
* Makes architecture clean by design
* Prevents UI-driven design mistakes

---

# 🥈 STEP 2 — DESIGN DATA LAYER

Now ask:

> How will I fulfill repository contracts?

Create:

* DTOs
* Mappers
* Repository Implementations

Example:

```
UserRepositoryImpl
UserDTO
UserMapper
```

Still:

❌ No SwiftUI
❌ Minimal infrastructure

---

# 🥉 STEP 3 — BUILD INFRASTRUCTURE

Create:

* APIClient
* Database
* Cache

These support Data layer.

---

# 🏅 STEP 4 — BUILD PRESENTATION

Now create:

* ViewModels
* Views

Presentation simply **consumes use cases**.

---

# 🧭 FLOW OF CREATION

```
1. Domain
2. Data
3. Infrastructure
4. Presentation
```

---

# 🔁 FLOW OF EXECUTION (Runtime)

Opposite:

```
View
 → ViewModel
 → UseCase
 → Repository
 → API / Cache
```

---

# 🎯 INTERVIEW ANSWER

> I start with the Domain layer by defining entities, use cases, and repository interfaces. Then I implement Data and Infrastructure to satisfy those contracts. Finally, I build the Presentation layer on top.

---

# 🧠 MEMORY TRICK

**Think → Decide → Implement → Display**

Domain → Data → Infrastructure → Presentation

---

# ⚠️ COMMON BEGINNER MISTAKE

Starting with UI screens.

Why bad:

* Leads to fat ViewModels
* Business logic leaks into UI
* Hard to test

---

# 🏗 REAL-WORLD PRACTICE

In companies:

* Architects define Domain
* Backend & Mobile align on contracts
* Then UI is built

---

# 🔥 SENIOR-LEVEL STATEMENT

> UI is a delivery mechanism. Business rules come first.

---

# ✅ FINAL TAKEAWAY

Start from **Domain**, move outward.

---

If you want next, we can do a **mini design exercise**:

"Design a Todo App from scratch using Clean Architecture"

Step-by-step.

Just say 👍


Perfect 👍
Let’s do this like a **real system design exercise** and strictly follow Clean Architecture:

> **We start from Domain → move outward → finally Presentation**

---

# 🎯 PROBLEM STATEMENT

Build a **Todo App** with features:

* View todos
* Add todo
* Mark todo completed
* Delete todo

---

# 🥇 STEP 1 — DOMAIN LAYER (Business First)

Ask:
👉 What are my business objects?
👉 What actions can user perform?

---

## ✅ Entity

```swift
struct Todo {
    let id: UUID
    let title: String
    let isCompleted: Bool
}
```

Why?

Because todo item in real world has:

* Identity
* Name
* State

---

## ✅ Repository Protocol

```swift
protocol TodoRepository {
    func fetchTodos() -> AnyPublisher<[Todo], Error>
    func add(todo: Todo) -> AnyPublisher<Void, Error>
    func update(todo: Todo) -> AnyPublisher<Void, Error>
    func delete(id: UUID) -> AnyPublisher<Void, Error>
}
```

Domain defines **what it needs**, not how.

---

## ✅ UseCases

---

### Get Todos

```swift
protocol GetTodosUseCase {
    func execute() -> AnyPublisher<[Todo], Error>
}

final class GetTodosUseCaseImpl: GetTodosUseCase {

    private let repository: TodoRepository

    init(repository: TodoRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Todo], Error> {
        repository.fetchTodos()
    }
}
```

---

### Add Todo

```swift
protocol AddTodoUseCase {
    func execute(title: String) -> AnyPublisher<Void, Error>
}

final class AddTodoUseCaseImpl: AddTodoUseCase {

    private let repository: TodoRepository

    init(repository: TodoRepository) {
        self.repository = repository
    }

    func execute(title: String) -> AnyPublisher<Void, Error> {

        let todo = Todo(
            id: UUID(),
            title: title,
            isCompleted: false
        )

        return repository.add(todo: todo)
    }
}
```

---

👉 At this point we have **zero UI** and **zero database**.

---

# 🥈 STEP 2 — DATA LAYER

Now we must fulfill repository contract.

We choose **local storage first** (in-memory).

---

## ✅ DTO

```swift
struct TodoDTO {
    let id: UUID
    let title: String
    let completed: Bool
}
```

---

## ✅ Mapper

```swift
struct TodoMapper {

    static func toEntity(dto: TodoDTO) -> Todo {
        Todo(
            id: dto.id,
            title: dto.title,
            isCompleted: dto.completed
        )
    }

    static func toDTO(entity: Todo) -> TodoDTO {
        TodoDTO(
            id: entity.id,
            title: entity.title,
            completed: entity.isCompleted
        )
    }
}
```

---

## ✅ Repository Implementation

```swift
final class TodoRepositoryImpl: TodoRepository {

    private var storage: [TodoDTO] = []

    func fetchTodos() -> AnyPublisher<[Todo], Error> {

        let todos = storage.map(TodoMapper.toEntity)

        return Just(todos)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func add(todo: Todo) -> AnyPublisher<Void, Error> {

        let dto = TodoMapper.toDTO(entity: todo)
        storage.append(dto)

        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func update(todo: Todo) -> AnyPublisher<Void, Error> {

        guard let index = storage.firstIndex(where: { $0.id == todo.id }) else {
            return Fail(error: NSError())
                .eraseToAnyPublisher()
        }

        storage[index] = TodoMapper.toDTO(entity: todo)

        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func delete(id: UUID) -> AnyPublisher<Void, Error> {

        storage.removeAll { $0.id == id }

        return Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
```

---

# 🥉 STEP 3 — PRESENTATION LAYER (MVVM)

---

## ✅ ViewModel

```swift
final class TodoViewModel: ObservableObject {

    @Published var todos: [Todo] = []

    private let getTodos: GetTodosUseCase
    private let addTodo: AddTodoUseCase

    private var cancellables = Set<AnyCancellable>()

    init(
        getTodos: GetTodosUseCase,
        addTodo: AddTodoUseCase
    ) {
        self.getTodos = getTodos
        self.addTodo = addTodo
    }

    func load() {
        getTodos.execute()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] in
                self?.todos = $0
            })
            .store(in: &cancellables)
    }

    func add(title: String) {
        addTodo.execute(title: title)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] in
                self?.load()
            })
            .store(in: &cancellables)
    }
}
```

---

## ✅ SwiftUI View

```swift
struct TodoView: View {

    @StateObject var vm: TodoViewModel

    var body: some View {

        VStack {
            List(vm.todos, id: \.id) { todo in
                Text(todo.title)
            }

            Button("Add Sample Todo") {
                vm.add(title: "New Task")
            }
        }
        .onAppear {
            vm.load()
        }
    }
}
```

---

# 🧩 STEP 4 — DEPENDENCY ASSEMBLY

```swift
let repo = TodoRepositoryImpl()

let getTodos = GetTodosUseCaseImpl(repository: repo)
let addTodo = AddTodoUseCaseImpl(repository: repo)

let vm = TodoViewModel(
    getTodos: getTodos,
    addTodo: addTodo
)
```

---

# ✅ CREATION ORDER (DESIGN TIME)

```
Domain → Data → Presentation
```

---

# ✅ EXECUTION ORDER (RUNTIME)

```
View → ViewModel → UseCase → Repository → Storage
```

---

# 🎤 INTERVIEW READY ANSWER

> I start with the Domain layer by defining entities, use cases and repository interfaces. Then I implement Data layer to satisfy those contracts. Finally I build ViewModels and Views on top.

---

# 🧠 KEY TAKEAWAY

UI is last.

Business rules first.

---

If you want next:

👉 Add Remote API later
👉 Add Cache
👉 Add Error Mapping
👉 Add Unit Tests

Just say 👍


👉 Add Remote API later
👉 Add Cache
👉 Add Error Mapping
👉 Add Unit Tests


Perfect 👍
Now we evolve your **Todo Clean Architecture** into a **true production-grade system** step by step.

We’ll add:

1️⃣ Remote API
2️⃣ Cache
3️⃣ Error Mapping
4️⃣ Unit Tests

---

# ✅ FINAL ARCHITECTURE

```
Presentation
   ↓
Domain
   ↓
Data
   ├── RepositoryImpl
   ├── RemoteDataSource
   ├── LocalDataSource (Cache)
   └── Mappers
   ↓
Core
   ├── NetworkClient
   └── CacheStore
```

---

# 1️⃣ ADD REMOTE API

---

## 🔴 CORE → Network Client

```swift
protocol NetworkClient {
    func get<T: Decodable>(_ url: String)
      -> AnyPublisher<T, Error>
}
```

---

```swift
final class URLSessionNetworkClient: NetworkClient {

    func get<T: Decodable>(_ url: String)
      -> AnyPublisher<T, Error> {

        let url = URL(string: url)!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
```

---

## 🟠 DATA → Remote DTO

```swift
struct TodoRemoteDTO: Decodable {
    let id: UUID
    let title: String
    let completed: Bool
}
```

---

## 🟠 Remote Data Source

```swift
protocol TodoRemoteDataSource {
    func fetchTodos()
      -> AnyPublisher<[TodoRemoteDTO], Error>
}

final class TodoRemoteDataSourceImpl: TodoRemoteDataSource {

    private let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    func fetchTodos()
      -> AnyPublisher<[TodoRemoteDTO], Error> {

        client.get("https://example.com/todos")
    }
}
```

---

---

# 2️⃣ ADD CACHE (LOCAL DATASOURCE)

---

## 🔴 CORE → Cache

```swift
protocol CacheStore {
    func get(key: String) -> Any?
    func set(key: String, value: Any)
}
```

---

```swift
final class MemoryCacheStore: CacheStore {
    private let store = NSMutableDictionary()

    func get(key: String) -> Any? {
        store[key]
    }

    func set(key: String, value: Any) {
        store[key] = value
    }
}
```

---

## 🟠 Local Data Source

```swift
protocol TodoLocalDataSource {
    func fetchTodos() -> [TodoDTO]?
    func save(todos: [TodoDTO])
}
```

---

```swift
final class TodoLocalDataSourceImpl: TodoLocalDataSource {

    private let cache: CacheStore
    private let key = "todos"

    init(cache: CacheStore) {
        self.cache = cache
    }

    func fetchTodos() -> [TodoDTO]? {
        cache.get(key: key) as? [TodoDTO]
    }

    func save(todos: [TodoDTO]) {
        cache.set(key: key, value: todos)
    }
}
```

---

---

# 3️⃣ UPDATE REPOSITORY

---

```swift
final class TodoRepositoryImpl: TodoRepository {

    private let remote: TodoRemoteDataSource
    private let local: TodoLocalDataSource

    init(remote: TodoRemoteDataSource,
         local: TodoLocalDataSource) {
        self.remote = remote
        self.local = local
    }

    func fetchTodos()
      -> AnyPublisher<[Todo], Error> {

        if let cached = local.fetchTodos() {
            let entities = cached.map(TodoMapper.toEntity)
            return Just(entities)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        return remote.fetchTodos()
            .map { $0.map(TodoMapper.toDTO) }
            .handleEvents(receiveOutput: { [weak self] dtos in
                self?.local.save(todos: dtos)
            })
            .map { $0.map(TodoMapper.toEntity) }
            .eraseToAnyPublisher()
    }
}
```

---

# 4️⃣ ERROR MAPPING

---

## 🟡 DOMAIN ERROR

```swift
enum AppError: Error {
    case network
    case decoding
    case unknown
}
```

---

## 🟠 DATA ERROR MAPPER

```swift
struct ErrorMapper {

    static func map(_ error: Error) -> AppError {

        if error is URLError {
            return .network
        }
        if error is DecodingError {
            return .decoding
        }
        return .unknown
    }
}
```

---

## Apply in Repository

```swift
.mapError { ErrorMapper.map($0) }
```

---

---

# 5️⃣ UNIT TESTS

---

## ✅ Test UseCase

```swift
final class MockTodoRepository: TodoRepository {

    var todos: [Todo] = []

    func fetchTodos()
      -> AnyPublisher<[Todo], Error> {

        Just(todos)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
```

---

```swift
func testGetTodosSuccess() {

    let repo = MockTodoRepository()
    repo.todos = [Todo(id: UUID(), title: "Test", isCompleted: false)]

    let usecase = GetTodosUseCaseImpl(repository: repo)

    let exp = expectation(description: "todos")

    usecase.execute()
        .sink(receiveCompletion: { _ in },
              receiveValue: { todos in
            XCTAssertEqual(todos.count, 1)
            exp.fulfill()
        })
        .store(in: &cancellables)

    waitForExpectations(timeout: 1)
}
```

---

## ✅ Test ViewModel

```swift
func testViewModelLoadsTodos() {

    let repo = MockTodoRepository()
    repo.todos = [Todo(id: UUID(), title: "Sample", isCompleted: false)]

    let getTodos = GetTodosUseCaseImpl(repository: repo)
    let addTodo = AddTodoUseCaseImpl(repository: repo)

    let vm = TodoViewModel(
        getTodos: getTodos,
        addTodo: addTodo
    )

    vm.load()

    XCTAssertEqual(vm.todos.count, 1)
}
```

---

# 🎯 FINAL RESULT

✔ Remote API
✔ Cache
✔ Error Mapping
✔ Unit Tests
✔ Fully Clean Architecture

---

# 🎤 INTERVIEW POWER STATEMENT

> I start from domain, add repository abstractions, then implement repository using remote and local data sources with caching and error mapping, and finally connect it to MVVM presentation with unit tests on use cases and view models.

---
  
  


