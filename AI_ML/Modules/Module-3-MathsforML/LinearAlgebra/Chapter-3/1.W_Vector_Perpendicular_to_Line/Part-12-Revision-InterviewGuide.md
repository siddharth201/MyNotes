# Part 12 — Revision + Interview Guide

We have now completed the full journey from **coordinate geometry → vectors → line equation → normal vector → perpendicularity → higher dimensions → Machine Learning**.

The goal of this final part is to compress the entire topic into a form that is useful for:

* revision,
* problem solving,
* interviews,
* and future ML topics.

---

# 12.1 The Core Idea

The central equation of this topic is:

```math id="p12-core"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

In 2D, this represents a **line**.

In 3D, it represents a **plane**.

In higher dimensions, it represents a **hyperplane**.

The most important geometric fact is:

```math id="p12-normal"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

So $`\overrightarrow{w}`$ is called the **normal vector**.

---

# 12.2 The Complete Journey

Our entire topic can be summarized as:

```text id="p12-journey"
Two Points
    ↓
Direction Vector
    ↓
Equation of Line
    ↓
ax₁ + bx₂ + c = 0
    ↓
Coefficient Vector
    ↓
w
    ↓
wᵀx + w₀ = 0
    ↓
w is Normal to the Line
    ↓
Decision Boundary in ML
    ↓
Hyperplane in Higher Dimensions
```

This is the conceptual journey you should remember.

---

# 12.3 Essential Definitions

## Point

A point in 2D can be represented using a position vector:

```math id="p12-point"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
}
```

---

## Direction Vector

If two points lie on a line:

```math id="p12-direction"
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
}
```

This vector points **along the line**.

---

## Normal Vector

A vector perpendicular to a line or plane is called a normal vector.

For our linear boundary:

```math id="p12-normal2"
\boxed{
\overrightarrow{w}
=
\text{normal vector}
}
```

---

## Bias

The scalar:

```math id="p12-bias"
\boxed{
w_0
}
```

controls the **position** of the boundary.

---

# 12.4 The Most Important Equation

Memorize the structure:

```math id="p12-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

But don't memorize it blindly.

Understand the roles:

```text id="p12-roles"
w
↓
orientation

w₀
↓
position

x
↓
point being evaluated

= 0
↓
point lies on boundary
```

---

# 12.5 Coordinate Geometry ↔ Linear Algebra

The familiar equation:

```math id="p12-coordinate"
\boxed{
ax_1+bx_2+c=0
}
```

can be written as:

```math id="p12-vector"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

with:

```math id="p12-mapping"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

and:

```math id="p12-mapping2"
\boxed{
w_0=c
}
```

Therefore:

> **The coefficients of the variables form the normal vector.**

---

# 12.6 The Main Proof — In One Minute

This is the proof you should be able to reproduce without looking at your notes.

Suppose two points $`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$ lie on:

```math id="p12-proof1"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Therefore:

```math id="p12-proof2"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

and:

```math id="p12-proof3"
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
```

Subtract:

```math id="p12-proof4"
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}-\overrightarrow{x_1}
\right)
=0
```

But:

```math id="p12-proof5"
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
```

Therefore:

```math id="p12-proof6"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Zero dot product means perpendicularity:

```math id="p12-proof7"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since `d` lies along the line:

```math id="p12-proof8"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

### This is the proof.

---

# 12.7 Why Does `w₀` Not Affect Orientation?

This is a common conceptual question.

We have:

```math id="p12-bias-proof1"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

and:

```math id="p12-bias-proof2"
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
```

Subtracting gives:

```math id="p12-bias-proof3"
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
=0
```

The $`w_0`$ disappears.

Therefore:

> **`w` determines orientation; `w₀` determines position.**

---

# 12.8 Direction Vector vs Normal Vector

This distinction is extremely important.

| Direction Vector                  | Normal Vector                     |
| --------------------------------- | --------------------------------- |
| Lies along the line               | Perpendicular to the line         |
| Describes movement along boundary | Describes orientation of boundary |
| `d`                               | `w`                               |
| Direction                         | Normal                            |
| `wᵀd = 0`                         | —                                 |

The fundamental relationship is:

```math id="p12-direction-normal"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

---

# 12.9 Dot Product Connection

Recall:

```math id="p12-dot"
\boxed{
\overrightarrow{a}^{T}\overrightarrow{b}
=
\|\overrightarrow{a}\|
\|\overrightarrow{b}\|
\cos\theta
}
```

Therefore:

```math id="p12-dot-zero"
\overrightarrow{w}^{T}\overrightarrow{d}=0
```

implies:

```math id="p12-cos"
\cos\theta=0
```

and hence:

```math id="p12-angle"
\boxed{
\theta=90^\circ
}
```

Therefore:

```math id="p12-perpendicular"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

This connects the current topic directly to our earlier study of **dot product and angles**.

