This is a classic NumPy matrix manipulation problem.

## Step 1: Understand the transformation

### Input

```text
1 2 3
4 5 6
7 8 9
```

### After **90° clockwise rotation**

```text
7 4 1
8 5 2
9 6 3
```

Notice what happens:

* The **first column** becomes the **first row** (in reverse order).
* The **second column** becomes the **second row**.
* The **third column** becomes the **third row**.

---

## Method 1 (Recommended): Transpose + Reverse Rows

A 90° clockwise rotation can be achieved by:

1. **Transpose** the matrix.
2. **Reverse each row**.

```python
import numpy as np

arr = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

result = arr.T[:, ::-1]
print(result)
```

Output:

```text
[[7 4 1]
 [8 5 2]
 [9 6 3]]
```

---

## Method 2 (Even Simpler): Reverse Rows + Transpose ⭐

Reverse the rows first, then transpose:

```python
result = arr[::-1].T
```

Let's verify:

### Reverse rows

```text
7 8 9
4 5 6
1 2 3
```

### Then transpose

```text
7 4 1
8 5 2
9 6 3
```

Exactly the desired output.

---

## Method 3: Using NumPy's built-in function

NumPy provides `np.rot90()`, which rotates **counterclockwise**.

To rotate **clockwise**, use:

```python
result = np.rot90(arr, -1)
```

or equivalently:

```python
result = np.rot90(arr, 3)
```

---

# If this is a Scaler coding question

The expected function is often:

```python
import numpy as np

def solve(A):
    return A[::-1].T
```

or

```python
import numpy as np

def solve(A):
    return np.rot90(A, -1)
```

---

## 🧠 Memory Trick

For a matrix `A`:

| Operation                | NumPy Code                   |
| ------------------------ | ---------------------------- |
| **90° Clockwise**        | `A[::-1].T` ✅                |
| **90° Counterclockwise** | `A.T[::-1]` or `np.rot90(A)` |
| **180° Rotation**        | `A[::-1, ::-1]`              |

This pattern comes up frequently in interviews and NumPy exercises.


## Q.Explain 
```text
result = arr.T[:, ::-1]
and
result = arr[::-1].T
```  

[**Answer**](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/ML/DAV-2/DAV_2_Q_3_2.md)

