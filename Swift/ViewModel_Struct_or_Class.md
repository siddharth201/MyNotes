# ViewModel should be a struct or class?

This question touches **value semantics vs reference semantics**, **identity**, and **lifecycle** — which are foundational Swift concepts.

Let’s build a **clear decision framework** so you can answer this instinctively in real projects and interviews.

---

## 🧠 One-Line Rule

> **Use `class` for ViewModels and business controllers.
> Use `struct` for pure data and pure calculations.**

Now let’s unpack *why*.

---

## 🔑 The Real Difference (In Practice)

| Concept                 | struct   | class |
| ----------------------- | -------- | ----- |
| Value type              | ✅        | ❌     |
| Reference type          | ❌        | ✅     |
| Copied on assignment    | ✅        | ❌     |
| Shared instance         | ❌        | ✅     |
| Identity                | ❌        | ✅     |
| Mutable state over time | ⚠️ Risky | ✅     |
| Deinit / lifecycle      | ❌        | ✅     |

---

## 🧱 ViewModels → Almost Always `class`

### Why?

ViewModels:

✅ Hold state
✅ Change over time
✅ Are observed
✅ Are shared between views
✅ Need identity

All of these favor **reference semantics**.

---

## ❌ ViewModel as struct (bad idea)

```swift
struct CounterViewModel {
    var count = 0

    mutating func increment() {
        count += 1
    }
}
```

Problem:

```swift
var a = CounterViewModel()
var b = a

b.increment()

print(a.count) // 0 😨
print(b.count) // 1
```

Two copies → state desync.

---

## ✅ ViewModel as class

```swift
class CounterViewModel {
    var count = 0

    func increment() {
        count += 1
    }
}
```

```swift
let a = CounterViewModel()
let b = a

b.increment()

print(a.count) // 1 ✅
```

Single shared state.

---

## 🎯 Rule

> If something **represents a long-living object with evolving state → class**

ViewModels fall squarely here.

---

## 📦 Business Logic Types: Two Categories

---

## ✅ Category 1 — Stateful Coordinators → class

Examples:

* SessionManager
* AuthManager
* CartManager
* PlayerController

They **own changing state**.

```swift
class SessionManager {
    var isLoggedIn = false
}
```

Use **class**.

---

## ✅ Category 2 — Pure Logic / Algorithms → struct

If:

* No stored mutable state
* Just functions
* Deterministic output

Then struct is perfect.

```swift
struct PriceCalculator {
    func total(price: Double, tax: Double) -> Double {
        price + tax
    }
}
```

This behaves like a **namespace with guarantees**.

---

## 🧠 Key Question To Ask Yourself

> Does this thing represent an *entity that lives over time*?

If YES → class
If NO → struct

---

## 🧩 Another Question

> If I pass this around, should everyone see the SAME instance?

YES → class
NO → struct

---

## 🧪 Testing Perspective

Mocks are easier with **class-based protocols**:

```swift
protocol UserService {
    func fetchUser() -> User
}

class MockUserService: UserService {}
```

Mocks often track call counts → mutable → class.

---

## 🧬 Combine / Observation Angle

Most reactive systems expect reference types:

```swift
class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
}
```

This pattern fundamentally assumes **identity**.

---

## 🧱 Where Structs Shine

### Models

```swift
struct User {
    let id: Int
    let name: String
}
```

### DTOs

```swift
struct UserDTO: Codable {}
```

### Value Objects

```swift
struct Money {
    let amount: Double
    let currency: String
}
```

### Configuration

```swift
struct AppConfig {
    let baseURL: String
}
```

---

## ⚠️ Why Not Make Everything Struct?

Because:

* Copying creates subtle bugs
* Mutating functions become awkward
* Observation breaks
* Identity disappears

Swift structs are amazing — but not for **stateful coordinators**.

---

## 🔁 Mental Cheat Sheet

```
Is it stateful over time?
    |
    YES → class
    |
    NO
    |
Is it pure data?
    |
    YES → struct
```

---

## 🏗 Typical Architecture Mapping

### Presentation Layer

