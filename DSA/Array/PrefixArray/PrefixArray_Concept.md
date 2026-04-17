

## 🧠 1️⃣ What is Prefix Sum? (Core Idea)

Think:

```text
Instead of recomputing sum again and again,
store cumulative sum once and reuse it
```

---

### 📌 Example

Array:

```text
[2, 5, 1, 3]
```

Prefix array:

```text
[0, 2, 7, 8, 11]
```

Meaning:

```text
prefix[i] = sum of first i elements
```

---

### 🧠 Why we add extra 0?

```text
prefix[0] = 0
```

This avoids edge cases and makes formula clean.

---

## 🔑 2️⃣ Magic Formula (Most Important)

To get sum of:

```text
arr[left ... right]
```

Use:

```text
prefix[right+1] - prefix[left]
```

---

### 🔍 Example

```text
arr = [2,5,1,3]
prefix = [0,2,7,8,11]
```

Find sum of:

```text
[5,1] → indices (1...2)
```

```text
prefix[3] - prefix[1] = 8 - 2 = 6 ✅
```

---

## 🧠 3️⃣ Why Prefix Sum Works

Because:

```text
prefix[right+1] = sum(0 → right)
prefix[left]     = sum(0 → left-1)
```

So:

```text
subtract → remaining = left → right
```

---

## 🧠 4️⃣ Pattern Recognition (VERY IMPORTANT)

When you see:

```text
subarray sum
range sum
sum from i to j
sum = k
multiple queries
```

👉 Your brain should trigger:

## ✅ Prefix Sum

---

## 🧠 5️⃣ When to Use Prefix Sum

| Situation                      | Use Prefix Sum? |
| ------------------------------ | --------------- |
| Multiple range queries         | ✅ Yes           |
| Subarray sum = k               | ✅ Yes           |
| Sum of all subarrays           | ✅ Yes           |
| Single sum query               | ❌ Not needed    |
| Sliding window (positive only) | ❌ Better        |

---

## 🧠 6️⃣ Common Problem Types

---

### 1️⃣ Range Sum Queries

```text
Q: Sum between index i and j many times
```

👉 Use prefix → O(1) per query

---

### 2️⃣ Subarray Sum = K

```text
Find if any subarray has sum k
```

👉 Prefix + HashMap

---

### 3️⃣ Count Subarrays with Sum = K

👉 Prefix + frequency map

---

### 4️⃣ Subarray Sum = 0

👉 Prefix + HashSet

---

### 5️⃣ Prefix Min / Max

👉 variation of prefix idea

---

## 🧠 7️⃣ Real-World Examples

---

### 💰 1️⃣ Bank Transactions

You have daily transactions:

```text
[+100, -20, +50, -10]
```

Want:

```text
Total money between day 2 and day 4
```

👉 Prefix sum gives instant answer

---

### 📊 2️⃣ Analytics Dashboard

Website visits per day:

```text
[10, 20, 15, 30]
```

Query:

```text
Visits from day 1 to 3
```

👉 Prefix → fast calculation

---

### 🎮 3️⃣ Game Score Tracking

Scores:

```text
[5, 10, 20, 15]
```

Want:

```text
Total score in a level segment
```

👉 Prefix helps

---

### 📶 4️⃣ Network Usage

Data usage per minute:

```text
[2MB, 3MB, 5MB...]
```

Query:

```text
Usage between minute 10 and 20
```

---

## 🧠 8️⃣ Prefix vs Sliding Window

| Problem                   | Technique      |
| ------------------------- | -------------- |
| Sum of fixed window       | Sliding Window |
| Sum of arbitrary range    | Prefix         |
| Sum with negatives        | Prefix         |
| Longest window constraint | Sliding        |

---

## 🧠 9️⃣ Code Template

```swift
func buildPrefix(_ arr: [Int]) -> [Int] {
    var prefix = [0]
    
    for num in arr {
        prefix.append(prefix.last! + num)
    }
    
    return prefix
}
```

---

## 🧠 10️⃣ Advanced Pattern (Important)

When you see:

```text
subarray sum = k
```

Think:

```text
prefix[j] - prefix[i] = k
```

Rearrange:

```text
prefix[i] = prefix[j] - k
```

👉 Use HashMap to track prefix sums

---

## 🧠 11️⃣ Common Mistakes

❌ Using prefix when sliding window is better
❌ Forgetting prefix[0] = 0
❌ Off-by-one errors
❌ Not handling negative numbers correctly

---

## 🧠 12️⃣ Mental Model

```text
Prefix = cumulative history
```

Instead of recomputing:

```text
sum again and again
```

You reuse:

```text
previous work
```

---

## 🔥 One-Line Memory

```text
Prefix Sum = Precompute once → Answer queries instantly
```

---

## 🚀 Practice Direction

Start with:

1️⃣ Range sum query
2️⃣ Subarray sum = k
3️⃣ Count subarrays
4️⃣ Subarray sum = 0

---


## 
 
