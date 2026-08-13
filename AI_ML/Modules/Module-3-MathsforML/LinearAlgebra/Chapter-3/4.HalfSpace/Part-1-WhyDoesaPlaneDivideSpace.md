# Half Space

## Part 1 — Why Does a Plane Divide Space?

We have just learned about the **distance of the origin from a plane**.

Now we are going to take the next natural step.

Previously, our question was:

> **"Where is the plane, and how far is the origin from it?"**

Now our question becomes:

> **"What happens to the space around the plane?"**

The answer is fundamental:

> **A plane acts like a boundary that divides the entire space into two regions.**

These regions are called **half-spaces**.

---

# 1.1 Start With Something We Can Visualize: A Line

Let's first forget about 3D planes.

Consider a line:

```math
\boxed{
x=0
}
```

This is the vertical line passing through the origin.

```text
                    y
                    ↑
                    │
      Left side     │     Right side
                    │
        ●           │           ●
                    │
        ●           │           ●
                    │
───────────────┬────┼──────────────→ x
               │    │
                    │
```

The line separates the 2D plane into two regions:

```text
             Line
               │
               │
    Region A   │   Region B
               │
               │
```

There is no way to go from the left region to the right region **without crossing the line**.

That is the basic idea of a boundary.

---

# 1.2 Now Move to 3D

Now replace the line with a plane.

Imagine a huge flat sheet:

```text
                 Plane
──────────────────────────────────
```

That plane divides 3D space into two regions:

```text
             Region A
                 ↑
                 │
──────────────────────────────────
                 │
                 ↓
             Region B
```

Each region extends infinitely.

These two regions are called:

```text
Half Space 1
     +
Half Space 2
```

---

# 1.3 Why Do We Call It "Half Space"?

This name can initially sound strange.

The plane does not literally give us two finite pieces of space.

Instead:

> **A plane divides the entire space into two infinite regions, each called a half-space.**

For example, imagine the Earth's equator.

It separates the Earth into:

```text
Northern side
──────────────
Equator
──────────────
Southern side
```

Each side is analogous to a half-space.

The mathematical half-spaces extend infinitely.

---

# 1.4 The Boundary Itself Is Not a Half-Space

This distinction is important.

Suppose:

```math
\boxed{
x=0
}
```

The line itself is the **boundary**.

The regions are:

```math
x>0
```

and:

```math
x<0
```

So:

```text
          x < 0       x = 0       x > 0
       Half-space    Boundary    Half-space

───────────────│────────────────────────
               │
```

Similarly, for a plane:

```text
Half-space A
     │
     ↓
────────────────── Plane ──────────────────
                                      ↑
                                      │
                               Half-space B
```

The plane is the **separator**.

---

# 1.5 Bring Back Our Plane Equation

Our plane is:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

Let's define:

```math
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

This function gives us a number for every point $\overrightarrow{x}$.

Now something very interesting happens.

For points **on the plane**:

```math
f(\overrightarrow{x})=0
```

because the plane equation is:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
```

So:

```text
f(x) = 0
   ↓
Point is ON the plane
```

---

# 1.6 What About Points Not on the Plane?

Take a point somewhere away from the plane.

Its value will generally not be zero.

It will either be:

```math
f(\overrightarrow{x})>0
```

or:

```math
f(\overrightarrow{x})<0
```

Therefore, space naturally gets divided into:

```text
                 f(x) > 0
                     │
                     │
─────────────────────┼────────────────────
                 f(x) = 0
                  PLANE
─────────────────────┼────────────────────
                     │
                     │
                 f(x) < 0
```

This is the mathematical foundation of **Half Space**.

---

# 1.7 Three Possibilities

For any point $\overrightarrow{x}$, there are exactly three cases.

### Case 1 — Positive

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
}
```

The point lies in one half-space.

---

### Case 2 — Zero

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

The point lies **on the plane**.

---

### Case 3 — Negative

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
}
```

The point lies in the other half-space.

So the plane creates a very simple classification:

```text
              Positive
                 ↑
                 │
─────────────────┼────────────────
                 │
               Plane
                 │
─────────────────┼────────────────
                 │
                 ↓
              Negative
```

---

# 1.8 The Layman Version

Imagine a wall.

You're standing somewhere in a room.

The wall divides the room into two sides:

```text
       You
        ●
        │
        │
────────┼────────
       WALL
────────┼────────
        │
        │
       ●
```

