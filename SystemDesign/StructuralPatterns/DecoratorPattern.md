
# 🌟 **1️⃣ Decorator Pattern**

### 👉 What is the Decorator Pattern?

> **Decorator Pattern lets you add extra features to an object *without modifying* the original class.**
>
> You “wrap” the original object inside another object that adds new behavior.

---

## 🍕 **Super Simple Layman Example (Pizza Example)**

### Base Pizza

```swift
protocol Pizza {
    func cost() -> Int
}
```

### Simple Pizza

```swift
class BasicPizza: Pizza {
    func cost() -> Int { return 100 }
}
```

### Adding Toppings = Decorators

You don’t change the original pizza.
You wrap it with extra toppings.

```swift
class CheeseDecorator: Pizza {
    let pizza: Pizza
    init(_ pizza: Pizza) { self.pizza = pizza }

    func cost() -> Int {
        return pizza.cost() + 30
    }
}
```

Usage:

```swift
let pizza = CheeseDecorator(BasicPizza())
print(pizza.cost())   // 130
```

### ✔ What Happened?

* Original class unchanged
* You wrapped it to add a feature
* You can add unlimited decorators

This is **Decorator Pattern**.

---

## 🌟 **2️⃣ Why Do We Use the Decorator Pattern? (Simple)**

* When you want to add features **without changing existing code**
* When you want **flexible combinations** of features
* When inheritance becomes messy (class explosion)

Instead of:

```
ButtonWithBorderAndShadow
ButtonWithShadowAndCornerRadius
ButtonWithGlowAndBorder
```

Use decorators to add features **dynamically**.

---

## 🌟 **3️⃣ Professional Interview Example (iOS Version)**

## 📱 **Adding Features to a UIView (Border, Shadow, Rounded Corners)**

This example is excellent for interviews because:

* It’s real iOS
* It’s simple
* It perfectly represents Decorator

---

### Base Component (Protocol)

```swift
protocol ViewComponent {
    func draw()
}
```

---

### Concrete Component (Basic UIView)

```swift
class BasicView: ViewComponent {
    func draw() {
        print("Drawing basic view")
    }
}
```

---

### Decorator Base Class

```swift
class ViewDecorator: ViewComponent {
    let component: ViewComponent
    
    init(_ component: ViewComponent) {
        self.component = component
    }
    
    func draw() {
        component.draw()
    }
}
```

---

### Concrete Decorators

#### 🔹 Border Decorator

```swift
class BorderDecorator: ViewDecorator {
    override func draw() {
        super.draw()
        print(" + adding border")
    }
}
```

#### 🔹 Shadow Decorator

```swift
class ShadowDecorator: ViewDecorator {
    override func draw() {
        super.draw()
        print(" + adding shadow")
    }
}
```

#### 🔹 CornerRadius Decorator

```swift
class CornerRadiusDecorator: ViewDecorator {
    override func draw() {
        super.draw()
        print(" + adding corner radius")
    }
}
```

---

### Usage (Dynamic Decoration)

```swift
let view = BasicView()

let borderedView = BorderDecorator(view)
let shadowBorderView = ShadowDecorator(borderedView)
let roundedShadowBorderView = CornerRadiusDecorator(shadowBorderView)

roundedShadowBorderView.draw()
```

### Output:

```
Drawing basic view
 + adding border
 + adding shadow
 + adding corner radius
```

✔ You added features dynamically
✔ No subclass explosion
✔ No modification of BasicView

---

## 🌟 **4️⃣ Interview-Ready Definition**

> **Decorator Pattern allows adding additional behavior to an object at runtime by wrapping it with decorator classes. It avoids subclass explosion and follows the Open/Closed principle because the original object is never modified.**

---

## 🌟 **5️⃣ When Not to Use Decorator**

* When inheritance is simpler
* When behavior must be added in the middle of the call chain (confusing)
* When too many nested wrappers make debugging hard

---

## 🌟 **6️⃣ Decorator vs Inheritance (Interview Point)**

