
Perfect. This will be the last technical section before revision. As agreed, we'll keep it **practical, concise, and beginner-friendly**.

---

# Part 7 — Python & Visualization

> **Goal:** Learn how to compute the angle between vectors using Python and visualize the concepts we've studied mathematically.

---

# 📋 Topic Metadata

| Field            | Value                      |
| ---------------- | -------------------------- |
| Chapter          | Linear Algebra             |
| Topic            | Angle Between Vectors      |
| Part             | 7 — Python & Visualization |
| Difficulty       | ⭐⭐☆☆☆                      |
| Importance in ML | ⭐⭐⭐⭐⭐                      |
| Libraries Used   | NumPy, Matplotlib          |

---

# 7.1 Computing the Dot Product Using NumPy

Python makes vector operations extremely simple.

```python
import numpy as np

# Define two vectors
x = np.array([2, 3])
y = np.array([4, 1])

# Compute dot product
dot_product = np.dot(x, y)

print("Dot Product =", dot_product)
```

### Output

```text
Dot Product = 11
```

---

## What Does `np.dot()` Actually Do?

Internally,

```text
[2, 3]

·

[4, 1]
```

becomes

```text
(2 × 4) + (3 × 1)

=

8 + 3

=

11
```

Exactly the same calculation we performed manually.

> **Key Insight:** NumPy is not introducing a new formula—it is simply automating the arithmetic.

---

# 7.2 Computing the Magnitude of a Vector

The magnitude (Euclidean norm) is computed using `np.linalg.norm()`.

```python
import numpy as np

x = np.array([2, 3])

magnitude = np.linalg.norm(x)

print(magnitude)
```

### Output

```text
3.605551275463989
```

This matches

```math
\sqrt{2^2+3^2}
=
\sqrt{13}
\approx
3.6056
```

---

# 7.3 Computing the Angle Between Two Vectors

We now combine everything we have learned.

```python
import numpy as np

x = np.array([2, 3])
y = np.array([4, 1])

dot = np.dot(x, y)

norm_x = np.linalg.norm(x)
norm_y = np.linalg.norm(y)

cos_theta = dot / (norm_x * norm_y)

angle = np.degrees(np.arccos(cos_theta))

print("Cosine =", cos_theta)
print("Angle =", angle)
```

### Output

```text
Cosine = 0.84366

Angle = 32.47°
```

---

# Step-by-Step Flow

The computer performs exactly the same mathematical pipeline we derived in this chapter.

```text
Two Vectors
      │
      ▼
Compute Dot Product
      │
      ▼
Compute Magnitudes
      │
      ▼
Divide by Product of Magnitudes
      │
      ▼
Obtain cos(θ)
      │
      ▼
Apply Inverse Cosine
      │
      ▼
Angle Between Vectors
```

Nothing is "magic." The implementation directly follows the mathematics.

---

# 7.4 Visualizing the Vectors

A simple plot helps build intuition.

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.array([2, 3])
y = np.array([4, 1])

plt.figure(figsize=(6,6))

plt.quiver(0, 0, x[0], x[1],
           angles='xy',
           scale_units='xy',
           scale=1,
           label='Vector x')

plt.quiver(0, 0, y[0], y[1],
           angles='xy',
           scale_units='xy',
           scale=1,
           label='Vector y')

plt.xlim(0,5)
plt.ylim(0,5)

plt.grid(True)
plt.axis('equal')

plt.legend()

plt.show()
```

This visualization helps you **see** the angle instead of only calculating it.

---

# 7.5 Explore the Concept Yourself

Change the vectors and observe how the angle changes.

Try these examples:

### Same Direction

```python
x = np.array([2,3])
y = np.array([4,6])
```

Expected result:

```text
Angle ≈ 0°
```

---

### Perpendicular

```python
x = np.array([2,1])
y = np.array([1,-2])
```

Expected result:

```text
Angle ≈ 90°
```

---

### Opposite Direction

```python
x = np.array([2,3])
y = np.array([-2,-3])
```

Expected result:

```text
Angle ≈ 180°
```

Experimenting with these examples reinforces the intuition we developed in the numerical section.

---

# 7.6 Desmos Activity (Recommended)

Open **Desmos** and:

1. Plot two vectors from the origin.
2. Change the coordinates interactively.
3. Observe how the angle changes.
4. Predict whether the dot product will be positive, zero, or negative **before** calculating it.

This is an excellent exercise for building geometric intuition.

---

# 🧠 Mini Challenge

Without using Python, predict the sign of the dot product for each pair.

| Vector A | Vector B | Prediction |
| -------- | -------- | ---------- |
| (2,3)    | (4,6)    | ?          |
| (2,1)    | (1,-2)   | ?          |
| (2,3)    | (-2,-3)  | ?          |

Then verify your answers using NumPy.

---

# 📦 Key Takeaways

* `np.dot()` computes the dot product.
* `np.linalg.norm()` computes the magnitude.
* `np.arccos()` converts cosine into an angle.
* `np.degrees()` converts radians into degrees.
* Python follows exactly the same mathematical process that we derived manually.

---

# 📝 Interview Tip

**Question:**

How do you compute the angle between two vectors in Python?

**Answer:**

1. Compute the dot product using `np.dot()`.
2. Compute both magnitudes using `np.linalg.norm()`.
3. Calculate

```math
\cos\theta
=
\frac{\mathbf{x}\cdot\mathbf{y}}
{\|\mathbf{x}\|\|\mathbf{y}\|}
```

4. Use `np.arccos()` to obtain the angle in radians.
5. Convert radians to degrees using `np.degrees()` if required.

---

### ✅ Scaler Coverage

| Scaler Content        | Status |
| --------------------- | :----: |
| Python implementation |    ✅   |

### 🚀 Added by Our Notebook

| Additional Content                  | Status |
| ----------------------------------- | :----: |
| Explanation of every NumPy function |    ✅   |
| Manual-to-code mapping              |    ✅   |
| Visualization                       |    ✅   |
| Interactive exercises               |    ✅   |
| Interview tip                       |    ✅   |

---

## 🎉 Topic Status

With Part 7 complete, the educational content of **"Angle Between Vectors"** is finished.

The only remaining section is **Part 8 — Revision & Interview Guide**, which will serve as a compact, high-value summary containing:

* 📌 One-page revision notes
* 🧠 Memory tricks
* 🗺️ Mind map
* 💼 Interview questions
* 📊 Scaler coverage vs notebook additions
* 🤔 Curiosity Box

This will make the topic easy to revise before interviews or while studying later.
