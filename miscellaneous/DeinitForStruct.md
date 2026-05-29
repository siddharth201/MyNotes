Excellent question. This is one of those Swift design questions that reveals whether you really understand **value types vs reference types**.

Short answer:

> **Structs don’t have `deinit` because structs don’t have an independent lifetime in memory.**
>
> They’re value types, copied directly as values, and Swift doesn’t manage them through reference counting.

Let’s go step by step.

---

## What is `deinit`?

`deinit` means:

> “Run this code right before an instance is removed from memory.”

Example:

```swift id="4szh2a"
class User {

    deinit {
        print("User removed from memory")
    }
}
```

When last reference goes away:

```swift id="6u41s9"
var user: User? = User()
user = nil
```

Output:

```text id="d4wef8"
User removed from memory
```

---

## Why does class need it?

Because class instances:

✅ live on heap  
✅ have identity  
✅ can be shared by many references  
✅ are managed by ARC  

Swift needs a clear moment:

```text id="yz6pwg"
reference count = 0
```

Then:

```text id="jk4rd4"
deinit runs
memory released
```

---

## Why struct doesn’t?

Because struct behaves differently.

Struct is a **value type**.

Example:

```swift id="5r5g62"
struct User {
    var name: String
}
```

```swift id="r2z6bg"
let user = User(name: "Sid")
```

`user` is just a value.

Like:

```text id="4zqopk"
Int
Bool
Double
String
```

Swift treats it like ordinary data.

---

## Struct has no separate lifetime to observe

Example:

```swift id="h12m3f"
func test() {
    let user = User(name: "Sid")
}
```

When function ends:

`user` disappears automatically.

No ARC.

No reference count.

No heap object needing cleanup callback.

Just value gone.

---

## Which copy would call `deinit`?

This is the biggest reason.

Imagine:

```swift id="yv9e9w"
struct User {
    var name: String
}
```

---

```swift id="i9dbu8"
var user1 = User(name: "Sid")
var user2 = user1
var user3 = user2
```

Now there are multiple copies.

---

Question:

If `deinit` existed…

When should it run?

When `user1` disappears?

Or `user2`?

Or `user3`?

Each is its own value.

No single identity.

No single owner.

So there is no meaningful “destruction moment”.

---

## With class it's easy

Example:

```swift id="xjlwmj"
let user1 = User()
let user2 = user1
```

Both point to one object.

Memory:

```text id="f7t5nv"
user1 ----\
           → one heap object
user2 ----/
```

When last reference disappears:

```text id="mjl0c9"
reference count = 0
```

deinit runs exactly once.

Clear.

---

## With struct it’s unclear

Example:

```text id="5tdf7z"
user1 = copy
user2 = copy
user3 = copy
```

No single original object to destroy.

---

## Struct doesn’t own resources directly in the same way

`deinit` is commonly used for cleanup:

Example:

* close file handle
* remove observer
* invalidate timer
* release resource
* cancel network task

These are object lifecycle responsibilities.

Usually reference types handle those.

---

## Example where class needs deinit

```swift id="f4vg2v"
class FileLogger {

    let fileHandle: FileHandle

    init(fileHandle: FileHandle) {
        self.fileHandle = fileHandle
    }

    deinit {
        fileHandle.closeFile()
    }
}
```

Very useful.

---

## Struct usually models data

Example:

```swift id="fq46tp"
struct User {
    let id: Int
    let name: String
}
```

Nothing to clean up.

Just data.

---

## But struct can contain reference types

Example:

```swift id="n7f64u"
struct CacheWrapper {
    let cache = NSCache<NSString, NSString>()
}
```

Even then:

`CacheWrapper` itself has no `deinit`.

But internal class object may.

---

## Interview answer

If interviewer asks:

**“Why doesn’t Swift allow `deinit` in structs?”**

Strong answer:

> Structs are value types, so they don’t have identity or reference-counted lifetime like classes. They’re copied freely and destroyed as part of normal value semantics, often tied to stack scope or compiler optimization. Because there isn’t one stable instance with a clear destruction point, Swift doesn’t provide `deinit` for structs. `deinit` is only meaningful for reference types like classes, where ARC determines a definite end of lifetime.

---

## Easy memory trick

### Class

🏠 one house
many people can hold address

When last person leaves:

```text id="w7m76d"
deinit
```

---

### Struct

📄 photocopies of paper

Many copies exist.

No single “original” to destroy.

So:

```text id="3y0wyj"
no deinit
```

That’s the intuition.

