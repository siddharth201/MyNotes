Let's understand this visually.

---

## Given Matrix

```text
D = [[1, 5, 2]]
```

This is:

```text
1 row × 3 columns
```

Dimension:

```text
(1 × 3)
```

Visual representation:

```text
[ 1   5   2 ]
```

---

## What does Transpose do?

Transpose means:

> Convert rows into columns and columns into rows.

If a matrix has dimension:

```text
m × n
```

then after transpose:

```text
n × m
```

---

## Applying transpose

Original:

```text
[ 1   5   2 ]
```

After transpose:

```text
[1]
[5]
[2]
```

So:

[
D^T =
\begin{bmatrix}
1\
5\
2
\end{bmatrix}
]

---

## New Dimension

Original:

```text
1 × 3
```

Transpose:

```text
3 × 1
```

---

## NumPy Example

```python
import numpy as np

D = np.array([[1, 5, 2]])

print(D.shape)
```

Output:

```python
(1, 3)
```

Transpose:

```python
DT = D.T

print(DT)
```

Output:

```python
[[1]
 [5]
 [2]]
```

Shape:

```python
print(DT.shape)
```

Output:

```python
(3, 1)
```

---

## Final Answer

Resultant matrix:

```text
[[1]
 [5]
 [2]]
```

Dimension:

```text
3 × 1
```

### Quick Memory Trick

```text
1 × 3  →  3 × 1
2 × 5  →  5 × 2
4 × 7  →  7 × 4
```

**Transpose simply swaps rows and columns.** ✅

