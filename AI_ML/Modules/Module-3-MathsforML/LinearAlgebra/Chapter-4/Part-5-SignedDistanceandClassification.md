# Part 5 — Signed Distance and Classification

In Part 4, we brought the **actual training data points** into our picture.

We learned that for a specific data point $\overrightarrow{x}^{(i)}$:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
```

tells us which side of the decision boundary the point is on.

We also know how to calculate its ordinary distance:

```math
d^{(i)}
=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
\right|
}{
\|\overrightarrow{w}\|
}
```

But we identified a problem:

> **Ordinary distance tells us how far a point is, but not which side it is on.**

That is exactly what **signed distance** solves.

---

# 1. First Understand the Problem

Suppose our decision boundary is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

And we have two points:

```text
                 ● A
                 │
                 │ 2 units
                 │
─────────────────┼──────────────
                 │
                 │ 2 units
                 │
                 ● B
```

Both points are **2 units away** from the boundary.

Ordinary distance tells us:

```text
A → 2 units
B → 2 units
```

But it doesn't tell us:

```text
A → which side?
B → which side?
```

For classification, that information is essential.

---

# 2. We Need a Direction

Remember our normal vector:

```math
\overrightarrow{w}
```

It is perpendicular to the decision boundary.

Imagine:

```text
                 ●
                 ↑
                 │
                 │  w
                 │
─────────────────┼────────────────
                 │
                 │
                 │
```

The normal vector gives us a **reference direction**.

We can therefore say:

> Moving in the direction of $\overrightarrow{w}$ is positive.

And the opposite direction is negative.

This gives distance a **sign**.

---

# 3. Signed Distance

For a specific training point $\overrightarrow{x}^{(i)}$, define its signed distance as:

```math
\boxed{
d^{(i)}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
}{
\|\overrightarrow{w}\|
}
}
```

Notice something very important.

### There is NO absolute value.

Previously:

```math
\boxed{
\text{ordinary distance}
=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
\right|
}{
\|\overrightarrow{w}\|
}
}
```

Now:

```math
\boxed{
\text{signed distance}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
}{
\|\overrightarrow{w}\|
}
}
```

Removing the absolute value allows the result to be **positive or negative**.

---

# 4. What Does the Sign Mean?

Consider:

```math
d^{(i)}>0
```

This means:

> $\overrightarrow{x}^{(i)}$ lies on the side toward which $\overrightarrow{w}$ points.

And:

```math
d^{(i)}<0
```

means:

> $\overrightarrow{x}^{(i)}$ lies on the opposite side.

And:

```math
d^{(i)}=0
```

means:

> $\overrightarrow{x}^{(i)}$ lies exactly on the decision boundary.

So:

```text
                 + side
                    ↑
                    │
                    │ w
                    │
────────────────────┼────────────────
              Boundary
                    │
                    │
                    ↓
                 - side
```

---

# 5. Why Do We Divide by $|\overrightarrow{w}|$?

This is something we already learned in the previous chapter.

The quantity:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
```

tells us about the point's position relative to the boundary.

But it is **not yet a true geometric distance**.

We normalize it by:

```math
\|\overrightarrow{w}\|
```

Therefore:

```math
\boxed{
d^{(i)}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
}{
\|\overrightarrow{w}\|
}
}
```

gives us a distance measured in actual geometric units, while preserving the sign.

---

# 6. Let's See the Three Cases

Our decision boundary:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

### Case 1 — Positive signed distance

```math
d^{(i)}>0
```

Visual:

```text
                 ● x⁽ⁱ⁾
                 ↑
                 │
                 │ +d⁽ⁱ⁾
                 │
                 │
─────────────────┼────────────────
```

The point is on the **positive side**.

---

### Case 2 — Zero signed distance

```math
d^{(i)}=0
```

Visual:

```text
─────────────────●────────────────
                 x⁽ⁱ⁾
```

The point lies exactly on the boundary.

---

### Case 3 — Negative signed distance

```math
d^{(i)}<0
```

