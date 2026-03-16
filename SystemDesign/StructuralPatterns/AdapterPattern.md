
## **Adapter Pattern**

** `Adapter` is a structural design pattern that allows objects with incompatible interfaces to collaborate. </br>Adapter Pattern helps achieve loose coupling by introducing an abstraction.**  

** Our app depends only on our interface, while the Adapter translates calls to the 3rd-party or legacy API.**

** If the external API changes or we replace it, only the Adapter needs modification — the rest of the code stays untouched.**

** It works beautifully with Dependency Injection and Dependency Inversion.**  


## 🧠 One-Line Memory Hook

> Adapter = Translator  

**🍎 iOS Example**

Suppose your app uses a new API model:

```swift
struct NewUser {
    let fullName: String
}
```  

But existing code expects:

```swift
struct OldUser {
    let name: String
}
```


Create an Adapter: 
```swift 
class UserAdapter {
    static func convert(_ newUser: NewUser) -> OldUser {
        return OldUser(name: newUser.fullName)
    }
}
```

**🎯 When to use?**

* When integrating legacy code<br/>
* When APIs return incompatible formats<br/>
* When two systems need to talk but don’t match<br/>  

---  
  
> “If your code base is integrated with any 3rd-party API directly, then your code is very tightly coupled.”

✔ **This is completely correct.**

Why?
Because if the 3rd-party API changes, your whole codebase breaks.
Adapter solves this problem.

---

## 🎯 Your Steps — **Correct Adapter Implementation**

You said:

### ✔ Step 1: Create Your Own Interface

This defines **what your app needs**, not what the 3rd party provides.

### ✔ Step 2: Check all functionalities you want

Example: CheckBalance, Pay, AddMoney
These become methods in your interface.

### ✔ Step 3: Create a Wrapper (Adapter) Class

This wrapper implements **your interface**
AND internally calls **the 3rd-party API**.

✔ **This is exactly the Adapter pattern.**

---

## 📌 Your Example — **Perfect Adapter Scenario**

### PhonePe wants to integrate YesBank

PhonePe needs:

* checkBalance()
* pay()
* addMoney()

But YesBank API provides:

* getBalance()
* transfer()
* topupMoney()

These names/types don’t match.

➡ Adapter converts your expected interface into the bank’s actual API.

---

## ✔ Correct Structure of Your Example

### 1️⃣ Your app interface:

```swift
protocol BankAPI {
    func checkBalance()
    func pay()
    func addMoney()
}
```

### 2️⃣ Third-party API:

```swift
class YesBankAPI {
    func getBalance() {}
    func transfer() {}
    func topupMoney() {}
}
```

### 3️⃣ Adapter connecting PhonePe ↔ YesBank:

```swift
class YesBankAPIAdapter: BankAPI {
    
    private let yesBank = YesBankAPI()
    
    func checkBalance() {
        yesBank.getBalance()
    }

    func pay() {
        yesBank.transfer()
    }

    func addMoney() {
        yesBank.topupMoney()
    }
}
```

### 4️⃣ Usage in PhonePe app:

```swift
let bankAPI: BankAPI = YesBankAPIAdapter()
bankAPI.checkBalance()
```

✔ PhonePe code does NOT depend on YesBank directly<br/>
✔ If PhonePe wants to integrate ICICIBank later → create new ICICIAdapter<br/>
✔ No change required in PhonePe code<br/>

---

## 🎯 FINAL CONFIRMATION

**YES — your explanation is 100% correct for the Adapter Design Pattern.**

You have captured:

* Why we use Adapter
* How to design the interface
* How to wrap the third-party API
* How PhonePe communicates only with the adapter
* Why it reduces tight coupling

This is exactly how you should explain it in an interview.

---

# ⭐ Bonus Interview Line (Say This to Impress)

> “Adapter allows our system to depend on our own interface instead of depending on a 3rd-party API.
> If the 3rd-party changes, we only update the adapter, not our whole app.”

