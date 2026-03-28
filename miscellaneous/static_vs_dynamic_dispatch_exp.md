
# Version - 1

# 🔹 The Core Reason (in one line)

> Swift uses **two different dispatch mechanisms**:

* **Witness Table (dynamic dispatch)**
* **Static dispatch (direct call)**

---

# 🔹 Case 1: Method declared in protocol

```swift
protocol Test {
    func sayHello()
}
```

👉 Swift creates something called a:

## 🔹 **Witness Table**

---

## 🔹 What is a Witness Table?

Think of it like a **lookup table**:

```text
Protocol: Test

Witness Table for Person:
-------------------------
sayHello → Person.sayHello
```

---

## 🔹 What happens at runtime?

```swift
let p: Test = Person()
p.sayHello()
```

👉 Swift does:

```text
1. Look at witness table
2. Find implementation for Person
3. Call Person.sayHello()
```

👉 This is **dynamic dispatch**

---

# 🔹 Case 2: Method ONLY in extension

```swift
protocol Test {}

extension Test {
    func sayHello() {
        print("Hello from protocol")
    }
}
```

---

## 🔹 Important difference

👉 This method is **NOT part of protocol requirements**

So:

```text
No entry in witness table ❌
```

---

## 🔹 What happens now?

```swift
let p: Test = Person()
p.sayHello()
```

👉 Swift does:

```text
Compiler decides:
"Test type → call extension method"
```

👉 It directly calls:

```text
Test.sayHello()
```

👉 This is **static dispatch**

---

# 🔥 Key Technical Difference

| Case                 | Stored in witness table? | Dispatch |
| -------------------- | ------------------------ | -------- |
| Declared in protocol | ✅ Yes                    | Dynamic  |
| Only in extension    | ❌ No                     | Static   |

---

# 🔹 Why Swift does this?

### 🔸 1. Performance

Static dispatch:

* Faster
* No runtime lookup

---

### 🔸 2. Protocol contract clarity

Protocol defines:

```text
"What must be implemented"
```

Only those go into:
👉 witness table

---

### 🔸 3. Extensions are just helpers

```text
Extension = default behavior
NOT part of contract
```

---

# 🔹 Internal Mental Model

---

## ✅ With protocol requirement

```text
Protocol
   ↓
Witness Table
   ↓
Actual implementation (Person)
```

---

## ❌ With extension only

```text
Protocol type
   ↓
Direct call to extension
   ↓
No runtime lookup
```

---

# 🔹 Important Insight (Interview Gold)

> “Only protocol requirements participate in dynamic dispatch via witness tables. Methods defined only in protocol extensions are statically dispatched because they are not part of the protocol’s contract.”

---

# 🔹 Why your earlier example worked

Because:

```swift
protocol Test {
    func sayHello()   // 👈 requirement
}
```

👉 So Swift created:

```text
Witness Table:
sayHello → Person.sayHello
```

---

# 🔹 Why trap example fails

Because:

```swift
protocol Test {}  // no requirement
```

👉 So:

```text
No witness table entry ❌
```

👉 Swift calls extension directly

---

# 🔚 Final Takeaway

```text
Protocol requirement → goes into witness table → dynamic dispatch
Extension only       → no witness table       → static dispatch
```

---

# 🚀 If you want next level

I can show:

* 🔥 How this looks in **SIL (Swift Intermediate Language)**
* 🔥 How compiler optimizes dispatch (devirtualization)
* 🔥 Real bugs caused by this in production apps

Just say **“show internals”** 😄

