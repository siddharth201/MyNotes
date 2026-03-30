Great question — this is a **core concept of Swift memory model** 🔥
Let’s make it simple but technically correct.

---

# 🔹 Short Answer

> Only **classes** have `deinit` because they are **reference types managed by ARC**, while **structs and enums are value types** and don’t have a predictable lifetime.

---

# 🔹 Step-by-step Understanding

---

# 🧠 1. Classes → Reference Type (Heap + ARC)

```swift
class Person {
    deinit {
        print("Person deallocated")
    }
}
```

---

## 🔹 What happens?

```swift
var p: Person? = Person()
p = nil
```

👉 ARC does:

```text
Reference count = 0
→ Object destroyed
→ deinit called ✅
```

---

## 🔹 Why this works

Because:

* Class lives on **heap**
* Managed by **ARC (reference counting)**
* Swift knows **exact moment of destruction**

---

# 🧠 2. Struct / Enum → Value Type

```swift
struct Person {
    var name: String
}
```

---

## 🔹 What happens?

```swift
var p = Person(name: "Sid")
```

👉 Stored (usually) on stack
👉 No reference counting
👉 No lifecycle tracking

---

## 🔹 When does it get destroyed?

```text
Whenever it goes out of scope
OR copied
OR optimized away
```

👉 ❌ No single clear "death moment"

---

# 🔥 Key Reason

```text
deinit needs a guaranteed destruction point
```

👉 Only classes provide that

---

# 🔹 Why structs/enums can’t have `deinit`

---

## ❌ 1. No ARC

```text
No reference counting → no lifecycle tracking
```

---

## ❌ 2. Multiple copies

```swift
var a = Person(name: "Sid")
var b = a
```

👉 Now:

```text
Two independent copies
```

👉 Which one should call `deinit`? 🤯

---

## ❌ 3. Stack behavior

```text
Stack memory is automatically cleaned
```

👉 No hook for custom cleanup

---

## ❌ 4. Compiler optimizations

Swift may:

* inline
* eliminate copies
* move memory

👉 No predictable destruction point

---

# 🔹 Visual Comparison

---

## Class

```text
[ Reference ] → Heap Object
                    ↓
              ARC = 0 → deinit
```

---

## Struct / Enum

```text
Stack:
[ value copied here ]
[ value copied there ]

→ no tracking
→ no deinit
```

---

# 🔹 Real Example (Why it matters)

---

## Class (resource cleanup)

```swift
class FileHandler {
    deinit {
        print("Closing file")
    }
}
```

👉 Ensures cleanup ✅

---

## Struct (problem)

```swift
struct FileHandler {
    // ❌ no deinit
}
```

👉 Cannot guarantee cleanup ❌

---

# 🔹 So how do we handle cleanup in struct?

👉 Use:

### ✅ 1. Explicit method

```swift
func close() {}
```

---

### ✅ 2. Use class internally

```swift
struct Wrapper {
    private let resource = ResourceClass()
}
```

---

# 🔹 Interview Answer (Perfect)

> “Classes support deinitializers because they are reference types managed by ARC, which provides a deterministic point when the reference count reaches zero. Structs and enums are value types that can be copied and destroyed unpredictably, so Swift cannot guarantee a single point to call a deinitializer.”

---

# 🔥 Final Takeaway

```text
Class → tracked → predictable destruction → deinit ✅
Struct/Enum → copied → unpredictable → no deinit ❌
```

---


