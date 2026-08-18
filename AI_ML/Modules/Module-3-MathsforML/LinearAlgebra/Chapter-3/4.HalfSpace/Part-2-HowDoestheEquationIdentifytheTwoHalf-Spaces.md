# Half Space

## Part 2 — How Does the Equation Identify the Two Half-Spaces?

In Part 1, we established the basic idea:

> A plane divides space into two regions, called **half-spaces**.

Now we need to answer the more important mathematical question:

> **How can an equation tell us which half-space a particular point belongs to?**

The key is the expression:

```math id="hs2-main"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

We will understand **why its sign changes across the plane**, rather than simply memorizing:

```text
f(x) > 0 → one side
f(x) < 0 → other side
```

---

# 2.1 First: The Plane Is the Zero Set

Our plane is:

```math id="hs2-plane"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Define:

```math id="hs2-function"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

Then the plane is simply the collection of all points for which:

```math id="hs2-zero"
\boxed{
f(\overrightarrow{x})=0
}
```

So we can think of the plane as:

> **The set of points where the function becomes zero.**

This is the first important idea.

---

# 2.2 A Very Simple Analogy: Number Line

Before dealing with a plane, consider the number:

```math id="hs2-number"
x=0
```

The number line is divided into:

```text id="hs2-numberline"
        negative       0       positive

←───────────────●───────────────→
                0
```

There are two sides:

```math id="hs2-neg"
x<0
```

and:

```math id="hs2-pos"
x>0
```

And the boundary is:

```math id="hs2-boundary"
x=0
```

Notice something:

```text
x < 0  → negative
x = 0  → boundary
x > 0  → positive
```

This exact idea gets generalized to lines and planes.

---

# 2.3 From One Dimension to Two Dimensions

Consider the line:

```math id="hs2-line"
\boxed{
x+y-4=0
}
```

Define:

```math id="hs2-f"
f(x,y)=x+y-4
```

The line is where:

```math id="hs2-line-zero"
f(x,y)=0
```

But everywhere else, $f$ is either positive or negative.

So the plane of possible points gets divided into:

```text id="hs2-2d"
               f(x,y)>0
                    ↑
                    │
                 /  │
                /   │
               /    │
──────────────/─────┼────────────
             LINE
                    │
                    ↓
               f(x,y)<0
```

The equation isn't merely describing the boundary.

It gives us a **test** for determining which side a point lies on.

---

# 2.4 Let's Test a Point

Take:

```math id="hs2-point-a"
A=
\begin{bmatrix}
5\\
2
\end{bmatrix}
```

Our function is:

```math id="hs2-fa"
f(\overrightarrow{x})
=
x+y-4
```

Substitute $A$:

```math id="hs2-fa2"
f(A)
=
5+2-4
```

Therefore:

```math id="hs2-fa3"
\boxed{
f(A)=3
}
```

Since:

```math id="hs2-fa4"
3>0
```

the point is on the **positive side**.

---

# 2.5 Test Another Point

Take:

```math id="hs2-point-b"
B=
\begin{bmatrix}
1\\
1
\end{bmatrix}
```

Then:

```math id="hs2-fb"
f(B)
=
1+1-4
=
-2
```

Therefore:

```math id="hs2-fb2"
\boxed{
f(B)<0
}
```

So $B$ lies on the **negative side**.

---

# 2.6 And a Point on the Boundary

Take:

```math id="hs2-point-c"
C=
\begin{bmatrix}
2\\
2
\end{bmatrix}
```

Then:

```math id="hs2-fc"
f(C)
=
2+2-4
=
0
```

Therefore:

```math id="hs2-fc2"
\boxed{
f(C)=0
}
```

So $C$ lies exactly on the boundary.

We now have:

```text id="hs2-three"
f(x) > 0  → one side
f(x) = 0  → boundary
f(x) < 0  → other side
```

---

# 2.7 But Why Does the Sign Stay the Same Within a Half-Space?

This is the deeper question.

Imagine moving a point around **without crossing the boundary**.

Suppose we start here:

```text id="hs2-move1"
        ●
