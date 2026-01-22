> **How ARC works in case of unowned and since it is used in parent - child relationship, explain it more with production example and how we will dcide which one is parent and which one is child, where onowned should be used**  

**Ans:**  


# 1️⃣ How ARC Works with `unowned`

### Definition (Precise)

An **`unowned` reference**:

* ❌ Does **not** increase reference count
* ❌ Is **not optional**
* ❌ Is **not nil-checked**
* 💥 **Crashes** if accessed after the referenced object is deallocated

ARC behavior:

* ARC does **not** keep the referenced object alive
* ARC assumes the object **will outlive the `unowned` reference**

> `unowned` is a **promise you make to ARC**

---

## ARC Perspective

```swift
class Parent {}
class Child {
    unowned let parent: Parent
}
```

ARC sees:

```
Child → Parent (non-owning, unsafe)
```

ARC does **not** protect you.

---

# 2️⃣ Why `unowned` Exists at All

Why not just use `weak` everywhere?

### Because `unowned` gives:

* Stronger **semantic meaning**
* Non-optional access
* No repeated `?` checks
* Clear ownership contract

> `weak` = “may go away”
> `unowned` = “cannot go away before me”

---

# 3️⃣ Parent–Child Relationship (Correct Mental Model)

### Parent

* Owns the child
* Controls lifecycle
* Child **cannot logically exist** without parent

### Child

* Depends on parent
* Should not retain parent
* Can safely assume parent exists

---

## Ownership Direction (THIS IS KEY)

```
Parent ──strong──▶ Child
Child  ──unowned─▶ Parent
```

This is the **canonical ARC-safe ownership graph**.

---

# 4️⃣ Production Example #1 — Owner & Card (Banking App)

### Business Rule

> A card **cannot exist without** an account

---

### Implementation

```swift
class Account {
    let id: String
    var cards: [Card] = []

    init(id: String) {
        self.id = id
        print("Account initialized")
    }

    func addCard(number: String) {
        let card = Card(number: number, account: self)
        cards.append(card)
    }

    deinit {
        print("Account deallocated")
    }
}

class Card {
    let number: String
    unowned let account: Account

    init(number: String, account: Account) {
        self.number = number
        self.account = account
        print("Card initialized")
    }

    deinit {
        print("Card deallocated")
    }
}
```

---

### ARC Flow

```swift
var account: Account? = Account(id: "A1")
account?.addCard(number: "1234")
account = nil
```

Output:

```
Account initialized
Card initialized
Account deallocated
Card deallocated
```

✔ Safe
✔ No retain cycle
✔ Logical ownership preserved

---

# 5️⃣ How to Decide Parent vs Child (Interview-Grade Rules)

Ask these questions **in order**:

---

### ✅ Rule 1: Who creates whom?

* Creator is usually the **parent**

```swift
Account → creates Card
```

---

### ✅ Rule 2: Who controls lifetime?

* The object that decides when the other dies is the **parent**

---

### ✅ Rule 3: Can child exist independently?

| Answer | Decision               |
| ------ | ---------------------- |
| ❌ No   | Child holds `unowned`  |
| ✅ Yes  | Use `weak` or `strong` |

---

### ✅ Rule 4: Business meaning (most important)

Ownership is a **domain decision**, not technical.

---

# 6️⃣ Production Example #2 — ViewController & Coordinator

### Rule

> A coordinator exists **only** while the ViewController exists

```swift
class AppCoordinator {
    func start() {
        let vc = HomeViewController(coordinator: self)
    }
}

class HomeViewController {
    unowned let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}
```

✔ Coordinator owns VC
✔ VC cannot exist without coordinator
✔ `unowned` is correct

---

# 7️⃣ Example Where `unowned` is WRONG

### ❌ Delegate Pattern

```swift
class ViewModel {
    unowned var delegate: ViewDelegate   // ❌ WRONG
}
```

Why?

* Delegate may be released
* Leads to crash

Correct:

```swift
weak var delegate: ViewDelegate?
```

---

# 8️⃣ Unowned vs Weak — Decision Table (SAVE THIS)

| Question                 | Use       |
| ------------------------ | --------- |
| Can it ever be nil?      | `weak`    |
| Is lifecycle guaranteed? | `unowned` |
| Delegate?                | `weak`    |
| Parent-child?            | `unowned` |
| UI elements?             | `weak`    |
| Async closures?          | `weak`    |

---

# 9️⃣ ARC Crash Example (Understand This!)

```swift
var account: Account? = Account(id: "A1")
let card = Card(number: "1234", account: account!)

account = nil
print(card.account.id) // 💥 CRASH
```

ARC deallocated `Account`, but `Card` still holds an `unowned` reference.

👉 This is **your responsibility**.

---

# 🔟 Why SwiftUI Rarely Needs `unowned`

SwiftUI:

* Uses value types
* Manages lifetimes internally
* Relies on structs, not classes

You mostly see `weak` in UIKit.

---

# 1️⃣1️⃣ Mental Model (Memorize This)

> **Strong owns**
> **Weak observes**
> **Unowned depends**

---

# 1️⃣2️⃣ Interview One-Liner (Perfect Answer)

> “I use `unowned` when a child object cannot outlive its parent and the lifecycle is guaranteed by design.”





