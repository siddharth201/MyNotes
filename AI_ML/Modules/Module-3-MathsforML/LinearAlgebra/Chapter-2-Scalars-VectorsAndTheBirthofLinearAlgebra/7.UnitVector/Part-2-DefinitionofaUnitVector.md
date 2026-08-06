Perfect. Let's continue in the same notebook style we've now stabilized.

---

# Part 2 — Definition of a Unit Vector

In the previous section, we answered an important question:

> **Why do we need a unit vector?**

We learned that in many situations, we care only about the **direction** of a vector, not its length.

Now let's formally define what a unit vector is.

---

# What is a Unit Vector?

A **unit vector** is simply a vector whose **magnitude (length) is exactly 1**.

In other words,

> A unit vector is a vector that points in a particular direction but has a standardized length of one unit.

Unlike ordinary vectors, a unit vector does not tell us **how far** to move—it only tells us **which direction** to move.

---

# Formal Definition

If a vector has magnitude equal to 1, then it is called a **unit vector**.

Mathematically,

```math
\boxed{
\|\hat{\mathbf{x}}\| = 1
}
```

where

* (\mathbf{x}) is the original vector.
* (\hat{\mathbf{x}}) (read as **"x hat"**) is the corresponding unit vector.

The hat symbol indicates that the vector has been **normalized**, meaning its magnitude has been adjusted to 1 while preserving its direction.

---

# Understanding the Definition

A vector has two important properties:

1. **Magnitude (Length)**
2. **Direction**

A unit vector keeps the **direction exactly the same** but changes the **magnitude to 1**.

Think of it this way:

| Original Vector     | Unit Vector |
| ------------------- | ----------- |
| Same direction      | ✅           |
| Same angle          | ✅           |
| Same orientation    | ✅           |
| Magnitude preserved | ❌           |
| Magnitude becomes 1 | ✅           |

This is the defining characteristic of every unit vector.

---

# Why is the Magnitude Chosen as 1?

You might wonder:

> **Why not make every vector have length 2 or 5?**

The answer is simple.

The number **1** is the natural "standard length."

Just as we compare distances using **one meter** or weights using **one kilogram**, linear algebra compares directions using vectors of **unit length**.

Choosing length 1 removes the effect of scale and leaves only the direction.

---

# Visual Intuition

Imagine three arrows all pointing northeast.

```
Long Arrow        →↗

Medium Arrow      ↗

Unit Arrow        ↗
```

All three arrows point in exactly the same direction.

The only difference is their length.

When we convert them into unit vectors, they all become the **same standard-sized arrow**, making it much easier to compare directions.

---

# Important Property

Converting a vector into a unit vector **does not rotate it**.

It only stretches or shrinks the vector along its own direction.

If a vector originally points at an angle of (40^\circ), its unit vector also points at (40^\circ).

If a vector points north, its unit vector also points north.

Only the length changes.

---

# Example

Suppose we have the vector

```math
\mathbf{x}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

Its magnitude is

```math
\|\mathbf{x}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

Since

```math
\sqrt{13}\neq1,
```

this is **not** a unit vector.

Later in this chapter, we will convert this vector into its corresponding unit vector.

---

# Common Misconception

Many beginners think:

> "A unit vector is a small vector."

This is **not** true.

A unit vector is **not defined by being small**.

It is defined only by one condition:

> **Its magnitude must be exactly equal to 1.**

Its direction can be anything.

---

# Notation

Throughout mathematics, physics, and machine learning, unit vectors are usually represented by placing a **hat** over the original vector.

Examples include

* (\hat{\mathbf{x}})
* (\hat{\mathbf{y}})
* (\hat{\mathbf{u}})
* (\hat{\mathbf{v}})

The hat is simply a reminder that the vector has been normalized to have unit length.

---

# Key Takeaways

* A unit vector is a vector with **magnitude equal to 1**.
* A unit vector preserves the **direction** of the original vector.
* Only the **length** changes during normalization.
* The hat notation ( (\hat{\mathbf{x}}) ) indicates a unit vector.
* Unit vectors allow us to study **direction independently of magnitude**, which is why they are fundamental in geometry, physics, and machine learning.

---

## What's Next?

In the next part, we'll answer the natural question:

> **How do we convert any ordinary vector into a unit vector?**

We'll derive the normalization formula step by step, understand *why* dividing by the magnitude works, and prove that the resulting vector always has magnitude exactly equal to 1.

