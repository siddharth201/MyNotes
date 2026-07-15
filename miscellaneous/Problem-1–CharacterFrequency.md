Excellent. We continue with the same production workflow.

Before we start coding LeetCode problems, just like we did in **Visited Pattern**, we'll first solve the most fundamental problem.

I deliberately **don't** want to start with **LeetCode 242 (Valid Anagram)**.

Why?

Because students should first learn **how to build a Frequency Map**.

This becomes the foundation for almost every frequency problem.

Think of it like this:

```
Visited Pattern

↓

Contains Duplicate
```

Similarly,

```
Frequency Pattern

↓

Character Frequency
```

Character Frequency is to Frequency Pattern what Contains Duplicate was to Visited Pattern.

---

# 📘 Hashing Course

# Pattern 2 – Frequency Counting

# Problem 1 – Character Frequency

> **Foundation Problem (Not LeetCode)**

Pattern:
Frequency Counting ⭐⭐⭐⭐⭐

New Learning:
**How to Build a Frequency Map**

Difficulty:
🟢 Easy

---

# 🎯 Learning Objective

After this problem students should understand

* How to build a Frequency Map
* Why counting happens in one traversal
* Why Map is the correct data structure
* Foundation for Anagram, Majority Element, Top K Frequent

---

# Step 1 — Understand the Problem

## Problem Statement

Given a string,

count the frequency of every character.

Example

```
Input

"banana"
```

Output

```
b → 1

a → 3

n → 2
```

Notice

We are NOT searching.

We are NOT sorting.

We are simply counting.

---

# Step 2 — Manual Thinking

Don't think about HashMap.

Become the computer.

Input

```
banana
```

Read

```
b
```

How many times seen?

```
1
```

---

Read

```
a
```

Count

```
1
```

---

Read

```
n
```

Count

```
1
```

---

Read

```
a
```

Already counted?

Yes.

Increase

```
2
```

---

Read

```
n
```

Increase

```
2
```

---

Read

```
a
```

Increase

```
3
```

Done.

---

# Step 3 — Brute Force Algorithm (Language Independent)

Suppose we don't know Hashing.

How would we solve it?

For every unique character,

scan the entire string again.

---

## Algorithm

```
FOR every character

    IF already counted

        Skip

    Count its occurrences
        by scanning the complete string

    Print count
```

---

# Why does it work?

Because

every character's occurrences

are counted

by checking every position.

---

# Why is it slow?

Suppose

```
banana
```

We count

```
a
```

by scanning

the entire string.

Later

we count

```
n
```

again

by scanning

the entire string.

Repeated scanning.

---

# Brute Force Swift

```swift
func characterFrequencyBruteForce(_ str: String) {

    let chars = Array(str)
    var processed = Set<Character>()

    for ch in chars {

        if processed.contains(ch) {
            continue
        }

        var count = 0

        for current in chars {

            if current == ch {
                count += 1
            }
        }

        print("\(ch) -> \(count)")
        processed.insert(ch)
    }
}
```

---

# Complexity

Time

```
O(n²)
```

Space

```
O(k)
```

where

k

is the number of unique characters.

---

# Step 4 — Observation

Ask

our favourite question.

Why is this slow?

Because

we keep counting

the same characters

again

and again.

Repeated counting.

---

# Step 5 — Pattern Recognition

Need

Visited?

No.

Need

Complement?

No.

Need

Index?

No.

Need

Count?

YES.

Immediately

```
Frequency Pattern
```

---

# Step 6 — Choose Data Structure

Question

What information

should we remember?

```
Character

↓

Count
```

Need

Key

↓

Character

Need

Value

↓

Count

Therefore

```
Map
```

---

# Step 7 — Optimal Algorithm (Language Independent)

## Algorithm

```
Create an empty Map

FOR every character

    IF character already exists

         Increase its count

    ELSE

         Insert character
         with count = 1

Return the Map
```

---

# Why does it work?

Each character is processed exactly once.

Instead of searching again,

we simply update the count.

---

# Why is it better?

Instead of repeatedly counting,

we maintain

a running count.

---

