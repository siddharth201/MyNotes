# Part 9 — Machine Learning Perspective

We have now built the geometry carefully:

```text
Coordinate Geometry
        ↓
Line equation
        ↓
Vector representation
        ↓
Normal vector
        ↓
w is perpendicular to the line
```

Now we can answer the important Machine Learning question:

> **Why does Machine Learning care about this geometry?**

The answer is that the equation of a line becomes the equation of a **decision boundary** in a linear model.

---

# 9.1 From a Geometric Line to an ML Decision Boundary

Consider:

```math id="p9-main"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

In geometry, this represents a line in 2D.

In Machine Learning, the same equation can represent a **decision boundary**.

The interpretation changes slightly:

| Geometry                     | Machine Learning         |
| ---------------------------- | ------------------------ |
| Point $`\overrightarrow{x}`$ | Data point / observation |
| $`\overrightarrow{w}`$       | Learned weight vector    |
| $`w_0`$                      | Bias                     |
| Equation = 0                 | Decision boundary        |
| $`\overrightarrow{w}`$       | Normal to the boundary   |

So the mathematics remains the same.

Only the **interpretation** changes.

---

# 9.2 What Is a Decision Boundary?

Imagine we have two groups of data points.

For example:

* Class A
* Class B

We want to find a line that separates them.

Conceptually:

```text id="p9-boundary"
       Class A

  ●   ●   ●
      ●

----------------------  ← Decision Boundary

      ●   ●
  ●       ●

       Class B
```

The line separating the two classes is the **decision boundary**.

For a linear classifier, that boundary can be represented by:

```math id="p9-boundary-eq"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

---

# 9.3 What Does the Model Calculate?

For any data point $`\overrightarrow{x}`$, the model calculates:

```math id="p9-score"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

This produces a **single scalar value**.

We can call it the **linear score**.

The important point is:

> The model is no longer simply asking whether a point lies on a geometric line. It is using the value of this expression to determine which side of the boundary the point lies on.

---

# 9.4 Three Important Cases

Consider:

```math id="p9-three"
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

There are three possibilities.

### Case 1 — Score = 0

```math id="p9-zero"
\boxed{
f(\overrightarrow{x})=0
}
```

The point lies **exactly on the decision boundary**.

---

### Case 2 — Score > 0

```math id="p9-positive"
\boxed{
f(\overrightarrow{x})>0
}
```

The point lies on one side of the boundary.

---

### Case 3 — Score < 0

```math id="p9-negative"
\boxed{
f(\overrightarrow{x})<0
}
```

The point lies on the other side.

Therefore:

```text id="p9-regions"
             Positive side
                  ↑
                  │
──────────────────┼──────────────────
                  │
             Boundary
                  │
──────────────────┼──────────────────
                  │
                  ↓
             Negative side
```

The exact class labels will depend on the particular ML algorithm.

---

# 9.5 Why Is w So Important?

We already proved:

```math id="p9-w-normal"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

Therefore $`\overrightarrow{w}`$ tells us the **orientation of the decision boundary**.

This gives us a powerful interpretation:

> **The learned weights are not merely numerical coefficients. Together, they define a direction perpendicular to the decision boundary.**

So when a Machine Learning model learns its weights, it is effectively learning the orientation of the boundary.

---

# 9.6 What Does Each Weight Mean?

Suppose we have two features:

```math id="p9-two-features"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

and:

```math id="p9-two-weights"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

The model is:

```math id="p9-two-model"
\boxed{
w_1x_1+w_2x_2+w_0=0
}
```

Here:

* $`w_1`$ is associated with feature $`x_1`$.
* $`w_2`$ is associated with feature $`x_2`$.
* $`w_0`$ shifts the boundary.

Together, $`w_1`$ and $`w_2`$ determine the direction of the normal vector:

```math id="p9-normal"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
}
```

Therefore, changing the learned weights changes the orientation of the decision boundary.

---

# 9.7 What Does the Bias Do in ML?

We already saw geometrically that $`w_0`$ shifts the line.

The same thing happens in ML.

Consider:

```math id="p9-bias1"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

If we keep $`\overrightarrow{w}`$ fixed but change $`w_0`$, the normal direction remains unchanged.

Therefore:

> **The decision boundary moves without changing its orientation.**

Conceptually:

```text id="p9-bias-movement"
Same w
   ↓
Same orientation

Different w₀
   ↓
Different position
```

This is the geometric interpretation of the **bias term**.

---

# 9.8 Why Is the Normal Direction Useful?

Suppose we move through feature space in the direction of $`\overrightarrow{w}`$.

Because $`\overrightarrow{w}`$ is perpendicular to the boundary, we are moving **across** the boundary rather than along it.

This is fundamentally different from moving along the boundary.

### Moving along the boundary

The decision boundary itself does not change.

### Moving in the normal direction

