

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

✅ You fetch data from API<br/>
✅ You store data in DB<br/>
✅ You might change backend<br/>
✅ You need mock data for testing<br/>

Shortcut memory:

👉 **If app touches data → Repository**

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

* ViewModel knows API details<br/>
* Cannot switch to database easily<br/>
* Hard to mock<br/>

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

👉 How objects **communicate**<br/>
👉 How responsibilities are **distributed**<br/>

Repository does **not** manage communication or algorithms.

So ❌ Not Behavioral.

---

## 🧠 Why Not Structural?

Structural patterns (Adapter, Decorator, Facade, Composite, etc.) focus on:

👉 How objects are **composed**<br/>
👉 How classes are **wrapped or connected**<br/>

Repository is not mainly about object composition.

So ❌ Not Structural.

---

## 🏛️ Why Architectural?

Architectural patterns focus on:

👉 Application-level structure<br/>
👉 Layer separation<br/>
👉 Dependency direction<br/>
👉 Overall organization<br/>

Repository:

✔ Defines a data access layer<br/>
✔ Sits between domain and data sources<br/>
✔ Shapes project architecture<br/>

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

> **Q. I have cross question for repository pattern, so basically repository ia protocol and data sources have to implement and viewmodel have protocol type which we will inject throgh DI**  
**Ans:**  
Excellent cross-question 👏 — and you’re **very close already**. Let’s tighten the mental model and correct one small misconception.

---

# ✅ Correct Mental Model (IMPORTANT)

> **Repository is a protocol.
> Data sources do NOT implement the repository.
> Repository IMPLEMENTATION uses data sources.
> ViewModel depends on repository protocol via DI.**

---

## ❌ Slightly Incorrect Version

> “Repository is protocol and data sources implement it”

This is **not ideal architecture**.

---

## ✅ Correct Architecture

```
ViewModel
   ↓
Repository (protocol)
   ↓
RepositoryImpl (class)
   ↓
DataSources (API / DB)
```

---

# 🧠 Who Implements What?

### 1️⃣ Repository Protocol

```swift
protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
```

---

### 2️⃣ Data Sources

```swift
class UserAPI {
    func fetchUsers() async throws -> [User] { }
}

class UserDatabase {
    func fetchUsers() async throws -> [User] { }
}
```

They are **simple services**.

They do NOT conform to UserRepository.

---

### 3️⃣ Repository Implementation

```swift
class UserRepositoryImpl: UserRepository {

    let api: UserAPI
    let db: UserDatabase

    init(api: UserAPI, db: UserDatabase) {
        self.api = api
        self.db = db
    }

    func fetchUsers() async throws -> [User] {
        do {
            let users = try await api.fetchUsers()
            return users
        } catch {
            return try await db.fetchUsers()
        }
    }
}
```

Repository decides **which data source** to use.

---

### 4️⃣ ViewModel

```swift
class UserViewModel {
    let repository: UserRepository   // protocol

    init(repository: UserRepository) {
        self.repository = repository
    }
}
```

---

# 🎯 Why This Separation Matters

If API directly implements Repository:

```
ViewModel → API
```

You lose:

❌ Fallback logic
❌ Combining sources
❌ Caching
❌ Flexibility

Repository becomes useless.

---

# 🧠 Correct Responsibility Split

| Layer               | Responsibility      |
| ------------------- | ------------------- |
| DataSource          | Fetch raw data      |
| RepositoryImpl      | Orchestrate sources |
| Repository Protocol | Contract            |
| ViewModel           | Consume repository  |

---

# 🎯 Interview-Ready Statement

> “ViewModel depends on a repository protocol. A concrete repository implementation uses one or more data sources like API or database and decides where to fetch data from.”

---

# 🧠 One-Line Memory Hook

> **Repository sits above data sources, not below.**

---

# ⚡ Edge Case

Small apps sometimes skip explicit data source classes:

```
RepositoryImpl → URLSession
```

Still valid.

But conceptually:

```
ViewModel → Repository → DataSource
```

---

# 🏁 Final Verdict

