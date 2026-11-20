
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

<details>
<summary><b>Q5: What's the difference between [weak self] and [unowned self] in closure capture lists?</b></summary>

**`[weak self]` in Closures**
* Captures `self` as a **weak reference**.
* Does **not** increase retain count.
* Becomes `nil` automatically when `self` is deallocated.
* Since it may become `nil` , you must use **optional unwrapping** inside the closure.

**`[unowned self]` in Closures**
* Captures `self` as an **unowned reference**.
* Does **not** increase retain count.
* Unlike weak, it is **not optional** and never becomes `nil` .
* Assumes that `self` will **always be alive** when the closure runs.

**Key Points**
* Use `[weak self]` in most cases, especially with async callbacks, timers, or escaping closures.
* Use `[unowned self]` only when you are **100% sure** that `self` will be alive for as long as the closure exists (e.g., closure owned by `self` itself).

</details>

---

<details>
<summary><b>Q6: What is a retain cycle (reference cycle)? How does it prevent memory deallocation?</b></summary>

* A **retain cycle** (also called a reference cycle) happens when **two or more objects hold strong references to each other**.
* Because of this, their reference counts never drop to zero.
* As a result, ARC can’t deallocate them → **memory leak**.

**How Retain Cycles Prevent Deallocation**
* ARC frees memory only when the reference count hits **0**.
* In a cycle, each object keeps the other alive with a strong reference.
* Even if you set all external references to `nil` , the cycle keeps the objects in memory forever.

**Key Point:**
* Always check relationships between objects.
* Use **weak** or **unowned** to break cycles (commonly in delegates, closures, and parent-child relationships).

</details>

---

<details>
<summary><b>Q6: What is Instruments and what types of performance issues can it help identify?</b></summary>

* Instruments is a **profiling and debugging tool** bundled with Xcode.
* It lets you run your app and record its behavior in real time.
* Provides visual graphs, timelines, and detailed metrics.
* Helps track memory, CPU, energy, and UI performance issues.

Think of it as a **microscope for your app’s runtime behavior**.

**Common Performance Issues Instruments Helps Identify**

**Memory Issues**
* **Leaks instrument** → Detects memory leaks (like retain cycles).
* **Allocations instrument** → Tracks memory usage and allocations over time.
* Helps find excessive memory growth that may cause crashes.

**CPU Usage**
* **Time Profiler** → Shows which functions consume the most CPU time.
* Detects inefficient algorithms, tight loops, or blocking operations.

**Energy Usage**
* **Energy Log** → Monitors battery consumption.
* Identifies high CPU, GPU, and background activity that drain power.

**UI Performance**
* **Core Animation instrument** → Measures frame rendering times.
* Detects dropped frames, laggy animations, and layout bottlenecks.

**File and Network Activity**
* Tracks disk reads/writes and network calls.
* Helps spot slow I/O or excessive background activity.

**Example Use Case**

Imagine a scrolling list in your app stutters.
* Run **Instruments → Core Animation** → You see frame rates drop below 60 FPS.
* Switch to **Time Profiler** → You find that a heavy image decoding function is blocking the main thread.
  Solution: move image decoding to a background thread.

</details>

---

<details>
<summary><b>Q7: What causes poor scrolling performance in UITableView and UICollectionView?</b></summary>

**1. Heavy Work on the Main Thread**
* UI rendering happens on the **main thread**.
* If you do expensive work (JSON parsing, image decoding, database fetches) on the main thread, scrolling will stutter.
  Solution: move heavy tasks to a **background thread** using GCD or `OperationQueue` .

**2. Improper Cell Reuse**
* If you don’t reuse cells correctly, new cells are constantly created.
* This increases CPU and memory usage during fast scrolling.
  Solution: always use `dequeueReusableCell(withIdentifier:)` for tables and `dequeueReusableCell(for:)` in collections.

**3. Large or Unoptimized Images**
* Loading full-size images directly into cells causes slow decoding and huge memory spikes.
* Images not cached will reload every time a cell appears.
  Solution: resize images to the correct display size, use libraries like **SDWebImage / Kingfisher** for caching.

**4. Complex Auto Layout or Deep View Hierarchies**
* If cells have too many nested views or heavy Auto Layout constraints, the system spends a lot of time calculating layouts during scrolling.
  Solution: simplify layouts, use stack views efficiently, or consider manual layout ( `layoutSubviews` ).

**5. Synchronous Networking or Disk Access**
* Fetching data or images synchronously inside `cellForRowAt` blocks the UI.
  Solution: use **asynchronous loading** and update cells when data is ready.

**6. Too Much Work in `cellForRowAt`**
* `cellForRowAt` is called **constantly** as you scroll.
* If you do complex setup, parsing, or drawing here, performance tanks.
  Solution: pre-calculate values before, and keep `cellForRowAt` lightweight (just bind data).

**7. Offscreen Rendering & Blending**
* Using properties like `cornerRadius` , `shadow` , `maskToBounds` on many cells forces Core Animation to do extra offscreen rendering.
* This adds GPU overhead and drops frames.
  Solution: use `shadowPath` , pre-rendered assets, or rasterization where appropriate.

</details>

