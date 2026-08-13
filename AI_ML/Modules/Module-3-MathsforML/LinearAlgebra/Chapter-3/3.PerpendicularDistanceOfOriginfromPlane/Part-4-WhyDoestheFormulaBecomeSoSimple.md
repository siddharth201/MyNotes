# Part 4 — Why Does the Formula Become So Simple?

We have derived:

```math id="p4-final"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

At first glance, this looks almost surprisingly simple.

You may wonder:

> **How can the distance from a plane to the origin depend only on $w_0$ and $|\overrightarrow{w}|$? What happened to the coordinates of the origin? What does $w_0$ actually represent?**

This part is about answering those questions **geometrically**, not just algebraically.

---

# 4.1 First: What Made the Formula Simple?

Our general formula was:

```math id="p4-general"
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

For the origin:

```math id="p4-origin"
\overrightarrow{x}=\overrightarrow{0}
```

So:

```math id="p4-zero"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

and therefore:

```math id="p4-simple"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

Algebraically, that's the entire simplification.

But **why does this make geometric sense?**

That's what we explore now.

---

# 4.2 The Origin Has No Coordinates to Contribute

Consider a normal vector:

```math id="p4-w"
\overrightarrow{w}
=
\begin{bmatrix}
w_1\\
w_2
\end{bmatrix}
```

and an arbitrary point:

```math id="p4-point"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
```

Their dot product is:

```math id="p4-dot"
\overrightarrow{w}^{T}\overrightarrow{x}
=
w_1x_1+w_2x_2
```

The point's coordinates participate in the calculation.

But the origin is:

```math id="p4-origin-vector"
\overrightarrow{0}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
```

Therefore:

```math id="p4-origin-dot"
w_1(0)+w_2(0)=0
```

So there is simply **nothing for $\overrightarrow{w}$ to interact with**.

That's the most basic reason the first term disappears.

---

# 4.3 Layman Interpretation: "No Movement"

Think of $\overrightarrow{x}$ as describing a location relative to the origin.

For example:

```math id="p4-location"
\overrightarrow{x}
=
\begin{bmatrix}
5\\
2
\end{bmatrix}
```

means:

```text
Move 5 units in one coordinate direction
and
2 units in another.
```

But the origin means:

```math id="p4-zero-location"
\overrightarrow{x}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
```

There is **no movement at all**.

So when we ask for the origin's contribution along the normal direction, the answer is zero.

This is why:

```math id="p4-zero-contribution"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

---

# 4.4 Now Focus on $w_0$

After the point-dependent term disappears, our plane equation evaluated at the origin becomes:

```math id="p4-w0-eval"
\boxed{
w_0
}
```

This means something very useful:

> **$w_0$ tells us what the plane equation evaluates to at the origin.**

Let's see why that matters.

The plane itself consists of points satisfying:

```math id="p4-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

So if we plug in the origin:

```math id="p4-origin-plane-test"
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
=
w_0
```

Therefore:

```text id="p4-w0-test"
w₀ = 0
   ↓
origin satisfies plane equation
   ↓
origin is ON the plane
```

Whereas:

```text id="p4-w0-test2"
w₀ ≠ 0
   ↓
origin does not satisfy plane equation
   ↓
origin is NOT on the plane
```

This is already a very useful geometric interpretation of $w_0$.

---

# 4.5 $w_0$ Is Not the Distance

This distinction is extremely important.

Suppose:

```math id="p4-w0-value"
w_0=-12
```

It would be tempting to say:

> "The origin is 12 units away."

That is **wrong**.

Why?

Because the magnitude of $\overrightarrow{w}$ matters.

The actual distance is:

```math id="p4-distance"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So $w_0$ is better thought of as:

> **A signed value produced by the plane equation at the origin.**

The normalization converts that value into an actual geometric distance.

---

# 4.6 Why Is Normalization Necessary?

Let's use a very important example.

Consider:

```math id="p4-plane-original"
\boxed{
3x+4y-12=0
}
```

Here:

```math id="p4-w-original"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

and:

```math id="p4-w0-original"
w_0=-12
```

The distance from the origin is:

```math id="p4-distance-original"
d=
\frac{12}{5}
=
2.4
```

Now multiply the **entire equation** by $10$:

```math id="p4-plane-scaled"
30x+40y-120=0
```

This is the **same line**.

Nothing geometrically changed.

But now:

```math id="p4-scaled-w"
\overrightarrow{w}
=
\begin{bmatrix}
30\\
40
\end{bmatrix}
```

and:

```math id="p4-scaled-w0"
w_0=-120
```

If $|w_0|$ itself represented distance, we would get:

```math id="p4-wrong"
120
```

which is obviously wrong.

The actual distance is:

