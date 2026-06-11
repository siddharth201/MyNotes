Let's solve both carefully.

## First, remember how `np.arange()` works

```python
np.arange(start, stop, step)
```

* `start` → Included ✅
* `stop` → **Excluded** ❌
* `step` → Increment value

> **Important:** The `stop` value is **not included**.

---

# (a) All even numbers between 21 and 70 (70 inclusive)

The first even number after 21 is **22**.

Sequence:

```text
22, 24, 26, ..., 68, 70
```

To include `70`, we set `stop = 71` (since `71` is excluded).

```python
np.arange(22, 71, 2)
```

✅ **Correct option:**

> **`np.arange(22, 71, 2)`**

---

# (b) All odd numbers between 20 and 71 (71 inclusive)

The first odd number after 20 is **21**.

Sequence:

```text
21, 23, 25, ..., 69, 71
```

To include `71`, we set `stop = 72`.

```python
np.arange(21, 72, 2)
```

✅ **Correct option:**

> **`np.arange(21, 72, 2)`**

---

# Why the other options are wrong

### ❌ `np.arange(21, 70, 2)`

Produces:

```text
21, 23, 25, ..., 67, 69
```

* Starts with an **odd** number.
* Doesn't include `70`.

---

### ❌ `np.arange(20, 72, 2)`

Produces:

```text
20, 22, 24, ..., 68, 70
```

* Starts with `20`, but the question asks for **odd** numbers.

---

# ✅ Final Answers

| Question                                           | Correct Code             |
| -------------------------------------------------- | ------------------------ |
| **(a)** Even numbers between 21 and 70 (inclusive) | ✅ `np.arange(22, 71, 2)` |
| **(b)** Odd numbers between 20 and 71 (inclusive)  | ✅ `np.arange(21, 72, 2)` |

## 💡 Scaler Tip: `np.arange()` Trick

If you want to include an endpoint:

* For integers with `step=1`, use `stop = last + 1`
* For even/odd sequences with `step=2`, still make `stop` one more than the last desired value.

Examples:

```python
np.arange(1, 6)      # [1, 2, 3, 4, 5]
np.arange(2, 11, 2)  # [2, 4, 6, 8, 10]
np.arange(1, 12, 2)  # [1, 3, 5, 7, 9, 11]
```

This "stop is excluded" rule is one of the most common sources of mistakes in NumPy.

