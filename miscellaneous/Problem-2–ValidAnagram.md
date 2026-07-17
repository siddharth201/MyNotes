Excellent. We now move to the **first real interview problem** of the Frequency Pattern.

Just like we built the Visited Pattern:

* Foundation → Contains Duplicate
* Interview → Contains Duplicate II

We'll do the same here. 

* Foundation → Character Frequency ✅
* Interview → **LeetCode 242 – Valid Anagram**

This is one of the most asked Hashing interview questions.

---

# 📘 Hashing Course

# Pattern 2 – Frequency Counting

# Problem 2 – Valid Anagram

> **Reference:** LeetCode 242 – Valid Anagram

Difficulty:
🟢 Easy

Pattern:
Frequency Counting ⭐⭐⭐⭐⭐

New Learning:
**Compare Frequency Maps**

---

# 🎯 Learning Objective

After completing this problem students should understand:

* How to compare two strings
* Why sorting is not always the best choice
* How to use Frequency Maps to compare data
* Difference between Building a Frequency Map and Comparing Frequency Maps

---

# Step 1 — Understand the Problem

## Problem Statement

Given two strings

```text
s
```

and

```text
t
```

return

```text
true
```

if

`t`

is an anagram of

`s`.

Otherwise

return

```text
false
```

---

## What is an Anagram?

Two strings are anagrams if

* They contain exactly the same characters.
* Every character appears the same number of times.
* Order doesn't matter.

---

### Example 1

```text
s = "listen"

t = "silent"
```

Output

```text
true
```

---

### Example 2

```text
s = "apple"

t = "apply"
```

Output

```text
false
```

---

### First Observation

Notice carefully.

The question never asks

> Are the strings identical?

Instead it asks

> **Do both strings have exactly the same character counts?**

That sentence should immediately trigger

**Frequency Pattern.**

---

# Step 2 — Manual Thinking

Forget Hashing.

Forget coding.

Become the computer.

---

Input

```text
listen

silent
```

Let's count.

---

For

```text
listen
```

```text
l → 1

i → 1

s → 1

t → 1

e → 1

n → 1
```

---

For

```text
silent
```

```text
s → 1

i → 1

l → 1

e → 1

n → 1

t → 1
```

---

Question

Are the counts identical?

YES.

Return

```text
true
```

---

# Step 3 — Brute Force Thinking

Suppose

we don't know Hashing.

How would we solve this?

---

## Method 1

For every character in

```text
s
```

count its occurrences.

Then

count the same character

inside

```text
t
```

If any count differs

return false.

---

## Brute Force Algorithm

```text
FUNCTION IsAnagramBruteForce(string1, string2)

    IF length of string1 is NOT EQUAL to length of string2 THEN
        RETURN False
    END IF

    CREATE an empty Set called 'processedCharacters'

    FOR EACH character IN string1

        IF character is already in 'processedCharacters' THEN
            CONTINUE to the next character
        END IF

        SET countInString1 = 0
        SET countInString2 = 0

        FOR EACH currentCharacter IN string1
            IF currentCharacter is equal to character THEN
                INCREMENT countInString1 by 1
            END IF
        END FOR

        FOR EACH currentCharacter IN string2
            IF currentCharacter is equal to character THEN
                INCREMENT countInString2 by 1
            END IF
        END FOR

        IF countInString1 is NOT EQUAL to countInString2 THEN
            RETURN False
        END IF

        ADD character to 'processedCharacters'

    END FOR

    RETURN True

END FUNCTION
```

---

# Why does it work?

Because

every character

is verified.

---

# Why is it slow?

Suppose

```text
listen
```

We count

```text
l
```

by scanning

both strings.

Then

count

```text
i
```

again.

Repeated counting.

Exactly the same pain

as Character Frequency.

---

# Brute Force Swift

```swift
func isAnagramBruteForce(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }

    let sChars = Array(s)
    let tChars = Array(t)

    var processed = Set<Character>()

    for ch in sChars {

        if processed.contains(ch) {
            continue
        }

        var countS = 0
        var countT = 0

        for c in sChars {
            if c == ch {
                countS += 1
            }
        }

        for c in tChars {
            if c == ch {
                countT += 1
            }
        }

        if countS != countT {
            return false
        }

        processed.insert(ch)
    }

    return true
}
```

---

# Complexity

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

Ask

our favourite question.

Why is this slow?

Because

we repeatedly count

the same characters.

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

Character Count?

YES.

Immediately

```text
Frequency Pattern
```

---

# Step 6 — Choose Data Structure

Need

```text
Character

↓

Count
```

Therefore

```text
Map
```

---

# Step 7 — Optimal Algorithm (Method 1)

The most intuitive approach.

---

## Algorithm

