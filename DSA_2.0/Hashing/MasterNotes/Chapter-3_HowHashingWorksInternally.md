Excellent. This is the chapter that separates someone who **uses** `Dictionary` from someone who **understands** it.

I also want to make one promise.

> **This chapter will not just explain Hashing.**
>
> **It will explain why `Dictionary` is fast, why collisions happen, why `Hashable` exists in Swift, and why average lookup is O(1).**

After this chapter, you'll be able to answer most hashing interview questions without memorizing them.

---

# 📘 Chapter 3 – How Hashing Actually Works Internally

---

# 🎯 Chapter Objective

By the end of this chapter, you should be able to answer:

* What actually happens when we write `dict["Apple"] = 10`?
* What is a Hash Function?
* What is a Bucket?
* Why is Dictionary so fast?
* Why isn't lookup always O(1)?
* Why do collisions happen?
* Why does Swift require `Hashable`?

---

# 🧠 Engineer Mode (Think)

## Story

Imagine a huge hotel with **1000 rooms**.

Someone asks:

> **"Where is Mr. Rahul?"**

### Option 1

Walk through every room.

```text
Room 1

Room 2

Room 3

...

Room 1000
```

Time-consuming.

---

### Option 2

Reception checks a register.

```
Rahul → Room 325
```

Immediately:

> "Mr. Rahul is in Room 325."

No searching.

Just direct access.

---

This is Hashing.

The hotel doesn't search for Rahul.

It already knows Rahul's address.

---

## Engineer Definition

> **Hashing converts "Who am I looking for?" into "Where should I go?"**

That's the biggest mental model.

Hashing is basically **Address Finding**.

Not searching.

---

# Problem

Suppose we have:

```text
Apple → ₹120

Banana → ₹60

Orange → ₹80
```

Now ask:

> "What is Apple's price?"

### Array Thinking

Search

```
Apple?

Banana?

Orange?

Found.
```

---

### Hashing Thinking

Already know

```
Apple

↓

Address

↓

Directly Go
```

No searching.

---

# Intuition

Every key gets a unique "home address."

```
Apple

↓

Hash Function

↓

Address

↓

Bucket
```

Think of Aadhaar.

You don't search among all citizens.

You already know the ID.

---

# Important Question

## But how does computer know Apple's address?

Good question.

This is where Hash Function comes in.

---

# 📘 Computer Science Mode

## Hash Function

Definition:

> **A Hash Function converts a Key into an Integer (Hash Value).**

Example

```
Apple

↓

Hash Function

↓

987654321
```

Notice

Apple didn't become an index.

It became a huge number.

---

Now question.

Can we create an array with

```
987654321
```

positions?

Obviously not.

Too much memory.

So we do another step.

---

# Compression

Suppose Hash Table size = 10

We calculate

```
987654321 % 10

↓

1
```

Now

```
Apple

↓

987654321

↓

1
```

Apple goes into

```
Bucket 1
```

---

## Complete Flow

I want you to memorize this.

```
Key

↓

Hash Function

↓

Hash Value

↓

Compression (Modulo)

↓

Bucket

↓

Store Data
```

Every Hash Table follows this idea.

---

# Visualization

Let's say

Hash Table size = 8

```
Bucket

0

1

2

3

4

5

6

7
```

---

Insert Apple

```
Apple

↓

Hash()

↓

98352

↓

98352 % 8

↓

0
```

Store

```
0 → Apple
```

---

Insert Banana

```
Banana

↓

Hash()

↓

34562

↓

34562 % 8

↓

2
```

```
2 → Banana
```

---

Insert Orange

```
Orange

↓

Hash()

↓

73491

↓

73491 % 8

↓

3
```

```
3 → Orange
```

Now table becomes

```
0 → Apple

1

2 → Banana

3 → Orange

4

5

6

7
```

---

# Searching

Need Apple.

Instead of

```
Apple?

Banana?

Orange?
```

We simply calculate

```
Hash(Apple)

↓

98352

↓

0
```

Go directly.

