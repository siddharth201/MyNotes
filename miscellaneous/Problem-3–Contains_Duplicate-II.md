Excellent. From now onward, every problem will follow our **Production Template**.

```
Problem Metadata
        ↓
Understand the Question
        ↓
Manual Thinking
        ↓
Brute Force
        ↓
Observation
        ↓
Pattern Recognition
        ↓
Choose Data Structure
        ↓
Dry Run
        ↓
Swift Code
        ↓
Complexity
        ↓
Interview Discussion
        ↓
Problem Card
        ↓
Practice Ladder
        ↓
Homework
```

---

# 📘 Hashing Course

# Pattern 1 – Visited Elements

# Problem 3 – Contains Duplicate II

> **Reference:** LeetCode 219 – Contains Duplicate II

Difficulty:
🟢 Easy

Pattern:
Visited Elements ⭐⭐⭐

New Learning:
**Visited + Distance Constraint**

---

# 🎯 Learning Objective

After completing this problem students should understand

* Same Visited Pattern
* Why Set alone is not always enough
* When we need a **Map instead of Set**
* How to remember **where** something was seen

This is the first problem where students realize:

> **Patterns stay the same, but the required information changes.**

---

# Step 1 — Understand the Question

## Problem Statement

Given an integer array `nums`

and an integer `k`

return

```text
true
```

if there exist two equal numbers such that

```
|i - j| ≤ k
```

Otherwise

return

```text
false
```

---

### Example

```
nums = [1,2,3,1]

k = 3
```

Output

```
true
```

Why?

```
1 appears at

Index 0

and

Index 3
```

Distance

```
3
```

which is

≤ 3

---

Another Example

```
nums = [1,2,3,1,2,3]

k = 2
```

Output

```
false
```

Although duplicates exist,

they are too far apart.

---

# 🎯 New Twist

In Problem 1

Question was

```
Duplicate?
```

Now question is

```
Duplicate

+

Distance
```

This changes everything.

---

# Step 2 — Manual Thinking

Don't think about Hashing.

Become the computer.

```
1 2 3 1
```

Read

1

Remember

where

you saw it.

---

Read

2

Remember

where

you saw it.

---

Read

3

Remember

where

you saw it.

---

Read

1

Question

Did I see

1

before?

Yes.

Where?

Index

0

Current Index

3

Distance

```
3 - 0 = 3
```

Condition satisfied.

Answer

True.

---

# 🎯 Biggest Observation

Notice something.

Earlier

we only needed

```
Seen?

YES / NO
```

Now

we also need

```
Where?
```

Huge difference.

---

# Step 3 — Brute Force

Idea

For every element

search remaining elements.

Whenever duplicate found

calculate distance.

If distance ≤ k

return true.

---

Algorithm

```
For every i

    For every j > i

        if nums[i] == nums[j]

             if abs(i-j) <= k

                    return true
```

---

Time Complexity

```
O(n²)
```

---

# Step 4 — Observation

Again ask

our favourite question.

Why is this slow?

Repeated searching.

Same problem.

But

there is something new.

We must also remember

the previous index.

---

# Step 5 — Pattern Recognition

Ask

Need Frequency?

No.

Need Complement?

No.

Need Position?

YES.

Need Previous Occurrence?

YES.

Pattern

```
Visited
```

But

Visited alone

isn't enough.

---

# Step 6 — Choose Data Structure

Question

What information

should we remember?

Earlier

```
18

↓

Seen?
```

Now

```
18

↓

Previous Index
```

Therefore

Set

cannot help.

Need

```
Number

↓

Index
```

Therefore

choose

```
Map
```

---

# 🎯 Engineer Thinking

This is the first time students see

why

Map exists.

Because

the problem asks

for

extra information.

Not just

YES / NO.

---

# Step 7 — Dry Run

Input

```
nums = [1,2,3,1]

k = 3
```

Initially

Map

```
{}
```

---

Index

0

Value

1

Map

```
1 → 0
```

