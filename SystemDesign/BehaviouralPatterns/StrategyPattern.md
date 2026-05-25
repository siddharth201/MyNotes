
# 🧠 STRATEGY PATTERN

The **`Strategy Design Pattern`** is a **`behavioral design pattern`** that allows you to define a **`family of algorithms`**, **`encapsulate each one in a separate class`**, and **`make them interchangeable`**.   
 
* Encapsulates different algorithms into separate strategy classes, allowing dynamic selection or switching at runtime.  
  
* Promotes flexibility by reducing complex conditional logic and making code easier to maintain.

We usually **`combine Strategy with Factory`** — Factory decides which strategy to create based on runtime input, and the context uses it without knowing the implementation.

Examples include **`Google Maps navigation modes`** and **`payment methods`**.  

#### Simple & Perfect Definition (Use this in interview)

> **Strategy Pattern is used when the same task can be done in multiple ways, and we want to choose the way at runtime without changing existing code.**

---

## 🗺️ EXAMPLE 1: GOOGLE MAPS NAVIGATION (RUNNABLE)

## 🎯 Problem

Google Maps lets you choose:

* 🚗 Driving
* 🚶 Walking
* 🚲 Cycling

Destination is same → route calculation changes.

This is **Strategy Pattern**.

---

## 1️⃣ Strategy Protocol

```swift
protocol RouteStrategy {
    func buildRoute(from source: String, to destination: String) -> String
}
```

---

## 2️⃣ Concrete Strategies

```swift
class DrivingRouteStrategy: RouteStrategy {
    func buildRoute(from source: String, to destination: String) -> String {
        return "Driving route from \(source) to \(destination) (30 mins)"
    }
}

class WalkingRouteStrategy: RouteStrategy {
    func buildRoute(from source: String, to destination: String) -> String {
        return "Walking route from \(source) to \(destination) (2 hours)"
    }
}

class CyclingRouteStrategy: RouteStrategy {
    func buildRoute(from source: String, to destination: String) -> String {
        return "Cycling route from \(source) to \(destination) (1 hour)"
    }
}
```

---

## 3️⃣ Factory to Get Strategy at Runtime ✅

```swift
enum TravelMode {
    case driving, walking, cycling
}

class RouteStrategyFactory {
    static func makeStrategy(for mode: TravelMode) -> RouteStrategy {
        switch mode {
        case .driving:
            return DrivingRouteStrategy()
        case .walking:
            return WalkingRouteStrategy()
        case .cycling:
            return CyclingRouteStrategy()
        }
    }
}
```

---

## 4️⃣ Context (Google Maps Engine)

```swift
class GoogleMapsNavigator {
    private let strategy: RouteStrategy
    
    init(strategy: RouteStrategy) {
        self.strategy = strategy
    }
    
    func showRoute(from source: String, to destination: String) {
        let route = strategy.buildRoute(from: source, to: destination)
        print(route)
    }
}
```

---

## 5️⃣ RUN THIS (Playground)

```swift
let mode: TravelMode = .cycling

let strategy = RouteStrategyFactory.makeStrategy(for: mode)
let navigator = GoogleMapsNavigator(strategy: strategy)

navigator.showRoute(from: "Home", to: "Office")
```

### ✅ Output

```
Cycling route from Home to Office (1 hour)
```

👉 Change `.cycling` to `.driving` or `.walking`
👉 NO change in `GoogleMapsNavigator`
👉 **Strategy changed at runtime**

---

## 💳 EXAMPLE 2: PAYMENT SYSTEM (RUNNABLE)

## 🎯 Problem

User can pay via:

* Card
* UPI
* Wallet

Instead of `if–else`, use **Strategy**.

---

## 1️⃣ Strategy Protocol

```swift
protocol PaymentStrategy {
    func pay(amount: Double)
}
```

---

## 2️⃣ Concrete Strategies

```swift
class CardPaymentStrategy: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Card")
    }
}

class UPIPaymentStrategy: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using UPI")
    }
}

class WalletPaymentStrategy: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Wallet")
    }
}
```

---

## 3️⃣ Factory to Select Strategy at Runtime ✅

```swift
enum PaymentMethod {
    case card, upi, wallet
}

class PaymentStrategyFactory {
    static func makeStrategy(for method: PaymentMethod) -> PaymentStrategy {
        switch method {
        case .card:
            return CardPaymentStrategy()
        case .upi:
            return UPIPaymentStrategy()
        case .wallet:
            return WalletPaymentStrategy()
        }
    }
}
```

