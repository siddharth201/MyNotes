Your notes are covering one of the most important concepts in ML:

>> **The angle between two vectors tells us how similar their directions are.**

This idea directly leads to:

* Dot Product
* Cosine Similarity
* Embeddings
* Recommendation Systems
* Transformers
 

# Angle Between Two Vectors

## Why Do We Care About Angle?

Suppose we have two vectors:

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

The angle between them tells us:

```text
How similar their directions are.
```

Important:

```text
Small Angle
→ Similar Direction

90°
→ Unrelated

180°
→ Opposite Direction
```

---

# Geometric Picture

Suppose:

```text
x =
[
  [1],
  [0]
]
```

and

```text
y =
[
  [2],
  [2]
]
```

Visual:

          y(2,2)
            ↗
           /
          /
         /
--------/----------→ x
      θ

The angle θ measures how far apart the directions are.

---

# Dot Product Formula

We know:

```text
x · y

=
x₁y₁ + x₂y₂ + ... + xₙyₙ
```

But geometrically:

```text
x · y

=

||x|| ||y|| cos(θ)
```

where:

```text
||x|| = magnitude of x

||y|| = magnitude of y

θ = angle between vectors
```

This is one of the most important formulas in Linear Algebra.

---

# Finding the Angle

Rearrange:

```text
cos(θ)

=

(x · y)

/
(||x|| ||y||)
```

Therefore:

```text
θ

=

cos⁻¹
(
(x · y)
/
(||x|| ||y||)
)
```

This is the standard formula.

---

# Example 1

Suppose:

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

## Step 1: Dot Product

```text
x · y

=

(2×1) + (2×0)

=

2
```

---

## Step 2: Magnitudes

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

## Step 3: Calculate cos(θ)

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

## Step 4: Find θ

```text
θ

=

cos⁻¹(1/√2)

=

45°
```

Result:

```text
Angle = 45°
```

This matches your notes.

---

# Example 2: Perpendicular Vectors

Suppose:

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

---

## Dot Product

```text
x · y

=

(0×1) + (1×0)

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

cos⁻¹(0)

=

90°
```

Result:

```text
Vectors are perpendicular.
```

---

# Important Observation

If:

```text
x · y = 0
```

Then:

```text
θ = 90°
```

This means:

```text
Vectors are orthogonal
(perpendicular)
```

Very important in ML.

---

# Understanding Cosine Values

We know:

```text
-1 ≤ cos(θ) ≤ 1
```

Therefore:

```text
-1 ≤

(x · y)
/
(||x|| ||y||)

≤ 1
```

This explains the note in your screenshot.

---

# Interpretation of Cos(θ)

## Case 1

```text
θ = 0°
```

Then:

```text
cos(θ) = 1
```

Meaning:

```text
Same direction
```

Maximum similarity.

---

## Case 2

```text
0° < θ < 90°
```

Then:

```text
cos(θ) > 0
```

Meaning:

```text
Generally pointing in the same direction.
```

Positive similarity.

---

## Case 3

```text
θ = 90°
```

Then:

```text
cos(θ) = 0
```

Meaning:

```text
No directional relationship.
```

Orthogonal.

---

## Case 4

```text
90° < θ < 180°
```

Then:

```text
cos(θ) < 0
```

Meaning:

```text
Opposite tendency.
```

Negative similarity.

---

## Case 5

```text
θ = 180°
```

Then:

```text
cos(θ) = -1
```

Meaning:

```text
Exactly opposite directions.
```

---

# Cosine Similarity

Machine Learning often uses:

```text
Cosine Similarity

=

(x · y)

/
(||x|| ||y||)
```

Notice:

```text
Cosine Similarity

=

cos(θ)
```

So ML doesn't actually compute θ.

It directly uses cos(θ).

---

# Why ML Uses Cosine Similarity

Suppose:

```text
Document A
=
[100, 5, 2]

Document B
=
[200, 10, 4]
```

Lengths differ greatly.

But direction is almost identical.

Cosine similarity focuses on:

```text
Direction

not

Magnitude
```

This is extremely useful in:

- NLP
- Search Engines
- Recommendation Systems
- Embeddings
- LLMs

---

# Applications in Machine Learning

## Embeddings

ChatGPT converts text into vectors.

Similarity between vectors:

```text
Cosine Similarity
```

---

## Recommendation Systems

Compare:

```text
User Vector

and

Movie Vector
```

using angle.

---

## Search Engines

Query vector

vs

Document vector

---

## Clustering

Find similar data points.

---

# Key Takeaways

1. Angle measures similarity of directions.

2. Dot Product Formula:

```text
x · y

=

||x|| ||y|| cos(θ)
```

3. Angle Formula:

```text
θ

=

cos⁻¹
(
(x · y)
/
(||x|| ||y||)
)
```

4. If:

```text
x · y = 0
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

7. Modern AI systems heavily use:

```text
Cosine Similarity

=

(x · y)
/
(||x|| ||y||)
```

to compare vectors.  

## Mental Model  

Angle Between Vectors

        ↓

Measures Similarity

        ↓

Cosine Similarity

        ↓

Embeddings

        ↓

Search, Recommendations, LLMs  


This topic is the bridge from Linear Algebra → Embeddings → Transformers → ChatGPT. The next natural topic is Projection of a Vector onto Another Vector, because the dot product is actually measuring a projection.
