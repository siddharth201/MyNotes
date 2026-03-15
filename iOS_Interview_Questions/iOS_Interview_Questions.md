
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

• In Swift, an **Optional** means a variable may or may not have a value (`nil`).

• **Optional Binding** is a way to **safely unwrap** an optional and use its value without force unwrapping (`!`).

---

## 1. if let

• Used when you want to check if an optional has a value, and if yes, use it inside a block.

• If the optional is `nil`, the block is skipped.

### Example

```swift
var name: String? = "Anand"

// Using if let
if let unwrappedName = name {
    print("Hello, \(unwrappedName)")
} else {
    print("No name found")
}
```

### How it works

• If `name` has a value, it gets unwrapped into `unwrappedName`.

• If it's `nil`, the `else` part executes.

---

## 2. guard let

• Used when you want to unwrap early and **exit the function/loop** if the optional is `nil`.

• It helps write **cleaner code** because unwrapped values can be used after the `guard` statement.

### Example

```swift
func greet(user: String?) {
    guard let username = user else {
        print("No user found")
        return
    }

    print("Hello, \(username)")
}

greet(user: "Anand")   // Output: Hello, Anand
greet(user: nil)       // Output: No user found
```

### How it works

• If `user` has a value, it gets unwrapped into `username` and continues.

• If `user` is `nil`, it exits early with `return`.

---

## Key Differences (if let vs guard let)

### 1. if let

• Value is only available **inside the if block**.
• Good for **small checks**.

### 2. guard let

• Value is available **outside the guard block**.
• Forces you to handle the `nil` case immediately, keeping the main logic cleaner.

---
</details>

### Q. What is a Tuple in Swift?  
<details>
<summary>Answer</summary>  

• A **Tuple** is a way to group **multiple values into a single compound value**.

• The values can be of **different data types** (e.g., Int, String, Bool).

• Tuples are useful when you want to **return multiple values from a function** or temporarily store related values together without creating a struct/class.

### Example

```swift
let student = ("Anand", 28, true)
```

---

## When to Use Tuples?

• When you need a **lightweight way to group related values**.

• When returning **multiple values from a function** without making a struct/class.

• For **temporary data grouping** (not long-term storage).

---  

</details>

### Q. What is the difference between Any, AnyObject, and NSObject in Swift?  
<details>
<summary>Answer</summary>  

---

## 1. Any

• `Any` can represent **any type in Swift**.

• It can hold values of **structs, enums, classes, functions, tuples**, basically everything.

• Useful when you **don’t know the exact type in advance**.

• But you’ll usually need to **type cast later** to use it safely.

### Example

```swift
var value: Any = 42        // Int
value = "Hello Swift"      // String
value = [1,2,3]            // Array
```

---

## 2. AnyObject

• `AnyObject` represents **any instance of a class type**.

• It **only works with class objects**, not structs or enums.

• Commonly used when working with **Objective-C APIs** (Foundation, UIKit) that expect objects.

### Example

```swift
class Person {}

let obj: AnyObject = Person()
```

This will **not work**:

```swift
let number: AnyObject = 10   // Error (Int is a struct, not a class)
```

---

## 3. NSObject

• `NSObject` is a **base class from Objective-C**.

• All classes in **UIKit/AppKit inherit from NSObject**.

• Provides **basic functionality** like:

* comparison
* description
* KVO (Key-Value Observing)
* selectors

• If you want your Swift class to work well with the **Objective-C runtime**, you often inherit from `NSObject`.

### Example

```swift
import Foundation

class Animal: NSObject {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let dog = Animal(name: "Bruno")
print(dog.description)
```

---  
</details>

### Q. What is the difference between weak, strong, and unowned in Swift?  
<details>
<summary>Answer</summary>  

---

## 1. Strong

• By default, all references in Swift are **strong**.

• A strong reference means:

* As long as this reference exists, the object it points to **stays in memory**.
* The reference **increases the retain count** of the object.

