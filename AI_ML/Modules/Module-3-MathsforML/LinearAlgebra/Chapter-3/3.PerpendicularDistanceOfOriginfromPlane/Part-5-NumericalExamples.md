
# Part 5 — Numerical Examples

Now that we understand **why** the formula becomes simple, let's make the formula feel natural through examples.

For a plane:

```math id="p5-formula"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the distance of the **origin** from the plane is:

```math id="p5-distance"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

The key idea is:

> **For the origin, we don't need to construct a separate point-to-plane vector. We simply identify $\overrightarrow{w}$ and $w_0$, then apply the formula.**

---

# Example 1 — The Handnote Example

Consider the line:

```math id="p5-ex1-line"
\boxed{
3x+4y-12=0
}
```

We want the perpendicular distance from the origin:

```math id="p5-ex1-origin"
O=(0,0)
```

---

## Step 1 — Identify $\overrightarrow{w}$

Compare:

```math id="p5-ex1-compare"
3x+4y-12=0
```

with:

```math id="p5-ex1-general"
w_1x+w_2y+w_0=0
```

Therefore:

```math id="p5-ex1-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

and:

```math id="p5-ex1-w0"
\boxed{
w_0=-12
}
```

---

## Step 2 — Calculate $|\overrightarrow{w}|$

```math id="p5-ex1-norm"
\|\overrightarrow{w}\|
=
\sqrt{3^2+4^2}
```

```math id="p5-ex1-norm2"
=
\sqrt{9+16}
```

```math id="p5-ex1-norm3"
=
5
```

---

## Step 3 — Apply the formula

```math id="p5-ex1-distance"
d=
\frac{|-12|}{5}
```

Therefore:

```math id="p5-ex1-answer"
\boxed{
d=\frac{12}{5}=2.4
}
```

So the origin is **2.4 units away** from the line.

This is the worked numerical example given in your handnotes. 

---

# Example 2 — A Plane in 3D

Now let's move from a 2D line to an actual 3D plane.

Consider:

```math id="p5-ex2-plane"
\boxed{
2x+3y+6z-12=0
}
```

We want the distance from:

```math id="p5-ex2-origin"
O=(0,0,0)
```

---

## Step 1 — Identify the normal vector

The coefficients of $x,y,z$ give us:

```math id="p5-ex2-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
2\\
3\\
6
\end{bmatrix}
}
```

and:

```math id="p5-ex2-w0"
\boxed{
w_0=-12
}
```

---

## Step 2 — Find the magnitude

```math id="p5-ex2-norm"
\|\overrightarrow{w}\|
=
\sqrt{2^2+3^2+6^2}
```

```math id="p5-ex2-norm2"
=
\sqrt{4+9+36}
```

```math id="p5-ex2-norm3"
=
\sqrt{49}
=
7
```

---

## Step 3 — Distance

```math id="p5-ex2-distance"
d=
\frac{|-12|}{7}
```

Therefore:

```math id="p5-ex2-answer"
\boxed{
d=\frac{12}{7}
}
```

Approximately:

```math id="p5-ex2-decimal"
\boxed{
d\approx1.714
}
```

---

# Visualising Example 2

The important thing is **not** to imagine a 3D coordinate calculation.

Instead, imagine:

```text id="p5-ex2-visual"
                    Origin
                       ●
                       │
                       │
                       │  shortest distance
                       │
                       ●
              ─────────┼─────────
                    Plane
                       ↑
                       │
                       w
```

The distance is measured along the normal direction.

That is why $\overrightarrow{w}$ appears in the denominator.

---

# Example 3 — When the Plane Passes Through the Origin

Consider:

```math id="p5-ex3-plane"
\boxed{
2x+3y+6z=0
}
```

Notice that there is no constant term.

Therefore:

```math id="p5-ex3-w0"
\boxed{
w_0=0
}
```

The distance is:

```math id="p5-ex3-distance"
d=
\frac{|0|}
{\sqrt{2^2+3^2+6^2}}
```

Therefore:

```math id="p5-ex3-answer"
\boxed{
d=0
}
```

### Why?

Because the plane passes through the origin.

We can verify directly:

```math id="p5-ex3-check"
2(0)+3(0)+6(0)=0
```

So:

```text id="p5-ex3-meaning"
Origin
  ●
  │
  │  already on plane
  │
