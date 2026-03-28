In this scenario, the output will be **"Default"**.

This happens because of how Swift handles **Protocol Requirements** and **Default Implementations**. Here is the step-by-step breakdown of the logic:

### 1. The Requirement
By defining `func sayHello()` inside the `protocol Test { ... }` block, you have created a **Protocol Requirement**. This tells the Swift compiler: *"Any type that conforms to Test must have a way to perform sayHello."*

### 2. The Default Implementation
The `extension Test` provides a **default implementation**. This is a fallback. It says: *"If a type conforms to Test but doesn't provide its own version of sayHello, use this one instead."*

### 3. The Conformance
When you declare `struct Person: Test {}`, you aren't providing a custom implementation of `sayHello`. Because the protocol requirement is already satisfied by the extension, the compiler doesn't throw an error. 



---

### The "Dispatch" Mechanics
Even though the variable `p` is explicitly typed as the protocol (`Test`), Swift uses **Dynamic Dispatch** (via a Protocol Witness Table) to find the correct function at runtime.

| Step | Action | Result |
| :--- | :--- | :--- |
| **1** | Call `p.sayHello()` | Look at the `Test` protocol requirements. |
| **2** | Check `Person` | Does `Person` have a custom `sayHello`? **No.** |
| **3** | Check `Extension` | Does the protocol extension have a default? **Yes.** |
| **4** | Execute | Print **"Default"**. |

### What if you added a function to Person?
If you changed your struct to this:
```swift
struct Person: Test {
    func sayHello() {
        print("Person's Hello")
    }
}
```
Then `p.sayHello()` would print **"Person's Hello"**. Because the method is a requirement in the protocol, Swift is "smart" enough to look past the protocol type and see that the underlying instance (`Person`) has a more specific version of that method to run.

---

Would you like to see what happens to the output if you remove `sayHello()` from the initial protocol definition? (Hint: It changes the dispatch type entirely!)
