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

y = Wx + b

where:

- W = Weight Matrix
- x = Input Vector
- b = Bias Vector

This is fundamentally a matrix multiplication operation.

---

# 1. What is a Matrix?

A matrix is a rectangular arrangement of numbers.

Example:

A =

[
  [1, 2],
  [3, 4]
]

This matrix has:

- 2 rows
- 2 columns

Dimension:

2 × 2

---

# 2. What is Matrix Multiplication?

Suppose:

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

Then:

C = AB

To compute each element of C:

Row of A × Column of B

---

# 3. The Golden Rule

Suppose:

A is an (m × n) matrix

B is an (n × p) matrix

Then:

AB is possible only if:

Number of columns in A
=
Number of rows in B

Result dimension:

(m × p)

Example:

(2 × 3) × (3 × 4)

Valid

Result:

(2 × 4)

---

# 4. Why This Rule Exists

Consider:

A =

[
  [1, 2, 3]
]

Dimension:

1 × 3

B =

[
  [4],
  [5],
  [6]
]

Dimension:

3 × 1

The multiplication requires:

Row of A:

[1, 2, 3]

Column of B:

[
  [4],
  [5],
  [6]
]

Multiply corresponding elements:

(1×4) + (2×5) + (3×6)

= 4 + 10 + 18

= 32

Notice:

3 numbers in row
=
3 numbers in column

That's why the inner dimensions must match.

---

# 5. Row × Column Rule

Every element in the result matrix is calculated by:

Row of First Matrix
⋅
Column of Second Matrix

Mathematically:

(AB)ij = Σ(aik × bkj)

Think:

Result Cell
=
(Row of A)
⋅
(Column of B)

---

# 6. Example: 2×2 Matrix Multiplication

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

Find:

C = AB

---

## First Element (Row1 × Col1)

(1×5) + (2×7)

= 5 + 14

= 19

---

## Second Element (Row1 × Col2)

(1×6) + (2×8)

= 6 + 16

= 22

---

## Third Element (Row2 × Col1)

(3×5) + (4×7)

= 15 + 28

= 43

---

## Fourth Element (Row2 × Col2)

(3×6) + (4×8)

= 18 + 32

= 50

---

Result:

AB =

[
  [19, 22],
  [43, 50]
]

---

# 7. Visual Memory Trick

Matrix multiplication always means:

Row × Column

Never:

Row × Row

Never:

Column × Column

Always remember:

→ Row of First Matrix

×

↓ Column of Second Matrix

---

# 8. Example: 2×3 × 3×2

A =

[
  [1, 2, 3],
  [4, 5, 6]
]

Dimension:

2 × 3

B =

[
  [7, 8],
  [9, 10],
  [11, 12]
]

Dimension:

3 × 2

Valid because:

3 = 3

Result dimension:

2 × 2

---

Element (1,1)

(1×7) + (2×9) + (3×11)

= 58

Element (1,2)

(1×8) + (2×10) + (3×12)

= 64

Element (2,1)

(4×7) + (5×9) + (6×11)

= 139

Element (2,2)

(4×8) + (5×10) + (6×12)

= 154

---

Result:

AB =

[
  [58, 64],
  [139, 154]
]

---

# 9. Matrix Multiplication is NOT Commutative

For normal numbers:

2 × 3 = 3 × 2

For matrices:

AB ≠ BA

in general.

---

Example:

A =

[
  [1, 2]
]

Dimension:

1 × 2

B =

[
  [3],
  [4]
]

Dimension:

2 × 1

AB =

[
  [11]
]

Dimension:

1 × 1

But:

BA =

[
  [3, 6],
  [4, 8]
]

Dimension:

2 × 2

Clearly:

AB ≠ BA

---

# 10. Identity Matrix

Identity Matrix is the matrix version of number 1.

I =

[
  [1, 0],
  [0, 1]
]

Property:

AI = IA = A

Example:

A =

[
  [1, 2],
  [3, 4]
]

Then:

AI =

[
  [1, 2],
  [3, 4]
]

---

# 11. Matrix Multiplication in Machine Learning

Suppose a student has:

Study Hours = 5

Sleep Hours = 7

Input Vector:

x =

[
  [5],
  [7]
]

Weights:

W =

[
  [2, 3]
]

Prediction:

y = Wx

=

(2×5) + (3×7)

=

31

---

# 12. Neural Network Connection

A neuron computes:

y = Wx + b

Suppose:

W =

[
  [0.2, 0.8]
]

x =

[
  [10],
  [20]
]

Then:

Wx

=

(0.2×10) + (0.8×20)

=

2 + 16

=

18

Add bias:

y = 18 + b

This is the fundamental computation behind every neuron in a neural network.

---

# Interview Questions

### Q1. When can two matrices be multiplied?

Answer:

Number of columns in the first matrix must equal the number of rows in the second matrix.

---

### Q2. What is the dimension of the result?

If:

A = (m × n)

B = (n × p)

Then:

AB = (m × p)

---

### Q3. Is Matrix Multiplication Commutative?

Answer:

No.

Generally:

AB ≠ BA

---

# Key Takeaways

1. Matrix multiplication combines information from two matrices.

2. Rule:

Columns of First Matrix = Rows of Second Matrix

3. Result dimension:

(m × n) × (n × p)

→ (m × p)

4. Every element is:

(Row of A) ⋅ (Column of B)

5. Matrix multiplication is NOT commutative.

6. Neural Networks fundamentally perform:

y = Wx + b

which is matrix multiplication followed by bias addition.

7. Matrix multiplication is one of the most important operations in AI, ML, and Deep Learning.
