# Part 12 — Revision + Interview Guide

We have now completed the entire **Perpendicular Distance between a Point and Plane** topic.

The purpose of this final part is to compress everything we learned into a structure that is easy to **revise, recall, explain in an interview, and implement in Python**.

---

# 12.1 The Core Problem

We started with a very simple geometric question:

> **Given a point and a plane, what is the shortest distance between them?**

The shortest path must be perpendicular to the plane.

Therefore, the problem becomes:

```text id="p12-core"
Point
  ↓
Shortest path to plane
  ↓
Perpendicular direction
  ↓
Normal vector
  ↓
Projection
  ↓
Distance
```

---

# 12.2 The Plane

A plane can be represented as:

```math id="p12-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

where:

* $\overrightarrow{x}$ represents a point on the plane.
* $\overrightarrow{w}$ is the normal vector.
* $w_0$ is the constant/bias term.

The most important geometric fact is:

```math id="p12-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

---

# 12.3 The Point

Suppose we have an external point:

```math id="p12-point"
\boxed{
\overrightarrow{x_2}
}
```

and choose a point on the plane:

```math id="p12-plane-point"
\boxed{
\overrightarrow{x_1}
}
```

The vector connecting them is:

```math id="p12-ab"
\boxed{
\overrightarrow{AB}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
}
```

---

# 12.4 The Key Geometric Idea

$\overrightarrow{AB}$ does not necessarily point perpendicular to the plane.

Therefore, we need only its component in the normal direction.

The normal direction is:

```math id="p12-normal-direction"
\boxed{
\overrightarrow{w}
}
```

So:

```text id="p12-projection"
AB
 ↓
Project onto w
 ↓
Normal component
 ↓
Perpendicular distance
```

This is the central idea of the entire topic.

---

# 12.5 Projection of $\overrightarrow{AB}$

The scalar projection of $\overrightarrow{AB}$ onto $\overrightarrow{w}$ is:

```math id="p12-projection-formula"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{AB}
}{
\|\overrightarrow{w}\|
}
}
```

Why?

Because:

```math id="p12-unit-normal"
\frac{\overrightarrow{w}}
{\|\overrightarrow{w}\|}
```

is the unit vector in the normal direction.

Therefore:

```math id="p12-projection-unit"
\overrightarrow{AB}^{T}
\frac{\overrightarrow{w}}
{\|\overrightarrow{w}\|}
```

gives the component of $\overrightarrow{AB}$ along the normal direction.

---

# 12.6 The Crucial Algebraic Step

We know:

```math id="p12-ab-expand"
\overrightarrow{AB}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
```

Therefore:

```math id="p12-substitute"
\frac{
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
}{
\|\overrightarrow{w}\|
}
```

Expand:

```math id="p12-expand"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}
-
\overrightarrow{w}^{T}\overrightarrow{x_1}
}{
\|\overrightarrow{w}\|
}
}
```

Now comes the key observation:

Since $\overrightarrow{x_1}$ lies on the plane:

```math id="p12-plane-condition"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

Therefore:

```math id="p12-x1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}
=
-w_0
}
```

Substituting:

```math id="p12-substitute2"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

This is the **signed perpendicular distance**.

---

# 12.7 Final Point-to-Plane Distance Formula

Ordinary distance cannot be negative.

Therefore:

```math id="p12-final"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

This is the most important formula of this chapter.

---

# 12.8 Formula in Familiar Coordinate Form

Suppose the plane is:

```math id="p12-coordinate-plane"
\boxed{
a_1x_1+a_2x_2+\cdots+a_dx_d+c=0
}
```

and the point is:

```math id="p12-coordinate-point"
\boxed{
(x_1,x_2,\ldots,x_d)
}
```

Then:

```math id="p12-coordinate-distance"
\boxed{
d=
\frac{
\left|
a_1x_1+a_2x_2+\cdots+a_dx_d+c
\right|
}{
\sqrt{
a_1^2+a_2^2+\cdots+a_d^2
}
}
}
```

The familiar coordinate formula is therefore simply the vector formula expanded component-by-component.

---

# 12.9 The Formula as a Story

Instead of memorizing:

```math id="p12-formula-memory"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

remember this story:

```text id="p12-story"
Put point into plane equation
             ↓
       wᵀx + w₀
             ↓
      signed quantity
             ↓
       divide by ||w||
             ↓
      actual scale
             ↓
       take | |
             ↓
    geometric distance
```

---

# 12.10 Why Each Part Exists

