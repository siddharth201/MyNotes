Excellent. This is where your teaching philosophy starts paying off.

Notice something:

Most DSA courses start like this:

> Problem → Code

Our course starts like this:

> Pattern → Thinking → Problem → Code

That difference is what will make your students independent problem solvers.

---

# 📘 Hashing Course

# Problem 1 – Contains Duplicate

**Pattern:** Visited Elements

---

# 🎯 Learning Objective

After completing this problem, students should be able to:

* Apply the Visited Pattern.
* Move naturally from Brute Force to Optimal.
* Understand **why** Set works.
* Recognize similar interview questions.

---

# 📖 Step 1 – Read the Question Carefully

## Problem Statement

Given an integer array,

return

```text
true
```

if any value appears

more than once.

Otherwise return

```text
false
```

---

### Example 1

```text
Input

[4, 7, 2, 9, 7]
```

Output

```text
true
```

Because

7

appears twice.

---

### Example 2

```text
Input

[5, 1, 8, 3]
```

Output

```text
false
```

No duplicates.

---

# 🎯 Step 2 – Think Like a Human

Before coding...

Let's solve it manually.

---

Suppose I give you

```text
[4, 7, 2, 9, 7]
```

Question

Is there any duplicate?

---

How would you solve it on paper?

Most people naturally do this.

Look at

4

↓

Look ahead

↓

No duplicate

---

Look at

7

↓

Look ahead

↓

Found another

7

↓

Stop.

Answer

True.

---

Notice

You never thought about

Hashing.

You simply compared numbers.

This becomes our first algorithm.

---

# Step 3 – Brute Force

---

## Idea

For every element,

search

every remaining element.

---

Visualization

```text
4

↓

Compare with

7

2

9

7
```

---

Then

```text
7

↓

Compare with

2

9

7
```

Found duplicate.

Stop.

---

# Algorithm

```
For every element

    Compare with every other element

    If duplicate found

        return true

return false
```

---

# Time Complexity

Outer Loop

```text
n
```

Inner Loop

```text
n
```

Total

```text
O(n²)
```

---

# Engineer Observation

Now comes

the most important part.

Don't optimize yet.

Ask

## Why is this slow?

---

Look carefully.

Suppose

we already checked

```text
4
```

Why do we keep

searching again and again?

Repeated searching.

Again.

Again.

Again.

The same issue

we discussed

in Chapter 1.

---

# 🎯 Step 4 – Pattern Recognition

Before thinking about code,

ask yourself

the four pattern questions.

---

Need Frequency?

No.

---

Need Complement?

No.

---

Need Index?

No.

---

Need to remember

whether

we have already seen

an element?

YES.

---

Immediately

our brain says

```text
Visited Pattern
```

---

# 🎯 Step 5 – Choose Data Structure

Question

What information

do we need?

Only

YES

or

NO.

Need Frequency?

No.

Need Index?

No.

Need Value?

No.

Need only

Seen?

YES.

Therefore

```text
Visited

↓

Set
```

Notice

The Set

was chosen

after

thinking.

Not before.

---

# 🎨 Step 6 – Dry Run

This is the most important section.

---

Initially

Visited Set

```text
{}
```

---

Read

4

Already inside?

No.

Store.

```text
{4}
```

---

Read

7

Inside?

No.

Store.

```text
{4,7}
```

---

Read

2

Inside?

No.

Store.

```text
{4,7,2}
```

---

Read

9

Inside?

No.

Store.

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

True.

Done.

---

Notice something.

We never searched

the entire array.

We simply asked

the Set

one question.

> Have I seen this before?

---

# 🎯 Step 7 – Why Does This Work?

This is the section

most tutorials skip.

Let's think.

The first time

7 appears,

we remember it.

The second time

7 appears,

we don't need to search.

We already know.

That's why

Visited works.

The optimization

comes from

remembering.

Not from the Set.

---

# 💻 Step 8 – Swift Implementation

```swift
func containsDuplicate(_ nums: [Int]) -> Bool {

    var visited = Set<Int>()

    for num in nums {

        if visited.contains(num) {
            return true
        }

        visited.insert(num)
    }

    return false
}
```

---

# 🎯 Step 9 – Complexity

Time

```text
O(n)
```

Every element

processed once.

---

Space

```text
O(n)
```

Worst case

every element

stored.

---

# 🚩 Interview Discussion

## Question 1

Why Set?

Good answer:

> Because we only need to know whether an element has already been seen. No additional information is required.

---

## Question 2

Can we solve without extra space?

Answer

Yes.

Sort first.

Then compare adjacent elements.

Time

```text
O(n log n)
```

Space

may become

```text
O(1)
```

depending on the sorting algorithm.

Excellent follow-up discussion.

---

## Question 3

What if the array is already sorted?

No Set needed.

Simply compare

adjacent elements.

---

## Question 4

What if we need the first duplicate?

Current solution needs a small modification.

We'll study that in the next problem.

---

# 🌍 Real World Analogy

Airport Security.

Every passenger's passport is scanned.

If the passport has already been scanned,

an alert is raised.

The system does **not** scan every previous passenger manually.

It remembers who has already been processed.

That's the Visited Pattern.

---

# 🧠 Thinking Exercise

Without coding,

identify the pattern.

---

### Problem 1

Check whether an email is already registered.

Pattern?

---

### Problem 2

Find duplicate usernames.

Pattern?

---

### Problem 3

Detect whether a webpage has already been crawled.

Pattern?

---

### Problem 4

Find repeated visitor IDs.

Pattern?

---

# 📌 Problem Card

```text
Problem:
Contains Duplicate

Pattern:
Visited Elements

Recognition Trigger:
Have I seen this before?

Core Observation:
Repeated searching is expensive.

Thinking Shift:
Searching → Remembering

Data Structure:
Set

Brute Force:
Nested loops

Optimal:
Visited Set

Time:
O(n)

Space:
O(n)

Interview Follow-up:
Can you solve without extra space?
What if the array is sorted?
What if you need the first duplicate?
```

---

# 🎯 End of Problem 1

## Before moving to Problem 2

I want to make one refinement to our teaching methodology.

After building this problem, I noticed that every problem naturally has **two learning outcomes**:

### 1. Pattern Learning

For **Contains Duplicate**, the student learns:

* Visited Pattern
* Set selection
* Searching → Remembering

### 2. Algorithm Learning

The student also learns:

* Brute Force → Optimal
* Complexity analysis
* Dry run
* Interview follow-ups

So, from the next problem onward, I suggest we explicitly add these two sections at the end:

```text
🎓 Pattern Learned
```

and

```text
🛠 Algorithm Learned
```

For this problem, they would be:

**🎓 Pattern Learned**

* Recognize "Have I seen this before?" questions.
* Choose a `Set` when only existence matters.
* Replace repeated searching with remembering.

**🛠 Algorithm Learned**

* Convert a nested-loop brute-force solution into a single-pass solution.
* Analyze time and space complexity.
* Validate the algorithm through a dry run before coding.

This reinforces both **problem-solving intuition** and **algorithmic technique**, making revision much more effective as the course grows.

