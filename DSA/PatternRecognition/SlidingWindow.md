## 🪟 Sliding Window – DSA Concept (Super Simple Explanation)

### 🔹 1. What is Sliding Window?

Sliding Window is a technique used to **avoid recalculating results again and again** for overlapping subarrays or substrings.

Instead of:

* Checking every possible subarray (which is slow ❌ O(n²))

We:

* Maintain a **window**
* Expand it ➡
* Shrink it ⬅
* Update result in O(1)

👉 Final complexity becomes **O(n)**

---

## 🔹 2. When to Recognize Sliding Window?

### ✅ You should think about Sliding Window when:

* Problem involves **array or string**
* It talks about:

  * Subarray / Substring
  * Contiguous elements
  * Window of size `k`
  * Longest / smallest subarray
  * Sum / count inside range

### 🚨 Keywords to trigger your brain:

* "Subarray"
* "Substring"
* "Contiguous"
* "Window size k"
* "Longest with condition"
* "Minimum with condition"

---

# 🧠 Types of Sliding Window

---

## 🟢 1️⃣ Fixed Size Window

Window size is given (k).

Example:

> Find maximum sum of subarray of size k

### 🧾 Example

Array = [2, 1, 5, 1, 3, 2]
k = 3

### ❌ Brute Force

Check all size-3 subarrays → O(nk)

### ✅ Sliding Window Approach

Step 1: Take first window
[2,1,5] → sum = 8

Step 2: Slide window
Remove 2, Add 1 → sum = 7

Step 3:
Remove 1, Add 3 → sum = 9

Step 4:
Remove 5, Add 2 → sum = 6

Max = **9**

### 🔁 Pattern Code

```swift
var windowSum = 0
var maxSum = 0

for i in 0..<k {
    windowSum += arr[i]
}

maxSum = windowSum

for i in k..<arr.count {
    windowSum += arr[i] - arr[i-k]
    maxSum = max(maxSum, windowSum)
}
```

⏱ Time: O(n)

---

## 🔵 2️⃣ Variable Size Window

Window size is NOT fixed.
We expand and shrink based on condition.

Example:

> Longest substring with at most k distinct characters

---

### 🧾 Example

String = "eceba"
k = 2

### Approach

Use:

* Left pointer
* Right pointer
* HashMap (to track frequency)

Steps:

* Expand right
* If condition breaks → shrink from left

---

### 🔁 General Pattern

```swift
var left = 0

for right in 0..<n {
    // expand window
    
    while condition_not_valid {
        // shrink window
        left += 1
    }
    
    // update answer
}
```

---

## 🎯 How To Approach Any Sliding Window Problem

### 🧩 Step-by-Step Thinking

1. Is it contiguous? → YES → Sliding window candidate
2. Fixed size or variable?
3. What should window maintain?

   * Sum?
   * Frequency?
   * Count?
4. When to shrink?
5. Where to update answer?

---

## 🧠 Mind Map (Very Simple)

```
                    Sliding Window
                           |
        -------------------------------------
        |                                   |
   Fixed Size                         Variable Size
   (k given)                         (condition based)
        |                                   |
   - Sum of k elements                - Longest substring
   - Avg of k                         - Smallest subarray
   - Max in window                    - At most k distinct
        |                                   |
   Slide by:                         Expand → Check → Shrink
   add new element
   remove old element
```

---

## 📌 Real Interview Examples

### Fixed Size

* Max sum subarray of size k
* First negative in window of size k
* Sliding window maximum

### Variable Size

* Longest substring without repeating characters
* Minimum window substring
* Longest repeating character replacement
* Fruit into baskets

---

## 🧠 Visualization

Imagine:

```
Array:  2  1  5  1  3  2
Window: [-----]
Slide →   [-----]
Slide →      [-----]
```

Instead of recalculating whole sum,
we adjust only 2 elements.

---

## 🧠 Important Trick

Sliding Window = Two Pointers
BUT

⚠ Two pointers are not always sliding window
Sliding window always means contiguous region.

---

## 🔥 Most Important Formula

For Fixed Size:

```
New Window = Old Window 
             - Element leaving 
             + Element entering
```

---

## 💡 How To Identify In 5 Seconds (Interview Trick)

Ask yourself:

* Is it contiguous?
* Are we optimizing something inside a range?
* Can I reuse previous calculation?

If YES → Try Sliding Window.

---