| Inheritance                   | Decorator                  |
| ----------------------------- | -------------------------- |
| Adds behavior at compile time | Adds behavior at runtime   |
| Can lead to many subclasses   | Avoids class explosion     |
| Not flexible                  | Very flexible combinations |

---

## 🌟 **7️⃣ Memory Trick**

> **Decorator = Gift wrapping. The gift stays the same, the wrapper adds more beauty.**

---

## 🎯 **Summary One-Liner for Interview**

> *“Decorator Pattern lets me add features to objects dynamically by wrapping them, without modifying their original code. It’s great for UI styling, logging, caching, and adding optional behaviors.”*  

# **Example-1**

Absolutely! Here is **another clean, runnable, real iOS-friendly Decorator Pattern example**.
This one is **very easy to understand** and you can literally paste it into a Playground or Xcode and see the output.

This example uses a **Notification Sender**, and we dynamically add:

* **Logging**
* **Analytics Tracking**
* **Encryption**

✔ No subclassing
✔ No modifying original class
✔ Behavior added at runtime
✔ Perfect for interviews

---

## ✅ **Decorator Example #2 — Notification Sender (Runnable Code)**

---

## 1️⃣ **Base Component**

```swift
protocol Notifier {
    func send(message: String)
}
```

---

## 2️⃣ **Concrete Component**

```swift
class BasicNotifier: Notifier {
    func send(message: String) {
        print("Sending message: \(message)")
    }
}
```

✔ This has no logging, no tracking, no encryption
✔ We will add all features using Decorators

---

## 3️⃣ **Base Decorator Class**

```swift
class NotifierDecorator: Notifier {
    private let notifier: Notifier
    
    init(_ notifier: Notifier) {
        self.notifier = notifier
    }
    
    func send(message: String) {
        notifier.send(message: message)
    }
}
```

---

## 4️⃣ **Concrete Decorators (Add features dynamically)**

### 🔹 Logging Decorator

```swift
class LoggingDecorator: NotifierDecorator {
    override func send(message: String) {
        print("Logging: \(message)")
        super.send(message: message)
    }
}
```

---

### 🔹 Analytics Decorator

```swift
class AnalyticsDecorator: NotifierDecorator {
    override func send(message: String) {
        print("Tracking analytics for message")
        super.send(message: message)
    }
}
```

---

### 🔹 Encryption Decorator

```swift
class EncryptionDecorator: NotifierDecorator {
    override func send(message: String) {
        let encrypted = "🔐\(message)🔐"
        print("Encrypting message...")
        super.send(message: encrypted)
    }
}
```

---

## 5️⃣ **Using the Decorators (RUN THIS!)**

### Example 1 — Just basic sending

```swift
let notifier1: Notifier = BasicNotifier()
notifier1.send(message: "Hello World")
```

---

### Example 2 — Logging + Sending

```swift
let notifier2: Notifier = LoggingDecorator(BasicNotifier())
notifier2.send(message: "Hello World")
```

---

### Example 3 — Analytics + Logging + Sending (Chaining)

```swift
let notifier3: Notifier =
    AnalyticsDecorator(
        LoggingDecorator(
            BasicNotifier()
        )
    )

notifier3.send(message: "Hello World")
```

---

### Example 4 — Encryption + Analytics + Logging + Sending

```swift
let notifier4: Notifier =
    EncryptionDecorator(
        AnalyticsDecorator(
            LoggingDecorator(
                BasicNotifier()
            )
        )
    )

notifier4.send(message: "Hello World")
```

---

## ✔ Expected Output Example (for Example 4)

```
Encrypting message...
Tracking analytics for message
Logging: Hello World
Sending message: 🔐Hello World🔐
```

---

# 🎯 What You Learn From This Example

✔ Each decorator adds new behavior
✔ Behaviors stack dynamically
✔ No modification to BasicNotifier
✔ No subclass explosion
✔ You can add/remove features anytime

This is the **exact power** of the Decorator Pattern.

---

## ⭐ Interview-Ready Explanation (use this!)

> “Decorator Pattern allows us to add optional behaviors to an object at runtime by wrapping it.
> In my example, the BasicNotifier was wrapped with logging, analytics, and encryption decorators.
> Each decorator added new behavior without changing the original class.
> This is perfect for flexible features like styling UI, adding middleware, logging network calls, etc.”

