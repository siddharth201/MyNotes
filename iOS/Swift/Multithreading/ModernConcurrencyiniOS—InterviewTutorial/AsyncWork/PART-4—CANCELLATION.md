

<details>
<summary><b>Q1. How does Task cancellation work?</b></summary>

**Interview definition**

> Swift task cancellation is cooperative. Calling cancel() marks a task as cancelled, but the task must check its cancellation state and stop appropriately.

**Acronym**

### S-C-R

**S**ignal
**C**heck
**R**espond
</details>

---

<details>
<summary><b>Q2. Run this cancellation example</b></summary>

```swift

import Foundation

let task = Task {
    
    for i in 1...10 {
        
        try Task.checkCancellation()
        
        print("Working: \(i)")
        
        try await Task.sleep(for: .seconds(1))
    }
    
    return "Completed"
}

Task {
    
    do {
        
        try await Task.sleep(for: .seconds(3))
        
        print("Cancelling...")
        
        task.cancel()
        
        let result = try await task.value
        
        print(result)
    } catch {
        print("Task failed or was cancelled: \(error)")
    }
}
```

Expected roughly:

```swift
Working: 1
Working: 2
Working: 3
Cancelling...
```

Then cancellation stops the task because `Task.checkCancellation()` throws.

</details>

---

<details>
<summary><b>Q22. What is the difference between `Task.isCancelled` and `Task.checkCancellation()`?</b></summary>

**isCancelled**

```swift
if Task.isCancelled {
    return
}
```

Returns a Boolean.

**checkCancellation()**

try Task.checkCancellation()

Throws CancellationError when cancelled.
Remember
isCancelled
     ↓
Boolean

checkCancellation()
     ↓
throws
</details>


