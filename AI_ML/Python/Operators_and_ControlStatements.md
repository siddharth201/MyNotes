Operators and control statements are the logic engine of your code. They allow your Python scripts to make decisions, evaluate conditions, and repeat tasks automatically. 

Here is how they work, with examples geared toward scenarios you might encounter when processing data or writing algorithms.

### 1. Operators
You already saw Arithmetic operators (`+`, `-`, `*`, `/`). To build logic, you need Comparison and Logical operators.

**Comparison Operators**
These compare two values and always result in a Boolean (`True` or `False`).
* `==` (Equal to)
* `!=` (Not equal to)
* `>` (Greater than), `<` (Less than)
* `>=` (Greater than or equal to), `<=` (Less than or equal to)

**Logical Operators**
If you are used to languages like Swift that use `&&`, `||`, and `!`, Python keeps things extremely readable by just using plain English words. They are used to combine multiple conditions:
* `and`: Returns `True` if *both* statements are true.
* `or`: Returns `True` if *at least one* statement is true.
* `not`: Reverses the result (turns `True` to `False`).

```python
accuracy = 0.85
is_overfitting = False

# Using Logical and Comparison operators together
if accuracy > 0.80 and not is_overfitting:
    print("Model is ready for deployment!")
```

---

### 2. Control Statements (Decision Making)
Control statements tell Python which blocks of code to run based on the results of your operators.

**`if`, `elif`, `else`**
Python uses `if` to check a condition. If you have multiple conditions, Python uses **`elif`** (short for "else if"). 

```python
loss_score = 0.4

if loss_score < 0.2:
    print("Excellent performance.")
elif loss_score < 0.5:
    print("Acceptable performance, but could be tuned.")
else:
    print("High loss. Retraining required.")
```

---

### 3. Control Statements (Loops)
Loops let you run the same block of code over and over.

**The `for` Loop**
In Python, `for` loops are primarily used to iterate over a sequence (like a list, a string, or a range of numbers). 

```python
# Iterating over a list of strings
features = ["age", "income", "location"]
for feature in features:
    print(f"Analyzing data column: {feature}")

# Iterating a specific number of times using range()
# range(3) generates numbers 0, 1, 2
for epoch in range(3):
    print(f"Running training epoch number {epoch}")
```

**The `while` Loop**
A `while` loop keeps executing its block of code as long as a specific condition remains `True`. You have to be careful with these to ensure the condition eventually becomes `False`, otherwise, you create an infinite loop!

```python
data_rows_processed = 0
total_rows = 5

while data_rows_processed < total_rows:
    print(f"Processing row {data_rows_processed}...")
    # Crucial: update the counter so the loop eventually ends
    data_rows_processed += 1 
```

---

### 4. Loop Modifiers (`break`, `continue`, `pass`)
Sometimes you need fine-grained control over how a loop behaves while it is running.

* **`break`:** Completely shatters and exits the loop immediately.
* **`continue`:** Skips the rest of the current iteration and jumps straight to the next one.
* **`pass`:** This does absolutely nothing. It is a placeholder. Python requires code inside an `if` statement or loop, so if you are still designing your architecture and haven't written the logic yet, you use `pass` to prevent a crash.

```python
measurements = [12.5, -99.0, 14.2, 15.1]

for value in measurements:
    if value == -99.0:
        print("Corrupted data found! Skipping to the next value.")
        continue # Skips -99.0 and moves to 14.2
        
    print(f"Recording measurement: {value}")
```  

## Q. What is : ? 

