

# 🚀 Modern Concurrency in iOS — Interview Master Sequence

## The Mental Map

First memorize this:

```text
                 MODERN CONCURRENCY
                         │
       ┌─────────────────┼─────────────────┐
       ↓                 ↓                 ↓
   ASYNC WORK        STRUCTURE         SAFETY
       │                 │                 │
 async / await      async let          Actor
 Task               TaskGroup          @MainActor
 Cancellation       child tasks        Sendable
       │                 │                 │
       └─────────────────┼─────────────────┘
                         ↓
                 REAL WORLD iOS
                         │
              API → ViewModel → SwiftUI
```

And our master acronym:

# **A-S-T-I-C**

**A** → Async/Await
**S** → Structured Concurrency
**T** → Tasks
**I** → Isolation
**C** → Sendable

If you understand these five, most of Modern Concurrency becomes connected rather than memorized.

---

# PART 1 — FOUNDATION

---

## Q1. What is concurrency?

### Interview Answer

> Concurrency means allowing multiple units of work to make progress during overlapping periods of time. The system can switch between tasks while one task is waiting, such as waiting for network I/O.

Example:

```swift
func fetchUser() async {
    print("Fetching user...")
    try? await Task.sleep(for: .seconds(2))
    print("User received")
}
```

The important point is:

```text
Waiting ≠ Blocking
```

While the task is suspended, the underlying execution resource can perform other work.

---

## Q2. Concurrency vs Parallelism?

### Remember: **C = Overlap, P = Simultaneous**

```text
Concurrency
A ────┐     ┌────
      └─────┘
B     ────┐     ┌────

Parallelism

A ───────────────
B ───────────────
```

**Concurrency** = multiple tasks making progress.

**Parallelism** = multiple tasks actually executing simultaneously on different execution resources.

Interview trap:

> Concurrency does NOT necessarily mean multiple threads.

---

# PART 2 — ASYNC/AWAIT

---

## Q3. Why was async/await introduced?

Before:

```swift
fetchUser { user in
    fetchOrders(user) { orders in
        fetchProducts(orders) { products in
            // ...
        }
    }
}
```

Callback nesting becomes difficult to read and manage.

Modern:

```swift
func loadData() async throws {
    let user = try await fetchUser()
    let orders = try await fetchOrders(user)
    let products = try await fetchProducts(orders)
}
```

### Acronym

**A-W = Async declares, Await suspends**

```text
async  → "This function may suspend"
await  → "Wait for this async operation"
```

---

## Q4. Does `await` block the thread?

**Very important.**

### No.

`await` normally means **suspension**, not thread blocking.

```swift
let data = try await api.fetch()
```

Conceptually:

```text
Task
 │
 ├── execute
 │
 ├── await
 │      ↓
 │   SUSPEND
 │      ↓
 │   thread/executor can do other work
 │
 └── resume when result available
```

### Interview one-liner

> `await` suspends the current task; it does not synchronously block the thread waiting for the result.

---

## Q5. Can `async` functions run concurrently automatically?

**No.**

This:

```swift
let user = await fetchUser()
let orders = await fetchOrders()
```

is sequential.

```text
fetchUser
    ↓
complete
    ↓
fetchOrders
```

If you want concurrent execution:

```swift
async let user = fetchUser()
async let orders = fetchOrders()

let result = await (user, orders)
```

---

# PART 3 — TASK

---

## Q6. What is a Task?

Apple describes a `Task` as a unit of asynchronous work. A task can begin executing after creation, and its result can be awaited or it can be cancelled. ([Apple Developer][2])

Example:

```swift
Task {
    let user = try await fetchUser()
    print(user)
}
```

### Mental model

```text
async function
     ↓
needs execution
     ↓
Task
     ↓
runs asynchronous work
```

---

# Q7. Why do we need Task if we already have async?

Because you cannot simply call an `async` function from synchronous code.

This won't work:

```swift
func buttonTapped() {
    let user = await fetchUser() // ❌
}
```

You need an asynchronous context:

```swift
func buttonTapped() {
    Task {
        let user = await fetchUser()
        print(user)
    }
}
```

### Interview trigger

> **Task is the bridge from synchronous code into asynchronous execution.**

---

# Q8. What happens when you create `Task {}`?

```swift
Task {
    print("Hello")
}
```

It creates an asynchronous task and starts it without you explicitly scheduling it.

Important: tasks also inherit relevant context from where they're created, including actor isolation and priority behavior. ([Apple Developer][2])

---

# Q9. `Task {}` vs `Task.detached`?

🔥 **Very common interview question.**

### `Task`

```swift
Task {
    await doSomething()
}
```

### `Task.detached`

```swift
Task.detached {
    await doSomething()
}
```

Think:

# **Task = Inherit**

# **Detached = Detach**

A regular task inherits context from its surrounding environment.

Detached task does **not** inherit the surrounding actor context, priority, or task-local values in the same way. Apple specifically warns that a `Task` created from main-actor-isolated code can remain on the main actor, while detached work opts out of that inherited context. ([Apple Developer][3])

---

## Q10. Show `Task` vs `Task.detached` in Xcode.

Try:

```swift
@MainActor
func test() {
    
    Task {
        print("Task")
        print(Thread.isMainThread)
    }
    
    Task.detached {
        print("Detached")
        print(Thread.isMainThread)
    }
}
```

But here's the **modern interview correction**:

Don't use:

```swift
Thread.isMainThread
```

as your primary explanation of Swift concurrency.

The better question is:

> **Which actor/executor is this code isolated to?**

Modern Swift concurrency is about **isolation**, not manually reasoning about thread identity.

---

# PART 4 — STRUCTURED CONCURRENCY

---

# Q11. What is structured concurrency?

### Acronym:

# **SCOPE**

> **S**ame lifetime
> **C**hild relationship
> **O**wned by parent
> **P**ropagates cancellation
> **E**xits after children

Structured concurrency means child tasks are organized within a scope and don't outlive their parent scope. Task groups and `async let` are the primary structured mechanisms. ([Apple Developer][4])

---

# Q12. What is `async let`?

Use it when you know the number of concurrent operations ahead of time.

```swift
async let user = fetchUser()
async let orders = fetchOrders()
async let recommendations = fetchRecommendations()

let result = await (
    user,
    orders,
    recommendations
)
```

Conceptually:

```text
             Parent Task
                 │
       ┌─────────┼─────────┐
       ↓         ↓         ↓
     User      Orders    Recomm.
       │         │         │
       └─────────┼─────────┘
                 ↓
              await
```

---

# Q13. Why is `async let` concurrent but normal `await` sequential?

Normal:

```swift
let a = await fetchA()
let b = await fetchB()
```

Execution:

```text
A ──────────>
             B ──────────>
```

`async let`:

```swift
async let a = fetchA()
async let b = fetchB()

await (a, b)
```

Execution:

```text
A ──────────>
B ──────────>
```

They can overlap.

---

# Q14. What is TaskGroup?

Use TaskGroup when the number of child tasks is **dynamic**.

```swift
let ids = [1, 2, 3, 4, 5]

let results = await withTaskGroup(of: String.self) { group in
    
    for id in ids {
        group.addTask {
            await fetch(id)
        }
    }
    
    var values: [String] = []
    
    for await value in group {
        values.append(value)
    }
    
    return values
}
```

Apple defines `TaskGroup` as a group containing dynamically created child tasks. ([Apple Developer][4])

### Memory trick

```text
async let
     ↓
KNOWN number

TaskGroup
     ↓
DYNAMIC number
```

---

# Q15. `async let` vs TaskGroup?

| Situation                  | Use         |
| -------------------------- | ----------- |
| 2–3 known requests         | `async let` |
| Dynamic number of requests | `TaskGroup` |
| Fixed concurrency          | `async let` |
| Loop creating children     | `TaskGroup` |

---

# Q16. Does TaskGroup wait for its children?

**Yes.**

