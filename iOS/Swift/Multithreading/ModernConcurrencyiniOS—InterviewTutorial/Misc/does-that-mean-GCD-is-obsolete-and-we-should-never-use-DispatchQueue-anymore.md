
No. GCD is not obsolete. Swift Concurrency is the modern, recommended approach for most asynchronous application code, but GCD is still useful and widely used.

The important thing is understanding that Swift Concurrency and GCD solve related problems at different abstraction levels.

## 1. What is the difference?

Think of it this way:

- GCD: You manage queues and submit work to them.
- Swift Concurrency: You describe asynchronous work using tasks, async/await and isolation. Swift manages much of the execution complexity.

### GCD example

```
DispatchQueue.global().async {

    print("Background work")

    DispatchQueue.main.async {
        print("Update UI")
    }
}
```

Here, we explicitly specify:

- Which queue should execute the work.
- Which queue should execute the UI update.

### Swift Concurrency example

```
func fetchUser() async -> String {
    return "Siddharth"
}

Task {
    let user = await fetchUser()
    print(user)
}
```

We describe the asynchronous operation without manually managing dispatch queues.

## 2. When should we use Swift Concurrency vs GCD?

| Scenario                                              | Recommended approach      |
| ----------------------------------------------------- | ------------------------- |
| Network requests                                      | Swift Concurrency         |
| Multiple concurrent API calls                         | `async let` / `TaskGroup` |
| UI updates                                            | `@MainActor`              |
| Thread-safe shared state                              | Actors                    |
| Legacy completion-handler APIs                        | GCD or Continuations      |
| Existing GCD-based architecture                       | GCD where appropriate     |
| Queue-specific operations                             | GCD                       |
| Dispatch sources and low-level dispatch functionality | GCD                       |

## 3. Can Swift Concurrency and GCD work together?

Absolutely!

For example:

```
func fetchData() async throws -> Data {

    let url = URL(string: "https://example.com")!

    let (data, _) = try await URLSession.shared.data(from: url)

    return data
}
```

You can call this from existing GCD-based code:

```
DispatchQueue.global().async {

    Task {
        do {
            let data = try await fetchData()
            print(data)
        } catch {
            print(error)
        }
    }
}
```

However, avoid introducing unnecessary GCD-to-Task transitions. Prefer a consistent concurrency model where possible.

## 4. An important interview distinction

Don't say:

> Swift Concurrency always runs work in the background, whereas GCD runs work on queues.

That's inaccurate.

Both systems ultimately rely on underlying execution resources, and Swift Concurrency does not promise that every async function executes on a background thread.

For example:

```
@MainActor
func updateUI() {
    print("Updating UI")
}
```

This is isolated to the Main Actor.

Similarly, GCD provides explicit queue-based execution:

```
DispatchQueue.main.async {
    print("Updating UI")
}
```

They offer different abstractions for managing execution and isolation.

## 5. Interview-ready answer

Question: Is GCD obsolete after the introduction of Swift Concurrency?

No. GCD is not obsolete. Swift Concurrency provides a higher-level, compiler-supported model for asynchronous programming, structured tasks and data-race safety.

GCD is still useful for legacy code and lower-level dispatch operations. We should prefer Swift Concurrency for new asynchronous application code where it fits, while continuing to use GCD when its specific capabilities are needed.

### Remember: GCD vs Swift Concurrency

- GCD → Queue-based execution.
- Swift Concurrency → Task-based asynchronous programming and isolation.
- Both → Can coexist.


