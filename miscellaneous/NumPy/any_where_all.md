Excellent. `np.any()`, `np.all()`, and `np.where()` are extremely important in data preprocessing and filtering for Machine Learning.

Let's understand them deeply.

---

# 1. np.any()

## What does it do?

Returns **True if at least one element is True**.

Think:

```text
ANY = At least one?
```

---

## Example 1

```python
import numpy as np

arr = np.array([False, False, True, False])

print(np.any(arr))
```

Output:

```python
True
```

Because at least one value is `True`.

---

## Example 2

```python
arr = np.array([False, False, False])

print(np.any(arr))
```

Output:

```python
False
```

No True values exist.

---

## Real Example

```python
marks = np.array([35, 80, 90, 20])

print(np.any(marks > 75))
```

Step:

```python
marks > 75
```

gives:

```python
[False True True False]
```

Now:

```python
np.any(...)
```

Output:

```python
True
```

Meaning:

```text
At least one student scored above 75.
```

---

# np.any() on 2D Arrays

```python
arr = np.array([
    [0,0,0],
    [0,1,0]
])

print(np.any(arr))
```

Output:

```python
True
```

Because there is one non-zero value.

---

## Axis Example

```python
arr = np.array([
    [0,0,0],
    [1,0,0]
])

print(np.any(arr, axis=0))
```

Output:

```python
[ True False False]
```

Meaning:

```text
Column 0 has at least one True/non-zero.
Column 1 doesn't.
Column 2 doesn't.
```

---

# 2. np.all()

## What does it do?

Returns **True only if every element is True**.

Think:

```text
ALL = Everything?
```

---

## Example 1

```python
arr = np.array([True, True, True])

print(np.all(arr))
```

Output:

```python
True
```

---

## Example 2

```python
arr = np.array([True, False, True])

print(np.all(arr))
```

Output:

```python
False
```

Because one value is False.

---

## Real Example

Check whether all students passed.

```python
marks = np.array([40, 50, 80, 90])

print(np.all(marks >= 35))
```

Step:

```python
marks >= 35
```

becomes:

```python
[True True True True]
```

Output:

```python
True
```

Everyone passed.

---

## Another Example

```python
marks = np.array([40, 20, 80, 90])

print(np.all(marks >= 35))
```

Output:

```python
False
```

Because one student failed.

---

# np.all() with axis

```python
arr = np.array([
    [1,1,1],
    [1,0,1]
])

print(np.all(arr, axis=1))
```

Output:

```python
[ True False]
```

Meaning:

```text
Row 0 → all non-zero
Row 1 → not all non-zero
```

---

# Difference Between any() and all()

Consider:

```python
arr = np.array([True, False, True])
```

---

### any()

```python
np.any(arr)
```

Output:

```python
True
```

Reason:

```text
At least one True exists.
```

---

### all()

```python
np.all(arr)
```

Output:

```python
False
```

Reason:

```text
Not all values are True.
```

---

# 3. np.where()

This is one of the most useful NumPy functions.

It acts like:

```text
IF condition THEN value1 ELSE value2
```

---

# Syntax

```python
np.where(condition, true_value, false_value)
```

---

## Example 1

```python
arr = np.array([10,20,30,40])

result = np.where(
    arr > 25,
    1,
    0
)

print(result)
```

Output:

```python
[0 0 1 1]
```

Explanation:

```text
10 > 25 → 0
20 > 25 → 0
30 > 25 → 1
40 > 25 → 1
```

---

## Visual Representation

```python
arr = np.array([10,20,30,40])
```

Condition:

```python
arr > 25
```

Result:

```python
[False False True True]
```

Now:

```python
np.where(arr > 25, "Pass", "Fail")
```

Output:

```python
['Fail' 'Fail' 'Pass' 'Pass']
```

---

# Real ML Example

Convert marks into labels.

```python
marks = np.array([30,40,80,25])

labels = np.where(
    marks >= 35,
    1,
    0
)

print(labels)
```

Output:

```python
[0 1 1 0]
```

Common classification preprocessing.

---

# np.where() as Index Finder

When only condition is given:

```python
np.where(condition)
```

It returns indexes.

---

## Example

```python
arr = np.array([10,20,30,40])

print(np.where(arr > 25))
```

Output:

```python
(array([2,3]),)
```

Meaning:

```text
Indexes 2 and 3 satisfy condition.
```

---

## Get Actual Values

```python
arr[np.where(arr > 25)]
```

Output:

```python
[30 40]
```

---

# Comparison Table

| Function   | Purpose                           |
| ---------- | --------------------------------- |
| np.any()   | At least one True?                |
| np.all()   | Are all True?                     |
| np.where() | Conditional selection / filtering |

---

# ML Examples

---

## Check Missing Values

```python
data = np.array([1,2,np.nan,4])

print(np.any(np.isnan(data)))
```

Output:

```python
True
```

Meaning:

```text
Dataset contains missing values.
```

---

## Verify Clean Dataset

```python
print(np.all(data > 0))
```

Checks if every value is positive.

---

## Replace Negative Values

```python
arr = np.array([-5,10,-3,20])

result = np.where(
    arr < 0,
    0,
    arr
)

print(result)
```

Output:

```python
[0 10 0 20]
```

Very common preprocessing step.

---

# Practice Questions

Predict the outputs.

---

### Q1

```python
arr = np.array([False, False, True])

np.any(arr)
```

Answer:

```python
True
```

---

### Q2

```python
arr = np.array([True, True, False])

np.all(arr)
```

Answer:

```python
False
```

---

### Q3

```python
arr = np.array([10,20,30])

np.where(arr > 15, 1, 0)
```

Answer:

```python
[0 1 1]
```

---

### Q4

```python
arr = np.array([5,10,15,20])

np.where(arr >= 15)
```

Answer:

```python
(array([2,3]),)
```

---

### Q5

```python
marks = np.array([40,50,20])

np.any(marks < 35)
```

Answer:

```python
True
```

At least one student failed.

---

### Q6

```python
marks = np.array([40,50,20])

np.all(marks >= 35)
```

Answer:

```python
False
```

Not everyone passed.

---

# Interview Summary

### np.any()

```python
np.any(condition)
```

Returns:

```text
True if at least one element satisfies condition
```

---

### np.all()

```python
np.all(condition)
```

Returns:

```text
True only if every element satisfies condition
```

---

### np.where()

```python
np.where(condition, x, y)
```

Returns:

```text
x if condition True
y if condition False
```

Or:

```python
np.where(condition)
```

returns indexes where condition is True.

---

A useful mental shortcut:

```text
any()   -> OR operation
all()   -> AND operation
where() -> IF-ELSE operation
```

That's exactly how most ML engineers think about these three functions.

