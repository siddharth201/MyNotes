
## Memory Management & Performance

<details>
<summary><b>Q1: What is ARC (Automatic Reference Counting)? How does it differ from garbage collection?</b></summary>

* ARC stands for **Automatic Reference Counting**.
* It’s a **memory management system** used in Swift and Objective-C.
* Instead of you manually freeing memory, ARC automatically keeps track of how many references (strong references) point to an object.

If the reference count drops to **zero**, the object is immediately deallocated from memory.

**How ARC works**

1. Every object in Swift has a **reference count**.
2. When you create a new reference ( `let` or `var` ), the count increases.
3. When a reference goes out of scope, the count decreases.
4. When count = 0 → ARC frees the object’s memory.

| **ARC (iOS/Swift)** | **Garbage Collection (Java, C#)** |
| :--- | :--- |
| **Compile-time** memory management. The compiler inserts retain/release calls in your code. | **Runtime** memory management. A background GC process scans for unused objects. |
| Objects are deallocated **immediately** when their reference count hits 0. | Objects are freed **later**, whenever GC runs (can cause pauses). |
| **Predictable** performance → no sudden lags. | Can cause **“stop-the-world” pauses** when GC runs. |
| Lightweight (no background thread needed). | Heavier because GC constantly monitors memory. |
| Requires developers to handle **retain cycles** (e.g., with `weak` or `unowned` ). | GC handles cycles automatically by tracking object graphs. |

</details>

---

<details>
<summary><b>Q2: What is the difference between retain, release, and autorelease in pre-ARC vs ARC?</b></summary>

**retain**
* Increases the object’s reference count by 1.
* Means: *“I want to keep ownership of this object.”*

**release**
* Decreases the reference count by 1.
* If refCount reaches 0, the object is deallocated.

**autorelease**
* Marks an object to be released **later**, usually at the end of the current run loop.
* Useful when returning objects from methods without knowing when the caller will use them.

**With ARC (Modern Swift / Obj-C)**
* ARC inserts **retain/release/autorelease** calls **for you at compile time**.
* You **cannot call them manually** anymore in Swift.

</details>

---

<details>
<summary><b>Q3: What's the difference between strong, weak, and unowned references?</b></summary>

**Strong Reference (default)**
* A **strong reference** means the object is kept alive as long as this reference exists.
* This is the default in Swift.
* Every strong reference increases the object’s retain count.

**Weak Reference**
* A **weak reference** does **not increase retain count**.
* ARC can deallocate the object even if a weak reference exists.
* Always declared as **optional ( `?` )** because the object may become `nil` .
* ARC automatically sets weak references to `nil` when the object is deallocated (this is called **zeroing weak references**).

**Unowned Reference**
* Like **weak**, it does **not increase retain count**.
* But it’s **non-optional** and **never becomes nil automatically**.
* You use it when you know the reference will **always exist as long as you need it**.
* If the object is deallocated and you try to access an `unowned` reference, the app **crashes**.

</details>

---

<details>
<summary><b>Q4: How do weak references work internally? What is the weak reference table?</b></summary>

**How Weak References Work**
* A **strong reference** increases the object’s reference count.
* A **weak reference** does **not** increase the count, but ARC still needs a way to know when the object is destroyed.
* To handle this, Swift uses a **weak reference table**.

When the object is deallocated:

1. ARC looks up the object in the weak reference table.
2. All weak references pointing to it are set to `nil` automatically.
3. This process is called **zeroing weak references**.

This ensures you never access freed memory (which would crash the app).

**What is the Weak Reference Table?**
* It’s a hidden data structure maintained by the Swift runtime.
* For every object that has weak references pointing to it, ARC keeps a record in this table.
* Each entry maps:
  * **Object’s memory address → List of weak references** pointing to it.

When the object dies:
* The runtime scans the table, finds all weak references for that object, and sets them to `nil` .

**Key Points:**
* Weak references are **safe pointers** that auto-clear on deallocation.

* The weak reference table is the behind-the-scenes mechanism that keeps weak references valid and prevents dangling pointers.

</details>

---
