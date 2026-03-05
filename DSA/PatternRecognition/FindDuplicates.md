

**Check if there are any duplicates in the array**

Example:

```
[1,2,3,4] → false
[1,2,3,1] → true
```

---

# 🧠 Step 1: Pattern Recognition

Ask the trigger questions:

1. Do we need **frequency or repetition detection?** → YES
2. Do we need **fast lookup while scanning?** → YES
3. Is the array **sorted?** → Not necessarily

👉 This immediately triggers:

# ✅ HashSet / HashMap Pattern

Mental trigger words:

* duplicate
* repeating
* frequency
* seen before

Whenever you see these → **Hashing**

---

# ❌ Brute Force Approach

Check each element with all others.

```
O(n²)
```

Not good.

---

# ✅ Optimal Approach — HashSet

Idea:

* Traverse array
* Store seen elements
* If element already exists → duplicate found

---

# 💻 Swift Solution

```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    
    for num in nums {
        if seen.contains(num) {
            return true
        }
        seen.insert(num)
    }
    
    return false
}
```

---

# ⏱ Complexity

Time: **O(n)**
Space: **O(n)**

---

# 🧠 Even Simpler Trick

If you sort:

```
[1,2,3,1] → [1,1,2,3]
```

Then duplicates are adjacent.

```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    let arr = nums.sorted()
    
    for i in 1..<arr.count {
        if arr[i] == arr[i-1] {
            return true
        }
    }
    
    return false
}
```

Time:

```
O(n log n)
```

Space:

```
O(1)
```

---

# 🧠 Pattern Decision (Interview Thinking)

| Approach    | When Used                    |
| ----------- | ---------------------------- |
| HashSet     | Best general solution        |
| Sorting     | When extra space not allowed |
| Brute force | Never in interview           |

---

# 📊 Your Pattern Practice Tracker

So far you identified:

| Problem                             | Pattern                  |
| ----------------------------------- | ------------------------ |
| Longest substring without repeating | Sliding Window + HashSet |
| Pair sum in sorted array            | Two Pointers             |
| Check duplicates                    | HashSet                  |

Good coverage of **3 core patterns** already.

---

# 🧠 Important Follow-up Pattern

A very common variant is:

> Check if duplicates exist within **k distance**

Example:

```
nums = [1,2,3,1], k=3 → true
```

This changes pattern to:

👉 **Sliding Window + HashSet**

---

# 🚀 Next Question For Pattern Training

Try recognizing pattern only (don’t solve yet):

**Find the first duplicate element in the array whose index of second occurrence is minimum.**

Example:

```
[1,2,3,2,1] → 2
```

Tell me:
1️⃣ Which pattern triggers
2️⃣ Why your brain chooses it.

