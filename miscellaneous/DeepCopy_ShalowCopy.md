
## ✅ Shallow Copy vs Deep Copy

### 🔹 Shallow Copy

> A **shallow copy** duplicates the *reference* to an object, not the actual underlying data.

* Both copies **point to the same memory**
* Changes in one affect the other
* Fast & memory-efficient

### Visual Idea

```
Original ----+
             ---> [ Data Object ]
Copy --------+
```

### Swift Example (Class = Reference Type)

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let p1 = Person(name: "John")
let p2 = p1   // Shallow copy

p2.name = "Mike"

print(p1.name) // Mike
print(p2.name) // Mike
```

✔ Both point to same instance
✔ Changing p2 affects p1

---

### 🔹 Deep Copy

> A **deep copy** duplicates the object **and** all its nested data.

* Each copy has **independent memory**
* Changes do NOT affect each other
* Safer but more expensive

### Visual Idea

```
Original ---> [ Data Object A ]
Copy -------> [ Data Object B ]
```

### Swift Example (Manual Deep Copy)

```swift
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    func deepCopy() -> Person {
        return Person(name: self.name)
    }
}

let p1 = Person(name: "John")
let p2 = p1.deepCopy()

p2.name = "Mike"

print(p1.name) // John
print(p2.name) // Mike
```

✔ Separate instances
✔ Independent memory

---

## 🔥 Swift Struct vs Class Behavior

### Struct (Value Type → Deep Copy by Default)

```swift
struct User {
    var name: String
}

var u1 = User(name: "Alice")
var u2 = u1   // Deep copy

u2.name = "Bob"

print(u1.name) // Alice
print(u2.name) // Bob
```

Structs behave like **deep copy** automatically.

---

### Class (Reference Type → Shallow Copy by Default)

```swift
class User {
    var name: String
    init(name: String) { self.name = name }
}

let u1 = User(name: "Alice")
let u2 = u1

u2.name = "Bob"

print(u1.name) // Bob
```

---

## 🧠 Copy-on-Write (Important Swift Optimization)

Swift collections (`Array`, `Dictionary`, `String`) look like deep copy but internally use:

> **Copy-On-Write (COW)**
> Memory is shared until modification happens.

```swift
var a = [1,2,3]
var b = a      // No real copy yet

b.append(4)   // Now copy occurs
```

Result:

```
a -> [1,2,3]
b -> [1,2,3,4]
```

This gives **performance of shallow copy** + **safety of deep copy**.

---

## 🧾 Interview-Friendly Comparison Table

| Feature           | Shallow Copy | Deep Copy |
| ----------------- | ------------ | --------- |
| Memory            | Shared       | Separate  |
| Speed             | Faster       | Slower    |
| Safety            | Risky        | Safe      |
| Swift Class       | Default      | Manual    |
| Swift Struct      | ❌            | Default   |
| Affects Original? | Yes          | No        |

---

## ⚠️ Nested Objects Scenario

```swift
class Address {
    var city: String
    init(city: String) { self.city = city }
}

class Person {
    var name: String
    var address: Address

    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }

    func deepCopy() -> Person {
        return Person(
            name: name,
            address: Address(city: address.city)
        )
    }
}
```

If you forget to copy nested objects → you accidentally get **partial shallow copy**.

---

## 🧩 How To Decide Which To Use?

Use **Shallow Copy** when:

* Immutable objects
* Performance critical
* Read-only sharing

Use **Deep Copy** when:

* Mutable data
* Independent state needed
* Thread safety concerns

---

## 🎯 Interview One-Liner Answer

> Shallow copy duplicates the reference to the same memory, so changes reflect in both objects. Deep copy duplicates the entire object graph, creating independent memory. In Swift, structs use deep copy semantics by default, while classes use shallow copy, unless we manually implement copying.

---


# ✅ What is NSCopying?

> **NSCopying** is a protocol in Swift (from Foundation) that allows an object to define **how it should be copied** when `copy()` is called.

In simple words:

👉 It lets a **class create its own copy** (usually a deep copy).

---

## 🧠 Why Do We Need NSCopying?

Swift classes are **reference types**:

```swift
let b = a   // just another reference
```

But sometimes you want:

```swift
let b = a.copy()   // new independent object
```

To make this possible, your class must conform to **NSCopying**.

---

## 📜 Protocol Definition

```swift
protocol NSCopying {
    func copy(with zone: NSZone?) -> Any
}
```

You must implement:

```swift
func copy(with zone: NSZone?) -> Any
```

---

## ✅ Basic Example

```swift
import Foundation

class Person: NSCopying {
    var name: String

    init(name: String) {
        self.name = name
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: self.name)
    }
}
```

### Usage

```swift
let p1 = Person(name: "John")
let p2 = p1.copy() as! Person

p2.name = "Mike"

print(p1.name) // John
print(p2.name) // Mike
```

✔ Deep copy
✔ Separate memory

---

## 🧩 With Multiple Properties

```swift
class Car: NSCopying {
    var brand: String
    var year: Int

    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Car(brand: brand, year: year)
    }
}
```

---

## ⚠️ Nested Objects (Important!)

```swift
class Engine: NSCopying {
    var power: Int

    init(power: Int) {
        self.power = power
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Engine(power: power)
    }
}

class Car: NSCopying {
    var engine: Engine

