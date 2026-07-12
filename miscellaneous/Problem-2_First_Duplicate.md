Excellent. Now we move to **Problem 2**.

Notice something.

I'm **not** selecting problems randomly.

Every problem should teach **one new idea**.

| Problem                     | New Learning                   |
| --------------------------- | ------------------------------ |
| Contains Duplicate          | Visited Pattern                |
| Check All Elements Unique   | Same pattern reinforcement     |
| **First Duplicate**         | Early Return + Order Matters ⭐ |
| Duplicate Within K Distance | Visited + Sliding Window       |

This is curriculum design, not a problem list.

---

# 📘 Hashing Course

# Pattern 1 – Visited Elements

# Problem 2 – First Duplicate

---

# 🎯 Learning Objective

After completing this problem students should understand

* Same Visited Pattern
* Why order matters
* How to stop at the first duplicate
* Why brute force is naturally converted into Hashing

---

# Step 1 — Understand the Question

## Problem Statement

Given an array,

return

the **first duplicate element** encountered while scanning from left to right.

Example

```text
Input

[4, 7, 2, 9, 7, 4]
```

Output

```text
7
```

Why?

Because

while traversing

the first duplicate we encounter is

7.

Notice

4 is also duplicated.

But

its second occurrence comes later.

This small difference changes the algorithm.

---

# Step 2 — Manual Thinking

Don't code.

Become the computer.

Suppose

```text
4 7 2 9 7 4
```

How would you solve this manually?

Read

4

Never seen.

Move ahead.

Read

7

Never seen.

Move ahead.

Read

2

Never seen.

Move ahead.

Read

9

Never seen.

Move ahead.

Read

7

Wait...

I've already seen 7.

Stop.

Answer

7.

Notice

You didn't care that

4 also appears twice.

Because

question asked

**first duplicate encountered during traversal.**

---

# Step 3 — Brute Force

Idea

For every element

search remaining array.

As soon as duplicate found

return.

Algorithm

```text
For every element

    Search remaining elements

    If duplicate found

        return element
```

Time

```text
O(n²)
```

---

# Step 4 — Observation

Let's ask

our favourite question.

Why is this slow?

Because

for every element

we again search

remaining array.

Repeated Searching.

Exactly the same pain.

---

# Step 5 — Pattern Recognition

Need Frequency?

No.

Need Complement?

No.

Need Index?

No.

Need to remember

already processed elements?

YES.

Pattern

```text
Visited
```

---

# Step 6 — Data Structure

Need only

YES / NO.

Already seen?

Yes.

Not seen?

No.

Need extra information?

No.

Therefore

```text
Set
```

Again

the pattern chooses

the data structure.

---

# Step 7 — Dry Run

Input

```text
4 7 2 9 7 4
```

Initially

Visited

```text
{}
```

---

Read

4

Already present?

No.

Insert.

```text
{4}
```

---

Read

7

Present?

No.

Insert.

```text
{4,7}
```

---

Read

2

Insert.

```text
{4,7,2}
```

---

Read

9

Insert.

```text
{4,7,2,9}
```

---

Read

7

Already inside?

YES.

Immediately

return

7.

Done.

---

# 🎯 Biggest Learning

Notice

the algorithm

never discovers

the duplicate.

It discovers

the

**second occurrence.**

That is a subtle but important distinction.

The Set already contains

the first occurrence.

The second occurrence triggers the answer.

---

# Step 8 — Swift Code

```swift
func firstDuplicate(_ nums: [Int]) -> Int? {

    var visited = Set<Int>()

    for num in nums {

        if visited.contains(num) {
            return num
        }

        visited.insert(num)
    }

    return nil
}
```

---

# Step 9 — Complexity

Time

```text
O(n)
```

Space

```text
O(n)
```

---

# Interview Discussion

### Follow-up 1

What if

there are

multiple duplicates?

Answer

Current algorithm returns

the first duplicate

encountered

during traversal.

---

### Follow-up 2

What if interviewer asks

return

all duplicates?

Current solution

needs modification.

We'll discuss later.

---

### Follow-up 3

Can we solve without Hashing?

Yes.

Nested loops.

O(n²)

Or

Sorting.

O(n log n)

---

# 🌍 Real World Analogy

Imagine attendance in a classroom.

Teacher calls names.

```text
Rahul

Aman

Neha

Riya

Rahul
```

The moment

Rahul's name is called again,

teacher immediately says

"You already answered."

Teacher doesn't continue checking the entire attendance list.

That's exactly what this algorithm does.

---

# 🎓 Pattern Learned

✅ Same

Visited Pattern.

The important realization is

we stop

at the

first repeated visit.

---

# 🛠 Algorithm Learned

Students learn

* Early Exit
* Single Traversal
* Remembering instead of searching
* Order-sensitive problems

---

# 📌 Problem Card

```text
Problem:
First Duplicate

Pattern:
Visited Elements

Recognition Trigger:
Have I seen this before?

Core Observation:
Repeated searching

Thinking Shift:
Searching → Remembering

Data Structure:
Set

Time:
O(n)

Space:
O(n)

New Learning:
Order matters.
Return immediately when second occurrence is found.
```

---

# 🚀 Before Problem 3

I want to make one **small but important curriculum adjustment**.

Originally we planned:

1. Contains Duplicate
2. Check All Elements Are Unique
3. First Duplicate
4. Duplicate Within K Distance

After teaching **Contains Duplicate**, I realized **"Check All Elements Are Unique"** is actually the logical complement of that problem and doesn't introduce any new thinking—it is essentially the same algorithm with the return condition inverted.

To keep the course engaging and ensure every video teaches something new, I recommend this sequence instead:

1. ✅ Contains Duplicate *(Visited Pattern)*
2. ✅ First Duplicate *(Visited + Order Matters)*
3. ⭐ Duplicate Within K Distance *(Visited + Sliding Window + Windowed Memory)*
4. ⭐ Find All Duplicates *(Visited + Output Collection)*

This way, every new problem introduces a genuinely new algorithmic idea while reinforcing the same underlying pattern. Students keep progressing instead of feeling they're solving the same problem with different wording. I believe this will make your series much more engaging and pedagogically stronger.

