Absolutely. This is now our **finalized Master Notes format** for every problem. From this point onwards, every problem in Hashing, Binary Search, Sliding Window, Trees, Graphs, DP, etc. will follow this exact structure.

---

# 📘 Pattern 2 – Frequency Counting

# Problem 4 – Majority Element

**Reference:** LeetCode 169 – Majority Element

---

# 📗 Layer 1 – Engineer Mode (Think)

---

# 🎯 Problem Metadata

| Attribute           | Value                       |
| ------------------- | --------------------------- |
| Pattern             | Frequency Counting          |
| Difficulty          | Easy                        |
| Data Structure      | Dictionary / HashMap        |
| Frequency Operation | **Build + Threshold Check** |
| Time Complexity     | O(n)                        |
| Space Complexity    | O(k)                        |

---

# 🎯 Learning Objective

After this problem you should understand

* How to count frequencies
* How to detect an element crossing a threshold
* Difference between **Find Maximum** and **Threshold Check**
* Why only one Majority Element can exist

---

# Step 1 — Understand the Problem

Given an integer array,

return the element that appears **more than ⌊n/2⌋ times**.

You may assume that such an element always exists.

---

## Example 1

```text
nums = [3,2,3]

Output

3
```

---

## Example 2

```text
nums = [2,2,1,1,1,2,2]

Output

2
```

---

# Step 2 — Manual Thinking

Forget coding.

Imagine counting votes.

```text
2
2
1
1
1
2
2
```

Final count

```text
2 → 4

1 → 3
```

Need

```text
Frequency > n/2
```

Since

```text
4 > 7/2
```

Answer

```text
2
```

---

# Step 3 — Naive Brute Force

---

## Idea

For every unique element

count its frequency

If

```text
count > n/2
```

return it.

---

## Structured Pseudocode

```text
FUNCTION MajorityElementBruteForce(nums)

    CREATE an empty Set called 'seen'

    FOR EACH element IN nums

        IF seen contains element THEN
            CONTINUE
        END IF

        SET count = 0

        FOR EACH current IN nums

            IF current == element THEN
                INCREMENT count
            END IF

        END FOR

        IF count > length(nums) / 2 THEN
            RETURN element
        END IF

        INSERT element INTO seen

    END FOR

    RETURN "No Majority Element"

END FUNCTION
```

---

## Why does it work?

Every unique element is counted exactly once.

If any frequency exceeds n/2,

that element is the answer.

---

## Complexity

Time

```text
O(n²)
```

Space

```text
O(k)
```

---

# Step 4 — Observation

What is repeated?

```text
Counting frequencies

Again

Again

Again
```

Can we remember frequencies?

YES.

---

# Step 5 — Pattern Recognition

Recognition Trigger

```text
How many times does each number appear?
```

Immediately

```text
Frequency Counting
```

---

# Step 6 — Choose Data Structure

Need

```text
Number

↓

Frequency
```

Best choice

```text
Dictionary
```

---

# Step 7 — Optimal Algorithm

## Structured Pseudocode

```text
FUNCTION MajorityElement(nums)

    CREATE an empty Dictionary called 'frequency'

    FOR EACH element IN nums

        IF element exists in frequency THEN
            INCREMENT frequency[element]
        ELSE
            SET frequency[element] = 1
        END IF

        IF frequency[element] > length(nums) / 2 THEN
            RETURN element
        END IF

    END FOR

END FUNCTION
```

---

## Why is this better?

Instead of repeatedly counting,

we count only once.

Every occurrence updates the frequency immediately.

The moment a count crosses

```text
n/2
```

we return.

---

# Step 8 — Dry Run

Input

```text
[2,2,1,1,1,2,2]
```

Dictionary

```text
2 → 1

2 → 2

1 → 1

1 → 2

1 → 3

2 → 3

2 → 4
```

Check

```text
4 > 7/2
```

Return

```text
2
```

---

# 💻 Swift Implementation

```swift
func majorityElement(_ nums: [Int]) -> Int {

    var frequency: [Int: Int] = [:]
    let threshold = nums.count / 2

    for num in nums {

        frequency[num, default: 0] += 1

        if frequency[num]! > threshold {
            return num
        }
    }

    fatalError("Majority element not found")
}
```

---

# 🐍 Python Implementation

```python
def majority_element(nums):

    frequency = {}
    threshold = len(nums) // 2

    for num in nums:

        frequency[num] = frequency.get(num, 0) + 1

        if frequency[num] > threshold:
            return num
```

---

# Complexity

| Approach    | Time  | Space |
| ----------- | ----- | ----- |
| Brute Force | O(n²) | O(k)  |
| HashMap     | O(n)  | O(k)  |

