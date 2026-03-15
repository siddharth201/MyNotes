
# iOS Questions Answers  

## iOS Basics

### Q. Can you explain the iOS Application Lifecycle?
<details>
<summary>Answer</summary>
The iOS app lifecycle is managed by the UIApplication object. The main states are:  

**(NIABS)**

**1. Not Running:** App is not launched or has been terminated.

**2. Inactive:** App is running but not receiving events (e.g., incoming call).

**3. Active:** App is running in the foreground and receiving user input.

**4. Background:** App is running code in the background but not visible to the user.

**5. Suspended:** App is in memory but not executing code, ready to be resumed quickly.  

### Callbacks in AppDelegate:  

`Fin uses DBA & WRA to Enter Background and Foreground Terminals`

• `application(_:didFinishLaunchingWithOptions:)` → called when the app launches.

• `applicationDidBecomeActive(_:)` → app enters foreground.

• `applicationWillResignActive(_:)` → app will move to inactive state.

• `applicationDidEnterBackground(_:)` → app moved to background.

• `applicationWillEnterForeground(_:)` → app is about to become active again.

• `applicationWillTerminate(_:)` → app is about to be killed.
</details>  

### Q. Can you explain the UIViewController lifecycle.
<details>
<summary>Answer</summary>
A UIViewController manages a screen in an iOS app. The lifecycle methods are:

`1. init(coder:) / init(nibName:bundle:)` → initialization of controller.

`2. loadView()` → loads the main view (used rarely, mostly overridden when creating views programmatically).

`3. viewDidLoad()` → called once when the view is loaded into memory (best place to set up UI, API calls).

`4. viewWillAppear(_:)` → called before the view appears on screen (update UI, analytics).

`5. viewDidAppear(_:)` → called when view is visible (start animations, video, etc.).

`6. viewWillDisappear(_:)` → called before leaving the screen (save data, stop animations).

`7. viewDidDisappear(_:)` → called when the view has gone offscreen (clean-up tasks).

`8. deinit` → called when the view controller is deallocated (release resources).
</details> 

### Q. Explain `UIKit` application lifecycle vs `SwiftUI` application lifecycle?
<details>
<summary>Answer</summary>   
In `SwiftUI`, the lifecycle is slightly different because Apple introduced the `App protocol` (starting iOS 14) instead of relying on `AppDelegate`.
But internally the `same iOS states still exist` — SwiftUI just exposes them differently using `ScenePhase`.

So the `parallel concept in SwiftUI` is:

* `ScenePhase`
* `.onChange(of: scenePhase)`
* `.onAppear`
* `.onDisappear`
* optional `UIApplicationDelegateAdaptor` if you still want AppDelegate.

---

## 1. SwiftUI Lifecycle States (Parallel to UIKit)

| UIKit State | SwiftUI Equivalent             | Meaning                              |
| ----------- | ------------------------------ | ------------------------------------ |
| Not Running | App not launched               | Same                                 |
| Inactive    | `.inactive`                    | App temporarily not receiving events |
| Active      | `.active`                      | App in foreground and interactive    |
| Background  | `.background`                  | App running in background            |
| Suspended   | `.background` (system handled) | Not directly observable              |

SwiftUI exposes these through `ScenePhase`.

Example:

```swift
@Environment(\.scenePhase) private var scenePhase
```

---

## 2. SwiftUI Equivalent of AppDelegate Callbacks

## UIKit vs SwiftUI Mapping

| UIKit Callback                   | SwiftUI Equivalent                      |
| -------------------------------- | --------------------------------------- |
| `didFinishLaunchingWithOptions`  | `init()` of App OR `.task` in root view |
| `applicationDidBecomeActive`     | `scenePhase == .active`                 |
| `applicationWillResignActive`    | `scenePhase == .inactive`               |
| `applicationDidEnterBackground`  | `scenePhase == .background`             |
| `applicationWillEnterForeground` | `.background → .active` transition      |
| `applicationWillTerminate`       | Not reliable in SwiftUI (same in UIKit) |

---

## 3. SwiftUI Lifecycle Example

Main App file:

```swift
@main
struct MyApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newPhase in

            switch newPhase {

            case .active:
                print("App became active")

            case .inactive:
                print("App became inactive")

            case .background:
                print("App moved to background")

            @unknown default:
                break
            }
        }
    }
}
```

---

## 4. Visual Lifecycle Flow in SwiftUI

```
App Launch
   ↓
inactive
   ↓
active
   ↓
inactive (interruption)
   ↓
background
   ↓
suspended (system controlled)
```

