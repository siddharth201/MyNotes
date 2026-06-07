
Excellent. Since you're starting Machine Learning, **NumPy is the first library you should master** because almost every ML library (TensorFlow, PyTorch, Scikit-Learn, Pandas) is built on top of NumPy concepts.

---

# What is NumPy?

**NumPy (Numerical Python)** is a library for:

* Fast numerical computation
* Multi-dimensional arrays
* Mathematical operations
* Linear algebra
* Statistics
* Random number generation

Without NumPy:

```python
numbers = [1, 2, 3, 4]

result = []

for n in numbers:
    result.append(n * 2)

print(result)
```

With NumPy:

```python
import numpy as np

numbers = np.array([1, 2, 3, 4])

print(numbers * 2)
```

Output:

```python
[2 4 6 8]
```

Much cleaner and significantly faster.

---

# Installation

```bash
pip install numpy
```

Import:

```python
import numpy as np
```

`np` is the convention used everywhere.

---

# 1. Creating Arrays

## 1D Array

```python
import numpy as np

arr = np.array([1, 2, 3, 4])

print(arr)
```

Output:

```python
[1 2 3 4]
```

---

## 2D Array

Think of rows and columns.

```python
arr = np.array([
    [1, 2, 3],
    [4, 5, 6]
])

print(arr)
```

Output:

```python
[[1 2 3]
 [4 5 6]]
```

---

## 3D Array

```python
arr = np.array([
    [
        [1,2],
        [3,4]
    ],
    [
        [5,6],
        [7,8]
    ]
])

print(arr)
```

Shape:

```text
(2, 2, 2)
```

---

# Why Arrays Instead of Lists?

Python List:

```python
a = [1,2,3]
b = [4,5,6]

print(a + b)
```

Output:

```python
[1,2,3,4,5,6]
```

Not mathematical addition.

NumPy:

```python
a = np.array([1,2,3])
b = np.array([4,5,6])

print(a + b)
```

Output:

```python
[5 7 9]
```

Element-wise addition.

---

# 2. Array Properties

```python
arr = np.array([
    [1,2,3],
    [4,5,6]
])
```

---

## Shape

Rows and columns.

```python
print(arr.shape)
```

Output:

```python
(2, 3)
```

2 rows, 3 columns

---

## Dimensions

```python
print(arr.ndim)
```

Output:

```python
2
```

---

## Total Elements

```python
print(arr.size)
```

Output:

```python
6
```

---

## Data Type

```python
print(arr.dtype)
```

Output:

```python
int64
```

---

# 3. Special Array Creation

---

## Zeros

```python
np.zeros((2,3))
```

Output:

```python
[[0. 0. 0.]
 [0. 0. 0.]]
```

---

## Ones

```python
np.ones((2,3))
```

Output:

```python
[[1. 1. 1.]
 [1. 1. 1.]]
```

---

## Full

```python
np.full((2,3), 7)
```

Output:

```python
[[7 7 7]
 [7 7 7]]
```

---

## Identity Matrix

Important in ML.

```python
np.eye(3)
```

Output:

```python
[[1. 0. 0.]
 [0. 1. 0.]
 [0. 0. 1.]]
```  

[**Detail Explaination**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/IdentityMatrix.md)

---

## Range

```python
np.arange(0,10)
```

Output:

```python
[0 1 2 3 4 5 6 7 8 9]
```  

[**Detail Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/NumPy/Arrange.md)

---

## Step Size

```python
np.arange(0,10,2)
```

Output:

```python
[0 2 4 6 8]
```

---

## Linspace

Creates evenly spaced values.

```python
np.linspace(0,1,5)
```

Output:

```python
[0.   0.25 0.5  0.75 1.]
```

Very common in ML and plotting.

---

# 4. Indexing

## 1D

```python
arr = np.array([10,20,30,40])

print(arr[0])
```

Output:

```python
10
```

---

## Negative Index

```python
print(arr[-1])
```

Output:

```python
40
```

---

## 2D

```python
arr = np.array([
    [1,2,3],
    [4,5,6]
])
```

Access row 1 column 2:

```python
print(arr[1,2])
```

Output:

```python
6
```

---

# 5. Slicing

```python
arr = np.array([1,2,3,4,5])
```

---

First three:

```python
arr[:3]
```

Output:

```python
[1 2 3]
```

---

Last two:

```python
arr[-2:]
```

Output:

```python
[4 5]
```

---

2D Slice

```python
arr = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
])
```

First two rows:

```python
arr[:2]
```

Output:

```python
[[1 2 3]
 [4 5 6]]
```

---

First two columns:

```python
arr[:, :2]
```

Output:

```python
[[1 2]
 [4 5]
 [7 8]]
```  

[**Detail Explanation**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/NumPy/Slicing.md)

---

# 6. Reshaping

Convert shape.

```python
arr = np.arange(12)
```

Output:

```python
[0 1 2 3 4 5 6 7 8 9 10 11]
```

---

Reshape:

```python
arr.reshape(3,4)
```

Output:

```python
[[0 1 2 3]
 [4 5 6 7]
 [8 9 10 11]]
```

