# Part 10 — Machine Learning Perspective

We have now completed the geometry:

* a plane has a normal vector,
* projection extracts the normal component,
* that component gives the perpendicular distance,
* and the final formula is

```math id="p10-distance"
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

Now we answer the important question:

> **Why should an ML engineer care about this distance?**

---

# 10.1 From a Plane to a Decision Boundary

In Machine Learning, we often have data points belonging to different groups.

For example, imagine two types of data:

```text id="p10-groups"
Class A

 ●   ●
   ●
      ●

────────────────────────
    Decision Boundary
────────────────────────

      ●
   ●     ●
 ●

Class B
```

A linear model can create a boundary separating the two groups.

Mathematically, that boundary can be written as:

```math id="p10-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is exactly the same equation for the plane we have just studied.

The only difference is the **ML interpretation**.

In geometry:

> It is a plane/hyperplane.

In ML:

> It can represent a **linear decision boundary**.

---

# 10.2 What Is a Decision Boundary?

A decision boundary is simply the location where the model is exactly at the dividing point between its two sides.

We can define the model's linear score as:

```math id="p10-score"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The boundary occurs when:

```math id="p10-boundary-score"
\boxed{
f(\overrightarrow{x})=0
}
```

Therefore:

```math id="p10-boundary-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

So the geometry we have studied maps directly onto a linear ML model.

---

# 10.3 What Does the Sign Mean?

For a data point $\overrightarrow{x}$, calculate:

```math id="p10-sign-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

There are three possibilities.

### Positive

```math id="p10-positive"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

The point lies on one side of the boundary.

---

### Zero

```math id="p10-zero"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

The point lies **on the decision boundary**.

---

### Negative

```math id="p10-negative"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
```

The point lies on the other side.

So:

```text id="p10-sign"
        Score

          +
          │
          │
──────────0──────────  Decision Boundary
          │
          │
          -
```

The sign tells us **which side of the boundary** the point occupies.

---

# 10.4 What Does Distance Add?

The sign tells us:

> **Which side?**

But it does not tell us:

> **How far from the boundary?**

For that, we use:

```math id="p10-distance"
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

So we now have two pieces of information:

```text id="p10-two-info"
                 Linear score
                      │
             ┌────────┴────────┐
             ↓                 ↓
          Sign              Magnitude
             ↓                 ↓
       Which side?        How far?
```

This is a very useful mental model.

---

# 10.5 A Simple ML Example

Suppose our decision boundary is:

```math id="p10-example-boundary"
\boxed{
2x_1+x_2-4=0
}
```

Therefore:

```math id="p10-example-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
}
```

and:

```math id="p10-example-w0"
\boxed{
w_0=-4
}
```

Now consider two points:

```math id="p10-points"
P_1=(3,1)
```

and:

```math id="p10-points2"
P_2=(2,1)
```

---

## Point $P_1$

Evaluate the score:

```math id="p10-p1-score"
2(3)+1-4
```

```math id="p10-p1-score2"
=3
```

So:

```math id="p10-p1-sign"
\boxed{
f(P_1)=3>0
}
```

Therefore $P_1$ is on the positive side.

Its distance is:

```math id="p10-p1-distance"
d_1
=
\frac{|3|}
{\sqrt{2^2+1^2}}
```

Therefore:

```math id="p10-p1-distance2"
\boxed{
d_1=
\frac{3}{\sqrt{5}}
}
```

---

## Point $P_2$

Now:

```math id="p10-p2-score"
2(2)+1-4
```

```math id="p10-p2-score2"
=1
```

Therefore:

```math id="p10-p2-sign"
\boxed{
f(P_2)=1>0
}
```

It is also on the positive side.

But its distance is:

```math id="p10-p2-distance"
d_2
=
\frac{1}{\sqrt{5}}
```

Therefore:

```math id="p10-p2-distance2"
\boxed{
d_2=
\frac{1}{\sqrt{5}}
}
```

