# Part 9 — Revision + Interview Guide

We have now completed the full concept:

> **Perpendicular Distance of Origin from a Plane**

The goal of this final part is not to introduce new mathematics. It is to make the entire topic **retrievable from memory**, connect all the pieces, and prepare you for the kind of questions that can appear in ML interviews.

---

# 9.1 The Entire Topic in One Flow

Our journey was:

```text
Origin
   ↓
x = 0
   ↓
General point-to-plane distance
   ↓
Substitute x = 0
   ↓
wᵀ0 = 0
   ↓
Only w₀ remains
   ↓
Normalize by ||w||
   ↓
Origin-to-plane distance
   ↓
Geometric interpretation
   ↓
ML decision boundary
```

The final formula is:

```math id="r1"
\boxed{
d_{\text{origin}}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 9.2 Start From the Plane Equation

Our plane/hyperplane is:

```math id="r2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Where:

```text
x
↓
point / feature vector

w
↓
normal vector

w₀
↓
constant / bias
```

In ML terminology:

```text
x
↓
features of a data point

w
↓
learned weight vector

w₀
↓
bias
```

---

# 9.3 The General Point-to-Plane Distance

For any point $\overrightarrow{x}$:

```math id="r3"
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

This formula came from the idea:

```text
Point
  ↓
vector to plane
  ↓
projection onto normal
  ↓
perpendicular component
  ↓
shortest distance
```

---

# 9.4 Why Does the Origin Make It Simple?

For the origin:

```math id="r4"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

Substitute:

```math id="r5"
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

Since:

```math id="r6"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

we get:

```math id="r7"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

That's the complete derivation.

---

# 9.5 The Most Important Geometric Interpretation

Think of the plane as a **wall**.

```text
                    w
                    ↑
                    │
                    │
                    │
────────────────────┼────────────────
                 PLANE
```

$\overrightarrow{w}$ points straight out of the wall.

Therefore:

```text
w
↓
normal direction
↓
perpendicular direction
↓
shortest-distance direction
```

So when we calculate the origin-to-plane distance, we are asking:

> **How far do I need to travel from the origin in the normal direction before I reach the plane?**

---

# 9.6 Why Do We Divide by $|\overrightarrow{w}|$?

This is one of the most important conceptual points.

The equation:

```math id="r8"
3x+4y-12=0
```

and:

```math id="r9"
6x+8y-24=0
```

describe the **same line**.

But the coefficients have doubled.

Therefore, $|w_0|$ by itself cannot represent distance.

We need to remove the arbitrary scaling:

```math id="r10"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

This ratio stays unchanged when the entire equation is multiplied by a non-zero constant.

### Mental model

> **$|\overrightarrow{w}|$ removes the arbitrary scale of the normal vector.**

---

# 9.7 What Does $w_0$ Tell Us?

At the origin:

```math id="r11"
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
=
w_0
```

So $w_0$ is the value of the plane equation at the origin.

Therefore:

### If:

```math id="r12"
\boxed{
w_0=0
}
```

the origin lies on the plane.

Hence:

```math id="r13"
\boxed{
d=0
}
```

### If:

```math id="r14"
\boxed{
w_0\neq0
}
```

the origin is not on the plane.

Therefore:

```math id="r15"
\boxed{
d>0
}
```

---

# 9.8 The Role of $\overrightarrow{w}$ vs $w_0$

This is an excellent mental model for the plane equation:

```text
             w
             ↓
        Orientation
             +
            w₀
             ↓
          Position
```

More precisely:

> **The direction of $\overrightarrow{w}$ determines the orientation of the plane, while $w_0$ affects where that plane is positioned.**

If we change $\overrightarrow{w}$:

```text
orientation changes
```

If we change $w_0$ while keeping $\overrightarrow{w}$ fixed:

```text
parallel plane shifts
```

---

# 9.9 The Most Important ML Connection

Now replace:

```text
Plane
```

with:

```text
Linear Decision Boundary
```

The equation becomes:

```math id="r16"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Think:

```text
Feature Space
      ↓
Data points
      ↓
Linear boundary
      ↓