This is an excellent interview trap.

```swift
await withTaskGroup(of: Void.self) { group in
    
    group.addTask {
        await Task.sleep(...)
    }
    
    print("Parent")
}
```

The group scope does not finish until its child tasks have completed. ([Apple Developer][4])

---

# PART 5 — CANCELLATION

---

# Q17. How does cancellation work?

Swift cancellation is **cooperative**.

### Acronym

# **C-A-R**

**C**ancel signal
**A**sk task
**R**espond yourself

```swift
Task {
    for i in 1...100 {
        
        try Task.checkCancellation()
        
        print(i)
    }
}
```

Cancellation does not magically kill your code.

---

# Q18. `Task.cancel()` means the task immediately stops?

**No.**

```swift
let task = Task {
    while true {
        try Task.checkCancellation()
        // work
    }
}

task.cancel()
```

`cancel()` sets the cancellation state.

Your task must cooperate.

Apple also notes that `cancelAll()` on a task group signals cancellation but does not automatically interrupt child execution. ([Apple Developer][4])

---

# Q19. How do you check cancellation?

Two common approaches:

```swift
try Task.checkCancellation()
```

or:

```swift
if Task.isCancelled {
    return
}
```

Difference:

```text
checkCancellation()
      ↓
throws CancellationError

isCancelled
      ↓
Boolean
```

---

# PART 6 — ACTORS

Now we reach one of the **most important interview sections**.

---

# Q20. What problem does an Actor solve?

Suppose:

```swift
final class Counter {
    var value = 0
    
    func increment() {
        value += 1
    }
}
```

Multiple concurrent tasks can modify:

```text
value
 ↑
 ├── Task A
 ├── Task B
 └── Task C
```

This creates a potential data race.

Actor:

```swift
actor Counter {
    var value = 0
    
    func increment() {
        value += 1
    }
}
```

Now access to isolated mutable state is serialized through the actor.

Apple describes actors as protecting their mutable state by serializing access; actor types themselves conform to `Sendable`. ([Apple Developer][5])

---

# Q21. How do you call an Actor?

```swift
actor Counter {
    var value = 0
    
    func increment() {
        value += 1
    }
    
    func getValue() -> Int {
        value
    }
}
```

Outside:

```swift
let counter = Counter()

Task {
    await counter.increment()
    
    let value = await counter.getValue()
    print(value)
}
```

### Why `await`?

Because you're crossing an actor isolation boundary.

---

# Q22. Does an Actor mean one dedicated thread?

**No.**

🔥 Important.

Think:

```text
Actor
  ↓
Isolation
  ↓
Serialized access
```

NOT:

```text
Actor = Thread
```

Actors use executors; default actors execute through Swift's concurrency runtime/global pool rather than each having a dedicated thread. ([Apple Developer][5])

---

# Q23. Actor vs Lock?

Traditional:

```swift
lock.lock()

value += 1

lock.unlock()
```

Modern:

```swift
actor Counter {
    var value = 0
}
```

### Mental model

```text
Lock
→ "I manually protect this state."

Actor
→ "Swift isolates this state."
```

---

# Q24. What is Actor Isolation?

Consider:

```swift
actor BankAccount {
    private var balance = 1000
    
    func deposit(_ amount: Int) {
        balance += amount
    }
}
```

`balance` belongs to the actor's isolated state.

You cannot freely do:

```swift
account.balance // ❌
```

from outside.

You must interact through actor-isolated methods:

```swift
await account.deposit(100)
```

---

# PART 7 — MAIN ACTOR

---

# Q25. What is `@MainActor`?

`@MainActor` isolates code to the main actor.

Example:

```swift
@MainActor
final class UserViewModel {
    var username = ""
    
    func updateUsername(_ name: String) {
        username = name
    }
}
```

Now UI-related mutable state is protected by the Main Actor.

Apple describes `MainActor` as a global actor whose executor corresponds to the main dispatch queue. ([Apple Developer][6])

---

# Q26. Why do we use `@MainActor` in SwiftUI?