### Example

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var p1: Person? = Person(name: "Anand")   // Strong reference
var p2 = p1                               // Another strong reference
```

Here, `p1` and `p2` both strongly hold the object, so it won't be deallocated until both are set to `nil`.

---

## 2. Weak

• A **weak reference does not increase the retain count**.

• When the object is deallocated, the weak reference is **automatically set to nil**.

• Always declared as `var` (because it can change to nil).

• Useful to **avoid retain cycles** (like in delegate patterns).

### Example

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    weak var tenant: Person?
}
```

If the `Person` is deallocated, `tenant` will automatically become `nil`.

---

## 3. Unowned

• Similar to `weak`, but:

* It **does not increase retain count**.
* Unlike `weak`, it **does NOT become nil automatically**.

• It assumes the object will **always exist during its lifetime**.

• Declared as `unowned let` or `unowned var`.

• If the object is deallocated and you try to access it, the **app will crash**.

### Example

```swift
class CreditCard {
    unowned let owner: Person

    init(owner: Person) {
        self.owner = owner
    }
}
```

Use **unowned** when the object is **guaranteed to outlive the reference**.

---
</details>  


### Q. What is the difference between map, compactMap, and flatMap in Swift?
<details>
<summary>Answer</summary>  

## 1. map

• **What it does:** Transforms each element in a collection and returns a new collection with the same number of elements.

• **Key point:** Output count = Input count (1-to-1 mapping).

• **Use case:** When you want to apply a transformation but don’t want to remove nil values.

### Example

```
let numbers = [1, 2, 3, 4]
let squared = numbers.map { $0 * $0 }
print(squared) // [1, 4, 9, 16]
```

### With optionals

```
let strings = ["1", "2", "three", "4"]
let mapped = strings.map { Int($0) }
print(mapped)
// [Optional(1), Optional(2), nil, Optional(4)]
```

---

## 2. compactMap

• **What it does:** Similar to map, but automatically removes nil values after transformation.

• **Key point:** Cleans up nil without manual filtering.

• **Use case:** When converting to optionals and you want only valid values.

### Example

```
let strings = ["1", "2", "three", "4"]
let compactMapped = strings.compactMap { Int($0) }
print(compactMapped) // [1, 2, 4]
```

Notice how nil from "three" is removed.

---

## 3. flatMap

In modern Swift, flatMap is used in **two contexts**.

### (a) Flattening nested collections

• **What it does:** Flattens a collection of collections into a single collection.

### Example

```
let nested = [[1,2], [3,4], [5,6]]
let flattened = nested.flatMap { $0 }
print(flattened) // [1,2,3,4,5,6]
```

---

### (b) Transforming + Flattening (legacy optional handling)

• Before Swift 4.1, flatMap was used to unwrap optionals.

• Now **compactMap** is preferred, but older code may still use flatMap.

### Example (modern way with compactMap):

```
let strings = ["1","2","three","4"]
let numbers = strings.compactMap { Int($0) }
print(numbers) // [1,2,4]
```

---
</details>  

### Q. What is the difference between Synchronous and Asynchronous tasks in Swift?  
<details>
<summary>Answer</summary>

## Synchronous

• Tasks run **one after another**.
• The next task starts **only when the current task finishes**.

## Asynchronous

• Tasks can run **in the background**.
• They don’t wait for the current task to finish.

---

## Blocking

### Synchronous

• Blocks the thread (waits until the task is done).

### Asynchronous

• Does not block the thread (other work can continue).

---

### Example

**Synchronous**

```
print("Task 1")
print("Task 2")
print("Task 3")
```

**Asynchronous**

```
DispatchQueue.global().async {
    print("Background Task")
}

print("Main Task continues...")
```

Note: `"Main Task continues..."` may print before `"Background Task"`.

---

## Real-life Example

**Synchronous:**
Standing in line for a ticket. You must wait until your turn.

**Asynchronous:**
Ordering food online. While it’s being prepared, you can do other things.

---

## Use Cases

**Synchronous**

• Good for small, quick tasks where order matters.

**Asynchronous**

• Best for time-consuming tasks like:

* API calls
* Image downloads
* Database operations

---
</details>  

### Q. What are Access Control Levels in Swift?
<details>
<summary>Answer</summary>  

Swift provides **5 levels of access control** to define visibility.

---

## 1. Open

