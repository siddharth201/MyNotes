
# Factory Design Pattern

## 1️⃣ What is Factory Design Pattern? (One-line)

> **Factory pattern hides object creation logic and returns the required object based on a condition.**  

When object creation depends on some condition, we move that logic to a factory so the rest of the code stays clean.

---

## 2️⃣ Why does Factory Pattern exist?

Because **object creation can become complex and scattered**.

Without a factory:

* `if/else` or `switch` logic spreads everywhere
* Code becomes **tightly coupled**
* Adding a new type requires modifying many files ❌

Factory solves this by:

* Putting **creation logic in one place**
* Returning objects via **protocols / interfaces**
* Making code **open for extension, closed for modification (OCP)** ✅

---

## 3️⃣ When should you THINK of Factory Pattern? (KEY INTERVIEW TRIGGER 🚨)

Think **Factory** when you hear or see:

✅ “Based on some condition, create different objects”
✅ `switch` / `if-else` creating multiple subclasses
✅ Caller **should not care** about exact class
✅ Future **new types may be added**
✅ You want to **hide `init()` logic**

👉 **Rule to memorize**

> If object creation depends on a decision → **Factory**

---

## 4️⃣ Simple Example WITHOUT Factory ❌

### Problem: Create different payment methods

```swift
protocol Payment {
    func pay(amount: Double)
}

class CreditCardPayment: Payment {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Credit Card")
    }
}

class UpiPayment: Payment {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using UPI")
    }
}
```

### Usage (❌ BAD DESIGN)

```swift
let paymentType = "upi"
let payment: Payment

if paymentType == "credit" {
    payment = CreditCardPayment()
} else {
    payment = UpiPayment()
}

payment.pay(amount: 500)
```

### ❌ Problems

* `if/else` in calling code
* Tight coupling with concrete classes
* Adding `NetBankingPayment` means modifying **everywhere**

---

## 5️⃣ SAME Example WITH Factory ✅ (BEST PRACTICE)

### Step 1: Keep protocol and classes SAME

```swift
protocol Payment {
    func pay(amount: Double)
}

class CreditCardPayment: Payment {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using Credit Card")
    }
}

class UpiPayment: Payment {
    func pay(amount: Double) {
        print("Paid ₹\(amount) using UPI")
    }
}
```

---

### Step 2: Create Factory 🏭

```swift
enum PaymentType {
    case creditCard
    case upi
}

class PaymentFactory {
    static func makePayment(type: PaymentType) -> Payment {
        switch type {
        case .creditCard:
            return CreditCardPayment()
        case .upi:
            return UpiPayment()
        }
    }
}
```

---

### Step 3: Usage (✅ CLEAN)

```swift
let payment = PaymentFactory.makePayment(type: .upi)
payment.pay(amount: 500)
```

---

## 6️⃣ Why THIS is Factory Pattern? (Interview Explanation)

✔ Object creation is **centralized**
✔ Caller depends on **Payment (abstraction)**
✔ Concrete classes are **hidden**
✔ Easy to add new payment type
✔ Follows **SOLID principles (OCP + DIP)**

---

## 7️⃣ Factory is NOT about ❌

❌ Avoiding `init()`
❌ Creating only one object (that’s Singleton)
❌ Reducing lines of code

---

## 8️⃣ Factory IS about ✅ (MEMORIZE THIS)

✅ **Hiding object creation**
✅ **Returning abstraction (protocol)**
✅ **Encapsulating decision logic**
✅ **Reducing coupling**

---

## 9️⃣ One-Line Interview Answer 💡

> “Factory pattern is used when object creation depends on a condition and we want to hide that creation logic behind a common interface.”

---

## 🔟 Quick Memory Trick 🧠

> **If your code says:**
> “If this → create A, else → create B”
> 👉 **You need a Factory**

---  

# Factory Design Pattern vs Factory method?  

Great question 👍 — this confusion is **very common** in interviews.

Let’s cleanly separate:

👉 **Factory Pattern (Simple Factory)**
👉 **Factory Method Pattern**

