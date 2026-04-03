
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

Great — this is a **small API but very important conceptually** (interviewers love it) 🔥

---

## 🚀 Method Signature

```swift
queue.addOperations([op1, op2, op3], waitUntilFinished: Bool)
```

👉 Adds multiple operations to the queue
👉 Optionally **blocks the current thread until all finish**

---

## 🧠 What `waitUntilFinished` Means

## 🔹 `false` (Non-blocking ✅)

```swift
queue.addOperations([op1, op2, op3], waitUntilFinished: false)

print("Next line executes immediately")
```

### 👉 Behavior:

* Operations run in background
* Current thread continues immediately

### 🔍 Output (example):

```text
Next line executes immediately
Task 1
Task 2
Task 3
```

---

## 🔹 `true` (Blocking ⚠️)

```swift
queue.addOperations([op1, op2, op3], waitUntilFinished: true)

print("This runs after all tasks finish")
```

### 👉 Behavior:

* Current thread **waits**
* Execution pauses until all operations complete

### 🔍 Output:

```text
Task 1
Task 2
Task 3
This runs after all tasks finish
```

---

## ⚠️ Important Rule

> ❌ Never use `waitUntilFinished: true` on the **main thread**

👉 It will:

* Freeze UI 🧊
* Cause bad user experience

---

## 🔥 Example (Runnable)

```swift
let queue = OperationQueue()

let op1 = BlockOperation {
    print("Task 1 started")
    sleep(2)
    print("Task 1 finished")
}

let op2 = BlockOperation {
    print("Task 2 started")
    sleep(1)
    print("Task 2 finished")
}

queue.addOperations([op1, op2], waitUntilFinished: false)

print("Main thread continues...")
```

---

## 🔄 Same Example with `true`

```swift
queue.addOperations([op1, op2], waitUntilFinished: true)

print("All tasks completed")
```

---

## 🧠 Key Difference

| Feature   | `waitUntilFinished: false` | `true`    |
| --------- | -------------------------- | --------- |
| Blocking  | ❌ No                       | ✅ Yes     |
| UI safe   | ✅ Yes                      | ❌ No      |
| Execution | Async                      | Sync-like |

---

## 🎯 When to Use

## ✅ Use `false` (most common)

* Normal async tasks
* UI apps
* Network calls

---

## ⚠️ Use `true` (rare)

* Background thread
* Testing / debugging
* Sequential batch processing

---

## 🔥 Alternative (Better Than Blocking)

Instead of:

```swift
waitUntilFinished: true
```

👉 Use:

```swift
queue.addOperations([op1, op2], waitUntilFinished: false)

let completionOp = BlockOperation {
    print("All done")
}

completionOp.addDependency(op1)
completionOp.addDependency(op2)

queue.addOperation(completionOp)
```

👉 Non-blocking + clean ✅

---

## 💬 Perfect Interview Answer

> “addOperations allows adding multiple operations to a queue at once. The waitUntilFinished parameter determines whether the current thread should block until all operations complete. It should generally be false to avoid blocking, especially on the main thread.”

---

## 🧠 Key Takeaways

* `addOperations` = batch add
* `waitUntilFinished: true` = blocking
* Prefer **non-blocking + dependencies**

---

# Q. Explain addOperations() vs addOperation {}  

Great question — this confusion is very common because the names look similar but mean **different things**.

---

## 🚀 First, the Truth

There is **NO API like this**:

```swift
queue.addOperations {
    // ❌ not valid
}
```

👉 So when people say **`addOperations {}`**, they usually mean:

### 👉 `addOperation {}` (singular)

---

## 🧠 Correct APIs

## ✅ 1. `addOperation(_:)` (singular)

```swift
queue.addOperation {
    print("Task running")
}
```

👉 This:

* Accepts a **closure**
* Internally creates a `BlockOperation`
* Adds it to queue

---

## ✅ 2. `addOperations(_:waitUntilFinished:)` (plural)

```swift
queue.addOperations([op1, op2], waitUntilFinished: false)
```

👉 This:

* Accepts **array of Operation objects**
* Gives option to **block or not**

---

## 🔥 Key Difference

| Feature         | `addOperation {}`             | `addOperations([...])`        |
| --------------- | ----------------------------- | ----------------------------- |
| Input           | Closure                       | Array of `Operation`          |
| Creation        | Auto creates `BlockOperation` | You create operations         |
| Use case        | Simple tasks                  | Multiple/pre-configured tasks |
| Blocking option | ❌ No                          | ✅ Yes (`waitUntilFinished`)   |

---

## ✅ Example Comparison

## 🔹 Using `addOperation {}`

```swift
let queue = OperationQueue()

queue.addOperation {
    print("Task 1")
}

queue.addOperation {
    print("Task 2")
}
```

👉 Simple and clean

---

## 🔹 Using `addOperations`

```swift
let queue = OperationQueue()

let op1 = BlockOperation {
    print("Task 1")
}

let op2 = BlockOperation {
    print("Task 2")
}

queue.addOperations([op1, op2], waitUntilFinished: false)
```

👉 More control (dependencies, reuse)

---

## 🔗 When `addOperations` is Useful

### ✔️ Dependencies

```swift
op2.addDependency(op1)
```

### ✔️ Reuse operations

### ✔️ Batch execution

### ✔️ Blocking option

---

## ❌ Common Mistake

```swift
queue.addOperations {
    print("Task") // ❌ wrong API
}
```

👉 Should be:

```swift
queue.addOperation {
    print("Task")
}
```

---

## 🎯 Interview Answer

> “`addOperation` is used to add a single task using a closure, while `addOperations` is used to add multiple Operation objects at once and optionally wait for their completion.”

---

## 🧠 Pro Tip

If interviewer asks:

> Which one do you use?

👉 Answer:

* Simple tasks → `addOperation`
* Complex workflows (dependencies, batching) → `addOperations`

---

## 🚀 Bonus Insight

```swift
queue.addOperation {
    // internally becomes:
    BlockOperation { ... }
}
```

---