```

and move around within the same region:

```text id="hs2-move2"
        ●──────●
       /        \
      ●          ●
```

We have not crossed the line.

The value of:

```math id="hs2-fagain"
f(\overrightarrow{x})
```

may change in magnitude:

```text
10 → 7 → 4 → 2 → 1
```

but it remains positive.

Why?

Because to go from positive to negative, the value must pass through zero.

And:

```math id="hs2-zero-again"
f(\overrightarrow{x})=0
```

means:

> **You are on the boundary.**

Therefore:

> **As long as you remain on the same side of the plane, the sign cannot change.**

---

# 2.8 Crossing the Plane Forces a Sign Change

Imagine walking toward the boundary.

```text id="hs2-cross"
Positive side

      ●
      │
      ●
      │
      ●
──────●──────────  Plane
      │
      ●
      │
      ●

Negative side
```

The function might behave like:

```text
+5
 ↓
+3
 ↓
+1
 ↓
 0    ← boundary
 ↓
-1
 ↓
-3
 ↓
-5
```

So the plane acts as the **zero-crossing boundary** of the function.

This is the mathematical reason the sign identifies the half-space.

---

# 2.9 Now Bring Back the Normal Vector

So far, we have used algebra.

Now let's understand the geometry.

Our function is:

```math id="hs2-dot"
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

The important part is:

```math id="hs2-wx"
\overrightarrow{w}^{T}\overrightarrow{x}
```

which is a dot product.

We know:

```math id="hs2-dot-form"
\overrightarrow{w}^{T}\overrightarrow{x}
=
\|\overrightarrow{w}\|
\|\overrightarrow{x}\|
\cos\theta
```

where $\theta$ is the angle between the vectors.

This is where the **direction of $\overrightarrow{w}$** becomes important.

---

# 2.10 What Does the Dot Product Tell Us?

Remember the basic intuition:

```text
dot product
    ↓
how much one vector points
along another vector
```

Therefore:

```math id="hs2-dot-interpret"
\overrightarrow{w}^{T}\overrightarrow{x}
```

contains information about how much $\overrightarrow{x}$ points in the direction of $\overrightarrow{w}$.

Since $\overrightarrow{w}$ is perpendicular to the plane:

```math id="hs2-normal"
\boxed{
\overrightarrow{w}\perp\text{plane}
}
```

the dot product helps us determine where a point lies **relative to the plane along the normal direction**.

---

# 2.11 A Very Important Correction

Be careful here.

We should **not** say:

> $\overrightarrow{w}^{T}\overrightarrow{x}$ directly gives the distance from the plane.

That is not generally true.

The actual perpendicular distance is:

```math id="hs2-distance"
\boxed{
d=
\frac{
|\overrightarrow{w}^{T}\overrightarrow{x}+w_0|
}{
\|\overrightarrow{w}\|
}
}
```

The expression:

```math id="hs2-score"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

is a **scaled signed quantity**.

After dividing by:

```math id="hs2-norm"
\|\overrightarrow{w}\|
```

we obtain the actual signed distance.

This distinction is important.

---

# 2.12 Signed Distance Gives Us Both Pieces of Information

Define:

```math id="hs2-signed"
\boxed{
d_{\text{signed}}
=
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
}
```

Now we get two pieces of information simultaneously.

### Sign

```text id="hs2-sign"
positive
   ↓
one side

negative
   ↓
other side
```

### Magnitude

```text id="hs2-mag"
|d_signed|
   ↓
actual perpendicular distance
```

So:

```text id="hs2-complete"
Signed distance
      │
      ├── sign → which side?
      │
      └── magnitude → how far?
```

This is one of the most useful mental models in this entire topic.

---

# 2.13 Why Does $\overrightarrow{w}$ Give the Orientation?

Recall our previous topic.

The plane:

```math id="hs2-plane2"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

has normal vector:

```math id="hs2-normal2"
\overrightarrow{w}
```

So imagine:

```text id="hs2-normal-picture"
                    w
                    ↑
                    │
                    │
                    │
────────────────────┼────────────────────
                  PLANE
────────────────────┼────────────────────
                    │
                    │
                    ↓
                  -w
```

