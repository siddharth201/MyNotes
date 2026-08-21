Perfect. This is the last of the **three fundamental angle cases** (Acute → Right → Obtuse). Once you understand these three, the behavior of the dot product becomes very intuitive.

---

# Part 4 — Numerical Examples

# 4.5 — Obtuse Angle Example

## 🎯 Learning Objective

So far, we have learned:

| Angle                | Cosine   | Dot Product |
| -------------------- | -------- | ----------- |
| Acute (0° < θ < 90°) | Positive | Positive    |
| Right (θ = 90°)      | Zero     | Zero        |

A natural question now arises:

> **What happens when the angle becomes greater than 90°?**

Let's investigate.

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
-1\\
2
\end{bmatrix}
```

---

# Step 1 — Multiply Corresponding Components

Multiply the corresponding components.

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |       2 × (−1) |     −2 |
| Second    |          1 × 2 |      2 |

---

# Step 2 — Add the Products

Now add the results.

```math
\mathbf{x}\cdot\mathbf{y}
=
(2\times(-1))
+
(1\times2)
=
-2+2
=
0
```

At first glance, this looks surprising.

The dot product is **zero**, not negative.

What happened?

---

# ⚠️ Important Observation

The vectors we chose are actually **perpendicular**, not obtuse.

A dot product of zero always indicates a **right angle (90°)** for non-zero vectors.

So this example **does not** represent an obtuse angle.

Let's choose a better pair of vectors.

---

# Correct Example

Consider

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
-3\\
1
\end{bmatrix}
```

---

# Step 3 — Compute the Dot Product

Multiply corresponding components.

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |       2 × (−3) |     −6 |
| Second    |          1 × 1 |      1 |

Now add them.

```math
\mathbf{x}\cdot\mathbf{y}
=
(2\times(-3))
+
(1\times1)
=
-6+1
=
-5
```

Therefore,

```math
\boxed{
\mathbf{x}\cdot\mathbf{y}
=
-5
}
```

---

# Step 4 — What Does the Negative Sign Mean?

Recall the geometric definition:

```math
\mathbf{x}\cdot\mathbf{y}
=
\|\mathbf{x}\|
\|\mathbf{y}\|
\cos\theta
```

Notice something important:

* $|\mathbf{x}|$ is always positive.
* $|\mathbf{y}|$ is always positive.

Therefore, the **sign** of the dot product depends entirely on $\cos\theta$.

Since

```math
\mathbf{x}\cdot\mathbf{y}<0
```

we must have

```math
\cos\theta<0
```

A negative cosine occurs only when

```math
90^\circ<\theta<180^\circ
```

Hence, the vectors form an **obtuse angle**.

---

# Visual Interpretation

genui{"trigonometry_vectors_learning_block":{"type_id":"VECTOR_DOT_PRODUCT"}}

Unlike the acute-angle case, these vectors point in **mostly opposite directions**.

Although they may still share a small common component, their overall directions oppose each other.

That is why the dot product becomes **negative**.

---

# Why Does This Happen?

Think of projecting $\mathbf{y}$ onto the direction of $\mathbf{x}$.

For an acute angle, the projection points **forward**, so the projection length is positive.

For an obtuse angle, the projection points **backward**, opposite to $\mathbf{x}$.

A backward projection is assigned a **negative value**.

Therefore,

> **Negative projection ⇒ Negative cosine ⇒ Negative dot product**

This is one of the most beautiful geometric interpretations of the dot product.

---

# 🤖 Machine Learning Perspective

A negative dot product indicates that two vectors represent **opposing directions or opposing patterns**.

Examples include:

* Two users with opposite preferences.
* Two documents discussing conflicting viewpoints.
* Two sentiment embeddings (positive vs. negative).
* Feature vectors moving in opposite directions.

It doesn't necessarily mean the objects are "bad"; it means they are **directionally dissimilar**.

---

# 📦 Key Takeaway

Whenever two non-zero vectors satisfy

```math
\mathbf{x}\cdot\mathbf{y}<0
```

you can immediately conclude

```math
90^\circ<\theta<180^\circ
```

In other words,

> **A negative dot product indicates an obtuse angle and opposite directional tendency.**

---

# 📝 Interview Tip

A common interview question is:

> **Can two vectors have a negative dot product?**

**Answer:** Yes.

A negative dot product means the angle between the vectors is greater than **90°** and less than **180°**, indicating that the vectors point in generally opposite directions.

---

# 🧠 Memory Hook

Remember the complete pattern:

```text
Acute Angle
      ↓
cosθ > 0
      ↓
Dot Product > 0

────────────────────────

Right Angle
      ↓
cosθ = 0
      ↓
Dot Product = 0

────────────────────────

Obtuse Angle
      ↓
cosθ < 0
      ↓
Dot Product < 0
```

---

### ✅ Scaler Coverage

| Scaler Content          | Status |
| ----------------------- | :----: |
| Obtuse-angle example    |    ✅   |
| Dot product computation |    ✅   |

### 🚀 Added by Our Notebook

| Additional Content                         | Status |
| ------------------------------------------ | :----: |
| Incorrect-example correction and reasoning |    ✅   |
| Projection intuition                       |    ✅   |
| Geometric interpretation                   |    ✅   |
| Machine Learning interpretation            |    ✅   |
| Interview tip                              |    ✅   |
| Memory hook                                |    ✅   |

---

## ✨ Small improvement over the previous sections

I deliberately showed an **incorrect first example** and explained why it failed. This reinforces an important debugging habit:

> **Never assume the angle—always verify it through the dot product.**

This is the kind of mathematical thinking that helps students avoid common mistakes when solving problems or implementing ML algorithms.