---  

## Q. Give a real iOS example (e.g., URLSessionAdapter, PaymentGatewayAdapter) using adapter design pattern and dependency inversion  

Here is a **clean, real-world iOS example** of using:

✔ Adapter Design Pattern<br/>
✔ Dependency Inversion Principle (DIP)<br/>
✔ Clean architecture-friendly approach<br/>

We will implement:

1️⃣ **NetworkService (protocol)** → our *own interface*
2️⃣ **URLSessionAdapter** → adapter that wraps URLSession
3️⃣ Any ViewModel or UseCase depends on **NetworkService**, NOT URLSession

This is EXACTLY how companies write production iOS code.

---

## 🚀 **1. Our App-Level Protocol (Abstraction)**

*(We depend on this — NOT on URLSession)*

```swift
protocol NetworkService {
    func get(url: URL, completion: @escaping (Data?, Error?) -> Void)
}
```

✔ This follows the **Dependency Inversion Principle**:
High-level modules depend on **interfaces**, not concrete classes.

---

## 🚀 **2. Apple’s URLSession does NOT match our interface**

We can’t change URLSession and it has different method signatures:

```swift
URLSession.shared.dataTask(with: url) { data, response, error in ... }
```

So we create an **Adapter**.

---

## 🚀 **3. URLSessionAdapter (Adapter Pattern Implementation)**

```swift
class URLSessionAdapter: NetworkService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        
        session.dataTask(with: url) { data, _, error in
            completion(data, error)
        }.resume()
    }
}
```

✔ This class **implements our interface** (`NetworkService`)<br/>
✔ Internally uses **URLSession**<br/>
✔ If tomorrow we switch to Alamofire → zero changes in the app
Just create an **AlamofireAdapter**.

---

## 🚀 **4. High-Level Layer Depends on Abstraction, Not URLSession**

Example: A ViewModel

```swift
class UserViewModel {
    
    private let network: NetworkService
    
    init(network: NetworkService) { // DIP applied here!
        self.network = network
    }
    
    func loadUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        network.get(url: url) { data, error in
            if let data = data {
                print("Users Loaded: \(data)")
            }
        }
    }
}
```

---

## 🚀 **5. Dependency Injection in App**

```swift
let viewModel = UserViewModel(network: URLSessionAdapter())
viewModel.loadUsers()
```

✔ You injected the adapter<br/>
✔ ViewModel has NO idea URLSession exists<br/>
✔ DIP + Adapter + Clean Architecture = perfect design<br/>

---

## 🎯 WHY THIS IS A PERFECT ADAPTER + DIP EXAMPLE?

| Principle                | How we applied it                                                |
| ------------------------ | ---------------------------------------------------------------- |
| **Adapter**              | URLSessionAdapter converts URLSession API into our own interface |
| **Dependency Inversion** | ViewModel depends on `NetworkService` (protocol), not URLSession |
| **Loose Coupling**       | Replace URLSession with anything (mock, Alamofire)               |
| **Testability**          | In tests, use a FakeNetworkService instead of URLSession         |

---

## ⭐ BONUS: Mock Adapter for Unit Testing

```swift
class MockNetworkService: NetworkService {
    var mockData: Data?
    var mockError: Error?
    
    func get(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        completion(mockData, mockError)
    }
}
```

Usage in Unit Test:

```swift
let mock = MockNetworkService()
mock.mockData = "{ \"name\": \"Sid\" }".data(using: .utf8)

let vm = UserViewModel(network: mock)
vm.loadUsers()
```

✔ No network calls
✔ No URLSession
✔ FAST tests
✔ Perfect DIP principle

---

## 🔥 REAL USE CASE #2 (Payment Gateway Adapter)

Suppose your app supports:

* RazorPay
* PhonePe
* Google Pay

Create a common interface:

```swift
protocol PaymentGateway {
    func pay(amount: Double)
}
```

3rd-party SDK:

```swift
class RazorPaySDK {
    func initiatePayment(_ amount: Double) { }
}
```

Adapter:

```swift
class RazorPayAdapter: PaymentGateway {
    private let sdk = RazorPaySDK()
    
    func pay(amount: Double) {
        sdk.initiatePayment(amount)
    }
}
```

ViewModel:

```swift
class PaymentViewModel {
    private let gateway: PaymentGateway
    
    init(gateway: PaymentGateway) { // DIP here
        self.gateway = gateway
    }
    
    func makePayment() {
        gateway.pay(amount: 200)
    }
}
```

App usage:

```swift
let vm = PaymentViewModel(gateway: RazorPayAdapter())
vm.makePayment()
```

✔ Switch payment provider anytime<br/>
✔ No code changes in ViewModel<br/>
✔ DIP + Adapter perfect combo<br/>

---

## 🎁 FINAL SUMMARY (Interview Ready)

> In iOS, Adapter wraps incompatible 3rd-party APIs like URLSession or payment SDKs and exposes them through our own clean interface.
> Using Dependency Inversion, high-level layers depend on our protocol, not the actual 3rd-party API.
> This makes the code flexible, testable, and loosely coupled.

---  


## Q.Use dependency injection  

Perfect — let’s build a **real, practical example** using:

* **RazorPay**
* **PhonePe**
* **Google Pay**

We will use:

✔ Adapter Pattern
✔ Dependency Injection
✔ Dependency Inversion Principle

You will see **exactly how they become interchangeable** in your app.

---

## 🎯 **Goal**

PhonePe App should be able to switch between:

* RazorPay
* Google Pay
* PhonePe’s own payment system

WITHOUT changing any business logic.

Only swap the **adapter**.

---

## 1️⃣ **Step 1: Define Your App’s Requirement (Protocol)**

Your app needs these common operations:

```swift
protocol PaymentGateway {
    func pay(amount: Double)
}
```

This is YOUR interface (PhonePe’s requirement).
Every payment provider must adapt to this.

---

## 2️⃣ **Step 2: Third-party SDKs (cannot be modified)**

### RazorPay SDK

```swift
class RazorPaySDK {
    func makePayment(_ amount: Double) {
        print("RazorPay processed ₹\(amount)")
    }
}
```

### Google Pay SDK

```swift
class GooglePaySDK {
    func send(amount: Double) {
        print("Google Pay processed ₹\(amount)")
    }
}
```

### PhonePe Internal SDK

```swift
class PhonePeSDK {
    func initiate(_ amt: Double) {
        print("PhonePe processed ₹\(amt)")
    }
}
```

Each SDK has different method names, parameters, and APIs.
This is why you need an **Adapter**.

---

## 3️⃣ **Step 3: Create Adapters for Each SDK**

---

### 🔵 RazorPay Adapter

```swift
class RazorPayAdapter: PaymentGateway {

    private let sdk = RazorPaySDK()

    func pay(amount: Double) {
        sdk.makePayment(amount)
    }
}
```

---

### 🟢 Google Pay Adapter

```swift
class GooglePayAdapter: PaymentGateway {

    private let sdk = GooglePaySDK()

    func pay(amount: Double) {
        sdk.send(amount: amount)
    }
}
```

---

### 🟣 PhonePe Adapter

```swift
class PhonePeAdapter: PaymentGateway {

    private let sdk = PhonePeSDK()

    func pay(amount: Double) {
        sdk.initiate(amount)
    }
}
```

---

## 4️⃣ **Step 4: PhonePe ViewModel Uses Dependency Injection**

PhonePe app code depends ONLY on **PaymentGateway**, not any SDK.

```swift
class PaymentViewModel {

    private let gateway: PaymentGateway

    // Dependency Injection
    init(gateway: PaymentGateway) {
        self.gateway = gateway
    }

    func makePayment(amount: Double) {
        gateway.pay(amount: amount)
    }
}
```

