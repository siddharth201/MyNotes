Another excellent Swift internals question.

Short answer:

> **Structs don’t use ARC because structs are value types, not shared objects.**
>
> ARC exists to manage the lifetime of **shared references**, and structs don’t have reference semantics.

Let’s unpack that carefully.

---

## First: What is ARC?

ARC = **Automatic Reference Counting**

Swift keeps track of:

> “How many references currently point to this object?”

Example:

```swift id="m1"
class User {
    var name = "Sid"
}
```

```swift id="m2"
var user1: User? = User()
```

Reference count:

```text id="jtbv6s"
1
```

Then:

```swift id="m3"
var user2 = user1
```

Now:

```text id="0iwyfe"
2
```

Then:

```swift id="m4"
user1 = nil
```

count:

```text id="zc3vw0"
1
```

Then:

```swift id="m5"
user2 = nil
```

count becomes:

```text id="vmsqhl"
0
```

Then Swift removes object from heap.

That is ARC.

---

## Why does class need ARC?

Because class is reference type.

Multiple variables can point to same object.

Example:

```text id="ctldyb"
user1 ----\
           → User object
user2 ----/
```

Question:

Who owns it?

Who frees memory?

When should it die?

ARC answers that.

---

## Struct behaves differently

Example:

```swift id="m6"
struct User {
    var name: String
}
```

```swift id="m7"
var user1 = User(name: "Sid")
var user2 = user1
```

Swift copies value.

Memory conceptually:

```text id="3eot9q"
user1 → User(name: "Sid")
user2 → User(name: "Sid")
```

Two independent values.

No sharing.

---

## So ARC has nothing to count

ARC counts references.

But struct has no shared reference.

Example:

```swift id="m8"
user2 = user1
```

This means:

```text id="mnzjlwm"
copy all data
```

not:

```text id="zh7q9q"
share same object
```

So there is:

❌ no reference count  
❌ no shared owner  
❌ no heap object requiring ARC management  

---

## Struct lifetime is automatic

Example:

```swift id="m9"
func test() {
    let point = Point(x: 10, y: 20)
}
```

When function exits:

```text id="7a4d3z"
point disappears automatically
```

No reference counting needed.

Swift/compiler handles it naturally.

---

## Real comparison

---

## Class

```swift id="m10"
class Car {
    var model = "BMW"
}
```

Memory:

```text id="q3p23x"
Stack
car ---> Heap Object
```

Need ARC to know:

```text id="xwx72n"
How many references point here?
```

---

## Struct

```swift id="m11"
struct Car {
    var model = "BMW"
}
```

Memory:

```text id="2vfhft"
car -> actual value
```

No external object to track.

---

## Important subtle point

Struct itself doesn’t use ARC…

BUT…

Struct can **contain reference types** that do.

Example:

```swift id="m12"
struct UserCache {
    let cache = NSCache<NSString, NSString>()
}
```

---

Here:

```text id="lbd4yk"
UserCache struct
```

does not use ARC.

But:

```text id="wh9ffg"
NSCache
```

inside it **does**, because `NSCache` is a class.

---

## What about Array/String/Dictionary?

Interesting case.

These are structs:

* `Array`
* `String`
* `Dictionary`

But internally they often store data in shared heap buffers.

And those internal buffers may use reference counting behind the scenes.

This is part of:

## Copy-On-Write (COW)

So:

```swift id="m13"
var a = [1,2,3]
var b = a
```

may initially share storage internally.

But to you:

`Array` still behaves like a struct/value type.

---

## Interview answer

If interviewer asks:

**“Why don’t structs use ARC?”**

Strong answer:

> ARC is needed for reference types because multiple references can point to the same heap object, so Swift must track ownership and release it when the last reference disappears.
>
> Structs are value types. Assignment creates a copy rather than a shared reference, so there’s no shared ownership to track. Because of that, structs don’t need ARC.

---

## Easy memory trick

### Class

🏠 one house
many people have address

Need to count who still owns it → ARC

---

### Struct

📄 everyone gets their own copy

No sharing

No counting needed

No ARC

---

One tiny correction to keep in mind:

Instead of saying:

> “Structs never use ARC”

more accurate is:

> “Structs themselves are not reference-counted, though they may contain reference-counted storage internally.”

That’s the senior-level explanation.

