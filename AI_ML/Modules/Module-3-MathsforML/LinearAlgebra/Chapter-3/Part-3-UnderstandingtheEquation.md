# Part 3 — Understanding the Equation

We have now reached the Machine Learning form of a line:

```math id="line-equation-main"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This equation may look compact, but it contains the entire geometry of a line.

Before proving anything about perpendicularity, we need to understand **exactly what each part means**.

---

## 3.1 The Equation at a Glance

Our equation is:

```math id="equation-parts"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

It contains three important components:

| Component            | Meaning                                        |
| -------------------- | ---------------------------------------------- |
| $\overrightarrow{x}$ | A point/vector representing a location         |
| $\overrightarrow{w}$ | Weight/normal vector that controls orientation |
| $w_0$                | Bias/intercept that controls position          |

The most important distinction is:

> **$\overrightarrow{w}$ controls the orientation of the line, while `w₀` controls where that line is located.**

We will build this intuition carefully.

---

# 3.2 What Is $\overrightarrow{x}$?

Suppose we are working in 2D.

A point on the plane can be represented as:

```math id="x-vector"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

For example, the point:

```text
(3, 2)
```

can be represented by:

```math id="x-example"
\overrightarrow{x}
=
\begin{bmatrix}
3\\
2
\end{bmatrix}
```

So $\overrightarrow{x}$ represents **the location we are currently asking about**.

---

## 3.3 What Does It Mean for a Point to Lie on the Line?

Consider the equation:

```math id="line-condition"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

For any particular point $\overrightarrow{x}$, we can substitute its coordinates.

If the equation evaluates to zero, that point lies **on the line**.

If it does not evaluate to zero, the point is not on the line.

So the equation is essentially a **membership test**:

```text
             Point x
                │
                ▼
     wᵀx + w₀ = 0 ?
          /          \
        YES           NO
         │             │
         ▼             ▼
   On the line     Not on line
```

This is one of the most useful ways to think about a linear equation.

---

# 3.4 What Is `\overrightarrow{w}`?

Now we come to the most important object.

We have:

```math id="w-vector"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

In Machine Learning, this is called the **weight vector**.

At this stage, however, we should temporarily forget the word "weight" and think geometrically.

`w` is a **vector associated with the line**.

Later, we will prove something extremely important:

> **The vector `\overrightarrow{w}` is perpendicular to the line.**

Therefore, `\overrightarrow{w}` is also called a **normal vector**.

```math id="normal-vector"
\boxed{
\overrightarrow{w}
=
\text{normal vector to the line}
}
```

But remember:

⚠️ **We have not proved this yet.**

The proof comes in Part 5.

For now, we are building the intuition needed to understand that proof.

---

# 3.5 What Does `w₀` Mean?

The remaining term is:

```math id="bias"
\boxed{
w_0
}
```

This is a scalar.

In Machine Learning, it is commonly called the **bias** or **intercept term**.

Its role is very different from `w`.

A useful first intuition is:

> `w` determines the **orientation** of the line.

> `w₀` determines the **position** of the line.

Let's see why.

---

# 3.6 Compare Two Equations

Consider these two lines:

```math id="line1"
\overrightarrow{w}^{T}\overrightarrow{x}+1=0
```

and:

```math id="line2"
\overrightarrow{w}^{T}\overrightarrow{x}-3=0
```

The vector `w` is exactly the same in both equations.

Therefore, their orientation is the same.

But `w₀` is different.

So the lines are shifted relative to each other.

Conceptually:

```text
Same w
   │
   ├──────────────► Same orientation
   │
Different w₀
   │
   └──────────────► Different position
```

This is a fundamental idea.

---

# 3.7 Why Does `w₀` Shift the Line?

Let's make this concrete.

Suppose:

```math id="simple-line"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
0
\end{bmatrix}
```

Then:

```math id="simple-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

becomes:

```math id="expanded-simple"
x_1+w_0=0
```

Therefore:

```math id="vertical-line-general"
x_1=-w_0
```

Now consider three different values.

### Case 1: `w₀ = 0`

```math id="case-zero"
x_1=0
```

The line passes through the origin.

### Case 2: `w₀ = -2`

```math id="case-minus-two"
x_1=2
```

The line moves to the right.

### Case 3: `w₀ = 3`

