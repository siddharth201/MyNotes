In Swift, **Property Wrappers** are a feature that lets you add **custom behavior to properties** in a reusable way.

Instead of repeating logic like:

* validation
* formatting
* clamping values
* UserDefaults storage
* logging
* lazy loading

you can wrap that logic inside a reusable wrapper.

---

## Basic Idea

A property wrapper is a type marked with:

```swift
@propertyWrapper
```

It must contain at least:

```swift
var wrappedValue
```

---

## Real World Analogy

Suppose you have a water bottle.

* The **water** = actual property value
* The **bottle** = wrapper around it

The bottle can:

* filter water
* control temperature
* limit quantity

Similarly, Property Wrapper controls how value is stored/accessed.

---

## Basic Syntax

```swift
@propertyWrapper
struct WrapperName {

    private var value: Int

    var wrappedValue: Int {
        get { value }
        set { value = newValue }
    }

    init(wrappedValue: Int) {
        self.value = wrappedValue
    }
}
```

Usage:

```swift
@WrapperName var score = 10
```

---

## Example 1 — Prevent Negative Values

This is the most common beginner example.

---

## Without Property Wrapper

```swift
struct User {

    private var _age: Int = 0

    var age: Int {
        get { _age }
        set {
            _age = max(0, newValue)
        }
    }
}
```

Problem:

* repetitive code
* not reusable

---

# With Property Wrapper

```swift
@propertyWrapper
struct NonNegative {

    private var value: Int

    var wrappedValue: Int {
        get {
            value
        }
        set {
            value = max(0, newValue)
        }
    }

    init(wrappedValue: Int) {
        self.value = max(0, wrappedValue)
    }
}
```

Usage:

```swift
struct User {

    @NonNegative var age: Int = 18
}
```

Testing:

```swift
var user = User()

user.age = 25
print(user.age)
```

Output:

```swift
25
```

Now:

```swift
user.age = -10
print(user.age)
```

Output:

```swift
0
```

---

# How Swift Internally Converts This

Swift approximately converts:

```swift
@NonNegative var age = 18
```

into:

```swift
private var _age = NonNegative(wrappedValue: 18)

var age: Int {
    get { _age.wrappedValue }
    set { _age.wrappedValue = newValue }
}
```

VERY IMPORTANT for interviews.

---

# Understanding `wrappedValue`

This is the actual value you access.

Example:

```swift
user.age
```

actually accesses:

```swift
_age.wrappedValue
```

---

# Example 2 — Limit Value Range

Suppose rating should always stay between 1 and 5.

```swift
@propertyWrapper
struct Clamped {

    private var value: Int
    let min: Int
    let max: Int

    var wrappedValue: Int {
        get { value }
        set {
            value = Swift.max(min, Swift.min(max, newValue))
        }
    }

    init(wrappedValue: Int, min: Int, max: Int) {
        self.min = min
        self.max = max

        self.value = Swift.max(min, Swift.min(max, wrappedValue))
    }
}
```

Usage:

```swift
struct Product {

    @Clamped(min: 1, max: 5)
    var rating = 3
}
```

Testing:

```swift
var p = Product()

p.rating = 10

print(p.rating)
```

Output:

```swift
5
```  

[Explaination](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/PropertyWrapper_Explanation.md)

---

# Parameterized Property Wrapper

Notice this:

```swift
@Clamped(min: 1, max: 5)
```

means wrapper accepts custom parameters.

This is heavily asked in interviews.

---

# Example 3 — Debug Printing

```swift
@propertyWrapper
struct Debuggable<T> {

    private var value: T

    var wrappedValue: T {
        get {
            print("Getting value")
            return value
        }
        set {
            print("Setting value to \(newValue)")
            value = newValue
        }
    }

    init(wrappedValue: T) {
        self.value = wrappedValue
    }
}
```

Usage:

```swift
struct Employee {

    @Debuggable var salary = 5000
}
```

---

# Generic Property Wrapper

Notice:

```swift
struct Debuggable<T>
```

This means wrapper works with:

* Int
* String
* Bool
* custom types

---

# Example 4 — UserDefaults Wrapper (REAL Production Use)

Very important practical use.

