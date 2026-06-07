Identity Matrix is one of the most important concepts in **Linear Algebra**, and Linear Algebra is the mathematical foundation of Machine Learning, Deep Learning, Computer Graphics, and Data Science.

---

# What is an Identity Matrix?

An **Identity Matrix** is a square matrix where:

* All diagonal elements are `1`
* All non-diagonal elements are `0`

For a 3×3 matrix:

$$I_3 = \begin{bmatrix}1&0&0\0&1&0\0&0&1\end{bmatrix}$$

Example:

```python
import numpy as np

I = np.eye(3)

print(I)
```

Output:

```text
[[1. 0. 0.]
 [0. 1. 0.]
 [0. 0. 1.]]
```

---

# Why is it called Identity?

Think about numbers.

Multiplicative identity for numbers is:

```text
5 × 1 = 5
100 × 1 = 100
```

The number `1` doesn't change the value.

Similarly, for matrices:

```text
A × I = A
I × A = A
```

The identity matrix doesn't change the matrix.

That's why it is called the **Identity Matrix**.

---

# Example

Let

$$A = \begin{bmatrix}1&2\3&4\end{bmatrix}$$

and

$$I = \begin{bmatrix}1&0\0&1\end{bmatrix}$$

Then:

```python
import numpy as np

A = np.array([
    [1, 2],
    [3, 4]
])

I = np.eye(2)

print(A @ I)
```

Output:

```text
[[1 2]
 [3 4]]
```

No change.

---

# Why Does It Work?

Matrix multiplication:

Row × Column

For first element:

```text
(1×1) + (2×0) = 1
```

Second element:

```text
(1×0) + (2×1) = 2
```

The identity matrix simply picks the original values and preserves them.

---

# Creating Identity Matrix in NumPy

## Method 1: eye()

```python
np.eye(3)
```

Output:

```text
[[1. 0. 0.]
 [0. 1. 0.]
 [0. 0. 1.]]
```

---

## Method 2: identity()

```python
np.identity(3)
```

Same output.

---

# Different Sizes

2×2

```python
np.eye(2)
```

```text
[[1. 0.]
 [0. 1.]]
```

---

4×4

```python
np.eye(4)
```

```text
[[1. 0. 0. 0.]
 [0. 1. 0. 0.]
 [0. 0. 1. 0.]
 [0. 0. 0. 1.]]
```

---

# Mental Model

Think of the identity matrix as a **transparent glass**.

Imagine:

```text
Object -> Transparent Glass -> Same Object
```

Similarly:

```text
Matrix -> Identity Matrix -> Same Matrix
```

Nothing changes.

---

# Relationship with Matrix Inverse

For normal numbers:

```text
5 × (1/5) = 1
```

For matrices:

```text
A × A⁻¹ = I
```

The result is not `1`.

The result is the Identity Matrix.

Example:

```python
import numpy as np

A = np.array([
    [1, 2],
    [3, 4]
])

A_inv = np.linalg.inv(A)

print(A @ A_inv)
```

Output:

```text
[[1. 0.]
 [0. 1.]]
```

(approximately, due to floating-point precision)

---

# Real ML Use Cases

## 1. Matrix Inversion

In many ML algorithms:

* Linear Regression
* PCA
* Covariance calculations

you need:

```text
A⁻¹
```

Identity matrix is the foundation of inversion because:

```text
A × A⁻¹ = I
```

---

## 2. Regularization (Ridge Regression)

A famous formula in ML:

(X^TX + \lambda I)^{-1}X^Ty

Notice:

```text
λI
```

Identity matrix is added to stabilize the inversion and reduce overfitting.

This is one of the most practical uses in Machine Learning.

---

## 3. Covariance Matrix Stabilization

Sometimes covariance matrices become singular.

We add:

```text
εI
```

where ε is a very small value.

Example:

```python
cov = cov + 0.0001 * np.eye(cov.shape[0])
```

This improves numerical stability.

---

## 4. Deep Learning Weight Initialization

Neural networks sometimes initialize weights close to identity matrices.

Reason:

```text
Input ≈ Output
```

This helps information flow through the network.

Especially useful in:

* RNNs
* Residual Networks

---

## 5. Computer Graphics

Rotation matrices satisfy:

```text
R × Rᵀ = I
```

Identity matrix is used to verify whether a matrix is a valid rotation matrix.

---

## 6. Transformations

Suppose:

```text
Rotate
Scale
Translate
```

In graphics pipelines, identity matrix represents:

```text
Do nothing
```

It is often the starting transformation.

---

# Common Interview Questions

### Q1: What is an Identity Matrix?

A square matrix whose diagonal elements are 1 and all other elements are 0.

---

### Q2: Why is it called Identity?

Because:

```text
A × I = A
I × A = A
```

Just like multiplying a number by 1.

---

### Q3: Can a non-square matrix be an identity matrix?

❌ No.

Identity matrices are always square:

```text
n × n
```

---

### Q4: What is the identity matrix of order 4?

```text
[[1 0 0 0]
 [0 1 0 0]
 [0 0 1 0]
 [0 0 0 1]]
```

---

### Q5: What is the relation between inverse and identity matrix?

```text
A × A⁻¹ = I
```

The identity matrix is the matrix equivalent of the number `1`.

---

# Quick NumPy Practice

```python
import numpy as np

# Create identity matrix
I = np.eye(3)

# Create matrix
A = np.array([
    [2, 3, 4],
    [1, 5, 6],
    [7, 8, 9]
])

print("Identity Matrix:")
print(I)

print("\nA @ I:")
print(A @ I)

print("\nI @ A:")
print(I @ A)

print("\nInverse Check:")
A_inv = np.linalg.inv(A)

print(A @ A_inv)
```

Expected observation:

```text
A @ I == A
I @ A == A
A @ A_inv ≈ I
```

### Final Mental Model

| Numbers       | Matrices            |
| ------------- | ------------------- |
| 1             | Identity Matrix (I) |
| 1 × x = x     | I × A = A           |
| x × 1 = x     | A × I = A           |
| 1/x           | A⁻¹                 |
| x × (1/x) = 1 | A × A⁻¹ = I         |



