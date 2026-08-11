# Part 10 — Higher Dimensions

So far, we have worked primarily with **2D geometry**, where:

* a point is represented by two coordinates,
* a line is the boundary,
* a direction vector lies along the line,
* and the normal vector $`\overrightarrow{w}`$ is perpendicular to it.

Now we generalize the exact same idea to higher dimensions.

The key insight is:

> **The mathematics does not fundamentally change when the number of dimensions increases. Only our ability to visualize it changes.**

---

# 10.1 From 2D to 3D

In 2D, our equation is:

```math id="p10-2d"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

where:

```math id="p10-2d-vectors"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix},
\qquad
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

Expanding:

```math id="p10-2d-expanded"
\boxed{
w_1x_1+w_2x_2+w_0=0
}
```

This represents a **line**.

---

## In 3D

Now suppose a point has three coordinates:

```math id="p10-3d-x"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3
\end{bmatrix}
```

and:

```math id="p10-3d-w"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
w_3
\end{bmatrix}
```

The equation remains:

```math id="p10-3d-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Expanding:

```math id="p10-3d-expanded"
\boxed{
w_1x_1+w_2x_2+w_3x_3+w_0=0
}
```

But now the geometric object is a:

```text id="p10-plane"
PLANE
```

So:

```text id="p10-2d3d"
2 dimensions → Line

3 dimensions → Plane
```

---

# 10.2 Why Does a Plane Appear in 3D?

Let's understand this conceptually.

In 2D, a line has **one fewer dimension** than the space around it:

```text
2D space
   ↓
1D line
```

In 3D:

```text
3D space
   ↓
2D plane
```

So a linear equation of the form:

```math id="p10-general"
w_1x_1+w_2x_2+\cdots+w_dx_d+w_0=0
```

defines an object with:

```math id="p10-dimension"
\boxed{
d-1
}
```

dimensions.

This is why:

| Feature Space | Boundary                     |
| ------------- | ---------------------------- |
| 2D            | 1D line                      |
| 3D            | 2D plane                     |
| 4D            | 3D hyperplane                |
| d-D           | (d−1)-dimensional hyperplane |

---

# 10.3 The Normal Vector Still Exists

This is one of the most important points.

In 2D:

```math id="p10-normal-2d"
\overrightarrow{w}
\perp\text{line}
```

In 3D:

```math id="p10-normal-3d"
\overrightarrow{w}
\perp\text{plane}
```

The concept does not change.

The vector:

```math id="p10-normal-general"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_d
\end{bmatrix}
}
```

is normal to the hyperplane:

```math id="p10-hyperplane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

---

# 10.4 But a Plane Has More Than One Direction

There is an important difference between a line and a plane.

A line has essentially **one independent direction**.

For example:

```math id="p10-line-direction"
\overrightarrow{d}
```

Any other direction along the same line is a scalar multiple of it.

But a plane has **two independent directions**.

Suppose a plane contains two independent direction vectors:

```math id="p10-plane-directions"
\overrightarrow{d_1},
\qquad
\overrightarrow{d_2}
```

Every direction lying within the plane can be constructed from them:

```math id="p10-plane-combination"
\boxed{
\overrightarrow{d}
=
\alpha\overrightarrow{d_1}
+
\beta\overrightarrow{d_2}
}
```

where $`\alpha`$ and $`\beta`$ are scalars.

The normal vector must therefore be perpendicular to **both** independent directions.

So:

```math id="p10-normal-d1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_1}=0
}
```

and:

```math id="p10-normal-d2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_2}=0
}
```

This is the higher-dimensional version of the proof we performed for the line.

---

# 10.5 Why the Proof Still Works

Let's generalize our earlier proof.

Suppose two points $`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$ lie on the hyperplane:

```math id="p10-proof1"
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

and:

```math id="p10-proof2"
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
```

Subtract:

```math id="p10-proof3"
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}-\overrightarrow{x_1}
\right)
=0
```

Define:

```math id="p10-proof4"
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

Then:

```math id="p10-proof5"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore $`\overrightarrow{w}`$ is perpendicular to **every direction that lies within the hyperplane**.

That is exactly what it means for $`\overrightarrow{w}`$ to be a normal vector.

So the proof we learned in 2D was not a special trick.

It was already a general linear-algebra proof.

---

# 10.6 A Numerical 3D Example

Consider the plane:

```math id="p10-3d-example"
\boxed{
2x_1+3x_2+6x_3-12=0
}
```

Immediately, we can identify the normal vector:

```math id="p10-3d-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
}
```

and:

```math id="p10-3d-bias"
\boxed{
w_0=-12
}
```

We don't need to calculate the slope of the plane.

The normal direction is immediately available from the coefficients.

---

# 10.7 Find Two Independent Directions in the Plane