---

## 5. When You Still Need AppDelegate in SwiftUI

Some things `still require AppDelegate`, like:

* Push Notifications
* Background fetch
* Deep links
* Firebase setup
* Third-party SDK initialization

SwiftUI allows this using:

```swift
@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
```

Example:

```swift
class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        print("App launched")
        return true
    }
}
```

---

## 6. Real Interview-Level Answer (Short Version)

If asked in an `iOS interview`:

> In SwiftUI the app lifecycle is managed by the `App protocol` instead of AppDelegate.
> The lifecycle state is observed using `ScenePhase` (`active`, `inactive`, `background`).
> We monitor transitions using `.onChange(of: scenePhase)`.
> For features like push notifications or SDK initialization, we can still integrate UIKit lifecycle using `UIApplicationDelegateAdaptor`.

---

✅ `UIKit → SwiftUI Summary`

```
AppDelegate        →     ScenePhase
didFinishLaunching →     App init()
DidBecomeActive    →     .active
WillResignActive   →     .inactive
DidEnterBackground →     .background
```
</details> 

### Q. What is the difference between CFBundleVersion and CFBundleShortVersionString?
<details>
<summary>Answer</summary>  

**CFBundleShortVersionString**  

• This is the “marketing version” of your app.

• Usually shown to users in the App Store or app settings.

• Format: "Major.Minor.Patch" (e.g., "1.2.3")

• Purpose: Communicate the app version to users.

**Example in Info.plist:**

```
<key>CFBundleShortVersionString</key>
<string>1.2.3</string>
```

---

**CFBundleVersion**

• This is the “build number” of your app.

• Represents a specific build for internal tracking or deployment.

• Can be any string (usually integer increments: "1", "2", "3").

• Purpose: Track specific builds for testing, CI/CD, or App Store uploads.

**Example in Info.plist:**

```
<key>CFBundleVersion</key>
<string>45</string>
```
</details>  


## **Swift Programming Language**  

### **Q. What is the difference between var and let in Swift?**
<details>
<summary>Answer</summary>  

In Swift, we use `var` and `let` to store values in memory.
But the difference comes in how we can change those values later.
  
  
**var = Variable (Changeable value)**

• If you use **var**, the value can be changed later.

**Example:**

```
var name = "Anand"
name = "Rahul"   // Allowed
```

**let = Constant (Fixed value)**

• If you use **let**, the value cannot be changed once it’s assigned.

**Example:**

```
let pi = 3.14159
pi = 3.14   // Error: Cannot change a constant
```

This makes your code **safe** because you know the value won’t change accidentally.

**When to use var:**

* Use it when the value is expected to change in the future.
* Example:

  * User’s current location
  * A counter in a loop
  * A score in a game

**When to use let:**

* Use it when the value should stay the same.
* Example:

  * Birthdate of a person
  * API keys
</details>  

### **Q. What are the common data types in Swift?**
<details>
<summary>Answer</summary> 

**1. Int →** Whole numbers (10, -5)

**2. Double →** Decimal numbers with precision (3.14, -0.99)

**3. Float →** Decimal with less precision than Double

**4. String →** Text values ("Hello")

**5. Bool →** true or false

**6. Character →** Single letter ("A")

**7. Array →** Ordered list ([1,2,3])

**8. Dictionary →** Key-value pairs (["name": "Anand"])

**9. Set →** Unique unordered values ({1,2,3})

Swift is **type-safe →** Once a variable is declared with a type, you can’t assign a different type.
</details>  

### **Q. Explain `Float` vs `Double` in Swift?**
<details>
<summary>Answer</summary>  
  
Think of **Double** and **Float** like two different sizes of containers for decimal numbers. While they both store numbers with fractional parts, the difference lies in their capacity for detail (precision) and how much "space" they take up in your computer's memory.

### The Breakdown

| Feature | **Float** | **Double** |
| --- | --- | --- |
| **Bit Size** | 32-bit | 64-bit |
| **Precision** | ~6 to 9 decimal digits | ~15 to 17 decimal digits |
| **Memory Usage** | Smaller (4 bytes) | Larger (8 bytes) |
| **Swift Default** | No | **Yes** |

---

### 1. The "Precision" Gap

The most significant difference is how many numbers they can accurately track after the decimal point.

* **Float:** Useful when you have thousands of numbers to process and memory is tight (like in some graphics or sensor data), but it starts "rounding off" or losing accuracy much sooner.
* **Double:** Because it uses twice as many bits, it is far more precise. In modern programming (like Swift or Kotlin), **Double is the preferred default** for almost everything.