---

## 4️⃣ Context (Checkout)

```swift
class Checkout {
    private let strategy: PaymentStrategy
    
    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }
    
    func pay(amount: Double) {
        strategy.pay(amount: amount)
    }
}
```

---

## 5️⃣ RUN THIS (Playground)

```swift
let method: PaymentMethod = .upi

let strategy = PaymentStrategyFactory.makeStrategy(for: method)
let checkout = Checkout(strategy: strategy)

checkout.pay(amount: 999)
```

### ✅ Output

```
Paid ₹999.0 using UPI
```

👉 Change `.upi` to `.card` or `.wallet`
👉 Checkout code never changes
👉 Strategy swaps dynamically

---

## 🧠 WHY STRATEGY + FACTORY IS PERFECT

| Pattern      | Responsibility                        |
| ------------ | ------------------------------------- |
| **Strategy** | Encapsulates algorithms               |
| **Factory**  | Decides which strategy to create      |
| **Context**  | Uses strategy without knowing details |

This combo:

* Removes `if–else`
* Follows Open/Closed Principle
* Is very testable
* Is industry standard

---

## ⭐ MEMORY TRICK

> **Strategy = HOW to do something
> Factory = WHICH strategy to use**

---

# Q. So can we say if we have to achive same thing but we have many ways to do than we will use strategy patterns, I need a simple definition as above definitions seems bit more technical and difficult to understand, also let me know how I should I start thinking that for a given scenario I should use strategy pattern , with same example of payment and navigation without using strategy pattern and than same implementation with strategy.  

Great question — you’re thinking in **exactly the right direction** 👍
Let’s simplify this **to the level your brain can instantly recognize Strategy in real problems**.

---

## ✅ 1️⃣ Can we say this? (Your sentence, refined)

You said:

> *“If we have to achieve the same thing but we have many ways to do it, then we will use Strategy pattern.”*

### ✔ YES — this is **100% correct**

This is actually the **best beginner definition**.

### ⭐ Simple & Perfect Definition (Use this in interview)

> **Strategy Pattern is used when we want to do the same task, but there are multiple ways to do it, and we want to choose one way at runtime.**

That’s it.
No technical jargon needed.

---

## 🧠 2️⃣ How should you START THINKING about Strategy?

Ask yourself **only these 3 questions**:

### ❓ Question 1

👉 *Is the goal same?*
Example:

* Make payment ✅
* Find route ✅

### ❓ Question 2

👉 *Are there multiple ways to do it?*
Example:

* Pay via Card / UPI / Wallet
* Route via Driving / Walking / Cycling

### ❓ Question 3

👉 *Will I need to add more ways in future?*
Example:

* New payment method
* New travel mode

### ✅ If ALL are YES → **Strategy Pattern**

---

## 🚫 3️⃣ SAME EXAMPLES — WITHOUT Strategy Pattern (BAD WAY)

Let’s first see **why Strategy is needed**.

---

## 💳 PAYMENT — ❌ WITHOUT STRATEGY

```swift
class Checkout {
    func pay(amount: Double, method: String) {
        if method == "card" {
            print("Paid ₹\(amount) using Card")
        } else if method == "upi" {
            print("Paid ₹\(amount) using UPI")
        } else if method == "wallet" {
            print("Paid ₹\(amount) using Wallet")
        }
    }
}
```

Usage:

```swift
let checkout = Checkout()
checkout.pay(amount: 500, method: "upi")
```

### ❌ Problems

* Too many `if-else`
* Every new payment method → modify this class
* Violates Open/Closed Principle
* Hard to test
* Hard to read

---

## 🗺️ NAVIGATION — ❌ WITHOUT STRATEGY

```swift
class Navigator {
    func getRoute(mode: String) {
        if mode == "driving" {
            print("Driving route (30 mins)")
        } else if mode == "walking" {
            print("Walking route (2 hours)")
        } else if mode == "cycling" {
            print("Cycling route (1 hour)")
        }
    }
}
```

Usage:

```swift
let nav = Navigator()
nav.getRoute(mode: "cycling")
```

### ❌ Same problems again

---

## ✅ 4️⃣ SAME EXAMPLES — WITH STRATEGY PATTERN (GOOD WAY)

Now we fix the problem properly.

---

## 💳 PAYMENT — ✅ WITH STRATEGY

