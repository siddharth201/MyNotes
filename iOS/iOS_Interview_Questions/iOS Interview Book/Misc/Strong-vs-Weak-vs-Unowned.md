
Here are clear, runnable Swift examples demonstrating how Automatic Reference Counting (ARC) behaves with **Strong**, **Weak**, and **Unowned** references based on your definitions.

---

### 1. Strong Reference (Default)

Every time you assign a class instance to a variable, constant, or property, Swift creates a **strong reference**, increasing its retain count by 1. The object stays in memory until all strong references are removed (`nil`).

```swift
class Car {
    let model: String
    init(model: String) {
        self.model = model
        print("\(model) initialized (Retain Count: 1)")
    }
    deinit {
        print("\(model) deallocated (Retain Count: 0)")
    }
}

var reference1: Car? = Car(model: "Tesla Model 3") // Retain count = 1
var reference2: Car? = reference1                  // Retain count = 2

reference1 = nil // Retain count drops to 1. Car is STILL alive!
print("reference1 is nil, but Car is not deallocated yet.")

reference2 = nil // Retain count drops to 0. Now deinit runs!

```

**Output:**

```text
Tesla Model 3 initialized (Retain Count: 1)
reference1 is nil, but Car is not deallocated yet.
Tesla Model 3 deallocated (Retain Count: 0)

```

---

### 2. Weak Reference

A `weak` reference does not increase the retain count. It is used to break **retain cycles** when two objects can exist independently of each other (e.g., a `Person` and an `Apartment`). When the object is deallocated, ARC automatically sets the weak reference to `nil` (zeroing).

```swift
class Person {
    let name: String
    var apartment: Apartment? // Strong reference
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deallocated") }
}

class Apartment {
    let unit: String
    // Weak reference: doesn't keep Person alive, must be optional (?)
    weak var tenant: Person? 
    
    init(unit: String) { self.unit = unit }
    deinit { print("Apartment \(unit) is being deallocated") }
}

var john: Person? = Person(name: "John")
var unit4A: Apartment? = Apartment(unit: "4A")

// Link them together
john?.apartment = unit4A   // unit4A retain count = 2
unit4A?.tenant = john      // john retain count stays 1 (because tenant is weak)

// Deallocate John
john = nil                 // John's retain count hits 0 -> deinit runs!
print("Tenant in 4A is now: \(String(describing: unit4A?.tenant))") // Automatically set to nil

// Deallocate Apartment
unit4A = nil               // unit4A's retain count hits 0 -> deinit runs!

```

**Output:**

```text
John is being deallocated
Tenant in 4A is now: nil
Apartment 4A is being deallocated

```

*(Note: If `tenant` were strong instead of `weak`, neither `deinit` would ever print, causing a memory leak.)*

---

### 3. Unowned Reference

An `unowned` reference also avoids increasing the retain count, **but it is non-optional**. Use it when one object cannot exist without the other—meaning the referenced object is guaranteed to have the same or longer lifespan (e.g., a `CreditCard` always belongs to a `Customer`).

```swift
class Customer {
    let name: String
    var card: CreditCard? // Strong reference
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deallocated") }
}

class CreditCard {
    let number: UInt64
    // Unowned reference: non-optional, assumes Customer always exists while Card exists
    unowned let customer: Customer 
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deallocated") }
}

var alice: Customer? = Customer(name: "Alice")
alice?.card = CreditCard(number: 1234_5678_9012_3456, customer: alice!)

// Setting alice to nil drops Customer's retain count to 0.
// Because Customer holds the only strong reference to CreditCard, both deallocate cleanly!
alice = nil

```

**Output:**

```text
Alice is being deallocated
Card #1234567890123456 is being deallocated

```

#### ⚠️ What happens if you violate the `unowned` rule?

If you hold onto a separate strong reference to the `CreditCard` after `Customer` is destroyed and try to access `.customer`, Swift triggers a **runtime crash** (`Fatal error: Attempted to read an unowned reference but object was already deallocated`):

```swift
var bob: Customer? = Customer(name: "Bob")
let leakedCard = CreditCard(number: 9999_8888, customer: bob!) // Strong reference to card

bob = nil // Bob is deallocated!
print(leakedCard.customer.name) // 💥 CRASH! Bob no longer exists in memory.

```

---

### Quick Summary Comparison

| Feature | Strong (Default) | `weak` | `unowned` |
| --- | --- | --- | --- |
| **Increases Retain Count?** | Yes | No | No |
| **Must be Optional (`?`)?** | No | Yes (`var` only) | No (`let` or `var`) |
| **Becomes `nil` on dealloc?** | N/A | Yes (Auto-zeroing) | No (Dangling pointer) |
| **Safe if target is deallocated?** | Keeps target alive | Yes (Safely returns `nil`) | **No (App Crashes)** |
| **Best Use Case** | Standard ownership | Parent-child where child can outlive parent (e.g., Delegates) | Parent-child where child cannot exist without parent |
