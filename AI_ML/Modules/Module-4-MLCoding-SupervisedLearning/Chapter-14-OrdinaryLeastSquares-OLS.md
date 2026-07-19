I'm really happy with how this is progressing.

You can probably see the difference now—we're no longer just "covering Linear Regression". We're **rebuilding the thought process that led humanity to invent it.**

That is exactly how MIT and Stanford teach advanced subjects.

---

# 📚 Machine Learning Master Curriculum

## Part III — Linear Regression

```text
✅ Chapter 7   Regression Problem Statement
✅ Chapter 8   Equation of Linear Regression
✅ Chapter 9   Linear Regression Intuition
✅ Chapter 10  Best Fit Line
✅ Chapter 11  Prediction
✅ Chapter 12  Error & Residuals
✅ Chapter 13  Why Sum of Errors Fails

➡ Chapter 14 Ordinary Least Squares (OLS)

Upcoming

Chapter 15 Cost Function
Chapter 16 Mean Squared Error (MSE)
Chapter 17 Optimization
Chapter 18 Gradient Descent
Chapter 19 R² Score
```

---

# 🟡 Remember Forever

> **Linear Regression does NOT minimize the sum of errors.**
>
> **It minimizes the sum of squared residuals.**
>
> That principle is called **Ordinary Least Squares (OLS).**

---

# 📖 Chapter 14

# Ordinary Least Squares (OLS)

> **"OLS is not an algorithm. It is a mathematical principle for choosing the Best Fit Line."**

This is an extremely important distinction.

Many beginners think

> Linear Regression = OLS

Not exactly.

We'll understand why.

---

# Learning Objectives

After this chapter you should understand

✅ What is Ordinary Least Squares?

✅ Why was it invented?

✅ Why is it called "Least Squares"?

✅ Why is it called "Ordinary"?

✅ Is OLS an algorithm?

✅ What exactly does Linear Regression optimize?

✅ How does OLS find the Best Fit Line?

---

# Motivation

Let's continue exactly where Chapter 13 ended.

We discovered

```text
Sum of Errors

↓

Failed
```

because

```text
+10

↓

0

↑

-10
```

Errors cancelled.

So we decided

Instead of

adding

errors

we'll add

**Squared Errors.**

Question

Is this just

a clever trick?

No.

It became

one of the greatest discoveries

in statistics.

---

# Historical Insight

Let's travel back

to

1805.

There were

no computers.

No Python.

No NumPy.

No Scikit-Learn.

Scientists were trying to solve

a difficult problem.

---

# The Problem

Astronomers

observed planets.

Every night

they recorded

planet positions.

Question

Were measurements perfect?

No.

Different nights

Different telescopes

Different weather

Different observers

Every measurement

had

small errors.

Now imagine

measuring

Mars

100 times.

You obtain

```text
100.2

99.8

100.4

100.1

99.9
```

Question

Which one

is the true position?

Nobody knew.

---

# The Challenge

Scientists needed

one mathematical method

that could find

the

**best estimate**

from noisy observations.

This was not just an astronomy problem.

The same issue appeared in:

* Surveying land
* Navigation
* Physics
* Engineering

A universal solution was needed.

---

# Enter Least Squares

Mathematician

**Adrien-Marie Legendre**

introduced

the Least Squares Principle

in 1805.

Soon after,

**Carl Friedrich Gauss**

showed why it was mathematically powerful and developed much of its theory.

Today,

almost every introductory ML algorithm still relies on this idea.

---

# Think Like a Researcher

Suppose

you have

three candidate lines.

---

### Line A

Residuals

```text
2

3

1

2
```

---

### Line B

Residuals

```text
8

5

7

6
```

---

### Line C

Residuals

```text
20

15

18

22
```

Question

Without mathematics,

which line

looks best?

Obviously

Line A.

Why?

Because

its residuals

are

small.

Notice

your brain

is already solving

the optimization problem.

---

# The Big Idea

Instead of asking

> Which line looks good?

Mathematicians asked

> Which line has the smallest total squared residual?

This changed everything.

---

# The Least Squares Principle

Suppose

Residual

is

$$y-\hat y$$

Square it

$$(y-\hat y)^2$$

Now

add

all

samples.