### 2. Real-World Example: GPS Coordinates

Imagine you are tracking a location:

* **Using a Float:** Might get you to the right city or neighborhood, but because it lacks precision, the "math" might round off, placing you a block away from where you actually are.
* **Using a Double:** Can pinpoint your location down to a few millimeters. This is why mapping apps almost exclusively use `Double`.

### 3. When to use which?

* **Use Double:** For almost everything. Money (if not using special Decimal types), coordinates, and scientific calculations. If you type `let pi = 3.14` in Swift, the compiler automatically assumes it’s a **Double**.
* **Use Float:** Only when specifically required by an API (like some older Graphics frameworks) or if you are working on a high-performance system where saving every byte of memory is a life-or-death situation.

> **Pro-Tip:** Never compare two Floating-point numbers using a strict "equals" ($==$). Because of how they are stored in binary, $0.1 + 0.2$ might actually equal $0.30000000000000004$!  
</details>    

### **Q. Explain `String` vs `Character` in Swift?**
<details>
<summary>Answer</summary>   
 
In Swift, the relationship between a **String** and a **Character** is like the relationship between a necklace and a single bead. One is a collection; the other is a single unit.

### 1. The Definitions

* **Character:** A single "extended grapheme cluster." This is a fancy way of saying it’s a single human-readable symbol (like "A", "5", or even an emoji like "🚀").
* **String:** An ordered collection of Characters. It is a more complex structure that allows for searching, appending, and formatting text.

---

### 2. Key Differences

| Feature | **Character** | **String** |
| --- | --- | --- |
| **Capacity** | Exactly **one** symbol | Zero, one, or **millions** of symbols |
| **Literal Syntax** | `"A"` (Must be explicitly typed) | `"A"` (Default type for quotes) |
| **Manipulation** | Limited (mostly checking properties) | Powerful (interpolation, uppercase, etc.) |
| **Memory** | Fixed size for one symbol | Dynamic size |

---

### 3. The "Extended Grapheme Cluster" Magic

Swift is famous for how it handles Unicode. In many older languages, an emoji might be treated as two separate "pieces." In Swift, a **Character** is defined by what a human sees as one character.

* **Example:** The emoji 👨‍👩‍👧‍👦 (Family) is technically made of four separate emojis joined together, but Swift treats it as **one single Character**.
* **String Length:** If you put that emoji in a String, the `count` is 1.

---

### 4. How to use them in code

By default, Swift assumes any text in double quotes is a **String**. If you want a **Character**, you have to tell the compiler explicitly.

```swift
// This is automatically a String
let dog = "Dog" 

// This is also automatically a String, even though it's one letter
let letterS = "A" 

// You must explicitly define a Character
let realCharacter: Character = "A" 

// You can't do this (will cause an error):
// let errorChar: Character = "AB" 

```

### 5. Interaction

You can think of a `String` as an **Array of Characters**. You can loop through a String to pull out each individual Character:

```swift
let greeting = "Hi!"

for char in greeting {
    print(char)
}
// Prints:
// H
// i
// !

```
---  
</details> 


### **Q: What are optionals in Swift and why do we need them?**
<details>
<summary>Answer</summary>  

• In Swift, a variable **must always have a value**.  
• But sometimes, a value may be missing (like data from an API or database).  
• To handle this, Swift uses **Optionals**.

**Optional means:** The variable can hold a value OR **nil**.

**Example:**

```
var name: String? = "Anand"
name = nil   // allowed because it's optional
```

**Why is it needed?**

* Avoids null pointer errors (common in other languages).
* Makes code safer by forcing you to check before using.

**Ways to use Optionals:**

**1. Forced Unwrapping (!)**

```
let value: String? = "Hello"
print(value!)   // "Hello", but crash if nil
```

Use only if you are sure it’s not nil.

**2. Nil Coalescing (??)**

```
let username = name ?? "Guest"
```

If the name is nil, it will use "Guest".

**3. Optional Binding (if let / guard let)**

```
if let value = value {
    print(value)   // safe
}
```
</details>  


### **Q: What are closures in Swift?**
<details>
<summary>Answer</summary> 

• A closure is a **block of code** that you can store in a variable, pass as an argument, and call later.  
• Think of it as a **function without a name (anonymous function).**

**Example:**

```
let greet = { (name: String) -> String in
    return "Hello, \(name)"
}

print(greet("Anand"))   // "Hello, Anand"
```

**Closures are used for:**

1. Callbacks (e.g., when a button is clicked)
2. Passing code as a function parameter
3. Asynchronous tasks like API completion handlers
4. Higher-Order Functions like map, filter, reduce  
</details>

