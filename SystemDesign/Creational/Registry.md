
# **Registry Pattern**

## ✅ One-Line Definition (MEMORIZE)

> **Registry Pattern maintains a central place where objects or factories are registered and can be looked up by a key.**

Even simpler:

> **Registry is a dictionary of objects.**

---

## 🧠 Why Registry Pattern Exists

Sometimes:

* You don’t know all object types at compile time
* You want to plug new implementations dynamically
* You want decoupling between creators and users
* You don’t want huge `switch` statements

Registry solves this:

```
Register → Lookup → Use
```

---

## 🎯 When to Think of Registry

Think **Registry** when:

✅ Many implementations of same protocol
✅ Want runtime extensibility
✅ Plugin architecture
✅ Service discovery
✅ Key-based lookup

Memory hook:

> **Need to store & find implementations → Registry**

---

## 🧱 Core Idea

```
Registry
 ├─ key → Object / Factory
 ├─ key → Object / Factory
 └─ key → Object / Factory
```

---

## ❌ Without Registry (Bad)

```swift
func makePayment(type: String) -> Payment {
    switch type {
    case "card": return CardPayment()
    case "upi": return UpiPayment()
    default: fatalError()
    }
}
```

Hard to extend.

---

## ✅ With Registry (Production-Grade Example)

We’ll build a **Payment Registry** that:

* Registers factories
* Creates objects by key
* Thread-safe
* Supports override & removal

---

## Step 1️⃣ Product Protocol

```swift
protocol Payment {
    func pay(amount: Double)
}
```

---

## Step 2️⃣ Concrete Implementations

```swift
final class CardPayment: Payment {
    func pay(amount: Double) {
        print("Paid \(amount) using Card")
    }
}

final class UpiPayment: Payment {
    func pay(amount: Double) {
        print("Paid \(amount) using UPI")
    }
}
```

---

## Step 3️⃣ Registry

```swift
final class PaymentRegistry {

    typealias Factory = () -> Payment

    private var factories: [String: Factory] = [:]
    private let lock = NSLock()

    func register(key: String, factory: @escaping Factory) {
        lock.lock()
        factories[key] = factory
        lock.unlock()
    }

    func unregister(key: String) {
        lock.lock()
        factories.removeValue(forKey: key)
        lock.unlock()
    }

    func create(key: String) -> Payment? {
        lock.lock()
        let factory = factories[key]
        lock.unlock()
        return factory?()
    }
}
```

---

## Step 4️⃣ Registration (App Startup)

```swift
let registry = PaymentRegistry()

registry.register(key: "card") {
    CardPayment()
}

registry.register(key: "upi") {
    UpiPayment()
}
```

---

## Step 5️⃣ Usage

```swift
let payment = registry.create(key: "upi")
payment?.pay(amount: 500)
```

---

## 🧠 Why This Is Production Grade

✔ Centralized storage
✔ No switch-case
✔ Thread-safe
✔ Extensible at runtime
✔ Decoupled from concrete classes

---

## 🏗️ Registry vs Factory

* Factory → Creates objects
* Registry → Stores and finds factories/objects

Often used together:

```
Registry stores factories
Factory creates objects
```

---

## ⚡ Advanced Variant: Register Instances (Not Factories)

```swift
func registerInstance(key: String, instance: Payment)
```

Use when objects are:

* Singleton-like
* Heavy
* Shared

---

## 🧩 Edge Cases & Solutions

---

### ✅ Missing Key

```swift
guard let payment = registry.create(key: type) else {
    throw RegistryError.notFound
}
```

---

### ✅ Key Collision

Decide policy:

* Override existing
* Throw error
* Ignore

```swift
if factories[key] != nil {
    print("Overriding existing registration")
}
```

---

### ✅ Thread Safety

Use:

* `NSLock`
* `DispatchQueue`
* or `actor`

Actor version:

```swift
actor PaymentRegistry { ... }
```

---

### ✅ Lifecycle Management

If registry stores instances:

* Who owns them?
* When deallocated?

Usually registry owns.

---

### ✅ Memory Leaks

Avoid strong reference cycles inside stored closures.

---

### ✅ Typed Registry (Advanced)

Use generics or multiple registries per type.

---

## 🧠 Real-World Uses

* Dependency Injection containers
* Plugin systems
* Serialization type mapping
* Command handlers
* Feature toggles

---

## 🎯 Interview-Ready Explanation

> “Registry pattern maintains a central store that maps keys to objects or factories. Clients ask the registry for an object by key instead of creating it directly. This removes conditional logic and allows dynamic registration of new implementations.”

---

## 🧠 One-Line Memory Hook

> **Registry = Map of name → object**

---

## ❓ Common Interview Questions

---

### Q1: Registry vs Factory?

> Factory creates objects. Registry stores and looks up factories or objects.

---

### Q2: Registry vs Service Locator?

> Service Locator is a specialized registry focused on services and dependencies.

---

### Q3: Is Registry a creational pattern?

> It’s usually considered an **architectural / organizational** pattern.

---

### Q4: When not to use Registry?

> When dependencies should be explicit (use DI instead).

---

### Q5: Is Registry an anti-pattern?

> It can be, if abused as a global service locator. Prefer constructor injection when possible.

---

### Q6: Registry vs Dictionary?

> Registry adds abstraction, lifecycle rules, and lookup semantics on top of a dictionary.

---

## 🧪 Mini Interview Exercise

You have multiple payment methods added by different teams without modifying core code.

👉 Use Registry.

---

## 🏁 Final Summary

* Registry stores mappings
* Clients lookup by key
* Enables dynamic extension
* Often combined with Factory