And give you a **crystal-clear mental model + examples + interview-ready lines**.

---

## ✅ First: Big Picture

> **Factory Pattern** is a *concept*.
> **Factory Method** is a *specific GoF design pattern* that implements that concept using inheritance.

Think:

```
Factory (idea)
   |
   └── Factory Method (formal pattern)
```

---

## 🧠 One-Line Difference (Memorize)

> **Factory Pattern uses conditionals (if/switch).**
> **Factory Method uses polymorphism (subclassing).**

---

## 🧱 Factory Pattern (Simple Factory)

### What it is

A separate class with a method that decides which object to create.

### Structure

```
Caller → Factory → Product
```

### Example

```swift
protocol Payment {
    func pay()
}

class CardPayment: Payment {
    func pay() { print("Card Payment") }
}

class UpiPayment: Payment {
    func pay() { print("UPI Payment") }
}

enum PaymentType {
    case card, upi
}

class PaymentFactory {
    static func make(type: PaymentType) -> Payment {
        switch type {
        case .card: return CardPayment()
        case .upi: return UpiPayment()
        }
    }
}
```

### Usage

```swift
let payment = PaymentFactory.make(type: .card)
payment.pay()
```

---

### Characteristics

✅ Central factory class
✅ Uses switch / if
❌ Need to modify factory when new type added

---

## 🏭 Factory Method Pattern

### What it is

Base class defines a **factory method**.
Subclasses decide which object to create.

### Structure

```
Creator (base class)
   |
   └── createProduct()  ← factory method
         ↑
   Subclass overrides
```

---

### Example

```swift
protocol Button {
    func render()
}

class IOSButton: Button {
    func render() { print("iOS Button") }
}

class AndroidButton: Button {
    func render() { print("Android Button") }
}
```

### Creator

```swift
class Screen {
    func createButton() -> Button {
        fatalError("Override in subclass")
    }

    func show() {
        let button = createButton()
        button.render()
    }
}
```

### Subclasses

```swift
class IOSScreen: Screen {
    override func createButton() -> Button {
        IOSButton()
    }
}

class AndroidScreen: Screen {
    override func createButton() -> Button {
        AndroidButton()
    }
}
```

### Usage

```swift
let screen = IOSScreen()
screen.show()
```

---

### Characteristics

✅ No switch-case
✅ Uses polymorphism
✅ Open for extension

---

## 📊 Side-by-Side Comparison

| Aspect           | Factory Pattern        | Factory Method         |
| ---------------- | ---------------------- | ---------------------- |
| Category         | Idiom / Simple pattern | GoF Creational Pattern |
| Creation logic   | In factory class       | In subclasses          |
| Uses inheritance | ❌                      | ✅                      |
| Uses switch/if   | ✅                      | ❌                      |
| Extensibility    | Medium                 | High                   |
| Complexity       | Low                    | Medium                 |

---

## 🎯 When to Use Which

### Use Factory Pattern when:

* Few types
* Simple creation
* App-level utility

### Use Factory Method when:

* Framework / SDK design
* Want subclasses to decide
* Many future extensions

---

## 🧠 Mental Model

### Factory Pattern

```
One Factory → Many Products
```

### Factory Method

```
Many Subclasses → Each decides product
```

---

## 🎯 Interview-Ready Answer

> “Factory Pattern centralizes object creation using a separate factory class, usually with conditionals. Factory Method is a GoF pattern where a base class defines a method for creating objects and subclasses decide which concrete class to instantiate using polymorphism.”

---

## 🧠 One-Line Memory Hook

> **If you see switch → Factory Pattern**
> **If you see override → Factory Method**

---

## ⚡ Common Follow-Up

**Q: Which is better?**

Answer:

> “Neither is better universally. Factory Pattern is simpler, while Factory Method is more extensible and follows Open–Closed Principle.”

---

## 🏁 Final Summary

* Factory Pattern → Simple, conditional-based
* Factory Method → Polymorphic, extensible
* Both hide object creation

---



