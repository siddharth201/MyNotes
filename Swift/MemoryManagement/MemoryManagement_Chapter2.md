> **Why unowned does not increase reference count and if it does not increse reference count  why even ARC need to handle it. It can be handle like value type since they also do not increse reference count**  

**Ans**  
This is a **very deep and very good question** — you’re basically asking:

> **If `unowned` does not increase reference count, why does ARC even care about it?
> Why isn’t `unowned` treated like a value type?**

Let’s answer this **from first principles**, not from “Swift rules”.

---

# 1️⃣ First, clarify a crucial misconception

> ❌ “If something doesn’t increase reference count, ARC doesn’t handle it”

This is **false**.

👉 ARC handles **all references to class instances**, not only strong ones.

What differs is **how** ARC handles them.

---

# 2️⃣ Why value types are different (foundational difference)

### Value types (`struct`, `enum`)

* Have **no identity**
* Are **copied**
* Do **not point to heap objects**
* ARC is **not involved at all**

```swift
struct Point {
    var x: Int
}
```

There is:

* No shared lifetime
* No deallocation problem
* No dangling pointer possible

That’s why value types need **no runtime tracking**.

---

# 3️⃣ What `unowned` actually is (this is the key)

An `unowned` reference is:

> A **non-owning pointer to a heap object**, whose lifetime is managed elsewhere

That alone makes it **fundamentally different from value types**.

---

## Think in terms of memory

| Feature               | Value Type | unowned |
| --------------------- | ---------- | ------- |
| Points to heap object | ❌          | ✅       |
| Has identity          | ❌          | ✅       |
| Can dangle            | ❌          | ✅       |
| ARC involvement       | ❌          | ✅       |

🚨 **Dangling pointer risk** is the entire reason ARC must care.

---

# 4️⃣ What ARC must still do for `unowned`

Even though `unowned` does NOT increase reference count, ARC must:

### ✅ Track object deallocation

So ARC knows **when the object dies**

### ✅ Zero out weak references

(important distinction coming below)

### ❌ NOT zero out unowned references

Because unowned assumes lifetime is guaranteed

---

# 5️⃣ Why `unowned` is NOT treated like a value type

If ARC treated `unowned` like a value type:

* ARC would **not know** about the reference
* It could point to **freed memory**
* You’d get **silent memory corruption**, not crashes

Swift *intentionally* chooses:

> 💥 **Fail fast crash** instead of undefined behavior

This is **memory safety by design**.

---

# 6️⃣ Internal model (simplified but accurate)

### Strong reference

```
+1 retain
```

### Weak reference

```
+0 retain
+runtime tracking
+nil when object deallocates
```

### Unowned reference

```
+0 retain
+runtime tracking
+trap if accessed after dealloc
```

So ARC **must know** that an unowned reference exists.

---

# 7️⃣ Why ARC tracking is mandatory for `unowned`

Without ARC tracking:

* Accessing deallocated memory would return garbage
* App could behave unpredictably
* Security issues possible

Swift forbids this.

So instead:

* ARC tracks lifetime
* On access after deallocation → **trap**

---

# 8️⃣ Why weak becomes nil but unowned does not

| Reference | ARC behavior                  |
| --------- | ----------------------------- |
| `weak`    | Zeroed out to `nil`           |
| `unowned` | Left as-is, but runtime traps |

Why?

* `weak` is for **optional lifetimes**
* `unowned` is for **guaranteed lifetimes**

This is a **semantic contract**, not optimization.

---

# 9️⃣ Why not just make unowned optional like weak?

Because that would destroy its **entire purpose**:

* `unowned` exists to encode **design guarantees**
* Optional would imply uncertainty
* ARC would be forced to nil-check every access

Swift wants:

* **Explicit intent**
* **Fast access**
* **Clear crashes**

---

# 🔟 Core reason in one sentence (THIS is the answer)

> **`unowned` must be tracked by ARC because it points to a heap object with identity and lifetime, unlike value types, and failing to track it would break Swift’s memory safety guarantees.**

---

# 1️⃣1️⃣ Mental model (memorize this)

> Value types **are data**
> Strong references **own objects**
> Weak references **observe objects**
> Unowned references **depend on objects**

---

# 1️⃣2️⃣ Interview-grade one-liner

If an interviewer asks exactly what you asked, answer:

> “Even though `unowned` does not increase reference count, ARC must track it because it still points to a heap-allocated object. Treating it like a value type would allow dangling pointers and undefined behavior, which Swift explicitly prevents.”

That answer is **senior+ level**.



