# Dot Product (Inner Product)

## What is Dot Product?

The dot product is a way of multiplying two vectors and getting a single number (scalar).

Suppose:

```text
A =
[
  [2],
  [3]
]

B =
[
  [4],
  [5]
]
```

Both are vectors in R².

---

# Method 1: Component-wise Multiplication

Multiply corresponding elements and add them.

```text
A · B

= (2 × 4) + (3 × 5)

= 8 + 15

= 23
```

Result:

```text
A · B = 23
```

Notice:

The result is a single number, not a vector.

---

# Method 2: Matrix Multiplication View

A and B are column vectors.

```text
A =
[
  [2],
  [3]
]

Dimension: 2 × 1
```

Take transpose of A:

```text
Aᵀ =
[
  [2, 3]
]

Dimension: 1 × 2
```

Now multiply:

```text
Aᵀ B
```

Dimensions:

```text
(1 × 2) × (2 × 1)
```

Valid because:

```text
2 = 2
```

Result dimension:

```text
1 × 1
```

Calculation:

```text
[
  [2, 3]
]

×

[
  [4],
  [5]
]

=
[
  [(2×4) + (3×5)]
]

=
[
  [23]
]
```

Thus:

```text
A · B = AᵀB = 23
```

---

# Why Do We Use Transpose?

Dot product requires:

```text
Row Vector × Column Vector
```

A vector is usually stored as:

```text
[
  [2],
  [3]
]
```

which is a column vector.

To perform matrix multiplication, we convert one vector into a row vector using transpose.

```text
Column Vector

[
  [2],
  [3]
]

↓

Transpose

[
  [2, 3]
]
```

---

# Geometric Meaning of Dot Product

Dot product measures:

```text
How much two vectors point in the same direction.
```

There is a famous formula:

A · B = |A| |B| cos(θ)

where:

- |A| = magnitude of A
- |B| = magnitude of B
- θ = angle between vectors

---

# Case 1: Same Direction

Suppose:

```text
A = [1, 0]

B = [2, 0]
```

They point in exactly the same direction.

```text
θ = 0°
```

Since:

```text
cos(0°) = 1
```

Dot product becomes maximum.

---

# Case 2: Perpendicular Vectors

Suppose:

```text
A = [1, 0]

B = [0, 1]
```

These vectors are perpendicular.

```text
θ = 90°
```

Since:

```text
cos(90°) = 0
```

Dot product:

```text
A · B = 0
```

Very important result:

If:

```text
A · B = 0
```

Then:

```text
A and B are orthogonal (perpendicular)
```

---

# Case 3: Opposite Directions

Suppose:

```text
A = [1, 0]

B = [-1, 0]
```

Angle:

```text
θ = 180°
```

Since:

```text
cos(180°) = -1
```

Dot product becomes negative.

---

# Magnitude Refresher

For:

```text
A =
[
  [2],
  [3]
]
```

Magnitude:

```text
|A|

= √(2² + 3²)

= √13
```

For:

```text
B =
[
  [4],
  [5]
]
```

Magnitude:

```text
|B|

= √(4² + 5²)

= √41
```

---

# Why Dot Product is Important in ML

## 1. Linear Regression

Prediction:

```text
y = wᵀx + b
```

This is a dot product.

Example:

```text
w =
[
  [2],
  [3]
]

x =
[
  [4],
  [5]
]
```

Prediction:

```text
(2×4) + (3×5)

= 23
```

Then add bias.

---

## 2. Neural Networks

A neuron computes:

```text
y = wᵀx + b
```

Every neuron starts with a dot product.

---

## 3. Cosine Similarity

Used in:

- NLP
- Embeddings
- Recommendation Systems
- ChatGPT

Formula:

```text
cos(θ)

=
(A · B)

/
(|A| |B|)
```

Measures similarity between vectors.

---

## 4. Finding Perpendicular Directions

Used in:

- PCA
- Linear Algebra
- Optimization
- Computer Graphics

Condition:

```text
A · B = 0
```

---

# Transpose (From Your Notes)

Suppose:

```text
A =
[
  [1, 2],
  [3, 4]
]
```

Transpose means:

Rows become columns.

```text
Aᵀ =
[
  [1, 3],
  [2, 4]
]
```

Rule:

```text
Rows ↔ Columns
```

---

# Key Takeaways

1. Dot Product = Multiply corresponding elements and add.

```text
A · B

= a₁b₁ + a₂b₂ + ... + aₙbₙ
```

2. Dot product is equivalent to:

```text
AᵀB
```

3. Result is always a scalar (single number).

4. Dot product measures similarity of directions.

5. If:

```text
A · B = 0
```

then vectors are perpendicular.

6. Every ML model starts with:

```text
wᵀx
```

which is simply a dot product.
