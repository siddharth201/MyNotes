
This is a very important SwiftUI question.

You CAN technically write:

```swift id="k7s3rl"
@ObservedObject var vm = ViewModel()
```

But in most cases, this is considered WRONG architecture in **SwiftUI**.

---

## Why It’s Problematic

Because:

```swift id="7vjlwm"
@ObservedObject
```

does NOT manage object lifecycle.

So when SwiftUI recreates the view:

```text id="a2y61t"
View recreated
```

this line runs again:

```swift id="uz4n1r"
ViewModel()
```

creating a NEW object instance.

---

## Result

You may get:

* lost state
* unexpected resets
* repeated initialization
* repeated API calls
* performance issues

---

## Example Problem

```swift id="axjlwm"
class CounterVM: ObservableObject {

    @Published var count = 0

    init() {
        print("ViewModel Created")
    }
}
```

---

### Incorrect Usage

```swift id="lx3e8w"
struct ContentView: View {

    @ObservedObject var vm = CounterVM()

    var body: some View {

        VStack {

            Text("\(vm.count)")

            Button("Increment") {
                vm.count += 1
            }
        }
    }
}
```

Now whenever view reloads:

* `CounterVM()` may recreate
* count resets
* `"ViewModel Created"` prints again

---

## Correct Usage

```swift id="3m0o6h"
@StateObject var vm = CounterVM()
```

because THIS view is creating the object.

---

## Important Distinction

### This is SAFE:

```swift id="fjlwm9"
ParentView(vm: existingVM)
```

Then inside child:

```swift id="sjlwm9"
@ObservedObject var vm: CounterVM
```

because object already exists externally.

---

## Why Apple Introduced `@StateObject`

Before iOS 14:

* developers used `@ObservedObject`
* lifecycle bugs happened frequently

So Apple introduced:

```swift id="2mjlwm"
@StateObject
```

specifically for object ownership/persistence.

---

## Deep Internal Reason

SwiftUI views are temporary structs:

```swift id="jlwm9r"
struct ContentView: View
```

They are recreated constantly.

So this:

```swift id="jlwm9t"
ViewModel()
```

inside the view definition is dangerous unless SwiftUI stores it persistently.

`@StateObject` provides that persistent storage.

`@ObservedObject` does not.

---

## Important Nuance

You MAY sometimes see:

```swift id="jlwm9u"
@ObservedObject var vm = SomeExternalSingleton.shared
```

This can work because:

* singleton already persists externally

But generally:

* avoid creating objects directly with `@ObservedObject`

---

## Official Rule

### If the view CREATES the object:

Use:

```swift id="jlwm9v"
@StateObject
```

---

### If the view RECEIVES the object:

Use:

```swift id="jlwm9w"
@ObservedObject
```

---

## Interview-Level Answer

If interviewer asks:

> What happens if you initialize an object with `@ObservedObject`?

Strong answer:

> The object may be recreated whenever the view redraws because `@ObservedObject` does not manage object lifecycle or persistent storage. This can lead to state resets and unexpected behavior. `@StateObject` should be used when the view creates the object.

---

## Visual Comparison

---

### BAD

```swift id="jlwm9x"
struct ViewA {

    @ObservedObject var vm = VM()
}
```

```text id="jlwm9y"
View redraw
    ↓
New VM()
```

---

### GOOD

```swift id="jlwm9z"
struct ViewA {

    @StateObject var vm = VM()
}
```

```text id="jlwm90"
View redraw
    ↓
Same VM reused
```

---

## Easy Memory Trick

```text id="jlwm91"
@ObservedObject
    = "Someone gave me this object"

@StateObject
    = "I created this object"
```

That’s the real architectural difference.