Two regions / classes
```

The weight vector:

```math id="r17"
\overrightarrow{w}
```

is perpendicular to the decision boundary.

The bias:

```math id="r18"
w_0
```

helps position the boundary.

---

# 9.10 ML Score vs Geometric Distance

For a data point $\overrightarrow{x}$, define:

```math id="r19"
\boxed{
s=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

This is the **linear score**.

Its sign tells us which side of the boundary we're on:

```text
s > 0
↓
one side

s = 0
↓
on boundary

s < 0
↓
other side
```

But the raw score is **not necessarily the geometric distance**.

The geometric distance is:

```math id="r20"
\boxed{
d=
\frac{|s|}
{\|\overrightarrow{w}\|}
}
```

or:

```math id="r21"
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

This is a very important ML connection.

---

# 9.11 Origin as a Special ML Point

For the origin:

```math id="r22"
\overrightarrow{x}=\overrightarrow{0}
```

Therefore:

```math id="r23"
s=w_0
```

and:

```math id="r24"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So we can say:

> **The normalized bias tells us the perpendicular distance of the decision boundary from the origin.**

---

# 9.12 Numerical Example — Complete Revision

Given:

```math id="r25"
\boxed{
3x+4y-12=0
}
```

Identify:

```math id="r26"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

and:

```math id="r27"
w_0=-12
```

Magnitude:

```math id="r28"
\|\overrightarrow{w}\|
=
\sqrt{3^2+4^2}
=
5
```

Distance:

```math id="r29"
d=
\frac{|-12|}{5}
```

Therefore:

```math id="r30"
\boxed{
d=2.4
}
```

---

# 9.13 Common Mistakes

## Mistake 1 — Saying $|w_0|$ is the distance

❌ Incorrect:

```math id="r31"
d=|w_0|
```

✅ Correct:

```math id="r32"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

## Mistake 2 — Forgetting the normal vector

The coefficients of $x_1,x_2,\ldots,x_n$ form the normal vector:

```math id="r33"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_n
\end{bmatrix}
}
```

---

## Mistake 3 — Thinking any vector from origin to plane is the shortest distance

Not true.

The shortest path must be:

```text
perpendicular
     ↓
normal direction
```

---

## Mistake 4 — Thinking different-looking equations necessarily mean different planes

For example:

```math id="r34"
3x+4y-12=0
```

and:

```math id="r35"
6x+8y-24=0
```

represent the same line.

One is simply a scaled version of the other.

---

## Mistake 5 — Thinking perpendicular means "completely unrelated"

Perpendicularity means:

```math id="r36"
\boxed{
\overrightarrow{a}^{T}\overrightarrow{b}=0
}
```

It is a geometric relationship between directions.

It does **not automatically mean**:

> "These represent completely different or unrelated features."

---

## Mistake 6 — Thinking the origin is a different kind of point

The origin is simply:

```math id="r37"
\boxed{
(0,0,\ldots,0)
}
```

It is special because all coordinates are zero.

---

# 9.14 Interview Question 1

### Q: What is the distance of the origin from the hyperplane?

```math id="r38"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

### Answer

At the origin:

```math id="r39"
\overrightarrow{x}=\overrightarrow{0}
```

Therefore:

```math id="r40"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

So:

```math id="r41"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 9.15 Interview Question 2

### Q: Why can't $|w_0|$ alone represent the distance?

Because the entire hyperplane equation can be multiplied by any non-zero constant without changing the hyperplane.

For example:

```math id="r42"
3x+4y-12=0
```

and:

```math id="r43"
30x+40y-120=0
```

represent the same line.

Therefore $w_0$ changes even though the geometry doesn't.

Dividing by:

```math id="r44"
\|\overrightarrow{w}\|
```

removes this arbitrary scaling.

---

# 9.16 Interview Question 3

### Q: What happens if $w_0=0$?

The hyperplane becomes:

```math id="r45"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

The origin satisfies this equation.

Therefore:

```math id="r46"
\boxed{
\text{The hyperplane passes through the origin.}
}
```

And the distance is:

```math id="r47"
\boxed{
0
}
```

---

# 9.17 Interview Question 4

### Q: What is the role of the weight vector in a linear classifier?

A strong answer:

> **The weight vector is normal to the linear decision boundary. Its direction determines the orientation of the boundary, while its components determine how the individual features contribute to the linear score.**

Mathematically:

```math id="r48"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

---

# 9.18 Interview Question 5

### Q: What is the role of the bias?

A good answer:

> **The bias shifts the position of the decision boundary without changing its normal direction when the weight vector is kept fixed.**

The boundary is:

```math id="r49"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

---

# 9.19 Interview Question 6

### Q: What is the difference between score and distance?

The score is:

```math id="r50"
\boxed{
s=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

It tells us the algebraic position relative to the boundary.

The normalized signed distance is:

```math id="r51"
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

The ordinary distance is:

```math id="r52"
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

# 9.20 Interview Question 7

### Q: Why does the normal vector determine the shortest distance?

Because the shortest distance between a point and a plane is always measured along a direction perpendicular to the plane.

Since:

```math id="r53"
\overrightarrow{w}\perp\text{plane}
```

$\overrightarrow{w}$ provides exactly that direction.

---

# 9.21 Interview Question 8

### Q: How would you implement the distance in NumPy?

```python id="r54"
import numpy as np

def point_to_plane_distance(w, w0, x):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

For the origin:

```python id="r55"
x = np.zeros(len(w))
```

or simply:

```python id="r56"
x = np.zeros_like(w)
```

Then:

```python id="r57"
distance = point_to_plane_distance(w, w0, x)
```

---

# 9.22 Interview Question 9 — Deeper

### Q: Why is the distance formula invariant to scaling of the hyperplane equation?

Suppose we multiply the equation by $k$:

```math id="r58"
k\overrightarrow{w}^{T}\overrightarrow{x}+kw_0=0
```

The new parameters are:

```math id="r59"
\overrightarrow{w}'=k\overrightarrow{w}
```

and:

```math id="r60"
w_0'=kw_0
```

Then:

```math id="r61"
\frac{|w_0'|}
{\|\overrightarrow{w}'\|}
=
\frac{|kw_0|}
{|k|\|\overrightarrow{w}\|}
```

Therefore:

```math id="r62"
\boxed{
\frac{|w_0'|}
{\|\overrightarrow{w}'\|}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So the geometric distance does not depend on how we scale the equation.

---

# 9.23 Interview Question 10 — ML Connection

### Q: How is point-to-hyperplane distance related to a linear classifier?

A linear classifier produces:

```math id="r63"
s=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

The decision boundary is:

```math id="r64"
s=0
```

The perpendicular distance from the point to the boundary is:

```math id="r65"
\boxed{
\frac{|s|}
{\|\overrightarrow{w}\|}
}
```

Therefore:

> **The normalized linear score is the geometric distance from the decision boundary.**

This becomes particularly important when we later study **margin-based classification and SVMs**.

---

# 9.24 The Ultimate Concept Map

Keep this map in your notebook:

```text id="r66"
                 VECTOR
                    │
                    ↓
             Feature Vector x
                    │
                    ↓
             Weight Vector w
                    │
                    ↓
              Dot Product
                    │
                    ↓
             wᵀx + w₀
                    │
                    ↓
           Linear Boundary
                    │
                    ↓
          w ⟂ Boundary
                    │
                    ↓
             Normal Direction
                    │
                    ↓
               Projection
                    │
                    ↓
          Perpendicular Distance
                    │
                    ↓
     ┌─────────────────────────────┐
     │                             │
     ↓                             ↓
General Point                  Origin
     │                             │
     ↓                             ↓
|wᵀx+w₀| / ||w||              |w₀| / ||w||
     │                             │
     └──────────────┬──────────────┘
                    ↓
            ML Geometry
```

---

# 9.25 The "Layman Translation" of the Whole Topic

If someone asks you:

> **"What did you learn in this topic?"**

Don't start with the formula.

Say:

> **Imagine ML creates a wall that separates two groups of data. The wall is the decision boundary. The weight vector points straight out of that wall. The origin is our reference point. We can ask how far that reference point is from the wall. Because the shortest path to a wall is perpendicular to it, we measure along the normal direction. For the origin, the distance simplifies to $|w_0|/|\overrightarrow{w}|$.**

That is the conceptual answer.

---

# 9.26 The "Technical Translation"

If an interviewer wants the mathematical answer:

> For the hyperplane
>
> ```math
> \boxed{
> \overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
> }
> ```
>
> the perpendicular distance of a point $\overrightarrow{x}$ from the hyperplane is
>
> ```math
> \boxed{
> d=
> \frac{
> |\overrightarrow{w}^{T}\overrightarrow{x}+w_0|
> }{
> \|\overrightarrow{w}\|
> }
> }
> ```
>
> For the origin, $\overrightarrow{x}=\overrightarrow{0}$, so $\overrightarrow{w}^{T}\overrightarrow{0}=0$. Therefore:
>
> ```math
> \boxed{
> d=
> \frac{|w_0|}
> {\|\overrightarrow{w}\|}
> }
> ```

That is the mathematically complete answer.

---

# 🎯 Ultimate Goal — ML in One Picture

This is the picture I want you to remember:

```text id="r67"
                    w
                    ↑
                    │
                    │
                    │
      Class A      │
         ●         │
                    │
────────────────────┼──────────────────
             Decision Boundary
────────────────────┼──────────────────
                    │
                    │
        ●           │
      Class B       │
                    │
                  Origin ●
```

The model creates a boundary.

```text
w
↓
perpendicular direction
```

A point can be described by:

```text
which side?
+
how far?
```

And mathematically:

```math id="r68"
\boxed{
\text{score}
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

```math id="r69"
\boxed{
\text{distance}
=
\frac{
|\text{score}|
}{
\|\overrightarrow{w}\|
}
}
```

For the origin:

```math id="r70"
\boxed{
\text{distance}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 🧠 Final Mental Model

Don't memorize ten separate facts.

Remember this chain:

```text
Data point
   ↓
Feature vector x
   ↓
Linear score
wᵀx + w₀
   ↓
Zero score = boundary
   ↓
w is perpendicular to boundary
   ↓
Perpendicular path = shortest distance
   ↓
Normalize by ||w||
   ↓
Geometric distance
```

And for the origin:

```text
x = 0
 ↓
wᵀx = 0
 ↓
score = w₀
 ↓
distance = |w₀| / ||w||
```

---

# 📌 Super Revision Card

### Plane / Decision Boundary

```math id="r71"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Normal vector

```math id="r72"
\boxed{
\overrightarrow{w}
}
```

### General point-to-plane distance

```math id="r73"
\boxed{
d=
\frac{
|\overrightarrow{w}^{T}\overrightarrow{x}+w_0|
}{
\|\overrightarrow{w}\|
}
}
```

### Origin

```math id="r74"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

### Origin-to-plane distance

```math id="r75"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

### Origin lies on plane

```math id="r76"
\boxed{
w_0=0
}
```

### ML interpretation

```text
x  → feature vector
w  → normal / weight vector
w₀ → bias
wᵀx+w₀ → linear score
sign → side of boundary
|score|/||w|| → perpendicular distance
```

---

# ✅ Topic Completed

We have now completed the entire **Perpendicular Distance of Origin from a Plane** topic:

```text
Part 1 — Why Do We Need Distance of Origin from a Plane
Part 2 — The Origin as a Special Point
Part 3 — Deriving the Origin-to-Plane Distance
Part 4 — Why Does the Formula Become So Simple?
Part 5 — Numerical Examples
Part 6 — Geometric Interpretation
Part 7 — Machine Learning Perspective
Part 8 — Python / NumPy
Part 9 — Revision + Interview Guide
```

### The next topic in our approved sequence is:

# **Half Space**

And this is a very natural next step.

We have just learned:

> **Where is the boundary, and how far is the origin from it?**

Now we move to:

> **What does the boundary divide the space into, and how do we determine which side a point belongs to?**

That takes us directly into **Half Space**.

