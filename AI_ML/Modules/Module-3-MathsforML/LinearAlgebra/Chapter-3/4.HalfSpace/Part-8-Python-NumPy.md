
# Half Space

# Part 8 — Python / NumPy

We now have the complete mathematical understanding of Half-Space.

In this part, we will **translate exactly that mathematics into Python / NumPy**.

The goal is not to learn a new programming trick.

The goal is to see:

> **How the mathematical expression we have been studying becomes executable ML code.**

Our central expression remains:

```math id="hs8-main"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

---

# 8.1 The Mathematical Problem We Want to Implement

Given:

```math id="hs8-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and a point $\overrightarrow{x}$, we want to determine:

1. Is the point on the boundary?
2. Is it in the positive half-space?
3. Is it in the negative half-space?
4. What is its signed distance?
5. What is its ordinary perpendicular distance?

The mathematical workflow is:

```text id="hs8-flow"
Point x
   ↓
Calculate wᵀx + w₀
   ↓
Check sign
   ↓
Determine half-space
   ↓
Normalize by ||w|| if distance is needed
```

Now let's implement it.

---

# 8.2 Import NumPy

```python
import numpy as np
```

NumPy gives us:

* vectors
* dot products
* norms
* vectorized operations

which map very naturally to our mathematics.

---

# 8.3 Represent the Normal Vector

Suppose our boundary is:

```math id="hs8-example-plane"
\boxed{
x+y-4=0
}
```

Then:

```math id="hs8-example-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

and:

```math id="hs8-example-b"
w_0=-4
```

In NumPy:

```python
w = np.array([1, 1])
w0 = -4
```

So:

```text id="hs8-representation"
Mathematics              NumPy

w = [1, 1]       →       np.array([1, 1])

w₀ = -4          →       w0 = -4
```

---

# 8.4 Represent a Data Point

Take:

```math id="hs8-point"
\overrightarrow{x}
=
\begin{bmatrix}
5\\
2
\end{bmatrix}
```

In NumPy:

```python
x = np.array([5, 2])
```

We now have:

```text id="hs8-data"
w  → normal vector
x  → data point
w0 → bias
```

---

# 8.5 Calculate the Linear Score

Mathematically:

```math id="hs8-score-math"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The dot product is:

```math id="hs8-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
```

In NumPy:

```python
score = np.dot(w, x) + w0
```

Let's calculate it manually:

```text id="hs8-manual"
w = [1, 1]

x = [5, 2]

wᵀx
= 1×5 + 1×2
= 7
```

Then:

```text id="hs8-score-manual"
score
= 7 + (-4)
= 3
```

Therefore:

```python
print(score)
```

Output:

```text
3
```

So:

```math id="hs8-score-result"
\boxed{
f(\overrightarrow{x})=3
}
```

---

# 8.6 Determine the Half-Space

We know:

```text id="hs8-sign"
score > 0 → positive
score = 0 → boundary
score < 0 → negative
```

So in Python:

```python
if score > 0:
    print("Positive half-space")
elif score < 0:
    print("Negative half-space")
else:
    print("On the boundary")
```

Output:

```text
Positive half-space
```

This is exactly the mathematics.

We haven't created a new ML rule.

We simply converted:

```math id="hs8-sign-math"
f(\overrightarrow{x})
\begin{cases}
>0 & \text{positive half-space}\\
=0 & \text{boundary}\\
<0 & \text{negative half-space}
\end{cases}
```

into Python.

---

# 8.7 Let's Test All Three Cases

We'll use the same boundary:

```math id="hs8-same-plane"
\boxed{
x+y-4=0
}
```

---

## Point A — Positive Side

```python
x_A = np.array([5, 2])

score_A = np.dot(w, x_A) + w0

print(score_A)
```

Output:

```text
3
```

Therefore:

```text
Positive half-space
```

---

## Point B — Negative Side

```python
x_B = np.array([1, 1])

score_B = np.dot(w, x_B) + w0

print(score_B)
```

Output:

```text
-2
```

Therefore:

```text
Negative half-space
```

---

## Point C — Boundary

```python
x_C = np.array([2, 2])

score_C = np.dot(w, x_C) + w0

print(score_C)
```

Output:

```text
0
```

Therefore:

```text
On the boundary
```

---

# 8.8 Complete Classification Function

Instead of repeating the code, we can create a function.

```python
def classify_half_space(x, w, w0):
    score = np.dot(w, x) + w0

    if score > 0:
        return "Positive half-space"
    elif score < 0:
        return "Negative half-space"
    else:
        return "On the boundary"
```

Now:

```python
w = np.array([1, 1])
w0 = -4

A = np.array([5, 2])
B = np.array([1, 1])
C = np.array([2, 2])

print(classify_half_space(A, w, w0))
print(classify_half_space(B, w, w0))
print(classify_half_space(C, w, w0))
```

Output:

```text
Positive half-space
Negative half-space
On the boundary
```

---

# 8.9 What Exactly Did the Function Do?

The function is implementing our entire geometric concept:

```text id="hs8-function-flow"
                x
                ↓
        np.dot(w, x) + w0
                ↓
              score
                ↓
        ┌───────┼───────┐
        ↓       ↓       ↓
       >0      =0      <0
        ↓       ↓       ↓
       H⁺     Plane     H⁻
```

This is the same flow we have been deriving mathematically.

---

# 8.10 Calculate the Norm of $\overrightarrow{w}$

For distance, we need:

```math id="hs8-norm-math"
\boxed{
\|\overrightarrow{w}\|
}
```

In NumPy:

```python
w_norm = np.linalg.norm(w)
```

For:

```python
w = np.array([1, 1])
```

we get:

```text
√2
```

because:

```math id="hs8-norm-calculation"
\|\overrightarrow{w}\|
=
\sqrt{1^2+1^2}
=
\sqrt{2}
```

---

# 8.11 Calculate Signed Distance

Our formula is:

```math id="hs8-signed-distance"
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

In Python:

```python
signed_distance = score / np.linalg.norm(w)
```

For point $A$:

```python
A = np.array([5, 2])

score_A = np.dot(w, A) + w0

signed_distance_A = score_A / np.linalg.norm(w)

print(signed_distance_A)
```

Output is approximately:

```text
2.12132034
```

Therefore:

```math id="hs8-signed-result"
\boxed{
d_{\text{signed}}\approx2.121
}
```

The positive sign tells us:

> $A$ is on the $+\overrightarrow{w}$ side.

---

# 8.12 Calculate Ordinary Distance

The ordinary perpendicular distance is:

```math id="hs8-distance"
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

In Python:

```python
distance = abs(score) / np.linalg.norm(w)
```

For point $A$:

```python
distance_A = abs(score_A) / np.linalg.norm(w)

print(distance_A)
```

Output:

```text
2.12132034
```

Because $A$ is on the positive side, signed distance and ordinary distance have the same magnitude and positive sign.

---

# 8.13 Negative Side — Signed vs Ordinary Distance

Now take:

```python
B = np.array([1, 1])
```

Calculate:

```python
score_B = np.dot(w, B) + w0
signed_distance_B = score_B / np.linalg.norm(w)
distance_B = abs(score_B) / np.linalg.norm(w)
```

We get approximately:

```text
score             = -2
signed distance   = -1.414
ordinary distance =  1.414
```

This is extremely important.

```text id="hs8-signed-vs-ordinary"
                 B
                 ●
                 │
                 │
═════════════════╪══════════════
               Plane
═════════════════╪══════════════

score = -2

signed distance = -1.414
ordinary distance = 1.414
```

So:

> **The absolute value removes the side information.**

---

# 8.14 Put Everything Into One Function

We can now create a function that returns all the useful information.

```python
def analyze_point(x, w, w0):
    score = np.dot(w, x) + w0
    norm_w = np.linalg.norm(w)

    signed_distance = score / norm_w
    distance = abs(score) / norm_w

    if score > 0:
        side = "Positive half-space"
    elif score < 0:
        side = "Negative half-space"
    else:
        side = "On the boundary"

    return {
        "score": score,
        "side": side,
        "signed_distance": signed_distance,
        "distance": distance
    }
```

Now:

```python
w = np.array([1, 1])
w0 = -4

A = np.array([5, 2])

result = analyze_point(A, w, w0)

print(result)
```

Conceptually, we get:

```text
score             → 3
side              → Positive half-space
signed_distance   → 2.121...
distance          → 2.121...
```

---

# 8.15 Why This Function Is Conceptually Important

Notice that our function doesn't know anything about:

* houses
* cars
* customers
* images
* spam
* medical data

It only knows:

```text
x
w
w₀
```

That is important.

The geometry is **domain-independent**.

Whether:

```text
x = house features
```

or:

```text
x = customer features
```

or:

```text
x = image features
```

the mathematics is the same.

---

# 8.16 3D Example

Let's implement the 3D example from Part 5.

Plane:

```math id="hs8-3d-plane"
\boxed{
2x+3y+6z-12=0
}
```

Therefore:

```python
w = np.array([2, 3, 6])
w0 = -12
```

Take:

```python
x = np.array([3, 2, 1])
```

Calculate:

```python
score = np.dot(w, x) + w0
```

Let's understand the NumPy operation:

```text
w = [2, 3, 6]

x = [3, 2, 1]

dot product
= 2×3 + 3×2 + 6×1
= 6 + 6 + 6
= 18
```

Then:

```text
score = 18 - 12
      = 6
```

Therefore:

```text
Positive half-space
```

---

# 8.17 Distance for the 3D Example

Calculate:

```python
norm_w = np.linalg.norm(w)
```

We get:

```text
√(2² + 3² + 6²)
= √49
= 7
```

Then:

```python
signed_distance = score / norm_w
distance = abs(score) / norm_w
```

Therefore:

```text
score             = 6
signed distance   = 6/7
ordinary distance = 6/7
```

Approximately:

```text
0.857
```

---

# 8.18 Vectorized Classification — Many Data Points

This is where NumPy becomes particularly useful for ML.

Suppose we have multiple data points:

```python
X = np.array([
    [5, 2],
    [1, 1],
    [2, 2],
    [4, 3]
])
```

Here:

```text id="hs8-multiple"
X
│
├── [5, 2] → Point 1
├── [1, 1] → Point 2
├── [2, 2] → Point 3
└── [4, 3] → Point 4
```

Instead of calculating each point individually, NumPy can calculate the scores for all points.

We have:

```python
w = np.array([1, 1])
w0 = -4
```

We can calculate:

```python
scores = X @ w + w0
```

Here `@` performs matrix multiplication.

---

# 8.19 Understand `X @ w`

Our matrix is:

```text
X =
[5 2]
[1 1]
[2 2]
[4 3]
```

and:

```text
w =
[1]
[1]
```

Conceptually:

```text id="hs8-matrix"
X @ w

[5 2] · [1 1] = 7
[1 1] · [1 1] = 2
[2 2] · [1 1] = 4
[4 3] · [1 1] = 7
```

Then add:

```text
w0 = -4
```

So:

```text
scores =
[ 3,
 -2,
  0,
  3 ]
```

---

# 8.20 NumPy Gives Us All Scores at Once

```python
scores = X @ w + w0

print(scores)
```

Output:

```text
[ 3 -2  0  3]
```

Then the classification rule becomes:

```python
positive = scores > 0
negative = scores < 0
boundary = scores == 0
```

This produces Boolean arrays.

For example:

```text
positive
[ True False False  True]

negative
[False  True False False]

boundary
[False False  True False]
```

This is a very important transition toward real ML code.

---

# 8.21 Why Vectorization Matters in ML

In real ML datasets, we might have:

```text
10 rows
100 rows
10,000 rows
1,000,000 rows
```

We don't want to manually calculate:

```python
np.dot(w, x1)
np.dot(w, x2)
np.dot(w, x3)
...
```

Instead:

```python
scores = X @ w + w0
```

handles all observations efficiently.

This is one reason NumPy is so fundamental to Machine Learning.

---

# 8.22 The Mathematical Meaning of `X @ w`

Suppose:

```math id="hs8-matrix-math"
X=
\begin{bmatrix}
- & \overrightarrow{x}_1^T & -\\
- & \overrightarrow{x}_2^T & -\\
- & \overrightarrow{x}_3^T & -\\
\vdots & \vdots & \vdots
\end{bmatrix}
```

Then:

```math id="hs8-matrix-product"
\boxed{
X\overrightarrow{w}
}
```

produces:

