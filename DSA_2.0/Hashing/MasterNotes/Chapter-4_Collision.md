

# 📘 Hashing - Chapter 4

# Collision (Master Notes)

---

# 🎯 Chapter Objective

By the end of this chapter, you should be able to answer:

* What is a Collision?
* Why does Collision happen?
* Can Collision be avoided?
* How do Hash Tables resolve Collisions?
* Why isn't Dictionary always O(1)?
* What is Separate Chaining?
* What is Open Addressing?
* What are Linear Probing and Quadratic Probing?
* Why does performance degrade?

---

# 🧠 Engineer Mode (Think)

---

## Story

Imagine a parking lot.

There are only **10 parking slots**.

```
Slot

0
1
2
3
4
5
6
7
8
9
```

Now imagine

Car A

gets Slot 3.

Everything is fine.

After 5 minutes...

Car B also gets Slot 3.

Question...

Can two cars park in one parking slot?

Obviously...

No.

Now what?

This exact problem is called

# Collision

---

## Biggest Mental Model

Hash Function gives an address.

But...

Sometimes

Two different keys

receive

the same address.

Example

```
Apple

↓

Bucket 3
```

```
Orange

↓

Bucket 3
```

Different keys.

Same bucket.

This is Collision.

---

# Why does Collision happen?

This is the most important question.

Many beginners think

"My Hash Function is bad."

Wrong.

Collision is

**NORMAL.**

Let's understand why.

---

Suppose

Hash Table Size = 10

Meaning

We have only

```
0

1

2

3

4

5

6

7

8

9
```

Only

10 buckets.

Now suppose

You have

1000 keys.

Question

Can 1000 keys fit uniquely

inside only 10 buckets?

Impossible.

So

Some keys

must

share buckets.

This is mathematics.

Not bad programming.

---

# Real Example

Suppose

Hash Function

```
key % 10
```

Insert

```
15

↓

5
```

Insert

```
25

↓

5
```

Insert

```
35

↓

5
```

All

go to

Bucket 5.

Collision.

---

# Important Understanding

Collision does NOT mean

Hashing failed.

Collision means

Hashing needs another strategy.

---

# 📘 Computer Science Mode

---

## Definition

Collision occurs when

two or more different keys

produce the same bucket.

Example

```
15

↓

5
```

```
25

↓

5
```

Different keys

Same bucket

Collision.

---

# Collision Resolution

Computer Science has many techniques.

But for interviews,

focus on

1.

Separate Chaining

2.

Open Addressing

---

# Method 1

## Separate Chaining

This is the easiest one.

Instead of storing

one element

inside Bucket 5

Store

a Linked List.

Example

```
Bucket 5

↓

15

↓

25

↓

35
```

Now

Need

25

Go to Bucket 5

Search only

inside that list.

Notice

You are no longer searching

the whole table.

Only

one chain.

---

### Advantages

Simple

Easy

Works well

---

### Disadvantages

Needs extra memory.

Because

Linked Lists

consume memory.

---

# Method 2

## Open Addressing

Instead of

creating Linked List

Find another empty bucket.

Example

Need

Bucket 5

Occupied.

Check

```
6
```

If occupied

Check

```
7
```

Until

empty bucket found.

Store there.

---

There are multiple ways

to find next bucket.

---

# 1

Linear Probing

```
5

↓

6

↓

7

↓

8
```

Simply move

one step.

---

### Problem

Primary Clustering.

Many elements

collect together.

Searching

becomes slower.

---

# 2

Quadratic Probing

Instead of

+1

Use

```
+1²

+2²

+3²
```

Example

```
5

↓

6

↓

9

↓

14
```

Spread becomes better.

Less clustering.

---

# 3

Double Hashing

Instead of

one Hash Function

Use

two.

Second Hash Function

decides

next jump.

This reduces

clustering even more.

Interview depth.

Enough to know

concept.

---

# Time Complexity

Without Collision

Searching

```
O(1)
```

With many Collisions

Searching becomes

```
O(n)
```

This is why

we always say

Average

```
O(1)
```

Worst

```
O(n)
```

---

# Load Factor

Another important concept.

Formula

```
Load Factor

=

Number of Elements

/

Number of Buckets
```

Example

100 elements

10 buckets

```
100

/

10

=

10
```

Very high.

Many collisions.

---

Example

100 elements

200 buckets

```
100

/

200

=

0.5
```

Very few collisions.

Fast.

---

Meaning

As Load Factor increases

Collisions increase.

Performance decreases.

---

# Rehashing

Question

What if

table becomes too full?

Computer creates

a bigger table.

Example

```
10 Buckets

↓

20 Buckets

↓

40 Buckets
```

Then

every key

is hashed again.

This is called

Rehashing.

Swift Dictionary

does this internally.

---

# Swift Perspective

You never write

Collision handling.

Swift Dictionary

already manages

* Collision
* Rehashing
* Bucket resizing

That's why

Dictionary

is so powerful.

---

# Interview Questions

What is Collision?

Why does Collision happen?

Can Collision be avoided?

Difference

Separate Chaining

vs

Open Addressing

Why isn't HashMap always O(1)?

What is Load Factor?

What is Rehashing?

---

# Common Misconceptions

### Wrong

Good Hash Function

means

No Collision.

Wrong.

Even perfect Hash Functions

can collide

if

Buckets are limited.

---

### Wrong

Collision is bad.

Wrong.

Too many Collisions

are bad.

Some Collisions

are unavoidable.

---

### Wrong

Dictionary lookup

always O(1).

Wrong.

Average

O(1)

Worst

O(n)

---

# Engineer Summary

Hash Function

finds

address.

Collision

happens

when

multiple keys

want

the same address.

Collision Resolution

decides

how to manage them.

---

# One Line Memory

> **Hash Function finds the address.**
>
> **Collision decides what happens when two people reach the same address.**

---

# Thinking Exercise

Hash Table Size

```
10
```

Hash Function

```
key % 10
```

Insert

```
12

22

32

42

52
```

Questions

1. Which bucket will they go to?
2. How many collisions occur?
3. If using Separate Chaining, draw the final table.
4. If using Linear Probing, draw the final table.
5. Which approach will search faster after inserting all elements?

---

## ✅ Your Task Before We Move to Chapter 5

Don't memorize this chapter.

Instead, be able to explain these three questions in your own words without looking at the notes:

1. **Why are collisions unavoidable, even with a good hash function?**
2. **Why does the worst-case time complexity become O(n)?**
3. **Why does increasing the number of buckets reduce collisions?**

If you can confidently explain these three ideas, you've understood collisions at an interview level. Then we'll move to **Chapter 5: Dictionary vs Set in Swift**, where we'll connect all of this theory to practical Swift usage.

