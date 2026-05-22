Excellent observation.

Yes — in this example we did NOT write:

```swift id="ibk9vu"
init(wrappedValue:)
```

and that is completely valid.

Because `wrappedValue` initializer is only needed when the wrapped property itself provides an initial value.

---

## Compare These Two Cases Carefully

---

## Case 1 — Uses `wrappedValue`

Example:

```swift id="j5jq0k"
@Clamped(min: 1, max: 5)
var rating = 3
```

Notice:

```swift id="8iuhlg"
= 3
```

There is an initial wrapped value.

So Swift needs:

```swift id="7z3tza"
init(wrappedValue:)
```

to receive that `3`.

Swift internally does:

```swift id="jlwm81"
Clamped(
    wrappedValue: 3,
    min: 1,
    max: 5
)
```

That’s why the wrapper must implement:

```swift id="vjfrg5"
init(wrappedValue:min:max:)
```

---

## Case 2 — No Initial Wrapped Value

Your `UserDefault` example:

```swift id="d5x3qz"
@UserDefault(key: "isLoggedIn", defaultValue: false)
static var isLoggedIn: Bool
```

Notice carefully:

There is NO:

```swift id="30o8pq"
= someValue
```

So there is no wrapped value to pass.

Swift only needs:

```swift id="wnjlwm"
init(key:defaultValue:)
```

---

## What Swift Internally Generates

Swift approximately converts this into:

```swift id="x64w9q"
private static var _isLoggedIn =
    UserDefault<Bool>(
        key: "isLoggedIn",
        defaultValue: false
    )
```

No `wrappedValue:` needed.

---

## Key Rule

You need:

```swift id="8a6wlm"
init(wrappedValue:)
```

ONLY when the property declaration includes an initial value.

---

## Visual Comparison

---

## Requires `wrappedValue`

```swift id="l52up5"
@MyWrapper
var name = "Siddharth"
```

because:

```swift id="tq35kt"
= "Siddharth"
```

exists.

Swift calls:

```swift id="f6m5ux"
init(wrappedValue:)
```

---

## Does NOT Require `wrappedValue`

```swift id="8uhuhw"
@MyWrapper(key: "username")
var name: String
```

No default assigned.

So Swift calls:

```swift id="zjlwmg"
init(key:)
```

---

## Important Insight

Property wrappers can have MANY kinds of initializers.

Examples:

```swift id="dzg6j8"
init()
```

```swift id="yx7kry"
init(key:)
```

```swift id="1qvs4f"
init(defaultValue:)
```

```swift id="lksfml"
init(wrappedValue:)
```

```swift id="zlv4ev"
init(wrappedValue:key:)
```

Swift chooses initializer based on how the property is declared.

---

## Example Showing Both Styles

```swift id="zg44o2"
@propertyWrapper
struct Example {

    var wrappedValue: Int

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
        print("wrappedValue init")
    }

    init() {
        self.wrappedValue = 0
        print("empty init")
    }
}
```

---

## Usage 1

```swift id="sls7yo"
@Example
var x = 10
```

Calls:

```swift id="0v17x7"
init(wrappedValue:)
```

---

## Usage 2

```swift id="4nuhsx"
@Example
var y: Int
```

Calls:

```swift id="65bnhx"
init()
```

---

## In Your `UserDefault` Example

This:

```swift id="c55cwq"
@UserDefault(key: "isLoggedIn", defaultValue: false)
```

actually calls synthesized memberwise initializer:

```swift id="g0z0mo"
init(key: String, defaultValue: T)
```

because your struct has stored properties:

```swift id="70tvmx"
let key: String
let defaultValue: T
```

Swift automatically generates memberwise initializer.

Equivalent to:

```swift id="8bd1rv"
init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
}
```

even though you didn't write it manually.

---

## SUPER Important Understanding

These two are DIFFERENT:

---

## wrappedValue Property

```swift id="4j5t9g"
var wrappedValue: T
```

REQUIRED for property wrappers.

This defines what value users interact with.

---

## init(wrappedValue:)

Optional initializer.

Only needed when supporting:

```swift id="p3cw7t"
var x = someInitialValue
```

syntax.

---

## Final Mental Model

| Situation                         | Need `init(wrappedValue:)`? |
| --------------------------------- | --------------------------- |
| `@Wrapper var x = 10`             | ✅ Yes                       |
| `@Wrapper var x: Int`             | ❌ No                        |
| `@Wrapper(key: "abc") var x: Int` | ❌ No                        |
| `@Wrapper(key: "abc") var x = 10` | ✅ Yes                       |

