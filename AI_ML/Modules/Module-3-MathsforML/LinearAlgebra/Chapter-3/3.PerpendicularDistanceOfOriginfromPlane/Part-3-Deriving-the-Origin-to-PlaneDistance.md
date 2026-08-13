# Part 3 — Deriving the Origin-to-Plane Distance

Now we will derive the distance of the **origin from a plane**.

The most important point before starting:

> **We are not introducing a new distance concept. We are taking the point-to-plane distance formula that we already proved and applying it to one special point: the origin.**

This is exactly the kind of derivation we want in our notebook—**general result → special case → simplified result**.

---

# 3.1 Start With the Formula We Already Know

For a plane:

```math id="p3-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

the perpendicular distance of an arbitrary point $\overrightarrow{x}$ from the plane is:

```math id="p3-general-distance"
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

We derived this formula in the previous topic from **projection onto the normal vector**.

So there is no need to derive it again from scratch.

---

# 3.2 Now Replace the Point With the Origin

The origin is:

```math id="p3-origin"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

Therefore, in the general distance formula, substitute:

```math id="p3-substitute"
\overrightarrow{x}=\overrightarrow{0}
```

We get:

```math id="p3-after-sub"
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

Now the only thing we need to simplify is:

```math id="p3-zero-dot"
\overrightarrow{w}^{T}\overrightarrow{0}
```

---

# 3.3 Dot Product With the Zero Vector

Let:

```math id="p3-w"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2\\
\vdots\\
w_n
\end{bmatrix}
```

and:

```math id="p3-zero"
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0\\
\vdots\\
0
\end{bmatrix}
```

Their dot product is:

```math id="p3-dot"
\overrightarrow{w}^{T}\overrightarrow{0}
=
w_1(0)+w_2(0)+\cdots+w_n(0)
```

Every term is zero.

Therefore:

```math id="p3-dot-zero"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

---

# 3.4 Substitute Again

Our distance was:

```math id="p3-distance-before"
d=
\frac{
\left|
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
\right|
}{
\|\overrightarrow{w}\|
}
```

Since:

```math id="p3-zero"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

we get:

```math id="p3-distance-after"
d=
\frac{
|0+w_0|
}{
\|\overrightarrow{w}\|
}
```

Therefore:

```math id="p3-simplified"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

And this is our **origin-to-plane distance formula**.

---

# 3.5 Don't Memorize This Formula Yet

I want you to notice something important.

We did **not** learn:

```math id="p3-memorize"
d=\frac{|w_0|}{\|\overrightarrow{w}\|}
```

as a completely new formula.

Instead:

```text id="p3-derivation-flow"
General point-to-plane distance
            ↓
x = 0
            ↓
wᵀ0 = 0
            ↓
only w₀ remains
            ↓
d = |w₀| / ||w||
```

This is much more powerful than memorization.

If you forget the formula tomorrow, you can **reconstruct it in seconds**.

---

# 3.6 Why Does Only $w_0$ Remain?

This deserves a deeper explanation.

Our plane equation is:

```math id="p3-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

There are two parts:

```text id="p3-parts"
wᵀx
 ↓
depends on the point

w₀
 ↓
constant
```

For an arbitrary point, both parts matter.

But for the origin:

```math id="p3-origin"
\overrightarrow{x}=\overrightarrow{0}
```

there is no displacement from the coordinate origin.

Therefore:

```math id="p3-zero-contribution"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

So the only remaining term is:

```math id="p3-only-w0"
\boxed{
w_0
}
```

That's why the formula becomes so simple.

---

# 3.7 A Very Simple Real-World Analogy

Imagine a wall placed somewhere in a room.

Let's call the center/reference point of the room:

```text id="p3-room"
                 WALL
────────────────────────────

              ●
            Origin
```

The wall has:

* an **orientation** — which way the wall faces
* a **position** — how far it is from our reference point

In our mathematical model:

```text id="p3-wall"
w
↓
orientation of the wall