* ViewModel → class
* View → struct (SwiftUI)

### Domain Layer

* Entities → struct
* UseCases → struct or class (usually struct if stateless)

### Data Layer

* Repositories → class
* Services → class

---

## 🧠 Interview Answer (Short & Strong)

> I use structs for immutable value types like models and pure calculations.
> I use classes for ViewModels and business components that manage evolving state, need identity, are observed, or shared.
> My guideline is: stateful and long-living → class, pure data → struct.

---

## 🔥 Advanced Note (Optional)

With Swift Concurrency:

* Shared mutable state → often `actor`
* But actors conceptually replace classes, not structs.

Still:

```
struct → data
class → coordinator
actor → concurrent coordinator
```

---

## 🎯 Final Takeaway

ViewModels = **class**
Models = **struct**
Pure logic = **struct**
Managers / Controllers = **class**

---

# Q. Need identity means what?  
Great — this is one of those words everyone uses, but few people truly *internalize*.

Let’s make **identity** feel concrete.

---

## 🧠 Simple Definition

> **Identity means an object has a stable “self” that can be pointed to, shared, and compared over time.**

In other words:

👉 You care about **which instance** it is, not just what values it contains.

---

## 🧍 Real-World Analogy

Two people:

```
Person A → name: John, age: 30
Person B → name: John, age: 30
```

Same data… but **different humans**.

They have different identities.

---

## 🧱 Swift Example

## Struct (NO identity)

```swift
struct User {
    var name: String
}
```

```swift
var u1 = User(name: "John")
var u2 = u1

u2.name = "Mike"

print(u1.name) // John
print(u2.name) // Mike
```

These are two **separate copies**.

There is no single “thing” being shared.

👉 Structs represent **values**, not identities.

---

## Class (HAS identity)

```swift
class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}
```

```swift
let u1 = User(name: "John")
let u2 = u1

u2.name = "Mike"

print(u1.name) // Mike
print(u2.name) // Mike
```

Both variables point to the **same object**.

That object is the identity.

---

## 🎯 Identity = Shared Existence

If I give an object to:

* View
* ViewModel
* Service
* Coordinator

and all of them must see the **same evolving state**…

You need identity.

Which means → **class (or actor)**.

---

## 🧠 Another Angle

Ask yourself:

> If two references point to this thing, should changes be visible everywhere?

YES → identity needed
NO → identity not needed

---

## 🔁 ViewModel Example

```swift
class ProfileViewModel {
    var username = "John"
}
```

View A and View B both hold same instance.

If View A updates name → View B immediately reflects it.

That only works because the ViewModel has identity.

---

## ❌ What Happens Without Identity

If ViewModel were struct:

Each view gets its own copy.

Now:

* View A updates name
* View B still shows old value

Bug.

---

## 🧩 Identity vs Equality

Very important distinction:

### Equality

```swift
a == b
```

Means:

> Do these two have same values?

### Identity

```swift
a === b
```

Means:

> Are these the **same instance**?

Only classes support `===`.

---

## 🧠 Practical Meaning

When someone says:

> “This type needs identity”

They mean:

* It represents a real object
* It lives over time
* It changes
* Others observe it

---

## 🏗 Common Things That Need Identity

✅ ViewModels
✅ Controllers
✅ Managers
✅ Coordinators
✅ Caches
✅ Sessions
✅ Players

---

## 🧊 Common Things That Do NOT Need Identity

❌ DTOs
❌ Models
❌ Request objects
❌ Configuration
❌ Math types

---

## 🧠 One-Sentence Rule

> If copying this value would break your program’s logic → it needs identity.

---

## 🎤 Interview-Friendly Line

> Identity means the object represents a single shared instance whose state changes over time and must be observed consistently. When I need identity, I use a class or actor; when I only need values, I use structs.

---

## 🧪 Tiny Thought Experiment

Imagine duplicating the object:

* If duplication is safe → struct
* If duplication is dangerous → class

That’s identity.

---

## ✅ Final Mental Model

```
Value Type (struct) → "What is it?"
Reference Type (class) → "Who is it?"
```



