

Now we move into the Safety branch.

This is arguably the most important part for your interview.


<details>
<summary><b>Q24. What problem do Actors solve?</b></summary>

Imagine:

```swift
final class Counter {

    var value = 0

    func increment() {
        value += 1
    }
}
```

And:

```swift
Task {
    counter.increment()
}

Task {
    counter.increment()
}

Task {
    counter.increment()
}
```

Multiple concurrent accesses can race on shared mutable state.

Swift's actor model protects mutable state through isolation and serialized access.
</details>

---

<details>
<summary><b>Q25. What is an Actor?</b></summary>

**Interview-friendly definition**

> An actor is a reference type that protects its mutable state by isolating access to it, allowing only one piece of actor-isolated code to execute at a time.

**Example:**

```swift
actor Counter {

    private var value = 0

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        value
    }
}
```

Usage:

```swift
let counter = Counter()

Task {
    await counter.increment()
    await counter.increment()

    let value = await counter.getValue()

    print(value)
}
```

Output:

```swift
2
```
</details>

---

<details>
<summary><b>Q26. Why do we need `await` when calling an Actor?</b></summary>

Because you're crossing an isolation boundary.

```swift
await counter.increment()
```

Think:

```swift
Outside
   │
   │ await
   ↓
Actor Isolation Boundary
   │
   ↓
Actor State
```
</details>

---

<details>
<summary><b>Explanation</b></summary>

</details>

---

<details>
<summary><b>Explanation</b></summary>

</details>

---

<details>
<summary><b>Explanation</b></summary>

</details>

---
