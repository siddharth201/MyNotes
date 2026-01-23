

# 1️⃣ What is a Closure? (Interview-friendly)

### Simple definition

> **A closure is a self-contained block of code that can be passed around and executed later.**

### Even simpler

> **Closures are functions without a name.**

---

### One-line interview answer

> “Closures allow us to encapsulate behavior and pass it as a value.”

---

## Basic example

```swift
let greet = {
    print("Hello")
}

greet()
```

---

# 2️⃣ Why closures exist in iOS

Closures are used when:

* Work happens **later**
* Work happens **asynchronously**
* UI events occur
* Callbacks are needed

Examples:

* Network responses
* Button taps
* Animations
* Completion handlers

---

# 3️⃣ Types of Closures (IMPORTANT)

## 1️⃣ Non-escaping closures (default)

### Meaning

> Executed **within** the function body.

```swift
func perform(action: () -> Void) {
    action()
}
```

✔ Safe
✔ No retain cycles
✔ Fast

---

## 2️⃣ Escaping closures (`@escaping`)

### Meaning

> Stored and executed **after** the function returns.

```swift
func fetchData(completion: @escaping () -> Void) {
    DispatchQueue.main.async {
        completion()
    }
}
```

✔ Needed for async work
❗ Can cause retain cycles

---

## 3️⃣ Autoclosures (less common)

### Meaning

> Automatically wraps an expression into a closure.

```swift
func log(_ message: @autoclosure () -> String) {
    print(message())
}
```

✔ Cleaner syntax
✔ Used in `assert`, `&&`, `||`

---

# 4️⃣ Production-grade closure example (iOS style)

### Network call with completion

```swift
class APIClient {

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            // parse
            completion(.success(users))
        }.resume()
    }
}
```

Why closure?

* Network response is **async**
* Caller decides what to do with result

---

# 5️⃣ Capture List — THE CONFUSING PART (Explained Clearly)

## ❓ What is capture?

> **Closures capture values from their surrounding scope.**

```swift
let name = "Siddharth"

let printName = {
    print(name)   // captured
}
```

---

## ❓ What is a capture list?

> A capture list **controls how values are captured**.

Syntax:

```swift
{ [weak self] in ... }
```

---

## ❗ The real problem: Retain Cycles

### Problematic code ❌

```swift
class ViewController {
    var onTap: (() -> Void)?

    func setup() {
        onTap = {
            self.navigate()   // strong capture
        }
    }
}
```

Memory graph:

```
ViewController → onTap → closure → ViewController
```

❌ Memory leak

---

## 6️⃣ How `[weak self]` fixes it

### Correct version ✅

```swift
onTap = { [weak self] in
    self?.navigate()
}
```

Now:

* Closure holds `weak` reference
* ViewController can deallocate

---

## 7️⃣ weak vs unowned (VERY IMPORTANT)

| weak       | unowned        |
| ---------- | -------------- |
| Optional   | Non-optional   |
| Can be nil | Crashes if nil |
| Safe       | Unsafe         |

### Use rule (memorize)

> If `self` can go away → **weak**
> If `self` must exist → **unowned**

---

## 8️⃣ Capture values vs references (SUBTLE BUT IMPORTANT)

```swift
var count = 0

let increment = { [count] in
    print(count)
}

count = 10
increment() // prints 0
```

Why?

* Captured **by value**

---

## 9️⃣ Modern Swift: Avoiding closures (VERY IMPORTANT)

Swift is actively reducing **callback hell**.

---

## 1️⃣ `async / await` (BIGGEST CHANGE)

### Before ❌

```swift
fetchData { result in
    process(result)
}
```

### After ✅

```swift
let result = try await fetchData()
process(result)
```

✔ No escaping closures
✔ Cleaner control flow
✔ No retain cycles

---

## 2️⃣ Combine (less now, but still relevant)

```swift
publisher
    .sink { value in
        print(value)
    }
```

Still uses closures, but:

* Centralized lifecycle
* Explicit cancellation

---

## 3️⃣ SwiftUI (declarative)

SwiftUI reduces closures for:

* UI state handling
* Navigation
* Data flow

But still uses closures for:

* Actions
* Gestures

```swift
Button("Tap") {
    print("Tapped")
}
```

---

## 🔟 When closures are STILL the right choice

Closures are perfect for:

* Small callbacks
* UI events
* Completion handlers
* Inline logic

Not ideal for:

* Long-lived relationships
* Complex state flows

(Use delegates, async/await, Combine instead)

---

# 🎤 Perfect Interview Answer (Say This)

> “Closures are self-contained blocks of code used as callbacks or asynchronous handlers. Swift provides escaping and non-escaping closures, and capture lists to manage memory. Modern Swift reduces heavy closure usage with async/await and declarative SwiftUI patterns.”

---

# 🧠 Mental Models (REMEMBER THESE)

* Closure = function + captured context
* Escaping closure = stored callback
* Capture list = memory ownership control
* `weak self` = break retain cycle
* async/await = closure replacement

---


