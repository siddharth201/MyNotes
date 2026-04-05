
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

# Q. First, explain the difference between `DispatchQueue` and `OperationQueue`

### 1️⃣ Core Difference (One Sentence Each)
**DispatchQueue**
A `DispatchQueue` schedules blocks of code for execution with ordering and concurrency rules, but has no knowledge of task state, relationships, or lifecycle.

**OperationQueue**
An `OperationQueue` manages tasks as objects with state, dependencies, priorities, cancellation, and observability, built on top of GCD.

> **📌 Memorize this:**
> * **DispatchQueue** executes work.
> * **OperationQueue** coordinates work.

---

### 2️⃣ Level of Abstraction (THIS IS KEY)
| Aspect | DispatchQueue | OperationQueue |
| :--- | :--- | :--- |
| **Abstraction** | Low-level | High-level |
| **Unit of work** | Closure / block | Operation object |
| **Focus** | Execution | Coordination |
| **State awareness** | ❌ None | ✅ Full lifecycle |
| **Relationships** | ❌ None | ✅ Dependencies |

---

### 3️⃣ Mental Model (Very Important)
**DispatchQueue mental model**
> "Here is some work. Run it when you can."

**OperationQueue mental model**
> "Here is a task. It depends on other tasks. It can be cancelled, paused, reprioritized, and I care about its state."

---

### 4️⃣ How They Execute Under the Hood
**DispatchQueue**
* Enqueues blocks
* GCD decides when to run them
* No memory of what ran before
* No future awareness

**OperationQueue**
* Wraps work inside `Operation`
* Tracks: `isReady`, `isExecuting`, `isFinished`, `isCancelled`
* Uses GCD only as the execution engine

> **📌 Important truth:**
> `OperationQueue` ultimately uses `DispatchQueue` internally, but adds logic.

---

### 5️⃣ Cancellation (BIG DIFFERENCE)
**DispatchQueue / GCD**
`workItem.cancel()`
* Sets a flag
* You must check manually
* No automatic propagation

**OperationQueue**
`operation.cancel()`
* Queue respects cancellation
* Cancelled operations won’t start
* Dependent operations are skipped
* State changes are tracked

> **📌 Rule:**
> GCD cancellation is cooperative. `OperationQueue` cancellation is structured.

---

### 6️⃣ Dependencies (THE Deciding Factor)
**DispatchQueue**
* ❌ No built-in dependency system
* You must use: `DispatchGroup`, `Semaphores`, or Nested callbacks

**OperationQueue**
* ✅ Native dependency graph
* `parse.addDependency(download)`
* `save.addDependency(parse)`

**This gives:**
* Guaranteed ordering
* Automatic scheduling
* Automatic cancellation propagation

> **📌 This alone justifies OperationQueue.**

---

### 7️⃣ Pausing & Resuming Work
**DispatchQueue**
* ❌ Cannot pause a queue
* ❌ Cannot suspend execution cleanly

**OperationQueue**
* `queue.isSuspended = true`
* Pauses pending operations
* Running operations finish safely

---

### 8️⃣ Observability & Debugging
**DispatchQueue**
* No visibility
* No state
* Hard to debug complex flows

**OperationQueue**
* KVO on state
* Inspect progress
* Debug workflows easily

> **📌 This matters in large apps.**

---

### 9️⃣ Performance & Overhead
**DispatchQueue**
* ✔ Extremely lightweight
* ✔ Minimal overhead
* ✔ Best for small, fast tasks

**OperationQueue**
* ⚠️ Slight overhead
* ⚠️ More memory
* ⚠️ More bookkeeping

> **📌 Rule:**
> Don’t use `OperationQueue` for microtasks.

---

### 🔟 Problems Both Can Solve
These problems can be solved using either, though one may be cleaner.

| Problem | GCD | OperationQueue |
| :--- | :---: | :---: |
| Background execution | ✅ | ✅ |
| Parallel work | ✅ | ✅ |
| Throttling | Semaphore | maxConcurrentOperationCount |
| Grouping tasks | DispatchGroup | Dependencies |
| QoS control | Limited | Better |

---

### 11️⃣ Problems BEST Solved by OperationQueue ONLY
These become painful with GCD.

