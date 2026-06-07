# NumPy Slicing — Complete Deep Dive

Slicing is one of the most important concepts in NumPy because in Machine Learning we constantly:

* Extract rows
* Extract columns
* Split datasets
* Select features
* Filter data
* Crop images

If you master slicing, working with datasets becomes much easier.

---

# What is Slicing?

Slicing means:

> Extracting a portion of an array.

Example:

```python
import numpy as np

arr = np.array([10,20,30,40,50])

print(arr[1:4])
```

Output:

```python
[20 30 40]
```

---

# General Syntax

```python
array[start:stop:step]
```

Where:

| Parameter | Meaning                 |
| --------- | ----------------------- |
| start     | Starting index          |
| stop      | Ending index (excluded) |
| step      | Jump size               |

Most important rule:

```text
stop is NOT included
```

---

# Visual Understanding

Consider:

```python
arr = np.array([10,20,30,40,50])
```

Indexes:

```text
Value : 10  20  30  40  50
Index : 0   1   2   3   4
```

---

# Case 1: Basic Slice

```python
arr[1:4]
```

Meaning:

```text
Start at index 1
Stop before index 4
```

Selected:

```text
20 30 40
```

Output:

```python
[20 30 40]
```

---

# Case 2: Omit Start

```python
arr[:3]
```

Equivalent to:

```python
arr[0:3]
```

Output:

```python
[10 20 30]
```

---

# Case 3: Omit Stop

```python
arr[2:]
```

Meaning:

```text
Start at index 2
Go till end
```

Output:

```python
[30 40 50]
```

---

# Case 4: Omit Both

```python
arr[:]
```

Output:

```python
[10 20 30 40 50]
```

Entire array.

---

# Case 5: Step

Take every second element.

```python
arr[::2]
```

Indexes selected:

```text
0 2 4
```

Output:

```python
[10 30 50]
```

---

Every third element:

```python
arr[::3]
```

Output:

```python
[10 40]
```

---

# Case 6: Reverse

Very common interview question.

```python
arr[::-1]
```

Output:

```python
[50 40 30 20 10]
```

Explanation:

```text
Start from end
Move backward by 1
```

---

# Case 7: Negative Index Slicing

```python
arr[-3:]
```

Negative indexes:

```text
-5 -4 -3 -2 -1
```

Values:

```text
10 20 30 40 50
```

Selected:

```text
30 40 50
```

Output:

```python
[30 40 50]
```

---

# Case 8: Exclude Last Element

```python
arr[:-1]
```

Output:

```python
[10 20 30 40]
```

Useful very often.

---

# Case 9: Middle Portion

```python
arr[1:-1]
```

Output:

```python
[20 30 40]
```

---

# Important Visualization

For:

```python
arr[1:-1]
```

```text
Index:
0  1  2  3  4

Value:
10 20 30 40 50

      ↑     ↑
   start  stop

stop excluded
```

Result:

```text
20 30 40
```

---

# 2D Array Slicing

Now the real power begins.

---

## Sample Matrix

```python
arr = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
])
```

Visualize:

```text
      Col
      0 1 2

Row 0 1 2 3
Row 1 4 5 6
Row 2 7 8 9
```

Shape:

```python
(3,3)
```

---

# Syntax for 2D Slicing

```python
arr[row_slice, column_slice]
```

Think:

```text
arr[rows, cols]
```

---

# Select First Row

```python
arr[0]
```

Output:

```python
[1 2 3]
```

---

# Select First Column

```python
arr[:,0]
```

Meaning:

```text
All rows
Column 0
```

Output:

```python
[1 4 7]
```

---

# Select Second Column

```python
arr[:,1]
```

Output:

```python
[2 5 8]
```

---

# Select First Two Rows

```python
arr[:2]
```

Output:

```python
[[1 2 3]
 [4 5 6]]
```

---

# Select Last Two Rows

```python
arr[1:]
```

Output:

```python
[[4 5 6]
 [7 8 9]]
```

---

# Select First Two Columns

```python
arr[:,:2]
```

Output:

```python
[[1 2]
 [4 5]
 [7 8]]
```

---

# Select Last Two Columns

```python
arr[:,1:]
```

Output:

```python
[[2 3]
 [5 6]
 [8 9]]
```

---

# Extract a Submatrix

```python
arr[0:2,1:3]
```

Rows:

```text
0,1
```

Columns:

```text
1,2
```

Output:

```python
[[2 3]
 [5 6]]
```

---

# Entire Row

```python
arr[1,:]
```

Output:

```python
[4 5 6]
```

---

# Entire Column

```python
arr[:,2]
```

Output:

```python
[3 6 9]
```

---

# Every Second Row

```python
arr[::2,:]
```

Output:

```python
[[1 2 3]
 [7 8 9]]
```

---

# Every Second Column

```python
arr[:,::2]
```

Output:

```python
[[1 3]
 [4 6]
 [7 9]]
```

---

# The Famous Example

This question appears in many NumPy quizzes.

```python
x = np.ones((5,5))
```

Result:

```python
[[1 1 1 1 1]
 [1 1 1 1 1]
 [1 1 1 1 1]
 [1 1 1 1 1]
 [1 1 1 1 1]]
```

Now:

```python
x[1:-1,1:-1] = 0
```

Meaning:

Rows:

```text
1,2,3
```

Columns:

```text
1,2,3
```

Set those values to zero.

Result:

```python
[[1 1 1 1 1]
 [1 0 0 0 1]
 [1 0 0 0 1]
 [1 0 0 0 1]
 [1 1 1 1 1]]
```

The border remains unchanged.

---

# Slicing Creates Views (Very Important)

Many beginners make mistakes here.

```python
arr = np.array([1,2,3,4,5])

sub = arr[1:4]
```

Now:

```python
sub[0] = 100
```

Print:

```python
print(arr)
```

Output:

```python
[1 100 3 4 5]
```

Original array changed!

Reason:

```text
Slicing returns a VIEW
not a COPY
```

---

# Creating a Copy

```python
sub = arr[1:4].copy()
```

Now modifying `sub` won't affect `arr`.

---

# Real ML Example

Dataset:

```python
data = np.array([
    [1,40],
    [2,50],
    [3,60],
    [4,70]
])
```

Rows:

```text
Samples
```

Columns:

```text
Feature, Target
```

---

Extract feature column:

```python
X = data[:,0]
```

Output:

```python
[1 2 3 4]
```

---

Extract target column:

```python
y = data[:,1]
```

Output:

```python
[40 50 60 70]
```

This exact slicing pattern is used daily in Machine Learning.

---

# Practice Questions

Predict the output before running.

### Q1

```python
arr = np.array([10,20,30,40,50])

print(arr[1:4])
```

Answer:

```python
[20 30 40]
```

---

### Q2

```python
print(arr[::-1])
```

Answer:

```python
[50 40 30 20 10]
```

---

### Q3

```python
print(arr[-2:])
```

Answer:

```python
[40 50]
```

---

### Q4

```python
a = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
])

print(a[:,1])
```

Answer:

```python
[2 5 8]
```

---

### Q5

```python
print(a[1:,1:])
```

Answer:

```python
[[5 6]
 [8 9]]
```

---

# Mental Model to Remember Forever

For 1D:

```python
arr[start:stop:step]
```

Think:

```text
Start here
↓
Keep moving by step
↓
Stop BEFORE stop
```

For 2D:

```python
arr[rows, columns]
```

Think:

```text
Which rows?
Which columns?
```

Everything in NumPy slicing follows these two simple rules. Once these become second nature, you'll be able to manipulate ML datasets, images, matrices, and tensors effortlessly.

