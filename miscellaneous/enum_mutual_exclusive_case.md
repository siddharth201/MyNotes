## Mutually Exclusive Cases — Core Enum Concept

This is one of the MOST important concepts behind enums.

---

## Simple Definition

> Mutually exclusive means:
> only ONE case can exist at a time.

If one case is active,
all other cases are automatically inactive.

---

## Real-Life Example

Think about a traffic light.

Possible states:

* red
* yellow
* green

Can traffic light be:

* red AND green simultaneously?

❌ No

It must be ONLY ONE state at a time.

That is:

> mutually exclusive states

---

## Swift Enum Example

```swift
enum TrafficLight {
    case red
    case yellow
    case green
}
```

Now:

```swift
let light = TrafficLight.red
```

At this moment:

* `.red` exists
* `.yellow` does NOT
* `.green` does NOT

Only one case lives inside enum instance.

---

## Another Example — User Login

```swift
enum AuthState {
    case loggedIn
    case loggedOut
}
```

User can be:

* logged in
  OR
* logged out

But NOT both simultaneously.

---

## Why This Is Powerful

Enums help model:

* valid application states
* predictable flows
* impossible conditions prevention

---

## Compare with Struct

Struct can store multiple values together.

```swift
struct User {
    var isLoggedIn: Bool
    var isLoggedOut: Bool
}
```

Problem:

```swift
User(isLoggedIn: true, isLoggedOut: true)
```

❌ Invalid logic possible.

But enum prevents this.

---

## Enum Makes Invalid State Impossible

```swift
enum AuthState {
    case loggedIn
    case loggedOut
}
```

Now impossible to create invalid combination.

This is a BIG architecture advantage.

---

## Interview-Friendly Explanation

> Enums represent mutually exclusive states because an enum instance can hold only one case at a time. This helps model finite and valid application states safely.

---

## Production Example

```swift
enum APIState {
    case loading
    case success(Data)
    case failure(Error)
}
```

API can only be:

* loading
  OR
* success
  OR
* failure

Never all together.

---

## SwiftUI Uses This Heavily

SwiftUI is state-driven.

Example:

```swift
enum Screen {
    case home
    case profile
    case settings
}
```

App should show:

* one screen at a time

Perfect use case.

---

## Visualization

Think enum like a switch:

```text
[ loading ]
[ success ]
[ failure ]
```

Only one button can stay ON.

---

## Another Important Mental Model

Enum =

> "One type, many possible forms."

But:

> only one form at a time.

---

## Memory Perspective

```swift
enum Result {
    case success(String)
    case failure(Error)
}
```

If enum currently stores:

```swift
.success("Done")
```

Memory contains:

* success case
* associated String

Failure case does NOT exist in memory simultaneously.

---

## Advanced CS Perspective

Enums are inspired from:

Functional Programming

They are called:

> Algebraic Data Types (ADT)

Specifically:

> Sum Types

Meaning:

* value can be ONE of many possibilities

NOT all together.

---

## Easy Analogy

A person can be:

* sleeping
* eating
* running

But not all simultaneously.

Enum models this perfectly.

```swift
enum PersonState {
    case sleeping
    case eating
    case running
}
```

---

## Common Interview Question

## Why enums are better than multiple booleans?

Bad:

```swift
var isLoading = true
var isSuccess = true
var isError = false
```

❌ Invalid combination possible.

Good:

```swift
enum State {
    case loading
    case success
    case error
}
```

✅ Only one valid state possible.

This is why senior engineers love enums.

---

## Final Mental Model

Enums model:

* finite states
* one active state
* predictable behavior
* impossible invalid combinations

That is exactly what:

> mutually exclusive cases means.