* 🔥 **Complex pipelines:** Download → Decode → Parse → Cache → UI
* 🔥 **User-cancellable workflows:** Scrolling lists, Search-as-you-type, Image loading
* 🔥 **Retry / failure handling:** Custom Operation subclass, Manual state control
* 🔥 **Pausable background work**

---

### 12️⃣ Problems BEST Solved by DispatchQueue
* 🔹 **Fire-and-forget work:** `queue.async { cleanup() }`
* 🔹 **Very short-lived tasks:** JSON parsing, Simple IO, Lightweight calculations
* 🔹 **Performance-critical paths**

---

### 🧠 One Mental Model (Lock This In)
* `DispatchQueue` answers: **“When can this run?”**
* `OperationQueue` answers: **“What must happen before this runs?”**

---

### 🎯 Interview-Perfect Comparison Answer
> `DispatchQueue` is a low-level GCD abstraction for scheduling blocks of code with serial or concurrent execution semantics. `OperationQueue` is a higher-level abstraction built on top of GCD that represents tasks as stateful operations with support for dependencies, cancellation, prioritization, and observability. `DispatchQueue` is best for lightweight, independent work, while `OperationQueue` excels at coordinating complex, cancellable workflows.

---

### Where You Are Now (Important)
At this point, you should be able to:
1.  Explain why `OperationQueue` exists
2.  Justify when GCD is not enough
3.  Choose correctly in interviews and real code

Take your time to digest this. When ready, ask your next “why” or “what if” question — that’s where real mastery happens.

---

# Q. But both are queues correct?
Yes — both are called “queues”, but they are queues at very different abstraction levels. This is the exact point where confusion usually starts, so let’s lock it down cleanly.

### Short, Precise Answer
Yes, both are queues — but they queue different things and solve different problems.
* **DispatchQueue** → queues blocks of code
* **OperationQueue** → queues `Operation` objects (tasks with state & rules)

### Why They Are Both Called “Queue”
At the most basic level, both do this:
`something waits` → `something runs later`
That’s where the similarity ends.

### What Each Queue Actually Queues
**1️⃣ DispatchQueue**
Queues: `() -> Void // closures / blocks`

**What the queue knows:**
* FIFO order
* Serial or concurrent rules

**What it does NOT know:**
* Whether this work is “done”
* Whether it was cancelled
* Whether it depends on something else
* Whether another task should wait
> **📌 It’s a dumb but fast executor queue**

**2️⃣ OperationQueue**
Queues: `Operation // objects with lifecycle & rules`

**What the queue knows:**
* Is the operation ready?
* Is it executing?
* Is it finished?
* Is it cancelled?
* Does it depend on another operation?
* What is its priority?
> **📌 It’s a smart coordinator queue**

---

### Key Insight (THIS IS THE “AHA” MOMENT)
* **DispatchQueue** is about execution.
* **OperationQueue** is about coordination.
* That’s why both are queues, but not interchangeable.

---

### How They Relate Under the Hood
Very important truth: **OperationQueue internally uses DispatchQueue / GCD to execute its operations.**
So the stack looks like:
1.  **OperationQueue** (scheduling, dependencies, cancellation)
2.  **DispatchQueue (GCD)**
3.  **CPU** (threads)

> **📌 OperationQueue is not an alternative to GCD — it’s a layer on top of it.**

---

### Why Apple Didn’t Name It Differently
Because conceptually both accept work, hold it, and release it later. But Apple expects developers to understand:
* **DispatchQueue** = low-level primitive
* **OperationQueue** = high-level workflow manager

---

### Analogy (Very Accurate)
**DispatchQueue = Conveyor belt**
* You drop boxes
* Boxes move forward
* No idea what’s inside
* No coordination

**OperationQueue = Project manager**
* Knows task order
* Knows dependencies
* Can cancel tasks
* Can pause work
* Can reprioritize

> **Both are “queues”, but one thinks, the other doesn’t.**

---

### Interview-Perfect Clarification
If an interviewer says: *“But both are queues, right?”*
**Your answer:**
> Yes, both are queues, but `DispatchQueue` queues executable blocks with minimal semantics, while `OperationQueue` queues `Operation` objects that carry state, dependencies, priorities, and cancellation behavior. `OperationQueue` uses `DispatchQueue` internally but adds coordination logic on top.

