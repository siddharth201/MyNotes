Perfect. Now we reach one of the **most important numerical examples** because it leads to a theorem that is used throughout Linear Algebra, Computer Graphics, Physics, PCA, and Machine Learning.

---

# Part 4 — Numerical Examples

# 4.4 — Right Angle Example (Orthogonal Vectors)

## 🎯 Learning Objective

In the previous example, we learned that:

* **Acute angle (θ < 90°)** ⟹ Dot Product > 0

Now let's investigate another important case:

> **What happens when two vectors are exactly perpendicular (90°)?**

This example leads to one of the most important properties of the dot product.

---

# Given Vectors

Consider the vectors

```math
\mathbf{x}
=
\begin{bmatrix}
2\\
1
\end{bmatrix},
\qquad
\mathbf{y}
=
\begin{bmatrix}
1\\
-2
\end{bmatrix}
```

---

# Step 1 — Multiply Corresponding Components

Multiply the corresponding components.

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |          2 × 1 |      2 |
| Second    |       1 × (−2) |     −2 |

---

# Step 2 — Add the Products

Now add the results.

```math
\mathbf{x}\cdot\mathbf{y}
=
(2\times1)
+
(1\times(-2))
=
2-2
=
0
```

Therefore,

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}=0
}
```

---

# Step 3 — What Does a Dot Product of Zero Mean?

A beginner often asks:

> **Did we simply get lucky?**

The answer is **No**.

Let's verify it using the geometric definition of the dot product.

```math
\mathbf{x}\cdot\mathbf{y}
=
\|\mathbf{x}\|
\|\mathbf{y}\|
\cos\theta
```

We already know

```math
\mathbf{x}\cdot\mathbf{y}=0
```

Substituting into the formula,

```math
0
=
\|\mathbf{x}\|
\|\mathbf{y}\|
\cos\theta
```

Since both vectors are **non-zero**, their magnitudes are positive.

Therefore, the only quantity that can become zero is

```math
\cos\theta
=
0
```

We know from trigonometry

```math
\cos90^\circ=0
```

Hence,

```math
\boxed{
\theta=90^\circ
}
```

---

# Visual Interpretation

genui{"trigonometry_vectors_learning_block":{"type_id":"VECTOR_DOT_PRODUCT"}}

The two vectors meet at a **right angle**.

Neither vector points in the direction of the other.

One vector has **zero contribution** along the direction of the other.

This is why the dot product becomes **zero**.

---

# Why Does This Happen?

Think of one vector as a **shadow** (projection) of the other.

When vectors are perpendicular,

the shadow completely disappears.

```text
Sunlight →

        y
        ↑
        │
        │
        │
Origin ─────────→ x
```

Since the projection length is zero,

the dot product also becomes zero.

> **No projection ⇒ No overlap ⇒ Dot Product = 0**

This intuition becomes extremely important when we study **vector projections** later.

---

# Mathematical Rule

For two **non-zero vectors**

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}=0
\iff
\mathbf{x}\perp\mathbf{y}
}
```

The symbol

```math
\perp
```

means **perpendicular** (or **orthogonal**).

Notice the words **if and only if** (⇔).

This means the statement works in **both directions**:

* If two vectors are perpendicular, then their dot product is zero.
* If the dot product of two non-zero vectors is zero, then they must be perpendicular.

This is one of the most useful theorems in Linear Algebra.

---

# 🤖 Machine Learning Perspective

In Machine Learning, orthogonal vectors represent **independence**.

Some examples include:

* Two unrelated document embeddings
* Two independent features in a dataset
* Orthogonal basis vectors
* Principal Components in PCA
* Independent directions in feature space

A dot product of zero means:

> **The vectors have no directional similarity.**

They carry completely different information.

---

# 📦 Key Takeaway

Whenever you see

```math
\mathbf{x}\cdot\mathbf{y}=0
```

immediately ask:

> **Are both vectors non-zero?**

If the answer is **Yes**, then you can conclude

```math
\boxed{
\theta=90^\circ
}
```

or equivalently,

```math
\boxed{
\mathbf{x}\perp\mathbf{y}
}
```

---

# 📝 Interview Tip

A very common interview question is:

> **Does a dot product of zero always imply that two vectors are perpendicular?**

**Answer:**

Yes, **provided both vectors are non-zero**.

If one of the vectors is the **zero vector**, its dot product with every vector is zero, but the angle with the zero vector is **undefined** because the zero vector has no direction.

This is a subtle point that interviewers often test.

---

# 🧠 Memory Hook

Remember the simple chain:

```text
Right Angle
      ↓
cos(90°) = 0
      ↓
Dot Product = 0
      ↓
No Projection
      ↓
No Directional Similarity
```

---

### ✅ Scaler Coverage

| Scaler Content          | Status |
| ----------------------- | :----: |
| Right-angle example     |    ✅   |
| Dot product calculation |    ✅   |

### 🚀 Added by Our Notebook

| Additional Content                | Status |
| --------------------------------- | :----: |
| Geometric proof                   |    ✅   |
| Projection intuition              |    ✅   |
| Orthogonality theorem             |    ✅   |
| Machine Learning interpretation   |    ✅   |
| Interview edge case (zero vector) |    ✅   |
| Memory hook                       |    ✅   |

---

This completes **4.4 — Right Angle Example**.

The next section is **4.5 — Obtuse Angle Example**, where we'll discover why vectors pointing in opposite tendencies produce a **negative dot product**.

