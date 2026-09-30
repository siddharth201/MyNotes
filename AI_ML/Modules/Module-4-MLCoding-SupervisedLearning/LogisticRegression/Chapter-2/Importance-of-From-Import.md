It comes down to **convenience, code readability, and memory management** in Python.

`scikit-learn` (`sklearn`) is not a single file—it is a massive library organized as a hierarchical package containing dozens of submodules (like `linear_model`, `tree`, `metrics`, and `model_selection`).

Here is why `from ... import ...` is used instead of a direct `import`:

---

### 1. Avoiding Long, Repetitive Prefixes

If you only imported the top-level library:

```python
import sklearn

# To use the function, you would have to write the full path every time:
X_train, X_test, y_train, y_test = (
    sklearn.model_selection.train_test_split(...)
)

```

By doing:

```python
from sklearn.model_selection import train_test_split

# You call it directly:
X_train, X_test, y_train, y_test = train_test_split(...)

```

It keeps your code clean, readable, and concise.

---

### 2. Scikit-Learn Does Not Preload All Submodules

In Python packages, importing the root package does not necessarily automatically load every nested submodule into memory.

If you run:

```python
import sklearn

# This often throws an AttributeError: module 'sklearn' has no attribute 'model_selection'
sklearn.model_selection.train_test_split(...)

```

You would at minimum need to import the submodule anyway:

```python
import sklearn.model_selection

sklearn.model_selection.train_test_split(...)

```

Since you have to specify `sklearn.model_selection` regardless, using `from sklearn.model_selection import train_test_split` is the standard, pythonic approach.

---

### 3. Namespace Cleanliness and Efficiency

* When you do `import pandas as pd`, pandas is designed so that almost all common classes (`DataFrame`, `Series`) and functions (`read_csv`) are exposed directly at the top level (`pd.read_csv`, `pd.DataFrame`).
* Scikit-learn intentionally keeps its tools split into modular categories (e.g., `cluster`, `decomposition`, `ensemble`, `model_selection`) so you load **only what you need** into your script's local namespace.