$$(y_1-\hat y_1)^2 + (y_2-\hat y_2)^2 + ... + (y_n-\hat y_n)^2$$

This quantity

is called

the

**Sum of Squared Errors (SSE)**

or

more precisely in regression,

**Residual Sum of Squares (RSS).**

---

# Why RSS Instead of SSE?

This is an interview favorite.

You'll hear both names.

Technically,

when discussing regression,

the observed deviations are **residuals**.

Therefore,

many statistics books prefer

$$RSS$$

Residual Sum of Squares.

Machine Learning books often use

SSE.

Both refer to the same idea in introductory Linear Regression.

---

# The OLS Principle

Now comes

the most important sentence.

OLS says

> **Choose the values of (w) and (b) that minimize the Residual Sum of Squares.**

That's it.

That is OLS.

Notice

OLS does **not**

tell us

**how**

to minimize.

It only tells us

**what**

to minimize.

This distinction is crucial.

---

# Mathematical Form

Suppose

our model is

$$\hat y=wx+b$$

Residual

$$y-(wx+b)$$

Square it

$$(y-(wx+b))^2$$

Now

sum over all samples.

$$\boxed{RSS=\sum_{i=1}^{n}(y_i-\hat y_i)^2}$$

Or,

substituting

(\hat y_i = wx_i+b),

[
\boxed{
RSS=
\sum_{i=1}^{n}
\left(y_i-(wx_i+b)\right)^2
}
]

This is one of the most famous equations in statistics.

---

# Why Is It Called "Least" Squares?

Imagine

three lines.

RSS values

```text
Line A

RSS =120
```

```text
Line B

RSS =65
```

```text
Line C

RSS =240
```

Which one

does OLS choose?

The one with

the **least**

sum of squares.

Hence

Least Squares.

---

# Why Is It Called "Ordinary"?

Excellent question.

Most students never ask this.

Because later,

statistics invented many variants:

* Weighted Least Squares (WLS)
* Generalized Least Squares (GLS)
* Ridge Regression
* Lasso Regression

The original,

basic version

became known as

**Ordinary Least Squares**

or

OLS.

The word **Ordinary** distinguishes it from these more advanced methods.

---

# Is OLS an Algorithm?

This is one of the biggest misconceptions.

No.

OLS

is

an

**optimization criterion.**

It defines

the objective.

Different methods

can minimize it.

For example

Small datasets

↓

Closed-form mathematical solution (Normal Equation).

Large datasets

↓

Gradient Descent.

Same objective.

Different optimization methods.

This distinction is essential.

---

# An Everyday Analogy

Imagine

you want

the cheapest flight.

Question

Is

"Find the cheapest ticket"

an algorithm?

No.

It is

the objective.

Different websites

use different algorithms

to search.

Same objective.

Similarly,

OLS defines

the objective,

not the procedure.

---

# Geometry of OLS

Imagine

the regression line.

```text
      ●

      │

      │

──────┼──────────

      │

      ●

         │

─────────┼────────
```

Every vertical distance

is a residual.

OLS

takes

every one

of those residuals,

squares them,

adds them,

and asks

> Which line makes this total as small as possible?

---

# Why Squaring Helps

Suppose

Residuals

```text
2

4

8
```

Squares

```text
4

16

64
```

Notice

Large mistakes

grow dramatically.

OLS strongly discourages

large prediction errors.

---

# Important Observation

OLS is trying to find

the values of

```text
w

and

b
```

that minimize

RSS.

Notice

It is **not** changing

the data.

It is **not** changing

the predictions directly.

It changes

the parameters,

which changes

the line,

which changes

the predictions,

which changes

the residuals.

This cause-and-effect chain is fundamental.

---

# The Learning Process

```text
Choose w,b

↓

Predict ŷ

↓

Compute Residuals

↓

Square Residuals

↓

Add Them

↓

RSS

↓

Better or Worse?

↓

Adjust w,b
```

Almost every supervised ML algorithm follows this general pattern:

1. Predict.
2. Measure loss.
3. Improve parameters.

---

# Industry Perspective

Suppose Netflix builds

100 recommendation models.

Each produces

a different RSS

on the validation data.

The model with

the smaller RSS

generally has

better predictions.

The principle of comparing models using an objective function is common across ML, even when the exact loss function changes.

