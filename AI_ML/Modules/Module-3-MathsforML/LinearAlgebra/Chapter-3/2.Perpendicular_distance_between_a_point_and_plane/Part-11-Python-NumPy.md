# Part 11 — Python / NumPy

We have now understood the complete mathematical and ML picture.

Our next job is to translate that mathematics into **Python/NumPy**.

The important principle here is:

> **We should not learn a new formula for Python. We should implement the exact mathematics we already derived.**

---

# 11.1 The Formula We Are Implementing

For a hyperplane:

```math id="p11-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and a point $\overrightarrow{x}$, the perpendicular distance is:

```math id="p11-distance"
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

There are only three mathematical operations we need:

```text id="p11-operations"
1. Dot product
2. Vector norm
3. Division
```

Plus absolute value.

And NumPy provides all of these directly.

---

# 11.2 Representing Vectors in NumPy

Consider:

```math id="p11-vector"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
```

and:

```math id="p11-point"
\overrightarrow{x}
=
\begin{bmatrix}
1\\
1\\
1
\end{bmatrix}
```

In NumPy:

```python
import numpy as np

w = np.array([2, 3, 6])
x = np.array([1, 1, 1])
```

Conceptually:

```text id="p11-representation"
Mathematics             NumPy

w = [2, 3, 6]    →     np.array([2, 3, 6])

x = [1, 1, 1]    →     np.array([1, 1, 1])
```

So NumPy's array is our computational representation of a vector.

---

# 11.3 Representing $w_0$

Suppose the hyperplane is:

```math id="p11-w0-plane"
2x_1+3x_2+6x_3-12=0
```

Therefore:

```math id="p11-w0"
\boxed{
w_0=-12
}
```

In Python:

```python
w0 = -12
```

Our complete mathematical model is now represented by:

```python
w = np.array([2, 3, 6])
w0 = -12
x = np.array([1, 1, 1])
```

---

# 11.4 Step 1 — Calculate the Dot Product

Mathematically:

```math id="p11-dot-math"
\overrightarrow{w}^{T}\overrightarrow{x}
```

NumPy provides:

```python
np.dot(w, x)
```

So:

```python
dot_product = np.dot(w, x)

print(dot_product)
```

Output:

```text id="p11-dot-output"
11
```

Let's verify manually:

```math id="p11-dot-manual"
2(1)+3(1)+6(1)=11
```

Therefore:

```text id="p11-dot-match"
Mathematics → 11
NumPy       → 11
```

This is exactly what we want.

---

# 11.5 Step 2 — Add $w_0$

Our formula requires:

```math id="p11-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

We already calculated:

```math id="p11-score-values"
\overrightarrow{w}^{T}\overrightarrow{x}=11
```

and:

```math id="p11-score-w0"
w_0=-12
```

Therefore:

```math id="p11-score-result"
11-12=-1
```

Python:

```python
score = np.dot(w, x) + w0

print(score)
```

Output:

```text id="p11-score-output"
-1
```

---

# 11.6 Step 3 — Take the Absolute Value

Mathematically:

```math id="p11-abs"
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
```

Python:

```python
abs_score = abs(score)

print(abs_score)
```

Output:

```text id="p11-abs-output"
1
```

So:

```text id="p11-abs-meaning"
score       = -1
absolute    = 1
```

Remember what we learned in Part 8:

> The negative sign carries directional information; the absolute value gives ordinary distance.

---

# 11.7 Step 4 — Calculate $|\overrightarrow{w}|$

Mathematically:

```math id="p11-norm"
\|\overrightarrow{w}\|
=
\sqrt{
2^2+3^2+6^2
}
```

NumPy:

```python
w_norm = np.linalg.norm(w)

print(w_norm)
```

Output:

```text id="p11-norm-output"
7.0
```

So:

```text id="p11-norm-match"
Mathematics → 7
NumPy       → 7.0
```

The `.0` simply means NumPy is representing the result as a floating-point number.

---

# 11.8 Step 5 — Calculate the Distance

Our formula is:

```math id="p11-final-math"
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

