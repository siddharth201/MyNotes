
**Actor isolation** is Swift’s compile-time guarantee that mutable data inside an actor can only ever be accessed or modified by **one thread at a time**, preventing data races.

---

### The Problem: Shared Mutable State (Data Race)

Without actors, if two threads touch the same object simultaneously, your app risks memory corruption or crashes.

```swift
class BankAccount {
    var balance = 100

    func withdraw(amount: Int) {
        if balance >= amount {
            // Context switch here causes both threads to pass the check
            balance -= amount
        }
    }
}

```

If two threads call `withdraw(amount: 100)` at the exact same millisecond, both might read `balance` as 100, both approve the withdrawal, and the balance ends up as `-100`.

---

### The Solution: Actor Isolation

An `actor` protects its internal state behind an **isolation boundary**.

* **Inside the boundary:** The actor’s own methods and properties can access its state synchronously and freely.
* **Outside the boundary:** Any external code attempting to read or write actor properties must use `await`. The call suspends and waits in line until the actor is free.

```swift
actor SafeBankAccount {
    private(set) var balance: Int = 100

    func withdraw(amount: Int) -> Bool {
        guard balance >= amount else { return false }
        balance -= amount
        return true
    }
}

```

Here is what happens when external code interacts with it:

```swift
func testActorIsolation() async {
    let account = SafeBankAccount()

    // 1. Direct synchronous access fails at compile time:
    // account.balance -= 50  
    // ❌ Error: Actor-isolated property 'balance' can not be mutated from outside

    // 2. Cross-isolation call requires 'await':
    let success = await account.withdraw(amount: 50)
    print("Withdrawal successful:", success) // balance is safely 50
}

```

The compiler forces the `await` keyword because the caller is crossing the isolation boundary. If the actor is busy processing another transaction, execution pauses safely without blocking the calling thread.

---

### How `@MainActor` Fits In

`@MainActor` is simply a globally unique actor that always coordinates work on the main thread:

```swift
@MainActor
class ProfileViewModel {
    var username: String = "Veeram" // Isolated to MainActor

    func updateUsername(to newName: String) {
        username = newName // Synchronous, runs directly on main thread
    }
}

```

When a function is marked `@MainActor`, its isolation boundary is tied to the main thread. Accessing `updateUsername` from a background task requires `await`, ensuring UI-related state mutations never happen off the main thread.

---

### Connecting Back to `Task` vs `Task.detached`

* **`Task { ... }` respects actor isolation:** When created inside `@MainActor`, the closure itself becomes actor-isolated to `@MainActor`. You do not need `await` to access `@MainActor` properties inside it.
* **`Task.detached { ... }` leaves actor isolation behind:** It runs non-isolated on the cooperative pool. Accessing any `@MainActor` property from within the detached closure forces you to write `await`.