---

# Common Misconceptions

### ❌ OLS is the Linear Regression algorithm.

No.

OLS is the **criterion** (objective).

Linear Regression is the model.

Gradient Descent or the Normal Equation are optimization methods used to find the parameters.

---

### ❌ OLS guarantees perfect predictions.

No.

It guarantees the **minimum possible squared residuals** within the chosen linear model.

If the true relationship is highly nonlinear, even the best linear model may still have significant errors.

---

### ❌ OLS always uses Gradient Descent.

No.

For simple Linear Regression,

the optimal parameters can be computed analytically using the **Normal Equation**.

Gradient Descent becomes useful for larger or more complex problems.

---

### ❌ OLS means every prediction should have zero residual.

No.

OLS minimizes the **overall** squared residuals,

not each individual residual.

---

# Interview Questions

1. What is Ordinary Least Squares?
2. Why is it called "Least Squares"?
3. Why is it called "Ordinary"?
4. Is OLS an algorithm or an objective?
5. What quantity does OLS minimize?
6. What is the difference between RSS and SSE?
7. Why are residuals squared?
8. Can OLS guarantee perfect predictions?
9. What parameters does OLS optimize in Linear Regression?
10. How can OLS be optimized in practice?

---

# 🔗 Connections

### Connected to Previous Chapters

* **Chapter 12:** We learned how to measure the error for one prediction.
* **Chapter 13:** We discovered that simply summing errors fails.

This chapter introduces the mathematical principle that solves that problem:

> **Minimize the sum of squared residuals.**

---

### Prepares for the Next Chapter

We now know

**what** we want to minimize:

[
RSS=\sum (y_i-\hat y_i)^2
]

But in Machine Learning,

we usually give this objective a more general name:

> **Cost Function** (or Objective Function).

The next chapter answers:

* What is a Cost Function?
* Why do all ML algorithms define one?
* Is RSS itself a Cost Function?
* What's the difference between RSS, Loss, and Cost?
* Why do different algorithms use different cost functions?

---

# ⭐ Chapter Summary (Revision Notes)

### Ordinary Least Squares (OLS)

* OLS is a **principle** for choosing the Best Fit Line.
* It selects the values of (w) and (b) that minimize the **Residual Sum of Squares (RSS)**.

### Objective

[
\boxed{
RSS=\sum_{i=1}^{n}(y_i-\hat y_i)^2
}
]

For Linear Regression:

[
\boxed{
RSS=\sum_{i=1}^{n}\left(y_i-(wx_i+b)\right)^2
}
]

### Key Concepts

* Residuals are squared to prevent cancellation and penalize large mistakes.
* OLS defines **what to optimize**, not **how to optimize**.
* Different optimization methods (e.g., Normal Equation, Gradient Descent) can minimize the same OLS objective.

### 🟡 Remember Forever

> **OLS is the objective. Gradient Descent is one possible optimizer.**

---

# 🧠 Self Check Questions

1. What is Ordinary Least Squares?
2. Why is it called "Least Squares"?
3. Why is the word "Ordinary" included?
4. Is OLS an algorithm or an optimization criterion?
5. Write the mathematical expression for RSS.
6. Why does OLS square residuals?
7. What parameters are optimized in Linear Regression?
8. How are RSS, the regression line, and the parameters (w) and (b) connected?
9. Can two different optimization methods minimize the same OLS objective?
10. If someone says "Linear Regression uses OLS," what does that statement actually mean?

---

## 📖 Author's Note

This chapter marks a major milestone.

For the first time, we've moved from **intuition** ("find the best line") to a **precise mathematical objective** ("minimize the sum of squared residuals").

Notice that we still haven't discussed **how** to minimize RSS. That's intentional.

A good engineer first defines **the problem**, then chooses **the method** to solve it.

In the next chapter, we'll generalize this idea into one of the most universal concepts in Machine Learning:

> **The Cost Function**.

Once you understand cost functions, you'll realize that almost every ML algorithm—Linear Regression, Logistic Regression, Neural Networks, and even modern deep learning—follows the same three-step recipe:

1. Make predictions.
2. Measure cost.
3. Optimize parameters.

That recurring pattern is one of the deepest unifying ideas in Machine Learning.

