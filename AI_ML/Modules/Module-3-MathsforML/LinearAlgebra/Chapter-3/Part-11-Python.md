# Part 11 — Python

Now that we have established the geometry and the proof, Python should be used for one purpose:

> **Verify the mathematics computationally and make the relationships concrete.**

We will use **NumPy**, because the expressions we have studied are naturally vector and matrix operations.

We will **not** jump into Machine Learning libraries yet. The goal here is to understand the underlying linear algebra through code.

---

# 11.1 Representing a Vector in NumPy

Our mathematical vector:

```math id="p11-vector"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

can be represented as:

```python
import numpy as np

w = np.array([2, 3])
```

Similarly, a point:

```math id="p11-point"
\overrightarrow{x}
=
\begin{bmatrix}
4\\
1
\end{bmatrix}
```

becomes:

```python
x = np.array([4, 1])
```

So:

```text
Mathematics              NumPy

[2]                       np.array([2, 3])
[3]
```

---

# 11.2 Computing `wᵀx`

We have repeatedly used:

```math id="p11-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

This is simply the dot product.

In NumPy:

```python
w = np.array([2, 3])
x = np.array([4, 1])

result = np.dot(w, x)

print(result)
```

Output:

```text
11
```

because:

```math id="p11-dot-manual"
\overrightarrow{w}^{T}\overrightarrow{x}
=
2(4)+3(1)
=
11
```

So:

```text
NumPy:

np.dot(w, x)

        ↓

Mathematics:

wᵀx
```

---

# 11.3 The `@` Operator

NumPy also allows matrix/vector multiplication using `@`:

```python
result = w @ x

print(result)
```

Output:

```text
11
```

For these one-dimensional NumPy arrays:

```python
w @ x
```

computes the dot product.

Therefore, both are useful:

```python
np.dot(w, x)
```

and:

```python
w @ x
```

---

# 11.4 Representing the Complete Linear Equation

Our general equation is:

```math id="p11-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Suppose:

```math id="p11-values"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix},
\qquad
w_0=-6
```

Then:

```python
w = np.array([2, 3])
w0 = -6
```

For a point:

```python
x = np.array([0, 2])
```

we calculate:

```python
score = w @ x + w0

print(score)
```

Output:

```text
0
```

Mathematically:

```math id="p11-score"
2(0)+3(2)-6
=
0
```

Therefore the point lies on the line:

```math id="p11-boundary"
\boxed{
2x_1+3x_2-6=0
}
```

---

# 11.5 Testing Whether a Point Lies on the Line

This gives us a very simple Python function:

```python
def line_score(w, x, w0):
    return w @ x + w0
```

Now:

```python
w = np.array([2, 3])
w0 = -6

x = np.array([0, 2])

score = line_score(w, x, w0)

print(score)
```

Output:

```text
0
```

Therefore:

```text
score == 0
→ point lies on boundary
```

---

# 11.6 Testing Different Points

Let's test another point:

```python
x = np.array([3, 0])

score = line_score(w, x, w0)

print(score)
```

Output:

```text
0
```

Indeed:

```math id="p11-check"
2(3)+3(0)-6=0
```

So `(3, 0)` also lies on the line.

---

# 11.7 A Point Not on the Line

Now try:

```python
x = np.array([2, 2])

score = line_score(w, x, w0)

print(score)
```

Output:

```text
4
```

Because:

```math id="p11-not-line"
2(2)+3(2)-6
=
4
```

Therefore:

```text
score = 4
→ point is not on the boundary
```

---

# 11.8 Positive and Negative Sides

The score gives us more information than simply "on the line" or "not on the line."

Consider:

```python
w = np.array([2, 3])
w0 = -6
```

### Point 1

```python
x1 = np.array([2, 2])

print(w @ x1 + w0)
```

Output:

```text
4
```

So the point lies on the **positive side**.

---

### Point 2

```python
x2 = np.array([0, 0])