✅ Repository is protocol
✅ ViewModel has protocol type
✅ Injected via DI
❌ Data sources should NOT implement repository

---  

> **Q. So Network Service manager is a datasource?**  
**Ans:**  
Yes ✅ — **exactly**.

> A **Network Service Manager is a Data Source**.

Let’s lock this in properly with a clear mental model.

---

# 🧱 Layer Mapping

```
ViewModel
   ↓
Repository (protocol)
   ↓
RepositoryImpl
   ↓
NetworkService / DatabaseService   ← Data Sources
```

So:

👉 `NetworkServiceManager` = **Remote Data Source**
👉 `DatabaseManager` = **Local Data Source**

---

# 🧠 Why Network Service Is a Data Source

Because its only responsibility is:

✔ Make network request
✔ Parse response
✔ Return raw data

It should **NOT**:

❌ Decide fallback
❌ Cache
❌ Combine multiple sources
❌ Apply business rules

Those belong to **Repository**.

---

# ✅ Example

### Network Data Source

```swift
protocol UserRemoteDataSource {
    func fetchUsers() async throws -> [User]
}

class UserAPIService: UserRemoteDataSource {
    func fetchUsers() async throws -> [User] {
        // URLSession call
        return []
    }
}
```

---

### Local Data Source

```swift
protocol UserLocalDataSource {
    func fetchUsers() throws -> [User]
    func saveUsers(_ users: [User])
}
```

---

### Repository

```swift
class UserRepositoryImpl: UserRepository {

    let remote: UserRemoteDataSource
    let local: UserLocalDataSource

    init(remote: UserRemoteDataSource,
         local: UserLocalDataSource) {
        self.remote = remote
        self.local = local
    }

    func fetchUsers() async throws -> [User] {
        do {
            let users = try await remote.fetchUsers()
            local.saveUsers(users)
            return users
        } catch {
            return try local.fetchUsers()
        }
    }
}
```

---

# 🎯 Interview-Ready Answer

> “Yes, network service manager is considered a remote data source. The repository uses it along with other data sources like database or cache and decides where data should come from.”

---

# 🧠 Memory Hook

> **Service Manager = Data Source**
> **Repository = Coordinator**

---

# ⚡ Small-App Shortcut

Sometimes you’ll see:

```
Repository → URLSession
```

Still conceptually:

URLSession is acting as data source.

---

# 🏁 Final Summary

✅ Network manager = Data source<br/>
✅ Repository sits above it<br/>
✅ ViewModel never talks to it<br/>  

---  

> **Q. So different DataSources will have different Repository  and each repository will implement repository protocol**  
**Ans:**  
Almost 👍 — but let me **fine-tune this**, because this is a very common point of confusion.

---

# ✅ Correct Statement

> **Each FEATURE has ONE repository protocol.
> That repository has ONE concrete implementation.
> That implementation can use MULTIPLE data sources.**

---

# ❌ Incorrect Understanding

> “Different DataSources will have different Repository”

This leads to fragmentation.

---

# 🧠 Correct Architecture

### Example: User Feature

```
UserRepository (protocol)
        ↑
UserRepositoryImpl
   ↙            ↘
UserRemoteDataSource   UserLocalDataSource
```

---

# 🧱 Visual

```
ViewModel
   ↓
UserRepository (protocol)
   ↓
UserRepositoryImpl
   ↓
-----------------------
| RemoteDataSource   |
| LocalDataSource    |
| CacheDataSource    |
-----------------------
```

---

# 🧩 Why Only One Repository Per Feature?

Repository represents:

👉 **All data operations for one domain concept**

Example:

```
UserRepository
- getUsers()
- getUser(id:)
- saveUser()
- deleteUser()
```

Not:

```
ApiUserRepository
DbUserRepository
CacheUserRepository   ❌
```

---

# ✅ Good Design

```swift
protocol UserRepository {
    func getUsers() async throws -> [User]
}
```