The normal vector establishes an orientation.

One side is associated with:

```text id="hs2-plus"
+w
```

and the opposite side with:

```text id="hs2-minus"
-w
```

The sign of the equation tells us which side we're on relative to that orientation.

---

# 2.14 Positive Does Not Mean "Physically Up"

This is important.

Suppose:

```math id="hs2-w"
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

The positive side is not necessarily:

> "the upper side."

It means:

> **the side in the direction associated with $\overrightarrow{w}$.**

The plane could be tilted arbitrarily.

So don't memorize:

```text
positive = up
negative = down
```

Instead remember:

```text
positive
   ↓
side toward +w

negative
   ↓
side toward -w
```

---

# 2.15 What Happens If We Flip $\overrightarrow{w}$?

Consider:

```math id="hs2-original"
3x+4y-12=0
```

Now multiply everything by $-1$:

```math id="hs2-flipped"
-3x-4y+12=0
```

The boundary has **not moved**.

But the normal vector changed:

```math id="hs2-wflip"
\begin{bmatrix}
3\\
4
\end{bmatrix}
\quad\longrightarrow\quad
\begin{bmatrix}
-3\\
-4
\end{bmatrix}
```

Therefore the orientation flips.

And the sign of the function flips:

```math id="hs2-signflip"
f(\overrightarrow{x})
\quad\longrightarrow\quad
-f(\overrightarrow{x})
```

So:

```text id="hs2-flip-summary"
Same boundary
     +
opposite normal
     ↓
positive and negative labels swap
```

This is a subtle but extremely important point.

---

# 2.16 The Two Half-Spaces Mathematically

Now we can formally define them.

Given:

```math id="hs2-hyperplane"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

the two **open half-spaces** are:

### Positive half-space

```math id="hs2-positive"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

### Negative half-space

```math id="hs2-negative"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

And the boundary itself is:

```math id="hs2-boundary2"
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Together they partition the entire space.

---

# 2.17 Open vs Closed Half-Space

There is one mathematical detail worth knowing.

If we write:

```math id="hs2-openplus"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

the boundary is excluded.

That's an **open half-space**.

If we write:

```math id="hs2-closedplus"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\geq0
```

the boundary is included.

That's a **closed half-space**.

Similarly:

```math id="hs2-closedminus"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0\leq0
```

includes the boundary.

For ML classification, we often focus on the strict two-sided split:

```text id="hs2-open"
> 0
= 0
< 0
```

but it is useful to know the formal mathematical distinction.

---

# 2.18 Connection to Classification

Now the ML connection becomes almost obvious.

Suppose our classifier is:

```math id="hs2-classifier"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

We can define:

```text id="hs2-classes"
f(x) > 0
     ↓
Class 1

f(x) < 0
     ↓
Class 0
```

The boundary:

```math id="hs2-decision"
f(\overrightarrow{x})=0
```

separates them.

Therefore a linear classifier is, geometrically:

> **A mechanism that divides feature space into two half-spaces and assigns different labels to the two sides.**

This is the deeper meaning of a linear decision boundary.

---

# 2.19 Why This Is More Than Just a Mathematical Trick

Suppose our features are:

```text id="hs2-features"
x₁ = age
x₂ = income
x₃ = credit score
...
```

A data point becomes:

```math id="hs2-feature-vector"
\overrightarrow{x}
=
\begin{bmatrix}
x_1\\
x_2\\
x_3\\
\vdots
\end{bmatrix}
```

The classifier creates:

```math id="hs2-boundary3"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

That boundary divides the **feature space** into two regions.

So classification is essentially:

```text id="hs2-ml-flow"
Feature vector
      ↓
Locate point in feature space
      ↓
Evaluate wᵀx + w₀
      ↓
Check sign
      ↓
Identify half-space
      ↓
Assign class
```

This is the geometric interpretation of a linear classifier.

---

# 2.20 A Deeper Connection to Our Previous Distance Topic

We can now combine the two topics.

