Let’s break this down in a **clear, practical, and interview-friendly way** 👇

You’re essentially comparing **three programming paradigms**:

* **Procedural Programming**
* **Object-Oriented Programming (OOP)**
* **POP (Protocol-Oriented Programming)**

---

# 🔹 1) Procedural Programming

### ✅ Core Idea

Program is organized as a **sequence of procedures (functions)** that operate on data.

> Focus = *What steps to perform*

### Characteristics

* Functions are primary building blocks
* Data is usually separate from functions
* Top-down approach
* Minimal abstraction

### Small Example (Swift-like)

```swift
var balance = 1000

func deposit(amount: Int) {
    balance += amount
}

func withdraw(amount: Int) {
    balance -= amount
}

deposit(amount: 500)
withdraw(amount: 200)
```

Here:

* `balance` is global
* Functions directly manipulate it

### Pros

* Simple and easy to learn
* Fast to write for small programs

### Cons

* Hard to maintain as project grows
* No strong data protection
* Poor scalability

### When to Use

* Scripts
* Small utilities
* Simple algorithms

---

# 🔹 2) Object-Oriented Programming (OOP)

### ✅ Core Idea

Program is built around **objects** that bundle **data + behavior**.

> Focus = *Who performs the action*

### Core Pillars

* Encapsulation
* Inheritance
* Polymorphism
* Abstraction

### Example

```swift
class BankAccount {
    private var balance: Int = 0

    func deposit(amount: Int) {
        balance += amount
    }

    func withdraw(amount: Int) {
        balance -= amount
    }
}

let account = BankAccount()
account.deposit(amount: 500)
```

Here:

* Data and functions live together
* `balance` is protected

### Pros

* Clear structure
* Reusable components
* Easier maintenance than procedural

### Cons

* Inheritance chains become complex
* Tight coupling possible
* Hard to change base classes later

### When to Use

* Large applications
* UI-heavy apps
* Domain modeling

---

# 🔹 3) Protocol-Oriented Programming (POP)

### ✅ Core Idea

Program is designed around **protocols (interfaces) + value types**.

> Focus = *What capabilities a type has*

Instead of:

> “This object IS-A class”

POP says:

> “This type CAN-DO these behaviors”

### Example

```swift
protocol Depositable {
    func deposit(amount: Int)
}

protocol Withdrawable {
    func withdraw(amount: Int)
}

struct BankAccount: Depositable, Withdrawable {
    private var balance: Int = 0

    func deposit(amount: Int) {
        print("Depositing \(amount)")
    }

    func withdraw(amount: Int) {
        print("Withdrawing \(amount)")
    }
}
```

### With Default Implementations

```swift
protocol Depositable {
    func deposit(amount: Int)
}

extension Depositable {
    func deposit(amount: Int) {
        print("Default deposit: \(amount)")
    }
}
```

### Pros

* Composition over inheritance
* Safer with value types (struct)
* Easy to test and mock
* Highly flexible

### Cons

* Can feel abstract initially
* Requires good design thinking

### When to Use

* Modern Swift development
* Large scalable systems
* Clean Architecture

---

# ⚖️ High-Level Comparison

| Feature         | Procedural | OOP          | POP          |
| --------------- | ---------- | ------------ | ------------ |
| Main Unit       | Function   | Class/Object | Protocol     |
| Focus           | Steps      | Objects      | Capabilities |
| Data Protection | ❌          | ✅            | ✅            |
| Reusability     | Low        | Medium       | High         |
| Scalability     | Low        | Medium       | High         |
| Inheritance     | ❌          | ✅            | ❌            |
| Composition     | ❌          | Limited      | ✅            |

---

# 🧠 Mental Model

* **Procedural** → "Do this, then that"
* **OOP** → "This object does this"
* **POP** → "Anything that conforms can do this"

---

# 🎯 Real-World Analogy

### Restaurant Example

**Procedural**

```
cookFood()
serveFood()
cleanTable()
```

**OOP**

```
Chef.cook()
Waiter.serve()
Cleaner.clean()
```

**POP**

```
protocol Cookable
protocol Serveable
protocol Cleanable

Robot : Cookable, Serveable
Human : Cookable, Cleanable
```

---

# ⭐ Interview One-Liner

* **Procedural:** Organizes code around functions.
* **OOP:** Organizes code around objects combining data and behavior.
* **POP:** Organizes code around protocols defining behavior, favoring composition over inheritance.

---

If you want, next we can go deeper into:

👉 **Why Swift prefers POP over OOP**
👉 **Class vs Struct vs Protocol in real architecture**
👉 **How POP fits into Clean Architecture**

Just tell me 👍

