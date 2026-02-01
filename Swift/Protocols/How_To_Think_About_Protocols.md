# **How To Think About Protocols**

Great question — this is a **core mental shift** in becoming a strong Swift / iOS engineer.

Most developers understand *what* protocols are…
But seniors differ in **when they instinctively reach for them**.

Let’s build that instinct step-by-step.

---

# 🧠 First: One-Line Mental Model

> **Use a protocol when you want to depend on *behavior*, not a concrete type.**

Or even simpler:

> If you can describe something as *“anything that can do X”*, you’re thinking in protocols.

---

# 🚦 The Decision Checklist (Ask These in Order)

Whenever you get a problem, ask:

### ✅ 1. Will there be more than one implementation?

If YES → protocol candidate.

Example:

* API today → maybe GraphQL tomorrow
* Local DB today → Cloud sync tomorrow

---

### ✅ 2. Do I want to unit test this easily?

If YES → protocol.

Why?
Protocols allow **mocking**.

---

### ✅ 3. Does this class do work that is not its core responsibility?

If YES → extract that responsibility behind a protocol.

---

### ✅ 4. Does this logic talk to the outside world?

(Network, disk, Bluetooth, sensors, Keychain, etc.)

If YES → protocol.

---

### ✅ 5. Could this behavior change independently from the caller?

If YES → protocol.

---

If **2 or more answers are YES**, you almost certainly want a protocol.

---

# 🔁 How Beginners Think vs How Seniors Think

### Beginner Thinking

> "I need a NetworkManager class."

### Senior Thinking

> "I need something that can fetch data."

That thought → protocol.

---

# 🧱 Example Problem

**Problem:**
"Fetch user profile and show it on screen."

---

## ❌ Without Protocol Thinking

```swift
class NetworkService {
    func fetchUser() -> String {
        return "John"
    }
}

class ProfileViewModel {
    let network = NetworkService()

    func load() -> String {
        return network.fetchUser()
    }
}
```

### Issues

* Can't mock NetworkService
* Tightly coupled
* Hard to change implementation

---

## ✅ Protocol Thinking Version

### Step 1: Describe behavior

👉 "Something that can fetch user"

```swift
protocol UserFetching {
    func fetchUser() -> String
}
```

---

### Step 2: Concrete implementation

```swift
class NetworkService: UserFetching {
    func fetchUser() -> String {
        return "John"
    }
}
```

---

### Step 3: Inject protocol

```swift
class ProfileViewModel {
    let userFetcher: UserFetching

    init(userFetcher: UserFetching) {
        self.userFetcher = userFetcher
    }

    func load() -> String {
        return userFetcher.fetchUser()
    }
}
```

---

### Step 4: Mock for testing

```swift
class MockUserFetcher: UserFetching {
    func fetchUser() -> String {
        return "Mock User"
    }
}
```

---

### Result

```swift
let vm = ProfileViewModel(userFetcher: MockUserFetcher())
vm.load()   // "Mock User"
```

---

# 🎯 The Pattern You Should Memorize

Whenever you see:

```
let service = SomeConcreteClass()
```

Ask:

👉 Should this be:

```
let service: SomeProtocol
```

---

# 🧩 Protocol-Oriented Thinking Template

When facing a problem:

1. Identify **actions**
2. Convert actions into verbs
3. Turn verbs into protocols

---

### Example

Problem: Save user settings

Actions:

* Save
* Load

Protocol:

```swift
protocol SettingsStorage {
    func save(value: String)
    func load() -> String
}
```

Implementations:

```swift
class UserDefaultsStorage: SettingsStorage {}
class FileStorage: SettingsStorage {}
class CloudStorage: SettingsStorage {}
```

---

# 🧠 Rule of Thumb

> Classes are *how*.
> Protocols are *what*.

---

# 🔥 Another Real-World Example

### Without Protocol

```swift
class AnalyticsManager {
    func track(event: String) {}
}
```

### With Protocol

```swift
protocol AnalyticsTracking {
    func track(event: String)
}
```

Now you can have:

```swift
FirebaseAnalyticsTracker
MixpanelAnalyticsTracker
ConsoleAnalyticsTracker
```

---

# 📦 Where Protocols Commonly Live

In Clean Architecture style:

### Domain Layer

* Repository protocols
* Service protocols

### Data Layer

* Concrete implementations

---

# 🧠 When NOT To Use Protocol

❌ Only one implementation forever
❌ No testing needed
❌ Pure data model

Example:

```swift
struct User {
    let id: Int
}
```

No protocol needed.

---

# 🧪 Interview Friendly Answer

> I introduce a protocol whenever I want to decouple usage from implementation.
> Especially when multiple implementations are possible, when I need testability, or when a class depends on external systems.
> My rule is: depend on abstractions, not concrete types.

---

# 🏗 A Simple Mental Flowchart

```
Will this behavior vary?
        |
        Yes
        |
Can I describe it as "anything that can X"?
        |
        Yes
        |
      Use Protocol
```

---

# 🚀 Final Mindset Shift

Stop thinking:

> "Should I create a protocol?"

Start thinking:

> "What is the behavior here?"

Protocols will appear naturally.

---

If you want, next we can:

👉 Take a random problem (like login, caching, notifications, payments)
👉 You try to identify protocols
👉 I’ll review and correct your thinking

Just tell me a problem you'd like to practice with 👍

