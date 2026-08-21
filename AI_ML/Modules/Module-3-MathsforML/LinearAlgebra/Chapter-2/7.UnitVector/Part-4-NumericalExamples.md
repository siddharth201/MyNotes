Excellent. This part should be **calculation-heavy but not excessively long**. The purpose is to make the normalization process feel mechanical and intuitive. Similar to how we handled the **Angle Between Vectors** examples, we'll gradually increase the complexity.

---

# Part 4 — Numerical Examples

Now that we know the formula

```math id="uv1"
\boxed{
\hat{\mathbf{x}}
=
\frac{\mathbf{x}}{\|\mathbf{x}\|}
}
```

let's use it to convert actual vectors into unit vectors.

In every example, we will follow the same four-step process:

1. Find the magnitude.
2. Divide each component by the magnitude.
3. Obtain the unit vector.
4. Verify that its magnitude is exactly **1**.

---

# Example 1 — A Simple 2D Vector

Consider the vector

```math id="uv2"
\mathbf{x}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

---

## Step 1 — Find the Magnitude

Using the magnitude formula,

```math id="uv3"
\|\mathbf{x}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

---

## Step 2 — Divide Each Component by the Magnitude

Apply the normalization formula.

```math id="uv4"
\hat{\mathbf{x}}
=
\frac{\mathbf{x}}{\|\mathbf{x}\|}
=
\frac{1}{\sqrt{13}}
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

Multiplying the scalar into the vector,

```math id="uv5"
\boxed{
\hat{\mathbf{x}}
=
\begin{bmatrix}
\dfrac{2}{\sqrt{13}}\\[6pt]
\dfrac{3}{\sqrt{13}}
\end{bmatrix}
}
```

This is the unit vector corresponding to **x**.

---

## Step 3 — Verify the Magnitude

A unit vector must always have magnitude **1**.

Let's verify.

```math id="uv6"
\left\|
\hat{\mathbf{x}}
\right\|
=
\sqrt{
\left(
\frac{2}{\sqrt{13}}
\right)^2
+
\left(
\frac{3}{\sqrt{13}}
\right)^2
}
```

Simplify the fractions.

```math id="uv7"
=
\sqrt{
\frac{4}{13}
+
\frac{9}{13}
}
```

```math id="uv8"
=
\sqrt{
\frac{13}{13}
}
```

```math id="uv9"
=
\sqrt{1}
=
1
```

Hence,

```math id="uv10"
\boxed{
\left\|
\hat{\mathbf{x}}
\right\|
=
1
}
```

The normalization is correct.

---

# What Changed?

Let's compare the original vector and the normalized vector.

| Property  | Original Vector | Unit Vector |
| --------- | --------------: | ----------: |
| Magnitude |     (\sqrt{13}) |           1 |
| Direction |            Same |        Same |
| Length    |          Longer |   Exactly 1 |

Notice something very important.

The **numbers changed**, but the **direction did not**.

The vector still points toward the same location—it has simply been resized.

---

# Example 2 — A 3D Vector

Now consider a vector in three dimensions.

```math id="uv11"
\mathbf{x}
=
\begin{bmatrix}
1\\
2\\
2
\end{bmatrix}
```

---

## Step 1 — Compute the Magnitude

```math id="uv12"
\|\mathbf{x}\|
=
\sqrt{1^2+2^2+2^2}
=
\sqrt{9}
=
3
```

---

## Step 2 — Normalize the Vector

```math id="uv13"
\hat{\mathbf{x}}
=
\frac{1}{3}
\begin{bmatrix}
1\\
2\\
2
\end{bmatrix}
```

Therefore,

```math id="uv14"
\boxed{
\hat{\mathbf{x}}
=
\begin{bmatrix}
\dfrac13\\[6pt]
\dfrac23\\[6pt]
\dfrac23
\end{bmatrix}
}
```

---

## Step 3 — Verify

```math id="uv15"
\left\|
\hat{\mathbf{x}}
\right\|
=
\sqrt{
\left(\frac13\right)^2
+
\left(\frac23\right)^2
+
\left(\frac23\right)^2
}
```

```math id="uv16"
=
\sqrt{
\frac19
+
\frac49
+
\frac49
}
```

```math id="uv17"
=
\sqrt{
\frac99
}
=
1
```

Again,

```math id="uv18"
\boxed{
\left\|
\hat{\mathbf{x}}
\right\|
=
1
}
```

---

# Example 3 — Already a Unit Vector

Consider

```math id="uv19"
\mathbf{x}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

Magnitude:

```math id="uv20"
\|\mathbf{x}\|
=
1
```

Normalization gives

```math id="uv21"
\hat{\mathbf{x}}
=
\frac{\mathbf{x}}{1}
=
\mathbf{x}
```

Nothing changes.

This shows an important fact:

> **A unit vector remains unchanged after normalization.**

---

# Example 4 — A Fractional Vector

Consider

```math id="uv22"
\mathbf{x}
=
\begin{bmatrix}
0.6\\
0.8
\end{bmatrix}
```

Magnitude:

```math id="uv23"
\|\mathbf{x}\|
=
\sqrt{0.6^2+0.8^2}
=
\sqrt{0.36+0.64}
=
1
```

Therefore,

```math id="uv24"
\hat{\mathbf{x}}
=
\mathbf{x}
```

Again, the vector is already normalized.

---

# Common Pattern to Notice

Every normalization problem follows exactly the same algorithm.

```text
Original Vector
       │
       ▼
Compute Magnitude
       │
       ▼
Divide Every Component by the Magnitude
       │
       ▼
Obtain Unit Vector
       │
       ▼
Verify Magnitude = 1
```

Once you understand this workflow, you can normalize vectors of **any dimension**—2D, 3D, or even vectors with hundreds or thousands of components used in machine learning.

---

# Interview Tip

A common interview question is:

> **Does normalization change the direction of a vector?**

**Answer:**

* It changes the **magnitude**.
* It does **not** change the **direction** (except the zero vector cannot be normalized).

---

# Key Takeaways

* Normalization is a straightforward four-step process.
* The resulting vector always has magnitude **1**.
* The direction remains unchanged.
* The same procedure works for vectors in any number of dimensions.
* A vector that already has magnitude **1** remains unchanged after normalization.

---

## Coming Next

In **Part 5 — Geometry**, we'll answer a deeper question:

> **What does a unit vector actually represent geometrically?**

We'll see why **every unit vector lies on the unit circle (2D) or the unit sphere (3D)** and why normalization can be visualized as moving the tip of a vector onto these geometric shapes without changing its direction.

