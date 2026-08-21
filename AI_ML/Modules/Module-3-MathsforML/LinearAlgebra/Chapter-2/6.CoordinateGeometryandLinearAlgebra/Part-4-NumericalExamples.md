Excellent. Before moving to the next theoretical section, we should reinforce the intuition with numerical examples. This follows the same philosophy we adopted in the **Angle Between Vectors** chapter: **theory → examples → intuition → applications**.

---

# Part 4 — Numerical Examples

## Why Do We Need Numerical Examples?

Up to now, we have learned that

```text
wᵀx = w₁x₁ + w₂x₂ + ⋯ + wdxd
```

and that it represents the **dot product** between two vectors.

However, a formula alone is not enough.

By solving a few numerical examples, we will understand:

* How matrix multiplication is actually performed.
* Why the result is always a **single number (scalar)**.
* How each feature contributes to the final score.
* Why machine learning models repeatedly compute **wᵀx**.

---

# 4.1 Example 1 — A Simple 2D Example

Consider

```text
w =
│2│
│3│

x =
│4│
│1│
```

### Step 1 — Transpose the Weight Vector

Convert the column vector into a row vector.

```text
wᵀ = [2   3]
```

Now we can perform matrix multiplication.

---

### Step 2 — Multiply Corresponding Components

Multiply the values that occupy the same position.

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |          2 × 4 |      8 |
| Second    |          3 × 1 |      3 |

---

### Step 3 — Add the Products

```text
wᵀx

= (2 × 4) + (3 × 1)

= 8 + 3

= 11
```

Therefore,

```text
wᵀx = 11
```

---

### Interpretation

Notice what happened.

* Feature 1 contributed **8**.
* Feature 2 contributed **3**.
* Their total contribution became **11**.

The dot product is simply the **sum of weighted feature contributions**.

---

# 4.2 Example 2 — A 3D Example

Suppose

```text
w =
│2│
│5│
│1│

x =
│3│
│4│
│6│
```

---

### Step 1 — Transpose

```text
wᵀ = [2   5   1]
```

---

### Step 2 — Multiply Component-wise

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |          2 × 3 |      6 |
| Second    |          5 × 4 |     20 |
| Third     |          1 × 6 |      6 |

---

### Step 3 — Add Everything

```text
wᵀx

= (2 × 3)

+ (5 × 4)

+ (1 × 6)

= 6 + 20 + 6

= 32
```

Therefore,

```text
wᵀx = 32
```

---

### Interpretation

Even though the vectors now have three dimensions, **nothing new happened**.

We followed the exact same three-step process:

1. Multiply corresponding components.
2. Add the products.
3. Obtain a single scalar.

The process remains identical whether the vectors have 2, 3, or 10,000 dimensions.

---

# 4.3 Example 3 — A Negative Weight

Machine learning models often learn **negative weights**, which reduce the final score instead of increasing it.

Consider

```text
w =
│ 4│
│-2│

x =
│3│
│5│
```

---

### Step 1 — Multiply Corresponding Components

| Component | Multiplication | Result |
| --------- | -------------: | -----: |
| First     |          4 × 3 |     12 |
| Second    |       (−2) × 5 |    −10 |

---

### Step 2 — Add the Products

```text
wᵀx

= 12 + (−10)

= 2
```

Therefore,

```text
wᵀx = 2
```

---

### Interpretation

The second feature has a **negative weight**.

Instead of increasing the score, it **pulls the score downward**.

This is extremely common in machine learning.

Positive weights support the prediction.

Negative weights oppose the prediction.

---

# 4.4 Example 4 — A Zero Weight

Suppose

```text
w =
│5│
│0│

x =
│8│
│9│
```

---

### Compute the Dot Product

```text
wᵀx

= (5 × 8)

+ (0 × 9)

= 40

+ 0

= 40
```

---

### Interpretation

The second feature has weight **0**.

Therefore, it contributes absolutely nothing to the prediction.

This means the model has effectively **ignored that feature**.

In practice, many trained models assign weights that are very close to zero for features that provide little useful information.

---

# 4.5 What Pattern Did We Discover?

Every example followed the exact same workflow:

```text
Column vector

↓

Transpose

↓

Multiply corresponding components

↓

Add all products

↓

One scalar
```

The numbers changed.

The dimensions changed.

Some weights were positive.

Some were negative.

Some were zero.

Yet the algorithm never changed.

That consistency is one of the reasons why vector notation is so powerful in Linear Algebra and Machine Learning.

---

# 💡 Think Like an Engineer

Imagine a company evaluating a smartphone.

| Feature | Score | Weight | Contribution |
| ------- | ----: | -----: | -----------: |
| Camera  |     9 |      5 |           45 |
| Battery |     8 |      4 |           32 |
| Price   |     6 |     -3 |          -18 |

Final score:

```text
45 + 32 − 18 = 59
```

This is exactly the same computation as **wᵀx**.

The **feature values** form the vector **x**.

The **importance of each feature** forms the vector **w**.

The dot product combines them into one overall score.

---

# 📌 Key Takeaways

* Matrix multiplication in **wᵀx** is simply **multiply corresponding components, then add**.
* The output is always a **single scalar**.
* Positive weights increase the score.
* Negative weights decrease the score.
* Zero weights ignore a feature.
* This weighted-sum computation is the mathematical core of many machine learning algorithms, including Linear Regression, Logistic Regression, and Neural Networks.

---

## 🤔 Curiosity Box

In every example so far, **w** looked like just a collection of numbers.

But what if **w** is actually telling us a **direction** in space?

Why does changing **w** rotate the decision boundary?

That geometric mystery will be answered in the next part, where we discover that **w is the normal (perpendicular) vector** to the hyperplane.