print(w @ x2 + w0)
```

Output:

```text
-6
```

So this point lies on the **negative side**.

---

### Point 3

```python
x3 = np.array([0, 2])

print(w @ x3 + w0)
```

Output:

```text
0
```

So this point lies exactly on the boundary.

Thus:

```text
score > 0 → one side
score = 0 → boundary
score < 0 → other side
```

This is the basic geometric interpretation of the linear score.

---

# 11.9 Computing the Direction Vector

Suppose we have two points on the line:

```math id="p11-points"
\overrightarrow{x_1}
=
\begin{bmatrix}
0\\
2
\end{bmatrix},
\qquad
\overrightarrow{x_2}
=
\begin{bmatrix}
3\\
0
\end{bmatrix}
```

In Python:

```python
x1 = np.array([0, 2])
x2 = np.array([3, 0])
```

The direction vector is:

```math id="p11-direction"
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

In Python:

```python
d = x2 - x1

print(d)
```

Output:

```text
[ 3 -2]
```

Therefore:

```math id="p11-d-result"
\boxed{
\overrightarrow{d}
=
\begin{bmatrix}
3\\
-2
\end{bmatrix}
}
```

---

# 11.10 Verify the Perpendicularity

Our normal vector is:

```python
w = np.array([2, 3])
```

Our direction vector is:

```python
d = np.array([3, -2])
```

Now calculate:

```python
dot_product = w @ d

print(dot_product)
```

Output:

```text
0
```

Mathematically:

```math id="p11-perp"
\overrightarrow{w}^{T}\overrightarrow{d}
=
2(3)+3(-2)
=
6-6
=
0
```

Therefore:

```math id="p11-perp-result"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since `d` points along the line:

```math id="p11-final-perp"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

We have just verified our theorem using Python.

---

# 11.11 Verify the Theorem Automatically

We can turn the complete verification into a function:

```python
def verify_perpendicular(w, x1, x2):
    d = x2 - x1
    return w @ d
```

Use it:

```python
w = np.array([2, 3])

x1 = np.array([0, 2])
x2 = np.array([3, 0])

result = verify_perpendicular(w, x1, x2)

print(result)
```

Output:

```text
0
```

So the computer confirms:

```math id="p11-auto"
\boxed{
\overrightarrow{w}^{T}
(\overrightarrow{x_2}-\overrightarrow{x_1})
=
0
}
```

---

# 11.12 Why NumPy Is Useful Here

Notice how closely the Python code follows the mathematics.

Mathematics:

```math id="p11-math-code"
\overrightarrow{d}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
```

Python:

```python
d = x2 - x1
```

Mathematics:

```math id="p11-math-dot"
\overrightarrow{w}^{T}\overrightarrow{d}
```

Python:

```python
w @ d
```

Mathematics:

```math id="p11-math-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

Python:

```python
w @ x + w0
```

This is exactly the type of correspondence we want to develop in ML coding.

---

# 11.13 A Complete Example

Let's put everything together.

Consider:

```math id="p11-complete-line"
\boxed{
2x_1+3x_2-6=0
}
```

### Step 1 — Define `w`

```python
import numpy as np

w = np.array([2, 3])
w0 = -6
```

### Step 2 — Choose two points

```python
x1 = np.array([0, 2])
x2 = np.array([3, 0])
```

### Step 3 — Verify they lie on the line

```python
print(w @ x1 + w0)
print(w @ x2 + w0)
```

Output:

```text
0
0
```

### Step 4 — Find the direction

```python
d = x2 - x1

print(d)
```

Output:

```text
[ 3 -2]
```

### Step 5 — Check perpendicularity

```python
print(w @ d)
```

Output:

```text
0
```

Therefore:

```text
Both points lie on the line
        ↓
Their difference gives direction d
        ↓
w · d = 0
        ↓
w ⟂ d
        ↓
