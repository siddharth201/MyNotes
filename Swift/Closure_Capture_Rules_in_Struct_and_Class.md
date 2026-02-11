
Closure capture rules are **VERY important** for senior iOS interviews — especially when mixing **structs (value types)** and **classes (reference types)**.

Let’s break it down clearly and deeply.

---

## 🧠 Core Rule

> A closure captures variables differently depending on whether they are **value types (struct)** or **reference types (class)**.

* Struct → captured by **copy**
* Class → captured by **reference**

But there’s more nuance 👇

---

## 1️⃣ Closure Capturing a Struct

```swift
struct Counter {
    var value: Int
}

var counter = Counter(value: 10)

let closure = {
    print(counter.value)
}

counter.value = 20
closure()
```

### What prints?

```
20
```

### Wait… Why not 10?

Because Swift closures capture **variables**, not just raw values.

Swift captures `counter` as a reference to the variable storage — but since it's a value type, modifications replace the whole value.

So the closure sees the updated struct.

---

## 💡 Important Difference: Capture List

Now let’s force value capture:

```swift
let closure = { [counter] in
    print(counter.value)
}

counter.value = 20
closure()
```

### What prints?

```
10
```

Why?

Because `[counter]` tells Swift:

> “Capture the current value NOW.”

Now it behaves like a snapshot.

---

## 2️⃣ Closure Capturing a Class

```swift
class Counter {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

var counter = Counter(value: 10)

let closure = {
    print(counter.value)
}

counter.value = 20
closure()
```

### Output:

```
20
```

Here the closure captures the **reference to the object**, so it sees all changes.

---

## 🚨 The Real Danger: Retain Cycles

Now this is where structs and classes behave VERY differently.

---

## Example with Class

```swift
class Person {
    var name: String
    var greet: (() -> Void)?

    init(name: String) {
        self.name = name
        self.greet = {
            print("Hello \(self.name)")
        }
    }
}
```

⚠️ Problem: Strong reference cycle

```
Person → greet closure → self → Person
```

This leaks memory.

---

## Fix with weak capture

```swift
self.greet = { [weak self] in
    print("Hello \(self?.name ?? "")")
}
```

Now no retain cycle.

---

## Why this doesn’t happen with Struct?

```swift
struct Person {
    var name: String
    var greet: (() -> Void)?

    init(name: String) {
        self.name = name
        self.greet = {
            print("Hello \(self.name)")
        }
    }
}
```

This won’t compile.

Swift error:

```
Escaping closure captures mutating 'self'
```

Why?

Because:

* Structs are value types
* Capturing `self` in escaping closure could mutate copy
* Swift prevents this

This is a huge safety feature.

---

## 🔥 Deep Interview Insight

| Aspect                          | Struct                         | Class     |
| ------------------------------- | ------------------------------ | --------- |
| Captured as                     | Copy (value semantics)         | Reference |
| Sees mutations after capture?   | Yes (unless capture list used) | Yes       |
| Can cause retain cycle?         | ❌ No                           | ✅ Yes     |
| Needs weak/unowned?             | ❌ No                           | ✅ Often   |
| Escaping closure capturing self | Restricted                     | Allowed   |

---

## 🧩 Advanced Example — Loop Capture

Classic interview trap:

```swift
var functions: [() -> Void] = []

for i in 0..<3 {
    functions.append {
        print(i)
    }
}

functions.forEach { $0() }
```

Output:

```
0
1
2
```

Swift captures `i` correctly (unlike older languages like JS).

---

## 🧠 The Real Mental Model

Closures capture:

1. **Variables**, not just values
2. Value types behave like copies when explicitly captured
3. Reference types keep identity
4. Escaping closures + class = retain cycle risk

---

## 🎯 When to Use Capture List

Use `[weak self]` when:

* Closure is escaping
* Closure is stored
* Closure is async
* You’re inside class

Use `[value]` when:

* You need a snapshot of struct
* You want predictable behavior
* Avoid race conditions

---

## 🚀 SwiftUI Angle (Very Important)

In SwiftUI:

```swift
Button("Tap") {
    print(viewModel.count)
}
```

* `viewModel` is class
* Closure captures reference
* If stored somewhere long-term → potential memory issue

---

## 📌 Final Golden Rule

> Structs give safer closure behavior by default.
> Classes require manual memory management awareness.



