# Part 4 — The Key Geometric Question

In the previous parts, we established two important ideas:

1. A line has a **direction**.
2. The equation of the line can be written as:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

We also know that our final goal is to understand why $`\overrightarrow{w}`$ is perpendicular to the line.

But we should **not jump directly into the proof**.

First, let's ask the right geometric question.

---

## 4.1 Imagine Two Points on the Same Line

Suppose $`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$ are two different points lying on the same line.

Because both points lie on the line, both must satisfy the equation:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

and:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
}
```

This is the key starting point.

We haven't made any assumption about perpendicularity yet.

We are simply saying:

> **Every point on the line must satisfy the equation of that line.**

---

# 4.2 What Vector Represents the Direction of the Line?

We have already established this in Part 1.

If $`\overrightarrow{x_1}`$ and $`\overrightarrow{x_2}`$ are two points on the line, then the vector connecting them is:

```math
\boxed{
\overrightarrow{x_1}
\overrightarrow{x_2}

=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

This vector lies **along the line**.

Therefore:

```math
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
}
```

is a direction vector of the line.

This gives us something extremely useful.

We now have:

**Direction of the line**

```math
\overrightarrow{d}
=
\overrightarrow{x_2}-\overrightarrow{x_1}
```

and the vector appearing in the equation:

```math
\overrightarrow{w}
```

Our question becomes:

> **What is the relationship between these two vectors?**

---

# 4.3 The Key Move: Compare the Two Equations

We have:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

and:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
}
```

Now notice something interesting.

Both equations contain exactly the same $`w_0`$.

So what happens if we subtract the first equation from the second?

Let's do it carefully.

```math
\left(
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0
\right)
-
\left(
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0
\right)
=
0-0
```

The two $`w_0`$ terms cancel:

```math
\overrightarrow{w}^{T}\overrightarrow{x_2}
-
\overrightarrow{w}^{T}\overrightarrow{x_1}
=
0
```

Using the distributive property:

```math
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}
-
\overrightarrow{x_1}
\right)
=
0
}
```

But look carefully at the expression inside the parentheses.

It is exactly our direction vector:

```math
\boxed{
\overrightarrow{x_2}
-
\overrightarrow{x_1}
=
\overrightarrow{d}
}
```

Therefore:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

---

# 4.4 What Does This Equation Tell Us?

We already learned the geometric meaning of the dot product.

For two vectors:

```math
\boxed{
\overrightarrow{a}^{T}\overrightarrow{b}
=
\|\overrightarrow{a}\|
\|\overrightarrow{b}\|
\cos\theta
}
```

Therefore:

```math
\overrightarrow{w}^{T}\overrightarrow{d}=0
```

means:

```math
\|\overrightarrow{w}\|
\|\overrightarrow{d}\|
\cos\theta
=
0
```

Assuming both vectors are non-zero:

```math
\cos\theta=0
```

Therefore:

```math
\boxed{
\theta=90^\circ
}
```

And hence:

```math
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

Since $`\overrightarrow{d}`$ is a direction vector of the line:

```math
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

We have reached the central result.

---

# 4.5 Why Is This Such a Beautiful Result?

Notice what we **didn't** need to do.

We did not:

* calculate the slope of the line,
* calculate the slope of $`\overrightarrow{w}`$,
* use the negative reciprocal rule,
* draw a special triangle,
* assume that $`\overrightarrow{w}`$ is perpendicular.

Instead, we started only with:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

and the fact that two points belong to the line.

From that alone, perpendicularity emerged.

This is much more powerful than memorizing:

> "The coefficients of x and y form the normal vector."

We are actually seeing **why** that statement is true.

---

# 4.6 The Role of `w₀` Becomes Clear

There is another beautiful observation hidden in this derivation.

We started with:

```math
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
```

and:

```math
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
```

When we subtracted them:

```math
w_0-w_0=0
```

So $`w_0`$ completely disappeared.

This explains geometrically why $`w_0`$ **does not determine the orientation of the line**.

It only determines **where the line sits**.

The orientation comes from $`\overrightarrow{w}`$.

This is an important insight that is easy to miss if we only memorize the equation.

---

# 4.7 A Very Important Mental Model

Think of the equation:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

as having two separate jobs.

### `w`

Determines the **orientation**.

### `w₀`

Determines the **position**.

When we compare two points on the same line, the position term $`w_0`$ disappears.

What remains is:

```math
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}
-
\overrightarrow{x_1}
\right)
=
0
}
```

And the difference between the two points is precisely the **direction along the line**.

Therefore:

```text
line direction
       │
       ▼
x₂ − x₁
       │
       │  dot product = 0
       ▼
w
       │
       ▼
perpendicular
```

This is the core geometric idea behind the proof.

---

# 4.8 The Key Question Has Now Been Answered

We started Part 4 with:

> **If two points lie on the same line, what relationship must exist between the line's direction and w?**

We discovered:

```math
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}
-
\overrightarrow{x_1}
\right)
=
0
}
```

Since:

```math
\boxed{
\overrightarrow{x_2}
-
\overrightarrow{x_1}
=
\overrightarrow{d}
}
```

we obtain:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

Therefore:

```math
\boxed{
\overrightarrow{w}\perp\overrightarrow{d}
}
```

And because $`\overrightarrow{d}`$ points along the line:

```math
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

---

# 4.9 Why Part 5 Is Still Necessary

At this point, we have essentially discovered the proof.

So why do we need a separate **Part 5 — Main Proof**?

Because Part 4 was about **discovering the geometric idea**.

Part 5 will now present the result as a clean mathematical theorem:

> **For a line represented by the equation $`\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0`$, the vector $`\overrightarrow{w}`$ is perpendicular to the line.**

We will write the proof in a compact, rigorous form and then examine **every step** so that you can reproduce it in an exam or interview.

---

# 🧠 Part 4 — Mental Model

The entire idea can be remembered as:

```text
Two points on line
        ↓
x₁ and x₂
        ↓
Subtract their equations
        ↓
wᵀ(x₂ − x₁) = 0
        ↓
x₂ − x₁ is direction of line
        ↓
wᵀd = 0
        ↓
w ⟂ d
        ↓
w ⟂ line
```

The most important insight is:

> **The perpendicularity of w does not need to be assumed. It is a consequence of the fact that every point on the line satisfies the same linear equation.**

---

# 🔑 Part 4 Summary

We established:

### Two points on the line satisfy

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_1}+w_0=0
}
```

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x_2}+w_0=0
}
```

### Subtracting gives

```math
\boxed{
\overrightarrow{w}^{T}
\left(
\overrightarrow{x_2}
-
\overrightarrow{x_1}
\right)
=
0
}
```

### The difference is the direction vector

```math
\boxed{
\overrightarrow{d}
=
\overrightarrow{x_2}
-
\overrightarrow{x_1}
}
```

### Therefore

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{d}=0
}
```

### Hence

```math
\boxed{
\overrightarrow{w}\perp\text{line}
}
```

This is the central geometric bridge from **linear equations → vectors → perpendicularity → Machine Learning decision boundaries**.

