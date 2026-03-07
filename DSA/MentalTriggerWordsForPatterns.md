
This is exactly how you build **pattern recognition muscle**.

I’ll give you a **Mental Trigger Sheet** for major DSA patterns — the kind you should revise before interviews.

No fluff. Pure pattern detection training.

---

## 🪟 1️⃣ Sliding Window – Mental Triggers

### 🧠 Trigger Words

* Subarray
* Substring
* Contiguous
* Window size k
* Longest/Smallest subarray
* At most K
* At least K
* Continuous segment
* Maximum sum in range

---

### 🔍 Recognition Checklist

Ask:

1. Is it contiguous? ✅
2. Are we optimizing inside a range? ✅
3. Can we reuse previous computation? ✅

If YES → Sliding Window

---

### 📌 Types

* Fixed size → size = k
* Variable size → grow & shrink

---

---

## 👯 2️⃣ Two Pointers – Mental Triggers

### 🧠 Trigger Words

* Sorted array
* Pair sum
* Triplet sum
* Difference = k
* Remove duplicates
* In-place modification
* Partition
* Closest pair

---

### 🔍 Recognition Checklist

1. Is array sorted? ✅
2. Can moving pointer predictably change answer? ✅
3. Are we comparing two indices? ✅

If YES → Two Pointers

---

### 📌 Types

* Opposite ends (2-sum)
* Same direction (difference problem)
* Fast & slow (remove duplicates)

---

---

## 🧮 3️⃣ Prefix Sum – Mental Triggers

### 🧠 Trigger Words

* Range sum queries
* Subarray sum equals k
* Sum between L and R
* Cumulative sum
* Many queries
* Preprocessing

---

### 🔍 Recognition Checklist

1. Repeated sum calculation? ✅
2. Multiple range queries? ✅
3. Sum of subarray many times? ✅

If YES → Prefix Sum

---

### 🔥 Core Idea

```text
prefix[i] = sum from 0 to i
```

Then:

```text
sum(L,R) = prefix[R] - prefix[L-1]
```

---

---

## 🔁 4️⃣ Carry Forward – Mental Triggers

(This is very common in interview arrays)

### 🧠 Trigger Words

* Count something on left/right
* For each element, count elements after it
* Contribution technique
* Count pairs
* Number of elements greater/smaller

---

### 🔍 Recognition Checklist

1. Can answer for index i be built from i-1? ✅
2. Does problem involve left-side or right-side contribution? ✅

If YES → Carry Forward

---

Example:
Count pairs where A[i] < A[j]

Traverse from right, carry count.

---

---

## 📦 5️⃣ Subarray Problems – Mental Triggers

### 🧠 Trigger Words

* Subarray
* Continuous segment
* Sum of subarray
* Maximum subarray
* Minimum subarray

---

Then ask:

* Fixed size? → Sliding window
* Any size? → Variable window or Prefix sum
* Max sum? → Kadane
* Exact sum k? → Prefix + HashMap

---

---

## 🔎 6️⃣ Binary Search – Mental Triggers

### 🧠 Trigger Words

* Sorted array
* Search element
* First occurrence
* Last occurrence
* Find minimum/maximum possible value
* Minimize the maximum
* Allocate pages
* Capacity
* Time to finish

---

### 🔍 Recognition Checklist

1. Is array sorted? → Classic Binary Search
2. Is answer monotonic? → Binary Search on Answer

---

### 🔥 Binary Search on Answer Trigger Words

* Minimum possible X
* Maximum possible X
* Can we do it in X?
* Is X valid?
* Optimize capacity/time/limit

If answer space is monotonic → Binary Search.

---

---

## 🧠 7️⃣ HashMap / HashSet – Mental Triggers

### 🧠 Trigger Words

* Frequency
* Duplicate
* Repeating
* Count
* Occurrence
* Complement lookup
* Anagram
* Two sum (unsorted)

---

Ask:

* Do I need fast lookup? ✅
* Do I need frequency tracking? ✅

→ HashMap

---

---

## 📊 8️⃣ Sorting Based Pattern

### 🧠 Trigger Words

* Overlapping intervals
* Merge intervals
* Closest pair
* Minimize difference
* Greedy choice based on order

Sorting often simplifies logic.

---

---

## 🧠 9️⃣ Greedy – Mental Triggers

### 🧠 Trigger Words

* Maximize profit
* Minimum jumps
* Activity selection
* Non-overlapping intervals
* Choose best at each step

Ask:
Can local optimal choice lead to global optimal?

If YES → Greedy.

---

---

## 🧩 10️⃣ Backtracking – Mental Triggers

### 🧠 Trigger Words

* Generate all combinations
* Subsets
* Permutations
* N-Queens
* Word search
* Decision tree

Ask:
Do I need to try all possibilities?

→ Backtracking

---

---

## 🔥 MASTER DECISION FLOW (Very Important)

Before solving ANY array problem, ask:

1️⃣ Is it contiguous? → Sliding Window  
2️⃣ Is it sorted? → Two Pointer / Binary Search  
3️⃣ Need frequency? → HashMap  
4️⃣ Many range sums? → Prefix Sum  
5️⃣ Min/Max possible value? → Binary Search on Answer  
6️⃣ Generate all combinations? → Backtracking  
7️⃣ Optimize locally? → Greedy  

---

---

## 🧠 What Makes You Strong

Not memorizing solutions.

But building this mental mapping:

Problem Statement → Pattern Trigger → Template.

---    

## Compact cheat sheet for Subarray Problems
Here is a **compact cheat sheet for Subarray Problems**.
If you internalize this, you can recognize **~80% of array interview questions** quickly.

---

### 🧠 Subarray Pattern Cheat Sheet

When you see **SUBARRAY** in a problem, ask these questions **in this order**.

---

## 1️⃣ Are numbers ONLY POSITIVE?

If YES → **Sliding Window**

Because sum increases when we expand window.

### Trigger words

* smallest / longest subarray
* sum ≥ k
* sum ≤ k
* product < k

### Example

**Smallest subarray with sum ≥ k**

```
Sliding Window
```

Time

```
O(n)
```

---

## 2️⃣ Are NEGATIVE numbers present?

Sliding window may fail.

Then check:

### Exact sum problems

```
Subarray sum = k
Subarray sum = 0
Subarray sum divisible by k
```

👉 Pattern

```
Prefix Sum + HashMap
```

---

### Example

```
[10, 2, -2, -20, 10]
k = -10
```

Use

```
prefixSum - k
```

---

## 3️⃣ Are we asked for MAXIMUM subarray sum?

👉 Pattern

```
Kadane's Algorithm
```

### Example

```
[-2,1,-3,4,-1,2,1,-5,4]
```

Max subarray

```
[4,-1,2,1] = 6
```

Time

```
O(n)
```

---

## 4️⃣ Are we asked to COUNT subarrays?

Look carefully:

### Count subarrays with sum = k

```
Prefix Sum + HashMap
```

### Count subarrays with sum ≤ k (positive numbers)

```
Sliding Window
```

---

## 5️⃣ Just PRINT all subarrays?

Then simply:

```
Nested loops
```

Because total subarrays

```
n(n+1)/2
```

---

## 🧠 Quick Decision Tree

```
Subarray Problem
       |
       |
       ├─ Only positive numbers?
       |        |
       |        └─ Sliding Window
       |
       ├─ Negative numbers + exact sum?
       |        |
       |        └─ Prefix Sum + HashMap
       |
       ├─ Maximum sum?
       |        |
       |        └─ Kadane
       |
       ├─ Count subarrays?
       |        |
       |        └─ Prefix Sum + HashMap
       |
       └─ Print all subarrays
                |
                └─ Nested loops
```

---

## 📊 Example Mapping

| Problem                             | Pattern          |
| ----------------------------------- | ---------------- |
| Longest substring without repeating | Sliding Window   |
| Subarray sum = k                    | Prefix Sum       |
| Subarray sum = 0                    | Prefix Sum       |
| Maximum subarray sum                | Kadane           |
| Smallest subarray ≥ k               | Sliding Window   |
| Count subarrays sum = k             | Prefix + HashMap |
| Print subarrays                     | Nested loops     |

---

## 🧠 Interview Trick

Whenever you see:

```
SUBARRAY
```

Immediately ask:

```
1. Positive numbers only?
2. Exact sum or inequality?
3. Max/min?
4. Counting?
```

That determines the pattern.

---




## 25 MIXED QUESTIONS – IDENTIFY ONLY PATTERN

## Q.1 Find longest substring without repeating characters.

Your answer:

> Sliding Window because it has longest substring and contiguous

✅ Correct pattern: **Sliding Window (Variable Size)**
But let’s sharpen your reasoning.

---

### 🧠 Proper Pattern Recognition Thinking

When you see:

* **Substring** → automatically means contiguous
* **Longest** → optimization problem
* **Without repeating** → constraint inside window

That triggers:

👉 Variable Size Sliding Window
👉 With HashSet / HashMap (to track characters)

---

### 🔥 Why NOT Prefix Sum?

Because this isn’t about sum or range queries.

---

### 🔥 Why NOT Two Pointers (sorted)?

Because string is not sorted and order matters.

---

### 🧠 Final Clean Mental Statement (Interview Style)

> This is a contiguous substring optimization problem with a constraint (no repeating characters), so we use a variable-size sliding window with a HashSet to maintain uniqueness.

That sentence sounds very strong in interviews.

---

### Pattern Identified:

Sliding Window + HashSet

---  

## Q.2 Given an array check if any subarray has sum k  
### 🧠 Pattern Recognition Rule

Whenever you see:

subarray sum = k
subarray sum = 0
subarray sum divisible by k

Your brain should instantly trigger:

Prefix Sum + HashMap/Set

### Mental Model (Very Important)

Think like this while scanning the array:

prefixSum = sum from start to current index

Now ask:

Did I ever see prefixSum - k before?

If yes:

subarray sum = k