✔ DIP (Dependency Inversion Principle) applied<br/>
✔ ViewModel knows NOTHING about RazorPay, Google Pay, or PhonePeSDK<br/>
✔ Purely depends on **protocol**<br/>

---

## 5️⃣ **Step 5: Switching Between Payment Providers (Interchangeable)**

### 🔵 Use RazorPay

```swift
let vm = PaymentViewModel(gateway: RazorPayAdapter())
vm.makePayment(amount: 500)
```

Output:

```
RazorPay processed ₹500
```

---

### 🟢 Use Google Pay

```swift
let vm = PaymentViewModel(gateway: GooglePayAdapter())
vm.makePayment(amount: 500)
```

Output:

```
Google Pay processed ₹500
```

---

### 🟣 Use PhonePe Internal Gateway

```swift
let vm = PaymentViewModel(gateway: PhonePeAdapter())
vm.makePayment(amount: 500)
```

Output:

```
PhonePe processed ₹500
```

---

## 🎉 **All three interchangeable without changing business logic!**

| Gateway    | Adapter Used     | ViewModel Changed? |
| ---------- | ---------------- | ------------------ |
| RazorPay   | RazorPayAdapter  | ❌ No change        |
| Google Pay | GooglePayAdapter | ❌ No change        |
| PhonePe    | PhonePeAdapter   | ❌ No change        |

✔ The ViewModel never changes<br/>
✔ No tight coupling to external SDKs<br/>
✔ Clean, testable, scalable architecture<br/>

---

## 🧠 **Why this works (Interview Explanation)**

> We define our own payment interface (`PaymentGateway`).
> Each 3rd-party SDK (RazorPay, Google Pay, PhonePeSDK) is wrapped inside an Adapter that implements our interface.
> The ViewModel receives the adapter through dependency injection, so it relies only on the abstraction, not the concrete SDK.
> This makes the SDKs completely interchangeable.

---

## 🔥 BONUS: Show this summary in interview

### Adapter Pattern:

➡ Converts incompatible SDK methods into our app’s interface.

### DIP + DI:

➡ High-level code (ViewModel) depends on `PaymentGateway` (protocol), not SDKs.

### Benefit:

➡ Switch RazorPay ↔ GooglePay ↔ PhonePe anytime by changing **only the injected adapter**.   

---  

 
# Q. Does adapter pattern and repository pattern same?  

Great question 👍 — and **very common confusion**.

## ✅ Short Answer

> **No, Adapter Pattern and Repository Pattern are NOT the same.**
> They solve **different problems**, even though they may look similar sometimes.

---

## 🧠 One-Line Difference (Memorize This)

👉 **Adapter Pattern** → Makes incompatible interfaces work together
👉 **Repository Pattern** → Hides data source details and provides a clean data access API

---

## 🎯 What Problem Each Pattern Solves

## 🔹 Adapter Pattern

**Problem:**
Your code expects interface A
But a third-party / legacy API provides interface B

**Goal:**
Convert B → A

> Adapter = Translator

---

## 🔹 Repository Pattern

**Problem:**
Your app should not care where data comes from (API, DB, cache)

**Goal:**
Provide one clean interface to access data

> Repository = Data Access Abstraction

---

## 🧩 Simple Analogy

### Adapter

You speak English
Someone speaks French
Translator converts French → English

### Repository

You ask a librarian for a book
You don’t care if it comes from shelf, storage room, or another branch

---

## ✅ Adapter Example (Quick)

```swift
protocol PaymentGateway {
    func pay(amount: Double)
}
```

3rd-party SDK:

```swift
class RazorPaySDK {
    func makePayment(_ value: Double) { }
}
```

Adapter:

