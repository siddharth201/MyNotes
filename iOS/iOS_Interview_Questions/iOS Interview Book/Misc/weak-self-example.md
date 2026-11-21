
In Swift, closures capture references **strongly** by default. If an object owns a closure (e.g., stored in a property) and that closure references `self`, you create a **retain cycle**—neither the object nor the closure can ever be deallocated.

Capture lists (`[weak self]` and `[unowned self]`) break this cycle by telling the closure not to increase `self`'s retain count.

---

### 1. `[weak self]` in Closures (Safe for Async Work)

Use `[weak self]` when a closure might run **after** `self` has already been destroyed (like network requests, timers, or delayed tasks). Because `self` becomes an optional (`Self?`), you safely unwrap it using `guard let self` or `self?.`.

```swift
import Foundation

class DataLoader {
    let name = "ProfileLoader"
    
    func fetchData() {
        print("\(name): Starting network request...")
        
        // Simulate a 2-second async network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            // Safely unwrap self because DataLoader might be gone by now
            guard let self = self else {
                print("Closure ran, but DataLoader was already deallocated. Safely exiting!")
                return
            }
            print("\(self.name): Finished updating UI!")
        }
    }
    
    deinit {
        print("\(name): Deallocated from memory")
    }
}

// --- Execution ---
var loader: DataLoader? = DataLoader()
loader?.fetchData()

// Destroy the loader after 0.5 seconds (BEFORE the 2-second closure finishes)
DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    loader = nil 
}

// Keep playground/command-line alive long enough to see the 2-second output
RunLoop.main.run(until: Date().addingTimeInterval(3.0))

```

**Output:**

```text
ProfileLoader: Starting network request...
ProfileLoader: Deallocated from memory
Closure ran, but DataLoader was already deallocated. Safely exiting!

```

---

### 2. `[unowned self]` in Closures (Guaranteed Lifetime)

Use `[unowned self]` only when the closure is strictly owned by `self` and **cannot outlive `self**` (for example, a synchronous helper closure or a lazy computed property). `self` remains non-optional, so no unwrapping is needed.

```swift
class Greeter {
    let userName: String
    
    // This closure is owned by Greeter. It can ONLY be called while Greeter is alive.
    lazy var welcomeMessage: () -> String = { [unowned self] in
        // No optional unwrapping needed because self is non-optional
        return "Welcome back, \(self.userName)!"
    }
    
    init(userName: String) {
        self.userName = userName
    }
    
    deinit {
        print("Greeter for \(userName) deallocated")
    }
}

// --- Execution ---
var greeter: Greeter? = Greeter(userName: "Rohan")
print(greeter!.welcomeMessage()) // Prints: Welcome back, Rohan!

// Because [unowned self] broke the retain cycle, setting greeter to nil deallocates it cleanly
greeter = nil

```

**Output:**

```text
Welcome back, Rohan!
Greeter for Rohan deallocated

```

#### ⚠️ What happens if `[unowned self]` is used in an async closure?

If you used `[unowned self]` in the first `DataLoader` example and `loader` became `nil` before the 2 seconds were up, accessing `self.name` would trigger a **fatal runtime crash** (`Fatal error: Attempted to read an unowned reference but object was already deallocated`).

---

### Quick Decision Guide

| Scenario | Use | Why? |
| --- | --- | --- |
| **API calls, `DispatchQueue.async`, Timers, Animations** | `[weak self]` | The user might close the screen or cancel the task before the closure finishes. |
| **Closures stored as properties on `self` (e.g., `lazy var`)** | `[unowned self]` | The closure is destroyed at the exact same moment `self` is deallocated, so `self` is guaranteed to exist whenever the closure is called. |
| **Non-escaping closures (e.g., `array.map { ... }`)** | Neither (Default) | Non-escaping closures run immediately and are destroyed before the function returns, so they never cause retain cycles. |
