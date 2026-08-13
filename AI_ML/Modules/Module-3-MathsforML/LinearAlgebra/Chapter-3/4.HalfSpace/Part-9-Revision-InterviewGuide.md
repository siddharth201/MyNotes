
# Half Space

# Part 9 — Revision + Interview Guide

We have now completed the entire **Half-Space** topic.

This final part is designed to do three things:

1. **Compress the entire topic into a revision-ready mental model**
2. **Connect every mathematical formula to its geometric meaning**
3. **Prepare you for ML/interview questions**

The most important thing is that you should **understand the geometry first and memorize formulas second**.

---

# 9.1 The Entire Topic in One Picture

Start with the linear boundary:

```math id="hs9-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Think:

> **This is an invisible wall in feature space.**

```text id="hs9-wall"
                    +w
                     ↑
                     │
             ●       │
                  ●  │
                     │
═════════════════════╪══════════════════
             Decision Boundary
═════════════════════╪══════════════════
                     │
                  ●  │
             ●       │
                     ↓
                    -w
```

The normal vector:

```math id="hs9-normal"
\boxed{
\overrightarrow{w}
}
```

is perpendicular to the boundary.

Therefore, the space is divided into two regions.

---

# 9.2 The Three Fundamental Regions

For:

```math id="hs9-function"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

we have:

### Positive Half-Space

```math id="hs9-positive"
\boxed{
f(\overrightarrow{x})>0
}
```

### Boundary

```math id="hs9-boundary2"
\boxed{
f(\overrightarrow{x})=0
}
```

### Negative Half-Space

```math id="hs9-negative"
\boxed{
f(\overrightarrow{x})<0
}
```

The entire concept can therefore be remembered as:

```text id="hs9-three"
             f(x)
               │
       ┌───────┼───────┐
       ↓       ↓       ↓
      >0      =0      <0
       ↓       ↓       ↓
      H⁺     Plane     H⁻
```

---

# 9.3 What Exactly Is a Half-Space?

A half-space is:

> **One of the two regions created when a hyperplane divides the entire space.**

Mathematically:

```math id="hs9-hplus"
\boxed{
H^+
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

and:

```math id="hs9-hminus"
\boxed{
H^-
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\right\}
}
```

The word **half** does not mean "half of some finite volume."

It means:

> **one of the two sides of the boundary.**

---

# 9.4 The Most Important Mental Model

Don't begin with equations.

Begin with:

```text id="hs9-mental"
             Invisible Wall
                   │
        ┌──────────┴──────────┐
        ↓                     ↓
     One side              Other side
        │                     │
       +w                    -w
        │                     │
        ↓                     ↓
       H⁺                    H⁻
```

Then the equation tells us which side a point belongs to.

---

# 9.5 Why Does $\overrightarrow{w}$ Matter?

The vector:

```math id="hs9-w"
\boxed{
\overrightarrow{w}
}
```

is the **normal vector**.

Therefore:

```math id="hs9-perp"
\boxed{
\overrightarrow{w}
\perp
\text{plane}
}
```

It establishes the orientation of the two sides:

```text id="hs9-w-direction"
             +w
              ↑
              │
══════════════╪══════════════
             Plane
══════════════╪══════════════
              │
              ↓
             -w
