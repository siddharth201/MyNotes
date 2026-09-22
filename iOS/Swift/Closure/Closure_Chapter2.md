
# 1️⃣ Why we need **escaping** and **non-escaping** closures

## Core idea (interview-friendly)

> **The difference exists because some closures are executed immediately, while others must live longer than the function call.**

Swift needs to know this for **memory safety and optimization**.

---

## 🔹 Non-escaping closures (default)

### Definition

> A **non-escaping closure** is guaranteed to be executed **before the function returns**.

### Why Swift prefers non-escaping

* Faster
* Safer
* No retain cycles
* Compiler can optimize heavily

---

### Valid scenario: Synchronous work

```swift
func performImmediately(action: () -> Void) {
    print("Before")
    action()
    print("After")
}
```

Usage:

```swift
performImmediately {
    print("Running now")
}
```

Output:

```
Before
Running now
After
```

✔ Closure **never escapes**
✔ No need for `@escaping`
✔ `self` can be used safely without `[weak self]`

---

### Interview line

> “Non-escaping closures are used when the closure is executed immediately within the function.”

---

## 🔹 Escaping closures (`@escaping`)

### Definition

> An **escaping closure** is stored or executed **after the function returns**.

---

### Valid scenario: Asynchronous work (VERY IMPORTANT)

```swift
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        sleep(1)
        completion("Data received")
    }
}
```

Usage:

```swift
fetchData { result in
    print(result)
}
```

Why `@escaping` is REQUIRED:

* Closure runs **later**
* Function already returned
* Closure must “escape” the stack frame

---

### Interview line

> “Escaping closures are required for asynchronous operations like network calls.”

---

## 🔥 Why Swift forces you to mark escaping explicitly

Because escaping closures:

* Can cause retain cycles
* Live longer
* Need careful memory management

Swift makes this **explicit** so you think about it.

---

## 2️⃣ `@autoclosure` explained clearly (no confusion)

### Simple definition

> `@autoclosure` automatically wraps an expression into a closure **without writing `{}`**.

---

## Why it exists (REAL reason)

To improve **readability**, especially for:

* Assertions
* Logging
* Lazy evaluation

---

## Example WITHOUT autoclosure ❌

```swift
func log(_ message: () -> String) {
    print(message())
}

log({ "Something happened" })
```

Ugly & noisy.

---

## Same example WITH `@autoclosure` ✅

```swift
func log(_ message: @autoclosure () -> String) {
    print(message())
}

log("Something happened")
```

Much cleaner.

---

## 🔥 Key benefit: Lazy evaluation

```swift
func debugLog(_ message: @autoclosure () -> String) {
    if isDebug {
        print(message())
    }
}
```

If `isDebug == false`:

* Expression is **never evaluated**
* Saves computation

---

## Production example (REAL)

```swift
assert(user.isLoggedIn, "User must be logged in")
```

Internally:

* Condition and message are autoclosures
* Evaluated **only if assertion fails**

---

### Interview line

> “Autoclosure improves readability by delaying execution and avoiding explicit closure syntax.”

---

## 3️⃣ Capture List — Practice Code (RUN & LEARN)

Below are **hands-on exercises**. Run them and observe output.

---

## 🧪 Practice 1: Strong capture (retain cycle)

```swift
class Owner {
    var action: (() -> Void)?

    init() {
        print("Owner init")
        action = {
            print("Doing work \(self)")
        }
    }

    deinit {
        print("Owner deinit")
    }
}

var owner: Owner? = Owner()
owner = nil
```

### ❌ Output

```
Owner init
```

❗ `deinit` never called → retain cycle

---

## 🧪 Practice 2: Fix with `[weak self]`

```swift
class Owner {
    var action: (() -> Void)?

    init() {
        print("Owner init")
        action = { [weak self] in
            print("Doing work \(String(describing: self))")
        }
    }

    deinit {
        print("Owner deinit")
    }
}

var owner: Owner? = Owner()
owner = nil
```

### ✅ Output

```
Owner init
Owner deinit
```

✔ Memory leak fixed

---

## 🧪 Practice 3: weak vs unowned (CRITICAL)

### ❌ Dangerous unowned

```swift
class Owner {
    var action: (() -> Void)?

    init() {
        action = { [unowned self] in
            print(self)
        }
    }
}

var owner: Owner? = Owner()
owner = nil
// action is called later → 💥 crash
```

### Rule

> Use `unowned` only when lifetime is guaranteed.

---

## 🧪 Practice 4: Capture by value

```swift
var count = 10

let printCount = { [count] in
    print(count)
}

count = 20
printCount()
```

### Output

```
10
```

✔ Captured **snapshot**, not reference

---

## 🧪 Practice 5: Capture multiple values

```swift
class Counter {
    var value = 0

    func makeClosure() -> () -> Void {
        { [weak self, value = self.value] in
            print("value:", value)
            print("self value:", self?.value ?? -1)
        }
    }
}

let counter = Counter()
counter.value = 5
let closure = counter.makeClosure()
counter.value = 10
closure()
```

### Output

```
value: 5
self value: 10
```

✔ Shows **value vs reference capture** clearly

---

## 4️⃣ How modern Swift avoids heavy closure usage

### 1️⃣ `async / await` (MOST IMPORTANT)

Before ❌

```swift
fetchData { data in
    updateUI(data)
}
```

After ✅

```swift
let data = try await fetchData()
updateUI(data)
```

✔ No escaping closure
✔ No retain cycle
✔ Linear readable code

---

### 2️⃣ SwiftUI state-driven design

Instead of:

