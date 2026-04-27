Here is a breakdown of these core Python concepts. You have actually already used a few of these in our previous exercises, but seeing them formally defined will help solidify your understanding.

### 1. Primitive Data Types
These are the most basic, fundamental types of data built into Python. Think of them as the raw materials you use to build your application logic or analyze a dataset.

* **`int` (Integer):** Whole numbers, positive or negative, without decimals.
    * *Example:* `dataset_size = 5000` or `temperature = -4`
* **`float` (Floating Point):** Numbers that contain a decimal point.
    * *Example:* `model_accuracy = 98.6` or `pi = 3.14159`
* **`str` (String):** A sequence of text characters, wrapped in single or double quotes.
    * *Example:* `app_name = "DataSync Pro"` or `user_id = '104A'`
* **`bool` (Boolean):** Represents one of two values: True or False. Often used to track states or conditions.
    * *Example:* `is_offline = True` or `is_synced = False`

### 2. Variables
Variables are simply containers for storing data values. In Python, you create a variable the exact moment you first assign a value to it using the equals sign (`=`). You do not need to declare their type upfront.

```python
# Creating variables
batch_size = 32
algorithm_name = "Random Forest"

# Reassigning a variable to a new value
batch_size = 64 
```

### 3. Comments
Comments are notes written in your code that are completely ignored by the computer when the program runs. They are crucial for explaining the "why" behind your code to other developers (or to yourself six months later).

```python
# This is a single-line comment using the hash symbol.
learning_rate = 0.01 # You can also put comments at the end of a line.

"""
This is a multi-line string. 
While technically a string, if you don't assign it to a variable, 
Python ignores it. Developers often use this for multi-line comments.
"""
```

### 4. Type Casting
Type casting is the process of manually converting a variable from one data type to another. This is often necessary when combining different types of data or processing user input.

```python
# Converting a string to an integer
user_input = "42"
numeric_value = int(user_input) 

# Converting a float to an integer (this chops off the decimal)
exact_temp = 98.6
rounded_temp = int(exact_temp) # Result is 98

# Converting an integer to a string
total_records = 150
message = "Total records processed: " + str(total_records)
```

### 5. Taking Input
The `input()` function pauses your program and waits for the user to type something in the console and press Enter. **Crucial rule:** `input()` *always* returns a String (`str`), even if the user types a number.

```python
# Taking basic text input
city = input("Enter your location: ")

# Taking numeric input requires casting immediately
epochs = int(input("How many training epochs? "))
```

### 6. Arithmetic Operations
Python handles all standard mathematical operations using familiar symbols.

```python
A = 10
B = 3

print(A + B)  # Addition: 13
print(A - B)  # Subtraction: 7
print(A * B)  # Multiplication: 30
print(A / B)  # Division (always results in a float): 3.3333...

# Special Operators
print(A ** B) # Exponentiation (A to the power of B): 1000
print(A // B) # Floor Division (divides and chops off decimal): 3
print(A % B)  # Modulus (returns ONLY the remainder of the division): 1
```

### 7. String Operations
You can use some mathematical operators on strings to manipulate text in clever ways.

* **Concatenation (`+`):** Glues strings together.
* **Repetition (`*`):** Multiplies a string by an integer to repeat it.

```python
greeting = "Hello"
name = "Veeram"

# Concatenation
full_greeting = greeting + " " + name 
print(full_greeting) # Output: Hello Veeram

# Repetition
separator = "-" * 20
print(separator) # Output: --------------------
```  

## Q. Is everything in python is a class ?