```swift
class RazorPayAdapter: PaymentGateway {
    private let sdk = RazorPaySDK()
    
    func pay(amount: Double) {
        sdk.makePayment(amount)
    }
}
```

👉 Converts SDK interface → App interface

---

## ✅ Repository Example (Quick)

```swift
protocol UserRepository {
    func fetchUsers() -> [User]
}
```

Remote source:

```swift
class UserAPIService {
    func getUsersFromServer() -> [User] { [] }
}
```

Repository:

```swift
class DefaultUserRepository: UserRepository {
    private let api = UserAPIService()
    
    func fetchUsers() -> [User] {
        return api.getUsersFromServer()
    }
}
```

👉 Hides WHERE data comes from

---

## 🔁 Key Difference in Table

| Aspect        | Adapter Pattern         | Repository Pattern         |
| ------------- | ----------------------- | -------------------------- |
| Category      | Structural (GoF)        | Architectural              |
| Focus         | Interface compatibility | Data access                |
| Used for      | Wrapping APIs           | Wrapping data sources      |
| Main Question | How to call this API?   | Where does data come from? |
| Typical use   | 3rd-party SDKs          | API / DB / Cache           |

---

## ⚠️ Why They Look Similar Sometimes

Because a **Repository may internally use Adapters**.

Example:

```
ViewModel → Repository → APIAdapter → Third-party SDK
```

So you might see:

* Repository wrapping an Adapter
* Adapter inside Repository

But they are still **different responsibilities**.

---

## 🎤 Interview-Ready Answer

> **Adapter Pattern is used to convert one interface into another expected by the client.
> Repository Pattern is used to abstract data access and hide whether data comes from network, database, or cache.
> They solve different problems, although a repository may internally use adapters.**

---

## ⭐ Simple Memory Trick

> Adapter = Interface mismatch
> Repository = Data source hiding

---

# Q. Adapter + Repository together in same example  

Excellent choice 👍 — this example will **lock in the difference** between:

👉 **Adapter Pattern** (make 3rd-party APIs compatible)
👉 **Repository Pattern** (hide where data / service comes from)

We’ll build a **payment system** using:

* Razorpay
* PhonePe
* GooglePay

And we’ll combine:

✅ Adapter
✅ Repository
✅ Clean architecture style

All code is **playground-runnable**.

---

## 🧠 Big Picture First

```
ViewModel
   |
   v
PaymentRepository  ← Repository (hides data source)
   |
   v
PaymentGateway (protocol)
   |
   v
Adapters
   |
   v
RazorpaySDK / PhonePeSDK / GPaySDK
```

---

## 🎯 Step 1 — App-Level Interface (What app expects)

```swift
protocol PaymentGateway {
    func pay(amount: Double) -> String
}
```

Your app will ONLY talk to this.

---

## 🎯 Step 2 — Third-Party SDKs (Pretend these are external)

```swift
class RazorpaySDK {
    func startPayment(_ amount: Double) -> String {
        return "Razorpay payment of ₹\(amount) success"
    }
}

class PhonePeSDK {
    func makeTransaction(value: Double) -> String {
        return "PhonePe payment of ₹\(value) success"
    }
}

class GooglePaySDK {
    func sendMoney(_ amount: Double) -> String {
        return "GooglePay payment of ₹\(amount) success"
    }
}
```

Notice → different method names ❌

---

## 🎯 Step 3 — Adapters (Adapter Pattern)

These **translate** SDK interface → App interface

---

### Razorpay Adapter

```swift
class RazorpayAdapter: PaymentGateway {
    private let sdk = RazorpaySDK()
    
    func pay(amount: Double) -> String {
        return sdk.startPayment(amount)
    }
}
```

---

### PhonePe Adapter

```swift
class PhonePeAdapter: PaymentGateway {
    private let sdk = PhonePeSDK()
    
    func pay(amount: Double) -> String {
        return sdk.makeTransaction(value: amount)
    }
}
```

---

### GooglePay Adapter

