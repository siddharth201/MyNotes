`np.column_stack()` is used to **combine multiple 1D or 2D arrays as columns into a single 2D array**.

This function is very useful in Machine Learning because datasets are usually represented as:

```text
Rows    -> Samples
Columns -> Features
```

---

# Why Do We Need column_stack()?

Suppose you have:

```python
import numpy as np

age = np.array([20, 25, 30, 35])
salary = np.array([50000, 60000, 70000, 80000])
```

These are two separate feature vectors.

To build a dataset:

```text
Age   Salary
20    50000
25    60000
30    70000
35    80000
```

Use:

```python
data = np.column_stack((age, salary))

print(data)
```

Output:

```python
[[   20 50000]
 [   25 60000]
 [   30 70000]
 [   35 80000]]
```

Shape:

```python
print(data.shape)
```

Output:

```python
(4, 2)
```

Meaning:

```text
4 samples
2 features
```

---

# Syntax

```python
np.column_stack((array1, array2, array3, ...))
```

Notice the double parentheses:

```python
np.column_stack((a, b))
                ^    ^
              tuple
```

---

# Example 1: Two 1D Arrays

```python
a = np.array([1,2,3])
b = np.array([4,5,6])

result = np.column_stack((a,b))

print(result)
```

Output:

```python
[[1 4]
 [2 5]
 [3 6]]
```

Visualization:

```text
a = [1 2 3]
b = [4 5 6]

↓

[[1 4]
 [2 5]
 [3 6]]
```

---

# Example 2: Three Columns

```python
a = np.array([1,2,3])
b = np.array([4,5,6])
c = np.array([7,8,9])

result = np.column_stack((a,b,c))

print(result)
```

Output:

```python
[[1 4 7]
 [2 5 8]
 [3 6 9]]
```

---

# Mental Model

Think:

```text
column_stack()

takes arrays

↓

turns them into columns

↓

joins them side-by-side
```

---

# Compare with hstack()

Many beginners confuse these.

---

## hstack()

```python
a = np.array([1,2,3])
b = np.array([4,5,6])

print(np.hstack((a,b)))
```

Output:

```python
[1 2 3 4 5 6]
```

Just joins horizontally.

---

## column_stack()

```python
print(np.column_stack((a,b)))
```

Output:

```python
[[1 4]
 [2 5]
 [3 6]]
```

Creates columns.

---

# What Happens Internally?

Given:

```python
a = np.array([1,2,3])
```

Shape:

```python
(3,)
```

NumPy first converts it to:

```python
[[1]
 [2]
 [3]]
```

Shape:

```python
(3,1)
```

Then combines columns.

---

# Example with Shapes

```python
a = np.array([1,2,3])
b = np.array([4,5,6])

print(a.shape)
print(b.shape)
```

Output:

```python
(3,)
(3,)
```

After column_stack:

```python
result = np.column_stack((a,b))

print(result.shape)
```

Output:

```python
(3,2)
```

---

# Real ML Example

Suppose:

```python
height = np.array([170, 180, 175])
weight = np.array([70, 85, 78])
age = np.array([25, 30, 28])
```

Build feature matrix:

```python
X = np.column_stack((height, weight, age))

print(X)
```

Output:

```python
[[170  70  25]
 [180  85  30]
 [175  78  28]]
```

This is exactly the format expected by Scikit-Learn:

```text
Rows    -> People
Columns -> Features
```

---

# column_stack vs row_stack

### column_stack

```python
a = [1,2,3]
b = [4,5,6]

np.column_stack((a,b))
```

Output:

```python
[[1 4]
 [2 5]
 [3 6]]
```

Shape:

```python
(3,2)
```

---

### row_stack

```python
np.row_stack((a,b))
```

Output:

```python
[[1 2 3]
 [4 5 6]]
```

Shape:

```python
(2,3)
```

Visualization:

```text
column_stack

1 4
2 5
3 6

row_stack

1 2 3
4 5 6
```

---

# Comparison with concatenate()

Given:

```python
a = np.array([1,2,3])
b = np.array([4,5,6])
```

### concatenate

```python
np.concatenate((a,b))
```

Output:

```python
[1 2 3 4 5 6]
```

---

### column_stack

```python
np.column_stack((a,b))
```

Output:

```python
[[1 4]
 [2 5]
 [3 6]]
```

---

# Practice Questions

### Q1

```python
a = np.array([1,2])
b = np.array([3,4])

np.column_stack((a,b))
```

Output:

```python
[[1 3]
 [2 4]]
```

---

### Q2

```python
a = np.array([10,20,30])
b = np.array([40,50,60])

result = np.column_stack((a,b))
print(result.shape)
```

Output:

```python
(3,2)
```

---

### Q3

```python
a = np.array([1,2,3])

np.column_stack((a,a,a))
```

Output:

```python
[[1 1 1]
 [2 2 2]
 [3 3 3]]
```

---

# Interview Answer

> `np.column_stack()` stacks 1D or 2D arrays as columns into a single 2D array. It is commonly used in Machine Learning to combine multiple feature vectors into a feature matrix where rows represent samples and columns represent features.

### Memory Trick

Think:

```text
column_stack

[1 2 3]
[4 5 6]

↓

Put them as columns

↓

[[1 4]
 [2 5]
 [3 6]]
```

Whenever you're preparing data for ML models, `column_stack()` is one of the cleanest ways to combine separate feature arrays into a dataset matrix.