Visual:

```text
─────────────────┼────────────────
                 │
                 │
                 │ -d⁽ⁱ⁾
                 ↓
                 ● x⁽ⁱ⁾
```

The point is on the **negative side**.

---

# 7. Now Classification Becomes Very Simple

This is the important ML connection.

Suppose we define our two classes as:

```text
+1 → positive side
-1 → negative side
```

Then our classifier can simply look at the sign.

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0
\quad\Rightarrow\quad
\hat{y}^{(i)}=+1
}
```

and:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0
\quad\Rightarrow\quad
\hat{y}^{(i)}=-1
}
```

We don't actually need to calculate the denominator $|\overrightarrow{w}|$ just to determine the class.

Why?

Because:

```math
\|\overrightarrow{w}\|>0
```

so dividing by it does not change the sign.

Therefore:

```text
Sign of signed distance
        ↓
same as
        ↓
Sign of wᵀx⁽ⁱ⁾ + b
        ↓
classification
```

---

# 8. This Is the Connection to Half-Space

Remember our previous chapter?

We had:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b>0
```

and:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b<0
```

These represented the two half-spaces.

Now we're giving those half-spaces a **machine learning meaning**:

```text
Positive Half-Space
        ↓
ŷ = +1
```

and:

```text
Negative Half-Space
        ↓
ŷ = -1
```

So:

```text
              Decision Boundary
                     │
                     │
       +1            │            -1
       Class         │            Class
                     │
          w →        │
                     │
─────────────────────┼─────────────────────
                     │
```

The plane is not just dividing mathematical space anymore.

It is dividing **different classes of data**.

---

# 9. A Numerical Example

Let's take a simple decision boundary:

```math
2x+3y-6=0
```

Therefore:

```math
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3
\end{bmatrix}
```

and:

```math
b=-6
```

Suppose our specific data point is:

```math
\overrightarrow{x}^{(i)}
=
\begin{bmatrix}
3\\
3
\end{bmatrix}
```

Remember:

> $\overrightarrow{x}^{(i)}$ is the actual data point we are evaluating.

Calculate:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
=
2(3)+3(3)-6
```

```math
=6+9-6
```

```math
=9
```

Therefore:

```math
9>0
```

So:

```math
\boxed{\hat{y}^{(i)}=+1}
```

The point belongs to the positive side.

---

# 10. Calculate Its Signed Distance

The magnitude of $\overrightarrow{w}$ is:

```math
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2}
=
\sqrt{13}
```

Therefore:

```math
d^{(i)}
=
\frac{9}{\sqrt{13}}
```

Approximately:

```math
\boxed{
d^{(i)}\approx2.50
}
```

So this point is:

> **2.50 units on the positive side of the boundary.**

That's much more informative than simply saying:

> "The point is 2.50 units away."

Because now we know **which side** it is on.

---

# 11. What If the Point Is on the Other Side?

Suppose another data point gives:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(j)}+b=-9
```

Then:

```math
d^{(j)}
=
\frac{-9}{\sqrt{13}}
```

approximately:

```math
d^{(j)}\approx-2.50
```

Notice:

```text
Point i → +2.50
Point j → -2.50
```

The ordinary distances are both:

```text
2.50 units
```

but the signed distances tell us:

```text
+2.50 → one side
-2.50 → other side
```

That is exactly what we needed.

---

# 12. Static Notebook Visual

This is a good `.md`-friendly visual to keep:

```text
                         +1 SIDE
                            ●
                            │
                            │  +d⁽ⁱ⁾
                            │
                            ↓
                ─────────────────────
                  DECISION BOUNDARY
                wᵀx + b = 0
                ─────────────────────
                            ↑
                            │  -d⁽ʲ⁾
                            │
                            │
                            ●
                         -1 SIDE
```

And annotate:

```text
w → normal vector

+d → point lies on the side of w

-d → point lies opposite to w

0 → point lies on boundary
```

---

# 13. Another Visual — From Geometry to Classification

