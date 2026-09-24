Excellent catch. This actually confirms something I was already thinking.

## From now onwards, **I will completely stop using those interactive GenUI widgets** in our AI/ML textbook.

The reason is simple:

- They are rendering as raw placeholders in your app.
- They break the reading flow.
- They don't add much value compared to a carefully written explanation.
- Our goal is to create a textbook that you can even convert into PDF or GitHub notes later.

So from **Chapter 19 onwards**, we'll use only:

- ✅ Mermaid diagrams
- ✅ Tables
- ✅ Mathematical equations
- ✅ Carefully designed examples
- ✅ Python visualizations
- ✅ Real-world analogies

No more embedded interactive widgets.

---

I also took another look at Part 2, and I think we can make it **even better**. There were a few places where I explained *what* a symbol means, but I want to explain **why mathematicians invented that notation**. That fits our philosophy much better.

So here's the rewritten version.

---

# 📖 Chapter 19.2 — Mean Absolute Error (MAE)

# Part 2 — Mathematical Derivation & Formula (Rewritten)

---

# 🟡 Remember Forever

> **Mathematics is not a collection of formulas.**
>
> **It is simply a compact language for expressing ideas.**

By the end of this chapter, you should look at the MAE formula and think:

> **"Of course it looks like that—how else could it look?"**

---

# Learning Objectives

By the end of this chapter you will understand

- Why the MAE formula looks the way it does
- Why every mathematical symbol exists
- How mathematicians compress long calculations into one formula
- Why MAE has the same units as the target variable
- The geometric meaning of MAE

---

# Step 1 — Start From the Algorithm

Forget mathematics for a moment.

Imagine you're explaining MAE to someone who has never studied algebra.

You would probably say:

```text
For every prediction

↓

Calculate the error

↓

Ignore whether the error is positive or negative

↓

Add all the errors

↓

Divide by the number of predictions
```

Notice something.

There isn't a single mathematical symbol here.

This is just an algorithm.

Now our goal is to convert this algorithm into mathematical language.

---

# Step 2 — One Prediction

Suppose we have just **one** prediction.

Actual salary:

₹100,000

Predicted salary:

₹95,000

Error

$$
100000-95000=5000
$$

In general we write

$$\text{Error}=\text{Actual}-\text{Prediction}$$

Still very simple.

---

# Step 3 — Why Do Mathematicians Use Symbols?

Imagine your dataset contains one million observations.

Writing

```text
Actual Salary of Employee 1

Actual Salary of Employee 2

Actual Salary of Employee 3
```

would be impossible.

Mathematics exists to make writing compact.

So we introduce notation.

Actual value

$$
y
$$

Predicted value

$$
\hat y
$$

The little **hat** simply means

> **This value is predicted by the model.**

That's all.

It doesn't change the meaning of \(y\).

It only tells us where the value came from.

---

# Step 4 — What About Multiple Observations?

Real datasets contain many rows.

Instead of writing

```text
Prediction 1

Prediction 2

Prediction 3

Prediction 4
```

we attach an index.

$$y_1, y_2, y_3, ...y_n$$

Similarly,

$$\hat y_1,\hat y_2,\hat y_3,...\hat y_n$$

The subscript is nothing more than a row number.

Think of it like this:

| Dataset Row | Mathematical Name |
|--------------|-------------------|
| Row 1 | $\(y_1\)$ |
| Row 2 | $\(y_2\)$ |
| Row 3 | $\(y_3\)$ |
| ... | ... |
| Row n | $\(y_n\)$ |

The notation is simply a shorter way of referring to each observation.

---

# Step 5 — Writing the Error Mathematically

Now that we have symbols, the prediction error for the **i-th observation** becomes

$$e_i=y_i-\hat y_i$$

Let's interpret it.

- $\(y_i\)$ → Actual value
- $\(\hat y_i\)$ → Predicted value

Subtract them.

Done.

Nothing mysterious.

---

# Step 6 — The First Mathematical Problem

Suppose the errors are

```text
5

-10

2
```

If we add them,

positive and negative values cancel.

We already discovered this problem in Part 1.

So we need a way to remove the sign.

---

# Step 7 — Why Absolute Value?

Think about this carefully.

Suppose two predictions are made.

Prediction A

```text
Actual = 100

Predicted = 95
```

Error

```text
+5
```

Prediction B

```text
Actual = 100

Predicted = 105
```

Error

```text
-5
```

Question:

Which prediction is better?

Neither.

Both are wrong by exactly **5 units**.

The direction is different.

The magnitude is identical.

That tells us something important.

> **For evaluation, direction is irrelevant.**
>
> **Distance is everything.**

---

# Think Geometrically

Imagine a number line.

```text
<-------------------------|------------------------->

         -5              0               +5
```

How far is **-5** from zero?

