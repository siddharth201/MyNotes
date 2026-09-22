

## 🚀 What is DispatchGroup?

> DispatchGroup lets multiple tasks run concurrently and notifies you when ALL tasks are done..

---  

## Note:
It does **NOT:**  
* create threads  
* run tasks  
* synchronize shared memory  

It only **counts**: enter → leave.

## Interview-Friendly Explanation  
DispatchGroup lets you run multiple asynchronous tasks in parallel and get notified when all of them are finished.   

It's used for coordinating parallel API calls, image processing, or merging results.   

We can use enter/leave or queue.async, and notify is used to perform a final operation on completion.

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


## 2. Deep Understanding (How It Works)  

A **DispatchGroup** tracks:  
* How many tasks started  
* How many completed  
* When the counter hits ZERO → group completes  

## Two ways to use:  
**✔ queue.async**  
Automatically tracks entry/exit.

**✔ enter + leave**  
Manual control (more flexible).

**✔ notify**  
Called when group finishes.  

**✔ wait**  
Blocking version (rarely used).


## 9. Common Mistakes (Interview Traps)
❌ 1. Forgetting group.leave()
Group will never finish Cause → infinite wait

❌ 2. Calling group.leave() more times
Group counter goes negative → crash.

❌ 3. Using wait() on main queue
Causes deadlock or UI freeze.

❌ 4. Using group.async on a serial queue
Tasks run one after the other → no parallelism.

❌ 5. Updating UI inside background group.async
Always dispatch to main queue for UI:
DispatchQueue.main.async { updateUI() }

🎯 Interview GOLD answers
Q: What does DispatchGroup do?
It allows tracking of multiple asynchronous tasks and notifies when all have completed.
Q: Difference between notify and wait?
notify is non-blocking; wait blocks the calling thread.
Q: When should you NOT use DispatchGroup?
For task dependency chains — use async/await instead.

🧠 Mental model (lock this in)
DispatchGroup is like a counter:
* enter → +1
* leave → -1
* when count reaches zero → notify fires  

---  

## Example: (Enter-Leave) 

```swift
extension ViewController {
    
    func testDispatchGroup() {
        let group = DispatchGroup()
        
        group.enter()
        asynchronousTask1 { result in
            print(result)
            group.leave()
        }
        
        group.enter()
        asynchronousTask2 { result in
            print(result)
            group.leave()
        }
        
        group.enter()
        asynchronousTask3 { result in
            print(result)
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("All Tasks Completed")
        }
    }
    
    //Asynchronous Task-1
    func asynchronousTask1(completion: @escaping (String)->Void) {
        print("asynchronousTask1 start")
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3 ) {
            completion("asynchronousTask1 completed")
        }
    }
    
    //Asynchronous Task-2
    func asynchronousTask2(completion: @escaping (String)->Void) {
        print("asynchronousTask2 start")
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 7 ) {
            completion("asynchronousTask2 completed")
        }
    }
    
    //Asynchronous Task-3
    func asynchronousTask3(completion: @escaping (String)->Void) {
        print("asynchronousTask3 start")
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 5 ) {
            completion("asynchronousTask3 completed")
        }
    }
}  
```  

### Output
```swift
asynchronousTask1 start
asynchronousTask2 start
asynchronousTask3 start
asynchronousTask1 completed
asynchronousTask3 completed
asynchronousTask2 completed
All Tasks Completed
```  

## Example: (queue.async)

```swift
extension ViewController {
    
    //MARK: queue.async
    func testDispatchGroupQueueAsync() {
        let group = DispatchGroup()
        
        asynchronousTask4(group: group) { result in
            print(result)
        }
        
        asynchronousTask5(group: group) { result in
            print(result)
        }
        
        asynchronousTask6(group: group) { result in
            print(result)
        }
        
        group.notify(queue: .main) {
            print("All Tasks Completed")
        }
    }
    
    func asynchronousTask4(group: DispatchGroup?, completion: @escaping (String)->Void) {
        print("asynchronousTask4 start")
        
        DispatchQueue.global().async(group: group) {
            sleep(3)
            completion("asynchronousTask4 completed")
        }
    }
    
    func asynchronousTask5(group: DispatchGroup?, completion: @escaping (String)->Void) {
        print("asynchronousTask5 start")
        
        DispatchQueue.global().async(group: group) {
            sleep(7)
            completion("asynchronousTask5 completed")
        }
    }
    
    func asynchronousTask6(group: DispatchGroup?, completion: @escaping (String)->Void) {
        print("asynchronousTask6 start")
        
        DispatchQueue.global().async(group: group) {
            sleep(5)
            completion("asynchronousTask6 completed")
        }
    }
}
```  

### Output:  
```swift
asynchronousTask4 start
asynchronousTask5 start
asynchronousTask6 start
asynchronousTask4 completed
asynchronousTask6 completed
asynchronousTask5 completed
All Tasks Completed
```



