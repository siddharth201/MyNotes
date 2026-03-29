The output of this code is **"Class"**.

This is a great follow-up to our earlier discussion about structs, but with a **Class** twist. Even though the variable `obj` is explicitly typed as the protocol `A`, Swift uses **Dynamic Dispatch** to find the correct implementation at runtime.

### 1. The Requirement Rule
The key reason you see "Class" is that `test()` is declared inside the `protocol A { ... }` block. 

* When a function is a **requirement** in the protocol, Swift creates a **Protocol Witness Table** (a lookup table) for any type that conforms to it.
* The `extension A` provides a **default implementation**, but the compiler treats it as a placeholder.
* Because `class B` provides its own implementation of `test()`, it "overrides" that default entry in the witness table for that specific class.



---

### 2. How the lookup works
When you run `obj.test()`, the computer performs a small "search":

| Step | Logic | Result |
| :--- | :--- | :--- |
| **1** | Look at the type of `obj`. | It is a protocol `A`. |
| **2** | Is `test()` a requirement of `A`? | **Yes.** Check the witness table of the actual instance. |
| **3** | What is the actual instance? | An instance of `class B`. |
| **4** | What is in `B`'s witness table? | The version of `test()` defined in `class B`. |
| **5** | **Final Action** | Print **"Class"**. |

---

### The "Hidden" Scenario: Static Dispatch
To see the "Protocol" output, you would have to move `test()` **out** of the protocol declaration and leave it **only** in the extension:

```swift
protocol A {
    // Empty
}

extension A {
    func test() { print("Protocol") }
}

class B: A {
    func test() { print("Class") }
}

let obj: A = B()
obj.test() // Output: "Protocol"
```

In this modified case, because `test()` is not a requirement, Swift uses **Static Dispatch**. It looks at the type of the variable (`A`), sees the extension method, and calls it immediately without checking if `B` has a version of its own.

### Summary
* **Requirement in Protocol:** Dynamic Dispatch (Uses the implementation of the instance, e.g., **"Class"**).
* **Method only in Extension:** Static Dispatch (Uses the implementation of the variable type, e.g., **"Protocol"**).

Would you like to see how this behavior changes if we introduce **Class Inheritance** (a subclass of `B`) into the mix?
