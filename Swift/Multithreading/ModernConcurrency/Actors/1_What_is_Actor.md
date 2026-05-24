
## “What is an actor in Swift?”


# Short Interview Answer (Best version)

You can say:

> In Swift, an **actor** is a reference type introduced for concurrency safety.
> It protects **mutable shared state** by ensuring only one task can access that state at a time.
>
> It helps prevent **data races** when multiple async tasks try to read or write the same data concurrently.
>
> It’s similar to a class because it’s a reference type, but unlike a class its mutable state is automatically isolated by Swift’s concurrency system.
>
> Accessing actor properties or methods from outside usually requires `await`, because Swift may suspend until the actor is available.

That alone is already a strong answer.

---

## If interviewer asks: “Why do we need actors?”

Then explain like this:

## Problem before actors

With classes:

```swift id="k7z5ww"
class Counter {
    var value = 0
}
```

If multiple tasks do:

```swift id="4b8h1w"
counter.value += 1
```

at the same time…

you can get race conditions.

Example:

```text id="7a9r7v"
Expected = 2
Actual   = 1
```

because both tasks may read old value before writing.

---

## Actor solves this

```swift id="j6o7mn"
actor Counter {
    var value = 0

    func increment() {
        value += 1
    }
}
```

Now Swift guarantees:

```text id="k2r6pw"
Task A accesses counter
Task B waits
Task A finishes
Task B continues
```

So only one task accesses actor-isolated state at a time.

No data race.

---

## Easy Interview Definition

A very clean one-liner:

## “Actor is Swift’s built-in solution for protecting shared mutable state in concurrent code.”

That line works very well in interviews.

---

## Difference Between Class and Actor

Very common follow-up.

You can answer:

|                                | Class |       Actor |
| ------------------------------ | ----: | ----------: |
| Reference type                 |   Yes |         Yes |
| Shared mutable state           |   Yes |         Yes |
| Thread-safe by default         |    No |         Yes |
| Prevents data race             |    No |         Yes |
| Needs `await` for cross-access |    No | Usually yes |

---

Then say:

> So actor behaves like a class, but with compiler-enforced concurrency safety.

That sounds strong in interviews.

---

## Real-world example (Very useful in interview)

Interviewers love practical examples.

Example:

### Auth token manager

Multiple API calls may happen simultaneously.

All may try refreshing token together.

Without protection:

```text id="w8k6tv"
Request A refreshes token
Request B refreshes token
Request C refreshes token
```

duplicate work + race conditions.

---

Using actor:

```swift id="f07s1u"
actor AuthManager {

    private var token: String?

    func getToken() -> String? {
        token
    }

    func updateToken(_ token: String) {
        self.token = token
    }
}
```

Now access is serialized safely.

Great real production example.

---

## Interview Bonus Point — Mention Isolation

If you want to sound stronger:

say:

> Actors provide **data isolation**.
> Their stored properties are actor-isolated, meaning external code can’t access mutable state concurrently without going through Swift’s async access rules.

That’s a very senior-level explanation.

---

## If interviewer asks “Does actor replace class?”

Good answer:

> No. Actor is not a replacement for every class.
> I use actor specifically when I have **shared mutable state accessed from multiple concurrent tasks**.
>
> For UI components, models, delegates, or immutable data, class/struct may still be better choices.

This shows judgment, which interviewers care about.

---

## My Recommended Interview Answer (Natural speaking version)

If I were in your interview, I’d say:

> Actor is a reference type introduced in Swift Concurrency to make shared mutable state safe in concurrent environments.
>
> It prevents data races by isolating its mutable state and allowing only one task to access that state at a time.
>
> It’s similar to a class, but unlike a class its state is protected by Swift automatically.
>
> I usually use actors for things like caches, token managers, or shared state accessed from multiple async tasks.

That’s concise, correct, and practical.

---

