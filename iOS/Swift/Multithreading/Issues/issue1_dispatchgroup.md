

## 🧩 Problem Statement

While executing multiple parallel tasks using `DispatchGroup`, the final result array contains incomplete or incorrect data.  

## Code Snippet
```swift
    var dispatchGroup = DispatchGroup()
    var results: [String] = []
    
    func performParrelelTasks() {
        
        for i in 1...5 {
            self.dispatchGroup.enter()
            DispatchQueue.global().async { [weak self] in
                print("Fetching API \(i)")
                sleep(2)
                self?.results.append("Data \(i)")
                self?.dispatchGroup.leave()
            }
        }
    }
```

### Example Output:

```
All APIs done: ["Data 5"]
```

Expected:

```
All APIs done: ["Data 1", "Data 2", "Data 3", "Data 4", "Data 5"]
```

---

## 🔍 Root Cause (Reason Behind Issue)

The issue occurs due to **race condition on shared mutable state**.

### Key Points:

* Multiple threads are executing in parallel using `DispatchQueue.global().async`
* All threads are trying to modify a shared array:

  ```
  results.append("Data \(i)")
  ```
* Swift arrays are **NOT thread-safe**
* Concurrent writes lead to:

  * Data overwrite
  * Lost updates
  * Undefined behavior

### Important Insight:

> DispatchGroup only tracks task completion — it does NOT ensure thread safety.

---

## ⚠️ Symptoms

* Missing elements in array
* Random order or inconsistent results
* Sometimes only last value persists

---

## ✅ Solution

Ensure **thread-safe access** to shared resource (`results` array)

---

### ✔️ Solution 1: Serial Queue (Recommended)

```swift
let serialQueue = DispatchQueue(label: "com.results.queue")

serialQueue.async {
    self.results.append("Data \(i)")
    self.dispatchGroup.leave()
}
```

✔ Guarantees:

* One write at a time
* No race condition

---

### ✔️ Solution 2: Barrier (Advanced)

```swift
let queue = DispatchQueue(label: "com.results.queue", attributes: .concurrent)

queue.async(flags: .barrier) {
    self.results.append("Data \(i)")
    self.dispatchGroup.leave()
}
```

✔ Allows:

* Concurrent reads
* Exclusive writes

---

### ✔️ Solution 3: Actor (Modern Swift - Best)

```swift
actor ResultStore {
    var results: [String] = []
    
    func append(_ value: String) {
        results.append(value)
    }
}
```

✔ Automatic thread safety
✔ Preferred in modern Swift

---

## 🚨 Important Notes

* Always call `dispatchGroup.leave()` after thread-safe operation
* Avoid modifying shared state directly from multiple threads
* DispatchGroup ≠ Thread Safety

---

## 🎯 Interview Takeaway

> “The issue was caused by concurrent writes to a shared array, leading to a race condition. DispatchGroup only synchronizes completion, not data access. The fix is to ensure thread-safe writes using a serial queue, barrier, or actor.”

---

## 🧠 Key Learning

* Shared mutable state + concurrency = ⚠️ danger
* Always protect writes
* Prefer modern concurrency (`Actor`) when possible

---


