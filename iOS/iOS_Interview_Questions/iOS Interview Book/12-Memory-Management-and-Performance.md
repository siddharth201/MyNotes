
## 

<details>
<summary><b>Q1: What is ARC (Automatic Reference Counting)? How does it differ from garbage collection?</b></summary>

* ARC stands for **Automatic Reference Counting**.[cite: 1]
* It’s a **memory management system** used in Swift and Objective-C.[cite: 1]
* Instead of you manually freeing memory, ARC automatically keeps track of how many references (strong references) point to an object.[cite: 1]

If the reference count drops to **zero**, the object is immediately deallocated from memory.[cite: 1, 2]

**How ARC works**[cite: 2]

1. Every object in Swift has a **reference count**.[cite: 2]
2. When you create a new reference ( `let` or `var` ), the count increases.[cite: 2]
3. When a reference goes out of scope, the count decreases.[cite: 2]
4. When count = 0 → ARC frees the object’s memory.[cite: 2]

| **ARC (iOS/Swift)**[cite: 2] | **Garbage Collection (Java, C#)**[cite: 2] |
| :--- | :--- |
| **Compile-time** memory management. The compiler inserts retain/release calls in your code.[cite: 3] | **Runtime** memory management. A background GC process scans for unused objects.[cite: 3] |
| Objects are deallocated **immediately** when their reference count hits 0.[cite: 3] | Objects are freed **later**, whenever GC runs (can cause pauses).[cite: 3] |
| **Predictable** performance → no sudden lags.[cite: 3] | Can cause **“stop-the-world” pauses** when GC runs.[cite: 3] |
| Lightweight (no background thread needed).[cite: 3] | Heavier because GC constantly monitors memory.[cite: 3] |
| Requires developers to handle **retain cycles** (e.g., with `weak` or `unowned` ).[cite: 4] | GC handles cycles automatically by tracking object graphs.[cite: 4] |

</details>

---

<details>
<summary><b>Q2: What is the difference between retain, release, and autorelease in pre-ARC vs ARC?</b></summary>

**retain**[cite: 4]
* Increases the object’s reference count by 1.[cite: 4]
* Means: *“I want to keep ownership of this object.”*[cite: 4]

**release**[cite: 4]
* Decreases the reference count by 1.[cite: 4]
* If refCount reaches 0, the object is deallocated.[cite: 5]

**autorelease**[cite: 5]
* Marks an object to be released **later**, usually at the end of the current run loop.[cite: 5]
* Useful when returning objects from methods without knowing when the caller will use them.[cite: 5]

**With ARC (Modern Swift / Obj-C)**[cite: 5]
* ARC inserts **retain/release/autorelease** calls **for you at compile time**.[cite: 5]
* You **cannot call them manually** anymore in Swift.[cite: 5]

</details>

---

<details>
<summary><b>Q3: What's the difference between strong, weak, and unowned references?</b></summary>

**Strong Reference (default)**[cite: 6]
* A **strong reference** means the object is kept alive as long as this reference exists.[cite: 6]
* This is the default in Swift.[cite: 6]
* Every strong reference increases the object’s retain count.[cite: 6]

**Weak Reference**[cite: 6]
* A **weak reference** does **not increase retain count**.[cite: 6]
* ARC can deallocate the object even if a weak reference exists.[cite: 6]
* Always declared as **optional ( `?` )** because the object may become `nil` .[cite: 7]
* ARC automatically sets weak references to `nil` when the object is deallocated (this is called **zeroing weak references**).[cite: 7]

**Unowned Reference**[cite: 7]
* Like **weak**, it does **not increase retain count**.[cite: 7]
* But it’s **non-optional** and **never becomes nil automatically**.[cite: 7]
* You use it when you know the reference will **always exist as long as you need it**.[cite: 7]
* If the object is deallocated and you try to access an `unowned` reference, the app **crashes**.[cite: 7, 8]

</details>

---

<details>
<summary><b>Q4: How do weak references work internally? What is the weak reference table?</b></summary>

**How Weak References Work**[cite: 8]
* A **strong reference** increases the object’s reference count.[cite: 8]
* A **weak reference** does **not** increase the count, but ARC still needs a way to know when the object is destroyed.[cite: 8]
* To handle this, Swift uses a **weak reference table**[cite: 8].

When the object is deallocated:[cite: 8]

1. ARC looks up the object in the weak reference table.[cite: 9]
2. All weak references pointing to it are set to `nil` automatically.[cite: 9]
3. This process is called **zeroing weak references**.[cite: 9]

This ensures you never access freed memory (which would crash the app).[cite: 9]

**What is the Weak Reference Table?**[cite: 9]
* It’s a hidden data structure maintained by the Swift runtime.[cite: 9]
* For every object that has weak references pointing to it, ARC keeps a record in this table.[cite: 10]
* Each entry maps:[cite: 10]
  * **Object’s memory address → List of weak references** pointing to it.[cite: 10]

When the object dies:[cite: 10]
* The runtime scans the table, finds all weak references for that object, and sets them to `nil` .[cite: 10]

**Key Points:**[cite: 10]
* Weak references are **safe pointers** that auto-clear on deallocation.[cite: 10]

</details>

---
