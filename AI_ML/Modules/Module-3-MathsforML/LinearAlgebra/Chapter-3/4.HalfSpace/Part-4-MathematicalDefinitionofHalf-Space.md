# Half Space

# Part 4 — Mathematical Definition of Half-Space

We have already built the intuition:

> A plane acts like a wall and divides the entire space into two sides.

We also established that the expression

```math
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

tells us which side a point belongs to.

Now we formalize that idea mathematically.

---

# 4.1 Start With the Boundary

Consider the hyperplane:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

This is our **boundary**.

Let's give it a name:

```math
\boxed{
H=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
\right\}
}
```

The notation means:

> $H$ is the set of all points $\overrightarrow{x}$ that satisfy the plane equation.

So:

```text
H
↓
all points lying exactly on the plane
```

---

# 4.2 The Positive Half-Space

Now consider all points for which:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

We can define:

```math
\boxed{
H^+
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

This is the **positive open half-space**.

In simple words:

> **$H^+$ contains all points on the side toward which $\overrightarrow{w}$ points.**

---

# 4.3 The Negative Half-Space

Similarly:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

defines the other side.

We write:

```math
\boxed{
H^-
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\right\}
}
```

This is the **negative open half-space**.

In simple words:

> **$H^-$ contains all points on the side opposite to $\overrightarrow{w}$.**

---

# 4.4 Put All Three Together

We now have three sets:

```text
                 H⁺
        Positive Half-Space

                ↑
                │
                │
════════════════════════════════
                │
             H = 0
              Plane
════════════════════════════════
                │
                │
                ↓

        Negative Half-Space
                 H⁻
```

Mathematically:

```math
\boxed{
H^+
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

```math
\boxed{
H
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
\right\}
}
```

```math
\boxed{
H^-
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\right\}
}
```

This is the formal mathematical definition of the two half-spaces and their boundary.

---

# 4.5 Why Are They Called "Half"-Spaces?

The word **half** comes from the fact that the hyperplane divides the entire space into two parts.

Conceptually:

```text
                 Entire Space

                      ↓

        ┌─────────────────────────┐
        │                         │
        │       H⁺                │
        │                         │
────────┼─────────────────────────┼──
        │         H               │
        │       Boundary          │
────────┼─────────────────────────┼──
        │                         │
        │       H⁻                │
        │                         │
        └─────────────────────────┘
```

Each half-space is infinite.

So don't interpret "half" as:

> exactly half the volume of some finite room.

It means:

> **one of the two regions created by a hyperplane.**

---

# 4.6 Why Do We Need the Inequality?

This is an important distinction.

The equation:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

identifies only the **boundary**.

But:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

identifies one **region**.

And:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

identifies the other region.

So:

```text
= 0
 ↓
boundary

> 0
 ↓
one region

< 0
 ↓
other region
```

This is why inequalities are fundamental to the definition of half-space.

---

# 4.7 Open Half-Space

Notice that we used:

```math
>
```

and:

```math
<
```

rather than:

```math
\geq
```

and:

```math
\leq
```

Why?

Because an **open half-space does not include the boundary**.

For example:

```math
\boxed{
H^+
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

contains only points strictly on the positive side.

The points satisfying:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

are excluded.

---

# 4.8 Closed Half-Space

We can also define a **closed half-space**.

Instead of:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

we use:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\geq0
}
```

Now the boundary is included.

So:

```math
\boxed{
H^+_{\text{closed}}
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\geq0
\right\}
}
```

Similarly:

```math
\boxed{
H^-_{\text{closed}}
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\leq0
\right\}
}
```

---

# 4.9 Open vs Closed — Simple Picture

### Open positive half-space

```text
             H⁺

              ↑
              │
              │
              │

──────────────○──────────────
              boundary

```

The boundary is **not included**.

### Closed positive half-space

```text
             H⁺

              ↑
              │
              │
              │
──────────────●──────────────
              boundary

