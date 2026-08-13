# Part 8 — Python / NumPy

Now we translate everything we have learned into Python.

The goal is **not** merely to write one line of NumPy code.

The goal is to see the direct bridge:

```text
Mathematics
    ↓
Vector representation
    ↓
NumPy representation
    ↓
Computation
    ↓
Geometric meaning
```

We will first implement the **origin-to-plane distance**, and then connect it back to the general point-to-plane formula.

---

# 8.1 Our Mathematical Formula

For the plane:

```math id="p8-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the distance of the **origin** from the plane is:

```math id="p8-distance"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So computationally, we need only two things:

1. $|w_0|$
2. $|\overrightarrow{w}|$

---

# 8.2 Representing the Normal Vector in NumPy

Suppose:

```math id="p8-w"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

In NumPy:

```python
import numpy as np

w = np.array([3, 4])
```

Think:

```text
Mathematics                 NumPy

     ┌ 3 ┐
w =  │   │                  w = np.array([3, 4])
     └ 4 ┘
```

The NumPy array is simply the computational representation of our mathematical vector.

---

# 8.3 Representing $w_0$

Our plane is:

```math id="p8-plane-example"
3x+4y-12=0
```

Therefore:

```math id="p8-w0"
\boxed{
w_0=-12
}
```

In Python:

```python
w0 = -12
```

So our complete plane is represented by:

```python
w = np.array([3, 4])
w0 = -12
```

---

# 8.4 Calculate $|\overrightarrow{w}|$

Mathematically:

```math id="p8-norm-math"
\boxed{
\|\overrightarrow{w}\|
=
\sqrt{3^2+4^2}
=
5
}
```

NumPy provides:

```python
np.linalg.norm(w)
```

Therefore:

```python
w_norm = np.linalg.norm(w)

print(w_norm)
```

Output:

```text
5.0
```

So:

```text
Mathematics                    NumPy

||w||                    →    np.linalg.norm(w)
```

---

# 8.5 Calculate $|w_0|$

Mathematically:

```math id="p8-abs"
|w_0|=|-12|=12
```

Python:

```python
abs(w0)
```

Output:

```text
12
```

So:

```text
Mathematics                    NumPy

|w₀|                      →    abs(w0)
```

---

# 8.6 Put Them Together

Our formula:

```math id="p8-final-math"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

becomes:

```python
distance = abs(w0) / np.linalg.norm(w)
```

For our example:

```python
distance = abs(-12) / np.linalg.norm(np.array([3, 4]))

print(distance)
```

Output:

```text
2.4
```

Therefore:

```math id="p8-answer"
\boxed{
d=2.4
}
```

Exactly what we calculated mathematically.

---

# 8.7 Complete Function

Instead of writing the calculation every time, let's create a reusable function.

```python
import numpy as np

def origin_to_plane_distance(w, w0):
    return abs(w0) / np.linalg.norm(w)
```

Now:

```python
w = np.array([3, 4])
w0 = -12

distance = origin_to_plane_distance(w, w0)

print(distance)
```

Output:

```text
2.4
```

---

# 8.8 But There Is an Important Edge Case

Can we have:

```python
w = np.array([0, 0])
```

?

Mathematically, this would give:

```math id="p8-zero-normal"
\overrightarrow{w}
=
\overrightarrow{0}
```

Then:

```math id="p8-zero-norm"
\|\overrightarrow{w}\|=0
```

and our formula would require division by zero.

More importantly, a zero normal vector cannot define a proper line/plane.

So our function should protect against this.

```python
import numpy as np

def origin_to_plane_distance(w, w0):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(w0) / w_norm
```

Now:

```python
w = np.array([3, 4])
w0 = -12

print(origin_to_plane_distance(w, w0))
```

gives:

```text
2.4
```

---

# 8.9 Let's Test $w_0=0$

Consider:

```math id="p8-zero-w0-plane"
2x+3y+6z=0
```

Here:

```python
w = np.array([2, 3, 6])
w0 = 0
```

Run:

```python
distance = origin_to_plane_distance(w, w0)

print(distance)
```

Output:

```text
0.0
```

Mathematically:

```math id="p8-zero-distance"
\boxed{
d=0
}
```

Which means:

> The plane passes through the origin.

This is a nice example of Python confirming our geometric understanding.

---

# 8.10 Let's Test a 3D Example

Consider:

```math id="p8-3d-plane"
\boxed{
2x+3y+6z-12=0
}
```

We already calculated:

```math id="p8-3d-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
```

and:

```math id="p8-3d-w0"
w_0=-12
```

Python:

```python
w = np.array([2, 3, 6])
w0 = -12

distance = origin_to_plane_distance(w, w0)

print(distance)
```

Output:

```text
1.7142857142857142
```

Mathematically:

```math id="p8-3d-result"
\boxed{
d=\frac{12}{7}
\approx1.714
}
```

---

# 8.11 Mathematics ↔ NumPy Mapping

This is worth putting into your notebook as a permanent reference.

| Mathematical operation                     | NumPy                         |   |           |
| ------------------------------------------ | ----------------------------- | - | --------- |
| Vector                                     | `np.array([...])`             |   |           |
| $|\overrightarrow{w}|$                     | `np.linalg.norm(w)`           |   |           |
| $                                          | w_0                           | $ | `abs(w0)` |
| $\overrightarrow{w}^{T}\overrightarrow{x}$ | `np.dot(w, x)`                |   |           |
| Distance                                   | `abs(w0) / np.linalg.norm(w)` |   |           |

Notice something important:

> **NumPy isn't doing new mathematics. It is giving us computational tools for the mathematics we already understand.**

---

# 8.12 Now Connect Back to the General Formula

Our general point-to-plane distance is:

```math id="p8-general"
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

Let's implement that.

```python
def point_to_plane_distance(w, w0, x):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

Now our origin is simply:

```python
x = np.array([0, 0])
```

Let's test:

```python
w = np.array([3, 4])
w0 = -12
x = np.array([0, 0])

distance = point_to_plane_distance(w, w0, x)

print(distance)
```

Output:

```text
2.4
```

---

# 8.13 Look at What Python Just Did

The code:

```python
np.dot(w, x)
```

became:

```math id="p8-dot-zero"
\overrightarrow{w}^{T}\overrightarrow{0}
```

which is:

```math id="p8-dot-zero-result"
0
```

So Python calculates:

```python
abs(np.dot(w, x) + w0)
```

as:

```python
abs(0 + (-12))
```

which becomes:

```text
12
```

Then:

```python
np.linalg.norm(w)
```

becomes:

```text
5
```

Finally:

```python
12 / 5
```

gives:

```text
2.4
```

So we have computationally reproduced our mathematical derivation.

---

# 8.14 This Is the Important Connection

Notice how the special case is not a separate implementation.

We have:

### General problem

```python
point_to_plane_distance(w, w0, x)
```

### Origin problem

```python
x = np.zeros(...)
point_to_plane_distance(w, w0, x)
```

The origin case is simply a **special case of the general problem**.

This mirrors our mathematics exactly.

```text
Mathematics:

General point
     ↓
x

Special point
     ↓
x = 0


Python:

General point
     ↓
x = np.array([...])

Special point
     ↓
x = np.zeros(...)
```

This is a very good programming habit:

> **Don't create separate logic when a special case naturally falls out of the general solution.**

---

# 8.15 Using `np.zeros`

Instead of manually writing:

```python
x = np.array([0, 0])
```

we can write:

```python
x = np.zeros(2)
```

For 3D:

```python
x = np.zeros(3)
```

For 100 dimensions:

```python
x = np.zeros(100)
```

This is another nice connection to ML.

We don't need to manually visualize a 100-dimensional origin.

Mathematically:

```math id="p8-high-origin"
\overrightarrow{x}
=
\overrightarrow{0}
```

Computationally:

```python
x = np.zeros(100)
```

---

# 8.16 A Reusable General Implementation

Let's write the clean version we could actually keep in our ML notebook:

```python
import numpy as np

def point_to_plane_distance(w, w0, x):
    """
    Calculate perpendicular distance between
    a point x and the hyperplane:

        wᵀx + w0 = 0
    """

    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

Example:

```python
w = np.array([3, 4])
w0 = -12
x = np.array([0, 0])

distance = point_to_plane_distance(w, w0, x)

print(f"Distance = {distance}")
```

Output:

```text
Distance = 2.4
```

---

# 8.17 Let's Also Calculate the Signed Value

Our ordinary distance uses:

```python
abs(...)
```

But sometimes we want to know which side of the plane the point is on.

The signed distance is:

```math id="p8-signed-distance"
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

Python:

```python
def signed_point_to_plane_distance(w, w0, x):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return (np.dot(w, x) + w0) / w_norm
```

For the origin:

```python
w = np.array([3, 4])
w0 = -12
x = np.array([0, 0])

signed_distance = signed_point_to_plane_distance(w, w0, x)

print(signed_distance)
```

Output:

```text
-2.4
```

The negative sign tells us the origin lies on one particular side of the plane, according to the orientation chosen for $\overrightarrow{w}$.

