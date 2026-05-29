This is a really important Swift topic because it shows how **value semantics** and **reference semantics** interact.

Short version:

> **If a struct contains a class → copying the struct does NOT copy the class instance. The reference is copied.**
>
> **If a class contains a struct → the class owns that struct value. Mutating the struct changes that class instance’s copy.**

Let’s go step by step.

---

## 1. Class instance inside Struct

Example:

```swift id="cs1"
class Address {
    var city: String

    init(city: String) {
        self.city = city
    }
}
```

---

Struct:

```swift id="cs2"
struct User {
    var name: String
    var address: Address
}
```

---

Usage:

```swift id="cs3"
let address = Address(city: "Varanasi")

var user1 = User(
    name: "Sid",
    address: address
)

var user2 = user1
```

Now:

```swift
user2.address.city = "Delhi"
```

---

Check:

```swift id="cs4"
print(user1.address.city)
print(user2.address.city)
```

Output:

```text
Delhi
Delhi
```

---

## Why?

Because:

`User` is copied...

BUT...

`address` is a class instance (reference type).

So only reference gets copied.

---

Memory:

```text
user1 (struct copy)
 ├─ name = "Sid"
 └─ address ----\

user2 (struct copy)
 ├─ name = "Sid"
 └─ address ----/

           ↓
      Address object
      city = "Varanasi"
```

Then:

```swift
user2.address.city = "Delhi"
```

changes shared Address object.

So both see update.

---

## Important interview line

> Struct copy is shallow when it contains reference types.

Meaning:

Swift copies outer struct value…

but inner class reference still points to same object.

---

## Example

Change `name`

```swift id="cs5"
user2.name = "Rahul"
```

Now:

```text
user1.name = "Sid"
user2.name = "Rahul"
```

because `name` is pure value.

---

But:

```swift
user2.address.city = "Delhi"
```

affects both.

---

## 2. Struct inside Class

Now reverse.

Struct:

```swift id="cs6"
struct Address {
    var city: String
}
```

---

Class:

```swift id="cs7"
class User {
    var name: String
    var address: Address

    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}
```

---

Usage:

```swift id="cs8"
let user1 = User(
    name: "Sid",
    address: Address(city: "Varanasi")
)

let user2 = user1
```

---

Then:

```swift id="cs9"
user2.address.city = "Delhi"
```

Check:

```swift
print(user1.address.city)
```

Output:

```text
Delhi
```

---

Why?

Because:

`user1` and `user2` point to same class instance.

---

Memory:

```text
user1 ----\
           \
            ---> User object
           /
user2 ----/
```

Inside that object:

```text
name = "Sid"
address = Address(city: "Varanasi")
```

Only one `address` exists inside that class object.

So modifying it affects both references.

---

## Key difference

---

### Struct contains Class

```text
Struct copied
Class reference shared
```

---

### Class contains Struct

```text
Class shared
Struct stored inside shared object
```

---

## Very common confusion example

---

### Struct with class property

```swift id="cs10"
class Box {
    var value = 10
}

struct Container {
    var box: Box
}
```

---

```swift id="cs11"
let box = Box()

var c1 = Container(box: box)
var c2 = c1
```

---

Then:

```swift id="cs12"
c2.box.value = 99
```

---

Output:

```swift
print(c1.box.value)
```

```text
99
```

Because same `Box`.

---

## Another example

Class with struct:

```swift id="cs13"
struct Point {
    var x: Int
}
```

---

```swift id="cs14"
class Shape {
    var point = Point(x: 0)
}
```

---

```swift id="cs15"
let s1 = Shape()
let s2 = s1

s2.point.x = 100
```

---

Then:

```swift
print(s1.point.x)
```

Output:

```text
100
```

Because `s1` and `s2` reference same Shape object.

---

## Deep Copy vs Shallow Copy

Important interview term:

---

### Struct + only value properties

Deep independent copy.

---

## Struct + class property

Usually shallow copy of reference.

---

Example:

```text
struct copied
reference inside reused
```

---

## Interview answer

If interviewer asks:

### “What happens when a struct contains a class instance?”

Good answer:

> The struct itself is copied because it’s a value type, but any class properties inside it are reference types, so their references are copied, not the actual objects. This means multiple struct copies can still share the same class instance.

---

If asked:

### “What happens when a class contains a struct?”

Good answer:

> The struct becomes part of the class instance’s stored data. Since the class is reference type, multiple references to that class share the same contained struct value.

---

## Easy memory trick

### Struct → Class

```text
copy wrapper
share inner object
```

---

## Class → Struct

```text
share wrapper
share contained value
```

---

## One-line summary

> A struct copies its values, but if one of those values is a class reference, the reference is copied.
>
> A class shares its whole instance, including any structs stored inside it.

That distinction is extremely important in Swift architecture.