Found.

---

This is why lookup becomes fast.

---

# Time Complexity

Searching

```
Array

↓

O(n)
```

Hash Table

```
Hash()

↓

Bucket

↓

O(1) Average
```

Notice

Average.

Not Always.

We'll understand why soon.

---

# The First Surprise

Suppose

Apple

```
Hash()

↓

98352

↓

0
```

Orange

```
Hash()

↓

73440

↓

0
```

Both want Bucket 0.

Uh-oh...

Now what?

This is called

# Collision

We'll dedicate the next chapter to this.

---

# Why Modulo?

Students often ask

> Why `%`?

Because Hash Values are huge.

Buckets are limited.

Modulo compresses

```
987654321

↓

1
```

Simple.

---

# Space-Time Tradeoff

Without Hashing

```
Less Memory

More Searching
```

With Hashing

```
More Memory

Less Searching
```

Computer Science always involves trade-offs.

Hashing chooses

Memory

to save

Time.

---

# Swift Perspective

Now connect to Swift.

```swift
var prices = [
    "Apple":120,
    "Banana":60,
    "Orange":80
]
```

When you write

```swift
prices["Apple"]
```

Swift roughly does

```
Apple

↓

hash(into:)

↓

Hash Value

↓

Bucket

↓

Lookup
```

You never see it.

But that's happening internally.

---

# Why Hashable?

Suppose

```swift
struct Student {

    let name:String

}
```

Can Dictionary hash this?

No.

Because

Swift doesn't know

How to convert Student

into a Hash Value.

That's why Swift asks

```
Hashable
```

When you conform to

```swift
Hashable
```

You're basically telling Swift

> "I know how to generate a hash for this object."

---

# Common Misconceptions

### Wrong

Hash Function stores data.

No.

Hash Function only computes an address.

---

### Wrong

Hash Value = Bucket.

No.

Hash Value

↓

Compression

↓

Bucket

---

### Wrong

Dictionary stores data sequentially.

No.

Dictionary stores data based on hash buckets.

---

### Wrong

Every key gets unique bucket.

No.

Sometimes collisions happen.

---

# Interview Questions

* What is a Hash Function?
* Why do we need modulo?
* Difference between Hash Value and Bucket?
* Why is lookup O(1)?
* Why isn't lookup always O(1)?
* What is a collision?
* Why Hashable in Swift?
* Why Dictionary is faster than Array?

---

# Chapter Summary

Think of Hashing as a **GPS**.

Without GPS

```
Search every road.
```

With GPS

```
Go directly to destination.
```

Hash Function is the GPS.

Bucket is the destination.

Hash Table is the city.

---

# 🧩 Thinking Exercise

Imagine

Hash Table Size = 10

Keys

```
15

25

35
```

Question

Where will each element go?

Try calculating

```
Key % 10
```

What do you notice?

(Hint: Something interesting happens...)

---

# 🎯 Engineer's Takeaway

If Chapter 2 taught us:

> **"Remember instead of searching."**

Then Chapter 3 teaches us:

> **"Hash Function is the mechanism that tells us where to remember."**

---

# 💡 My recommendation for this chapter

I would **not** record this as a single 25-minute video.

Instead, split it into **two YouTube videos**:

### 🎥 Video 3A – How Hashing Works

* Hotel analogy
* Address finding
* Hash function
* Hash value
* Buckets
* Modulo
* Swift `Dictionary`

### 🎥 Video 3B – Why Hashing Is Fast

* Search flow
* Time complexity
* Space-time trade-off
* `Hashable`
* Lead into collisions

This has two advantages:

1. **Better retention:** Each video focuses on one core idea and is easier to follow.
2. **Natural progression:** End Video 3A with the question, *"What happens if two keys map to the same bucket?"* That creates curiosity and gives viewers a strong reason to watch the next video on collisions.

This is exactly the kind of chapter where visuals and storytelling will make a bigger impact than code. Once viewers truly understand the internals, every Hashing interview problem becomes much easier to reason about.

