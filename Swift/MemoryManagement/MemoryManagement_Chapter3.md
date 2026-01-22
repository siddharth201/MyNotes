> **Can mutiple unowned reference can refer same object?**  

**Ans:**  

Yes — **multiple `unowned` references *can* refer to the same object**.
This is **allowed, common, and safe** *as long as the lifetime guarantee holds*.

Let’s explain this carefully, with **runnable examples**, and then cover **when it’s safe vs dangerous**.

---

## ✅ Short Answer

> **Yes.** Any number of `unowned` references can point to the **same class instance**.
> ARC tracks the object’s lifetime, but **none of those references increase its retain count**.

---

## 1️⃣ Why this is allowed (ARC perspective)

* `unowned` is a **non-owning reference**
* It does **not** affect retain count
* ARC still **tracks the object’s lifetime**
* All `unowned` references are just **dependent pointers** to the same heap object

Think of it like:

> “Many children can depend on the same parent, but none own it.”

---

## 2️⃣ Runnable Example — Multiple `unowned` references to the same object

### ▶️ RUN THIS in a Playground

```swift
class Account {
    let id: String

    init(id: String) {
        self.id = id
        print("Account \(id) initialized")
    }

    deinit {
        print("Account \(id) deinitialized")
    }
}

class Card {
    let number: String
    unowned let account: Account

    init(number: String, account: Account) {
        self.number = number
        self.account = account
        print("Card \(number) initialized")
    }

    deinit {
        print("Card \(number) deinitialized")
    }
}

func testMultipleUnowned() {
    let account = Account(id: "A1")

    let card1 = Card(number: "1111", account: account)
    let card2 = Card(number: "2222", account: account)
    let card3 = Card(number: "3333", account: account)

    print(card1.account.id)
    print(card2.account.id)
    print(card3.account.id)
}

testMultipleUnowned()
```

### Output

```
Account A1 initialized
Card 1111 initialized
Card 2222 initialized
Card 3333 initialized
A1
A1
A1
Account A1 deinitialized
Card 1111 deinitialized
Card 2222 deinitialized
Card 3333 deinitialized
```

✅ All `unowned` references point to the **same `Account` instance**
✅ No retain cycle
✅ Clean deallocation

---

## 3️⃣ Reference count check (important)

At runtime:

* `Account` retain count = **1** (held by local variable `account`)
* `Card.account` (`unowned`) = **0 retain impact**

Even with **100 cards**, retain count is still 1.

---

## 4️⃣ When this is SAFE

Multiple `unowned` references are safe **only if**:

✔ The referenced object **outlives all unowned holders**
✔ Ownership is **centralized and guaranteed**
✔ Lifetime is enforced by design (not assumptions)

### Typical safe scenarios

* Parent → many children
* Account → multiple cards
* Coordinator → multiple view controllers
* Session → multiple dependent objects

---

## 5️⃣ When this becomes DANGEROUS (very important)

### ❌ Crash example — lifetime guarantee broken

```swift
var account: Account? = Account(id: "A1")

let card1 = Card(number: "1111", account: account!)
let card2 = Card(number: "2222", account: account!)

account = nil   // Account deallocated

print(card1.account.id) // 💥 CRASH
```

Why?

* `unowned` references still exist
* ARC does NOT nil them
* Accessing freed memory → runtime trap

---

## 6️⃣ Why ARC allows this (design reason)

If Swift disallowed multiple `unowned` references:

* Parent–child models would be impossible
* Coordinator patterns would break
* You’d be forced to use `weak` everywhere

Instead, Swift says:

> “You may do this — but **you are responsible** for correctness.”

---

## 7️⃣ Comparison table (memorize this)

| Reference Type | Can multiple refer to same object? | Retains? | Safe if owner dies? |
| -------------- | ---------------------------------- | -------- | ------------------- |
| strong         | ✅                                  | ✅        | ❌ (cycle risk)      |
| weak           | ✅                                  | ❌        | ✅ (nil)             |
| unowned        | ✅                                  | ❌        | ❌ (crash)           |

---

## 8️⃣ Interview-grade one-liner

> “Yes, multiple unowned references can point to the same object. ARC tracks the object’s lifetime but does not retain it. This is safe only when the object is guaranteed to outlive all unowned references.”

---

## 9️⃣ Mental model (lock this in)

> **Strong owns**
> **Weak observes**
> **Unowned depends**
>
> Many dependents can rely on one owner.