---

# 📘 Layer 2 – Computer Science Mode (Understand)

---

# 🧠 Why This Algorithm Works

Invariant

```text
frequency[x]

=

Number of occurrences of x
processed so far.
```

Whenever

```text
frequency[element]

>

n/2
```

that element has become the majority.

---

# 📐 Mathematical Proof

Suppose two majority elements exist.

```text
count(A) > n/2

count(B) > n/2
```

Adding both,

```text
count(A) + count(B)

>

n
```

Impossible.

Therefore,

there can be **at most one majority element**.

---

# 🎯 Hidden Assumption

LeetCode guarantees

```text
Majority Element Always Exists
```

If this guarantee is removed,

the algorithm should finish traversing the array and return

```text
"No Majority Element"
```

if no frequency exceeds

```text
n/2
```

---

# ⚠️ Edge Cases

Single element

```text
[5]
```

Answer

```text
5
```

---

All same

```text
[7,7,7,7]
```

Answer

```text
7
```

---

Negative numbers

```text
[-1,-1,-1,2]
```

Still works.

---

# 🚫 Can It Fail?

This HashMap solution does **not** fail.

However,

if the majority guarantee is removed,

we need an explicit verification before returning a result (unless we only return when the threshold is crossed during traversal, in which case finishing without a return indicates no majority).

---

# 📈 Complexity Proof

Why O(n)?

Because

each element

is processed exactly once.

Dictionary operations

```text
Insert

Lookup

Update
```

are average

```text
O(1)
```

Therefore

```text
n × O(1)

=

O(n)
```

---

# 📙 Layer 3 – Interview Mode (Communicate)

---

# Interview Explanation

> "I'll use a HashMap where the key is the number and the value is its frequency. As I traverse the array, I'll increment the frequency of the current number. The moment its frequency becomes greater than n/2, I can safely return it because the problem guarantees a majority element exists and mathematically only one element can satisfy this condition."

---

# Common Mistakes

❌ Finding maximum frequency instead of checking the threshold (works only because of the LeetCode guarantee).

❌ Forgetting that the majority element is **strictly greater** than `n/2`.

❌ Using a second traversal unnecessarily when an early return is possible.

---

# Follow-up Questions

### Q1

Can we solve without HashMap?

YES.

Using

**Boyer-Moore Voting Algorithm**

Time

```text
O(n)
```

Space

```text
O(1)
```

---

### Q2

Why don't we use a Set?

Because

a Set stores only

```text
Presence
```

We need

```text
Frequency
```

---

### Q3

What if the majority guarantee doesn't exist?

Need an additional verification before returning the answer if using approaches like Boyer-Moore. The HashMap approach can simply return "no majority" if no count ever exceeds `n/2`.

---

# 📝 Summary

```text
Problem Goal

↓

Find element occurring more than n/2 times

↓

Recognition Trigger

↓

Need frequency of each number

↓

Pattern

↓

Frequency Counting

↓

Operation

↓

Build + Threshold Check

↓

Data Structure

↓

Dictionary

↓

Time

↓

O(n)

↓

Space

↓

O(k)
```

---

# 🎯 Pattern DNA Card

```text
━━━━━━━━━━━━━━━━━━━━━━━━━━

Pattern
Frequency Counting

Problem
Majority Element

Recognition Trigger
How many times does each number appear?

Question Asked
Does any element cross n/2?

Operation
Build + Threshold Check

Key
Number

Value
Frequency

Data Structure
Dictionary

Brute Force
Repeated Counting

Optimal
Count While Traversing

Time
O(n)

Space
O(k)

Keywords
Majority
Frequency
Threshold
Vote
n/2

━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

# 📚 Frequency Pattern Progress

| Problem             | Frequency Operation     | Status |
| ------------------- | ----------------------- | ------ |
| Character Frequency | Build                   | ✅      |
| Valid Anagram       | Build + Compare         | ✅      |
| Ransom Note         | Build + Consume         | ✅      |
| Majority Element    | Build + Threshold Check | ✅      |

---

## 📌 Small curriculum refinement

One adjustment I'd make compared to our earlier discussion is to classify **"Build + Find Maximum"** as a **valid alternative solution**, but not the primary mental model for this problem. Since the problem statement explicitly asks whether an element exceeds the `n/2` threshold, **"Build + Threshold Check"** maps directly to the requirement and is the better concept to teach first. Later, when we study problems like **Top K Frequent Elements**, the **"Build + Find Maximum/Rank"** operation will become the natural primary pattern. This keeps each operation aligned with the question the problem is actually asking.

