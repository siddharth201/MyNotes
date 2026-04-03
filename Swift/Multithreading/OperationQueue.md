
## 🚀 What is OperationQueue?

> ****OperationQueue** is a higher-level abstraction over GCDOperationQueue**. It manages the execution of tasks (**Operations**) with built-in support for **dependencies, priorities, and concurrency control**.

---

## 🧠 Think of It Like This

* `DispatchQueue` → low-level (manual control)
* `OperationQueue` → high-level (more features, easier management)

---

## 🎯 Interview Definition

> “OperationQueue is a queue that manages the execution of Operation objects, allowing control over concurrency, dependencies, and task cancellation.”

---

## 🔹 Core Components

## 1. `Operation` (Task)

* Unit of work
* Two types:

  * `BlockOperation`
  * Custom `Operation` subclass

---

## 2. `OperationQueue`

* Executes operations
* Can run tasks:

  * Serially
  * Concurrently

---

## ✅ Basic Example (BlockOperation)

```swift
let queue = OperationQueue()

let op1 = BlockOperation {
    print("Task 1")
}

let op2 = BlockOperation {
    print("Task 2")
}

queue.addOperation(op1)
queue.addOperation(op2)
```

👉 Runs concurrently (default behavior)

---

## 🔥 Control Concurrency (Very Important)

```swift
let queue = OperationQueue()
queue.maxConcurrentOperationCount = 2
```

👉 Only 2 tasks run at a time
👉 Equivalent to **DispatchSemaphore use case**

---

## 🔗 Dependencies (Powerful Feature)

```swift
let queue = OperationQueue()

let op1 = BlockOperation {
    print("Download Data")
}

let op2 = BlockOperation {
    print("Process Data")
}

let op3 = BlockOperation {
    print("Update UI")
}

op2.addDependency(op1) // op2 waits for op1
op3.addDependency(op2) // op3 waits for op2

queue.addOperations([op1, op2, op3], waitUntilFinished: false)
```

---

## 🔍 Output (Guaranteed Order)

```text
Download Data
Process Data
Update UI
```

👉 Even though queue is concurrent!

---

## 🚀 Real Example (API Calls with Limit)

```swift
let queue = OperationQueue()
queue.maxConcurrentOperationCount = 2

for i in 1...5 {
    queue.addOperation {
        print("Fetching API \(i)")
        sleep(2)
        print("Done API \(i)")
    }
}
```

👉 Only 2 APIs run at a time

---

## ❌ Cancellation Support

```swift
let op = BlockOperation {
    print("Running task")
}

queue.addOperation(op)

// Cancel
op.cancel()
```

👉 You can also check:

```swift
if op.isCancelled {
    return
}
```

---

## ⚖️ OperationQueue vs GCD

| Feature             | OperationQueue | GCD          |
| ------------------- | -------------- | ------------ |
| Level               | High-level     | Low-level    |
| Dependencies        | ✅ Yes          | ❌ No         |
| Cancellation        | ✅ Yes          | ❌ No         |
| Concurrency control | ✅ Easy         | ⚠️ Manual    |
| Complexity          | Easier         | More control |

---

## 🧠 When to Use OperationQueue

Use it when:

* You need **task dependencies**
* You want **cancellation**
* You want **better control over tasks**

---

## ⚠️ When NOT to Use

* Simple async work → use GCD
* Modern Swift → prefer `async/await`

---

### 💬 Perfect Interview Answer

> “OperationQueue is a higher-level abstraction over GCD that allows us to manage tasks using Operation objects, with features like dependencies, cancellation, and concurrency control.”

---

## 🧠 Key Takeaways

* `Operation` = task
* `OperationQueue` = executes tasks
* Supports:

  * Dependencies 🔗
  * Cancellation ❌
  * Concurrency control 🎛️

---

## 🚀 Pro Tip (Modern Swift)

Today:

* `OperationQueue` → still used in legacy / UIKit apps
* Modern → `Task`, `TaskGroup`, `async/await`

---  

# Q. Explain `waitUntilFinished`  



