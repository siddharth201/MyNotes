This is one of the MOST useful real-world examples of Property Wrappers in Swift.

It allows you to read/write `UserDefaults` automatically without repeatedly writing boilerplate code.

Instead of this everywhere:

```swift id="5m8d9x"
UserDefaults.standard.set(true, forKey: "isLoggedIn")
```

and:

```swift id="fsjlwm"
UserDefaults.standard.bool(forKey: "isLoggedIn")
```

you can simply write:

```swift id="8k7i9u"
Settings.isLoggedIn = true
```

which is MUCH cleaner.

---

## First Understand the Problem

Normally with `UserDefaults`:

```swift id="z8k61v"
UserDefaults.standard.set(true, forKey: "isLoggedIn")
```

Reading:

```swift id="ihh4tq"
let value = UserDefaults.standard.bool(forKey: "isLoggedIn")
```

This becomes repetitive and error-prone in large apps.

Problems:

* repeating keys
* typo mistakes
* boilerplate code
* difficult maintenance
* inconsistent defaults

Property wrappers solve this elegantly.

---

## Full Wrapper

```swift id="r2z1w3"
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

---

## Step-by-Step Explanation

---

## 1. Generic Wrapper

```swift id="a4p7v2"
struct UserDefault<T>
```

`<T>` means this wrapper works with ANY type.

Examples:

* `Bool`
* `String`
* `Int`
* `Double`
* `[String]`

etc.

---

## Example

```swift id="t3j7r1"
@UserDefault(key: "username", defaultValue: "")
static var username: String
```

Here:

```swift id="1i6m7z"
T = String
```

---

## 2. Stored Properties

```swift id="7o8d2w"
let key: String
let defaultValue: T
```

---

### key

Stores UserDefaults key.

Example:

```swift id="q6k2vn"
"isLoggedIn"
```

---

### defaultValue

Returned if value doesn't exist in UserDefaults.

Example:

```swift id="vv7c0x"
false
```

---

## 3. wrappedValue

This is what users interact with.

```swift id="3h6m9p"
var wrappedValue: T
```

---

## Getter

```swift id="g1q7zc"
get {
    UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
}
```

---

## What Happens Here

Suppose:

```swift id="upx5vn"
Settings.isLoggedIn
```

Swift internally does:

```swift id="f3w6yk"
UserDefaults.standard.object(forKey: "isLoggedIn")
```

---

## Case 1 — Value Exists

Suppose stored value:

```swift id="6s7e2p"
true
```

then:

```swift id="v8f9la"
as? T
```

casts it to correct type.

Result:

```swift id="73e4rk"
true
```

---

## Case 2 — Value Doesn't Exist

If nothing stored:

```swift id="09m8xe"
nil
```

Then:

```swift id="8l1m5y"
?? defaultValue
```

returns:

```swift id="h5q8tn"
false
```

---

## Setter

```swift id="u7x3kw"
set {
    UserDefaults.standard.set(newValue, forKey: key)
}
```

When you do:

```swift id="j6p2sf"
Settings.isLoggedIn = true
```

Swift internally calls:

```swift id="v2m8da"
wrappedValue setter
```

which becomes:

```swift id="0c7yfw"
UserDefaults.standard.set(true, forKey: "isLoggedIn")
```

---

## Usage

```swift id="g8m1vk"
struct Settings {

    @UserDefault(key: "isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
}
```

---

## What Swift Generates Internally

Approximately:

```swift id="d4q7mc"
struct Settings {

    private static var _isLoggedIn =
        UserDefault<Bool>(
            key: "isLoggedIn",
            defaultValue: false
        )

    static var isLoggedIn: Bool {

        get { _isLoggedIn.wrappedValue }

        set { _isLoggedIn.wrappedValue = newValue }
    }
}
```

This transformation is the CORE of understanding property wrappers.

---

## Usage Example

```swift id="5v3zqk"
Settings.isLoggedIn = true

print(Settings.isLoggedIn)
```

Output:

```swift id="9p2wxe"
true
```

Even after app restart, value persists because `UserDefaults` stores it on disk.

---

## Why `static`?

```swift id="e1z7yr"
static var isLoggedIn
```

means you can access it globally:

```swift id="kp8w0n"
Settings.isLoggedIn
```

without creating:

```swift id="n4m6cv"
Settings()
```

---

## Real Production Usage

This pattern is EXTREMELY common in iOS apps.

Examples:

* Login state
* Theme mode
* User token
* App language
* Onboarding completion
* Notifications enabled
* Dark mode
* Last sync date

---

## Real App Example

```swift id="5y2rpn"
struct AppStorageKeys {

    @UserDefault(key: "username", defaultValue: "")
    static var username: String

    @UserDefault(key: "isPremium", defaultValue: false)
    static var isPremium: Bool

    @UserDefault(key: "launchCount", defaultValue: 0)
    static var launchCount: Int
}
```

Usage:

```swift id="8m3qtl"
AppStorageKeys.username = "Siddharth"

print(AppStorageKeys.username)
```

---

## Important Limitation

This generic version works well for property-list-compatible types:

✅ Supported:

* String
* Bool
* Int
* Double
* Array
* Dictionary
* Data

---

## Custom Objects?

This WON'T work automatically:

```swift id="u2n6yd"
struct User {
    let name: String
}
```

because `UserDefaults` cannot directly store custom structs.

---

## Production-Ready Improvement

Real apps usually use:

* `Codable`
* JSONEncoder
* JSONDecoder

to store custom objects.

Example:

```swift id="5k8mvr"
struct User: Codable {
    let name: String
}
```

Then encode/decode automatically.

---

## Relation With SwiftUI `@AppStorage`

SwiftUI already provides a built-in version:

```swift id="9f2mwa"
@AppStorage("isLoggedIn")
var isLoggedIn = false
```

Your wrapper is essentially a simplified custom implementation of that idea.

---

## Why Learn This If `@AppStorage` Exists?

Because this teaches:

* how property wrappers actually work
* how Swift transforms wrappers internally
* how frameworks like SwiftUI are built

This is VERY valuable for senior iOS interviews.

---

## Full Runnable Example

```swift id="6h1vpk"
import Foundation

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

struct Settings {

    @UserDefault(
        key: "isLoggedIn",
        defaultValue: false
    )
    static var isLoggedIn: Bool
}

print(Settings.isLoggedIn)

Settings.isLoggedIn = true

print(Settings.isLoggedIn)
```

Output:

```swift id="r6m8ya"
false
true
```  

## Q. in this example we have not use `init(wrappedValue: )` why?  

[Answer](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/PropertyWrapper_init_Explaination.md)

