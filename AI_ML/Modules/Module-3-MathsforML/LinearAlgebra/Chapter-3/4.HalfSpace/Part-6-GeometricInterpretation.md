# Half Space

# Part 6 — Geometric Interpretation

So far, we have done the mathematics and numerical examples.

Now we step back and put **everything into one geometric picture**.

The goal of this part is:

> **When you see a plane, normal vector, positive half-space, negative half-space, and signed distance, you should be able to visualize what all of them are doing together.**

---

# 6.1 Start With the Plane

Consider the hyperplane:

```math id="hs6-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Think of this simply as an **invisible wall**.

In 2D:

```text id="hs6-wall2d"
                  y
                  ↑

        Region 1
          ●
             ●

────────────────────────
       Boundary
────────────────────────

             ●
        ●
        Region 2

────────────────────────→ x
```

In 3D, replace the line with a plane:

```text id="hs6-wall3d"
             Half-Space 1
          ↗       ●
       ●
────────────────────────────
          PLANE
────────────────────────────
       ●
            ↘
             Half-Space 2
```

The plane itself is the **boundary**.

---

# 6.2 The Plane Doesn't Just Separate — It Creates Two Directions

A plane has a normal vector:

```math id="hs6-normal"
\boxed{
\overrightarrow{w}
}
```

and:

```math id="hs6-perp"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

Therefore, the normal gives us two opposite directions:

```text id="hs6-directions"
                    +w
                     ↑
                     │
                     │
═════════════════════╪═════════════════════
                    PLANE
═════════════════════╪═════════════════════
                     │
                     │
                     ↓
                    -w
```

This is the key to understanding the two half-spaces.

---

# 6.3 Think of $\overrightarrow{w}$ as an Arrow Coming Out of the Wall

Imagine standing in front of a wall.

Draw an arrow straight out from the wall:

```text id="hs6-wall-arrow"
                    ↑
                    │
                    │  w
                    │
                    │
════════════════════╪════════════════════
                   WALL
```

That arrow is perpendicular to the wall.

Now there are naturally two sides:

```text id="hs6-two-sides"
            +w side
               ↑
               │
═══════════════╪═══════════════
              WALL
═══════════════╪═══════════════
               │
               ↓
            -w side
```

Therefore:

> **The normal vector gives us the orientation that lets us distinguish the two sides of the plane.**

---

# 6.4 Positive Half-Space

The side toward which $\overrightarrow{w}$ points is called the **positive half-space**.

Mathematically:

```math id="hs6-positive"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

Visualize:

```text id="hs6-positive-visual"
                  +w
                   ↑
                   │
            ●      │
                 ● │
                   │
═══════════════════╪══════════════════
                 PLANE
═══════════════════╪══════════════════
                   │
                   │
```

So:

```text id="hs6-positive-meaning"
+w direction
     ↓
Positive half-space
```

---

# 6.5 Negative Half-Space

The opposite side is the negative half-space.

Mathematically:

```math id="hs6-negative"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

Visualize:

```text id="hs6-negative-visual"
                   │
                   │
═══════════════════╪══════════════════
                 PLANE
═══════════════════╪══════════════════
                   │
                 ● │
            ●      │
                   ↓
                  -w
```

So:

```text id="hs6-negative-meaning"
-w direction
     ↓
Negative half-space
```

---

# 6.6 What About the Plane Itself?

Points exactly on the plane satisfy:

```math id="hs6-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Therefore:

```text id="hs6-three-regions"
       Positive
          ↑
          │
          │
══════════╪══════════
        Plane
══════════╪══════════
          │
          │
          ↓
       Negative
```

We now have the complete three-way picture:

```text id="hs6-three"
> 0  → positive half-space

= 0  → plane