• Most permissive level.
• Used only for classes and class members.
• Accessible inside and outside the module.
• Can be subclassed and overridden in another module.

Example: `UIView` in UIKit is open.

---

## 2. Public

• Accessible anywhere inside or outside the module.

• But **cannot be subclassed or overridden** outside the module.

• Safer than open.

Example: `String` or `Array`.

---

## 3. Internal (default)

• Accessible only within the same module/project.

• Not visible outside the module.

• Best for most use cases in an app.

Example:

```
class UserManager {
}
```

(Default access level = internal)

---

## 4. Fileprivate

• Accessible only within the **same file**.

• Useful when you want to hide implementation details but share them within the file.

Example: Helper methods used only in that file.

---

## 5. Private

• Strictest level.

• Accessible only within the same **scope (class/struct/extension)**.

• Keeps code highly encapsulated.

Example:

A private variable inside a class that shouldn’t be accessed outside it.

---  
</details>

### Q. What is Codable in Swift?  
<details>
<summary>Answer</summary>  

Codable is a special type in Swift that makes it easy to **convert data between Swift objects and external formats** like:

* JSON
* Plist
* etc.

It is actually a combination of:

* `Encodable`
* `Decodable`

---

### Example

```
struct User: Codable {
    var id: Int
    var name: String
}
```

**Use Case:** Parsing JSON data from APIs.

---  
</details>

### Q. Difference Between `==` and `===` in Swift  
<details>
<summary>Answer</summary>

## 1. == (Equality Operator)

• Used to **compare values**.

• Checks if the **contents/values** of two variables are the same.

### Example

```
let a = "Hello"
let b = "Hello"

if a == b {
    print("Both have the same value")
}
```

---

## 2. === (Identity Operator)

• Used to **compare references**.

• Checks if two variables refer to the **exact same instance in memory**.

• Works only with **class types**.

---

### Example

```
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "Anand")
let person2 = person1
let person3 = Person(name: "Anand")

if person1 === person2 {
    print("person1 and person2 refer to the same instance")
}

if person1 === person3 {
    print("same instance")
} else {
    print("different instances")
}
```
---   
</details> 

### Q. Explain 'for-in' loop and its usage in Swift  
<details>
<summary>Answer</summary>  

The **for-in loop** is used to iterate over a sequence:

* arrays
* ranges
* strings
* dictionaries
* etc.

It repeats a block of code for each item.

---

## How it works

• Define a variable inside the loop.
• That variable takes each value from the collection one by one.
• Loop runs until all values are used.

---

### Example

```
for i in 1...3 {
    print("Hello")
}
```

---  
</details> 

### Q. What's the difference between nil and null in Swift?
<details>
<summary>Answer</summary>  

Swift uses **nil**, not null.

---

## nil

• Represents the **absence of a value**.

• Works with **optionals only**.

Example

```
var name: String? = nil   // valid
var age: Int = nil        // error
```

Only optional types can hold nil.

---

## nil is type-safe

• In Swift, nil is **not just a pointer to nothing**.

• It represents **no value for a specific type**.

---

## null doesn't exist in Swift

If you try to use `null`, it will cause a compile-time error.

---  
</details>

### Q. Describe the 'fallthrough' keyword in a 'switch' statement  
<details>
<summary>Answer</summary>  

In Swift, switch does **not automatically fall through** like C/Java.

Once a case matches, the switch ends.

If you want the next case to run as well, use **fallthrough**.

---

### Example

```
let number = 1

switch number {
case 1:
    print("Number is One")
    fallthrough
case 2:
    print("This is case Two")
    fallthrough
case 3:
    print("This is case Three")
default:
    print("Default case")
}
```

---

## Points to Understand

### 1. Default behavior

After a case executes, switch ends.

No accidental fall-through.

---

### 2. When to use fallthrough

Use when the **next case should run after the current one**.

---

### 3. Condition not checked again

The next case executes **without checking its condition**.

---  
</details>

### Q. Define 'break' and 'continue' statements in loops in Swift  
<details>
<summary>Answer</summary>  

## break

• Immediately stops the loop.

• Exits even if iterations are left.

Example

```
let numbers = [1,2,3,4,5]

for num in numbers {
    if num == 3 {
        print("Found 3, stopping the loop!")
        break
    }
    print(num)
}
```

