
<details>
<summary><b>Q1. What is Modern Concurrency in Swift?</b></summary>

**Interview-friendly definition**

> Modern Swift Concurrency is Swift's language-level system for writing asynchronous and concurrent code using async/await, Tasks, structured concurrency, actors, and Sendable to make asynchronous code easier to write and safer from data races.


**Remember**

### A-S-S

**A**sync work  
**S**tructure  
**S**afety  

```text
Async/Await
     ↓
Task
     ↓
Structured Concurrency
     ↓
Actors + Isolation
     ↓
Sendable
```  

**Follow-Ups**  

[**Q. Why we say Swift Concurrency is Swift's language-level system?**](https://github.com/siddharth201/MyNotes/blob/main/iOS/Swift/Multithreading/ModernConcurrencyiniOS%E2%80%94InterviewTutorial/Misc/Why-we-say-Swift-Concurrency-is-Swift-language-level-system.md)  

[**Q. If Swift Concurrency is a language-level system, does that mean GCD is obsolete and we should never use `DispatchQueue` anymore?**](https://github.com/siddharth201/MyNotes/blob/main/iOS/Swift/Multithreading/ModernConcurrencyiniOS%E2%80%94InterviewTutorial/Misc/does-that-mean-GCD-is-obsolete-and-we-should-never-use-DispatchQueue-anymore.md)  

[**Q. Does Swift create a new thread for every Task?**](https://github.com/siddharth201/MyNotes/blob/main/iOS/Swift/Multithreading/ModernConcurrencyiniOS%E2%80%94InterviewTutorial/Misc/Does-Swift-create-a-new-thread-fo-every-Task.md)
</details>


<details>
<summary><b>Q2. What problem did async/await solve?</b></summary>

Before:

```swift
fetchUser { user in
    fetchOrders(user) { orders in
        fetchProducts(orders) { products in
            print(products)
        }
    }
}
```

This is callback-based asynchronous programming.

With async/await:

```swift
func loadData() async throws {
    let user = try await fetchUser()
    let orders = try await fetchOrders(user)
    let products = try await fetchProducts(orders)

    print(products)
}
```

**Interview definition**

> async/await lets us write asynchronous code in a sequential-looking style, making control flow and error handling easier to understand
</details>

<details>
<summary><b>Q3. What does async mean?</b></summary>
  
**Simple definition**

> `async` means a function can suspend while performing asynchronous work and later resume.

Example:

```swift
func fetchUser() async -> String {
    return "Siddharth"
}
```

Call:

```swift
Task {
    let user = await fetchUser()
    print(user)
}
```

**Important**
`async` does not mean:

> "Run this on a background thread."

That's a common interview mistake.

</details>

<details>
<summary><b>Q4. What does await mean?</b></summary>

**Interview definition**
> `await` marks a point where the current task may suspend until an asynchronous operation produces its result.

Example:

```swift
func fetchUser() async -> String {
    try? await Task.sleep(for: .seconds(2))
    return "Siddharth"
}

Task {
    print("1")

    let user = await fetchUser()

    print("2 \(user)")
}
```

Expected:

```text
1
        ← task suspends
        ← approximately 2 seconds
2 Siddharth
```

**Mental model**

#### `await = suspend, not block`

Swift's concurrency model allows an asynchronous function to give up its execution resource while waiting and resume later; Swift doesn't guarantee that it resumes on the same thread. 
</details>

<details>
<summary><b>Q5. Does await block the thread?</b></summary>

**Answer  
No.**

This is one of the first things I would expect you to answer confidently.

```text

BLOCKING

Thread
│
├──── waiting ──────────┤
│                       │
cannot do other work


SUSPENDING

Task
│
├── running
│
├── await
│
│   suspended
│
└── resume
```

**Interview answer**
> await suspends the task, not the thread. While the task is suspended, the execution resource can be used for other work.
</details>

<details>
<summary><b>Q6. Concurrency vs Parallelism?</b></summary>

**Interview definition**

> Concurrency means multiple tasks can make progress during overlapping periods. Parallelism means multiple pieces of work actually execute simultaneously.

Think:

```text

CONCURRENCY

Task A ─────┐       ┌────
            └───────┘
Task B      ────────┐    ┌──
                    └────┘


PARALLELISM

CPU 1:  A ───────────────

CPU 2:  B ───────────────
```

**Interview trap**
Don't say:

> "Concurrency means multiple threads."

Modern Swift concurrency is intentionally abstracted above threads.
</details>

<details>
<summary><b>Q7. Can I call an async function directly from a normal function?</b></summary>

Suppose:
func fetchUser() async -> String {
    "Siddharth"
}

This won't work:
func buttonTapped() {
    let user = await fetchUser() // ❌
}

Why?

Because buttonTapped() isn't asynchronous.

You can do:

func buttonTapped() {
    Task {
        let user = await fetchUser()
        print(user)
    }
}

This leads us to our next concept.

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>

<details>
<summary><b>Explanation</b></summary>

</details>