< 0  → negative half-space
```

---

# 6.7 Why Does the Sign Have a Geometric Meaning?

This is the part we derived in Part 3.

Choose any point $P$ on the plane.

For another point $X$:

```math id="hs6-px"
\overrightarrow{PX}
=
\overrightarrow{x}-\overrightarrow{p}
```

We established:

```math id="hs6-key"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
\overrightarrow{w}^{T}
(\overrightarrow{x}-\overrightarrow{p})
}
```

Therefore:

```math id="hs6-key2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
=
\overrightarrow{w}^{T}\overrightarrow{PX}
}
```

Now the geometry becomes much easier.

The dot product asks:

> **How much does $\overrightarrow{PX}$ point in the direction of $\overrightarrow{w}$?**

---

# 6.8 Point on the Positive Side

Suppose $X$ lies toward $+\overrightarrow{w}$.

Then:

```text id="hs6-positive-point"
                    +w
                     ↑
                     │
                     │  ● X
                     │ /
                     │/
═════════════════════●══════════════════
                     P
                    PLANE
```

The angle between:

```math id="hs6-angle1"
\overrightarrow{w}
```

and:

```math id="hs6-px1"
\overrightarrow{PX}
```

is less than $90^\circ$.

Therefore:

```math id="hs6-cos1"
\cos\theta>0
```

and hence:

```math id="hs6-dot1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{PX}>0
}
```

Therefore:

```math id="hs6-fpositive"
\boxed{
f(\overrightarrow{x})>0
}
```

So the point is in the positive half-space.

---

# 6.9 Point on the Negative Side

Now suppose $X$ is on the opposite side.

```text id="hs6-negative-point"
                     +w
                      ↑
                      │
══════════════════════●════════════════
                      P
                    PLANE
                      │\
                      │ \
                      │  ● X
                      ↓
                     -w
```

Now the angle between $\overrightarrow{w}$ and $\overrightarrow{PX}$ is greater than $90^\circ$.

Therefore:

```math id="hs6-cos2"
\cos\theta<0
```

and:

```math id="hs6-dot2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{PX}<0
}
```

Therefore:

```math id="hs6-fnegative"
\boxed{
f(\overrightarrow{x})<0
}
```

So the point belongs to the negative half-space.

---

# 6.10 Point on the Plane

If $X$ itself lies on the plane:

```text id="hs6-on-plane"
══════════════════════════════
          ● X
══════════════════════════════
```

then $\overrightarrow{PX}$ lies along the plane.

Since $\overrightarrow{w}$ is perpendicular to the plane:

```math id="hs6-perpendicular"
\theta=90^\circ
```

Therefore:

```math id="hs6-zero-dot"
\overrightarrow{w}^{T}\overrightarrow{PX}=0
```

and:

```math id="hs6-zero-f"
\boxed{
f(\overrightarrow{x})=0
}
```

Exactly as expected.

---

# 6.11 One Picture Explains Everything

This is the picture I want you to keep in your mind:

```text id="hs6-master-picture"
                         +w
                          ↑
                          │
                    ● X₁  │
                          │
                          │
══════════════════════════●══════════════════
                         P
                       PLANE
══════════════════════════════════════════════
                          │
                          │
                    ● X₂  │
                          │
                          ↓
                         -w
```

For $X_1$:

```math id="hs6-x1"
f(X_1)>0
```

For $P$:

```math id="hs6-p0"
f(P)=0
```

For $X_2$:

```math id="hs6-x2"
f(X_2)<0
```

The algebra and geometry are saying exactly the same thing.

---

# 6.12 Now Bring Distance Into the Picture

We previously learned:

```math id="hs6-distance"
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

Why does this work geometrically?

Because the shortest path from $X$ to the plane is perpendicular to the plane.

And the perpendicular direction is exactly:

```math id="hs6-w-direction"
\overrightarrow{w}
```

Therefore:

```text id="hs6-distance-path"
             X
             ●
             │
             │
             │  shortest path
             │
             │
═════════════●══════════════
           Plane
```

That vertical path is along the normal direction.

