Great question. This gets to the *why* behind Swift’s design.

Short version:

> Classes are usually stored on the **heap** because they need **shared ownership**, **dynamic lifetime**, and **stable identity**.

Let’s break that down.

---

## First: Stack vs Heap

### Stack

Think:

```text
fast
small
automatic cleanup
```

Memory is added and removed in order (LIFO).

Example:

```swift
func test() {
    let x = 10
}
```

When function ends:

`x` disappears automatically.

Very fast.

---

### Heap

Think:

```text
slower
more flexible
lives longer
shared
```

Heap memory stays alive until explicitly released.

In Swift:

via **ARC**.

---

## Why not stack for class?

Because class objects need things stack cannot provide well.

---

## 1. Classes need shared ownership

Example:

```swift
class User {
    var name = "Sid"
}

let u1 = User()
let u2 = u1
```

Now:

```text
u1 ---> User object
u2 ---/
```

Two variables share same instance.

---

If class lived on stack:

```text
u1 stack frame
u2 stack frame
```

which stack owns it?

Who destroys it?

When should it disappear?

Very hard.

Heap solves this:

Object stays alive independently of any one function.

ARC tracks references.

---

## 2. Class lifetime is dynamic

Example:

```swift
func createUser() -> User {
    let user = User()
    return user
}
```

If object were on stack:

When function exits:

```text
stack frame destroyed
```

object gone ❌

But caller still needs it.

Heap allows:

```text
function exits
object continues living
```

until nobody references it.

---

## Example

```swift
let user = createUser()
```

Even after `createUser()` returns, object still exists.

Because heap memory survives function scope.

---

## 3. Classes need identity

Classes are not just values.

They are **objects with identity**.

Example:

```swift
user1 === user2
```

This asks:

> Are these the exact same object?

For that object needs stable memory location.

Heap gives stable address.

---

Example:

```text
0x1000 -> User
```

That address remains while object lives.

---

Struct doesn’t need identity.

Only value matters.

---

## 4. Inheritance needs heap

Example:

```swift
class Animal {}
class Dog: Animal {}
```

Class size and behavior can be dynamic.

Polymorphism:

```swift
let animal: Animal = Dog()
```

Runtime needs flexibility.

Heap supports this much better.

---

## 5. ARC works with heap objects

Swift class memory is managed by:

## ARC = Automatic Reference Counting

Example:

```swift
var user1: User? = User()
var user2 = user1
```

Reference count:

```text
2
```

Then:

```swift
user1 = nil
```

count:

```text
1
```

Then:

```swift
user2 = nil
```

count:

```text
0
```

Heap memory released.

This model fits heap perfectly.

---

## Why structs often use stack

Structs are value types.

Example:

```swift
struct Point {
    var x: Int
    var y: Int
}
```

```swift
let p = Point(x: 10, y: 20)
```

Swift can store directly in local memory.

No need for:

* shared ownership
* identity
* ARC

So stack is ideal.

---

## Important nuance

You’ll often hear:

> Struct = stack
> Class = heap

This is useful for learning…

…but not 100% technically accurate.

Swift compiler can optimize.

A struct may also end up in heap depending on context.

Example:

* captured by closure
* stored inside class
* compiler optimization decisions

So better way to say:

### Better statement:

> Struct has **value semantics**
> Class has **reference semantics**

And typically:

> Class instances are heap allocated.

---

## Interview answer

If interviewer asks:

**“Why are class instances stored on heap?”**

Strong answer:

> Class instances are typically stored on the heap because they need reference semantics. Multiple variables can point to the same instance, the object can outlive the function that created it, and ARC can manage its lifetime independently of stack scope. Heap allocation also provides stable identity, which is required for inheritance and shared mutable state.

That’s a strong senior iOS answer.

---

## Easy memory trick

### Struct

📦 value itself

---

### Class

🏠 object lives somewhere else

Variable holds house address

---

Like:

```text
Struct → actual object

Class → address of object
```

