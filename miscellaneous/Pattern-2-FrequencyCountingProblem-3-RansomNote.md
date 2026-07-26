Excellent. This is exactly the point where I wanted to resume. I'm actually glad I stopped earlier because your attempts changed how I want to teach this chapter.

You have now:
- Designed a brute-force solution yourself.
- Identified its limitations.
- Designed the two-map solution.
- Improved it to the one-map solution.

Now, when I explain the chapter, the **optimal solution will feel like a natural evolution**, not a trick.

---

# 📘 Hashing Course

# Pattern 2 – Frequency Counting

# Problem 3 – Ransom Note

> **Reference:** 

Difficulty:
🟢 Easy

Pattern:
⭐⭐⭐⭐⭐ Frequency Counting

New Learning:

> **Consume Frequencies**

---

# 🎯 Learning Objective

After this problem, you should understand:

- How to **build** a frequency map.
- How to **consume** a frequency map.
- Why comparing maps is not always necessary.
- When a single map is enough.

---

# Step 1 – Problem Metadata

| Attribute | Value |
|-----------|-------|
| Platform | LeetCode |
| Problem No. | 383 |
| Difficulty | Easy |
| Pattern | Frequency Counting |
| Data Structure | HashMap / Dictionary |
| Time Complexity | O(n + m) |
| Space Complexity | O(k) |

---

# Step 2 – Understand the Problem

## Problem Statement

You are given two strings:

```text
ransomNote
magazine
```

Return `true` if you can construct the ransom note using the letters in the magazine.

Each character in the magazine can be used **only once**.

---

### Example 1

```text
ransomNote = "aa"
magazine    = "ab"
```

Output

```text
false
```

---

### Example 2

```text
ransomNote = "aa"
magazine    = "aab"
```

Output

```text
true
```

---

# Step 3 – Manual Thinking

Forget coding.

Imagine magazine letters are physical tiles.

Magazine

```text
a
a
b
```

Need

```text
a
a
```

Take first 'a'

Remaining

```text
a
b
```

Take second 'a'

Remaining

```text
b
```

Done.

---

Now

Magazine

```text
a
b
```

Need

```text
a
a
```

Take first 'a'

Remaining

```text
b
```

Need another 'a'

None available.

Impossible.

---

# Step 4 – Naive Brute Force

This is the first solution that naturally comes to mind.

## Idea

For every character in the ransom note:

- Search the magazine.
- Find an unused matching character.
- Mark it as used.
- If no matching unused character exists, return `false`.

---

## Structured Pseudocode

```text
FUNCTION CanConstructBruteForce(ransomNote, magazine)

    CREATE an array 'used' of size magazine.length
    INITIALIZE every value as False

    FOR EACH character IN ransomNote

        SET found = False

        FOR index FROM 0 TO magazine.length - 1

            IF magazine[index] == character
               AND used[index] == False THEN

                used[index] = True
                found = True
                BREAK

            END IF

        END FOR

        IF found == False THEN
            RETURN False
        END IF

    END FOR

    RETURN True

END FUNCTION
```

---

## Why does this work?

Each magazine character is used at most once.

We explicitly mark characters that have already been consumed.

---

## Complexity

Time

```text
O(n × m)
```

Space

```text
O(m)
```

---

# Step 5 – Improved Brute Force

Observation:

Instead of searching the entire magazine every time, what if we counted characters first?

That removes repeated searching.

---

# Step 6 – Pattern Recognition

Ask yourself:

What information keeps getting searched?

Answer:

```text
Character

↓

Available Count
```

Need

```text
Character

↓

Frequency
```

Recognition Trigger

> **"How many copies of each character are available?"**

Immediately

```text
Frequency Counting
```

---

# Step 7 – Choose Data Structure

We need

```text
Character

↓

Remaining Count
```

Best choice

```text
Dictionary / HashMap
```

---

# Step 8 – Optimal Algorithm (Single Frequency Map)

This is the solution you eventually derived.

## Structured Pseudocode

```text
FUNCTION CanConstruct(ransomNote, magazine)

    IF length of ransomNote > length of magazine THEN
        RETURN False
    END IF

    CREATE an empty Dictionary called frequency

    FOR EACH character IN magazine

        IF character exists in frequency THEN
            INCREMENT frequency[character]
        ELSE
            SET frequency[character] = 1
        END IF

    END FOR

    FOR EACH character IN ransomNote

        IF character does NOT exist in frequency THEN
            RETURN False
        END IF

        DECREMENT frequency[character]

        IF frequency[character] < 0 THEN
            RETURN False
        END IF

    END FOR

    RETURN True

END FUNCTION
```

