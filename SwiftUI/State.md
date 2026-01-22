## **Explain @State**  


# `@State`

## What is `@State`?

### One-line definition

> **`@State` is used for simple, `local UI state` owned by a view.**

Think:

* Button tapped or not
* Toggle on/off
* TextField text

---

### Example

```swift
struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increase") {
                count += 1
            }
        }
    }
}
```

### What happens here?

* `count` is owned by this view
* When `count` changes → SwiftUI **re-runs `body`**
* UI updates automatically

### Important rules

✔ Use for **value types** (Int, Bool, String)
✔ Small, local UI state
❌ Not for business logic
❌ Not for ViewModels

---

