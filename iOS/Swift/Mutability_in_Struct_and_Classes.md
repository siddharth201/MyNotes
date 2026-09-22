
## Immutibility in class and struct
```swift
class User {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct User1 {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

let u1 = User(id: 1, name: "Sid")

let u2 = User1(id: 1, name: "Sid")

u1.id = 2
u2.id = 2
```

Nice example 👍 — this is *exactly* the right code to understand **immutability in Swift classes vs structs**. Let’s walk through what’s really happening and *why Swift allows this*.

---

## Your code (recap)

```swift
class User {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct User1 {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

let u1 = User(id: 1, name: "Sid")
let u2 = User1(id: 1, name: "Sid")

u1.id = 2   // ✅ allowed
u2.id = 2   // ❌ compile-time error
```

---

## Why does this behave differently?

### Key idea

> **`let` means different things for classes and structs.**

---

## 1️⃣ Class + `let` → reference is immutable, object is mutable

```swift
let u1 = User(id: 1, name: "Sid")
u1.id = 2   // ✅ allowed
```

### What `let` means here

* `u1` is a **constant reference**
* The *reference cannot change*
* The *object it points to can change*

Think of it like this:

```text
u1 ─────▶ User(id: 1, name: "Sid")
```

You cannot do this:

```swift
u1 = User(id: 3, name: "Rahul") // ❌ not allowed
```

But you **can mutate properties**:

```swift
u1.id = 2 // ✅
```

### Why?

* Classes are **reference types**
* `var` properties inside a class are always mutable unless explicitly restricted

---

## 2️⃣ Struct + `let` → entire value is immutable

```swift
let u2 = User1(id: 1, name: "Sid")
u2.id = 2   // ❌ error
```

### What `let` means here

* `u2` is a **constant value**
* The **entire struct is frozen**
* No property can change

Swift error:

```
Cannot assign to property: 'u2' is a 'let' constant
```

### Why?

* Structs are **value types**
* Mutating any property means mutating the whole value
* `let` means **“this value will never change”**

---

## Mental Model (very important for interviews)

| Concept                      | Class                 | Struct                   |
| ---------------------------- | --------------------- | ------------------------ |
| Type                         | Reference type        | Value type               |
| `let` meaning                | Reference is constant | Entire value is constant |
| Can mutate `var` properties? | ✅ Yes                 | ❌ No                     |
| Encourages immutability      | ❌                     | ✅                        |

---

## How to make the struct mutable?

```swift
var u2 = User1(id: 1, name: "Sid")
u2.id = 2 // ✅ allowed
```

Now Swift allows mutation because the *value itself* is mutable.

---

## How to make a class truly immutable?

You must **design it to be immutable**:

```swift
final class ImmutableUser {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
```

Now:

```swift
let u = ImmutableUser(id: 1, name: "Sid")
u.id = 2 // ❌ not allowed
```

Immutability in classes is **opt-in**, not default.

---

## Interview-grade takeaway 🔥

> **Structs are immutable by default; classes are mutable by default.**
> `let` on a struct freezes data.
> `let` on a class freezes the reference, not the data.

---

## When should you use what?

### Use **struct** when:

* Data should be immutable by default
* You want value semantics
* Thread safety matters
* Modeling plain data (DTOs, ViewState)

### Use **class** when:

* Shared mutable state is required
* Identity matters
* You need inheritance or reference semantics