Because UI state should be accessed on the main actor.

```swift
@MainActor
final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func loadUsers() async {
        users = await api.fetchUsers()
    }
}
```

Mental model:

```text
Network
   ↓
async work
   ↓
result
   ↓
@MainActor
   ↓
UI state
```

---

# Q27. Does `@MainActor` mean the entire operation runs on the main thread?

🔥 **Very important.**

Not necessarily in the way beginners often think.

Consider:

```swift
@MainActor
func load() async {
    let data = await api.fetch()
    users = data
}
```

The async network operation can suspend.

The main actor isn't simply "blocked waiting for network."

Think:

```text
MainActor
   │
   ├── start
   │
   ├── await network
   │      ↓
   │   suspend
   │
   ├── other main actor work
   │
   └── resume → update UI
```

---

# Q28. What is `nonisolated`?

Suppose:

```swift
@MainActor
final class ViewModel {
    
    var name = "Siddharth"
    
    nonisolated func version() -> String {
        "1.0"
    }
}
```

`version()` doesn't require Main Actor isolation.

Mental model:

```text
@MainActor
    ↓
isolated

nonisolated
    ↓
outside actor isolation
```

---

# PART 8 — SENDABLE

---

# Q29. What is `Sendable`?

This is one of the **highest-priority interview concepts**.

Definition:

> `Sendable` identifies types whose values can safely cross concurrency/isolation boundaries without introducing a data race. ([Swift Documentation][7])

Example:

```swift
struct User: Sendable {
    let id: Int
    let name: String
}
```

Safe because the stored properties are value types.

---

# Q30. Why is `class` more problematic than `struct`?

Struct:

```swift
struct User {
    var name: String
}
```

Value semantics.

Class:

```swift
final class User {
    var name: String
}
```

Reference semantics.

```text
Task A ──┐
         ↓
       Object
         ↑
Task B ──┘
```

Both can access the same mutable object.

That's where data races can occur.

---

# Q31. What is `@Sendable`?

`Sendable`:

```swift
struct User: Sendable { }
```

is about a **type**.

`@Sendable`:

```swift
let closure: @Sendable () -> Void = {
    print("Hello")
}
```

is about a **closure**.

### Memory trick

```text
Sendable
   ↓
TYPE

@Sendable
   ↓
CLOSURE
```

Apple explicitly includes closures as values that can be made Sendable using `@Sendable`. ([Swift Documentation][7])

---

# Q32. What is `@unchecked Sendable`?

Example:

```swift
final class Cache: @unchecked Sendable {
    // manually synchronized
}
```

You're effectively telling the compiler:

> "I guarantee this type is safe."

The compiler stops enforcing the normal Sendable correctness checks for that conformance.

Therefore:

# **Never use `@unchecked Sendable` just to silence an error.**

Apple documents it as disabling compile-time checking after you manually establish the semantic safety. ([Apple Developer][8])

---

# PART 9 — ACTOR REENTRANCY

🔥 **Very high-value interview topic.**

---

# Q33. What is Actor Reentrancy?

Consider:

```swift
actor BankAccount {
    var balance = 100
    
    func withdraw() async {
        if balance >= 100 {
            await someAsyncOperation()
            balance -= 100
        }
    }
}
```

You might think:

```text
withdraw()
   ↓
balance check
   ↓
await
   ↓
nothing else touches balance
```

But that's wrong.

At:

```swift
await someAsyncOperation()
```

the actor can become available to other work.

Another call can execute.

### Mental model

# **Actor protects synchronous sections, not your entire async function transaction.**

---

# Q34. Why is Actor Reentrancy dangerous?

Because state can change across an `await`.

```text
Actor
 │
 │ balance = 100
 ↓
check balance
 │
await ───────────→ actor available
 │
 │                another task
 │                changes balance
 │
resume
 ↓
balance is now different
```

### Interview phrase

> Never assume actor-isolated state has the same value after an `await`.

🔥 Memorize this.

---

# PART 10 — CONTINUATIONS

---

