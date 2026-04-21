## Q. Custom struct types does not follow CoW by default. Proove with an example.  

Nice—let’s turn this into a **clean, interview-ready demo** that proves BOTH:

1. Struct ≠ COW by default
2. Array (inside it) DOES use COW

This is exactly the kind of demo that impresses interviewers 👇

---

### 🚀 Final Interview Demo (Copy-Paste Ready)

```swift
struct BigData {
    var values: [Int]
}

func demoCOW() {
    var original = BigData(values: [1, 2, 3])
    var copy = original   // struct copy happens here (shallow)
    
    print("----- BEFORE MUTATION -----")
    
    original.values.withUnsafeBufferPointer { p1 in
        copy.values.withUnsafeBufferPointer { p2 in
            print("Same memory:", p1.baseAddress == p2.baseAddress)
        }
    }
    
    print("Original:", original.values)
    print("Copy:", copy.values)
    
    print("\n----- AFTER MUTATION -----")
    
    copy.values.append(999)   // triggers COW inside Array
    
    original.values.withUnsafeBufferPointer { p1 in
        copy.values.withUnsafeBufferPointer { p2 in
            print("Same memory:", p1.baseAddress == p2.baseAddress)
        }
    }
    
    print("Original:", original.values)
    print("Copy:", copy.values)
}

// Call it
demoCOW()
```

---

### 🧾 Expected Output

```
----- BEFORE MUTATION -----
Same memory: true
Original: [1, 2, 3]
Copy: [1, 2, 3]

----- AFTER MUTATION -----
Same memory: false
Original: [1, 2, 3]
Copy: [1, 2, 3, 999]
```

---

### 🧠 How to Explain in Interview (VERY IMPORTANT)

Say this clearly:

> “Structs are copied immediately, but that copy is shallow.
> In this example, the Array inside the struct uses Copy-On-Write,
> so both structs share memory until mutation happens.”

---

### 🎯 Key Takeaways (Say these confidently)

✔ Struct copy = immediate
✔ Copy is shallow
✔ COW is NOT automatic for structs
✔ COW happens only if internal storage supports it
✔ Array triggers copy only on mutation

---

### 🔥 Bonus (Level-Up Answer)

If interviewer pushes further:

> “If I replace Array with a class, COW disappears completely.”

```swift
class Box {
    var value: Int
    init(_ v: Int) { value = v }
}

struct Wrapper {
    var box: Box
}

func testReferenceLeak() {
    var a = Wrapper(box: Box(10))
    var b = a
    
    b.box.value = 999
    
    print(a.box.value) // 999 ❗
}
```

👉 Then say:

> “This breaks value semantics because the struct is copying the reference, not the data.”

---

### 🏁 One-line killer statement

> “Swift structs give value semantics, but not deep copies—Copy-On-Write is an optimization, not a guarantee.”


## Q. How to detect COW in runtime?
  


