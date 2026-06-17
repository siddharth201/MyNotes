# Distance, Magnitude and Norms

## Big Picture

A very important idea in Machine Learning is:

Distance between points = Magnitude of difference vector = Norm

Mathematically:

Distance(A, B) = ||A - B||

This single concept connects:
- Distance Formula
- Euclidean Distance
- Manhattan Distance
- Vector Magnitude
- L1 Norm
- L2 Norm

---

# 1. Distance Formula

Suppose we have two points:

A = (x₁, y₁)

B = (x₂, y₂)

Distance between them:

d = √((x₂ - x₁)² + (y₂ - y₁)²)

This comes from the Pythagorean Theorem.

### Example

A = (1, 2)

B = (4, 6)

Δx = 4 - 1 = 3

Δy = 6 - 2 = 4

Distance:

d = √(3² + 4²)

d = √(9 + 16)

d = 5

---

# 2. Euclidean Distance (L2 Distance)

Euclidean distance is the "straight-line distance".

For vectors:

x = (x₁, x₂, ..., xₙ)

y = (y₁, y₂, ..., yₙ)

Distance:

d(x,y) = √(Σ(xᵢ - yᵢ)²)

### Example

A = (2, 3)

B = (5, 7)

Distance:

d = √((5-2)² + (7-3)²)

d = √(9 + 16)

d = 5

### ML Use Cases

- KNN (K-Nearest Neighbors)
- K-Means Clustering
- PCA
- Embedding Similarity

---

# 3. Manhattan Distance (L1 Distance)

Manhattan distance measures travel along grid lines.

Formula:

d(x,y) = Σ|xᵢ - yᵢ|

### Example

A = (1,2)

B = (4,6)

Distance:

d = |4-1| + |6-2|

d = 3 + 4

d = 7

### ML Use Cases

- Sparse Data
- NLP
- Recommendation Systems
- High-Dimensional Data

---

# 4. Magnitude of a Vector

Vector:

v = [3, 4]

Magnitude means:

"How far is the vector from the origin?"

Formula:

|v| = √(3² + 4²)

|v| = 5

Notice:

Magnitude is simply the distance from (0,0) to (3,4).

---

# 5. Euclidean Magnitude (L2 Norm)

For vector:

v = [x₁, x₂, ..., xₙ]

Formula:

||v||₂ = √(x₁² + x₂² + ... + xₙ²)

### Example

v = (2, 3, 6)

||v||₂ = √(4 + 9 + 36)

||v||₂ = 7

---

# 6. Manhattan Magnitude (L1 Norm)

Formula:

||v||₁ = |x₁| + |x₂| + ... + |xₙ|

### Example

v = (2, -3, 6)

||v||₁ = 2 + 3 + 6

||v||₁ = 11

---

# 7. Norms of a Vector

A norm is a mathematical way of measuring the size or length of a vector.

## L1 Norm

||v||₁ = Σ|xᵢ|

Example:

v = (2, -5, 3)

||v||₁ = 10

Also called:
- Manhattan Norm
- Taxicab Norm

## L2 Norm

||v||₂ = √(Σxᵢ²)

Example:

v = (3,4)

||v||₂ = 5

Also called:
- Euclidean Norm

## L∞ Norm

||v||∞ = max(|xᵢ|)

Example:

v = (2, -10, 5)

||v||∞ = 10

---

# 8. Why Norms Matter in Machine Learning

## L2 Regularization (Ridge Regression)

Penalty:

||w||₂²

Benefits:
- Prevents huge weights
- Reduces overfitting
- Produces smooth models

## L1 Regularization (Lasso Regression)

Penalty:

||w||₁

Benefits:
- Feature Selection
- Produces Sparse Models
- Many weights become zero

---

# Key Takeaway

Distance(A, B) = ||A - B||

Everything in this chapter revolves around this idea.

Distance between points
    ↓
Difference Vector
    ↓
Magnitude
    ↓
Norm

Understanding this relationship is fundamental for:
- Linear Algebra
- Machine Learning
- Deep Learning
- Optimization
