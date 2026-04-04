Great — **TaskGroup** is one of the most important parts of modern Swift concurrency 🔥
It’s the **structured replacement of DispatchGroup**, but much more powerful.

---

# 🚀 1️⃣ What is `TaskGroup`?

## 🧠 Definition

> A **TaskGroup** allows you to run multiple async tasks in parallel and **collect their results in a structured and safe way**.

---

## 🎯 One-Line

```text
TaskGroup = structured parallel execution + result handling
```

---

# 🚀 2️⃣ Basic Example (Runnable)

```swift id="tg1"
import Foundation

func fetch(_ id: Int) async -> String {
    print("🔵 Start \(id)")
    try? await Task.sleep(nanoseconds: UInt64(id) * 1_000_000_000)
    print("🟢 End \(id)")
    return "Data \(id)"
}

func taskGroupExample() async {
    print("\n🚀 TaskGroup START\n")
    
    await withTaskGroup(of: String.self) { group in
        
        for i in 1...3 {
            group.addTask {
                await fetch(i)
            }
        }
        
        for await result in group {
            print("✅ Got:", result)
        }
    }
}
```

---

# 🧠 What’s happening?

```text
Group starts
↓
3 tasks start in parallel
↓
Each finishes independently
↓
Results are collected one-by-one
```

---

# 🚀 3️⃣ How It Works Internally

---

## Step-by-step:

```text
withTaskGroup {
    ↓
Create group (parent task)
    ↓
group.addTask → child tasks
    ↓
Tasks run concurrently
    ↓
Parent iterates results
    ↓
All tasks finish → group ends
}
```

---

# 🚀 4️⃣ Important Features

---

## ✅ 1. Parallel Execution

```swift id="tg2"
group.addTask { await fetch(1) }
group.addTask { await fetch(2) }
```

👉 Runs concurrently (like async let)

---

## ✅ 2. Dynamic Task Creation

```swift id="tg3"
for i in 1...100 {
    group.addTask {
        await fetch(i)
    }
}
```

👉 Unlike `async let`, number of tasks can be dynamic

---

## ✅ 3. Result Collection

```swift id="tg4"
for await result in group {
    print(result)
}
```

👉 Results come **as tasks complete**, not in order

---

## ✅ 4. Automatic Cancellation

```swift id="tg5"
return // parent exits
```

👉 All child tasks get cancelled automatically

---

## 🚀 5️⃣ Error Handling (VERY IMPORTANT)

---

## Using throwing group:

```swift id="tg6"
func throwingExample() async throws {
    try await withThrowingTaskGroup(of: String.self) { group in
        
        group.addTask {
            throw NSError(domain: "", code: 1)
        }
        
        for try await result in group {
            print(result)
        }
    }
}
```

---

## 🔥 Behavior:

* If one task throws → others are cancelled
* Error propagates automatically

---

# 🚀 6️⃣ TaskGroup vs async let

---

## 🔹 async let

```swift id="tg7"
async let a = fetch(1)
async let b = fetch(2)
```

✔ Fixed number of tasks
✔ Simpler

---

## 🔹 TaskGroup

```swift id="tg8"
for i in 1...N {
    group.addTask { await fetch(i) }
}
```

✔ Dynamic tasks
✔ More control

---

# ⚖️ Comparison

| Feature          | async let | TaskGroup |
| ---------------- | --------- | --------- |
| Dynamic tasks    | ❌         | ✅         |
| Result iteration | ❌         | ✅         |
| Flexibility      | Low       | High      |

---

# 🚀 7️⃣ Real Production Example

---

## 🎯 Scenario: Fetch multiple APIs

```swift id="tg9"
func fetchAll() async -> [String] {
    await withTaskGroup(of: String.self) { group in
        
        let ids = [1, 2, 3, 4]
        
        for id in ids {
            group.addTask {
                await fetch(id)
            }
        }
        
        var results: [String] = []
        
        for await result in group {
            results.append(result)
        }
        
        return results
    }
}
```

---

# 🚀 8️⃣ Limiting Concurrency (Advanced)

---

```swift id="tg10"
func limitedTasks() async {
    let limit = 2
    var running = 0
    
    await withTaskGroup(of: Void.self) { group in
        for i in 1...5 {
            if running >= limit {
                await group.next()
                running -= 1
            }
            
            running += 1
            group.addTask {
                print("Task \(i)")
                try? await Task.sleep(nanoseconds: 2_000_000_000)
            }
        }
    }
}
```

---

# 🚀 9️⃣ Cancellation Behavior

---

```swift id="tg11"
group.addTask {
    if Task.isCancelled {
        return
    }
}
```

👉 Must check manually
👉 Cancellation is cooperative

---

# 🚀 🔟 TaskGroup vs DispatchGroup

---

## DispatchGroup

```swift id="tg12"
group.enter()
group.leave()
```

❌ Manual tracking
❌ No result handling
❌ No cancellation

---

## TaskGroup

```swift id="tg13"
group.addTask { ... }
```

✔ Automatic lifecycle
✔ Built-in result handling
✔ Structured

---

# 🧠 Final Mental Model

```text
TaskGroup = parent manages multiple child tasks safely
```

---

# 🎯 Interview Answer

> “TaskGroup is a structured concurrency construct that allows running multiple asynchronous tasks in parallel while safely managing their lifecycle, collecting results, and handling cancellation automatically.”

---

# 🔥 Common Mistakes

* ❌ Forgetting `for await`
* ❌ Not handling errors in throwing group
* ❌ Using Task instead of TaskGroup for parallel work

---

# Q. Explain `await withTaskGroup(of: String.self) { group in`  