We can now translate it almost line by line:

```python
distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)

print(distance)
```

Output:

```text id="p11-final-output"
0.14285714285714285
```

Therefore:

```math id="p11-final-result"
\boxed{
d=\frac{1}{7}
}
```

which is approximately:

```text id="p11-decimal"
0.142857
```

Exactly the same result we obtained mathematically in Part 7.

---

# 11.9 The Complete Implementation

We can now write the entire calculation together:

```python
import numpy as np

w = np.array([2, 3, 6])
w0 = -12

x = np.array([1, 1, 1])

distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)

print(distance)
```

Output:

```text
0.14285714285714285
```

This is the simplest direct implementation.

---

# 11.10 Mapping Mathematics to NumPy

This mapping is worth remembering.

| Mathematics                                | NumPy               |   |          |
| ------------------------------------------ | ------------------- | - | -------- |
| $\overrightarrow{w}^{T}\overrightarrow{x}$ | `np.dot(w, x)`      |   |          |
| $|\overrightarrow{w}|$                     | `np.linalg.norm(w)` |   |          |
| $                                          | a                   | $ | `abs(a)` |
| $\frac{a}{b}$                              | `a / b`             |   |          |

Therefore:

```math id="p11-mapping"
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

becomes:

```python
abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

This is an excellent example of how mathematical notation translates directly into vectorized numerical code.

---

# 11.11 Build a Reusable Function

Writing the expression repeatedly is not ideal.

We can encapsulate it in a function:

```python
def point_to_plane_distance(w, w0, x):
    return abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

Now we can use:

```python
w = np.array([2, 3, 6])
w0 = -12
x = np.array([1, 1, 1])

distance = point_to_plane_distance(w, w0, x)