w ⟂ line
```

---

# 11.14 3D Verification

The same idea works in 3D.

Consider the plane:

```math id="p11-3d-plane"
\boxed{
2x_1+3x_2+6x_3-12=0
}
```

Normal vector:

```python
w = np.array([2, 3, 6])
w0 = -12
```

Take two direction vectors within the plane:

```python
d1 = np.array([3, -2, 0])
d2 = np.array([3, 0, -1])
```

Check:

```python
print(w @ d1)
print(w @ d2)
```

Output:

```text
0
0
```

Therefore:

```math id="p11-3d-result"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_1}=0
}
```

and:

```math id="p11-3d-result2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d_2}=0
}
```

So `w` is perpendicular to both independent directions of the plane.

Hence:

```math id="p11-3d-final"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

---

# 11.15 One General-Purpose Function

We can make the calculation reusable:

```python
def linear_score(w, x, w0):
    return w @ x + w0


def direction_vector(x1, x2):
    return x2 - x1


def perpendicularity(w, d):
    return w @ d
```

Example:

```python
w = np.array([2, 3])
w0 = -6

x1 = np.array([0, 2])
x2 = np.array([3, 0])

print("Score at x1:", linear_score(w, x1, w0))
print("Score at x2:", linear_score(w, x2, w0))

d = direction_vector(x1, x2)

print("Direction:", d)
print("w · d:", perpendicularity(w, d))
```

Expected output:

```text
Score at x1: 0
Score at x2: 0
Direction: [ 3 -2]
w · d: 0
```

This is essentially our entire mathematical proof translated into Python.

---

# 11.16 Important NumPy Insight

There is a deeper lesson here.

When we write:

```python
w @ x
```

we are not simply performing a programming trick.

We are expressing:

```math id="p11-numpy-math"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

directly in code.

This is why becoming comfortable with NumPy is so important for Machine Learning.

Linear algebra operations become **executable mathematics**.

---

# 11.17 What We Are Not Doing Yet

We don't need to use:

```python
sklearn
```

or train an actual classifier here.

Why?

Because this chapter is about understanding the mathematical foundation:

```text
Vector
  ↓
Dot Product
  ↓
Line / Plane
  ↓
Normal Vector
  ↓
wᵀx + w₀
  ↓
Decision Boundary
```

Once this foundation is clear, implementing an actual linear classifier becomes much easier to understand.

---

# 🧠 Part 11 — Mental Model

When you see this in mathematics:

```math id="p11-mental"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

your Python translation should immediately be:

```python
w @ x + w0
```

When you see:

```math id="p11-mental-d"
\boxed{
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

think:

```python
x2 - x1
```

When you see:

```math id="p11-mental-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

think:

```python
w @ d == 0
```

That is the bridge from **mathematical notation → ML implementation**.

---

# 🔑 Part 11 Summary

### Vector

```python
w = np.array([2, 3])
```

### Dot product

```python
w @ x
```

corresponds to:

```math id="p11-sum-dot"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}
}
```

### Linear equation

```python
w @ x + w0
```

corresponds to:

```math id="p11-sum-equation"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### Direction vector

```python
d = x2 - x1
```

### Perpendicularity check

```python
w @ d
```

If:

```text
0
```

then:

```math id="p11-sum-perp"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

and therefore $`\overrightarrow{w}`$ is perpendicular to the line.

---

## Final Takeaway

The most important Python pattern from this entire topic is:

```python
import numpy as np

w = np.array([2, 3])
w0 = -6

x1 = np.array([0, 2])
x2 = np.array([3, 0])

# Direction of the line
d = x2 - x1

# Verify perpendicularity
print(w @ d)
```

Output:

```text
0
```

Which is the computational form of:

```math id="p11-final"
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}-\overrightarrow{x_1}
\right)
=0
}
```

So the Python code is not separate from the mathematics—we have simply **executed the proof**.