---

## continue

• Skips the current iteration.

• Moves to the next iteration of the loop.

Example

```
let numbers = [1,2,3,4,5]

for num in numbers {
    if num == 3 {
        print("Skipping 3")
        continue
    }
    print(num)
}
```

---
</details>

### Q. Explain the concept of a half-open range in Swift  
<details>
<summary>Answer</summary>   

A **half-open range** includes the start value but **excludes the end value**.

It uses the operator:

```
..< 
```

### Syntax

```
start..<end
```

Includes: `start`
Excludes: `end`

---

### Example

```
for i in 0..<5 {
    print(i)
}
```

Output

```
0 1 2 3 4
```

---

## Why it is useful

1. Common in loops when repeating fixed times.

```
for i in 0..<array.count {
    print(array[i])
}
```

2. Memory efficient.

3. Prevents off-by-one errors.

---  
</details>

### Q. Describe the 'stride' function in Swift
<details>
<summary>Answer</summary>  

The **stride function** generates a sequence of numbers between two values with a custom step size.

Useful when numbers increase by something other than 1.

Example steps:

* +2
* +5
* +0.5

---

## Types of Stride

### 1. stride(from:to:by:)

Creates numbers **up to but not including** the end value.

```
for number in stride(from: 0, to: 10, by: 2) {
    print(number)
}
```

Output

```
0 2 4 6 8
```

---

### 2. stride(from:through:by:)

Creates numbers **including the end value**.

```
for number in stride(from: 0, through: 10, by: 2) {
    print(number)
}
```

Output

```
0 2 4 6 8 10
```

---

## Why use stride?

• More flexible than normal ranges.
• Lets you control step size.
• Works with decimals and negative steps.
• Useful in animations, layouts, and skipping elements.

---
</details>  


### Q27: What's the purpose of the 'where' clause in Swift?  
<details>
<summary>Answer</summary>

The **where** clause in Swift is used to **add extra conditions or constraints** in various places like loops, switch cases, generics, and extensions.

It acts like a filter that ensures code executes **only if the additional condition is true.**

### Example:

```swift
let numbers = [1, 2, 3, 4, 5, 6]

for num in numbers where num % 2 == 0 {
    print(num)  // Prints only even numbers: 2, 4, 6
}
```

Here, **where** acts as a filter inside the loop.

### Why use where?

• Makes code **more readable and concise**
• Helps apply **conditions directly inside syntax** (loop, switch, generics, extensions)
• Avoids writing extra nested **if** statements

---  
</details>

### Q: Explain CaseIterable protocol in Swift   
 
<details>
<summary>Answer</summary>

• The **CaseIterable** protocol in Swift is used with **enums** to automatically provide a collection of all cases of that enum.

• Normally, enums don’t provide a built-in way to list all their cases.

• By conforming to **CaseIterable**, Swift generates a static property **allCases**, which contains an array of all enum cases.

### Example:

```swift
enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
}

// Accessing all cases
for dir in Direction.allCases {
    print(dir)
}
```

### Key Points

• **CaseIterable** works **only with enums without associated values.**

```swift
enum Animal: CaseIterable {
    case dog, cat, lion
}

print(Animal.allCases.count) // 3
```

• If an enum has **associated values**, you cannot use **CaseIterable** directly.

• You can also **manually implement allCases** if you need custom behavior.

### Usecase:

• When you want to iterate over all cases of an enum.

Example:

• Showing all options in a dropdown or picker.
• Writing test cases to cover every enum option.
• Creating UI menus with all enum values.

---  
</details>

### Q: What is the difference between self and Self in Swift?  
<details>
<summary>Answer</summary>  

### self (lowercase s)

• Refers to the **current instance** of a class, struct, or enum.

• It’s like saying **“this object right here”.**

• Commonly used inside methods to access properties or methods of that particular instance.

• Also required when there’s ambiguity between a property name and a local variable/parameter.

### Example:

```swift
struct Person {
    var name: String
    
    func introduce() {
        print("Hi, my name is \(self.name)")
    }
}

let p = Person(name: "Anand")
p.introduce() // Hi, my name is Anand
```

