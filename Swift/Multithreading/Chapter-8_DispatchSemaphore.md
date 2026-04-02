**DispatchSemaphore regulates access to shared resources across concurrent threads in Swift.** It uses a counter to limit simultaneous operations, preventing race conditions by blocking threads when the count hits zero. [devindeep](https://devindeep.com/dispatch-semaphore-examples-in-swift/)

## Key Methods
- `wait()`: Decrements the counter; blocks if zero until signaled.
- `signal()`: Increments the counter, unblocking one waiting thread (FIFO order).
- Initial `value`: Sets available "permits" (e.g., 1 for mutex-like single access).

Unlike barriers (queue-specific), semaphores work across any threads, making them versatile for network requests or shared data. Use cautiously to avoid deadlocks. [mobikul](https://mobikul.com/dispatchsemaphore-in-swift/)

## Example: Limiting Concurrent Downloads
```swift
    func regulateAccess() {
        let queue = DispatchQueue.global(qos: .utility)
        let semaphore = DispatchSemaphore(value: 2) // allow only 2 tasks at a time
        
        let urls = ["url1", "url2", "url3", "url4", "url5"]
        
        for url in urls {
            queue.async {
                
                semaphore.wait() // 🔒 acquire permit
                
                print("Start \(url)")
                
                // Simulate API call
                sleep(2)
                
                print("End \(url)")
                
                semaphore.signal() // 🔓 release permit
            }
        }
    }
```
This ensures only 2 downloads run simultaneously, throttling resource use while allowing parallelism. Output shows staggered execution. [devindeep](https://devindeep.com/dispatch-semaphore-examples-in-swift/)  

## Example

Perfect — let’s build a **clean, interview-ready example** that clearly demonstrates how `DispatchSemaphore` works and *why we use it*.

---

### 🚀 Problem Statement (What interviewer expects)

> “You have 5 API calls, but you only want **2 to run at a time**.”

---

### ✅ Solution Using DispatchSemaphore

```swift
func regulateAccess() {
    let queue = DispatchQueue.global(qos: .utility)
    let semaphore = DispatchSemaphore(value: 2) // allow only 2 tasks at a time
    
    let urls = ["url1", "url2", "url3", "url4", "url5"]
    
    for url in urls {
        queue.async {
            
            semaphore.wait() // 🔒 acquire permit
            
            print("Start \(url)")
            
            // Simulate API call
            sleep(2)
            
            print("End \(url)")
            
            semaphore.signal() // 🔓 release permit
        }
    }
}
```

---

### 🔍 Expected Output (Important for explanation)

```
Start url1
Start url2

End url1
End url2

Start url3
Start url4

End url3
End url4

Start url5
End url5
```

👉 Only **2 tasks run in parallel** at any time

---

### 🧠 How It Works (Explain Like Pro)

### Step-by-step:

1. `DispatchSemaphore(value: 2)`

   * Only **2 threads allowed simultaneously**

2. First 2 tasks:

   * `wait()` → count becomes 1 → allowed
   * `wait()` → count becomes 0 → allowed

3. Third task:

   * `wait()` → count is 0 → ❌ **blocked**

4. When one task finishes:

   * `signal()` → count becomes 1
   * Blocked thread resumes

---

### 🔥 Visual Flow (Interview Explanation)

```
Initial permits = 2

Task1 → wait → ✅ (permits = 1)
Task2 → wait → ✅ (permits = 0)
Task3 → wait → ⛔ blocked

Task1 finishes → signal → permits = 1
Task3 resumes → wait → permits = 0
```

---

### ⚠️ Important Points (Must Say in Interview)

### 1. Always balance wait & signal

```swift
semaphore.wait()
// do work
semaphore.signal()
```

👉 Missing `signal()` → **deadlock**

---

### 2. Don’t block main thread

```swift
DispatchQueue.main.async {
    semaphore.wait() // ❌ UI freeze
}
```

---

### 3. Semaphore is a low-level tool

Prefer:

* `OperationQueue(maxConcurrentOperationCount:)`
* `async/await`

---

### 🎯 One-Line Definition (Say This Confidently)

> “DispatchSemaphore is used to limit the number of concurrent threads accessing a resource using wait and signal.”

---

### 💡 Bonus (Even Better Answer)

If interviewer asks **real use case**, say:

* API rate limiting (e.g., only 2 requests/sec)
* Database write protection
* File access synchronization

---

### One dangerous rule (VERY IMPORTANT)  
Calling wait() blocks the calling thread.

That’s why:  
* Never call wait() on main thread  
* Can cause deadlocks  
* Can freeze UI    



