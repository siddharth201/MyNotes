
## Class vs Struct in Swift

Both **class** and **struct** can:

✅ store properties  
✅ have methods  
✅ have initializers  
✅ conform to protocols  
✅ use extensions  

At first they look similar.

Example:

## Struct

```swift
struct User {
    var name: String
    var age: Int

    func introduce() {
        print("Hi, I am \(name)")
    }
}
```

---

## Class

```swift
class User {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func introduce() {
        print("Hi, I am \(name)")
    }
}
```

Looks almost same.

---

# The Real Difference

The biggest difference:

# Struct = Value Type

# Class = Reference Type

This changes everything.

---

# 1. Struct = Value Type

When assigned or passed → Swift creates a **copy**

Example:

```swift
struct User {
    var name: String
}

var user1 = User(name: "Sid")
var user2 = user1

user2.name = "Rahul"

print(user1.name)
print(user2.name)
```

Output:

```swift
Sid
Rahul
```

---

Why?

Because:

```swift
user2 = copy of user1
```

Different memory.

---

## Memory diagram

```text
Stack
----------------
user1 → User(name: "Sid")

user2 → User(name: "Rahul")
```

Independent values.

---

## 2. Class = Reference Type

Class stores **reference to object**

Example:

```swift
class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}
```

---

```swift
let user1 = User(name: "Sid")
let user2 = user1

user2.name = "Rahul"

print(user1.name)
print(user2.name)
```

Output:

```swift
Rahul
Rahul
```

---

Because:

Both point to same object.

---

## Memory diagram

```text
Stack
----------------
user1 --------\
               \
                → Heap Object { name: "Sid" }
               /
user2 --------/
```

One shared object.

---

## 3. Mutability Difference

### Struct

```swift
struct User {
    var name: String
}
```

If instance is `let`:

```swift
let user = User(name: "Sid")
```

Then:

```swift
user.name = "Rahul"
```

❌ Error

Even if property is `var`

---

Why?

Because whole value is constant.

---

### Class

```swift
class User {
    var name: String

    init(name: String) {
        self.name = name
    }
}
```

```swift
let user = User(name: "Sid")
user.name = "Rahul"
```

✅ works

---

Why?

Because `let` makes reference constant, not object.

---

### Easy way to remember

For class:

```text
let → pointer constant
object still mutable
```

For struct:

```text
let → whole value constant
```

---

## 4. Identity

Struct has **no identity**

Only value matters.

---

```swift
struct Point {
    var x: Int
}
```

```swift
let a = Point(x: 10)
let b = Point(x: 10)
```

These are equal by value.

No identity.

---

Class has identity.

Example:

```swift
let a = User(name: "Sid")
let b = a
```

Check:

```swift
a === b
```

`===` means:

> Are both references pointing to same object?

---

`==`

checks value equality

`===`

checks reference identity

---

## 5. Inheritance

Struct ❌ does NOT support inheritance

Class ✅ supports inheritance

---

Example:

```swift
class Animal {
    func eat() {
        print("Eating")
    }
}
```

---

```swift
class Dog: Animal {
    func bark() {
        print("Woof")
    }
}
```

---

Use when:

```text
is-a relationship
```

Dog is Animal

---

Struct cannot do:

```swift
struct Dog: Animal
```

❌ invalid

---

## 6. ARC (Automatic Reference Counting)

Classes use ARC.

Swift tracks how many references point to object.

---

Example:

```swift
class User {
    deinit {
        print("deallocated")
    }
}
```

When reference count becomes 0:

memory released.

---

Struct doesn’t use ARC directly like classes.

Because it’s copied by value.

---

## 7. Deinitializer

Only class can have:

```swift
deinit {

}
```

---

Example:

```swift
class NetworkManager {

    deinit {
        print("removed from memory")
    }
}
```

Struct cannot.

---

## 8. Thread Safety

Struct is safer by default.

Because copying avoids shared mutable state.

---

Example:

Two threads:

```swift
thread1 -> user1 copy
thread2 -> user2 copy
```

No conflict.

---

Class:

Multiple threads may access same object.

Possible:

* race condition
* inconsistent state
* crash

---

## 9. Performance

People often ask:

Which is faster?

Answer:

Usually **struct**, but not always.

---

Struct:

good for small data.

Class:

better when large object needs sharing instead of copying repeatedly.

---

Example:

Small:

```swift
Point
Size
UserResponse
Address
```

Struct great.

---

Huge object graph:

```swift
ImageCache
NetworkManager
DatabaseManager
```

Class often better.

---

## 10. Initializer Difference

Struct gets memberwise initializer automatically.

---

```swift
struct User {
    var name: String
    var age: Int
}
```

Swift gives:

```swift
User(name: "Sid", age: 28)
```

without writing init.

---

Class does NOT.

Need:

```swift
init(name: String, age: Int) {

}
```

---

## Apple's recommendation

Apple generally recommends:

> Use **struct by default**

Move to class only if needed.

---

## When to use Struct

Use struct when:

✅ model data  
✅ independent values  
✅ no shared ownership  
✅ immutable data preferred  

Examples:

```swift
User
Product
Address
APIRequest
APIResponse
Point
Size
Rectangle
Configuration
```

---

## When to use Class

Use class when:

✅ shared mutable state needed  
✅ object identity matters  
✅ lifecycle matters  
✅ inheritance needed  
✅ deinit needed  

Examples:

```swift
ViewModel
NetworkManager
Coordinator
CacheManager
SessionManager
DatabaseService
```

---

## Real App Example

### Struct

```swift
struct Product {
    let id: Int
    let title: String
    let price: Double
}
```

Every product is just data.

---

### Class

```swift
final class CartManager {

    var items: [Product] = []

    func add(_ product: Product) {
        items.append(product)
    }
}
```

Why class?

Because many screens share same cart.

ProductList screen → add item

Cart screen → show item

Checkout screen → calculate total

All need same shared instance.

---

## Most common interview question

### "Struct or Class—which do you prefer?"

Good answer:

> I usually start with **struct** because Swift encourages value semantics. Structs are safer, simpler, and avoid shared mutable state.
>
> I switch to **class** when I need shared identity, lifecycle management, inheritance, or multiple consumers referencing the same instance.

That answer sounds very strong in interviews.

---

## One-line memory trick

## Struct

📦 "Own copy of data"

---

## Class

🏠 "Shared object in memory"

---

## Quick Summary Table

| Feature               |        Struct |          Class |
| --------------------- | ------------: | -------------: |
| Type                  |    Value Type | Reference Type |
| Stored in             | Stack usually |           Heap |
| Copy on assign        |           Yes |             No |
| Shared instance       |            No |            Yes |
| Identity              |            No |            Yes |
| Inheritance           |            No |            Yes |
| ARC                   |            No |            Yes |
| deinit                |            No |            Yes |
| Safer for concurrency |           Yes |      Less safe |

---  


## Q. Explain  default values in `class` and `struct`?
[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/DefaultValues_in_Struc_Class.md)
  
  
## Q. Why struct loses memberwise initializer when you write custom init()  
[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Memberwise_Init_in_Struct.md)  

## Q. Explain Mutating in struct and class?  
[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Mutating.md)  

## Q. Class stores `reference to object`, what this means?  
[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/RefrenceToObject.md)  

