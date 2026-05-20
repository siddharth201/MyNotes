This example shows one of the most useful real-world uses of **Property Wrappers** in Swift — automatically controlling or validating values.

Here, the `@Clamped` property wrapper ensures that a value always stays inside a fixed range.

In this case:

* minimum allowed value = `1`
* maximum allowed value = `5`

So even if someone tries:

```swift
p.rating = 10
```

the wrapper automatically changes it to:

```swift
5
```

---

# Step-by-Step Explanation

---

# 1. Property Wrapper Declaration

```swift
@propertyWrapper
struct Clamped {
```

`@propertyWrapper` tells Swift:

> “This type can control how another property stores and updates its value.”

So `Clamped` becomes reusable behavior.

---

# 2. Stored Properties Inside Wrapper

```swift
private var value: Int
let min: Int
let max: Int
```

These are internal properties of the wrapper.

---

## `value`

```swift
private var value: Int
```

This is the actual stored value.

It is `private` because users should not directly modify it.

---

## `min` and `max`

```swift
let min: Int
let max: Int
```

These store the allowed range.

Example:

```swift
@Clamped(min: 1, max: 5)
```

means:

```swift
min = 1
max = 5
```

---

# 3. wrappedValue

This is the MOST IMPORTANT part.

```swift
var wrappedValue: Int {
```

Every property wrapper MUST provide a `wrappedValue`.

Swift uses this property as the actual value users interact with.

---

# Getter

```swift
get { value }
```

When you read:

```swift
print(p.rating)
```

Swift internally does:

```swift
p._rating.wrappedValue
```

which returns:

```swift
value
```

---

# Setter

```swift
set {
    value = Swift.max(min, Swift.min(max, newValue))
}
```

This controls what happens when someone assigns a value.

Example:

```swift
p.rating = 10
```

Here:

```swift
newValue = 10
```

Now look carefully:

---

# Core Clamping Logic

```swift
Swift.min(max, newValue)
```

This prevents values above maximum.

Example:

```swift
Swift.min(5, 10)
```

Result:

```swift
5
```

---

Then:

```swift
Swift.max(min, result)
```

Prevents values below minimum.

Example:

```swift
Swift.max(1, 5)
```

Result:

```swift
5
```

Final stored value:

```swift
5
```

---

# Visual Flow

If user sets:

```swift
p.rating = 10
```

Then:

```swift
min = 1
max = 5
newValue = 10
```

Step 1:

```swift
Swift.min(5, 10)
= 5
```

Step 2:

```swift
Swift.max(1, 5)
= 5
```

Stored:

```swift
value = 5
```

---

# 4. Initializer

```swift
init(wrappedValue: Int, min: Int, max: Int)
```

This initializer is automatically used when you write:

```swift
@Clamped(min: 1, max: 5)
var rating = 3
```

Swift converts it internally into something like:

```swift
_rating = Clamped(
    wrappedValue: 3,
    min: 1,
    max: 5
)
```

---

# Inside Initializer

```swift
self.min = min
self.max = max
```

Stores allowed range.

---

# Initial Value Also Gets Clamped

```swift
self.value = Swift.max(min, Swift.min(max, wrappedValue))
```

This is important.

Even the starting value gets validated.

Example:

```swift
@Clamped(min: 1, max: 5)
var rating = 100
```

would become:

```swift
5
```

automatically.

---

# Usage

```swift
struct Product {

    @Clamped(min: 1, max: 5)
    var rating = 3
}
```

---

# What Swift Generates Internally

Swift approximately converts this into:

```swift
struct Product {

    private var _rating = Clamped(
        wrappedValue: 3,
        min: 1,
        max: 5
    )

    var rating: Int {
        get { _rating.wrappedValue }
        set { _rating.wrappedValue = newValue }
    }
}
```

This is the MOST IMPORTANT thing to understand about property wrappers.

---

# Testing

```swift
var p = Product()

p.rating = 10

print(p.rating)
```

---

# What Happens Internally

## Assignment

```swift
p.rating = 10
```

calls:

```swift
wrappedValue setter
```

which clamps value to `5`.

---

## Reading

```swift
print(p.rating)
```

calls:

```swift
wrappedValue getter
```

returns:

```swift
5
```

---

# Output

```swift
5
```

---

# More Examples

---

# Example 1 — Below Minimum

```swift
p.rating = -20
print(p.rating)
```

Flow:

```swift
min(5, -20) = -20
max(1, -20) = 1
```

Output:

```swift
1
```

---

# Example 2 — Inside Range

```swift
p.rating = 4
```

Flow:

```swift
min(5, 4) = 4
max(1, 4) = 4
```

Output:

```swift
4
```

---

# Why This Is Powerful

Without property wrappers, you'd repeatedly write validation logic everywhere:

```swift
if rating > 5 {
    rating = 5
}
```

Property wrappers centralize that logic once and reuse it everywhere.

---

# Real-World Uses of This Pattern

This pattern is VERY common in app development.

Examples:

* Ratings (1–5)
* Volume (0–100)
* Brightness
* Age limits
* Progress percentage
* Input validation
* Form fields
* API sanitization

---

# Full Runnable Example

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

struct Product {

    @Clamped(min: 1, max: 5)
    var rating = 3
}

var p = Product()

print(p.rating)

p.rating = 10
print(p.rating)

p.rating = -100
print(p.rating)

p.rating = 4
print(p.rating)
```

Output:

```swift
3
5
1
4
```


## Q. 
