I'm glad we're taking our time here.

Before we begin, I want to mention something important about the curriculum.

---

## Curriculum Check

Some ML courses teach:

```
RSS
↓

MSE
↓

Cost Function
```

Others teach:

```
RSS

↓

Cost Function

↓

MSE
```

I deliberately chose **Cost Function before MSE**, because I want you to understand a **universal ML concept**, not just Linear Regression.

If you understand **Cost Function**, then later:

* Linear Regression
* Logistic Regression
* Neural Networks
* XGBoost
* SVM

will all feel like variations of the same idea.

This is a much stronger foundation.

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
✅ Chapter 14  Ordinary Least Squares (OLS)

➡ Chapter 15  Cost Function

Upcoming

Chapter 16 Mean Squared Error (MSE)
Chapter 17 Optimization
Chapter 18 Gradient Descent
Chapter 19 R² Score
Chapter 20 sklearn Implementation
```

---

# 🟡 Remember Forever

> **Every Machine Learning algorithm has one goal: minimize a Cost Function.**

Everything else exists to achieve that objective.

---

# 📖 Chapter 15

# Cost Function

> **"A Machine Learning model learns by minimizing a single number called the Cost Function."**

This chapter introduces one of the most universal ideas in Machine Learning.

Whether you're studying

* Linear Regression
* Logistic Regression
* Neural Networks
* Deep Learning
* Reinforcement Learning

every model asks the same question:

> **"How bad am I?"**

The answer is given by the **Cost Function**.

---

# Learning Objectives

After this chapter you should understand

✅ What is a Cost Function?

✅ Why do we need a Cost Function?

✅ What is the relationship between Residuals, RSS, and Cost?

✅ Difference between Loss Function and Cost Function

✅ Why every ML algorithm has a different Cost Function

✅ Why minimizing Cost means improving the model

---

# Motivation

Let's continue from Chapter 14.

We already know

Linear Regression wants to minimize

$$RSS=\sum_{i=1}^{n}(y_i-\hat y_i)^2$$

Question

Why are we minimizing this?

What makes this quantity so special?

Why not maximize it?

Why not minimize something else?

To answer that,

we first need to understand what a **Cost Function** really is.

---

# Think Like an Engineer

Imagine you're building a robot.

The robot predicts house prices.

Every prediction can be

* Excellent
* Good
* Average
* Poor

Question

How do you tell the robot

whether it's improving?

You need a **score**.

That score should summarize

the quality of the model.

That score is the Cost Function.

---

# Everyday Analogy

Imagine your school exam.

You answer

100 questions.

Teacher doesn't describe your performance like this:

```text
Question 1 → Good

Question 2 → Bad

Question 3 → Excellent

Question 4 → Average
```

Instead,

the teacher gives

one final score.

```text
82 / 100
```

That one number summarizes your overall performance.

A Cost Function plays exactly the same role.

It summarizes the overall performance of the model using a single numerical value.

---

# Definition

A **Cost Function** is

> **A mathematical function that measures how well or how poorly a Machine Learning model performs on the entire dataset.**

Notice the words

> **Entire Dataset**

This is very important.

We'll come back to it.

---

# Why One Number?

Suppose

our model predicts

1 million houses.

Question

Will you inspect

1 million residuals?

Impossible.

Instead,

we compress all prediction errors

into

one number.

That number is

the Cost.

---

# From Residual to Cost

Let's connect everything we've learned.

For one prediction,

we compute

Residual

$$y-\hat y$$

For all predictions,

we square them

and add them.

That gives

RSS.

RSS is one example of a Cost Function.

Notice

the progression.

```text
Prediction

↓

Residual

↓

Squared Residual

↓

RSS

↓