print(distance)
```

Output:

```text
0.14285714285714285
```

The function represents the mathematical operation:

```math id="p11-function-math"
\boxed{
d(\overrightarrow{x})
=
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

# 11.12 Why This Function Is More Useful

Now we can reuse the same plane with many points.

Suppose:

```python
w = np.array([2, 3, 6])
w0 = -12
```

We can calculate:

```python
x1 = np.array([1, 1, 1])
x2 = np.array([3, 0, 0])
x3 = np.array([2, 1, 1])

print(point_to_plane_distance(w, w0, x1))
print(point_to_plane_distance(w, w0, x2))
print(point_to_plane_distance(w, w0, x3))
```

The important idea is not the individual numbers.

It is that:

> **One mathematical boundary can be evaluated against many data points.**

And that is exactly the situation we encounter in Machine Learning.

---

# 11.13 Signed Distance in Python

Earlier we distinguished between **signed distance** and ordinary distance.

We can implement the signed version separately:

```python
def signed_point_to_plane_distance(w, w0, x):
    return (np.dot(w, x) + w0) / np.linalg.norm(w)
```

For:

```python
w = np.array([1, 1, 1])
w0 = -3
x = np.array([0, 0, 0])
```

we get:

```python
signed_distance = signed_point_to_plane_distance(w, w0, x)

print(signed_distance)
```

Output:

```text
-1.7320508075688772
```

which is:

```math id="p11-signed-result"
\boxed{
-\sqrt{3}
}
```

The ordinary distance is:

```python
distance = abs(signed_distance)

print(distance)
```

Output:

```text
1.7320508075688772
```

Therefore:

```text id="p11-python-sign"
signed distance
        ↓
   keeps sign

ordinary distance
        ↓
   abs(signed distance)
```

This directly reflects what we learned in Part 8.

---

# 11.14 NumPy's `@` Operator

There is another convenient way to calculate the dot product.

Instead of:

```python
np.dot(w, x)
```

we can write:

```python
w @ x
```

Therefore:

```python
distance = abs(w @ x + w0) / np.linalg.norm(w)
```

This is mathematically equivalent to:

```python
distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

For vector and matrix operations, `@` is very common in ML code.

---

# 11.15 A More Explicit Implementation

For learning purposes, I actually recommend initially writing the function in multiple steps:

```python
def point_to_plane_distance(w, w0, x):

    dot_product = np.dot(w, x)

    score = dot_product + w0

    numerator = abs(score)

    denominator = np.linalg.norm(w)

    distance = numerator / denominator

    return distance
```

Why is this version valuable?

Because every line corresponds directly to something we learned mathematically.

```text id="p11-code-mapping"
dot_product
     ↓
wᵀx

score
     ↓
wᵀx + w₀

numerator
     ↓
|wᵀx + w₀|

denominator
     ↓
||w||

distance
     ↓
|wᵀx + w₀| / ||w||
```

This is much better for learning than immediately compressing everything into one line.

---

# 11.16 Verify the Mathematics Programmatically

Let's verify the earlier example:

Plane:

```math id="p11-verification-plane"
2x+3y+6z-12=0
```

Point:

```math id="p11-verification-point"
(1,1,1)
```

Python:

```python
import numpy as np

w = np.array([2, 3, 6])
w0 = -12
x = np.array([1, 1, 1])

dot_product = np.dot(w, x)
score = dot_product + w0
numerator = abs(score)
denominator = np.linalg.norm(w)
distance = numerator / denominator

print("wᵀx =", dot_product)
print("wᵀx + w₀ =", score)
print("|wᵀx + w₀| =", numerator)
print("||w|| =", denominator)
print("Distance =", distance)
```

Expected output:

```text
wᵀx = 11
wᵀx + w₀ = -1
|wᵀx + w₀| = 1
||w|| = 7.0
Distance = 0.14285714285714285
```

This is a useful debugging technique:

> **When learning mathematical ML, inspect intermediate values rather than only the final answer.**

---

# 11.17 What Happens If the Point Lies on the Plane?

Let's verify our earlier property.

Plane:

```math id="p11-on-plane"
2x+3y+6z-6=0
```

Point:

```math id="p11-on-plane-point"
(3,0,0)
```

Python:

```python
w = np.array([2, 3, 6])
w0 = -6
x = np.array([3, 0, 0])

distance = point_to_plane_distance(w, w0, x)

print(distance)
```

Output:

```text
0.0
```

This verifies:

```math id="p11-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
\Rightarrow d=0
}
```

---

# 11.18 Generalization to Any Number of Dimensions

One of the most important advantages of using vectors is that our function doesn't care whether we have:

```text id="p11-dimensions"
2 dimensions
3 dimensions
10 dimensions
100 dimensions
1000 dimensions
```

For example:

```python
w = np.array([1, 2, 3, 4])
x = np.array([2, 1, 0, 3])
w0 = -5

distance = point_to_plane_distance(w, w0, x)

print(distance)
```

The same function works.

No new distance formula is required.

That is exactly why vector notation is so powerful for Machine Learning.

---

# 11.19 Input Validation

There is one mathematical edge case we should handle.

What if:

```python
w = np.array([0, 0, 0])
```

Then:

```math id="p11-zero-normal"
\|\overrightarrow{w}\|=0
```

and our formula would divide by zero.

But:

```math id="p11-invalid-plane"
0x_1+0x_2+\cdots+0x_d+w_0=0
```

does not represent an ordinary hyperplane when $\overrightarrow{w}$ is the zero vector.

So a production-quality function should reject it:

```python
def point_to_plane_distance(w, w0, x):

    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

This is a small but important example of translating a **mathematical constraint into a programming validation**.

---

# 11.20 ML Interpretation of the Code

Suppose:

```python
w = np.array([w1, w2, ..., wd])
w0 = ...
x = np.array([x1, x2, ..., xd])
```

