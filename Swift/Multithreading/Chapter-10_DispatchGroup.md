

## 🚀 What is DispatchGroup?

> DispatchGroup lets multiple tasks run concurrently and notifies you when ALL tasks are done..

---

## 🧠 Why Do We Use It?

When you have:

* Multiple API calls
* Parallel tasks
* And you want to **know when everything is done**

---

## 🎯 Interview Definition

> “DispatchGroup is used to monitor a group of asynchronous tasks and execute a completion block once all tasks have finished.”

---

## ✅ Basic Example

## 🔹 Scenario:

Fetch 3 APIs → once all complete → update UI

```swift
let group = DispatchGroup()
let queue = DispatchQueue.global()

group.enter()
queue.async {
    print("Task 1 started")
    sleep(2)
    print("Task 1 finished")
    group.leave()
}

group.enter()
queue.async {
    print("Task 2 started")
    sleep(3)
    print("Task 2 finished")
    group.leave()
}

group.enter()
queue.async {
    print("Task 3 started")
    sleep(1)
    print("Task 3 finished")
    group.leave()
}
```

---

## 🔔 Notify when all done

```swift
group.notify(queue: .main) {
    print("🎉 All tasks completed")
}
```

---

## 🔍 Output (order may vary)

```text
Task 1 started
Task 2 started
Task 3 started

Task 3 finished
Task 1 finished
Task 2 finished

🎉 All tasks completed
```

---

## 🧠 How It Works

```text
group.enter() → task started
group.leave() → task finished

When all enter = leave → notify fires
```

---

## ⚠️ VERY IMPORTANT (Interview Trap)

## ❌ Forgetting `leave()`

```swift
group.enter()
// no leave ❌
```

👉 Result:

* `notify` NEVER called
* App appears stuck

---

## 🔥 Alternative Syntax (Cleaner)

Instead of manual `enter/leave`:

```swift
let group = DispatchGroup()
let queue = DispatchQueue.global()

queue.async(group: group) {
    print("Task 1")
}

queue.async(group: group) {
    print("Task 2")
}

group.notify(queue: .main) {
    print("Done")
}
```

👉 GCD handles enter/leave automatically ✅

---

## 🚀 Real Use Case

### Multiple API calls:

```swift
let group = DispatchGroup()

var results: [String] = []

for i in 1...3 {
    group.enter()
    
    DispatchQueue.global().async {
        print("Fetching API \(i)")
        sleep(2)
        
        results.append("Data \(i)")
        group.leave()
    }
}

group.notify(queue: .main) {
    print("All APIs done: \(results)")
}
```

---

## ⚠️ Thread Safety Note

```swift
results.append(...)
```

👉 This is **not thread-safe** ❌
👉 Use:

* Serial queue
* Barrier
* Lock

---

## 🔥 group.wait() (Important but Dangerous)

```swift
group.wait()
print("All done")
```

👉 Blocks current thread ❌
👉 Never use on **main thread**

---

## ⚖️ DispatchGroup vs Semaphore

| Feature  | DispatchGroup         | Semaphore         |
| -------- | --------------------- | ----------------- |
| Purpose  | Track completion      | Limit concurrency |
| Blocking | Optional (`wait`)     | Yes (`wait`)      |
| Use case | Multiple tasks finish | Control threads   |

---

## 🧠 Key Takeaways

* `enter()` → task started
* `leave()` → task finished
* `notify()` → all done callback
* `wait()` → blocking (avoid on main thread)

---

## 💬 Perfect Interview Answer

> “DispatchGroup is used to group multiple asynchronous tasks and get notified when all tasks are completed, typically using enter, leave, and notify.”



