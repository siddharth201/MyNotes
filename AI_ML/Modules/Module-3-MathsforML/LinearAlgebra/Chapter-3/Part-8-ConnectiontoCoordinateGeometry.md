# Part 8 — Connection to Coordinate Geometry

So far, we have approached the equation of a line from the **linear algebra and vector perspective**.

Now we will connect it back to something you already know well:

> **The familiar coordinate-geometry equation of a straight line.**

This connection is important because it shows that the ML equation is **not a completely new concept**.

It is a more general and compact way of writing the same geometry.

---

# 8.1 The Familiar Equation of a Line

In coordinate geometry, a straight line is commonly written as:

```math id="p8-standard"
\boxed{
ax_1+bx_2+c=0
}
```

Here:

* `a` and `b` determine the orientation of the line.
* `c` determines its position.

Now compare this with the ML/vector form:

```math id="p8-vector"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

At first they look different.

But they are actually the **same equation written using vector notation**.

---

# 8.2 Expand the Vector Form

Suppose:

```math id="p8-w"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

and:

```math id="p8-x"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

The transpose of `\overrightarrow{w}` is:

```math id="p8-wt"
\overrightarrow{w}^{T}
=
\begin{bmatrix}
w_1 & w_2
\end{bmatrix}
```

Therefore:

```math id="p8-product"
\overrightarrow{w}^{T}\overrightarrow{x}
=
\begin{bmatrix}
w_1 & w_2
\end{bmatrix}
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

So:

```math id="p8-product-expanded"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
=
w_1x_1+w_2x_2
}
```

Adding the bias:

```math id="p8-expanded-equation"
\boxed{
w_1x_1+w_2x_2+w_0=0
}
```

Now compare this with:

```math id="p8-comparison"
ax_1+bx_2+c=0
```

They are identical in structure.

Therefore:

```math id="p8-mapping"
\boxed{
a=w_1,\qquad
b=w_2,\qquad
c=w_0
}
```

---

# 8.3 The Important Correspondence

We can therefore create a direct mapping:

| Coordinate Geometry | Linear Algebra / ML                              |
| ------------------- | ------------------------------------------------ |
| `a`                 | first component of $\overrightarrow{w}$          |
| `b`                 | second component of $\overrightarrow{w}$         |
| `c`                 | `w₀`                                             |
| `ax₁ + bx₂ + c = 0` | `\overrightarrow{w}ᵀ\overrightarrow{x} + w₀ = 0` |

So the ML notation is not replacing coordinate geometry.

It is **compressing and generalizing it**.

---

# 8.4 Where Does the Normal Vector Appear?

Consider the coordinate equation:

```math id="p8-normal-equation"
ax_1+bx_2+c=0
```

We already proved that the vector formed by the coefficients:

```math id="p8-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

is perpendicular to the line.

Therefore:

```math id="p8-normal-result"
\boxed{
\overrightarrow{w}
\perp\text{line}
}
```

This gives us an important interpretation of the coefficients.

> **The coefficients of the variables are not arbitrary numbers. Together, they form the normal vector of the line.**

This is one of the most useful facts to remember from this entire topic.

---

# 8.5 Finding the Direction Vector from the Equation

Suppose:

```math id="p8-line-example"
\boxed{
3x_1+4x_2-12=0
}
```

The normal vector is immediately:

```math id="p8-example-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

We want a vector perpendicular to it.

A convenient choice is:

```math id="p8-example-d"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
4\\
-3
\end{bmatrix}
}
```

Check the dot product:

```math id="p8-example-dot"
\overrightarrow{w}^{T}\overrightarrow{d}
=
\begin{bmatrix}
3 & 4
\end{bmatrix}
\begin{bmatrix}
4\\
-3
\end{bmatrix}
```

Therefore:

```math id="p8-example-dot2"
=12-12
```

So:

```math id="p8-example-dot3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Hence:

```math id="p8-example-perp"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since `\overrightarrow{d}` points along the line:

```math id="p8-example-final"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

---

# 8.6 Connection With Slope

Now let's connect this to the familiar concept of **slope**.

Start with:

```math id="p8-slope-start"
ax_1+bx_2+c=0
```

Assume `b ≠ 0`.

Rearrange:

```math id="p8-slope-rearrange"
bx_2=-ax_1-c
```

Divide by `b`:

```math id="p8-slope-form"
\boxed{
x_2=-\frac{a}{b}x_1-\frac{c}{b}
}
```

Compare this with:

```math id="p8-slope-standard"
x_2=mx_1+k
```

Therefore the slope is:

```math id="p8-slope-value"
\boxed{
m=-\frac{a}{b}
}
```

---

# 8.7 Direction Vector and Slope

We chose the direction vector:

```math id="p8-direction"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

The slope represented by this direction vector is:

```math id="p8-direction-slope"
\boxed{
\frac{-a}{b}
}
```

This is exactly the slope we obtained from the line equation:

```math id="p8-slope-again"
\boxed{
m=-\frac{a}{b}
}
```

So the direction vector correctly represents the direction of the line.

---

# 8.8 Why Are the Coefficients a and b So Special?

This is worth pausing on.

In:

```math id="p8-special"
ax_1+bx_2+c=0
```

there are three coefficients:

```text id="p8-three"
a
b
c
```

But they do not play the same role.

### a and b

Determine the **orientation**.

Together they form:

```math id="p8-ab-vector"
\boxed{
\begin{bmatrix}
a\\
b
\end{bmatrix}
}
```

which is the normal vector.

### c

Determines the **position** of the line.

Therefore:

> **a and b control direction/orientation; c controls location.**

This is exactly the same distinction we made earlier between:

* `\overrightarrow{w}`
* `w₀`

---

# 8.9 Changing c While Keeping a and b Fixed

Consider:

```math id="p8-c1"
x_1+2x_2+1=0
```

and:

```math id="p8-c2"
x_1+2x_2-5=0
```

For both lines:

```math id="p8-same-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
}
```

Only `c` changes.

Therefore both lines have the same orientation.

They are parallel.

This gives us another interpretation:

```text id="p8-c-change"
Change c
   ↓
Shift line
   ↓
Same orientation
   ↓
Parallel line
```

---

# 8.10 Changing a and b

Now consider:

```math id="p8-ab1"
x_1+2x_2+1=0
```

and:

```math id="p8-ab2"
2x_1+x_2+1=0
```

Their normal vectors are:

```math id="p8-ab1w"
\overrightarrow{w}_1
=
\begin{bmatrix}
1\\
2
\end{bmatrix}
```

and:

```math id="p8-ab2w"
\overrightarrow{w}_2
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

The normal directions are different.

Therefore the orientations of the lines are different.

So:

```text id="p8-ab-change"
Change a or b
      ↓
Change normal direction
      ↓
Change line orientation
```

---

# 8.11 Special Cases

There are two useful edge cases.

## Case 1 — Horizontal Line

Consider:

```math id="p8-horizontal"
x_2=3
```

Write it in standard form:

```math id="p8-horizontal-standard"
x_2-3=0
```

Therefore:

```math id="p8-horizontal-w"
\overrightarrow{w}
=
\begin{bmatrix}
0\\
1
\end{bmatrix}
```

The normal points vertically.

Therefore the line itself is horizontal.

---

## Case 2 — Vertical Line

Consider:

```math id="p8-vertical"
x_1=4
```

Write it as:

```math id="p8-vertical-standard"
x_1-4=0
```

Therefore:

```math id="p8-vertical-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

The normal points horizontally.

Therefore the line itself is vertical.

This is useful because the slope formula does not work directly for a vertical line, but the **normal-vector representation still works perfectly**.

That is one advantage of the vector form.

---

# 8.12 Coordinate Geometry Has a Limitation

The familiar slope form:

```math id="p8-slope-limit"
x_2=mx_1+k
```

works nicely for non-vertical lines.

But a vertical line cannot be represented using a finite slope.

For example:

```math id="p8-vertical-again"
x_1=4
```

has an undefined slope.

However, the vector form handles it naturally:

```math id="p8-vector-vertical"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

with:

```math id="p8-vector-vertical-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

