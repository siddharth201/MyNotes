

# ✅ Repository Pattern

> **Repository Pattern abstracts data access and provides a clean interface for fetching and saving data, independent of where the data comes from.**

Even simpler:

> **Repository hides data source details and exposes data through a common interface.**

One-liner fallback:

> **Repository sits between business logic and data sources.**

---

# 🧠 Why Repository Pattern Exists

Without repository:

```
ViewModel → API
ViewModel → Database
ViewModel → Cache
```

Problems:

* Business logic depends on data source
* Hard to test
* Hard to switch backend
* Tight coupling

With repository:

```
ViewModel → Repository → (API / DB / Cache)
```

Benefits:

* Loose coupling
* Testable
* Replaceable data source
* Cleaner architecture

---

# 🚨 When Should You Think of Repository

Think Repository when:

✅ You fetch data from API
✅ You store data in DB
✅ You might change backend
✅ You need mock data for testing

Shortcut memory:

👉 **If app touches data → Repository**

---

---

# ❌ WITHOUT Repository (Bad Design)

### User Model

```swift
struct User {
    let id: Int
    let name: String
}
```

### ViewModel directly calls API

```swift
class UserViewModel {

    func fetchUsers() -> [User] {
        // Simulating API
        return [
            User(id: 1, name: "Rahul"),
            User(id: 2, name: "Amit")
        ]
    }
}
```

### Problems

* ViewModel knows API details
* Cannot switch to database easily
* Hard to mock

---

---

# ✅ WITH Repository (Production-Style)

We separate into layers.

---

## Step 1️⃣ Model

```swift
struct User {
    let id: Int
    let name: String
}
```

---

## Step 2️⃣ Repository Protocol (Contract)

```swift
protocol UserRepository {
    func fetchUsers() -> [User]
}
```

This is the **heart of Repository pattern**.

---

## Step 3️⃣ Remote Data Source

```swift
class RemoteUserRepository: UserRepository {

    func fetchUsers() -> [User] {
        print("Fetching from API")
        return [
            User(id: 1, name: "Rahul"),
            User(id: 2, name: "Amit")
        ]
    }
}
```

---

## Step 4️⃣ Local Data Source

```swift
class LocalUserRepository: UserRepository {

    func fetchUsers() -> [User] {
        print("Fetching from Database")
        return [
            User(id: 3, name: "Local John")
        ]
    }
}
```

---

## Step 5️⃣ ViewModel Depends Only On Repository

```swift
class UserViewModel {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func getUsers() -> [User] {
        repository.fetchUsers()
    }
}
```

---

## Step 6️⃣ Usage (Dependency Injection)

```swift
let remoteRepo = RemoteUserRepository()
let viewModel = UserViewModel(repository: remoteRepo)

let users = viewModel.getUsers()
print(users)
```

Try replacing:

```swift
let localRepo = LocalUserRepository()
let viewModel = UserViewModel(repository: localRepo)
```

No other code changes 👏

---

# 🔥 Why This Is Production-Grade

✔ ViewModel unaware of API / DB
✔ Easy to swap data source
✔ Easy to mock
✔ Clean architecture
✔ Follows SOLID

---

# 🧠 Visual Memory

```
UI / ViewModel
      |
      v
  Repository
   /      \
API       DB
```

---

# 🎯 What To Say In Interview

> “Repository pattern introduces a layer between business logic and data sources. The ViewModel talks only to the repository interface, and the repository decides where data comes from, such as API or database. This makes the app loosely coupled and testable.”

---

# 💡 Add This If You Want To Impress

> “Repository is often used with Dependency Injection and works well in MVVM and Clean Architecture.”

---

# ⚡ Common Follow-Up Question

### Q: Is repository same as data source?

Answer:

> “No. Data source does actual fetching. Repository coordinates and exposes a clean API to the rest of the app.”

---

# 🧪 BONUS: Mock Repository (Testing)

```swift
class MockUserRepository: UserRepository {
    func fetchUsers() -> [User] {
        return [User(id: 99, name: "Mock User")]
    }
}
```

Great for unit tests.

---

# 🏁 One-Line Memory Hook

> **Repository hides where data comes from.**

---

## Q. Is repository pattern Behavioral or Structural?
**Ans:**  

> **Repository Pattern is an Architectural pattern.**

Not Behavioral.
Not Structural.

---

## 🧠 Why Not Behavioral?

Behavioral patterns (Strategy, Observer, Command, etc.) focus on:

👉 How objects **communicate**
👉 How responsibilities are **distributed**

Repository does **not** manage communication or algorithms.

So ❌ Not Behavioral.

---

## 🧠 Why Not Structural?

Structural patterns (Adapter, Decorator, Facade, Composite, etc.) focus on:

👉 How objects are **composed**
👉 How classes are **wrapped or connected**

Repository is not mainly about object composition.

So ❌ Not Structural.

---

## 🏛️ Why Architectural?

Architectural patterns focus on:

👉 Application-level structure
👉 Layer separation
👉 Dependency direction
👉 Overall organization

Repository:

✔ Defines a data access layer
✔ Sits between domain and data sources
✔ Shapes project architecture

So ✅ Architectural Pattern.

---

## 📌 Common Architectural Patterns

* MVC
* MVVM
* Clean Architecture
* Repository
* Service Layer
* DAO

---

## 🎯 Interview-Ready Sentence

> “Repository pattern is an architectural pattern used to abstract data access and define a clean boundary between domain logic and data sources.”

---

## 🧠 Memory Trick

> **If a pattern shapes the whole app structure → Architectural**

---

## ⚠️ Important Note

Some books loosely call Repository a **design pattern**, but in modern practice:

👉 It is categorized as **Architectural Pattern**

Both answers are acceptable, but **Architectural is more accurate**.

---

## 💬 If Interviewer Pushes Further

Say:

> “It’s not part of GoF Behavioral or Structural patterns. It belongs to the architectural layer patterns.”

---

## 🏁 One-Liner

> **Repository = Architectural Pattern**

---