To demonstrate perpendicularity, we can find two independent direction vectors lying in the plane.

The plane equation is:

```math id="p10-plane-eq"
2x_1+3x_2+6x_3-12=0
```

### Choose direction 1

Let:

```math id="p10-dir1"
x_2=2,\qquad x_3=0
```

Then:

```math id="p10-dir1-eq"
2x_1+3(2)+6(0)-12=0
```

Therefore:

```math id="p10-dir1-solve"
2x_1-6=0
```

So:

```math id="p10-dir1-x"
x_1=3
```

This gives the point:

```math id="p10-dir1-point"
P=(3,2,0)
```

We could use another point on the plane, but for a direction vector it is easier to find vectors whose displacement produces zero change in the equation.

Choose:

```math id="p10-d1"
\boxed{
\overrightarrow{d_1}
=
\begin{bmatrix}
3\\
-2\\
0
\end{bmatrix}
}
```

Check:

```math id="p10-d1-check"
\overrightarrow{w}^{T}\overrightarrow{d_1}
=
\begin{bmatrix}
2 & 3 & 6
\end{bmatrix}
\begin{bmatrix}
3\\
-2\\
0
\end{bmatrix}
```

Therefore:

```math id="p10-d1-result"
=6-6+0
```

So:

```math id="p10-d1-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_1}=0
}
```

---

# 10.8 Find a Second Independent Direction

Choose another direction vector:

```math id="p10-d2"
\boxed{
\overrightarrow{d_2}
=
\begin{bmatrix}
3\\
0\\
-1
\end{bmatrix}
}
```

Check:

```math id="p10-d2-check"
\overrightarrow{w}^{T}\overrightarrow{d_2}
=
\begin{bmatrix}
2 & 3 & 6
\end{bmatrix}
\begin{bmatrix}
3\\
0\\
-1
\end{bmatrix}
```

Therefore:

```math id="p10-d2-result"
=6+0-6
```

Hence:

```math id="p10-d2-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_2}=0
}
```

So $`\overrightarrow{w}`$ is perpendicular to **both independent directions lying in the plane**.

Therefore:

```math id="p10-3d-final"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

---

# 10.9 Why Two Directions Matter

This is a subtle but important geometric point.

For a line:

```text id="p10-line"
One independent direction
        ↓
defines the line
```

For a plane:

```text id="p10-plane"
Two independent directions
        ↓
define the plane
```

Therefore, in 3D, proving that $`\overrightarrow{w}`$ is perpendicular to **both independent directions** proves that it is perpendicular to the entire plane.

This idea generalizes further.

---

# 10.10 The General d-Dimensional Case

Suppose:

```math id="p10-x-d"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
\vdots\\
x_d
\end{bmatrix}
```

and:

```math id="p10-w-d"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_d
\end{bmatrix}
```

The hyperplane is:

```math id="p10-d-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

or:

```math id="p10-d-expanded"
\boxed{
w_1x_1+w_2x_2+\cdots+w_dx_d+w_0=0
}
```

The normal vector is:

```math id="p10-d-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_d
\end{bmatrix}
}
```

And every direction vector $`\overrightarrow{d}`$ lying within the hyperplane satisfies:

```math id="p10-d-perp"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p10-d-final"
\boxed{
\overrightarrow{w}\perp\text{hyperplane}
}
```

---

# 10.11 Why This Is Extremely Important for ML

This is where the geometry becomes much more powerful.

Real Machine Learning datasets rarely have only two features.

A dataset might contain:

```text id="p10-features"
Age
Income
Experience
Education
Location
Credit history
...
```

Suppose there are 50 features.

Then each observation is a point in:

```math id="p10-50d"
\mathbb{R}^{50}
```

We cannot visualize a 50-dimensional space.

But we can still represent the model as:

```math id="p10-50-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

where:

```math id="p10-50-x"
\overrightarrow{x}\in\mathbb{R}^{50}
```

and:

```math id="p10-50-w"
\overrightarrow{w}\in\mathbb{R}^{50}
```

The decision boundary is a **49-dimensional hyperplane**.

And:

```math id="p10-50-normal"
\boxed{
\overrightarrow{w}\perp\text{hyperplane}
}
```

We don't need to visualize it.

The algebra still works.

---

# 10.12 Geometry Does Not Require Visualization

This is an important mindset shift.

When you reach high-dimensional Machine Learning, you will often hear:

> "This is geometrically a hyperplane."

You don't need to mentally draw a 50-dimensional object.

Instead, think structurally:

```text id="p10-structure"
Feature space
     ↓
Rᵈ
     ↓
Linear equation
     ↓
wᵀx + w₀ = 0
     ↓
Hyperplane
     ↓
