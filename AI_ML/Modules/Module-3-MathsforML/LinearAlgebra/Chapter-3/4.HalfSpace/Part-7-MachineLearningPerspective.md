
# Half Space

# Part 7 — Machine Learning Perspective

We have now understood Half-Space geometrically and mathematically.

Now we connect the entire concept to **Machine Learning**.

The central idea is:

> **A linear ML model creates a boundary in feature space. That boundary divides the feature space into two half-spaces, and the model uses the side of the boundary to make a decision.**

---

# 7.1 First: What Does a Data Point Become in ML?

Suppose we are predicting whether a person will buy a house.

We might have features:

```text
x₁ = Area
x₂ = Number of bedrooms
```

One house can therefore be represented as:

```math id="ml-x"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
}
```

For example:

```math id="ml-house"
\overrightarrow{x}
=
\begin{bmatrix}
1500\\
3
\end{bmatrix}
```

This vector represents **one data point**.

---

# 7.2 Feature Space

Because we have two features, we can visualize every house as a point in a 2D feature space.

```text id="ml-feature-space"
              Number of Bedrooms
                      ↑
                      │
                 ●    │
             ●        │       ●
                      │
          ●           │
                      │
──────────────────────┼────────────────→ Area
                      │
              Feature Space
```

Each point represents one observation.

If we had:

```text
3 features
```

we would have a 3D feature space.

If we had:

```text
100 features
```

we would have a 100-dimensional feature space.

We cannot physically draw 100 dimensions, but the mathematics remains exactly the same.

---

# 7.3 The Model Creates a Boundary

A linear model creates:

```math id="ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is our **decision boundary**.

In 2D it is a line.

In 3D it is a plane.

In higher dimensions it is a **hyperplane**.

So:

```text id="ml-dimensions"
2 features
   ↓
line

3 features
   ↓
plane

n features
   ↓
hyperplane
```

This is exactly the geometric object we have been studying.

---

# 7.4 The Decision Boundary Divides Feature Space

The boundary:

```math id="ml-boundary2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

divides feature space into two regions:

```math id="ml-positive"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

and:

```math id="ml-negative"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

So geometrically:

```text id="ml-two-regions"
                 Class / Region A

                  ●     ●
                     ●

════════════════════════════════
       Linear Decision Boundary
════════════════════════════════

               ●
           ●        ●

                 Class / Region B
```

This is the direct ML meaning of **half-space**.

---

# 7.5 🎯 Ultimate Goal in ML — Simple Terms

Think of the decision boundary as an **invisible wall**.

```text id="ml-wall"
          Region A
        ●       ●
           ●

══════════════════════
    INVISIBLE WALL
══════════════════════

           ●
        ●       ●

          Region B
```

When a new data point arrives, the model wants to know:

> **"Which side of my invisible wall is this point on?"**

That is exactly what the Half-Space concept gives us.

The model calculates:

```math id="ml-score"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

and looks at its sign.

```text id="ml-sign"
f(x) > 0 → one side
f(x) = 0 → boundary
f(x) < 0 → other side
```

So in very simple terms:

> **Half-space gives a linear ML model a mathematical way to say "this data point is on this side of my decision boundary."**

---

# 7.6 The Linear Score

The quantity:

```math id="ml-score2"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

is often called the **linear score**, or decision function in this geometric context.

It is extremely important not to confuse the score with distance.

The score itself is:

```math id="ml-score3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

while the signed distance is:

```math id="ml-signed-distance"
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

Therefore:

```text id="ml-score-distance"
Linear Score
     ↓
wᵀx + w₀

Signed Distance
     ↓
(wᵀx + w₀) / ||w||
```

The difference is the normalization by $|\overrightarrow{w}|$.

---

# 7.7 Why Does the Score Tell Us the Side?

We already proved this geometrically.

Because $\overrightarrow{w}$ is the normal vector:

