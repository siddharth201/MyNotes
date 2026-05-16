## Enums in Swift 

> An enum in Swift is a type that defines a group of related values in a type-safe way. Unlike traditional enums, Swift enums can also store associated values, have methods, computed properties, and conform to protocols.

---

## Why Enums Exist

Enums help represent:

* finite states
* fixed choices
* mutually exclusive cases

Examples:

* network state
* payment state
* app screens
* loading/success/failure
* direction
* API result

---

## Final Mental Model

Think of enum as:

> “A type that can exist in ONLY ONE valid state at a time.”

Examples:

* User is either logged in OR logged out
* Payment is either pending OR success OR failed
* Direction is north OR south OR east OR west

Not all together simultaneously.

That’s why enums are incredibly powerful for app state management in Swift and SwiftUI.


## Basic Enum Syntax

```swift
enum Direction {
    case north
    case south
    case east
    case west
}
```

Usage:

```swift
let move = Direction.north
```

Or:

```swift
let move: Direction = .north
```

---

## Real-Life Example

```swift
enum PaymentStatus {
    case pending
    case success
    case failed
}
```

```swift
let status = PaymentStatus.success
```

---

## Enum with Switch

Enums are commonly used with `switch`.

```swift
switch status {
case .pending:
    print("Payment Pending")

case .success:
    print("Payment Successful")

case .failed:
    print("Payment Failed")
}
```

---

## Important Interview Point

Swift forces exhaustive handling.

Meaning:

* every case MUST be handled

Otherwise compiler error occurs.

This makes code safer.

---

## Associated Values (MOST IMPORTANT)

This is where Swift enums become powerful.

Enums can store data with each case.

```swift
enum Result {
    case success(String)
    case failure(String)
}
```

Usage:

```swift
let response = Result.success("Data Loaded")
```

Reading values:

```swift
switch response {

case .success(let message):
    print(message)

case .failure(let error):
    print(error)
}
```

---

## Real Production Example

```swift
enum NetworkState {
    case loading
    case success([String])
    case failure(Error)
}
```

Used heavily in:

* SwiftUI
* MVVM
* Networking

---

## Associated Values vs Raw Values

Very common interview question.

## Associated Values

* Dynamic
* Different for each instance
* Stored alongside case

```swift
enum APIResponse {
    case success(String)
}
```

---

## Raw Values

* Fixed predefined value
* Same for all instances

```swift
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
```

Usage:

```swift
print(HTTPMethod.get.rawValue)
```

Output:

```swift
GET
```

---

## Raw Value Enums

```swift
enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
}
```

Swift auto increments.

```swift
print(Weekday.tuesday.rawValue)
```

Output:

```swift
2
```

---

## Initialize Enum from Raw Value

```swift
let day = Weekday(rawValue: 2)
```

Return type:

```swift
Optional<Weekday>
```

Because value may not exist.

---

## Enum Methods

Enums can contain functions.

```swift
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

```swift
print(Direction.north.description())
```

---

## Computed Properties in Enum

```swift
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

---

## Enum Conforming to Protocols

```swift
enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
}
```

Usage:

```swift
Direction.allCases
```

---

# Commonly Used Protocols with Enum

| Protocol       | Purpose                |
| -------------- | ---------------------- |
| `CaseIterable` | Iterate all cases      |
| `Codable`      | JSON encoding/decoding |
| `Equatable`    | Compare                |
| `Hashable`     | Dictionary/Set         |
| `Identifiable` | SwiftUI                |

---

## Recursive Enum

Advanced interview topic.

```swift
indirect enum FileSystem {

    case file(String)
    case folder(String, [FileSystem])
}
```

`indirect` allows recursive storage.

---

## Memory Advantage of Enum

Enums are efficient because:

* only one case exists at a time
* compiler optimizes storage

Unlike classes with multiple states.

---

## Real SwiftUI Usage

### Navigation State

```swift
enum Screen {
    case home
    case profile
    case settings
}
```

---

### Loading State

```swift
enum ViewState {
    case idle
    case loading
    case loaded
    case error(String)
}
```

Extremely common in production apps.

---

## Interview Questions (Theory)

### 1. What is enum in Swift?

> Enum is a type-safe way to represent a group of related values.

---

### 2. Difference between enum and struct?

| Enum                       | Struct                       |
| -------------------------- | ---------------------------- |
| Represents states          | Represents data              |
| One case at a time         | Multiple properties together |
| Can have associated values | Stores fixed properties      |

---

## 3. Difference between raw value and associated value?

| Raw Value    | Associated Value       |
| ------------ | ---------------------- |
| Fixed        | Dynamic                |
| Same always  | Changes per instance   |
| Defined once | Passed during creation |

---

## 4. Why switch with enum is safer in Swift?

Because Swift enforces exhaustive checking.

All cases must be handled.

---

## 5. Can enums have methods?

Yes.

Enums in Swift are full-fledged types.

---

## 6. Can enums conform to protocols?

Yes.

Example:

* Codable
* Equatable
* Hashable

---

## 7. Can enum store properties?

Stored properties:
❌ No

Computed properties:
✅ Yes

---

## 8. What is indirect enum?

Used for recursive enums.

---

## 10. When should you use enum?

Use enum when:

* finite possible states exist
* mutually exclusive conditions exist

---

## Most Asked Code Snippet Questions
["Enums Code Snippet"]()


## Advanced Interview Question

## Why SwiftUI Uses Enum Heavily?

Because UI is state-driven.

Examples:

* loading
* success
* error
* navigation
* sheet presentation

Enums model state safely.

---

## Most Important Real-World Pattern

```swift
enum UIState<T> {
    case idle
    case loading
    case success(T)
    case failure(Error)
}
```

This is a VERY important production pattern.

Used in:

* networking
* repositories
* view models
* async operations

---

## Senior-Level Understanding

Enums are essentially:

> Algebraic Data Types (ADT)

Meaning:

* one type
* multiple mutually exclusive states
* optionally carrying data

This is inspired from functional programming.

---

## Q. `mutually exclusive cases` means?  



