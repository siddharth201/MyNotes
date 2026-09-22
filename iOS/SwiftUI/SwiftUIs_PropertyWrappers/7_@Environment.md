
In **SwiftUI**, `@Environment` is a property wrapper used to read values provided by SwiftUI’s environment system.

It gives views access to:

* system values
* app-wide configuration
* contextual information

without manually passing data through initializers.

---

## Core Idea

SwiftUI maintains a giant shared dictionary-like system called the **Environment**.

Views can read values from it using:

```swift id="6wdn6o"
@Environment
```

Examples:

* color scheme (light/dark)
* locale/language
* dismiss action
* dynamic type size
* layout direction
* scene phase

---

## Basic Example

### Detect Dark Mode

```swift id="gk7dh3"
import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
    }
}
```

---

## What Is `\.colorScheme`?

This is called a **KeyPath**.

SwiftUI stores environment values using keys.

Example:

```swift id="6y8tfc"
\.colorScheme
```

means:

> “Read the color scheme value from the environment.”

---

## How It Works Internally

```text id="uxxvnl"
SwiftUI Environment
      ↓
Contains values
      ↓
@Environment reads them
      ↓
View updates automatically when value changes
```

---

## Important Difference

### `@Environment`

Reads SIMPLE contextual values.

Examples:

* dark/light mode
* locale
* dismiss action

---

### `@EnvironmentObject`

Reads SHARED observable objects.

Examples:

* user session
* cart manager
* theme manager

---

## Common Environment Values

---

### 1. Color Scheme

```swift id="gptj8k"
@Environment(\.colorScheme) var colorScheme
```

---

### 2. Dismiss View

```swift id="w5avc5"
@Environment(\.dismiss) var dismiss
```

Usage:

```swift id="54kj6x"
Button("Close") {
    dismiss()
}
```

---

### 3. Scene Phase

```swift id="h5fd4x"
@Environment(\.scenePhase) var scenePhase
```

Detect:

* active
* inactive
* background

---

### 4. Locale

```swift id="8rgrdq"
@Environment(\.locale) var locale
```

---

### 5. Dynamic Type Size

```swift id="85kgw8"
@Environment(\.dynamicTypeSize) var size
```

---

## Complete Example

```swift id="iqx8ek"
import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var body: some View {

        VStack(spacing: 20) {

            Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")

            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
```

---

## Important Concept

`@Environment` values are automatically updated.

Example:

* user switches device to dark mode
* `colorScheme` changes
* SwiftUI refreshes affected views

---

## Custom Environment Values

You can even create your own environment keys.

Example:

```swift id="0i7k0e"
struct UsernameKey: EnvironmentKey {

    static let defaultValue = "Guest"
}
```

Then extend:

```swift id="a1o1kr"
extension EnvironmentValues {

    var username: String {
        get { self[UsernameKey.self] }
        set { self[UsernameKey.self] = newValue }
    }
}
```

Usage:

```swift id="jlwm8v"
@Environment(\.username) var username
```

This is more advanced SwiftUI architecture.

---

## Difference Between `@Environment` and `@EnvironmentObject`

| `@Environment`               | `@EnvironmentObject`     |
| ---------------------------- | ------------------------ |
| Reads lightweight values     | Reads observable objects |
| Value-based                  | Object-based             |
| Uses key paths               | Uses type matching       |
| System/configuration focused | Shared app state focused |

---

## Visual Understanding

### `@Environment`

```text id="c8i38l"
Environment
   ├── colorScheme
   ├── locale
   ├── dismiss
   └── scenePhase
```

Views read individual values.

---

### `@EnvironmentObject`

```text id="1u2nko"
Environment
   └── Shared ObservableObject
```

Views read entire observable object.

---

## Very Important Interview Point

`@Environment` is dependency injection for contextual values.

SwiftUI automatically propagates environment values down the view hierarchy.

---

## Another Important Detail

Environment values flow:

```text id="jjlwm8"
Parent → Child → GrandChild
```

Children inherit environment automatically.

---

## Example of Overriding Environment

```swift id="o76rtw"
ContentView()
    .environment(\.locale, Locale(identifier: "fr"))
```

Now child views use French locale.

---

## Most Asked Interview Questions

### 1. What is `@Environment`?

A property wrapper used to read values from SwiftUI’s environment system.

---

### 2. Difference between `@Environment` and `@EnvironmentObject`?

| `@Environment` | `@EnvironmentObject` |
| -------------- | -------------------- |
| Simple values  | Observable objects   |
| KeyPath lookup | Type-based lookup    |

---

### 3. Does `@Environment` refresh UI automatically?

Yes, when environment values change.

---

### 4. Can we create custom environment values?

Yes, using `EnvironmentKey`.

---

### 5. Is `@Environment` used for dependency injection?

Yes — contextual dependency injection.

---

## Easy Memory Trick

```text id="lnjlwm"
@Environment
    = read app/system SETTINGS

@EnvironmentObject
    = read shared app DATA
```

That distinction is extremely useful in SwiftUI architecture.

