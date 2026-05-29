Great topic. **Copy-on-Write (CoW)** is one of Swift’s smartest optimizations—and it often comes up in iOS interviews.

---

## What is Copy-on-Write (CoW)?

Short definition:

> Copy-on-Write means:
>
> **“Don’t copy immediately when assigning. Share memory first. Copy only when one side modifies it.”**

---

## Why does Swift need CoW?

Structs are value types.

Normally value type means:

```swift id="cow1"
var a = [1, 2, 3]
var b = a
```

You might think Swift does this immediately:

```text
a -> [1,2,3]
b -> [1,2,3]
```

Two full copies in memory.

That could be expensive for large arrays.

Imagine:

```text
10,000 elements
100,000 elements
images
large strings
```

Copying every time would be slow and waste memory.

---

## Swift’s optimization

Instead Swift says:

> “Let’s not copy yet.”

When you write:

```swift id="cow2"
var a = [1, 2, 3]
var b = a
```

Swift often stores:

```text
a ----\
       ---> Shared Buffer [1,2,3]
b ----/
```

Both point to same storage temporarily.

No real copy yet.

---

## When does actual copy happen?

Only when one side mutates.

Example:

```swift id="cow3"
var a = [1, 2, 3]
var b = a

b.append(4)
```

Before append:

```text
a ----\
       ---> [1,2,3]
b ----/
```

Swift sees:

> “b wants to change data, but a is also using it.”

So Swift creates copy first.

Then:

```text
a ----> [1,2,3]

b ----> [1,2,3,4]
```

Now separate.

---

## That’s Copy-on-Write

### Copy is delayed until mutation

Hence:

## Copy → On → Write

---

## Real-life analogy

Think:

Two people sharing Google Doc in view-only mode.

```text
A views document
B views document
```

Same document.

No duplication.

---

Then B clicks:

```text
Make a copy
Edit
```

Now B gets separate copy.

A unchanged.

That is CoW.

---

## Example with Array

```swift id="cow4"
var numbers1 = [1, 2, 3]
var numbers2 = numbers1
```

No actual copy yet.

---

Then:

```swift id="cow5"
numbers2.append(4)
```

Swift creates new buffer.

---

Now:

```swift id="cow6"
print(numbers1)
```

Output:

```swift
[1, 2, 3]
```

---

```swift id="cow7"
print(numbers2)
```

Output:

```swift
[1, 2, 3, 4]
```

---

## Common Swift types using CoW

Swift standard library uses CoW heavily.

Examples:

Swift

```swift id="cow8"
Array
String
Dictionary
Set
Data
```

---

## Why CoW is amazing

Without CoW:

```swift
var b = a
```

would always copy everything.

Expensive.

---

With CoW:

```text
assign = cheap
copy only when needed
```

Benefits:

✅ better performance  
✅ lower memory usage  
✅ still preserves value semantics  

---

## Important point

This is the magic:

### To you:

Array behaves like value type

---

### Internally:

May share storage like reference type

---

Best of both worlds.

---

## Example with String

```swift id="cow9"
var name1 = "Siddharth"
var name2 = name1
```

Initially may share storage.

Then:

```swift id="cow10"
name2 += " Tiwari"
```

Now Swift copies before modifying.

---

Result:

```swift
name1 = "Siddharth"
name2 = "Siddharth Tiwari"
```

---

## How Swift checks whether copy needed?

Swift uses uniqueness check internally.

Conceptually:

```swift
isKnownUniquelyReferenced(...)
```

Swift asks:

> “Am I the only owner of this storage?”

---

If YES:

modify directly.

---

If NO:

make copy first.

---

Example:

```text
Only one owner
→ mutate directly

Multiple owners
→ copy then mutate
```

---

## Simplified custom CoW example

A simplified implementation:

```swift id="cow11"
final class Storage {
    var items: [Int]

    init(items: [Int]) {
        self.items = items
    }
}
```

---

Struct wrapper:

```swift id="cow12"
struct MyArray {

    private var storage: Storage

    init(_ items: [Int]) {
        storage = Storage(items: items)
    }

    mutating func append(_ value: Int) {

        if !isKnownUniquelyReferenced(&storage) {
            storage = Storage(items: storage.items)
        }

        storage.items.append(value)
    }
}
```

---

This is basically how CoW works internally.

---

## Interview answer

If interviewer asks:

**“What is Copy-on-Write in Swift?”**

Good answer:

> Copy-on-Write is an optimization used by Swift value types like Array, String, and Dictionary.
>
> Instead of copying data immediately during assignment, Swift shares underlying storage between copies.
>
> When one copy is mutated, Swift checks whether storage is uniquely referenced. If not, it creates a separate copy before mutation.
>
> This gives value semantics while avoiding unnecessary memory copies.

---

## Easy memory trick

### Before mutation

```text
a ----\
       --> shared storage
b ----/
```

---

### After mutation

```text
a --> original storage
b --> copied storage
```

---

## One-liner

> CoW = **share until someone writes**

That’s the easiest way to remember it.