---

<details>
<summary><b>Q8: How do you optimize app launch time and what factors affect it?</b></summary>

App launch time is a **big part of user experience** — if your app takes too long to start, users might drop it right away. Apple even monitors "App Launch Performance" in App Store submissions. Let’s go step by step.

**Types of App Launch**
1. **Cold Launch** – App starts from scratch (no process in memory).
2. **Warm Launch** – App is in memory but not running (just suspended).
3. **Hot Launch** – App is already running in background and brought to foreground.

Most optimization efforts focus on **cold launch**, since that’s where delays are most noticeable.

**Factors Affecting Launch Time**

1. **App Binary Size & Dynamic Libraries**
   * Loading lots of dynamic frameworks slows startup.
   * Large app binaries take longer to load.
2. **Heavy `AppDelegate` / `SceneDelegate` Code**
   * Doing network calls, database setup, or analytics initialization before the first screen appears adds big delays.
3. **Storyboard Loading & View Hierarchies**
   * Large storyboards or deep view hierarchies take more time to decode and render.
4. **Disk and I/O Operations**
   * Reading large files, Core Data migrations, or synchronous disk/database access during launch blocks UI.
5. **Static Initializers & Singletons**
   * Static variables or singletons that do heavy work at startup increase launch cost.

**Optimization Techniques**

1. **Lazy Loading**
   * Don’t load everything at once.
   * Postpone work like analytics, ads, or data fetch until after the first screen is visible.
2. **Optimize AppDelegate / SceneDelegate**
   * Keep `didFinishLaunchingWithOptions` as light as possible.
   * Defer setup work using `DispatchQueue.global().async` .
3. **Reduce Dependencies**
   * Avoid unnecessary 3rd-party SDKs or static initializations.
   * If you must use them, initialize lazily.
4. **Smaller Storyboards**
   * Split giant storyboards into smaller modules.
   * Consider programmatic UI for complex layouts.
5. **Image & Asset Optimization**
   * Use appropriate image sizes.
   * Enable asset catalogs and compression.
6. **Database Handling**
   * Defer Core Data migrations or run them in background after showing UI.
   * Use lightweight persistent stores if possible.
7. **Precompile / Reduce Swift Overhead**
   * Minimize usage of dynamic features that increase startup cost.
   * Use whole-module optimization in build settings.
8. **Use Instruments (Time Profiler + Launch Template)**
   * Measure what's blocking main thread at startup.
   * Find slow functions and move them off critical path

</details>

---

<details>
<summary><b>Q9: How does ARC interact with Core Foundation objects and CFRetain / CFRelease ?</b></summary>

**1. ARC vs Core Foundation**
* Swift’s **ARC** automatically manages the lifetime of Swift/Objective-C objects ( `NSObject` and subclasses).
* **Core Foundation objects** (e.g., `CFArray` , `CFString` , `CFDictionary` ) are C-based, not Swift classes.
* CF objects use **manual reference counting** with `CFRetain()` and `CFRelease()` .

So, if you create a CF object, you are responsible for balancing retains and releases. ARC doesn’t step in unless the object is **toll-free bridged** to Cocoa.

**2. Toll-Free Bridging**

Some CF types are **“toll-free bridged”** with Foundation equivalents:
* `CFStringRef` ↔ `NSString`
* `CFArrayRef` ↔ `NSArray`
* `CFDictionaryRef` ↔ `NSDictionary`

This means you can cast between them freely.
When you do this in Swift, ARC takes over and manages the retain/release for you.

**3. Non-Bridged CF Objects**

If you’re working with a CF type that’s **not bridged**, ARC won’t manage it.
You must manually use `CFRetain` and `CFRelease` .

**4. Unmanaged\<T\>**

Swift provides `Unmanaged<T>` to wrap CF objects when ARC can’t directly manage them.

Two main methods:
* `takeRetainedValue()` → use when you get an object you **own** (you must release later).
* `takeUnretainedValue()` → use when you get an object you **don’t own** (you must retain if you want to keep it).

</details>

---

<details>
<summary><b>Q10: How do you handle retain cycles in deeply nested object hierarchies?</b></summary>

A **retain cycle** happens when objects hold **strong references** to each other.

In a nested hierarchy like:
`Parent -> Child -> Grandchild -> Parent`
ARC can’t free them, even if you don’t need them anymore.

Result → **Memory leak**.

**How to handle it**

**1. Weak references for back links**
* Parent should strongly own children.
* Children should keep **weak** references back to parent.

**2. Use unowned when safe**
* If child cannot exist without parent (like a credit card without an owner), use **unowned**.
* Unowned does not keep the parent alive, but never becomes `nil` .

**3. Closures with [weak self] or [unowned self]**
* Closures capture `self` strongly by default → retain cycles.
* Always use capture lists

**4. Break references manually**
* Sometimes you need to **set references to nil** in `deinit` or `cleanup()` methods.

**5. Decide ownership clearly**
* Not every relationship should be strong.
* Rule:
  * **Top → Down:** strong (e.g., parent owns children).
  * **Bottom → Up:** weak/unowned (e.g., child knows parent, but doesn’t keep it alive).

</details>

---