---

# 6.13 Signed Distance Gives the Complete Picture

Instead of ordinary distance, consider:

```math id="hs6-signed"
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

This contains **two pieces of information**.

### Sign

```text id="hs6-sign"
+ → +w side
- → -w side
```

### Magnitude

```text id="hs6-magnitude"
|d_signed|
      ↓
perpendicular distance
```

So:

```text id="hs6-complete"
             Signed Distance
                    │
             ┌──────┴──────┐
             ↓             ↓
           Sign         Magnitude
             ↓             ↓
        Which side?     How far?
```

This is probably the most useful mental model for the whole Half Space topic.

---

# 6.14 Why Absolute Value Removes the Side Information

Ordinary distance is:

```math id="hs6-ordinary"
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

The absolute value does something very specific:

```text id="hs6-abs"
+5 → 5
-5 → 5
```

So both sides become the same distance.

That's exactly what ordinary distance should do.

But we lose:

```text id="hs6-lost"
which side?
```

Therefore:

```text id="hs6-distance-comparison"
Signed distance
     ↓
side + distance

Ordinary distance
     ↓
distance only
```

---

# 6.15 A Very Useful Analogy: A Road With a Center Line

Imagine a straight road.

```text id="hs6-road"
              North
                ↑
                │
────────────────●────────────────
             Center
              Line
─────────────────────────────────
                │
                ↓
              South
```

Suppose we define "North" as positive.

Then:

```text id="hs6-road-sign"
North side → positive
Center      → zero
South side → negative
```

And signed distance might say:

```text id="hs6-road-values"
+10 km
   ↑
North

  0
   ↑
Center

-5 km
   ↑
South
```

The **sign tells us direction**, while the **magnitude tells us how far**.

A hyperplane works exactly the same way, except the "road" is now an $(n-1)$-dimensional boundary.

---

# 6.16 This Also Explains the Meaning of the Bias

Our plane equation is:

```math id="hs6-bias"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Recall:

```math id="hs6-origin-score"
f(\overrightarrow{0})=w_0
```

So the bias determines the signed score of the origin.

Therefore:

```text id="hs6-bias-meaning"
w₀ > 0
 ↓
origin is on +w side

w₀ = 0
 ↓
origin is on boundary

w₀ < 0
 ↓
