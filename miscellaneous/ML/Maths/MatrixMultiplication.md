# Matrix Multiplication

## Why Matrix Multiplication Matters in ML

Matrix multiplication is one of the most important operations in Machine Learning and Deep Learning.

Almost every ML model uses it:

- Linear Regression
- Logistic Regression
- Neural Networks
- Transformers (ChatGPT)
- Computer Vision
- Recommendation Systems

A neuron in a neural network computes:

```text
y = Wx + b
```

where:

- W = Weight Matrix
- x = Input Vector
- b = Bias Vector

This is fundamentally a matrix multiplication operation.

---

# 1. What is a Matrix?

A matrix is a rectangular arrangement of numbers.

Example:

```text
A =
[
  [1, 2],
  [3, 4]
]
```

This matrix has:

- 2 rows
- 2 columns

Dimension:

```text
2 × 2
```

---

# 2. What is Matrix Multiplication?

Suppose:

```text
A =
[
  [1, 2],
  [3, 4]
]

B =
[
  [5, 6],
  [7, 8]
]
```

Then:

```text
C = AB
```

To compute each element of C:

```text
Row of A × Column of B
```

---

# 3. The Golden Rule

Suppose:

```text
A is (m × n)

B is (n × p)
```

Multiplication is possible only when:

```text
Number of columns in A
=
Number of rows in B
```

Result dimension:

```text
(m × p)
```

Example:

```text
(2 × 3) × (3 × 4)
```

Valid because:

```text
3 = 3
```

Result:

```text
(2 × 4)
```

---

# 4. Why This Rule Exists

Consider:

```text
A =
[
  [1, 2, 3]
]
```

Dimension:

```text
1 × 3
```

and

```text
B =
[
  [4],
  [5],
  [6]
]
```

Dimension:

```text
3 × 1
```

To multiply:

```text
[1, 2, 3]

×

[
  [4],
  [5],
  [6]
]
```

We compute:

```text
(1×4) + (2×5) + (3×6)

= 4 + 10 + 18

= 32
```

Notice:

```text
3 elements in row
=
3 elements in column
```

That is why inner dimensions must match.

---

# 5. Row × Column Rule

Every element in the result matrix is calculated as:

```text
(Row of First Matrix)
⋅
(Column of Second Matrix)
```

Formula:

```text
(AB)ij = Σ(aik × bkj)
```

Think:

```text
Result Cell
=
(Row of A)
⋅
(Column of B)
```

---

# 6. Example: 2×2 Matrix Multiplication

```text
A =
[
  [1, 2],
  [3, 4]
]

B =
[
  [5, 6],
  [7, 8]
]
```

Find:

```text
AB
```

### Element (1,1)

```text
(1×5) + (2×7)

= 5 + 14

= 19
```

### Element (1,2)

```text
(1×6) + (2×8)

= 6 + 16

= 22
```

### Element (2,1)

```text
(3×5) + (4×7)

= 15 + 28

= 43
```

### Element (2,2)

```text
(3×6) + (4×8)

= 18 + 32

= 50
```

Result:

```text
AB =
[
  [19, 22],
  [43, 50]
]
```

---

# 7. Visual Memory Trick

Matrix multiplication always means:

```text
Row × Column
```

Never:

```text
Row × Row
```

Never:

```text
Column × Column
```

Always:

```text
→ Row of First Matrix

×

↓ Column of Second Matrix
```

---

# 8. Example: 2×3 × 3×2

```text
A =
[
  [1, 2, 3],
  [4, 5, 6]
]
```

Dimension:

```text
2 × 3
```

```text
B =
[
  [7, 8],
  [9, 10],
  [11, 12]
]
```

Dimension:

```text
3 × 2
```

Valid because:

```text
3 = 3
```

Result dimension:

```text
2 × 2
```

### Element (1,1)

```text
(1×7) + (2×9) + (3×11)

= 58
```

### Element (1,2)

```text
(1×8) + (2×10) + (3×12)

= 64
```

### Element (2,1)

```text
(4×7) + (5×9) + (6×11)

= 139
```

### Element (2,2)

```text
(4×8) + (5×10) + (6×12)

= 154
```

Result:

```text
AB =
[
  [58, 64],
  [139, 154]
]
```

---

# 9. Matrix Multiplication is NOT Commutative

For numbers:

```text
2 × 3 = 3 × 2
```

For matrices:

```text
AB ≠ BA
```

in general.

Example:

```text
A =
[
  [1, 2]
]
```

Dimension:

```text
1 × 2
```

```text
B =
[
  [3],
  [4]
]
```

Dimension:

```text
2 × 1
```

Then:

```text
AB =
[
  [11]
]
```

Dimension:

```text
1 × 1
```

But:

```text
BA =
[
  [3, 6],
  [4, 8]
]
```

Dimension:

```text
2 × 2
```

Clearly:

```text
AB ≠ BA
```

---

# 10. Identity Matrix

Identity matrix is the matrix equivalent of number 1.

```text
I =
[
  [1, 0],
  [0, 1]
]
```

Property:

```text
AI = IA = A
```

Example:

```text
A =
[
  [1, 2],
  [3, 4]
]
```

Then:

```text
AI =
[
  [1, 2],
  [3, 4]
]
```

---

# 11. Matrix Multiplication in Machine Learning

Suppose:

```text
Input Features:

Study Hours = 5
Sleep Hours = 7
```

Input vector:

```text
x =
[
  [5],
  [7]
]
```

Weights:

```text
W =
[
  [2, 3]
]
```

Prediction:

```text
y = Wx
```

Calculation:

```text
(2×5) + (3×7)

= 10 + 21

= 31
```

---

# 12. Neural Network Connection

A neuron computes:

```text
y = Wx + b
```

Suppose:

```text
W =
[
  [0.2, 0.8]
]

x =
[
  [10],
  [20]
]
```

Then:

```text
Wx

= (0.2×10) + (0.8×20)

= 2 + 16

= 18
```

Add bias:

```text
y = 18 + b
```

This is the fundamental computation behind every neuron in a neural network.

---

# Interview Questions

### Q1. When can two matrices be multiplied?

Answer:

```text
Number of columns in first matrix
=
Number of rows in second matrix
```

---

### Q2. What is the dimension of the result?

If:

```text
A = (m × n)

B = (n × p)
```

Then:

```text
AB = (m × p)
```

---

### Q3. Is Matrix Multiplication Commutative?

Answer:

```text
No.

Generally:

AB ≠ BA
```

---

# Key Takeaways

1. Matrix multiplication combines information from two matrices.

2. Rule:

```text
Columns of First Matrix
=
Rows of Second Matrix
```

3. Result size:

```text
(m × n) × (n × p)

→ (m × p)
```

4. Every element is:

```text
(Row of A)
⋅
(Column of B)
```

5. Matrix multiplication is NOT commutative.

6. Neural Networks fundamentally perform:

```text
y = Wx + b
```

7. Matrix multiplication is one of the most important operations in AI, ML, and Deep Learning.

---

# Mental Model

```text
Input Features
      ↓
 Weight Matrix
      ↓
Weighted Combination
      ↓
Prediction
```
