
# Why Enums Cannot Have Stored Properties in Swift

This is a very important Swift design concept.

---

## Short Answer

Enums cannot have stored properties because:

> an enum instance can represent only ONE case at a time, and different cases may require completely different memory layouts.

Stored properties would force all enum cases to carry the same stored data, which conflicts with how enums are designed.

---

## First Understand Enum Nature

Enums model:

* mutually exclusive states
* one active case at a time

Example:

```swift id="u70a6l"
enum Direction {
    case north
    case south
}
```

At runtime:

* instance is either `.north`
  OR
* `.south`

Never both.

---

## Now Imagine Stored Properties Were Allowed

Suppose Swift allowed this:

```swift id="j1pwh2"
enum Direction {

    case north
    case south

    var speed: Int = 10
}
```

Question:

* where should `speed` live in memory?
* should every enum case store it?
* what if some cases don't need it?

This creates design ambiguity.

---

## Core Problem

Enums are optimized to store:

> only the currently active case.

But stored properties would require:

> extra memory always attached to enum instance.

That breaks enum’s lightweight state-modeling design.

---

## Memory Visualization

Current enum:

```swift id="zj9zqe"
enum TrafficLight {
    case red
    case green
}
```

Memory:

```text id="jtm25t"
[ current case ]
```

Very compact.

---

## If Stored Properties Existed

```swift id="owu9mg"
enum TrafficLight {

    case red
    case green

    var timer = 10
}
```

Memory becomes:

```text id="r6ih74"
[ current case ][ timer ]
```

Now every enum case unnecessarily carries `timer`.

Swift designers avoided this.

---

## Bigger Problem — Different Cases Need Different Data

Example:

```swift id="d8lgg2"
enum Payment {

    case cash
    case card
}
```

Suppose:

```swift id="14nqz8"
var cardNumber: String
```

Question:

* Why should `.cash` store `cardNumber`?

Makes no logical sense.

---

## Swift Solution → Associated Values

Instead of stored properties,
Swift gives enums:

> associated values

---

## Correct Swift Design

```swift id="mpj5i9"
enum Payment {

    case cash
    case card(number: String)
}
```

Now:

* `.cash` stores nothing
* `.card` stores only required data

Efficient and logical.

---

## THIS is Why Associated Values Exist

Associated values are:

* case-specific storage

Stored properties would be:

* shared storage across all cases

Enums are intentionally designed around:

> per-case storage

---

## Interview-Friendly Definition

> Swift enums cannot have stored properties because enum cases represent mutually exclusive states with potentially different memory requirements. Instead, Swift uses associated values to store data specific to individual cases.

---

## Computed Properties Are Allowed

Because:

* they don't store memory
* they compute values dynamically

---

## Example

```swift id="ln9v6o"
enum Planet {

    case earth
    case mars

    var gravity: Double {

        switch self {

        case .earth:
            return 9.8

        case .mars:
            return 3.7
        }
    }
}
```

No data stored.
Only computed when accessed.

So Swift allows it.

---

## Why Struct Can Have Stored Properties

Struct represents:

> a complete data object

Example:

```swift id="n6itjq"
struct User {
    var name: String
    var age: Int
}
```

Every `User` should have:

* name
* age

So stored properties make sense.

---

## But Enum Represents State

Example:

```swift id="e3x83h"
enum NetworkState {
    case loading
    case success
    case failure
}
```

Not a full data container.
Just current state.

Different design purpose.

---

## Advanced Compiler Perspective

Internally, Swift enums are implemented similar to:

> tagged unions

Meaning:

* a tag indicates current case
* associated value memory changes per case

Allowing arbitrary stored properties complicates:

* memory layout
* optimization
* pattern matching

---

## Another Important Reason

Enums try to make:

> invalid states impossible.

Associated values help attach only relevant data.

Example:

```swift id="9nmm1j"
enum Result {
    case success(data: String)
    case failure(error: String)
}
```

Each case stores only meaningful data.

---

## What If You Need Shared Stored Data?

Use:

* struct containing enum
  OR
* class

---

## Example

```swift id="zwavk8"
enum LoginState {
    case loggedIn
    case loggedOut
}

struct UserSession {

    var state: LoginState
    var username: String
}
```

This is proper architecture.

---

## Important Interview Question

## Why associated values are better than stored properties in enums?

Because:

* data becomes case-specific
* memory efficient
* safer
* models state correctly

---

## Final Mental Model

Struct/Class:

> “Object with many properties”

Enum:

> “One state among many possibilities”

So:

* structs/classes → stored properties
* enums → associated values

That is the core Swift philosophy.

