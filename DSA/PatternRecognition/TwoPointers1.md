Excellent 👌
This is a **classic pattern recognition test** question.

Let’s break it properly — interview style.

---

# 🧠 Step 1: Pattern Recognition

### Given:

* ✅ Sorted array
* ✅ Find pair
* ✅ Sum = k

Ask yourself:

1. Is it contiguous? ❌ No
2. Is it sorted? ✅ Yes
3. Are we finding a pair? ✅ Yes

👉 Immediate brain trigger: **Two Pointers**

This is **NOT sliding window**.

---

# 🧩 Why Two Pointers Works Here

Because array is sorted:

If sum is too small → move left forward
If sum is too large → move right backward

You adjust intelligently.

---

# 🔥 Optimal Approach — Two Pointers (O(n))

### Algorithm

1. left = 0
2. right = n - 1
3. While left < right:

   * sum = A[left] + A[right]
   * If sum == k → Found
   * If sum < k → left++
   * If sum > k → right--

---

## ✍ Example

Array = [1, 2, 3, 4, 6]
k = 6

```
left=0 (1)
right=4 (6)
1+6=7 >6 → right--

left=0 (1)
right=3 (4)
1+4=5 <6 → left++

left=1 (2)
right=3 (4)
2+4=6 ✅
```

---

## 💻 Swift Code

```swift
func findPair(_ arr: [Int], _ k: Int) -> (Int, Int)? {
    var left = 0
    var right = arr.count - 1
    
    while left < right {
        let sum = arr[left] + arr[right]
        
        if sum == k {
            return (left, right)
        } else if sum < k {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return nil
}
```

⏱ Time: O(n)
📦 Space: O(1)

---

# 🧠 How You Should Think in Interview

Your brain flow:

> Sorted + Pair + Target
> → Two pointers from both ends.

Because:

* Increasing left increases sum
* Decreasing right decreases sum
* Monotonic behavior → controllable movement

---

# 🆚 Alternative Approaches

## 1️⃣ Hashing (Works even if NOT sorted)

Use Set

```swift
var set = Set<Int>()

for num in arr {
    if set.contains(k - num) {
        return true
    }
    set.insert(num)
}
```

⏱ O(n)
📦 O(n)

Good when array NOT sorted.

---

## 2️⃣ Binary Search Approach

For each element:

* search (k - arr[i]) using binary search

⏱ O(n log n)

Less optimal than two pointers.

---

# 📌 Pattern Extraction

This problem teaches:

### Use Two Pointers when:

* Array is sorted
* Finding pair
* Sum / difference condition
* Monotonic movement possible

---

# 🚨 Important Variation

If array NOT sorted:
→ Either sort + two pointers (O(n log n))
→ Or use HashSet (O(n))

---

# 🧠 Very Important Interview Insight

Two pointer works because:

As left increases → value increases
As right decreases → value decreases

So sum changes predictably.

If array was unsorted, this logic breaks.

---



