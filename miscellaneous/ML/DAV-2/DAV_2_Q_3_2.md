Great question! This is one of the most important NumPy slicing concepts to master.

Let's use the same matrix:

```python
arr = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])
```

```
      Col0 Col1 Col2
Row0    1    2    3
Row1    4    5    6
Row2    7    8    9
```

---

# 1. `result = arr.T[:, ::-1]`

Let's break it into parts.

## Step 1: `arr.T` (Transpose)

Transpose swaps rows and columns.

```python
arr.T
```

becomes

```
1 4 7
2 5 8
3 6 9
```

or

```python
[
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
]
```

---

## Step 2: `[:, ::-1]`

The syntax is:

```python
array[rows, columns]
```

So:

```python
[:, ::-1]
```

means:

* `:` → take **all rows**
* `::-1` → take **all columns in reverse order**

Let's reverse every row:

```
Original:
1 4 7
2 5 8
3 6 9

Reverse columns:
7 4 1
8 5 2
9 6 3
```

Final result:

```python
[
    [7, 4, 1],
    [8, 5, 2],
    [9, 6, 3]
]
```

✅ This is a **90° clockwise rotation**.

---

# 2. `result = arr[::-1].T`

Again, do it in two steps.

## Step 1: `arr[::-1]`

Here:

```python
[::-1]
```

is applied only to the rows.

It means:

> Take all rows, but in reverse order.

So:

```
Original:
1 2 3
4 5 6
7 8 9

After reversing rows:
7 8 9
4 5 6
1 2 3
```

which is

```python
[
    [7, 8, 9],
    [4, 5, 6],
    [1, 2, 3]
]
```

---

## Step 2: `.T`

Now transpose:

```
Before transpose:
7 8 9
4 5 6
1 2 3

After transpose:
7 4 1
8 5 2
9 6 3
```

Again we get

```python
[
    [7, 4, 1],
    [8, 5, 2],
    [9, 6, 3]
]
```

✅ Same **90° clockwise rotation**.

---

# Why do both methods give the same answer?

Because these two operations are mathematically equivalent:

### Method 1: Transpose → Reverse each row

```
1 2 3        1 4 7        7 4 1
4 5 6   -->  2 5 8   -->  8 5 2
7 8 9        3 6 9        9 6 3
```

### Method 2: Reverse rows → Transpose

```
1 2 3        7 8 9        7 4 1
4 5 6   -->  4 5 6   -->  8 5 2
7 8 9        1 2 3        9 6 3
```

Both reach the same final matrix.

---

# Understanding `[::-1]`

This slice has the form:

```python
[start : stop : step]
```

When you write:

```python
[::-1]
```

it means:

* `start` → omitted (start from the end because step is negative)
* `stop` → omitted (go all the way to the beginning)
* `step = -1` → move backwards

Examples:

```python
arr = np.array([10, 20, 30, 40])

arr[::-1]
# [40, 30, 20, 10]
```

For a 2D array:

```python
arr[::-1]
```

reverses the **rows**, while

```python
arr[:, ::-1]
```

reverses the **columns**.

---

## Mental model (very important)

For a 2D array:

```python
arr[rows, columns]
```

| Expression        | Meaning                                          |
| ----------------- | ------------------------------------------------ |
| `arr[::-1]`       | Reverse the **rows** (flip vertically ⬆️⬇️)      |
| `arr[:, ::-1]`    | Reverse the **columns** (flip horizontally ⬅️➡️) |
| `arr[::-1, ::-1]` | Reverse both rows and columns (rotate 180°)      |
| `arr.T`           | Transpose (swap rows and columns)                |

### Visual intuition

Starting matrix:

```
1 2 3
4 5 6
7 8 9
```

* `arr[::-1]` (reverse rows):

```
7 8 9
4 5 6
1 2 3
```

* `arr[:, ::-1]` (reverse columns):

```
3 2 1
6 5 4
9 8 7
```

* `arr.T` (transpose):

```
1 4 7
2 5 8
3 6 9
```

If you internalize these three transformations, you'll be able to solve most NumPy rotation and slicing problems quickly.