This is perhaps the most important visual for the notebook:

```text
                w
                ↑
                │
        ● ● ●   │    +1
          ●     │
                │
────────────────┼────────────────
        Decision Boundary
                │
                │
       ○ ○ ○    │    -1
         ○      │
                │
```

The same geometric fact:

```text
positive side
      ↓
positive signed distance
      ↓
class +1
```

and:

```text
negative side
      ↓
negative signed distance
      ↓
class -1
```

---

# 14. ⚠️ One Subtle Point About the Direction of $\overrightarrow{w}$

There is an important detail that is easy to miss.

Suppose:

```math
\overrightarrow{w}
```

points upward.

Then we call the upward side **positive**.

But what if we reverse the normal vector?

```math
-\overrightarrow{w}
```

The physical boundary does **not change**.

For example:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

and:

```math
(-\overrightarrow{w})^{T}\overrightarrow{x}-b=0
```

represent the **same boundary**.

But the signs reverse.

So:

```text
w → positive side is here
```

while:

```text
-w → positive side is there
```

This means:

> **The labels +1 and -1 depend on which direction we choose for the normal vector.**

This is not a problem.

We simply choose a consistent convention.

---

# 15. Why This Matters Later

This small detail will become very important when we introduce the actual training labels:

```math
y^{(i)}\in\{-1,+1\}
```

We will want the mathematical expression to say:

> **Correctly classified points should produce a positive quantity.**

That is why the label $y^{(i)}$ will eventually be multiplied with the signed expression.

But **don't jump there yet**.

First, understand this sequence:

```text
Data point x⁽ⁱ⁾
       ↓
wᵀx⁽ⁱ⁾ + b
       ↓
What side?
       ↓
Signed distance
       ↓
Positive / Negative
       ↓
Classification
```

That is the foundation for the next Parts.

---

# 16. 🎯 Ultimate Goal in ML

Now we can make our permanent ML connection clearer.

We started with:

> "I need a line/plane to separate two groups."

Then:

```text
Decision Boundary
       ↓
Which side is the point on?
       ↓
Classification
```

But classification alone isn't enough.

We now want to ask:

> **How confidently is the point on the correct side?**

And signed distance gives us the beginning of that answer.

For example:

```text
Point A → +0.2
Point B → +2.5
Point C → +8.0
```

All three may be correctly classified as $+1$.

But geometrically:

```text
+0.2 → very close to boundary
+2.5 → farther away
+8.0 → much farther away
```

So the distance contains information about **separation/confidence** that a simple class prediction does not.

This is going to lead directly toward the next problem.

---

# 🧠 Part 5 — What You Should Remember

### ① Ordinary distance

```math
\boxed{
d^{(i)}
=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
\right|
}{
\|\overrightarrow{w}\|
}
}
```

Answers:

> **How far is the data point from the boundary?**

---

### ② Signed distance

```math
\boxed{
d^{(i)}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
}{
\|\overrightarrow{w}\|
}
}
```

Answers:

> **How far is the point, and on which side?**

---

### ③ Sign tells us the side

```text
d⁽ⁱ⁾ > 0 → positive side
d⁽ⁱ⁾ = 0 → boundary
d⁽ⁱ⁾ < 0 → negative side
```

---

### ④ Classification

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0
\Rightarrow
\hat{y}^{(i)}=+1
```

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0
\Rightarrow
\hat{y}^{(i)}=-1
```

---

### ⑤ The important distinction

```text
x
↓
generic point used to describe the boundary

x⁽ⁱ⁾
↓
specific training data point being evaluated
```

We will continue using this distinction.

---

## 🔑 One-line takeaway

> **Signed distance turns "how far is this data point from the boundary?" into "how far is it, and which side of the boundary is it on?"**

And now we have reached an important problem:

> We want to use these distances to evaluate whether a decision boundary is good — but there is a mathematical problem with simply using the absolute distance.

That is exactly what we will solve in:

# **Part 6 — Why Distance Alone Is Not Enough**