```

The boundary **is included**.

The mathematical difference is simply:

```text
>   → boundary excluded
≥   → boundary included
```

---

# 4.10 Do We Need Open vs Closed for ML?

Usually, when we first study linear classification, the important distinction is:

```text
f(x) > 0
f(x) = 0
f(x) < 0
```

because we want to understand:

```text
positive side
boundary
negative side
```

Later, when dealing with mathematical optimization and constraints, the distinction between:

```math
f(\overrightarrow{x})\geq0
```

and:

```math
f(\overrightarrow{x})>0
```

becomes more important.

For our current ML journey:

> **Understand the geometry first; treat open/closed half-space as a formal mathematical refinement.**

---

# 4.11 A Concrete 2D Example

Consider:

```math
\boxed{
x+y-4=0
}
```

Our function is:

```math
\boxed{
f(x,y)=x+y-4
}
```

Therefore:

### Positive half-space

```math
\boxed{
x+y-4>0
}
```

or:

```math
\boxed{
x+y>4
}
```

### Boundary

```math
\boxed{
x+y-4=0
}
```

or:

```math
\boxed{
x+y=4
}
```

### Negative half-space

```math
\boxed{
x+y-4<0
}
```

or:

```math
\boxed{
x+y<4
}
```

So one line has created two regions.

---

# 4.12 Test Some Points

Let's use the same line:

```math
x+y-4=0
```

### Point A

```math
A=(5,2)
```

Evaluate:

```math
f(A)=5+2-4=3
```

Therefore:

```math
3>0
```

So:

```text
A ∈ H⁺
```

---

### Point B

```math
B=(1,1)
```

Evaluate:

```math
f(B)=1+1-4=-2
```

Therefore:

```math
-2<0
```

So:

```text
B ∈ H⁻
```

---

### Point C

```math
C=(2,2)
```

Evaluate:

```math
f(C)=2+2-4=0
```

Therefore:

```text
C ∈ H
```

It lies on the boundary.

---

# 4.13 The Set View Is Actually Very Powerful

Instead of thinking about a half-space as merely:

> "the left side" or "the right side"

we can think:

> **A half-space is a set of points satisfying an inequality.**

For example:

```math
\boxed{
H^+
=
\left\{
\overrightarrow{x}
\mid
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

This means:

> Take every possible point $\overrightarrow{x}$. Keep only those points for which the expression is positive.

Those points together form the positive half-space.

This set-based thinking becomes extremely useful in Machine Learning and optimization.

---

# 4.14 Why This Matters for ML

Now let's translate the mathematical definition into ML language.

Our linear decision boundary is:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

It divides feature space into:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

and:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

So a linear classifier is effectively saying:

> **"I have divided feature space into two regions, and I will assign different predictions to those two regions."**

For example:

```text
                Feature Space

             Class 1
           ●       ●
        ●

────────────────────────────────
       Decision Boundary
────────────────────────────────

        ●       ●
             Class 0
```

Mathematically:

```text
f(x) > 0 → Class 1
f(x) < 0 → Class 0
```

The particular labels are a modelling choice; the geometry is the important part.

---

# 4.15 🎯 Ultimate Goal in ML — Simple Terms

Let's keep our permanent section.

Imagine an invisible wall in feature space.

```text
       Class A

       ●   ●
          ●

════════════════════════
     Invisible Wall
════════════════════════

       ●
     ●   ●

       Class B
```

The wall is:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Everything on one side satisfies:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

Everything on the other side satisfies:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
```

So the **ultimate ML goal** is:

> **Use a mathematical boundary to divide feature space into regions so that data points on different sides can receive different predictions.**

That is the geometric foundation of linear classification.

---

# 4.16 Connection With Our Previous Topics

Look how nicely everything is connecting.

We started with vectors:

```text
Vector
 ↓
direction
```

Then:

```text
Dot Product
 ↓
alignment
```

Then:

```text
Projection
 ↓
component along a direction
```

Then:

```text
Normal Vector
 ↓
perpendicular to plane
```

Then:

```text
Point-to-Plane Distance
 ↓
perpendicular separation
```

And now:

```text
Half-Space
 ↓
which side of the plane?
```

So the journey is:

```text
Vector
  ↓
Dot Product
  ↓
Projection
  ↓
Normal Vector
  ↓
Plane
  ↓
Distance
  ↓
Half-Space
  ↓
Linear Classification
```

This is exactly why we are studying these topics in this order.

---

# 4.17 The Three Fundamental Questions

For any point $\overrightarrow{x}$ and hyperplane:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

we can now answer three different questions.

### Question 1 — Is it on the boundary?

Check:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

---

### Question 2 — Which side is it on?

Check the sign:

```math
\boxed{
\operatorname{sign}
\left(
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right)
}
```

---

### Question 3 — How far is it from the boundary?

Calculate:

```math
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

So:

```text
             Point X
                │
        ┌───────┼────────┐
        ↓       ↓        ↓
      On?     Which?    How far?
        │       │        │
        ↓       ↓        ↓
       =0    sign(...)  |...|/||w||
```

This is a very useful mental framework.

---

# 4.18 One Subtle Point: The Two Half-Spaces Depend on the Chosen Normal

Suppose:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

defines the boundary.

Then:

```math
-\overrightarrow{w}^{T}\overrightarrow{x}-w_0=0
```

defines **the same boundary**.

But:

```text
H⁺ ↔ H⁻
```

swap.

So mathematically:

> The physical division of space is fixed, but the names "positive" and "negative" depend on which direction we choose for $\overrightarrow{w}$.

This is why in ML, the sign convention must be interpreted consistently with the model's label convention.

---

# 4.19 Compact Mathematical Definition

For the hyperplane:

```math
\boxed{
H=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
\right\}
}
```

the associated open half-spaces are:

```math
\boxed{
H^+
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\right\}
}
```

and:

```math
\boxed{
H^-
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\right\}
}
```

The closed versions are:

```math
\boxed{
\overline{H}^{+}
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\geq0
\right\}
}
```

and:

```math
\boxed{
\overline{H}^{-}
=
\left\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\leq0
\right\}
}
```

---

# 🧠 Part 4 Mental Model

Don't try to memorize the set notation first.

Think:

```text
                 w
                 ↑
                 │
                 │
─────────────────┼─────────────────
               PLANE
─────────────────┼─────────────────
                 │
                 ↓
                -w
```

Then:

```text
+w side
   ↓
wᵀx + w₀ > 0

plane
   ↓
wᵀx + w₀ = 0

-w side
   ↓
wᵀx + w₀ < 0
```

Only after that translate it into set notation:

```math
H^+
=
\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
\}
```

and:

```math
H^-
=
\{
\overrightarrow{x}
:
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
\}
```

---

# 🔑 Part 4 Takeaways

### Half-space is a set of points satisfying an inequality.

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

or:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

### The boundary is defined by equality.

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### Open half-space

Boundary excluded:

```text
> 0
< 0
```

### Closed half-space

Boundary included:

```text
≥ 0
≤ 0
```

### ML interpretation

```text
Boundary
   ↓
Decision Boundary

Two half-spaces
   ↓
Two sides / regions

Sign
   ↓
Classification direction
```

---

## One-Line Understanding

> **A half-space is the set of all points satisfying one side of the plane's inequality: $\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0$ or $<0$; in ML, these two half-spaces represent the two regions created by a linear decision boundary.**

### Next: **Part 5 — Numerical Examples**

We will now practice the definition with carefully chosen 2D and 3D examples, including points **on the boundary, in the positive half-space, and in the negative half-space**, and then connect the sign to signed and ordinary distance.

