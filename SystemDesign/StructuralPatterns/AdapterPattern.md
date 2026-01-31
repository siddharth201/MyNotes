
# **Adapter Pattern**

> Adapter Pattern helps achieve loose coupling by introducing an abstraction.
Our app depends only on our interface, while the Adapter translates calls to the 3rd-party or legacy API.
If the external API changes or we replace it, only the Adapter needs modification — the rest of the code stays untouched.
It works beautifully with Dependency Injection and Dependency Inversion.  


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










