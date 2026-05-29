Excellent topic. `mutating` is one of those Swift keywords that feels odd at first—but once it clicks, it becomes very intuitive.

---

## What does `mutating` mean?

`mutating` means:

> “This method is allowed to change the properties of the instance itself.”

Swift requires this **only for value types**:

* `struct`
* `enum`

Not for `class`.

---

## Why does `mutating` exist?

Because structs are **value types**.

And by default inside a struct method, `self` is treated as immutable.

So Swift protects the struct from accidental modification.

---

## Example without `mutating`

```swift id="x1"
struct Counter {
    var count = 0

    func increment() {
        count += 1
    }
}
```

Error:

```text
Left side of mutating operator isn't mutable: 'self' is immutable
```

---

Why?

Inside `func increment()` Swift sees:

```swift id="x2"
self.count += 1
```

That means:

> modify current instance (`self`)

And for struct, modifying `self` requires explicit permission.

---

## Correct way

Use `mutating`

```swift id="x3"
struct Counter {
    var count = 0

    mutating func increment() {
        count += 1
    }
}
```

---

Now:

```swift id="x4"
var counter = Counter()

counter.increment()

print(counter.count)
```

Output:

```swift
1
```

---

## Why does Swift require this keyword?

To make mutations explicit.

When another developer reads:

```swift id="x5"
mutating func increment()
```

they immediately know:

> “Calling this method will modify the struct.”

Very clear API design.

---

## Think of it like this

Struct = copied values

So changing a struct often means:

> replacing the old value with a new value

---

Example:

```swift id="x6"
var user = User(name: "Sid")
```

Then:

```swift id="x7"
user.name = "Rahul"
```

Conceptually:

```text
old User(name: Sid)
→ replaced with
new User(name: Rahul)
```

Swift wants that change to be explicit inside methods.

---

## `mutating` can also replace whole self

Very powerful feature.

Example:

```swift id="x8"
struct User {
    var name: String

    mutating func reset() {
        self = User(name: "Guest")
    }
}
```

---

Usage:

```swift id="x9"
var user = User(name: "Sid")

user.reset()

print(user.name)
```

Output:

```swift
Guest
```

---

Because `mutating` allows:

```swift
self = ...
```

which means replace entire value.

---

## Class does NOT need `mutating`

Example:

```swift id="x10"
class Counter {
    var count = 0

    func increment() {
        count += 1
    }
}
```

No `mutating`.

---

Why?

Because class is a **reference type**.

The instance lives on heap.

Method doesn’t replace value—it modifies object through reference.

---

Think:

```text
counter -> heap object
```

Method updates heap object directly.

No value replacement.

---

## Comparison Example

### Struct

```swift id="x11"
struct User {
    var name: String

    mutating func updateName() {
        name = "Rahul"
    }
}
```

Needs `mutating`

---

### Class

```swift id="x12"
class User {
    var name: String = "Sid"

    func updateName() {
        name = "Rahul"
    }
}
```

No `mutating`

---

## What happens with `let`?

Very important.

---

### Struct + let

```swift id="x13"
let counter = Counter()
counter.increment()
```

❌ Error

Because:

`let` makes whole value immutable.

Even `mutating` method cannot run.

---

### Class + let

```swift id="x14"
let counter = Counter()
counter.increment()
```

✅ Works

Because `let` locks reference only.

Object can still mutate.

---

This is a classic interview comparison.

---

## Mutating with enum

Enums can also use `mutating`

Example:

```swift id="x15"
enum SwitchState {
    case on
    case off

    mutating func toggle() {
        self = self == .on ? .off : .on
    }
}
```

---

Usage:

```swift id="x16"
var state = SwitchState.off
state.toggle()
```

Now:

```swift
.on
```

---

## When do you use `mutating` in real apps?

Common cases:

### Toggle state

```swift id="x17"
mutating func toggleFavorite() {
    isFavorite.toggle()
}
```

---

### Update model

```swift id="x18"
mutating func rename(to name: String) {
    self.name = name
}
```

---

### Reset data

```swift id="x19"
mutating func reset() {
    self = .empty
}
```

---

### State transitions

```swift id="x20"
mutating func advance()
```

---

## Interview answer

If interviewer asks:

**“Why do structs need `mutating` but classes don’t?”**

Good answer:

> Structs are value types. Modifying a property inside a method changes the value of `self`, so Swift requires the `mutating` keyword to make that explicit.
>
> Classes are reference types, so methods mutate the referenced object directly. The reference itself doesn’t change, so `mutating` isn’t needed.

---

## Easy memory trick

### Struct

📦 changing box itself → needs `mutating`

---

### Class

🏠 changing things inside house → no `mutating`

---

## Summary Table

|                                     |             Struct |          Class |
| ----------------------------------- | -----------------: | -------------: |
| Value / Reference                   |              Value |      Reference |
| Method can modify property directly | ❌ needs `mutating` |          ✅ yes |
| Can reassign `self` inside method   |  ✅ with `mutating` | ❌ generally no |
| Works on `let` instance             |               ❌ no |          ✅ yes |

---

The one subtle follow-up interviewers sometimes ask after this is:

**“Why can Array.append() work if Array is a struct?”**

That’s a fun one because `Array` is a struct but `append()` is `mutating`, plus it uses copy-on-write internally.