Here, **self.name** refers to the current instance’s property.

---

### Self (uppercase S)

• Refers to the **type itself**, not the instance.

• Inside a protocol, **Self** represents the type that conforms to the protocol.

• Inside a class/struct/enum, **Self** can be used to refer to the type name instead of writing it explicitly.

### Example (inside a struct):

```swift
struct Circle {
    var radius: Double
    
    // A factory method returning the same type
    static func unitCircle() -> Self {
        return Self(radius: 1.0) // Same as Circle(radius: 1.0)
    }
}

let c = Circle.unitCircle()
```

---  
</details>

### Q. Can all types be marked as final in Swift? If so, what does it mean?  
<details>
<summary>Answer</summary>  

• Yes, classes can be marked as **final**.

• **Structs, Enums, Protocols → No need**, because they are already **implicitly final**.
You can’t subclass a struct, enum, or protocol in Swift anyway.

So, marking them as **final** doesn’t even compile because it’s redundant.

---

### What does final mean in Swift?

When you mark a class as **final**:

### 1. No Subclassing Allowed

Other classes cannot inherit from it.

```swift
final class Dog {}

class Puppy: Dog {} // Error: 'Dog' is final
```

---

### 2. Performance Optimization

The compiler knows the class won’t be overridden, so it can optimize method dispatch
(uses **static dispatch instead of dynamic dispatch**).

---

### 3. Code Safety

It prevents unintended inheritance or method overriding that might cause bugs.

---

### Use Cases for final

• When you **don’t want your class to be subclassed**.

• When you want **faster performance** (less dynamic dispatch).

• For **utility or helper classes** that should be used as-is.

---  
</details>

### Q: What’s the difference between class and struct in Swift?
<details>
<summary>Answer</summary>  

### Class → Reference type

### Struct → Value type

When you assign a class instance to another variable, both point to the same object.
For struct, a **new copy** is created.

---

## Memory Allocation

### Class

Stored in the **heap memory**.
Reference is stored in the stack.

### Struct

Stored directly on the **stack** (unless captured in closures or stored inside classes).

---

## Inheritance

### Class

Supports inheritance (a class can inherit from another class).

### Struct

No inheritance.

---

## Mutability

### Class

Properties can be changed regardless of whether the instance is declared with **let** or **var**.

### Struct

If a struct instance is declared with **let**, you **cannot change its properties**.

---

## Deinitializers

### Class

Can have **deinit** to clean up resources.

### Struct

No **deinit**.

---

## Identity Check

### Class

You can compare identity using **=== operator**
(checks if two references point to the same object).

### Struct

No identity check, only value comparison.

---

## ARC (Automatic Reference Counting)

### Class

Managed by ARC because it’s reference type.

### Struct

Not managed by ARC (since copies are independent).

---

## Use Cases

### Class

When you need inheritance, reference sharing, or object identity
(e.g., **UIViews, Controllers**).

### Struct

When you need lightweight data containers, immutability, or thread safety
(e.g., **Models, Coordinates, Dates**).

---  
</details>

### Q: What are closures, and how do you avoid strong self-capture?  
<details>
<summary>Answer</summary>

A **closure** is a self-contained block of code that you can pass around and use in your program.

Think of it like a **function without a name** that can capture and use values from its surrounding context.

### Example:

```swift
let greet = { (name: String) -> String in
    return "Hello, \(name)!"
}

print(greet("Anand")) // Output: Hello, Anand!
```

---

## Closures Capture Values

Closures can capture variables/constants from the scope in which they are defined.

```swift
func makeCounter() -> () -> Int {
    var count = 0
    
    return {
        count += 1
        return count
    }
}

let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2
```

Here, the closure **"remembers"** the variable **count** even after `makeCounter()` has finished executing.

---

## The Problem: Strong Self Capture

If you use **self inside a closure** (especially in classes), you can accidentally create a **strong reference cycle (memory leak).**

This happens because:

• The class instance strongly owns the closure.
• The closure strongly captures **self**.
• They keep each other alive forever → memory leak.

---

### Bad Example (Strong Capture):