You can ask:

> **"Which side of the wall am I on?"**

Mathematically, we answer this using:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

The sign tells us which side.

```text
Positive → one side
Zero     → exactly on wall
Negative → other side
```

This is the simplest way to understand half-space.

---

# 1.9 Why Does the Sign Change Across the Plane?

This is the deeper question.

Suppose we start from one point:

```text
        ●
```

and gradually move toward the plane.

The value:

```math
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

changes continuously.

Eventually we reach the plane:

```math
f(\overrightarrow{x})=0
```

If we continue through the plane, we enter the other region.

The sign changes:

```text
Positive
   ↓
   ↓
Zero
   ↓
   ↓
Negative
```

So the plane is precisely the place where the expression changes from one sign to the other.

---

# 1.10 Connection With Our Previous Distance Topic

This is a very important connection.

Previously we had:

```math
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

Notice that we took the **absolute value**.

Why?

Because ordinary distance cannot be negative.

But now we're studying **half-space**.

We don't want to throw away the sign.

Instead, we care about:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

without absolute value.

Because:

```text
Magnitude
   ↓
How far?

Sign
   ↓
Which side?
```

This is a very important conceptual upgrade.

---

# 1.11 Distance vs Half-Space

Let's put them side by side.

### Distance

```math
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

We use:

```text
absolute value
```

because we only care about **how far**.

---

### Half-space

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

We care about:

```text
positive
or
negative
```

because we want to know **which side**.

This distinction will become extremely important in Machine Learning.

---

# 1.12 A Simple 2D Example

Consider:

```math
\boxed{
x+y-4=0
}
```

This is a line.

We can write:

```math
f(x,y)=x+y-4
```

Now test different points.

---

### Point A

```math
A=(5,2)
```

Calculate:

```math
f(A)=5+2-4
```

```math
f(A)=3
```

Therefore:

```math
\boxed{
f(A)>0
}
```

Point A is on the **positive side**.

---

### Point B

```math
B=(1,1)
```

Calculate:

```math
f(B)=1+1-4
```

```math
f(B)=-2
```

Therefore:

```math
\boxed{
f(B)<0
}
```

Point B is on the **negative side**.

---

### Point C

Take:

```math
C=(2,2)
```

Then:

```math
f(C)=2+2-4
```

```math
f(C)=0
```

Therefore:

```math
\boxed{
f(C)=0
}
```

Point C lies exactly on the line.

---

# 1.13 Visualising the Example

The line is:

```math
x+y-4=0
```

or:

```math
y=-x+4
```

Conceptually:

```text
              y
              ↑
       Positive side
              │
          ●   │
            \ │
             \│
───────────────●────────────→ x
               \
                \
          Negative side
```

The line separates the two regions.

The exact boundary corresponds to:

```math
x+y-4=0
```

---

# 1.14 Now the ML Connection Becomes Very Natural

This is where Half Space becomes extremely important.

A binary classification model can create a boundary:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

The boundary divides feature space into two half-spaces.

For example:

```text
                 Class A
              ●       ●

────────────────────────────────
       Decision Boundary
────────────────────────────────

        ●       ●
                 Class B
```

The model can classify using the sign:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0>0
```

versus:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0<0
```

So:

```text
Positive side → Class A

Negative side → Class B
```

This is the geometric foundation of a **linear classifier**.

---

# 1.15 This Is a Major Conceptual Milestone

Previously, we were learning:

> **Where is the boundary?**

Now we can say:

> **The boundary divides the feature space into two half-spaces.**

And then:

> **A data point's position relative to the boundary can be determined by the sign of the linear expression.**

So our journey becomes:

```text
Plane
 ↓
Boundary
 ↓
Two half-spaces
 ↓
Point lies in one of them
 ↓
Sign tells us which one
 ↓
Classification
```

This is exactly why this topic comes immediately after point-to-plane distance.

---

# 1.16 But Don't Confuse "Positive" With "Good"

This is a common source of confusion.

If:

```math
f(\overrightarrow{x})>0
```

it does **not inherently mean**:

> "The point is good."

It simply means:

> **The point is on the side toward which our chosen normal vector $\overrightarrow{w}$ points.**

Similarly:

```math
f(\overrightarrow{x})<0
```

means the point is on the opposite side.

Which side we call:

```text
Class 1
```

or:

```text
Class 0
```

is a modelling choice.

---

# 1.17 Why Does $\overrightarrow{w}$ Decide the Meaning of the Sign?

Remember:

```math
\overrightarrow{w}\perp\text{plane}
```

The normal vector points toward one side of the plane.

Conceptually:

```text
                    w
                    ↑
                    │
                    │
                    │
