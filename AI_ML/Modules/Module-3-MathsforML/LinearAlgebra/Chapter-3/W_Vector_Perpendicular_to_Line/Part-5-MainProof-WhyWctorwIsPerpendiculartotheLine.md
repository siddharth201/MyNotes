# Part 5 — Main Proof: Why $`\overrightarrow{w}`$ Is Perpendicular to the Line

This is the **central proof of the topic**.

In Part 4, we discovered the key idea:

> If two points lie on the same line, the vector joining them gives the direction of that line.

Now we will prove rigorously that the vector $`\overrightarrow{w}`$ in

```math id="p5-main"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

is perpendicular to that direction.

---

## 5.1 The Statement We Want to Prove

Consider the line:

```math id="p5-line"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

We want to prove:

```math id="p5-result"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

Equivalently, if $`\overrightarrow{d}`$ is any direction vector of the line, we want to prove:

```math id="p5-perp"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Why is this enough?

Because we already know:

> Two non-zero vectors whose dot product is zero are perpendicular.

So our entire proof reduces to showing:

```math id="p5-target"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

---

# 5.2 Choose Two Arbitrary Points on the Line

Take any two different points on the line.

Let their position vectors be:

```math id="p5-x1"
\overrightarrow{x}_1
```

and:

```math id="p5-x2"
\overrightarrow{x}_2
```

The important word here is **arbitrary**.

We are not choosing special points.

We are saying:

> Pick **any two points** that lie on the line.

Since both points lie on the line, both must satisfy the line equation.

Therefore:

```math id="p5-eq1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0=0
}
```

and:

```math id="p5-eq2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0=0
}
```

This is the only assumption we need.

---

# 5.3 Subtract the Two Equations

Now subtract the first equation from the second.

```math id="p5-subtract"
\left(
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0
\right)
-
\left(
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0
\right)
=
0
```

Let's simplify it step by step.

First, the two bias terms cancel:

```math id="p5-cancel"
w_0-w_0=0
```

So we are left with:

```math id="p5-after-cancel"
\overrightarrow{w}^{T}\overrightarrow{x}_2
-
\overrightarrow{w}^{T}\overrightarrow{x}_1
=
0
```

Using the distributive property of the dot product:

```math id="p5-factor"
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x}_2-\overrightarrow{x}_1
\right)
=
0
}
```

This is the **critical equation**.

---

# 5.4 Recognize the Direction Vector

Now look at:

```math id="p5-difference"
\overrightarrow{x}_2-\overrightarrow{x}_1
```

What is this?

From Part 1, we already established that the vector between two points is obtained by subtracting their position vectors.

Therefore:

```math id="p5-direction"
\boxed{
\overrightarrow{d}
=
\overrightarrow{x}_2-\overrightarrow{x}_1
}
```

is a direction vector of the line.

Substitute this into our previous result:

```math id="p5-substitution"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

---

# 5.5 Interpret the Dot Product

Recall the geometric interpretation of the dot product:

```math id="p5-dot-angle"
\overrightarrow{w}^{T}\overrightarrow{d}
=
\|\overrightarrow{w}\|
\|\overrightarrow{d}\|
\cos\theta
```

But we have just proved:

```math id="p5-zero"
\overrightarrow{w}^{T}\overrightarrow{d}=0
```

Therefore:

```math id="p5-cos-zero"
\|\overrightarrow{w}\|
\|\overrightarrow{d}\|
\cos\theta
=
0
```

Assuming both vectors are non-zero:

```math id="p5-cos"
\boxed{
\cos\theta=0
}
```

Therefore:

```math id="p5-angle"
\boxed{
\theta=90^\circ
}
```

Hence:

```math id="p5-vector-perp"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

But $`\overrightarrow{d}`$ points along the line.

Therefore:

```math id="p5-final"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

**Proved.**

---

# 5.6 The Complete Proof in One Chain

The entire proof can now be compressed into one logical sequence.

Two points lie on the line:

```math id="p5-chain1"
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0=0
```

```math id="p5-chain2"
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0=0
```

Subtract:

```math id="p5-chain3"
\overrightarrow{w}^{T}
\left(
\overrightarrow{x}_2-\overrightarrow{x}_1
\right)
=
0
```

But:

```math id="p5-chain4"
\overrightarrow{d}
=
\overrightarrow{x}_2-\overrightarrow{x}_1
```

Therefore:

```math id="p5-chain5"
\overrightarrow{w}^{T}\overrightarrow{d}=0
```

Hence:

```math id="p5-chain6"
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since **d** is along the line:

```math id="p5-chain7"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

---

# 5.7 Why Is the Proof So Powerful?

Notice that we never assumed that $`\overrightarrow{w}`$ was perpendicular.

We started only with the equation:

```math id="p5-start"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

and the definition of a point lying on the line.

The perpendicularity **emerged automatically**.

That is the important mathematical insight.

> **The normal-vector property of w is a consequence of the equation itself.**

It is not an additional rule that we simply attach to the equation.

---

# 5.8 Why Does the Bias Disappear?

There is another important idea hidden inside the proof.

We had:

```math id="p5-bias1"
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0=0
```

and:

```math id="p5-bias2"
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0=0
```

When we subtract:

```math id="p5-bias3"
w_0-w_0=0
```

So the bias disappears completely.

What remains is:

```math id="p5-bias4"
\overrightarrow{w}^{T}
\left(
\overrightarrow{x}_2-\overrightarrow{x}_1
\right)
=
0
```

This gives us a deeper understanding of the roles of the two parameters:

| Quantity       | Geometric role             |
| -------------- | -------------------------- |
| $`\overrightarrow{w}`$ | Determines the orientation |
| $`w_0`$        | Determines the position    |

Changing $`w_0`$ can move the line, but it cannot change the direction of the line.

---

# 5.9 A Numerical Verification

Let's verify the theorem using a simple line:

```math id="p5-num-line"
\boxed{
x_1+x_2+2=0
}
```

The corresponding normal/weight vector is:

```math id="p5-num-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
1\\
1
\end{bmatrix}
}
```

Let's choose two points on the line.

Take:

```text
A = (0, -2)
```

Check:

```math id="p5-check-a"
0+(-2)+2=0
```

So A lies on the line.

Take another point:

```text
B = (2, -4)
```

Check:

```math id="p5-check-b"
2+(-4)+2=0
```

So B also lies on the line.

---

## Find the Direction Vector

The direction from A to B is:

```math id="p5-num-d"
\overrightarrow{AB}
=
\begin{bmatrix}
2\\
-4
\end{bmatrix}
-
\begin{bmatrix}
0\\
-2
\end{bmatrix}
```

Therefore:

```math id="p5-num-d2"
\boxed{
\overrightarrow{AB}
=
\begin{bmatrix}
2\\
-2
\end{bmatrix}
}
```

Now calculate the dot product with $`\overrightarrow{w}`$:

```math id="p5-num-dot"
\overrightarrow{w}^{T}\overrightarrow{AB}
=
\begin{bmatrix}
1 & 1
\end{bmatrix}
\begin{bmatrix}
2\\
-2
\end{bmatrix}
```

Therefore:

```math id="p5-num-zero"
1(2)+1(-2)=0
```

Hence:

```math id="p5-num-result"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{AB}=0
}
```

Therefore $`\overrightarrow{w}`$ is perpendicular to the direction of the line.

---

# 5.10 The Geometry Behind the Algebra

The algebra is telling us something very simple geometrically:

```text
             w
             ↑
             │
             │
             │
             │
             ●──────────────→ direction of line
```

The line travels in the direction of **d**.

The vector **w** points across that direction.

Therefore they form a right angle.

I am deliberately not using an ASCII construction with coordinates here, because a poorly aligned diagram can be more confusing than useful. For your notebook, this is one of the diagrams worth recreating cleanly from your handwritten class notes.

---

# 5.11 The Theorem

We can now state the result formally.

### Theorem — Normal Vector of a Linear Boundary

For the line defined by:

```math id="p5-theorem-line"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the vector $`\overrightarrow{w}`$ is perpendicular to every direction vector of the line.

Therefore:

```math id="p5-theorem-result"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

This vector is called the **normal vector** of the line.

---

# 5.12 Why This Matters in Machine Learning

This theorem becomes extremely important when the same equation is used as a **decision boundary**.

Suppose a classifier has:

```math id="p5-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This boundary separates regions of the feature space.

The vector $`\overrightarrow{w}`$ is perpendicular to that boundary.

Therefore, $`\overrightarrow{w}`$ tells us the **orientation of the decision boundary**.

This gives us a very useful mental model:

```text
w
│
│  perpendicular
│
▼

Decision Boundary
────────────────────
```

Later, when we study linear classification, this geometric interpretation will become much more important.

---

# 🧠 The One Idea You Should Remember

If you remember only one derivation from this topic, remember this:

```math id="p5-memory1"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}_1+w_0=0
}
```

```math id="p5-memory2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}_2+w_0=0
}
```

Subtract:

```math id="p5-memory3"
\boxed{
\overrightarrow{w}^{T}
(\overrightarrow{x}_2-\overrightarrow{x}_1)=0
}
```

And because:

```math id="p5-memory4"
\boxed{
\overrightarrow{x}_2-\overrightarrow{x}_1
=
\overrightarrow{d}
}
```

we get:

```math id="p5-memory5"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math id="p5-memory6"
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

That's the entire proof.

---

## Part 5 — Final Takeaway

The statement:

> **"w is perpendicular to the line."**

is not something we memorize.

We can **derive it directly** from the equation of the line.

The reasoning is:

**Both points satisfy the line equation**

↓

**Subtract the equations**

↓

**Bias cancels**

↓

**Difference of the two points gives line direction**

↓

**Dot product with w is zero**

↓

**w is perpendicular to the line**

This is the key bridge between **linear algebra and the geometry of Machine Learning decision boundaries**.

