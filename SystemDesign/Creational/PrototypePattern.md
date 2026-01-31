
# **Prototype Pattern**

## ✅ One-Line Definition (MEMORIZE)

> **Prototype Pattern creates new objects by cloning an existing object instead of creating from scratch.**

Simpler:

> **Prototype copies an object to make new ones.**

---

## 🧠 Why Prototype Pattern Exists

Sometimes:

* Object creation is expensive
* Object has complex configuration
* You want similar objects with small differences
* You want to avoid rebuilding from zero

Prototype solves this by:

```
Existing Object → clone() → New Object
```

---

## 🎯 When to Think About Prototype

Think Prototype when:

✅ Expensive initialization<br/>
✅ Many similar objects<br/>
✅ Need fast object creation<br/>
✅ Want copy + modify<br/>

Memory hook:

> **Copy instead of Build**

---

## 🧱 Core Idea

```
Prototype (interface)
   |
 clone()
   |
ConcretePrototype
```

---

## ❌ Without Prototype (Bad)

```swift
let user = User(name: "Amit",
                age: 30,
                preferences: Preferences(theme: "dark",
                                          notifications: true,
                                          language: "en"))
```

Repeating heavy initialization everywhere.

---

## ✅ With Prototype (Production-Grade Swift Example)

We’ll create a **Profile** object that supports cloning.

---

## Step 1️⃣ Prototype Protocol

```swift
protocol Prototype {
    func clone() -> Self
}
```

---

## Step 2️⃣ Reference-Type Model

We intentionally use `class` to show real prototype usefulness.

```swift
final class Preferences {
    var theme: String
    var notificationsEnabled: Bool

    init(theme: String, notificationsEnabled: Bool) {
        self.theme = theme
        self.notificationsEnabled = notificationsEnabled
    }
}
```

---

## Step 3️⃣ Concrete Prototype

```swift
final class UserProfile: Prototype {

    var name: String
    var age: Int
    var preferences: Preferences

    init(name: String,
         age: Int,
         preferences: Preferences) {
        self.name = name
        self.age = age
        self.preferences = preferences
    }

    // Deep copy
    func clone() -> UserProfile {
        let copiedPreferences = Preferences(
            theme: preferences.theme,
            notificationsEnabled: preferences.notificationsEnabled
        )

        return UserProfile(
            name: name,
            age: age,
            preferences: copiedPreferences
        )
    }
}
```

---

## Step 4️⃣ Usage

```swift
let original = UserProfile(
    name: "Amit",
    age: 30,
    preferences: Preferences(theme: "Dark",
                              notificationsEnabled: true)
)

let copy = original.clone()
copy.name = "Rahul"
copy.preferences.theme = "Light"

print(original.name)              // Amit
print(original.preferences.theme) // Dark

print(copy.name)                  // Rahul
print(copy.preferences.theme)     // Light
```

Original object is untouched ✅

---

## 🧠 Why This Is Production Grade

✔ Explicit clone method
✔ Deep copy of reference members
✔ No shared mutable state
✔ Fast creation

---

## ⚠️ Important Edge Case: Shallow Copy Bug

If we wrote:

```swift
func clone() -> UserProfile {
    return UserProfile(
        name: name,
        age: age,
        preferences: preferences   // ❌ same reference
    )
}
```

Then:

```swift
copy.preferences.theme = "Light"
```

Would also change original ❌

---

## 🧠 Rule

> **Value types auto-copy.
> Reference types must be cloned manually.**

---

## 🧩 Swift Value-Type Shortcut

If everything is `struct`:

```swift
struct UserProfile {
    var name: String
    var age: Int
}
```

Then:

```swift
let copy = original
```

Already acts like prototype.

---

## 🏗️ NSCopying Variant (Cocoa Style)

```swift
class Document: NSCopying {
    var title: String

    init(title: String) {
        self.title = title
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Document(title: title)
    }
}
```

---

## ⚡ Advanced Edge Cases

---

### ✅ Immutable Prototypes

If object is immutable:

```swift
final class Config {
    let url: String
    init(url: String) { self.url = url }
}
```

Shallow copy is safe.

---

### ✅ Thread Safety

Prototype pattern itself is thread-safe.

But:

* Cloning mutable shared references is unsafe
* Use deep copies

---

### ✅ Circular References

If object graph has cycles:

* Use visited-map while cloning
* Avoid infinite recursion

---

### ✅ Partial Cloning

Sometimes clone only parts:

```swift
func clone(withName name: String) -> UserProfile
```

---

## 📊 Prototype vs Builder

| Aspect       | Prototype       | Builder        |
| ------------ | --------------- | -------------- |
| Creates from | Existing object | From scratch   |
| Speed        | Fast            | Slower         |
| Use case     | Similar objects | Complex object |

---

## 🎯 Interview-Ready Explanation

> “Prototype pattern creates new objects by cloning an existing object instead of instantiating a new one. It is useful when object creation is expensive or when we need many similar objects. In Swift, this is often implemented using a clone method or NSCopying with deep copy for reference types.”

---

## 🧠 One-Line Memory Hook

> **Prototype = Clone existing object**

---

## ❓Common Interview Questions

---

### Q1: When would you use Prototype?

> When creating objects is expensive or when many similar objects are needed.

---

### Q2: Difference between shallow and deep copy?

> Shallow copy copies references. Deep copy duplicates referenced objects.

---

### Q3: Is Prototype creational?

> Yes.

---

### Q4: Is struct assignment prototype?

> Effectively yes, because structs use value semantics.

---

### Q5: Prototype vs Factory?

> Factory decides which class to create. Prototype copies an existing object.

---

### Q6: Prototype vs Singleton?

> Singleton ensures single instance. Prototype creates many copies.

---

## 🧪 Mini Exercise

You have a game enemy template. You need 100 enemies with slight variations.

👉 Use Prototype.

---

## 🏁 Final Summary

* Prototype clones objects
* Faster than reinitialization
* Must deep copy reference types
* Useful for templates



