## Why Do We Write `enum Weekday: Int`?

```swift
enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
}
```

The `: Int` means:

> This enum uses `Int` raw values.

---

## Interview-Friendly Definition

> When we specify a type after an enum (`: Int`, `: String`, etc.), we are telling Swift that each enum case should have a raw value of that type.

---

## What Are Raw Values?

Raw values are:

* predefined fixed values
* automatically attached to enum cases

Example:

```swift
enum Direction: String {
    case north = "N"
    case south = "S"
}
```

Here:

* `.north` → `"N"`
* `.south` → `"S"`

These are raw values.

---

## Without Raw Value Type

```swift
enum Direction {
    case north
    case south
}
```

This enum only has cases.

No raw values exist.

So this will fail:

```swift
Direction.north.rawValue
```

❌ Error

Because raw values don't exist.

---

## When We Use `: Int`

Use when:

* cases map naturally to numbers
* database/API returns integers
* ordering matters
* indexing needed

---

## Example — Days

```swift
enum Weekday: Int {
    case monday = 1
    case tuesday
    case wednesday
}
```

Now:

```swift
print(Weekday.tuesday.rawValue)
```

Output:

```text
2
```

Swift auto increments integer raw values.

---

## When We Use `: String`

Use when:

* API sends strings
* readable values needed
* serialization/JSON
* logging/debugging

---

## Example

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

```text
GET
```

---

## Commonly Used Raw Value Types

| Type        | Use Case                    |
| ----------- | --------------------------- |
| `Int`       | IDs, indexing, ordering     |
| `String`    | APIs, JSON, readable values |
| `Double`    | Rare                        |
| `Character` | Rare                        |

---

## Very Important Concept

This:

```swift
enum Weekday: Int
```

does NOT mean enum inherits from Int.

Enums cannot inherit.

It means:

> enum cases store Int raw values.

---

## Visual Understanding

```swift
enum Weekday: Int {
    case monday = 1
    case tuesday = 2
}
```

Internally:

```text
monday -> 1
tuesday -> 2
```

---

## Auto Assignment Behavior

## Int

```swift
enum Number: Int {
    case one = 1
    case two
    case three
}
```

Swift automatically assigns:

```text
one -> 1
two -> 2
three -> 3
```

---

## String

```swift
enum Direction: String {
    case north
    case south
}
```

Swift automatically assigns:

```text
north -> "north"
south -> "south"
```

---

## Accessing Raw Value

```swift
print(Direction.north.rawValue)
```

---

## Creating Enum from Raw Value

VERY IMPORTANT.

```swift
enum Status: Int {
    case success = 200
    case notFound = 404
}
```

Create enum from number:

```swift
let code = Status(rawValue: 200)

print(code)
```

Output:

```text
Optional(success)
```

---

## Why Optional?

Because value may not exist.

Example:

```swift
Status(rawValue: 500)
```

No matching case exists.

So:

```text
nil
```

---

## Real Production Examples

### 1. HTTP Status Codes

```swift
enum HTTPStatus: Int {
    case success = 200
    case notFound = 404
    case serverError = 500
}
```

---

### 2. API Methods

```swift
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
```

---

### 3. App Environment

```swift
enum Environment: String {
    case development
    case staging
    case production
}
```

---

## IMPORTANT INTERVIEW QUESTION

## Raw Value vs Associated Value

### Raw Value

Fixed.

```swift
enum Direction: String {
    case north = "N"
}
```

Always same.

---

### Associated Value

Dynamic.

```swift
enum Result {
    case success(String)
}
```

Can change every time.

---

## Can We Use Both Together?

❌ No

You cannot mix:

* raw values
* associated values

in same enum.

---

## Example Invalid Enum

```swift
enum Test: Int {
    case success(String)
}
```

❌ Invalid

---

## Another Important Question

## Is Raw Value Stored in Memory?

Yes, but:

* compiler manages it efficiently
* raw values are predefined constants

---

## When NOT to Use Raw Values

If values change dynamically:

❌ Bad:

```swift
enum Response: String {
    case success = "User Loaded"
}
```

Use associated values instead:

✅

```swift
enum Response {
    case success(String)
}
```

---

## Mental Model

```text
enum X: Int
```

Means:

> "Every enum case has a fixed integer identity."

---

## Quick Practice

### Example 1

```swift
enum Priority: Int {
    case low = 1
    case medium
    case high
}

print(Priority.high.rawValue)
```

Predict output.

Answer:

```text
3
```

---

### Example 2

```swift
enum Fruit: String {
    case apple
    case mango
}

print(Fruit.apple.rawValue)
```

Output:

```text
apple
```

---

## Final Summary

Use raw value types when:

* each case needs a fixed predefined value
* mapping to external data/API/database
* serialization needed
* readable representation useful

Most common:

* `Int`
* `String`

These are extremely common in professional iOS development.

