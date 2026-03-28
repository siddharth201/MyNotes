
# Version - 1

## 🔹 The Core Reason (in one line)

> Swift uses **two different dispatch mechanisms**:

* **Witness Table (dynamic dispatch)**
* **Static dispatch (direct call)**

---

## 🔹 Case 1: Method declared in protocol

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

## 🔹 Case 2: Method ONLY in extension

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

## 🔥 Key Technical Difference

| Case                 | Stored in witness table? | Dispatch |
| -------------------- | ------------------------ | -------- |
| Declared in protocol | ✅ Yes                    | Dynamic  |
| Only in extension    | ❌ No                     | Static   |

---

## 🔹 Why Swift does this?

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

## 🔹 Internal Mental Model

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

## 🔹 Important Insight (Interview Gold)

> “Only protocol requirements participate in dynamic dispatch via witness tables. Methods defined only in protocol extensions are statically dispatched because they are not part of the protocol’s contract.”

---

## 🔹 Why your earlier example worked

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

## 🔹 Why trap example fails

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

### 🔚 Final Takeaway

```text
Protocol requirement → goes into witness table → dynamic dispatch
Extension only       → no witness table       → static dispatch
```

---

# Version - 2 

This is a classic Swift interview question that touches on **Protocol Extensions** and **Static vs. Dynamic Dispatch**. 

In your specific code snippet, both calls will print **"Hello from Person"**. Here is the breakdown of why that happens and how changing one small thing can completely flip the result.

---

### Why both print "Hello from Person"
The behavior depends on whether the method is a **requirement** of the protocol or just an **extension**.

1.  **The Requirement:** You defined `func sayHello()` inside the `protocol Test { ... }` block. This makes it a "requirement."
2.  **The Witness Table:** Because it’s a requirement, Swift uses **Dynamic Dispatch**. When you call `sayHello()`, Swift looks at the actual type of the object at runtime (which is `Person`) and uses its implementation.
3.  **The Override:** Since `Person` provides its own version of `sayHello()`, it "fulfills" the requirement, and that version takes precedence over the default implementation provided in the extension.



---

### The Comparison
Here is how the two variables behave under the hood:

| Variable | Static Type | Runtime Type | Dispatch Type | Result |
| :--- | :--- | :--- | :--- | :--- |
| `p1` | `Person` | `Person` | Direct/Static | **"Hello from Person"** |
| `p2` | `Test` | `Person` | Dynamic (via Witness Table) | **"Hello from Person"** |

---

### The "Gotcha": Static Dispatch
The real magic (and confusion) happens if you remove the function declaration from the protocol itself but keep it in the extension. 

**Watch what happens if we change the code to this:**

```swift
protocol Test {
    // func sayHello()  <-- REMOVED FROM HERE
}

extension Test {
    func sayHello() {
        print("Hello from protocol")
    }
}

struct Person: Test {
    func sayHello() {
        print("Hello from Person")
    }
}

let p2: Test = Person()
p2.sayHello() // Output: "Hello from protocol"
```

**Why did it change?**
* Because `sayHello()` is no longer in the protocol definition, it is no longer a "requirement."
* It is now just a **static extension method**. 
* When you call `p2.sayHello()`, the compiler only knows that `p2` is of type `Test`. Since there is no requirement to look up in a table, it simply calls the implementation it knows for `Test` at compile-time.

---

### Summary
* **Method in Protocol + Extension:** Acts like a "virtual" method. The implementation in the concrete type (`Person`) always wins.
* **Method ONLY in Extension:** Acts like a "static" method. The implementation is chosen based on the **variable's type**, not the object's actual type.

Would you like me to show you how this behavior differs when using **Classes** and inheritance instead of Structs?