The model computes:

```python
score = np.dot(w, x) + w0
```

Conceptually:

```math id="p11-ml-score"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

Then:

```python
distance = abs(score) / np.linalg.norm(w)
```

Conceptually:

```math id="p11-ml-distance"
\boxed{
d=
\frac{
|f(\overrightarrow{x})|
}{
\|\overrightarrow{w}\|
}
}
```

So our Python implementation is directly expressing the geometry of the ML model.

---

# 🎯 Ultimate Goal in ML — Simple Terms

Imagine thousands of data points:

```text id="p11-ml-points"
●       ●

    ●

─────────────── Decision Boundary ───────────────

       ●
   ●        ●

          ●
```

Instead of manually measuring every point's distance from the boundary, NumPy can calculate it efficiently.

The mathematical idea:

```text id="p11-ml-flow"
Data point x
     ↓
wᵀx + w₀
     ↓
How far along the normal?
     ↓
divide by ||w||
     ↓
distance
```

This is the bridge from our **geometric understanding** to actual ML computation.

---

# 11.21 Mathematical Thinking → NumPy Thinking

This is the real lesson of Part 11.

| Concept          | Mathematics                                | NumPy               |         |                                         |
| ---------------- | ------------------------------------------ | ------------------- | ------- | --------------------------------------- |
| Point            | $\overrightarrow{x}$                       | `x`                 |         |                                         |
| Normal / weights | $\overrightarrow{w}$                       | `w`                 |         |                                         |
| Bias             | $w_0$                                      | `w0`                |         |                                         |
| Dot product      | $\overrightarrow{w}^{T}\overrightarrow{x}$ | `np.dot(w, x)`      |         |                                         |
| Norm             | $|\overrightarrow{w}|$                     | `np.linalg.norm(w)` |         |                                         |
| Absolute value   | $                                          | a                   | $       | `abs(a)`                                |
| Distance         | $\frac{                                    | w^Tx+w_0            | }{|w|}$ | `abs(np.dot(w,x)+w0)/np.linalg.norm(w)` |

The important skill is being able to move fluently between these two worlds:

```text
Mathematical notation
        ↕
NumPy implementation
```

That is a core ML engineering skill.

---

# 🧠 Part 11 Mental Model

Don't memorize the Python function.

Instead, remember the translation:

```text id="p11-memory"
Mathematics
    ↓
wᵀx
    ↓
np.dot(w, x)

Mathematics
    ↓
||w||
    ↓
np.linalg.norm(w)

Mathematics
    ↓
|value|
    ↓
abs(value)
```

Then the final implementation naturally becomes:

```python
distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

---

# 🔑 Part 11 Takeaways

### 1. Dot product

```python
np.dot(w, x)
```

represents:

```math id="p11-t1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

### 2. Norm

```python
np.linalg.norm(w)
```

represents:

```math id="p11-t2"
\boxed{
\|\overrightarrow{w}\|
}
```

### 3. Distance

```python
abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

represents:

```math id="p11-t3"
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

### 4. The same implementation works in arbitrary dimensions.

### 5. The code is not a separate concept.

> **It is simply our mathematics expressed computationally.**

---

# 🔗 Complete Journey of This Topic

We can now see why the topic was worth learning:

```text id="p11-journey"
Vector
   ↓
Dot Product
   ↓
Projection
   ↓
Unit Vector
   ↓
Normal Vector
   ↓
Equation of a Plane
   ↓
Projection onto Normal
   ↓
Perpendicular Distance
   ↓
Geometric Interpretation
   ↓
Linear Decision Boundary
   ↓
NumPy Implementation
```

We have now completed the **conceptual + mathematical + computational** portions of the topic.

## Next: Part 12 — Revision + Interview Guide

We will consolidate the entire topic into a compact but deep revision section, followed by important interview questions, common mistakes, and a few thinking questions to make sure the concept is genuinely understood rather than memorized.

