
# Part 4 — Bringing Data Points into the Picture

So far, we have been talking only about **boundaries**.

We know how to represent two parallel boundaries:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_1=0
```

and

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b_2=0
```

and we derived their perpendicular distance:

```math
d=
\frac{|b_2-b_1|}{\|\overrightarrow{w}\|}
```

But there is still one major thing missing.

> **Where are the actual data points?**

This is where Chapter 4 starts becoming a genuine **Machine Learning problem** rather than just geometry.

---

# 1. So Far, We Have Only Drawn Boundaries

Imagine:

```text
        Boundary 1
────────────────────────


        Boundary 2
────────────────────────
```

We can calculate the distance between them.

But ML doesn't give us boundaries alone.

ML gives us **data points**.

For example, suppose we are trying to classify whether a customer will buy a product.

Each customer can be represented by features:

```text
x₁ = age
x₂ = income
```

So one customer might be:

```math
\overrightarrow{x}^{(1)}
=
\begin{bmatrix}
25\\
50000
\end{bmatrix}
```

Another customer:

```math
\overrightarrow{x}^{(2)}
=
\begin{bmatrix}
42\\
90000
\end{bmatrix}
```

These are **data points**.

---

# 2. Our Dataset Has Two Things

For supervised classification, each training example has:

```text
Features                  Label
   ↓                        ↓
x⁽ⁱ⁾                       y⁽ⁱ⁾
```

For example:

| Data point | Features                   | Label |
| ---------- | -------------------------- | ----: |
| Customer 1 | $\overrightarrow{x}^{(1)}$ |  $+1$ |
| Customer 2 | $\overrightarrow{x}^{(2)}$ |  $-1$ |
| Customer 3 | $\overrightarrow{x}^{(3)}$ |  $+1$ |
| Customer 4 | $\overrightarrow{x}^{(4)}$ |  $-1$ |

The label tells us which class the point belongs to.

---

# 3. Let's Put the Data on Our Diagram

Now our picture becomes:

```text
                 +1 CLASS

            ●       ●
        ●       ●
             ●


────────────────────────────
        Decision Boundary
────────────────────────────


             ○
        ○         ○
            ○
       ○

                 -1 CLASS
```

Now we have an actual ML problem:

> **Find a boundary that separates the two groups.**

---

# 4. What Does the Boundary Tell Us?

Our decision boundary is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

Remember our notation rule:

### Here $\overrightarrow{x}$ is generic.

It means:

> Any point that lies exactly on this boundary satisfies the equation.

But our dataset contains specific points:

```math
\overrightarrow{x}^{(1)},
\overrightarrow{x}^{(2)},
\overrightarrow{x}^{(3)},\ldots
```

So for a particular training point $\overrightarrow{x}^{(i)}$, we can calculate:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
```

Now something interesting happens.

---

# 5. A Data Point Can Be on Either Side

Take a specific data point:

```math
\overrightarrow{x}^{(i)}
```

Calculate:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
```

There are three possibilities.

### Case 1 — Exactly on the boundary

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b=0
```

The point lies exactly on the boundary.

```text
        ●
        │
────────●────────
        │
```

---

### Case 2 — Positive

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0
```

The point lies on one side.

```text
        ●

        ●

───────────────
```

---

### Case 3 — Negative

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0
```

The point lies on the other side.

```text
───────────────

        ○

        ○
```

This is exactly the **Half-Space** idea we learned in the previous chapter.

---

# 6. Now We Can Classify

This gives us a very simple classification rule.

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b>0
\quad\Rightarrow\quad
\hat{y}^{(i)}=+1
```

and:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b<0
\quad\Rightarrow\quad
\hat{y}^{(i)}=-1
```

So the boundary is effectively asking every data point:

> **"Which side of me are you on?"**

---

# 7. 🎯 Ultimate Goal in ML

This is an important point to add to our permanent mental model.

We are no longer just asking:

> "Where is the boundary?"

We are now asking:

> **"Where are my data points relative to the boundary?"**

That changes everything.

Our goal becomes:

```text
Data points
     ↓
Place them relative to boundary
     ↓
Separate the classes
     ↓
Measure how far they are from boundary
     ↓
Prefer better separation
```

---

# 8. Let's Connect This to Distance

We already know the point-to-plane distance formula:

```math
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{x}+b
\right|
}{
\|\overrightarrow{w}\|
}
```

But now we have learned an important notation distinction.

If we want the distance of **one specific training point** $\overrightarrow{x}^{(i)}$, we should write:

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

Here:

* $\overrightarrow{x}^{(i)}$ = specific training data point
* $\overrightarrow{w}$ = normal vector of the decision boundary
* $b$ = position/offset of the boundary
* $d^{(i)}$ = distance of that specific point from the boundary

This notation is much clearer.

---

# 9. Visualizing One Data Point

Suppose:

```text
              ● x⁽ⁱ⁾
              │
              │
              │  d⁽ⁱ⁾
              │
              ↓
────────────────────────
       Decision Boundary
```

The shortest distance is perpendicular to the boundary.

And perpendicular direction is given by:


$\overrightarrow{w}$


Therefore:

```text
       x⁽ⁱ⁾
         ●
         │
         │
         ↓  w
         │
