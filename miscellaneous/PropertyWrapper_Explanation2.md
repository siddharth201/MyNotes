

`wrappedValue` is **special** in Property Wrappers.

It is **not just a random placeholder name**.

For property wrappers, Swift expects:

```swift id="g3k6c5"
init(wrappedValue:)
```

or

```swift id="on58q6"
init(wrappedValue:otherParameters...)
```

if you want to support this syntax:

```swift id="qqq6xg"
@Clamped(min: 1, max: 5)
var rating = 3
```

---

## Why `wrappedValue` Is Special

When Swift sees:

```swift id="wj8py8"
var rating = 3
```

inside a property wrapper declaration, the initial value (`3`) is automatically passed into:

```swift id="a8yq5z"
init(wrappedValue:)
```

So Swift specifically looks for the parameter label:

```swift id="5b2xpk"
wrappedValue
```

---

## Your Example

```swift id="w4e4v0"
init(wrappedValue: Int, min: Int, max: Int)
```

Swift internally does:

```swift id="w8vc34"
Clamped(
    wrappedValue: 3,
    min: 1,
    max: 5
)
```

---

## If You Rename It

Suppose you write:

```swift id="y2h4h3"
init(value: Int, min: Int, max: Int)
```

Now Swift CANNOT connect:

```swift id="5lxkhn"
var rating = 3
```

to the initializer.

So this will fail:

```swift id="kik4s5"
@Clamped(min: 1, max: 5)
var rating = 3
```

You’ll get an error.

---

## Rule

For Property Wrappers:

If you want default property initialization support:

```swift id="h10u7z"
var x = something
```

then initializer parameter MUST be named:

```swift id="6kcrwv"
wrappedValue
```

---

## Valid Forms

### Only wrappedValue

```swift id="jlwm9c"
init(wrappedValue: Int)
```

Usage:

```swift id="v17l7e"
@MyWrapper
var age = 20
```

---

### wrappedValue + Extra Parameters

```swift id="16n4jp"
init(wrappedValue: Int, min: Int, max: Int)
```

Usage:

```swift id="sv0vfp"
@Clamped(min: 1, max: 5)
var rating = 3
```

---

## What Happens Internally

Swift transforms:

```swift id="o5ofm9"
@Clamped(min: 1, max: 5)
var rating = 3
```

into approximately:

```swift id="a4s0jc"
private var _rating = Clamped(
    wrappedValue: 3,
    min: 1,
    max: 5
)
```

That’s why the label matters.

---

## Important Distinction

Inside the function body:

```swift id="1k9m4g"
wrappedValue
```

is just a normal local parameter variable.

BUT the parameter LABEL:

```swift id="63q8na"
wrappedValue:
```

is special to Swift.

---

## Example Showing Error

❌ Wrong:

```swift id="pbzsz9"
@propertyWrapper
struct Test {

    var wrappedValue: Int

    init(value: Int) {
        self.wrappedValue = value
    }
}
```

Usage:

```swift id="l5d6mo"
@Test
var age = 20
```

ERROR because Swift expects:

```swift id="j03iv1"
init(wrappedValue:)
```

---

## Correct Version

✅

```swift id="8tzkfp"
@propertyWrapper
struct Test {

    var wrappedValue: Int

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}
```

Now this works:

```swift id="1n6lce"
@Test
var age = 20
```

---

## Simple Mental Model

Think of:

```swift id="wcc9ly"
wrappedValue
```

as a reserved keyword specifically for Property Wrapper initialization.