```math id="case-three"
x_1=-3
```

The line moves to the left.

Notice something very important:

**The orientation never changed.**

Only the position changed.

---

# 3.8 Why Does `\overrightarrow{w}` Control Orientation?

Let's look at:

```math id="orientation-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Suppose:

```math id="w-example"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

Then:

```math id="expanded-equation"
\begin{bmatrix}
2\\
1
\end{bmatrix}^{T}
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
+w_0=0
```

The transpose converts the column vector into a row vector:

```math id="transpose"
\begin{bmatrix}
2 & 1
\end{bmatrix}
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
+w_0=0
```

Therefore:

```math id="dot-expanded"
2x_1+x_2+w_0=0
```

Notice that the coefficients of the coordinates are determined by `w`:

```math id="coefficients"
\boxed{
2x_1+x_2
}
```

Changing `w` changes these coefficients.

And changing these coefficients changes the **orientation of the line**.

---

# 3.9 Connection to the Familiar Equation `ax + by + c = 0`

Earlier, we reached the standard coordinate-geometry form:

```math id="standard-form"
\boxed{
ax+by+c=0
}
```

Now compare it with:

```math id="ml-form"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Suppose:

```math id="w-components"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

and:

```math id="x-components"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

Then:

```math id="dot-product-expansion"
\overrightarrow{w}^{T}\overrightarrow{x}
=
w_1x_1+w_2x_2
```

Therefore:

```math id="matching-form"
w_1x_1+w_2x_2+w_0=0
```

Compare:

```text
Coordinate Geometry

ax + by + c = 0
```

with:

```text
Machine Learning

w₁x₁ + w₂x₂ + w₀ = 0
```

They are the **same mathematical structure**.

The difference is mainly the notation and interpretation.

---

# 3.10 Why Use Vector Notation?

Suppose we have only two features:

```math id="two-features"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

Then:

```math id="two-feature-equation"
w_1x_1+w_2x_2+w_0=0
```

is manageable.

But what happens when we have 100 features?

```math id="many-features"
w_1x_1+w_2x_2+w_3x_3+\cdots+w_{100}x_{100}+w_0=0
```

Writing this every time would be extremely inconvenient.

Instead, we define:

```math id="w-100"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_{100}
\end{bmatrix}
```

and:

```math id="x-100"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
\vdots\\
x_{100}
\end{bmatrix}
```

Then the entire expression becomes:

```math id="compact-ml"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is one of the major reasons linear algebra becomes so powerful in Machine Learning.

---

# 3.11 What Does `wᵀx` Actually Calculate?

The term:

```math id="wt-x"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

is the **dot product** of the two vectors.

For:

```math id="w-x-example"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix},
\qquad
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

we get:

```math id="dot-product-form"
\overrightarrow{w}^{T}\overrightarrow{x}
=
w_1x_1+w_2x_2
```

The result is a **scalar**, not a vector.

So the equation:

```math id="full-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

is:

```text
scalar + scalar = 0
```

which is perfectly valid.

---

# 3.12 Geometric Meaning of the Dot Product

We have already studied the dot product and angle between vectors.

Recall:

```math id="dot-angle"
\overrightarrow{w}^{T}\overrightarrow{x}
=
\|\overrightarrow{w}\|
\|\overrightarrow{x}\|
\cos\theta
```

Therefore our line equation can also be viewed as:

```math id="geometric-equation"
\|\overrightarrow{w}\|
\|\overrightarrow{x}\|
\cos\theta
+
w_0
=
0
```

This is a very important connection.

The equation is not just an arbitrary algebraic expression.

It contains **geometric information about the relationship between `w` and `x`**.

And this is exactly where our earlier study of:

* dot product
* angle between vectors
* projection
* unit vectors

starts becoming useful.

---

# 3.13 The Special Case `w₀ = 0`

If:

```math id="zero-bias"
w_0=0
```

then the equation becomes:

```math id="origin-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}=0
}
```

This immediately tells us:

```math id="orthogonality"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

means the two vectors are perpendicular.

So in this special case, the points `x` satisfying the equation are precisely those whose position vectors are perpendicular to `w`.

This gives us our **first glimpse** of why `w` is connected to perpendicularity.

But we must be careful:

> This argument only handles a line passing through the origin.

For a general line, we have:

```math id="general-line-again"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