```swift
class GooglePayAdapter: PaymentGateway {
    private let sdk = GooglePaySDK()
    
    func pay(amount: Double) -> String {
        return sdk.sendMoney(amount)
    }
}
```

✅ Now all SDKs look the same to the app.

---

## 🧠 What Adapter Solved

* App expects → `pay(amount:)`
* SDKs provide → different methods
* Adapter converts SDK → App interface

---

## 🎯 Step 4 — Repository Interface (Repository Pattern)

```swift
protocol PaymentRepository {
    func makePayment(amount: Double) -> String
}
```

Repository represents **payment data source**.

---

## 🎯 Step 5 — Repository Implementation

```swift
class DefaultPaymentRepository: PaymentRepository {
    
    private let gateway: PaymentGateway
    
    init(gateway: PaymentGateway) {
        self.gateway = gateway
    }
    
    func makePayment(amount: Double) -> String {
        return gateway.pay(amount: amount)
    }
}
```

---

## 🧠 What Repository Solved

* ViewModel does NOT know:

  * Razorpay
  * PhonePe
  * GooglePay
* ViewModel only knows:

  * PaymentRepository

Repository hides **which payment system is used**.

---

## 🎯 Step 6 — ViewModel (Client)

```swift
class PaymentViewModel {
    
    private let repository: PaymentRepository
    
    init(repository: PaymentRepository) {
        self.repository = repository
    }
    
    func pay(amount: Double) {
        let result = repository.makePayment(amount: amount)
        print(result)
    }
}
```

---

## ▶️ Step 7 — RUNNING THE APP (Playground)

---

### Using Razorpay

```swift
let razorpayRepo = DefaultPaymentRepository(
    gateway: RazorpayAdapter()
)

let vm1 = PaymentViewModel(repository: razorpayRepo)
vm1.pay(amount: 500)
```

---

### Using PhonePe

```swift
let phonePeRepo = DefaultPaymentRepository(
    gateway: PhonePeAdapter()
)

let vm2 = PaymentViewModel(repository: phonePeRepo)
vm2.pay(amount: 800)
```

---

### Using GooglePay

```swift
let gpayRepo = DefaultPaymentRepository(
    gateway: GooglePayAdapter()
)

let vm3 = PaymentViewModel(repository: gpayRepo)
vm3.pay(amount: 1000)
```

---

## ✅ Sample Output

```
Razorpay payment of ₹500 success
PhonePe payment of ₹800 success
GooglePay payment of ₹1000 success
```

---

## 🔥 NOW THE DIFFERENCE IS CLEAR

## Adapter Pattern

```swift
class RazorpayAdapter: PaymentGateway
```

Purpose:

> Convert RazorpaySDK interface → PaymentGateway

---

## Repository Pattern

```swift
class DefaultPaymentRepository: PaymentRepository
```

Purpose:

> Hide where payment comes from (which gateway)

---

## 🧠 Simple Mental Model

* **Adapter** → Fix interface mismatch
* **Repository** → Hide data source

---

## 🎤 Interview Answer (Perfect)

> Adapter Pattern converts third-party SDK interfaces into the interface my app expects.
> Repository Pattern hides the data source and exposes a clean API to the rest of the app.
> In my payment example, adapters wrap Razorpay, PhonePe, and GooglePay, while the repository hides which gateway is being used.

---

## ⭐ One-Line Memory Trick

> Adapter = Translator
> Repository = Storefront

---

# Q. Repository vs Service vs DataSource

Perfect 👍 — let’s make this **very concrete** with a **single end-to-end example** that clearly shows:

👉 DataSource
👉 Service
👉 Repository
👉 ViewModel

All working together, **playground-runnable**, and easy to remember.

We’ll use a simple **User List** example.

---

## 🎯 Scenario

App needs to show a list of users.

Users can come from:

* Remote API
* (Later) Local cache

UI should **NOT** care where users come from.