```swift
class MyClass {
    var name = "Swift"
    
    func startTask() {
        DispatchQueue.global().async {
            print("Hello \(self.name)") // ⚠️ Strongly captures self
        }
    }
}
```

---

## Solution: Weak / Unowned Capture

To avoid strong self capture, use a **capture list**.

### 1. [weak self]

`self` becomes optional inside the closure.

Best when **self might be deallocated before closure runs**.

```swift
DispatchQueue.global().async { [weak self] in
    guard let self = self else { return }
    print("Hello \(self.name)")
}
```

---

### 2. [unowned self]

`self` is assumed to exist (not optional).

Best when you're sure **self will still be alive when closure executes**.

```swift
DispatchQueue.global().async { [unowned self] in
    print("Hello \(self.name)")
}
```

---  
</details>

### Q: How does Swift handle error propagation?  
<details>
<summary>Answer</summary>  

Swift has a **built-in error handling system** that helps you write safe and clean code when things go wrong (like network failures, invalid inputs, or missing files).

Instead of silently failing or crashing, Swift lets you **propagate errors in a controlled way.**

---

## 1. Defining Errors

In Swift, errors must conform to the **Error** protocol (an empty protocol used as a marker).

### Example:

```swift
enum NetworkError: Error {
    case noConnection
    case timeout
    case invalidResponse
}
```

---

## 2. Throwing Errors

Functions that can throw errors are marked with the **throws** keyword.

Inside, you use **throw** to signal an error.

```swift
func fetchData(from url: String) throws -> String {
    guard url.starts(with: "https") else {
        throw NetworkError.invalidResponse
    }
    
    return "Data from \(url)"
}
```

---

## 3. Propagating Errors

Instead of handling the error inside the function, you let it **bubble up to the caller.**

The caller is then responsible for handling it.

```swift
func loadData() {
    do {
        let data = try fetchData(from: "http://example.com")
        print(data)
    } catch {
        print("Error occurred: \(error)")
    }
}
```

---

### Specific Catch

```swift
do {
    let result = try fetchData(from: "https://example.com")
    print("Success: \(result)")
} catch NetworkError.noConnection {
    print("No internet connection.")
} catch NetworkError.timeout {
    print("Request timed out.")
} catch {
    print("Unknown error: \(error)")
}
```

---

### try? (Optional Result)

Converts the result into an optional — returns **nil if an error occurs**.

```swift
let data = try? fetchData(from: "http://example.com")
print(data ?? "Failed to fetch")
```

---

### try! (Force Try)

Used when you are certain no error will occur.
If it does, **app crashes**.

```swift
let safeData = try! fetchData(from: "https://example.com")
print(safeData)
```

---

### rethrows

When a function takes a throwing closure, it can mark itself as **rethrows**, meaning it only throws if the closure throws.

```swift
func performOperation(_ operation: () throws -> Void) rethrows {
    try operation()
}
```

---

## Error Propagation Flow

1. Function throws error (`throw`)
2. Error bubbles up (`throws`)
3. Caller decides whether to handle (`do-catch`) or pass it further

---  
</details>

### Q: What is the purpose of the mutating keyword in Swift?  
<details>
<summary>Answer</summary>  

In Swift, **struct and enum are value types**, which means their properties cannot normally be modified from within their own instance methods.

If you want a method in a **struct or enum to change (mutate) its properties**, you must mark it with the **mutating** keyword.

---

### Example

```swift
struct Counter {
    var value = 0
    
    mutating func increment() {
        value += 1
    }
}

var counter = Counter()
counter.increment()

print(counter.value) // Output: 1
```

Without **mutating**, the compiler will throw an error because `increment()` modifies `value`.

---  
</details>

### Q: What’s the difference between String and NSString in Swift?
<details>
<summary>Answer</summary>  

### String (Swift)

• `String` is a **value type (struct)** in Swift.
• It is part of the **Swift Standard Library** and is optimized for safety, speed, and Unicode correctness.
• Since it's a struct, it follows **copy-on-write semantics** (efficient, but each variable has its own copy).
• It is **bridged automatically to NSString** when needed, so you can pass a Swift String to Objective-C APIs without extra conversion.
• Preferred in Swift code because it's more modern and Swift-native.