# Q35. What is a Continuation?

Suppose old API:

```swift
func fetchUser(completion: @escaping (User) -> Void)
```

You want:

```swift
let user = await fetchUser()
```

Continuation bridges callback-based APIs to async/await.

```swift
func fetchUser() async -> User {
    await withCheckedContinuation { continuation in
        
        legacyFetchUser { user in
            continuation.resume(returning: user)
        }
    }
}
```

---

# Q36. `withCheckedContinuation` vs `withCheckedThrowingContinuation`?

### Non-throwing:

```swift
withCheckedContinuation
```

### Throwing:

```swift
withCheckedThrowingContinuation
```

Example:

```swift
func fetchUser() async throws -> User {
    
    try await withCheckedThrowingContinuation { continuation in
        
        legacyFetchUser { result in
            
            switch result {
            case .success(let user):
                continuation.resume(returning: user)
                
            case .failure(let error):
                continuation.resume(throwing: error)
            }
        }
    }
}
```

---

# Q37. What is the biggest continuation mistake?

🔥 Interview trap:

Calling:

```swift
continuation.resume(...)
```

**more than once.**

A continuation must be resumed exactly once.

Think:

```text
Continuation
      ↓
WAITING
      ↓
RESUME
      ↓
FINISHED
```

Not:

```text
resume
resume ❌
resume ❌
```

---

# PART 11 — ASYNCSEQUENCE

---

# Q38. What is AsyncSequence?

Normal:

```swift
for item in array {
    print(item)
}
```

Async:

```swift
for await item in stream {
    print(item)
}
```

It represents a sequence whose elements become available asynchronously.

---

# Q39. What is AsyncStream?

Useful when values arrive over time.

Example:

```swift
let stream = AsyncStream<Int> { continuation in
    
    continuation.yield(1)
    continuation.yield(2)
    continuation.yield(3)
    
    continuation.finish()
}

Task {
    for await value in stream {
        print(value)
    }
}
```

Mental model:

```text
Producer
   ↓
yield
   ↓
AsyncStream
   ↓
for await
   ↓
Consumer
```

Very useful for:

* callbacks
* delegates
* notifications
* event streams
* location updates
* WebSocket-like events

---

# PART 12 — REAL INTERVIEW CODE

Now we combine everything.

---

# Q40. How would you build a modern API call in SwiftUI?

### ViewModel

```swift
@MainActor
final class UserViewModel: ObservableObject {
    
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading = false
    
    private let service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func loadUsers() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            users = try await service.fetchUsers()
        } catch {
            print(error)
        }
    }
}
```

SwiftUI:

```swift
struct UserView: View {
    
    @StateObject private var viewModel: UserViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}
```

### Interview architecture

```text
SwiftUI
   ↓
.task
   ↓
@MainActor ViewModel
   ↓
async/await
   ↓
Service
   ↓
URLSession
```

---

# Q41. Why prefer `.task` in SwiftUI instead of manually creating `Task` in `onAppear`?

Compare:

```swift
.onAppear {
    Task {
        await viewModel.load()
    }
}
```

with:

```swift
.task {
    await viewModel.load()
}
```

`.task` is designed for asynchronous work associated with the lifetime of the view and integrates cancellation when the task's view-associated lifetime ends.

For interview:

> Use `.task` when the async work is naturally tied to the SwiftUI view lifecycle.

---

# Q42. How would you perform three API requests concurrently?

```swift
func loadDashboard() async throws {
    
    async let profile = fetchProfile()
    async let orders = fetchOrders()
    async let recommendations = fetchRecommendations()
    
    let result = try await (
        profile,
        orders,
        recommendations
    )
    
    print(result)
}
```

### Interview explanation

> Because these requests are independent, `async let` allows them to execute concurrently instead of waiting for each request sequentially.

---

# Q43. How would you fetch N images concurrently?

Use TaskGroup.

