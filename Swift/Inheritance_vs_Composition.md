
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

Got it — let’s make **composition super simple** 👇

---

# 🔹 What is Composition (Very Simple)

👉 **Composition = Using one object inside another**

Instead of *becoming* something, you just *use* something.

---

# 🔹 Think Like Real Life

* 🚗 Car **has an** engine
* 📱 Phone **has a** camera
* 👨‍💻 App **has a** network service

👉 That’s **composition**

---

# 🔹 Simple Swift Example

```swift
struct Engine {
    func start() {
        print("Engine started")
    }
}

struct Car {
    let engine = Engine()   // Car HAS an Engine
    
    func drive() {
        engine.start()
        print("Car is moving")
    }
}
```

### Usage:

```swift
let car = Car()
car.drive()
```

---

# 🔹 What’s Happening?

* Car is NOT an Engine ❌
* Car just USES Engine ✅

👉 That’s composition

---

# 🔹 Compare with Inheritance (Easy Way)

### Inheritance ❌

```swift
class Engine {
    func start() {}
}

class Car: Engine {}   // Car IS an Engine ❌ (wrong in real life)
```

👉 This doesn’t make sense logically

---

### Composition ✅

```swift
struct Car {
    let engine: Engine
}
```

👉 This matches real life ✔️

---

# 🔹 Even Simpler Rule

👉 Ask this question:

* If answer is **"is-a" → Inheritance**
* If answer is **"has-a" → Composition**

---

# 🔹 Why Composition is Better

* More flexible
* Easy to change parts
* No tight dependency
* Works with structs (Swift preferred)

---

# 🔹 Real iOS Example (Super Practical)

```swift
struct NetworkService {
    func fetch() {
        print("API call")
    }
}

struct UserViewModel {
    let network = NetworkService()   // HAS-A
    
    func loadUser() {
        network.fetch()
    }
}
```

👉 ViewModel doesn’t become network
👉 It just uses it

---

# 🔥 One-Line Understanding

👉 **“Composition means building objects using other objects.”**

---

## An object has instance of another object, where protocols come in?