Example:

```swift
var swiftString: String = "Hello, Swift"
```

---

### NSString (Objective-C)

• `NSString` is a **reference type (class)** from the **Foundation framework**.
• It comes from Objective-C, so it’s older and not as optimized for Swift features.
• Being a class, it’s stored on the heap and follows **reference semantics** (multiple variables can reference the same object).
• Still useful if you're working with APIs or libraries written in Objective-C.
• Has some methods not directly available in Swift’s `String` (though most are bridged).

Example:

```swift
let objcString: NSString = "Hello, Objective-C"
```

---  
</details>

### Q: What is type inference in Swift? Give an example.
<details>
<summary>Answer</summary>  

Type inference means the **Swift compiler can automatically figure out the type** of a variable or constant based on the value you assign, so you don’t always need to explicitly specify the type.

Swift is strongly typed (every variable has a type), but thanks to type inference, you don’t always need to write the type manually.

---

### Example 1: Basic Type Inference

```swift
let age = 25        // Swift infers this as Int
let price = 99.99   // Swift infers this as Double
let name = "Anand"  // Swift infers this as String
```

Here, we didn’t write `Int`, `Double`, or `String`. Swift inferred them automatically.

---

### Example 2: Inference with Collections

```swift
let numbers = [1, 2, 3, 4, 5]
// Swift infers [Int] as the type
```

If you mix types, Swift infers the **common type**:

```swift
let mixed = [1, 2.5, 3]
// Swift infers [Double]
```

---

### Example 3: Function Inference

```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let result = add(5, 10)
// Swift infers result as Int
```

---

### Why Is It Useful?

• Makes code **shorter and cleaner**
• Still keeps **type safety** (compiler knows exact type)
• Reduces redundancy

---  
</details>

### Q: What is type aliasing in Swift? Provide an example where it would be useful.
<details>
<summary>Answer</summary>  

Type aliasing lets you **create a new name for an existing type.**

• It doesn’t create a new type, just gives a **more meaningful name** to an existing one.
• Think of it as a **shortcut or nickname** for a type that might be too long, complex, or not very descriptive.

---

### Syntax

```swift
typealias NewName = ExistingType
```

---

### Example

```swift
typealias CompletionHandler = (Bool, String) -> Void
```

Instead of writing `(Bool, String) -> Void` everywhere, we just use `CompletionHandler`.

```swift
func fetchData(completion: CompletionHandler) {
    completion(true, "Data fetched successfully")
}
```

Much cleaner.

---  
</details>

### Q: Explain the concept of type safety in Swift. How does it prevent runtime errors?  
<details>
<summary>Answer</summary>

Type safety means **every variable, constant, and expression in Swift has a specific type that the compiler checks at compile time.**

This prevents you from accidentally mixing incompatible types (like adding a string to an integer).

If you try to use a type incorrectly, Swift will catch it **before your code even runs.**

---

## How It Prevents Runtime Errors

### 1. Compile-Time Checking

The compiler verifies that operations are valid for given types.

Example:

```swift
var age: Int = 25
var name: String = "Anand"

// Compile-time error
var result = age + name
```

Swift won’t even let this run — it errors out during compilation.

---

### 2. Type Inference with Safety

Even when Swift infers the type, it’s strict about enforcing it.

```swift
let pi = 3.14 // Inferred as Double
let radius = 5 // Inferred as Int

// Error: Cannot add Int to Double without conversion
let sum = pi + radius

// Correct way
let sumCorrect = pi + Double(radius)
```

---

### 3. Optionals for Safe Null Handling

Instead of blindly assuming a value exists, Swift forces you to safely unwrap it.

```swift
var userName: String? = nil

// Would crash in some languages
print(userName.count)

// Swift prevents this — must unwrap first
if let name = userName {
    print(name.count)
}
```

---

### 4. Generic Functions with Constraints

Type safety also extends to generics, ensuring only valid operations are allowed.

---  
</details>

### Q: What are the rules for variable and constant naming in Swift? What characters are allowed?  
<details>
<summary>Answer</summary>

### 1. Start with a letter or underscore (_)

Example:

```
name
_userID
```

---