Compare:

```text id="p10-compare"
P₁ → farther from boundary
P₂ → closer to boundary
```

Both are on the same side, but they are at different distances.

---

# 10.6 Why This Is More Informative Than the Sign Alone

Suppose a model says:

```text id="p10-class-only"
P₁ → Class A
P₂ → Class A
```

That's useful, but it doesn't tell us how close they are to the boundary.

Geometrically:

```text id="p10-confidence"
Far away:

●
│
│
│
────────────── Boundary


Close:

●
│
────────────── Boundary
```

The second point is much closer to the boundary.

Therefore the distance gives us additional geometric information.

---

# 10.7 The Weight Vector $\overrightarrow{w}$ Has a Geometric Meaning

We have already studied $\overrightarrow{w}$ as a normal vector.

In ML, it is commonly called the **weight vector**.

So:

```text id="p10-w-meaning"
Geometry:
w → normal vector

Machine Learning:
w → weight vector
```

These are not two unrelated objects.

They are the **same mathematical vector**, viewed from two perspectives.

---

# 10.8 What Do the Weights Control?

Suppose:

```math id="p10-weight"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

Then the boundary is:

```math id="p10-weight-boundary"
w_1x_1+w_2x_2+w_0=0
```

The direction of $\overrightarrow{w}$ determines the orientation of the boundary.

Remember:

```math id="p10-normal"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

Therefore:

> **Changing $\overrightarrow{w}$ changes the orientation of the decision boundary.**

This is the geometric meaning of the ML weights.

---

# 10.9 What Does $w_0$ Do?

The bias term:

```math id="p10-bias"
\boxed{
w_0
}
```

affects the position of the boundary.

Conceptually:

```text id="p10-bias-picture"
Same orientation:

──────────────────
Boundary 1


──────────────────
Boundary 2

Different positions
```

If we change $w_0$ while keeping $\overrightarrow{w}$ fixed:

* the normal direction stays the same,
* the orientation stays the same,
* but the boundary shifts.

Therefore:

```text id="p10-roles"
w
↓
orientation

w₀
↓
position
```

This connects directly to what we learned in the previous chapter.

---

# 10.10 Why Do We Divide by $|\overrightarrow{w}|$?

This has an important ML interpretation too.

Suppose we multiply the model parameters by a positive constant $c$:

```math id="p10-scale"
c\overrightarrow{w}^{T}\overrightarrow{x}+cw_0
```

The equation:

```math id="p10-scale-boundary"
c\overrightarrow{w}^{T}\overrightarrow{x}+cw_0=0
```

still represents the same boundary.

Therefore, simply looking at the raw value:

```math id="p10-raw"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

is not enough to interpret it as a physical distance.

Its scale depends on how the model parameters are represented.

Dividing by:

```math id="p10-norm"
\|\overrightarrow{w}\|
```

removes that arbitrary scaling.

Thus:

```math id="p10-normalized-distance"
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

is a genuine geometric distance.

---

# 10.11 A Very Important Distinction

Do **not** say:

> "The value of $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ is the distance."

That is not generally true.

It is a **scaled signed quantity**.

The geometric distance is:

```math id="p10-correct-distance"
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

This distinction is extremely important in ML.

---

# 10.12 From Feature Space to Geometry

Suppose a dataset has:

```text id="p10-features"
x₁ = age
x₂ = income
```

Each person becomes a point:

```math id="p10-feature-vector"
\overrightarrow{x}
=
\begin{bmatrix}
age\\
income
\end{bmatrix}
```

A linear model creates:

```math id="p10-feature-boundary"
w_1x_1+w_2x_2+w_0=0
```

which is a line in this two-dimensional feature space.

Now our geometric tools tell us:

* $\overrightarrow{w}$ → perpendicular to the boundary.
* sign of the score → side of boundary.
* normalized absolute score → perpendicular distance from boundary.

This is the beginning of thinking about ML models **geometrically rather than only algebraically**.

---

# 10.13 Higher-Dimensional ML

Real ML datasets often have many features.

Suppose:

```text id="p10-high-dimensional"
x₁
x₂
x₃
...
x₁₀₀
```

Then:

```math id="p10-high-dimensional-equation"
\boxed{
w_1x_1+w_2x_2+\cdots+w_{100}x_{100}+w_0=0
}
```

We cannot visualize this as an ordinary 100-dimensional geometric object.

But the vector notation still works:

```math id="p10-high-vector"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and the distance remains:

```math id="p10-high-distance"
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

This is one of the most powerful reasons for learning linear algebra.

> **The mathematics continues to work even when our visual intuition cannot.**

---

# 10.14 Why This Concept Matters for ML

At this stage, we don't need to jump into advanced algorithms.

The important foundation is:

```text id="p10-foundation"
Data point
    ↓
Feature vector x
    ↓
Linear function
    ↓
wᵀx + w₀
    ↓
Decision boundary
    ↓
Distance from boundary
```

This gives us a geometric way to understand what a linear model is doing.

Instead of thinking:

> "The model calculates some mysterious weighted sum."

we can think:

> **"The model creates a boundary in feature space, and the weights determine the orientation of that boundary."**

That is a much stronger mental model.

---

# 10.15 What We Should NOT Jump Into Yet

There are more advanced ML concepts where distance from a decision boundary becomes particularly important.

But we don't need to study those now.

For our current learning stage, the correct takeaway is simply:

```text id="p10-scope"
Linear boundary
      ↓
Normal vector w
      ↓
Point x
      ↓
Signed position relative to boundary
      ↓
Perpendicular distance
```

We will encounter more advanced uses naturally when their place in the ML curriculum arrives.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Imagine the ML model draws a **wall** between two groups of data.

For every new data point, we can ask:

### 1. Which side of the wall?

```text
sign of:

wᵀx + w₀
```

### 2. How far from the wall?

```math id="p10-goal-distance"
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

So the whole concept in simple language is:

> **Machine Learning can represent a separating boundary mathematically, and geometry lets us measure how far each data point is from that boundary.**

That's the real reason we spent time learning point-to-plane distance.

---

# 🧠 Part 10 Mental Model

When you see:

```math id="p10-mental"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

think:

```text id="p10-mental-map"
wᵀx + w₀
      ↓
Linear score
      ↓
Where is the point relative
to the boundary?

       ┌──────────────┐
       │              │
       ↓              ↓
    positive        negative
       │              │
       └──────┬───────┘
              ↓
        Decision Boundary
              ↓
           distance
              ↓
     |wᵀx + w₀| / ||w||
```

---

# 🔑 Part 10 Takeaways

### 1. A linear decision boundary can be written as

```math id="p10-t1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 2. $\overrightarrow{w}$ is both

```text id="p10-t2"
Normal vector
      +
Weight vector
```

### 3. The sign tells us the side

```math id="p10-t3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### 4. The perpendicular distance tells us how far

```math id="p10-t4"
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

### 5. $\overrightarrow{w}$ controls orientation

### 6. $w_0$ controls position

### 7. The same mathematics works in any number of dimensions.

---

## 🔗 The Journey So Far

We can now see the complete chain:

```text id="p10-journey"
Vectors
   ↓
Dot Product
   ↓
Projection
   ↓
Unit Vector
   ↓
Normal Vector
   ↓
Linear Boundary
   ↓
Perpendicular Distance
   ↓
Distance of Data Point
from Decision Boundary
```

This is exactly the kind of conceptual continuity we want in our ML notebook.

---

### Next: **Part 11 — Python / NumPy**

We will now translate everything we have learned into code and implement the point-to-plane distance calculation ourselves, first directly from the formula and then in a reusable NumPy function.