---

# Why does this work?

Think of the frequency map as an inventory.

Initially

```text
Magazine

aab
```

Inventory

```text
a → 2
b → 1
```

Need

```text
aa
```

Take one

```text
a → 1
```

Take another

```text
a → 0
```

Everything required was available.

Return `true`.

---

# Step 9 – Dry Run

Input

```text
ransomNote = "aa"

magazine = "aab"
```

Initially

```text
{
    a : 2
    b : 1
}
```

Need first `'a'`

```text
a : 1
b : 1
```

Need second `'a'`

```text
a : 0
b : 1
```

Finished.

Return

```text
true
```

---

## Another Example

```text
ransomNote = "aaa"

magazine = "aab"
```

Initial

```text
a : 2
b : 1
```

Need first

```text
a : 1
```

Need second

```text
a : 0
```

Need third

```text
a : -1
```

Negative.

Immediately

```text
RETURN False
```

---

# Step 10 – Swift Implementation

```swift
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    guard ransomNote.count <= magazine.count else {
        return false
    }

    var frequency: [Character: Int] = [:]

    for char in magazine {
        frequency[char, default: 0] += 1
    }

    for char in ransomNote {

        guard let count = frequency[char] else {
            return false
        }

        frequency[char] = count - 1

        if frequency[char]! < 0 {
            return false
        }
    }

    return true
}
```

---

# Step 11 – Python Implementation

```python
def can_construct(ransom_note: str, magazine: str) -> bool:

    if len(ransom_note) > len(magazine):
        return False

    frequency = {}

    for ch in magazine:
        frequency[ch] = frequency.get(ch, 0) + 1

    for ch in ransom_note:

        if ch not in frequency:
            return False

        frequency[ch] -= 1

        if frequency[ch] < 0:
            return False

    return True
```

---

# Step 12 – Complexity Analysis

| Approach | Time | Space |
|----------|------|--------|
| Naive Brute Force | O(n × m) | O(m) |
| One Frequency Map | O(n + m) | O(k) |

where:

- `n` = length of `ransomNote`
- `m` = length of `magazine`
- `k` = number of unique characters

---

# 🚩 Interview Discussion

### Q1. Why build the frequency map from the magazine instead of the ransom note?

Because the magazine is the **resource**.

The ransom note is the **requirement**.

We first record what is available, then consume what is needed.

---

### Q2. Why return `false` when a count becomes negative?

A negative count means we've used more copies of a character than the magazine provides.

---

### Q3. Why is one map better than two?

Two maps store:

```text
Need
```

and

```text
Available
```

One map stores only:

```text
Available
```

and updates it while processing the requirement.

Less memory, cleaner code.

---

# 🌍 Real-World Analogy

Imagine a grocery store.

Inventory:

```text
Milk → 10
Bread → 5
Eggs → 12
```

A customer buys:

```text
Milk
Milk
Bread
```

Every purchase reduces the stock.

If someone tries to buy another loaf of bread when the stock reaches zero, the transaction fails.

This is exactly how the frequency map behaves.

---

# 📌 Problem Card

```text
Problem:
Ransom Note

LeetCode:
383

Pattern:
Frequency Counting

Recognition Trigger:
Can I build one thing using another?

Core Idea:
Store available resources.
Consume required resources.

Frequency Operation:
Build + Consume

Data Structure:
Dictionary

Time:
O(n + m)

Space:
O(k)
```

---

# 🎯 Updated Frequency Pattern Journey

I think the progression is now beautifully connected:

| Problem | Frequency Map Operation | Mental Model |
|---------|--------------------------|--------------|
| Character Frequency | **Build** | Count everything |
| Valid Anagram | **Build + Compare** | Are the distributions identical? |
| Ransom Note | **Build + Consume** | Use available resources |

Notice that you're no longer just learning "Frequency Counting." You're learning **different operations on a frequency map**. This becomes an even stronger mental model because future problems will naturally extend it—for example, **Majority Element** is "Build + Find Maximum," and **Top K Frequent Elements** is "Build + Rank." This gives you a reusable framework instead of isolated solutions.