────────────────
```

This is exactly why the normal vector remains central to everything we're doing.

---

# 10. But Distance Alone Has a Problem

Now we reach an important conceptual issue.

Suppose we have:

```text
        +1 CLASS

       ●    ●
         ●

───────────────
    Boundary

         ○
       ○    ○

        -1 CLASS
```

The distance tells us **how far** a point is from the boundary.

But it doesn't tell us **which side** the point is on.

Because ordinary distance is always positive:

```text
distance = 2
```

doesn't tell us whether the point is:

```text
+2 units → one side
```

or:

```text
-2 units → other side
```

Geometrically, both have the same absolute distance:

```text
       ●
       │
       │ 2
       │
───────┼────────
       │
       │ 2
       │
       ○
```

This is going to become **very important in the next Part**.

---

# 11. Absolute Distance vs Signed Position

The ordinary distance formula gives us:

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

The absolute value makes the distance positive.

But ML needs something more.

We want to know:

> **Is this point on the correct side or the wrong side?**

So we will eventually need a **signed distance**.

Don't jump ahead yet.

For now, just recognize the problem:

```text
Absolute distance
      ↓
Tells us HOW FAR
      ❌
Doesn't tell us WHICH SIDE
```

---

# 12. Why Did We Introduce the Two Parallel Boundaries?

Now the pieces start connecting.

Earlier we had:

```text
Boundary 1
────────────────────

        separation

Boundary 2
────────────────────
```

Now we have actual data:

```text
       ●  ●  ●
         ●

────────────────────
    Boundary

         ○
       ○  ○
────────────────────
```

We want the boundaries to be positioned in such a way that the classes are **well separated**.

The data points tell us **where the classes actually are**.

The boundaries give us a way to describe the separation.

---

# 13. Static Notebook Visual — The Full Picture

This is a useful diagram for your `.md` notes:

```text
                         +1 CLASS

                    ●          ●
                ●       ●
                      ●

                         ↕
                         ↕ d⁽ⁱ⁾
                         ↕
                         ↓
              ─────────────────────
                    DECISION
                    BOUNDARY
              wᵀx + b = 0
              ─────────────────────

                    ○       ○
                ○       ○
                     ○

                         -1 CLASS
```

Then annotate:

```text
x⁽ⁱ⁾  → specific training data point

wᵀx⁽ⁱ⁾ + b
       ↓
position of x⁽ⁱ⁾ relative to boundary

> 0 → one side
= 0 → on boundary
< 0 → other side
```

---

# 14. ML Interpretation

This is the important transition:

### Geometry

```text
Point
  ↓
Plane
  ↓
Distance
```

becomes:

### Machine Learning

```text
Data point x⁽ⁱ⁾
       ↓
Decision boundary
       ↓
Distance from boundary
       ↓
How confidently separated is this point?
```

The closer a point is to the decision boundary, the less **comfortable separation** we have.

The farther it is, the more separation we have.

---

# 15. A Very Simple Real-World Analogy

Imagine a border between two countries.

```text
Country A

       👤
       👤

════════════════════
       BORDER
════════════════════

       👤
       👤

Country B
```

If a person is far away from the border:

> It's very clear which country they are in.

If a person is standing right next to the border:

> Their location is much closer to the decision boundary.

Similarly in ML:

```text
Far from boundary
       ↓
clearer separation

Close to boundary
       ↓
less separation
```

This intuition will become important when we discuss **margin**.

---

# 16. What We Have Achieved So Far

Let's pause and connect the entire journey.

### Previous chapters gave us:

```text
Plane
 ↓
Normal vector
 ↓
Distance
 ↓
Half-space
```

### Chapter 4 is now adding:

```text
Data points
 ↓
Which side?
 ↓
How far?
 ↓
How well separated?
```

So the overall journey is becoming:

```text
                LINEAR ALGEBRA
                     ↓
              Decision Boundary
                     ↓
                  Half-space
                     ↓
                 Data Points
                     ↓
              Classification
                     ↓
             Distance from Boundary
                     ↓
              Better Separation
                     ↓
                  Margin
```

---

# 🧠 Part 4 — What You Should Remember

### ① $\overrightarrow{x}^{(i)}$ is a specific data point

```math
\overrightarrow{x}^{(i)}
```

means:

> The $i$-th training example represented as a feature vector.

---

### ② The decision boundary is

```math
\overrightarrow{w}^{T}\overrightarrow{x}+b=0
```

Here $\overrightarrow{x}$ is **generic** and describes points on the boundary.

---

### ③ To evaluate a particular data point

We substitute $\overrightarrow{x}^{(i)}$:

```math
\overrightarrow{w}^{T}\overrightarrow{x}^{(i)}+b
```

---

### ④ Its sign tells us the side

```text
> 0 → one side
= 0 → boundary
< 0 → other side
```

---

### ⑤ Its absolute value helps us measure distance

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

---

## 🎯 Ultimate Goal in ML

> **We have now brought the actual training points into our geometric picture. The next step is to understand not only how far a point is from the boundary, but also which side it is on.**

That leads naturally to the next part:

# **Part 5 — Signed Distance and Classification**
