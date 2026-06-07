`np.arange()` is one of the most frequently used NumPy functions.

Think of it as NumPy's version of Python's `range()`, but it returns a **NumPy array** instead of a range object.

---

# Syntax

```python
np.arange(start, stop, step)
```

Parameters:

| Parameter | Meaning                    |
| --------- | -------------------------- |
| start     | Starting value (inclusive) |
| stop      | Ending value (exclusive)   |
| step      | Increment/decrement        |

Important:

```text
stop is NOT included
```

Just like Python's `range()`.

---

# Example 1: Basic Usage

```python
import numpy as np

arr = np.arange(5)

print(arr)
```

Output:

```text
[0 1 2 3 4]
```

Equivalent to:

```python
[0, 1, 2, 3, 4]
```

Notice:

```text
5 is not included
```

---

# Example 2: Start and Stop

```python
arr = np.arange(2, 8)

print(arr)
```

Output:

```text
[2 3 4 5 6 7]
```

Visualization:

```text
2 3 4 5 6 7 [8]
^ included      ^ excluded
```

---

# Example 3: Step Size

```python
arr = np.arange(0, 10, 2)

print(arr)
```

Output:

```text
[0 2 4 6 8]
```

Process:

```text
0
0+2 = 2
2+2 = 4
4+2 = 6
6+2 = 8
8+2 = 10 (stop)
```

---

# Example 4: Odd Numbers

```python
arr = np.arange(1, 10, 2)

print(arr)
```

Output:

```text
[1 3 5 7 9]
```

---

# Example 5: Negative Step

Reverse counting.

```python
arr = np.arange(10, 0, -1)

print(arr)
```

Output:

```text
[10 9 8 7 6 5 4 3 2 1]
```

Notice:

```text
0 is excluded
```

because stop is always excluded.

---

# Example 6: Float Values

```python
arr = np.arange(0, 1, 0.2)

print(arr)
```

Output:

```text
[0.  0.2 0.4 0.6 0.8]
```

---

# Important Floating Point Caveat

Avoid using `arange()` when exact float counts matter.

Example:

```python
np.arange(0, 1, 0.1)
```

May produce unexpected floating-point precision results.

For floats, prefer:

```python
np.linspace()
```

We'll compare shortly.

---

# arange() vs range()

Python:

```python
r = range(5)

print(r)
```

Output:

```text
range(0, 5)
```

---

NumPy:

```python
a = np.arange(5)

print(a)
```

Output:

```text
[0 1 2 3 4]
```

Notice:

```python
type(range(5))
```

```text
range
```

while

```python
type(np.arange(5))
```

```text
numpy.ndarray
```

---

# Creating Matrices Using arange()

Very common in practice.

```python
arr = np.arange(12)

print(arr)
```

Output:

```text
[0 1 2 3 4 5 6 7 8 9 10 11]
```

Convert to matrix:

```python
arr = np.arange(12).reshape(3,4)

print(arr)
```

Output:

```text
[[ 0  1  2  3]
 [ 4  5  6  7]
 [ 8  9 10 11]]
```

---

# Common ML Use Cases

## Generate Sample Data

```python
x = np.arange(1, 101)

print(x)
```

Output:

```text
[1 2 3 ... 100]
```

Useful for:

* Features
* Labels
* Testing algorithms

---

## Generate Indexes

```python
indices = np.arange(len(dataset))
```

Example:

```python
data = ['A', 'B', 'C']

indices = np.arange(len(data))

print(indices)
```

Output:

```text
[0 1 2]
```

---

## Create Coordinate Grids

```python
x = np.arange(-5, 6)

print(x)
```

Output:

```text
[-5 -4 -3 -2 -1 0 1 2 3 4 5]
```

Used in:

* Plotting
* Simulations
* ML visualizations

---

# Difference Between arange() and linspace()

This is a very common interview question.

## arange()

You specify:

```python
start
stop
step
```

Example:

```python
np.arange(0, 10, 2)
```

Output:

```text
[0 2 4 6 8]
```

---

## linspace()

You specify:

```python
start
stop
number_of_values
```

Example:

```python
np.linspace(0, 10, 5)
```

Output:

```text
[ 0.   2.5  5.   7.5 10. ]
```

Notice:

```text
10 included
```

---

Comparison:

| arange()                  | linspace()                        |
| ------------------------- | --------------------------------- |
| Specify step              | Specify count                     |
| Stop excluded             | Stop included by default          |
| Good for integers         | Good for floats                   |
| Can have precision issues | More reliable for floating points |

---

# Memory and Performance

```python
arr = np.arange(1000000)
```

Creates:

```text
1,000,000 elements
```

Stored efficiently in contiguous memory.

Much faster than manually building a list:

```python
numbers = []

for i in range(1000000):
    numbers.append(i)
```

---

# Practice Examples

Predict the output before running.

### Question 1

```python
np.arange(5)
```

Answer:

```text
[0 1 2 3 4]
```

---

### Question 2

```python
np.arange(2, 10)
```

Answer:

```text
[2 3 4 5 6 7 8 9]
```

---

### Question 3

```python
np.arange(0, 10, 3)
```

Answer:

```text
[0 3 6 9]
```

---

### Question 4

```python
np.arange(10, 0, -2)
```

Answer:

```text
[10 8 6 4 2]
```

---

### Question 5

```python
np.arange(12).reshape(3,4)
```

Answer:

```text
[[ 0  1  2  3]
 [ 4  5  6  7]
 [ 8  9 10 11]]
```

---

# Interview Answer

> `np.arange()` creates a NumPy array containing evenly spaced values within a specified interval. It accepts `start`, `stop`, and `step` arguments, where the stop value is excluded. It is commonly used to generate sequences of numbers and create data for numerical computations and machine learning tasks.

### Mental Model

Think of:

```python
np.arange(start, stop, step)
```

as:

```text
Start here
↓
Keep adding step
↓
Stop BEFORE stop
```

Example:

```python
np.arange(0, 10, 2)
```

```text
0 → 2 → 4 → 6 → 8
(stop before 10)
```