```math id="p4-scaled-distance"
d=
\frac{120}
{\sqrt{30^2+40^2}}
```

```math id="p4-scaled-distance2"
=
\frac{120}{50}
```

```math id="p4-scaled-distance3"
=
2.4
```

Exactly the same distance.

---

# 4.7 The Deep Meaning of the Denominator

This teaches us something fundamental:

> **The coefficients in a plane equation are not inherently measured in units of distance.**

We are free to multiply the equation by any non-zero constant.

Therefore, the raw value $w_0$ depends on how we chose to write the equation.

But:

```math id="p4-invariant"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

doesn't change when the whole equation is rescaled.

So this ratio represents the **actual geometry**.

---

# 4.8 Think of $\overrightarrow{w}$ as a Ruler With an Arbitrary Scale

Here's a useful mental model.

Imagine I tell you:

> "The wall is 20 units away."

But you discover that my "unit" is twice as large as yours.

The number alone isn't enough.

You need to know the scale.

In our plane equation:

```text id="p4-scale"
w₀
 ↓
raw signed quantity

||w||
 ↓
scale of the normal vector

|w₀| / ||w||
 ↓
actual distance
```

So the denominator acts like a **normalization of the measuring scale**.

---

# 4.9 Another Way to See It: Unit Normal Vector

We already learned unit vectors.

Let's use that knowledge.

The unit vector in the normal direction is:

```math id="p4-unit-normal"
\boxed{
\widehat{w}
=
\frac{
\overrightarrow{w}
}{
\|\overrightarrow{w}\|
}
}
```

It has:

```math id="p4-unit-length"
\boxed{
\|\widehat{w}\|=1
}
```

So when we divide by $|\overrightarrow{w}|$, we are essentially saying:

> **"Measure along a normal direction whose length scale is exactly 1."**

That is why the result becomes an actual distance.

This connects directly to our earlier topic:

**Unit Vector → Projection → Perpendicular Distance.**

---

# 4.10 Why Is the Normal Direction the Correct Direction?

Remember our previous topic.

The shortest distance from a point to a plane must be perpendicular to the plane.

And $\overrightarrow{w}$ is perpendicular to the plane.

Therefore:

```text id="p4-normal-distance"
                    Origin
                       ●
                       |
                       |  shortest distance
                       |
                       ●
───────────────────────┼──────────
                      Plane
                       ↑
                       |
                       w
```

So the denominator $|\overrightarrow{w}|$ isn't some arbitrary mathematical correction.

It comes from the fact that **we are measuring along the normal direction**.

---

# 4.11 Why Does $w_0$ Control the Plane's Position?

Now we can build an important geometric intuition.

Consider:

```math id="p4-plane-family"
3x+4y-12=0
```

Now change only the constant:

```math id="p4-plane-family2"
3x+4y-20=0
```

The normal vector is still:

```math id="p4-same-w"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

Therefore, the **orientation remains the same**.

But the plane moves.

Conceptually:

```text id="p4-parallel-planes"
Plane 1
────────────────────


Plane 2
────────────────────


Plane 3
────────────────────
```

All have the same normal direction.

They are parallel.

Changing $w_0$ changes **where the plane is located**.

---

# 4.12 This Is Extremely Important for ML

Now replace "plane" with "decision boundary."

Our linear ML boundary is:

```math id="p4-ml-boundary"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Think of it as a wall.

```text id="p4-ml-wall"
             w
             ↑
             │
             │
────────────────────────
     Decision Boundary
────────────────────────
```

The weight vector:

```math id="p4-ml-w"
\overrightarrow{w}
```

determines the **orientation**.

The bias:

```math id="p4-ml-bias"
w_0
```

helps determine the **position**.

So:

```text id="p4-ml-roles"
w
↓
Which way is the wall facing?

w₀
↓
Where is the wall located?
```

This is a much better mental model than simply memorizing:

> "Weights and bias go into the equation."

---

# 4.13 A Real-World Wall Analogy

Imagine a large glass wall in a room.

You can change two things.

### Rotate the wall

```text
Before:

│

After:

/
```

This changes its orientation.

Mathematically, this is related to changing:

```math id="p4-rotate"
\overrightarrow{w}
```

### Slide the wall

```text
Before:

│

After:

       │