# Step 8 — Dry Run

Input

```
banana
```

Initially

```
{}
```

---

Read

```
b
```

```
b → 1
```

---

Read

```
a
```

```
b → 1

a → 1
```

---

Read

```
n
```

```
b → 1

a → 1

n → 1
```

---

Read

```
a
```

Already exists

Increase

```
a → 2
```

---

Read

```
n
```

Increase

```
n → 2
```

---

Read

```
a
```

Increase

```
a → 3
```

Done.

---

# Step 9 — Optimal Swift

```swift
func characterFrequency(_ str: String) -> [Character: Int] {

    var frequency: [Character: Int] = [:]

    for ch in str {

        frequency[ch, default: 0] += 1

    }

    return frequency
}
```

---

# Step 10 — Algorithm Analysis

## Brute Force

### Time

```
O(n²)
```

### Space

```
O(k)
```

---

## Optimal

### Time

```
O(n)
```

Every character

visited once.

### Space

```
O(k)
```

Store

only unique characters.

---

# 🚩 Interview Discussion

### Question 1

Why Map instead of Set?

Answer

Because

Set remembers

whether a character exists.

Map remembers

how many times

it exists.

---

### Question 2

Why

```
default: 0
```

Excellent Swift discussion.

Instead of writing

```
if let
```

we directly initialize

missing keys

with

0.

This keeps the code concise.

---

### Question 3

Can this be solved

without Hashing?

Yes.

Nested loops.

But

time complexity

becomes

```
O(n²)
```

---

# 🌍 Real World Analogy

Imagine a supermarket.

Customers buy

```
Apple

Banana

Apple

Apple

Milk

Banana
```

Cashier doesn't recount purchases every time.

They maintain a running tally:

```
Apple → 3

Banana → 2

Milk → 1
```

This is exactly what a Frequency Map does.

---

# 🎓 Pattern Learned

```
Frequency Counting

↓

Count while traversing

↓

Update continuously
```

---

# 🛠 Algorithm Learned

* Running counts
* Key → Count mapping
* Single traversal
* Updating existing values

---

# 📌 Problem Card

```
Problem:
Character Frequency

Pattern:
Frequency Counting

Recognition Trigger:
How many times?

Core Observation:
Repeated counting is expensive.

Thinking Shift:
Repeated Counting
↓

Continuous Counting

Key:
Character

Value:
Count

Brute Force:
Repeated Scan

Optimal:
Frequency Map

Time:
O(n)

Space:
O(k)
```

---

# 🎯 Practice Ladder

| Level | Problem                          | New Learning           |
| ----- | -------------------------------- | ---------------------- |
| 🟢    | Character Frequency              | Build Frequency Map    |
| 🟢    | LC 242 – Valid Anagram           | Compare Frequency Maps |
| 🟢    | LC 383 – Ransom Note             | Consume Frequencies    |
| 🟡    | LC 169 – Majority Element        | Maximum Frequency      |
| 🟡    | LC 347 – Top K Frequent Elements | Frequency + Heap       |

---

# 🏠 Homework

Before watching the next lecture:

1. Write the **Brute Force Algorithm** on paper.
2. Implement the Brute Force solution in Swift.
3. Implement the Optimal Frequency Map solution in Swift.
4. Dry-run both algorithms on:

   * `"banana"`
   * `"programming"`
   * `"mississippi"`

---

## 🎯 One Improvement (Very Important)

After building both the **Visited** and **Frequency** patterns, I noticed a reusable teaching structure that we'll adopt permanently.

Every pattern will now begin with a **Foundation Problem** before any LeetCode question.

For example:

* **Visited Pattern** → Contains Duplicate (simple foundation)
* **Frequency Pattern** → Character Frequency (foundation)
* **Complement Pattern** → Manual Target Pair (foundation)
* **Index Mapping Pattern** → First Occurrence Map (foundation)

Only after students master the foundation will we move to LeetCode interview problems.

This ensures students understand **the underlying idea first**, making interview questions feel like natural applications rather than isolated tricks. I believe this will make your course significantly stronger than playlists that jump directly into LeetCode solutions.