---

Machine Learning datasets often require reshaping.

Example:

```python
x = np.array([1,2,3,4])

x = x.reshape(-1,1)
```

Output:

```python
[[1]
 [2]
 [3]
 [4]]
```

---

# 7. Mathematical Operations

```python
a = np.array([1,2,3])
b = np.array([4,5,6])
```

---

Addition

```python
a + b
```

Output:

```python
[5 7 9]
```

---

Subtraction

```python
a - b
```

Output:

```python
[-3 -3 -3]
```

---

Multiplication

```python
a * b
```

Output:

```python
[4 10 18]
```

---

Division

```python
a / b
```

Output:

```python
[0.25 0.4 0.5]
```

---

Power

```python
a ** 2
```

Output:

```python
[1 4 9]
```

---

# 8. Universal Functions (ufuncs)

Square Root

```python
np.sqrt(a)
```

Output:

```python
[1.         1.41421356 1.73205081]
```

---

Log

```python
np.log(a)
```

---

Exponential

```python
np.exp(a)
```

---

Trigonometry

```python
np.sin(a)
np.cos(a)
```

---

# 9. Aggregations

```python
arr = np.array([1,2,3,4,5])
```

---

Sum

```python
np.sum(arr)
```

Output:

```python
15
```

---

Mean

```python
np.mean(arr)
```

Output:

```python
3.0
```

---

Median

```python
np.median(arr)
```

Output:

```python
3
```

---

Maximum

```python
np.max(arr)
```

Output:

```python
5
```

---

Minimum

```python
np.min(arr)
```

Output:

```python
1
```

---

Standard Deviation

```python
np.std(arr)
```

Important in ML.

---

# 10. Broadcasting

One of NumPy's most important concepts.

```python
arr = np.array([1,2,3])

arr + 10
```

Output:

```python
[11 12 13]
```

NumPy automatically expands 10.

---

2D Example

```python
arr = np.array([
    [1,2,3],
    [4,5,6]
])

arr + np.array([10,20,30])
```

Output:

```python
[[11 22 33]
 [14 25 36]]
```

The smaller array is broadcast to every row.

---

# 11. Boolean Masking

Very useful in ML preprocessing.

```python
arr = np.array([10,20,30,40,50])
```

---

Condition

```python
arr > 25
```

Output:

```python
[False False True True True]
```

---

Filtering

```python
arr[arr > 25]
```

Output:

```python
[30 40 50]
```

---

Example

```python
ages = np.array([10,15,18,22,25])

adults = ages[ages >= 18]

print(adults)
```

Output:

```python
[18 22 25]
```

---

# 12. Matrix Operations

Machine Learning is mostly matrix math.

```python
A = np.array([
    [1,2],
    [3,4]
])

B = np.array([
    [5,6],
    [7,8]
])
```

---

Element-wise

```python
A * B
```

Output:

```python
[[5 12]
 [21 32]]
```

---

Matrix Multiplication

```python
A @ B
```

or

```python
np.dot(A,B)
```

Output:

```python
[[19 22]
 [43 50]]
```

---

# 13. Transpose

Rows become columns.

```python
A.T
```

Output:

```python
[[1 3]
 [2 4]]
```

---

# 14. Random Numbers

Extremely important in ML.

---

Random Values

```python
np.random.rand(3)
```

Output:

```python
[0.12 0.45 0.78]
```

---

Random Matrix

```python
np.random.rand(2,3)
```

---

Random Integers

```python
np.random.randint(1,100,5)
```

Output:

```python
[34 89 12 55 77]
```

---

Seed

For reproducibility.

```python
np.random.seed(42)

print(np.random.rand(3))
```

Every run produces same result.

---

# 15. Real ML Example

Imagine a dataset:

| Study Hours | Score |
| ----------- | ----- |
| 1           | 40    |
| 2           | 50    |
| 3           | 60    |
| 4           | 70    |

```python
data = np.array([
    [1,40],
    [2,50],
    [3,60],
    [4,70]
])
```

Separate features and labels:

```python
X = data[:,0]
y = data[:,1]

print(X)
print(y)
```

Output:

```python
[1 2 3 4]

[40 50 60 70]
```

Reshape feature:

```python
X = X.reshape(-1,1)
```

Output:

```python
[[1]
 [2]
 [3]
 [4]]
```

This is exactly how data is prepared for many ML algorithms.

---

# NumPy Topics You Must Master Before ML

1. Array Creation
2. Shape, Size, Dimensions
3. Indexing & Slicing
4. Reshape
5. Broadcasting
6. Vectorized Operations
7. Boolean Masking
8. Aggregations
9. Matrix Multiplication
10. Transpose
11. Random Number Generation

If you master these 11 topics, you'll be ready to move to **Pandas**, **Matplotlib**, and then **Scikit-Learn**, where you'll build your first Machine Learning model.  

---  

## Q. Why numpy operations are faster than Python?
[**Answer**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/Numpy_Faster_than_python.md)  

## Q. Explain np.any(), np.all(), np.where()
[**Answer**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/NumPy/any_where_all.md)

