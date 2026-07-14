Excellent question.

This is exactly the kind of question that separates someone who **uses a data structure** from someone who **understands why it is used**.

Let's analyze it like engineers.

---

# First understand the responsibility of each data structure

```swift
var visited = Set<Int>()
```

### Responsibility

> **Have I seen this number before?**

Example

```text
Input

4 7 2 9 7 4
```

After reading

```text
4 7 2 9
```

Visited becomes

```text
{4,7,2,9}
```

Nothing else.

It does **NOT** tell

* whether it is duplicate
* whether it is already added to answer

Its only responsibility is

> **Seen or Not Seen**

---

Now

```swift
var reported = Set<Int>()
```

### Responsibility

This answers a different question.

> **Have I already added this duplicate to my answer?**

Example

Input

```text
4 4 4 4
```

Second

4

↓

Duplicate

↓

Answer

```text
[4]
```

Reported

```text
{4}
```

Now third

4

comes.

Visited says

```text
YES
```

Reported says

```text
YES
```

Therefore

Don't append again.

---

Now

```swift
var result: [Int] = []
```

Responsibility

> **Store the final output in the required format.**

---

# Now your actual question

> Can we remove result array and use only two sets?

Let's think.

Suppose

```text
Input

4 7 2 9 7 4
```

Finally

Reported becomes

```text
{7,4}
```

Question

Isn't this enough?

### Technically

YES.

If the problem simply asks

> Return unique duplicates

then

you could return

```swift
Array(reported)
```

Example

```swift
return Array(reported)
```

No result array required.

---

# But then why did we use result?

Excellent question.

There are several reasons.

---

## Reason 1 — Sets are unordered

Remember

Set internally is a Hash Table.

Hash Tables do not preserve insertion order.

Example

Suppose

Reported

contains

```text
{7,4}
```

When converted

```swift
Array(reported)
```

You may get

```text
[4,7]
```

or

```text
[7,4]
```

No guarantee.

---

Our traversal order was

```text
4 7 2 9 7 4
```

Duplicate encountered

```text
7

then

4
```

Many interviewers expect

```text
[7,4]
```

Result array preserves

that order.

---

## Reason 2 — Separation of Responsibilities

This is an important software engineering principle.

Each data structure has

one responsibility.

```text
Visited

↓

Detect duplicate
```

---

```text
Reported

↓

Prevent duplicate reporting
```

---

```text
Result

↓

Store output
```

Notice

Each one does only

one job.

Cleaner design.

---

## Reason 3 — Output Format

Many interview problems explicitly say

> Return an Array.

They don't say

Return a Set.

So

internally

you can use

Set.

But

eventually

you must return

Array.

---

# Can we simplify?

Actually yes.

Since

result

and

reported

contain almost

the same values,

one of them can disappear.

For example

```swift
var visited = Set<Int>()
var duplicates = Set<Int>()

for num in nums {

    if visited.contains(num) {
        duplicates.insert(num)
    } else {
        visited.insert(num)
    }
}

return Array(duplicates)
```

This is shorter.

---

# Is this better?

No.

Why?

Because of

order.

Example

Input

```text
4 7 2 9 7 4
```

Expected

```text
[7,4]
```

But

```swift
Array(duplicates)
```

might become

```text
[4,7]
```

Random.

---

# Our Solution

```swift
visited
reported
result
```

Guarantees

```text
Traversal Order

↓

Duplicate Order

↓

Output Order
```

Much more robust.

---

# Interview Discussion ⭐⭐⭐⭐⭐

Suppose interviewer asks

> Why not simply use one Set?

A strong answer would be:

> "A Set helps me detect duplicates, but it doesn't preserve insertion order. Since I want to return duplicates in the order they are first encountered during traversal, I use a separate result array. The reported set ensures each duplicate is added only once, while the result array preserves the required output order."

That answer demonstrates both **algorithmic thinking** and **software engineering design**.

---

# 🌟 One More Engineering Insight

This discussion reveals a broader principle that will help throughout DSA:

> **Don't choose data structures only because they can store data. Choose them based on the guarantees they provide.**

For example:

| Data Structure | Important Guarantee                                                               |
| -------------- | --------------------------------------------------------------------------------- |
| Array          | Preserves insertion order                                                         |
| Set            | Fast lookup, unique elements, **no guaranteed order**                             |
| Map            | Key → Value lookup, **no guaranteed order** (unless language specifies otherwise) |
| Queue          | FIFO                                                                              |
| Stack          | LIFO                                                                              |

This is a mindset I want us to reinforce throughout the course. Whenever we introduce a new data structure, we won't just ask **"What can it store?"** We'll also ask **"What guarantees does it provide?"** That question leads to much stronger design decisions in interviews and real software engineering.
