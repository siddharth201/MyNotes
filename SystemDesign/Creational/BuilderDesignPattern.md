
# **Builder Pattern**

## ✅ One-Line Definition (MEMORIZE)

> **Builder Pattern constructs a complex object step by step and allows different representations using the same construction process.**

Simpler:

> **Builder separates object construction from its representation.**

Even simpler:

> **Builder helps create complex objects safely and clearly.**

---

## 🧠 Why Builder Pattern Exists

Sometimes objects:

* Have many parameters
* Some parameters are optional
* Some combinations are invalid
* Initializers become huge and unreadable

Example problem:

```swift
User(name: "Amit",
     age: 25,
     email: "...",
     phone: "...",
     address: "...",
     isPremium: true,
     profileImageURL: nil,
     preferences: ...)
```

This is:

❌ Hard to read
❌ Easy to misuse
❌ Error-prone

Builder fixes this.

---

## 🎯 When to Think About Builder Pattern

Think **Builder** when:

✅ Object has many parameters
✅ Many optional fields
✅ Need validation before creation
✅ Want readable construction
✅ Want immutable final object

Memory hook:

> **Complex init → Builder**

---

## 🧱 Core Idea

```
Builder
  |
  | setX()
  | setY()
  | setZ()
  |
 build()
  ↓
Product
```

---

## ❌ Without Builder (Bad Design)

```swift
struct Car {
    let engine: String
    let wheels: Int
    let color: String
    let sunroof: Bool
}
```

Usage:

```swift
let car = Car(engine: "V8", wheels: 4, color: "Red", sunroof: true)
```

Problems:

* No validation
* Easy to swap arguments
* Hard to extend

---

## ✅ With Builder (Production-Grade Swift Example)

We’ll build a **Car** object.

---

## Step 1️⃣ Product (Immutable)

```swift
struct Car {
    let engine: String
    let wheels: Int
    let color: String
    let sunroof: Bool
}
```

---

## Step 2️⃣ Builder

```swift
final class CarBuilder {

    // Defaults
    private var engine: String = "V4"
    private var wheels: Int = 4
    private var color: String = "Black"
    private var sunroof: Bool = false

    func setEngine(_ engine: String) -> CarBuilder {
        self.engine = engine
        return self
    }

    func setWheels(_ wheels: Int) -> CarBuilder {
        self.wheels = wheels
        return self
    }

    func setColor(_ color: String) -> CarBuilder {
        self.color = color
        return self
    }

    func enableSunroof(_ enabled: Bool) -> CarBuilder {
        self.sunroof = enabled
        return self
    }

    func build() throws -> Car {
        try validate()
        return Car(engine: engine,
                   wheels: wheels,
                   color: color,
                   sunroof: sunroof)
    }

    private func validate() throws {
        if wheels <= 0 {
            throw BuildError.invalidWheels
        }
        if engine.isEmpty {
            throw BuildError.invalidEngine
        }
    }
}
```

---

## Step 3️⃣ Build Error

```swift
enum BuildError: Error {
    case invalidWheels
    case invalidEngine
}
```

---

## Step 4️⃣ Usage (Fluent API)

```swift
do {
    let car = try CarBuilder()
        .setEngine("V8")
        .setColor("Red")
        .enableSunroof(true)
        .build()

    print(car)
} catch {
    print("Failed to build car:", error)
}
```

---

## 🧠 Why This Is Production Grade

✔ Fluent interface
✔ Validation before creation
✔ Immutable product
✔ Defaults supported
✔ Easy to extend

---

## 🏗️ Optional Enhancement: Director (Optional Component)

Director defines **predefined configurations**.

```swift
final class CarDirector {

    static func makeSportsCar() throws -> Car {
        try CarBuilder()
            .setEngine("V8")
            .setColor("Red")
            .enableSunroof(true)
            .build()
    }

    static func makeFamilyCar() throws -> Car {
        try CarBuilder()
            .setEngine("V6")
            .setColor("White")
            .build()
    }
}
```

Usage:

```swift
let sportsCar = try CarDirector.makeSportsCar()
```

---

## ⚡ Edge Cases & How Builder Handles Them

---

### ✅ Missing Required Fields

Handled by validation:

```swift
if engine.isEmpty { throw BuildError.invalidEngine }
```

---

### ✅ Optional Parameters

Defaults inside builder.

---

### ✅ Invalid Combinations

Example:

```swift
if engine == "V8" && wheels < 4 {
    throw BuildError.invalidConfiguration
}
```

---

### ✅ Thread Safety

Builders are **not shared**.
Create new builder per object.

---

### ✅ Immutability

Car is immutable after build.

---

### ✅ Reusability

```swift
let baseBuilder = CarBuilder().setColor("Blue")

let car1 = try baseBuilder.setEngine("V6").build()
let car2 = try baseBuilder.setEngine("V8").build()
```

---

## 📊 Builder vs Telescoping Constructor

| Approach   | Readability | Safety |
| ---------- | ----------- | ------ |
| Large init | ❌           | ❌      |
| Builder    | ✅           | ✅      |

---

## 🎯 Interview-Ready Explanation (30 sec)

> “Builder pattern is used to construct complex objects step by step. It separates construction logic from the object itself and allows validation before creating the final immutable object. It also provides a fluent API, making object creation more readable.”

---

## 🧠 One-Line Memory Hook

> **Builder = Step-by-step object creation**

---

## ❓Common Interview Questions & Answers

---

### Q1: When should you use Builder?

> When an object has many optional or required parameters and creation becomes complex.

---

### Q2: Builder vs Factory?

> Factory focuses on *which object* to create.
> Builder focuses on *how to build* an object.

---

### Q3: Is Builder creational or structural?

> Creational pattern.

---

### Q4: Is Director mandatory?

> No. It’s optional.

---

### Q5: Can Builder be immutable?

> Yes. Each setter can return a new builder copy.

---

### Q6: Builder vs Prototype?

> Builder constructs step by step.
> Prototype clones existing object.

---

## 🧪 Mini Interview Exercise

**Question:**
You have a `UserProfile` with 15 optional fields. What pattern?

**Answer:**
Builder Pattern.

---

## 🏁 Final Summary

* Builder constructs complex objects step by step
* Avoids huge initializers
* Supports validation & defaults
* Returns immutable product