origin is on -w side
```

And the distance is:

```math id="hs6-origin-distance"
\boxed{
d_{\text{origin}}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So our previous topic about the origin fits naturally into this geometric picture.

---

# 6.17 Now Connect Everything to Machine Learning

This is where the whole journey becomes valuable.

Suppose our ML model has learned:

```math id="hs6-ml-model"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The decision boundary is:

```math id="hs6-ml-boundary"
\boxed{
f(\overrightarrow{x})=0
}
```

That boundary divides feature space into two half-spaces.

```text id="hs6-ml-space"
                   Class 1
                ●       ●
                    ●

══════════════════════════════
       Decision Boundary
══════════════════════════════

             ●
          ●      ●
                   Class 0
```

The classifier can use:

```text id="hs6-classify"
f(x) > 0
   ↓
one side

f(x) < 0
   ↓
other side
```

The exact mapping of sides to class labels is a modelling choice.

---

# 6.18 What Does the Weight Vector Mean Geometrically?

This is a very important ML interpretation.

The weight vector:

```math id="hs6-weights"
\boxed{
\overrightarrow{w}
}
```

is perpendicular to the decision boundary.

So:

```text id="hs6-weights-picture"
                       w
                       ↑
                       │
                       │
        Class 1       │
           ●          │
──────────────────────┼──────────────────
                  Decision Boundary
──────────────────────┼──────────────────
                       │
                       │
             ●         │
        Class 0        │
                       ↓
```

Therefore:

> **The learned weight vector tells us the orientation of the decision boundary and establishes its positive direction.**

This is much deeper than simply saying:

> "Weights are feature importance."

The geometric role is:

```text id="hs6-w-role"
w
↓
normal direction
↓
orientation of boundary
↓
direction separating the two sides
```

---

# 6.19 What Does a Data Vector Mean Here?

Suppose:

```math id="hs6-x-vector"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3
\end{bmatrix}
```

You can think of it as:

```text id="hs6-feature-vector"
[x₁, x₂, x₃]
     ↓
one data point
```

This point has a location in feature space.

The model asks:

```math id="hs6-score"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

which is essentially:

> **"Where is this data point relative to my decision boundary?"**

---

# 6.20 One Expression, Three Interpretations

This is a powerful connection.

Take:

```math id="hs6-expression"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

It can be interpreted in three ways.

### Algebraically

It is the **linear model score**.

### Geometrically

Its sign identifies the **half-space**.

### After normalization

```math id="hs6-normalized"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

it becomes the **signed perpendicular distance**.

So:

```text id="hs6-three-interpretations"
              wᵀx + w₀
                    │
       ┌────────────┼────────────┐
       ↓            ↓            ↓
    Algebra      Geometry      Distance
       │            │            │
      Score      Which side?   How far?
```

This is an extremely important ML mental model.

---

# 6.21 Why Half-Space Is Important for Classification

A binary linear classifier essentially does:

```text id="hs6-classification"
              Feature Vector
                     │
                     ↓
               Linear Score
                     │
                     ↓
              ┌──────┴──────┐
              ↓             ↓
            > 0            < 0
              ↓             ↓
           Region 1       Region 2
              ↓             ↓
           Class A        Class B
```

So the concept of half-space gives us the geometric meaning of:

> **"Classify based on which side of a boundary the point lies."**

---

# 6.22 Connection to Future SVM Understanding

This geometric picture becomes even more important when we eventually study **Support Vector Machines**.

SVM asks a deeper question:

> **Can we choose a decision boundary such that the two classes are separated with the largest possible margin?**

Visualize:

```text id="hs6-svm-preview"
       Class A

    ●       ●

───────────────
   Margin
───────────────
      Boundary
───────────────
   Margin
───────────────

    ●       ●

       Class B
```

So today's concepts:

```text id="hs6-svm-chain"
Plane
 ↓
Half-space
 ↓
Which side?
 ↓
Distance from boundary
 ↓
Margin
 ↓
SVM
```

are building toward that understanding.

We are **not studying SVM yet**; this is just showing why this geometry matters later.

---

# 6.23 The Complete Geometric Story

Let's now put everything together.

```text id="hs6-full-story"
                  Feature Space
                       │
                       ↓
                Linear Boundary
                       │
                       ↓
        ┌──────────────┴──────────────┐
        ↓                             ↓
   Positive Side                 Negative Side
        │                             │
        ↓                             ↓
       +w                            -w
        │                             │
        └──────────────┬──────────────┘
                       ↓
                 Normal Vector
                       │
                       ↓
                Perpendicular
                       │
                       ↓
               Shortest Distance
                       │
                       ↓
             Signed / Ordinary
                  Distance
```

The same geometry is being described from different viewpoints.

---

# 6.24 🎯 Ultimate Goal in ML — Simple Terms

Let's return to our permanent section.

Imagine your ML model creates an invisible wall:

```text id="hs6-final-wall"
                  Class A
                ●       ●

                    ↑ w
                    │
                    │
════════════════════╪════════════════════
       Decision Boundary / Wall
════════════════════╪════════════════════
                    │
                    │
                    ↓
                  Class B
                ●       ●
```

The model has essentially created:

> **A wall in feature space.**

Then for every new data point, we can ask:

### Question 1

> **Which side of the wall am I on?**

Use the sign:

```math id="hs6-final-sign"
\boxed{
\operatorname{sign}
\left(
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right)
}
```

### Question 2

> **How far am I from the wall?**

Use:

```math id="hs6-final-distance"
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

### Question 3

> **Which direction is the positive side?**

Look at:

```math id="hs6-final-w"
\boxed{
\overrightarrow{w}
}
```

So the entire concept becomes:

```text id="hs6-ultimate"
               Data Point
                    │
                    ↓
             Linear Score
              wᵀx + w₀
                    │
          ┌─────────┴─────────┐
          ↓                   ↓
        Sign               Magnitude
          ↓                   ↓
     Which side?           How far?
          │                   │
          └─────────┬─────────┘
                    ↓
              ML Decision
```

---

# 6.25 One Very Important Clarification

Do not think:

> **"A half-space is a new type of object separate from the plane."**

Instead think:

> **The plane is the boundary, and the half-spaces are the two regions created by that boundary.**

So:

```text id="hs6-object-relation"
Plane
 ↓
boundary

Half-space 1
 ↓
one side of boundary

Half-space 2
 ↓
other side of boundary
```

This simple distinction will prevent a lot of confusion later.

---

# 6.26 Another Important Clarification

Also don't think:

> **"Positive means physically above the plane."**

Not necessarily.

Positive means:

```text id="hs6-positive-meaning"
toward +w
```

Negative means:

```text id="hs6-negative-meaning"
toward -w
```

The plane can have **any orientation** in space.

So always use the normal vector as your reference.

---

# 🧠 Part 6 Mental Model

When you see:

```math id="hs6-mental-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

immediately visualize:

```text id="hs6-mental-picture"
                    +w
                     ↑
                     │
                     │
       Positive      │
       Half-Space    │
                     │
═════════════════════╪════════════════════
                  PLANE
═════════════════════╪════════════════════
                     │
                     │
       Negative      │
       Half-Space    │
                     ↓
                    -w
```

Then remember:

```text id="hs6-mental"
Sign
 ↓
Which side?

Magnitude / ||w||
 ↓
How far?

w
 ↓
Normal direction
```

---

# 🔑 Part 6 Takeaways

### 1. The plane is the boundary.

```math id="hs6-t1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 2. The normal vector is perpendicular to the plane.

```math id="hs6-t2"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

### 3. The normal establishes the orientation.

```text id="hs6-t3"
+w → positive half-space
-w → negative half-space
```

### 4. The sign identifies the side.

```math id="hs6-t4"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\begin{cases}
>0 & \text{positive side}\\
=0 & \text{on boundary}\\
<0 & \text{negative side}
\end{cases}
}
```

### 5. Signed distance gives side + distance.

```math id="hs6-t5"
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

### 6. Ordinary distance gives only distance.

```math id="hs6-t6"
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

### 7. In ML, the plane becomes a decision boundary.

```text id="hs6-t7"
Decision Boundary
       ↓
Two Half-Spaces
       ↓
Two possible regions/classes
```

---

## One-Line Understanding

> **A plane is an invisible wall, $\overrightarrow{w}$ is the arrow perpendicular to that wall, the two directions $+\overrightarrow{w}$ and $-\overrightarrow{w}$ define the two half-spaces, and $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ tells us which side a point is on while its normalized magnitude tells us how far it is from the wall.**

---

## ✅ Where We Are in the Approved Flow

```text
Part 1 — Why Does a Plane Divide Space?             ✓
Part 2 — How Does the Equation Identify the
          Two Half-Spaces?                           ✓
Part 3 — Geometric Meaning of Positive and
          Negative Half-Spaces                       ✓
Part 4 — Mathematical Definition of Half-Space      ✓
Part 5 — Numerical Examples                         ✓
Part 6 — Geometric Interpretation                    ✓
```

### Next

# **Part 7 — Machine Learning Perspective**

Here we will make the ML connection explicit and structured: **feature space → linear decision boundary → two half-spaces → classification**, while carefully connecting the **linear score, sign, signed distance, and geometric distance** without introducing unrelated concepts.

