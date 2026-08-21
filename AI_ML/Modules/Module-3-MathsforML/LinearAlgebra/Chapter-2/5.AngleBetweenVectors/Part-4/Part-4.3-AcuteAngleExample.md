Perfect. We'll continue exactly according to our **frozen outline**.

---

# Part 4 — Numerical Examples

# 4.3 — Acute Angle Example

In the previous examples, we learned **how** to compute the dot product.

Now we'll start interpreting what the result actually means.

Our goal is to answer an important question:

> **What does a positive dot product tell us about the angle between two vectors?**

---

# Learning Objective

We already know the geometric relationship

```math
\mathbf{x}\cdot\mathbf{y}
=
\|\mathbf{x}\|
\|\mathbf{y}\|
\cos\theta
```

If the angle between two vectors is **less than 90°**, then

* the vectors point in roughly the same direction,
* the cosine is positive,
* therefore the dot product should also be positive.

Let's verify this with an example.

---

# Given Vectors

Consider the vectors

```math
\mathbf{x}
=
\begin{bmatrix}
3\\
2
\end{bmatrix},
\qquad
\mathbf{y}
=
\begin{bmatrix}
4\\
1
\end{bmatrix}
```

---

# Step 1 — Multiply Corresponding Components

Multiply the numbers occupying the **same position**.

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |          3 × 4 |     12 |
| Second    |          2 × 1 |      2 |

---

# Step 2 — Add the Products

Now simply add the results.

```math
\mathbf{x}\cdot\mathbf{y}
=
(3\times4)
+
(2\times1)
=
12+2
=
14
```

Therefore,

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}=14
}
```

---

# Step 3 — Compute the Magnitudes

Magnitude of **x**

```math
\|\mathbf{x}\|
=
\sqrt{3^2+2^2}
=
\sqrt{13}
```

Magnitude of **y**

```math
\|\mathbf{y}\|
=
\sqrt{4^2+1^2}
=
\sqrt{17}
```

---

# Step 4 — Compute the Angle

Using the cosine formula,

```math
\cos\theta
=
\frac{\mathbf{x}\cdot\mathbf{y}}
{\|\mathbf{x}\|\|\mathbf{y}\|}
```

Substitute the values,

```math
\cos\theta
=
\frac{14}
{\sqrt{13}\times\sqrt{17}}
```

Numerically,

```math
\cos\theta
\approx
0.9417
```

Therefore,

```math
\theta
=
\cos^{-1}(0.9417)
\approx
19.66^\circ
```

Since

```math
19.66^\circ < 90^\circ
```

the vectors form an **acute angle**.

---

# Geometric Interpretation

genui{"trigonometry_vectors_learning_block":{"type_id":"VECTOR_DOT_PRODUCT","content":"\mathbf a\cdot\mathbf b=a_xb_x+a_yb_y=\lVert\mathbf a\rVert\lVert\mathbf b\rVert\cos\theta"}}

Both vectors point in **almost the same direction**.

The angle between them is small, so:

* Their directions are highly aligned.
* Their cosine is close to **1**.
* Their dot product is a large positive number.

Visually, if one vector were an arrow showing where to move, the other arrow would be pointing almost the same way.

---

# Why Is the Dot Product Positive?

Recall the formula

```math
\mathbf{x}\cdot\mathbf{y}
=
\|\mathbf{x}\|
\|\mathbf{y}\|
\cos\theta
```

Notice:

* The magnitudes are always **positive**.
* Therefore, the **sign** of the dot product depends entirely on **(\cos\theta)**.

For an acute angle,

```math
0^\circ<\theta<90^\circ
```

and we know

```math
\cos\theta>0
```

Hence,

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}>0
}
```

---

# Machine Learning Insight

A **positive dot product** means the vectors are pointing in generally the same direction.

In Machine Learning, this often means:

* Two documents discuss similar topics.
* Two sentence embeddings have similar meanings.
* Two products have similar characteristics.
* Two users have similar preferences.

The **larger the positive dot product**, the more aligned the vectors tend to be.

---

# 📦 Key Takeaway

Whenever two non-zero vectors form an **acute angle**,

```math
0^\circ<\theta<90^\circ
```

then

```math
\cos\theta>0
```

and therefore

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}>0
}
```

A **positive dot product** is a strong indicator that the vectors are pointing in similar directions.

---

### ✅ Scaler Coverage

* ✅ Numerical example
* ✅ Computing the angle using the dot product

### 🚀 Added by Our Notebook

* ✅ Why the dot product becomes positive
* ✅ Connection between cosine and the sign of the dot product
* ✅ Geometric intuition
* ✅ Machine Learning interpretation
* ✅ Clear rule for identifying acute-angle vectors

---

This completes **4.3 — Acute Angle Example**.

The next section in our frozen outline is **4.4 — Right Angle Example**, where we'll prove that **perpendicular vectors always have a dot product of zero**.

