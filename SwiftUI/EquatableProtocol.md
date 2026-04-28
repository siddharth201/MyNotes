## Explain Equatable protocol with small example in swift    

> Definition: "In Swift, `Equatable` is a standard library protocol that allows instances of a type to be compared for value equality using the == operator. Conforming to it tells the compiler exactly what constitutes two objects being 'the same,' which inherently unlocks powerful collection methods like .contains() and .firstIndex(of:)." 

Understanding the `Equatable` protocol is a huge step in mastering Swift. It is one of the most common and essential protocols you will use.

Here is a clear breakdown of what it is, why it matters, and how to implement it.

### The Concept
By default, Swift doesn't know how to compare two custom objects. If you create two `User` structs and try to ask Swift, "Are these two users the same?" (`user1 == user2`), the compiler will throw an error. It doesn't know if "same" means they have the same ID, the same name, or if every single property must match perfectly.

The `Equatable` protocol is your way of telling Swift exactly how to compare two instances of your custom type using the equality (`==`) and inequality (`!=`) operators.

---

### Example 1: The "Free" Way (Automatic Synthesis)
If you are using a `struct` (or an `enum` without associated values) and all of its properties are already built-in Swift types that conform to `Equatable` (like `String`, `Int`, `Double`, `Bool`), Swift will do the work for you. 

You just add `: Equatable` to your declaration, and Swift automatically checks every property.

```swift
struct Product: Equatable {
    let id: Int
    let name: String
    let price: Double
}

let productA = Product(id: 1, name: "Coffee", price: 4.99)
let productB = Product(id: 1, name: "Coffee", price: 4.99)
let productC = Product(id: 2, name: "Tea", price: 3.50)

// Swift automatically knows how to do this now:
print(productA == productB) // Prints: true (because all properties match)
print(productA == productC) // Prints: false
```

---

### Example 2: The Manual Way (Custom Logic)
Sometimes, automatic synthesis isn't what you want. 

Imagine you have a `User` struct. A user might change their display name or their online status, but they are technically still the *same user* because their unique ID hasn't changed. In this case, you must write a custom `==` function.

```swift
struct User: Equatable {
    let id: String
    var displayName: String
    var isOnline: Bool
    
    // We explicitly tell Swift how to compare two Users
    // lhs stands for "Left Hand Side", rhs stands for "Right Hand Side"
    static func == (lhs: User, rhs: User) -> Bool {
        // We only care if their IDs match. We ignore name and status.
        return lhs.id == rhs.id
    }
}

let user1 = User(id: "12345", displayName: "SwiftCoder", isOnline: true)
let user2 = User(id: "12345", displayName: "SwiftCoder_v2", isOnline: false)

// Even though the name and status are different, this returns true!
if user1 == user2 {
    print("These are the exact same user in the database.")
}
```

---

### Why is this so useful?
Making your types `Equatable` isn't just about using the `==` sign. It unlocks powerful, built-in array methods. 

If your custom types are `Equatable`, you can instantly use methods like `.contains()`, `.firstIndex(of:)`, and `.removeAll(where:)` on arrays of your objects.

```swift
let activeUsers = [user1, productA] // (Assuming an array of mixed types isn't used, let's stick to Users)
let userDatabase = [user1, User(id: "999", displayName: "Bob", isOnline: true)]

// You can only do this because User conforms to Equatable:
if userDatabase.contains(user1) {
    print("User is already in the database!")
}
```  

## Q. Is this work with reference type(class) as well ?   

Yes, it absolutely works with reference types (`class`), but there is one major catch you need to be aware of. 

Unlike structs, **Swift does not provide automatic synthesis for classes.** Even if every property inside your class is a basic Swift type (like `String` or `Int`), you *must* write the `static func ==` manually. 

Apple designed it this way because classes support inheritance (subclassing), which makes automatic equality checks much more dangerous and unpredictable. Swift forces you to be explicit about what makes two classes "equal."

Here is how you do it, followed by a very common interview question related to this exact topic.

### 1. Implementing Equatable on a Class
You do this the exact same way as the "Manual Way" for structs. 

```swift
class Employee: Equatable {
    let id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    // You MUST write this. If you delete this function, the code won't compile.
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.id == rhs.id
    }
}

let emp1 = Employee(id: 1, name: "Alice")
let emp2 = Employee(id: 1, name: "Alice")

print(emp1 == emp2) // Prints: true
```

---

### 2. The Interview Question: Equality (`==`) vs. Identity (`===`)
Because classes are reference types (meaning they point to a specific spot in your phone's RAM), interviewers love to ask about the difference between `==` and `===`.

* **`==` (Equality):** Evaluates "Do these two objects hold the same *data*?" (This is what `Equatable` powers).
* **`===` (Identity):** Evaluates "Are these two variables pointing to the *exact same physical instance* in memory?" 

Here is what that looks like in practice:

```swift
let clone1 = Employee(id: 99, name: "Clone")
let clone2 = Employee(id: 99, name: "Clone")

let clone3 = clone1 // clone3 is just pointing to clone1's memory space

// Equality (==)
print(clone1 == clone2) // TRUE: Their data matches (id is 99).

// Identity (===)
print(clone1 === clone2) // FALSE: They are two separate objects in memory.
print(clone1 === clone3) // TRUE: They point to the exact same object in memory.
```

If you change `clone3.name = "New Name"`, `clone1.name` also changes because they are the same object. `clone2` remains unaffected.

Since we are on the topic of passing data around (value vs. reference types), how comfortable are you with the concept of memory leaks and `weak` vs. `strong` references in Swift?
