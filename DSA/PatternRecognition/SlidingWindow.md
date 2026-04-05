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

## Sliding-Window Templates — step-by-step, with every variable explained

Nice — this is the exact level of mastery you want. Below I’ll go through the **4 core sliding-window templates** (Fixed, Longest/variable, Count, Monotonic). For each template I’ll:

* Say **when** to use it
* Show the **canonical code skeleton** (clear, language-agnostic)
* Explain **every variable** (responsibility / life-cycle)
* Walk a short **step-by-step trace / intuition**
* Give a short **Swift** implementation sketch you can paste

Keep this as your pocket reference.

---

## 1) Fixed-Size Window (window size = k)

**When to use**

* Problem explicitly gives `k` (window size).
* Examples: max sum of size `k`, average of every length-k subarray, max vowels in substring of size `k`.

## Skeleton

```
var windowValue = initialZero   // e.g. sum, vowelCount, etc.
for right in 0 ..< n {
    // expand: include arr[right]
    update windowValue with arr[right]
    if right >= k-1 {
        // window [right-k+1 .. right] is now size k
        use windowValue to update answer
        // shrink: remove arr[right-k+1]
        update windowValue to remove arr[right-k+1]
    }
}
```

## Variables & responsibilities

* `right` — the index we are iterating; new element entering window.
* `k` — fixed window size (given).
* `windowValue` — **what we store for the current window** (sum, count of vowels, frequency map, etc.). It is incrementally updated: add when expanding, subtract/remove when shrinking.
* `answer` (or `maxSum`, `resultList`) — accumulates or stores the output for each valid window.
* (optional) `left` — not necessary in the canonical fixed pattern, but `left = right - k + 1` conceptually marks the left bound.

## Step-by-step intuition

1. Add element at `right` to `windowValue`.
2. When `right` has reached index `k-1`, the window is full for the first time. Process it (update answer).
3. Then remove the element at `right-k+1` (the leftmost) so next iteration the window slides right by one.
4. Repeat.

## Swift example — max sum of size k

```swift
func maxSum(_ arr: [Int], _ k: Int) -> Int {
    guard arr.count >= k else { return 0 }
    var windowSum = 0
    var maxSum = Int.min

    for right in 0..<arr.count {
        windowSum += arr[right]                       // expand
        if right >= k-1 {
            maxSum = max(maxSum, windowSum)          // process
            windowSum -= arr[right - k + 1]          // shrink (remove leftmost)
        }
    }
    return maxSum
}
```

---

## 2) Longest Window (variable-size, expand & shrink to satisfy constraint)

**When to use**

* You want a **maximum length** (or minimum length) contiguous window satisfying a constraint.
* Examples: longest substring without repeating characters, longest with at most K distinct, smallest subarray with sum ≥ target (min length variant uses similar structure but tracks min).

## Skeleton

```
var left = 0
for right in 0 ..< n {
    // expand: incorporate arr[right] into window state
    update windowState with arr[right]
    // while window is invalid (violates constraint)
    while condition_not_valid(windowState) {
        // shrink: remove arr[left] from windowState
        update windowState to remove arr[left]
        left += 1
    }
    // now window [left .. right] is valid => update answer (e.g. max length)
    answer = max(answer, right - left + 1)
}
```

## Variables & responsibilities

* `right` — expands the window by adding new elements.
* `left` — moves forward to shrink the window until it becomes valid.
* `windowState` — stores the information needed to check constraint (e.g., freq map for distinct count, current sum for sum constraints).

  * **Invariants:** After the `while` loop finishes, `windowState` satisfies the constraint.
* `condition_not_valid(windowState)` — the predicate that tells you whether to continue shrinking (e.g., `distinct > K`, or `sum > target` depending on problem).
* `answer` — record the best window size or other metric.

## Step-by-step intuition

1. Move `right` and update state.
2. If you broke the constraint, move `left` forward and update state until constraint is satisfied again.
3. Each time the window is valid, update the result (for max length problems commonly `max(ans, right-left+1)`).

