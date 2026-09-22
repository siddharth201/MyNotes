
**Explain**
```swift
var count = 0

let increment = { [count] in
    print(count)
}

count = 10
increment()

vs 

var count = 0

let increment = { 
    print(count)
}

count = 10
increment()
```  

# Case 1️⃣ — Capture list `[count]`

```swift
var count = 0

let increment = { [count] in
    print(count)
}

count = 10
increment()
```

### ✅ Output

```
0
```

### What happened?

* `[count]` in the capture list means:

  > **Capture the value of `count` at the moment the closure is created**

* At closure creation time:

  ```
  count = 0
  ```

* The closure stores its **own copy** of `count`

After that:

```swift
count = 10
```

This **does not affect** the closure’s captured value.

---

### Mental model 🧠

> 📸 **Snapshot capture**
> The closure takes a *photo* of `count` when it’s created.

---

# Case 2️⃣ — No capture list

```swift
var count = 0

let increment = { 
    print(count)
}

count = 10
increment()
```

### ✅ Output

```
10
```

### What happened?

* No capture list → closure captures **the variable itself**
* The closure refers to the **same memory location** as `count`
* When `count` changes, the closure sees the updated value

---

### Mental model 🧠

> 🔗 **Live reference capture**
> The closure looks at `count` *when it runs*, not when it’s created.

---

# 🔥 Core Difference (INTERVIEW GOLD)

| Aspect         | `[count]`        | No capture list       |
| -------------- | ---------------- | --------------------- |
| Capture timing | At creation time | At execution time     |
| Captured as    | Value copy       | Reference to variable |
| Sees updates   | ❌ No             | ✅ Yes                 |
| Common use     | Freeze value     | Observe changes       |

---

# Why does Swift allow this?

Because **closures are values**, and Swift lets you decide:

* Capture **by value** → predictability
* Capture **by reference** → reactivity

This control is **very intentional**.

---

# When would you actually use `[count]`?

### ✅ Good use cases

* Logging initial state
* Freezing configuration
* Avoiding unexpected mutation
* Thread safety

```swift
let retryCount = retries
let task = { [retryCount] in
    print("Retry attempt:", retryCount)
}
```

---

# When NOT to use `[count]`

If you expect the closure to:

* Reflect latest state
* Track progress
* Observe changes

Then **do NOT freeze it**.

---

# ⚠️ Important interview note

This applies to **value types** (`Int`, `Struct`).

For **reference types (classes)**:

* `[object]` copies the reference, not the object
* Use `[weak object]` / `[unowned object]` for memory control

---

# Interview-ready explanation (say this)

> “Using `[count]` in the capture list freezes the value at closure creation time, while omitting it captures the variable by reference so the closure sees the latest value when executed.”

---

# One-line memory hook (MEMORIZE)

> **Capture list = snapshot
> No capture list = live view**

---