```swift
func downloadImages(
    urls: [URL]
) async -> [Data] {
    
    await withTaskGroup(of: Data?.self) { group in
        
        for url in urls {
            group.addTask {
                try? await URLSession.shared.data(
                    from: url
                ).0
            }
        }
        
        var result: [Data] = []
        
        for await data in group {
            if let data {
                result.append(data)
            }
        }
        
        return result
    }
}
```

### Interview trigger

> "The number of requests comes from an array."

Think:

# **TaskGroup**

---

# Q44. How would you make a thread-safe cache?

Modern answer:

```swift
actor ImageCache {
    
    private var storage: [URL: Data] = [:]
    
    func value(for url: URL) -> Data? {
        storage[url]
    }
    
    func insert(_ data: Data, for url: URL) {
        storage[url] = data
    }
}
```

Usage:

```swift
let cache = ImageCache()

Task {
    if let data = await cache.value(for: url) {
        print(data)
    }
}
```

This maps directly to your production architecture work:

```text
Service
   ↓
Cache Actor
   ↓
Memory / Disk
```

---

# PART 13 — INTERVIEW TRAPS

These are the questions I'd **absolutely memorize** before the interview.

---

## Q45. Is `async` the same as background thread?

**No.**

```text
async
=
function can suspend

NOT

async
=
background thread
```

---

## Q46. Is `await` blocking?

**No.**

```text
await
→ suspension

blocking
→ thread cannot do other work
```

---

## Q47. Is Actor = thread?

**No.**

```text
Actor
→ isolation + serialized access
```

Not:

```text
Actor → dedicated thread
```

---

## Q48. Does `Task.cancel()` kill a task?

**No.**

Cancellation is cooperative.

---

## Q49. Does `Task {}` always run in background?

**No.**

It can inherit the surrounding actor/context. Apple specifically highlights this with SwiftUI/MainActor code. ([Apple Developer][3])

---

## Q50. Does `Task.detached` automatically make everything safe?

**No.**

It removes inherited context, which means you must be more careful about isolation and Sendable boundaries.

---

## Q51. Why do I need `Sendable`?

Because values crossing concurrency/isolation boundaries must be safe to share.

```text
Concurrency boundary
       ↓
     Sendable
       ↓
Data-race safety
```

Swift 6's concurrency checking makes this especially important. ([Swift Documentation][7])

---

## Q52. Why does compiler complain about my class crossing a concurrency boundary?

Usually because:

```text
class
 ↓
reference semantics
 ↓
shared mutable state
 ↓
potential data race
```

Possible solutions depend on the design:

```text
Make it:
├── Sendable
├── @MainActor isolated
├── actor
├── immutable
└── properly synchronized
```

Don't blindly add:

```swift
@unchecked Sendable
```

---

# PART 14 — SWIFT 6 INTERVIEW QUESTIONS

---

# Q53. What changed with Swift 6 concurrency?

The biggest interview-level answer:

> Swift 6 strengthens compile-time data-race safety. The compiler checks isolation boundaries and Sendable requirements much more strictly when using Swift 6 language mode. ([Apple Developer][9])

Think:

```text
Swift 5
   ↓
Concurrency warnings/checking

Swift 6
   ↓
Stronger compile-time data-race safety
```

---

# Q54. Why am I suddenly getting "sending..." or "task-isolated value..." errors?

Because Swift's concurrency checker is detecting a value crossing an isolation boundary where it cannot prove the value is safe.

The correct response isn't:

> "How do I silence the compiler?"

Instead:

> "What isolation boundary did I cross, and is the value Sendable?"

This mindset is **very important for Swift 6 interviews**.

---

# Q55. What is Swift 6.2's "Approachable Concurrency"?

Current Swift 6.2 introduced changes aimed at making concurrency easier to adopt, including default isolation options and explicit opt-in for concurrent execution with `@concurrent`. ([Swift.org][1])

For your interview, know the direction:

```text
Old mental model:
"async means probably background"

Modern mental model:
"Isolation is explicit,
 concurrency is explicit."
```

Swift 6.2's model increasingly emphasizes that code can remain isolated/serialized unless concurrency is explicitly introduced. ([Swift.org][1])