---

# 8.18 Why This Matters for ML

Now we can write something extremely useful:

```python
score = np.dot(w, x) + w0
```

This is the model's linear score.

Then:

```python
signed_distance = score / np.linalg.norm(w)
```

gives the signed geometric distance from the decision boundary.

And:

```python
distance = abs(score) / np.linalg.norm(w)
```

gives the ordinary distance.

So:

```text
ML model
   ↓
score = wᵀx + w₀
   ↓
sign
   → which side?

normalize by ||w||
   ↓
signed distance

take absolute value
   ↓
ordinary distance
```

This is a very important bridge between **ML code and geometry**.

---

# 8.19 A Small Classification Example

Suppose:

```python
w = np.array([2, 1])
w0 = -4
```

The decision boundary is:

```math id="p8-class-boundary"
\boxed{
2x_1+x_2-4=0
}
```

Take:

```python
x = np.array([3, 1])
```

Calculate the score:

```python
score = np.dot(w, x) + w0
```

We get:

```text
2(3) + 1(1) - 4
= 3
```

So:

```text
score > 0
```

The point lies on the positive side of the boundary.

Its geometric distance is:

```python
distance = abs(score) / np.linalg.norm(w)
```

which is:

```math id="p8-class-distance"
\boxed{
\frac{3}{\sqrt5}
}
```

Approximately:

```math id="p8-class-distance2"
\boxed{
1.342
}
```

So we now have two pieces of information:

```text
score > 0
   ↓
which side?

1.342
   ↓
how far?
```

---

# 8.20 What We Have Actually Achieved With Python

We started with:

```math id="p8-start"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

and turned it into:

```python
distance = abs(w0) / np.linalg.norm(w)
```

But more importantly, we have built a general implementation:

```python
distance = abs(np.dot(w, x) + w0) / np.linalg.norm(w)
```

which works for:

* 2D lines
* 3D planes
* higher-dimensional hyperplanes
* ML decision boundaries

That is the real value of this section.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Think of this code:

```python
score = np.dot(w, x) + w0
```

as asking:

> **"Where is this data point relative to my model's boundary?"**

Then:

```python
distance = abs(score) / np.linalg.norm(w)
```

asks:

> **"How far is it from that boundary?"**

So the mathematical geometry we've learned becomes actual ML computation.

```text
Feature vector x
       ↓
Weight vector w
       ↓
wᵀx + w₀
       ↓
Model score
       ↓
┌───────────────┬───────────────┐
↓               ↓
sign             magnitude
↓               ↓
which side?      how far?
```

---

# 🧠 Part 8 Mental Model

The most important code-to-math mapping is:

```text
np.array(...)
      ↓
vector

np.dot(w, x)
      ↓
wᵀx

np.linalg.norm(w)
      ↓
||w||

abs(...)
      ↓
|...|

wᵀx + w₀
      ↓
linear model score

|wᵀx + w₀| / ||w||
      ↓
perpendicular distance
```

---

# 🔑 Part 8 Takeaways

### Origin-specific implementation

```python
def origin_to_plane_distance(w, w0):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(w0) / w_norm
```

### General implementation

```python
def point_to_plane_distance(w, w0, x):
    w_norm = np.linalg.norm(w)

    if w_norm == 0:
        raise ValueError("Normal vector cannot be the zero vector.")

    return abs(np.dot(w, x) + w0) / w_norm
```

### Core mathematical bridge

```math id="p8-final"
\boxed{
\text{ML Score}
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

and:

```math id="p8-final-distance"
\boxed{
\text{Distance}
=
\frac{
|\text{ML Score}|
}{
\|\overrightarrow{w}\|
}
}
```

---

## One-Line Understanding

> **NumPy gives us a direct computational translation of the geometry: `w` represents the normal/weight vector, `x` represents the feature vector, `wᵀx + w₀` is the linear score, and dividing its absolute value by `||w||` converts that score into actual perpendicular distance.**

---

## ✅ Topic Status

We have now covered:

```text
Part 1 → Why do we need distance of origin from plane?
Part 2 → The origin as a special point
Part 3 → Deriving the origin-to-plane distance
Part 4 → Why does the formula become so simple?
Part 5 → Numerical examples
Part 6 → Geometric interpretation
Part 7 → Machine Learning perspective
Part 8 → Python / NumPy
```

### Next: **Part 9 — Revision + Interview Guide**

We'll consolidate the entire topic into a compact but deep revision structure, including the derivation, geometric intuition, ML interpretation, common mistakes, interview questions, and a final mental model.