```

The orientation remains the same, but the location changes.

This is related to changing:

```math id="p4-slide"
w_0
```

This analogy isn't the full algebra, but it is an excellent visual anchor.

---

# 4.14 What Happens When $w_0=0$?

If:

```math id="p4-w0-zero"
w_0=0
```

our plane becomes:

```math id="p4-through-origin"
\overrightarrow{w}^{T}\overrightarrow{x}=0
```

And the origin satisfies this automatically:

```math id="p4-origin-satisfy"
\overrightarrow{w}^{T}\overrightarrow{0}=0
```

Therefore:

```math id="p4-distance-zero"
\boxed{
d=0
}
```

So:

> **$w_0=0$ means the plane passes through the origin.**

This is one of the most useful quick observations to remember.

---

# 4.15 What Happens When $w_0\neq0$?

Then:

```math id="p4-not-origin"
\overrightarrow{w}^{T}\overrightarrow{0}+w_0
=
w_0
\neq0
```

Therefore:

> The origin is not on the plane.

And its distance is:

```math id="p4-distance-nonzero"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

So we can summarize:

```text id="p4-summary-w0"
w₀ = 0
 ↓
plane passes through origin
 ↓
distance = 0


w₀ ≠ 0
 ↓
plane does not pass through origin
 ↓
distance > 0
```

---

# 4.16 One Subtle Point: $w_0$ Depends on the Equation's Scale

Suppose:

```math id="p4-equation-a"
2x+4y-8=0
```

and:

```math id="p4-equation-b"
x+2y-4=0
```

These describe the same line.

But:

```text id="p4-different-coefficients"
Equation A:
w₀ = -8

Equation B:
w₀ = -4
```

So you should **not** think:

> "The plane has a fixed $w_0$."

More accurately:

> **A particular representation of the plane has a particular $w_0$.**

The geometric distance is independent of this representation because of normalization.

This distinction becomes very important later in ML when we discuss model parameters.

---

# 4.17 The Whole Simplification in One Picture

Here's the entire story:

```text id="p4-whole"
GENERAL POINT

             ● x
             |
             |
             |
─────────────┼──────────── Plane
             ↑
             w

Distance:
|wᵀx + w₀| / ||w||


SPECIAL POINT = ORIGIN

             ●
            Origin
             |
             |
─────────────┼──────────── Plane

x = 0

wᵀx = wᵀ0 = 0

Therefore:

Distance:
|w₀| / ||w||
```

The formula becomes simple **because the origin has no coordinate displacement**.

---

# 🎯 Ultimate Goal in ML — In Simple Terms

Imagine feature space as a huge room.

The model creates a wall:

```text id="p4-ml-room"
       Class A
          ●

────────────────────────
      MODEL BOUNDARY
────────────────────────

          ●
       Class B
```

The origin is the reference point of that room.

Now:

```math id="p4-ml-origin-distance"
\boxed{
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

answers:

> **"How far is the model's boundary from the reference origin?"**

And the deeper ML interpretation is:

```text id="p4-ml-meaning"
w
↓
orientation of boundary

w₀
↓
position of boundary

|w₀| / ||w||
↓
actual distance of boundary
from origin
```

This is the first time we can really see the geometric meaning of the **bias term** rather than treating it as just another number in the equation.

---

# 🧠 Part 4 Mental Model

When you see:

```math id="p4-final-memory"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

translate it mentally as:

> **"The point is the origin, so the point-dependent part disappears. What remains tells us where the plane sits relative to the origin, and normalization converts that raw value into actual distance."**

Or even more simply:

```text id="p4-simple-memory"
Origin
  ↓
x = 0
  ↓
wᵀx = 0
  ↓
only w₀ remains
  ↓
normalize by ||w||
  ↓
actual distance
```

---

# 🔑 Part 4 Takeaways

### 1. The origin has no coordinate displacement

```math id="p4-t1"
\boxed{
\overrightarrow{x}=\overrightarrow{0}
}
```

### 2. Therefore:

```math id="p4-t2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{0}=0
}
```

### 3. The plane equation at the origin becomes:

```math id="p4-t3"
\boxed{
w_0
}
```

### 4. $w_0$ itself is **not** the distance.

The actual distance is:

```math id="p4-t4"
\boxed{
d=
\frac{|w_0|}
{\|\overrightarrow{w}\|}
}
```

### 5. The denominator removes arbitrary scaling of the plane equation.

### 6. $w_0=0$ means the plane passes through the origin.

### 7. In ML:

```text id="p4-t7"
w
↓
orientation

w₀
↓
position

|w₀| / ||w||
↓
distance of boundary from origin
```

---

## One-Line Understanding

> **The formula becomes simple because the origin has all-zero coordinates, so its dot product with the normal vector is zero; the remaining $w_0$ describes the plane's signed position relative to the origin, and dividing by $|\overrightarrow{w}|$ converts that scaled quantity into true geometric distance.**

### Next: **Part 5 — Numerical Examples**

We'll work through several examples—not just the $3x+4y-12=0$ example—so you can see how changing $\overrightarrow{w}$ and $w_0$ changes the distance, while the underlying geometry stays consistent.

