>**Error: **'static var' declaration requires an initializer expression or an explicitly stated getter<br/>Add an initializer to silence this error  

## Explanation
This error is actually teaching an important Swift concept 👇

---

# 🔹 Your Code

```swift id="o4m4tu"
struct Settings {
    static var isLoggedIn: Bool
}
```

---

# 🔴 Error

```text id="7lwyx5"
'static var' declaration requires an initializer expression or an explicitly stated getter
```

---

# 🔹 What Swift is saying

Swift is asking:

```text id="6km4zc"
"What value should isLoggedIn have?"
```

Because:

```swift id="ap1d8o"
static var isLoggedIn: Bool
```

is a **stored type property**.

---

# 🔥 Important Rule

> Stored properties MUST have:

* a default value
  OR
* custom getter/setter

---

# 🔹 Why?

Because `Bool` cannot be uninitialized.

Swift needs:

```text id="fjy8jp"
true OR false
```

---

# ✅ Solution 1: Give default value

```swift id="g7zcc4"
struct Settings {
    static var isLoggedIn: Bool = false
}
```

✅ Most common

---

# 🔹 Usage

```swift id="21j3jd"
Settings.isLoggedIn = true
print(Settings.isLoggedIn)
```

---

# ✅ Solution 2: Computed Property (getter/setter)

This is what you usually do with UserDefaults 👇

```swift id="z96gd3"
struct Settings {

    static var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isLoggedIn")
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }
    }
}
```

---

# 🔥 Why this works

Now:

```swift id="al5x2v"
static var isLoggedIn: Bool
```

is NOT a stored property anymore.

👉 It is a **computed property**

Swift says:

```text id="lvqf9c"
"Okay, getter will provide value"
```

---

# 🔹 Usage

```swift id="7ejfvn"
Settings.isLoggedIn = true

print(Settings.isLoggedIn)
```

---

# 🔹 What actually happens

```swift id="0xfjlwm"
Settings.isLoggedIn = true
```

internally calls:

```swift id="0jbdod"
UserDefaults.standard.set(true, forKey: "isLoggedIn")
```

---

# 🔥 Important Understanding

---

## Stored Property

```swift id="7d9m24"
static var value: Bool = false
```

👉 Memory stored directly

---

## Computed Property

```swift id="90vf3y"
static var value: Bool {
    get { ... }
    set { ... }
}
```

👉 No direct storage
👉 Computed dynamically

---

# 🔹 Why static properties especially need initialization

Because:

* They belong to TYPE itself
* Created before instances

Swift requires complete initialization.

---

# 🔹 Interview Insight

> “A stored static property must be initialized because Swift guarantees memory safety and prevents uninitialized values. If no stored value is needed, a computed property with getter/setter can be used instead.”

---

# 🔚 Final Takeaway

```text id="11lf4n"
Stored property → needs value
Computed property → needs getter
```

---

# ✅ Correct UserDefaults Pattern

```swift id="k0jlwm"
struct Settings {

    static var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }
    }
}
```
 