```math id="hs8-vector-scores"
\begin{bmatrix}
\overrightarrow{x}_1^T\overrightarrow{w}\\
\overrightarrow{x}_2^T\overrightarrow{w}\\
\overrightarrow{x}_3^T\overrightarrow{w}\\
\vdots
\end{bmatrix}
```

Adding $w_0$ gives:

```math id="hs8-all-scores"
\boxed{
X\overrightarrow{w}+w_0
}
```

So vectorized NumPy is simply performing the same mathematics for many points simultaneously.

---

# 8.23 A Simple Linear Classifier in NumPy

We can now write a minimal classifier:

```python
def predict(X, w, w0):
    scores = X @ w + w0
    return scores > 0
```

Example:

```python
X = np.array([
    [5, 2],
    [1, 1],
    [2, 2],
    [4, 3]
])

w = np.array([1, 1])
w0 = -4

predictions = predict(X, w, w0)

print(predictions)
```

The result is:

```text
[ True False False True ]
```

If we choose:

```text
True  → Class 1
False → Class 0
```

then the model predicts:

```text
Class 1
Class 0
Class 0
Class 1
```

This is the basic geometric idea behind a linear binary classifier.

---

# 8.24 But What Did We Actually Build?

We did **not** train a model.

We manually supplied:

```python
w
w0
```

Then we used them to classify points.

So the current flow is:

```text id="hs8-not-training"
Given w and w₀
      ↓
Create boundary
      ↓
Calculate scores
      ↓
Determine half-space
      ↓
Predict
```

Later, Machine Learning algorithms will learn:

```text id="hs8-training"
w and w₀
```

from training data.

That is the next level of the story.

---

# 8.25 🎯 Ultimate Goal in ML — Simple Terms

Imagine that training has already happened.

The model has learned:

```text
w
w₀
```

Together they create an invisible wall:

```text id="hs8-ml-wall"
               Class 1
            ●       ●

════════════════════════
       Decision Wall
════════════════════════

            ●
        ●       ●

               Class 0
```

For a new point:

```python
score = X @ w + w0
```

the model simply asks:

> **"Which side of my learned wall is this point on?"**

Then:

```text
score > 0 → one side
score < 0 → other side
```

If required:

```python
distance = np.abs(score) / np.linalg.norm(w)
```

answers:

> **"How far is this point from my learned wall?"**

So our NumPy implementation is directly expressing the geometric ML concept.

---

# 8.26 Complete Python Example

Let's put the essential implementation together.

```python
import numpy as np

# Normal vector and bias
w = np.array([1, 1])
w0 = -4

# Data points
X = np.array([
    [5, 2],
    [1, 1],
    [2, 2],
    [4, 3]
])

# Linear scores
scores = X @ w + w0

# Half-space
positive = scores > 0
negative = scores < 0
boundary = scores == 0

# Signed distance
signed_distances = scores / np.linalg.norm(w)

# Ordinary distance
distances = np.abs(scores) / np.linalg.norm(w)

print("Scores:", scores)
print("Positive:", positive)
print("Negative:", negative)
print("Boundary:", boundary)
print("Signed distances:", signed_distances)
print("Distances:", distances)
```

Conceptually, the output is:

```text
Scores:
[ 3 -2  0  3 ]

Positive:
[ True False False  True ]

Negative:
[False  True False False]

Boundary:
[False False  True False]
```

And the distances correspond to:

```text
Signed:
[ +2.121, -1.414, 0, +2.121 ]

Ordinary:
[ 2.121,  1.414, 0,  2.121 ]
```

---

# 8.27 Mathematical Formula ↔ NumPy Mapping

This is the most important revision table for the coding part.

| Mathematics                                | NumPy               |       |                                  |
| ------------------------------------------ | ------------------- | ----- | -------------------------------- |
| $\overrightarrow{w}$                       | `w`                 |       |                                  |
| $\overrightarrow{x}$                       | `x`                 |       |                                  |
| $w_0$                                      | `w0`                |       |                                  |
| $\overrightarrow{w}^{T}\overrightarrow{x}$ | `np.dot(w, x)`      |       |                                  |
| $X\overrightarrow{w}$                      | `X @ w`             |       |                                  |
| $|\overrightarrow{w}|$                     | `np.linalg.norm(w)` |       |                                  |
| $w^Tx+w_0$                                 | `np.dot(w, x) + w0` |       |                                  |
| $                                          | w^Tx+w_0            | $     | `abs(score)`                     |
| $                                          | w^Tx+w_0            | /|w|$ | `abs(score) / np.linalg.norm(w)` |

