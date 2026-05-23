In **SwiftUI**, `@ObservedObject` is a property wrapper used to observe an external `ObservableObject`.

It tells SwiftUI:

> “This view depends on an observable object owned somewhere else. Refresh this view whenever that object changes.”

---

## Core Idea

`@ObservedObject` does NOT create or own the object.

It only:

* subscribes to updates
* watches `@Published` changes
* refreshes the UI

---

> SwiftUI gives us the @ObservedObject property wrapper so that views can watch the state of an external object, and be notified when something important has changed. It is similar in behavior to @StateObject, except it must not be used to create objects – use @ObservedObject only with objects that have been created elsewhere, otherwise SwiftUI might accidentally destroy the object.

## Basic Example

---

## Step 1 — Observable Object

```swift id="frn5gh"
import SwiftUI

class CounterViewModel: ObservableObject {

    @Published var count = 0

    func increment() {
        count += 1
    }
}
```

---

## Step 2 — Parent Creates Object

```swift id="90s5kf"
struct ParentView: View {

    @StateObject private var vm = CounterViewModel()

    var body: some View {

        ChildView(viewModel: vm)
    }
}
```

---

## Step 3 — Child Observes Object

```swift id="9i5j7l"
struct ChildView: View {

    @ObservedObject var viewModel: CounterViewModel

    var body: some View {

        VStack {

            Text("Count: \(viewModel.count)")

            Button("Increment") {
                viewModel.increment()
            }
        }
    }
}
```

---

## What Happens Internally

When `count` changes:

```swift id="sg85ql"
viewModel.count += 1
```

Flow:

```text id="kncc6v"
@Published changes
        ↓
ObservableObject sends update
        ↓
@ObservedObject receives update
        ↓
SwiftUI refreshes body
```

---

## Most Important Rule

### `@ObservedObject` does NOT own lifecycle

That means:

* object must come from somewhere else
* parent usually owns it using `@StateObject`

---

## Mental Model

### `@StateObject`

> “I create and own the object.”

---

### `@ObservedObject`

> “I observe someone else’s object.”

---

## Very Important Difference

| Wrapper           | Responsibility          |
| ----------------- | ----------------------- |
| `@StateObject`    | Create + own object     |
| `@ObservedObject` | Observe existing object |

---

## Common Beginner Mistake

BAD:

```swift id="i9rztu"
struct ContentView: View {

    @ObservedObject var vm = CounterViewModel()
}
```

Why bad?

Because:

* view recreates frequently
* object may recreate repeatedly
* state resets unexpectedly

---

## Correct Version

```swift id="pmw03y"
@StateObject var vm = CounterViewModel()
```

when the view CREATES the object.

---

## Real Ownership Flow

```text id="zxoqkl"
ParentView
    └── @StateObject
            ↓ passes object
ChildView
    └── @ObservedObject
```

---

## Why SwiftUI Needs `@ObservedObject`

SwiftUI views are structs and recreated often.

Without observation:

* SwiftUI would not know object changed
* UI would not refresh

`@ObservedObject` subscribes to:

* `objectWillChange`
* emitted from `ObservableObject`

---

## Relationship With `@Published`

```swift id="x4tsv2"
class UserSettings: ObservableObject {

    @Published var username = "Siddharth"
}
```

When:

```swift id="jlwm7q"
username = "John"
```

Then:

1. `@Published` emits change
2. `ObservableObject` broadcasts update
3. `@ObservedObject` detects it
4. View redraws

---

## Complete Working Example

```swift id="8tlq1o"
import SwiftUI

class ThemeSettings: ObservableObject {

    @Published var isDarkMode = false
}

struct ParentView: View {

    @StateObject private var settings = ThemeSettings()

    var body: some View {

        SettingsView(settings: settings)
    }
}

struct SettingsView: View {

    @ObservedObject var settings: ThemeSettings

    var body: some View {

        VStack(spacing: 20) {

            Text(settings.isDarkMode ? "Dark Mode" : "Light Mode")

            Button("Toggle") {
                settings.isDarkMode.toggle()
            }
        }
    }
}
```

---

## Important Interview Concept

### `@ObservedObject` subscribes but does not persist.

This is the key line interviewers love.

Persistence/lifecycle management belongs to:

* `@StateObject`

Observation belongs to:

* `@ObservedObject`

---

## Another Important Detail

When parent updates:

* child view recreates
* `@ObservedObject` reconnects to same object

Because object ownership stays with parent.

---

## Most Asked Interview Questions

### 1. What is `@ObservedObject`?

A property wrapper that observes an external `ObservableObject` and refreshes the view when published properties change.

---

### 2. Difference between `@StateObject` and `@ObservedObject`?

| `@StateObject`     | `@ObservedObject`       |
| ------------------ | ----------------------- |
| Owns object        | Observes object         |
| Creates object     | Receives object         |
| Persists lifecycle | No lifecycle management |

---

### 3. Should child views use `@ObservedObject`?

Yes, when parent owns the object.

---

### 4. Can `@ObservedObject` recreate objects?

Yes, if improperly initialized inside the view.

---

### 5. Does `@ObservedObject` work without `@Published`?

UI updates generally require published changes.

---

## Easy Memory Trick

```text id="zkwp35"
@StateObject   = OWNER
@ObservedObject = WATCHER
```

That single line explains most SwiftUI data flow.  


## Q. @StateObject create memory outside of struct, do ObservedObject also create memory in same way?  

[Answer]()  