──────────── Plane
```

There is no distance to travel.

---

# Example 4 — A Different $w_0$, Same Normal Direction

Consider two planes:

```math id="p5-ex4-plane1"
3x+4y-12=0
```

and:

```math id="p5-ex4-plane2"
3x+4y-20=0
```

Notice something important.

Both have:

```math id="p5-ex4-w"
\boxed{
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
}
```

Therefore they have the **same normal direction**.

So geometrically they are parallel.

```text id="p5-ex4-parallel"
──────────────────────────  Plane 1


──────────────────────────  Plane 2
```

Only $w_0$ changed.

---

## Plane 1

```math id="p5-ex4-d1"
d_1=
\frac{12}{5}
=
2.4
```

## Plane 2

```math id="p5-ex4-d2"
d_2=
\frac{20}{5}
=
4
```

So:

```math id="p5-ex4-results"
\boxed{
d_1=2.4
}
```

and:

```math id="p5-ex4-results2"
\boxed{
d_2=4
}
```

### What changed?

```text id="p5-ex4-change"
Same w
 ↓
Same orientation

Different w₀
 ↓
Different position
 ↓
Different distance from origin
```

This is one of the most important geometric meanings of $w_0$.

---

# Example 5 — Same Plane, Different Equation

Now let's test something we discussed in Part 4.

Consider:

```math id="p5-ex5-original"
3x+4y-12=0
```

We already know:

```math id="p5-ex5-d1"
d=\frac{12}{5}
```

Now multiply the entire equation by $2$:

```math id="p5-ex5-scaled"
6x+8y-24=0
```

This is **the same line**.

Now:

```math id="p5-ex5-w"
\overrightarrow{w}
=
\begin{bmatrix}
6\\
8
\end{bmatrix}
```

and:

```math id="p5-ex5-w0"
w_0=-24
```

Magnitude:

```math id="p5-ex5-norm"
\|\overrightarrow{w}\|
=
\sqrt{6^2+8^2}
=
10
```

Distance:

```math id="p5-ex5-distance"
d=
\frac{24}{10}
```

```math id="p5-ex5-answer"
\boxed{
d=2.4
}
```

Exactly the same.

### Important lesson

```text id="p5-ex5-lesson"
Equation coefficients
       ↓
can be scaled

Geometry
       ↓
doesn't change
```

That's why we need the normalization by $|\overrightarrow{w}|$.

---

# Example 6 — Negative $w_0$

Consider:

```math id="p5-ex6-plane"
\boxed{
x+2y+2z+9=0
}
```

Here:

```math id="p5-ex6-w"
\overrightarrow{w}
=
\begin{bmatrix}
1\\
2\\
2
\end{bmatrix}
```

and:

```math id="p5-ex6-w0"
w_0=9
```

Magnitude:

```math id="p5-ex6-norm"
\|\overrightarrow{w}\|
=
\sqrt{1^2+2^2+2^2}
=
\sqrt{9}
=
3
```

Therefore:

```math id="p5-ex6-distance"
d=
\frac{|9|}{3}
```

```math id="p5-ex6-answer"
\boxed{
d=3
}
```

Notice that $w_0$ happens to be positive here.

If it were $-9$ instead, the ordinary distance would **still be 3**.

That is because:

```math id="p5-ex6-absolute"
|-9|=|9|=9
```

---

# 5.7 What Have These Examples Actually Taught Us?

Let's compare them.

| Situation                                         | What happens?                                  |                                            |                                 |
| ------------------------------------------------- | ---------------------------------------------- | ------------------------------------------ | ------------------------------- |
| $w_0=0$                                           | Plane passes through origin                    |                                            |                                 |
| Increase $                                        | w_0                                            | $ while keeping $\overrightarrow{w}$ fixed | Plane moves farther from origin |
| Change $\overrightarrow{w}$ direction             | Plane orientation changes                      |                                            |                                 |
| Multiply entire equation by a constant            | Same plane                                     |                                            |                                 |
| Change sign of entire equation                    | Same plane, opposite normal orientation        |                                            |                                 |
| $|\overrightarrow{w}|$ changes because of scaling | Distance remains unchanged after normalization |                                            |                                 |

This is much more important than memorizing individual examples.

---

# 5.8 A Very Useful Comparison

Consider:

```math id="p5-comparison1"
3x+4y-12=0
```

and:

```math id="p5-comparison2"
6x+8y-24=0
```

At first glance, the numbers look different.

But geometrically:

```text id="p5-comparison"
Same normal direction
        ↓