---

## 🧱 Big Picture Architecture

```
ViewModel
   |
   v
UserRepository
   |
   v
UserService
   |
   v
UserRemoteDataSource
```

---

## 🟢 1) DataSource (Lowest Level)

👉 Talks directly to API / DB
👉 Knows HOW to fetch data

```swift
protocol UserRemoteDataSource {
    func fetchUsers() -> [String]
}
```

Concrete DataSource:

```swift
class UserAPIDataSource: UserRemoteDataSource {
    func fetchUsers() -> [String] {
        return ["Amit", "Ravi", "Neha"]
    }
}
```

### Meaning

This class represents:

> "I know how to talk to server"

Nothing else.

---

## 🟡 2) Service (Operation Layer)

👉 Uses DataSource
👉 Performs a business operation

```swift
class UserService {
    
    private let remoteDataSource: UserRemoteDataSource
    
    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getUsersFromServer() -> [String] {
        return remoteDataSource.fetchUsers()
    }
}
```

### Meaning

Service says:

> "I perform user-related operations"

It doesn’t care about UI.

---

## 🔵 3) Repository (Abstraction Layer)

👉 Hides data source
👉 ViewModel talks ONLY to Repository

```swift
protocol UserRepository {
    func getUsers() -> [String]
}
```

Concrete Repository:

```swift
class DefaultUserRepository: UserRepository {
    
    private let service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func getUsers() -> [String] {
        return service.getUsersFromServer()
    }
}
```

### Meaning

Repository says:

> "Don’t worry where users come from. I’ll give you users."

---

## 🟣 4) ViewModel (Client)

```swift
class UserViewModel {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func loadUsers() {
        let users = repository.getUsers()
        print("Users:", users)
    }
}
```

ViewModel does NOT know:

* API
* URLSession
* DataSource
* Service

It only knows Repository.

---

## ▶️ 5) Wire Everything Together (RUN THIS)

```swift
let dataSource = UserAPIDataSource()
let service = UserService(remoteDataSource: dataSource)
let repository = DefaultUserRepository(service: service)
let viewModel = UserViewModel(repository: repository)

viewModel.loadUsers()
```

---

## ✅ Output

```
Users: ["Amit", "Ravi", "Neha"]
```

---

## 🧠 Now Let’s Understand Roles Clearly

---

## 🟢 DataSource

```swift
UserAPIDataSource
```

Responsible for:
👉 Talking to API

Does NOT know:

* ViewModel
* Repository
* UI

---

## 🟡 Service

```swift
UserService
```

Responsible for:
👉 User-related operations

Does NOT know:

* UI
* ViewModel

---

## 🔵 Repository

```swift
DefaultUserRepository
```

Responsible for:
👉 Hiding where data comes from

Does NOT know:

* API details
* UI

---

## 🟣 ViewModel

```swift
UserViewModel
```

Responsible for:
👉 Preparing data for UI

Does NOT know:

* API
* Service
* DataSource

---

## 🧩 Why We Need All Three?

### If ViewModel talks directly to DataSource:

```swift
let users = api.fetchUsers()
```

❌ ViewModel tightly coupled to API
❌ Hard to change
❌ Hard to test

---

### With Repository

```swift
let users = repository.getUsers()
```

✅ Clean
✅ Testable
✅ Flexible

---

## 🔥 Interview Comparison Table

| Concept    | Purpose                    |
| ---------- | -------------------------- |
| DataSource | Fetch data from one place  |
| Service    | Perform business operation |
| Repository | Hide source of data        |

---

## 🎤 Interview Answer (Perfect)

> DataSource is responsible for fetching data from a single source like API or database.
> Service performs domain operations using data sources.
> Repository hides where the data comes from and exposes a clean API to ViewModels.

---

## ⭐ Memory Trick

> **DataSource → Fetch**
> **Service → Process**
> **Repository → Hide**

---




 