This is one reason linear algebra provides a more powerful language for geometry.

---

# 8.13 The Deeper Unification

We can now view the same line through several lenses.

### Coordinate Geometry

```math id="p8-view1"
\boxed{
ax_1+bx_2+c=0
}
```

### Slope Form

```math id="p8-view2"
\boxed{
x_2=mx_1+k
}
```

### Vector Form

```math id="p8-view3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Geometric Interpretation

```math id="p8-view4"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

These are not competing formulas.

They are **different representations of the same geometric object**.

---

# 8.14 Why Machine Learning Prefers the Vector Form

Suppose we have only two features.

We can write:

```math id="p8-2d"
w_1x_1+w_2x_2+w_0=0
```

Easy enough.

But suppose we have 10 features:

```math id="p8-10d"
w_1x_1+w_2x_2+\cdots+w_{10}x_{10}+w_0=0
```

Or 1,000 features:

```math id="p8-1000d"
w_1x_1+w_2x_2+\cdots+w_{1000}x_{1000}+w_0=0
```

Writing and reasoning about this term by term becomes cumbersome.

Instead:

```math id="p8-vector-compact"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

works regardless of whether the feature space has:

* 2 dimensions
* 3 dimensions
* 100 dimensions
* 10,000 dimensions
* or much higher dimensionality

This is where the transition from **coordinate geometry to linear algebra** becomes genuinely useful for ML.

---

# 8.15 2D → 3D → Higher Dimensions

In 2D:

```math id="p8-2d-final"
\boxed{
w_1x_1+w_2x_2+w_0=0
}
```

represents a:

**line**

In 3D:

```math id="p8-3d-final"
\boxed{
w_1x_1+w_2x_2+w_3x_3+w_0=0
}
```

represents a:

**plane**

In d dimensions:

```math id="p8-d-final"
\boxed{
\sum_{i=1}^{d}w_ix_i+w_0=0
}
```

represents a:

**hyperplane**

The vector representation remains unchanged:

```math id="p8-general"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is one of the most important reasons linear algebra is the natural language of Machine Learning.

---

# 8.16 The Full Connection

We can now connect everything we have learned:

```text id="p8-full-chain"
Coordinate Geometry
        ↓
ax₁ + bx₂ + c = 0
        ↓
Coefficients (a, b)
        ↓
Normal vector
        ↓
w
        ↓
Vector equation
        ↓
wᵀx + w₀ = 0
        ↓
Line / Plane / Hyperplane
        ↓
ML Decision Boundary
```

This is the journey we have been building throughout this topic.

---

# 🧠 Mental Model

When you see:

```math id="p8-mental-equation"
\boxed{
ax_1+bx_2+c=0
}
```

don't think only:

> "This is the equation of a line."

Think:

```text id="p8-mental"
a, b
 ↓
normal direction

c
 ↓
position

a x₁ + b x₂ + c = 0
 ↓
line
```

And when you see:

```math id="p8-mental-ml"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

immediately think:

```text id="p8-mental-ml-chain"
w
 ↓
normal direction
 ↓
orientation

w₀
 ↓
position

x
 ↓
point being evaluated
```

---

# 🔑 Part 8 Summary

### Coordinate geometry

```math id="p8-summary1"
\boxed{
ax_1+bx_2+c=0
}
```

### Vector form

```math id="p8-summary2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Correspondence

```math id="p8-summary3"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
a\\
b
\end{bmatrix},
\qquad
w_0=c
}
```

### Direction vector

A convenient direction vector is:

```math id="p8-summary4"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
b\\
-a
\end{bmatrix}
}
```

### Perpendicularity

```math id="p8-summary5"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

### Geometric meaning

```math id="p8-summary6"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

### Generalization

**2D → line**

**3D → plane**

**d-D → hyperplane**

---

## Next — Part 9 — Machine Learning Perspective

Now that the coordinate-geometry connection is complete, we can make the ML interpretation explicit:

**line → decision boundary**

**w → normal direction**

**w₀ → bias / position**

**wᵀx + w₀ → model score**

and understand why this geometry is fundamental to **linear classification**, without jumping ahead into topics we haven't studied yet.