### **Q: What are Higher Order Functions in Swift?**
<details>
<summary>Answer</summary>  

• A **Higher Order Function (HOF)** is a function that either:

* Takes another function as a parameter
* Returns a function as its result
* (Or it can do both!)

These functions make code **shorter, cleaner, and easier to read**.

Swift gives us some very commonly used HOFs to work with collections like **Array**:

**1. map → Transform each element**

```
let numbers = [1,2,3]
let squared = numbers.map { $0 * $0 }   // [1,4,9]
```

Use case: When you want to convert or transform each item in an array.

**2. filter → filters elements based on a condition**

```
let even = numbers.filter { $0 % 2 == 0 }   // [2]
```

Use case: When you want to keep only certain items based on a condition.

**3. reduce → combines all values into one**

```
let sum = numbers.reduce(0) { $0 + $1 }   // 6
```

Use case: When you want to add, multiply, or combine all values into a single result.

**4. compactMap → removes nil values while transforming**

```
let numbers = ["1", "2", "three", "4"]
let validNumbers = numbers.compactMap { Int($0) }
print(validNumbers)   // [1,2,4]
```

Use case: When converting data that may fail (like String → Int).

**5. forEach → loop over elements in a cleaner way**

```
let names = ["Anand", "Rahul", "Neha"]
names.forEach { print("Hello, \($0)") }
```

Use case: Simple iteration with cleaner syntax than for-in.

**Why use Higher Order Functions?**

* Make code shorter and cleaner
* Avoid writing long for loops
* Easy to understand once you know them
* Very useful in functional programming style
</details>  


### **Q: What are Extensions in Swift?**
<details>
<summary>Answer</summary>   

• An extension in Swift is a way to **add new functionality** to an existing class, struct, enum, or protocol.  
• You can extend both your own types and system types (like String, Int, etc.).

**Why Use Extensions?**

* To add extra features without modifying original source code.
* To keep your code organized and readable.

**What You Can Do with Extensions**

* Add new computed properties
* Add new methods (instance methods, type methods)
* Add initializers
* Add subscripts
* Make a type conform to a protocol

But remember: You **cannot add stored properties** in an extension.

**Example:**

```
extension String {
    var isPalindrome: Bool {
        return self == String(self.reversed())
    }
}
```

```
print("level".isPalindrome)   // true
print("swift".isPalindrome)   // false
```

Here, we added a new property **isPalindrome** to String.

**Benefits of Extensions**

* Keep code clean and modular
* Add functionality to system types
* Helps in protocol-oriented programming
</details>

### **Q: What are Protocols in Swift?**
<details>
<summary>Answer</summary>   

• A protocol is like a **blueprint** in Swift.  
• It defines a set of **methods, properties, or requirements** that a class, struct, or enum must follow if it adopts the protocol.

**Why Protocols?**

* To make sure different types follow the same rules
* To achieve abstraction (focus on what a type can do, not how it does it)
* To enable polymorphism

**Declaring a Protocol:**

```
protocol Drivable {
    func startEngine()
    func drive()
}
```

**Adopting a Protocol:**

```
class Car: Drivable {
    func startEngine() {
        print("Car engine started")
    }

    func drive() {
        print("Car is driving")
    }
}

let myCar = Car()
myCar.startEngine()
myCar.drive()
```
</details>

### **Q: What are Generics in Swift and Why are They Useful?**
<details>
<summary>Answer</summary> 

• Generics allow you to write **flexible, reusable code**.  
• Instead of writing separate functions for Int, String, Double, etc., you write **one generic function**.

**Basic Example without Generics**

```
func swapInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

func swapStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}
```

You end up writing duplicate code for every type.

**Generic Solution**

```
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
```

```
var x = 10
var y = 20
swapValues(&x, &y)

var str1 = "Hello"
var str2 = "World"
swapValues(&str1, &str2)
```

**T** is a placeholder type that works for any type.

**Why Generics are Useful**

* Avoids code duplication
* Makes code flexible
* Improves readability and maintainability
* Ensures type safety

**Use Case**

* Networking libraries use generics to return different models.

**Example: One generic API function to decode JSON**

```
func decodeJSON<T: Decodable>(_ data: Data, as type: T.Type) -> T? {
    let decoder = JSONDecoder()
    return try? decoder.decode(T.self, from: data)
}
```

**Benefits of Generics**