## Swift example — longest substring without repeating (chars)

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
    let chars = Array(s)
    var left = 0
    var freq = [Character: Int]()
    var best = 0

    for right in 0..<chars.count {
        freq[chars[right], default: 0] += 1           // expand
        while freq[chars[right]]! > 1 {               // invalid: duplicate of this char
            freq[chars[left]]! -= 1                   // shrink
            left += 1
        }
        best = max(best, right - left + 1)            // valid window
    }
    return best
}
```

---

## 3) Count Windows (count number of valid subarrays / substrings)

**When to use**

* You must **count** all subarrays/substrings that satisfy some property (usually “at most K” type).
* Examples: count subarrays with at most K distinct, count substrings with at most K vowels, count subarrays with sum ≤ K when positives only.

This template often uses the trick:

```
## of valid subarrays ending at right = (right - left + 1)
```

So we accumulate that.

## Skeleton

```
var left = 0
var count = 0
for right in 0 ..< n {
    expand windowState with arr[right]
    while condition_not_valid(windowState) {
        shrink windowState by removing arr[left]
        left += 1
    }
    // all windows that end at right and start in [left..right] are valid
    count += (right - left + 1)
}
```

## Variables & responsibilities

* `left`, `right` — window bounds.
* `windowState` — same as before, used to detect validity.
* `count` — final tally of valid windows.
* `(right - left + 1)` — number of subarrays ending at `right` whose start index can vary from `left` to `right` (all are valid because windowState for left..right is valid and any shorter prefix will stay valid).

## Step-by-step intuition

1. For each `right`, after shrinking to make window valid, every starting index `s` in `[left..right]` gives a valid subarray `[s..right]`. That’s `right-left+1` new subarrays.
2. Accumulate into `count`.

## Swift example — count subarrays with at most K distinct

```swift
func subarraysAtMostKDistinct(_ arr: [Int], _ K: Int) -> Int {
    var left = 0
    var freq = [Int: Int]()
    var count = 0

    for right in 0..<arr.count {
        freq[arr[right], default: 0] += 1
        while freq.keys.count > K {
            freq[arr[left]]! -= 1
            if freq[arr[left]] == 0 { freq.removeValue(forKey: arr[left]) }
            left += 1
        }
        count += (right - left + 1)
    }
    return count
}
```

(Count of exactly K distinct = atMost(K) − atMost(K−1).)

---

## 4) Monotonic Window (deque) — get max/min per window

**When to use**

* You need the **max / min** element in every sliding window of size `k`.
* Examples: Sliding Window Maximum (LeetCode 239).

## Skeleton (indices in deque)

```
var deque = empty deque   // store indices, monotonic (decreasing for max)
for right in 0..<n {
    // remove indices out of this window from front
    while !deque.isEmpty && deque.first <= right - k { deque.removeFirst() }
    // maintain monotonic property: remove smaller values from back
    while !deque.isEmpty && arr[deque.last] < arr[right] { deque.removeLast() }
    deque.append(right)
    if right >= k-1 {
        result.append(arr[deque.first])  // front is max of window
    }
}
```

## Variables & responsibilities

* `deque` — stores indices of elements; maintained so `arr[deque[0]]` is window max.

  * **Invariant 1:** indices in deque are within current window `[right-k+1 .. right]`.
  * **Invariant 2:** values `arr[deque[i]]` are in **decreasing order** (so front is max).
* `right` — current end index (expanding).
* `k` — window size.
* `result` — list of window maxima.

## Step-by-step intuition

1. Pop elements from front if they left the window (index ≤ right−k).
2. Pop from back any indices whose value is **less than** `arr[right]` — they’ll never be needed (current is better and newer).
3. Append `right`.
4. When window is full, front of deque holds index of max for current window.

## Swift example

```swift
func slidingWindowMax(_ nums: [Int], _ k: Int) -> [Int] {
    guard !nums.isEmpty && k > 0 else { return [] }
    var dq = [Int]()   // will store indices
    var res = [Int]()
    for i in 0..<nums.count {
        // remove indices out of window
        if !dq.isEmpty && dq.first! <= i - k {
            dq.removeFirst()
        }
        // remove smaller values from back
        while !dq.isEmpty && nums[dq.last!] < nums[i] {
            dq.removeLast()
        }
        dq.append(i)
        if i >= k - 1 {
            res.append(nums[dq.first!])
        }
    }
    return res
}
```

---

## Quick comparison & when to pick which

* **Fixed window**: if `k` is given. Use the build-first or single-loop template — maintain a simple `windowValue`.
* **Longest window**: if you want longest/shortest window satisfying a constraint → use expand/shrink with `left` while checking `condition_not_valid`.
* **Count windows**: if problem asks for number of valid subarrays → use the count template and add `(right-left+1)` each step.
* **Monotonic window**: if you need per-window max/min → use a deque of indices with monotonic property.

---

## Common variable naming & meanings (cheat list)

* `left, right` — window bounds (inclusive). `right` is usually the loop variable.
* `windowValue` / `windowSum` / `vowelCount` — the aggregated value for the current window.
* `windowState` — generic: could be freq map, sum, deque, etc.
* `freq` / `map` — frequency map for characters/numbers inside window.
* `deque` — monotonic structure for max/min queries, stores indices.
* `answer` / `best` / `count` — final results you update inside the loop.

---

## A tiny final mapping you can memorize (5-second test)

* `k present` → Fixed window template
* `Longest / smallest window` → Longest/variable template
* `Count windows` → Count template (`count += right-left+1`)
* `Max/min per window` → Monotonic deque template

---  

# Q. For the fixed size window can you provide Skeleton more easy way also taking start/left and end/right both instead of only right?  

Yes 👍 this is a very good refinement.
Using **both `left` and `right` pointers** makes the logic more intuitive (especially when you move to variable window later).

Let’s rewrite **Fixed Sliding Window** in the cleanest possible way.

---

# 🧠 Fixed Window (Left–Right Version)

## 🔁 Easy Skeleton (Most Intuitive)

```swift
var left = 0
var windowValue = 0   // sum / count / etc.