w is normal to it
```

The **relationships** are more important than the picture.

This is one of the key differences between learning geometry for school and learning geometry for Machine Learning.

---

# 10.13 The Meaning of "Linear" in ML

We can now understand something important about the word **linear**.

A model is called linear when its decision boundary can be represented by:

```math id="p10-linear"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

It doesn't matter whether there are:

* 2 features
* 3 features
* 20 features
* 1,000 features

The mathematical structure remains linear in the features.

Therefore:

```text id="p10-linear-dims"
2D
↓
line

3D
↓
plane

Higher dimensions
↓
hyperplane
```

---

# 10.14 An Important Distinction: Features vs Dimensions

Suppose our dataset has:

```text id="p10-feature-count"
5 features
```

Then each observation can be represented as:

```math id="p10-five"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3\\
x_4\\
x_5
\end{bmatrix}
```

So each observation is a point in:

```math id="p10-r5"
\boxed{
\mathbb{R}^{5}
}
```

The linear decision boundary is:

```math id="p10-r5-boundary"
\boxed{
w_1x_1+w_2x_2+w_3x_3+w_4x_4+w_5x_5+w_0=0
}
```

This is a 4-dimensional hyperplane.

So:

```math id="p10-boundary-dim"
\boxed{
\text{boundary dimension}
=
\text{feature-space dimension}-1
}
```

---

# 10.15 Why Does the Boundary Lose One Dimension?

This is worth understanding intuitively.

Suppose we have two coordinates:

```text
(x₁, x₂)
```

and impose one equation:

```math id="p10-constraint2"
w_1x_1+w_2x_2+w_0=0
```

That one constraint restricts the possible points from a 2D space to a 1D set.

Hence:

```text
2D → 1D
```

In 3D:

```text
3D → 2D
```

In 5D:

```text
5D → 4D
```

In general:

```math id="p10-dim-rule"
\boxed{
d\text{-dimensional space}
\overset{\text{one linear constraint}}{\longrightarrow}
(d-1)\text{-dimensional hyperplane}
}
```

This is a very useful linear-algebra intuition.

---

# 10.16 The Most Important General Result

Everything we have studied can now be expressed in one statement:

> For a hyperplane defined by $`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$, the vector $`\overrightarrow{w}`$ is perpendicular to every direction lying within the hyperplane.

Mathematically:

```math id="p10-general-result"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

for every direction vector $`\overrightarrow{d}`$ lying in the hyperplane.

Therefore:

```math id="p10-general-normal"
\boxed{
\overrightarrow{w}
=
\text{normal vector of the hyperplane}
}
```

This is the higher-dimensional generalization of everything we proved in 2D.

---

# 10.17 From Geometry to Machine Learning

Now the entire journey can be summarized:

```text id="p10-ml-journey"
2D coordinate geometry
        ↓
ax₁ + bx₂ + c = 0
        ↓
wᵀx + w₀ = 0
        ↓
w = normal vector
        ↓
3D → plane
        ↓
d-D → hyperplane
        ↓
Linear decision boundary
```

So when a Machine Learning model has hundreds of features, the geometric interpretation is still valid.

We simply cannot draw it.

---

# 🧠 Part 10 — Mental Model

Don't try to visualize 100 dimensions.

Instead remember:

```text id="p10-mental"
x
↓
Point in feature space

w
↓
Normal direction

wᵀx + w₀ = 0
↓
Hyperplane

wᵀd = 0
↓
Every direction d within the hyperplane
is perpendicular to w
```

The structure stays exactly the same.

---

# 🔑 Part 10 Summary

### 1. In 2D

```math id="p10-summary-2d"
\boxed{
w_1x_1+w_2x_2+w_0=0
}
```

→ **line**

### 2. In 3D

```math id="p10-summary-3d"
\boxed{
w_1x_1+w_2x_2+w_3x_3+w_0=0
}
```

→ **plane**

### 3. In d dimensions

```math id="p10-summary-d"
\boxed{
\sum_{i=1}^{d}w_ix_i+w_0=0
}
```

→ **hyperplane**

### 4. Normal vector

```math id="p10-summary-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_d
\end{bmatrix}
}
```

### 5. Perpendicularity

For every direction $`\overrightarrow{d}`$ within the hyperplane:

```math id="p10-summary-perp"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p10-summary-final"
\boxed{
\overrightarrow{w}\perp\text{hyperplane}
}
```

---

## One Final Insight

The most important achievement of this topic is not memorizing:

> **"w is perpendicular to the line."**

It is understanding that the same mathematical structure works everywhere:

```text
2D       → line
3D       → plane
High-D   → hyperplane
```

while the equation remains:

```math id="p10-final-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and the geometric relationship remains:

```math id="p10-final-normal"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

That is exactly why this apparently simple equation becomes one of the foundational pieces of **linear Machine Learning**.