```swift
class UserRepositoryImpl: UserRepository {

    let remote: UserRemoteDataSource
    let local: UserLocalDataSource

    func getUsers() async throws -> [User] {
        do {
            let users = try await remote.fetchUsers()
            local.saveUsers(users)
            return users
        } catch {
            return try local.fetchUsers()
        }
    }
}
```

---

# ❌ Bad Design

```swift
class ApiUserRepository: UserRepository { }
class DbUserRepository: UserRepository { }
```

Now ViewModel must choose:

```
if online → ApiRepo
else → DbRepo
```

That logic belongs to Repository, not ViewModel.

---

# 🎯 Interview-Ready Answer

> “There is typically one repository per feature. The repository implementation uses multiple data sources like API or database. Each repository implements its repository protocol.”

---

# 🧠 Memory Hook

> **Many DataSources → One Repository**

---

# ⚡ Edge Case (Advanced)

Sometimes multiple implementations exist:

```
UserRepositoryMock
UserRepositoryImpl
```

For testing only.

Still conceptually **one real repository**.

---

# 🏁 Final Summary

✅ One feature → one repository protocol
✅ One main implementation
✅ Repository talks to many data sources
❌ Not one repository per data source

---

> **Q. But abouve you have created something like this**

Step 3️⃣ Remote Data Source
class RemoteUserRepository: UserRepository {

    func fetchUsers() -> [User] {
        print("Fetching from API")
        return [
            User(id: 1, name: "Rahul"),
            User(id: 2, name: "Amit")
        ]
    }
}
Step 4️⃣ Local Data Source
class LocalUserRepository: UserRepository {

    func fetchUsers() -> [User] {
        print("Fetching from Database")
        return [
            User(id: 3, name: "Local John")
        ]
    }
}  

**Ans:**  
Excellent catch 👏 — and you’re **100% right to question this**.

That earlier example was a **simplified teaching shortcut**, but for **real production architecture**, we should **not** model data sources as repositories.

Let me clarify clearly and fix the mental model.

---

# ✅ Truth First

The earlier example:

```swift
class RemoteUserRepository: UserRepository
class LocalUserRepository: UserRepository
```

👉 This is a **simplified / transitional pattern**
👉 Useful only for teaching concept quickly
👉 **NOT the ideal Clean Architecture form**

---

# ✅ Production-Correct Architecture

Instead of:

```
RemoteUserRepository
LocalUserRepository
```

We should have:

```
UserRemoteDataSource
UserLocalDataSource
UserRepositoryImpl
```

---

# 🧠 Correct Structure

```
ViewModel
   ↓
UserRepository (protocol)
   ↓
UserRepositoryImpl
   ↓
-------------------------
UserRemoteDataSource
UserLocalDataSource
-------------------------
```

---

# ✅ Corrected Example

### Repository Protocol

```swift
protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
```

---

### Remote Data Source

```swift
protocol UserRemoteDataSource {
    func fetchUsers() async throws -> [User]
}

class UserAPIService: UserRemoteDataSource {
    func fetchUsers() async throws -> [User] {
        print("Fetching from API")
        return [
            User(id: 1, name: "Rahul"),
            User(id: 2, name: "Amit")
        ]
    }
}
```

---

### Local Data Source

```swift
protocol UserLocalDataSource {
    func fetchUsers() throws -> [User]
}

class UserDBService: UserLocalDataSource {
    func fetchUsers() throws -> [User] {
        print("Fetching from Database")
        return [
            User(id: 3, name: "Local John")
        ]
    }
}
```

---

### Repository Implementation

```swift
class UserRepositoryImpl: UserRepository {

    let remote: UserRemoteDataSource
    let local: UserLocalDataSource

    init(remote: UserRemoteDataSource,
         local: UserLocalDataSource) {
        self.remote = remote
        self.local = local
    }

    func fetchUsers() async throws -> [User] {
        do {
            return try await remote.fetchUsers()
        } catch {
            return try local.fetchUsers()
        }
    }
}
```

---

# 🎯 What Changed?