```

Therefore:

> **Positive and negative are not "up and down" or "left and right" by definition. They are defined relative to the chosen normal vector.**

---

# 9.6 The Sign Is the Key

Given a point $\overrightarrow{x}$:

```math id="hs9-score"
\boxed{
S=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

look at only the sign.

```text id="hs9-sign"
S > 0
 ↓
Positive half-space

S = 0
 ↓
Boundary

S < 0
 ↓
Negative half-space
```

This is the fastest way to determine the half-space.

---

# 9.7 Why Does the Sign Work?

Because:

```math id="hs9-dot"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

can be related to the projection of the point's displacement from the plane onto the normal direction.

Therefore:

```text id="hs9-projection"
positive projection
      ↓
toward +w

zero projection
      ↓
on boundary

negative projection
      ↓
toward -w
```

This is why an algebraic sign has a geometric meaning.

---

# 9.8 Score vs Signed Distance vs Ordinary Distance

This distinction is extremely important.

## 1. Linear Score

```math id="hs9-score2"
\boxed{
S=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

It tells us the algebraic position relative to the boundary.

---

## 2. Signed Distance

```math id="hs9-signed"
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

```text id="hs9-signed-meaning"
sign
 ↓
which side?

magnitude
 ↓
how far?
```

---

## 3. Ordinary Distance

```math id="hs9-distance"
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

It tells us only:

> **How far is the point from the boundary?**

The absolute value removes the side information.

---

# 9.9 Why Do We Divide by $|\overrightarrow{w}|$?

This is one of the most important conceptual points.

The raw score depends on the scale of $\overrightarrow{w}$.

Suppose:

```math id="hs9-scale1"
\overrightarrow{w}
```

defines a boundary.

Then:

```math id="hs9-scale2"
2\overrightarrow{w}
```

with:

```math id="hs9-scale3"
2w_0
```

defines the **same boundary**.

But the raw score doubles.

Therefore:

```text id="hs9-scale"
Same boundary
     ↓
Different raw scores possible
```

But geometric distance cannot change.

Therefore we normalize:

```math id="hs9-normalize"
\boxed{
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

This removes the arbitrary scaling of the normal vector.

---

# 9.10 Why Absolute Value?

Ordinary distance cannot be negative.

Suppose:

```math id="hs9-plusminus"
d_{\text{signed}}=+5
```

and another point has:

```math id="hs9-minus"
d_{\text{signed}}=-5
```

They are on opposite sides but both are:

```math id="hs9-abs5"
\boxed{
5\text{ units from the boundary}
}
```

Therefore:

```math id="hs9-abs"
\boxed{
d=|d_{\text{signed}}|
}
```

---

# 9.11 Open and Closed Half-Space

### Open half-space

Boundary excluded:

```math id="hs9-open"
\boxed{
f(\overrightarrow{x})>0
}
```

or:

```math id="hs9-open2"
\boxed{
f(\overrightarrow{x})<0
}
```

### Closed half-space

Boundary included:

```math id="hs9-closed"
\boxed{
f(\overrightarrow{x})\geq0
}
```

or:

```math id="hs9-closed2"
\boxed{
f(\overrightarrow{x})\leq0
}
```

For our ML intuition, the most important distinction remains:

```text id="hs9-open-closed"
> 0 → positive side
= 0 → boundary
< 0 → negative side
```

---

# 9.12 Numerical Decision Procedure

Given:

```math id="hs9-problem"
\boxed{
w_1x_1+w_2x_2+\cdots+w_nx_n+w_0=0
}
```

and a point:

```math id="hs9-point"
\overrightarrow{x}
```

follow these steps.

### Step 1

Calculate:

```math id="hs9-step1"
\boxed{
S=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### Step 2

Check the sign:

```text id="hs9-step2"
S > 0 → H⁺

S = 0 → Boundary

S < 0 → H⁻
```

### Step 3

If distance is requested:

```math id="hs9-step3"
\boxed{
d=
\frac{|S|}
{\|\overrightarrow{w}\|}
}
```

### Step 4

If signed distance is requested:

```math id="hs9-step4"
\boxed{
d_{\text{signed}}
=
\frac{S}
{\|\overrightarrow{w}\|}
}
```

---

# 9.13 Numerical Example — Complete Revision

Consider:

```math id="hs9-example-plane"
\boxed{
2x+3y-6=0
}
```

Therefore:

```math id="hs9-example-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

and:

```math id="hs9-example-w0"
w_0=-6
```

Take:

```math id="hs9-example-point"
P=
\begin{bmatrix}
3\\
2
\end{bmatrix}
```

### Score

```math id="hs9-example-score"
S
=
2(3)+3(2)-6
```

```math id="hs9-example-score2"
\boxed{
S=6
}
```

Therefore:

```text id="hs9-example-side"
S > 0
 ↓
Positive half-space
```

---

### Norm

```math id="hs9-example-norm"
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

### Signed distance

```math id="hs9-example-signed"
\boxed{
d_{\text{signed}}
=
\frac{6}{\sqrt{13}}
}
```

### Ordinary distance

```math id="hs9-example-distance"
\boxed{
d=
\frac{6}{\sqrt{13}}
\approx1.664
}
```

So our final understanding is:

```text id="hs9-example-summary"
Score = +6
   ↓
Positive half-space

Signed distance ≈ +1.664
   ↓
+ side and 1.664 units away

Ordinary distance ≈ 1.664
   ↓
1.664 units away
```

---

# 9.14 Python / NumPy Revision

The mathematical expression:

```math id="hs9-python-math"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

becomes:

```python id="hs9-code-score"
score = np.dot(w, x) + w0
```

The norm:

```math id="hs9-python-norm"
\boxed{
\|\overrightarrow{w}\|
}
```

becomes:

```python id="hs9-code-norm"
np.linalg.norm(w)
```

Signed distance:

```python id="hs9-code-signed"
signed_distance = score / np.linalg.norm(w)
```

Ordinary distance:

```python id="hs9-code-distance"
distance = abs(score) / np.linalg.norm(w)
```

For many data points:

```python id="hs9-code-many"
scores = X @ w + w0
```

This is the basic NumPy implementation of our geometry.

---

# 9.15 The Complete Mathematics → Code Map

| Concept         | Mathematics                                    | NumPy                       |         |                                  |
| --------------- | ---------------------------------------------- | --------------------------- | ------- | -------------------------------- |
| Normal vector   | $\overrightarrow{w}$                           | `w`                         |         |                                  |
| Data point      | $\overrightarrow{x}$                           | `x`                         |         |                                  |
| Bias            | $w_0$                                          | `w0`                        |         |                                  |
| Linear score    | $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ | `np.dot(w, x) + w0`         |         |                                  |
| Norm            | $|\overrightarrow{w}|$                         | `np.linalg.norm(w)`         |         |                                  |
| Signed distance | $\frac{w^Tx+w_0}{|w|}$                         | `score / np.linalg.norm(w)` |         |                                  |
| Distance        | $\frac{                                        | w^Tx+w_0                    | }{|w|}$ | `abs(score) / np.linalg.norm(w)` |
| Many points     | $X\overrightarrow{w}+w_0$                      | `X @ w + w0`                |         |                                  |

---

# 9.16 Machine Learning Mental Model

This is the most important ML connection.

A linear model learns:

```math id="hs9-ml-model"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

This creates:

```math id="hs9-ml-boundary"
\boxed{
f(\overrightarrow{x})=0
}
```

which is the decision boundary.

That boundary creates two half-spaces:

```math id="hs9-ml-hplus"
\boxed{
f(\overrightarrow{x})>0
}
```

and:

```math id="hs9-ml-hminus"
\boxed{
f(\overrightarrow{x})<0
}
```

Then:

```text id="hs9-ml-flow"
Feature Vector
      ↓
Linear Score
      ↓
Sign
      ↓
Which Half-Space?
      ↓
Prediction
```

---

# 9.17 🎯 Ultimate Goal in ML — Layman Version

Imagine an ML model builds an invisible wall:

```text id="hs9-wall"
             Class A
          ●       ●
              ●

════════════════════════
       INVISIBLE WALL
════════════════════════

              ●
        ●         ●

             Class B
```

When a new data point arrives, the model asks:

> **"Which side of my wall are you on?"**

Mathematically:

```math id="hs9-question"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

If needed, it can ask another question:

> **"How far are you from the wall?"**

```math id="hs9-distance-question"
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

That is the fundamental ML connection.

---

# 9.18 The Full Journey We Have Built

Look at how the concepts have connected from the beginning.

```text id="hs9-journey"
Vector
  ↓
Direction
  ↓
Dot Product
  ↓
Projection
  ↓
Normal Vector
  ↓
Plane
  ↓
Point-to-Plane Distance
  ↓
Origin-to-Plane Distance
  ↓
Half-Space
  ↓
Decision Boundary
  ↓
Linear Classification
```

This is **not a collection of unrelated mathematical formulas**.

Each topic prepared us for the next one.

---

# 9.19 The Most Important Formula Cluster

You should be able to recall these together.

### Hyperplane

```math id="hs9-formula1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Positive half-space

```math id="hs9-formula2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

### Negative half-space

```math id="hs9-formula3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

### Signed distance

```math id="hs9-formula4"
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

### Ordinary distance

```math id="hs9-formula5"
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

These five formulas are the core of this topic.

---

# 9.20 Common Mistakes

## Mistake 1 — Thinking Half-Space Is the Plane

Wrong:

> "The plane is the half-space."

Correct:

```text id="hs9-mistake1"
Plane
 ↓
boundary

Half-space
 ↓
region on one side
```

---

## Mistake 2 — Thinking Positive Means Physically Up

Wrong:

> Positive always means above.

Correct:

> Positive means the side associated with $+\overrightarrow{w}$.

---

## Mistake 3 — Thinking Score Equals Distance

Wrong:

```math id="hs9-wrong-score-distance"
d=|w^Tx+w_0|
```

Correct:

```math id="hs9-correct-score-distance"
\boxed{
d=
\frac{|w^Tx+w_0|}
{\|w\|}
}
```

---

## Mistake 4 — Forgetting the Bias

Wrong:

```math id="hs9-wrong-bias"
w^Tx
```

Correct:

```math id="hs9-correct-bias"
\boxed{
w^Tx+w_0
}
```

---

## Mistake 5 — Using Absolute Value When Determining the Side

Wrong:

```math id="hs9-wrong-abs"
|w^Tx+w_0|
```

This destroys the sign.

Correct:

```math id="hs9-correct-sign"
w^Tx+w_0
```

---

## Mistake 6 — Thinking the Normal Vector Is a Data Point

The normal vector:

```math id="hs9-w"
\overrightarrow{w}
```

defines the orientation of the boundary.

The feature vector:

```math id="hs9-x"
\overrightarrow{x}
```

represents the data point.

They have different roles.

---

# 9.21 Interview Questions — Level 1

### Q1. What is a half-space?

**Answer:**

A half-space is one of the two regions into which a hyperplane divides the space.

Mathematically, for:

```math id="hs9-iq1"
w^Tx+w_0=0
```

the two open half-spaces are:

```math id="hs9-iq1a"
w^Tx+w_0>0
```

and:

```math id="hs9-iq1b"
w^Tx+w_0<0
```

---

### Q2. How do you determine which half-space a point belongs to?

Calculate:

```math id="hs9-iq2"
\boxed{
w^Tx+w_0
}
```

Then inspect the sign:

```text id="hs9-iq2a"
positive → positive half-space
negative → negative half-space
zero     → boundary
```

---

### Q3. What is the role of $\overrightarrow{w}$?

$\overrightarrow{w}$ is the normal vector to the hyperplane.

It determines the orientation of the boundary and establishes the positive and negative directions.

---

### Q4. Why is the normal vector perpendicular to the plane?

Every direction lying within the plane has zero dot product with the normal vector.

Therefore, the normal vector is perpendicular to every direction in the plane.

---

# 9.22 Interview Questions — Level 2

### Q5. Is $w^Tx+w_0$ the distance from the point to the plane?

**No.**

It is a linear score.

The signed distance is:

```math id="hs9-iq5"
\boxed{
\frac{w^Tx+w_0}{\|w\|}
}
```

and ordinary distance is:

```math id="hs9-iq5b"
\boxed{
\frac{|w^Tx+w_0|}{\|w\|}
}
```

---

### Q6. Why do we divide by $|w|$?

Because the representation of a hyperplane is not unique with respect to scaling.

Multiplying both $\overrightarrow{w}$ and $w_0$ by the same non-zero constant leaves the same geometric boundary.

Dividing by $|\overrightarrow{w}|$ removes this arbitrary scaling and gives the actual geometric distance.

---

### Q7. What does the sign of the signed distance tell us?

It tells us which side of the hyperplane the point lies on.

```text id="hs9-iq7"
positive → +w side
negative → -w side
zero     → boundary
```

---

### Q8. Why is absolute value used in point-to-plane distance?

Because ordinary distance is non-negative and should not depend on which side of the plane the point lies on.

---

# 9.23 Interview Questions — Level 3

### Q9. If I multiply the entire plane equation by $2$, does the plane change?

No.

For example:

```math id="hs9-iq9a"
x+y-4=0
```

and:

```math id="hs9-iq9b"
2x+2y-8=0
```

represent the same plane.

But the raw score doubles.

That's why the distance formula normalizes by $|w|$.

---

### Q10. If I replace $\overrightarrow{w}$ by $-\overrightarrow{w}$, what happens?

The geometric boundary remains the same, but the positive and negative half-spaces swap.

```text id="hs9-iq10"
w → -w
 ↓
same boundary
 ↓
positive ↔ negative
```

---

### Q11. What is the ML interpretation of a half-space?

In a linear classifier, the decision boundary divides feature space into two half-spaces. The model uses the sign of its linear decision function to determine which side a data point belongs to.

---

### Q12. What is the geometric meaning of the weight vector in a linear classifier?

The weight vector is normal to the decision boundary.

It determines the orientation of the decision boundary and the direction associated with positive scores.

---

# 9.24 Interview Question — Very Important

### Q13. What is the difference between a linear score and signed distance?

**Linear score:**

```math id="hs9-iq13-score"
\boxed{
s=w^Tx+w_0
}
```

It is the raw output of the linear function.

**Signed distance:**

```math id="hs9-iq13-distance"
\boxed{
d_{\text{signed}}
=
\frac{w^Tx+w_0}{\|w\|}
}
```

It is the actual perpendicular distance with a sign indicating the side.

Therefore:

```text id="hs9-iq13-summary"
Score
 ↓
raw quantity

Signed distance
 ↓
geometrically normalized quantity
```

---

# 9.25 Interview Question — Scaling

Suppose:

```math id="hs9-scale-question"
f(x)=2x_1+4x_2-8
```

and we multiply everything by $5$:

```math id="hs9-scale-question2"
5f(x)
=
10x_1+20x_2-40
```

Question:

> Did the decision boundary change?

**No.**

Question:

> Did the raw score change?

**Yes.**

Question:

> Did the geometric distance change?

**No.**

Because:

```math id="hs9-scale-answer"
\frac{|5f(x)|}{\|5w\|}
=
\frac{5|f(x)|}{5\|w\|}
=
\frac{|f(x)|}{\|w\|}
```

This is an excellent interview-level understanding.

---

# 9.26 Rapid-Fire Revision

Try answering these without looking back.

### 1. What divides space into two half-spaces?

**A hyperplane.**

### 2. What is perpendicular to the hyperplane?

**The normal vector $\overrightarrow{w}$.**

### 3. What equation represents the boundary?

```math id="hs9-rf3"
w^Tx+w_0=0
```

### 4. What indicates the positive half-space?

```math id="hs9-rf4"
w^Tx+w_0>0
```

### 5. What indicates the negative half-space?

```math id="hs9-rf5"
w^Tx+w_0<0
```

### 6. What indicates the boundary?

```math id="hs9-rf6"
w^Tx+w_0=0
```

### 7. Signed distance?

```math id="hs9-rf7"
\frac{w^Tx+w_0}{\|w\|}
```

### 8. Ordinary distance?

```math id="hs9-rf8"
\frac{|w^Tx+w_0|}{\|w\|}
```

### 9. What does the sign tell us?

**Which side of the boundary.**

### 10. What does the magnitude of signed distance tell us?

**How far from the boundary.**

### 11. What does $\overrightarrow{w}$ represent in ML?

**Normal vector to the decision boundary.**

### 12. What does $w_0$ primarily control?

**The position/offset of the boundary.**

---

# 9.27 Final Concept Map

```text id="hs9-concept-map"
                         HALF-SPACE
                             │
                             ↓
                    Hyperplane / Boundary
                             │
                  wᵀx + w₀ = 0
                             │
                ┌────────────┴────────────┐
                ↓                         ↓
             Normal w                 Two regions
                │                         │
                ↓                   ┌─────┴─────┐
        Perpendicular              ↓           ↓
        to boundary               H⁺           H⁻
                                   │           │
                              wᵀx+w₀>0   wᵀx+w₀<0
                                   │           │
                                   └─────┬─────┘
                                         ↓
                                  Linear ML Model
                                         │
                                         ↓
                                  Decision Boundary
                                         │
                                         ↓
                                    Classification
```

---

# 9.28 The Ultimate Mental Model

If you remember only one picture from this entire topic, remember this:

```text id="hs9-ultimate-picture"
                         +w
                          ↑
                          │
                 ●        │
                          │
             Positive     │
             Half-Space   │
                          │
══════════════════════════╪══════════════════
                     BOUNDARY
══════════════════════════╪══════════════════
                          │
             Negative     │
             Half-Space   │
                          │
                 ●        │
                          │
                          ↓
                         -w
```

And for any point:

```math id="hs9-ultimate-formula"
\boxed{
S=w^Tx+w_0
}
```

Think:

```text id="hs9-ultimate-interpretation"
S > 0
 ↓
+w side

S = 0
 ↓
boundary

S < 0
 ↓
-w side
```

Then:

```math id="hs9-ultimate-signed"
\boxed{
\frac{S}{\|w\|}
}
```

means:

> **Which side + how far?**

And:

```math id="hs9-ultimate-distance"
\boxed{
\frac{|S|}{\|w\|}
}
```

means:

> **How far, ignoring the side?**

---

# 🎯 Ultimate Goal in ML — Final Version

Let's make this the final permanent mental model for Half-Space.

A Machine Learning model can learn an equation:

```math id="hs9-final-ml"
\boxed{
w^Tx+w_0=0
}
```

This equation creates an **invisible decision wall** in feature space.

```text id="hs9-final-wall"
           Region / Class A

              ●    ●
                 ●

════════════════════════════
       Decision Boundary
════════════════════════════

            ●
         ●     ●

           Region / Class B
```

For every new data point $\overrightarrow{x}$:

```math id="hs9-final-score"
\boxed{
w^Tx+w_0
}
```

answers:

> **Which side of the wall am I on?**

And:

```math id="hs9-final-distance"
\boxed{
\frac{|w^Tx+w_0|}{\|w\|}
}
```

answers:

> **How far am I from the wall?**

So the complete ML picture is:

```text id="hs9-final-flow"
                  Data Point
                       ↓
                 Feature Vector x
                       ↓
                Linear Function
                    wᵀx+w₀
                       ↓
             ┌─────────┴─────────┐
             ↓                   ↓
           Sign              Magnitude
             ↓                   ↓
       Which half-space?      How far?
             ↓                   ↓
          Decision            Distance
             └─────────┬─────────┘
                       ↓
                  ML Prediction
```

> **This is the geometric foundation behind linear classification: a model creates a boundary, the boundary creates half-spaces, and the position of a data point relative to that boundary determines the model's decision.**

---

# ✅ Half-Space — Complete

We have now completed the approved flow:

```text id="hs9-complete"
Part 1 — Why Does a Plane Divide Space?             ✓
Part 2 — How Does the Equation Identify
          the Two Half-Spaces?                       ✓
Part 3 — Geometric Meaning of Positive and
          Negative Half-Spaces                       ✓
Part 4 — Mathematical Definition of Half-Space      ✓
Part 5 — Numerical Examples                         ✓
Part 6 — Geometric Interpretation                    ✓
Part 7 — Machine Learning Perspective               ✓
Part 8 — Python / NumPy                             ✓
Part 9 — Revision + Interview Guide                 ✓
```

### 🏁 Topic Complete

The conceptual chain we have built is now:

```text id="hs9-next-chain"
Vector
  ↓
Dot Product
  ↓
Projection
  ↓
Normal Vector
  ↓
Plane
  ↓
Point-to-Plane Distance
  ↓
Origin-to-Plane Distance
  ↓
Half-Space
  ↓
Decision Boundary
  ↓
Linear Classification
```

**Half-Space is now complete.**
