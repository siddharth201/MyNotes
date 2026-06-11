✅ **Your answer is correct:** **`arr.astype('float64')`**

Let's understand why.

### Original array

```python
import numpy as np

arr = np.array([10, 20, 30, 40, 50])
```

Its data type is:

```python
print(arr.dtype)
# int64 (or int32 depending on your system)
```

### Correct way: `astype()`

```python
arr_float = arr.astype('float64')
```

Now:

```python
print(arr_float)
# [10. 20. 30. 40. 50.]

print(arr_float.dtype)
# float64
```

> **Important:** `astype()` **does not modify the original array**. It returns a **new array**.

If you want to update `arr` itself:

```python
arr = arr.astype('float64')
```

---

## Why the other options are wrong

### ❌ `float(arr)`

```python
float(arr)
```

This tries to convert the **entire NumPy array** into a single Python `float`, which is not allowed for arrays with multiple elements.

It raises an error like:

```python
TypeError: only size-1 arrays can be converted to Python scalars
```

---

### ❌ `arr.to_float()`

```python
arr.to_float()
```

NumPy arrays **do not have a `to_float()` method**.

This results in:

```python
AttributeError: 'numpy.ndarray' object has no attribute 'to_float'
```

---

### ❌ `type(arr, dtype='float64')`

```python
type(arr, dtype='float64')
```

The built-in `type()` function is used to inspect an object's type, not change its dtype. It doesn't accept a `dtype` argument.

---

## `astype()` cheat sheet

| Convert to | Code                                           |
| ---------- | ---------------------------------------------- |
| Float      | `arr.astype(float)` or `arr.astype('float64')` |
| Integer    | `arr.astype(int)`                              |
| String     | `arr.astype(str)`                              |
| Boolean    | `arr.astype(bool)`                             |

### Example

```python
arr = np.array([1, 2, 3])

print(arr.astype(float))
# [1. 2. 3.]

print(arr.astype(str))
# ['1' '2' '3']
```

So the correct answer is:

✅ **`arr.astype('float64')`**