You don't need to spend your remaining preparation time memorizing every Swift 6.2 feature.

---

# 🧠 FINAL 2-DAY REVISION MAP

If you have limited time, prioritize these **in this exact order**:

### 🔴 Tier 1 — MUST KNOW

```text
1. async / await
2. suspension vs blocking
3. Task
4. Task {}
5. Task.detached
6. Structured concurrency
7. async let
8. TaskGroup
9. cancellation
10. Actor
11. Actor isolation
12. @MainActor
13. Sendable
14. @Sendable
15. Actor reentrancy
16. Swift 6 data-race safety
```

### 🟠 Tier 2 — VERY IMPORTANT

```text
17. nonisolated
18. Continuations
19. CheckedContinuation
20. AsyncSequence
21. AsyncStream
22. Task priority
23. cancellation propagation
24. MainActor + SwiftUI
25. .task
26. actor vs lock
```

### 🟢 Tier 3 — If time permits

```text
27. @unchecked Sendable
28. Global actors
29. isolated
30. sending
31. Swift 6.2 approachable concurrency
32. @concurrent
33. custom actors/executors
```

---

# 🎯 The 10 Code Exercises I Want You to Actually Run

Don't just read these. **Open Xcode and type them.**

### Exercise 1

```swift
async + await
```

### Exercise 2

```swift
Task { }
```

### Exercise 3

```swift
Task { } vs Task.detached
```

### Exercise 4

```swift
async let
```

Three API calls concurrently.

### Exercise 5

```swift
TaskGroup
```

Dynamic array of API calls.

### Exercise 6

```swift
Task cancellation
```

Start → cancel → `checkCancellation()`.

### Exercise 7

```swift
actor Counter
```

Run 1,000 concurrent increments.

### Exercise 8

```swift
@MainActor ViewModel
```

API → ViewModel → SwiftUI.

### Exercise 9

```swift
Sendable
```

Intentionally create a Swift 6 compiler error and fix it.

### Exercise 10

```swift
Actor reentrancy
```

Create an example where state changes across `await`.

**If you can write these 10 without looking at notes, you'll be in a much stronger position for the "okay, show me in Xcode" part of the interview.**

One important thing: **don't memorize 55 isolated answers.** Memorize the progression:

> **async → Task → structured concurrency → cancellation → Actor → MainActor → Sendable → reentrancy → Swift 6 safety**

That is the spine of the whole topic.

[1]: https://www.swift.org/blog/swift-6.2-released/?utm_source=chatgpt.com "Swift 6.2 Released | Swift.org"
[2]: https://developer.apple.com/documentation/Swift/Task?changes=latest_major%2Clatest_major&language=objc_5%2Cobjc_5&utm_source=chatgpt.com "Task | Apple Developer Documentation"
[3]: https://developer.apple.com/documentation/xcode/improving-app-responsiveness?changes=_8&language=objc&utm_source=chatgpt.com "Improving app responsiveness | Apple Developer Documentation"
[4]: https://developer.apple.com/documentation/swift/taskgroup?utm_source=chatgpt.com "TaskGroup | Apple Developer Documentation"
[5]: https://developer.apple.com/documentation/Swift/Actor?changes=latest_major&utm_source=chatgpt.com "Actor | Apple Developer Documentation"
[6]: https://developer.apple.com/documentation/Swift/MainActor?changes=lat_5&utm_source=chatgpt.com "MainActor | Apple Developer Documentation"
[7]: https://docs.swift.org/latest/documentation/swift/sendable/?utm_source=chatgpt.com "Sendable | Documentation"
[8]: https://developer.apple.com/documentation/swift/sendable?changes=latest_ma___3_8_9&language=objc&utm_source=chatgpt.com "Sendable | Apple Developer Documentation"
[9]: https://developer.apple.com/videos/play/wwdc2024/10184/?utm_source=chatgpt.com "A Swift Tour: Explore Swift’s features and design - WWDC24 - Videos - Apple Developer"