```math id="ml-normal"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

the score effectively measures the point's position relative to the boundary along the normal direction.

Therefore:

```text id="ml-side"
                w
                ↑
                │
     Positive   │
        ●       │
                │
════════════════╪════════════════
          Decision Boundary
════════════════╪════════════════
                │
        ●       │
     Negative   │
                ↓
```

So:

```math id="ml-positive-score"
f(\overrightarrow{x})>0
```

means the point lies on the side associated with $+\overrightarrow{w}$.

And:

```math id="ml-negative-score"
f(\overrightarrow{x})<0
```

means it lies on the side associated with $-\overrightarrow{w}$.

---

# 7.8 Important: Positive Does Not Automatically Mean Class 1

This is an important ML detail.

Mathematically:

```text id="ml-sign-meaning"
positive → +w side
negative → -w side
```

But the model can choose:

```text id="ml-class-map1"
positive → Class 1
negative → Class 0
```

or:

```text id="ml-class-map2"
positive → Class 0
negative → Class 1
```

Both are possible.

So never memorize:

> "Positive score always means Class 1."

Instead remember:

> **The sign identifies the side; the mapping from side to class label is a modelling convention.**

---

# 7.9 What Is the Role of the Weight Vector?

Our model contains:

```math id="ml-w"
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

Geometrically, $\overrightarrow{w}$ is the **normal vector of the decision boundary**.

That means:

```text id="ml-w-role"
w
↓
perpendicular to boundary
↓
establishes orientation
↓
defines +w and -w sides
```

This is a deeper interpretation than simply saying:

> "Weights multiply features."

Mathematically they do.

Geometrically, together they form a vector that determines the **orientation of the boundary**.

---

# 7.10 What Does the Bias $w_0$ Do?

Our decision boundary is:

```math id="ml-bias"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

The vector $\overrightarrow{w}$ determines the **orientation**.

The bias $w_0$ determines where that boundary is positioned.

A useful way to think about it:

```text id="ml-w-bias"
w
↓
Which direction is the wall facing?

w₀
↓
Where is the wall located?
```

For example:

```math id="ml-no-bias"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

always passes through the origin.

But:

```math id="ml-with-bias"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

can shift the boundary away from the origin.

---

# 7.11 Visualizing the Role of $w_0$

Consider:

```math id="ml-line1"
x+y=0
```

and:

```math id="ml-line2"
x+y-4=0
```

Both have the same normal:

```math id="ml-same-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Therefore they have the same orientation.

But they are positioned differently.

```text id="ml-parallel"
        Line 1
       /
      /
     /

              Line 2
             /
            /
           /
```

So:

```text id="ml-w-bias2"
same w
 ↓
same orientation

different w₀
 ↓
different position
```

This is very important when thinking about learned decision boundaries.

---

# 7.12 A Data Point and Its Score

Suppose our classifier is:

```math id="ml-example-model"
\boxed{
2x_1+x_2-6=0
}
```

Therefore:

```math id="ml-example-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

and:

```math id="ml-example-bias"
w_0=-6
```

Take a new point:

```math id="ml-example-point"
\overrightarrow{x}
=
\begin{bmatrix}
3\\
2
\end{bmatrix}
```

Calculate:

```math id="ml-example-score"
f(\overrightarrow{x})
=
2(3)+2-6
```

Therefore:

```math id="ml-example-score2"
\boxed{
f(\overrightarrow{x})=2
}
```

The score is positive.

Therefore the point lies in the positive half-space.

```text id="ml-example-result"
Score = +2
   ↓
Positive side
   ↓
+ w direction
```

---

# 7.13 What Does the Same Point's Distance Tell Us?

The normal magnitude is:

```math id="ml-example-norm"
\|\overrightarrow{w}\|
=
\sqrt{2^2+1^2}
=
\sqrt{5}
```

Therefore signed distance:

```math id="ml-example-signed"
d_{\text{signed}}
=
\frac{2}{\sqrt{5}}
```

Approximately:

```math id="ml-example-signed2"
\boxed{
d_{\text{signed}}\approx0.894
}
```

So now we know:

```text id="ml-example-complete"
Score = +2
     ↓