We cross from one side of the boundary to the other.

Therefore $`\overrightarrow{w}`$ tells us the direction in which the model's linear score changes most directly across the boundary.

---

# 9.9 A Beautiful Connection With Our Dot Product Chapter

Recall:

```math id="p9-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
=
\|\overrightarrow{w}\|
\|\overrightarrow{x}\|
\cos\theta
```

So the ML model:

```math id="p9-model"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

is fundamentally using a **dot product**.

This means our earlier study of:

* vectors
* dot product
* angle
* projection
* perpendicularity
* normal vectors

is not a collection of unrelated mathematics.

These ideas are coming together naturally.

---

# 9.10 Why Does a Linear Classifier Need This Geometry?

A linear classifier needs to divide the feature space into regions.

The simplest possible boundary is:

* a line in 2D
* a plane in 3D
* a hyperplane in higher dimensions

The general equation is:

```math id="p9-hyperplane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Therefore:

```text id="p9-dimensional"
2D → line

3D → plane

Higher dimensions → hyperplane
```

And in every case:

```math id="p9-normal-general"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

This is why the geometry we have studied is fundamental to linear Machine Learning.

---

# 9.11 A Simple Example

Suppose a model uses two features:

```text id="p9-example-features"
x₁ = feature 1
x₂ = feature 2
```

and learns:

```math id="p9-example-model"
\boxed{
2x_1+x_2-4=0
}
```

Then:

```math id="p9-example-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
}
```

The decision boundary is:

```math id="p9-example-boundary"
\boxed{
2x_1+x_2-4=0
}
```

And we immediately know:

```math id="p9-example-normal"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

We don't need to rediscover this every time.

The theorem we proved earlier gives us the result.

---

# 9.12 What the Model Is Really Learning

This gives us a more mature interpretation of a linear ML model.

It is not simply learning:

> "Some numbers called weights."

Geometrically, it is learning:

> **A direction that determines the orientation of a boundary, and a bias that determines where that boundary is placed.**

So:

```text id="p9-learning"
Learning
   ↓
Learn w
   ↓
Determine orientation

Learn w₀
   ↓
Determine position

Together
   ↓
Define decision boundary
```

This is a much more useful mental model.

---

# 9.13 Important Limitation

There is one important limitation we should recognize.

A single equation of this form:

```math id="p9-linear-boundary"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

creates a **linear boundary**.

Therefore, if the classes cannot be separated reasonably well by a straight line or hyperplane, a simple linear model may not be sufficient.

We will study more sophisticated models later.

For now, the important lesson is:

> **Linear models create linear decision boundaries.**

---

# 9.14 Connection With Higher Dimensions

Suppose our dataset has three features:

```math id="p9-3d-x"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3
\end{bmatrix}
```

and:

```math id="p9-3d-w"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
w_3
\end{bmatrix}
```

The boundary is:

```math id="p9-3d-boundary"
\boxed{
w_1x_1+w_2x_2+w_3x_3+w_0=0
}
```

This is a **plane**.

And:

```math id="p9-3d-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

When we have many features, we cannot visualize the boundary easily.

But the mathematics remains exactly the same.

That is one of the great strengths of linear algebra.

---

# 9.15 What We Should NOT Jump Into Yet

At this stage, we should **not** jump into:

* embeddings
* semantic search
* vector databases
* RAG
* neural networks
* recommendation systems
* advanced classification algorithms

Those are later topics in our ML journey.

For now, the correct takeaway is simply:

> **The equation of a linear decision boundary is the same geometric object we have been studying.**

This keeps our learning progression clean.

---

# 🧠 Part 9 — Mental Model

When you see:

```math id="p9-mental"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

think:

```text id="p9-mental-chain"
x
↓
A data point

w
↓
Normal direction

w₀
↓
Position / bias

= 0
↓
Decision boundary
```

And the most important geometric relationship remains:

```math id="p9-mental-final"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

---

# 🔑 Part 9 Summary

### 1. A linear ML model can define a decision boundary

```math id="p9-summary1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 2. The data point is represented by $`\overrightarrow{x}`$

It contains the feature values of one observation.

### 3. The weight vector is $`\overrightarrow{w}`$

It determines the orientation of the boundary.

### 4. The bias is $`w_0`$

It shifts the boundary.

### 5. The boundary is where the score equals zero

```math id="p9-summary2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 6. The normal-vector theorem gives us

```math id="p9-summary3"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

### 7. In different dimensions

```text id="p9-summary-dim"
2D → line

3D → plane

d-D → hyperplane
```

---

## 🔭 Next — Part 10 — Higher Dimensions

We will now generalize everything we have learned from:

**2D line**

→ **3D plane**

→ **d-dimensional hyperplane**

and see why the exact same equation:

```math id="p9-next"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

continues to work even when visualization becomes impossible.