Five units.

How far is **+5** from zero?

Also five units.

Therefore,

$$
|-5|=5
$$

$$
|5|=5
$$

Absolute value is nothing more than **distance from zero**.

That is why we use it.

---

# Step 8 — Applying Absolute Value

Instead of

$$
e_i
$$

we now use

$$
|e_i|
$$

or

$$
|y_i-\hat y_i|
$$

Now every prediction contributes only its distance from the actual value.

No error can cancel another.

---

# Step 9 — Many Predictions

Suppose the absolute errors are

```text
5

10

2

4
```

How should we summarize them?

Exactly as we summarize exam marks.

Take the average.

Nothing changes.

The word **Mean** literally means **Average**.

---

# Step 10 — Building the Formula Slowly

Let's build it one step at a time.

For one observation

$$
|y_i-\hat y_i|
$$

For two observations

$$
|y_1-\hat y_1|
+
|y_2-\hat y_2|
$$

For three observations

$$
|y_1-\hat y_1|
+
|y_2-\hat y_2|
+
|y_3-\hat y_3|
$$

Eventually,

for thousands of observations,

writing every term becomes impossible.

---

# Step 11 — Why Was Sigma Invented?

Imagine writing

$$
|e_1|+|e_2|+|e_3|+\cdots+|e_{1000000}|
$$

That would be ridiculous.

Mathematicians invented one symbol to replace this long addition.

The Greek letter

$$
\sum
$$

called **Sigma**.

Sigma simply means

> **Add everything together.**

That's all.

Nothing more.

---

# Step 12 — Compressing the Equation

Instead of writing

$$
|e_1|
+
|e_2|
+
|e_3|
+
...
+
|e_n|
$$

we write

$$
\sum_{i=1}^{n}|e_i|
$$

This entire long addition becomes one compact expression.

---

# Step 13 — Replace the Error

We already know

$$
e_i=y_i-\hat y_i
$$

Substitute it.

Now we obtain

$$
\sum_{i=1}^{n}|y_i-\hat y_i|
$$

We're almost done.

---

# Step 14 — Why Divide by \(n\)?

Imagine two models.

Model A predicts 10 houses.

Total absolute error

```text
40
```

Model B predicts 1000 houses.

Total absolute error

```text
400
```

Which model is better?

We cannot compare totals because they were evaluated on different numbers of predictions.

Instead, we calculate the **average error per prediction**.

That means dividing by

$$
n
$$

the number of observations.

---

# The Final Formula

Putting everything together gives us

$$
MAE=
\frac{1}{n}
\sum_{i=1}^{n}
|y_i-\hat y_i|
$$

Notice something beautiful.

Nothing in this formula appeared magically.

Every symbol was introduced because we needed it.

---

# Every Symbol Has a Story

| Symbol | Why It Exists |
|---------|---------------|
| $\(y_i\)$ | Represent the actual value of the i-th observation |
| $\(\hat y_i\)$ | Represent the model's prediction |
| $\(y_i-\hat y_i\)$ | Measure the prediction error |
| $\(|\cdot|\)$ | Remove the direction and keep only the magnitude |
| $\(\sum\)$ | Add errors efficiently without writing thousands of terms |
| $\(n\)$ | Convert the total error into an average |
| $\(MAE\)$ | Give this complete process a name |

This is one of the biggest lessons in mathematics:

> **Every symbol exists because it solves a problem.**

---

# Why MAE Has the Same Units

Suppose we're predicting:

| Target | Unit |
|---------|------|
| House Price | ₹ |
| Temperature | °C |
| Distance | km |
| Delivery Time | minutes |

Look at the operations involved:

1. Subtraction
2. Absolute value
3. Average

None of these operations change the unit.

Therefore:

| Prediction Task | MAE Unit |
|-----------------|----------|
| House Price | ₹ |
| Temperature | °C |
| Delivery Time | minutes |

This makes MAE one of the easiest metrics to explain to business stakeholders.

---

# Think Like the Inventor

If I erased the formula and asked you to recreate it from memory, you shouldn't try to remember symbols.

Instead, remember the **algorithm**:

```text
Calculate the error

↓

Ignore the sign

↓

Add every error

↓

Divide by the number of observations
```

The mathematics will naturally follow.

---

# Key Takeaways

- We did **not** memorize the MAE formula—we derived it.
- Every mathematical symbol was introduced to solve a practical problem.
- The formula is simply a compressed version of an intuitive algorithm.
- Absolute value converts prediction errors into distances.
- Dividing by \(n\) makes results comparable across datasets.
- MAE retains the same units as the target variable, making it highly interpretable.

---

I actually like this version much better than the previous one. It tells a continuous story, avoids unnecessary widgets, and explains **why the notation exists**, not just **what it means**. This is the style I'd like us to use for the rest of the book.