────────────────────┼────────────────
                  Plane
                    │
                    │
                    ↓
```

The positive side is associated with the direction of $\overrightarrow{w}$.

The opposite side corresponds to $-\overrightarrow{w}$.

This will become much clearer when we examine the geometry of the signed value in the next parts.

---

# 1.18 An Important Observation About Flipping the Equation

Consider:

```math
\boxed{
3x+4y-12=0
}
```

Now multiply the whole equation by $-1$:

```math
\boxed{
-3x-4y+12=0
}
```

It's the **same line**.

But:

```math
\overrightarrow{w}
=
\begin{bmatrix}
3\\
4
\end{bmatrix}
```

became:

```math
\overrightarrow{w}'
=
\begin{bmatrix}
-3\\
-4
\end{bmatrix}
```

The normal vector points in the opposite direction.

Therefore, the signs of:

```math
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

also flip.

So:

```text
Positive ↔ Negative
```

But the actual geometric boundary has not changed.

This teaches us something important:

> **The labels "positive side" and "negative side" depend on the chosen orientation of the normal vector.**

The two physical half-spaces remain the same.

---

# 1.19 Connection to Our Origin Discussion

We just learned:

```math
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
```

For the origin:

```math
\overrightarrow{x}=\overrightarrow{0}
```

so:

```math
f(\overrightarrow{0})=w_0
```

Therefore:

```text
w₀ > 0
   ↓
origin lies on positive side

w₀ = 0
   ↓
origin lies on boundary

w₀ < 0
   ↓
origin lies on negative side
```

This is a beautiful connection between our previous topic and Half Space.

We already learned how far the origin is from the plane.

Now we also know **which side of the plane the origin is on**.

---

# 🎯 Ultimate Goal — ML Lens

Let's make the ML interpretation extremely simple.

Imagine:

```text
          Class A
       ●       ●

────────────────────────
    Decision Boundary
────────────────────────

       ●       ●
          Class B
```

The model asks two questions.

### Question 1

> **Which side is this data point on?**

Use:

```math
\boxed{
\operatorname{sign}
\left(
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
\right)
}
```

### Question 2

> **How far is it from the boundary?**

Use:

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

So we now have:

```text
Sign
 ↓
Which side?

Distance
 ↓
How far?
```

This is the fundamental geometric picture behind linear classification.

---

# 🧠 Permanent Ultimate Goal

From now on, whenever we study a mathematical concept, keep asking:

> **"What does this ultimately help my ML model do?"**

For **Half Space**, the answer is:

> **It gives us a mathematical way to divide feature space into two regions and determine which region a data point belongs to.**

In simple words:

> **The plane is the wall. The two half-spaces are the two sides of the wall. The sign of $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ tells us which side the data point is standing on.**

---

# 🔑 Part 1 Takeaways

### 1. A plane divides space into two regions.

These regions are called **half-spaces**.

### 2. The plane itself is the boundary.

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

### 3. For any point:

```math
\boxed{
f(\overrightarrow{x})
=
\overrightarrow{w}^{T}\overrightarrow{x}+w_0
}
```

there are three possibilities:

```text
f(x) > 0 → one half-space

f(x) = 0 → on the plane

f(x) < 0 → other half-space
```

### 4. Distance and half-space use the same expression differently.

```text
Absolute value
     ↓
distance → "How far?"

Sign
     ↓
half-space → "Which side?"
```

### 5. In ML:

```math
\boxed{
\overrightarrow{w}^{T}\overrightarrow{x}+w_0=0
}
```

is a linear decision boundary.

The two half-spaces correspond to the two sides of the classifier.

---

## One-Line Understanding

> **A plane is a boundary that divides feature space into two half-spaces; the sign of $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ tells us which side a point lies on, while its normalized magnitude tells us how far the point is from the boundary.**

### Next: **Part 2 — How Does the Equation Identify the Two Half-Spaces?**

We will take the expression $\overrightarrow{w}^{T}\overrightarrow{x}+w_0$ and understand **why positive values consistently occur on one side and negative values on the other**, using both a simple 2D example and the normal-vector geometry.

