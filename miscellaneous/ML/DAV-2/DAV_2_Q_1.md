
Let's solve both parts carefully.

---

# (a) What is the last element after sorting?

```python
import numpy as np

print(np.sort(np.array(['Ram', 'Astha', 'Raghavendra'])))
```

## Step 1: Sort alphabetically (lexicographical order)

The strings are:

* `"Ram"`
* `"Astha"`
* `"Raghavendra"`

Alphabetical order:

```
Astha
Raghavendra
Ram
```

Why is `"Raghavendra"` before `"Ram"`?

Compare character by character:

```
R a g ...
R a m
    ↑
'g' comes before 'm'
```

So `"Raghavendra" < "Ram"`.

Hence the sorted array is:

```python
['Astha', 'Raghavendra', 'Ram']
```

✅ **Last element = `"Ram"`**

So for **(a)**, the correct option is:

> ✅ **For block 'a', answer is `'Ram'`.**

---

# (b) What is the output?

```python
arr1 = np.array(['Ram', 'Astha', 'Brahat'])
arr2 = np.array(['Shyam', 'Kalyan', 'Naveen'])

arr1 > arr2
```

NumPy compares strings **element by element** in lexicographical order.

| `arr1`     | `arr2`     | Comparison        | Result                         |
| ---------- | ---------- | ----------------- | ------------------------------ |
| `"Ram"`    | `"Shyam"`  | `Ram > Shyam`     | `False` (`R` comes before `S`) |
| `"Astha"`  | `"Kalyan"` | `Astha > Kalyan`  | `False` (`A` comes before `K`) |
| `"Brahat"` | `"Naveen"` | `Brahat > Naveen` | `False` (`B` comes before `N`) |

So the output is:

```python
array([False, False, False])
```

It is **not** a single `False`; NumPy performs **element-wise comparison** and returns an array of booleans.

✅ So for **(b)**, the correct option is:

> ✅ **For block 'b', answer is `array([False, False, False])`.**

---

# ✅ Final Answers

* **(a)** ✔ **`'Ram'`**
* **(b)** ✔ **`array([False, False, False])`**

## 💡 Tip for NumPy string comparisons

* `np.sort()` sorts strings **lexicographically** (dictionary order).
* Comparison operators like `>`, `<`, `==` on NumPy string arrays work **element-wise** and return a **boolean array**, not a single boolean.

