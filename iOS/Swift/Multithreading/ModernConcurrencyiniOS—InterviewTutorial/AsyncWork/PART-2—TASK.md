
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

<details>
<summary><b>Q12. What is Task {} vs Task.detached?</b></summary>

**Must know**

Remember:

#### Task = INHERIT

#### Detached = DETACH

**Task**

```swift
Task {
    // inherits relevant context
}
```

**Detached**

```swift
Task.detached {
    // does not inherit the surrounding actor/context
}
```

A regular task inherits context from where it is created. A detached task is intentionally independent.

**Interview definition**

> `Task {}` creates an unstructured task that inherits relevant context from its creation site, while `Task.detached` creates a task that does not inherit that context and therefore requires more explicit handling of isolation and Sendable values.
</details>

<details>
<summary><b>Q13. Run Task vs Task.detached</b></summary>

Create:

```swift
import SwiftUI

@MainActor
struct ContentView: View {

    var body: some View {
        Button("Run Tasks") {
            Task {
                print("Regular Task")
                print("MainActor:", MainActor.assumeIsolated { true })
            }

            Task.detached {
                print("Detached Task")
            }
        }
    }
}
```

For interview purposes, don't use Thread.isMainThread as your primary explanation.

The important modern concept is:

```text
Which isolation context does this task inherit?
```

not:

```text
Which thread number is it running on?
```

Actors execute through executors; default actors use Swift's concurrency runtime rather than each actor owning a dedicated thread.
</details>

