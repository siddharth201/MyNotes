
In **SwiftUI**, `@Published` is a property wrapper used inside an `ObservableObject` class to announce:

> “This value changed — refresh any observing SwiftUI views.”

It is the mechanism that connects your data model to the UI update system.

---

## Basic Example

```swift id="kg4nfg"
import SwiftUI

class CounterViewModel: ObservableObject {

    @Published var count = 0
}
```

Here:

* `CounterViewModel` conforms to `ObservableObject`
* `count` is marked `@Published`

Whenever `count` changes:

* SwiftUI gets notified
* observing views refresh automatically

---

## Using It in a View

```swift id="9pdq7v"
struct ContentView: View {

    @StateObject private var vm = CounterViewModel()

    var body: some View {

        VStack {

            Text("Count: \(vm.count)")

            Button("Increment") {
                vm.count += 1
            }
        }
    }
}
```

When button is tapped:

1. `count` changes
2. `@Published` emits change notification
3. SwiftUI recomputes `body`
4. UI updates automatically

---

## Why `@Published` Is Needed

Without `@Published`:

```swift id="9fc2cl"
class CounterViewModel: ObservableObject {

    var count = 0
}
```

Changing:

```swift id="lbpx0w"
count += 1
```

will NOT refresh UI.

Because SwiftUI does not know the property changed.

---

## What `@Published` Actually Does

When you write:

```swift id="m7f0ye"
@Published var count = 0
```

Swift automatically creates a publisher behind the scenes.

Conceptually:

```swift id="fc8f8s"
objectWillChange.send()
```

gets triggered whenever the value changes.

SwiftUI listens to that publisher.

---

## Important Relationship

```text id="8rz53z"
@Published
      ↓
ObservableObject
      ↓
@StateObject / @ObservedObject
      ↓
SwiftUI View Updates
```

All of these work together.

---

## Important Rule

`@Published` ONLY works inside classes that conform to:

```swift id="uhkgf0"
ObservableObject
```

Example:

```swift id="8g7e8m"
class UserSettings: ObservableObject {

    @Published var username = "Siddharth"
}
```

---

## Internal Flow

When this happens:

```swift id="q8om5q"
username = "John"
```

Swift does:

1. announce object will change
2. notify subscribers
3. SwiftUI refreshes dependent views

---

## Real Mental Model

### `@Published`

Means:

> “Broadcast changes to this property.”

---

## Difference Between `@State` and `@Published`

| `@State`                 | `@Published`                     |
| ------------------------ | -------------------------------- |
| Used in Views            | Used in ObservableObject classes |
| Local state              | Shared observable state          |
| Value-type oriented      | Reference-type oriented          |
| SwiftUI manages directly | Combine publisher-based          |

---

## Example With Multiple Properties

```swift id="i0n71g"
class ProfileViewModel: ObservableObject {

    @Published var username = "Siddharth"
    @Published var followers = 100
    @Published var isPremium = false
}
```

Any property change updates observing views.

---

## Without `@Published`

```swift id="7lcvlq"
class ProfileViewModel: ObservableObject {

    var username = "Siddharth"
}
```

This WILL NOT trigger automatic UI refresh.

---

# Advanced Concept

`@Published` belongs to the **Combine** framework.

It creates a publisher automatically.

Equivalent idea:

```swift id="v8w5bi"
let publisher = Published<String>.Publisher
```

SwiftUI subscribes to those publishers internally.

---

# Important Caveat

`@Published` only detects assignment changes.

Example:

```swift id="y4mw7z"
@Published var user = User()
```

If `User` is a class and you do:

```swift id="0s9mns"
user.name = "Bob"
```

UI may NOT refresh unless:

* `User` itself is observable
* or object reassigned

---

# Most Asked Interview Questions

## 1. What is `@Published`?

A property wrapper that notifies observers when a property changes.

---

## 2. Where can `@Published` be used?

Inside classes conforming to `ObservableObject`.

---

## 3. Does `@Published` work in structs?

No.

Because `ObservableObject` is class-oriented.

---

## 4. What happens when a `@Published` property changes?

It emits change notifications causing observing SwiftUI views to refresh.

---

## 5. Is `@Published` part of SwiftUI?

Technically it comes from Combine, though heavily used by SwiftUI.

---

# Complete Working Example

```swift id="6od8vt"
import SwiftUI

class UserViewModel: ObservableObject {

    @Published var name = "Siddharth"

    func updateName() {
        name = "SwiftUI Developer"
    }
}

struct ContentView: View {

    @StateObject private var vm = UserViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text(vm.name)
                .font(.title)

            Button("Update Name") {
                vm.updateName()
            }
        }
        .padding()
    }
}
```

When button tapped:

* `name` changes
* `@Published` notifies
* SwiftUI refreshes UI automatically