---

# **Example-2** 

Great! Here are the **two real iOS Decorator Pattern examples** you requested:

---

## ⭐ **1️⃣ URLSession Logging Decorator (Real iOS Example)**

This is a **perfect practical example** of the Decorator Pattern applied to networking.
You can use it **in production**, and it's a favorite in interviews.

---

## 🔹 Step 1: Define a Network Interface

```swift
protocol NetworkService {
    func fetch(url: URL) async throws -> (Data, URLResponse)
}
```

---

## 🔹 Step 2: Concrete Component — Real URLSession

```swift
class URLSessionService: NetworkService {
    func fetch(url: URL) async throws -> (Data, URLResponse) {
        return try await URLSession.shared.data(from: url)
    }
}
```

---

## 🔹 Step 3: Base Decorator

```swift
class NetworkServiceDecorator: NetworkService {
    let service: NetworkService
    
    init(_ service: NetworkService) {
        self.service = service
    }
    
    func fetch(url: URL) async throws -> (Data, URLResponse) {
        return try await service.fetch(url: url)
    }
}
```

---

## 🔹 Step 4: Logging Decorator (adds extra behavior)

```swift
class LoggingNetworkDecorator: NetworkServiceDecorator {
    
    override func fetch(url: URL) async throws -> (Data, URLResponse) {
        print("➡️ Request URL:", url.absoluteString)
        
        let (data, response) = try await super.fetch(url: url)
        
        print("⬅️ Response Status:", (response as? HTTPURLResponse)?.statusCode ?? 0)
        print("⬅️ Data Size:", data.count, "bytes")
        
        return (data, response)
    }
}
```

---

## 🔹 Step 5: Usage (Decorator in Action)

```swift
let network = LoggingNetworkDecorator(URLSessionService())

Task {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    let (data, _) = try await network.fetch(url: url)
    print("Final Data:", String(data: data, encoding: .utf8)!)
}
```

---

## 🎯 **What happens?**

Output:

```
➡️ Request URL: https://jsonplaceholder.typicode.com/todos/1
⬅️ Response Status: 200
⬅️ Data Size: 120 bytes
Final Data: { ... JSON ... }
```

✔ URLSession stays untouched
✔ Logging can be added/removed dynamically
✔ No subclass explosion
✔ Perfect Decorator example

---

## ⭐ **2️⃣ Decorator Pattern Using SwiftUI View Modifiers**

SwiftUI’s **entire modifier system is based on Decorator Pattern.**
Every `.modifier(...)` wraps the original view with new behavior.

Let’s build a custom decorator-style modifier.

---

## 🔹 Step 1: Create Base View Modifier

```swift
struct CardDecorator: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 6)
    }
}
```

---

## 🔹 Step 2: Create Extension to Apply Decorator Easily

```swift
extension View {
    func cardStyle() -> some View {
        self.modifier(CardDecorator())
    }
}
```

---

## 🔹 Step 3: Use It (Decoration Happens Here)

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello Decorator!")
            .cardStyle()     // <-- Decorator applied here
    }
}
```

---

## 🧠 How is this Decorator Pattern?

✔ `Text` is the base component
✔ `.cardStyle()` wraps it with padding → bg → cornerRadius → shadow
✔ Behavior added dynamically
✔ No subclassing (`CardText`, `ShadowedText`, etc.)

SwiftUI modifiers = **Decorator Pattern in action**.

---

## ⭐ **Interview Answer for SwiftUI Decorator**

> “In SwiftUI, every view modifier is essentially a decorator.
> The original view stays unchanged, but gets wrapped with additional visual behavior like padding, borders, shadows, etc.
> This is a clean example of Decorator Pattern in iOS frameworks.”

---

## 🎊 Summary

| Example                      | Why it's Decorator Pattern?                          |
| ---------------------------- | ---------------------------------------------------- |
| URLSession Logging Decorator | Adds behavior (logging) without modifying URLSession |
| SwiftUI View Modifiers       | Wrap views with styling behavior dynamically         |