Same orientation
        ↓
Same line
        ↓
Same distance from origin
```

Now compare:

```math id="p5-comparison3"
3x+4y-20=0
```

Here:

```text id="p5-comparison4"
Same normal direction
        ↓
Same orientation
        ↓
Different position
        ↓
Different distance from origin
```

This distinction is extremely important.

---

# 5.9 A Shortcut for Exams and Interviews

Given:

```math id="p5-shortcut-plane"
a_1x_1+a_2x_2+\cdots+a_dx_d+c=0
```

the distance of origin is immediately:

```math id="p5-shortcut-distance"
\boxed{
d=
\frac{|c|}
{
\sqrt{
a_1^2+a_2^2+\cdots+a_d^2
}
}
}
```

Because:

```math id="p5-shortcut-w"
\overrightarrow{w}
=
\begin{bmatrix}
a_1\\
a_2\\
\vdots\\
a_d
\end{bmatrix}
```

and:

```math id="p5-shortcut-w0"
w_0=c
```

But remember:

> **Use the shortcut because you understand the derivation—not because it is a formula to blindly memorize.**

---

# 5.10 A Mini Practice Example

Try this mentally:

```math id="p5-practice"
\boxed{
5x+12y-13=0
}
```

Find the distance of the origin.

### Step 1

```math id="p5-practice-w"
\overrightarrow{w}
=
\begin{bmatrix}
5\\
12
\end{bmatrix}
```

### Step 2

```math id="p5-practice-w0"
w_0=-13
```

### Step 3

```math id="p5-practice-norm"
\|\overrightarrow{w}\|
=
\sqrt{5^2+12^2}
=
13
```

### Step 4

```math id="p5-practice-answer"
d=
\frac{|-13|}{13}
```

Therefore:

```math id="p5-practice-final"
\boxed{
d=1
}
```

This is a nice example because the numbers make the geometry easy to calculate.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Now translate our examples into the ML picture.

A linear decision boundary:

```math id="p5-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

can move around in feature space.

Think of $\overrightarrow{w}$ as determining:

> **Which way the wall is facing.**

Think of $w_0$ as helping determine:

> **Where the wall is positioned.**

And:

```math id="p5-ml-distance"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

tells us:

> **How far that wall is from the origin.**

So our numerical examples are actually teaching us something about **the geometry of a linear ML model**.

---

# 🧠 Part 5 Mental Model

When you see:

```math id="p5-memory"
ax+by+c=0
```

don't immediately calculate.

First mentally identify:

```text id="p5-memory-flow"
[a,b]
 ↓
normal direction

c
 ↓
constant / position-related term

|c| / √(a²+b²)
 ↓
distance of origin
```

For higher dimensions, exactly the same idea applies.

---

# 🔑 Part 5 Takeaways

### General origin-distance formula

```math id="p5-final-formula"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

### For:

```math id="p5-2d-form"
ax+by+c=0
```

we have:

```math id="p5-2d-distance"
\boxed{
d=
\frac{|c|}
{\sqrt{a^2+b^2}}
}
```

### For:

```math id="p5-3d-form"
ax+by+cz+d=0
```

we have:

```math id="p5-3d-distance"
\boxed{
d=
\frac{|d|}
{\sqrt{a^2+b^2+c^2}}
}
```

Notice the unfortunate notation collision: in the 3D coordinate formula, the constant is often called $d$, while the distance is also commonly called $d$. In our notebook, **we will prefer $w_0$ for the constant and $d$ for distance** to avoid this confusion.

---

## One-Line Understanding

> **The numerical examples show that the origin-to-plane distance depends on the plane's constant term relative to the magnitude of its normal vector—not on the arbitrary way we choose to scale the plane equation.**

### Next: **Part 6 — Geometric Interpretation**

Here we will stop calculating for a moment and build the **visual picture**: why the normal vector gives the shortest path, what changing $\overrightarrow{w}$ actually does to the plane, and what $w_0$ does geometrically.