---

### Final Mental Model (Memorize This)
* **DispatchQueue** is a queue of work.
* **OperationQueue** is a queue of tasks with rules.

---

# Q. So like in DispatchQueue schedule tasks and worker thread will execute tasks, what happens with OperationQueue's operations?

Excellent — this is the right follow-up question.

### Short, Correct Answer (Lock This In)
`OperationQueue` does **NOT** execute operations itself. It schedules operations, and GCD executes their work on worker threads.

**The execution chain is:**
1.  `OperationQueue` (decides **WHAT** can run)
2.  `GCD / DispatchQueue` (decides **WHEN & WHERE**)
3.  `Worker Thread`
4.  `Operation's code runs`

---

### Step-by-Step: What Happens When You Add an Operation
**1️⃣ Adding the operation**
When you call `queue.addOperation(op)`, `OperationQueue` does **NOT** run it immediately. It:
* Stores `op` in its internal list
* Starts tracking its state: `isReady`, `isCancelled`, `isExecuting`, `isFinished`
* Checks: Dependencies, `maxConcurrentOperationCount`, Queue suspension state, and Priority.

**2️⃣ OperationQueue decides if it is READY**
An operation becomes eligible to run only if:
✔ All dependencies are finished
✔ It is not cancelled
✔ The queue is not suspended
✔ Concurrency limit allows it

**3️⃣ When ready, how does execution start?**
`OperationQueue` hands the operation’s `main()` work to GCD. Internally (conceptually):
`dispatchQueue.async { operation.start() }`
> **📌 OperationQueue does not create threads.**

**4️⃣ Who runs the operation code?**
A worker thread managed by GCD. That thread will call `operation.start()` → `operation.main()`.

**5️⃣ How state is managed DURING execution**
While the worker thread is executing:
* `isExecuting == true`
* `isFinished == false`
When execution ends, `OperationQueue` updates these states and unblocks dependent operations.

**6️⃣ Cancellation Behavior (Key Difference)**
* **If cancelled BEFORE execution:** `OperationQueue` never schedules it; it is never handed to GCD.
* **If cancelled DURING execution:** `isCancelled` becomes true. Your operation should check and exit early.

**7️⃣ Concurrency Control**
`queue.maxConcurrentOperationCount = 2` ensures at most 2 operations are executing at once. It simply limits how many operations it hands off to GCD at a time.

---

### 🧠 Final Mental Model (This Is THE One)
> `DispatchQueue` is a dumb scheduler. `OperationQueue` is a smart traffic controller that uses the same roads.

---

# Q. Let's suppose an operation is in between and we cancelled it, then what will happen?

### Short, Correct Answer (Memorize This)
Cancelling an `Operation` does **NOT** kill the thread. It marks the operation as cancelled, and it is the operation’s responsibility to stop itself.
* ❌ Thread is **NOT** stopped
* ❌ Code is **NOT** forcefully interrupted
* ✅ Operation state changes
* ✅ Queue reacts to that state

### What “Cancel” REALLY Means in OperationQueue
When you call `operation.cancel()`:
1.  Sets `operation.isCancelled = true`
2.  Updates internal state tracking
3.  Notifies dependents
**There is no thread interruption.**

---

### Two Different Cancellation Scenarios
**1️⃣ Operation Cancelled Before It Starts**
`OperationQueue` sees `isCancelled == true`, the operation is never scheduled, and it moves directly to `isFinished = true`.

**2️⃣ Operation Cancelled While It Is Executing (Your Question)**
`isCancelled` becomes true, but the thread continues running. Your code **MUST** check `isCancelled`.

**Correct Pattern:**
```swift
let op = BlockOperation {
    for i in 1...10 {
        if op.isCancelled {
            print("❌ Operation cancelled, exiting")
            return
        }
        sleep(1)
        print("Step \(i)")
    }
}
```

---

### Important Comparison (GCD vs OperationQueue)
| Feature | GCD | OperationQueue |
| :--- | :---: | :---: |
| **Cancel before start** | ❌ Manual | ✅ Automatic |
| **Cancel during execution** | ❌ Manual | ⚠️ Cooperative |
| **Dependency handling** | ❌ | ✅ |
| **State tracking** | ❌ | ✅ |

