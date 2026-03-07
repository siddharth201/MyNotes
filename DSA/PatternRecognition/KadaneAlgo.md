Kadane’s Algorithm is one of the **most important array patterns** for interviews.
It solves **maximum subarray problems in O(n)** instead of O(n²) or O(n³).

I’ll explain it in a **very intuitive way**, then the **pattern recognition**, and finally **Swift implementation**.

---

## 1️⃣ Problem Kadane Solves

> **Find the maximum sum of a contiguous subarray**

Example

```
nums = [-2,1,-3,4,-1,2,1,-5,4]
```

Best subarray:

```
[4,-1,2,1]
```

Sum:

```
6
```

---

## 2️⃣ Brute Force Thinking

All subarrays:

```
[-2]
[-2,1]
[-2,1,-3]
...
```

Total subarrays:

```
n(n+1)/2
```

Time complexity

```
O(n²) or O(n³)
```

Too slow.

---

## 3️⃣ Kadane’s Key Idea

At each element we ask:

```
Should I extend the current subarray
OR
Start a new subarray from here?
```

Decision rule:

```
currentSum = max(num, currentSum + num)
```

Then update

```
maxSum = max(maxSum, currentSum)
```

---

## 4️⃣ Intuition (Very Important)

Imagine walking along the array.

If your current running sum becomes **negative**, it will only **hurt future sums**.

So you **reset it**.

Example:

```
[-2,1,-3,4,-1,2,1,-5,4]
```

Walk through:

| num | currentSum | maxSum |
| --- | ---------- | ------ |
| -2  | -2         | -2     |
| 1   | 1          | 1      |
| -3  | -2         | 1      |
| 4   | 4          | 4      |
| -1  | 3          | 4      |
| 2   | 5          | 5      |
| 1   | 6          | 6      |
| -5  | 1          | 6      |
| 4   | 5          | 6      |

Answer = **6**

---

## 5️⃣ Swift Implementation

```swift
func maxSubArray(_ nums: [Int]) -> Int {
    var currentSum = nums[0]
    var maxSum = nums[0]
    
    for i in 1..<nums.count {
        currentSum = max(nums[i], currentSum + nums[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}
```

Time complexity

```
O(n)
```

Space

```
O(1)
```

---

## 6️⃣ Pattern Recognition (Very Important)

When you see these words, **Kadane should trigger instantly**.

### Trigger words

* maximum subarray
* largest sum subarray
* contiguous subarray maximum
* maximum profit segment
* best continuous segment

---

## 7️⃣ Kadane Mental Model

Ask these questions:

```
1. Is it contiguous?
2. Are we maximizing sum?
3. Can we drop negative prefix?
```

If yes → **Kadane**

---

## 8️⃣ Visual Example

Array

```
[5,-3,4]
```

Possible subarrays:

```
[5] = 5
[5,-3] = 2
[5,-3,4] = 6
[-3] = -3
[-3,4] = 1
[4] = 4
```

Max = **6**

Kadane finds this in **one pass**.

---

## 9️⃣ Important Edge Case

All numbers negative

```
[-8,-3,-6,-2,-5,-4]
```

Answer =

```
-2
```

Kadane still works.

---

## 🔟 Kadane Variations (Interview Favorites)

### 1️⃣ Maximum circular subarray

```
LeetCode 918
```

### 2️⃣ Maximum product subarray

```
LeetCode 152
```

### 3️⃣ Maximum sum rectangle in matrix

Kadane used inside.

---

## 1️⃣1️⃣ Kadane vs Sliding Window

| Problem                       | Technique        |
| ----------------------------- | ---------------- |
| Maximum subarray sum          | Kadane           |
| Subarray sum ≤ k              | Sliding window   |
| Subarray sum = k              | Prefix sum       |
| Longest subarray with sum = k | Prefix + HashMap |

---

## 1️⃣2️⃣ Pattern Recognition Example

Question

```
Find maximum sum contiguous subarray
```

Brain triggers

```
Subarray
Max sum
Contiguous
```

Pattern

```
Kadane
```

---  

## Derive it logically in an interview

Great 👍 Siddharth. Instead of **memorizing Kadane**, let’s learn how to **derive it logically in an interview**. This trick makes the algorithm feel obvious.