for right in 0..<arr.count {
    
    // 1️⃣ Expand window
    windowValue += arr[right]
    
    // 2️⃣ Check if window size reached k
    if right - left + 1 == k {
        
        // 3️⃣ Process window
        // e.g. maxSum = max(maxSum, windowValue)
        
        // 4️⃣ Shrink window
        windowValue -= arr[left]
        left += 1
    }
}
```

---

# 🧠 What Each Variable Means

### `left`

* Start of window
* Moves forward when window slides

---

### `right`

* End of window
* Always moves forward

---

### `windowValue`

* Represents **current window state**
* Could be:

  * sum
  * count
  * frequency map
  * deque (for max/min problems)

---

### `right - left + 1`

* Current window size

---

# 🧠 Mental Model (Super Important)

Think:

```text
[left ........ right]
```

Steps:

```
1. Add arr[right] → expand
2. If size == k → process
3. Remove arr[left] → shrink
4. Move left
```

---

# 🔍 Example Walkthrough

Array:

```
[2,1,5,1,3,2]
k = 3
```

### Step-by-step

```
right=0 → [2]           size=1
right=1 → [2,1]         size=2
right=2 → [2,1,5]       size=3 ✅ process

remove 2 → [1,5]

right=3 → [1,5,1]       size=3 ✅
remove 1 → [5,1]

right=4 → [5,1,3]       size=3 ✅
remove 5 → [1,3]
```

---

# 💻 Full Example (Max Sum)

```swift
func maxSum(_ arr: [Int], _ k: Int) -> Int {
    var left = 0
    var windowSum = 0
    var maxSum = Int.min
    
    for right in 0..<arr.count {
        
        windowSum += arr[right]
        
        if right - left + 1 == k {
            maxSum = max(maxSum, windowSum)
            
            windowSum -= arr[left]
            left += 1
        }
    }
    
    return maxSum
}
```

---

# 🧠 Why This Version Is Better

Compared to earlier template:

```swift
if i >= k-1
```

This one is better because:

* Uses **explicit window size**
* Easier to visualize
* Same structure as variable window
* Easier transition to advanced problems

---

# 🧠 Pattern Upgrade (Very Important)

You can now generalize:

### Fixed window:

```text
if window size == k → process
```

### Variable window:

```text
while window invalid → shrink
```

Same structure, only condition changes.

---

# 🔥 Final Mental Shortcut

```
Fixed Window = grow → exact size → process → shrink
```

---

# Can you explain same template with below example.
#Given an array print the start and end indeces of all subarray of size k