This is the bridge between our mathematics and actual ML implementation.

---

# 8.28 Common Mistake #1 — Forgetting the Bias

Wrong:

```python
score = np.dot(w, x)
```

if the model is:

```math id="hs8-wrong1"
w^Tx+w_0
```

Correct:

```python
score = np.dot(w, x) + w0
```

The bias is part of the decision function.

---

# 8.29 Common Mistake #2 — Treating Score as Distance

Wrong idea:

```python
distance = abs(score)
```

Correct:

```python
distance = abs(score) / np.linalg.norm(w)
```

Why?

Because the raw score depends on the scale of $\overrightarrow{w}$.

The geometric distance must be scale-independent.

---

# 8.30 Common Mistake #3 — Losing the Sign When You Need Half-Space

If you do:

```python
distance = abs(score) / np.linalg.norm(w)
```

you lose the side information.

For half-space classification, use:

```python
score > 0
score < 0
```

or signed distance:

```python
signed_distance = score / np.linalg.norm(w)
```

Remember:

```text id="hs8-mistake3"
score
 ↓
side

abs(score)
 ↓
side information lost
```

---

# 8.31 Common Mistake #4 — Thinking Positive Means "Up"

The code:

```python
score > 0
```

does not mean:

> "the point is physically above the plane."

It means:

> **the point lies on the side associated with the chosen normal vector $\overrightarrow{w}$.**

If we replace:

```python
w
```

with:

```python
-w
```

the positive and negative labels swap.

---

# 8.32 Common Mistake #5 — Confusing `np.dot()` With Distance

This:

```python
np.dot(w, x)
```

is a dot product.

It is not automatically a distance.

Distance requires the appropriate normalization:

```python
abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

This distinction is important because we've spent significant time understanding the geometric meaning of the dot product.

---

# 🧠 Part 8 Mental Model

Whenever you implement a linear boundary in NumPy, think:

```text id="hs8-final-flow"
             w
             │
             ↓
       Normal Vector

             x
             │
             ↓
         Data Point
             │
             ↓
      np.dot(w, x) + w0
             │
             ↓
           score
             │
       ┌─────┼─────┐
       ↓     ↓     ↓
      >0    =0    <0
       ↓     ↓     ↓
      H⁺   Plane   H⁻
```

If distance is needed:

```text id="hs8-distance-flow"
score
  ↓
score / ||w||
  ↓
signed distance
```

and:

```text id="hs8-ordinary-flow"
score
  ↓
abs(score) / ||w||
  ↓
ordinary distance
```

---

# 🔑 Part 8 Takeaways

### Core implementation

```python
score = np.dot(w, x) + w0
```

### Half-space

```python
score > 0   # Positive half-space
score < 0   # Negative half-space
score == 0  # Boundary
```

### Signed distance

```python
signed_distance = score / np.linalg.norm(w)
```

### Ordinary distance

```python
distance = abs(score) / np.linalg.norm(w)
```

### Multiple points

```python
scores = X @ w + w0
```

### Core NumPy mapping

```text id="hs8-takeaway"
Mathematics
     ↓
wᵀx + w₀
     ↓
NumPy
     ↓
np.dot(w, x) + w0
```

And for many observations:

```text
Xw + w₀
     ↓
X @ w + w0
```

---

## One-Line Understanding

> **NumPy does not change the geometry: `np.dot(w, x) + w0` calculates the linear score, its sign identifies the half-space, and dividing by `np.linalg.norm(w)` converts that score into signed or ordinary perpendicular distance.**

---

## ✅ Flow Check

We remain exactly on the approved path:

```text id="hs8-flow-check"
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
```

### Next:

# **Part 9 — Revision + Interview Guide**

We will consolidate the entire Half-Space topic into one **super-revision sheet**: intuition → geometry → mathematics → formulas → ML interpretation → common mistakes → interview questions → final mental model.
