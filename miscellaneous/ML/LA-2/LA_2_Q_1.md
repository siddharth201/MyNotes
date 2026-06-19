
We are solving this problem:

Given a list of `(x, y)` points, check whether they all lie on one straight line.
If yes, return the slope and intercept.
If not, return `-1`.

---

## 1) What does “straight line” mean?

A straight line can be written as:

[
y = mx + b
]

where:

* `m` = slope
* `b` = intercept

So if all points lie on one line, they should all fit the same `m` and `b`.

---

## 2) Main idea of the solution

Take the first two points and find the slope.

Then check every other point to see whether it gives the same slope with the first point.

* If every slope matches, all points lie on the same line.
* If any slope is different, return `-1`.

---

## 3) Why use the first two points?

Suppose we have:

```python
coordinates = [(1, 5), (-3, -3), (2.5, 8)]
```

The first two points help us define the line.

From these two points, we compute the slope:

[
m = \frac{y_2 - y_1}{x_2 - x_1}
]

If the other points are also on the same line, they must produce the same slope when compared with the first point.

---

## 4) Step-by-step code

Here is the cleaner version:

```python
import math

def solve(coordinates):

    if len(coordinates) < 2:
        return -1

    x1, y1 = coordinates[0]
    x2, y2 = coordinates[1]

    if x1 == x2:
        return -1

    slope = (y2 - y1) / (x2 - x1)

    for x, y in coordinates[2:]:
        if x == x1:
            return -1

        current_slope = (y - y1) / (x - x1)

        if not math.isclose(current_slope, slope):
            return -1

    intercept = y1 - slope * x1

    return (round(slope, 1), round(intercept, 1))
```

---

## 5) Now let’s understand each part

### Step A: Check how many points we have

```python
if len(coordinates) < 2:
    return -1
```

Why?

Because one point is not enough to define a unique line.

Example:

```python
[(1, 5)]
```

Many different lines can pass through one point, so we cannot decide a single answer.

---

### Step B: Pick the first two points

```python
x1, y1 = coordinates[0]
x2, y2 = coordinates[1]
```

If the input is:

```python
[(1, 5), (-3, -3), (2.5, 8)]
```

then:

```python
x1 = 1
y1 = 5
x2 = -3
y2 = -3
```

---

### Step C: Handle vertical line

```python
if x1 == x2:
    return -1
```

Why?

Because slope formula is:

[
m = \frac{y_2 - y_1}{x_2 - x_1}
]

If `x2 - x1 = 0`, then division by zero happens.

That means the line is vertical, like:

```python
x = 5
```

But the problem asks for slope and intercept in `y = mx + b` form.
A vertical line does not have a normal slope, so we return `-1`.

---

### Step D: Find slope from first two points

```python
slope = (y2 - y1) / (x2 - x1)
```

For the sample:

```python
slope = (-3 - 5) / (-3 - 1)
slope = -8 / -4
slope = 2
```

So the expected line slope is `2`.

---

### Step E: Check all remaining points

```python
for x, y in coordinates[2:]:
```

This means:

* skip the first two points
* check the rest

For our sample, `coordinates[2:]` is:

```python
[(2.5, 8)]
```

Now for each remaining point, we compute slope with the first point:

```python
current_slope = (y - y1) / (x - x1)
```

For `(2.5, 8)`:

```python
current_slope = (8 - 5) / (2.5 - 1)
current_slope = 3 / 1.5
current_slope = 2
```

Now compare:

```python
if not math.isclose(current_slope, slope):
    return -1
```

Since both are `2`, they match.

---

## 6) Why use `math.isclose()`?

Because slopes are often floating-point numbers.

Example:

```python
2.0
2.0000000000000004
```

These should be treated as equal for practical purposes.

So instead of writing:

```python
if current_slope != slope:
```

we write:

```python
if not math.isclose(current_slope, slope):
```

This avoids tiny floating-point errors.

---

## 7) Find intercept after confirming all points are on the line

Once all points are confirmed collinear, we calculate `b` using:

[
b = y - mx
]

Using the first point `(1, 5)`:

```python
intercept = y1 - slope * x1
intercept = 5 - 2 * 1
intercept = 3
```

So the line is:

[
y = 2x + 3
]

---

## 8) Return the final answer

```python
return (round(slope, 1), round(intercept, 1))
```

This gives:

```python
(2.0, 3.0)
```

The problem wants values rounded to one decimal place.

---

# Full dry run with sample input

Input:

```python
[(1.0, 5.0), (-3.0, -3.0), (2.5, 8.0)]
```

### First step

Take first two points:

```python
(1.0, 5.0)
(-3.0, -3.0)
```

### Slope

```python
(-3 - 5) / (-3 - 1) = -8 / -4 = 2
```

### Check third point

```python
(2.5, 8.0)
```

Slope with first point:

```python
(8 - 5) / (2.5 - 1) = 3 / 1.5 = 2
```

Same slope, so points are collinear.

### Intercept

```python
b = 5 - 2 * 1 = 3
```

### Final output

```python
(2.0, 3.0)
```

---

## 9) Final mental model

Remember this simple flow:

1. Take first two points.
2. Find slope.
3. Compare slope with every other point.
4. If any slope differs, return `-1`.
5. Otherwise find intercept.
6. Return `(slope, intercept)`.

---

## 10) One-line summary

All points lie on a straight line if they all produce the same slope with the first point.

If you want, I can next explain the same solution using a **very simple diagram** or give you the **most interview-friendly version without floating point issues**.

