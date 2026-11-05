
### PART 3 — STRUCTURED CONCURRENCY

Now we move from:

> "How do I run async work?"

to:

>"How do I organize multiple pieces of async work?"

---

<details>
<summary><b>Q14. What is Structured Concurrency?</b></summary>

**Interview-friendly definition**

> Structured concurrency organizes asynchronous tasks into a hierarchy so that child tasks are tied to the lifetime of their parent and are completed before the structured scope finishes.

Apple describes `async let` and `task groups` as structured concurrency mechanisms; child tasks don't outlive their parent scope

**Acronym**

### L-C-C

**L**ifetime  
**C**hild relationship  
**C**ancellation

Think:

```text
Parent Task
    │
    ├── Child
    ├── Child
    └── Child
```

The children belong to the parent.


</details>

---  

<details>
<summary><b>Q15. What is async let?</b></summary>

[Chat-GPT Link](https://chatgpt.com/s/t_6aec0d2efe748191b6f548f0ed6b99c9)

**Interview definition**

> async let creates a child task for a known piece of asynchronous work so multiple independent operations can execute concurrently.

Example:

```swift
func fetchUser() async -> String {
    try? await Task.sleep(for: .seconds(2))
    return "User"
}

func fetchOrders() async -> String {
    try? await Task.sleep(for: .seconds(2))
    return "Orders"
}
```

Now:

```swift
Task {
    let start = Date()

    async let user = fetchUser()
    async let orders = fetchOrders()

    let result = await (user, orders)

    print(result)
    print("Time:", Date().timeIntervalSince(start))
}
```

Approximately:

```text
fetchUser   ────────── 2 sec
fetchOrders ────────── 2 sec

Total ≈ 2 sec
```

rather than:

```text
User    ────────── 2 sec
Orders             ────────── 2 sec

Total ≈ 4 sec
```

**Remember**

async let = KNOWN number of concurrent operations
</details>


