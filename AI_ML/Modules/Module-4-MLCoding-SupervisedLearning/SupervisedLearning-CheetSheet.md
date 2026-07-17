
### Supervised Learning in Depth
>"Every supervised learning problem is simply learning a function that maps inputs to outputs."

---  

### Dataset
A Dataset is
> An organized collection of observations used for learning patterns.

---  

### Sample / Observation / Instance / Record
A Sample is
> One example from the dataset. 

---  

### Feature
A Feature is
> An input variable describing one characteristic of a sample.  

Notice

Features describe

the object.  

---  

### Label / Target Variable

Target is
> The value we want the model to predict.

---

### One column is Vector how?
[Explanation](https://github.com/siddharth201/MyNotes/blob/main/miscellaneous/VectorExplanation.md)  

---  

### Validation Dataset  

Many real projects split data into three parts:

```swift
Training

Validation

Testing
```   

---


### Core Terminology

| Term                                     | Meaning                       |
| ---------------------------------------- | ----------------------------- |
| Dataset                                  | Collection of samples         |
| Sample / Observation / Instance / Record | One row in the dataset        |
| Feature                                  | Input variable (column)       |
| Label / Target                           | Output variable to predict    |
| Independent Variable                     | Input feature                 |
| Dependent Variable                       | Target that depends on inputs |

---

### Standard ML Notation

* **X** = Feature matrix
* **y** = Target vector
* **n** = Number of samples
* **d** = Number of features
* **Shape(X)** = $(n \times d)$
* **Shape(y)** = $(n \times 1)$

---  

### Linear Regression Intuition
> "Regression is not about fitting a line. It is about discovering the relationship between variables."

The real objective is

>Learn how one variable depends on another.

Regression is a supervised learning technique used to predict **continuous numerical values.**

---  

### What ML Does

Machine

looks at

Historical Data

↓

Discovers Pattern

↓

Predicts

Future Values

This is the essence of supervised learning.  

---  

### What Does "Linear" Mean?
Linear means

> The output changes approximately proportionally with the input.