### 2. Can contain letters, numbers, and underscores

Example:

```
age1
student_score
```

---

### 3. No spaces allowed

Invalid:

```
first name
```

Valid:

```
firstName
first_name
```

---

### 4. Cannot start with a number

Invalid:

```
1score
```

Valid:

```
score1
```

---

### 5. Case-sensitive

```
score
Score
```

These are treated as **two different variables**.

---

### 6. Cannot use reserved keywords unless backticked

Invalid:

```
class = "Swift"
```

Valid (but not recommended):

```
`class` = "Swift"
```

---

### 7. Unicode characters are allowed

You can use non-English names or even emojis.

Example:

```swift
let π = 3.14159
let नमस्ते = "Hello in Hindi"
let 👍 = "Like"
```

---  
</details>

### Q: What are the different ways to unwrap an optional? Provide code examples.
<details>
<summary>Answer</summary>  

An optional (`?`) can hold a value or **nil**.

Unwrapping means **safely accessing the value inside the optional.**

---

## 1. Optional Binding (if let)

Safely checks if the optional contains a value.

```swift
var name: String? = "Anand"

if let unwrappedName = name {
    print("Name is \(unwrappedName)")
} else {
    print("Name is nil")
}
```

---

## 2. Optional Binding (guard let)

Used to exit early if optional is nil.
Common in functions.

```swift
func printName(_ name: String?) {
    guard let unwrappedName = name else {
        print("Name is nil")
        return
    }
    
    print("Name is \(unwrappedName)")
}

printName(nil)
printName("Anand")
```

---

## 3. Force Unwrapping (!)

Directly accesses the value.

⚠️ Crashes if optional is nil.

```swift
var name: String? = "Anand"
print(name!) // Output: Anand
```

---

## 4. Nil-Coalescing Operator (??)

Provides a default value if optional is nil.

```swift
var name: String? = nil
let displayName = name ?? "Guest"

print(displayName) // Output: Guest
```

---

## 5. Optional Chaining (?.)

Safely access properties/methods.

Returns nil if optional is nil.

```swift
var text: String? = "Hello"

print(text?.uppercased()) // Optional("HELLO")

text = nil
print(text?.uppercased()) // nil
```

---

## 6. Implicitly Unwrapped Optional (! in Declaration)

```swift
var label: String!
label = "Hello"
print(label)
```
• Declares an optional that’s assumed to always have a value.

• Can be accessed without unwrapping.

Example:

```swift
var name: String! = "Anand"
print(name)  // Output: Anand
```

---  
</details>  


### Q: What is Nil-Coalescing Operator (??) in Swift.
<details>
<summary>Answer</summary>  

• The **nil-coalescing operator `??`** lets you **provide a default value** for an optional if it happens to be **nil**.

• It’s a shorthand way of writing an **if-else check for nil**.

**Syntax:**

```
optionalValue ?? defaultValue
```

• If **optionalValue contains a value** → returns the value.

• If **optionalValue is nil** → returns **defaultValue**.

**Example:**

```
var name: String? = nil
let displayName = name ?? "Guest"
print(displayName) // Output: Guest
```

**Why Use It?**

1. Provides a **default value** without writing **if let** or **guard let**.

2. Makes code **shorter and cleaner**.

3. Avoids **runtime crashes** when optionals are **nil**.

---
</details>

### Q: What is the try? operator and how is it different from try! in Swift.  
<details>
<summary>Answer</summary>  

#### try?

• Converts a **throwing function into an optional**.

• If the function **succeeds**, you get the result as an optional.

• If the function **throws an error**, you get **nil** instead of a runtime crash.

• **Safe way** to handle errors when you don’t need to differentiate the error type.

**Example:**

```
enum NetworkError: Error {
    case noConnection
}

func fetchData() throws -> String {
    throw NetworkError.noConnection
}

// Using try?
let result = try? fetchData()
print(result) // Output: nil
```

---

#### try!

• **Forces the throwing function to succeed.**

• If the function **throws an error**, your app **crashes at runtime**.

• Use it only when you are **sure no error will occur.**

**Example:**

```
// Using try!
let result = try! fetchData() // ⚠️ Crashes here
```

---
</details>




  