```swift
onTap = {
    self.doSomething()
}
```

SwiftUI prefers:

```swift
Button("Tap") {
    doSomething()
}
```

And even better:

```swift
.onChange(of: state) { newValue in
    handleChange(newValue)
}
```

---

### 3️⃣ Actors & structured concurrency

Actors manage state **without closure-based locking**.

---

## 🎤 Final interview-ready summary

> “Non-escaping closures are used for immediate execution and allow compiler optimizations. Escaping closures are required for asynchronous work and must be explicitly marked to ensure memory safety. Autoclosures improve readability and enable lazy evaluation. Modern Swift reduces heavy closure usage with async/await and declarative SwiftUI patterns.”

---

## 🧠 Mental model to remember forever

* **Non-escaping** → now
* **Escaping** → later
* **Autoclosure** → lazy syntax sugar
* **Capture list** → memory ownership control
* **async/await** → closure replacement

---


# 1️⃣ “Closures are saved and executed later” — **where are they saved?**

### Short interview answer

> **Escaping closures are stored in memory (heap) as references, usually inside variables, properties, collections, or system-managed queues.**

Now let’s unpack that properly.

---

## 🔹 Non-escaping closures — **not really “saved”**

```swift
func perform(action: () -> Void) {
    action()
}
```

What happens:

* Closure lives **temporarily**
* Executed **immediately**
* Stored on the **stack**
* Destroyed when function returns

📌 **Not retained anywhere**

That’s why:

* No `@escaping`
* No retain cycle risk
* Compiler can optimize heavily

---

## 🔹 Escaping closures — **actually stored**

Escaping closures must live **after the function returns**, so Swift **moves them to the heap**.

### Common places they are stored 👇

---

### 1️⃣ Stored in a property (MOST COMMON)

```swift
class LoginManager {
    var onLogin: (() -> Void)?
}
```

Memory picture:

```
LoginManager
 └── onLogin → closure (heap)
```

This closure stays alive **as long as `LoginManager` lives**.

---

### 2️⃣ Stored by system APIs (queues, URLSession, timers)

```swift
DispatchQueue.main.async {
    print("Later")
}
```

Where is it stored?

* Inside **GCD’s internal queue data structures**
* Retained until executed

Same with:

* `URLSession`
* `Timer`
* `NotificationCenter`
* `Combine`

---

### 3️⃣ Stored in collections

```swift
var tasks: [() -> Void] = []

tasks.append {
    print("Task")
}
```

Here:

```
Array → closure → captured values
```

---

### 🔥 Key rule (MEMORIZE)

> **If a closure escapes, Swift must store it somewhere on the heap.**

That’s *why* Swift forces `@escaping`.

---

## 🧠 Why Swift cares so much

Because once a closure is stored:

* It may outlive the current scope
* It may capture `self`
* It may cause retain cycles

So Swift says:

> “If this closure escapes, you must acknowledge it.”

---

# 2️⃣ Do higher-order functions use non-escaping closures?

### Short interview answer

> **Yes — most higher-order functions use non-escaping closures.**

Let’s prove it.

---

## 🔹 Example: `map`

```swift
let numbers = [1, 2, 3]

let squares = numbers.map { number in
    number * number
}
```

What happens:

* Closure is executed **immediately**
* Array iterates synchronously
* Closure is **not stored**
* Closure does **not escape**

So:
✔ **Non-escaping closure**

---

## 🔹 Same for these functions

All of these use **non-escaping closures**:

```swift
map
compactMap
flatMap
filter
reduce
forEach
sorted
contains(where:)
first(where:)
```

Why?

* They operate **synchronously**
* They don’t store the closure
* They finish execution before returning

---

## 🔥 Why this is important

Because inside these closures:

* You can access `self` **without** `[weak self]`
* No retain cycle risk
* Cleaner code

```swift
items.map {
    self.transform($0) // safe
}
```

---

## ⚠️ Exception: Higher-order functions that DO escape

Some APIs **look** like higher-order functions but actually store closures.

### Example: `DispatchQueue.async`

```swift
DispatchQueue.main.async {
    self.updateUI()
}
```

This is **escaping** because:

* Closure is stored in a queue
* Executed later

So:
❗ Needs `[weak self]` in many cases

---

## 🧠 Simple mental model (VERY IMPORTANT)

> **If a function finishes all closure execution before returning → non-escaping**
> **If the closure is kept for later → escaping**

---

# 3️⃣ Quick comparison table (interview-friendly)

| Scenario                | Escaping? | Stored where?     |
| ----------------------- | --------- | ----------------- |
| `map {}`                | ❌ No      | Stack (temporary) |
| `filter {}`             | ❌ No      | Stack             |
| `DispatchQueue.async`   | ✅ Yes     | GCD queue         |
| `URLSession.dataTask`   | ✅ Yes     | URLSession        |
| Stored property closure | ✅ Yes     | Heap              |
| `Timer.scheduledTimer`  | ✅ Yes     | RunLoop           |

---

## 🎤 Perfect interview explanation (polished)

> “Non-escaping closures are executed immediately and usually live on the stack, while escaping closures are stored on the heap—either in properties, collections, or system APIs—so they can be executed later. Most higher-order functions like map and filter use non-escaping closures because they execute synchronously.”

---

## 🧠 One-line memory hook

> **map = now → non-escaping
> async = later → escaping**

---

If you want next:

* Visual memory diagrams (stack vs heap)
* Why `self` is allowed in non-escaping closures
* How Swift optimizes non-escaping closures
* Interview trick questions around `@escaping`

Just say 🚀


