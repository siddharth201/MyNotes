

## `Task` vs `Task.detached`

Both create new asynchronous work.

Both run concurrently.

But:

|                             | `Task {}` | `Task.detached {}` |
| --------------------------- | --------: | -----------------: |
| Runs independently?         |       Yes |                Yes |
| Inherits actor context?     |       Yes |                 No |
| Inherits priority?          |       Yes |                 No |
| Inherits task-local values? |       Yes |                 No |
| Linked to current context?  |       Yes |                 No |
| Use most of the time?       |     ✅ Yes |             Rarely |

The biggest mental model:

## `Task {}` = “continue from where I am”

## `Task.detached {}` = “start fresh somewhere else”

---

## Imagine Real Life Example

Suppose you're working in an office.

You ask another employee to help.

---

## `Task {}`

You tell your teammate:

> “Can you handle this for me?”

They:

* know your project
* know your priority
* know your context
* work as part of your team

---

## `Task.detached {}`

You hire an outside freelancer.

They:

* know nothing about your project
* don’t know your priority
* don’t know your context
* work completely independently

---

That is exactly the difference.

---

## Example 1 — Normal Task

```swift
@MainActor
func loadData() {

    Task {
        print(Thread.isMainThread)
    }
}
```

Output:

```text
true
```

Why?

Because:

```swift
Task {}
```

inherits current actor context.

Since `loadData()` runs on `MainActor`,
the task also runs on `MainActor`.

So it can safely update UI.

---

### Swift thinks:

> “You created me from MainActor,
> so I’ll continue there.”

---

## Example 2 — Detached Task

```swift
@MainActor
func loadData() {

    Task.detached {
        print(Thread.isMainThread)
    }
}
```

Output:

```text
false
```

Why?

Because detached task ignores MainActor.

It starts completely fresh.

No inherited actor.

---

Swift thinks:

> “I don’t care where you created me from.”

---

## Why Does This Matter?

Because UI must run on MainActor.

Example:

```swift
@MainActor
class ViewModel: ObservableObject {

    @Published var name = ""

    func fetch() {

        Task {
            name = "Siddharth"
        }
    }
}
```

This is safe.

---

Now:

```swift
Task.detached {
    name = "Siddharth"
}
```

This is unsafe.

Because detached task is not on MainActor.

---

## Cancellation Difference

Very important.

---

### Task

```swift
let task = Task {
    await fetchData()
}
```

If parent is cancelled,
this task can receive cancellation information.

---

### Detached Task

```swift
Task.detached {
    await fetchData()
}
```

This continues even if parent disappears.

Detached task does not care.

---

Example:

User leaves screen.

Normal task may stop.

Detached task may continue running in background.

---

## Priority Difference

Example:

```swift
Task(priority: .high) {

}
```

Child `Task {}` inherits `.high`

---

But:

```swift
Task.detached {

}
```

does NOT inherit it.

Priority resets unless explicitly set.

---

## Why `Task.detached` Is Rarely Needed

Because most of the time you WANT inheritance:

* current actor
* priority
* cancellation
* task local values

So:

```swift
Task {}
```

is usually correct.

---

## When To Use `Task.detached`

Only when work should be completely independent.

Good examples:

---

### 1. Background Cleanup

```swift
Task.detached {
    await cacheCleaner.deleteExpiredFiles()
}
```

Even if screen closes:

cleanup should continue.

Perfect use.

---

### 2. Analytics Logging

```swift
Task.detached {
    await analytics.sendEvent("ButtonTapped")
}
```

User doesn't need to wait.

Can run independently.

---

### 3. Fire-and-forget background work

Example:

* delete temp files
* compress logs
* upload crash report

---

## When NOT To Use It

Avoid for:

### UI updates

```swift
label.text = "Done"
```

---

### ViewModel updates

```swift
@Published var data
```

---

### work tied to screen lifecycle

like:

```swift
fetch user profile
load table data
refresh screen
```

These should usually be `Task {}`

---

## Simple Rule To Remember

If you’re unsure:

Use:

```swift
Task { }
```

If you have a very strong reason to break away from current context:

Use:

```swift
Task.detached { }
```

---

## My Practical Rule in iOS apps

Most of the time:

```swift
Task { }
```

inside:

* `viewDidLoad`
* button tap
* SwiftUI `.task`
* ViewModel methods

---

Very rarely:

```swift
Task.detached { }
```

for:

* cache cleanup
* analytics
* deleting temp files
* logging

---

## One-Line Summary

## `Task`

> “Start async work, but stay connected to my current world.”

### `Task.detached`

> “Start async work, but disconnect completely from my current world.”

---


