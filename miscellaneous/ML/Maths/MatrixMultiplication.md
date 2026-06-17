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

For multiplication:

A(m × n)

B(n × p)

The inner dimensions must match.

Example:

2 × 3  ×  3 × 4

Valid

Result:

2 × 4

Rule:

(Number of columns in first matrix)
=
(Number of rows in second matrix)

---

# 4. Why This Rule Exists

Suppose:

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

To multiply:

(1×3) × (3×1)

The 3's match.

We can compute:

1×4 + 2×5 + 3×6

Result:

32

---

# 5. Row × Column Rule

Each element of the result matrix is:

(Row from first matrix)

dot

(Column from second matrix)

Mathematically:

(AB)ᵢⱼ = Σ aᵢₖ bₖⱼ

Think:

Result Cell
=
(Row of A)
·
(Column of B)

---

# 6. Example 1 (2×2 Multiplication)

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

Find C = AB

---

## First Cell

Row1 × Col1

(1×5) + (2×7)

= 5 + 14

= 19

---

## Second Cell

Row1 × Col2

(1×6) + (2×8)

= 6 + 16

= 22

---

## Third Cell

Row2 × Col1

(3×5) + (4×7)

= 15 + 28

= 43

---

## Fourth Cell

Row2 × Col2

(3×6) + (4×8)

= 18 + 32

= 50

---

Result:

C =
[
  [19, 22],
  [43, 50]
]

---

# 7. Visual Memory Trick

Matrix multiplication:

Rows → Columns

Never:

Rows → Rows

Never:

Columns → Columns

Always:

Row × Column

---

# 8. Example 2

A =
[
 [1,2,3],
 [4,5,6]
]

Dimension:

2 × 3

B =
[
 [7,8],
 [9,10],
 [11,12]
]

Dimension:

3 × 2

Valid because:

3 = 3

Result dimension:

2 × 2

---

First Element:

(1×7)+(2×9)+(3×11)

= 58

Second Element:

(1×8)+(2×10)+(3×12)

= 64

Third Element:

(4×7)+(5×9)+(6×11)

= 139

Fourth Element:

(4×8)+(5×10)+(6×12)

= 154

Result:

[
 [58,64],
 [139,154]
]

---

# 9. Matrix Multiplication is NOT Commutative

Normal numbers:

2 × 3 = 3 × 2

Matrixes:

AB ≠ BA

Usually:

AB != BA

This is extremely important.

---

# Example

A =
[
 [1,2]
]

Dimension:

1×2

B =
[
 [3],
 [4]
]

Dimension:

2×1

AB:

=
[11]

Dimension:

1×1

But

BA:

=
[
 [3,6],
 [4,8]
]

Dimension:

2×2

Completely different.

---

# 10. Identity Matrix

Similar to number 1.

I =
[
 [1,0],
 [0,1]
]

Property:

AI = IA = A

Example:

[
 [1,2],
 [3,4]
]

×

[
 [1,0],
 [0,1]
]

=

[
 [1,2],
 [3,4]
]

---

# 11. Matrix Multiplication in ML

Suppose:

Student Features:

x =
[
 [Study Hours],
 [Sleep Hours]
]

=
[
 [5],
 [7]
]

Weights:

W =
[
 [2,3]
]

Prediction:

y = Wx

=

(2×5)+(3×7)

=

31

This is exactly how a neuron computes output.

---

# 12. Neural Network Connection

Neuron:

y = Wx + b

where:

W = Weight Matrix

x = Input Vector

b = Bias

Example:

W =
[
 [0.2, 0.8]
]

x =
[
 [10],
 [20]
]

Output:

(0.2×10)+(0.8×20)

= 18

Then bias is added.

---

# 13. Interview Questions

Q. When can two matrices be multiplied?

Answer:

Number of columns in first matrix must equal number of rows in second matrix.

---

Q. What will be the dimension of the result?

Answer:

(m × n) × (n × p)

Result:

(m × p)

---

Q. Is matrix multiplication commutative?

Answer:

No.

Generally:

AB ≠ BA

---

# Key Takeaways

1. Matrix multiplication combines information from two matrices.

2. Rule:

Columns of first matrix = Rows of second matrix

3. Result size:

(m × n) × (n × p)

→ (m × p)

4. Every element is:

(Row of A) · (Column of B)

5. Matrix multiplication is NOT commutative.

6. Neural Networks fundamentally perform:

y = Wx + b

which is matrix multiplication followed by bias addition.
