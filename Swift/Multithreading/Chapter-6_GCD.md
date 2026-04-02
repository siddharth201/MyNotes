## Chapter -6 GCD(Grand Central Dispatch)

### 🎯 Part 1 — WHAT IS GCD?

👉 GCD = GCD stands for Grand Central Dispatch. It is a low leve API that manages tasks and threads for us and help achive multithreading.

#### ⭐ 1. Layman Explanation (Simple)
Imagine a restaurant kitchen:
* There is a manager (GCD)
* There are workers (threads)
* There are different lines of work:
    * Making sandwiches
    * Baking pizza
    * Washing dishes  
    
You simply give tasks to the manager → he decides which worker does what, and when.  
This manager is GCD.

#### 2. How GCD Works: -

GCD provides: (QTpTs)

**✔ 1. Queues**
Where tasks are added.

**✔ 2. System-managed thread pools**
Highly optimized by Apple.

**✔ 3. Task scheduling**
Automatically picks:
* which thread  
* which core  
* when to run  
* when to pause  
* based on QoS
  
You NEVER manage threads yourself.



#### ⭐ 3. Types of Dispatch Queues
**A. Serial Queue**  
Executes tasks one at a time, in order.

**B. Concurrent Queue**
Executes tasks in parallel (multiple tasks at once).  

**C. Main Queue**
Special serial queue that runs on main thread → UI updates.


#### ⭐ 4. Creating Queues

**✔ Serial Queue:** (One task runs → next waits.)
let serialQueue = DispatchQueue(label: "com.demo.serial")

**✔ Concurrent Queue** (Multiple tasks run in parallel.)
let concurrentQueue = DispatchQueue(label: "com.demo.concurrent",
                                    attributes: .concurrent)
**✔ Main Queue**
DispatchQueue.main.async { ... }

**✔ Global Queue (System-provided concurrent queues)**
DispatchQueue.global(qos: .userInitiated).async { ... }


####⭐ 6. Sync vs Async

**✔ sync → waits
✔ async → doesn’t wait**

Example: 
**❗ sync (Blocking)**

queue.sync {
    // runs immediately
    // current thread waits
}

**Meaning:**
* Current thread stops
* Task executes
* After completion → current thread continues


**✔ async (Non-Blocking)**

queue.async {
    // caller does NOT wait
    // work is enqueued and will execute later on a queue-managed thread
}

task is enqueued for asynchronous execution”, current thread continues instantly.

####⭐ 7. Sync/Async with Serial Queue


**Case 1: Serial Queue + Sync → sequential & blocking**
**Case 2: Serial Queue + Async → sequential & non-blocking**


**Example:**
```swift
let queue = DispatchQueue(label: "serial")

queue.async { print("A") }
queue.async { print("B") }
queue.async { print("C") }

Output: Always A B C (order preserved).
```

#### ⭐ 8. Sync/Async with Concurrent Queue

Case 1: Concurrent + Async → parallel execution

```swift
let queue = DispatchQueue(label: "concurrent", attributes: .concurrent)

queue.async { print("1") }
queue.async { print("2") }
queue.async { print("3") }

Output order: non-deterministic Could be 1-3-2 or 3-1-2 etc.
Tasks run concurrently.
```