Positive side

Signed distance ≈ +0.894
     ↓
0.894 units from boundary
```

The two numbers are related, but they are **not the same thing**.

---

# 7.14 Why Can't We Use the Raw Score as Distance?

This is a very important conceptual point.

Suppose:

```math id="ml-w-small"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

and another model uses:

```math id="ml-w-large"
\overrightarrow{w}
=
\begin{bmatrix}
10\\
10
\end{bmatrix}
```

These can represent the **same boundary** if the bias is scaled accordingly.

For example:

```math id="ml-boundary-same"
x+y-4=0
```

and:

```math id="ml-boundary-scaled"
10x+10y-40=0
```

describe the same geometric line.

But the raw score of a point is multiplied by $10$.

Therefore:

```text id="ml-score-not-distance"
same boundary
     ↓
different raw scores possible
```

But the actual geometric distance must remain unchanged.

That's why we normalize by:

```math id="ml-normalize"
\|\overrightarrow{w}\|
```

Hence:

```math id="ml-distance-final"
\boxed{
d=
\frac{
|w^Tx+w_0|
}{
\|w\|
}
}
```

This is an important reason behind the distance formula we derived earlier.

---

# 7.15 Half-Space as a Classification Region

Now we can interpret the classifier as a **region creator**.

The model defines:

```math id="ml-region1"
\boxed{
H^+
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

and:

```math id="ml-region2"
\boxed{
H^-
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\right\}
}
```

Then classification is essentially:

```text id="ml-region-flow"
              Feature Space
                   │
                   ↓
            Decision Boundary
                   │
          ┌────────┴────────┐
          ↓                 ↓
         H⁺                 H⁻
          ↓                 ↓
      Prediction A       Prediction B
```

This is the most direct ML interpretation of half-space.

---

# 7.16 Why This Is Called a Linear Classifier

Because the decision function is linear in the features:

```math id="ml-linear"
\boxed{
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0
}
```

The zero set:

```math id="ml-zero-set"
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0=0
```

creates a hyperplane.

That hyperplane divides the feature space.

Therefore:

```text id="ml-linear-chain"
Linear Function
      ↓
Hyperplane
      ↓
Two Half-Spaces
      ↓
Two Regions
      ↓
Classification
```

---

# 7.17 Higher Dimensions

Suppose we have:

```math id="ml-highdim"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
\vdots\\
x_{100}
\end{bmatrix}
```

We cannot draw this feature space on paper.

But mathematically:

```math id="ml-highdim-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

still creates a hyperplane.

And it still divides the space into:

```math id="ml-highdim-positive"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

and:

```math id="ml-highdim-negative"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
```

So our 2D intuition scales directly to hundreds or thousands of features.

---

# 7.18 What Does "Side" Mean in High Dimensions?

This is worth clarifying.

In 2D, we can literally say:

```text
left side / right side
```

In 3D:

```text
above / below
```

But in 100 dimensions, those words stop being useful.

Instead, "side" means:

> **the sign of the point's displacement along the normal direction.**

Mathematically:

```math id="ml-highdim-side"
\operatorname{sign}
\left(
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right)
```

So the concept of a half-space survives even when visualization becomes impossible.

---

# 7.19 A Deeper Interpretation of the Weight Vector

Let's revisit:

```math id="ml-weight-vector"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_n
\end{bmatrix}
```

It has two related interpretations.

### Algebraic interpretation

Each $w_i$ controls how strongly feature $x_i$ contributes to the score:

```math id="ml-contribution"
w_ix_i
```

### Geometric interpretation

The complete vector $\overrightarrow{w}$ is normal to the decision boundary.

So:

```text id="ml-two-meanings"
Individual weights
      ↓
feature contributions