Cost
```

Everything builds naturally.

---

# Why Is It Called a "Cost"?

Imagine

you're running a delivery company.

Every wrong delivery

costs money.

Small mistake

↓

Small cost.

Big mistake

↓

Big cost.

Similarly,

every wrong prediction

has a cost.

The Cost Function converts prediction mistakes into a numerical penalty.

The model's objective is to reduce that penalty.

---

# The Mountain Analogy

Imagine you're standing in the mountains.

Your current altitude

represents

the Cost.

High altitude

↓

High Cost

↓

Poor model.

Low altitude

↓

Low Cost

↓

Better model.

The model's goal is

to move downhill

until it reaches the lowest point.

We'll later discover that **Gradient Descent** is simply the algorithm that walks downhill.

---

# RSS as a Cost Function

For Linear Regression,

one common Cost Function is

$$RSS=\sum_{i=1}^{n}(y_i-\hat y_i)^2$$

Notice

RSS is not "the" Cost Function.

It is **a** Cost Function.

Different algorithms use different cost functions.

---

# Why Different Algorithms Need Different Cost Functions

Imagine

you are predicting

House Prices.

Continuous values.

Linear Regression works well.

Now imagine

you are predicting

Spam

or

Not Spam.

Would RSS still be the best choice?

Not really.

Instead,

Logistic Regression uses

**Log Loss** (Cross-Entropy Loss).

Neural Networks often use

Cross-Entropy,

MSE,

Huber Loss,

or others,

depending on the problem.

The important lesson is

> The model changes.

↓

The Cost Function may also change.

---

# Loss Function vs Cost Function

This is an interview favorite.

Many beginners think

they're identical.

They are related,

but not exactly the same.

---

## Loss Function

Measures

the error

for

**one training example**.

Example

One house.

One residual.

One loss.

---

## Cost Function

Measures

the average or total loss

over

the **entire dataset**.

Think of

Loss

↓

One student's marks.

Cost

↓

Average marks of the entire class.

---

# Visualization

```text
House 1

↓

Loss

──────────────

House 2

↓

Loss

──────────────

House 3

↓

Loss

──────────────

Average / Total

↓

