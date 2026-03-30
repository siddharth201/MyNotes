Great — this is a **very common interview question**, and your notes are good 👍
Let me refine it into a **crystal-clear + interview-ready answer** (with real understanding, not just points).

---

# 🎯 When to choose **struct over class**

---

# 🔹 1. Value Semantics (Most Important)

👉 Use **struct** when you want **independent copies**

```swift
struct Point {
    var x: Int
}

var p1 = Point(x: 10)
var p2 = p1

p2.x = 20

print(p1.x) // 10 ✅ not affected
```

---

### 🔥 Key Idea

```text
Struct → Copy
Class  → Share
```

---

# 🔹 2. No Shared Mutable State (Thread Safety)

👉 Structs are safer in multithreading

Because:

* Each thread gets its own copy
* No accidental shared mutation

---

### ❌ Class problem

```swift
class Counter {
    var value = 0
}
```

👉 Multiple threads → race condition ⚠️

---

# 🔹 3. Simple Data Models

👉 Use struct for:

* DTOs / API models
* UI models
* Configs

```swift
struct User {
    let id: Int
    let name: String
}
```

---

# 🔹 4. No Inheritance Needed

👉 Structs:

* ❌ No inheritance
* ✅ Use protocols instead

---

### Modern Swift philosophy

```text
Prefer composition over inheritance
```

---

# 🔹 5. Immutability (Cleaner Design)

```swift
struct Config {
    let baseURL: String
}
```

👉 Safer + predictable

---

# 🔹 6. Performance (But be careful ⚠️)

👉 Your note says:

> “Structs are stack allocated → faster”

---

## 🔥 Correct understanding:

```text
Struct ≠ always stack
Class ≠ always heap (reference is stack, object is heap)
```

👉 Real truth:

* Struct → fewer indirections
* Class → pointer + heap allocation

👉 So:

* Struct is often faster for **small data**
* Class better for **large shared objects**

---

# 🔹 7. Copy-on-Write Optimization

Swift optimizes structs like:

```swift
Array, String, Dictionary
```

👉 They behave like value types
👉 But avoid unnecessary copies

---

# 🔹 8. Identity vs Value

👉 Ask this question:

---

## ❓ Does identity matter?

### If YES → use class

```text
"Is this the SAME object?"
```

Example:

* ViewController
* Database connection

---

### If NO → use struct

```text
"Only value matters"
```

Example:

* Point(x, y)
* User data

---

# 🔹 Real Interview Answer (Perfect 🚀)

> “I prefer structs when I need value semantics, meaning independent copies without shared mutable state. They are ideal for simple data models, safer for multithreading, and align with Swift’s preference for immutability. I would choose a class only when I need shared identity, inheritance, or reference semantics.”

---

# 🔥 One-line Rule (Very Powerful)

```text
If you don’t NEED class → use struct
```

---

# 🔹 Quick Comparison Table

| Feature       | Struct | Class     |
| ------------- | ------ | --------- |
| Type          | Value  | Reference |
| Copy behavior | Copy   | Shared    |
| Inheritance   | ❌      | ✅         |
| ARC           | ❌      | ✅         |
| Thread safety | Better | Risky     |
| Deinit        | ❌      | ✅         |

---

# 🔚 Final Takeaway

```text
Struct → Data
Class  → Identity
```

---

## 🚀 If you want next level

I can:

* 🔥 Give **tricky interview scenarios (struct vs class decision)**
* 🔥 Show **real-world bugs caused by wrong choice**
* 🔥 Explain **copy-on-write deeply (very important)**

Just say 👍

