

## 🚨 BIGGER PROBLEM (BlockOperation + async task - Most Important 🔥)

### ❌ Problem: BlockOperation + async task

```swift
BlockOperation {
    asynchronousTask { ... }
}
```

👉 What happens?

```text
BlockOperation finishes immediately ❌
Async task continues later ❌
```

👉 OperationQueue thinks:

> “Task is DONE” ❌

---

# 🧠 Why?

## BlockOperation only tracks **synchronous work**

---

# 🚀 Correct Solution (Production Level)

👉 You need **Asynchronous Operation subclass**

---

## ✅ Proper Async Operation

```swift
class AsyncOperation: Operation {
    
    private var _isExecuting = false
    private var _isFinished = false
    
    override var isAsynchronous: Bool { true }
    
    override var isExecuting: Bool {
        get { _isExecuting }
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isFinished: Bool {
        get { _isFinished }
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override func start() {
        isExecuting = true
        
        asynchronousTask { result in
            print(result)
            self.finish()
        }
    }
    
    func finish() {
        isExecuting = false
        isFinished = true
    }
}
```

---

## Usage

```swift
let queue = OperationQueue()
queue.addOperation(AsyncOperation())
```

---

# 🎯 Interview Insight (Very Important)

> “BlockOperation is not suitable for asynchronous tasks because it completes immediately after the block finishes. For async work, we must subclass Operation and manage isExecuting and isFinished manually.”

---

# 🧠 Final Summary

### Your Errors:

1. ❌ Stored property in extension → Not allowed
2. ❌ Using self before initialization
3. ❌ BlockOperation not suitable for async work

---

### Correct Approach:

* Use `lazy` or function to fix compile error ✅
* Use **custom AsyncOperation** for real async work ✅

---

## Example: Below code seems ok and giving correct output still it have problem. How?  

```swift
extension ViewController {
    
    func call_Multiple_APIs_Using_OperationQueue() {
        let queue = OperationQueue()
        for i in stride(from: 3, through: 9, by: 3) {
            queue.addOperation {
                ServiceManager.shared.callAPI(id: i) { result in
                    print(result)
                }
            }
        }
    }
}

class ServiceManager {
    
    static let shared = ServiceManager()
    private init() {}
    
    func callAPI(id: Int, completion: @escaping (String)->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + Double(id)) {
            completion("Data \(id)")
        }
    }
}

Output:  

Calling API: 9
Calling API: 3
Calling API: 6
API Finishes: 3
API Finishes: 6
API Finishes: 9
```

