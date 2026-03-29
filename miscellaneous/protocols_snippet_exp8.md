This is a **Protocol Composition**.

In Swift, the `&` operator allows you to combine multiple protocols into a single temporary type. It tells the compiler: *"This function requires an object that conforms to **both** Protocol A and Protocol B."*

---

### How it works
When you use `A & B`, you are creating an **unnamed, composite type**. You aren't creating a new permanent protocol; you are just setting a specific requirement for that function parameter.

#### An Example in Action:
```swift
protocol Hexagon { func drawSixSides() }
protocol Scalable { func resize() }

// This function only accepts objects that are BOTH Hexagons and Scalable
func processShape(shape: Hexagon & Scalable) {
    shape.drawSixSides()
    shape.resize()
}

struct MyShape: Hexagon, Scalable {
    func drawSixSides() { print("⬢") }
    func resize() { print("Resizing...") }
}

let s = MyShape()
processShape(shape: s) // ✅ Works!
```



---

### Key Rules of Protocol Composition

1.  **Any Number of Protocols:** You can chain as many as you want: `A & B & C & D`.
2.  **Class Constraints:** You can even include a class in the composition. For example, `UIViewController & MyProtocol` ensures the object is a specific class *and* conforms to your protocol.
3.  **Type Aliasing:** If you find yourself using the same composition often, you can give it a name:
    ```swift
    typealias HexScalable = Hexagon & Scalable
    func test(obj: HexScalable) {}
    ```

---

### Composition vs. Inheritance
It is usually better to use **Composition** (`A & B`) rather than creating a new protocol that inherits from both (`protocol C: A, B {}`). 

* **Inheritance:** Creates a rigid hierarchy. If a struct only needs A and B, forcing it to conform to "Protocol C" might pull in extra requirements it doesn't need.
* **Composition:** Is flexible. It allows you to mix and match requirements exactly where they are needed without cluttering your type definitions.

---

### Summary Table

| Feature | Protocol Inheritance | Protocol Composition |
| :--- | :--- | :--- |
| **Syntax** | `protocol C: A, B {}` | `A & B` |
| **Persistence** | Permanent new type. | Temporary/Ad-hoc type. |
| **Usage** | When A and B *always* go together. | When you need a specific mix for one task. |

Would you like to see how this works with **Generics** (using the `where` clause) to achieve the same result?
