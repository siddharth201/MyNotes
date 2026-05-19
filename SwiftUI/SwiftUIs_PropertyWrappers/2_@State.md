In **SwiftUI**, `@State` is a **property wrapper** used to store **mutable state that belongs to a view**.

### What that means

SwiftUI views are **value types (structs)** and get recreated frequently. Because of that, you can’t just store changing data in a normal variable — it would reset every time the view redraws.

`@State` solves this by:

* Letting SwiftUI **store the value separately from the view struct**
* Automatically **re-rendering the view when the value changes**

---  

> Note: SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are value types. 

When we put @State before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI. This means SwiftUI can destroy and recreate our struct whenever needed (and this can happen a lot!), without losing the state it was storing.

### Simple example

```swift
struct CounterView: View {
    @State private var count = 0   // State variable

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1   // Updates state
            }
        }
    }
}
```

### What happens here

* `count` is marked with `@State`
* When you tap the button:

  * `count` changes
  * SwiftUI detects the change
  * The view is **re-rendered automatically**

---

### Key characteristics

* ✅ Owned by a single view
* ✅ Stored outside the view struct internally
* ✅ Triggers UI updates when modified
* ❌ Not meant for sharing between multiple views

---

### When to use `@State`

Use `@State` when:

* The data is **local to that view**
* The view **owns and controls** that data

---

### When NOT to use it

If you need to share state:

* Use `@Binding` → pass state to child views
* Use `@StateObject` / `@ObservedObject` → for shared models

---