w₀
↓
position-related information
```

But $w_0$ alone is not yet the physical distance.

Why?

Because the equation can be scaled.

That's why we divide by:

```math id="p3-normal-norm"
\|\overrightarrow{w}\|
```

to get actual geometric distance.

---

# 3.8 Why Do We Still Need $|\overrightarrow{w}|$?

Suppose the plane is:

```math id="p3-plane1"
3x+4y-12=0
```

Now multiply the entire equation by $2$:

```math id="p3-plane2"
6x+8y-24=0
```

These are the **same plane**.

But notice:

```text id="p3-scale"
Original:

w = [3,4]
w₀ = -12


Scaled:

w = [6,8]
w₀ = -24
```

The value of $w_0$ changed.

Therefore:

> **$|w_0|$ by itself cannot be the geometric distance.**

The normal vector magnitude changed by the same factor.

Original:

```math id="p3-norm1"
\|\overrightarrow{w}\|
=
\sqrt{3^2+4^2}
=
5
```

Scaled:

```math id="p3-norm2"
\|\overrightarrow{w}\|
=
\sqrt{6^2+8^2}
=
10
```

Now look at the ratio:

```math id="p3-ratio1"
\frac{|w_0|}{\|\overrightarrow{w}\|}
=
\frac{12}{5}
```

and:

```math id="p3-ratio2"
\frac{|{-24}|}{10}
=
\frac{24}{10}
=
\frac{12}{5}
```

Same distance.

Therefore:

> **The ratio is geometrically meaningful even though the individual equation coefficients can be arbitrarily scaled.**

---

# 3.9 Numerical Example From the Handnotes

Let's use the example from your handnotes:

```math id="p3-example-plane"
\boxed{
3x+4y-12=0
}
```

The normal vector is:

```math id="p3-example-w"
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

```math id="p3-example-w0"
\boxed{
w_0=-12
}
```

We want the distance from:

```math id="p3-example-origin"
\boxed{
O=(0,0)
}
```

---

# 3.10 Apply the Formula

The origin-to-plane formula is:

```math id="p3-formula"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

Substitute:

```math id="p3-sub-example"
d=
\frac{|-12|}
{
\sqrt{3^2+4^2}
}
```

Numerator:

```math id="p3-numerator"
|-12|=12
```

Denominator:

```math id="p3-denominator"
\sqrt{3^2+4^2}
=
\sqrt{9+16}
=
\sqrt{25}
=
5
```

Therefore:

```math id="p3-final-example"
\boxed{
d=
\frac{12}{5}
}
```

or:

```math id="p3-decimal"
\boxed{
d=2.4
}
```

So the perpendicular distance from the origin to the line is **2.4 units**.

Your handnotes use this same example and arrive at $12/5$. 

---

# 3.11 Visualising the Example

The line is:

```math id="p3-line"
3x+4y-12=0
```

Rearranging:

```math id="p3-line-rearrange"
4y=-3x+12
```

so:

```math id="p3-line-slope"
y=-\frac34x+3
```

The line crosses the $y$-axis at:

```text id="p3-intercept"
(0,3)
```

The origin is:

```text id="p3-origin-location"
(0,0)
```

Conceptually:

```text id="p3-visual"
          y
          ↑
      4   |
      3   ●──────────── Line
          |\
      2   | \
          |  \
      1   |   \
          |    \
      0   O─────\────────→ x
          0
```

But remember:

> The vertical distance from $(0,0)$ to $(0,3)$ is **not** the shortest distance.

The shortest distance must be **perpendicular to the line**.

And the normal vector:

```math id="p3-normal-example"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

points in exactly that perpendicular direction.

That's why the answer is:

```math id="p3-distance-example"
\boxed{
\frac{12}{5}=2.4
}
```

rather than $3$.

---

# 3.12 This Is a Very Important Visual Lesson

This example reinforces something we learned earlier:

> **The distance from a point to a line/plane is not necessarily vertical or horizontal.**

It is always:

```text id="p3-shortest"
Shortest path
     ↓
Perpendicular path
     ↓
Normal direction
```

So whenever you see:

```text
"distance from point to plane"
```

your brain should immediately think:

```text id="p3-brain"
NORMAL
  ↓
PERPENDICULAR
  ↓
SHORTEST DISTANCE
```

---

# 3.13 What If $w_0=0$?

Now let's test an important special case.