### Step 1: Strategy (ways to pay)

```swift
protocol PaymentStrategy {
    func pay(amount: Double)
}
```

```swift
class CardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Card")
    }
}

class UPIPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using UPI")
    }
}

class WalletPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Wallet")
    }
}
```

---

### Step 2: Context (same task)

```swift
class Checkout {
    private let strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func pay(amount: Double) {
        strategy.pay(amount: amount)
    }
}
```

---

### Step 3: Run (Playground)

```swift
let checkout = Checkout(strategy: UPIPayment())
checkout.pay(amount: 500)
```

### ✅ Benefits

* No `if-else`
* Add new payment → new class only
* Checkout code never changes

---

## 🗺️ NAVIGATION — ✅ WITH STRATEGY

### Step 1: Strategy

```swift
protocol RouteStrategy {
    func buildRoute()
}
```

```swift
class DrivingRoute: RouteStrategy {
    func buildRoute() {
        print("Driving route (30 mins)")
    }
}

class WalkingRoute: RouteStrategy {
    func buildRoute() {
        print("Walking route (2 hours)")
    }
}

class CyclingRoute: RouteStrategy {
    func buildRoute() {
        print("Cycling route (1 hour)")
    }
}
```

---

### Step 2: Context

```swift
class Navigator {
    private let strategy: RouteStrategy

    init(strategy: RouteStrategy) {
        self.strategy = strategy
    }

    func showRoute() {
        strategy.buildRoute()
    }
}
```

---

### Step 3: Run

```swift
let navigator = Navigator(strategy: CyclingRoute())
navigator.showRoute()
```

---

## 🧠 5️⃣ VERY IMPORTANT MENTAL MODEL (REMEMBER THIS)

### ❌ Bad smell (No Strategy)

```swift
if type == A { }
else if type == B { }
else if type == C { }
```

### ✅ Good design (Strategy)

```swift
strategy.doWork()
```

---

## 🎤 6️⃣ FINAL INTERVIEW-FRIENDLY ANSWERS

### ✅ Super Simple Definition (Best)

> **Strategy Pattern is used when the same task can be done in multiple ways, and we want to choose the way at runtime without changing existing code.**

---

### ✅ How to identify Strategy (Say this)

> *If I see multiple `if-else` blocks doing the same job in different ways, I think of Strategy Pattern.*

---

### ⭐ One-line Memory Trick

> **Strategy = Same goal, different ways.**

---


# Q. for with strategy examples add factory methods as well and the step number where i should introduce it?

Perfect follow-up 👍
This is exactly the **right way to think about Strategy + Factory**.

I’ll do this in **three parts**, very clearly:

1️⃣ **Simple definition (non-technical)**
2️⃣ **WHEN and WHERE to introduce Factory in Strategy (step number)**
3️⃣ **Same examples (Payment & Navigation)**
  ❌ without Strategy
  ✅ with Strategy
  ✅ with Strategy + Factory (final form)

All code is **playground runnable**.

---

## 1️⃣ Simple definition (use this in interview)

> **Strategy Pattern is used when we want to do the same task, but there are multiple ways to do it, and we want to choose one way at runtime.**

👉 That’s it.
No jargon. 100% correct.

---

## 2️⃣ WHEN should you introduce Factory with Strategy?

### 🧠 Very important thinking rule

### ❌ Strategy ALONE is enough when:

* The caller **already knows** which strategy to use
* Example:

  ```swift
  Checkout(strategy: UPIPayment())
  ```

### ✅ Strategy + Factory is needed when:

* The choice comes from:

  * user input
  * server response
  * config
  * enum / string / API value
* You see logic like:

  ```swift
  if method == "upi" { ... }
  ```

👉 **The moment you see this**, introduce **Factory**.

---

## ✅ Correct order of steps (VERY IMPORTANT)

### Step 1️⃣

Identify **same goal, different ways** → Strategy

### Step 2️⃣

Create **Strategy interface + implementations**

### Step 3️⃣

Create **Context** (class that uses the strategy)

### Step 4️⃣ ⭐ (IMPORTANT)

When strategy selection depends on runtime input → **add Factory**

---

## 💳 EXAMPLE 1: PAYMENT

---

## ❌ WITHOUT STRATEGY (bad design)