* Write less code → avoid repetition
* Reusable → works across many types
* Type-safe → errors caught at compile time
* Powerful → used everywhere in Swift (Arrays, Dictionaries, Combine, SwiftUI)
</details>  


### Q. Difference between Value Type and Reference Type in Swift?
<details>
<summary>Answer</summary>  

**Value Type:**
When you assign or pass them, a **copy** of the data is created.

**Reference Type:**
When you assign or pass them, only a **reference (pointer)** to the same data is shared.

---

### **Examples**

**Value Types →** `struct`, `enum`, `tuple`
**Reference Types →** `class`, `closure`

---

### **Memory Behavior**

• Value types are stored in **stack memory**.
• Reference types are stored in **heap memory** (and managed by ARC – Automatic Reference Counting).

---

### **Copying Behavior**

**Value Type:**
Each variable holds its own copy. Changing one does **not affect** the other.

**Reference Type:**
Multiple variables can point to the same object. Changing one affects all references.

---

### **Example of Value Type**

```
struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 1, y: 2)
var p2 = p1   // copy created
p2.x = 10

print(p1.x)   // 1 (not affected)
```

---

### **Example of Reference Type**

```
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var person1 = Person(name: "Anand")
var person2 = person1   // both point to same object
person2.name = "Gaur"

print(person1.name)   // Gaur (changed!)
print(person2.name)   // Gaur
```

---

### **Mutability**

• Value type immutability depends on whether the variable is declared with `let` (constant).
• Reference type variables declared with `let` → You **can modify properties** inside the object, but you **cannot reassign** it to another object.

---

### **Performance**

• Value types (structs) are generally **faster and lightweight** because they live on the stack.
• Reference types (classes) are **heavier** due to heap allocation and ARC overhead.

---

### **When to Use?**

**Value Type (structs):**
Use when you want **independent copies**, immutability, and safer code (preferred in Swift).
Examples: coordinates, settings, models.

**Reference Type (classes):**
Use when you want **shared state or inheritance**.
Examples: UI elements, network managers.
</details>

### Q. Difference between static and class variable in Swift
<details>
<summary>Answer</summary>  

**static variable →**
Belongs to the type itself, not to any instance.
Cannot be overridden in subclasses.

**class variable →**
Also belongs to the type, but **can be overridden by subclasses**.

---

### **Usage Context**

• `static` can be used in **structs, enums, and classes**.  
• `class` can only be used in **classes** (because overriding is only possible in classes).

---

### **Overriding**

• `static` → Cannot be overridden.
• `class` → Can be overridden in subclasses.

---

### **Example with static**

```
class Animal {
    static var species = "Unknown"
}

class Dog: Animal {
    // Error: Cannot override static variable
    // override static var species = "Dog"
}

print(Animal.species)   // Unknown
```

---

### **Example with class**

```
class Animal {
    class var species: String {
        return "Unknown"
    }
}

class Dog: Animal {
    override class var species: String {
        return "Dog"
    }
}

print(Animal.species)   // Unknown
print(Dog.species)      // Dog
```

---

### **Memory Behavior**

• Both `static` and `class` variables are **type-level** (shared across all instances).  
• Not tied to individual objects.

---

### **When to Use**

• Use **static** when you want a shared constant/utility that should **not be overridden**
(e.g., helper constants, utility functions).

• Use **class** when you want subclasses to **provide their own implementation**.

---

### **Common Use Cases**

• `static` → Config constants, utility methods, singleton patterns.  
• `class` → Properties like `species` or `typeName` where each subclass should have its own version.
</details>  


### Q. Explain the use of defer keyword in Swift
<details>
<summary>Answer</summary>  

`defer` is used to schedule a block of code that will be executed **just before leaving the current scope** (like when the function ends).

---

### **Purpose**

• Ensures that certain cleanup or finishing tasks are done **no matter how the function exits**
(normal return or error).

---

### **Execution Order**

• If you have multiple `defer` blocks, they are executed in **reverse order** (last-in, first-out).

---

### **Example**

```
func testDefer() {
    defer {
        print("Cleanup before exit")
    }

    print("Inside function")
}

testDefer()

// Output:
// Inside function
// Cleanup before exit
```
</details>  

### Q. Explain Optional Binding (if let and guard let) in Swift.  
<details>
<summary>Answer</summary>    

    ● In Swift, an Optional means a variable may or may not have a value (nil).  
    ● Optional Binding is a way to safely unwrap an optional and use its value without force unwrapping (!). 
   
 ### 1. if let
    ● Used when you want to check if an optional has a value, and if yes, use it inside a block.   
    ● If the optional is nil, the block is skipped.  

</details>  