---

## 1️⃣ Start With the Real Question

Problem:

> Find **maximum sum contiguous subarray**

Example

```
[-2,1,-3,4,-1,2,1,-5,4]
```

We want the best **continuous segment**.

---

## 2️⃣ Key Interview Thinking Step

Ask yourself:

```
For every index i,
what is the maximum subarray sum that ENDS at i?
```

Not anywhere — specifically **ending at i**.

Why?

Because any maximum subarray must **end somewhere**.

---

## 3️⃣ Two Choices at Every Element

At index `i`, you have two possibilities:

### Option 1 — Extend previous subarray

```
previousSum + nums[i]
```

Example

```
[4,-1,2] → add next element
```

---

### Option 2 — Start new subarray

Just take

```
nums[i]
```

---

## 4️⃣ Choose the Better One

So we write

```
currentSum = max(nums[i], previousSum + nums[i])
```

This is **Kadane’s core formula**.

---

## 5️⃣ Track the Best Answer

While calculating the best sum ending at each index, keep track of the overall best.

```
maxSum = max(maxSum, currentSum)
```

---

## 6️⃣ Final Algorithm

```
currentSum = nums[0]
maxSum = nums[0]

for i from 1 → n-1
    currentSum = max(nums[i], currentSum + nums[i])
    maxSum = max(maxSum, currentSum)
```

---

## 7️⃣ Visual Walkthrough

Array

```
[-2,1,-3,4,-1,2,1,-5,4]
```

| i  | num | currentSum | maxSum |
| -- | --- | ---------- | ------ |
| -2 | -2  | -2         | -2     |
| 1  | 1   | 1          | 1      |
| -3 | -2  | 1          |        |
| 4  | 4   | 4          |        |
| -1 | 3   | 4          |        |
| 2  | 5   | 5          |        |
| 1  | 6   | 6          |        |
| -5 | 1   | 6          |        |
| 4  | 5   | 6          |        |

Answer

```
6
```

Subarray

```
[4,-1,2,1]
```

---

## 8️⃣ The Real Intuition (Most Important)

If your running sum becomes **negative**, it will only make future sums worse.

Example

```
currentSum = -5
next element = 6
```

Better to start fresh:

```
6
```

Not

```
1
```

So we **reset when sum becomes harmful**.

---

## 9️⃣ Pattern Recognition (When Kadane Should Trigger)

Your brain should trigger Kadane when you see:

### Keywords

* maximum subarray
* maximum contiguous sum
* best continuous segment
* largest sum segment
* max profit continuous days

---

## 🔟 Example Problems That Use Kadane

1️⃣ Maximum Subarray (classic)

2️⃣ Maximum profit from stock prices (variation)

3️⃣ Maximum sum rectangle in matrix

4️⃣ Maximum circular subarray

---

## 1️⃣1️⃣ Mental Pattern Map

When you see **SUBARRAY problems**, ask:

```
Are we maximizing sum?
```

YES → Kadane

```
Exact sum = k?
```

→ Prefix Sum

```
Sum ≤ k with positive numbers?
```

→ Sliding Window

---

## 1️⃣2️⃣ Swift Implementation

```swift
func maxSubArray(_ nums: [Int]) -> Int {
    var currentSum = nums[0]
    var maxSum = nums[0]
    
    for i in 1..<nums.count {
        currentSum = max(nums[i], currentSum + nums[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}
```

Time

```
O(n)
```

Space

```
O(1)
```

---

## 🧠 Interview Trick

If interviewer asks:

> Why does Kadane work?

Answer:

Because any subarray with **negative prefix sum will decrease the future sum**, so it is optimal to start a new subarray.

---

## 🚀 Next Level (Very Important)

There is a **more advanced version of Kadane** that interviewers ask frequently:

```
Maximum Circular Subarray
```

Example

```
[5,-3,5]
```

Answer

```
10
```

Because circular subarray

```
[5,5]
```

If you want, I can also show you **the 6 most important array interview patterns** (Sliding Window, Prefix Sum, Kadane, Two Pointer, Binary Search on Answer, Hashing) in **one visual map**.
It will make recognizing problems much faster.


