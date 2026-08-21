Excellent. This is the most important part of the entire Projection chapter because now we move from **"How long is the shadow?"** to **"Where is the shadow located?"**

This is also where most Linear Algebra books introduce **Vector Projection**.

We'll keep our notebook style:

* ✅ Scaler coverage
* ✅ Much deeper intuition
* ✅ ML connection
* ✅ Render-safe equations
* ✅ No unsupported LaTeX

---

# Part 4 — Vector Projection

---

# Learning Objectives

By the end of this section, you will understand:

* Why scalar projection is not always sufficient.
* What a vector projection is.
* How to derive the vector projection formula.
* Why we need a **unit vector**.
* How vector projection differs from scalar projection.

---

# 4.1 Recap: Scalar Projection

In the previous section, we learned that the scalar projection of **x** onto **y** is

```math id="vp401"
\frac{\mathbf{x}^{T}\mathbf{y}}{\|\mathbf{y}\|}
```

This tells us only one thing:

> **How far x extends along the direction of y.**

It gives only a **number**.

For example,

* 5 meters
* -3 units
* 7.2 cm

A number has magnitude only.

It has **no direction**.

---

# 4.2 The Missing Information

Imagine shining a flashlight onto the ground.

The shadow has

* a length
* and a direction.

If someone only tells you

> "The shadow is 4 meters long."

Can you draw the shadow?

No.

You still don't know **which direction** it points.

Exactly the same thing happens with scalar projection.

It tells us

> "The projection has length L."

But it does **not** tell us **where that projected vector points**.

---

# 4.3 From Length to Vector

Suppose

* the scalar projection is **5**
* the direction is along vector **y**

How can we create a vector of length **5** pointing in the direction of **y**?

We cannot multiply by **y** directly.

Why?

Because **y** may have any length.

For example,

Suppose

```text
y = [6, 8]
```

Its magnitude is

```math id="vp402"
\|\mathbf{y}\|=10
```

Multiplying

```text
5 × y
```

would produce a vector much longer than 5.

So we need something whose length is exactly **1**.

That is precisely why we learned **Unit Vectors** before Projection.

---

# 4.4 Step 1 — Convert y into a Unit Vector

The unit vector along **y** is

```math id="vp403"
\hat{\mathbf{y}}=\frac{\mathbf{y}}{\|\mathbf{y}\|}
```

This vector has two important properties:

* Magnitude = 1
* Direction = same as **y**

Now it acts like a perfect "direction arrow."

---

# 4.5 Step 2 — Scale the Unit Vector

Suppose

Scalar Projection = **L**

The unit vector gives the direction.

Multiplying them gives

```text
Projected Vector
=
Length × Direction
```

Mathematically,

```math id="vp404"
\text{Vector Projection}
=
\left(
\frac{\mathbf{x}^{T}\mathbf{y}}
{\|\mathbf{y}\|}
\right)
\left(
\frac{\mathbf{y}}
{\|\mathbf{y}\|}
\right)
```

Now simplify.

---

# 4.6 Final Vector Projection Formula

Multiplying the denominators,

**Vector projection of x onto y**

```math id="vp406"
Projᵧ(x)=\frac{\mathbf{x}^{T}\mathbf{y}}
{\|\mathbf{y}\|^{2}}
\mathbf{y}
```

---

# 4.7 Why Does This Formula Work?

Look carefully.

The formula has two parts.

### Part 1

```math id="vp407"
\frac{\mathbf{x}^{T}\mathbf{y}}
{\|\mathbf{y}\|}
```

This computes

**the required length.**

---

### Part 2

```math id="vp408"
\frac{\mathbf{y}}
{\|\mathbf{y}\|}
```

This gives

**the required direction.**

Multiplying them produces

* Correct length
* Correct direction

which is exactly what a vector projection should be.

---

# 4.8 Scalar Projection vs Vector Projection

| Scalar Projection   | Vector Projection                 |
| ------------------- | --------------------------------- |
| Gives only length   | Gives length and direction        |
| Output is a scalar  | Output is a vector                |
| Measures "how much" | Gives the actual projected vector |
| Cannot be drawn     | Can be drawn geometrically        |

---

# 4.9 Real-Life Analogy

Imagine a person walks northeast for 10 meters.

Now you ask,

> "How much of that movement was toward the east?"

There are two possible answers.

### Scalar Projection

"About 7 meters."

This is only a number.

---

### Vector Projection

"A 7-meter vector pointing exactly east."

Now you know both

* the amount
* the direction

This is much richer information.

---

# 4.10 Machine Learning Intuition

Many ML algorithms do not just ask

> "How similar are two vectors?"

They also need to know

> "What part of one vector lies in the direction of another?"

That is exactly what vector projection provides.

Later, when we study

* Least Squares
* Linear Regression
* Orthogonal Projection
* PCA

you will see that vector projection becomes one of the most fundamental operations in machine learning.

---

## ✅ Part 4 Summary

* Scalar projection gives only the **length** of the projection.
* Vector projection gives both the **length and direction**.
* A **unit vector** is needed to preserve direction while controlling magnitude.
* The vector projection is obtained by multiplying the scalar projection by the unit vector in the direction of **y**.
* This concept forms the foundation of orthogonal projections, least squares, and many machine learning algorithms.

---

### **Rendering-safe rule for this notebook**

Since your renderer does **not** support `\operatorname{...}`, throughout the notebook we will write:

**Vector projection of x onto y**

followed by

```math
\frac{\mathbf{x}^{T}\mathbf{y}}
{\|\mathbf{y}\|^{2}}
\mathbf{y}
```

instead of using `\operatorname{proj}`. This keeps the notebook clean, consistent, and free from rendering errors.

