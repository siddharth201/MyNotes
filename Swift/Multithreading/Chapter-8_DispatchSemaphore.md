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

---  

# Q. wait and signal both should not be call from main thread?  

Great question — this is one of those subtle but very important rules that interviewers love.
Let’s answer it precisely, without confusion.

Short, correct answer
❌ wait() should NOT be called on the main thread ✅ signal() CAN be called on the main thread
They are not equal in terms of danger.

Why this difference exists (key idea)
🔴 wait() → BLOCKS the calling thread
🟢 signal() → DOES NOT block
This single fact explains everything.

1️⃣ Why wait() is dangerous on the main thread
semaphore.wait()
What it does:
* If semaphore count is 0
* The calling thread blocks
* It sleeps until someone calls signal()
If this is the main thread:
* UI freezes ❌
* RunLoop stops ❌
* signal() may never run ❌
* Deadlock risk ❌
Interview one-liner (memorize)
Calling wait() on the main thread can block the UI and cause deadlocks.

2️⃣ Why signal() is SAFE on the main thread
semaphore.signal()
What it does:
* Increments the semaphore count
* Wakes one waiting thread (if any)
* Returns immediately
* Does NOT block
So on the main thread:
* UI stays responsive ✅
* No deadlock by itself ✅
Very common real-world pattern
DispatchQueue.global().async {
    semaphore.wait()
    // background work
}

DispatchQueue.main.async {
    semaphore.signal()   // ✅ perfectly safe
}

3️⃣ Correct usage pattern (THIS IS THE GOLD STANDARD)
✅ Background thread waits
✅ Any thread (including main) signals
DispatchQueue.global().async {
    semaphore.wait()        // blocks background thread
    print("Doing work")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    semaphore.signal()      // releases background thread
}

4️⃣ When signal() on main thread becomes dangerous (rare case)
signal() itself is safe, BUT:
❌ If signal() is supposed to be called after some main-thread work, ❌ and the main thread is already blocked by wait()
→ deadlock.
Example (❌ DEADLOCK)
let semaphore = DispatchSemaphore(value: 0)

DispatchQueue.main.async {
    semaphore.wait()   // blocks main thread ❌
}

DispatchQueue.main.async {
    semaphore.signal() // never runs ❌
}
So the rule is really about who waits, not who signals.

5️⃣ Interview-quality rule (best phrasing)
wait() should never be called on the main thread because it blocks execution. signal() is non-blocking and can safely be called from the main thread.
This is 100% correct.

6️⃣ Summary table (lock this in)
Operation    Blocks?    Safe on Main Thread?
wait()    ✅ Yes    ❌ No
signal()    ❌ No    ✅ Yes
7️⃣ One-line mental model 🧠
Waiting blocks. Signaling releases. Blocking the main thread is always dangerous.


