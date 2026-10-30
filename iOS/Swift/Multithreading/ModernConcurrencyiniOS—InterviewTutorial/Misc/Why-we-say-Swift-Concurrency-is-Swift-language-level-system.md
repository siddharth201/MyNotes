We call Swift Concurrency a language-level system because concurrency is built into the Swift programming language itself, rather than being something we implement entirely using external frameworks or APIs.

Let's understand this with an example.

## 1. Traditional approach: GCD

Before Swift Concurrency, we commonly used Grand Central Dispatch (GCD).

```
import Dispatch

DispatchQueue.global().async {
    print("Background work")

    DispatchQueue.main.async {
        print("Update UI")
    }
}
```

Here, we explicitly use Apple's Dispatch framework to manage queues and schedule work.

The Swift compiler doesn't understand this code as an `async` function or an actor-isolated operation. GCD provides the concurrency mechanism through its APIs.

## 2. Modern approach: Swift Concurrency

Now look at this:

```
func fetchUser() async -> String {
    return "Siddharth"
}

Task {
    let user = await fetchUser()
    print(user)
}
```

Notice these keywords:

- `async`
- `await`
- `Task`

These are part of Swift's concurrency model.

The Swift compiler understands them and can enforce rules around their usage.

For example:

```
func fetchUser() async -> String {
    return "Siddharth"
}

func loadUser() {
    let user = await fetchUser() // ❌ Compiler error
}
```

Why?

Because `fetchUser()` is asynchronous, but `loadUser()` is synchronous.

The compiler understands this distinction and enforces it.

That's one reason we call it a language-level system.

## 3. What makes it language-level?

Consider these features:

| Feature         | What Swift provides                             |
| --------------- | ----------------------------------------------- |
| `async / await` | Language syntax for asynchronous functions      |
| `Task`          | Standard Library API for asynchronous work      |
| `async let`     | Language syntax for child tasks                 |
| `TaskGroup`     | Standard Library API for structured concurrency |
| `actor`         | Language feature for state isolation            |
| `@MainActor`    | Global actor isolation                          |
| `Sendable`      | Protocol for concurrency-safe values            |
| `@Sendable`     | Attribute for concurrency-safe closures         |

Notice something important: not everything is technically a language keyword. Some are Standard Library APIs, protocols or attributes.

But they work together as an integrated concurrency model supported by the compiler and Swift runtime.

## 4. GCD vs Modern Swift Concurrency

| GCD                                            | Modern Swift Concurrency                          |
| ---------------------------------------------- | ------------------------------------------------- |
| Queue-based                                    | Task-based                                        |
| Manual queue management                        | Structured task management                        |
| Manual synchronization                         | Actor-based isolation                             |
| Completion handlers                            | Async/Await                                       |
| Runtime-oriented safety                        | Compiler-assisted data-race safety                |
| Less compile-time understanding of concurrency | Compiler understands isolation and Sendable rules |

## 5. Interview-ready answer

Question: Why do we call Swift Concurrency a language-level system?

> Because concurrency is integrated into Swift itself through language features such as async/await, actors and isolation. The compiler understands these constructs and performs compile-time checks to help prevent incorrect asynchronous calls and data races. It works together with the Swift Standard Library and runtime to manage asynchronous execution.

### Remember this acronym: C-L-R

- C — Compiler: Understands concurrency constructs and checks safety rules.
- L — Language: Provides async/await, actors and isolation features.
- R — Runtime: Manages task execution, suspension, resumption and executors.

One important distinction to remember

Swift Concurrency is not a replacement for the operating system's threads or CPU scheduling.

It provides a higher-level programming model that works with the Swift runtime and underlying execution resources.

My follow-up interview question for you:

If Swift Concurrency is a language-level system, does that mean GCD is obsolete and we should never use `DispatchQueue` anymore?
