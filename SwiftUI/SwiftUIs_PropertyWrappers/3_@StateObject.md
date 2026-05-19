In **SwiftUI**, `@StateObject` is a property wrapper used to create and own an observable reference-type object inside a view.

It is mainly used with classes conforming to `ObservableObject`.

---

## Why `@StateObject` Exists

`@State` works best with value types (`String`, `Int`, structs).

But many real apps need:

* shared mutable data
* reference types (classes)
* complex business logic
* network/data models

For that, SwiftUI provides:

```swift id="65exyn"
ObservableObject
```

and

```swift id="0mt2lc"
@StateObject
```

---

## Basic Example

### Step 1 — Create Observable Object

```swift id="v8xz3m"
import SwiftUI

class CounterViewModel: ObservableObject {

    @Published var count = 0

    func increment() {
        count += 1
    }
}
```

---

### Step 2 — Use `@StateObject`

```swift id="e4nwjq"
struct ContentView: View {

    @StateObject private var viewModel = CounterViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text("Count: \(viewModel.count)")
                .font(.largeTitle)

            Button("Increment") {
                viewModel.increment()
            }
        }
    }
}
```

---

## What Happens Internally

When you write:

```swift id="o3fjmt"
@StateObject private var viewModel = CounterViewModel()
```

SwiftUI:

1. Creates the object ONCE
2. Stores it persistently
3. Keeps it alive across view reloads
4. Observes changes from `@Published`
5. Refreshes UI automatically

---

## Why Not Use Normal Variable?

This is BAD:

```swift id="m5wq7q"
var viewModel = CounterViewModel()
```

Because SwiftUI recreates views frequently.

So the object would also recreate repeatedly:

* data resets
* state lost
* unnecessary memory work

---

## Why Not Use `@State`?

You technically can:

```swift id="6dd9lk"
@State private var vm = CounterViewModel()
```

BUT:

* SwiftUI only tracks object reference changes
* NOT internal property changes

So this:

```swift id="0r37ef"
vm.count += 1
```

would NOT refresh UI automatically.

---

## How `@Published` Works

Inside `ObservableObject`:

```swift id="nzwv4l"
@Published var count = 0
```

means:

> “Notify SwiftUI whenever this property changes.”

So changing `count` triggers UI updates.

---

## Ownership Rule (VERY Important)

### `@StateObject`

Use when:

* THIS view creates the object
* THIS view owns the object lifecycle

Think:

> “I am responsible for creating and keeping this object alive.”

---

## Difference Between `@StateObject` and `@ObservedObject`

| Property Wrapper  | Ownership                       |
| ----------------- | ------------------------------- |
| `@StateObject`    | Creates & owns object           |
| `@ObservedObject` | Observes object owned elsewhere |

---

## Visual Example

### Parent owns object

```swift id="6vb4yw"
struct ParentView: View {

    @StateObject private var vm = CounterViewModel()

    var body: some View {
        ChildView(viewModel: vm)
    }
}
```

---

### Child observes object

```swift id="vx7w3u"
struct ChildView: View {

    @ObservedObject var viewModel: CounterViewModel

    var body: some View {
        Text("\(viewModel.count)")
    }
}
```

---

## Most Important Interview Point

### Why was `@StateObject` introduced?

Before iOS 14, developers used only `@ObservedObject`.

Problem:

* objects recreated repeatedly
* lifecycle issues
* data resets

`@StateObject` solves ownership and persistence problems.

---

## Lifecycle Difference

### `@ObservedObject`

```swift id="8frsjm"
@ObservedObject var vm = CounterViewModel()
```

BAD because:

* object may recreate during redraws

---

### `@StateObject`

```swift id="v2x7mh"
@StateObject var vm = CounterViewModel()
```

GOOD because:

* object created once
* survives redraws

---

## Real Mental Model

### `@State`

Stores:

* simple VALUE data

### `@StateObject`

Stores:

* observable REFERENCE objects

---

## Common SwiftUI Data Flow

```text
@StateObject  → source of truth
       ↓
@ObservedObject → shared observer
       ↓
@Binding → direct mutable connection
```

---

## Interview Questions

### 1. Difference between `@State` and `@StateObject`

| `@State`        | `@StateObject`     |
| --------------- | ------------------ |
| Value types     | Reference types    |
| Local state     | Observable objects |
| No `@Published` | Uses `@Published`  |
| Simple data     | Complex app state  |

---

### 2. When should you use `@StateObject`?

When a view creates and owns an `ObservableObject`.

---

### 3. What happens if you use `@ObservedObject` incorrectly for ownership?

The object may recreate whenever the view reloads.

---

### 4. Does `@StateObject` survive view redraws?

Yes.

That is its main purpose.

---

## Complete Working Example

```swift id="pahxdu"
import SwiftUI

class UserSettings: ObservableObject {

    @Published var username = "Siddharth"

    func changeName() {
        username = "SwiftUI Learner"
    }
}

struct ContentView: View {

    @StateObject private var settings = UserSettings()

    var body: some View {

        VStack(spacing: 20) {

            Text(settings.username)
                .font(.title)

            Button("Change Name") {
                settings.changeName()
            }
        }
        .padding()
    }
}
```

When button is tapped:

* `username` changes
* `@Published` emits update
* SwiftUI refreshes body automatically