| Old Example                       | Corrected                       |
| --------------------------------- | ------------------------------- |
| DataSource implemented Repository | RepositoryImpl uses DataSources |
| Multiple repositories             | One repository                  |
| ViewModel could choose            | Repository chooses              |

---

# 🧠 Why I Showed That Earlier

For beginners:

```
ViewModel → Repository
```

is the main idea.

Later, we refine:

```
ViewModel → Repository → DataSource
```

You are now at the **refinement stage** 👍

---

# 🎯 Interview-Safe Clarification

If asked:

> “Sometimes you’ll see remote and local repositories directly implementing the repository protocol in simple examples, but in production we usually create explicit data source classes and a single repository implementation that coordinates them.”

That answer shows maturity.

---

# 🧠 Final Mental Model (Lock This)

> **Repository = Orchestrator**
> **DataSource = Executor**

---

# 🏁 Final Verdict

✅ Your observation is correct
✅ Earlier example was simplified
✅ Production design uses RepositoryImpl + DataSources

---

>> **Q. Repository vs DataSource responsibilities**  
**Ans.**  
Perfect — this is a **core architectural distinction** and interviewers love this 👍
Let’s lock it down cleanly.

---

# ✅ High-Level Difference

> **DataSource fetches data.
> Repository decides where data comes from.**

That single sentence already explains 80%.

---

# 🧠 Mental Model

```
ViewModel
   ↓
Repository  ← Brain
   ↓
DataSource  ← Hands
```

Repository thinks.
DataSource does.

---

# 📦 DataSource Responsibilities

A DataSource is a **low-level data provider**.

### It should:

✅ Call API
✅ Read/write database
✅ Parse raw response
✅ Throw errors

### It should NOT:

❌ Decide fallback strategy
❌ Combine multiple sources
❌ Cache business objects
❌ Apply business rules

---

### Example

```swift
protocol UserRemoteDataSource {
    func fetchUsers() async throws -> [User]
}
```

```swift
class UserAPIService: UserRemoteDataSource {
    func fetchUsers() async throws -> [User] {
        // URLSession call
        return []
    }
}
```

---

# 🧠 Repository Responsibilities

Repository is a **higher-level abstraction**.

### It should:

✅ Decide which data source to use
✅ Combine multiple data sources
✅ Apply caching rules
✅ Hide data origin
✅ Return domain models

### It should NOT:

❌ Perform network calls
❌ Know HTTP details
❌ Decode JSON directly

---

### Example

```swift
class UserRepositoryImpl: UserRepository {

    let remote: UserRemoteDataSource
    let local: UserLocalDataSource

    func fetchUsers() async throws -> [User] {
        do {
            let users = try await remote.fetchUsers()
            local.save(users)
            return users
        } catch {
            return try local.fetchUsers()
        }
    }
}
```

---

# 📊 Side-by-Side Comparison

| Aspect            | Repository | DataSource |
| ----------------- | ---------- | ---------- |
| Level             | High       | Low        |
| Knows API/DB      | ❌          | ✅          |
| Business rules    | ✅          | ❌          |
| Caching           | ✅          | ❌          |
| Combines sources  | ✅          | ❌          |
| Used by ViewModel | ✅          | ❌          |

---

# 🎯 Interview-Ready Answer

> “Data sources are responsible for fetching data from a specific source like network or database. Repository sits above data sources and decides which source to use, applies caching or fallback rules, and exposes a clean API to the rest of the app.”

---

# 🧠 Memory Hook

> **DataSource = HOW**
> **Repository = FROM WHERE**

---

# ⚡ Real-Life Analogy

Restaurant:

* Supplier = DataSource
* Kitchen Manager = Repository
* Waiter = ViewModel

Manager decides which supplier to call.

---

# 🚨 Common Mistake

Putting this in ViewModel:

```
if online -> call API
else -> call DB
```

Wrong ❌

Belongs in Repository.

---

# 🏁 Final Summary

✅ DataSource fetches
✅ Repository orchestrates
✅ ViewModel consumes repository

---  


## Mind Map

![Repository Pattern](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/RepositoryPatternMindMap.png)










 