---

# 12.10 Slope Connection

For:

```math id="p12-slope-equation"
ax_1+bx_2+c=0
```

assuming `b ≠ 0`:

```math id="p12-slope-form"
x_2=-\frac{a}{b}x_1-\frac{c}{b}
```

Therefore:

```math id="p12-slope-value"
\boxed{
m=-\frac{a}{b}
}
```

The normal vector is:

```math id="p12-slope-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

A direction vector can be:

```math id="p12-slope-direction"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

and:

```math id="p12-slope-check"
\overrightarrow{w}^{T}\overrightarrow{d}
=
ab-ab
=
0
```

So the slope-based and vector-based approaches agree.

---

# 12.11 Why Vector Form Is Better for ML

Coordinate geometry often focuses on:

```math id="p12-slope-form2"
x_2=mx_1+c
```

But Machine Learning may have hundreds or thousands of features.

Instead of writing:

```math id="p12-many-features"
w_1x_1+w_2x_2+\cdots+w_dx_d+w_0=0
```

we use:

```math id="p12-compact"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This notation works regardless of the number of dimensions.

That is one of the reasons **linear algebra is the natural language of Machine Learning**.

---

# 12.12 Higher-Dimensional Interpretation

The same equation describes:

```text id="p12-dimensions"
2D → line

3D → plane

d-D → hyperplane
```

In every case:

```math id="p12-general"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and:

```math id="p12-general-normal"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

The geometry remains valid even when we cannot visualize the space.

---

# 12.13 Machine Learning Interpretation

For a linear classifier:

```math id="p12-ml"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The decision boundary occurs at:

```math id="p12-boundary"
\boxed{
f(\overrightarrow{x})=0
}
```

Therefore:

```math id="p12-boundary2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Interpretation:

```text id="p12-ml-interpretation"
w
↓
normal direction
↓
orientation of boundary

w₀
↓
position of boundary

x
↓
data point

wᵀx + w₀
↓
linear score
```

---

# 12.14 What Happens on Either Side?

For:

```math id="p12-score"
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

we have:

```text id="p12-sides"
f(x) > 0
    ↓
one side

f(x) = 0
    ↓
boundary

f(x) < 0
    ↓
other side
```

The actual class labels depend on the model.

The important geometric fact is that the sign tells us which side of the boundary the point occupies.

---

# 12.15 Python Cheat Sheet

### Create vectors

```python id="p12-python-vector"
import numpy as np

w = np.array([2, 3])
x = np.array([4, 1])
```

### Dot product

```python id="p12-python-dot"
w @ x
```

### Linear score

```python id="p12-python-score"
w @ x + w0
```

### Direction vector

```python id="p12-python-direction"
d = x2 - x1
```

### Check perpendicularity

```python id="p12-python-perp"
w @ d
```

If the result is zero:

```text id="p12-python-zero"
w ⟂ d
```

---

# 12.16 Interview Questions

Now let's convert the topic into interview-style questions.

---

## Q1. What is the equation of a linear boundary?

**Answer:**

```math id="p12-iq1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

In 2D it represents a line; in 3D a plane; in higher dimensions a hyperplane.

---

## Q2. What is the geometric meaning of `w`?

**Answer:**

$`\overrightarrow{w}`$ is the **normal vector** to the line, plane, or hyperplane.

Therefore:

```math id="p12-iq2"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

---

## Q3. Why is `w` perpendicular to the line?

**Answer:**

Take two points $`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$ on the line:

```math id="p12-iq3a"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

```math id="p12-iq3b"
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
```

Subtracting gives:

```math id="p12-iq3c"
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
=0
```

Since `x₂ − x₁` is a direction vector of the line:

```math id="p12-iq3d"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore `w` is perpendicular to the line.

---

## Q4. What is the role of `w₀`?

**Answer:**

$`w_0`$ controls the **position** of the boundary.

It shifts the boundary without changing its orientation, assuming `w` remains fixed.

---

## Q5. What happens if we multiply the entire equation by a constant?

Suppose:

```math id="p12-iq5a"
x_1+x_2+2=0
```

Multiply by 3:

```math id="p12-iq5b"
3x_1+3x_2+6=0
```

The geometric boundary remains the same.

The normal vector changes from:

```math id="p12-iq5c"
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

to:

```math id="p12-iq5d"
\begin{bmatrix}
3\\
3
\end{bmatrix}
```

but the direction is unchanged.

Therefore:

> **The normal vector is not unique in magnitude; its direction matters.**

---

## Q6. How do you find a direction vector from `ax + by + c = 0`?

A convenient choice is:

```math id="p12-iq6"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

because:

```math id="p12-iq6check"
\begin{bmatrix}
a & b
\end{bmatrix}
\begin{bmatrix}
b\\
-a
\end{bmatrix}
=
ab-ab=0
```

---

## Q7. What is the difference between a direction vector and a normal vector?

**Answer:**

A direction vector lies **along** the line.

A normal vector is **perpendicular** to the line.

Their dot product is zero.

---

## Q8. What does `wᵀx` represent?

**Answer:**

It is the dot product:

```math id="p12-iq8"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

and produces a **scalar**.

---

## Q9. What happens when `wᵀx + w₀ = 0`?

**Answer:**

The point `x` lies on the linear boundary.

---

## Q10. What happens when it is positive or negative?

**Answer:**

The point lies on one of the two sides of the boundary.

```text id="p12-iq10"
> 0 → one side

= 0 → boundary

< 0 → other side
```

---

# 12.17 Interview Trap — Is `w` the Direction of the Line?

**No.**

This is one of the most important traps.

$`\overrightarrow{w}`$ is **not** generally the direction of the line.

It is the **normal direction**.

If:

```math id="p12-trap"
\overrightarrow{d}
```

is the direction of the line, then:

```math id="p12-trap2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

So:

```text id="p12-trap3"
d → along the line

w → perpendicular to the line
```

---

# 12.18 Interview Trap — Does `w₀` Affect the Direction?

**No.**

Changing `w₀` shifts the boundary.

Changing `w` changes its orientation.

---

# 12.19 Interview Trap — Is the Normal Vector Unique?

Not in magnitude.

If:

```math id="p12-normal1"
\overrightarrow{w}
```

is a normal vector, then:

```math id="p12-normal2"
k\overrightarrow{w}
```

is also a normal vector for any non-zero scalar `k`.

The direction is what matters.

---

# 12.20 Interview Trap — Does the Proof Depend on 2D?

**No.**

The proof:

```math id="p12-proof-general"
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
=0
```

works in arbitrary dimensions.

Therefore the same reasoning applies to:

* lines,
* planes,
* hyperplanes.

This is an important sign that you understand the **linear-algebra principle**, rather than merely remembering a 2D geometry rule.

---

# 12.21 Quick Self-Test

Try answering these without looking above.

### Question 1

Given:

```math id="p12-test1"
3x_1+4x_2-8=0
```

What is the normal vector?

**Answer:**

```math id="p12-test1a"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

---

### Question 2

Give one possible direction vector.

**Answer:**

```math id="p12-test2"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
4\\
-3
\end{bmatrix}
}
```

---

### Question 3

Verify perpendicularity.

```math id="p12-test3"
\overrightarrow{w}^{T}\overrightarrow{d}
=
3(4)+4(-3)
=
12-12
=
0
```

Therefore:

```math id="p12-test3b"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

---

### Question 4

What happens if we change:

```math id="p12-test4"
-8
```

to:

```math id="p12-test4b"
20
```

while keeping `3` and `4` unchanged?

**Answer:**

The line moves, but its orientation remains unchanged.

---

### Question 5

If:

```math id="p12-test5"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=5
```

is the point on the boundary?

**Answer:**

No.

The boundary is defined by:

```math id="p12-test5b"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

---

# 12.22 Final Cheat Sheet

```text id="p12-cheat-sheet"
LINE / HYPERPLANE
────────────────────────────────────────

Equation:

wᵀx + w₀ = 0


x:
Point / feature vector


w:
Normal / weight vector


w₀:
Bias / position term


Direction vector:

d = x₂ − x₁


Perpendicularity:

wᵀd = 0


Therefore:

w ⟂ boundary


Coordinate geometry:

ax₁ + bx₂ + c = 0


Normal:

w = [a, b]ᵀ


Direction:

d = [b, −a]ᵀ


Slope:

m = −a/b


Dimensions:

2D → line
3D → plane
d-D → hyperplane


ML:

wᵀx + w₀ = 0
        ↓
Decision Boundary
```

---

# 🎯 The One-Minute Revision

If you revisit this topic after a few weeks, remember this chain:

```text
Two points
    ↓
Their difference gives direction
    ↓
Direction lies along the line
    ↓
Every point on the line satisfies
wᵀx + w₀ = 0
    ↓
Subtract two such equations
    ↓
wᵀ(x₂ − x₁) = 0
    ↓
wᵀd = 0
    ↓
w ⟂ d
    ↓
w ⟂ line
```

Then make the ML connection:

```text
Line
 ↓
Decision Boundary

w
 ↓
Normal / orientation

w₀
 ↓
Position / bias

wᵀx + w₀
 ↓
Linear score
```

And finally generalize:

```text
2D → Line
3D → Plane
d-D → Hyperplane
```

### The deepest takeaway

> **The vector $`\overrightarrow{w}`$ is perpendicular to the linear boundary because every point on that boundary gives the same value of zero, and therefore the difference between any two points on the boundary must have zero dot product with $`\overrightarrow{w}`$.**

That is the idea worth carrying forward into the rest of Machine Learning.

