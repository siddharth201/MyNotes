This proof is **very important in Machine Learning**, especially when studying:

* Linear Regression
* Perceptron
* SVM
* Hyperplanes
* Decision Boundaries

Let's derive it slowly.

---

# Statement to Prove

Given a line (or hyperplane)

$$w^T x + w_0 = 0$$

prove that the vector **w** is perpendicular (normal) to the line.

---

# Step 1: Pick any two points on the line

Suppose:

```text
A(x₁)
B(x₂)
```

Both lie on the line.

Therefore both satisfy:

[
w^T x_1 + w_0 = 0
]

and

[
w^T x_2 + w_0 = 0
]

Let's call them:

```text
(1)  wᵀx₁ + w₀ = 0

(2)  wᵀx₂ + w₀ = 0
```

---

# Step 2: Subtract the equations

Subtract (1) from (2):

[
(w^T x_2 + w_0)
---------------

# (w^T x_1 + w_0)

0
]

Expand:

[
w^T x_2
-------

# w^T x_1

0
]

Factor out (w^T):

[
w^T(x_2-x_1)=0
]

---

# Step 3: Interpret (x_2 - x_1)

The vector

[
x_2-x_1
]

is simply the vector from point A to point B.

We write:

[
AB = x_2-x_1
]

Therefore:

[
w^T AB = 0
]

---

# Step 4: Dot Product Interpretation

Remember:

[
a^Tb = a\cdot b
]

So:

[
w^T AB
======

# w \cdot AB

0
]

---

# Step 5: What does dot product zero mean?

For two vectors:

[
a\cdot b
========

|a||b|\cos\theta
]

If:

[
a\cdot b=0
]

then

[
|a||b|\cos\theta = 0
]

Assuming neither vector is zero:

[
\cos\theta = 0
]

Therefore:

[
\theta = 90^\circ
]

or

[
\theta = \frac{\pi}{2}
]

---

# Conclusion

Since

[
w\cdot AB = 0
]

the vector (w) is perpendicular to the direction vector (AB).

Since (AB) lies along the line,

[
\boxed{w \perp (w^T x + w_0 = 0)}
]

Thus **w is the normal vector of the line/hyperplane.**

---

# Geometric Intuition

Imagine the line:

```text
\
 \
  \
   \
```

Any vector along the line could be:

```text
AB
```

The vector **w** points outward:

```text
      w
      ↑
      |
      |
\     |
 \    |
  \   |
   \  |
```

Because:

```text
w · AB = 0
```

the angle between them is:

```text
90°
```

---

# ML Interpretation (Very Important)

In Machine Learning, a decision boundary is:

[
w^T x + b = 0
]

The vector:

[
w
]

always points **perpendicular to the decision boundary**.

This is why:

* (w) is called the **normal vector**
* SVM tries to maximize distance along (w)
* Gradient updates often move parameters in the direction of (w)

### One-line memory trick

For any hyperplane:

[
w^T x + b = 0
]

**The coefficient vector (w) is always perpendicular (normal) to the hyperplane.**

The proof is simply:

[
w^T x_1 + b = 0
]

[
w^T x_2 + b = 0
]

Subtract:

[
w^T(x_2-x_1)=0
]

[
w \cdot AB = 0
]

[
\boxed{w \perp AB}
]

and since (AB) is any direction on the line, (w) is perpendicular to the entire line.