```text
FUNCTION IsAnagram(string1, string2)

    IF length of string1 is NOT EQUAL to length of string2 THEN
        RETURN False
    END IF

    CREATE an empty Dictionary called 'frequencyMap1'
    CREATE an empty Dictionary called 'frequencyMap2'

    FOR EACH character IN string1

        IF character already exists in 'frequencyMap1' THEN
            INCREMENT its count by 1
        ELSE
            ADD character with count = 1
        END IF

    END FOR

    FOR EACH character IN string2

        IF character already exists in 'frequencyMap2' THEN
            INCREMENT its count by 1
        ELSE
            ADD character with count = 1
        END IF

    END FOR

    IF frequencyMap1 is EQUAL to frequencyMap2 THEN
        RETURN True
    ELSE
        RETURN False
    END IF

END FUNCTION
```

---

# Why does it work?

If every character

has the same frequency

both maps become identical.

---

# Step 8 — Dry Run

Input

```text
listen

silent
```

Map 1

```text
l →1

i →1

s →1

t →1

e →1

n →1
```

Map 2

```text
s →1

i →1

l →1

e →1

n →1

t →1
```

Compare.

Equal.

Return

True.

---

# Step 9 — Optimal Swift (Method 1)

```swift
func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }

    var freqS: [Character: Int] = [:]
    var freqT: [Character: Int] = [:]

    for ch in s {
        freqS[ch, default: 0] += 1
    }

    for ch in t {
        freqT[ch, default: 0] += 1
    }

    return freqS == freqT
}
```

---

# ⭐ Can We Optimize Even More?

Yes.

This is where we introduce

an engineer's optimization.

Instead of creating

**two maps**

create

only **one map**.

---

## Optimal Algorithm (Method 2)

```text
IF lengths are different

    return false

Build Frequency Map from first string

Traverse second string

Decrease count

If any count becomes negative

    return false

At the end

All counts should become zero

Return true
```

Notice

one traversal builds

another traversal consumes.

Beautiful.

---

# Optimal Swift (Method 2)

```swift
func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count != t.count {
        return false
    }

    var frequency: [Character: Int] = [:]

    for ch in s {
        frequency[ch, default: 0] += 1
    }

    for ch in t {

        guard let count = frequency[ch], count > 0 else {
            return false
        }

        frequency[ch] = count - 1
    }

    return true
}
```

---

# Step 10 — Algorithm Analysis

| Approach    | Time  | Space |
| ----------- | ----- | ----: |
| Brute Force | O(n²) |  O(k) |
| Two Maps    | O(n)  |  O(k) |
| One Map     | O(n)  |  O(k) |

Notice

Time stays the same.

Memory improves slightly because

we store only one map.

---

# 🚩 Interview Discussion

### Follow-up 1

Why check

length first?

Because

different lengths

can never be anagrams.

Instant rejection.

---

### Follow-up 2

Why is

One Map

better than

Two Maps?

Less memory.

Less code.

Same time complexity.

---

### Follow-up 3

Can we solve using sorting?

Yes.

Sort both strings.

Compare.

Time

```text
O(n log n)
```

Hashing

is better.

---

# 🌍 Real World Analogy

Imagine

two warehouses.

Instead of checking

every item repeatedly,

prepare an inventory list.

Warehouse A

```text
Apple → 10

Banana → 5
```

Warehouse B

```text
Apple → 10

Banana → 5
```

Same inventory.

Warehouses match.

That's exactly how Frequency Maps compare strings.

---

# 🎓 Pattern Learned

```text
Frequency Counting

↓

Build Frequency

↓

Compare Frequencies
```

---

# 🛠 Algorithm Learned

* Build one or two Frequency Maps
* Compare counts
* Optimize memory using one map
* Reject invalid input early using length

---

# 📌 Problem Card

```text
Problem:
Valid Anagram

LeetCode:
242

Pattern:
Frequency Counting

Recognition Trigger:
Same characters with same counts?

Key:
Character

Value:
Count

Brute Force:
Repeated Counting

Optimal:
Frequency Map

Further Optimization:
Single Frequency Map

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

1. Solve **LeetCode 242 – Valid Anagram** yourself.
2. Implement all **three approaches**:

   * Brute Force
   * Two Frequency Maps
   * One Frequency Map (optimized)
3. Compare:

   * Algorithm
   * Swift implementation
   * Time complexity
   * Space complexity

---

## ⭐ One refinement to our curriculum

From this problem onward, we'll consistently present **multiple optimal solutions** when they teach different engineering ideas.

For example:

* **Optimal Solution 1**: Easy to understand (good for beginners).
* **Optimal Solution 2**: More memory-efficient or cleaner (good for interviews).

This way, students learn not just **an** optimal solution, but also **how engineers refine an already good solution**. That progression is an important part of becoming a strong problem solver.