| Part                                           | Meaning                               |   |                          |
| ---------------------------------------------- | ------------------------------------- | - | ------------------------ |
| $\overrightarrow{w}^{T}\overrightarrow{x}$     | Dot product with the normal           |   |                          |
| $w_0$                                          | Bias/constant defining plane position |   |                          |
| $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ | Signed position relative to plane     |   |                          |
| $\left                                         | \cdot\right                           | $ | Removes side information |
| $|\overrightarrow{w}|$                         | Removes arbitrary scaling of normal   |   |                          |
| Final result                                   | Actual perpendicular distance         |   |                          |

This table is worth revisiting during revision.

---

# 12.11 Signed Distance vs Ordinary Distance

### Signed distance

```math id="p12-signed"
\boxed{
d_{\text{signed}}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

It tells us:

> **How far and on which side?**

### Ordinary distance

```math id="p12-ordinary"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

It tells us:

> **How far?**

### Mental shortcut

```text id="p12-sign-memory"
Sign
 ↓
Which side?

Absolute value
 ↓
How far?
```

---

# 12.12 Important Special Cases

## Case 1 — Point lies on plane

If:

```math id="p12-case1"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

then:

```math id="p12-case1-result"
\boxed{
d=0
}
```

---

## Case 2 — Point is away from plane

If:

```math id="p12-case2"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\neq0
```

then:

```math id="p12-case2-result"
\boxed{
d>0
}
```

---

## Case 3 — Reverse the normal

Replace:

```math id="p12-w"
\overrightarrow{w}
```

with:

```math id="p12-negative-w"
-\overrightarrow{w}
```

The signed distance changes sign, but the ordinary distance remains unchanged.

---

## Case 4 — Scale the plane equation

Multiply the complete plane equation by a non-zero constant.

The plane remains the same, and the calculated distance remains unchanged.

This confirms that the formula represents a **geometric quantity**, not an arbitrary algebraic value.

---

# 12.13 Why Normalization Is Necessary

Suppose:

```math id="p12-scale"
\overrightarrow{w}'
=
c\overrightarrow{w}
```

and:

```math id="p12-scale-w0"
w_0'=cw_0
```

Then:

```math id="p12-scaled-plane"
c\overrightarrow{w}^{T}\overrightarrow{x}
+
cw_0
=
0
```

represents the same plane.

Therefore the distance cannot depend on $c$.

Dividing by:

```math id="p12-norm"
\|\overrightarrow{w}\|
```

removes this arbitrary scaling.

This is a deeper reason for the denominator than simply:

> "That's what the formula says."

---

# 12.14 2D, 3D and Higher Dimensions

The same mathematics works everywhere.

### 2D

```text id="p12-2d"
Line
```

### 3D

```text id="p12-3d"
Plane
```

### Higher dimensions

```text id="p12-higher"
Hyperplane
```

The formula never changes:

```math id="p12-dimension-independent"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

Only the number of vector components changes.

---

# 12.15 Machine Learning Connection

A linear decision boundary can be written as:

```math id="p12-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Here:

```text id="p12-ml-w"
w
↓
ML weights
↓
Normal vector to boundary
```

and:

```text id="p12-ml-b"
w₀
↓
bias
↓
controls boundary position
```

For a data point $\overrightarrow{x}$:

```math id="p12-ml-score"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

gives its signed position relative to the boundary.

And:

```math id="p12-ml-distance"
\boxed{
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

gives its perpendicular distance from the boundary.

### The simplest ML interpretation:

> **Sign → which side of the boundary?**

> **Distance → how far from the boundary?**

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Imagine the model draws a wall separating two groups:

```text id="p12-wall"
Class A

 ●    ●
    ●

────────────────────────
      ML Boundary
────────────────────────

    ●
 ●       ●

Class B
```

For every new data point, we can ask:

> **Is it on the A side or B side?**

and:

> **How close is it to the boundary?**

The geometry we learned gives us the mathematical machinery to answer both questions.

That is why this topic matters for ML.

---

# 12.16 NumPy Implementation

The mathematical formula:

```math id="p12-numpy-math"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

becomes:

```python id="p12-numpy"
import numpy as np

def point_to_plane_distance(w, w0, x):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

Example:

```python id="p12-numpy-example"
w = np.array([2, 3, 6])
w0 = -12
x = np.array([1, 1, 1])

distance = point_to_plane_distance(w, w0, x)