and we still need to prove that `w` is perpendicular to the **line itself**.

That proof comes next.

---

# 3.14 A Powerful Way to Think About the Equation

Think of the equation as having two jobs:

### `\overrightarrow{w}`

```text
              w
              ↑
              │
              │
        controls orientation
```

### `w₀`

```text
        shifts the line
              ◄────►
```

Together:

```math id="geometric-role"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

completely specifies a hyperplane.

In 2D, that hyperplane is a **line**.

In 3D, it becomes a **plane**.

In higher dimensions, it becomes a **hyperplane**.

This is one of the most important transitions from elementary geometry to Machine Learning.

---

# 3.15 2D → 3D → n-D

### In 2D

```math id="2d-line"
w_1x_1+w_2x_2+w_0=0
```

This represents a:

**line**

---

### In 3D

```math id="3d-plane"
w_1x_1+w_2x_2+w_3x_3+w_0=0
```

This represents a:

**plane**

---

### In n dimensions

```math id="nd-hyperplane"
\boxed{
\sum_{i=1}^{d}w_ix_i+w_0=0
}
```

This represents a:

**hyperplane**

And the compact representation remains:

```math id="nd-compact"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is why this equation is so important in ML.

---

# 3.16 Why This Matters for Machine Learning

A Machine Learning model often has many input features.

For example, suppose we want to classify houses using:

```text
x₁ = area
x₂ = number of bedrooms
x₃ = age
x₄ = distance from city
...
```

We represent the complete observation as:

```math id="house-vector"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3\\
\vdots\\
x_d
\end{bmatrix}
```

The model learns corresponding weights:

```math id="weight-vector"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
w_3\\
\vdots\\
w_d
\end{bmatrix}
```

and computes:

```math id="ml-score"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

This produces a scalar **score**.

For a linear classifier, the decision boundary is where that score equals zero:

```math id="decision-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

So the geometric line we are studying is not just mathematical decoration.

It becomes the **decision boundary of a linear Machine Learning model**.

---

# 3.17 One More Important Insight

There are actually two different things here:

### The point/vector `x`

It changes as we examine different locations.

```math id="x-variable"
\overrightarrow{x}
\quad\text{changes}
```

### The learned vector `w`

For one particular trained model, it is fixed.

```math id="w-fixed"
\overrightarrow{w}
\quad\text{is fixed}
```

Therefore, the equation:

```math id="fixed-boundary"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

asks:

> **Which points `x` satisfy this condition?**

The collection of all such points forms the line.

This is a very useful mental model.

---

# 3.18 The Complete Picture So Far

We can now connect everything we have learned:

```text
Two points
    ↓
Direction vector
    ↓
Equation of a line
    ↓
ax + by + c = 0
    ↓
Coefficient vector
    ↓
w
    ↓
wᵀx + w₀ = 0
    ↓
Geometric interpretation
    ↓
w is normal to the line
```

The last step is the one we still need to **prove rigorously**.

---

# 🔑 Part 3 — Key Takeaways

### 1. `x` represents a point

```math id="takeaway-x"
\boxed{
\overrightarrow{x}
=
\text{location of a point}
}
```

### 2. `w` is the weight/normal vector

```math id="takeaway-w"
\boxed{
\overrightarrow{w}
=
\text{vector associated with the orientation of the boundary}
}
```

We will formally prove its normal/perpendicular role next.

### 3. `w₀` controls position

Changing `w₀` shifts the line without changing its orientation.

### 4. `wᵀx` is a dot product

```math id="takeaway-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
=
w_1x_1+w_2x_2+\cdots+w_dx_d
}
```

and produces a **scalar**.

### 5. The complete equation is

```math id="takeaway-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 6. In 2D → line, 3D → plane, nD → hyperplane

That is the mathematical foundation behind the **linear decision boundary** used in Machine Learning.

---

## What comes next

**Part 4 — From Two Points on the Line to a Direction Vector**

We will establish the key algebraic fact needed for the proof:

> If `x₁` and `x₂` are any two points on the line, what can we say about the vector `\overrightarrow{x₁x₂}`?

That single step will lead naturally to the proof that **`\overrightarrow{w}` is perpendicular to the line**, without any shortcut or memorization.

