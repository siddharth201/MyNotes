Yes. Exactly.

This sentence is fundamental to understanding classes in Swift:

> **A class variable does not store the object itself — it stores a reference (pointer) to the object.**

Let’s break it down carefully.

---

## Struct stores the value itself

Example:

```swift
struct User {
    var name: String
}

var user1 = User(name: "Sid")
```

Memory conceptually:

```text
user1
 └── User(name: "Sid")
```

`user1` directly contains the data.

---

## Class stores a reference to object

Example:

```swift
class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let user1 = User(name: "Sid")
```

Memory conceptually:

```text
user1
   │
   ▼
Heap Object
┌──────────────┐
│ name = "Sid" │
└──────────────┘
```

`user1` does **not** contain `"Sid"` directly.

It contains:

```text
memory address / pointer / reference
```

that points to the actual object stored elsewhere in memory (heap).

---

## Easy real-world analogy

Think of:

## Struct

Like carrying the actual book in your bag.

```text
Bag → Book
```

---

### Class

Like carrying the library card with shelf number.

```text
Bag → Card → Book on shelf
```

The card isn’t the book.

It only tells where the book lives.

That card = **reference**

---

## Why does assignment behave differently?

This becomes clear here:

---

### Struct

```swift
var user1 = User(name: "Sid")
var user2 = user1
```

Swift copies value.

```text
user1 → User(name: "Sid")
user2 → User(name: "Sid")
```

Two separate copies.

---

### Class

```swift
let user1 = User(name: "Sid")
let user2 = user1
```

Swift copies reference only.

```text
user1 ----\
           \
            --> User object in heap
           /
user2 ----/
```

Both point to same object.

---

So:

```swift
user2.name = "Rahul"
```

Now:

```swift
print(user1.name)
```

Output:

```text
Rahul
```

Because same object changed.

---

## Another way to think about it

Class variable contains something like:

```text
0x12345678
```

(an address)

Example:

```swift
user1 = 0x1000
user2 = 0x1000
```

Both variables hold same address.

That address points to:

```text
Heap:
0x1000 → User(name: "Sid")
```

---

## Why does Swift do this?

Because classes are designed for **shared ownership**.

Example:

* CartManager shared across screens
* SessionManager shared across app
* NetworkManager singleton
* ViewModel observed by UI

Multiple places can reference same object.

---

## `let` confusion (very common)

Example:

```swift
let user = User(name: "Sid")
```

Then:

```swift
user.name = "Rahul"
```

This works.

People ask:

> "But `let` means constant… why allowed?"

Because:

`let` makes the **reference constant**, not the object.

Meaning:

```text
user = same reference always
```

But object contents can change.

---

Not allowed:

```swift
user = User(name: "New")
```

because that changes reference.

---

Allowed:

```swift
user.name = "Rahul"
```

because same object, only internal property changed.

---

## One-line interview answer

If interviewer asks:

**“What does it mean that class is a reference type?”**

Good answer:

> It means a class instance lives in memory separately, and variables store a reference to that instance rather than the instance itself. Assigning a class to another variable copies the reference, not the object, so both variables point to the same underlying instance.

That’s a very strong Swift answer.