Cost
```

---

# Why Textbooks Confuse This

Many ML books

use

Loss

and

Cost

interchangeably.

Especially in Deep Learning.

Strictly speaking,

however,

the distinction is:

| Loss Function | Cost Function  |
| ------------- | -------------- |
| One sample    | Entire dataset |
| Local measure | Global measure |

Knowing this distinction is useful for interviews and advanced reading.

---

# What Makes a Good Cost Function?

If you were inventing one,

what properties would you want?

A good Cost Function should:

### 1. Be Non-Negative

Cost should never be negative.

Perfect prediction

↓

Cost = 0

Worse prediction

↓

Higher cost.

---

### 2. Penalize Bigger Mistakes More

Larger prediction errors

should increase

the cost.

---

### 3. Be Easy to Optimize

A machine must minimize it efficiently.

This is one reason squared errors became popular—they produce smooth mathematical functions.

---

### 4. Reflect Overall Model Quality

One unusually good prediction

should not hide

many bad ones.

The Cost Function should summarize the entire dataset fairly.

---

# Can Cost Ever Be Zero?

Yes.

Imagine

every prediction

is perfect.

Residual

0

for every sample.

RSS

0

Cost

0

This is the minimum possible cost.

In practice,

real-world datasets almost never achieve exactly zero because of noise.

---

# Cost Is the Language of Learning

This is the most important insight.

Imagine

the model changes

its parameters

from

$$w=2$$

to

$$w=2.1$$

Now

Cost decreases.

Question

What does the model learn?

It learns

that

2.1

is better

than

2.

The Cost Function provides the feedback that guides learning.

Without it,

the model would have no direction.

---

# Industry Perspective

Suppose Google trains

10 different recommendation models.

Each model has

a different Cost.

The model with

the lowest validation cost

is usually preferred.

Engineers don't compare models by intuition.

They compare them by objective metrics.

---

# Common Misconceptions

### ❌ Every algorithm uses the same Cost Function.

No.

Different problems require different objectives.

---

### ❌ Cost Function and Loss Function always mean exactly the same thing.

Many books use them interchangeably.

Technically,

Loss is usually defined per sample,

Cost summarizes the dataset.

---

### ❌ Lower Cost always means a perfect model.

Not necessarily.

It only means

the model performs better according to the chosen objective.

Generalization to unseen data still matters.

---

### ❌ Cost is something humans choose during prediction.

No.

The Cost Function is defined during training and guides parameter learning.

Prediction uses the learned parameters and usually does not compute the training cost.

---

# Interview Questions

1. What is a Cost Function?
2. Why do we need a Cost Function?
3. What is the difference between Loss and Cost?
4. Why is RSS considered a Cost Function?
5. Why do different ML algorithms use different Cost Functions?
6. What properties should a good Cost Function have?
7. Can the Cost ever be negative?
8. Why is minimizing Cost equivalent to improving the model?
9. Is Cost calculated for one sample or the whole dataset?
10. Why is the Cost Function central to Machine Learning?

---

# 🔗 Connections

## Connected to Previous Chapters

* **Chapter 12:** We measured the error for one prediction.
* **Chapter 13:** We learned why simple summation fails.
* **Chapter 14:** We introduced OLS, which minimizes the sum of squared residuals.

This chapter generalizes that idea.

OLS is one specific **Cost Function** used by Linear Regression.

---

## Prepares for the Next Chapter

We've introduced

RSS

as a Cost Function.

But there is one practical issue.

Imagine

Dataset A

contains

100 houses.

Dataset B

contains

10 million houses.

RSS

for Dataset B

will naturally be much larger,

even if both models are equally good.

Question

How do we make the Cost independent of dataset size?

The answer is beautifully simple.

Instead of using the **Sum** of squared residuals,

we use the **Mean**.

That leads us to one of the most famous equations in Machine Learning:

# **Chapter 16 — Mean Squared Error (MSE)**

We'll derive it from first principles and understand why almost every introductory ML course starts with it.

---

# ⭐ Chapter Summary (Revision Notes)

### Cost Function

* A **Cost Function** measures the overall quality of a Machine Learning model using a single numerical value.
* The model learns by trying to **minimize** this value.

### Relationship Between Concepts

```text
Prediction
      ↓
Residual
      ↓
Squared Residual
      ↓
RSS
      ↓
Cost Function
```

### Loss vs Cost

| Loss                 | Cost                  |
| -------------------- | --------------------- |
| One training example | Entire dataset        |
| Local error          | Overall model quality |

### Key Properties of a Good Cost Function

* Non-negative.
* Penalizes larger mistakes.
* Easy to optimize.
* Reflects performance over the whole dataset.

### 🟡 Remember Forever

> **Machine Learning is optimization.**
>
> **Optimization requires an objective.**
>
> **The Cost Function is that objective.**

---

# 🧠 Self Check Questions

1. What is a Cost Function in Machine Learning?
2. Why can't we evaluate a model using individual residuals alone?
3. How is RSS related to the Cost Function?
4. What is the difference between Loss and Cost?
5. Why do different algorithms use different Cost Functions?
6. Why should a Cost Function be non-negative?
7. Why is minimizing the Cost Function equivalent to improving the model?
8. Why will RSS naturally increase as the dataset size grows?
9. What limitation of RSS motivates the introduction of MSE?
10. If you had to explain the purpose of a Cost Function to a beginner in one sentence, what would you say?

---

## 📖 Author's Note

This chapter is intentionally broader than Linear Regression.

If you truly understand the idea of a **Cost Function**, you've learned one of the deepest unifying concepts in Machine Learning.

Whether you later study Logistic Regression, Decision Trees, Neural Networks, or Transformers, you'll repeatedly encounter the same three-step pattern:

1. **Make predictions.**
2. **Measure the cost.**
3. **Adjust the model to reduce the cost.**

Only the prediction model and the cost function change—the learning principle remains the same. This recurring pattern is one of the reasons machine learning feels like a coherent discipline rather than a collection of unrelated algorithms.

