Excellent observation.
This is actually an important modern Swift interview topic.

Your code works because:

> Swift can automatically synthesize `Equatable` conformance for many enums.

So even if you don't explicitly write:

```swift id="3i4h7z"
: Equatable
```

Swift often adds it automatically behind the scenes.

---

## Your Example

```swift id="sjm2hv"
enum LoginState {
    case loggedIn
    case loggedOut
}

let a = LoginState.loggedIn
let b = LoginState.loggedIn
let c = LoginState.loggedOut

print(a == b)
print(a == c)
```

Output:

```text id="4f66fv"
true
false
```

---

## Why Does This Work?

Because Swift automatically generates:

```swift id="4cbm2d"
static func == (...)
```

for simple enums.

This feature is called:

> Synthesized Equatable Conformance

---

## What Swift Internally Generates

Swift behaves almost like this:

```swift id="ymb1hi"
enum LoginState {
    case loggedIn
    case loggedOut
}

extension LoginState: Equatable {

    static func == (
        lhs: LoginState,
        rhs: LoginState
    ) -> Bool {

        switch (lhs, rhs) {

        case (.loggedIn, .loggedIn):
            return true

        case (.loggedOut, .loggedOut):
            return true

        default:
            return false
        }
    }
}
```

You don't write it manually.
Swift compiler generates it.

---

## IMPORTANT

This automatic synthesis works only when:

* all associated values are also Equatable
  OR
* enum has no associated values

---

## Example — Still Works

```swift id="i4y5br"
enum Result {
    case success(String)
    case failure(String)
}
```

Why?

Because:

* `String` conforms to `Equatable`

So:

```swift id="1djlwm"
let a = Result.success("Hello")
let b = Result.success("Hello")

print(a == b)
```

Output:

```text id="l18cdq"
true
```

---

## Example — Will FAIL

```swift id="q1ms6k"
class User { }

enum State {
    case loggedIn(User)
}
```

Now:

```swift id="a4gqbp"
let a = State.loggedIn(User())
let b = State.loggedIn(User())

print(a == b)
```

❌ Error

Because:

* `User` does NOT conform to `Equatable`

So compiler cannot synthesize equality.

---

## Fix

```swift id="lq87jl"
class User: Equatable {

    static func == (
        lhs: User,
        rhs: User
    ) -> Bool {

        return true
    }
}
```

Now enum comparison works.

---

## Important Historical Context

Older Swift versions required explicit:

```swift id="mjlwm5"
: Equatable
```

Modern Swift (Swift 4.1+) supports:

* automatic synthesis

So compiler is smarter now.

---

## Then Why Do People Still Write `: Equatable`?

VERY IMPORTANT.

Because:

* it makes conformance explicit
* improves readability
* communicates intent clearly
* required in protocols/generics sometimes

Professional code usually still writes it.

---

## Example

```swift id="gc4bft"
enum LoginState: Equatable {
    case loggedIn
    case loggedOut
}
```

This tells other developers:

> "This type is intentionally comparable."

---

## Interview-Friendly Answer

## Why does enum comparison work without explicitly conforming to Equatable?

> Swift automatically synthesizes Equatable conformance for enums when all associated values also conform to Equatable or when no associated values exist.

---

## Another Important Example

```swift id="xtkr2f"
enum APIState {
    case loading
    case success(Int)
}
```

Works because:

* `Int` is Equatable

---

## But This Fails

```swift id="s6yd8z"
class NetworkManager { }

enum State {
    case loaded(NetworkManager)
}
```

Comparison fails because:

* `NetworkManager` is not Equatable

---

## Structs Also Get Synthesized Equatable

```swift id="0z2fwt"
struct User {
    let name: String
    let age: Int
}
```

This works:

```swift id="1qkj92"
let a = User(name: "A", age: 10)
let b = User(name: "A", age: 10)

print(a == b)
```

Because Swift synthesizes equality.

---

## VERY IMPORTANT DIFFERENCE

## Synthesized Equality

Compiler-generated automatically.

---

## Manual Equality

You write:

```swift id="sgbr4f"
static func == (...)
```

Used when:

* custom comparison needed
* special logic required

---

## Example — Custom Equality

```swift id="j7s5jw"
struct User: Equatable {

    let id: Int
    let name: String

    static func == (
        lhs: User,
        rhs: User
    ) -> Bool {

        return lhs.id == rhs.id
    }
}
```

Now:

* name ignored
* only id compared

---

## Final Mental Model

Modern Swift can automatically generate:

* `Equatable`
* `Hashable`
* `Codable`

when possible.

This is called:

> Compiler Synthesis

Very important Swift feature.