For a point $\overrightarrow{x}$:

### Step 1 — Evaluate the expression

```math id="hs2-score"
s=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

### Step 2 — Look at its sign

```text id="hs2-side"
s > 0 → one half-space
s < 0 → other half-space
s = 0 → boundary
```

### Step 3 — Look at its magnitude

```math id="hs2-distance2"
\boxed{
d=
\frac{|s|}
{\|\overrightarrow{w}\|}
}
```

So:

```text id="hs2-twoquestions"
                  s = wᵀx + w₀
                         │
                ┌────────┴────────┐
                ↓                 ↓
              Sign             Magnitude
                ↓                 ↓
           Which side?         How far?
```

This is probably the **single most important connection** between our last two topics.

---

# 2.21 🎯 Ultimate Goal in ML — In Layman Terms

Imagine a security gate dividing two areas.

```text id="hs2-gate"
         Allowed Area

────────────────────────
          GATE
────────────────────────

         Restricted Area
```

For every person, we ask:

> **Which side of the gate are they standing on?**

The mathematical model does exactly this with feature space.

```text id="hs2-ml-wall"
          Class 1

────────────────────────
      Decision Boundary
────────────────────────

          Class 0
```

The equation:

```math id="hs2-ml-equation"
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

acts like a **side detector**.

It tells us:

```text
positive → one side
negative → other side
zero     → exactly on boundary
```

And if we normalize it:

```math id="hs2-ml-distance"
\frac{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}{
\|\overrightarrow{w}\|
}
```

we get the **signed distance**.

So:

> **The classifier is essentially asking: "Which side of my invisible wall is this data point on, and how far is it from that wall?"**

That is the geometric intuition we want to carry forward.

---

# 2.22 A Very Important Mental Model

Don't memorize three unrelated formulas.

Remember this one expression:

```math id="hs2-one-expression"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

Then ask two questions.

### Question 1

**What is its sign?**

```text id="hs2-q1"
+ → one side
0 → boundary
− → other side
```

### Question 2

**What is its normalized magnitude?**

```math id="hs2-q2"
\boxed{
\frac{|f(\overrightarrow{x})|}
{\|\overrightarrow{w}\|}
}
```

Answer:

> **Perpendicular distance from the boundary.**

So one expression gives us both:

```text id="hs2-summary"
               f(x)
                 │
        ┌────────┴────────┐
        ↓                 ↓
      Sign            Magnitude
        ↓                 ↓
   Which side?         How far?
```

---

# 🔑 Part 2 Takeaways

### 1. Define the plane function

```math id="hs2-t1"
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

### 2. The plane is the zero set

```math id="hs2-t2"
\boxed{
f(\overrightarrow{x})=0
}
```

### 3. Positive value identifies one half-space

```math id="hs2-t3"
\boxed{
f(\overrightarrow{x})>0
}
```

### 4. Negative value identifies the other

```math id="hs2-t4"
\boxed{
f(\overrightarrow{x})<0
}
```

### 5. Zero means the point is on the boundary

```math id="hs2-t5"
\boxed{
f(\overrightarrow{x})=0
}
```

### 6. The sign is orientation-dependent

Flipping:

```math id="hs2-t6"
\overrightarrow{w}\rightarrow-\overrightarrow{w}
```

flips the sign labels, but **does not change the boundary itself**.

### 7. Normalized magnitude gives distance

```math id="hs2-t7"
\boxed{
d=
\frac{
|f(\overrightarrow{x})|
}{
\|\overrightarrow{w}\|
}
}
```

---

## One-Line Understanding

> **The equation $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ acts like a side detector: zero means the point is on the boundary, positive and negative mean opposite half-spaces, and after dividing its magnitude by $|\overrightarrow{w}|$, it becomes the actual perpendicular distance from the boundary.**

### Next: **Part 3 — Geometric Meaning of Positive and Negative Half-Spaces**

We will go one level deeper into **why positive corresponds to the side toward $\overrightarrow{w}$ and negative to the side toward $-\overrightarrow{w}$**, using the dot product and a carefully chosen reference point on the plane.

