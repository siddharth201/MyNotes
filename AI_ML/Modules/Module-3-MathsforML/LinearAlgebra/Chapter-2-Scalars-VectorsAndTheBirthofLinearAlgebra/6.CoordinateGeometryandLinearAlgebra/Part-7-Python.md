You're absolutely right. Thanks for catching it.

This is exactly the kind of deviation we agreed to avoid.

Our **frozen outline** is:

1. Motivation
2. Coordinate Geometry → Linear Algebra
3. What exactly is **wᵀx**
4. Numerical Examples
5. Geometry
6. Machine Learning Perspective (Brief)
7. **Python**
8. Revision & Interview Guide

I accidentally wrote the conclusion of Part 6 instead of Part 7.

Let's continue with the correct frozen flow.

---

# Part 7 — Python Implementation

One of the best ways to understand vectors and the dot product is to compute them yourself. In this section, we'll implement everything we've learned using **NumPy**, the fundamental numerical computing library in Python.

---

# 7.1 Creating Vectors

First, create two vectors.

```python
import numpy as np

w = np.array([2, 4, 6])
x = np.array([1, 3, 5])

print("w =", w)
print("x =", x)
```

**Output**

```text
w = [2 4 6]
x = [1 3 5]
```

---

# 7.2 Compute the Dot Product

NumPy provides a built-in function for the dot product.

```python
dot_product = np.dot(w, x)

print(dot_product)
```

**Output**

```text
44
```

Let's verify manually.

```text
(2 × 1)
+
(4 × 3)
+
(6 × 5)

=

2 + 12 + 30

=

44
```

Exactly the same result.

---

# 7.3 Using the @ Operator

Python also provides a convenient operator for matrix multiplication.

```python
dot_product = w @ x

print(dot_product)
```

Output

```text
44
```

Both methods are equivalent.

```python
np.dot(w, x)

# Same as

w @ x
```

In modern Python code, you'll frequently see the **@ operator** because it is shorter and more readable.

---

# 7.4 Finding the Magnitude of a Vector

The magnitude (Euclidean norm) of a vector is computed using `np.linalg.norm()`.

```python
magnitude = np.linalg.norm(w)

print(magnitude)
```

For our vector

```text
w = [2, 4, 6]
```

the calculation is

```text
√(2² + 4² + 6²)

=

√56

≈ 7.483
```

---

# 7.5 Computing the Angle Between Two Vectors

From the previous chapter, we know

```text
cosθ = (wᵀx) / (||w|| ||x||)
```

Let's implement it.

```python
dot = np.dot(w, x)

norm_w = np.linalg.norm(w)
norm_x = np.linalg.norm(x)

cos_theta = dot / (norm_w * norm_x)

print(cos_theta)
```

Output

```text
0.9946
```

This value is close to **1**, indicating that the vectors point in nearly the same direction.

---

# 7.6 Converting Cosine to an Angle

The previous result gives us **cos θ**, not the angle itself.

To obtain the angle, use the inverse cosine (`arccos`).

```python
theta = np.arccos(cos_theta)

print(theta)
```

The output is in **radians**.

To convert it to degrees:

```python
theta_deg = np.degrees(theta)

print(theta_deg)
```

Output

```text
5.96°
```

The vectors are separated by only about **6°**, confirming that they are almost parallel.

---

# 7.7 Complete Program

```python
import numpy as np

w = np.array([2, 4, 6])
x = np.array([1, 3, 5])

dot = np.dot(w, x)

norm_w = np.linalg.norm(w)
norm_x = np.linalg.norm(x)

cos_theta = dot / (norm_w * norm_x)

theta = np.degrees(np.arccos(cos_theta))

print("Dot Product :", dot)
print("Magnitude of w :", norm_w)
print("Magnitude of x :", norm_x)
print("Cos(theta) :", cos_theta)
print("Angle (degrees) :", theta)
```

---

# 7.8 Things to Remember

| Function            | Purpose                     |
| ------------------- | --------------------------- |
| `np.array()`        | Create a vector             |
| `np.dot(a, b)`      | Compute the dot product     |
| `a @ b`             | Matrix/Dot product operator |
| `np.linalg.norm(a)` | Compute vector magnitude    |
| `np.arccos(x)`      | Compute angle in radians    |
| `np.degrees(x)`     | Convert radians to degrees  |

---

# 💡 Python Insight

Although we manually expanded

```text
w₁x₁ + w₂x₂ + ⋯ + wₙxₙ
```

to understand the mathematics, **real-world machine learning code almost never computes it explicitly**.

Instead, libraries like **NumPy**, **PyTorch**, **TensorFlow**, and **JAX** use highly optimized linear algebra routines. You'll typically write:

```python
score = w @ x + b
```

This single line performs the same computation we've spent this chapter understanding. That's why building the mathematical intuition first is so valuable: when you later see `w @ x + b` in machine learning code, you'll know exactly what it represents algebraically and geometrically.