> **📌 OperationQueue gives you structure, not magic.**

---

# Q. This seems similar to DispatchWorkItem cancel mechanism

Yes — they are similar in spirit, but very different in power and guarantees.

### The Core Similarity
Both `DispatchWorkItem` and `Operation` use **cooperative cancellation**:
❗ Neither force-stops a running thread
❗ Both rely on a cancellation flag
❗ Your code must check that flag and exit early

### Where They Diverge
**1️⃣ Cancellation before execution**
* **DispatchWorkItem:** The item remains enqueued; you must check manually.
* **Operation:** `OperationQueue` will never schedule it.

**2️⃣ Dependencies & Propagation**
* **DispatchWorkItem:** No dependency graph; cancellation doesn't affect others.
* **Operation:** Cancelling one can automatically block or cascade to dependents.

**3️⃣ Queue Awareness**
* **DispatchWorkItem:** Queue only knows “execute this block.”
* **Operation:** Queue understands lifecycle states (`ready`, `executing`, etc.).

---

### Concrete Comparison Table
| Feature | DispatchWorkItem | Operation |
| :--- | :---: | :---: |
| **Cancellation type** | Flag-based | Flag-based |
| **Prevent task start** | ❌ | ✅ |
| **Cancel dependencies** | ❌ | ✅ |
| **State tracking** | ❌ | ✅ |
| **Pause queue** | ❌ | ✅ |

> **Correct Mental Model:**
> `DispatchWorkItem` cancellation is local and manual. `Operation` cancellation is global and structured.

---

# Q. Provide useful examples which I can run in playground and understand conceptually and practically

### ⚠️ Playground Setup
```swift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
```

### 1️⃣ DispatchWorkItem — Cancellation Is Manual & Local
```swift
let queue = DispatchQueue.global()
let workItem = DispatchWorkItem {
    for i in 1...5 {
        if workItem.isCancelled {
            print("❌ WorkItem cancelled, exiting")
            return
        }
        print("WorkItem step \(i)")
        sleep(1)
    }
}

queue.async(execute: workItem)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("👉 Cancelling WorkItem")
    workItem.cancel()
}
```

### 2️⃣ OperationQueue — Same Task, Better Control
```swift
let opQueue = OperationQueue()
let operation = BlockOperation {
    for i in 1...5 {
        if operation.isCancelled {
            print("❌ Operation cancelled, exiting")
            return
        }
        print("Operation step \(i)")
        sleep(1)
    }
}

opQueue.addOperation(operation)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    print("👉 Cancelling Operation")
    operation.cancel()
}
```

### 3️⃣ 🔥 OperationQueue Dependencies (THE REAL POWER)
```swift
let pipelineQueue = OperationQueue()

let download = BlockOperation {
    print("⬇️ Download started")
    sleep(2)
    print("⬇️ Download finished")
}

let parse = BlockOperation {
    print("📦 Parsing data")
}

let save = BlockOperation {
    print("💾 Saving data")
}

parse.addDependency(download)
save.addDependency(parse)

pipelineQueue.addOperations([download, parse, save], waitUntilFinished: false)

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print("👉 Cancelling Download")
    download.cancel()
}
```

---

# Q. Provide 1 or 2 production ready examples

### 🟢 Example 1 — Image Downloader with Cancellation & Reuse
**Step 1: ImageDownloadOperation**
```swift
import UIKit

class ImageDownloadOperation: Operation {
    private let url: URL
    private(set) var image: UIImage?

    init(url: URL) {
        self.url = url
    }

    override func main() {
        if isCancelled { return }
        guard let data = try? Data(contentsOf: url) else { return }
        if isCancelled { return }
        image = UIImage(data: data)
    }
}
```

**Step 2: OperationQueue Manager**
```swift
class ImageLoader {
    private let queue = OperationQueue()
    private var operations: [IndexPath: ImageDownloadOperation] = [:]

    init() {
        queue.maxConcurrentOperationCount = 4
    }

    func loadImage(from url: URL, for indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        operations[indexPath]?.cancel()
        let operation = ImageDownloadOperation(url: url)
        operation.completionBlock = {
            DispatchQueue.main.async {
                completion(operation.image)
            }
        }
        operations[indexPath] = operation
        queue.addOperation(operation)
    }
}
```

