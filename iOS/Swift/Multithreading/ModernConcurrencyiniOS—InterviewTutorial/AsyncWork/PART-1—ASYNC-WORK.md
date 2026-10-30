
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
