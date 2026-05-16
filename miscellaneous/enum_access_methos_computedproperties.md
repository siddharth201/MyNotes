## 1. Can Enum Functions / Computed Properties Be Accessed Directly?

Excellent question.

Short answer:

## Depends on whether they are:

* instance members
  OR
* static members

---

## Instance Methods / Properties

These belong to an enum instance (a case).

So yes:

> they are usually accessed through a case/instance.

---

## Example — Instance Method

```swift id="1l8yr2"
enum Direction {

    case north
    case south

    func description() -> String {

        switch self {

        case .north:
            return "Moving North"

        case .south:
            return "Moving South"
        }
    }
}
```

Usage:

```swift id="0qk40x"
let move = Direction.north

print(move.description())
```

OR directly:

```swift id="4xh8xy"
print(Direction.north.description())
```

Output:

```text id="jx6goh"
Moving North
```

---

## Why?

Because:

* `description()` depends on current enum case
* method uses `self`

```swift id="v52nuh"
switch self
```

So Swift needs:

* a specific enum instance/case

---

## Computed Property Example

```swift id="mk05w0"
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

Usage:

```swift id="l1vvy8"
print(Planet.earth.gravity)
```

Output:

```text id="99r0p2"
9.8
```

Again:

* property depends on current case
* so instance required

---

## Can We Access Directly Like This?

```swift id="11q89d"
Direction.description()
```

❌ No

Because:

* no instance exists
* Swift doesn't know which case to use

---

## Static Methods / Properties

These belong to enum TYPE itself.

Then you CAN access directly.

---

## Example

```swift id="1cgnhf"
enum Math {

    static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}
```

Usage:

```swift id="5t50sj"
print(Math.add(10, 20))
```

Output:

```text id="7uv88e"
30
```

---

## Static Computed Property

```swift id="1jk18r"
enum AppConfig {

    static var appName: String {
        return "My App"
    }
}

print(AppConfig.appName)
```

Output:

```text id="8ol9zv"
My App
```

---

## Mental Model

| Member Type              | Access Style  |
| ------------------------ | ------------- |
| Instance method/property | via enum case |
| Static method/property   | via enum type |

---

## VERY IMPORTANT INTERVIEW QUESTION

## Why do enum instance methods require a case?

Because:

* enums are value types
* instance members operate on current enum state (`self`)

---

## 2. Common Use Cases of Nested Enums

Nested enums are VERY useful in:

* namespacing
* grouping related states
* improving readability
* avoiding naming conflicts

---

## Basic Syntax

```swift id="nqgjj0"
enum Payment {

    enum Status {
        case success
        case failure
    }
}
```

Usage:

```swift id="6x5brr"
let status = Payment.Status.success
```

---

## Why Nested Enums?

Without nesting:

```swift id="v2qj9r"
enum Success { }
enum Failure { }
```

Too generic.

Can conflict with other modules.

---

## Nested enums provide scope.

```swift id="vrvazq"
Payment.Status.success
```

Very readable.

---

## COMMON REAL-WORLD USE CASES

## 1. API Layer

VERY common.

```swift id="7hl27k"
enum API {

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }

    enum StatusCode: Int {
        case success = 200
        case notFound = 404
    }
}
```

Usage:

```swift id="2eq5ta"
let method = API.HTTPMethod.get
let code = API.StatusCode.success
```

---

## Why Good?

Organized.

Instead of polluting global namespace:

❌

```swift id="f4eb2u"
enum HTTPMethod { }
enum StatusCode { }
```

---

## 2. Network Layer

```swift id="9fz1r3"
enum Network {

    enum State {
        case loading
        case success
        case failure
    }

    enum ErrorType {
        case timeout
        case noInternet
    }
}
```

Usage:

```swift id="ig6qiu"
let state = Network.State.loading
```

---

## 3. SwiftUI Navigation

```swift id="v9m6zd"
enum AppScreen {

    enum Home {
        case dashboard
        case profile
    }

    enum Settings {
        case account
        case privacy
    }
}
```

---

## 4. Feature-Based Architecture

VERY professional usage.

```swift id="wsktr0"
enum Auth {

    enum State {
        case loggedIn
        case loggedOut
    }

    enum Action {
        case login
        case logout
    }
}
```

---

## 5. Error Organization

```swift id="qj83bx"
enum Database {

    enum Error: Swift.Error {
        case connectionFailed
        case invalidQuery
    }
}
```

Usage:

```swift id="7v0js7"
let error = Database.Error.invalidQuery
```

---

## 6. UIKit/SwiftUI Component Organization

```swift id="0l5i6u"
enum ButtonStyle {

    enum Size {
        case small
        case medium
        case large
    }

    enum Theme {
        case primary
        case secondary
    }
}
```

---

## Interview-Friendly Definition

> Nested enums are enums declared inside another type to logically group related states and avoid namespace pollution.

---

## Senior-Level Advantage

Nested enums improve:

* modularity
* readability
* discoverability
* scalability

Very useful in large apps.

---

## Important Interview Question

## Are nested enums dependent on outer enum instance?

Usually:
❌ No

Nested enum behaves like:

* a type inside another type

Example:

```swift id="t33g0r"
enum Outer {

    enum Inner {
        case test
    }
}
```

Use directly:

```swift id="zc8mdd"
Outer.Inner.test
```

No `Outer` instance required.

---

## Final Mental Model

Nested enums are like folders/directories:

```text id="g10guv"
API
 ├── HTTPMethod
 ├── StatusCode

Auth
 ├── State
 ├── Action
```

They help organize related concepts cleanly.

Very common in professional Swift codebases and SwiftUI architecture.