```swift
class Checkout {
    func pay(amount: Double, method: String) {
        if method == "card" {
            print("Paid ₹\(amount) using Card")
        } else if method == "upi" {
            print("Paid ₹\(amount) using UPI")
        } else if method == "wallet" {
            print("Paid ₹\(amount) using Wallet")
        }
    }
}
```

🔴 Problem:

* `if-else`
* Not scalable
* Hard to maintain

---

## ✅ WITH STRATEGY (Step 1–3)

### Step 1️⃣ Strategy interface

```swift
protocol PaymentStrategy {
    func pay(amount: Double)
}
```

### Step 2️⃣ Concrete strategies

```swift
class CardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Card")
    }
}

class UPIPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using UPI")
    }
}

class WalletPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Wallet")
    }
}
```

### Step 3️⃣ Context

```swift
class Checkout {
    private let strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func pay(amount: Double) {
        strategy.pay(amount: amount)
    }
}
```

Usage:

```swift
let checkout = Checkout(strategy: UPIPayment())
checkout.pay(amount: 500)
```

✔ Clean
✔ No `if-else`

---

## ⭐ NOW Step 4️⃣ — ADD FACTORY (runtime decision)

### When?

When payment method comes as:

* `"upi"`
* API response
* user selection

---

### Step 4️⃣ Factory

```swift
enum PaymentMethod {
    case card, upi, wallet
}

class PaymentStrategyFactory {
    static func makeStrategy(method: PaymentMethod) -> PaymentStrategy {
        switch method {
        case .card:
            return CardPayment()
        case .upi:
            return UPIPayment()
        case .wallet:
            return WalletPayment()
        }
    }
}
```

---

### Final usage (BEST DESIGN)

```swift
let methodFromUI: PaymentMethod = .upi

let strategy = PaymentStrategyFactory.makeStrategy(method: methodFromUI)
let checkout = Checkout(strategy: strategy)

checkout.pay(amount: 500)
```

✅ Strategy handles *how*
✅ Factory handles *which one*

---

## 🗺️ EXAMPLE 2: GOOGLE MAPS NAVIGATION

---

## ❌ WITHOUT STRATEGY

```swift
class Navigator {
    func showRoute(mode: String) {
        if mode == "driving" {
            print("Driving route (30 mins)")
        } else if mode == "walking" {
            print("Walking route (2 hours)")
        } else if mode == "cycling" {
            print("Cycling route (1 hour)")
        }
    }
}
```

🔴 Same problems again.

---

## ✅ WITH STRATEGY (Step 1–3)

### Step 1️⃣ Strategy

```swift
protocol RouteStrategy {
    func buildRoute()
}
```

### Step 2️⃣ Concrete strategies

```swift
class DrivingRoute: RouteStrategy {
    func buildRoute() {
        print("Driving route (30 mins)")
    }
}

class WalkingRoute: RouteStrategy {
    func buildRoute() {
        print("Walking route (2 hours)")
    }
}

class CyclingRoute: RouteStrategy {
    func buildRoute() {
        print("Cycling route (1 hour)")
    }
}
```

### Step 3️⃣ Context

```swift
class Navigator {
    private let strategy: RouteStrategy

    init(strategy: RouteStrategy) {
        self.strategy = strategy
    }

    func showRoute() {
        strategy.buildRoute()
    }
}
```

---

## ⭐ Step 4️⃣ — ADD FACTORY (runtime selection)

### Factory

```swift
enum TravelMode {
    case driving, walking, cycling
}

class RouteStrategyFactory {
    static func makeStrategy(mode: TravelMode) -> RouteStrategy {
        switch mode {
        case .driving:
            return DrivingRoute()
        case .walking:
            return WalkingRoute()
        case .cycling:
            return CyclingRoute()
        }
    }
}
```

---

### Final usage

```swift
let selectedMode: TravelMode = .cycling

let strategy = RouteStrategyFactory.makeStrategy(mode: selectedMode)
let navigator = Navigator(strategy: strategy)

navigator.showRoute()
```

---

## 🧠 FINAL THINKING RULE (REMEMBER THIS)

### Strategy answers:

> **HOW to do it**

### Factory answers:

> **WHICH strategy to use**

---

## 🎤 PERFECT INTERVIEW ANSWER (Simple)

> *When the same task can be done in multiple ways, I use the Strategy Pattern.
> When the choice of strategy depends on runtime input like user selection or API data, I introduce a Factory to create the appropriate strategy.*

---

## ⭐ One-line memory trick

> **Strategy = different ways
> Factory = choose the way**




