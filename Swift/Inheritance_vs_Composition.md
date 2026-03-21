
Here’s a **clear, interview-ready explanation** of **Composition vs Inheritance in Swift** 👇

---

# 🔹 Inheritance in Swift

👉 **Definition:**
Inheritance allows a class to **reuse and extend behavior** from another class.

### Example:

```swift
class Animal {
    func speak() {
        print("Animal speaks")
    }
}

class Dog: Animal {
    override func speak() {
        print("Dog barks")
    }
}
```

### Usage:

```swift
let dog = Dog()
dog.speak()  // Dog barks
```

---

## 🔹 Key Points (Inheritance)

* Uses `class` only (structs cannot inherit)
* Supports **method overriding**
* Creates **"is-a" relationship**

  * Dog *is an* Animal
* Tight coupling between classes

---

# 🔹 Composition in Swift

👉 **Definition:**
Composition means building a type using **other types as properties**.

### Example:

```swift
struct Engine {
    func start() {
        print("Engine started")
    }
}

struct Car {
    let engine: Engine
    
    func drive() {
        engine.start()
        print("Car is moving")
    }
}
```

### Usage:

```swift
let car = Car(engine: Engine())
car.drive()
```

---

## 🔹 Key Points (Composition)

* Works with **structs, classes, protocols**
* Creates **"has-a" relationship**

  * Car *has an* Engine
* More **flexible and reusable**
* Loosely coupled design

---

# 🔥 Inheritance vs Composition (Important Table)

| Feature       | Inheritance  | Composition          |
| ------------- | ------------ | -------------------- |
| Relationship  | *is-a*       | *has-a*              |
| Coupling      | Tight        | Loose                |
| Reusability   | Limited      | High                 |
| Flexibility   | Less         | More                 |
| Swift Support | Classes only | Structs + Classes    |
| Overriding    | Yes          | No (uses delegation) |

---

# 🔥 Real iOS Example

### ❌ Inheritance (Bad Design)

```swift
class NetworkManager {
    func request() {}
}

class AuthNetworkManager: NetworkManager {
    override func request() {
        // custom auth logic
    }
}
```

👉 Problem: Hard to scale, tightly coupled

---

### ✅ Composition (Better Design)

```swift
protocol NetworkService {
    func request()
}

struct DefaultNetworkService: NetworkService {
    func request() {
        print("API Call")
    }
}

struct AuthService {
    let network: NetworkService
    
    func login() {
        network.request()
    }
}
```

👉 Benefits:

* Easily testable
* Replaceable (mock network)
* Cleaner architecture

---

# 🔥 Swift Best Practice

👉 Apple & Swift encourage:

✅ **Composition over Inheritance**

Why?

* Works better with **protocol-oriented programming**
* Avoids deep class hierarchies
* Easier to test and maintain

---

# 🔥 Interview One-Liner

👉
**“Inheritance models an ‘is-a’ relationship, while composition models a ‘has-a’ relationship, and in Swift we prefer composition for flexibility and loose coupling.”**

---