Complete weight vector
      ↓
normal to decision boundary
```

This distinction will become important when we later discuss model interpretation.

---

# 7.20 The Score as a "Signed Position"

A very useful mental model is to think of:

```math id="ml-signed-position"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

as a kind of **signed position indicator**.

It tells us:

```text id="ml-signed-position2"
positive
   ↓
one side

zero
   ↓
boundary

negative
   ↓
other side
```

After normalization:

```math id="ml-normalized-position"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

it becomes a true signed geometric distance.

---

# 7.21 One Expression — Complete ML Picture

Let's put the complete interpretation together.

```math id="ml-one-expression"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### If:

```math id="ml-positive"
f(\overrightarrow{x})>0
```

then:

```text id="ml-positive-flow"
Point
 ↓
+w side
 ↓
Positive half-space
 ↓
One model decision
```

### If:

```math id="ml-zero"
f(\overrightarrow{x})=0
```

then:

```text id="ml-zero-flow"
Point
 ↓
Decision boundary
```

### If:

```math id="ml-negative"
f(\overrightarrow{x})<0
```

then:

```text id="ml-negative-flow"
Point
 ↓
-w side
 ↓
Negative half-space
 ↓
Other model decision
```

---

# 7.22 Connection to Logistic Regression

This geometry becomes especially important in **Logistic Regression**.

The linear score is:

```math id="ml-logistic-score"
\boxed{
z=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

Logistic Regression then applies the sigmoid function:

```math id="ml-sigmoid"
\boxed{
\sigma(z)
=
\frac{1}{1+e^{-z}}
}
```

The important geometric point is that:

```math id="ml-logistic-boundary"
z=0
```

is still the decision boundary.

So:

```text id="ml-logistic-flow"
Feature Vector
      ↓
wᵀx + w₀
      ↓
     z
      ↓
   Sigmoid
      ↓
 Probability
```

The half-space concept remains underneath the probability model.

We will study this much more deeply when we reach Logistic Regression.

---

# 7.23 Connection to SVM

Similarly, SVM uses a linear decision boundary:

```math id="ml-svm-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

but asks an additional geometric question:

> **How far can we keep the training points from this boundary?**

That leads to:

```text id="ml-svm-flow"
Half-Spaces
    ↓
Decision Boundary
    ↓
Distance
    ↓
Margin
    ↓
Support Vectors
    ↓
SVM
```

So the concepts we are studying now are directly preparing us for SVM.

---

# 7.24 Why This Topic Is Important for ML

Half-space may initially look like a pure geometry topic.

But it gives us a fundamental mental model:

```text id="ml-importance"
Data Point
    ↓
Location in Feature Space
    ↓
Relative to Boundary
    ↓
Which Half-Space?
    ↓
Prediction
```

This idea appears throughout ML.

The terminology changes, but the geometric idea remains:

> **A boundary separates regions of the feature space.**

---

# 7.25 🎯 Ultimate ML Mental Model

Let's make this extremely simple.

Imagine an invisible wall:

```text id="ml-wall-final"
          Class A

        ●      ●
            ●

════════════════════════
       WALL
════════════════════════

          ●
      ●       ●

          Class B
```

The model learns the wall:

```math id="ml-wall-equation"
\boxed{
w^Tx+w_0=0
}
```

The normal vector:

```math id="ml-normal-final"
\boxed{
w
}
```

tells us the wall's orientation.

A new point arrives.

The model calculates:

```math id="ml-new-point"
\boxed{
w^Tx+w_0
}
```

Then:

```text id="ml-new-point-result"
positive → one side
negative → other side
zero     → exactly on wall
```

And if we ask:

> "How far is the point from the wall?"

we calculate:

```math id="ml-distance-final2"
\boxed{
\frac{|w^Tx+w_0|}
{\|w\|}
}
```

So the whole concept is:

```text id="ml-final-flow"
             DATA POINT
                  ↓
           Feature Vector x
                  ↓
           Linear Score
             wᵀx + w₀
                  ↓
       ┌──────────┼──────────┐
       ↓          ↓          ↓
      >0         =0         <0
       ↓          ↓          ↓
     Side A     Boundary    Side B
       │                     │
       └──────────┬──────────┘
                  ↓
              Prediction
```

---

# 7.26 One Important Conceptual Distinction

There are **three different things** we should keep separate:

### 1. Score

```math id="ml-dist1"
\boxed{
s=w^Tx+w_0
}
```

Tells us the algebraic position relative to the boundary.

### 2. Signed distance

```math id="ml-dist2"
\boxed{
d_{\text{signed}}
=
\frac{w^Tx+w_0}{\|w\|}
}
```

Tells us:

> which side + how far.

### 3. Ordinary distance

```math id="ml-dist3"
\boxed{
d=
\frac{|w^Tx+w_0|}{\|w\|}
}
```

Tells us:

> how far, ignoring which side.

Keep these three separate.

---

# 🧠 Part 7 Mental Model

When you see a linear classifier:

```math id="ml-mental"
\boxed{
w^Tx+w_0
}
```

immediately think:

```text id="ml-mental-flow"
             wᵀx + w₀
                  │
        ┌─────────┴─────────┐
        ↓                   ↓
      Sign               Magnitude
        ↓                   ↓
   Which side?         How far?
        ↓                   ↓
   Half-space        Distance
```

And:

```text id="ml-mental-w"
w
↓
normal vector
↓
orientation of boundary
```

while:

```text id="ml-mental-b"
w₀
↓
position of boundary
```

---

# 🔑 Part 7 Takeaways

### 1. A linear ML model creates a hyperplane.

```math id="ml-t1"
\boxed{
w^Tx+w_0=0
}
```

### 2. The hyperplane divides feature space into two half-spaces.

```math id="ml-t2"
\boxed{
w^Tx+w_0>0
}
```

and:

```math id="ml-t3"
\boxed{
w^Tx+w_0<0
}
```

### 3. The weight vector is normal to the decision boundary.

```math id="ml-t4"
\boxed{
w\perp\text{decision boundary}
}
```

### 4. The sign determines the side.

```text id="ml-t5"
positive → +w side
negative → -w side
zero     → boundary
```

### 5. The raw score is not the geometric distance.

```math id="ml-t6"
\boxed{
s=w^Tx+w_0
}
```

### 6. Signed distance is:

```math id="ml-t7"
\boxed{
d_{\text{signed}}
=
\frac{w^Tx+w_0}{\|w\|}
}
```

### 7. Ordinary distance is:

```math id="ml-t8"
\boxed{
d=
\frac{|w^Tx+w_0|}{\|w\|}
}
```

### 8. The ultimate ML interpretation:

> **A linear classifier divides feature space into two half-spaces and uses the side of the decision boundary to make a prediction.**

---

## One-Line Understanding

> **In Machine Learning, a linear decision boundary acts like an invisible wall in feature space; the weight vector $\overrightarrow{w}$ is perpendicular to that wall, and the sign of $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ tells the model which side of the wall a data point lies on.**

---

## ✅ Flow Check

We are still exactly on the approved path:

```text
Part 1 — Why Does a Plane Divide Space?             ✓
Part 2 — How Does the Equation Identify
          the Two Half-Spaces?                       ✓
Part 3 — Geometric Meaning of Positive and
          Negative Half-Spaces                       ✓
Part 4 — Mathematical Definition of Half-Space      ✓
Part 5 — Numerical Examples                         ✓
Part 6 — Geometric Interpretation                    ✓
Part 7 — Machine Learning Perspective               ✓
```

### Next:

# **Part 8 — Python / NumPy**

We will implement exactly what we have learned:

```text
Point → wᵀx + w₀ → sign → half-space
```

and then calculate signed/ordinary distance using NumPy.
