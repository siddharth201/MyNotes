
# 1️⃣ What is a Higher-Order Function?

### Interview-friendly definition

> **A higher-order function is a function that either takes another function as a parameter or returns a function.**

In Swift:

* Closures = functions
* So higher-order functions work with closures

---

### One-line version (easy to say)

> “Higher-order functions allow behavior to be passed as data.”

---

# 2️⃣ Why Higher-Order Functions exist

They help us:

* Write **less code**
* Avoid **loops and mutable state**
* Express logic **declaratively**
* Improve **readability and safety**

Instead of *how* to do something,
we focus on *what* we want.

---

# 3️⃣ Most Common Higher-Order Functions in Swift

Swift’s collection APIs are built on higher-order functions.

| Function           | Purpose                   |
| ------------------ | ------------------------- |
| `map`              | Transform elements        |
| `compactMap`       | Transform + remove nil    |
| `flatMap`          | Flatten collections       |
| `filter`           | Select elements           |
| `reduce`           | Combine into single value |
| `forEach`          | Iterate with action       |
| `sorted`           | Custom sorting            |
| `contains(where:)` | Condition check           |

---

# 4️⃣ `map` — Transform values

### Definition

> Transforms each element and returns a new array.

### Example

```swift
let numbers = [1, 2, 3]
let squares = numbers.map { $0 * $0 }
```

Output:

```
[1, 4, 9]
```

### Reasoning

* No mutation
* No loop variable
* Clear intent: *“convert each number to its square”*

---

## Production example

```swift
let users = apiUsers.map {
    UserViewModel(name: $0.name)
}
```

---

# 5️⃣ `compactMap` — Transform + remove nil

### Definition

> Transforms elements and **removes nil results**.

### Example

```swift
let values = ["1", "a", "3"]
let numbers = values.compactMap { Int($0) }
```

Output:

```
[1, 3]
```

### Reasoning

* Avoids optional handling later
* Common in parsing & validation

---

## Production example

```swift
let validEmails = emails.compactMap { Email($0) }
```

---

# 6️⃣ `flatMap` — Flatten collections

### Definition

> Flattens nested collections into a single collection.

### Example

```swift
let nested = [[1, 2], [3, 4]]
let flat = nested.flatMap { $0 }
```

Output:

```
[1, 2, 3, 4]
```

---

## Production example

```swift
let allMessages = conversations.flatMap { $0.messages }
```

---

# 7️⃣ `filter` — Select elements

### Definition

> Returns elements that satisfy a condition.

### Example

```swift
let numbers = [1, 2, 3, 4]
let even = numbers.filter { $0 % 2 == 0 }
```

Output:

```
[2, 4]
```

---

## Production example

```swift
let activeUsers = users.filter { $0.isActive }
```

---

# 8️⃣ `reduce` — Combine into one value

### Definition

> Reduces a collection into a **single value**.

### Example

```swift
let numbers = [1, 2, 3]
let sum = numbers.reduce(0) { $0 + $1 }
```

Output:

```
6
```

---

## Production example

```swift
let totalPrice = cartItems.reduce(0) {
    $0 + $1.price
}
```

---

# 9️⃣ `forEach` — Perform an action

### Definition

> Executes a closure for each element.

### Example

```swift
numbers.forEach {
    print($0)
}
```

⚠️ Difference from `for` loop:

* Cannot `break` or `continue`

---

# 🔟 `sorted(by:)` — Custom sorting

### Example

```swift
let sortedUsers = users.sorted {
    $0.age < $1.age
}
```

---

# 11️⃣ Higher-Order Functions that RETURN functions

This is less common, but important.

### Example

```swift
func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { value in
        value * factor
    }
}

let double = makeMultiplier(2)
double(5) // 10
```

✔ Shows closures as return values
✔ Used in functional programming patterns

---

# 12️⃣ Are Higher-Order Functions Escaping?

### Important interview point

> **Most Swift higher-order functions use non-escaping closures.**

Examples:

```swift
map
filter
reduce
compactMap
flatMap
```

Why?

* They execute synchronously
* They do not store the closure

So:

```swift
items.map {
    self.transform($0) // safe, no weak self needed
}
```

---

# 13️⃣ Why they are preferred in modern Swift

Compared to loops ❌:

```swift
var result = [Int]()
for num in numbers {
    result.append(num * 2)
}
```

Using higher-order functions ✅:

```swift
let result = numbers.map { $0 * 2 }
```

✔ Immutable
✔ Thread-safe
✔ Expressive

---

# 14️⃣ Higher-Order Functions in SwiftUI

SwiftUI relies heavily on them.

```swift
ForEach(users) { user in
    Text(user.name)
}
```

```swift
items.filter { $0.isVisible }
     .map { ItemView(item: $0) }
```

---

# 🎤 Perfect Interview Answer

> “Higher-order functions are functions that accept or return other functions. Swift uses them extensively in collection APIs like map, filter, and reduce to enable declarative, safe, and expressive data transformations.”

---

# 🧠 Mental Model (REMEMBER THIS)

* `map` → change shape
* `filter` → select
* `reduce` → combine
* `compactMap` → clean data
* `flatMap` → flatten

---

# ⚠️ Common Interview Mistakes

❌ Saying higher-order functions are always slower
❌ Using `forEach` when `map` is needed
❌ Using `map` when result is unused

---



