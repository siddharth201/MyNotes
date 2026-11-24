
Think of **actor-isolated code** like a **single-occupancy restroom with a lock on the door**.

Here is how that translates to Swift in plain, everyday terms:

### 1. The Restroom = The Actor's Mutable State

Inside an actor, there is shared data that can change (like `var balance = 100`). If two people (tasks/threads) walk in and try to change that data at the exact same time, things get messy and corrupted (a **data race**).

### 2. Everything Inside the Room = "Actor-Isolated Code"

**Actor-isolated code** is simply **any code (methods or properties) that lives inside that locked room** and directly touches the actor's data.

* Because it is *isolated* inside the actor, it is safe from the outside world.
* Inside the room, you don't need to worry about anyone else barging in—you can freely read and update the actor's variables synchronously.

### 3. The Lock on the Door = "One Piece at a Time"

* **If you are outside the room** (calling the actor from a `ViewController` or another `Task`), you can't just kick the door open. You have to knock and wait in line (`await`).
* **Once you are inside**, the door locks behind you. Nobody else can run *any* actor-isolated code on that actor until you finish your work and step out.

---

### Quick Code Picture

```swift
actor BankAccount {
    // 🔒 Protected state (inside the locked room)
    var balance = 1000 

    // ✅ ACTOR-ISOLATED CODE: Lives inside the actor, so it can touch `balance` directly
    func deposit(amount: Int) {
        balance += amount // Safe! Only one task can be in here at a time.
    }
    
    // ✅ ALSO ACTOR-ISOLATED: Can call other isolated methods without `await`
    func bonusDeposit() {
        deposit(amount: 50) // Already inside the room, no knocking needed!
    }
}

// ❌ OUTSIDE THE ACTOR (Non-isolated):
// Must use `await` to wait in line at the locked door
let account = BankAccount()
await account.deposit(amount: 200)

```

### In One Sentence

**Actor-isolated code** is the code *inside* an actor's "VIP room" that has direct access to its data—and Swift guarantees only **one task at a time** is allowed inside that room.
