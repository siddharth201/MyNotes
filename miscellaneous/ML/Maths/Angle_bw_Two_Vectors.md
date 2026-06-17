# Angle Between Two Vectors

## Introduction

The angle between two vectors tells us how similar their directions are.

```text
Smaller Angle  → More Similar Direction

90°            → Perpendicular

180°           → Opposite Direction
```

This concept is extremely important in:

- Machine Learning
- Deep Learning
- Embeddings
- Recommendation Systems
- Search Engines
- ChatGPT / LLMs

---

# Geometric View

Consider two vectors:

```text
x =
[
  [x₁],
  [x₂]
]

y =
[
  [y₁],
  [y₂]
]
```

Visual:

```text
           y
          ↗
         /
        /
       / θ
      /
-----/--------------→ x
```

The angle between the vectors is θ.

---

# Relationship Between Dot Product and Angle

The most important formula is:

```text
xᵀy = ||x|| ||y|| cos(θ)
```

where:

```text
xᵀy   = Dot Product

||x|| = Magnitude of Vector x

||y|| = Magnitude of Vector y

θ     = Angle Between Vectors
```

---

# Formula to Find Angle

Rearranging:

```text
cos(θ)

=

(xᵀy)

/

(||x|| ||y||)
```

Therefore:

```text
θ

=

cos⁻¹
(
(xᵀy)
/
(||x|| ||y||)
)
```

---

# Example 1

Given:

```text
x =
[
  [2],
  [2]
]

y =
[
  [1],
  [0]
]
```

---

## Step 1: Compute Dot Product

```text
xᵀy

=

(2 × 1) + (2 × 0)

=

2
```

---

## Step 2: Compute Magnitudes

Magnitude of x:

```text
||x||

=

√(2² + 2²)

=

√8

=

2√2
```

Magnitude of y:

```text
||y||

=

√(1² + 0²)

=

1
```

---

## Step 3: Compute Cosine

```text
cos(θ)

=

2

/

(2√2 × 1)

=

1/√2
```

---

## Step 4: Find Angle

```text
θ

=

cos⁻¹(1/√2)

=

45°
```

Result:

```text
Angle Between Vectors = 45°
```

---

# Example 2: Perpendicular Vectors

Given:

```text
x =
[
  [0],
  [1]
]

y =
[
  [1],
  [0]
]
```

Dot Product:

```text
xᵀy

=

(0 × 1) + (1 × 0)

=

0
```

Therefore:

```text
cos(θ)

=

0
```

Thus:

```text
θ

=

90°
```

Result:

```text
Vectors are Perpendicular
```

---

# Understanding Cosine Values

Important fact:

```text
-1 ≤ cos(θ) ≤ 1
```

This means:

```text
-1

≤

(xᵀy)

/

(||x|| ||y||)

≤

1
```

---

# Interpretation of Angle

## Case 1: Same Direction

```text
θ = 0°
```

```text
cos(θ) = 1
```

Meaning:

```text
Maximum Similarity
```

Example:

```text
[1, 1]

and

[2, 2]
```

---

## Case 2: Acute Angle

```text
0° < θ < 90°
```

```text
cos(θ) > 0
```

Meaning:

```text
Vectors generally point in the same direction.
```

---

## Case 3: Perpendicular

```text
θ = 90°
```

```text
cos(θ) = 0
```

Meaning:

```text
No Directional Similarity
```

Important:

```text
xᵀy = 0
```

implies vectors are orthogonal.

---

## Case 4: Obtuse Angle

```text
90° < θ < 180°
```

```text
cos(θ) < 0
```

Meaning:

```text
Vectors point in opposite tendencies.
```

---

## Case 5: Opposite Direction

```text
θ = 180°
```

```text
cos(θ) = -1
```

Meaning:

```text
Completely Opposite Directions
```

---

# Cosine Similarity

Machine Learning often uses:

```text
Cosine Similarity

=

(xᵀy)

/

(||x|| ||y||)
```

Notice:

```text
Cosine Similarity = cos(θ)
```

Instead of computing θ, ML algorithms directly use cos(θ).

---

# Why Cosine Similarity is Useful

Suppose:

```text
Document A

=
[100, 5, 2]

Document B

=
[200, 10, 4]
```

Magnitudes are different.

However:

```text
Direction is almost identical.
```

Cosine Similarity captures:

```text
Direction

NOT

Magnitude
```

---

# Applications in Machine Learning

## Word Embeddings

```text
King

Queen

Man

Woman
```

are represented as vectors.

Similarity is measured using:

```text
Cosine Similarity
```

---

## Search Engines

Compare:

```text
Query Vector

and

Document Vector
```

using angle.

---

## Recommendation Systems

Compare:

```text
User Vector

and

Movie/Product Vector
```

---

## ChatGPT / LLMs

Embeddings are compared using:

```text
Cosine Similarity
```

to find semantic similarity.

---

# Interview Questions

### Q1. How do you find angle between two vectors?

Answer:

```text
θ

=

cos⁻¹
(
(xᵀy)
/
(||x|| ||y||)
)
```

---

### Q2. What does xᵀy = 0 mean?

Answer:

```text
Vectors are orthogonal
(perpendicular)
```

---

### Q3. What does cosine similarity measure?

Answer:

```text
Directional Similarity
between vectors.
```

---

# Key Takeaways

1. Angle measures directional similarity.

2. Fundamental Formula:

```text
xᵀy = ||x|| ||y|| cos(θ)
```

3. Angle Formula:

```text
θ = cos⁻¹( (xᵀy) / (||x|| ||y||) )
```

4. If:

```text
xᵀy = 0
```

then vectors are perpendicular.

5. If:

```text
cos(θ) = 1
```

vectors point in the same direction.

6. If:

```text
cos(θ) = -1
```

vectors point in opposite directions.

7. Cosine Similarity is one of the most important similarity measures used in AI and Machine Learning.

---

# Mental Model

```text
Angle Between Vectors
          ↓
 Direction Similarity
          ↓
 Cosine Similarity
          ↓
 Embeddings
          ↓
 Search / Recommendations / LLMs
```
