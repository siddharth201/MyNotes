
<details>
<summary><b>Q8. What is a Task?</b></summary>

**Interview-friendly definition**

> A Task is a unit of asynchronous work. It provides a context in which asynchronous code can execute and can also be cancelled or awaited for its result.

Apple defines Task as a unit of asynchronous work; tasks begin running after creation and can be cancelled or awaited. 


**Simple example**

```swift
import Foundation

Task {
    print("Task started")

    try? await Task.sleep(for: .seconds(2))

    print("Task finished")
}
```

**Mental model**

```text
async function
      ↓
needs execution
      ↓
     Task
      ↓
asynchronous work
```
</details>

<details>
<summary><b>Q9. Why do we need Task {}?</b></summary>

Because it gives synchronous code a way to start asynchronous work.

For example, SwiftUI:
  
```swift
Button("Load User") {
    Task {
        let user = await fetchUser()
        print(user)
    }
}
```

**Interview answer**

> `Task` is commonly used as a bridge when synchronous code needs to start asynchronous work.
</details>

<details>
<summary><b>Q10. Does creating a Task start it automatically?</b></summary>

Yes.

```swift
let task = Task {
    print("Running")
}
```

You don't call:

```swift
task.start() // ❌
```

Tasks begin executing after creation.

</details>

<details>
<summary><b>Q11. Can I get a result from a Task?</b></summary>

Yes.

```swift
let task = Task {
    return 42
}

let result = await task.value

print(result)
```

Full example:

```swift
import Foundation

let task = Task {
    try? await Task.sleep(for: .seconds(1))
    return 42
}

Task {
    let result = await task.value
    print("Result:", result)
}
```

**Mental model**

```
Task
 │
 └── produces Result
          ↓
      task.value
      
```
</details>

---

<details>
<summary><b>Q12. What is Task {} vs Task.detached?</b></summary>

In Swift concurrency, both `Task { ... }` and `Task.detached { ... }` create new concurrent asynchronous work, but they handle **actor isolation** and **context inheritance** differently.

---

### Key Difference in Plain English

* **`Task { ... }` (Inheriting Task):** Inherits the current context. If you launch it from the `@MainActor` (like a SwiftUI View or UIViewController), the code inside the block automatically runs on the `@MainActor`. It also inherits priority and task-local values.
* **`Task.detached { ... }` (Detached Task):** Completely cuts ties with the surrounding context. Even if you start it from the `@MainActor`, it runs on the background global cooperative thread pool without blocking the UI or inheriting priority.

---

### Executable Example

[Executable Example]()

### When to Use Which?

* **Use `Task { }` by default:** 95% of the time in app development. It lets you call async functions from button taps, triggers UI updates safely without context-switching headaches, and preserves cancellation hierarchies.
* **Use `Task.detached { }` sparingly:** Only when doing CPU-intensive work (e.g., resizing an image, decrypting a payload, file compression) that was triggered from the main actor and shouldn't block the UI thread or inherit its high priority.



</details>

---

<details>
<summary><b>Q13. Run Task vs Task.detached</b></summary>

```swift

import Foundation
import Dispatch

// Global helper: dynamically inspects if current execution is on the Main queue/actor
func isCurrentlyOnMainActor() -> Bool {
    // In GCD terms, MainActor work executes on DispatchQueue.main
    Thread.isMainThread // Valid in top-level non-async helper
}

@MainActor
class ViewModel {
    
    func runExample() async {
        print("1. Called from @MainActor? ->", isCurrentlyOnMainActor())
        
        // MARK: - Regular Task
        // Inherits @MainActor context
        Task {
            let onMain = isCurrentlyOnMainActor()
            print("2. Task (Regular): @MainActor? ->", onMain)
        }
        
        // MARK: - Task.detached
        // Completely non-isolated; runs on global cooperative pool
        Task.detached {
            // Computed dynamically at runtime inside the detached task
            let onMain = isCurrentlyOnMainActor()
            print("3. Task.detached: @MainActor? ->", onMain)
        }
    }
}

// Top-level script execution
let vm = await ViewModel()
await vm.runExample()

// Allow background tasks to finish before process exits
try? await Task.sleep(nanoseconds: 500_000_000)
```

### Why Does This Work Without Compiler Warnings?

Moving `isCurrentlyOnMainActor()` into a synchronous function avoids the `"Thread.isMainThread is unavailable from asynchronous contexts"` warning that Swift emits when you call it directly inside an `async` function body.

Inside `Task.detached { ... }`, calling `isCurrentlyOnMainActor()` evaluates the actual thread the task is scheduled on at that exact millisecond. It dynamically prints false because it was dispatched to the cooperative thread pool, not because of a hardcoded value.
</details>

---