Suppose:

```math id="p3-through-origin"
\boxed{
3x+4y=0
}
```

Here:

```math id="p3-w0zero"
w_0=0
```

Therefore:

```math id="p3-distance-zero"
d=
\frac{|0|}
{\sqrt{3^2+4^2}}
=
0
```

So:

```math id="p3-result-zero"
\boxed{
d=0
}
```

That makes perfect geometric sense.

The line passes through the origin.

```text id="p3-origin-line"
          /
         /
        /
       O
      /
     /
```

Therefore the origin is already on the line.

No distance needs to be travelled.

---

# 3.14 What If $w_0$ Is Large?

Suppose:

```math id="p3-large-w0"
w_0=100
```

while $|\overrightarrow{w}|$ stays fixed.

Then:

```math id="p3-large-distance"
d=
\frac{100}{\|\overrightarrow{w}\|}
```

The boundary is farther from the origin.

So, intuitively:

```text id="p3-w0-intuition"
larger |w₀|
      ↓
boundary generally farther
from origin
```

But remember our earlier warning:

> We cannot interpret $|w_0|$ alone as distance because the scale of $\overrightarrow{w}$ also matters.

The correct quantity is always:

```math id="p3-correct"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 3.15 Connection With Signed Distance

Before taking absolute value, we have:

```math id="p3-signed"
\boxed{
d_{\text{signed}}
=
\frac{w_0}
{\|\overrightarrow{w}\|}
}
```

for the origin.

So:

```text id="p3-sign"
positive
   ↓
origin on one side

zero
   ↓
origin on plane

negative
   ↓
origin on opposite side
```

And ordinary distance is:

```math id="p3-ordinary"
\boxed{
d=
\left|
\frac{w_0}
{\|\overrightarrow{w}\|}
\right|
}
```

which is equivalent to:

```math id="p3-ordinary2"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Now let's connect this to the ML picture we have been building.

A linear model creates a boundary:

```math id="p3-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Imagine this as a wall in feature space.

The origin is our reference location.

```text id="p3-ml-wall"
             Decision Boundary
────────────────────────────────

                 ↑
                 │
                 │  distance
                 │
                 ●
               Origin
```

The distance:

```math id="p3-ml-distance"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

tells us:

> **How far the model's boundary is from the origin.**

This gives us an intuitive understanding of how the **bias term $w_0$ and weight-vector magnitude together determine the boundary's position relative to the origin.**

We will build on this when we study **half-space**, because then we'll stop asking only:

> "How far is the boundary?"

and start asking:

> **"Which side of the boundary is a point on?"**

---

# 🧠 Part 3 Mental Model

When you see:

```math id="p3-final-memory"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

don't think:

> "This is another formula I need to memorize."

Think:

```text id="p3-memory-flow"
General point-to-plane distance
              ↓
        point = origin
              ↓
          x = 0
              ↓
          wᵀx = 0
              ↓
          only w₀ remains
              ↓
     normalize by ||w||
              ↓
      take absolute value
              ↓
       actual distance
```

---

# 🔑 Part 3 Takeaways

### 1. General point-to-plane distance

```math id="p3-t1"
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

### 2. For the origin

```math id="p3-t2"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

### 3. Dot product disappears

```math id="p3-t3"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

### 4. Therefore

```math id="p3-t4"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

### 5. If $w_0=0$

```math id="p3-t5"
\boxed{
d=0
}
```

Therefore, the plane passes through the origin.

### 6. $|w_0|$ alone is not the distance.

We must normalize by:

```math id="p3-t6"
\boxed{
\|\overrightarrow{w}\|
}
```

---

## One-Line Understanding

> **The distance from the origin to a plane is simply the general point-to-plane distance formula evaluated at $\overrightarrow{x}=\overrightarrow{0}$, causing the dot-product term to vanish and leaving $\frac{|w_0|}{|\overrightarrow{w}|}$.**

### Next: **Part 4 — Why Does the Formula Become So Simple?**

We will go one level deeper into the meaning of the simplification—especially **why $w_0$ is the only term left, what it says about the plane's position, and why the normalization by $|\overrightarrow{w}|$ is essential**.

