# Part 7 — Machine Learning Perspective

Now let's connect everything we have learned about **origin, plane, normal vector, distance, and $w_0$** to Machine Learning.

This is the most important part conceptually because we can now see **why ML needs this geometry**.

---

# 7.1 Start With a Simple ML Problem

Imagine we have data about houses.

Suppose we use only two features:

```text
x₁ = house area
x₂ = number of bedrooms
```

Then one house can be represented as a feature vector:

```math id="p7-house-vector"
\boxed{
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
}
```

For example:

```math id="p7-house-example"
\overrightarrow{x}
=
\begin{bmatrix}
2000\\
3
\end{bmatrix}
```

You can think of this as:

> **One data point = one vector of feature values.**

This is the ML interpretation of the vector idea we discussed earlier.

---

# 7.2 What Does a Linear Model Do?

A linear model calculates:

```math id="p7-linear-score"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

For two features:

```math id="p7-expanded-score"
w_1x_1+w_2x_2+w_0
```

Here:

```text id="p7-roles"
x
↓
features of the data point

w
↓
weights learned by the model

w₀
↓
bias
```

So the model takes the feature vector and produces a **score**.

---

# 7.3 The Decision Boundary

Now ask:

> **Where does the model's score become exactly zero?**

Set:

```math id="p7-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This equation defines the **decision boundary**.

In 2D, this is a line.

In 3D, this is a plane.

In higher dimensions, it is a hyperplane.

So our familiar geometry equation:

```math id="p7-plane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

is also the equation of a **linear ML decision boundary**.

---

# 7.4 Visualise the Model as a Wall

This is the mental model I want you to carry.

Imagine feature space as a huge room.

The model puts a wall inside it:

```text id="p7-wall"
                Class A
                   ●
              ●


────────────────────────────────
        Decision Boundary
────────────────────────────────


          ●
                ●
                Class B
```

The wall divides the space into two regions.

Our ML model needs to determine:

> **Which side of the wall does a data point belong to?**

This will lead directly to our next topic, **Half Space**.

---

# 7.5 What Is $\overrightarrow{w}$ Doing?

We already know from geometry:

```math id="p7-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

Therefore, in ML:

```math id="p7-w-ml"
\boxed{
\overrightarrow{w}\perp\text{decision boundary}
}
```

Visualise it:

```text id="p7-w-visual"
                    ↑
                    │
                    │  w
                    │
                    │
────────────────────┼──────────────────
           Decision Boundary
```

So $\overrightarrow{w}$ tells us the **normal direction of the decision boundary**.

---

# 7.6 What Does That Mean in Simple Words?

Think of the decision boundary as a wall.

Then $\overrightarrow{w}$ is an arrow pointing **straight out of the wall**.

```text id="p7-wall-normal"
                    ↑
                    │
                    │
                    │
────────────────────┼────────────────
                    │
                    │
```

Therefore:

> **The weights don't just represent numbers attached to features. Together, they define a direction in feature space—and that direction is perpendicular to the decision boundary.**

This is a much deeper interpretation of the weight vector.

---

# 7.7 What Is $w_0$ Doing?

Now look at:

```math id="p7-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

Suppose we keep $\overrightarrow{w}$ fixed but change $w_0$.

For example:

```math id="p7-boundary1"
3x+4y-12=0
```

and:

```math id="p7-boundary2"
3x+4y-20=0
```

Both have:

```math id="p7-same-w"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

So their orientation is the same.

But their positions differ.

```text id="p7-parallel"
────────────────────────
       Boundary 1


────────────────────────
       Boundary 2
```

Therefore:

```text id="p7-w0-role"
w
 ↓
orientation

w₀
 ↓
position
```

This is a very useful geometric interpretation of the bias.

---

# 7.8 The Origin Enters the Picture

Now consider the origin:

```math id="p7-origin"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

Put it into the model:

```math id="p7-origin-score"
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
```

Since:

```math id="p7-origin-zero"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

we get:

```math id="p7-origin-score2"
\boxed{
w_0
}
```

This means:

> **The model's score at the origin is exactly $w_0$.**

That's a very useful interpretation.

---

# 7.9 What Does $w_0=0$ Mean in ML?

If:

```math id="p7-w0-zero"
w_0=0
```

then:

```math id="p7-boundary-origin"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

and the origin satisfies the boundary equation.

Therefore:

```text id="p7-origin-boundary"
        Decision Boundary
─────────────────●──────────────
                 Origin
```

The decision boundary passes through the origin.

So:

> **If the bias is zero, the linear decision boundary passes through the origin.**

This is an important ML fact.

---

# 7.10 What If $w_0\neq0$?

Then:

```math id="p7-w0-nonzero"
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
=
w_0
\neq0
```

So the origin is not on the decision boundary.

There is some distance between them.

That distance is:

```math id="p7-origin-distance"
\boxed{
d_{\text{origin}}
=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So our previous mathematical topic now has a direct ML interpretation:

> **It tells us how far the linear decision boundary is from the origin of feature space.**

---

# 7.11 Why Is This Useful?

Imagine two models:

```text id="p7-model-a"
Model A:

Origin ●
       │
       │
───────┼──────── Decision Boundary
```

and:

```text id="p7-model-b"
Model B:

Origin ●
       │
       │
       │
       │
───────┼──────── Decision Boundary
```

The second boundary is farther from the origin.

The formula:

```math id="p7-distance"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

quantifies that difference.

So instead of merely saying:

> "The bias shifted the boundary."

we can say:

> **"The normalized bias determines the perpendicular displacement of the boundary relative to the origin."**

That is the mathematically precise version.

---

# 7.12 But Be Careful: $w_0$ Alone Does Not Tell Us the Distance

This is worth repeating because it is a common misunderstanding.

Suppose:

```math id="p7-w0"
w_0=10
```

You cannot say:

> "The boundary is 10 units away."

You must account for the magnitude of $\overrightarrow{w}$:

```math id="p7-distance-correct"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

Why?

Because the equation can be multiplied by any non-zero constant without changing the boundary.

So:

```text id="p7-scale"
w₀
 ↓
raw score

|w₀| / ||w||
 ↓
geometrically meaningful distance
```

---

# 7.13 Now Connect This to Classification

Suppose we have:

```math id="p7-score"
\boxed{
s=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The decision boundary is:

```math id="p7-zero-score"
s=0
```

Now there are three possibilities:

```text id="p7-three-cases"
s > 0
 ↓
one side


s = 0
 ↓
on boundary


s < 0
 ↓
other side
```

This is the bridge to **Half Space**.

We are moving from:

> **"Where is the boundary?"**

to:

> **"Which side of the boundary is my data point on?"**

---

# 7.14 Distance Gives More Information Than Just the Side

Suppose two points have scores:

```math id="p7-scores"
Point A → +2
Point B → +20
```

Both are on the same side because both scores are positive.

But they may be at different distances from the boundary.

The normalized distance is:

```math id="p7-normalized-distance"
\boxed{
\frac{|s|}
{\|\overrightarrow{w}\|}
}
```

Therefore:

```text id="p7-distance-meaning"
Sign
 ↓
Which side?

Magnitude / ||w||
 ↓
How far?
```

This is a very important geometric interpretation of a linear model.

---

# 7.15 Why Normalization Matters in ML Too

Suppose we multiply the model equation by $10$:

```math id="p7-scaled-model"
10\overrightarrow{w}^{T}\overrightarrow{x}
+
10w_0
=
0
```

The decision boundary hasn't changed.

But the raw score has become ten times larger.

Therefore, the raw score alone cannot be interpreted as a physical distance.

We normalize:

```math id="p7-distance-score"
\boxed{
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

Now the result is invariant to this arbitrary scaling.

This is one reason the point-to-plane geometry we learned is valuable in ML.

---

# 7.16 A Very Important Connection to Your Earlier Question

You asked:

> **"Can we say a vector in ML is kind of an array of features?"**

Yes.

Now we can put that into the complete picture.

### Data vector

```math id="p7-data-vector"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3\\
\vdots
\end{bmatrix}
```

Think:

```text id="p7-data-meaning"
[feature₁,
 feature₂,
 feature₃,
 ...]
```

### Weight vector

```math id="p7-weight-vector"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
w_3\\
\vdots
\end{bmatrix}
```

Think:

```text id="p7-weight-meaning"
[importance/weight of feature₁,
 importance/weight of feature₂,
 importance/weight of feature₃,
 ...]
```

Then:

```math id="p7-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
```

combines the features and their weights.

And the collection of all points satisfying:

```math id="p7-boundary-again"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

forms the decision boundary.

---

# 7.17 A Simple 2D Example

Suppose:

```math id="p7-example-model"
\boxed{
2x_1+x_2-4=0
}
```

Then:

```math id="p7-example-w"
\overrightarrow{w}
=
\begin{bmatrix}
2\\
1
\end{bmatrix}
```

and:

```math id="p7-example-w0"
w_0=-4
```

The normal direction is:

```text id="p7-example-normal"
       ↑
      /
     /
    / w
```

while the decision boundary is perpendicular to it.

The origin is:

```math id="p7-example-origin"
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
```

Its distance from the boundary is:

```math id="p7-example-distance"
d=
\frac{|-4|}
{\sqrt{2^2+1^2}}
```

```math id="p7-example-distance2"
\boxed{
d=
\frac{4}{\sqrt5}
}
```

So the boundary is approximately:

```math id="p7-example-distance3"
\boxed{
1.789
}
```

units away from the origin.

---

# 7.18 What Does This Mean in Plain English?

Forget the formula for a moment.

The model has created a wall:

```text id="p7-wall2"
          Class A

────────────────────
       WALL
────────────────────

          Class B
```

The origin is somewhere in the room.

The question:

> **"How far is the wall from the origin?"**

has the answer:

```math id="p7-wall-distance"
\frac{|w_0|}
{\|\overrightarrow{w}\|}
```

That's all we are doing.

---

# 7.19 Why This Matters for Future ML Topics

This geometry is not isolated.

It prepares us for concepts such as:

### Linear Classification

```text
Data point
    ↓
linear score
    ↓
side of boundary
```

### Margin

```text
How far are points from
the decision boundary?
```

### Support Vector Machine

```text
Find a boundary with
maximum margin
```

### Logistic Regression

```text
wᵀx + w₀
   ↓
score
   ↓
probability
```

### Perceptron

```text
wᵀx + w₀
   ↓
classification decision
```

So the geometry we are learning now becomes a foundation for several ML algorithms.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

This is the complete mental picture:

```text id="p7-ultimate"
                 Feature Space

        Class A
           ●
      ●

──────────────────────────────
       Linear Boundary
──────────────────────────────

       ●
          ●
        Class B


w
↑
│
│
Normal direction
```

The data point is:

```math id="p7-x"
\overrightarrow{x}
```

The model's weights are:

```math id="p7-w"
\overrightarrow{w}
```

The boundary is:

```math id="p7-boundary-final"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

The signed score is:

```math id="p7-score-final"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The perpendicular distance from the boundary is:

```math id="p7-distance-final"
\boxed{
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

And for the special point—the origin:

```math id="p7-origin-final"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 🧠 Part 7 Mental Model

Whenever you see:

```math id="p7-mental-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

translate it into this story:

```text id="p7-mental"
x
↓
Where is my data point?

w
↓
Which direction is perpendicular
to my boundary?

w₀
↓
Where is the boundary positioned?

= 0
↓
I am exactly on the boundary
```

Then:

```text id="p7-mental-distance"
absolute score
      ÷
normal-vector magnitude
      ↓
actual perpendicular distance
```

---

# 🔑 Part 7 Takeaways

### 1. In ML, a feature vector represents a data point.

```math id="p7-t1"
\overrightarrow{x}
```

### 2. The weight vector defines the orientation of a linear boundary.

```math id="p7-t2"
\boxed{
\overrightarrow{w}\perp\text{boundary}
}
```

### 3. The bias helps determine the boundary's position.

```math id="p7-t3"
w_0
```

### 4. The linear decision boundary is:

```math id="p7-t4"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 5. The signed score tells us the point's side relative to the boundary.

### 6. Normalized absolute score gives perpendicular distance:

```math id="p7-t6"
\boxed{
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
}
```

### 7. For the origin:

```math id="p7-t7"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

## One-Line Understanding

> **In ML, the feature vector tells us where a data point is in feature space, the weight vector tells us the perpendicular direction of the linear decision boundary, the bias helps position that boundary, and the normalized model score tells us how far a point is from it.**

### Next: **Part 8 — Python / NumPy**

We will implement the origin-to-plane distance from scratch, connect every line of Python to the mathematics, and then implement the more general **point-to-plane distance** so you can see exactly how the special case fits into the general implementation.

