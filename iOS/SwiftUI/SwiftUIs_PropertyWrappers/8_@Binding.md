
In **SwiftUI**, `@Binding` is a property wrapper that creates a two-way connection to a value owned somewhere else.

It allows a child view to:

* read a value
* modify the value

without owning the state itself.

---

## Core Idea

`@State` owns the data.

`@Binding` borrows access to that data.

---

## Most Important Mental Model

### `@State`

```text id="gm1h4q"
SOURCE OF TRUTH
```

---

### `@Binding`

```text id="zjlwm9"
REFERENCE TO THAT TRUTH
```

---

## Basic Example

---

## Parent Owns State

```swift id="3n6clt"
struct ParentView: View {

    @State private var isOn = false

    var body: some View {

        ChildView(isOn: $isOn)
    }
}
```

---

## Child Uses Binding

```swift id="djlwm9"
struct ChildView: View {

    @Binding var isOn: Bool

    var body: some View {

        Toggle("Switch", isOn: $isOn)
    }
}
```

---

## What `$isOn` Means

This is VERY important.

```swift id="jlwm93"
$isOn
```

means:

> “Pass a binding/reference to the state.”

While:

```swift id="jlwm94"
isOn
```

means:

> “Pass the actual value.”

---

## Internal Flow

```text id="jlwm95"
Parent owns @State
        ↓
Binding created using $
        ↓
Child receives @Binding
        ↓
Child changes value
        ↓
Parent state updates
        ↓
UI refreshes everywhere
```

---

## Why `@Binding` Exists

Without `@Binding`, child views cannot modify parent state directly.

Example WITHOUT binding:

```swift id="jlwm96"
struct ChildView {

    var isOn: Bool
}
```

This only copies value.

Child changes do NOT affect parent.

---

## With `@Binding`

Child gets direct mutable access.

So:

```swift id="jlwm97"
isOn.toggle()
```

updates parent’s original state.

---

## Real Working Example

```swift id="jlwm98"
import SwiftUI

struct ParentView: View {

    @State private var username = ""

    var body: some View {

        VStack(spacing: 20) {

            Text("Username: \(username)")

            ChildView(username: $username)
        }
        .padding()
    }
}

struct ChildView: View {

    @Binding var username: String

    var body: some View {

        TextField("Enter name", text: $username)
            .textFieldStyle(.roundedBorder)
    }
}
```

Typing in child updates parent automatically.

---

## Important Distinction

### `@Binding` does NOT own data

It only references existing state.

That means:

* no storage
* no lifecycle management
* no persistence

---

## Visual Ownership

```text id="jlwm99"
ParentView
    └── @State owns data
              ↓
        ChildView
            └── @Binding references data
```

---

## Internal Understanding

Conceptually:

```swift id="jlwm9a"
@Binding var count: Int
```

is similar to:

```swift id="jlwm9b"
get value
set value
```

A two-way getter/setter connection.

---

## How SwiftUI Creates Binding

From:

```swift id="jlwm9c"
@State private var count = 0
```

SwiftUI automatically creates:

* value:

```swift id="jlwm9d"
count
```

* binding:

```swift id="jlwm9e"
$count
```

---

## Why `$` Is Used

```swift id="jlwm9f"
$count
```

means:

> “Give me a Binding<Int> instead of Int.”

---

## Example Without UI Controls

```swift id="jlwm9g"
struct ParentView: View {

    @State private var score = 0

    var body: some View {

        ChildView(score: $score)
    }
}

struct ChildView: View {

    @Binding var score: Int

    var body: some View {

        Button("Increase") {
            score += 1
        }
    }
}
```

Pressing button changes parent state.

---

## Important Difference

| `@State`        | `@Binding`            |
| --------------- | --------------------- |
| Owns value      | References value      |
| Creates storage | No storage            |
| Source of truth | Linked access         |
| Local state     | Shared mutable access |

---

## Real Mental Model

### `@State`

> “This data belongs to me.”

---

### `@Binding`

> “I can modify someone else’s data.”

---

## Another Important Detail

Bindings can chain through many views.

```text id="jlwm9h"
Parent @State
    ↓
Child @Binding
    ↓
GrandChild @Binding
```

Still same underlying state.

---

## Custom Binding Example (Advanced)

You can create bindings manually:

```swift id="jlwm9i"
Binding(
    get: { self.isEnabled },
    set: { self.isEnabled = $0 }
)
```

Very useful in advanced SwiftUI architecture.

---

## Most Asked Interview Questions

### 1. What is `@Binding`?

A property wrapper that creates a two-way connection to state owned elsewhere.

---

### 2. Does `@Binding` own data?

No.

It only references existing data.

---

### 3. What does `$` mean in SwiftUI?

It accesses the binding version of a property.

Example:

```swift id="jlwm9j"
$count
```

creates `Binding<Int>`.

---

### 4. Difference between `@State` and `@Binding`?

| `@State`              | `@Binding`         |
| --------------------- | ------------------ |
| Owns state            | Borrows state      |
| Local source of truth | Two-way connection |

---

### 5. Can child modify parent state using `@Binding`?

Yes.

That is its main purpose.

---

## Easy Memory Trick

```text id="jlwm9k"
@State
    = I OWN the value

@Binding
    = I BORROW the value
```

That single line explains almost everything about `@Binding`.

