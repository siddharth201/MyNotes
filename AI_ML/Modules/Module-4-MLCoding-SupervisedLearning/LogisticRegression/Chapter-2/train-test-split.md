**`train_test_split`** splits your dataset into two sets: one for **training** the model and one for **testing** it.

### Why It’s Needed

To see how well a model performs on **unseen data** and prevent **overfitting** (memorizing the training examples).

### Basic Syntax

```python
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

```

### The 4 Outputs

1. **`X_train`**: Features for training (e.g., 80% of data).
2. **`X_test`**: Features withheld for evaluation (e.g., 20% of data).
3. **`y_train`**: Target labels for training.
4. **`y_test`**: True target labels used to check the model's test predictions.

### Key Parameters

* **`test_size=0.2`**: Keeps 20% of data for testing.
* **`random_state=42`**: Ensures the random split is reproducible every run.
* **`stratify=y`**: Keeps the churn ratio balanced equally between train and test sets.
