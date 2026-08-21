Excellent. We have now completed the **theory** of projection. Just like we did for the **Dot Product** chapter, it's time to reinforce the concepts with carefully chosen numerical examples.

Instead of solving many random questions, we'll solve a few examples that each teach a different concept.

---

# Part 6 — Numerical Examples

## Learning Objectives

By the end of this section, you will be able to:

* Compute the scalar projection.
* Compute the vector projection.
* Interpret the result geometrically.
* Understand the meaning of positive and negative projections.

---

# 6.1 Example 1 — A Simple 2D Example

Consider the vectors

```math id="pe601"
\mathbf{x}
=
\begin{bmatrix}
4\\
3
\end{bmatrix},
\qquad
\mathbf{y}
=
\begin{bmatrix}
2\\
0
\end{bmatrix}
```

We will compute:

1. Scalar Projection of **x** onto **y**
2. Vector Projection of **x** onto **y**

---

## Step 1 — Compute the Dot Product

```math id="pe602"
\mathbf{x}^{T}\mathbf{y}
=
4\times2
+
3\times0
=
8
```

---

## Step 2 — Compute the Magnitude of y

```math id="pe603"
\|\mathbf{y}\|
=
\sqrt{2^2+0^2}
=
2
```

---

## Step 3 — Scalar Projection

Using

```math id="pe604"
\frac{\mathbf{x}^{T}\mathbf{y}}
{\|\mathbf{y}\|}
```

we obtain

```math id="pe605"
\frac{8}{2}
=
4
```

Therefore,

**Scalar Projection = 4**

---

## Step 4 — Unit Vector Along y

```math id="pe606"
\hat{\mathbf{y}}
=
\frac{\mathbf{y}}
{\|\mathbf{y}\|}
=
\frac{1}{2}
\begin{bmatrix}
2\\
0
\end{bmatrix}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

---

## Step 5 — Vector Projection

Multiply

Scalar Projection × Unit Vector

```math id="pe607"
4
\begin{bmatrix}
1\\
0
\end{bmatrix}
=
\begin{bmatrix}
4\\
0
\end{bmatrix}
```

Therefore,

```math id="pe608"
\text{Vector Projection}
=
\begin{bmatrix}
4\\
0
\end{bmatrix}
```

---

## Interpretation

Notice that

```math id="pe609"
\mathbf{x}
=
\begin{bmatrix}
4\\
3
\end{bmatrix}
```

contains

* 4 units in the horizontal direction
* 3 units in the vertical direction

Projecting onto **y** (the x-axis) removes the vertical component completely.

Only the horizontal component remains.

That is exactly what the projection represents.

---

# 6.2 Example 2 — Projection at an Angle

Now consider

```math id="pe610"
\mathbf{x}
=
\begin{bmatrix}
3\\
4
\end{bmatrix},
\qquad
\mathbf{y}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

---

## Step 1 — Dot Product

```math id="pe611"
\mathbf{x}^{T}\mathbf{y}
=
3\times1
+
4\times1
=
7
```

---

## Step 2 — Magnitude of y

```math id="pe612"
\|\mathbf{y}\|
=
\sqrt{1^2+1^2}
=
\sqrt2
```

---

## Step 3 — Scalar Projection

```math id="pe613"
\frac{7}{\sqrt2}
\approx
4.95
```

---

## Step 4 — Unit Vector

```math id="pe614"
\hat{\mathbf{y}}
=
\frac1{\sqrt2}
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

---

## Step 5 — Vector Projection

```math id="pe615"
\frac{7}{\sqrt2}
\times
\frac1{\sqrt2}
\begin{bmatrix}
1\\
1
\end{bmatrix}
=
\frac72
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Hence,

```math id="pe616"
\text{Vector Projection}
=
\begin{bmatrix}
3.5\\
3.5
\end{bmatrix}
```

---

## Interpretation

The projected vector points exactly in the direction of

```math id="pe617"
\mathbf{y}
```

because projection always preserves the direction of the reference vector.

---

# 6.3 Example 3 — Negative Projection

Consider

```math id="pe618"
\mathbf{x}
=
\begin{bmatrix}
-2\\
0
\end{bmatrix},
\qquad
\mathbf{y}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

---

## Step 1 — Dot Product

```math id="pe619"
\mathbf{x}^{T}\mathbf{y}
=
(-2)(1)
=
-2
```

---

## Step 2 — Scalar Projection

Since

```math id="pe620"
\|\mathbf{y}\|
=
1
```

the scalar projection is

```math id="pe621"
-2
```

---

## Interpretation

The projection is negative.

This does **not** mean the projection has a negative length.

Instead, it means

> **The projected vector points in the opposite direction of y.**

This interpretation is extremely important in machine learning, where the sign often tells us whether two vectors are aligned or opposed.

---

# 6.4 Summary Table

| Example   | Scalar Projection | Vector Projection | Interpretation                                 |
| --------- | ----------------: | ----------------- | ---------------------------------------------- |
| Example 1 |                 4 | ([4,0]^T)         | Entire projection lies on the x-axis           |
| Example 2 |        (7/\sqrt2) | ([3.5,3.5]^T)     | Projection follows the diagonal direction of y |
| Example 3 |                -2 | ([-2,0]^T)        | Projection points opposite to y                |

---

# 💡 Think Like a Mathematician

Notice the recurring pattern.

Every projection problem follows exactly the same four steps:

1. Compute the **dot product**.
2. Compute the **magnitude** of the reference vector.
3. Find the **scalar projection**.
4. Multiply by the **unit vector** (if the vector projection is required).

Once you master these four steps, you can solve projection problems in **2 dimensions, 3 dimensions, or even thousands of dimensions**. The mathematics remains exactly the same.

---

## 📌 What's Next?

In the final section of this chapter, we'll bring everything together with:

* Python implementation using NumPy
* Common interview questions
* Revision cheat sheet
* Topic summary
* Coverage matrix
* Curiosity Box

This will complete the **Projection of a Vector** chapter in the same notebook style we've established.