### 🟢 Example 2 — Data Processing Pipeline (Dependencies)
```swift
let fetch = BlockOperation { print("⬇️ Fetching data"); sleep(2) }
let parse = BlockOperation { print("📦 Parsing data"); sleep(1) }
let save = BlockOperation { print("💾 Saving data"); sleep(1) }
let notifyUI = BlockOperation { 
    DispatchQueue.main.async { print("✅ UI Updated") } 
}

parse.addDependency(fetch)
save.addDependency(parse)
notifyUI.addDependency(save)

let dataQueue = OperationQueue()
dataQueue.addOperations([fetch, parse, save, notifyUI], waitUntilFinished: false)
```

---

### 🚀 Final One-Line Summary (Memorize)
> **OperationQueue is best used when tasks are stateful, cancellable, and interdependent, such as image loading pipelines or multi-step data processing workflows.**  

# Q. Does OperationQueue have some notify machenism?  

Great question — this comes up a lot in interviews 🔥

---

## 🚀 Short Answer

> ❌ `OperationQueue` does **NOT** have a direct `notify` API like `DispatchGroup`
> ✅ But you can achieve the same behavior using:

* Dependencies (`BlockOperation`)
* KVO (`operationCount`)
* `waitUntilFinished` (blocking)

---

## 🧠 Mental Model

```text
DispatchGroup.notify → built-in completion hook
OperationQueue      → use dependencies instead
```

---

## ✅ 1️⃣ Recommended Way (BEST): Completion Operation

👉 This is the **OperationQueue equivalent of notify**

---

## Example

```swift id="opnotify1"
let queue = OperationQueue()

let op1 = BlockOperation {
    print("Task 1")
}

let op2 = BlockOperation {
    print("Task 2")
}

let completionOp = BlockOperation {
    print("🎉 All tasks finished")
}

// Make completion depend on others
completionOp.addDependency(op1)
completionOp.addDependency(op2)

queue.addOperations([op1, op2, completionOp], waitUntilFinished: false)
```

---

## 🔍 Output

```text
Task 1
Task 2
🎉 All tasks finished
```

---

## 🧠 Why this works

```text
completionOp waits for op1 + op2
↓
Runs only after all complete
```

👉 Exactly like `DispatchGroup.notify` ✅

---

## ✅ 2️⃣ Using `addBarrierBlock` (Less Known 🔥)

```swift id="opnotify2"
let queue = OperationQueue()

queue.addOperation {
    print("Task 1")
}

queue.addOperation {
    print("Task 2")
}

queue.addBarrierBlock {
    print("🎉 All tasks finished")
}
```

---

## 🧠 Behavior

```text
Barrier waits for all previous operations
↓
Executes exclusively
```

👉 Works like notify (but only for that queue)

---

## ⚠️ Important

* Works only for operations **already added before barrier**
* Doesn’t track future operations

---

## ⚠️ 3️⃣ `waitUntilFinished` (Blocking ❌)

```swift id="opnotify3"
queue.addOperations([op1, op2], waitUntilFinished: true)
print("Done")
```

👉 Blocks thread ❌
👉 Not recommended for UI

---

## ⚠️ 4️⃣ KVO on `operationCount` (Advanced / Rare)

```swift id="opnotify4"
queue.addObserver(self, forKeyPath: "operationCount", options: .new, context: nil)
```

👉 When `operationCount == 0` → all done

❌ Complex
❌ Rarely used today

---

## ⚖️ Comparison with DispatchGroup

| Feature              | DispatchGroup | OperationQueue       |
| -------------------- | ------------- | -------------------- |
| notify API           | ✅ Yes         | ❌ No                 |
| Equivalent           | notify()      | completion operation |
| Blocking wait        | wait()        | waitUntilFinished    |
| Better for workflows | ❌             | ✅                    |

---

## 🎯 Interview Answer

> “OperationQueue doesn’t have a direct notify method like DispatchGroup, but we can achieve the same behavior by adding a completion BlockOperation that depends on all other operations, or by using addBarrierBlock.”

---

## 🧠 Final Mental Model

```text
DispatchGroup.notify → built-in
OperationQueue       → dependency-based notify
```

---