```swift
@propertyWrapper
struct UserDefault<T> {

    let key: String
    let defaultValue: T

    var wrappedValue: T {

        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }

        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
```

Usage:

```swift
struct Settings {

    @UserDefault(key: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
}
```

Now:

```swift
Settings.isLoggedIn = true
```

Automatically stores in UserDefaults.  

## Explaination:
[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/PropertyWrapper_UserDefaults_Explanation.md)

---

# projectedValue (`$property`)

Property wrappers can expose extra functionality using:

```swift
projectedValue
```

Accessed using:

```swift
$property
```

---

# Example

```swift
@propertyWrapper
struct Capitalized {

    private var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }

    var projectedValue: Int {
        value.count
    }
}
```

Usage:

```swift
struct Person {

    @Capitalized var city: String
}
```

Testing:

```swift
var p = Person(city: "delhi")

print(p.city)
```

Output:

```swift
Delhi
```

Now:

```swift
print(p.$city)
```

Output:

```swift
5
```

Because:

```swift
projectedValue -> value.count
```

---

# Important Concepts

---

# 1. `wrappedValue`

Actual stored/accessed value.

Mandatory.

---

# 2. `projectedValue`

Extra helper functionality.

Accessed using `$`.

Optional.

---

# 3. Generic Wrappers

Reusable for any type.

```swift
Wrapper<T>
```

---

# 4. Parameterized Wrappers

Accept custom arguments.

```swift
@Clamped(min:max:)
```

---

# 5. Backing Storage

Swift creates hidden storage:

```swift
_propertyName
```

Example:

```swift
_age
```

---

# Most Common Built-in Property Wrappers

SwiftUI uses property wrappers heavily.

| Wrapper           | Purpose                 |
| ----------------- | ----------------------- |
| `@State`          | Local mutable state     |
| `@Binding`        | Two-way binding         |
| `@ObservedObject` | Observe external object |
| `@Environment`    | Read shared environment |
| `@AppStorage`     | UserDefaults binding    |
| `@Published`      | Notify changes          |

---

# Why Property Wrappers are Powerful

Without wrappers:

```swift
validation code repeated everywhere
```

With wrappers:

```swift
reusable reusable reusable
```

This improves:

* clean architecture
* reusability
* separation of concerns
* maintainability

---

# Interview Definition

> Property Wrapper is a Swift feature that allows us to encapsulate reusable property-related logic like validation, formatting, persistence, or observation into a separate reusable type using `@propertyWrapper`.

---

# Common Interview Questions

---

## Q1. Difference between Computed Property and Property Wrapper?

| Computed Property        | Property Wrapper             |
| ------------------------ | ---------------------------- |
| Local logic              | Reusable logic               |
| Repeated manually        | Write once use everywhere    |
| Specific to one property | Generic reusable abstraction |

---

## Q2. What is `wrappedValue`?

The actual value exposed by wrapper.

Mandatory in every wrapper.

---

## Q3. What is `projectedValue`?

Additional helper value exposed using `$property`.

---

## Q4. How does Swift internally store wrapped properties?

Using hidden backing storage:

```swift
_property
```

---

## Q5. Can Property Wrappers be Generic?

Yes.

```swift
@propertyWrapper
struct Wrapper<T>
```

---

# Complete Working Example

```swift
@propertyWrapper
struct Uppercase {

    private var value: String = ""

    var wrappedValue: String {

        get { value }

        set {
            value = newValue.uppercased()
        }
    }

    init(wrappedValue: String) {
        self.value = wrappedValue.uppercased()
    }
}

struct User {

    @Uppercase var name: String
}

var user = User(name: "siddharth")

print(user.name)
```

Output:

```swift
SIDDHARTH
```

---

# When to Use Property Wrappers

Use when:

* logic repeats across properties
* validation needed
* formatting needed
* persistence needed
* logging/debugging needed
* dependency injection needed

Avoid when:

* logic is too specific
* simple computed property is enough

---

# Mental Model

Think:

```swift
@propertyWrapper
```

means:

> “Intercept every read/write of this property.”  

## Property Wrapper MindMap
![Property Wrapper MindMap](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Images/PropertyWrapper_1.png)   

 

## Property Wrapper Visualize
![Property Wrapper](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Images/propertyWrapper_2.png)