---

Index

1

Value

2

```
1 → 0

2 → 1
```

---

Index

2

Value

3

```
1 → 0

2 → 1

3 → 2
```

---

Index

3

Value

1

Already present?

Yes.

Previous Index

0

Distance

```
3 - 0 = 3
```

Condition satisfied.

Return

True.

---

# 🎯 Biggest Learning

Notice

we didn't search

for

1.

We directly asked

the Map

```
Have you seen

1?

If yes,

where?
```

This is much more powerful

than Set.

---

# Step 8 — Swift Code

```swift
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {

    var lastSeen: [Int: Int] = [:]

    for (index, value) in nums.enumerated() {

        if let previousIndex = lastSeen[value] {

            if index - previousIndex <= k {
                return true
            }
        }

        lastSeen[value] = index
    }

    return false
}
```

---

# Step 9 — Complexity

Time

```
O(n)
```

Space

```
O(n)
```

---

# 🚩 Interview Discussion

### Follow-up 1

Why Map instead of Set?

Answer

Because

we need

the previous index.

Set only tells us

whether

the value exists.

---

### Follow-up 2

Why update

```
lastSeen[value]
```

every time?

Suppose

```
1 2 1 1
```

We always need

the latest occurrence

to compute the smallest distance correctly.

---

### Follow-up 3

Can Sliding Window solve this?

Yes.

If interpreted differently,

a window of size `k`

plus a Set

also works.

This becomes an excellent bridge to the Sliding Window pattern.

---

# 🌍 Real World Analogy

Imagine a parking lot.

Every car entering has

a number plate

and

an entry time.

If the same car enters again,

security doesn't just ask

"Have I seen this car?"

They ask

"When did I last see it?"

Now

time difference matters.

Exactly the same thing

happens here.

---

# 🎓 Pattern Learned

```
Visited Pattern

+

Remember Position
```

Students learn

sometimes

Visited requires

extra information.

---

# 🛠 Algorithm Learned

* Map instead of Set
* Previous occurrence tracking
* Distance calculation
* Single traversal

---

# 📌 Problem Card

```
Problem:
Contains Duplicate II

LeetCode:
219

Difficulty:
Easy

Pattern:
Visited Elements

Recognition Trigger:
Have I seen this before?

Extra Requirement:
Need previous position.

Data Structure:
Map

Key:
Number

Value:
Latest Index

Brute Force:
Nested Loops

Optimal:
Visited Map

Time:
O(n)

Space:
O(n)
```

---

# 🎯 Practice Ladder

| Level | Problem                                     | Concept                     |
| ----- | ------------------------------------------- | --------------------------- |
| 🟢    | LC 217 – Contains Duplicate                 | Basic Visited Pattern       |
| 🟢    | LC 219 – Contains Duplicate II              | Visited + Index Tracking    |
| 🟡    | LC 220 – Contains Duplicate III             | Visited + Ordered Structure |
| 🟡    | LC 349 – Intersection of Two Arrays         | Set Operations              |
| 🟡    | LC 2215 – Find the Difference of Two Arrays | Set Difference              |

---

# 🏠 Homework

Before watching the next solution:

1. Solve **LeetCode 219 – Contains Duplicate II** yourself.
2. Try solving it once using a `Map` (Number → Latest Index).
3. As a challenge, think about how you could solve it using a **Sliding Window + Set** approach. We'll revisit that idea later when we study the Sliding Window pattern.

---

## 🚀 Next Problem (Very Important)

I **do not** recommend moving to **LeetCode 220 – Contains Duplicate III** next.

Although it belongs to the same family, it introduces ordered data structures and is considered much harder.

Instead, I recommend introducing a generic but highly educational problem:

> **Find All Duplicates in an Array**

This problem teaches students how to move from **"return immediately"** to **"continue processing and collect all answers."**

It adds exactly one new idea while staying within the same **Visited Pattern**, making the learning progression much smoother before tackling more advanced interview problems.

