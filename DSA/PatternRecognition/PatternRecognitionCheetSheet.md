Perfect timing 👍 — you’ve covered enough patterns now to **consolidate into a strong mental cheat sheet**.

This will be your **interview weapon** ⚔️
Focus: **Pattern Recognition → When to use what**

---

# 🧠 🧾 DSA Pattern Recognition Cheat Sheet

---

# 1️⃣ Sliding Window

## 🔥 When to use

```text
subarray / substring
contiguous
longest / smallest / count
window size k OR condition-based window
```

---

## 🧠 Sub-types

### ✅ Fixed Window

```text
size = k given
```

Use when:

```text
subarray of size k
average of k elements
max/min of k elements
```

---

### ✅ Variable Window

```text
longest / smallest window
condition based
```

Use when:

```text
at most k
at least k
no duplicates
sum constraint
```

---

### ✅ Counting Window

```text
count subarrays / substrings
```

Formula:

```text
count += right - left + 1
```

---

### ✅ Monotonic Window

```text
max/min in window
```

Use:

```text
deque
```

---

# 2️⃣ Two Pointers

## 🔥 When to use

```text
sorted array
pair / triplet
sum / difference
```

---

## Examples

* pair sum = k
* triplet sum
* remove duplicates

---

# 3️⃣ Hashing (Set / Map)

## 🔥 When to use

```text
duplicate
frequency
count
lookup fast
pair sum (unsorted)
```

---

## Key Trick

```text
x + y = k → check (k - x)
```

---

## Examples

* contains duplicate
* pair sum
* frequency count
* anagram

---

# 4️⃣ Prefix Sum

## 🔥 When to use

```text
subarray sum
range sum
sum = k
sum = 0
sum divisible by k
```

---

## Core Formula

```text
prefix[j] - prefix[i] = sum(i+1 → j)
```

---

## Examples

* subarray sum = k
* count subarrays
* range queries

---

# 5️⃣ Kadane’s Algorithm

## 🔥 When to use

```text
maximum subarray sum
continuous segment optimization
```

---

## Core Idea

```text
current = max(num, current + num)
```

---

# 6️⃣ Prefix + Suffix

## 🔥 When to use

```text
split array into two parts
left + right computation
min/max across splits
```

---

## Examples

* color streak split problem (you just did)
* max product except self
* partition problems

---

# 7️⃣ Carry Forward

## 🔥 When to use

```text
propagate info from left or right
```

---

## Examples

* prefix max
* suffix min
* rain water trapping

---

# 8️⃣ Binary Search

## 🔥 When to use

```text
sorted data
search element
minimum / maximum possible answer
```

---

## Types

* standard binary search
* binary search on answer

---

# 9️⃣ Greedy

## 🔥 When to use

```text
locally optimal choice leads to global optimum
```

---

## Examples

* activity selection
* interval scheduling
* coin change (some cases)

---

# 🔟 Backtracking / Recursion

## 🔥 When to use

```text
generate all combinations
permutations
choices / decisions
```

---

# 🧠 Master Decision Tree (IMPORTANT)

```text
ARRAY / STRING PROBLEM
        |
        |
        ├── Contiguous?
        |        |
        |        ├── YES → Sliding Window / Prefix Sum
        |        |
        |        └── Max sum → Kadane
        |
        ├── Pair / Triplet?
        |        |
        |        ├── Sorted → Two Pointers
        |        └── Unsorted → HashSet
        |
        ├── Sum related?
        |        |
        |        ├── Subarray → Prefix Sum
        |        └── Pair → Hashing / Two Pointer
        |
        ├── Split into parts?
        |        |
        |        └── Prefix + Suffix
        |
        ├── Count?
        |        |
        |        └── Sliding Window (count += ...)
        |
        └── Optimize max/min?
                 |
                 ├── Continuous → Kadane
                 └── Answer space → Binary Search
```

---

# 🧠 Pattern Mapping (From Your Practice)

| Problem                          | Pattern           |
| -------------------------------- | ----------------- |
| Longest substring without repeat | Sliding Window    |
| Pair sum sorted                  | Two Pointers      |
| Contains duplicate               | HashSet           |
| Subarray sum = 0                 | Prefix Sum        |
| Max subarray                     | Kadane            |
| Fixed size subarray              | Sliding Window    |
| Distinct subarray sum            | Sliding + HashMap |
| Swap 0 & 1 problem               | Sliding Window    |
| Color streak split               | Prefix + Suffix   |

---

# 🧠 Golden Interview Rules

### 1️⃣ Always ask:

```text
Is it contiguous?
```

---

### 2️⃣ Look for keywords

| Keyword              | Pattern             |
| -------------------- | ------------------- |
| subarray / substring | Sliding / Prefix    |
| pair / triplet       | Two pointers / Hash |
| sum = k              | Prefix / Hash       |
| duplicate            | Hash                |
| longest              | Sliding             |
| maximum sum          | Kadane              |

---

### 3️⃣ Convert problem

```text
x + y = k → y = k - x
```

---

# 🧠 Final Memory Shortcut

```text
Sliding → contiguous window
Hash → fast lookup
Prefix → subarray sum
Two pointer → sorted pairs
Kadane → max subarray
Prefix/Suffix → split problems
```

---

# 🚀 What You Should Do Next

Now your best practice strategy:

1️⃣ Pick problem
2️⃣ First say pattern (no code)
3️⃣ Then write solution

---

# 🔥 If you want next level

I can give:

👉 **50 pattern-recognition-only questions (no solving)**
👉 Or **FAANG-level mixed set with traps**
👉 Or **systematic roadmap to master DSA in 30 days**

Just tell me 😄