    init(engine: Engine) {
        self.engine = engine
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Car(engine: engine.copy() as! Engine)
    }
}
```

If you don’t copy nested objects → you accidentally create a **shallow copy**.

---

## 🔁 Difference Between copy() and mutableCopy()

| Method        | Protocol         |
| ------------- | ---------------- |
| copy()        | NSCopying        |
| mutableCopy() | NSMutableCopying |

Example:

```swift
class Box: NSMutableCopying {
    var value: Int = 0

    func mutableCopy(with zone: NSZone? = nil) -> Any {
        let copy = Box()
        copy.value = value
        return copy
    }
}
```

Mostly used in Objective-C interoperability.

---

## 🧠 Interview Insight

> NSCopying provides a standardized way for classes to implement custom copy behavior. When a class conforms to NSCopying, calling copy() creates a new instance instead of sharing the same reference, which is commonly used to implement deep copying.

---

## ✅ When Should You Use NSCopying?

Use it when:

✔ You use **classes**
✔ You need independent objects
✔ You expose `copy()` API
✔ Working with Foundation APIs expecting NSCopying

Avoid when:

❌ Using structs
❌ Immutability is enough

---

## ⚡ Modern Swift Alternative

Instead of NSCopying, many Swift developers prefer:

```swift
func clone() -> Self
```

or

```swift
func deepCopy() -> MyType
```

Simpler and more Swift-like.

---

## 🎯 One-Line Interview Answer

> NSCopying is a protocol that allows a class to define how an instance should be copied. Implementing it enables the copy() method to return a new independent object, typically used for deep copy behavior.

---

# Memory graph debugging to observe copies  

Perfect — this is a **powerful practical skill** that impresses in interviews and helps you debug real memory issues.

Let’s learn how to visually **prove** whether you have a shallow copy or a deep copy using Xcode’s **Memory Graph Debugger**.

---

## 🎯 What Is Memory Graph Debugging?

Memory Graph Debugger shows:

* All live objects in memory
* Their references
* Who owns whom
* Whether two variables point to the **same instance** or **different instances**

Using this, you can visually confirm:

✅ Shallow copy → same object
✅ Deep copy → different objects

---

## 🧪 Step 1 — Create a Test Case

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let p1 = Person(name: "John")
let p2 = p1        // shallow copy

let p3 = Person(name: "Mike") // separate object
```

Put a **breakpoint** after these lines.

---

## 🛠 Step 2 — Open Memory Graph Debugger

![Image](https://i.sstatic.net/ZcS7b.png)

![Image](https://i.sstatic.net/Lw7T5.png)

![Image](https://docs-assets.developer.apple.com/published/b02db2b60e5ef7d88a9bd5d237a85d36/gathering-information-about-memory-use-3.png)

![Image](https://media2.dev.to/dynamic/image/width%3D800%2Cheight%3D%2Cfit%3Dscale-down%2Cgravity%3Dauto%2Cformat%3Dauto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fwbrbwc03hnf7ow5esy2j.png)

While app is paused:

👉 Click the **Memory Graph Debugger** button
(it looks like three connected rectangles)

Xcode will scan all live objects.

---

## 👀 Step 3 — Search Your Objects

In the memory graph search bar:

```
Person
```

You will see something like:

```
Person @0x600003f1a400
Person @0x600003f1a800
```

Click each one.

---

## 🔍 Step 4 — Inspect References

Select first Person instance:

You’ll see:

```
p1 ─────▶ Person @0xAAA
p2 ─────▶ Person @0xAAA
```

This proves:

✅ p1 and p2 point to SAME memory
✅ Shallow copy

Select second Person instance:

```
p3 ─────▶ Person @0xBBB
```

Different address → different object.

---

## ✅ Deep Copy Verification

Modify code:

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }

    func deepCopy() -> Person {
        Person(name: self.name)
    }
}

let p1 = Person(name: "John")
let p2 = p1.deepCopy()
```

Pause → Memory Graph → Search Person

Now you should see:

```
p1 ─▶ Person @0x111
p2 ─▶ Person @0x222
```

Different addresses → deep copy confirmed.

---

## 🧠 How To Read The Graph

| Visual Pattern         | Meaning        |
| ---------------------- | -------------- |
| Two arrows to same box | Shallow copy   |
| Separate boxes         | Deep copy      |
| Arrow cycles           | Retain cycle   |
| Dashed arrow           | Weak reference |

---

## 🔁 Nested Object Example

```swift
class Address {
    var city: String
    init(city: String) { self.city = city }
}

class Person {
    var name: String
    var address: Address

    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }

    func deepCopy() -> Person {
        Person(name: name,
               address: Address(city: address.city))
    }
}
```

If you forget to copy Address:

```
p1.address ─▶ Address @0x999
p2.address ─▶ Address @0x999   ❌
```

Memory graph exposes this immediately.

---

## ⚡ Pro Tip: Combine With Debug Console

At breakpoint:

```lldb
po Unmanaged.passUnretained(p1).toOpaque()
po Unmanaged.passUnretained(p2).toOpaque()
```

Same pointer → shallow
Different pointer → deep

Memory Graph + LLDB = bulletproof verification.

---

## 🎤 Interview One-Liner

> I verify deep vs shallow copy by pausing execution and using Xcode’s Memory Graph Debugger. If two variables point to the same instance node, it’s a shallow copy. If they point to separate nodes, it’s a deep copy.

---

## 🚀 Why This Matters

* Detect accidental shared state
* Find retain cycles
* Validate copy implementations
* Debug memory leaks

---