print(distance)
```

Output:

```text id="p12-numpy-output"
0.14285714285714285
```

So:

```math id="p12-numpy-result"
\boxed{
d=\frac{1}{7}
}
```

---

# 12.17 Mathematics ↔ NumPy Cheat Sheet

| Mathematics                                | NumPy                                        |   |          |
| ------------------------------------------ | -------------------------------------------- | - | -------- |
| $\overrightarrow{w}^{T}\overrightarrow{x}$ | `np.dot(w, x)`                               |   |          |
| $|\overrightarrow{w}|$                     | `np.linalg.norm(w)`                          |   |          |
| $                                          | a                                            | $ | `abs(a)` |
| Distance                                   | `abs(np.dot(w, x) + w0) / np.linalg.norm(w)` |   |          |

This is a useful bridge between mathematical ML and implementation.

---

# 12.18 Common Mistakes

## Mistake 1 — Using $|\overrightarrow{x}|$

Wrong:

```math id="p12-mistake1"
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{x}\|
}
```

Correct:

```math id="p12-correct1"
\boxed{
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

The denominator uses the **normal vector**, not the point vector.

---

## Mistake 2 — Forgetting the absolute value

Without absolute value, we have signed distance rather than ordinary distance.

---

## Mistake 3 — Forgetting $w_0$

The complete plane equation is:

```math id="p12-mistake3"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

not merely:

```math id="p12-mistake3b"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

---

## Mistake 4 — Thinking $\overrightarrow{AB}$ is automatically perpendicular

It isn't.

Only its component along the normal is the perpendicular component.

---

## Mistake 5 — Using $\overrightarrow{w}$ without normalization

The raw dot product is not generally the geometric distance.

We need:

```math id="p12-mistake5"
\|\overrightarrow{w}\|
```

in the denominator.

---

## Mistake 6 — Confusing normal vector and point vector

```text id="p12-mistake6"
x → point/data vector

w → normal/weight vector
```

They play completely different roles.

---

# 12.19 Interview Questions

## Q1. What is the formula for distance between a point and a plane?

**Answer:**

For:

```math id="p12-i1-plane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

the distance of point $\overrightarrow{x}$ from the plane is:

```math id="p12-i1-answer"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

---

## Q2. Why do we divide by $|\overrightarrow{w}|$?

Because $\overrightarrow{w}$ can have arbitrary magnitude.

Only its direction matters for defining the normal.

Dividing by its magnitude effectively normalizes the normal vector and converts the result into actual geometric distance.

---

## Q3. Why do we take the absolute value?

Because the projection is signed, while ordinary geometric distance must be non-negative.

---

## Q4. What does the sign of the expression mean?

The sign of:

```math id="p12-i4"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

indicates which side of the plane the point lies on, relative to the chosen orientation of $\overrightarrow{w}$.

---

## Q5. What happens if the point lies on the plane?

Then:

```math id="p12-i5"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

and:

```math id="p12-i5-result"
\boxed{
d=0
}
```

---

## Q6. Why is $\overrightarrow{w}$ called a normal vector?

Because:

```math id="p12-i6"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

It points perpendicular to the plane.

---

## Q7. How is this related to Machine Learning?

A linear decision boundary can be represented as:

```math id="p12-i7"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

The weight vector $\overrightarrow{w}$ is normal to the boundary, and the point-to-plane distance gives the perpendicular distance of a data point from that boundary.

---

## Q8. What is the difference between signed distance and ordinary distance?

Signed distance:

```math id="p12-i8-signed"
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
```

contains side information.

Ordinary distance:

```math id="p12-i8-ordinary"
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

contains only magnitude.

---

## Q9. Why does multiplying the entire plane equation by a constant not change the distance?

Because both the numerator and denominator are multiplied by the same absolute scaling factor, which cancels.

---

## Q10. Can this formula work for a 100-dimensional feature space?

Yes.

The formula is dimension-independent:

```math id="p12-i10"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

This is one of the major advantages of vector notation.

---

# 12.20 Interview-Level Derivation

If an interviewer asks:

> **"Can you derive the point-to-plane distance formula?"**

A strong answer should proceed like this:

### Step 1

Choose a point $\overrightarrow{x_1}$ on the plane and let $\overrightarrow{x_2}$ be the external point.

```math id="p12-derive1"
\overrightarrow{AB}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
```

### Step 2

The normal vector is $\overrightarrow{w}$, so project $\overrightarrow{AB}$ onto $\overrightarrow{w}$:

```math id="p12-derive2"
\frac{
\overrightarrow{w}^{T}
\overrightarrow{AB}
}{
\|\overrightarrow{w}\|
}
```

### Step 3

Substitute $\overrightarrow{AB}$:

```math id="p12-derive3"
\frac{
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
}{
\|\overrightarrow{w}\|
}
```

### Step 4

Since $\overrightarrow{x_1}$ lies on the plane:

```math id="p12-derive4"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

Therefore:

```math id="p12-derive5"
\overrightarrow{w}^{T}\overrightarrow{x_1}
=
-w_0
```

### Step 5

Substitute:

```math id="p12-derive6"
\frac{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
}{
\|\overrightarrow{w}\|
}
```

### Step 6

Take magnitude:

```math id="p12-derive7"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

That is a complete mathematical derivation without memorizing the formula.

---

# 12.21 Interview Trap

An interviewer may ask:

> **"Why can't I simply use $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ as the distance?"**

A strong answer:

> Because that expression is scale-dependent. If we multiply the plane equation by a constant, the plane doesn't change, but the expression changes by that constant. Dividing by $|\overrightarrow{w}|$ removes this arbitrary scaling and gives the actual geometric distance.

That answer demonstrates **understanding**, rather than formula memorization.

---

# 12.22 Thinking Questions

These are more important than memorizing another five formulas.

### Think 1

If:

```math id="p12-think1"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

what can you immediately say about the point?

<details>
<summary>Answer</summary>

The point lies on the plane, so its perpendicular distance is zero.

</details>

---

### Think 2

If we replace $\overrightarrow{w}$ with $-\overrightarrow{w}$, what happens?

<details>
<summary>Answer</summary>

The signed distance changes sign, but the ordinary distance remains unchanged.

</details>

---

### Think 3

If we multiply the entire plane equation by $10$, what happens to the distance?

<details>
<summary>Answer</summary>

Nothing. The plane is unchanged and the scaling cancels between numerator and denominator.

</details>

---

### Think 4

Why is projection necessary?

<details>
<summary>Answer</summary>

Because an arbitrary vector from the plane to the point can contain components parallel and perpendicular to the plane. We need only the normal/perpendicular component.

</details>

---

# 12.23 The Complete Mental Model

This is the picture I want you to retain:

```text id="p12-complete-picture"
                         Point x
                            ●
                           /|
                          / |
                         /  |  ← perpendicular distance
                        /   |
                       /    |
                      ●-----+
                  point on plane
────────────────────────────────────
                PLANE
                  
                  ↑
                  |
                  |  w
                  |
             Normal direction
```

Now translate the picture into mathematics:

```text id="p12-picture-math"
Plane
 ↓
wᵀx + w₀ = 0

Normal
 ↓
w

Point-to-plane vector
 ↓
x₂ − x₁

Projection onto normal
 ↓
wᵀ(x₂ − x₁) / ||w||

Point lies on plane
 ↓
wᵀx₁ + w₀ = 0

Final distance
 ↓
|wᵀx₂ + w₀| / ||w||
```

---

# 🎯 Ultimate Goal in ML — Final Understanding

The entire topic can now be reduced to one simple ML story:

> **A linear ML model creates a boundary in feature space. The weight vector tells us the boundary's normal direction. For any data point, the sign tells us which side of the boundary it is on, while the normalized absolute score tells us how far the point is from that boundary.**

Mathematically:

```math id="p12-ultimate"
\boxed{
\text{Distance from boundary}
=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

---

# 🏆 Final Revision Sheet

If you have only **2 minutes before an interview or revision session**, remember this:

### Plane

```math id="p12-revision-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Normal

```math id="p12-revision-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

### Vector between points

```math id="p12-revision-vector"
\boxed{
\overrightarrow{AB}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
}
```

### Projection onto normal

```math id="p12-revision-projection"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{AB}
}{
\|\overrightarrow{w}\|
}
}
```

### Point on plane

```math id="p12-revision-plane-point"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}
=
-w_0
}
```

### Final distance

```math id="p12-revision-distance"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

### ML

```text id="p12-revision-ml"
Sign
 ↓
Which side?

Absolute normalized value
 ↓
How far from boundary?
```

### NumPy

```python id="p12-revision-code"
distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

---

# 🧠 Final One-Sentence Understanding

> **Point-to-plane distance is the magnitude of the projection of the point's displacement onto the plane's normal direction; in ML, the same geometry tells us how far a data point lies from a linear decision boundary.**

---

## ✅ Topic Complete

We have now completed:

```text id="p12-complete"
Part 1  → Why do we need perpendicular distance?
Part 2  → Geometric setup
Part 3  → Project onto the normal
Part 4  → Projection of AB onto w
Part 5  → Algebraic simplification
Part 6  → Final distance formula
Part 7  → Numerical examples
Part 8  → Why absolute value?
Part 9  → Geometric interpretation
Part 10 → Machine Learning perspective
Part 11 → Python / NumPy
Part 12 → Revision + Interview Guide
```

The important thing is that we didn't merely memorize the point-to-plane formula. We built it from the concepts we had already learned:

**Vector → Dot Product → Projection → Unit Vector → Normal Vector → Plane → Perpendicular Distance → Linear ML Boundary.**

